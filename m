Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D384B4893
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 08:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789719638; cv=none; b=e+xnfGSLxaeAh6bNlTzYVwwDiRO7s5BPJw5rH9iBIpAnqKbzCgWJFRYFOvY3WIreD+4LsmbXLDgcXoRMDDOC7YzkfdFiY2FZdEd/y2Hgusay3ECoJXefylZ82GJrMlmV4nzLQkX8fNCYP4It3ReVMMQ/L70LF2+//wRR0u9ZmUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789719638; c=relaxed/simple;
	bh=1xmHYRYfu8OtSUWgblAltZ1bFJ3q1HsG+ndUjgkwz9E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fObBoQglXTm++5RrE3asLTqKZG8/5RjLYaq2keYV1dbOnTsHD3c2V+AuvjhHC2oOlKuFmmiuqCu+Tv/UZFS6wQNx4nhdVqKCQNdx75esFD5SGWe9QL32IPzn2GBNZd/kl0cWAgtFCfShq2zjNGR0+wg7+UPrlFSd02nHBl3R7KY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=MqTlVkAH; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="MqTlVkAH"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7d2bb404so1308425e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 01:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1789719635; x=1790324435; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zyAJTSS0FYPcMnF0dBpTcj4/kVFflzNqQUPg7P0ugms=;
        b=MqTlVkAHV+vcGIyVV/gubrZD5cQb5ZO2NzDRgzd0pZay1bRLCXYHPs+awil6T+tRUX
         Yav2u6bd09J2OEMKwR2FzweIkBEIxg0x6HJxl1plhXk7I4Mu74F3rABYx+TDIFrr1+3N
         79X52T7qVy7lMSBR29GbeN4CY0EEPrUt289vUnrUMBseg3H5ibjhDS/Fk4Oi0Pz9Cuwp
         CsdopwJWmoEEHRqEK1FCf0ni5rV1fsVSPS8OuMok1ynSnR/KhVeYtrNrRlZ4+HjaO6kA
         5KDgwt+1PgUwvWgSod9e94aBTsHVkXHqaRCsfLcjzKTfsc3icyBmsTZ2EdCzy/4gL0aZ
         v3/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789719635; x=1790324435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zyAJTSS0FYPcMnF0dBpTcj4/kVFflzNqQUPg7P0ugms=;
        b=AJ6TL4S0wMZ+oLm3femh1qg9XuhXRND88A/j8OkHGEjrC4jQh8WLWO966Qa+A1b6QD
         0tU7ZQKyTWFp/XVndZIICGXYa+ON8+nUnIjmvcTOvdYfjxXdQ+/7wusKXBHFLAeGeioQ
         2kg9tIOqktYgVa/FZEYBkDbT1JsSMoZ32Wmjuf0M4+WY/dpoT0sN9wO1hWDjVpPyWrh/
         MwnyrQbDjvrk/8asb91ZDGlhYF25SV8nzjhoOs+XfRVdRJCpBr8qC3Pwf4xqw2A3KQg8
         iq6HPEH4tgotaYTsB6dLuw23zRpJi4kGj6eunIxpyRAiWWrglZ35jb2jw3sP6eEsK0/I
         W6hg==
X-Forwarded-Encrypted: i=1; AKwUvBx4BFpMc/FRCbzopqPDmQboLfp5/zSK+ZSXx4ep37clgFMtT7Y8U8tc0lyn9PDwRnCWiqj2vcSp08RAUUc=@vger.kernel.org
X-Gm-Message-State: AFuF++mz1DBpsrHMIs9tdhqa3r2lT3Ej1jPTbCgQpMKK+IF0+Bavetfa
	I0m/CnHz/oGy9Z7ZQ7I2Dl2nKDRA/7MRGi3FNwEhnA3U6kvTTzAx4FShdZRAb3dkt2A=
X-Gm-Gg: AYBFou03oNpfTg2aF7S08UCqzOYc6BgqWLVvsfgPx8/GKgOPWMKPAneMEM5l17oITvK
	kWjlSc1j3tAItGLgb7g4IZ/aDgryo91p74ZRTwLEJuq2wLmkP/4B0+7/YFTO+/7qVhTelUYmSsS
	KOrxqnOxYTOHItWsd1KEc5MwWgRiuCIiAsVAg022rae+7YZkeyzFFtU9gjF+PPYxQZWsocWBtSN
	nnIRhIn07R60hiTNNJ2k4+YuzA/EarZa0K1g4d2kP3dGDhvPwH1nUdCerLufsOM1vofIxkyjUAT
	KC0qDJmJH6mbOqzMqUhNGH24ZSlgKB55ayhoPwZggSokz7AxhPSrglp/4GTFz15Fa6XEnDsoXMA
	wrikYyDQwFB6sAGbQ9pchJbLgM2pq1X2Sm590AnDWeGtYIdFc3/S8FYUqm80KOyD5EgNNtsWu86
	N7D94RwmI4abLh7ZWYlBPr5D/PH05booxPfeBwEUMqtOGSQqQ3Nw==
X-Received: by 2002:a05:600c:1389:b0:49d:2936:8ad1 with SMTP id 5b1f17b1804b1-49fc4f71c7dmr23237335e9.1.1789719634695;
        Fri, 18 Sep 2026 01:20:34 -0700 (PDT)
Received: from remote-01 ([84.17.55.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc8dde38fsm21914985e9.1.2026.09.18.01.20.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 01:20:34 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: andrew@lunn.ch
Cc: netdev@vger.kernel.org,
	andrew+netdev@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	olteanv@gmail.com,
	Thangaraj.S@microchip.com,
	UNGLinuxDriver@microchip.com,
	steve.glendinning@shawell.net,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v8 2/4] net: usb: smsc95xx: register the PHY interrupt with the MDIO bus
Date: Fri, 18 Sep 2026 11:20:32 +0300
Message-ID: <20260918082032.2697732-1-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <6e14d6b7-2a5a-40e2-920e-fc69a6e85173@lunn.ch>
References: <20260918015029.2518425-1-f@lex.la> <20260918015029.2518425-3-f@lex.la> <6e14d6b7-2a5a-40e2-920e-fc69a6e85173@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> > +	pdata->mdiobus->irq[pdata->phydev->mdio.addr] = phy_irq;
> >  	pdata->phydev->irq = phy_irq;
>
> Looking at just the information here it looks like this line can be
> deleted?

Yes, once the table is filled before mdiobus_register() instead of
after phy_find_first(): phy_device_create() seeds phydev->irq from the
table at scan time, and as written that still happens with PHY_POLL in
it. phy_irq exists before the bus is even allocated, so v9 moves the
fill ahead of the registration, for every address since the PHY's
address is not known until the scan, and deletes this line. Same shape
in 1/4.
