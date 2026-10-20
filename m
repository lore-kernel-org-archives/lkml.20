Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792521010;
	b=xbZn9YA0yIyREfMq06FCanLYSgwxjOtgvBXYk5Hig88XK6y4nYlObh+5FitgeE1JMlZU
	 75AHjt4XdSJm6PBHes9YiaBgWwtuYSxzXukpIe3W+sMLD9X5glKbGrOwfSaIAnJlM5VYb
	 d86mW6buZtXqNe3e7ukynFIhac2O1aYFkIziiPueL0zJo2/0cQaUqRpFOAjISD6/qSlpe
	 E1KrKvkGlYb/tPBFAzJbpjfaaS5lOgM3saTEpzDHYUI7Q3312pjhb2JcPeUp2+CV2FRFx
	 T5Zan050UMjbYZ/28fJAFW37omyGp7I5WapMwFBCpl5NwZ4tUtLb6U78Ue3Oy1npEFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792521010;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:Content-Language:To:
	 Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=g9NG/WDjidNQ/9hryLb6uUMucaHueMCbu4TKIHP0Lys=;
	b=kWHZgxkrg3LXiIQF5GqeKqo1o2WztGIQN5Zq699owyD+1JaUck88jxfGEDOXvMvbqrc9
	 T5CHJWLqdOFgp88YaIURL0bsNs5dHaI3fvP6l05CrGMLms584+P122ZsBJo7pyKT06CUm
	 GM2EFea99GEjpqMTuRBTqfnqfBrA5A75h4ZutT0glRVgaszvupbIwUw8H+9N8hl2UnXxG
	 K7lB/E3RAmNWLK0+pbYrJBaC+PH2NVy9ndzZlfb4VzH2vvPIxJTxdeTTGwz86jlEwQXmA
	 0iK7CsNwlJtsCjy3eNukSywnUzpjCMx6/pndrI1rpnUwls+tjNSdRgZa1mdEpr2MZZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20251104 header.b=DCsV4hKB;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B565B606A324
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 18:30:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B565B606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20251104 header.b=DCsV4hKB
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so1306465e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 11:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1792521008; x=1793125808; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=g9NG/WDjidNQ/9hryLb6uUMucaHueMCbu4TKIHP0Lys=;
        b=DCsV4hKBrIEgvj1O1/38beMuf+pcqPGEw0deiniy6x+kl5ArcJWvS71DPUBEg3Vgfr
         fPQ5Sa6KAe1VNi70nLR7sg51252tdJo4e/2nTLmqCeU3kcnxVe8SxMt0OM3brcTj2MWm
         5Ry6BMh9GU0g0PX8WPaVdZLOvBwJeduXgt3RkJPUlDpjTsDJswy2vprLDuOET9bK0vA+
         vCVzS1XT6B1jaixSu73/j7ODrso7QIlF1FDMHgsllLX6/GpX+9CzesmIGSl5K+ui45nL
         pvAr7F8a/S55lrYQnf+Rvt5wZnWc7tm0aWVprsDMAGAB8IRasdXVyIbxXOB8ztRX7UC9
         Qwnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792521008; x=1793125808;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g9NG/WDjidNQ/9hryLb6uUMucaHueMCbu4TKIHP0Lys=;
        b=2KAA+0cNN5bWvJ5Kn0IV8+1DiyY9EMIjSpyxz3RcZfPWmtkcXf5H5KHoKKTxdh7dB+
         Zn2aiJCo7zYfg/XQzF5YST+Q9cJEcNQO5APa46/mRNVIYgVu/rxZp9KIO2P6LHLEXpDq
         YmgEiv/pTAMPo32wTzqp2R6asalps0NwbH2X001BW0ZPfZn/gvAsSdTBsg8Hhv45BQxA
         doKQ7Uyfhn+Q1cp777bCAd5Yr4Hk+05Mda6eAVj1m4orXpWd9FDWeHEgP2mZnSjyZiQ6
         ErmypQQGWh40R/31FgcGXT9Aeko2kVkPj03ROsCbbq2vgxuiXDjy9F828T7TVn/oGlav
         xRJQ==
