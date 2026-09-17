Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B77AC2EC0A2
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 02:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789611798; cv=none; b=Hp3P+aqRLDog3qcrHXpz6rnSysquwx+H7pupwMNc/lPtvx8T+012Gv047ZidqUMcVAjlodKd/7tzHT33ZgkdduONJ9TOyYw/4iWpcwxG6WpXkVInVd3Q/CzIOSgKcqJl7c6gaa/3Hp4PSStIvshlx5VEc46cPWAXnu/Rl0b9HwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789611798; c=relaxed/simple;
	bh=etQVfe05TD7Fj3E8k+AYMjhj+hVhiL8HOWBiENTV6OI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=X29Bs270mVvAjw/gRjNpPRRHXiItx8B5dnogh8Qf55+w2QJIrhFzufZOUNTItTKN5Tf52Clymedr5iCTc0E8o29Zgor6j2TlrZyMCqd3DsjofGZZyWJafbEvgQjmuJ677Tl0wqDuiwI4LjwCGfUZddcKdfKLqGaJSxf/NtBIYM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k1KVaGJJ; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k1KVaGJJ"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39da614ab21so57394a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 19:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789611796; x=1790216596; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Nkh0FnuQtTwLU/gLgK8Zr6SvB3rMVV5l8Nx6NE3bkmQ=;
        b=k1KVaGJJSXxmq6X5T38UY6zmEoQG0V1j/OL9U9phsXaz0TY1ccwocJ+Jvwu23Q7pjK
         E7uM+vvdHHxaQEi8g5zvGk8y6hfdXxEo972Gr2/KHcR5GDSb+WcOeBfczMx7gaG0cNNk
         ZFx7NNhxh3HH9URloV2moKLJIkJxfnnWN44IFBCffY2KZO2NPTIHlanKXviRmBlGpqtm
         1WX4KiKXJOfxWs8uEjmRK2r1bwx23oPvHRSFlqjlIFt04z29YT8q7aiJ+5Cu8t3EQxEl
         MCdLC9wQ1u+GJsU5Ceq5xEnOA+NhDSexCZGtsXEBieUAT3W7z0AWQrdeEzQz2nh860JD
         4V/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789611796; x=1790216596;
        h=content-transfer-encoding:content-type:in-reply-to:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nkh0FnuQtTwLU/gLgK8Zr6SvB3rMVV5l8Nx6NE3bkmQ=;
        b=p/sHEp0rF+7YpBG4GMl46S1AXSOTyoIPwI9aCA0vcohyYEQGs+kTQuKY66qCBL40/O
         XvC7b8T2QWge8bbro5eAecVN0WFb5jKaH6UusBAbl6ESnBLMdhCAIt6v3yksaQFYh9mX
         EZ5mj2L2Q4jrq11TcCSQlFiugduO1+UdOrBs8KjUBxkBZJmXV1fp8xXRX8CKlgDjDyGy
         Lnwc6dDH2m7MSnj4qBYQty9Aaa/uyHSfUbAhTjKHMn+Tw+luyU/DOfekdnyMWhjdGMgj
         GvxcOMFOTCfD7jpH0H2ELqqMz1WW/3AwKKRjaPc4aZ4ZrcG9+LUuKW4G7c7lTMX5wUby
         cp6g==
X-Gm-Message-State: AFuF++k5d1MjKDxFD7JIKNTdJ+4l8nS9O5YEraV6qJl5wud4cjeHtXBI
	FqGEBYzV3jYxJTlMi700akatHszKXpQp+TpZHNKC2ELwFtE8lNRPFEmQ
X-Gm-Gg: AYBFou1dPUcJ1AGstxpitD6Sd+Aljlp5dmsVDrGLxNcmoYpiofXEswq5euzGk7Ss/bA
	dgQ5x0O+yN2b1lfG3vl30pFPA67d8AmeWaB8HM8w8VnmraHVBQhEsqypRfS5c1v3US86OMar63y
	nfabKD0VNLmP7fWaI6xBXsEEF4hvIP7aXDgsbUCPYDiSFPF6O5a0uyAHvpQTboJAHasndFs+A1K
	hIdPODYQOHWCw9BiO2ge5SsxNr9LGWA7TWDLbnakLZ+obeYta7VXztyaXCvt6ei+fPsVqqZnKjO
	/kJyLvZi1owpnw0YMcLkKOLYYlhnAOo61ca6CaWE2B6XL21JB9/PjPrMMbxnwtiORypolPOquDu
	f/fvDZsw1IyWsoVVUIrS7y0FjRC56NG3a6m64rXybs52hdsQLlG7RV1LtUU67CO7OLwels6Qo9m
	0gc7Lg+q9jIg0BVX21mBpPbLi6FuL/x5CGSTW1g9m2iG9Db/YBcXE38UMF2gDtN3BTUoF4XV1s1
	TbqEfkNQgfKZeXoPB+2OE/ju27+qgNkqdFfGoRs7Hk=
