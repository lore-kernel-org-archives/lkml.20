Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793722277;
	b=KhNIRk+UhgpvSTuY/BTUIXpte+OArsZeyG/w6Q6FH0sVAm1xXk9sq+EIbwZ1nQNFmppI
	 8xvYCTik3z577qkNrxumcqcpsO9j6B6ywFvDZMgIdu6GgHTnoEM//4KgYAjhn7dsMk35T
	 VjY2ol/hDKJaFQAh3hczfD0R0hnrWkhoefHTm1CwGP0ue9989HjZpwX5mW/uNI4pFL805
	 fojKuWWkhTfkYXRl2nJa6GbLgiycV873b00/GPwmuXhC0VeWoUrRwgL/+YtwgFzWJ8o63
	 +x/5FwMfZBqOJmbTCD+ojOWomSWpxGuEEhnjhFwrbFH+SVDCsdXqLdDvVhi9GiE5XZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793722277;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=S9QmmCvTtJG0FWP5byFcRaRFelUpQGR0S1hSw8HKBvw=;
	b=mjFRNsAqdwrrdpzHrhqBMqcfIQYNgM9mottavDtbTX9kLYDXX8pxXD1un3ovco2i4ehx
	 Wmf3Ba0slKfXUGM6rYXDTkwNEe4hJyTI3TkDS71UyyCoO19Svgs6DVHMzEQI1uBYWI1fF
	 T1FosCmRlWfOS8Ft6Gp5dGOgEBFF+2zRNqjkw3n08zCFXG7sn3YpJg4ho4O0p7Qa+uUhF
	 srIdV2BElAGPZ0yJkxKdFaJglYCXhq1jVAc6KBvipYheoSR6AilFE/Jc1wCNVeFN54jzd
	 nEjICC8Yl5c8Et/5eNNXxL2udEHcTRTJaMx5/bPgYvPVX+6TJyzQ0BypstzC3yYkwiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="J4FgjV/w";
	arc=none smtp.remote-ip=209.85.210.50
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15FD606D831
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 16:11:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B15FD606D831
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=J4FgjV/w
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-843cf077f10so5101732a34.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 08:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793722276; x=1794327076; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S9QmmCvTtJG0FWP5byFcRaRFelUpQGR0S1hSw8HKBvw=;
        b=J4FgjV/w8TSOM00kK846ON0fXJV4OU7ISP/fmG/R7LO4vobYs6uqc+EAXT5M4+/TX8
         IaztWyaQ1QZqPYYcFco9ig0lcHQj1M0eEqiz8nZ+RzVNNmbH3kuMfA2bthy+k4Ij/aZn
         rCkho9sVuYOODh/kW5ZH6R+cG/OU8AAX4Ti00=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793722276; x=1794327076;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S9QmmCvTtJG0FWP5byFcRaRFelUpQGR0S1hSw8HKBvw=;
        b=xG/jvhPCYxA477oSZR/rR0UbyomatsHefmlFJ0W5XIthOL8OtkiqY1yQ6oJ8t4g7so
         hX4R2SL3wUU5pBMuWqt6B+BAtK6r76lKvSYBwgmV8/Dw7YF9/cc0zree7mGQgMRjjvtx
         SvFfhxNYIU8MuiI1DRZNTHV15+y5NlnOdb+5KXXIRWEGmsCEpBAuK3nSnDKqn9SYrlHT
         v9mOtDWagZSg/ocUGamdvKDNIJ0zapxxZncylQjFDKuGsMQ3dn80ADWDvfxzKIXmzl0p
         dZrpzxLXsLPKcLcPqDa5m1xSSg742WJ4zKgHernUBuTasVNAb9NNKYeL0lPj/TVuNWuN
         a9TA==
X-Forwarded-Encrypted: i=1; AKwUvBz84NHZa2d6Q4WaXck1goUYTNU1Mefmru5dw+3NWtRlRTla7QDjQK2joG/7vG8Evf6MT7PbfFKfP1lWBMs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9mAsaF2I3Zuyk+5qfiTBCzsDPWRtc6884B/qBY59dh1M3pSIMP
	LgWL0ISxrqdaZ7CrthurLdldtX63o87+Me5Z9NcX2lyDZ7xRj6UtyWNXgZAjwE0VHw==
X-Gm-Gg: AYBFou1xqdL94od/SUdC8brL5BMJ7ZNOrwDcEY1SiOogDzrudMrEEoHd1IhQSTiLUKa
	72nytLzn6Js8OCeU563AxI9K/YWkkAjQYdyhfHwVAiqYZ9XsOvgpljz+Bvextb2sbniPxsu9DGn
	2XuM/f9zi1qsxsq2uiK+/h+r+vBc+XtY3b3xbQSXcoQ/85K79cSQPl6V1ndtGwEW3nK8ge0g5J9
	eFHq7WHMuAKPZMNROQY0ERqaovNvrK5lVuykbMs2N+hhwjfhOaiix5bVmjYDY4feEcs9KJUUpz+
	aU9Rr7g0tz/P+7CY+hgSa4Adg7C2crxrbXlQH+92rQjQxpyxhN1jwGaMD3MCvyLm5NAp+4nBK5b
	kqKqJjum/QuJ/fPKKlMgXCw+/N9PN/f8lNyt+O0xpEG3lR+aul3nSDWLaRuC4dzmuoBHvW0F2/F
	hZ2ly7kwcvhld5/rl4kZz6SmxEGEViZGSVe2nnVJbIbAw3XMm74v9q/IhriXNXtC0rQSSgX3mQt
	HpumRY7XwaUXpTA/z8yp1FFnmQhQQPO7oE5qLt83oehOt0E/LibGNRn9dljmHE3wGRvASx87Udr
	J6siJUyaslWvq/wy4KsWy7R5bUo2Idm7AbNbitSjr3O6fJIxgCc0ELAnT2e0HYwDIoIlpVrtgsa
	m8u+4o1hTbpA+bFs=
X-Received: by 2002:a05:6808:1691:b0:4f1:7c39:8a7c with SMTP id 5614622812f47-5640df628e8mr8758951b6e.62.1793722275736;
        Tue, 03 Nov 2026 08:11:15 -0800 (PST)
Received: from rrangel.c.googlers.com.com (194.246.27.34.bc.googleusercontent.com. [34.27.246.194])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fd95dc0sm11688383b6e.6.2026.11.03.08.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 08:11:15 -0800 (PST)
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
Subject: Re: [PATCH v9 4/8] serial: 8250_omap: quiesce DMA IRQ handling before shutdown
Date: Tue,  3 Nov 2026 09:11:00 -0700
Message-ID: <20261103161104.2449407-4-rrangel@chromium.org>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
In-Reply-To: <20261102-submit-serial-8250-dma-cancel-v1-v9-4-9159caade148@gmail.com>
References: <20261102-submit-serial-8250-dma-cancel-v1-v9-0-9159caade148@gmail.com> <20261102-submit-serial-8250-dma-cancel-v1-v9-4-9159caade148@gmail.com>
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
