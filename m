Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C06D27FB25
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 18:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789408953; cv=none; b=E9wrlO5Wc5pfeyfo4DiyYg2f7r42EjV9yXNqV/y0EMV64KyHKCN2P1D72XJAE1CpD2PV2jVPyX8MHXk6aH1xYgE0Dl0EI68AYAUqKdWFF4hpm3/KDhYBvarvhmmnnUDJNuHUiQSgEKZ4xyJZ163fDZTejOTfw6n8UqR8JHgBcGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789408953; c=relaxed/simple;
	bh=9ZswKmHYV3hQPdJPCFwuJCVbZNz9gP0vODDqdoni8oE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NMzuOERiSg81IhU67nGfvWFtDeBBe5tnmCdCnf98V4HxJDnVFvfZP2dg2j1Hg6zyhEtcUX710GSHVDerPpa5iDs/CYxRR8+SChYGALbjSKvfenyz0GYB65/hOY8mqlOJXpYPyp8gdlO8bxPiBUc0rRRXunWMjvorQB3sA1ohQYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QQCz9QnZ; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QQCz9QnZ"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-530f04a0cc6so16024161cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789408951; x=1790013751; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KMesPQp0VJUensHvMGRs3/WPWJMCG93L+QYn2rj5VFk=;
        b=QQCz9QnZw7NKwYBmw5ZLfcQGJ/GH2A/EFduwIpY9qGOZ9HdAVE4TB7yoSvJKBpssdX
         Gqmk4AdqG7dPIjaKycemRN+LY+Swz4zABZiw1mOGTBnHQOKJQ1tWc+4b7yTdIfdh0Jhn
         9FD6cn06motGUOrATGWPuz0IUz0JPCmv702MrgLa5ndvTGToTQUsfRhbo6QZga0Ck89T
         va25SnjxgaFNFqdzlsZnz2KSyb2gsoGD7rKtOm+YVBAIBUEoEBVtykTmoaD5kNqxnKNh
         0F1/OeBWw32wKsuuk36INA/4e39akrm3lK26yR8napFNR05kuk/s0xI+EgJgztTwy/mC
         vNfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789408951; x=1790013751;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KMesPQp0VJUensHvMGRs3/WPWJMCG93L+QYn2rj5VFk=;
        b=Tm2Hesv8SY+XLz9dnwZrkfOwnCNLVREE2/Br/oVe4+b8rvXy9AEH6jdqvSsB4kZld9
         oVD+gD+FAhQiQawIFPPgh4MIxQBI3Deca/k4DUv1z7PvsKy/KmQBctLSfgDJsDkd8pod
         XXMvo3A4wu4+qDYvIhCIajPHZKSkKATUBqncYZrvil5gXsejNG72p6aKH6XdTdc/UED9
         RsdoiVAh+O3epxVauFc3tQ9nyLE/ywgOFpDTALsgHoKaFjr+rwolqsYMGxJy5/BI1CN4
         nzn0wraDWWw9yPgKdAADKbBCvSJolc6yhaeWrSlecsSV7pRQAzrTI17/VuAVz/RCP0Se
         W3VQ==
X-Forwarded-Encrypted: i=1; AKwUvBzEKuoV6j9nqNFUwXJoWSoCBFe4oUTnJQaAPAh3BMHU3fReHgYizpEybHWWOI7bPL9mOIvGCrGkX3X68Ok=@vger.kernel.org
X-Gm-Message-State: AFuF++l4374o9LcS128jSDNvp6ZPr0v5BLSKIQ6QX5BMXJqqZmvMl94n
	qUKw79TAw1y/TbnLmeYvh295QFLwfLYldiCKrggtTkkDxHs4A6ziFacK
X-Gm-Gg: AYBFou2pmC8Z/n2GX3pXhG/lHDD0BfSciBF4pW1Udor5tLNV6GkDB0yrWFGOas5xWfT
	3UYZAlIWbTwdQaP0EnmNvXaGhdUeTIcwjka1wY3k1hNupiV5cfbyMCpXwtrj5doGuqDC3zcyaIX
	Y4Jhlr1ljB2tTfary/b4lwIcOh9VWswRB9jU6Vplfp5SMJ6HR2e7quCoqDJPfYChYmT41u1kxQV
	7Z14bJMQ8Xe+6LCqvmvuPewIfopSnrGRbcXvHp9Ccru3FCC6mq/y/zAk3u00wmPKuiburumE3e7
	j3kIc+aV4U8jeIi/y7ioX4JpPUXp95NhoS8sMxN5Xkzcm52Z7wI+rJIi13G4eKIqY3teQrz5LnC
	2e9ct0E6rVx8ZtOhmluUGNKGITqP6BkxlBsRBuEo6/jWlXHwwYZiH6kRp8MzVqu4mXyQm//Xs6p
	NewaGjNqg3iRAc61a822cUJ+KIlRyHFX32U1RUto/hfWL+dQYErQPAaLmdVt6rh8l/fZkLvZrow
	HpFk0R4IoJlsMePgvz3pr6WMQ==
X-Received: by 2002:a05:6214:4993:b0:912:122d:174 with SMTP id 6a1803df08f44-9122e691c88mr56601806d6.34.1789408874114;
        Mon, 14 Sep 2026 11:01:14 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f47a6ebsm100587596d6.22.2026.09.14.11.01.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 11:01:13 -0700 (PDT)
Message-ID: <c293d5c7-ee3b-4fe4-af58-f232c8b9efbc@gmail.com>
Date: Mon, 14 Sep 2026 11:01:10 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.12 0000/1376] 6.12.110-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 sudipm.mukherjee@gmail.com, rwarsow@gmx.de, conor@kernel.org,
 hargar@microsoft.com, broonie@kernel.org, achill@achill.org,
 sr@sladewatkins.com
References: <20260912065607.535295758@linuxfoundation.org>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20260912065607.535295758@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/11/26 23:40, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.12.110 release.
> There are 1376 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Mon, 14 Sep 2026 06:54:17 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.12.110-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.12.y
> and the diffstat can be found below.
> 
> thanks,
> 
> greg k-h

perf fails to build on arm/arm64/mips:

   CC 
/local/users/fainelli/buildroot/output/arm/build/linux-custom/tools/perf/util/symbol.o
In file included from ../include/linux/build_bug.h:5,
                  from ../include/linux/bits.h:22,
                  from ../include/linux/bitops.h:14,
                  from util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.c:12:
util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.c: In function 
'hisi_ptt_4dw_print_dw0':
util/hisi-ptt-decoder/hisi-ptt-pkt-decoder.h:28:41: warning: implicit 
declaration of function 'GENMASK_U32'; did you mean 'GENMASK_ULL'? 
[-Wimplicit-function-declaration]
    28 | #define HISI_PTT_HEAD0_4DW_FORMAT       GENMASK_U32(31, 30)
       |                                         ^~~~~~~~~~~
../include/linux/compiler.h:17:23: note: in definition of macro 
'__compiletime_assert'
    17 |                 if (!(condition)) 
         \
       |                       ^~~~~~~~~
../include/linux/compiler.h:37:9: note: in expansion of macro 
'_compiletime_assert'
    37 |         _compiletime_assert(condition, msg, 
__compiletime_assert_, __COUNTER__)
       |         ^~~~~~~~~~~~~~~~~~~

-- 
Florian
