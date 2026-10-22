Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792666296;
	b=QxParXzrV2Z7TheWXvrWXpZjP6DzLll7tNbSg05uXSXARR5LfRwZaKo11Mi4mRmLxLhB
	 2F62ERFSEjksZ6IuZs5OKMvEezxwlWOHGc+OmK6VeIh9P2Po66OpP+Foh9z8qec6f1ww+
	 km3GU2N0oasJzabiSKLVwkQBxgSFfwMu7fUwPhsrmjmbfz803o+SRbjefVMzGGYYGuXUX
	 nQ0V/1qz0/7mZuOMlpWWm/7rp21acVt0f84S10Ui3Ich2itRm9Q50PQC97/bDov4C/MdL
	 zs266Z/8ByDHWy39RFZcHNEi0PI9pviRuaDDY7skml2NHct/A0GosWWp5JUC13qNtuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792666296;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=b7ihbGSWVLPuUe+7XubAjvHWls5cuf5rKU39/PaWcuw=;
	b=S8iRnMC3IXLuOKh7ZfSIVH95WyiMqj8wOE3rG05CeuHqZaLSaDk4cusZefSY0FBN7niq
	 bknwvWfIxx/HcYQkvT2tXXwHPV7HCnR1x4lJSjnZk/Zr5pjmBJi+9HwSN0TSlsZjvKinT
	 /jaWlIqKYmIERGo6YHN/6v61AazGV0AHou/N/ufGN4MIEFcbyI855qMRkc+gId/pnFCa3
	 UqPSeRHg6h8Xplnb5Rnt3Yst/bqvge2ekclTIrfC0nwIipgqfJI2foFIaNe4wvJw1Yms8
	 bC9yf41prwS2pL1/Cq3uvf6FpKBVtdVyFy8ZR4vprQ61ZIgMFiylez+cDkk2yTMaTgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=AQxVeyyb;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C436606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:51:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C436606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=AQxVeyyb
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B9494C58472;
	Thu, 22 Oct 2026 10:52:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5A92C60360;
	Thu, 22 Oct 2026 10:51:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4ACD310328D6E;
	Thu, 22 Oct 2026 12:51:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792666292; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=b7ihbGSWVLPuUe+7XubAjvHWls5cuf5rKU39/PaWcuw=;
	b=AQxVeyybWvNhpYdzlh8vAq4aInIZo7CBTAdsck0AVY3jEC1K75GkphIP4SVc8imY93RBR2
	l8+P0nokuVroD4uwhJnKWHztaqo2GE1PzxkRbKMzSrpetwopybBppJOUdsnzfoAE8KedcJ
	PjjLBUHd/h4hflbypURLAOeAm8Cu8CGbTqEdS0DLDv0wvQDFSEwdSWBUJs1dVt9OYiRsRp
	ZzNXb1tY9RWuIWPsrMlfh1Us37b5z3SlaKJT4WpOkFIczRuwRTN56eZeylh8VDYKWlzrQR
	lVPWtf945X2Tw+OhODpl4sW56m+gHkjKxK53C8QSNtcjrR7Kp9dYbS99xo7s4A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: haibo.chen@oss.nxp.com
Cc: Pratyush Yadav <pratyush@kernel.org>,  Michael Walle
 <mwalle@kernel.org>,  Takahiro Kuwano <takahiro.kuwano@infineon.com>,
  Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  imx@lists.linux.dev,  michael@walle.cc,
  Haibo Chen <haibo.chen@nxp.com>
Subject: Re: [PATCH v4] mtd: spi-nor: clear the default read_sr2 opcode for
 Octal DTR flashes
In-Reply-To: <20261022-spi-nor-fix-v4-1-fba3ec3d2b5e@nxp.com> (haibo chen's
	message of "Thu, 22 Oct 2026 18:45:16 +0800")
References: <20261022-spi-nor-fix-v4-1-fba3ec3d2b5e@nxp.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 22 Oct 2026 12:51:29 +0200
Message-ID: <87o6cmovny.fsf@bootlin.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

On 22/10/2026 at 18:45:16 +08, haibo.chen@oss.nxp.com wrote:

> From: Haibo Chen <haibo.chen@nxp.com>
>
> The core defaults opcodes.read_sr2 to the legacy RDCR opcode (0x35), and
> spi_nor_cache_sr_lock_bits() reads SR2 during spi_nor_init(), i.e. after
> the flash has been switched to its runtime protocol. On an octal flash
> running in 8D-8D-8D mode the opcode is extended per cmd_ext_type (e.g.
> 0x3535), but RDCR is not a valid register read there: these parts access
> their status/configuration registers through a vendor-specific indirect
> space, if at all. The flash does not answer, the register read times out
> and probe (or resume) fails (on i.MX FlexSPI: -ETIMEDOUT and a controller
> WARN(), seen with a Micron MT35XU01G and a Macronix MX25UW51345G).
>
> Clear read_sr2 on every path that enables 8D-8D-8D, so that
> spi_nor_read_sr1_and_sr2() degrades to an SR1-only read and no
> unsupported command is issued. A manufacturer driver that genuinely
> needs an SR2 read in this mode can still install its own opcode in a
> later fixup.
>
> - spi_nor_parse_profile1(): the common case. The xSPI Profile 1.0 table
>   does not describe any SR2/RDCR read, and it runs before the
>   manufacturer late_init.
> - mt35xu512aba_post_sfdp_fixup(): some mt35xu512aba batches lack the
>   Profile 1.0 table and enable 8D here instead, with the BFPT QER field
>   left at a reserved value so read_sr2 keeps its RDCR default.
> - spi_nor_no_sfdp_init_params(): non-SFDP parts that enable 8D via
>   SPI_NOR_OCTAL_DTR_READ keep the RDCR default too.
>
> CMP (the only user of SR2 beyond quad-enable in the locking code) is
> Winbond-specific and is not placed in SR2 on their 8D-capable parts, so
> no octal flash loses a usable SR2 read because of this change.
>
> Fixes: b7b63475903c ("mtd: spi-nor: Create a local SR cache")

Is this still relevant?

> Fixes: 63489002d397 ("mtd: spi-nor: Refactor Read Status/Write Status
> support")

Will be merged in the next cycle, so Cc: stable is probably required.

> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
> ---

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

> Changes in v4:
> - Following the Sashiko review and Miquel's preference, keep the
>   capability-based clear but cover every path that enables 8D-8D-8D, not
>   only the xSPI Profile 1.0 one:
>     - spi_nor_parse_profile1() (the common case, already in v3),
>     - mt35xu512aba_post_sfdp_fixup(): some batches lack the 8D command
>       info in SFDP so Profile 1.0 parsing may not clear it,
>     - spi_nor_no_sfdp_init_params(): non-SFDP parts using
>       SPI_NOR_OCTAL_DTR_READ.
> - Checked all vendor drivers; Micron is the only one that enables 8D
>   outside Profile 1.0 parsing. Macronix and Cypress rely on Profile
> 1.0.

Winbond as well (see my W25QxxPW series).

Thanks,
Miqu=C3=A8l
