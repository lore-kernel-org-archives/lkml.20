Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793722280;
	b=YjmQSbPGWuBDQAxMgJ3fo+E7zRVju5zBGZ4cUZv86+XAtyRYZTQ5twS6oeUKH3+f3VRi
	 RxurMdJT9o7QAuyLt0CQ9GGDmY3kqBwxOaQi6fTMppC5UAhlqoMTZAJ5+gxwg6uy77IKH
	 kRKs/8fPEcaDfrxN548EtTgfHQdqgLQVPpaA81IYwIlVXg0onM0SWwNNCs5vk5Jt9nx7/
	 fBdZqrsKzLpjlt8rboCkMTsI/suRb6WmLIMnVOwgD5OQ+st5dO+drocMaFLYk11ZvhHOf
	 3kpTGSosvWYeJROBONZXEo6Qd0RiXP9+AuQ9ywQrAxumwqIz1N8uSrhcQdLARA6A7Nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793722280;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=S9QmmCvTtJG0FWP5byFcRaRFelUpQGR0S1hSw8HKBvw=;
	b=QKRKy85UqtTHRBMO9yPdS6azzhmOAKcb4EGH5h6QGjeQna//l1jjwr3XG3XXwk6BBo/7
	 7/3vzA7pi5qGTEagT0eONSyRxnzyKOJvKZ1zQ7JNX9O49gwp92Ibbdro/sFJFh+imWpjD
	 wsO4z5DZy1Jwy1Ase6TGZ+bBrgDI1hQP3wq3n5/deCvs1Vfk4QfT3XB/PGo3WBDovOCRD
	 P15cGSC7qNQhvLWPwkPMjBS3nRijucYSp2Ks7aqN18syRdi8coC1SXIhUYYPepcMc/RAH
	 q06O4gXAtITxjUyt09yiXZSQMZylpEvDF22ByDyYOsoERqWI5pqy6TPd9NW9zIj6UQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=QbejB7A8;
	arc=none smtp.remote-ip=209.85.167.174
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B3A6082BE3
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 16:11:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75B3A6082BE3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=QbejB7A8
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-4e4a4d77e5bso565286b6e.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 08:11:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793722279; x=1794327079; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S9QmmCvTtJG0FWP5byFcRaRFelUpQGR0S1hSw8HKBvw=;
        b=QbejB7A8kljkTCasdabAllkMvn5P3rHgp1Di4wEbgiOZl6txqhxl+t4Z2fR4bYJEvr
         6hCOTWWcKLvbWZcReJ+ULtfCHUJn4+ihh249PhfIYTHbU0g2vbQp2+P11dUniXHy2wNS
         LfntX1auU/e8DpZi2UDdP7FJJxHmLiOFAWFi0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793722279; x=1794327079;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S9QmmCvTtJG0FWP5byFcRaRFelUpQGR0S1hSw8HKBvw=;
        b=zgAIAvme7tVJf6zCVZt4dHXo8mxgOCoUkVH8HRhZFrhBIR4hI8IhXTaW8wqbL/UsLV
         HgIBx1jDSvSIs+eB9nG2v3cnFGMFT4dy2poXzCsVTVd2VzIkP/7NUlV975ANSiRjo4Fa
         VcIdZFDjHc7MCwCKIRf8ittIOWJ8QPyZKmpPREGR0C+qTv+w9+0SgL0HggcRSjeED+AE
         eJjxAuriUZWORPCqwPFEjk2PbmaS7/WKAEcElVkRuCcmhAkziJ09kMPE2ig3e+Ci+61A
         2V2FrPxSXLUBIah7vbbGceXpRyDLG3khu3hPb0bdxkt1ogfwScbiakMaUCgk51jKiwSr
         jUwQ==
X-Forwarded-Encrypted: i=1; AKwUvBxxpMJOGhnCq2nx4Q9dnjO+1ZxPNxGfI9sJf6orusH4Y/gNVojxlp+UGP6qR9WGyQ8+5tpvwgCXjZ7HTxk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+J6W9Oc44QExPnkKjK1jkeONz9Q/1PreV5LZryCC9LSdksUbeO
	zonszXgKvMYsj6aRWp6/7XldxP9AZDS7/Bby/cJfe/kgP+c3uNrhMaX46ROfz8QPaA==
X-Gm-Gg: AYBFou3oJTlKifpkrSyPC38GxDQbYi2B9buX8AILebKaK8YHqpwco2TCx/vUjKALlpD
	r89eJ/Jd7IRWGvoLNwuIY0yuIG5AidYDtdHYLx1lCEdqoSJzDyCeJuanu/8VhQ0OdpLNTl3F/FY
	fn7VQA5VeWm+UlteLFLcL0dSVqZ0Zz01I5q4qYde9PFOBpT95D8LVNssNwuIorFxPHoaMgxFyvy
	jNeHwI5hra36vFC/XsxSjdQ3ZRjjm74kdSzLVYvUBLqw61jim64AWtTewV+GDWgjW1MJuQUl6cw
	r86fuKbspIPdyxnM1KDgnvUupay0wzL02c3fmFU+A99KX4FZJU266XjFeqLKmxpFfZPtgHoPAlU
	Krw7joIioqMlYVSyjMdmZSG3aDF5eBa2VugBnuZsWk2zDeI1SpDxrmd8XmYwpsNj7ky9X5ozMIx
	WGSbNG3sBPM2qWkbui4UyJItY5wemQFc6B1YQX/+bEGw+cRYcsPlOEBAovRXgp/OKaMv+NtmYmL
	vXp8hEy/ZIpn8gmKd+xzOdw1RC3SG4LhRfKr8gJMYC6O8j5m71K4DhXkUYzoqV70GDWkwFnUyM0
	qKemiS504lKBQH7HCWkmSkSlpZcZJfq+8D2u4vouEYg73cGa6aJ9o+s0GZVCiqQoouxGnPMwdZ0
	heoaSCZPotZoqhw4=
X-Received: by 2002:a05:6808:10ce:b0:4b8:46e3:e220 with SMTP id 5614622812f47-5640de87067mr5635130b6e.12.1793722279518;
        Tue, 03 Nov 2026 08:11:19 -0800 (PST)
Received: from rrangel.c.googlers.com.com (194.246.27.34.bc.googleusercontent.com. [34.27.246.194])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fd95dc0sm11688383b6e.6.2026.11.03.08.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 08:11:18 -0800 (PST)
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
Subject: Re: [PATCH v9 6/8] serial: 8250: drain canceled TX DMA before reusing its buffer
Date: Tue,  3 Nov 2026 09:11:02 -0700
Message-ID: <20261103161104.2449407-6-rrangel@chromium.org>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
In-Reply-To: <20261102-submit-serial-8250-dma-cancel-v1-v9-6-9159caade148@gmail.com>
References: <20261102-submit-serial-8250-dma-cancel-v1-v9-0-9159caade148@gmail.com> <20261102-submit-serial-8250-dma-cancel-v1-v9-6-9159caade148@gmail.com>
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
