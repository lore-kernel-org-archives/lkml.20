Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB26E2AD3F
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 12:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787833459; cv=none; b=YdVwKoVFJFX1Tje693ZoSkeU814bC6Z5xj/V5ezPrufHiPk1VmGDwPitQPpAYbJZyO7qXHsWNymINYzq8CxS2rF1b4FCth6OOtlTnhxKJIYBVi4BeE1CBKP8CHEi3IqVtzDqa7WBxeyz8/bWHKK2k1wxoP6JlX2NUTvgTl9alGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787833459; c=relaxed/simple;
	bh=o75G+1/hgtVGL/qEWSHTdWoO/2SmV6e9bLp7kKM7Wy0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=OkCt1hvmfWJTAtZ9X2wnKDYVoiKTQEFhPAd1BtMajnZz9oZ3S4clJQ5FD1Hef0QvhISU5ukS1v9gQsy29NjQbPh4xzOaXDsBspWev2/DJZ7S2CrP4imQS8/dWjdQT7n/fFx2KEJryoE3QMIoeHx5o2q7Bby5wJiSgL7l8mOaKzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XEcHf1Aj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XEcHf1Aj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB4421F000E9;
	Thu, 27 Aug 2026 12:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787833456;
	bh=7Q1oZ0TkvMzGLf8uu4+USXNHqgvQ2VnfXdLPXwXiyZw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=XEcHf1AjYU8pYLl2mfYnjEVo3Gz4nrhlBEyKQmIZDH0sQzZ/WreAPi83Ik0aGiRwL
	 PHf7REcoLiklL/c6L+5kU6QJMRsZ5UfNvphpE28XDZp1jPnIg4cLkv7jORI6ucODul
	 uhrFb6clSNKNGnGQp57hx9A45z8T//1n8ZHlWoLoGTNT9/TiQ4FVdYl3icSaI7fDXQ
	 CW7cow5AztlJ+gq7VQ6NM2IpZQuoMb1jZ2D/me4ifIDE5h3S/67+8xz/FAEZR/ylqb
	 c+gz5aX62InsPadw+kXYt6fY6keFw1mk4AqzmFOcWr6ZGxq0EVHa6zuzy5NA8Yyv9d
	 7ypQDWj5WBM9Q==
From: Thomas Gleixner <tglx@kernel.org>
To: Oleg Nesterov <oleg@redhat.com>
Cc: Frederic Weisbecker <frederic@kernel.org>, Hyunwoo Kim
 <imv4bel@gmail.com>, brauner@kernel.org, peterz@infradead.org,
 anna-maria@linutronix.de, ebiederm@xmission.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] signal: Use list_del_init_careful() in flush_sigqueue()
In-Reply-To: <ao8_NUo0ACPAA4QB@redhat.com>
References: <875x10hrkt.ffs@fw13> <8733w3j1i1.ffs@fw13>
 <aowkvvxg8cPP5V0X@redhat.com> <aoww8qi_ce_8ECA9@redhat.com>
 <aoxOVAd8ooqHFW12@localhost.localdomain> <87pkz6gms6.ffs@fw13>
 <ao3kt-eRxw4agOj7@redhat.com> <87fr02gegn.ffs@fw13>
 <ao6zmDB9EjsqPIVN@redhat.com> <87zey8g05g.ffs@fw13>
 <ao8_NUo0ACPAA4QB@redhat.com>
Date: Thu, 27 Aug 2026 14:24:13 +0200
Message-ID: <87pkz3g39u.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Aug 26 2026 at 21:32, Oleg Nesterov wrote:
> On 08/26, Thomas Gleixner wrote:
>>
>> On Wed, Aug 26 2026 at 11:36, Oleg Nesterov wrote:
>> >
>> > So. With this change release_task()->flush_sigqueue(&old_leader->pending)
>> > can still race with posixtimer_send_sigqueue(), but it will do nothing.
>> >
>> > But it also does "nothing" if tmr->sigq is already pending (!list_empty)
>> > so I am starting to think about the change below again...
>>
>> Sure, but that's an orthogonal optimization once we fixed the exec()
>> mess :)
>
> I am almost sure I missed something again. But I thought that this "optimization"
> can also fix the exec() mess we discuss in this thread?

It does not because the sigqueue stays linked in old_leader::pending and
any concurrent or later access to it from an expiry (see Hyunwoo's
explanation) will access freed memory: either old_leader::pending or
other unrelated sigqueue entries which have been freed.

I really don't understand why you are so obsessed about "fixing" it with
a dirty hack instead of just making it comprehensible, safe and future
proof in the first place.

I'm actually tempted to move the posix timer cleanup _before_
de_thread() and just make sure that no new timers can be created anymore.

Thanks,

        tglx
