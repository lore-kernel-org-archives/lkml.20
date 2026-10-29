Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793288963;
	b=OH5OVVSSxUYd4skiGXHwJEAT02xAQ6rFCPwRrUlNz8F9vwbrjHv+a5AQTv09RUyrOz+x
	 GQfXxXDf4dYRnTOQ49SM+AXo8HDX2EVbG7LLVLVBorveB8XclAulKzBW7YmlHSdcsBV96
	 7EBVrSFKsPIByP4ptkIeU8LyDhdgEd/2dXJgIBGhnkEsLOHcvS+HSBuOULKIDi/ph+pZs
	 hLD6JrfTLsMWFeRQUsbUHe90zK7zoEpQJBhx/G1NxgubEYjBkiNU1ZfGmNj4c/Kaxs0Dc
	 rk7MK0jHxNVSDmuPBb2gCtX3Y95gy8wVlYSHKOOv820ZkxYFU6nZHdSf5wk6vvq5R9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793288963;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=1mYqy5pFZp/YjwQ418cYL4aRVqdhlhILAmwm+pURJOo=;
	b=ib89xt/r9o/cbthYg98usSiLCAOd6iywojqnCCox4LOfjCJa2fYpL/GKwSiNq5lvTfvx
	 si4WZWFhrR9ObvYbmaWdoffnDIOJPxpDzGb5hYYoZ7J/kcYQUg2x4HQoJ293jxA21lsBT
	 tWddYDmUCX87yOr0CUhH9OrxiHyZYZhvcrMs2i4mP+ynqlntsytVN6b7H2clTEhdflhPA
	 r+G1V+KM7LmXGZ+fImT5BIZ+4teTBeEL0GdAKsLC2P99G7+SAFyoFYcr24f25Eo0jfAxj
	 FDYX5Mrs9XFmtRrOpkFc8BbGxuMM4d43k/lPmmhCpWjCBRSNKvxgEtplJ7AWz/xZ0Zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=VWaImjhn;
	arc=none smtp.remote-ip=209.85.222.176
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C212B606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:49:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C212B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=VWaImjhn
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-93e515769d3so196555985a.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1793288961; x=1793893761; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1mYqy5pFZp/YjwQ418cYL4aRVqdhlhILAmwm+pURJOo=;
        b=VWaImjhnVBNEbB6kSI/8OwmBW8LVjOuB7IKDleICrC/UtwM8Rlp1NLjZajzwo0d9I8
         CKszUOJsoD0/CjgTC68fv61ht4uAGN+zxvnmUx+bB++ItR7gYG3JSWCXT1414IDaHyMp
         9uy715MnFj3mwG5vwy1K5Ma9Vk+lhLjV50tE0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793288961; x=1793893761;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1mYqy5pFZp/YjwQ418cYL4aRVqdhlhILAmwm+pURJOo=;
        b=t15bWkUofs1OINZmo4vX7B3znprGFNhyVUGoc0/qo4eBF0M7JR786KUvOsXBHovd4U
         UCrflithEXDdW4CMWca88gDLDKsCkaq6UjWVsHSqcolrmDcPYTq8LQCAiXWTQJHxjzBX
         L4eBZyRnE20fI59EzZu/YHwWkBiI9rzOeNzf/DWyEu49Ujj4pK/610mHvYkJs8LEV+qD
         zJEztN0kKfqeUfQTkR+qaB6zD/m2LjrEW9VzgFJxUWSJgzEz3QdHEahVYUIB92qesfAv
         qF/aSGcfar57IbSL5Dm2ndZNP9748bhaiybT7Fh5ZBwCP9kDxGQX4QR2zDVkMoPjgl44
         jKCg==
X-Forwarded-Encrypted: i=1; AKwUvBx6Rqsj//nHe42ViRNwV/NwEOLKV+Mkmc3GKHxuROv8qaSCEdfSFsjzYJhnvodWJ0mps/6Yf4mIKRug0J4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJxNQNNPSO9ge5hqBXFz8xO2PZL+ZQYsPmQV7gpboc/c9fjuDRz
	1P756Sjya53HsNiQYep6gZfjx9sFYTjhrjHSEzTpFHHrXRPipqMoCyG4D52qAEqD1Yk=
X-Gm-Gg: AYBFou1DWATF/qvhephNaA1ZuvDhnnsyXSkDGQxrXAffu3CvstbGz8YLSMHw4wESzcK
	YBOL7IRnJA4XTJFcyEsSHfIfbUvOeXpDdkikejF2LjGbezFBldZ6o26rOiUW7NndZIBnzCn0lWP
	BLRQTJvStKtKtkyjehAFZbYUv3vr6pJENSV9blILa51crhPoCviG63D8You7QjX3eiNKKwd/3z1
	6TQnQsViHj/uK3/MuSvvlzzmitbyZANgqPO/uvqz29qDT1LbXkWq7cNn+kS7divQ7Fxf9p2zpq4
	x6fC/0tat3lEFAjRMiOhmzHWfE7omPVcGRPyGrgoiVJPvGtPTSvFtkxr5zVGM9PNwWTbqOuVq6A
	mfUZfWPPUE//rjj/SNwdmwOzLAOCEPMFT7v97cFDY5xnC6cL2DSdeNTUGt4QfXxmqAuQF7qzR6p
	tkpx52SSlI5be1L2YWZo/ZWfTzmUKoEcK3HNOh0Wwh1sCtD/qDnXITxzT/OftJAJq0DXKjD+qLL
	ub7ijehgjrw35y9YrQNGDxXhlxnqmdsu0W8nYpv2liaRdjkXzrhB6fXMdnpsmuLuDFUD0Zc0c7G
	4jfKcDsYznlqDuY8OSuAcNCxOzu6+XnsxQGdAdY=
X-Received: by 2002:a05:620a:199e:b0:93c:2c0e:7ac with SMTP id af79cd13be357-94408cdab55mr843373785a.53.1793288960558;
        Thu, 29 Oct 2026 08:49:20 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-940f078a762sm1564046785a.30.2026.10.29.08.49.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 08:49:19 -0700 (PDT)
Message-ID: <e121743b-c589-47b9-8f01-0fcf0d70ca10@linuxfoundation.org>
Date: Thu, 29 Oct 2026 09:49:14 -0600
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
Subject: Re: [PATCH 5.10 000/516] 5.10.273-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20261028170003.522232767@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20261028170003.522232767@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/28/26 10:52, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 5.10.273 release.
> There are 516 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Fri, 30 Oct 2026 16:59:22 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.10.273-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.10.y
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

