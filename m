Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E03F53F12E5
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789461417; cv=none; b=W3SQz/3u7DI6jbimx0dJE7v4IL65gPm3SI4k5Xari/JxIvDh5nj+whYrKTilYNkS3ew7RhusqLi+7uA59IbG+4jsiG0dHuAK0NWpg3QTwlAL9FpXVYIl/VMkevnJONcdLKe1y+o5X6BcQU4aQwgGRl4bAzHrW26Gr7TuEHtPomU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789461417; c=relaxed/simple;
	bh=1GwwRU3Zo4J6UwKHn6nYkcvIExyjr+ekDiJrmIeTrdU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SWOOnVrVGX1534HEnxShk4ayawSxcqvNY7QRibOHK59IyWedUoGpV/h6JfFJJb7N8YLcmGmgjSzLs8cLKZTUMLuGSxkqszHwN1U733Mr7DoIXr0mSBBUH9e1ey+rv9g3F8BTKv2FVTI79tzzrzJS4p6YY8OF+8+cUWmMVHd7UKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GquJ7tym; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GquJ7tym"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e8185e037so940995e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789461414; x=1790066214; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TC/uc30qmm2boi3DEaG155/PwvJQeu+8K6dt6umRpsc=;
        b=GquJ7tymSSyMTEGZ9gYGjxFGWn9FfgAarb20tgg95oom6mTs4wIqHAWnsZqRHnMhfD
         lHiv7wVUkXcVRjB+MXkGlCAj9gCzO4XLYLOiqoDCAj+5Ip7JZMCU8bcLjHMGCWy6GzWD
         jnFD386xK4fZlPAiASUfsz7ag1owBiVMXhzhqpQO+8XqGp6UpdWjBfcHAiENl0lj2Fyn
         TGYSM8XpBlZvlDcsxEg9pTf1QzLoyWgMDd+LWhCOU90sXoh5BXZbyQ3U+0AWVak6DSr+
         t/ecT+9cJ4jlugyM6RZeVejq/3cIKc3hmpu2QL2fQXjTgRkFfcZs5KK1MGO6UdzGYolt
         8uqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789461414; x=1790066214;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TC/uc30qmm2boi3DEaG155/PwvJQeu+8K6dt6umRpsc=;
        b=U3tr/T4CS57xlrya7LQUVnOnNQkIhzt81ky5qJei5bg6FZjSTLHoVlZgQ1t75O0ilC
         zHkneYVIyC3DtC2uJHDvXYWPhcSYj0syO+gy95TaSu6E5ToXB/cpXQd3W/PRg6KyB+x/
         7rovg/E5i9I/hSanJIiZ6kAcGzn7KP13DJJJBU0cUEl3/PaQY10E8JfKIVipg0NIjz8N
         a38smofYbFp8s3XxtM2gb6A8gFFiUTNGeLktMO6EtwX8iKW947raM0sDrFDft7E7mbOU
         Q8TqDoj3l9L9qkVyic1JZRjtrjnQXLFqia4VbtHooWz/dvoOnt4Sm4G1hz48jghSzpGw
         fbOA==
X-Forwarded-Encrypted: i=1; AKwUvBzMLfvQLU8mSRxnWnIsP3GcAVOwphJafWGbwplqHCfhyd6YbaPCAxn7pB8inc0/HWmtYebejKLTo4If/dU=@vger.kernel.org
X-Gm-Message-State: AFuF++mk7uK8ZG33QHfYa7GYm7NnAJZW+5YrElhnng5fIAh970J4J2+8
	rmaOojdaxIbLnQPDhjqOv+vLbzzhNfCN7wvaoaEsTCxQ7EvJgTbn+89krneiog29
X-Gm-Gg: AYBFou10cQ+1LvkS2K23m8RWOgIRomyqWXXgCGJb6bfHosruGlN/nHFQaKD1YgMrQ9K
	m41usSkfiIKo1VmKDtLVORWPLrDr5DJ2V1iNpRPXRma1+YAE97KhwvWBmvT9X7Qz+4PHVPGD/KB
	SGJmOJhyh8QaqtXeaUziM2I0uFbKvWDizvMTleKtE6xLUwEt0QYGicoxxGmTXWpxzVsiNPDe3n8
	5ykkkqPikhBGdCfdkYhQvUgiBh7cQBF/0rkHbAm5Rc16FrZxqquVeIBmo6e9wBbefIaKtFT+AVh
	XmbGdvDMkuj6ODrQybbv3fdDpB5buNvlsrKYK41FOtaDP8N3mKuopbzoCa2hFJQUYXi8dqvHfgh
	QibSOl7LHw9WuS9BxwfN+WeFZo+kPGO0sJVU+4RbVpTh0HhucXuzVIcx9nL/UAhxMIMHP5nQNId
	M6sSH6WhHY+k6kGK+67rxN4Zk4kX7TRZ0RwoYCANbJEyikt8+65H9gOPPQURTVT4nYx6MobHTkw
	h7yaLAjIA0aj+4iqySsdb6Txq+72QYgrrA6
X-Received: by 2002:a05:600c:5486:b0:49c:cee2:1697 with SMTP id 5b1f17b1804b1-49e7a66aaf9mr74130505e9.16.1789461413896;
        Tue, 15 Sep 2026 01:36:53 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7ef7ecfesm48087955e9.9.2026.09.15.01.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:36:52 -0700 (PDT)
Date: Tue, 15 Sep 2026 09:36:51 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Waiman Long <longman@redhat.com>, Ingo Molnar <mingo@redhat.com>, Will
 Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>,
 linux-kernel@vger.kernel.org, Davidlohr Bueso <dave@stgolabs.net>, Haakon
 Bugge <haakon.bugge@oracle.com>, Linus Torvalds
 <torvalds@linux-foundation.org>, Yafang Shao <laoar.shao@gmail.com>, Steven
 Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH] locking/osq_lock: Ensure proper locking semantics for
 osq_lock/osq_unlock()
Message-ID: <20260915093651.13d59166@pumpkin>
In-Reply-To: <20260915051905.GB776954@noisy.programming.kicks-ass.net>
References: <20260910141908.592414-1-longman@redhat.com>
	<20260914112225.GA3500130@noisy.programming.kicks-ass.net>
	<eeb26779-1423-4487-80d9-bcf6d6fbe097@redhat.com>
	<20260915051905.GB776954@noisy.programming.kicks-ass.net>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 15 Sep 2026 07:19:05 +0200
Peter Zijlstra <peterz@infradead.org> wrote:

> On Mon, Sep 14, 2026 at 10:30:12PM -0400, Waiman Long wrote:
> > On 9/14/26 7:22 AM, Peter Zijlstra wrote:  
> 
> > > This doesn't make sense. You cannot argue that the code is correct as is
> > > and still add Fixes.  
> > 
> > That is true. I added this paragraph to show that it is not a serious bug,
> > but I still think it is better to fix it or we have to explicitly say that
> > it is not a real lock in term of how it can be used. I have taken it out to
> > avoid confusion.  
> 
> "It is not a real lock" will do. It has always been meant as a optimistic
> spin queue -- very much not a lock.
> 
> 

I'm not so sure, assuming that is probably short sighted and it will
cause grief sometime in the future.

I did start trying to locate the actual race.
If a read barrier fixes it there must be two reads that get swapped,
so it should be possible to find them.
Unfortunately I don't have a system that is likely to reproduce the error.

David
