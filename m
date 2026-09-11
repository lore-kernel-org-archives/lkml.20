Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B522EEE7B
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 01:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789088463; cv=none; b=o4Z6ytQ3DgThjIsOkBaDKhxdd0vCFJvtkZgvuhWSFtx8Qrod7KK9rU8Dx9BEKrKeY4/ufn3z9t1lw75+0P3fBnGBB3GsgonqlY9j3RO8WhXlTzuyJBnyHv/SEeZXIJMv0ISrLZx2QRDrYWP/SlckkAxi9g8gAJ0OTLnoKMsoh1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789088463; c=relaxed/simple;
	bh=Hve8OTKMJK2Sw15IWoumCJ3fcui/3UMynRb/vn3eBYU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DVg1jqcgPMTPDgc1Q2WTpcBI4OL3HWZkskCncpKOXvkRoCVaEAtix4NX6cR78BaMpAK6hBTO7DSg8V0JqHfEPw3JozFRMzymzHWXjeiVZA9Sj8l7bGr0Gl5izPwSOLlt0iJbBm8Ic2J4YkjCbaFpkFB6nHX3/eOpUhaifycF224=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KFKlUubq; arc=none smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KFKlUubq"
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-6b1b766bf01so266406eaf.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 18:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789088461; x=1789693261; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FX4dycJodbNcgNlbRtvzoO7X64Th34ZYUbHEO8PTdJ8=;
        b=KFKlUubqgLuu8Z0rBHUwcR55NmuXcSQcT0xPhqIZIVWTtTi/yTycGiNEs/cboRY7xx
         AOufONlvfHZvHHhCRgQjOn9MgAvZPgN3xHSIXPnNAf6GiA6aLT5g0fkvvI6pvvYaJfKE
         9nEY7IMU0nhC6gt6waoI9A5YvdT/5ad95Kivq7o3Yrb9P66qTs4+mITqERiwq8P8lj0c
         Ui6K/31WUwcK08Ml+b+ORbYQPA0M4PFIhyaMpHMV0c+g+cfMSn6jUy/RrRlW0NPfHv5d
         UhkBdKf+EbpioBgEzU/HCSe55AwR1nZJc0fPFVVdBVg5E2kaVlM38JncVgiAvmSOdcg+
         1ICg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789088461; x=1789693261;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FX4dycJodbNcgNlbRtvzoO7X64Th34ZYUbHEO8PTdJ8=;
        b=q7hsln9caAwRCBNYyONRlvz+LECx/wHR2+o47TFDmtHj4iCHB5zevg80Me8ukWhfG2
         ezau6yqIS9SEYKJx3bHG5Pf+ycetWt9Kk0MJvc3S3EqrweDkBTnS2sqtf9bL9+rhQR2M
         8Z58pHuHvflvHWMVo1Sfmmu5o8kgJyjgIvSzY7u+kSNahncs7fbgcpz1RtCKGwPvyMZN
         JWY4hBHsjQLuv5CHQoTQ/SGozg2PWwvftfomqudaqOrlpcJbg0ZmVp185pzk4+hgj75h
         GJkVPcT7W4oaTpED54nb8lYRXR4qScgSaljoTJIUCkKOMrnRzQxx5EwD0+ewszYhAuJ+
         xfvA==
X-Forwarded-Encrypted: i=1; AKwUvBw1RPC81SF7trByhEax8MCAjoqrLYcrnCDtuoKiIjysMSuOhcx8ZSrNfSsUPZfd7fvMQdNqOlPSQNOM2qk=@vger.kernel.org
X-Gm-Message-State: AFuF++n4CGHxpv+Kndx91Ws4+TaJUJWV3/Fn6OpNdcMeXNICnPGBQB8c
	LRea3LbS8u77dED7/L9a58DXhFLJHcZEZSl0i4jr/U7C/WwuBVJS626X
X-Gm-Gg: AYBFou0ne5SsE2vh7e+R7A4wR8Y94ENH8Ui0w1rnBdnW95imnZZqAKFYyv9TDbVu6Hg
	Tg893zT9nCGWh6N1eGXNNFC5GZppYUxdJBvoeDd2CHZLl/x8ztOR6euaAOtwTaeGsCgpqtzS6bm
	9P2NodJFEHIu4734+UI39ilUPM8z9CeAC3K8yXv4vObPlzosJWkndZYV/LVovk5edWNSu+pYVBg
	RI9qY0Oqzapmo5jIwLcmawA+IhHtph0YYTsZ8ssjZzV+q9SnyuUMGFFPVLhA03gr3rKwvVeWRfh
	+bwt1ohuYvm2fEnvTwQqHX6qvPziEY8wHEpGaDAKxRgRg1wjA1sclTfGcmv4JKCx/Od4ugeky1j
	2PiTbW8T5mGU6dalL3xrXPU8wB9nLTAeAWvOW7tSFaC/bgqVYC+CAGXy2izTjbyz3hi+jQlP8Zz
	E1hh98EppEXheHKe0MgZL8UlqbpsWmi97eI3LidshelxvWBFsyYq15qVDbjj5L7BmutJPgAlAH3
	rfLMgXt/i2A
X-Received: by 2002:a05:6820:1c88:b0:6be:7782:5a5e with SMTP id 006d021491bc7-6c0bc9b78aemr1075003eaf.53.1789088459704;
        Thu, 10 Sep 2026 18:00:59 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b8f1f7sm1928004c88.11.2026.09.10.18.00.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 18:00:59 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 10 Sep 2026 18:00:58 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Paul Louvel <paul.louvel@bootlin.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] hwmon: (nct6775) Add support for NCT6126D
Message-ID: <c12d334a-4c95-4a43-b7b0-390e15dd95aa@roeck-us.net>
References: <20260910-bootlin-hwmon-nct6126-v2-0-ee629ab35e49@bootlin.com>
 <20260910-bootlin-hwmon-nct6126-v2-2-ee629ab35e49@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910-bootlin-hwmon-nct6126-v2-2-ee629ab35e49@bootlin.com>

On Thu, Sep 10, 2026 at 09:02:39AM +0200, Paul Louvel wrote:
> Add support for the hardware monitoring functionality of the NCT6126D
> Super-I/O chip.
> 
> The NCT6126D hardware monitor is nearly identical to the NCT6116D: the
> fan, PWM, temperature, TSI, alarm.
> 
> The differences are:
> 
> - Device IDs 0xd283 (A version) and 0xd284 (B version), which both fall
>   into the NCT6116D ID range (0xd280) when masked with SIO_ID_MASK.
>   Instead, compare the full value to distinguish from NCT6116D.
> 
> - One additional VIN: VHIF scaled at 16 mV/LSB.
> 
> - The fan count limit registers are documented for all five fans.
>   Also expose fan4_min.
> 
> Assisted-by: opencode:z-ai/glm-5.3-flash
> Signed-off-by: Paul Louvel <paul.louvel@bootlin.com>

Applied.

Thanks,
Guenter