X-Received: by 2002:a17:90b:5386:b0:39d:febe:7452 with SMTP id 98e67ed59e1d1-39e1e64b9bcmr7917463a91.4.1789611795933;
        Wed, 16 Sep 2026 19:23:15 -0700 (PDT)
Received: from [192.168.0.203] (2607-8700-5500-a805-0000-0000-0000-0002.16clouds.com. [2607:8700:5500:a805::2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14397197dc8sm9065853c88.3.2026.09.16.19.23.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 19:23:15 -0700 (PDT)
Message-ID: <bfce38b4-5475-4af6-acbb-cfb20e9b590a@gmail.com>
Date: Thu, 17 Sep 2026 10:23:00 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] drm/bridge: dw-hdmi-qp: serialize HDMI audio callbacks
 with PHY enable/disable
To: Igor Paunovic <royalnet026@gmail.com>
References: <20260915103433.13163-1-rmxpzlb@gmail.com>
 <20260916161000.11756-1-royalnet026@gmail.com>
Content-Language: en-US
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
From: Frank Zhang <rmxpzlb@gmail.com>
In-Reply-To: <20260916161000.11756-1-royalnet026@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/17/26 00:09, Igor Paunovic wrote:
> Hi Frank,
> 
> I tested v6 on an Orange Pi 5 Plus (RK3588): git am onto a
> drm-misc-next based 7.3.0-rc2 tree with PROVE_LOCKING and
> DEBUG_ATOMIC_SLEEP, HDMI output to a TV.
> 
> The reproducer I used on v5 (output off, then open and close the PCM)
> now stops at the open: dw_hdmi_qp_audio_enable() returned -EOPNOTSUPP
> three times out of three, nothing from ASoC or the bridge was logged,
> and since the startup failed, the shutdown path never reached
> clear_audio_infoframe().
> 
> So I also ran the sequence from your commit message: PCM opened with
> the output on, output turned off by the compositor while the stream
> runs, PCM closed after that. With function_graph on
> dw_hdmi_qp_bridge_clear_audio_infoframe() and
> dw_hdmi_qp_audio_enable(), the clear call after the disable takes and
> drops phy.lock and returns 0 with no regmap access inside it; with the
> output on, as a control, one regmap_update_bits_base() call shows up
> inside it, under the lock.
> 
> There was no external abort, SError, lockdep report or might_sleep
> splat in the whole run, including two output off/on cycles, and once
> the output was back on a new stream played on the TV.
> 
> Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus (RK3588)
> 
> Not covered: I did not try to hit the window the lock is meant to
> close (an atomic disable landing between the state check and a
> register write), so that part rests on the code; and I did not check
> Dmitry's condition from v2 [1] that a PHY off/on cycle clears the
> audio registers.
> 
> v6 overlaps with Detlev's patch [2] (both return -EOPNOTSUPP from the
> audio callbacks while the output is off), and [2] no longer applies on
> top of v6. For the crash, v6 alone now covers both sequences from my
> v5 note (open with the output already off, and the output going away
> under an open PCM), so my remark there that both patches are needed
> does not apply to v6.
> 
> An LLM assistant applied and built the patch, wrote the test scripts,
> counted the traces and helped draft this mail; I ran the tests on the
> board and did the listening myself.
> 
> [1] https://lore.kernel.org/all/urguajogb4zsz4jg3ef32hpyf2awxkywdtlk5ackdi2gjai4l7@vpjaf3sznkto/
> [2] https://lore.kernel.org/all/20260519-fix-hdmi-audio-warnings-v1-1-9608966c993f@collabora.com/
> 
> Igor

Hi Igor,

Thanks for your testing.

Best regards,
Frank

