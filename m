Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793230244;
	b=pQLorz47zB+IW0xKKsRAcadSwYqv4iVDabL5p4KAT6DrZFRLQ4NuLpSXDy7Fzr6XmKrG
	 MKXS7m7YOjmQ9o10jJDVCAOmwRtm+7GdOY6sbKYX/FwfCmbFL8oxINSBhynjSMt3sWcax
	 osRYaM4vWt3dUUO66NizMTkKEhN4Mx+Yw3B+J8Aw1GZilqJt4vMwgmfUEbrHAxdTB+98M
	 6oDwBZGZXODxZI1EjYejF+9K56gS3ybdxkvV+TBcyiwy/3tMiHelqgQiT6D+O3+J7G7Q0
	 xVvM+IiED429bC40Trgj2eZapsRsEtfNmdVk23Bqudct4twMHdSrNnqesHg8Ll3wO7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793230244;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=R9k+w7oblnXJNcegGF9hKmQI/r1FxkDOTnMI2L0ySfE=;
	b=i1vNC6gerFQBQ7Zl2C+Tb8iSOFtjxxTK4rJZiuOxlYG67HSQKZSL1wnxzPsslmTKUGj+
	 bvgYA6KnsjPP7a4HURpuQ9SRzdQUZnp1dPDLdM7136G+XyRBKM12zjtoiuC7iBH7QFNVp
	 RHV06j0/BboiWVjvnHs/ViLt0nQyGUrQ8k0LqpKHgQV4ZXdGpTxmagv2WA9fc6KRehyx9
	 9uWhN0k52i1XRG/9Q/ErH+4N9h4+p6Xm/yeJ4ISown4nvE3bH1/De+YprpMOVWQ7aGyQO
	 JdACHIr9tQbhzbD+sAwEcHiz0sVwrPgK+7m1jpOeB4Q4un9UqNQIHU/p928ZsHBQJ2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q75NymhU;
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6C7606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 23:30:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D6C7606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q75NymhU
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cd5cd8d89a7so796775a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 16:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793230242; x=1793835042; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R9k+w7oblnXJNcegGF9hKmQI/r1FxkDOTnMI2L0ySfE=;
        b=Q75NymhU49qYgEu7adMh5yyofljn1Fm0N7UkaOUmvxw4wo6FBpLLrHAYq4WJeKYfwr
         EX+z6FNJ1EBV4u3+AjAll2MBf7goD1I5cYn9sCpa3XEX+nFcIo8LDvd5BX2MvgeGlSHt
         OfNMoipjnSwmFlz18swI6oPV1e2zJaWZ7ODp7bADMUJHPADg7jWMBNKeLhXOgdJIR2n1
         4fhMFLnCJY/s8NSKSS0jh1EjVUhW6GUCP2hKWwv79yxpfOjqM/+aVuDvZxY3YqEUI1cq
         t28YvqbCgWCQBhZTREahJyOXfRtM1wFPVMnDoE2KoOdhJFigbxprZnxMyeGS+ZZ7GjND
         GkcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793230242; x=1793835042;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R9k+w7oblnXJNcegGF9hKmQI/r1FxkDOTnMI2L0ySfE=;
        b=a7RuEzjeOoet7vlT4wW/SIu0vHN1h+DDJK9LHjmyDwqiofXAaZ/UT6BFpKpffj8ufs
         uBVvEjYtvknax8V9IBN9OW5v75NAQatn+OG32rlXUymPrvuKAlTJz5geIizj+v8AJpzW
         Ns015Oe1BfpM5rYtX3MdZljsr5QJiItPc+pPKNX5IR4aHMycgMDLT3oqiFeq3uvacLkq
         NLisO8UBr1LMQsr/nBs78sWN4qxP32P2N4hiUHscfdJRl6Wt9FBUV8gdKUxXc3VRYrca
         S6FBgJ7hiUGvUMIikntOKg1IJFI4KPZpFtl6NM2dLFwvqRfJ45YMIqhEojnldLOBLjCM
         80ag==
X-Forwarded-Encrypted: i=1; AKwUvBzPuDSmuuqeQrSY9KNQEzBA47v6apTVKFVsvUBKXR7106rxXaJbFBlAwVMLxeja1KsUbuqDRoUD66v+TMQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIMd27+TDlwnxFbBw2YbjL62O9B6a0XaAXmZjr+/TB9niVRb9mf
	0T9igNDgcwe0blGlnnkt2Nj+CF3WbEGTL4WrJmElGnh6d7i17YF6G3vK
X-Gm-Gg: AYBFou0Ls4X3XEhjDWXkbq+xrWZM2kQyXpXqHh9AqAwC4J2+4uvpU6eKeZqitGVexGT
	x4fvmoGo2/m0SGCHVCIqiWGepupnHXTXqNKkjtTvRqI/vVChAhHbSA46fG2x79RX6xc2vwDrMft
	t6o13r1YQCZoT5P4wkyKQIDivt75EpJmkV/BtBYGG+a3DTymTPeZUhzfXm5IQ0BjccBKO5Vfg+W
	6ukXEobA1Q6jnD93KhVx8vWvhfy0KtPcDv9IoOWULfbtr1sFw7mfyqk1XWsGs5/GS1yRQYNvDiv
	MfSYf44EoBkymgUHYoPLKKTGM0mpdMufg1L0A8Xv8MVr+sMZ7AH4Gx9NsCx+m76ddEN+mqbgzaU
	y6mH2BBQIoK7hR54VxYqNMsoUfpSbIwFhR9bJuF1LhIKZIfNSn35Z2TEiIQYSdIdaUpHjgYPH3E
	M1oVm0yiVzca9taxEOU4/BWMKk9PEyPSVQqi2fiPshswIugGI2jj1vt9CDYveexNJSY6guaVgRf
	/+6osUJquOwzQ5PF7d7I9GbVvwPv7n9uJyF+oRv5ErF0joruiiOHrvYoKxOrFOt3hsCZbSn/DpB
	yq+wwuBzZ32MLqlKghxsD4uzbCZoPu9+XRJtzN+abbFJJvI8AoUG1uaHCA==
X-Received: by 2002:a17:90b:4cd2:b0:3ab:884b:659e with SMTP id 98e67ed59e1d1-3ae57f96d53mr2559235a91.9.1793230242204;
        Wed, 28 Oct 2026 16:30:42 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e7ac44asm1305555a91.2.2026.10.28.16.30.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 16:30:40 -0700 (PDT)
Message-ID: <2c58625f-954f-41db-aacc-5340ee06d368@gmail.com>
Date: Wed, 28 Oct 2026 16:30:39 -0700
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
Subject: Re: [PATCH 6.12 000/247] 6.12.115-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 sudipm.mukherjee@gmail.com, rwarsow@gmx.de, conor@kernel.org,
 hargar@microsoft.com, broonie@kernel.org, achill@achill.org,
 sr@sladewatkins.com
References: <20261028165947.349197979@linuxfoundation.org>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20261028165947.349197979@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/28/26 09:56, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.12.115 release.
> There are 247 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Fri, 30 Oct 2026 16:59:22 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.12.115-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.12.y
> and the diffstat can be found below.
> 
> thanks,
> 
> greg k-h

On ARCH_BRCMSTB using 32-bit and 64-bit ARM kernels, build tested on 
BMIPS_GENERIC:

Tested-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian
