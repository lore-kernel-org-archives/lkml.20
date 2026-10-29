Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793287709;
	b=a+MeVND48wblJn/AwCGshXezSOkbaHaBXWIhduIdSj07B8or2Nhcct0i9gSZrkB8U95H
	 nLoGtYZ1k4OdtHvg3PRCNxNLDyoZhUzcfFdGWNVbiC7CGmMF7PteSPo1P/2GFj3uDEC3Y
	 1j0uvgpjHnrTKYqujPQAvgHbNs8pwBudG2vL+gPoThbOXEREM6uJMZuo5OsFALjPOMAwP
	 2oIGZkv4aQiJNyxYCfz7GwE2rPd4Isq4veiRSGj4jNg6my/Vms643Aivy0Ae3516q3SQP
	 uH7UMLjIhq6/ejHgxoPls4f2UL9yvhwX6LEKlEnp4VQEzpb9cIQgJdQc5syL5d82ffg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793287709;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=yZTE4OyXfMuvSFj9u4UbsZSTrlYFDczLFmxLInU5s4g=;
	b=LDDL1/o8SY7ecwKXv82DU1yxdFOSqxuO/nIt7uPCfcV4FllFmYjVAX2kNxeg6N5i1euW
	 M2dAEZrf1ytv3+i1ZwGGp2R/uADhR3/QEN8Bdzp/ZEYRuug/+Na5tH5BUyrdhcMRkeJuz
	 JjXWgc2Z4syg05aV4vq+dzUDDWxPBjN160O1wQ4ziztcolrjRqIgSkMrD+i7Yhu5Hl4XQ
	 XBhqRUA3UzbAgPF/Sj0sKWCA6PuC75lHqN3hVJNrNqEKq7otzYR6WasPhkCZnHMQFE1QQ
	 cVd8GqEILyNZOAN2Fbmi5+hav1btd4pOSFoZw0E5xRon24+uTSo4KdeuLewdEvFThmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=TTXhoTzg;
	arc=none smtp.remote-ip=209.85.210.54
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1AE606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:28:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B1AE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=TTXhoTzg
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-843ea301d60so1575524a34.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1793287706; x=1793892506; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yZTE4OyXfMuvSFj9u4UbsZSTrlYFDczLFmxLInU5s4g=;
        b=TTXhoTzgbadNcSaonXWqQF5fezqBgmOZg+URLV1aOo/G93jXRxEYqIayW3y/pjiLpq
         Gy+P9SgVHj6qs4wtajtDVUhLHB2GNX2WaBLhctqfmnbsHtr97aR9pNSl1+6dUiUFDiBE
         L1NluUHoEwshsGLwXzvPlVr1VLVMAI2FPRe8c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793287706; x=1793892506;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yZTE4OyXfMuvSFj9u4UbsZSTrlYFDczLFmxLInU5s4g=;
        b=LqbK61j2YHilvbk9kvyc7z71JIrk5mswRZcrXP/BTz7MUdfVb86ZK8T6XBzZLjPNDo
         R66ejpf+4DPQAXiNdZ9oGnFKJG0csFZAYIqWiRvyTlquBb301bs47HrwAJKjRwy0puAY
         pB2Hzr4Rj8J0Zhf8Re3FwE8ws6wB5ZVHHCbhg1mEWSwaCkGie4sYBqlM5uENB1FOohru
         U+HLRqvU9gzeQjlZ5yBPpAHEuSFi+sDq51MPBhxJnLKg/uDz9IFAkzustyCgpuQgNLkg
         s/t/uEE0Ats9t1UUS+UABkUBi8avQgE4hFjrhMJog65aENKw6E7XZ555E5aULIvyfcQw
         w/Wg==
X-Forwarded-Encrypted: i=1; AKwUvBwAJl04G0KHR9ed33b7CScpexWC1rsri3p1W7I4ml8XPEhXjLJ/9fOlbwcsGLkT7wXuDYUJ07SA5L7OPg0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKvo7/oyMtJ3kMNoJmg6DGzZEO/ar1PBc/1FBZXc8QqjnhM2FJu
	ikg8wAbR3uiJs5yw8Wna6Fpcavx6XccBSNj2bG/T9+La/lYSsAPY/UUbwkTpeOVc1BE=
X-Gm-Gg: AYBFou0DtEUXStQ3IijFS32VryvsG5h9z2JCK1ISTH6qs0uw/Mba9OaRGMMevfnW8AD
	vO47nQhl4TPUHzUZjhTR943FFNpmxRjcdkdNf2AjZ/4VT0FGYEu6pRqePZRwhH6xn0SODL3U4jx
	IN93Yij4sO+UFqwyJEx4lgBChvXsxXazVhdhDSglJrduUs9FmdSoU4pxl0zc/RLinDDA4aFdtL5
	hveGcsnC5cGOIPBbMjFG11x2sb2njZVUihN4HTztQ7sb34j4aPGjYmEuiXk8yi1DpdI+DT5/M3f
	I5YleqeT6jKlRrcpIKsjgEno2m4bO5cST8Vaule0mHdeUqkcuGDni92yg9V7WBBm//u7VdDITVC
	utXtOuN63bwI9S5Hbe+PUWl9rbhUZy2mpAWmZlMDypjkEGVNNecOXxVJ37oXtgfe0/op/eMdZwH
	dFa40fit7Lf30IiNMfuNVvfLbcmdjP0L3YzlMzxwT2AMyDyeRt1Ul88bWNhSX23QO/kfUgRqL5/
	jXvSyihH605C0NE9DPgW329qqkNQnqKNGCNeE1EcwCJtdVUThvwPVunW2dIIlDEfdCwA/zNuTVY
	IX2nA6CKpTya3NZQ1eo94s8vAMl5vnnsG9YGsyQ=
X-Received: by 2002:a05:6830:4411:b0:829:2af1:a07d with SMTP id 46e09a7af769-85abf966b72mr5093393a34.5.1793287706261;
        Thu, 29 Oct 2026 08:28:26 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d33f9bd96sm72469a34.10.2026.10.29.08.28.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 08:28:25 -0700 (PDT)
Message-ID: <8c2197e0-d83b-4089-94e9-7e6cf5a080b2@linuxfoundation.org>
Date: Thu, 29 Oct 2026 09:28:21 -0600
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
Subject: Re: [PATCH 6.6 000/168] 6.6.161-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20261028165943.089486480@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20261028165943.089486480@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/28/26 10:58, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.6.161 release.
> There are 168 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Fri, 30 Oct 2026 16:59:22 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.6.161-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.6.y
> and the diffstat can be found below.
> 
> thanks,
> 
> greg k-h
> 

Compiled and booted on my test system. No dmesg regressions.

Tested-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah
