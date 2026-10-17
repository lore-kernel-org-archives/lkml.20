Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23A540929D
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 22:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792275560; cv=none; b=bMVh64F9mp6uFAJiw+xJeedd14Ytn8aHu5YNLMOgtFsDBS65qohf07KfscaaL+T+UG71V9G+kaP92aTacZJC2MBVvqGxXVRY8/daaQXEv/yqTXD4lx/KPbwXEpNhVY9CHNQ7o1pstUwNW+zNgDe1E1pH0Pgx7WRnPT0ETBp7u5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792275560; c=relaxed/simple;
	bh=fEZZqs/2ON9aIF0WA8+r/aO+iqtvUwUqKlBtjbwzNe4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k4GQy0Bj8epkVLqQ1dP6Wl1VMAMmJ2DAUkv74aZiDiiZD65xOoN/UcvJMbgjbg0nwnG7bRL3Iyn7RTSr3dxNdZktegmL/MfYWIaANmd/C1ejZaDvplYeeQGSXHPbaWv1effA1RPd5fmG9QRFh4shH6cAwiy+3p4Iozbk2SQHlRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=SOWq4zZi; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="SOWq4zZi"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a1dede3c2cso6928035e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 15:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1792275557; x=1792880357; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1P3vBDxvZfLACU44clWpmAKjc22PaxwE3/MUdrEQfXA=;
        b=SOWq4zZi5+XauVKDDwNwGHJ0gsc44CwYFUiPNd3bouCqJST88O75zU+E/vlKYwHwoF
         CaTaCIgfFR/FPYBL09w7OqGtLsO2elsGJULKR5amUKr1jvcpwjGJabQmo3B8TTvSTsTR
         SpjY/MP2igKREEV9JdSniBPc+490ARMPcMicKZ7RrRSw742RP7ALtrwHBsPVHdwMUkM/
         JZUXNFUbqVY4+w4DxCMB5fc2olfo5xUx6PSOo0gTyZB2X5KwrGYo+g+BnAXG4X2X7QdF
         7WSdfyYSs0KHIBwnlp+n8cotdGzs989gMIK2VG/bFQQMowqwN3Nvme4sxUiju2dKHW3K
         Eq+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792275557; x=1792880357;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1P3vBDxvZfLACU44clWpmAKjc22PaxwE3/MUdrEQfXA=;
        b=OGtNAmPyjLiXO3XxP7oBd5BsfxXp6TyQjAhJag3qMpbgYTaSd/0EFBzonUYa5U3rtr
         tq4o88BC4q9zPiWJOEyvX6vWf6l44drlD2JyQnCjl5z/ejlHwHUrLAyK+txthJA2neZq
         p2RSbMmdOpcr1FZ8JXASFzSSbV0bJK66zw5s5Z7f1yV/vQ5t6QtUG0+ElkpadOlCEQTp
         2Si+k6Jlb0NaRCv5P/h9Ikyypc+vjxXs7eYoEF/baH9G9g0/+lYJwVPqIe1oIi6VweEd
         S246/tyWaPeSwL81cHfvqROjrrkVb93SHd7v4khjYLm3el/1Ib71MGiJDf38iAtabg9u
         8EJg==
X-Forwarded-Encrypted: i=1; AKwUvBwezmEoP4bJtFxq6mb2MduLYofSPGDRRZ/p16akQ4P8BQj8ikOz/5GUFDVQkof93OlljPvGg9L+8ff5RBU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKFS967FvAMv8s0Vxjz6vUmTdB7jRkOpD1W1QurikalCS7OFUDf
	0imsnEtUbJIGIKEMpO8QA3hXaa48/mBivPnUMkKsxad+gs4ri59zuCE=
X-Gm-Gg: AYBFou2TIDasno8uASsFNF7oTrs531BQE/WOxN1Tc789ECOkzv2NAS5QSjmEWavNm7A
	nDwT3wKGJ9TctPbqJGtcN+lynnzgAUO5BIbdXJ9nxxUwkLXttJKNmg13NWhiMz11h9GFw9Wdd99
	m7njfGYFp7Zx7ZpMmCXJbpZTGIuG55wLTpCQwN8mqxN5DOOgEZ7QP2I/SyGjBTkBTs4rUAoWfL1
	OEcoM+2BjX8QJDIJg5QqKgybBtcaXtAu+WBjDqPKInPZMgxuAhNd1CcuLlveH+QwF6TVA9joNIn
	451m+18si1W1kjzXWyvOlE58GS8xpA2nQOtxyeqPfqtghLiS4BIPzPDWChJQAD77+BkZ74vXiAE
	XIMELA8i1IwHw3dItmAyc56Y6O6DJdJVgCKoRggaB4EqBCgQ6+nsCvbYkjKGWpHsMLyS/+Fw8Qn
	dWoZniUprjo5wnCF2lW9qH5SFrE+DQmdRaU/QNidJ7KrcIp18USYqtQ+zAxgxEoqGvwGKINTyRQ
	oCxviqh1SiVGfwpbItSFrYFyY4NkwkSlH/rYUEtaz7U9sdz
X-Received: by 2002:a05:600c:4595:b0:49f:bd3c:bc24 with SMTP id 5b1f17b1804b1-4a1d762168amr82215755e9.31.1792275557036;
        Sat, 17 Oct 2026 15:19:17 -0700 (PDT)
Received: from [192.168.1.3] (p5b057d26.dip0.t-ipconnect.de. [91.5.125.38])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd47104csm14989798f8f.8.2026.10.17.15.19.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Oct 2026 15:19:16 -0700 (PDT)
Message-ID: <65c9facc-377d-48b1-8d48-aebac14e8bbb@googlemail.com>
Date: Sun, 18 Oct 2026 00:19:15 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH 6.18 00/52] 6.18.58-rc1 review
Content-Language: de-DE
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com
References: <20261017155104.830766652@linuxfoundation.org>
From: Peter Schneider <pschneider1968@googlemail.com>
In-Reply-To: <20261017155104.830766652@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 17.10.2026 um 17:54 schrieb Greg Kroah-Hartman:
> This is the start of the stable review cycle for the 6.18.58 release.
> There are 52 patches in this series, all will be posted as a response
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
