Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE06C422E3E;
	Fri,  9 Oct 2026 06:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791526033; cv=none; b=NPk0iDEjd08zuv1YXxYBQI8THVk6AUkEFt/PhTKjkOvs5vMw+vwk1RqrQJt6UFnWrRa9tyAMibw4L5+Rvlm66x+LBns8tu7wxysU4+J2TZqouad9EI96ja2GEVY2lDZ1XS0s1mMiJrneVlMI87MBxOq4O3o9U4cRyNSU840worM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791526033; c=relaxed/simple;
	bh=Xnu0UYBQEXwD/Oh5y8GHkYiKaHr8v0r1LDD8ryNfx5I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A5xRrLF0TN7iLGIqTapOS5+EyXpjN90LqT7LS6/Thp1bK2ABZlLf/yvjZWr8fphnfYwY9pxWGS5Ytawz38Q+ZHEJ3N6bSdARiF4tT1eSQQJr+0hqzyuDhz15ETRPuLkNBxBQSZkZh56XTd1oEfYRMRgo+nWDF230PJg71EbzXD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oe9BXj67; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oe9BXj67"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 490F11F000FF;
	Fri,  9 Oct 2026 06:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791526031;
	bh=xYhYqiOrJa+H4/0FutKq5oFakXHs/Nv/Zsq0AwqkSs8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oe9BXj676TaW+2tMGohe1B68TlLkoHsYl7kb35ws3XDFUNQoHSnlsxX7lonl0cO2y
	 TGPCkPLw5G0LTwBaqIW3SZ9UdJES3Pe15ikExZdemUVavngxz7r8UEZWfNiLeVAkV2
	 hieZwyDYoLZbsK8OBuFmekIPmRmy8G1uCxef2Q+m9H1LiXz4YbPc52bKIJIzIohDkx
	 3OLzbVDEcVLf3hdKKErqvxryFD+Ap+WPEZN52SNcnhmSE/6iD9RE2SyrugSfjZhowS
	 nPTHkDKloiKEKAhtiPEImAlhE1TDUTkNCHZzUGl+7bhHyhjw0p8cRaVi7Zhqdt9qXW
	 sjXyW/8LluJrQ==
Date: Fri, 9 Oct 2026 08:07:08 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Haotian Zhang <vulab@iscas.ac.cn>
Cc: Thomas Gleixner <tglx@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, Daniel Lezcano <daniel.lezcano@kernel.org>
Subject: Re: [PATCH] clocksource/drivers/qcom: Fix error propagation in
 msm_timer_init()
Message-ID: <20261009-prehistoric-armadillo-of-will-ec6c79@quoll>
References: <20261009052536.3139407-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261009052536.3139407-1-vulab@iscas.ac.cn>


On Fri, 09 Oct 2026 13:25:36 +0800, Haotian Zhang wrote:
> msm_timer_init() reuses the res variable for the clocksource_register_hz()
> return value in its common exit path. When request_percpu_irq() or
> cpuhp_setup_state() fails, res holds a negative error code, but it is
> unconditionally overwritten by clocksource_register_hz() before the
> function returns. As a successful clocksource registration returns 0, the
> failure is reported as success: the percpu IRQ is not registered (or the
> hotplug state is not installed) and yet msm_dt_timer_init() believes the
> timer is usable. The same happens when alloc_percpu() fails, which also
> leaves msm_evt NULL for the hotplug callbacks to dereference.
> 
> Return -ENOMEM when alloc_percpu() fails and bail out through a dedicated
> error path that frees msm_evt and returns the original error code instead
> of falling through to the clocksource registration.
> 
> Fixes: ab51189ca485 ("clocksource/drivers/qcom: Convert init function to return error")
> Assisted-by: DeepSeek-V4.1-Flash
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
> ---
>  drivers/clocksource/timer-qcom.c | 34 +++++++++++++++++++-------------
>  1 file changed, 20 insertions(+), 14 deletions(-)
> 



Multiple things here:
1. Your team ignored completely previous feedback.

2. You use multiple identities with this email, thus I actually doubt we speak
   with actual person.

3. Finally, same feedback:
You sent multiple independent patches, to multiple independent
subsystems. The amount of these patches clearly suggest this was
AI generated and most likely not tested.

More importantly, you sent all this work without properly organizing
relevant patches into patchsets. This makes reviewing difficult
and might cause multiple reviewers to address the same issue.
Replying to the entire set is impossible and requires handling each
patch independently, instead of applying or discarding the set.
Maintainers also won't see the bigger picture of your work. Quite
worrying.

This is on the verge of hostile patch: bomb us with so many
contributions, we won't be able to handle them in efficient manner,
like responding ONCE to ask you to slow down.  Considering all this
is untested and LLM generated, I have even more doubts whether this
should be considered for review.

Please read kernel documentation BEFORE posting more work. It will
explain you how to identify subsystems, how to organize your work per
subsystem (so a patchset grouping multiple patches with a short cover
letter), how to document usage of LLM and how what you should not do
if this was posted in a good faith.

Best regards,
Krzysztof




