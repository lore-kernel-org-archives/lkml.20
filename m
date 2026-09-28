Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E8DE49E13D
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 11:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790593547; cv=none; b=fcyTw7yZUZ9NU3m0Gyhi2/w0PfMbP+2drVncBHOCrpMvMRn9fdp9BcClX20F3XDa0jNhN6PyJ/PfKyMr8GWEPcdfAX120740InJwDINf7NCGvFpjG9l30/hQMuZmV+DTkjOQz2xOL9dMFG+RSk4Na/Jb0125AquPuQGmPeDGOSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790593547; c=relaxed/simple;
	bh=1XbxKDdXCB0xh56Jj6qRN9S8aTlmP+aUKv+mEwrdbKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TDSGCzxx8CwaYE4LvWa9IIBO/57Ru8EUKtPc8b0n6F5OtSCXeCP5Jm3yLPjoIm9fULsqpuuR1WWFxOIjfdWgA76g0NbXGbybiQ0cNM1keV1kKGQaJPQK30BGJhqA5eLInMUxsStmXuF4B05bwfzoTb4hiIeyXXj0SHGLiGPlfCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R1Gv7ggU; arc=none smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R1Gv7ggU"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-34215285aa1so765893eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 04:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790593545; x=1791198345; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2oM1knUDIGNS9SHIcgxqk4g+0rPtoqn3Rt9m8E+9mag=;
        b=R1Gv7ggUi6czGna3d1A2oqULin9yrUJM6aZO8s/sjpIJ/G8/10p4o9A1gVcMBOQZOc
         SAWhJaXMCMZS+4lR49kUnt85PtEv0jKVUIXmcQ1lJoo8Acjs37TwIDEgxUYhfUCPEj3t
         u8PcpzyHOFCbxYvl0p20kgW8ZoajPbiUZ/pBHiPcNKBIuBpV7VA1YceT4kmLu1CusBT9
         VRFtwhChkP6hiA7JmNMMJIkKDEf11PDuzNXPbRydJ2e5QI4RG3wNog24PtVJaKaIZ2jr
         loxXdSzksl3/+sFhh6tYjGi3cwBIAlkIPzK2ulk1vmPm7+iN+i2WteQPmK+zsmzdImnL
         yKxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790593545; x=1791198345;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2oM1knUDIGNS9SHIcgxqk4g+0rPtoqn3Rt9m8E+9mag=;
        b=Kvqkqqmfgm9Eif17dHwJkJ1Gv9dya4lHlBn8sOK0paSWKJw8/W9mpH1ZwUILnRlnFH
         6bxc+Qe63yMoKGD3Ctye2L9RAYos2xBF+2Ppuf2ou/O1rDpvlpT58/5ra0pNlixjp2FB
         xH2Gdm7GUxxkawgBpKppRu1oxFljKjP3tIy85WD2yFicrhH+HV2+adM3h+KYL75cT1ML
         YQaUGf2hoTsaCkZKIeUu35JH8CYHDYlr8WMkix0qQQ7tddRLgZRi2JGEK/Kfdah5nATa
         S0sRAqys2/yxLHSsTRZmsSTem/n9WVxzyXXl5xuK1bkVoOcxaenOHmKIAoSonfDBvpNy
         KABg==
X-Forwarded-Encrypted: i=1; AKwUvBzTx2+RP1ceJgXk30wbFT0dJvNO/hMCYauhl0BEZpas4XDjWyOY4I9K9FbuQLr+Mz/q3nsOSIlsvoNsEMA=@vger.kernel.org
X-Gm-Message-State: AFuF++ltZKUTnQ6qUaNu8TbwtrK3POqEViLxXysLKqjgvCJRfoy0jtSM
	xkhsC61QMk1x7lcsc+R7HSF2PMaDAbEqdzVukULM/SV6lI7MiDG8si0A
