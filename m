Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4146740EB91
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 19:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789154294; cv=none; b=mAFpD90vL/qCF5thjI3t0n4FM7OogV+xtY/yPppSCSiDMWccoROMvVYhxZIKxtRLHe/MBiUFWVD4tEn5dq0JZJJPGJzXqOirvVQP63g175Bc2PC4vI0sZzcgYEUpVU/mmdefPXqDAbP13E1HXcSq/xYFdcGAoNq8xuw+qVPIDO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789154294; c=relaxed/simple;
	bh=GavbH/nr5dcl+tzw53fPPEhoAOTJmDbERpgNBFQTspA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oQXZGqUAEuC67UX/e5NLsnBGfzolyN0hHj5qZOpj31qtFVarLoHU7FqHj7zfly2pk+9YDMqMpW/oGMeaAEYwbDcfsQy7UTgBo8fK3MG8y8idP4cstzXK6My220RMHgXHHp1esQUr3T00uIGwdCst96e+TfOxm1eYNm1h3bTNQEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CgjVbOvO; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CgjVbOvO"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-8623e5d435cso89836b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 12:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789154283; x=1789759083; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4cXYdYuE+SXr6nDr813a3S+QySsKwkl7f+bdQgb7a1o=;
        b=CgjVbOvOfqLCyl/azVTmVXEcLMwN2Tnk0WtYm6aRDEIFeG3nQfxaQh3Z1nsN8fzAs0
         81hG1NdN2p1s0k9L4OKbQGACktOebG/79ppEKjWKgZBF5pyjxZxG4EvaTMIkfIBhcJ6p
         sbvF9Oj49NXaqp2dHntboPhtvJN8ehrHlOelClQSqpHSzKutg9QXOGfhutyr+XYUNu+B
         dVRtbxjPYxK0smL1ETIvZNkX+Mj/tlJo+hVJ3u6yRHGUrTwMoARhNglZRlJ89/pFD5g5
         unPzLkFY5zCgzC7o1vALgBde18Hh7ygsh/cbZ0buMT1yXlZR3OuuR5ofryJ9NmrlUCje
         kWZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789154283; x=1789759083;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4cXYdYuE+SXr6nDr813a3S+QySsKwkl7f+bdQgb7a1o=;
        b=gAkYxbfiAGtNUc98JzAIwEyq6dzalD6Tm5PC/G/DV0ZbKfbc8UDLjP8eEXL1+mdbB4
         iP3mtlN0lD07MIoe1vEKClAOuBx8bRY9fFYjuB92tgd3O4OIj5PsLCaQkwD+Q3Pax9L8
         SpZruGSuqCEm661vdSMGq8hk0gWl6LYh7p1J7z2xqwRePjitDlZrI4qgaheN9AcRVRXI
         097HM0zlZPQJF7D10ElpXJvnRF2i4V+kqJj/mbzcFfJPmsxeWzccbjemScLN61j1ssm4
         Hr1Gt6C2ElZlKWtdLGG7lfexl/ON6sQwkNs1aAlmQ2MrDIvrEcoEW10w+MM1WCKikulD
         jvDw==
X-Forwarded-Encrypted: i=1; AKwUvBz5ExkttC/69GUmXC2rhk3OQhgqS+o5MJjrqgRw3/8NJ6OPhQZ2A4L5ysOP0EyFNU8Loe6YJ6lIx4Q4oSw=@vger.kernel.org
X-Gm-Message-State: AFuF++mixTOko0kRVcSG28P86y7mZMQGXXzPXtv9856gC/85O3lmYZ+j
	GSSXqGyP4I6SVH7RYEI090bE2d5K2nkwaqUQ+tt9S8+YeerFOm8D3GoB7KaacJuG
X-Gm-Gg: AYBFou3EtC4AGxfDHhnTWnhzES/Hdypx7Sb5+6NSpz7jV09o1nQOPAJfw4L/Xm3EqFi
	PgMNQFPsAdD0baYxjFzl/beZelqQiEjzoXWXZXL7Bs49NMfbqiSZSIFaWy7f/s9h97d3iu/wXQV
	3f36xKCxKqOkMiL/qHD6q0VbuwpNp7JlR3jc9IzPbVHAJCnHNba6v59uxj4S2yunG5+wCgtyPbu
	LsJCphJn/C52wRIjlQMXiWeIwW57Y/4v2bNazaq44NzzvryntiL6aiLgnJQRGtWfvgnjwTKbkIm
	yW2zBv/VbKCoWWFLWj64RpTULVhbAH9BbLKXS/hd+A1blJw09T1j8EnxZukaPQQMqU+dKEet0lG
	joWvUmid401eG6sT/EE7vIn/lgntv4w4RO37gC9emnSEIMaq0hUKSm03OCIx8vTy+2VHlz7Mgoh
	DUE+/au14cPRjRTxPPfIRxNl1aNg6oV61gPZvN/KpWHK9KmFEn9BTeVyI1udaUzcr3r7SqtOwAr
	4J/vpXN5fEZ
X-Received: by 2002:a05:6a00:ae19:b0:86b:4366:b5ab with SMTP id d2e1a72fcca58-86b4366b78emr4472376b3a.9.1789154282668;
        Fri, 11 Sep 2026 12:18:02 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b291c1601sm1616392b3a.31.2026.09.11.12.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 12:18:01 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 11 Sep 2026 12:18:01 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Thomas Richard (congatec GmbH)" <thomas.richard@bootlin.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Werner Gartner <Werner.Gartner@congatec.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, stable@kernel.org
Subject: Re: [PATCH v2 2/2] hwmon: (cgbc-hwmon): Add some sensors
Message-ID: <1fea779c-454d-4afc-bf9e-10e5236f1d21@roeck-us.net>
References: <20260911-cgbc-hwmon-fix-and-new-sensors-v2-0-0c6bf078d173@bootlin.com>
 <20260911-cgbc-hwmon-fix-and-new-sensors-v2-2-0c6bf078d173@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911-cgbc-hwmon-fix-and-new-sensors-v2-2-0c6bf078d173@bootlin.com>

On Fri, Sep 11, 2026 at 07:31:59PM +0200, Thomas Richard (congatec GmbH) wrote:
> Add the following sensors:
> - Alternate Board Temperature (temp11_input)
> - Top DIMM 1-7 Temperature (temp12_input to temp18_input)
> - Bottom DIMM 1 Temperature (temp19_input)
> - 12V Standby Voltage (in14_input)
> 
> This fixes the following warning on conga-SA7:
> 
>   Board Controller returned an unknown sensor (bc_type=1, bc_id=11), ignore it
> 
> Also update existing labels to match Congatec documentation.
> 
> Cc: stable@kernel.org
> Fixes: 08ebc9def79f ("hwmon: Add Congatec Board Controller monitoring driver")
> Signed-off-by: Thomas Richard (congatec GmbH) <thomas.richard@bootlin.com>

Applied.

Thanks,
Guenter