X-Forwarded-Encrypted: i=1; AKwUvBzAtqzueeXtgHtiCosm+VnV2ueAwF/SRY5SkEYsFwI7jFGrsOrjJnMazWj5mJdHuv+/MDUSDPpqdfSt3gY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKDeYGblbjgXERbxmNoc4Kc/epSMtipBWCPGNdsCCxCzt7A+pJl
	F7O1MmlGjGa/pyEjgxDhjYL/Y9wRopYaKD9IG7kUO01bVQ/tfBHZcvY=
X-Gm-Gg: AYBFou32Qb7L0r36gGQQj7BWd+wGtrZA4K+IyQN/WeQtvlq1ZfnlPRvI2KCcrJHbvds
	QPlhygkWExhFSfnwqhodw5dyfP7Ubn4jwe670pOf/tDX/1vwLzgZfJFvEKNHboQEozzpphHO+sH
	VpgMWOsVR/A/etVjl9Qfc+2dMSwkSJ7mQQZnek5NJO0MxiiwbMhxLs/vPhOvM10zJyFbjGHwA4v
	VVnqYg9JyUrVXdjipADJhavPffJrxc435/g0mqbsplKDVS/ZQ4n+fov7oWjiICex+mfHwyf0gd2
	oOhTOXWt0FhiuHbx6lN1stEPKXviA6e/qvrfg2SpSMGk6Y0zwXggFbayhwUPSJ9Kjfh5XhRsjO2
	WR6aNa/63eK77HZ+ap7ULp//KDVcF5EXn6dfyoxgheDgeit1EHzIC2NRPHYO0r+ebs23N+6AWnf
	Whqym66TH1Y4UUn9i9YXNLIetQoa8SQbt9ZDTG8/QDToYsHHDiF0GzInksM4IKhWe2tvvTq8Q/7
	KIs5XgxIDGcVFkCNIPDOHsttXji2zdN//yfD/kMwfXg6ABHgHlYBKZEMfIlLCI=
X-Received: by 2002:a05:600c:6298:b0:4a1:96cd:2f60 with SMTP id 5b1f17b1804b1-4a1d75ce285mr240610515e9.3.1792521007772;
        Tue, 20 Oct 2026 11:30:07 -0700 (PDT)
Received: from [192.168.1.3] (p5b2ace83.dip0.t-ipconnect.de. [91.42.206.131])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fc12491asm2902185e9.3.2026.10.20.11.30.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 11:30:06 -0700 (PDT)
Message-ID: <5ab8054e-c6e2-4073-a92d-0cd971a7269f@googlemail.com>
Date: Tue, 20 Oct 2026 20:30:05 +0200
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH 6.12 000/858] 6.12.114-rc2 review
Content-Language: de-DE
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com
References: <20261020075246.861837975@linuxfoundation.org>
From: Peter Schneider <pschneider1968@googlemail.com>
In-Reply-To: <20261020075246.861837975@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 20.10.2026 um 09:57 schrieb Greg Kroah-Hartman:
> This is the start of the stable review cycle for the 6.12.114 release.
> There are 858 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.

Builds, boots and works on my 2-socket Ivy Bridge Xeon E5-2697v2 server. No dmesg oddities or regressions found.

Tested-by: Peter Schneider <pschneider1968@googlemail.com>


Beste Grüße,
Peter Schneider

-- 
Climb the mountain not to plant your flag, but to embrace the challenge,
enjoy the air and behold the view. Climb it so you can see the world,
not so the world can see you.                    -- David McCullough Jr.

OpenPGP:  0xA3828BD796CCE11A8CADE8866E3A92C92C3FF244
Download: https://www.peters-netzplatz.de/download/pschneider1968_pub.asc
https://keys.mailvelope.com/pks/lookup?op=get&search=pschneider1968@googlemail.com
https://keys.mailvelope.com/pks/lookup?op=get&search=pschneider1968@gmail.com
