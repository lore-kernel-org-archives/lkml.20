Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D75EB4BB284
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 18:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789152210; cv=none; b=umWRoXOPj3q1Fg+2zlABh/M7Ud2GYUdIAohVnWrjfFkOHJ88D3fK0BHqBvoHr/grydq/lw0taXqk7HSFQx/3mXO/xb37EpM5ArHQepVV5vcfH6o6Q1MX6utbNNsKa2lcvCTIIfrbAIWYQVvGBdvRCXwGsOThcI5T+sxqgYn8bDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789152210; c=relaxed/simple;
	bh=Vo/Zbo4FmIJeIV5z2fixRdEtyG30qlGNFYOjHoNYkqE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZOdp1dRWgDRuk39CMjv2xlANNikaHUX3Mnm5VHqr/Ag8q/kB9bS42nBxla7H/9Y0bUjqx10sB8f738RcYU8K65boeoqgsrpVVlLRwAUfoV278JG2GOnFLMCDotAW8VG6gfyhxHBSOsfvi4XCQZmGD3fkrQDp+pQDvZrIgDEPWKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hkmGIJbB; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hkmGIJbB"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843cedd129so95779f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 11:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789152201; x=1789757001; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WEMRrWkwvFIDZfKdDi5vmlHb7sgj26/s86919xqFCGg=;
        b=hkmGIJbBp4EQG8Uj6bpqrQLLIx6687IoycAymJGV+AQbiulxMddwk/XjuxgBdaOgRh
         vjlGnpEswovnh80F9t8tbcEwpHnU7ilhSJSoW0LTmXGNZMYdKZcQBLvAHXrDgJBDeok7
         ZqmJfVVT1Y2C7Yk7vcFHuRPXWxQ6+IWNvElRuinPE86yblBvn8Wnq2azuUCCa5QWd3bf
         qK4b/vMq22GGwsDShePmi7WSgExb5FsepmNmXsf5rbELNjDZ37OVZnFrpjXxcBMNVauO
         btSHH3MjcKO15Zq7kM/kfsFWwG6wlO9FmPwkucU75k99FIABnvOlg7eQK01Vvw9l03n6
         F2lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789152201; x=1789757001;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WEMRrWkwvFIDZfKdDi5vmlHb7sgj26/s86919xqFCGg=;
        b=L9ibi0q2Tmzz99wiWq73IGsbrwsypW9BU5KnNdNDRPG0w5if1hB5L5NUGvaxUmve6i
         ex5KpOkG+I6VnUC6Ti7EqeViht+udG20Dr1V86IA5Mux151d5LxCgCVFN39UYcogZQQN
         DvOtKPD7xpDES/k0MckkDe82zyltH6Oyoh18gpQ0MMWkrrWY/elMQ3p2/yiMu1Ah4M0F
         fwAZFd5Xm8Bot2NMxXyQWj0OsWfiLrl17l69lsyVrv00vfpUjgpjraf/8+bjtH+75aq4
         ZTtQY9P851PJnrIORjmAESc0alhq/FsQov278v7YNPBYrgaTsuKp+WFLoag9HiE5Ay6y
         +/fg==
X-Forwarded-Encrypted: i=1; AKwUvByGLGmQ1fKUbaTII70+f59GYqm6EIaDhliotZl/5llVQxy3JRuGEaH9GzFp984eitBCmPMpE7u42PJ+ovo=@vger.kernel.org
X-Gm-Message-State: AFuF++nHm5bDVP9kbWFHNgpG8lrNM4koI8kFYY2EBu79oytiPxbUk6Y1
	yr/nfJtuE0sQjxyGiFFNgHAg+2VMMEOKpGkp+FL47LU6JWbyLOHtd0G4
