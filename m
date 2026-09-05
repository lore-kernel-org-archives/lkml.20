Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57AB6165F1A
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 20:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788641354; cv=none; b=aQOO6nUGKPXlwtK9Ks9mFi79ssFKcLBxmaBDasihJXHcr6tewqietw0vBe4KLmmanDNpCnmeEpHaRDvQMR3WPq8UCpVf0XqMs21sUT3jwV/4q1MmpT0IqiKMKwptcpj9sv2eybB/8c/UD0IkhmLsxC8Mej2Vc9tL1bS/T8MuqYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788641354; c=relaxed/simple;
	bh=r/z0/C5tMQT5HZYyEl4B0b4VC5XYi8OOIGchid41G5Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qd1KB6P5zxBYLZwflOWPoAFizqEr/EP/02RY8x6i7FeWjQwVevAqnRH6iiWbjJyp++oyqmJi+bxGQPCwpbvbVIMq5+LArg2Ip6gaxxXwR6595na7OEByxDIA6eNUwfGTOG+iWBzcY8+bNKmbzOUKtxqefM7wpYVm28bZ/1kjaQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=eX0Mj5uQ; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="eX0Mj5uQ"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4843e397f74so2723081f8f.1
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 13:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1788641351; x=1789246151; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=c1EfKIGU/Jrr5zV5deWFk7RgEC9wFJWZJq9htaal6jY=;
        b=eX0Mj5uQVqD3VT/85ooqJ/R7nPJyEu+8dXwH7ChxSYeCBPsfPoO5iIZSNOSml3FJQn
         Wna0kiMrbpfweM+BEMqS11VoAQSskMgsBE6G0+QDXzo0m23Uow6cLgluZwnPYPiER2V/
         U3DTzm/42bqfAVpwZP7NlykXpwRILiLho49aBDKP5ktXnEb25WHXBJMdnJ4XgJouCIBM
         sk4Xkrtk0O0ouOHFLET54kg2xLqfGM5ckFrWXGkFQoJ5d9l4e9I1jAnvg+7vnLGkvIv5
         Kn911h62QllZpIEQZXUqknSHL2bDpj230fjC0VbZA1rD4jTrdZcuWN4AwOQYzYtRx3BR
         RmVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788641351; x=1789246151;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c1EfKIGU/Jrr5zV5deWFk7RgEC9wFJWZJq9htaal6jY=;
        b=eYOM1y2mxXBq/zxrK8Lf8q12J4uDpkCUOTqT+5d94g2dfnzf1dckJruhJW948ImIry
         nT3GCzLKp3C/ljeW9tCr0XYHNymTzaGYwUvRXUXMbr9C2bh2Cf5tKCkeDH5HeeHSPWmO
         pXlR6lMhPYRXUS08sjReBNtSU+ezUNFLKchVw7woaXna5dA+JlWhI/RAdPmX8D61ihu0
         w4GwmGjnfIwfTzJH5DFUCemDlIZylWrKJyBNnHSNSLpBKmkfq29Wu7BT4SNQW08udmap
         VAnm9fkb7P0Ykqk6788dIOtC397wJ31dBpgEbrpAUs/dAZkIxVu06AjbF0T9wVUSFVOC
         IUew==
X-Forwarded-Encrypted: i=1; AKwUvBzIgB7JpbLUEP7kLBQtHE3fBbquZkdViskTOxwV0EU1M8bmZC+q4ERzy829SIVaJV2lI+QHmKPDk2e9WwY=@vger.kernel.org
X-Gm-Message-State: AFuF++ngloZYEclYooTVh5m5E8hUuKYfyf43qBXSZFuhJIxoAJ6j6bKQ
	yuGO5THOWRhi1DCo8MW9NI/WFh822EzuDMgrCZWoUUWBA3EZ4uEguI4=
X-Gm-Gg: AYBFou3CFi+b1eNtIHRyoOygdQiNIf+K5fPNLSCAAXMKcJt16F6pAYc8sQQkbDJfRi2
	Fzr9lNOF5ArjHmOINvvOY+RU3gltkXYS/r4XkXbGqnMx+GF9Gn86DoWBjfIIymxEfO6IJrmhLjv
	X6elCbglvducUhXjYyafxpVs4U3CeAthKgkeuEDl9SZGyeThzfNsy9pS5bm1FOHvYPALt+HhqcE
	FhMWqjgkkxOwZSkDSfru5WqTspFG/vGo+4PjavMHIihd/9vhYcA0jWj9dnhSJFQ7LlDnTOG77af
	EzfLOpqoGHvZEoIgdi0lhXvMahfhnzUpaEazw8swz0dyW8S3HEK1tJJS9RIdZl+okb/q1d5PdVJ
	TxAaAxVSoha41/AltsK587VTE9tOlobS0gwKd8X+xnbLp0puIPwBLaS0tyXzPlCq/3UTksF3xqK
	fR6Sz9lg+pGVXzFXR2oGOS6wyDpkOLPETuBfmy5qt6iYcY+KOGcIUy+kuByb16tE1In4cqFLsMS
	etFdCUVD2IWGfPDcDkXrMnk4OpaXs3JQKeDBP8x
X-Received: by 2002:a05:6000:2487:b0:485:8639:d58e with SMTP id ffacd0b85a97d-485891e752amr13186722f8f.8.1788641351327;
        Sat, 05 Sep 2026 13:49:11 -0700 (PDT)
Received: from [192.168.1.3] (p5b2acda4.dip0.t-ipconnect.de. [91.42.205.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883959f0sm17241259f8f.10.2026.09.05.13.49.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Sep 2026 13:49:10 -0700 (PDT)
Message-ID: <840c2d45-400c-4540-8238-862aa54a87ce@googlemail.com>
Date: Sat, 5 Sep 2026 22:49:10 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH 6.12 000/400] 6.12.109-rc2 review
Content-Language: de-DE
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com
References: <20260905115627.670276262@linuxfoundation.org>
From: Peter Schneider <pschneider1968@googlemail.com>
In-Reply-To: <20260905115627.670276262@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 05.09.2026 um 13:58 schrieb Greg Kroah-Hartman:
> This is the start of the stable review cycle for the 6.12.109 release.
> There are 400 patches in this series, all will be posted as a response
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
