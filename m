Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25C4F38E5ED
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 21:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790197393; cv=none; b=CD+yXtRLK41t7RnczpM04Fazpzh5o4Da8nPkrdtdTSjsFGJx/vqKoeOlcHMrC6CBITv0T3NuSPT79k7D672NkUgIXnOsR1wTx25msmpTFCgNmNwVY6EW19z64b1ajqBYk7wBzGsZeKl+Hkx2Mok5i+nKX8KKZ1IZ2TkDIhsXBhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790197393; c=relaxed/simple;
	bh=V8xcOFGWQPMTSprDRa3yYxi8wSmB7wiOFbJrnC+xVpU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lsJdSNuxPfilWtgh5mtrI5BmSgJ6Yl9QI4znUHY6+NZK4n6E4Cq7z+Jk5CSK3G2ZalX6dAVqK/LOgWEZpwjSmSngDR8+G49GBZ2iRc6F5NdiKDg698SPY/08h2+8Zk1LgN3QQ0HAZWRG8bW6d+m3YNhVvSr4zIeeg6dWm+BhhjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gJPDRPe+; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gJPDRPe+"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39b9184fa80so1022305a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 14:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790197386; x=1790802186; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=urjJV9cwlFxNv7KbCDA3FefKThqBp2XiJBexrbouUOU=;
        b=gJPDRPe+qvka6cj7HYwLKP0tiG3MevGU8mCw7NPojuSFFb5/6YEvSoOlrYUOaWVEDC
         tGr1hUtBPtJk9AsroEZwOwgRchfdS+ysXmUM1bJfgmr4x1lgfb6/ZeTh3mwGrN3CL9mu
         nxb1TJUYonK0RKjcnxE0B3zwIVBx7JfwWxPbgJ7bwvc7ZHkgpEcTCLsR5biecKuy5iKS
         wdODEByDMGsZGQQi1zjDQASzQ3M7qDWQhRpbmIpzK39mjTdVHFK15TEukXcHeYtNeaz0
         W5iQ5ATx7K/lpiIbsSYStYoYM3b2leiC2YDLFMELY/XUp+9fCAIMdR4WQkLs74WIYubP
         vktQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790197386; x=1790802186;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=urjJV9cwlFxNv7KbCDA3FefKThqBp2XiJBexrbouUOU=;
        b=AFakRgw9JWfnA+L2nT+48ZXQgESgUF0FFhaIWheXrjGX4gBIJAYMA96+/MBxHB17S/
         NDnRQq7Kz5FNpSlDcc7Lm5o5+hlTsyoBlRsy6KFwvEdZuuRecYeEnC4qIHgT5v9kLF/c
         s74GF5XUYMlB0LX3km61Sr6cldzy0pVjMQiorwTk/VFA1xsAsb3edrf3ERTuaulRQWAN
         0SSoYw7tffNRiPFgqP6VRxBizwzxMNDilJdtYgPkqavWgAEO7yj+wlDZ/BA/KfvTKV9k
         KlWEVRL2PEXhYVCGT7rRnJWwL5hnRqRTiTniPHjs9oAhHP7CXXI8Apz7G1ECJ1YCrV1M
         Kisw==
X-Forwarded-Encrypted: i=1; AKwUvBzdUkiHdmTgLZ6HlJ6oHAohkbVqKMpTf5+p833tJBoiRRLVvtKpTuWtDomUk1Sq9JnOFMxEhYV8N+9XZLc=@vger.kernel.org
X-Gm-Message-State: AFuF++mPN2B0sJHPmBmLfBwOR8ysNsZDpTSRAcu0bFWt4sOoZq+ICpWq
	4Tb6ZjKaOtOigA3FR731W1twQqvLmsoPrQqpK6aFpsulVMOOffOpr+ir
