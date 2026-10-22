Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792666076;
	b=jaUL5gV36IgYakI5pQGCltoxYaTC6Co9+z+oq+LkXmfyQc6b1OoT5Bk0FINZIL7urzb/
	 cpnAqKWetxj5wkA/dkDNKI/iIwh52lQVIOPINqSdURW0yLJMbs4Yoq+zotaXndELH3D37
	 954DlidAeg4TyhUQONQPXZP2ueM2cY1yl4vT0eKjzGQfAsEKbkUmwMrYM+SsBHe3+bKpR
	 12SpmGIakcvaBYEwe2L+OJTK8VBTwYgYpRsdxlxIyg4CnA3zLDCSQTSTN+lEyipVIFL+G
	 2AEbVlYoar9ozjkEwRdQhp4IQjJ8Krb3zWMrelCHaY3KalaR2xxrsnIOfux68SGQmgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792666076;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=gvdAk8PUxpYgSiS/h7dzJZtjfb09gWIuT4zPW30I1Fc=;
	b=PYnlnG3Hk132jGRcKHqStjIKLKFgeeiEtnOO+ODKhjoaMiTsbKamJlDBfHvPmgrmJZgX
	 SJUooPmer0VBT+uwnqnwOCqSHO0y1+VVM88/MFxsEx1frNs2yGPSkoaMCeOu21TJOwElp
	 5ApeXY/JzExLJI2KsH6Xhm0cEIYarJD7q+TG/C/7E1u7ar8PHavB39jsKdt9ulbvDF9z6
	 3DqGQoWjkxjjR/0Ea5WDl/i5xP5CVaQ93SkBAHD6lmW9nIRbrsR5FAP1NKaKEbdOFqO80
	 y6+OcNaVWxTCK3GezCY12Eamv/Bmv8Aqe+UvN5nNOovwqzbytsD00tMNn3EBklwXghA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=QArawM2v;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4BED606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:47:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4BED606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=QArawM2v
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 93F141A12C0;
	Thu, 22 Oct 2026 10:47:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 62E1060360;
	Thu, 22 Oct 2026 10:47:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 760F110328D6E;
	Thu, 22 Oct 2026 12:47:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792666072; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=gvdAk8PUxpYgSiS/h7dzJZtjfb09gWIuT4zPW30I1Fc=;
	b=QArawM2vEriQuM5fvOOjuZ0qXrN0OQ/7B1ExbBQX5m97I75QAOaVU7998qvsxTolWnLV2+
	o8UqVfqhjWNLVr18Qglx2xQ9wAVNxW5HZfW1tl7j0ZGb/LZYWAqUAuCs10NvZpSazi2/nu
	WqAepilraqT8lEyh4IT3vIPoMMlXxJFpKE00yrfn/X7RIj5iyoN4bBFY/tuh0EakFJkEf+
	N60uf7CWzw97Rm2tn77AYei+UXZCFCMN5ZRy/e3lmt3EhwLujISZ8ltTHzi4nsHe58O7uI
	vcpnxupji6uCkfMToVU7eIV2EpzB5tWWfXo6Ec1ePLH5giPphlgbSqWHNOi08A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Michael Walle
 <mwalle@kernel.org>,  Takahiro Kuwano <takahiro.kuwano@infineon.com>,
  Mark Brown <broonie@kernel.org>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  linux-spi@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-mtd@lists.infradead.org
Subject: Re: [PATCH v1 4/4] mtd: spi-nor: macronix: Add 1-4-4 DTR read
 support for MX66L1G45G
In-Reply-To: <20261022102614.75696-5-changhuang.liang@starfivetech.com>
	(Changhuang Liang's message of "Thu, 22 Oct 2026 03:26:14 -0700")
References: <20261022102614.75696-1-changhuang.liang@starfivetech.com>
	<20261022102614.75696-5-changhuang.liang@starfivetech.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 22 Oct 2026 12:47:45 +0200
Message-ID: <87tsmeovu6.fsf@bootlin.com>
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

On 22/10/2026 at 03:26:14 -07, Changhuang Liang <changhuang.liang@starfivet=
ech.com> wrote:

> The MX66L1G45G supports the 1-4-4 DTR read mode. This flash uses 6
> dummy cycles by default in 1-4-4 DTR mode, but the kernel's SFDP
> parser does not derive any SNOR_HWCAPS_READ_1_4_4_DTR capability from
> the BFPT table, and 4BAIT only filters already-known capabilities.
> The exact number of dummy cycles is also not directly given in the
> SFDP tables.
>
> Therefore, implement late_init to initialize support for this opcode,
> configuring the read settings with the default 6 dummy cycles. When a
> 4BAIT table is present, SFDP parsing has already converted all read
> opcodes to their 4-byte variants and spi_nor_set_4byte_opcodes() is
> skipped later on, so select the 4-byte opcode in that case.
>
> The part also supports the 4-byte opcode set but its SFDP does not
> expose a 4BAIT table, so set SPI_NOR_4B_OPCODES like MX66L51235F
> (0xc2 0x20 0x1a) to let spi_nor_set_4byte_opcodes() pick the 4-byte
> variants, including 0xEE for 1-4-4 DTR.
>
> Add a dedicated fixup for the part (SNOR_ID 0xc2, 0x20, 0x1b) that
> keeps the existing QPP 4-byte post-SFDP fixup and additionally
> advertises the 1-4-4 DTR read capability in late_init.
>
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Maybe in your v2 you can add (as hinted in the documentation) traces of
a test run with the SFDP tables, proof that it works in this mode, etc.

Thanks,
Miqu=C3=A8l
