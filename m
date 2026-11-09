Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794252270;
	b=3kRGMhsRSeEQvDZSsZejBpgZ0UbNVAIKmo4ZnXfgf9iBJwIXlnru70JR8R5rfkylyecM
	 LZHl082AGvnwMEd2Ka8RDmVvbdl1qGxkLeYGdhEhNFOR3krSFPd3lqtnyoV7Zfc380EkY
	 oAk+HQ9RxKUuKOk/TV0jwLVWHWaJtdsD+r7/WLRDcfwc+UpMAFD1R/neJT3wJ2/9hqI+G
	 89xCamZrHD48K8p0oIp1IEEhVoAHZjdaoEKpZr1nmCgNgwF+pclXwy3/5Uhvlm4jg+fLr
	 oJdsU8ZY4ZN8sXpHZFOIqwyeRhpshcTdBjevG59VcAOLh3SrHzv+14noJ34he0jy6BQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794252270;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=iNVyoaT8eOK1CmL3RYnHrqcQrx2W93eTgrazTaJ/OGk=;
	b=T76NvIC/b7uCVYGkHDxZCGwuXUO5bccN6CECJ9AqL4WLeQpvQ0FVP0SPTI6NCIe19t1m
	 ntl2atfs5Zf7ya+I9+L7rXDq+F2pD7sQEEb8UJo7cOmTQxKHvE5sCruE5Sn+L6B/nIevt
	 WRAARD+mDca7hltSmkaFasCqxfIDnhAz2CdMTs2U/2YYF44cieTLZftKlaGhOoYBe/jiC
	 fczAssF2TPaJjEiv+p8I2DNuExg2Jk2ItQ5cSUO3PCOQnW+f7IchIaULmmsH9zHyLOiYD
	 ZF/C0y5hm/Bqmmv2Aq8enDu+2PCZbh0iQuQXCfuWgD3wK1ndctPlmkZfte+NNBYMdYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i2YqSEmG;
	arc=none smtp.remote-ip=209.85.222.173
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D80F60A2603
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 19:24:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D80F60A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i2YqSEmG
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-93cc1ab5f6cso152398085a.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 11:24:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794252269; x=1794857069; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iNVyoaT8eOK1CmL3RYnHrqcQrx2W93eTgrazTaJ/OGk=;
        b=i2YqSEmGhiUgGCF1XKwbpkQT1UEQbidnL4mxV0S+0NzfyECkuvTGYYhppHzmBPSGXa
         06Ki0yVtX4umRmehs39A406GKW67TaR7zCLo1XaD74+wpXsqbVdhXnJ0VfU9HwXQejKJ
         9GwduBtaM+hZwCWEkK0hJoQ6HsIn59p4+QsFKH3jGbnKa4O3R2rY0oUQjxxcNDA352x5
         PEiE+t1VRsB65mmqKrx2LfJG3gSlFKwen3+FGLhzG6i7nd5LtX9s9vV4LnI+br5PTwb+
         E8ghXa9kQcNIVlepGiA4hT8n3Z8WRaJuSxxJE/cKns8mHxZkPYIbMyjE0e0NJG41Hbb9
         qa8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794252269; x=1794857069;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iNVyoaT8eOK1CmL3RYnHrqcQrx2W93eTgrazTaJ/OGk=;
        b=ieizh1FHqqbZayTIRLo8yX03ig9ZEFQwg+enTt3EREtf5S0+IvcxHVi2IHvkll71lK
         +oog21rHkAZiGmyuYNgEeXb/JpU3hDKSejqBLi9mh49hZghLI576HO9LZsBkGPrxWG5P
         XgqON2Qg1HItRM0VZRnw6MZfC7d7846mZ9dpkQ1E4KAcFWgeQbwtJ0fPsDMoBLgHHmAS
         0LLW4CTiZbjfB6XHB08lo+UZ8/yzVJjhBOR9nMUHhyVc8fkBJ0iP+KrUv+OhU+87Ctvu
         LJUZSinzbp6TI1CSgqf4t7NLCK294IARny5Rp2rT76PvorfaAYIxwNww/v4B/HYGli+K
         sP/w==
X-Forwarded-Encrypted: i=1; AL+hErGCriwDU4GE3poeTobpLau3t5wPV49TuX/4oSOTArxAiVZfmqHtZ0sd5J5MTMx+FBcB5tyOY45ouQl9/fA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8NmZDCNGHsYfdOKX9I5yCJ5woC7SndpOdMaEsYMjaVaXjZprFO
	qaXoUih4xztdg1rCaLcIZFQS5pnYVmgOAyxCdjq9zTw1VjOvfLlvWUd2
X-Gm-Gg: AYBFou1jX6P8XUqwpVLXrCYP0hNHE+JhBqu/AxKRDoM9kQHxcZVAaln3UbB8KPw9PBl
	5vr/Uwz/x8MMxdDsYabrvEDWgdjMJLsIyEy+P50W44x5rG6Xff+kb3gq7/zTqFGv4QjECnBkaMp
	ajzJOgGcim4+lH/wgE6hoDr/Js5H+2UOYYSAYF+RmlbZj8cJOL6OIAfUGwBlu2Xhtl4aqHkBaV1
	+W7H5fPVlTbnK2hsWg/F8SfXrG8EEMoJFEM9MdsbrS9HneCdR91KyUI+bKzuTsloQBkttTKrIXi
	qEuzMJTYsTZrKGLAWN204prHpued+vIcmN2ETD8a35BYbzcilixIxIr0PwRUx8YygmtAjv6f3EL
	4vHoo31XL5ANrpXuAWHywFbWpl5aJoPhoSWpQUzEI9EwjWxvfSU7jIudOD7QGYOb0ByUtmTl/xC
	IbaI9/BRaQrdD6Ga1HNCgYqtHLBFQubD3hyYnDnnaXASZFr3fsN6JH6biKvvqdi1OrJoYvGWRRu
	kUy0TCku9y4JAwEwam2CXFOwLyn+gq3Mf2r9vejxXK0emfAiyR6grsropbnQrpku+5SzoXMty+N
	jx4uZaNIFqCR49HZJVFc840iC0FEt/o4VGM6M+Jxe8yFqOvogLO57T0=
X-Received: by 2002:a05:620a:4712:b0:93e:646c:9133 with SMTP id af79cd13be357-9479f3934bcmr75883385a.64.1794252269384;
        Mon, 09 Nov 2026 11:24:29 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e73c9absm45460285a.8.2026.11.09.11.24.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 11:24:28 -0800 (PST)
Message-ID: <ecd48372-c802-4ffb-842d-73c689bca64e@gmail.com>
Date: Mon, 9 Nov 2026 11:24:25 -0800
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
Subject: Re: [PATCH 6.12 0000/1536] 6.12.117-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 sudipm.mukherjee@gmail.com, rwarsow@gmx.de, conor@kernel.org,
 hargar@microsoft.com, broonie@kernel.org, achill@achill.org,
 sr@sladewatkins.com
References: <20261107134957.653319350@linuxfoundation.org>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20261107134957.653319350@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/7/26 05:33, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.12.117 release.
> There are 1536 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Mon, 09 Nov 2026 13:46:08 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.12.117-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.12.y
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
