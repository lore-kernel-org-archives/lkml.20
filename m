Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6253048BD2E
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 20:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792008811; cv=none; b=NjyAKVYbK8egX6f7CrdDVeU3WDFqqKxixs2ilkrCXmDQDyZfiKqoR8lBM0YpIB6HrRyVLe75oz2X2sY4oBUYgCO/utKyIiBm0q+ANUr50SJDCPqBIA4GwsdFDmjGAfTVHgtGjgGASK6iV1JROVsXJbNn1SsQBuPCML5O9nwWU1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792008811; c=relaxed/simple;
	bh=9GlBUMY9Tt4evjQ4ULoWffGbTfu8IfA43snp9BZJV8A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kv6qJqpFR69Z/xC2klTqwdEgJ0mYFW6A+v86YWwUSGUE04tcSVNvnpVssMsdFqOw3K4D3jNTrHu/HAJ1NHSMoCfuH2Ey9DOLfEjlmnIvLiDKoI9/JNeRsj3LXUpGe3Em1wX/2hamMiooEP2vfRvCircJGTLCJNbIce0StWAZsHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=RzFqpfz0; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="RzFqpfz0"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48b0946c2c2so2917190f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 13:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1792008805; x=1792613605; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fMcFVSFe2pDmfUyudYthyboJo6z1+8bv8RHgL8W6a6U=;
        b=RzFqpfz0zkZk/18iV+lRahB2FBBSf14OK25JLOLOT10ZfXSlDwJ5jC9bRLySjUYwNj
         XdnlMPnv7D2GKNyiK7i7IZY4Cvly8fgYO/Nos8FBTlG1Loq0KUiXt7+KISV/X+89zlOZ
         fKAc3QZG13Sjc48cVGvAZAZBLNWHmc9vsVdWpIKQ18PdG1D4t19o5b707LVjPZ0NN438
         eJzygHNFkzeHUSf71vslGXlWIpyxBYoAcnhRbhlVGPf3A1o2rNzg7G4Tnpu0LpVdGeKi
         cCcxVul7NJeVakAOj6bPmax9efgjTbGyvz2a7chQWWr5a75ArTpQGjvtilHiCwM4zwlQ
         Vikg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792008805; x=1792613605;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fMcFVSFe2pDmfUyudYthyboJo6z1+8bv8RHgL8W6a6U=;
        b=0RCzOyFIy/n67amNyDQs9DatlxWtReP3Gxo8g7upUR4cZfyrASB346J8tY3zuFKB+f
         GfSsnZI5A3sY+UbO5s3pbmBuzCHxs6THvUtO73wa3sQRxjbgNEcc/YtJ8Sk7bptcl0q4
         ulvo1eJ78IANwDKDzFRkQ3oYthaYuJiS9lNPuT5ySNclVfL2Z0V/5Rs+KbyujdcNVsDg
         Ch2lApdu092eCyIgnSL3EScT58UxMdYQcqRLNG1mPG9GRaIq0jwwj34Y/rLY0C+Hl/3c
         8A+0o/1/rKHvL7mfzaovVBdBgjUyCdUxJP9fLpFwIBsvUYUOHNdfQDJ8XBh5Z+/rNTSG
         yR/w==
X-Forwarded-Encrypted: i=1; AKwUvBxhx5jpjHGnq1UV0xVwdcWCaArelDgBQJOrsStWEQKV8yg6zBphmKsPpzAsmB/r2k8sjdNEz3c5zhpULr8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLOngVZmSTysF4DcJzLYZYcEOeLwOm/HALjroGv//Hs1pfmjcef
	coO09rk/cMtroSBw3X0VYxkF4bAbd/YTDmPT70qT8F5kPSsgKWbVq4I=
X-Gm-Gg: AYBFou03sp1LIN3kgYou1Nyw02ZDXHkO1670yMgrpKdMf/tjBW9iXpDdw6+tyvNnfjs
	M6+sc+J1/AApCrVpLPCw9aZoz7sjtMU0vcDyS2eaeb/wo6npERVOwDBnDoDiAjpzdJjLqgDw+QX
	57xHXg77DC1tUZkPR5rpuwPvyoVb23mmWtI542WlLcg529leOc9+EVm5Jhm+MmKBwZYs4kYyaMt
	oRP4kxDA+Mz0Ssg99JK3cvkzj0fzHrVQtWQ34t7yJIL1clnVFeGFEJ9sN2qobrYITCIkp+EtFMo
	hzWOp5h88Xggw0X7xtF1p9x496V7u1g1pVgGl8VNALWbbw25fq7WaDuq7QDLArQC1i3SGH7xYyv
	p6nusvnYCF0+U+D578N0te95EXr2M6aJqfVKrUwiCdPIRemmWDX1D4XHRCmfHemOfYia9aTeicL
	UwNWqU1Dls355lXvYnLVbwD3w3FqR2wbbQAKtEpg8oc54ZKHXOnTmXFedj/3JBgQ9bLZfMkXctd
	F3E1sm5X+SOo5O0N3s8nOKZ939qI7+nntQLo1ktcIU5oEmilzg=
X-Received: by 2002:a05:6000:2610:b0:48b:60a:760c with SMTP id ffacd0b85a97d-48dbacdbca4mr34058229f8f.31.1792008805303;
        Wed, 14 Oct 2026 13:13:25 -0700 (PDT)
Received: from [192.168.1.3] (p5b2acf7e.dip0.t-ipconnect.de. [91.42.207.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ab4e8csm13344281f8f.23.2026.10.14.13.13.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 13:13:24 -0700 (PDT)
Message-ID: <2ac348c8-1aa7-4d01-b189-9b7665cbfad8@googlemail.com>
Date: Wed, 14 Oct 2026 22:13:24 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH 7.2 000/284] 7.2.11-rc2 review
Content-Language: de-DE
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com
References: <20261014123758.782265692@linuxfoundation.org>
From: Peter Schneider <pschneider1968@googlemail.com>
In-Reply-To: <20261014123758.782265692@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 14.10.2026 um 14:50 schrieb Greg Kroah-Hartman:
> This is the start of the stable review cycle for the 7.2.11 release.
> There are 284 patches in this series, all will be posted as a response
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