X-Gm-Gg: AYBFou0F1tmTNtFj7//5LiXjBi8lvhzadin1IFVDSt190KCLjaUsMCW3VzCKUC2Kb78
	rFrzX+CdnJUxy42n6ayZwzB690Q8tJo9qI87F4kyqbwpf5MfEaMOtBdLS+pManvvhLrcjvdn/ss
	2b8Jan1HseLe1ok9NltIhEkXI3BwAA8N36AetVx5Q1gJDKJ0gkgonhdxpiwQ/MWDSImRJAZECX4
	INAbWK5Jqy2Q1LshRtR9bc9znD4SWNS9SArY74Yf5nVpLc5iFGe9CT1Jzu4tDA2F9Lm8N+5Cp4d
	ORQyqERJMpTDNIn5/VgNzN95iU+bkb4y3ABJNUA4993CBDzlYyyLXKfM++Wgjf4m1mBX/WDNp60
	1zMq0CC1kT52yLXQKXYsuAzjPrtF4XJ1QC2vZM812AkeIHzRuw04TaymCyviumiU8E8CY3/26eN
	jFfZ7I/tAh2og/qpU9D6eQcA3NLQl3O0sAwIDeZMEa5oIkzEJksMRrbNOYCc6SBcqmV1KzQw5Ox
	w+dCMslUMgN
X-Received: by 2002:a17:90b:4c82:b0:39e:6c68:1552 with SMTP id 98e67ed59e1d1-3a09896ee0fmr243012a91.26.1790197385901;
        Wed, 23 Sep 2026 14:03:05 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0972b15f1sm848270a91.2.2026.09.23.14.03.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 14:03:04 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 23 Sep 2026 14:03:04 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Primoz Fiser <primoz.fiser@norik.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Lee Jones <lee@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev, linux-watchdog@vger.kernel.org,
	upstream@lists.phytec.de, andrej.picej@norik.com
Subject: Re: [PATCH 3/4] watchdog: da9062: reset board on watchdog timeout
Message-ID: <10de1304-577b-494b-b8d6-3792ebd1bbf3@roeck-us.net>
References: <20260923111719.2032012-1-primoz.fiser@norik.com>
 <20260923111719.2032012-4-primoz.fiser@norik.com>
 <146c3502-3205-43ce-9d1c-c58b936d160e@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <146c3502-3205-43ce-9d1c-c58b936d160e@roeck-us.net>

On Wed, Sep 23, 2026 at 02:01:03PM -0700, Guenter Roeck wrote:
> On Wed, Sep 23, 2026 at 01:17:18PM +0200, Primoz Fiser wrote:
> > From: Andrej Picej <andrej.picej@norik.com>
> > 
> > Implement a method to change watchdog timeout configuration based on DT
> > binding ("dlg,wdt-sd"). There is a possibility to change the behaviour
> > of watchdog reset. Setting WATCHDOG_SD bit enables SHUTDOWN mode, and
> > clearing it enables POWERDOWN mode on watchdog timeout.
> > 
> > If no DT binding is specified the WATCHDOG_SD bit stays in default
> > configuration, not breaking behaviour of devices which might depend on
> > default fuse configuration.
> > 
> > Note: This patch requires that the config register CONFIG_I is
> > configured as writable in the da9061/2 multi function device.
> > 
> 
> Please reword to something like:
> 
> Implement a method to change watchdog timeout configuration based on the
> "dlg,wdt-sd" devicetree property. Setting the WATCHDOG_SD bit enables
> SHUTDOWN mode, and clearing it enables POWERDOWN mode on watchdog timeout.
> 
> If no devicetree property is specified, the WATCHDOG_SD bit stays in default
> configuration, not breaking behaviour of devices which might depend on
> default fuse configuration.
> 
> Specifically, "There is a possibility ..." should not be part of the
> description at all, and "Note:" should not be part of the description
> and be moved below "---".
> 
Also, the subject is wrong. The patch does not "reset board on watchdog
timeout", it implements support for "dlg,wdt-sd".

Guenter
