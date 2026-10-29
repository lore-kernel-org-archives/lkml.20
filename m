Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793296089;
	b=J0vYYn4+VrUu0793kocm4VeUivyhUO6uPT2OqTjz4FDjMbSYVPc/LPyDu9eS2KPcBjf1
	 IaSfVRcZ0ueKRUwE6W91iV3UJT+Q/eAOXH2JH0M6hGuMQnjfwD5YZ6LouE4hMp9FSR+at
	 DFiKQS5M0VxDRzwEBvLXfuSyxDSdeQqJAmoX1NzY1neh71xgUcAEmR+NctWh/ImcMNV0u
	 V8+zoy0AkL+sb4AXpz+7qhfBxnWizNDlSTDJJN3rCi3LIcllRVlmZyEuzS4R8uIiUbQh7
	 nLgXw50VKWTmplvTzRp8UeyOsfdrRrXGWpQMEF6o97JcMBOSm3pVOUxh1IqYP+xoDqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793296089;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=HaforV2IeP0NmgJIChxLqIjhpAm5azYdHH9oA6zE+e0=;
	b=PQ+tXp1IoYSOyseWt6C2pjLNyzuINtjiY0hyYyk0+Fi7FIfAp8Fdq6W2e94TeVJ6bgN+
	 sbgZcxzDeNgRev2poCOLsz+vnqD/62rVzac01NBUPQM5TBsIFj74p0JIX6qAgFdQgq73o
	 8I+9fjxn3BA0ojRBv1CEFbNkU2j0mjNSW5wkLHsX2ML4P3doqnuHsb1yJdWRwF6L+/x/H
	 qXd8ulYgWwMG9qmuFTzZAiANMCmf8AT1bnDNz3I9jaEoU+fT95D4xJxMH+YCalV4ucs6n
	 6XVfnkZ2JSYNvcmuZzb7W30TFUhf7LjwzgyjjcKW1GFcc+eKN5IVyB0lnk8m+k+03Pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FA2D9tZm;
	arc=none smtp.remote-ip=209.85.222.173
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6008606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 17:48:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6008606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FA2D9tZm
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-93f2b8cf037so188814885a.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793296087; x=1793900887; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HaforV2IeP0NmgJIChxLqIjhpAm5azYdHH9oA6zE+e0=;
        b=FA2D9tZmCK6oAVbTS8dOfxg/WL+DatLxwaoHj8OrATdWMmlmQhigB5xRcIIjzyyMaa
         zyr6Pt0Zrf/BhlDhIYuF0yOO0k+C43TPJVQ/9hGSbrOug0gVa6g2AOrhS3sNxOzuxyQc
         9+apWGsHRfdr6ZBCp9XwhF8YgmOnOkVHdehzukOrAiBFag6P/fnB3vaOP9E8gCV5MUUQ
         MiTmlcBJwcgmE7i/Uv06bg1tjd+CIavQY79jQwqcJzVG9acy6zaj484ULNOdSj7Xy4EE
         ugL0N7OHhNyQ8ZR1rDmDBC7SXneqdl3wkU/Y7aaPpYQlg0X34EuB8QEyeXx8Z3UFtcQm
         hZ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793296087; x=1793900887;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HaforV2IeP0NmgJIChxLqIjhpAm5azYdHH9oA6zE+e0=;
        b=wkFlHqByz9TZVyqLLzZ09qkyu/Or894geeggvkX9iZtaxS9AUCt3gEzvXfcUCxEPF+
         6sUEW6dTandV/iXIBsZZJ37kH9bjfKfOYubpWyol9e4io2Mr1VsHKWuylaS78BAj5sMR
         9wjl0klJcehAjc0m77rHU88Btf/SjoPUe7009jQ4rxtv4HO32jHLvOXIi3J+zx+WGfBU
         u632tkSdSO7MfSw+yEeUu7IDjj5jUaqbGg/cEO3i1iNS5KmnYT43oHEuKNCn7qkyLtQ1
         rel5iSsNzr1+0E17EuMylNmCbvvdSzXHnZB3QV/72VO0HwvlgonMM+6PTRmHlKTvKGEp
         a2IA==
X-Forwarded-Encrypted: i=1; AKwUvBxR3cD61yMZIQWVZWO7BXdz4RhvWuSQ39wZ3TUdKQXfxkCqsR8f1dOlqi9Ah2HMTM6Mi+5gN3A+n1iRmZE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIeoSlxoyJZL6n+uq78l3pPx2f6SVPJDS2sMXs7giQS/EA9Kun7
	wFtvw2llQ36f6f0UQuwdPFw8XoZIPwACHVJbhzvZgk/etMR+CYRrSnOX
X-Gm-Gg: AYBFou1UoMZCN4Mb7cG99ek/n71+ToYAg60IgbcYU8hKgvgS1h7EX9kp8WTM8YpG4DV
	l7CbwoXShD0Gi1oaV/CTEftpmVJNcXmolcdNX6OmjE5h1LvUREZTPHypaFBWeJhOjq3/93aIADF
	9RF9Kw5Ib+bKGYLvNJft9XrMOS8VBfGyw8ImTVHmDxt6sLF+okqe/7y7+4jDEkhHiZN1AQaOQ3b
	JJphqiQqvCTdz1Yta3REe8t4nE5sEvxlNuUFlud66O+4OYUV6lwWu4T19/audQ5m03JqdO0WRLp
	g2vnunkk/sH6icX3TERXiSiZTu/F+De3uCoaqqF3MsPCD0OkOf5hY8IGMpEQ0xfMe+bndJo31DD
	6TCGE4+GSNP6s1o3goUQprUrTOrspc25UxRlzIe4iAVKz2gN89W5RLWMZ7LNPno3nSn7YQ6hk5w
	qJ0fco85GQuvi9oI+LCPGGFklRZYc/5ltu1NnjQxcoaaMjqrsEekeI8qvmgtDSMwBKTUUD1HhMD
	HhK2uO6IGuhL3kgGb8uSghjmHDlEvHSLWfIWR63YoScqIvCuOfE5utuegxIaKKpKOJ7sykY3WHU
	OlIkL6TE3j6MngUTFObA/gfFNwHeMW+f95G/jN2eRA==
X-Received: by 2002:a05:620a:44c2:b0:93b:e578:583d with SMTP id af79cd13be357-94408aa1416mr958437485a.21.1793296087475;
        Thu, 29 Oct 2026 10:48:07 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-944210e6a20sm4958285a.4.2026.10.29.10.48.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 10:48:05 -0700 (PDT)
Message-ID: <9921a8c1-ee84-4886-a96d-6a38f36ae46f@gmail.com>
Date: Thu, 29 Oct 2026 10:48:01 -0700
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
Subject: Re: [PATCH 7.3 00/38] 7.3.1-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 sudipm.mukherjee@gmail.com, rwarsow@gmx.de, conor@kernel.org,
 hargar@microsoft.com, broonie@kernel.org, achill@achill.org,
 sr@sladewatkins.com
References: <20261028165940.394092994@linuxfoundation.org>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20261028165940.394092994@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/28/26 09:59, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 7.3.1 release.
> There are 38 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Fri, 30 Oct 2026 16:59:22 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v7.x/stable-review/patch-7.3.1-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-7.3.y
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
