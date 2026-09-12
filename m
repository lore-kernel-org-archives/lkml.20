Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 422EB351C10
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 17:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789234393; cv=none; b=LlGS3PIZvc/5wa8AscwLYOKi+tWtn417mj8kjMSRdn4Sx77TI6GsHWsH9BmZyfBgxn7SLGbe89lCpJLN5+XemHCERq+y1I09UNHEyCJik8OzF9gizrIvJ3SaTu6noesMdzbFx8YOFrklcPEI66RVEjMJBWP3SLFSbzouxoY6sa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789234393; c=relaxed/simple;
	bh=EiAEJfMZTtWgNFlG1Kn6MkmrA0T0OKXP3d4n4uNbVVc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CnuZrPd1JHKEKyq4lNR+oLGu9c4Uzb/G+ScTIDIC07TaCtsGsU6zjK8yd7OIr35vGt1xXlCBJWdBF3CwTAGof1qlEU4e0O9wfH+fdMmcO66Y2AWT0A+r5Q/bu4wusfASre2vjs40c+J9e7cxlf7Z4yUQ5yLZ1yRjuS0q2XW/qp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=JYuM/GRo; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="JYuM/GRo"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b94fce6e8so6263515e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 10:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1789234390; x=1789839190; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=B870ygeANjcpypjK7/JSP1iclhPyzN0EU3DaKZEWjNI=;
        b=JYuM/GRoz7HvgqOVtOPfN3+u0H8R8CXaGZ4PGwzCQWymRtVbXsJL8YQ4t9LZE9EoHi
         Xs1PiApx2cTlL3Y0+CqdAz07uyVBeeyTveDhwUyqKgsEPwV8ItWP1Ezqpxdu8Zntfbv1
         2XNQtHmgjNB6alQjdzT5f6Awy7u7SMzdIsWIfAjv142HGp7dC+cvshy9oee+ERnMlsB9
         MyJ368q92BTwDlUEM9xLCYvcJIUKQ8++DGZ6Zn8shiV7yU7W7okP8qskn9QYTN8wTvKp
         w2Ir7fpBA964QO5a2o47xoU7xeoi06Uth3eVSwaXe8z0r/gbi2GQjyPPYCpKgmgzkd3U
         0Dxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789234390; x=1789839190;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B870ygeANjcpypjK7/JSP1iclhPyzN0EU3DaKZEWjNI=;
        b=kGsbJK/KaPzLAZFGNoAnhbdLvA/y8HLnGhgOoA74uuj3XS1ZxJLARfQaT9kX5szZfJ
         NzuBgZS+HOF0YP0/LXbhRUz/H8MU2Gn273D+blGOoKvk3mNTaVSpHCcJpAzCfoniMv5B
         iUmfR9wEDBCuA9vpwPxodSvqT29tLS3gpT84M0ANkkGmwJrsG9krbOBWudu/dXdqOEDL
         633Q7fcN6a5rb43O25vmUDiwqegYwnv5exdIsDWdRloDLw4UkpqmkeYWuy8b7MnyY44h
         OUpq3YtCMgMjqZuaNT1fjDZfcdMxriV5YO4hl2lbje6CloFK+tbBvqA4RftnxY/RVWCN
         nmYA==
X-Forwarded-Encrypted: i=1; AKwUvBzG76pyYpv6sOeMEREVb/jc9QUbJR8QJHg+G+lGNbgW6FJ8X3hISJPN+ds/gQS64VcFnp7q4cq4nZMmvuo=@vger.kernel.org
X-Gm-Message-State: AFuF++k5XQfByfxwwjdqZUAqdzIoxJ0tUwbsyllYFXH1G2MyH+VU95SS
	7FlPeqhvEQIEMjpu08GYUKF9ijgAdiCgg6Vxlej71bfzQghm/PB+amM=
X-Gm-Gg: AYBFou3Hft1W5QyITBfWcCY3ZaFmSrPP+xn6a5KZqVyGDWoTcrKRNxp32HuRaTH5I90
	XEMfOp32ydyJbSC0eIMISIBbh/x2PkYRwxWwaQY5zmioGy/dgwE3WL2UaTdYzUjQ79DDXdO2i/Z
	Irybn4G6RZUUkIOW/4P//roME5E7i0PMBVEVIaQcDmTUWn7h2HyuP2paNWidMGlLrGeSADsvwJO
	YVp0gWSqnGB565EEKzcWTOhSG+cVboqU0X6RX+SqECexFO/rVBYzgOuay4LmvDOOAe0ouxZX8mD
	dFU+zlGLHN1zyb114Yp8ZWUZpXmspwRqzpvi6Uk44tptZptXgu9aERd18ZYWMoL/xE64Y9YN4Fm
	YurEzqJ5/LlKp3niWlzbssh/JTC7ACuIHba3mFGXvqa3AbQJiAaQInWNqqtfFqRpPdpvibUW5/R
	oruPRp90dgrJMcKiIaPzVIRAUPsKUNPrUje65oM+Oc6FSP/PyfGRQbjOXWLdEPOC2UoudaPwjNM
	jido2sExDkFsWITX34tJqV1QgC2RTFSfysmSQp/RKLPvHdtTgi8
X-Received: by 2002:a05:600c:c48f:b0:499:bf0e:95c8 with SMTP id 5b1f17b1804b1-49e619831b6mr112079735e9.1.1789234390460;
        Sat, 12 Sep 2026 10:33:10 -0700 (PDT)
Received: from [192.168.1.3] (p5b2ac4da.dip0.t-ipconnect.de. [91.42.196.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c1bc5fsm244057125e9.3.2026.09.12.10.33.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Sep 2026 10:33:10 -0700 (PDT)
Message-ID: <ef6ea817-371a-4038-a73d-274fece32f4b@googlemail.com>
Date: Sat, 12 Sep 2026 19:33:09 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH 6.18 0000/1518] 6.18.52-rc1 review
Content-Language: de-DE
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com
References: <20260912065623.398859879@linuxfoundation.org>
From: Peter Schneider <pschneider1968@googlemail.com>
In-Reply-To: <20260912065623.398859879@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 12.09.2026 um 08:36 schrieb Greg Kroah-Hartman:
> This is the start of the stable review cycle for the 6.18.52 release.
> There are 1518 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.

Builds, boots and seems to works on my 2-socket Ivy Bridge Xeon E5-2697v2 server.
However, I do see the same strange dmesg warnings that I see in 6.12.110-rc1:

[    2.397237] Driver 'sr' needs updating - please use bus_type methods
...
[   84.031323] Driver 'ses' needs updating - please use bus_type methods

And again, these warning are new in this rc, they did not appear in 6.18.51.


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
