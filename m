Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794103666;
	b=E91KAHTyqyQBfzYTNs7XQQsOAwM8EW4WmzZ0CFMhHPsMA6gpbY+0sbM5evb8K84mseC+
	 oPDcgaS4fWP2Q/z/MIVCBV1gJJ3laCEYxqqOCuXdgZCqgU/c8i9VtsZQq5AQt5RBa3mSe
	 lf21Pkz13MDPikWuMhHsUxRy3YkNafPDP/tnsYF3e5geNw/5rZ5heDt+Hhzm8ErjagDgB
	 gfo8xbLnddrbiuM05QwA6Qktk8RDeUQzJ4CX1ibGUUwYpDMivOj3WFoSVjxPwz8MrfAYN
	 A47lh9fQCDjWcCIXbH42d3HQ10VvRl8ameX91bGztbjYviM7GX/VFpjF71Ih2SuTkVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794103666;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nAUid8jDWzly69ovFD3scbJRnE8PsLmVF0z4XZSSRog=;
	b=lxHRTcoDYczEcROiCMLMQFfFloxlbiTOzDZ9HnJjAssGizc4wp5mJJVWbxExIMJHsYsW
	 Sw8mORlcsEODZVO0qS+j837WyZjoAYG8bzhiEDGJRvYDwIcwKx0wKvOK31tH8STldLWVd
	 9g/K2/4LVM4IE2r2sacqLL2PhWlKsGHrt9aacIhr1PNGM2LrXACjAGle6hQVHcduXXiNJ
	 K9GN+VByA3BnWk0znLg79TIzqps97X1sG9evlqVBOzUnE1g2kQB6/6w+CGaX5tJpGwCRj
	 HYsM45RsrQnFtYsD/NK6d6o6GiYBn8BtMFhRp1AclnyIv1XvL4nNI5MuDGTmKZeQmYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arista.com;
	spf=pass smtp.mailfrom=arista.com;
	dkim=pass header.d=arista.com header.i=@arista.com header.a=rsa-sha256 header.s=google header.b=IhKUbDQj;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE4D606A31A
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 02:07:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AE4D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arista.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.a=rsa-sha256 header.s=google header.b=IhKUbDQj
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-37198ed3727so663487eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 18:07:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=google; t=1794103664; x=1794708464; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nAUid8jDWzly69ovFD3scbJRnE8PsLmVF0z4XZSSRog=;
        b=IhKUbDQjcYwTGbkZe+oDjkxeTzfQ9brHcWJG8mz//DTeK96at5NbhgVoUSsGkrROa/
         6vaZPnWPziU01Vrla4WrTIAT8eUgFic7dlYAamPszk6Vp2k30wWxNSIt4TT2QE6YqaP/
         sZ8MHHCQclybKt2FpVZEgZvkT2NIpn2iz5gBvfj6wyOSe+ZFgpenJkNCCKcwcyYTwG8w
         k7Uy23KBK40TOng7YPsY6Co+zZxCeRjUHQx2Ig7pgPhr9kv2zN9TnFHM9rzMtmfnCxeh
         GQn+zzvj1jgR50EmhbNgftjX9wvkFdiCg5FnfH0r8Ik3AUwnfJfvEgP/Vn+Yi7JZOHwh
         IfPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794103664; x=1794708464;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nAUid8jDWzly69ovFD3scbJRnE8PsLmVF0z4XZSSRog=;
        b=b05cwUUzoX8BEWCKX6l28NH8bFiECQOoVDFxTeBmYhIjP6mMzLnRQq3xiMsGkPutRF
         edqnZI6xmuWFiaehTkTgvbopioATibjAV7f8egfa5iV8+t7bdkb7KzmYFXnPEOrBAlNv
         I0uup+9zUJrXUl8uabtdjDc9A0OHHE9Fh3I+56xGiPpFWfNwKsPAGxr0jHfxkIAisnZB
         P1IGeJ7rGxpjyRH/1+QjabY2kL3obXrFkxedWKKAWZF5/m7kMVtyvNsMf7JQDuM1NnMe
         VPfNPJZ1Q/I1RKfQqR7tUrcLQcBkZNzkBlgxf2W3mdR/FCgLMdO73HZb2GoUsG2ieKaW
         0i3Q==
