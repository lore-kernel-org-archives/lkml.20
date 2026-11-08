Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794101420;
	b=lXvlukLo9KL+OA/pVOoN4DERSv4ScvHgxA9tyjEW//y/MzMT+oaLsE3rj2HCxMsjKyFb
	 WefjQbPTY2Yy1PUh7a7glwnwwU2y455L1QkBFbctROMpG3PVl3Hqmo2thIu2HBPr8cekJ
	 8kT6i3ycp48JxMJZdyPwVjJ3rS74APFgcLHW19AYSI72KMKZwngLQonoJ6Y+75kr7mQbh
	 86bTxZRJHhIyObb0QHoGvIjuWMIenNprHdhlYHq2Yailr3nmdzxQ8Bf+9Q04g88JgObY6
	 V5XlxbKIunuxTA3SVOvXhyP2A2+c0ZRmfqbrb2RCt+dsjzDYJV7AAeffoIFUvEtVuDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794101420;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=9Mc5tpEd+rEFEriA57HIWZrFdKcU8gh5hZIGJp5Pbms=;
	b=mA5Zokd8uVpUV5ju5/rEstokPKMxqJ2rBkf1B86KJgAhSzGIUkWGcfepIlOpNLvur7so
	 AbaQ7YOJ7CASpGQSjnKmAVJsyB2VvbSqyjxPbbBTfvqYrWWc/2DE5iBctEd/NeEKYxsn6
	 +tFi1m6Jq5FmiPPzbzSl7Ap3etKkjbTOiKj5DbkzRKaIMsASA19zSUbJG3pmeh6MVoI2q
	 vabvclFlNzT73NYlrfxwBqPacRWM0aqyNig7xbD0L43Ndz6YpoDI9hnZW2anIbS7fShkN
	 9H1SQHIELGHXkVWzF68vf4mdyYbWI1Y8EOOfHF2C/2cX8qAs7RozQWvloYzvtAgBaTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WwNXGmIH;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED082606A330
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 01:30:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED082606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WwNXGmIH
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3b0b3438540so69224a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 17:30:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794101419; x=1794706219; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9Mc5tpEd+rEFEriA57HIWZrFdKcU8gh5hZIGJp5Pbms=;
        b=WwNXGmIHeHCL/N2qIhu8gHpS6ymm0Zrq+W0L4sYZrzZ41mGOpuRfn1rJO1Hm47L/pT
         JUBOtSK/za481mdHL7y0dq7zrqdATG+ePfE5AX9EYg0lcY/0BKkvJPZwYwMFrw1GZY20
         qn915JnCdrSaaXrv0ITy38fgQL5iEwsp39WvpNNzgGIcMRardQfX/HkmgiwIWlwnLh/2
         oqGzPq+E9LBMlY1UnIGK3dMKkRCqm0dhSvKMUfOriv90JdXOI+i7bEkwn/shmsGqujy4
         dnu8ir/HGDB5vyhwcpM4jtkN/afVjtPlDEjJNO12TTCLkcb8i9FUQLqqPesUaWv5ncCi
         +cJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794101419; x=1794706219;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9Mc5tpEd+rEFEriA57HIWZrFdKcU8gh5hZIGJp5Pbms=;
        b=R25Zi+CAzcqzErrx1aY9LRIlF7+0/xNO8FWqaXsXb2yzlq/uoH0mQBYYdB0gxZ34NU
         HlYDtwMBeRhO//juEM/FJDfjYH8ISY45J8OqNGjAsL8MV2mq5DV5E/wjn09suepsuarf
         p0qs0FpPtPCCDXXyEGiFFweP/S2NlE3NfdG/xURfpuefE0lPcirEaxqGlIdCd8V98wYK
         DVHhDAx7/Yu663ILvAN6+3mKaN/1+HMsxtfhFDxWZbqnNqPJvGDERf0nl9qsU/MuCZQB
         IQmh5U1IOIelobiOVJR+Vf30HrHbx8KowjGlLeFR2+t0zO8goqet6ma13N3H/q0N6Mzt
         gXQQ==
