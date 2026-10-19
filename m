Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792450608;
	b=nLlLfBNjihrElcqjRWmROY0kdwAZ2kIXW/z1h+/8hhzd5C4gIENJqlo84P7+13MRI9j+
	 1UWjWQcoa4YNHdlQp6B+Cq/547OfFU0vBalZdLqNeMw9uUrrSsm7tdF6PQyN6v7uqgmrB
	 jl0/q2G00bunZP0mdOuYfwu5mRpD00ln0xlNgvMn7WkKMGjxnoQqTrlG1uo7b5BD1onPe
	 q9mcS4BPfkLDWfxqjhPJrHc4vCiMj3DiQdQIuKz0TztGQi/ss/GWtKIJatwmdo1JyTPKI
	 6LiCjChDE9tKIdZQ54/PuTO1JQOxBqho5ITBMQibBrZebdkOINAcv19tKRyWbqMx0qQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792450608;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=REE29c8UBh0TXGI809b1Z+iw+yDqToJ7DYkOaz/LGnU=;
	b=hEJf72dfd9Rd7r8Bo3QcnTsqD4oNAPBFtwqxwRfKECUY+xyUhNi6jtjvI8vyuL66HBZY
	 lQa2l0XRl05pxGv/bJwW6mFPfT5OcgjNYPz56QFOvykQlf8kb6+WozyouJkUrWAj8K/gx
	 uGlOjk8/vpuT8AIQXunZ8UjIqm6vXbX/2Tb0oeLbli3N5nyH+5AJvPnmPUAVdCBc+daGL
	 lTwnsn9jl/M99K3m1sWdjhzOEANVqj4Z2wuy5KvseeSMnFUrIyzy4tLsrzrBC9Y8xy6LY
	 wONca2HioQ7LFerK69/iNI/ZUzuPaG6G0ONdTLGter0tFXQYhczvsowGl31Q6TGAUng==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nagashi.ma;
	spf=pass smtp.mailfrom=nagashi.ma;
	dkim=pass header.d=nagashi.ma header.i=@nagashi.ma header.a=rsa-sha256 header.s=ggle-ngsma header.b="T0+gM/qj";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59348606A319
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 22:56:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59348606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nagashi.ma
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nagashi.ma
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nagashi.ma header.i=@nagashi.ma header.a=rsa-sha256 header.s=ggle-ngsma header.b=T0+gM/qj
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b167ffd132so4572485a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 15:56:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792450603; cv=none;
        d=google.com; s=arc-20260327;
        b=QD+PEkIGbFa42tHAFLuyIVBLNby/aj3YqFNUVaSlTEyFeVCdwnqwQvp/Gh3lnm4+tH
         9GI6N8iz7fP246ZAvVQynSJ4pkL/LBKwQ2YCHWNxHz4NU83bv9PYBcZX6etN02af1EJ6
         XPSOXswL1dkE3kE68j7t5k/88oLIdWmLs9J0lDRM0yiTJiyiYkOw5Rnjo8j3lCck6CkK
         jSFW6iziCNopNpPbkPWR2sGHK5SjhCdeAfJI+n2dt3GCS/mW5FYUBAHewEWzNDYTFrok
         bO+UJRvbhW5o/e/5oz6KDasYAvhvxF+N5++M7ySyXc6eubaeU3EbIuKK1ZFfKxOQjJge
         MpcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=REE29c8UBh0TXGI809b1Z+iw+yDqToJ7DYkOaz/LGnU=;
        fh=nSrX4GYN6x6oZTOuxI/9gECJnzWCb6yvaRwtIMJKWDU=;
        b=nMe0kqrGAAj/ITl5+EMllYQ73ap5nUyb6ZXD6OaFZwO6VC9PRcrJFqd9FWhdVTpbm8
         /0RDpemzCax4Yh5u1Lek97L9tPv25NLaVhundfwkBvFgCUYm9naQkLD8EN/U6CMS/TnO
         rDHQ0ci9rZI50yaDwu1FCjdFmvL0s/mUbTa+JJpOVm9KueW9/4+oQ9FpJysNPaXhV02x
         18Gdmiw3tZfPEy/hWHosA+kn5Ydfrp6n2jUv1lMS5ZXLON2JzcDhf/SoXIq5QS5dsgvm
         CDKlKnyu/+dzF0oSFhAD8Ha4cyQKil4Z6kzcPMDwGNPjmrLhA4l9ZQJGoL5FLjlzck2O
         8vdA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nagashi.ma; s=ggle-ngsma; t=1792450603; x=1793055403; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=REE29c8UBh0TXGI809b1Z+iw+yDqToJ7DYkOaz/LGnU=;
        b=T0+gM/qjDUiAlf4RfS1uvHJ4FW3iczcqsrxH8413ojHDK4te28GuYt4iUeiZU6L5Z6
         V1avUKmpKcSbEznIyWT1rWGENWkYKaBV2RGtkZ7bQbIIO3PHpqr/bSsZ5FobebOWJpi4
         UFbDv1wSM+okH5q4N02N/CfZUavVxj3yFr/tWFhK8iyVCPUJSmZqE2tG2t5I12a1+Vij
         bkhu0l2iahpi/JY74t23gxv8MJsc3L6HrfsztHDaCEoHazACGR0F17q/zdgPKpegmqJ4
         X6jKUW8zNMaMzN7St9DKjXm7FPjG2gUVFDsTMMU8dyOpWS1ZwENjpxvKT+a+SJQrhd0z
         RzTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792450603; x=1793055403;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=REE29c8UBh0TXGI809b1Z+iw+yDqToJ7DYkOaz/LGnU=;
        b=BcVHH5VnkzflchLaBXyLHbNWJdSWLdCou1mCkUwiW2QWmvf9J3umxu3y5vILLRynH8
         NA91bRGw3o38Kckl78WiJ3Sju2ND1mfjvCHXi1svPlI2iKl3Avw8BLQ7nk93xXkFpDsn
         /TLXLk5WfZSwcWENXgwK+YjL0aHZtl9AIrWDeiN0l5tCXxGnTT5SMdTHiFwtLDAbRPnC
         VU8XObGcMzauxHzbqJRCkgvZn6ZKfT7UFHzOZ7fntIY2oa20p+dKcljaosXAgUi76ioQ
         77q0YZEQ3bAbYb2Ig0/uLG49oGRyXbP+ILEYHkKgkpDbbD4M4V7r8zKDdoanT9X4dvf0
         DYJQ==
