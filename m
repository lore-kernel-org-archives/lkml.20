Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A3891CD2C
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 21:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788556663; cv=none; b=M0FGwyahToJZRTfkk+dn9TFeeJZ0SGNq4uRXTs/SZjtMt2ba4UsJeDoe+AoT2q11XoOsy9RKeFJNIZ+q68XPKgoaFEX7LhmFEDdU/5h/+NsP3gpmXmGNpY0y9YBqE5VR5MdqtjzQzvSGJPX7Ryw3ouJOpXYkVOPxBbo1+4oqJ/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788556663; c=relaxed/simple;
	bh=oslDozt+vCsSOw9ZT9jQInhRaqqyq1JIJuFOCkXBVEc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=hGO8ttqOnSyfMA1btD2QCI5ZMnlyKgNvrSc1s+BUKE6OsuBRzYFHyruNqotzLncNvSA5S3wPDz9k5t7/hrEtedjnGmW+zpw0Vyermheg9lUtGzxhuNhSXac1+RZiGD+WCRTpbla3NbMJhJGQGtHR1oGb6yb4dqjHLOBFyOzpKWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DAXeduBN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DAXeduBN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F3001F00A3D;
	Fri,  4 Sep 2026 21:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788556661;
	bh=i1sEyFqDIaopEgC7aV8NUispTeYpv8Rgj4dSnhfoB9A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=DAXeduBNZ5t0XX8PnWEklNZyoaZZcQaD+Bcw/8pE9zHlbTyd9B5wErfhojDtlYanv
	 q6KmTWzsTYDjl5YZz7opjR//8ppODX8OMf4KkkVL4wUnM3+arQ+a5RCW40jcW+9kXb
	 jnb+AVTiyaMA6bOUXwcIqoeLb4MsiYPOv+lJWPP0L6Hr7rtbB/hpMq5BG0wqTk43ty
	 vLvhhynt0vvo7gmPYxuVvF5Kmbee3wGEmM8N6/Zq+KPt19pujZMQB5B//XfDrwQliZ
	 n15Qf2xBi+exZ2y8CxWxW8p07PxdzkP5gNgZu8/ntJBwPnGHIpe7H7kStaJAB7KWny
	 Tb5tRm7SRkUkA==
From: Thomas Gleixner <tglx@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>, Ye Liu <ye.liu@linux.dev>
Cc: "Peter Zijlstra (Intel)" <peterz@infradead.org>, Marco Elver
 <elver@google.com>, Ye Liu <liuye@kylinos.cn>, Yi Tao
 <escape@linux.alibaba.com>, Tejun Heo <tj@kernel.org>, Bart Van Assche
 <bvanassche@acm.org>, Christian Brauner <brauner@kernel.org>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/8] mm: introduce for_each_process_rcu and
 for_each_thread_rcu
In-Reply-To: <20260904122536.1079b279@gandalf.local.home>
References: <20260904083001.553587-1-ye.liu@linux.dev>
 <20260904083001.553587-2-ye.liu@linux.dev>
 <20260904122536.1079b279@gandalf.local.home>
Date: Fri, 04 Sep 2026 23:17:38 +0200
Message-ID: <87ecf87m31.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Sep 04 2026 at 12:25, Steven Rostedt wrote:
> On Fri,  4 Sep 2026 16:29:53 +0800
> Ye Liu <ye.liu@linux.dev> wrote:
>> +#define for_each_thread_rcu(p, t) \
>> +	scoped_guard(rcu) \
>> +	__for_each_thread((p)->signal, t)
>> +
>
> I would rename it to: *_rculock()
>
> as there are already *_rcu() list iterators that are used to be done within
> an rcu locked region. Using just *_rcu() would make it confusing to know if
> the rcu lock was taken or if the loop is expected to be locked within RCU.

Ack.

>> +/* Careful: this is a double loop, 'break' won't work as expected. */
>> +#define for_each_process_thread_rcu(p, t) \
>> +	scoped_guard(rcu) \
>> +	for_each_process(p) for_each_thread(p, t)
>
> I would not do this one. It is prone to bugs. As it is a double loop, the
> way to "break" is to do a goto. That will be bug to have a goto jump out of
> a scoped_guard().

No. Scopes can be left by any valid termination mechanism. 

The only problematic case of leaving a scoped_guard() with goto is when
the goto is actually implemented as an ASM goto. See the comment above
arch_unsafe_get_user() in linux/uaccess.h.

But I agree that requiring a goto to break out of the nested loop is
nasty especially when it's not well documented. The copied original
comment is pretty useless.

Thanks,

        tglx







