Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794530294;
	b=HwQWe/iJo3lU0IJa2GXgFfIzwECG4BSlrNIV5vJg8aAWYYKx17Fq0P9u+kGsSkAaR66e
	 gbg9K1iGzQvNtcV6eZSMb5t049wIa6TT4mIKsMoEqOca6Shx7CHwqbyfSNo0X2h9KoDdU
	 1TMo28pGI1P4uIRckV9MpLwHDwemimZ88ICIM8JyJry6oZGDHOUgK2ndUwSgGddM5dqtt
	 mXYueZ+NVWH+3RQ3KpenHSik3+39AKZrfRQF6jQuTUUaJvwkB4SKI+SuITlRntBR+Q3bo
	 Cw13y4aHSueXvpo/X89l90qAs5GFnoHqxe/d18RDAWgJh/OdNqNx6L9nEa7eIDRROaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794530294;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=duoDFkSq7fe9og5fEiEDZZmXvPbbqJk+mbywRo7M0do=;
	b=t7N84wL5imKjJo5t+Nv8KL6wAH5fZQoZt6HFah+nYB0MTaWqNtzv4zTT1O5BXHlHBWJg
	 MQSA5nxAULIzKPCtlWyhKTDX71vZOBhPMgZ2pDNzImKtyF5riCW+VA0rYWGB+cAdobTHN
	 u0yTcFkFlf394uNmJZyZTIfBgZYl/ah88NmuJQ03XJhAVjoxo0C7dR7d1swWnPeNDX0KF
	 6SbhiS4gUyT49hzb2NIRDE2bRgemLvbj5zmzKDMlP1olPNQgf9qPX3MhlqfQGUqLUmguS
	 4jShf7LU2rankr7Xh86nBF8P2M770f0bRSOLoKMbXgyWLEOVOFOsYfHDRBERVVPxnlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hx8WV6GI;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C67606A8A1
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:38:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82C67606A8A1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hx8WV6GI
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so5510885e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794530293; x=1795135093; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=duoDFkSq7fe9og5fEiEDZZmXvPbbqJk+mbywRo7M0do=;
        b=Hx8WV6GI7COrYTUITlY83lA3f62jv3xrBMYJO3vPpozhkrFj4asH14WDng6QIkPr9A
         FRfwe07ZcGtuqaVBq56nrdgYiz5KiwN98vqSzWMPTOpq59lmQxTxwN3C8RacbNafNh6J
         Cu90jUZ0sdUl/LeTbo+RhMK9/mvOq/2a/fx/Y2hw7dcWBfyudhpSsFj51SFRG2f69XFs
         C+Rq2GaSED0uVYoq1LII/tm3O4YxvNLULJom7zFGbmq4qnR0LchSOlAKdeUBpRAXsDtD
         uZUxYec3QGwEIZ42VCSKGe1hlDYgw5H6G3P7hgKKMHSVU7LYg1meVBBXARarfVZmVxNp
         L1pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794530293; x=1795135093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=duoDFkSq7fe9og5fEiEDZZmXvPbbqJk+mbywRo7M0do=;
        b=d93a3vIvFnNs1Un1zoVeBDpMA21e4Th/FpXPPhrw2lPwSmVtmrYXlHnVVcIVbf3Jz+
         XcFGqkIAt046xxSuN06bhW2NcSiwT2+eEVJP4GL2u36QZXYsGxD89K0+Og7XX2b7k9p+
         t9xt+lxTIrIjz5Rs6cGSpWG+oBHGewPVgI9CmJ0BZc4soAKD6clLwJn3bErLl34vnm/C
         +g3wtPbz9Dltsgknz8N+tUVmxDsAjF3RBqt85Hxg+35F01M/KbwyAnX2yMQZu46O/DBH
         Cr3i7vJx8q4reRF6N6pzkGPia0TKiP7sQ0ojef99n80aqe0rBEVYeTD9iduUe9OprpXQ
         Os/g==
