Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5804B0480;
	Wed,  2 Sep 2026 17:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788368445; cv=none; b=S1UIJqdSnDixcaMnoG91tTpgxWUNqxseZbmU8k/wdxcHkWn2PaqZQUuNfPBHRcqRlCLHUCCcIMHnaio2pn3QVP2Mv+GXLbPphlc7JllYH+BCu8ByaFxlKRlJKL45AS1PRbhYwbCpeYalE5XG7VzzuIOUmigFOLtNaRrHH7/5LBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788368445; c=relaxed/simple;
	bh=j5xFgirGrRmI/ESQpKGlYvhZ6P0s2OUl0UW5R4iGJeI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PrUg6l7ZqzLUVJURkvNbUYwyUvA5wv0NcSlhlEQDSq8ka8sHslAKx93e2Z621v7BihLj/bGSt/5AR866cT3JqaaRLdPN2y9+FbrZCZlg2FNuSk+n2BX+0O2N61O2/YZveAlarE6zXR8itu113V1fbmeYCdf6TBWRNxCcbWeGOxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=HOYjCHTu; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="HOYjCHTu"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 472C61A1976;
	Wed,  2 Sep 2026 17:00:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1AB246053C;
	Wed,  2 Sep 2026 17:00:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 19D7911C798E5;
	Wed,  2 Sep 2026 19:00:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788368440; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=RK3VZeAny8l+e7YMWKjNdyYoAhg+PxHxJxIcEjjuNEM=;
	b=HOYjCHTuHdZMagWc7UQ0MUUgBCt44+SNUH6+3rVVCSN2KH8ZRv2T+WscTqcB3ses2Yph7P
	XBDW0GlaeawhtpuIcY4lJcR36Mq5BmNSHKO0diSQ2JTsohp1h+KE+yAW2XEnIU16aU62ps
	EVkzs6SVODNYAO9w9TAYxvmUXXqIos2IvAqs0S2VXsmEAlgzMVkZsMnxEK75d8xcDp7cMg
	ubTds/hmNstSoMcECU2rA3i1JBNg+dqB8HsSr9485VLe9HK7nnDWL8pkjsXObzNaRCsGoB
	A2ME93eYu+ZYr1JAXhFpVSGkCeqhJPqNcIq3kCoX22PgpCe69Z/T+6cFap5JzA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 02 Sep 2026 18:59:31 +0200
Subject: [PATCH v4 17/25] mtd: spi-nor: winbond: Prepare introduction of
 W25QxxRV-M parts
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-winbond-v7-1-spi-nor-rv-addition-v4-17-779d35303dff@bootlin.com>
References: <20260902-winbond-v7-1-spi-nor-rv-addition-v4-0-779d35303dff@bootlin.com>
In-Reply-To: <20260902-winbond-v7-1-spi-nor-rv-addition-v4-0-779d35303dff@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: Steam Lin <STLin2@winbond.com>, Hsin-Yi Wang <hsinyi@chromium.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

There is an ID collision between the JV and RV families. Both chips are
very similar in practice, it is mostly a matter of electrical
differences (mostly power consumption being lower).

As a significant difference, RV chips identify themselves as supporting
The new SFDP (rev F) field which forces an alternate write SR2 opcode
(0x31).

Since they share the IDs but not the names, we must hide the names using
a fixup.

Reviewed-by: Takahiro Kuwano <takahiro.kuwano@infineon.com>
Reviewed-by: Michael Walle <mwalle@kernel.org>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/winbond.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index e51c050bacdf..90b106d53d02 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -618,6 +618,8 @@ static const struct spi_nor_fixup winbond_fixups[] = {
 	  .fixups = &winbond_nor_multi_die_fixups },
 	{ .id = SNOR_ID(0xef, 0x40, 0x22), .match = winbond_jv_match,
 	  .fixups = &winbond_nor_multi_die_fixups },
+	{ .id = SNOR_ID(0xef, 0x70), .match = winbond_rv_match,
+	  .fixups = &winbond_nor_partname_fixups },
 	{ .id = SNOR_ID(0xef, 0x70, 0x21), .match = winbond_jv_match,
 	  .fixups = &winbond_nor_multi_die_fixups },
 	{ .id = SNOR_ID(0xef, 0x70, 0x22), .match = winbond_jv_match,

-- 
2.54.0