X-Forwarded-Encrypted: i=1; AKwUvBzJtFjlLOc2jJtWO5vbJ91T8I6s1kpe17Ux3ZwloC/YPpw0AkK+cbULF18XeG6nOHeC0keEJKjXfEIKR5w=@vger.kernel.org
X-Gm-Message-State: AFq9FYKX8rzE0TeUNG5dsA4lGsCg9pqLfxG0NA7V3LcdoTMSeaIS410U
	DB/n2VTeU4NZM0FQkXdk4l3Dz/hTDfMd9cBR2N1k5g8s/2jkr4ZE9mW2iPQyWAghaF3EBSS9CwP
	H3sjF3g99UMc9mxmDbNbUK3tPjJ791fDFnx6jW+II
X-Gm-Gg: AYBFou2ToSMnaXEv/tOQOHgmxqLEXSHHxgBsjXdp29Gf8O1Ux2Z6GXSycWORG9dxSlr
	BoKb337x3dpJpyzc2GBIkjvAv2MCm3TyvphUqhz6u5B4o4eoUldgDUeuLAfbkOhD3PiSON7zwiR
	axVUTEZVxq2pSZHLT/co5AkvQ1d0yCez/pNAfiLs7PLg7S8yRWJA+TOcoUDxY5lakQfaoZEFxia
	/dB1tMZtb3fkhX5eb+Qky9s2TMqaT02Hvb7clfUFQPtfobgdS2PLsWRaujdaUVcDFhBwIv+lPBz
	k98DLehdkM4paiPwwUF/BLgXFHCOLrWW/4yBUdOtQAdBtYrLMNblpF2KyDSN89bo/QT5lo9XQiR
	Bo/e2wBXXbw==
