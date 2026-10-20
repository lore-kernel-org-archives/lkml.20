Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792514576;
	b=Ne6mLW3bFFPduaNmShueMfpjWfrM2HTz3P+KJuwBxuQ0PYwCpUvib95svwINcSWgJhXX
	 xbWxhKhPP5oZTfdYxfrCXEHJrMWIz7rDWLjC+VQrwEzineimZ3tpNGF3p+F0uHxtA900j
	 5+pvE9LCHhBpaWOdBxqnK6np5rNgsiXK8wXY8tExh91ZRMmQXptOArFecI85Pjkt0ciIt
	 UHzJh4vq5cQfAbfIIwzjaUKXCfJ7/uJOdnfBIt6+/0hTUFtouFylnqZg/xJy1pazqzze5
	 tLkvpwd38oPqEhYyUG/fPJLp+pKHizwWf7cWs+z/LDzMCBA8Ph8PY0FdD4iQq+DRBqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792514576;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=+ipB+gpogUeHkQr3iI5OCJjKITatusksUh2DkAn6oNQ=;
	b=hrG09t/5POxUqyPCDlTXitaObrteYpB8l3JMYrbjpJOQyAKTXk7ib5niuJ2OGiZPvHWC
	 QiBo98ceUryul3fGTAhgKegLHXp92qXCT8G3ng4FXyAyuCoGAuRvF9WeBVbaESRoNeAGR
	 FlzcdRDSLHI67IIacHMiTzOJWAAXmxmSDSPKxBdi9h3KvxOL6/Worm5UGaU2PPdMfKQKV
	 haVYfghwA6Wwk0Tj4wLnirJAEEOsJmncbmGw1nsd/k9R3Szz6LiqM9pK4uUElVLSNHJSQ
	 EVTpCk6R6ICth/X6zIwpl/aFWpmXIc17nB2YcTeBb4gk4gQfLOsni/H1Oa8aSx5/7xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ARMHaIT6;
	arc=none smtp.remote-ip=209.85.221.177
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F28C606A330
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 16:42:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F28C606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ARMHaIT6
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5e7834687easo761278e0c.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792514575; x=1793119375; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+ipB+gpogUeHkQr3iI5OCJjKITatusksUh2DkAn6oNQ=;
        b=ARMHaIT6mznQ0BVlAKylcPY67gqiGzx/n8T0xink0OI6nIEfMYgqLhTvDcIC/y+NVf
         LA+0B8oJmfWd7JL1NfmjV5qrBzfeYAA022uwNgbfpdp2y0HP0JSLvNbgPoFc7DDNcNz+
         rXtekQdry577AxSaY/HMJZcfIyF+jNV/O9yvycWEax+Hz/b+2CiAP+cepH3rS422aWqE
         AtNfVFU5imAV170S23iOTN3s5sA0hV+Lambh+mFiG6doW5iuxhBK+OGYXDbEoyv+9Sl7
         I0bKsqep8zgm08xuV8BSWb2du9bfAt1oIINId48p5GGXKUFogRXHWKhX7LZ4f2uQllbw
         v18Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792514575; x=1793119375;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+ipB+gpogUeHkQr3iI5OCJjKITatusksUh2DkAn6oNQ=;
        b=CCSYpRmwC+/8x/jRSJYiAmULh4eeaf8Ek8vHilPiIvnJf7HNplEkD9qaM56bHOvZd6
         my9eoeahgKH9T///5aLSKycajen7z8iGEUfn5w1fE9ySoL+YW+nw7QsdkD1fN7dAl297
         VQCFVgn9fse0fOQPdpP0WpowarDx5gNmLqRcuKY7mJCSbp/mqXmndy+iE8pVyDNP2gfv
         65zKnkDikUNBorHvhs+YMujHUD0uR734gR1wMmlwwB1UyBw5oQ9NirZ9DfS64XLfCBS+
         LhtSJi2YptC/UM/87EllghiPmyD5rJF+h+hl4Ks27g4yqf0A3qGIji+AxcRdmApzBVL4
         nweQ==
X-Forwarded-Encrypted: i=1; AKwUvBzFFrvyS7WD1B+dwzkqHh3yA0Ph4pHyAtNzKkJ30LDINwCZnRTF6Tz89C+opdfUXmOr2L1WRyobClQYG2s=@vger.kernel.org
X-Gm-Message-State: AFq9FYL8WulEKIMiGwUOhn/y/1yPw5ZkU6wd8/2eRvm7KhUKfCWrvPDm
	ihjltc9cePyFJOhBuq+W8SmFOCcGj+CLdwOPanKrs5R3vs5GYF9tQ3AG
X-Gm-Gg: AYBFou2V4kiEXVegUwFP0iRmJrSW3r4/K8aWsz86O7+RF02Vt/5HZf735wwcVl7mkCd
	OUznRk7zS898TmuyJ4mLuWx7xIYRmr9mmtgOoVFc3kCPdw4N4v5NM7Ow7DRKEpIX718Y2uDxO+F
	IKiUAwUpw7L8GatCfFs+lweH1DEKjw3MqYq+Z7zfVloinujRMmErTTB+Qj7jz9gqn4gT8PMEvPy
	2fUUvmhRXoIsynKw4i8cSehGpce266ufzAsnzWBNo35QLnHo3RbLxYm5E3Isk3gKJQCvmflxpl1
	kPiUbjUCTe9xvioQOYr9FJP+2XNm5UHS4yBnSezqrh6sZRY9JPWwbadBhPwOxvtBviHS/qm5CeJ
	oTtZIjc+TLrwpr08ktNqAuc4399KoY6yyo1gG6TPgi7oVZaL7Ydpk/AKW4KfA1LPM0j0kgtMHJC
	VEcuFC2e9QmD30dyTmwEvU/qQpbKdeTJwEP4O/upC5fyMJZQBxGmn0tCmeI5n4OrovthOemZvKx
	eicqINpdF8x7Y6w/aXMUsJ2
X-Received: by 2002:a05:6122:3d10:b0:5ea:c51a:37a1 with SMTP id 71dfb90a1353d-5eac51a3aedmr1843253e0c.8.1792514575062;
        Tue, 20 Oct 2026 09:42:55 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eae97ec3fdsm26291e0c.12.2026.10.20.09.42.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 09:42:54 -0700 (PDT)
Message-ID: <d053ae85-17c9-4bfb-944c-63e4ec77fc56@gmail.com>
Date: Tue, 20 Oct 2026 09:42:51 -0700
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
Subject: Re: [PATCH 6.12 000/858] 6.12.114-rc2 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 sudipm.mukherjee@gmail.com, rwarsow@gmx.de, conor@kernel.org,
 hargar@microsoft.com, broonie@kernel.org, achill@achill.org,
 sr@sladewatkins.com
References: <20261020075246.861837975@linuxfoundation.org>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20261020075246.861837975@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/20/26 00:57, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.12.114 release.
> There are 858 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Thu, 22 Oct 2026 07:51:15 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.12.114-rc2.gz
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
