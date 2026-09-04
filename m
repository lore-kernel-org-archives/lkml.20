Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E12152ED30
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 21:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788556246; cv=none; b=Q5w5W0lEDOWSBBy0AULpvK2JqTtEkKzyHAhIMewi9FVXRmDevjuYcyfdnSfGuCHs/ENEqUJmQOjcTbFP5Ww7nO7hf2FHf80S/j1X6oXl19eNH6K+XGGx1g7ItSpO5NctZjjMokMhEiuTahc2M9+KTN7UtWBn7RsyDtL3lCeF8YM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788556246; c=relaxed/simple;
	bh=AIzN88yObhLJ7zH0xiBeiavZN8KhADkVakFvDUmpWMA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hpuzQaGq6yYn3cmHELrhuGeuzaYHuyeqB5vL5le5wN8ao5I0z4qisPvBMBJn1BI0l0/NvyjDXCSOy3eahX7HxvwFtOZJT9CZNKMnxkB7h4mWnaKn2tlVGwCRnPwvKSonczqu3jw/qM0zfUSPxM6CL93vzl8ySuUxAfRvSMBli1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=JXO9wsxp; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="JXO9wsxp"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-6b3671a1b20so1012278eaf.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 14:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1788556241; x=1789161041; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zZQ3f33CzKvQ9e9UVdtviBIiGT2nRTtAw71SUlTm2xw=;
        b=JXO9wsxp4fbZlJSu6V6k8HKdWVc2vK/PkMYCre+zETrnBZI5e5SUo2eYV/7G+hdGAG
         Lrf1aAp/DBA/9RTF7SrNboYCafDzyORLo0aJKOeoWaqUYa4Ckz2DSTjKw9BXAGadYobQ
         qLMmEC8jhPMMoYfwDUijLOsX59gciuG6l/kxA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788556241; x=1789161041;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zZQ3f33CzKvQ9e9UVdtviBIiGT2nRTtAw71SUlTm2xw=;
        b=TMe3PTarHUrMv7mNCxplSrBnj9MdGsWIcxv/YucJny4oI8816vRC9MAjHUvOBCihO5
         27CoLWHyUN7rOpO6nAkL/fS1LMGK00mbuf+Yi1nKSABNKPc+HrV44O+n7wvgHkPoYIyU
         HQCtVzj4U2Cia1E99gp/RghrS/RW8+0lxzslg/CVmhU3qfrJENkTovvoz2jQBzDNMfvH
         ttZdo065ON2jC8xzcFUX5hGEX7/e2je/0nPH/QBTKA7ArnXLWlUoIdmfEs3KGEi/0eAW
         2Sr4cJH1v/C6qtUnv7i24lVUfQsqiSzo8WTQaDgNw661sNts90SUEWz0mNEIhhLuN7He
         59Ag==
X-Forwarded-Encrypted: i=1; AKwUvBy9Syz+yEGClZeOU4k/9B1znvPrK3hOJlTzOr8EXsizKYpXfFv7li533phcjH5pAuEWDFOnHJbjpJut/Cc=@vger.kernel.org
X-Gm-Message-State: AFuF++nuSRzpn/dcfAR/44muxPlX3GGrWsM6ciq0IJNNbsXwCO8A0g5t
	KvaGVVXarf9eN6oqRfiVE3Iogp5Fg0TzxLGO6exaaJKvhsEK++WQsoUgvtZUsBEWemc=
X-Gm-Gg: AYBFou303V8tsICqf0MmV//HJDkbxSY3wVvNgVvTce+RPDdT+6ZGK47gRN/DH3KdYh0
	c4QcftM0XsBymmcc/S1BhtOgBTDjJPqmzSvDaMvdg7wkZinCUu4VdHk7fM//nUMBG7guZtos2jX
	xQK5DjqWguyI8CKApC5Tq1+OXToa3jw/UVUK8H+YKPb8yBbsw/ki/XAE9/YfSbJBo21dAhsce8J
	jrs41Nsv+sT4kdLtg/rZ+cRzyci/+hU9Yx7mp/3101l/ylFr2K8e7eUmHbVnVStMlXqa7uMyt/b
	l2+RchC+PmqOcLTf6DrGiy6ZQuQwzbY7b6pMhL1x1EqVa6GF8sgtBW0MV+PlqUxU64eyvBhOnim
	B5GBoC6Oc6rrGIHa5eUm1iMhJtIVLLZ6fi0vfz89DE/07fIsr14tAXG6v7JHh+/8iubnR+hF45U
	2eTlPMnXlGxukvS2dT7TOZskXWEGFi35sf2Y5bBkGE3knMg8oRe1vkvLT0HrYxq9H/LR9S
X-Received: by 2002:a05:6820:168f:b0:6b0:4199:3cc4 with SMTP id 006d021491bc7-6b6fea84e5dmr6631267eaf.27.1788556241315;
        Fri, 04 Sep 2026 14:10:41 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b6dcb85a61sm4575639eaf.8.2026.09.04.14.10.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 14:10:40 -0700 (PDT)
Message-ID: <6372cf4c-3bb7-48c9-81c5-cb828a1b2bf0@linuxfoundation.org>
Date: Fri, 4 Sep 2026 15:10:36 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.18 000/552] 6.18.50-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20260904045747.813364717@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260904045747.813364717@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/3/26 22:52, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.18.50 release.
> There are 552 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Sun, 06 Sep 2026 04:56:59 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.18.50-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.18.y
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