X-Received: by 2002:a05:6402:4403:b0:6b1:e361:5550 with SMTP id
 4fb4d7f45d1cf-6b3a81657c1mr5897174a12.17.1792450603223; Mon, 19 Oct 2026
 15:56:43 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261016-ath10k-series-v1-send-v1-0-c847697b3558@nagashi.ma>
 <20261016-ath10k-series-v1-send-v1-3-c847697b3558@nagashi.ma> <61207966-c403-441d-9019-583702833a7f@gmail.com>
In-Reply-To: <61207966-c403-441d-9019-583702833a7f@gmail.com>
From: "Nagashima, Shunsuke" <shunsuke@nagashi.ma>
Date: Tue, 20 Oct 2026 07:56:16 +0900
X-Gm-Features: AclHuK9QItXkR2B2Q98NX99AOaM5Tsth9CYzCO-Xtn0rwNKADE_0wzaV0-bDX4g
Message-ID: <CACB3TCKJN8ou4qa8BKJZYGgv1RRH0awt-eu07YRDwPkppuLQJg@mail.gmail.com>
Subject: Re: [PATCH ath-next 3/3] wifi: ath10k: bring down a station vdev that
 never came up
To: James Prestwood <prestwoj@gmail.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org, 
	ath10k@lists.infradead.org, linux-kernel@vger.kernel.org, 
	David Heidelberg <david@ixit.cz>, Fabricio Akio <fabricioakio@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi James,

Sorry, I am resending this as plain text. My first reply went out as
HTML by mistake, so it did not reach the lists. James, you may get it
twice. Sorry for the noise.

On 10/19/26 6:12 AM, James Prestwood wrote:
> This seems similar to an issue we see on the QCA6174's. I don't see a 20
> second delay, but sometimes after an auth/assoc timeout we get a spam of
> failed connections with NL80211_TIMEOUT_UNSPECIFIED. I've mentioned this
> quite some time ago [1]. Do you think it has any relation to whats being
> fixed here?

Thanks for the pointer. I read both of your mails in that thread. I
can't say for sure, but I don't think it is the same problem. I only
have WCN3990 here, so this comes from comparing logs, not from a test
on QCA6174.

Why I think it is different:

- In our case the failed attempt gets to the Auth stage. mac80211
 hands the Auth frames to the driver ("send auth to ... (try 1/3)" in
 the kernel log), the firmware completes them with status "discard",
 and the attempt ends with "authentication with ... timed out". In
 your trace, the attempts that fail with NL80211_TIMEOUT_UNSPECIFIED
 never get that far: each one is a short scan by cfg80211 that finds
 nothing from the target BSS, and the first rdev_auth in the trace
 comes only after a scan that did find its BSS. That matches what you
 found in March, that the BSS was missing from the kernel's BSS list.

- During our hold, probe requests still go out on the air. Only the
 Auth frames on that vdev are held.

- Our hold always ran for about 20 s, and only on two newer WCN3990
 firmware builds (c10-00459 and c10-00236). An older build,
 WLAN.HL.2.0-01387, did not show it.

- The missing VDEV_DOWN goes back to commit 077efc8c42e8 (v3.19), so
 5.15 has the same path. If your problem started between 5.15 and
 6.2 on the same firmware, this path alone would not explain that.

- You also see it on ath11k, and this patch only changes ath10k.

There is one overlap: your first case starts with an association
timeout, which is one of the failures after which ath10k stops the
station vdev without a down. If you want to rule it out, the patch is
small. With it, a failed attempt gets a VDEV_DOWN after the VDEV_STOP
(ATH10K_DBG_MAC prints "mac vdev N down (never up)"). If the
NL80211_TIMEOUT_UNSPECIFIED runs still happen on QCA6174 with the
patch, it is something else.

On ath11k, only as a pointer: I have not tested anything there and
have no ath11k hardware, so this is from reading the code (ath-next)
only. ath11k looks the same. A station vdev is stopped with
WMI_VDEV_STOP in ath11k_mac_op_unassign_vif_chanctx(), or in
ath11k_mac_stop_vdev_early() at station removal on chips with
vdev_start_delay, and the only VDEV_DOWN for a station vdev is in
ath11k_bss_disassoc(). So a station vdev that never came up would be
stopped without a down there too. I don't know whether ath11k firmware
cares about that.

I worked through this together with Claude (AI). English is hard for
me, so the English was written with AI help. The WCN3990 results come
from my own device tests on my comma four.

Thanks,
Shunsuke
