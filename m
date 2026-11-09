Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794259116;
	b=GGv/lwAv1FDdXRR1rPeAPFX2WT8Lg1O2u3IwQyYXKO7HXgy4ocn1+Ep458mAYvPSlNDz
	 5CIYn3iPRDMGXeGmubiwssfnrN/Hqm+m0vLqEcj81/iSGNCOPTJtjSYHQyfgM+Cbi0bWJ
	 6zm0p+55LePaCvyaA8uLrsGRkI2FZjBRMUoVi/9N+4gOsuxY7nS8/3g8shBlNZvIQtR0m
	 FR9HJ1Gg6NNuYzG/RLKuSH1nB+Xoe1oaFTo/lOH4u0EmYsilTPg3dV+lomT4trxJ0Eyco
	 1XirN8AT/2FbWjULIi6sDdCkwQQz+TsDiIK3GrFErTA8gCCciAJdRJZ/NDbPAJjOI1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794259116;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=m1QU3+7laS+fNdEWDXJJYocSvhG3rmU21yfPePi389Y=;
	b=pgIIz+sXo2uBZ3C9clECaKlqxYeosN54QOrSmRKB5Xqs12YUxMY5tpcYSraNwZcjk2xE
	 HZ1hMjTGAv6OUa3HBOjR0jXO3mq4eKLWPG3abOG9G9ROMKSetgOMAqxR9yG6AEVEJQk+p
	 HHQlSWx9HyojitjkliUN2izbw5kmDRdbvUl+9M95FvsR9AAJ/ngWDSfSYrM1DfQwwxe2q
	 GQyagCgbywJ9vUPRWGI2X7cQPaJcvWaIJ3D/alKixeUjkjZB5M5RN2FenV81JiE0B6D+Q
	 v/P+Lnb6+2mnD4xJo0r1nAtKpposoQDnnuXxb288ii77S05YuhztE8/RR0l+A6RzpBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vCulz2a4;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2625E606A32A
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 21:18:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2625E606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vCulz2a4
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-37071c0f42aso2484806eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 13:18:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794259114; x=1794863914; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m1QU3+7laS+fNdEWDXJJYocSvhG3rmU21yfPePi389Y=;
        b=vCulz2a4lw9GCsTVs2Ce29kE5YChwlsi67cSXQmnJD93SP4JzWrcOmb34uOD2obKI9
         WD52l+HXFKD+YFGb5GRcfdI1eqgY5EReukXaVi/Cqbk3Lp4gX1jhNm/L2w/PO+Ut5k++
         eHMM7OmqCwrxizH0B5BeywZGf5QnzlO+C6L+Ejinidhq4kFhCjK80wgp4QFvDaPmTk/b
         aSPaphuaJVdijD4ep7ORk7y2Ea4Z0xwFR+h5bn3LASQYOE0aCuPDYUwG30/kDaktGS4r
         iTrsyj7zd7oN1RWFg3ICTlvbRr2G73g6cThPts9lpm0JlyzQUKf8aj3OuNQ4XgnnrxSW
         OhHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794259114; x=1794863914;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m1QU3+7laS+fNdEWDXJJYocSvhG3rmU21yfPePi389Y=;
        b=QkYUy3Lp3GXFpQQxW4uIkrm2BuJYz4LZkO4ngOvnWCAXexDs0hcWFqEnkFboSS7bq+
         alXNafYOSlK/Eb4+QEg9Sfsd6iAFAe1cmUWOuVPCadAMdaAE6Rt4iB/AeOrkevWUh5La
         DvMItDyR5ck0n8ZR1SpvDn6DSrZx+Hv7dpYMI5qZl/I7aKg1fG5eO6bDSIpGsbQtLKg0
         pr+StlmULDg8nqCnNrtDkghvSNhDBdgbgbuRagj+5rWaAQW1Wu9ACRnWeGtt84VyKGdh
         OFg7EXstPRZFVwProfrADQlwZT59rKJwVrrALfJmnyAKmE26VPCGEQ51htvOB3X8VamG
         s93Q==
X-Forwarded-Encrypted: i=1; AL+hErHadYtXaEO1xUO5tzqvGRbiV+e5IGy4yqj3yKz4gC/kLkcRzcK3hETdfEaMQgJiL1xX6RN8J03tR81HfDo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+FhfT0onwnUqCHFdTe0wDbPtoVrA86E5E/auHcOm6hXJLj6p4Y
	FsmNclzeImDNNSOlCex/NOPoZS8CGhFDOvSyZNrlZp2nNes3vySFzwFH
X-Gm-Gg: AYBFou01GRbOzxPHF6EXqbn7o9zQKP6z/1AVWih5JtOSxmnSzu2vQdRhZe6qWAuHYWZ
	sMGulR+DUAWwpXvnNb4EcHpEmcDkXdJo3wj2zGO14xIw06T1XS4BdoKUMZmx4yLdzlh1yT1T235
	TDOCoYPgQ2ndFuei/GDMnUQiKFWl2XXQYd5k4EbH7VQ6m0rlHx6GuWimNA9R0IZ0NgbpdQkFExJ
	sCAaK4im7yz3dyVFndlFnQi9bvSp0fZkpTrxE5wrGxngP/cdEI0MbgfgWisD+8bEQiL+3cyd0J3
	upMjCXTpMBV7uiFl0p/VSHm+/GuTDKvagMjhUkFypZA4u0JzzUtDkfS0uC1BXhWD2/076HAuNSJ
	LXHyN7nxLb5vgORJ6PL503riulggjZu3Jq4hpjOeEX6dsB2oOvuxeXgMwK6tjJ5vM4heD/fghuM
	z3kfI4IWnNDruy74GfasA1L1oaOOWwN1+lUq1X5F8iMxtEsw96S+FFXOod+mvDeZ4hJelT98Cie
	hHbdRdoyJ0pkWLXPyKxGkmDYHPBDUksZgyICTWbymdOC3NaaOZjHEzZbNo5lEzj+c/0uv87VkW+
	OamxCjnXMejCFlyXr/d7jdMM+BacXj1y/prR/rnLPx/cFUvzw9BLvk6g
X-Received: by 2002:a05:7301:488e:b0:371:7ecc:b82a with SMTP id 5a478bee46e88-3751f659215mr639626eec.21.1794259113833;
        Mon, 09 Nov 2026 13:18:33 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751dae63a6sm1001100eec.1.2026.11.09.13.18.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 13:18:33 -0800 (PST)
Message-ID: <d76da9ba-a22a-4cea-b0a2-c2d0278668b1@gmail.com>
Date: Mon, 9 Nov 2026 13:18:31 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7.3 0000/1257] 7.3.4-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 sudipm.mukherjee@gmail.com, rwarsow@gmx.de, conor@kernel.org,
 hargar@microsoft.com, broonie@kernel.org, achill@achill.org,
 sr@sladewatkins.com
References: <20261107134939.434104957@linuxfoundation.org>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20261107134939.434104957@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/7/26 05:38, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 7.3.4 release.
> There are 1257 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Mon, 09 Nov 2026 13:46:08 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v7.x/stable-review/patch-7.3.4-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-7.3.y
> and the diffstat can be found below.
> 
> thanks,
> 
> greg k-h

On ARCH_BRCMSTB using 32-bit and 64-bit ARM kernels, build tested with 
BMIPS_GENERIC:

Tested-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian
