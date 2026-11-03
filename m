Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793722274;
	b=3iNx9KfMMGTEWc+AMy98a6SG3E93j3tGZOvii5yRL9i6UdeYnG1Nvsl39LJJHakQAOUK
	 uSt1727xfSEq7aRLTkIyEfvKz9GTlhi401gM1G7FqAXVUZ/+HOZASxZQp7itvuIc3v6XG
	 qUMwNP4e6bj8Qr0/q7NmfwSVXmg/5ePF77cCKHN89gbdF104ZpliUiQ9ajiOUhJcg6zSC
	 L0w+8A1+GX7Xqqi4mQsSrRSXbEKTbHismX1JczdY5QGG8+WAreVvM2I0vrjEtfurr5F/H
	 RZDAM8R+8DJnsL2oxEuu4/9s+mAGR1x7eiVfRnoWj0Auii2/C5E3UW9SvlyhhniWGyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793722274;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=S9QmmCvTtJG0FWP5byFcRaRFelUpQGR0S1hSw8HKBvw=;
	b=K7D89UGROnGDWrtjxmpbkh3qCTrWW+Eh8e5jRxcsbg/LPZ9CxKqTilVlSq2CMdlBf1YA
	 5Q/QwyqzrI+ASHvkpIa9S69tnCyHKE1UY9XO03vH4CsHSoecv0wNoHDOPbjMRg+U/Rw2G
	 AcS+SrO82KvYAKRZmukMcnjLh2bPulRP/iV4xLDCWk0QH0YPzqTEazbnGeDRhaNz8NyOQ
	 /53U2z28RQUtttCyYz6a96xmkpUJZStZ9TIvtQcY/1oz3mHtnnoxi2kJ5U0yYDLCdJF0A
	 o3lSLyfiaGZOJX9avDgsIFVwPETI2pioc/A+Dq93UhrQ7RtF2nPR87jlQ4Nxgh/fUFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=IugDAkXq;
	arc=none smtp.remote-ip=209.85.167.175
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5FA606D81B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 16:11:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B5FA606D81B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=IugDAkXq
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-55650fe1f0dso2125383b6e.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 08:11:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793722273; x=1794327073; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S9QmmCvTtJG0FWP5byFcRaRFelUpQGR0S1hSw8HKBvw=;
        b=IugDAkXqOR0z/mkKCABIIFLRhPVDb6fstTz6r7Lu44SpE5PMioN7eMJ2Bz53YWUO6B
         BZptQRMnzL0fF/nwfs6PK8JwAXt6NMWJhfmD2TE1bx2r4/DXnEQqrYkEd2AR6EvfyrT6
         D0RTzho5sgqOTey2jp3qO5IImQxei5n7SKggA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793722273; x=1794327073;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S9QmmCvTtJG0FWP5byFcRaRFelUpQGR0S1hSw8HKBvw=;
        b=c3hqgxjfLDd+bqVg09un6xcT9p0TQZOUHRsRjS1g31p5u73SgUVs+Kg9NZ2yOFZQGq
         4bJP6ZCJxpDLkVx5c6jlBVN3hqoyHLM/xH6tHscGxGyWuiEXdWaJyrAYK9whvSVFZe7U
         whIOW7sQuFCDmknaGxuPNSAuolWwfSaYXUyzpXcHuY22IkTgTV/GLYOdU0r28bWrY4En
         eN1lVe05dZfnvQHAk+q0CkueKqbQOtye+oIcFwZV8tk86BycJiekpFpYG009CO93F4P2
         iQoAvueUdEK4Vvz8/sUMEYTTVxsZNGJ+yzHSvxXx5lfXyse21yaD4z6U8OzbGZvhS2hg
         f3zw==
X-Forwarded-Encrypted: i=1; AKwUvByE9px1ZCVFateORAQXaHqoq8VECyQ+9a/zDEvJWpctSK8Q0QUd/RPBAfTNwEp+jHyde5FTVoCDmzidh30=@vger.kernel.org
X-Gm-Message-State: APuU4Z+NZ3rLAErtZjaNhRZzVTq7ivu3idi9G3a++osQjTINIU75T0O4
	gL/FqllNbQ+fT99KHHghCbJyx2FNOuLa1fCdJyQdhzMqUYXSNhZ2dfZ+1teDQUe3NQ==
X-Gm-Gg: AYBFou1SKf9U9WBS18RoS+TtzP1Dq7bFf81eZZlSE7xvB8SDDLUNtY4S6IkU+0fjLSO
	nQAQ0otcKIjm2TGrIlSg6LvRGOrTFNntBP8TVXjdf9zNLGa5QtDYlSQ+gPf6b5SK+IS6wSGbQho
	1lXF/ASxvZVHQzZ/L5e+Y3xPpvpAZpNOG/nU+sKPYdvqFyDGoMRFLmVnkfK8vYRdqePpsJokPHN
	6KEXU5U/Kh8i7IvsXPmEGAz0fbeVTs+28nfEtxHN0dU5zRvRNsoGPag8T0zciK0DG2nDSUswWAE
	TQ6lJ0L0cxKntcbBcop3jwwAK8+bwbktdI30TF2PdNbIpOlJgYi8aNVXTUbLnW9wHKQ56E2PKBS
	Dd1Z/3l4tLVLN/MdPjreyEVGZZoZAwJ7q4Ni0eBfgwKT8NyquoSJYQokUBEiQdx288ke0p1lZPX
	Js1OZQQASuAknOAP+AgIHUzb4qOz6A1gzvx2Peo0gzCZq49eBpP4n7lswp9YQws9/tzhSF52fTc
	Ss4OeXxYGhRTt81QEY6WTE+gJaHE/CRu3UjNy4NR9HrB0MJH52sUV3TQlFN2Fg++obLt5ABfvCz
	WTDqBu+tnNyy4vKfg3YzYjGYcP30FxF+AMW0Bjwl10wPWySXjNikRiHiaw9kj7IunfMw/JyY1MM
	3rJ75WooqmlPIk1fZ
X-Received: by 2002:a05:6808:3a0d:b0:4b9:e6ab:d085 with SMTP id 5614622812f47-5640dd277b1mr9216799b6e.37.1793722273221;
        Tue, 03 Nov 2026 08:11:13 -0800 (PST)
Received: from rrangel.c.googlers.com.com (194.246.27.34.bc.googleusercontent.com. [34.27.246.194])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fd95dc0sm11688383b6e.6.2026.11.03.08.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 08:11:12 -0800 (PST)
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
Subject: Re: [PATCH v9 2/8] serial: serialize asynchronous write wakeups with the port lock
Date: Tue,  3 Nov 2026 09:10:58 -0700
Message-ID: <20261103161104.2449407-2-rrangel@chromium.org>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
In-Reply-To: <20261102-submit-serial-8250-dma-cancel-v1-v9-2-9159caade148@gmail.com>
References: <20261102-submit-serial-8250-dma-cancel-v1-v9-0-9159caade148@gmail.com> <20261102-submit-serial-8250-dma-cancel-v1-v9-2-9159caade148@gmail.com>
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
