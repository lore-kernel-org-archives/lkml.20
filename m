Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F04A2248B3
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 13:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790600488; cv=none; b=OpI/1IGC5KzsmSu3HoWgVIzG6MdROhmB5wqFyOBeaHcF255GdV4FWaU2iLn0To+h73OiwK7CpmcKa86i5gqoeV/an4u1FgvE/s2V/GD9c/rNpMZbtBOa2kjIS6MQjiuLP8O9DwhCGEVvyrRDrwEXOpcXnosmst7z+d920iVsL3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790600488; c=relaxed/simple;
	bh=1HH9m5ji4s1sY0Kc7BF3d5XPKEDo83p37fxWTtZ2TW0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=VrhXvE6TkXNIocA9z7CkpNwX13F6DWrpgxwTltdh/gCLeUofsbggr8hSezbRtl3McYo64NDl3COvQ4YTQqATCe3ABplQdxpbegtD8lYNd26UjoWmE9Syx5R6q4+uRXmOj8TG5L03E0oHDfE0LCxmCf6CwejCAc0oB55SLzyzV4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=1/ujRBHJ; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="1/ujRBHJ"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D81241A103D;
	Mon, 28 Sep 2026 13:01:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A3ABC601BD;
	Mon, 28 Sep 2026 13:01:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BADD4102F21C9;
	Mon, 28 Sep 2026 15:01:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790600472; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=nrBMdXAOCQg8QIx9ZbL+1R9dDHzRihoqAIVz8o6m+94=;
	b=1/ujRBHJ0In595xAmbixqbLIdGXmia955z0CYhdfO5u+aQy21xOCXYxLhZhddIlOtY/XOh
	f5sSdEXT0TDbrg7ROPlutjA/e5hvMXLBlX01Yj1KPWHhLSQowdpuc0botuU71uN4Mq45gf
	J7Ugig0lx76xfH/pu9X55m5kLxOPrWKGlLYzBJWXHFwXmnSpYsZ568OWlDUhJuIsWGkagW
	l3qJRUQ+E2SJj1SPxZPWOEivSB04Ed35yPajlJGQkZdkAGCdv/Otq3kbWmlinCZ+tJjRC4
	DKJyzn5wLgSXNi3VISI3lLUJdFricArljU/ovbQJAmAzypScr7I3h016b9tqfg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: haibo.chen@oss.nxp.com
Cc: Pratyush Yadav <pratyush@kernel.org>,  Michael Walle
 <mwalle@kernel.org>,  Takahiro Kuwano <takahiro.kuwano@infineon.com>,
  Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  michael@walle.cc,  imx@lists.linux.dev,
  Haibo Chen <haibo.chen@nxp.com>
Subject: Re: [PATCH] mtd: spi-nor: do not issue the legacy RDCR (0x35) in
 8D-8D-8D mode
In-Reply-To: <20260928-spi-nor-fix-v1-1-ce65ba90cfbd@nxp.com> (haibo chen's
	message of "Mon, 28 Sep 2026 20:34:40 +0800")
References: <20260928-spi-nor-fix-v1-1-ce65ba90cfbd@nxp.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Mon, 28 Sep 2026 15:01:05 +0200
Message-ID: <87v77p7coe.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hi Haibo,

> +	/*
> +	 * RDCR (0x35) is the legacy single-byte "read SR2/configuration
> +	 * register" opcode and is only meaningful in the (x)STR protocols. In
> +	 * 8D-8D-8D (OPI/DOPI) mode flashes expose their second status or
> +	 * configuration register through a vendor-specific indirect register
> +	 * space, or do not expose it at all, so issuing a bare 0x35 is an
> +	 * unsupported command: the flash drives no data and the controller
> +	 * read times out. Unless a manufacturer driver installed a dedicated
> +	 * 8D-capable read_sr2 opcode (i.e. something other than the default
> +	 * RDCR), skip the SR2 read in 8D mode.
> +	 */
> +	if (nor->reg_proto =3D=3D SNOR_PROTO_8_8_8_DTR &&
> +	    params->opcodes.read_sr2 =3D=3D SPINOR_OP_RDCR)
> +		return -EOPNOTSUPP;

I believe this is not the correct solution. The correct solution would
be to clear opcodes.read_sr2 for ODTR flashes by default (if that's
really a default?) and then handle the read_sr2() error correctly in the
debugfs caching.

Also please tell your LLM not to put huge comments like that to explain
what is already in the commit log.

Thanks,
Miqu=C3=A8l