X-Forwarded-Encrypted: i=1; AL+hErHBhEoIZfON6YJdS0IXPGYj9QqMTgBRAKD2bXnpdQUmrdmm8QId4W14SUUZraD2R1luTMhwdz7+8X8n1kk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Dg46K7c5IICIB5XM2DLCTcfJLuijUBhir24IE2NR2pAMbdJAQ
	JAIHI/vp1oEbauKGnkUbPLeRDc+HgszelfMr5eLsL8iNc9j0ossZSF87
X-Gm-Gg: AYBFou27sVUDcEisSQnOAdBD+Q1kRojVo0ad0NFZvu0VASB5U9CWHQaxNr82t5pr3A6
	S39uEuY6iidv7hnDEmUJXxCQTfGQIxBYnfd0eE7lHnfizN3pjzJ2m7HVumJx5PMF3fe/7GGfCH1
	trm3SaRbJFLODR46toXdwWnThOeAZgeFhGy6uvpBreOuS0gcI7aGYbI2AEg2oJOgac3dfgM8LJ2
	yH5Y/6gScGtU5k3GpMTLlBtysgAO3H+OLDfNfNCt2+ENsUYK87l0pgDUTMNdqM8vjbNz5OGgcIx
	AVg9jOH0MXxJlqxs/92QaUA8W8W4lHNV8uoEoonoH86AWMXpO1NI4cP4DOFX8JqT4pfqSCm2nEW
	Yg47CJpF2/+3WnzDfML7S89YWaxDRLh1XpDpC6f8xxRapvUG8N5sgWGBo59kk501GmKKY5aCFKy
	FcQ5IbgV+sF21j38h5zSH2CpGQUvm86XAMXzjlnFy9Ak2exl8ktJjrhqUidDKgeVs0GbIezKrgr
	x1R1HTAFQ/jePGxOY8qzLN89pnrass5Yrli1RO8lw/vVwwiCs3lGz3XnHJnPNZ5ebjsWNyB68hF
	TAWN3BdlThFMuvvao68n24GCvtxB+JmTdaBGrI1RecYfLqdGXg6Cm7od/B1FhzTrtUF/Bqy1/Rv
	fa9cA7kHOqoyl0Z4QkV6C3Ht9BDrqshDLIy94eDNzsqjS4I2QDd91CR5JLjUoIVOpycs1vljLwn
	If3wtspX/ypNkmYdkWqiQy2e5TdlD6D0Q/81PlCVE=
X-Received: by 2002:a05:6000:611:b0:48d:f02e:f7cc with SMTP id ffacd0b85a97d-49c7044c3f5mr2386582f8f.24.1794530292921;
        Thu, 12 Nov 2026 16:38:12 -0800 (PST)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60116323sm1975267f8f.32.2026.11.12.16.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:38:12 -0800 (PST)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	stefandoesinger@gmail.com,
	krzk@kernel.org,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 06/24] clk: zte: Add ZX279128S CRM clock and reset driver
Date: Fri, 13 Nov 2026 00:38:11 +0000
Message-ID: <20261113003811.3670011-1-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <95690313aa006369e994b6c4a7af69b809a84337.camel@pengutronix.de>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com> <20261014072109.1759502-7-ghahramani.navid@gmail.com> <95690313aa006369e994b6c4a7af69b809a84337.camel@pengutronix.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Philipp,

Thanks for the review. The next version splits this up like Stefan
asked. The resets move out of drivers/clk into a reset driver in
drivers/reset that uses the CRM regmap and is probed from an MFD
parent, like Stefan's zx297520v3 reset driver that you reviewed. Your
points apply to that driver.

Philipp Zabel wrote:
> Don't select RESET_SIMPLE without using it.

The new driver won't select it.

> Why share the lock? Each reset controller has its own register.

The new driver doesn't share a lock, the regmap has its own.

> This check is unnecessary, fwnode_reset_simple_xlate() already checked
> this before the reset control was created.

That check is gone in the new driver.

> Why is this initialized from CLK_OF_DECLARE_DRIVER()?
> Surely USB resets are not required early?

Only because the reset code was part of the early clock driver. Nothing
needs these resets early, and the new driver is a normal platform
driver.

> This is exactly the same as zx_reset_data, why duplicate it?

The two controllers will share one data structure and one set of ops.

Best regards,
Navid