X-Gm-Gg: AYBFou3+37X+2FeB1poj1H6EgBjX9PluequlZE3G76evD+Z7Cuw7DT+hkqJvHvqZ5kb
	CZaqMNPa3wT6TQpNgsq2rFr5/P8pkVjSr1r5OO2pHyGjyLuScemJE+nlBb1Zx9RkE0w3JqEegfe
	cSFH1gv6X5V5aXpR72VVfbbEoi4OedCRsZu1TZdVXYlIlDeozaiKjivwqJfT6cDh3dMapMUXMsi
	kdoIVgq1execPZ/QikOrDd8hf7SPygvHWa3IRSG3pOlA53i+k/dJEh+RAbgn4ra2MJANVTWBZV5
	XNfju627MHR90YZlghLq7brepLAWsgIvBbvfpliXtEXvQBocnelp+CpO3ikEQOXgXBEXc28UlYb
	hbV9hRXqz324eYgD4df06ZsvldaIZJ5c4i4DmrUl7KuzyXMnLgih3KF68OpqJ/3d75U9i8QQP4Q
	xITwyR1m6+M+iwrDuCaLOVZbQrI5511WBkW7zU4SLn64yVvvq6NQEHGhmTunF7Ru6kad9XqUc6/
	0XzWlNgD2LX6N8g6uclEuA5Y28JJZFjAiU+dKWAEsS8unM+q+BjapMh1BKYbTwVkUtQk3zzI+qQ
	po1PTCmU05kg3NG73aEne2YyAoOHTaN/e1ipLq8qOn9wZmk3BA==
X-Received: by 2002:a05:6000:4605:b0:485:ac39:36ef with SMTP id ffacd0b85a97d-486eb1d3781mr14290458f8f.5.1789152200719;
        Fri, 11 Sep 2026 11:43:20 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-095-114-033-154.95.114.pool.telefonica.de. [95.114.33.154])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486f0403125sm5446009f8f.8.2026.09.11.11.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 11:43:20 -0700 (PDT)
Date: Fri, 11 Sep 2026 20:42:46 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Cc: Arnd Bergmann <arnd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Linus Walleij <linusw@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Drew Fustini <fustini@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, 
	Stefan Agner <stefan@agner.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Gregory Clement <gregory.clement@bootlin.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Kristoffer Ericson <kristoffer.ericson@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Alexander Sverdlin <alexander.sverdlin@siemens.com>, Shawn Guo <shawnguo@kernel.org>, 
	"David Hildenbrand (Arm)" <david@kernel.org>, Nicolas Pitre <npitre@baylibre.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
	linux-omap@vger.kernel.org, Ian Molton <spyro@f2s.com>, Jens Axboe <axboe@kernel.dk>, 
	Helge Deller <deller@gmx.de>, Thomas Zimmermann <tzimmermann@suse.de>, 
	"Paul E. McKenney" <paulmck@kernel.org>, linux-block@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-fbdev@vger.kernel.org
Subject: Re: [PATCH 03/13] ARM: remove riscpc
Message-ID: <aqRI3N5FPX1dpIlk@gmail.com>
References: <20260908152808.3928630-1-arnd@kernel.org>
 <20260908152808.3928630-4-arnd@kernel.org>
 <CADkSEUjYhRk-ezaXZkHzFTFQnySFSisKtZfEP-_NtLnQF+6-1Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADkSEUjYhRk-ezaXZkHzFTFQnySFSisKtZfEP-_NtLnQF+6-1Q@mail.gmail.com>

On Thu, Sep 10, 2026 at 08:44:34PM +0100, Ethan Nelson-Moore wrote:
> 
> Because I think it's cool that the kernel still supports actual Acorn
> hardware, I patched gcc 16.2 to restore ARMv3m support:
> https://github.com/EthanNelson-Moore/gcc-arm-retro
> 

Nice.

I've made a RiscPC emulator in the browser using QEMU and WASM. It boots
Linux kernels and currently emulates a StrongARM RiscPC:

https://github.com/kmehltretter82/risc_pc_linux_emu

I used LLMs a lot while building it.

Your GCC work looks useful for this. I will look at building the RiscPC
Linux kernel with it, and at emulating the original ARMv3 CPU too.

Thanks,
Karl
