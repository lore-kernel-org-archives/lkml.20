Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF4D3E4C90
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789373642; cv=none; b=WFITjsz5WsL0F1bnl4aLdhC2coLViWyardaZV7NkYxbXfbLEsQzou1Qpp8IXSg8zy4YIkNDnX2R7DwxznBgalL/A1ggDUnK5i+ObX3MykjKbH9sUem2QiuLB+0hYM+WpzkgPg8C2ZtyqIDHRatO4/TDR/pad1tIp4kOnXWcUxJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789373642; c=relaxed/simple;
	bh=1qAturnWzQariAYGkFzim5QAVMrBYTGsi09OCtKLOwg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mxhqY6AeqnRstCpLlo83eQfHvsqsR4cwyDGJWJnrZr1P7UY4qKAB2ydKAfn5AKQpq60xbBnhF1KEuQVDIIBRv2JamQ7OQEeuGC2dpEjEIaD+XZ4+ndMWg9XPVx2YDcFitOZiBLenPHNtTcir/6iLH184Umz39TOjNKj9yJID+K4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EMw1TT8S; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EMw1TT8S"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f1651bso1371035e87.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 01:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789373638; x=1789978438; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=euFeN8L1qX1vuAtmRRhYoG7+Fn8wfxabvK2hQ7ks/1Q=;
        b=EMw1TT8SJD+n0qCptlg151++uqb57r1DuvoJ9W3WOFL7wp1QFlV7+8b4+o+cr/IePo
         kyxoh2KEncpSBhKClJGMj6LtwN/5v8sRb1xBRDrrPLlSTYYmv3R95ItMcGPowsEx8YNm
         BynmZloiNnvWjf5f0HOnXf3dMwwpn0cqX/yuoDPP3PjMCdCoxzKmiww+7amMT1cYjxWD
         +rlX3/Y+KFX635y322DTGnksSpsTqJO/KoSIHHHNU4G0cyuoWGz+d/I8fNOD+SVdp2yr
         SN+dZuhyekAR/8Vf5vAHYZjRl8tGfwDEM8jP1V43UCHpdVKVHPge6n81lfXU0/QCferL
         jeuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789373638; x=1789978438;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=euFeN8L1qX1vuAtmRRhYoG7+Fn8wfxabvK2hQ7ks/1Q=;
        b=pfBSV0+O9uZqTzq9X5aWpUFC7wxjwDzyPX1wek5dhQkLDvUFjJ0UK3/VLBwNCe90ep
         aaxMOXKoqV9luP+k0oxQKqImX5SLUan2mFZkx7HXSGPE1dXsukxzsjpuljXjP903tY1q
         de9xTgfPbXK/2i11iO1W45n/QntP8DpZU3R+R4r0HBqwsqfOnLFhKQm3Ut33GFSky8P6
         YUdt3EQoxBBchMcwd9kaJwu8NChVcOPMHnJp5/+/sGVjNgHGw6OoY/5GCO1DNfjZ5e7J
         ur+Wpu4CG+zwlhmFC4RCK01FVxIe+Lkh3PKlWdMXr2hWSs1vCsTV+sySOD1aJyvY76IK
         Ap4g==
X-Forwarded-Encrypted: i=1; AKwUvBzpkytZOIiuLvcXgBDFxDQ2iB6SLvVuEhyEV5lSr0IvdD6DhG+//+WGpWUupskfUaNLhBxosVo4SCnmnqc=@vger.kernel.org
X-Gm-Message-State: AFuF++nJOMeBXqL/srARGYRvNxjPEOmsGHD8qyBsI3Wpiw6+yBc4DwDN
	CmHdDERf9Lrbv1+F2mv8uVALLZFI66+F/rumZeGKGfNBlDttu6Bh/yWY
X-Gm-Gg: AYBFou1I2xlvBrdWZa00u31/+iB+uMxfDvajLipu9+G+ow4AZmhRD6qYutIhn+uZw8T
	jNhq+B9aQyATjwlJ0yiMnUs/CJzPYgIF4hmyCVeO6niXHqGHPpTWPpUZPp0V3KNx2gzmVuVCcrq
	8DrL8GIblbDvjWBTvegrWyWrt8NONqc9hwrxEu/LIWaBSGN2jd3R7fQTTR45B/WJfD3GbDiEDcq
	bHGI3Sp5Rxk4zG+hqzta2Se40xPUBeoo6BBqyUGWPwLXnK16P9mfqb3hVVHDuve3ZhGFwWLgkel
	b+cKHvXhOqmDRx4QGHjE4w0tmuDHORoq65HKIBzzSDe1Q/Lkt0ta5GnhtUmAfAWmdXfX4i8EBqR
	oxAgLjgu/X3qmjG2xN7TrhiFPIK5PPFzdoHeGMh7T5ZqXUebXRnzATSnbE3j9Q+cHC6/+6Zwdj6
	nHarsp1Qp6ADbB0/5jncbmTlcMwrf1u9zdx0MaxNEXk1EtLPOd0RR180Cz+eXMfws0pgVdpTvP1
	1LRelGCYXwZvGCbq5aRE27qZFXe/pkusrt6DKyp/IMs6EynLJGPRig=
X-Received: by 2002:a05:6512:6181:b0:5b6:184c:7da8 with SMTP id 2adb3069b0e04-5b8ae6b8b5bmr368579e87.49.1789373637454;
        Mon, 14 Sep 2026 01:13:57 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a03a8778sm2275500e87.2.2026.09.14.01.13.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 01:13:56 -0700 (PDT)
Message-ID: <d601964b-e437-4990-bbdd-0337bba49102@gmail.com>
Date: Mon, 14 Sep 2026 11:13:54 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.12 0000/1202] 6.12.97-rc2 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com,
 Herve Codina <herve.codina@bootlin.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kalle Niemi <kaleposti@gmail.com>
References: <20260722142834.868902312@linuxfoundation.org>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20260722142834.868902312@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/07/2026 17:31, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.12.97 release.
> There are 1202 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Fri, 24 Jul 2026 14:26:57 +0000.
> Anything received after that time might be too late.

Oh, time flies. :) Well, statement understood...

... Still, even though I know I am late - I am seeing our tests failing 
for stable 6.12.x. Other stables as well as mainline releases and 
linux-next are passing.

The actual failure seems identical to one discussed here:
https://lore.kernel.org/all/072dde7c-a53c-4525-83ac-57ea38edc0b5@gmail.com/

I believe above was fixed by Herve.

Bisecting stable points the:

> Saravana Kannan <saravanak@google.com>
>      Revert "treewide: Fix probing of devices in DT overlays"
which matches the issue in discussion.

Maybe the 6.12 stable is missing Herve's latest fix(es)?

As explained in original report, the issue is seen with our out-of-tree 
device-tree overlay stuff. I have no idea if there is any in-tree stuff 
impacted but I guess the overlay stuff Geert has in Renesas tree might 
also be impacted - if it was based on 6.12.

I believe there is an "existing easy fix", in a form of a patch which is 
already applied to other stables. Unfortunately I lost track of the 
relevant fixes during the discussion so I can't point the relevant one.

Herve, do you happen to know what might be missing?

I suppose this would be worth fixing because 6.12 is expected to be 
alive for a while.


Ps. I am not sure if this mail thread is the right place to report 
issues _after_ the stable is out? I'd appreciate a pointer if there is a 
better place (for the future reports).

Yours,
	-- Matti

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
