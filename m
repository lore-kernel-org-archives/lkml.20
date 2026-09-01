Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F729480DF0
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 16:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788281307; cv=none; b=ky/i0LT8x9cghRID7+/UDV0DiKSx6LSup2sn7lXqlBwMjjzjJ+chFUWJhd4CO0QJpNGt0Bdemch6x9GZNcgxZttTcs/brVexmuCn9mA9wwvv3hQ6yvpr8P7wkAtbtvyxemOKACIfTBdEsqf7ijx18OTGG9U1AWQKp4NlnozPyQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788281307; c=relaxed/simple;
	bh=JeGytasmUNGTaKI+3mZYgM4wqPhUfUAP9Icaw+YJT+k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fwmFnf1sNyui9BgxWoSpHH+xsV99TR2q52PmOCFqGm283qDKOo/6DISRWFduSLTlOB4ewMMM2OUDuUqp2QtfcXxliWA65GT4wquTKS7uwt57WtM/pgKRegjKKSpfbupo7mxk3jTsUZzFwVb+9Tdy00fCymToh53cxFr/IbU0QAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=fgC5NkKl; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="fgC5NkKl"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-451a49abd8aso57301fac.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 09:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1788281304; x=1788886104; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hb3+Ewt44paEl8bqLWI/Gy1DpMzHCMRbvB3O6WVB5fg=;
        b=fgC5NkKl0n2Acjp1iSV+LYMvjweXwR49RVD5MJPt4xaqq8LopqAms1ZnW1byXbdAnM
         2qYrvv7NhvWmbFtu9FH7DV6dBEmip9Rt3NxwRmGtRbkVlU226O1eZNki96vk70T8hx/9
         1XyDrsMDFP7mOqlSozVA574TsOqE0Z+63iYjc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788281304; x=1788886104;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hb3+Ewt44paEl8bqLWI/Gy1DpMzHCMRbvB3O6WVB5fg=;
        b=EXeYydZBmqd+gcp+hKweevsFmf5fRlTzVAQsJp1fC5arvJDtJs9niKb53vBX0uhTKZ
         MYM4LzVjc/2e0XxEoFe/ayVo04njDoRj4f6IzXqwfAIF6zexA7r8GsDojAxYbkovKyjg
         Q4Y1FkRXg9GK+SoOWZY6IsaCdqJ0qTEdvY9dKMlftHEviKOW13f0vOt25N+mEI3l+mnT
         e8pcaN8xspFOOSyUIKAjr8OUwRbg//7PVQicOt3ocFSEcknmwWk3ZRaUzmkbplVKodUO
         lecFxFgn1WJ6HP1N+e+VkEVkS3TXcY5g+QYgd8o0a4wu3GDdIlerEs5DT+xS0q3k6J+s
         mvwQ==
X-Forwarded-Encrypted: i=1; AHgh+RrN1khvPdVYq7uL0mBxYm/GHaped8QTFXYIqcZ6mhKJ+O+BJ0RF4yiZHn2MqLyXq5R9kgkT0Aph20nnakk=@vger.kernel.org
X-Gm-Message-State: AFuF++l8g70z94IxifKjqbG3Da+3Pwf+UAIdR2u4RPl6jBHCQ1zsUpHX
	Eg5Xmxp6zkTcnHiObLUtXcErLCGLxV8vMI8uaCkwLKn0kUnJ0iqaOCEwDVqkv83ihkU=
X-Gm-Gg: AR+sD12MEA34E7DNsAgZljyVXwMypXfq1f0oGEMIAKfO+FApIBEAV6Wh0Iz2V06gdrM
	LuoQ15y2enyA7zu3ZfU21sxpRUTxBojLLTK0CgsfI0i55XETEwFJm66Xben0WySXBfdvwyNtRLe
	Cjm3NSisSJ7qtWL7N/sf+yyN8u3QJmBHB6KDFWUyMA42y7Jc+YLcthOzZ2shVE1ZwtRBmNiEwwB
	Ll13nyiB8W/f4NYoyruaR08lXCrukiyP7fj5OfF1axwe2bUYnW7RKHlFFpfXBevbGbOL9zhGtvW
	Bb1OfAaG9FgqCe+GIGhyBNCMKNOwgvvptmJH3C2dOQUkWpKlC1wWljCXao12smZk/icUjF8auxO
	2abKKIsBsmYspDbq5AObIJWK8H6X78WBNEycG4JQ8FDbzrY28s1IOvH5pol4r8PwVugoLqxsoWw
	dmHFT8wLnpWAmUGxRmO8f+txkOzaXTLOg/PkFVmNmLAFJnDETP5O/bEOTzGkx7D5h41opc
X-Received: by 2002:a05:6820:238d:b0:6b0:ae64:b307 with SMTP id 006d021491bc7-6b1c65ac8cemr28242161eaf.10.1788281304099;
        Tue, 01 Sep 2026 09:48:24 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b40ba66da2sm430827eaf.1.2026.09.01.09.48.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 09:48:23 -0700 (PDT)
Message-ID: <93b07835-808b-4a84-b253-bf2b10a8d00f@linuxfoundation.org>
Date: Tue, 1 Sep 2026 10:48:21 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5.10 00/43] 5.10.269-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20260831133358.571886287@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260831133358.571886287@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/31/26 07:35, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 5.10.269 release.
> There are 43 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Wed, 02 Sep 2026 13:32:19 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.10.269-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.10.y
> and the diffstat can be found below.
> 
> thanks,
> 
> greg k-h
> 

Compiled on my test system. No build regressions.
Tested-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah
