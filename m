Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48AA849B5D3
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 23:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790810962; cv=none; b=IWMoiYpYGlkaZd6+9peQRb6xiyIjJv2cplgDf69S3pErYITpBFLECOpxU6XmPug0Mf9j4MqSa21EdMXCkEd6hmn6QQI+1uZs2TYAbvemeqG86JZkCsBcO7gVVkkF71RzHkNPbtD+suw6wHHGAC5APDJiS9lkTZ35zNPOxl5L+P4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790810962; c=relaxed/simple;
	bh=0XCyDv6UPcO8RvCbmmapGfvbtQW25yBor2HwWwqLzq8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=btKzdcvfWgINC7711n0eDTBkUmyKKDXqQJD2kzfF6Jp8gcEXC65yG0oebKQceSYNLuJw14WnL2lS5TMbvBkWImBl+lNqfUx8AnDdtSIm1EfXFeTXgb4BahVMTGBh/t6TyZ95XXrPKfx+V2KTNE6CMbVHqzpeFMoI25Hv8rjOzM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=h6443t4F; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="h6443t4F"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e6598dd44so36962405e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 16:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1790810959; x=1791415759; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7052OrzfNygUb8ruKuPUw8TtJkXiUr4+VNNkJZFWM84=;
        b=h6443t4F9zf66fLyXAuKvs7m9kA6aliikoMmE8C3u9GBxCVNmyondD4a9SzPE3Qvfy
         adhrrwOkHQombkJwxNdT8336VIOegTHInsWqZrrfOto5FYbOy5GmL5uSgW1SC06wwZlS
         g4e98NjTb9RQ7ZWQNiYCP16PC2mdbbC6h2/tajbNNIZdZsFjyrpAb75v0xqd2wGjUYLW
         7cWZ2wE8aadqnVDYmbXOWDqDSW20CaLAOPTbTWn5x3iadIMHfUGODMTNNkrgDoVEldZC
         P7iwbX4Tkk+mrcSj/U68f1ReLdgpfS0LCmNNsJw+3JE+ADpYlpOHoc7KAPm0plT+8gBU
         r9kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790810959; x=1791415759;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7052OrzfNygUb8ruKuPUw8TtJkXiUr4+VNNkJZFWM84=;
        b=kUytje6xreAPaEWI2cCBJKQc/JBR5sizkCAeda1dId+SrmwbWxTXOR8XC70n8cJgJv
         mRStFchuVZrOkzQDguq9U2dCUPUGoDtIU7+d9h7UCjIPgg7v9ukZ38S2Rn1mWz6zomQz
         jPlT9oQldxyqswgvcmtZYfSO2X92GVsH5YKOFPDyv98KC/8Z7776HrgWV5LixR5qHdQ4
         jUGuVAnn6730aWU/5CdECLecc4TN/uAuqYoX5Mfbr08gLabiJLLZjfD5sDoM85NJHcVp
         l4HYIo5+KrRZMirtLHmXfZNcuQKYGbt+8BOvEBn+egb2RYipzhYSOY6d0aZIy47TJ6kz
         9ldA==
X-Forwarded-Encrypted: i=1; AKwUvBy8j0pgIXvYUH2hX0+8a6ffC9dy4DY+kdlBYDG3qAYXlV/V/tMvAEeacPoSLs2m7SbvSRpyRCSSgl8AJFM=@vger.kernel.org
X-Gm-Message-State: AFuF++kGLsw+3Y47XNG71xlVv4xOE9thQ2wuy9bj6AEESgV7R7x2YGUG
	VIgAGysim9lMp7QiQYDnXUVLZfCcX2h3ta7rEWhRCBQeysoT11hpg3M=
X-Gm-Gg: AYBFou2C1N35AS4bMEeOh0UamZqA3OvsEywQDeVtnLlSaZoJCFS6xQl8KuBmbO+hD3M
	rtvQTxoFL68I/yGV9QpdmrPdI1ssL7sFWPvX/bKehOXPzGdFr5JuaAT8MNxt6uPoGyzjP/hF839
	g4D/dvu3U8vryz9HJ6kNlnGmUm7KVo0EC2H4hYEs17UWfZjM02il6cfA4LeG5WcOES8O4p9tGbS
	cLbHkYrcFL2UimNcCanYaPEI7iNibQg8wMhxq0OsFT9riUfPZcdTfJkIHjpBS/nhZIIKPfhtChy
	cYW8yKZpJQ7mwMls9kBFosQvnMtjXWW9mcVO6+epiqeDHCL8S2GO4iTsgY7XiqTCfrfHVCR4PhG
	/TzdFccdqN+13zVkjJgG+4dSIErzeEveDtsh2F7meBwDvVmr1MNv363K7iAmSFWaIaHfjFo4Rjt
	kXn2HwRqKGXxijsrdlrRBzh61+CBHI4NCFXiRtAL3pKPpszoXfzzFQzWAtdDhUxre6FnQlAM3WX
	N3lw1j2z6R+sFgq2urObDA8ki9gpFeXsIyJbMKaGQx00ipu2A==
X-Received: by 2002:a05:600c:8595:b0:4a0:1ebb:bd0b with SMTP id 5b1f17b1804b1-4a01ebbbea4mr12201685e9.8.1790810959254;
        Wed, 30 Sep 2026 16:29:19 -0700 (PDT)
Received: from [192.168.1.3] (p5b057568.dip0.t-ipconnect.de. [91.5.117.104])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01feb7198sm12207775e9.1.2026.09.30.16.29.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 16:29:19 -0700 (PDT)
Message-ID: <b1a58390-305a-4c05-a5e4-28a0279ec080@googlemail.com>
Date: Thu, 1 Oct 2026 01:29:18 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH 6.6 0000/1193] 6.6.158-rc1 review
Content-Language: de-DE
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com
References: <20260930152434.301151190@linuxfoundation.org>
From: Peter Schneider <pschneider1968@googlemail.com>
In-Reply-To: <20260930152434.301151190@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 30.09.2026 um 17:11 schrieb Greg Kroah-Hartman:
> This is the start of the stable review cycle for the 6.6.158 release.
> There are 1193 patches in this series, all will be posted as a response
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
