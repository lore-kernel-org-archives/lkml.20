Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58DA642A152
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 20:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788985703; cv=none; b=Qs+KQsH3LgAJXHWCLFVtn/5gmZNb7EJq/D8mcKGyPof2PZKil5+417wh9oucBIuLWIZYvNXS/wT4yJNtvtkQlVIDzKYJHzNkgQZeSftfPN2FahJySETuXGZocDVL6vkln5ldc3B+k7rhAu1Ftb4lUKU4MCnT2YdGv0fERK508Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788985703; c=relaxed/simple;
	bh=W5JXtiEI1GAvGT/64QMWOtm3bVHKWsvJdYfasU41N9E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YB4r0/ecHzzO7xUku9yyNff8HC2DZlf+OUXxiFTJYjxlbbd4iMi9oun5aHKyMBgD6ln20LJK/AoV9Nb+EwrMKJ9zNigXWE6sNmBOer/dGWcBEduyiOkZWPZHUcogKmBExr0fsql56+6CiVKge+dTZvdYFP1wsIT95m+8LUuTVaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gt8ZOElh; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gt8ZOElh"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso5913931a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 13:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788985696; x=1789590496; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DEzU3fsaUeqKNU36+P/KzrJW02m3H6Ngnj8OsDYtm0w=;
        b=Gt8ZOElhwjuuUxUcP99/D9HeSgGkHyVSX5spNNTrK6ezlxDH3kYrD3FuwgXU4sU6Nd
         etRG3UdQTh7Jiy1SMrLYPF0+BYVvMx73BxsZ1zguDnCKAshmUSv4WMr10mY4Gh2+cBQA
         qS3CImtiCwKPdb7Z3U3h81TNLMEiMIeoKs/xcDvANqkjBSDrDVy87PU/5NLKB7OWj09f
         yvLswRdMwbjScOrcMJgMA9wAn0szAVqU8kZdpUCXj9jWL18SgRbDJUoYHIF0Fsll4Nuo
         Teldl7MITb5D1h2KcOIRt3U5PCzcKj/ltgrbwVprPisdmDn1tJHj2eIaCQwyAQDyhlCG
         dtzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788985696; x=1789590496;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DEzU3fsaUeqKNU36+P/KzrJW02m3H6Ngnj8OsDYtm0w=;
        b=ZZK6I0Es31lYaaaXHHqdltyvxSLPwMZmxvaONSkVGS4RCb2YJqYD7YTBSxZj9mo3Aa
         WW5Ri/GKvMUBolMMJgrVQS9cd+CGUvQk/l11OgM6UU6cUc5KisWHZTQv/D6Cot65yfxM
         EoRgOCJEy+LICzkmtufdlKFKdIihCxmqM/E9AggiXE7lXd4ORjaOgT15HNQhk//GRW8G
         t2vlnNRvfgkg/su5ErwK/bKm4VZYCQtN48X9D8K39b0XMwFTyd7axVPupV2XXqHKnHHE
         VrPkBcZWYBLKBipYZHNZoJDaVIIH1fDtw0404xsIDUHNI04TCf+CPPQFDmwo1VpVeKw+
         UMxw==
X-Forwarded-Encrypted: i=1; AKwUvBz3i62oYZe/MZ8uwMBZe09pjeiUMjFd+yW7CsXxguy219vx8PHpqU8vVgN79Nh+nbX8njfuJjVd4ML8CPk=@vger.kernel.org
X-Gm-Message-State: AFuF++kvsvwdQ2O+GdQ2/HUH7LNKSylTNvO89c+OhMQWa3JhNUkMmAWE
	pfXxeI0T5wdoCzGzxPphPWYcl1i9DZt78QyjRJtrU5QQCbUUDyAzMLWR3DjO8w==
X-Gm-Gg: AYBFou1bbgxynPMUWRk7UiRjG6+XHZSpBGmB24jeiJNm4V35E6fM/9NCxH/m5J0fJ8t
	NWasVV4boR0FJlxJVa0Yp9hZub4JnHFiNBxDCxPIHVVb7aoxfp7KZtUjlLMV8TyEMo4mNzjkC+y
	U4dlfOUgksxBWRgpgbF5Xy+YffjGqBVs5Y8Bl4IRjKprRMLEI6k7/SU46+MBrFddMJRTG1KkwSN
	YjheY5MKZ77W2rq/PEuqnHRZ2Fd5+yweA8sJy66a0tD5qUtQ1xktyvRodKeHpgFbYtqKrgMAbH0
	+8ynLsnP0s1N54X9vp8BYIxEfV2IDChnYTV7hCPLstDoPjJC+kDMMZZl3wWjeHOTqigwTwoZVf/
	HULX61ixgGvpbzIbav7PhjUb7OSLs2+8Tk3pVw7b+3hRqzWlXZRXM+3gSvg/IN+rYOMosFELg9u
	T+l2Jpq6VWbQAeituaTSXKr94oP+B2RcfMV4l7+RpgoXOX/DNgHOnU8g10/u66osRd7TAcFTmah
	qLKQjQtSuNm
X-Received: by 2002:a17:90b:43:b0:395:5eec:b932 with SMTP id 98e67ed59e1d1-39b26141c79mr58732068a91.11.1788985696439;
        Wed, 09 Sep 2026 13:28:16 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d77388944sm1156264a91.5.2026.09.09.13.28.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 13:28:15 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 9 Sep 2026 13:28:15 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Paul Louvel <paul.louvel@bootlin.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] hwmon: (nct6775) Add support for NCT6126D
Message-ID: <be37aafc-6b6b-478e-b01e-9e6f0a932608@roeck-us.net>
References: <20260909-bootlin-hwmon-nct6126-v1-0-4e85615fef10@bootlin.com>
 <20260909-bootlin-hwmon-nct6126-v1-2-4e85615fef10@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909-bootlin-hwmon-nct6126-v1-2-4e85615fef10@bootlin.com>

On Wed, Sep 09, 2026 at 08:25:55PM +0200, Paul Louvel wrote:
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
> Signed-Off: Paul Louvel <paul.louvel@bootlin.com>

Signed-off-by:

I can not change that, so you'll have to resend.

Thanks,
Guenter