X-Gm-Gg: AYBFou0+LtOONc2lDS8aVAf9OJxVSfN9bq3edTJrq8oxdJ8+ZOlDLpN7EfsIK758PPJ
	mYu7VorutlhCeLRZ2SwIgluKaYzxLlYgwZx1SY+Df+FU8bDKxgs0hJAG5/85nShUfJ2hYikC3PK
	CiTexMVoRUqvdF6kUFfaCClN4VZHcNZWpjAmhALo1urLBfUDvYolF/klvf+/6nuIVnm2Ba6qH3T
	bJkpZFul5oEWxK5ctM2/RD9xNbrSipdOBRu8sYjNPVZNyD1SF2cgq0GaZXx2QdB44MRakxzaw6x
	8ktba2R9E1ksyLLkkLb6kPXsbptsTuzbFmC4mAt7UQ9TZ4H9HGo+tE7cLF8lY/6WyRrgiE1mexi
	edzGu4BlaOxWWAQfHQfIYqFQofPhGhf9cNQwew6QTbSDeiUcflMIYHHGYyt3JRaLCcorIp9HpIW
	bemzXsTJGVksjzWXYSbdcGsS5URxTVhfLwldN7pn/3Lw8s+LwHDolYALz8LrZaKy2hYXncGRbQu
	2kBck5CxUpU
X-Received: by 2002:a05:7300:b54b:b0:33b:e586:ba81 with SMTP id 5a478bee46e88-3427265fed0mr11177549eec.8.1790593544833;
        Mon, 28 Sep 2026 04:05:44 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34141a4a5ecsm29390123eec.3.2026.09.28.04.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 04:05:44 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 28 Sep 2026 04:05:43 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: alexei.solcanu@pm.me
Cc: Cryolitia PukNgae <cryolitia@uniontech.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Antheas Kapenekakis <lkml@antheas.dev>
Subject: Re: [PATCH v2 2/2] hwmon: (gpd-fan) Register both fans on the GPD
 Win 5
Message-ID: <72ea804b-6d62-4f31-985d-4f3f0359b5be@roeck-us.net>
References: <20260926-gpd-fan-duo-auto-v2-0-0a2ea41ee3b5@pm.me>
 <20260926-gpd-fan-duo-auto-v2-2-0a2ea41ee3b5@pm.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260926-gpd-fan-duo-auto-v2-2-0a2ea41ee3b5@pm.me>

On Sat, Sep 26, 2026 at 04:11:21PM -0400, Alexei Solcanu via B4 Relay wrote:
> From: Alexei Solcanu <alexei.solcanu@pm.me>
> 
> The GPD Win 5 uses gpd_duo_drvdata, which exposes a single fan and pwm
> channel: pwm1 writes the same duty cycle to both fans, and fan1_input
> only reads the first fan's RPM.
> 
> The two fans have independent registers. Fan 1 uses duty cycle 0x047A
> and RPM 0x0478/0x0479, fan 2 uses duty cycle 0x047B and RPM
> 0x0476/0x0477. A duty cycle of 0 returns that fan to EC control.
> 
> Add separate board data for the Win 5 and register fan1/pwm1 and
> fan2/pwm2, one channel per fan. Boards with a single fan are unchanged.
> 
> This changes behaviour on the Win 5: pwm1 and pwm1_enable now control
> only the first fan. The second fan stays under EC control unless pwm2
> and pwm2_enable are used.
> 
> The GPD Duo keeps a single channel, since it is untested and its
> second fan's RPM register is unknown.
> 
> Tested on a GPD Win 5 (G1618-05).
> 
> Suggested-by: Guenter Roeck <linux@roeck-us.net>
> Assisted-by: LLM
> Signed-off-by: Alexei Solcanu <alexei.solcanu@pm.me>

Another patch new revision sent as reply of a previous one.

Where does that idea come from ?  Can _someone_ please let me know ?
It seems like a contagious disease, but no one is willing to admit
where they caught it.

Guenter
