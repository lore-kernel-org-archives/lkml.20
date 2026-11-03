Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793722275;
	b=33IMhchk1y4xp+J+OChuZ8L5emX1BxNFD939Z4LJdSY9zy7pIKxSHWG252EIa2vWiZfI
	 KbI8MgR/CezUy4IjhjXMNgCPqq+UwBk5JyHl78Yt/UtVawvFBTRQCA7WuzHdNri5pVuXe
	 bu7II7PueOWvsmBpRX6DUkATi7sY9p1z4/UfnnCisdS3kNKYDHrmK7/SFclwDLagx6TSC
	 WXiI6Qzc1LlbvRROmQbYMlk83ahPrRLCYwlAFAw/13I1rCeRbzneNwBwFlAlC0qWeXcQH
	 e/OdF0hEhnCRLLrvxwoKT8v/+njb9GAEdnRcD+7+/STl4zKYXR65d5+opadKQoesjng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793722275;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=S9QmmCvTtJG0FWP5byFcRaRFelUpQGR0S1hSw8HKBvw=;
	b=2t0RKPImnR5KTgdeLunZnwiu8KjKrOMBS/Xjq3hmiRZoEXnel/zmi4y/bSWa+z03wdkx
	 gtL3zoR2FRjkkwRSlf8saY+Jp9sMHf+xxKz+YmMOQBncmY7x3Bj6dZQ7XsmAnbrAxMBuS
	 0VWUlzit2KvoSy4+NhmNDbT0ZDWISBXDWSpYJr2cN2Y0laElsS7V6jIjfufZ8JPpoDUzy
	 G1XvyMqnooeBmdYtrF0qCN40tf/9F//dYM6+VpAVp32o8IvwVHjwAVQpYWRg8zzngBLQf
	 GVYzUkCC3yb5YkXFxvtF79KgkgtCan+1Kz0uV6dcxMf/J51jlxnGJuQV4fznVdoNk9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=WIEnTsQy;
	arc=none smtp.remote-ip=209.85.167.177
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88638606EEA9
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 16:11:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88638606EEA9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=WIEnTsQy
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-539a57a0b1fso1514103b6e.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 08:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793722274; x=1794327074; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S9QmmCvTtJG0FWP5byFcRaRFelUpQGR0S1hSw8HKBvw=;
        b=WIEnTsQyUlITWJ6DDuNUwPqteFgESIRZ9iwjsbu7bWti4Sw411RaxavMDAf4nBIGgV
         MhUPPVb6OrDu+Bj7Hht+Uun70CP7UA/qTjCgDVDOTd7GAf9sh2Q3Vuc9yYbGFxKQuxD3
         QWVLQZLFfcV+cUFn5egcIE2Tq1Kh+aVNsAbnU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793722274; x=1794327074;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S9QmmCvTtJG0FWP5byFcRaRFelUpQGR0S1hSw8HKBvw=;
        b=1ctmp3aeVA0ZNqDywB0KemlBvFflfMkNJ2buiPp+Xl+uAiuPGZHRNhDrzEmuIsx15H
         lfTfNpyYO4E9816J6sRyQPn22PFIO1BPsdxNGVWSuJe/C9IoMkT0KGGQWY3ryMnP6OhF
         s5u2GbLMXE5bYBSkOuSQ/kA+mnfLINIB+3D8fAoAVX+70xaNGaLWx6WCLWyJ6bBf1GW+
         ZHKUbstqhazp+NP/4wfcFcqo/N1h8RWgrfUvlVkGZRl/BrUi2zCrjhAXqP6qRHyn2SJ9
         6bcBFw1CvD6jCClgmU4xhdbJprQKc6URNmyoJOwDcf69S8NN7FcNKYzy9+JuUq3Eg6Y0
         Ckew==
X-Forwarded-Encrypted: i=1; AKwUvBz4n5YNAJ15+TFZWcgAAjTAFfAvSzLAC4QaXDPccmS9T23GYltsbCoJQ1bis2MAnkXm8mOCdNLv/xDYvNs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9vGilphJj3QufR8f0otqv78Xdzz1XhTwgScc5jadQUbUQMOiet
	ZkdZxq+trQ9K0XEIPa/69wkh8PymwR/fMc7dhTALLMXcCSgmGjq4a//kiS7UMWwLYw==
X-Gm-Gg: AYBFou2Hdynm9vP7Zt6/o3653w+mA7zPAG9xzRh8foT+X3dfIPuOvxG3B+rSWKJazE0
	/jVRtqUoKIlXrPXzqLMFVzZxE2vaJqVhrIGeYe+Sdi5xawVjI3PXodMG2A3+4+ZcHVZyrqxBhax
	+FfTeb5A+CBR8EqdKpyIOXDfWdauHJys6ZcO7i+tJ4UPI9uAWS4aKz3iDsL13C6u4rlhHEN9MuN
	J+jZ37Q3aniLHb2beZkakXPR0PKN8wjcFtihgm0EccKm7b19t+y2Jr6/JHUS6vg2XTSzQihpbzs
	bMDYtQd5jfxcn7Vdl1c0C3AVCIEif2w92mxF4CE+nl+nBGpilIaUkEPS7zBWVSxFRzXvAa2jwVl
	7FZuP0Fw6pbl2HRxL71pMRKvRzbd+olcfaRyiOpLHhPM+oIb/+0K3kKD3sEd05U5l1h8guPwbBJ
	BKOYfEuwH8MCf8bKqCSR77CZxW65rdOtE6mYZCcexwiB4mXxXoz1LJ4gZ9Q/nON7rvEro77ievF
	I4Rfe5Ejz0IhWvv8F/1+w8gkai3ZBqBT4SSwmrUyfbO7vOXzYewpCfxyE1/ZWyqeAfMs4bIsr+K
	e6wWxT5S2nc//rc9pAvJsDS+p8MAgpXI9wppzRbo3AFhlLjU4POiGOjR4FAsj9sztiTATdNnx54
	NH6pVHscnBnG5csg=
X-Received: by 2002:a05:6808:17a9:b0:4f5:7723:4c9c with SMTP id 5614622812f47-5640dd9c160mr9485684b6e.30.1793722274540;
        Tue, 03 Nov 2026 08:11:14 -0800 (PST)
Received: from rrangel.c.googlers.com.com (194.246.27.34.bc.googleusercontent.com. [34.27.246.194])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fd95dc0sm11688383b6e.6.2026.11.03.08.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 08:11:13 -0800 (PST)
From: Raul E Rangel <rrangel@chromium.org>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Tony Lindgren <tony@atomide.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Richard Genoud <richard.genoud@bootlin.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>,
	Timur Tabi <timur@kernel.org>,
	Peter Ujfalusi <peter.ujfalusi@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v9 3/8] serial: 8250_omap: serialize RX DMA completion and flushing
Date: Tue,  3 Nov 2026 09:10:59 -0700
Message-ID: <20261103161104.2449407-3-rrangel@chromium.org>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
In-Reply-To: <20261102-submit-serial-8250-dma-cancel-v1-v9-3-9159caade148@gmail.com>
References: <20261102-submit-serial-8250-dma-cancel-v1-v9-0-9159caade148@gmail.com> <20261102-submit-serial-8250-dma-cancel-v1-v9-3-9159caade148@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Reviewed-by: Raul E Rangel <rrangel@chromium.org>
