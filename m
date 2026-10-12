Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7EFA4F30D1
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 21:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791841690; cv=none; b=lKPUdY+TjAmsbJq82LIW3UPARdTMdR0ALdrj+AvUhYWmTZkpQ5EmSmEdKTf4eptox6k+pLhvSzYanzRmuCsi91C9xKyX2dEzFznfO7QYkNBINKeHQVq+u8BVY4KamOgVkP4Z9pBP0qLDVL29S7aoZgiyhz5x4DrE1MoohKqvymc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791841690; c=relaxed/simple;
	bh=PEBG/k1n0Nekc/Fj4VvaYhr5hFLRa7NhzeeUHCU4N7A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S0yMA7aIC2Yda1wEInF+OjCyVy/N36VUG4n8/jBAfiBo4Oj6rVN2wNE0CCPNL2cFympy+9/JP8iFMOdoOnRReI4GC7LdCYAm2NvPUrcNmjmv3h7vo7S/zstUVDdVh7M04S+GVYQtRzjAJFpvKVw81oo45s5gI3lSMpNGU99slv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pXOo5kCg; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pXOo5kCg"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a021c809e3so22616065e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791841683; x=1792446483; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9zq/8m1eSiHTlioZUUeey5q3Q1PxGXgxzAf3i69rhbQ=;
        b=pXOo5kCgGZf/tIVqqAGo3MjAEeE8g2vHRTJEqaHQd+i+kRg6qrp1hI4bs8nvSzdqyd
         nW1/fwr+yLN7mgA/SOQis5wlt6zweHF6B7vvlh6is0tZxAJmBQH5L0huGqMpyh+W/RC2
         FqwCOHGvtJ5J6P/BY1qilRav1FLxIXREhVNOAfUq64MDrI+2k/mLdhnctd8S0mGj24lW
         jXuAC+PPCRVLGgFIVNlqhBUHJ6w+n9KSRKmbRJ9jGvPfxZLrukjgOFnn7yHqnuiFPXgj
         QTK/L8Yyv4iCMH0MASwPpgIuCQtb0KTWNft8mpkXevYcPLatB82oMreDxO4pzMVJZ1zt
         jLQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791841683; x=1792446483;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9zq/8m1eSiHTlioZUUeey5q3Q1PxGXgxzAf3i69rhbQ=;
        b=e36A5cgJgjk8AtT9EReIRxDjS1jO5ZvbOwrUlS89XQ3m9CoMjX2qJrCRFAEscdi3X6
         zlUn33+xVKg4uOnnIZ+eudnoXpIduiFLQXSXiRzZH3BcTqDd+y77bEGQEZ4Q+ezKo0rY
         +VhGuBSehxCIrvRL0BLoOOQebtuTBmYbBefTVmCoFK9wjondeISdHwHvTVjZjkbnTkBZ
         ma6zGxxRuDh2r9Dt6Tx+8B472xJJFYaHtvdTuqdXpiBRdbUTYGDyMbQKOJFloJov3XjI
         7b4A+Dc1CWB2YD15tIAX8n6QrcH4Ev7bcivN+sEYAt4JbIYL/wmbUfPzNXfurppXuKBg
         ml3g==
X-Forwarded-Encrypted: i=1; AKwUvByOBfGRiTsUZA518ftWDOWa73ssoxu9XN8c3tPzX44DCnaPWb5Nxkk0yucZhnLlFkX3dxMk8O96nD/u5WU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIBsaKAt87rzI57qssaK+zB64NFq43yqaeXKk7xkUs2xn3pKG4J
	cIgygSvE2VoSMXUmVgHGt9lKdm0uUZlwFoL4vmSDRm1J6R30pF9aRfz2
X-Gm-Gg: AYBFou2tekG5jkCXrZavVynAl9wG9NAS7EBZJimMgKXuwWpwOYCpMXgkLB6tr249UvG
	bPbZ/q6tJJ65IEEk8XQhBl7+Va5tZ9MBWNWIKpl8CSkOoQSXcZNetFZPrxveoMj5kcDOuIDDr0P
	qQoGWvXHZavJx1eZ9rvOLIXF1O2BCiizjcrbWZYg6jCim/gZY/Abihu7IFaKIBcFx1PVXsfd6ml
	T1KzeVq3VLJq5n4VFXpBTF28XiRa+UiVtL4GoaXO+X+S3R4/KneDW0P66sJbTOu7j9KrJFaR1TI
	bJqD4ijHYPzNb0pHmy0G3zP+Scce2Or+N0ra+y1/E2mCO5cSH1nBMwbwrQ5woICGYmWvRztFGAC
	MRq7gHS0S43CH77wfc3XgVgWPokLgS1E2ioUO9C8awBr1Nxr2/peqmTS4a5PV84jhp/1ji/E1Nq
	r6KwFdC5PIQD915chOTJkiiStUUpah5caOPK5tNjTDgjrtPxyWU+z6Y3cnachBBF8BLmDt82Y/s
	n2zpTSdwZBed+RpA620ICa/kl4W2jdifqdb0VhxO247Q44vEtlCyDb72VcW
X-Received: by 2002:a05:600c:3e0a:b0:4a0:1c10:1372 with SMTP id 5b1f17b1804b1-4a18e4aa206mr223185285e9.27.1791841682545;
        Mon, 12 Oct 2026 14:48:02 -0700 (PDT)
Received: from [192.168.1.122] (cpc159313-cmbg20-2-0-cust161.5-4.cable.virginm.net. [82.0.78.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ac52d3sm1449484f8f.43.2026.10.12.14.48.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 14:48:02 -0700 (PDT)
Message-ID: <aecdab1f-9af6-4a07-938d-753ff9fc9938@gmail.com>
Date: Mon, 12 Oct 2026 22:48:00 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 1/2] sfc: ptp: serialize host and MC synchronization
 transactions
To: Alex Austin <alex.austin@amd.com>, netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch, bhutchings@solarflare.com, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, linux-kernel@vger.kernel.org,
 linux-net-drivers@amd.com, pabeni@redhat.com, richardcochran@gmail.com,
 smhodgson@solarflare.com, alucero@amd.com, pieter.jansen-van-vuuren@amd.com,
 Alejandro Lucero <alucerop@amd.com>
References: <20261009183240.1898762-1-alex.austin@amd.com>
 <20261009183240.1898762-2-alex.austin@amd.com>
Content-Language: en-GB
From: Edward Cree <ecree.xilinx@gmail.com>
In-Reply-To: <20261009183240.1898762-2-alex.austin@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/10/2026 19:32, Alex Austin wrote:
> Protect the DMA handshake and result processing against concurrent
> synchronization callers. Serialize clock adjustments with the same mutex
> so they cannot change the PHC during a capture.
> 
> Fixes: 7c236c43b838 ("sfc: Add support for IEEE-1588 PTP")
> Signed-off-by: Alex Austin <alex.austin@amd.com>
> Reviewed-by: Alejandro Lucero <alucerop@amd.com>
> Reviewed-by: Pieter Jansen van Vuuren <pieter.jansen-van-vuuren@amd.com>
...
>  static int efx_phc_settime(struct ptp_clock_info *ptp,
>  			   const struct timespec64 *e_ts)
>  {
> -	/* Get the current NIC time, efx_phc_gettime.
> -	 * Subtract from the desired time to get the offset
> -	 * call efx_phc_adjtime with the offset
> -	 */

Not immediately clear why this comment is getting disappeared; it appears
 to still be accurate.  Is it just thought superfluous?

-ed
