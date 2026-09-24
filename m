Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0028439891F
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 16:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790268582; cv=none; b=eV0i49+47afnLzGbHbhaU+5StfphSAnW5EP7Ls5k9whXbf5PoAOXgi15N8D7lSuZWWJn2P15UtRiL2HPNBnxN/K05pF1CQBOTNahRzIzfFFxYS0TnjMtLGey0eOYb0pOp3c5Rd3njN64ASxc53OCLbJOtRxFR3KJ0rxu+Cu+4oU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790268582; c=relaxed/simple;
	bh=h62Dh836T7epAiauqXAM4RBAh4gzDTS7soCafFIyBjk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FOt+8laronyFhgGpTBk7f5ykSo44MMgSmnEvFe48o0PH+U8DBYGdXsy/DXZbcVbwZPFxS9hRY402DIbrxFJFCQPgWaO5o2HVR2UeQCU5HOfi0CugSAowsxZXVQISO8xfALXV9HjovtJ1jBEzBuJqtNTogoFDzK7T+EWs4AWFt4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mf+cC/dD; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mf+cC/dD"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2dd1dcdcf95so235185ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 09:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790268580; x=1790873380; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pJf8nX05Vsz64aWKOzYCD8hwmSIbpieR/QsAhzSY280=;
        b=Mf+cC/dDxWzJmOYSOu9qgKDCqGE68ayL+vRVWv6DOBezLxjC5KU9jkf+p7zf4UwmOm
         5vL7I1HeSHoeL3mHZvNvyQdHfw2OG3gGkH0Kim+6t4heJVUgzA6/w0r4wOgSAwC0PRtE
         N8RFnh1CiDBjPhJVswiGDLLvZdx2GtY1S4WhI1LivhTjcR2EXuFxpXBJUZseqtFAv2u5
         kbapARVBhylw9naHQ9Hm69KnjKM6x9VjU/P/+rpHl61AoA05H0nb4bq1dUCVYKPTlewT
         wfIyw9MNOaV9beYrOuMHr8JOoE7uUqqoUId4ZwBNvW5XzvbR1SHFziIF38gs77tA1RZQ
         4hnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790268580; x=1790873380;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pJf8nX05Vsz64aWKOzYCD8hwmSIbpieR/QsAhzSY280=;
        b=n/QPZ22OjcbwvZk1NRhFIk4dEeJsNgjvg89i+FF8JtPGWs8bgJ3JjANVKIY+jkus8d
         P1Qv9LTuv3B46GwSGxJw1xwSVjcjG8pXQs38SqDW256QhwoG5odBN8a8ScdJApjIJRCj
         TpcknFp2vVsTc+qGWznH6OtHkw9dvoLoZjjgleAHWFwmMjm/yEtvLiR4QIf0ozKYIHnI
         IqhOBxg2VFnjmmr6CFcTNHdtEXBYka3xai+7PLbka6rDeV6Go741lw48kXYIIHpezYEh
         739oMgI2gvsUq3+LI0SoDmOIzVOpHeGuXP6D8wxrV0qp9vn2317GqpjGgkf8dVQKj0ym
         yNMw==
X-Forwarded-Encrypted: i=1; AKwUvByvy26DLRwt240HGRDAQKlKTUC6zRGUO7uFiwwfd+j3/rsjCG6tP1be66n0aDMgKNnWyAbSTa2kOySL62Y=@vger.kernel.org
X-Gm-Message-State: AFuF++mZqH5XL9dZMRKuoxNCX8xg0Pd5Om3JAIR4be4dMgpCrauSSIgw
	lAmQpRr5YmEc2mTe4nWb8+fLAKkTNTiw2D6yeBYMks3wDt/4Kg/2hmJf
X-Gm-Gg: AYBFou27qf0pk+B7DH8ozunCcJGEHfj3ET5koNz3u96NlqNT6l0ZhRJKIecsLypMw3G
	qrYPh2mTFqdI1NgI5BwRB17Zfyx62KgmdaKIkR5JQbMHA4CACvPg3sRv2erDKI/XkqZ9oMcXJf2
	ogPXHC8sbJxHd1GpW/2qeUvOPv8w5s1El6FC1g9C42Hhb3PzedRFjlRWJzjsneEUOMbIJWM6S0Q
	3TnBdlxnOLYh6hbFJpI90FZotPcf6le2OeDYc7sFezjgRtCTA938ZmcrEQXgatZkGQT9Cy2lFCg
	qn73y2ra5sxH0IEBnbEKQ4VpnsCy4g+o6JE6/fiu3oFRvWIl6W8CkmP8CXdWTOyjnhGXcE4EIMO
	nq0+WRKqbQgDZ1GA4SEfBMtQfEu8bGBkAj1nY696u9rMyM/javGZ8K7SzcuBWEeYV6Q5TcdW1GT
	FMbkNFWJbcZhxVZZLuplB/e/uloWQmOEqo/4h4t81gyC5ykljd175QX8Qebc9c0kUQ+iAR0S0RM
	EJsj5+tdSYj
X-Received: by 2002:a17:902:ce05:b0:2df:34c0:72fd with SMTP id d9443c01a7336-2df7e293926mr19308125ad.34.1790268580240;
        Thu, 24 Sep 2026 09:49:40 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5dd7b9sm30871215ad.61.2026.09.24.09.49.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 09:49:39 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 24 Sep 2026 09:49:39 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Emanuel =?iso-8859-1?Q?=C1vila?= <avilaemanueel@gmail.com>
Cc: Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (dell-smm) Add Dell 16 DC16250 to fan control
 whitelist
Message-ID: <3fc774b4-ee92-437e-a869-c603263ed202@roeck-us.net>
References: <20260924044829.2889204-1-avilaemanueel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260924044829.2889204-1-avilaemanueel@gmail.com>

On Thu, Sep 24, 2026 at 01:48:29AM -0300, Emanuel Ávila wrote:
> On the Dell 16 DC16250, the BIOS keeps the CPU fan at its highest state
> (~4700 RPM) even when the system is idle at 45 °C, and fan speed writes
> through pwm1 are overridden by the BIOS within a few seconds.
> 
> The I8K_FAN_30A3_31A3 SMM code pair works on this machine through the
> WMI-SMM backend: after writing 1 to pwm1_enable, the fan accepts all
> three fan states (0, 128 and 255 via pwm1) and reports matching RPM,
> and writing 2 hands control back to the BIOS.
> 
> Tested on BIOS 1.8.1 with kernel 7.1.5 (Pop!_OS 24.04).
> 
> Assisted-by: claude-opus-5-5
> Signed-off-by: Emanuel Ávila <avilaemanueel@gmail.com>
> Acked-by: Pali Rohár <pali@kernel.org>

Applied.

Thanks,
Guenter
