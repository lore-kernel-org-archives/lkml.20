Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BCCD35675E
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 14:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789570682; cv=none; b=Ym95j/LzFNazTqZhSOlVWKD9d4pWUhulB9LChrLexO/XIu4Xm9fohvoJyiHlAAOhZZo8MkooiBiyHcqsJVrWfLNG+HSHaPkPwQYCpM+VODD4pQMOsihbKiEJNmNDyKwzEoObH5h4F9bKTjlW+iGTLfJJwPrEpWmFi/fSqJ2Eet0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789570682; c=relaxed/simple;
	bh=CpUAebJC1PrDhh1drx0A8Kt+YRnUWsUNY74Vdvutk7s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eZYxYrpWYc8yGakw1MGpCeRex2nOOaN++nPQJraGNteFd2N7XvcYSfgy2IlQGobL2ogYkijU7C7Zrr2bbM6+plxqTBPpmmBd8tT0OtZiR7gK4FuQYrvLS0KQS7pAZOlPwx+O8sD8bdMwd3MpNsZIp+tPVCAYEL3FZcIDTv5ap7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kaaMOHDP; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kaaMOHDP"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-398a1676000so775540a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 07:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789570679; x=1790175479; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TDixk/GSJOV5BpgRul+d6xvI1z7V0gQyg9KKI9YySso=;
        b=kaaMOHDP5rLcnaLL4AIPDb21bt0YbuZKDMUPF9Aa/w2agQsxv/vB2fFtbvsi1ZWKfV
         n1edh82X/Ejcs5n2CdQZG05c0IKRBNTxUUEW1xNuT1ryaqTCTuEHTP+NGsWmMsWqX41r
         5+F/JduHk5NdqnfzjQ+kB0SnSfu7gGbiq8X3cPDibdcpQLdGGI1dNP9Xm94LTjVjZ8qB
         Av27R6nORR6fUvDallFWH+7X9Rd+Y6NVjizjw2ULZ3bVjfv9BE86U8iMzwA4lGXcomO1
         yxw4E+mIGy8RD7CBk7qq8jNf7HdWO0vVTMEA2tfkudXGua4oSmlPO/pKdSJJW9k5HlK4
         qI5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789570679; x=1790175479;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TDixk/GSJOV5BpgRul+d6xvI1z7V0gQyg9KKI9YySso=;
        b=Mixw1R6yBLb0pBUUryfmABmtWw60xvVuClYzfDz0izc2pI0RcjdBm73t+6Vv4fHLJm
         /W7/lP3izejUHRizTGvsV7W7Cncv0Dg40DfPVS2AXJeEmN6LgsSheqeVMW31pynncBV7
         gVUx8x699KDBg9wVs7U8RSLHBIbYtD6vYpBQ3qO2O2a7mGCL809x3hhmkm9Z+zIdV822
         FPpuVEikuaZxA/tZL05AcqpQRf82mgeW3rutUMm2z40hadnVMws4SwrCHJNAqEwsKgjp
         Q8jNxrQhItStQ6ze8W4cTp28mIOx4kQUZtIeL+ZlKZ0XppVW9vhlpqe0nhgrDJLVD7Ou
         jZkA==
X-Forwarded-Encrypted: i=1; AKwUvBzSjoiH32oG+IBr3ft3yYEkEY6dt4ldyS64epc0XF3ozxpwFd2zXXEFkJ9CpTphw27GuqVR/+ZkLDH86QE=@vger.kernel.org
X-Gm-Message-State: AFuF++kLljn3+AilO12WPs1EthOZdwLkWaoZHyFjwY3rAUMoZXUSbej8
	AZmF/cvXK7ys2eziMLjqD6mJaOu97gWdhSkvWfYsi97eMnP0EOgcWRZ7
X-Gm-Gg: AYBFou3X8qnKZw0iMyg9gbn0H9lf1/NmNNG9tql6dilA8LmP1p584tqjmC6KABcfh4o
	/GuTN43HXkbvdjqkLhFoQcepEXE0tITZBoUXWWFWhnA4C9MQDNo+0BVkKOpsxyqJcNZyatnwl+P
	aHFNbua4Mi5vrhgzQf7L/q4a3y3VBJSdycZm0gjElRqJ/o/yCmcR930Zqtc3AUrrPTnp6PMav/h
	iM437mpHa9Pim0bbRUnYkC9kKByjZ5p1DkI3S24u2F/B3ATtTWBQQy9SzD8ABLY/slqTGJRegqS
	JTWdmqZoaTDj27wCDXyZeBaO+YRgmchjlEeAqBTWB8z2XyXZJusiLyU5YSzvm23Zc32+LNfdP+1
	eCvxL0zkPOzQb9tGLwWq78sgCAi1XPzCfUxB5qjD6vpMse40lDor22UbZskVe3blGLriKXvgvZl
	F0DHoG/NSQedGH+qCO9/UpMH3r2MXlt/K9tfad4thDGL6MYLSsD1pmQ64lpScMJigQdAkPUScke
	m8pAhtLyQux
X-Received: by 2002:a17:90b:1c87:b0:39e:261:4e12 with SMTP id 98e67ed59e1d1-39e1e51d7dfmr6871687a91.23.1789570679120;
        Wed, 16 Sep 2026 07:57:59 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1d0be48csm1593063a91.3.2026.09.16.07.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 07:57:58 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 16 Sep 2026 07:57:57 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Sanman Pradhan <psanman@juniper.net>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2 2/3] dt-bindings: trivial-devices: Add TI TPS536C7
Message-ID: <8a7d2481-16af-4fad-8eb8-00718117d354@roeck-us.net>
References: <20260915164823.160977-1-sanman.pradhan@hpe.com>
 <20260915164823.160977-3-sanman.pradhan@hpe.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915164823.160977-3-sanman.pradhan@hpe.com>

On Tue, Sep 15, 2026 at 04:48:41PM +0000, Pradhan, Sanman wrote:
> From: Sanman Pradhan <psanman@juniper.net>
> 
> TPS536C7 is a PMBus-compliant dual-channel D-CAP+ multiphase step-down
> controller. Add its compatible string.
> 
> Signed-off-by: Sanman Pradhan <psanman@juniper.net>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Applied.

Thanks,
Guenter
