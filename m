Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3C6472070
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 22:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790807746; cv=none; b=aVmaLK2bzTRtVKIBFLiy4Q+2J7jvFtsyeznTnEgTs0mhe16hRHttjt2icfBx9pj/5+qSgd3tnimbp6BrIhYnzc9TRStOZ1RhCFRhjTplP7K9d4geh032mlzBG8bz8DWek9tz/UtPNmgkrT+fUFo9XkpULSscNkkOkCuKmnky5gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790807746; c=relaxed/simple;
	bh=PPJ7XphEkFX2PI2orleZwG4vWcNUErLobmFaNusq4+g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GigNQwemUu2zQc5qUV9tmJU4nJIkRSA6aY9xMi+QO9yemxtNsCiQbaENBT0boVyrRaR9NoAkvjgjc7Lw9UmONAe1jtagxc35gpMs4P6w+DdmJ662LzShg6P/B/Pq52X4nBUmWAfp4PIZsInQ/VyNO3CbMkr/DgH5XkEMGJ8ba9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=DnpyJFle; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="DnpyJFle"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-4a00713639cso28878125e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 15:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1790807741; x=1791412541; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DFv+6x6IaH2fd0p/1qIAFYVajO1+EzROb2Ys9uN8Cp4=;
        b=DnpyJFleDzkz+oQY2vw9IpOGYWuBmAPht8GIEECjM/jhDtIywIeG7MEM0ztT5gwx2G
         t80zuv0Qmh86ro35dQiFizqACH+hTA5+o2e8dHT/OL2OR3bMQeibprf7xNL3XYFjN0/q
         SBAWlgOTgt7YwFbpX9P227w4s8EQB6eBB/nkbcFRBxvz9VYpowZ/q3HMuOwLO2nJYTpE
         kQ2gX5mYjpeCMuYAbP7UCUt53gLa4qmR1ZRRHjFhst9xpBcN5AaSBqJlFoA5tVHWDu7E
         wBsoI0cOGWQaBZsDFvsWW/lOMPcS0eMJqm4lkRVH/OlceUCoNLBw4x5jhWYUxcgTVn3R
         68tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790807741; x=1791412541;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DFv+6x6IaH2fd0p/1qIAFYVajO1+EzROb2Ys9uN8Cp4=;
        b=UWAn4Fxcw5yRO8nQeWIcGpBo0SU1PJMRXD3OCNgeJiKBVkkLz4D+hVzGmfLxHURIvn
         UJmHqpIA0SYYaCIgQ6j7JiLutkzAkuTnqVWf7Uj/hakhOXXplWzqzJeDDH/o5zMH3TyR
         hu1y7o9JLmszhozNPpb2pLn82A5NDfYlS5PlLd6Qoj92WSiSq8O0l+XWNmqLS/KRINhv
         989P9XMP2m7rpUHWhHgkx1c2hXeeJXn4ujj/R04DtWw+wkkXFJNjSQlSh1knoTabG4G2
         L5KJvuc5xdSW1gKhDaSD1hRxfS3QZUT+HID2pRLgK+AqiRdEmBfYKkF+P+sQnLLpRcS+
         4OcQ==
X-Forwarded-Encrypted: i=1; AKwUvBzEKHWdgNHws9A0509hZijgj9sva1SIaV5o3JdUZ3MUIvaVgPNH5KOqS4q7J5bvv2d1xGzBgZ7Y7ScQ+Cc=@vger.kernel.org
X-Gm-Message-State: AFuF++lg7OTPClpWaOKX0gJQWfgJA8+LjQa+k8eYtDdAecC2WMvYgq/M
	ryDJ76qrTFlpxKyhuGpvfNcul6WMptCK4JpO3c565BKyEeboZeSMkbU=
X-Gm-Gg: AYBFou3cv62NWVsZPjLALQ7dpXU9hfjfqn6XuTQSZ1gFWC4Jtj6mnbdtLAYs+5rTP2s
	PuDQsLvWY95zfoJJxtS2O3gQDVhsgNyW+GUDILEvVoQ4fwVDW2PNwMmgyB1pjvmdgfSYSvQmyFI
	xR120uTQOZJIb2Xncyre+uDFmsXqmYrXZecqjGNQ9KCBZjdlVtpUyvW+VtuvEejRniPNDgPz27M
	i6h2qk0PuYuPy2fy57HUMOWQLlHQ+v4jrqwksYR5VHlw78rVfSvQ1wulBSsCKb4uUX6DA5qiV08
	rIsgLQSEaPtk/qKk1xbkhaU3cLq0KjOygefR9AdYxlkaKTCF3sramidRxaqiBffmLK49BfFCsaM
	AI9mmCcc88iRjzjhEO3X4oLb53+Lnd1We+6mhjHBawasXIrHVhOCFpzdUrIPHoc/iIYZPXHmEPd
	PYe2mfwTqDU3xCVCc5Khkzq4DmgdESUtK6w7rNtjX1iAwDdy4l0xBYdyjOAdU6zzfyHRIjTPmJV
	cLFlMac0vn6Tb6roac4Jz1iOp5nWnMnF+DeFq5GlLDtEs9GrvU=
X-Received: by 2002:a05:600c:a02:b0:4a0:1efa:c748 with SMTP id 5b1f17b1804b1-4a01efad866mr11709295e9.15.1790807741334;
        Wed, 30 Sep 2026 15:35:41 -0700 (PDT)
Received: from [192.168.1.3] (p5b057568.dip0.t-ipconnect.de. [91.5.117.104])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f938f89sm14345795e9.9.2026.09.30.15.35.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 15:35:41 -0700 (PDT)
Message-ID: <8e66c4ee-a0d8-46c2-a59c-58bbba91fd2b@googlemail.com>
Date: Thu, 1 Oct 2026 00:35:40 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH 6.12 000/877] 6.12.112-rc1 review
Content-Language: de-DE
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com
References: <20260930152414.738996857@linuxfoundation.org>
From: Peter Schneider <pschneider1968@googlemail.com>
In-Reply-To: <20260930152414.738996857@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 30.09.2026 um 17:15 schrieb Greg Kroah-Hartman:
> This is the start of the stable review cycle for the 6.12.112 release.
> There are 877 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.

Builds, boots and works on my 2-socket Ivy Bridge Xeon E5-2697v2 server. No dmesg oddities or regressions found.

Tested-by: Peter Schneider <pschneider1968@googlemail.com>


Beste Grüße,
Peter Schneider

-- 
Climb the mountain not to plant your flag, but to embrace the challenge,
enjoy the air and behold the view. Climb it so you can see the world,
not so the world can see you.                    -- David McCullough Jr.

OpenPGP:  0xA3828BD796CCE11A8CADE8866E3A92C92C3FF244
Download: https://www.peters-netzplatz.de/download/pschneider1968_pub.asc
https://keys.mailvelope.com/pks/lookup?op=get&search=pschneider1968@googlemail.com
https://keys.mailvelope.com/pks/lookup?op=get&search=pschneider1968@gmail.com