X-Forwarded-Encrypted: i=1; AKwUvBzxKnN81/OFsvxc6wpr/NYZupKmmU852gUlN9QnBC5jx6gxaOdVRHrPGAn9bo2GH+IdOtWcV4Odjbfsys8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9JgLcUreFiPg3m927TgyeEM9Qaf7qsNACyBLcAeMsm9e3tKYqI
	YgSK20KNpRgW5KIt3jE84wW7plAvZKEcWuswRnE2scqqk648uZ7xpwAMfiDlrwaPEw==
X-Gm-Gg: AYBFou0ADVNGLkL10m4CBFQxMPDgcRdYq9mjxXTWhb8xy0nRJPtb6wvzAk4+f2OnUTn
	a+HI0dvC4y/m+UKcfUXbOBK3sNLIno6uO3UWCNsHD+U8+svFPlU3SKYFEAtcPqVd12t6DIBTtCg
	zaeKGy31fzzAMOgsbyiVy5TDbUW1plsRO+qgSUiQqUT7g8X75Q5O4L2kPLoQDNMJGttV76YAMfn
	1KwJXXl0bmdPqh7zN+PvjOZwMpBWx1s+F5JY6pO1DGDedUsjSPOFhQ7rACRkKF09D+jt599hj71
	TN/6UjKU8Uktxddt+Crly64IkRbqCw+xNwKQn442yMAr8cIaBIiPtvnGbflU0UD5aQJp3j7C9lw
	HkD2Q3QeYbBu08hlVhwfEFG665YVQIrNeyrwJiCTc/TrLHjDCTVGwnykANccbKPKKE8fS6sfcPk
	jTGYYy7TE8aoDX9+8Pk7dBuEBgV09+vzISCvSCyI3U5ihkI9Nv+B8cvHjdyizyhyIfCvt1qRj6Z
	04L9DlqEGFh03ambvx4FXP5Xen567J0T+G0xGj3pZKD+DaH5d1XTYN/HDikpl2+bGRFbEvAf3Op
	wqQ/zTCU+iSqsnQidj6ykFWY9T6UoDTjEN6g6L4ps1NFZh55BhiPA7r4kjvTTmsk
X-Received: by 2002:a05:7022:170d:b0:1ae:d447:6c84 with SMTP id a92af1059eb24-1b269b21bf7mr4108916c88.19.1794103663378;
        Sat, 07 Nov 2026 18:07:43 -0800 (PST)
Received: from mparker-home-xcrbr.sjc.aristanetworks.com ([74.123.28.17])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b37561ccabsm2133832c88.12.2026.11.07.18.07.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 18:07:42 -0800 (PST)
From: Matthew Parker <mparker@arista.com>
To: pratyush@kernel.org,
	mwalle@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Matthew Parker <mparker@arista.com>,
	Adam Calabrigo <adamc@arista.com>
Subject: [PATCH v2] mtd: spi-nor: issi: Add support for ISSI IS25LP512MG
Date: Sun,  8 Nov 2026 02:07:12 +0000
Message-ID: <20261108020712.897714-1-mparker@arista.com>
X-Mailer: git-send-email 2.51.0
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

Add support for the ISSI IS25LP512MG 512Mbit (64 MiB) SPI NOR flash.

The device provides JESD216B SFDP tables which accurately describe
geometry, erase types, and read-write opcodes. Flash read, write, and
erase operations across the full 64 MiB array have been verified on
hardware.

Cc: stable@vger.kernel.org # v6.1+
Co-developed-by: Adam Calabrigo <adamc@arista.com>
Signed-off-by: Adam Calabrigo <adamc@arista.com>
Signed-off-by: Matthew Parker <mparker@arista.com>
---
v2:
 - Drop .name, .size, and .parse_sfdp per modern SFDP discovery
   conventions.
 - Rely solely on JESD216B SFDP parsing with SPI_NOR_QUAD_PP.

 drivers/mtd/spi-nor/issi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/spi-nor/issi.c b/drivers/mtd/spi-nor/issi.c
index 2f057d731df2..d2b812050550 100644
--- a/drivers/mtd/spi-nor/issi.c
+++ b/drivers/mtd/spi-nor/issi.c
@@ -101,6 +101,9 @@ static const struct flash_info issi_nor_parts[] = {
 	}, {
 		.id = SNOR_ID(0x9d, 0x60, 0x19),
 		.name = "is25lp256",
+	}, {
+		.id = SNOR_ID(0x9d, 0x60, 0x20),
+		.flags = SPI_NOR_QUAD_PP,
 	}, {
 		.id = SNOR_ID(0x9d, 0x70, 0x16),
 		.name = "is25wp032",
-- 
2.51.0

