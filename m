Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794599380;
	b=m5e82nr8aBXp52ezaRZOMKJWbEGZtMh8/yMpKlMBPLNl2GKU+28FjiARz5qxlyQESFiF
	 lMTmIGeWWJuFgDDR2gXs6M07ZZEuOYE3SVlIUuc9wO4+wIh90aBd0jx12yu6Sm1oRh2+X
	 TQ8ZorLBE/W8xPImAUUPtZz7TOEfLfS/GFsfHIcNFAfN3pJ01YQyKyhD2uIuTWXR06HGw
	 4GPFIDrMhUJQpGRoSlIryZzh97wsUHIsdGRZxYPrRWY2I+Je4wdwrqVMxhrS3TRUa1iBO
	 GTOfvVVHNI8h5DGTactF6gqytYzclY+NzZLLtfjLfO7/zAzmAYVzIT9C7QW9KRBozFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794599380;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=J4rSsefiHQznT/qIvnLX1QXXlawJ9C84nNyE3ha35so=;
	b=dLzkhyZbfenGTKA9BZK8LIKaafB/m1jvuQ4zmV44oTupAUgluHMndCxTYtgc2B1ihmqB
	 DX/PWCc0vabFA/PSVsJrevUKhhrp7KOKaejyaSsYRBpldL8eeXc5DkLBLoIOtlpXhy1o4
	 Z/Qd+uMwqZobyOY/EgZMFxr7lj7Dme5MZDuCzCVWs3S0goEBTV215NOnhQNjx0y5UBUPG
	 Ml4Uql0uNHQjT4/BcrBhYy9relP0daZF4r7G8lUmZOIQs/+CnNRJmUSVhjh9RJMOGe025
	 r3NkKP1uxF3RQP7xyMLnejwehAA2ZyrWmk0/3KY+cnxj6Iexf3vuqRns7aV1LTvoeIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BiPi2msi;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5DC8606A32E
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:49:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5DC8606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BiPi2msi
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-14394530ec6so1736557c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:49:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794599378; x=1795204178; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J4rSsefiHQznT/qIvnLX1QXXlawJ9C84nNyE3ha35so=;
        b=BiPi2msiAb9hBfkpf2tAXQ/EvMpMhbRkURMVn/mJYjGnrmnZ6zVaArGZVMPg0CXMTU
         ue5ep2OCxl8GL1/gtlsXXbhb4zcqkS5Po6Z55Ca6ZxwMhxkxzTHorhV87pdH44fB/zQw
         purbpyGZph2AmiAj9fDo+kmiN3adXT0FdkYpOVJ9utfyS17HrH+EY343jp6zU2UqkvwN
         51fadC7tOzUOLvOLxzMgOriw46G3fBcebrSSlflSp/q1uqA5jv4eb0DZKTqZJa6oisqq
         kcB+ZWEW1FPCzDRI1WRedUhE97eAODoFkqL9npxCh0mXgKgHEetajS4airB03f1d2qpE
         zO2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794599378; x=1795204178;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J4rSsefiHQznT/qIvnLX1QXXlawJ9C84nNyE3ha35so=;
        b=NoXSHnlV7j+yuNYztKdZhQNozsLkc+o2JiLfIPdgT4Tj9EM+RHn6ebKRk0am960Bmx
         psqT1XTUD6ZPQOlDrmCXZrhKYp0OsXC/ET/HpxbK9YARBbNkh7gD1eSATN8z6XEOKPm5
         YjrUU4xkEoccqMJBuQSFtINWbm8VuIXWsZNvWNKGyjvVrlXIHjMWhxMqo0DdlOZNt6lJ
         9vfCpXf3/GEtk3RLJgZhBaWSTE/FECg8ADMtqDkU7Vxh8Xd/ZqZdD71RkkFSYv30BAO/
         ixykNB3HYl+a1IXRDEpHUgn7xDEO1H6vHxUouJIXRJ/M9XZPSO8TeSlEFjcmXU/XmM4O
         hJpA==
X-Forwarded-Encrypted: i=1; AL+hErEdfIyDg5y8wQ7YmRsUxgrTX1iGpygCG+Z1jkGOsupZT4j952HY1H81o18QmCvZSz+sEKLMDVgcbVOdLss=@vger.kernel.org
X-Gm-Message-State: APuU4Z/PQ2LpKKZwagk7sBgguP5w2v7VcmfPJ4NVJ6eyMIX/QTzn89OC
	vo830tsJ3AvbWqkZeclBbZ3DlxMvMn6A9oKsafZk0Ql4NePRpEbk5eJe
X-Gm-Gg: AYBFou14ASR+qhnRvKVcXPjM1oQJerxDNcFbJ2WEO9nuCSbOVQUElM0zzgPVTxRL2x+
	YDiGWh3NCDM9trDpkz56Z+i8bOUaTraE02Z1XtmWB1C1CkQffXK+PZpo5zqseptKD5aL55MRizJ
	Y7x5pks+aAGjmAD9rO4JoNHor62nyvH2al3W0akhQaXoPMHOc80CGXtV8PPpZ550TRGKaLRqPy8
	rMo6sqHmeIO1Z4sZYVBTTFvCpnVEpXV/8EzPzMHoZbNns6DtmBu6wsnpcOxUaEFl9WLg4oW7MS0
	SjQdCpDAByphsIbjxngyzOkdsR6E5U4d6qJrgOeD9laYErI1pWvmHB6Ybl9+TeWHEdbf9aRmT92
	wov5tBjGr/FMI4y9yrftgp5QHSqTHi9zdvxp2nPlI9aFxj8TR8KaIe320yu4dqxtoSo+9ggkY38
	apBBPqotDFXSA3YbAF3r/iOuZtX22oLePkG0f2JQwrgpRRZk9LMEKf0COnCK1KyBymjltAsrn6C
	zf24Qfe9+pNLlULTqzcAMjBFj76cC4/t+RJdur20lqdqHgy9wge47fgLexfI/JcAyDiu0us1Uek
	q0izugi53jeSAoC3FGO2pnzjs0L8qab5RP6jId12M3GP8z2XNKRCF5Je
X-Received: by 2002:a05:7022:1205:b0:138:30b1:4c00 with SMTP id a92af1059eb24-1b5030681c1mr3144140c88.3.1794599377651;
        Fri, 13 Nov 2026 11:49:37 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50316d9c2sm8290085c88.7.2026.11.13.11.49.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 11:49:36 -0800 (PST)
Message-ID: <79c5c501-9619-4d8b-8f95-c4e364331db4@gmail.com>
Date: Fri, 13 Nov 2026 11:49:34 -0800
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
Subject: Re: [PATCH 6.18 000/686] 6.18.64-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 sudipm.mukherjee@gmail.com, rwarsow@gmx.de, conor@kernel.org,
 hargar@microsoft.com, broonie@kernel.org, achill@achill.org,
 sr@sladewatkins.com
References: <20261113153820.902362109@linuxfoundation.org>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20261113153820.902362109@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/26 07:42, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.18.64 release.
> There are 686 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Sun, 15 Nov 2026 15:36:17 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.18.64-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.18.y
> and the diffstat can be found below.
> 
> thanks,
> 
> greg k-h

On ARCH_BRCMSTB using 32-bit and 64-bit ARM kernels, build tested on 
BMIPS_GENERIC:

Tested-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