X-Forwarded-Encrypted: i=1; AL+hErGNjN2W9YRxWisbFmJU0QMZFxArnUUqHif7qo3BJ0Q2TMUC/beA67LxkVvC4TXJvod1eCry4hICY0n5NGw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+PgePm5UXexoRsycd2VNQS9KLJBF6qqulc8G4QdOb0Lw8yxktw
	vtD8WnGFpz/OkjlQZJYc1UF88i6Sr5i4tksZqunsnJ/r8kUuxaa6ZhG8
X-Gm-Gg: AYBFou3EdQIZ+Mf2NvjbRQjOeRmXvugbIsdVYecJCoMesNQ3sA6GYzop4iBC9ZnPNKq
	S+8PrEInKldkLXT8NtK54lfKcVP4zJCpdDUyy9YwVcKTtmL0GSf6BbpVEf6CCvgI5R2vLOVcKv+
	H+dZx+z8dhC1VBeTBhT4HHIa83tdmpDTSNcWbfxZXACJkG1/0QFOfbsfaDaM0koMP1TZlmcGr5m
	7VIgWorPEsZPSaBGcgrEI9V0+AZSwAj1XCvx/Z2Pp/VLOuIT55IGUVFssFpyDhAnqfXF40Y8cCj
	PqSAVMsDxqTNI9IC5QydQIKO9Jn4/CZjL541q+4eG6eXJVoN91IdX7HRRtkYAhNgF/rPjqLGv7y
	vguSf0Ct3RF8vNiV8vP5Xwj3OikXYksjtpVhl1DLLvNRpeXpORpcZfMoc8u2SDCRFnkXHZlWPdh
	Xb7JHKRzo0EUs3FVu1cNeZz9l77i/O07+gA4TYkNWn+OhmvyI8+oTHd/ymN0RAhS+zPL4BROmyr
	rgxhbuxhuYxT2FRea990JDYVwlvXF4Pl/3Hu+ZwerJsEjmk2bKBgebMLhYWyOGzpR6kTDi4f3EP
	TY3MmPguEwf9Hq/O1bttQO7Can2AHekN
X-Received: by 2002:a17:90b:4a89:b0:3ac:83c1:2c0 with SMTP id 98e67ed59e1d1-3b12d6071a9mr171719a91.64.1794101419251;
        Sat, 07 Nov 2026 17:30:19 -0800 (PST)
Received: from [192.168.100.6] ([121.144.254.242])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b103472903sm2888812a91.4.2026.11.07.17.30.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Nov 2026 17:30:18 -0800 (PST)
Message-ID: <68e291d9-4696-498f-a7ea-087d87febe8c@gmail.com>
Date: Sun, 8 Nov 2026 10:30:15 +0900
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
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com
References: <20261107134939.434104957@linuxfoundation.org>
Content-Language: en-US
From: Joungmin Lee <leejm516@gmail.com>
In-Reply-To: <20261107134939.434104957@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/7/26 10:38 PM, Greg Kroah-Hartman wrote:
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

Hi, Greg:

7.3.4-rc1 successfully built and booted in my system once the commit
1564da6afd7ce5297ba24f2d1e61d6a79a9ff6db was reverted.

The error Barry encountered was not noticed.

Distribution: Gentoo Linux
Architecture: x86_64 (ASUS Zenbook UM3504DA)
CPU: AMD Ryzen 7 7735U
iGPU: AMD Radeon 680M

[    0.000000] Linux version 7.3.4-rc1-900-myllvm+
(user1@gentoo-zenbook) (clang version 23.1.5, LLD 23.1.5) #1 SMP
PREEMPT_DYNAMIC Sun Nov  8 10:04:35 KST 2026

Tested-by: Joungmin Lee <leejm516@gmail.com>
