Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794098751;
	b=U4ducJwQozIV64oMUpH3+0RnPHgygWbxV+mk2A9qeQkcL3pezkH4RqbXFPoXAFq7Fo0Q
	 IA3z8ivP8jbQfxLn5ofnpS5ywI4OdbLZw4OUo2A6IH2fPU4tlmNzx0UrSkNyFIBJiFc5D
	 AFL27K2MgfjWWHYBFWK4X3iGkCp3StcioqHxZGn71nvlAGA/c+mFF/bIVbRRYd+tVOKw/
	 wlczvpGmKyWnABC/OB030hC8HVKWAw+bblrsRTvC7c4WhSFKOoHycb6EvqzWn+9XpGUAy
	 Q9DoR1dpePSRcisQLHPRLnUvGOMz2KlSwb5QtAx1Dr1HqYS/4TTRLxyLHigXUyXE8yQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794098751;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=gDHxHqr/ibomT/hnh0MWIWapUMs27ULmVZLfvv9myQQ=;
	b=5FXIyYmOtKo+uEX94DD7mE3pjcgZO3EaNx4+15tSSZxXu1GpZpw3/yeSe+jGGCacsDfl
	 5mN/xdV7P+LXTy40dfPHbCzjuIyfLsxbN+9eWSfP6vTLU4S8S5ADqtPbJj6wydPUFnsDd
	 11UoJe885/kutL+/DLapZ7vnoIURUiOoh22jmbNzJXUvTYtfRxFzBxfPml1kwdGVBm14+
	 jx+lZn/baFHSuS+Bwxbihgw+QyPHnRu640a2t30jgQOZ/ZBLXzA+qi1iQ7Pfo3/peraJl
	 ErHOvbjQp9ui+aM6W7RZy0JuDrxMhVVPyWKtu7FuUoGb037dCjxqfkUUBXa2V3JxYKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arista.com;
	spf=pass smtp.mailfrom=arista.com;
	dkim=pass header.d=arista.com header.i=@arista.com header.a=rsa-sha256 header.s=google header.b=JG2aRNNQ;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A28606A32F
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 00:45:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59A28606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arista.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.a=rsa-sha256 header.s=google header.b=JG2aRNNQ
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1aefd1bf74aso63556c88.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 16:45:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=google; t=1794098749; x=1794703549; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gDHxHqr/ibomT/hnh0MWIWapUMs27ULmVZLfvv9myQQ=;
        b=JG2aRNNQAV3DVSv4oozAdjJQGfKrSEm8Mjs0p7/VZVdIrmgSp5nf+N2rSa8woRgUEg
         ndOi3Adv13doRcjmE+ZDEVz0EfieK4XLL3G6ZiQBe16RsRfYs+yQtIfTQ5LKT5eCzCD7
         tqC2pXhyeCjhWIMJlE5OtXI5dutjHOP/SDsPWiTDiVadMSdywRmfrSn/eEmrolko+ZO8
         kBd8e+UrweowcN9HuPqzPOljqbnHsso2uZCwFMD+kyD5y9FOr6tbJ+0/w0HmTo/rjEtq
         1Ixdh7IwTwDehrkqx8QS4HcBZkGQkfu2hCIMCvM3N1ddCSb5XrMMxdT1XI3j4IwpyHWn
         AysA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794098749; x=1794703549;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gDHxHqr/ibomT/hnh0MWIWapUMs27ULmVZLfvv9myQQ=;
        b=SLUS5DrnoKBf5rnScftfv7YtOIBuGmJCmIjcP+6BS4Et/XkZxBj3pjc0w+iwpaWZ2y
         HdECDXDJ/UPZZdWi+eq/OzrAXd5fTgwRMcvtXxw3I/QloxXtHzDJQilXkvbb7iTzA7iW
         OQoNIvxpu4FdnljhB0hvyOR5pis3p+RTIH7n/cUt8emSggsRSwElP2xRMfcUjAxgPNjm
         FdiNXhe2D9hmmLTI5aSt6TIBEyca5ilpAtD03FwpiED6dGd+5Smp3t7ZJ0JMpBXDUBVe
         5tLEQXJLe1/Rmuib+de5yVxUFzCuKQc8uiKaX6Hbe7X4FxUo6HZbk0X7J9zSaZtWhN1U
         Q+mg==
X-Forwarded-Encrypted: i=1; AKwUvBw8Rah7sEEaDI3dpinhgxGSomp2k1kBtk76BTdozu3Skk44r+ZRh+TpNtEaLJxqAoyWTeuBEvP2ccbTG9E=@vger.kernel.org
X-Gm-Message-State: APuU4Z8fNt9HuRoOKZcSQE9T3j/cpVb/7xfa694HKd5bPnW2T1/rdicH
	MBDREJdBKDRsQdDWMPkBftOixwgB7tQGvVAzTK2LOAyYTfp6p7Gd6NAaklI/tEnytw==
X-Gm-Gg: AYBFou0UiPOPozZi09voWQKvQZoMkWr8ii4IWir6kPsnAYxDvmUk/ioL7nEb4Nqlqwh
	VDMewt+BX0Vo36cuxN3Su6UPnX8S3P+chKAT0PONH4tAWFnxTJepkScnMNQP3+YI+EMmi8mopWv
	Dnu9sQlKrIkgIHGSIsXIG5WhoL+4txFgQ64ML8A0IrUQzENr9ylxgfDpzaY7jo7qKljPkKdq6iz
	Bl7/kwAaFjeYiPSa1YGlF2TDZw5ufiCbM9w4Hqv3uOOCees/QYpaCRdn5VtCu4b5APHnNDFPkIx
	rhhyX7PST4B3iudQYiLmbsE6QmCVbryElKZYYGoEU/kxpMtPF+KDa3p+xaxmTLsCQU4LapkHgpe
	VyEHV9u6e0QBUtn4RSb5QKpc7SnjPW8U7U0KlzGfQC1hNOJvl1KWemiCqxhkuwG88mea6Ctl/yu
	vlSABuMhgv19wSbaS0fmwwgNJrF9aKA9K64C6oumMfhkRK/OHr/+XgUzholfSb88E9UP4mPF75t
	OFLpe0olnqlXBjBHWAqpy3EA50yPhpBhSMOw9Dq2fNu3tMdfTxGeoGG66rfpk0ZFrUOF5VzDWj6
	hRUOuTzUCxOHN0tgac6Vj1Rxk4A+G4qJHxxkMxqdgvOpmqHL28wJcJnIdP5tBVuc
X-Received: by 2002:a05:7022:408b:b0:1a3:cbd7:1269 with SMTP id a92af1059eb24-1b39fedb95cmr206919c88.23.1794098749215;
        Sat, 07 Nov 2026 16:45:49 -0800 (PST)
Received: from mparker-home-xcrbr.sjc.aristanetworks.com ([74.123.28.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b375604109sm2115225c88.10.2026.11.07.16.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 16:45:48 -0800 (PST)
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
Subject: [PATCH] mtd: spi-nor: issi: Add support for ISSI IS25LP512MG
Date: Sun,  8 Nov 2026 00:45:16 +0000
Message-ID: <20261108004516.896887-1-mparker@arista.com>
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
fast-read modes and erase geometry. Flash read, write, and erase
operations across the full 64 MiB array have been verified on hardware.

Cc: stable@vger.kernel.org # v6.1+
Co-developed-by: Adam Calabrigo <adamc@arista.com>
Signed-off-by: Adam Calabrigo <adamc@arista.com>
Signed-off-by: Matthew Parker <mparker@arista.com>
---
 drivers/mtd/spi-nor/issi.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mtd/spi-nor/issi.c b/drivers/mtd/spi-nor/issi.c
index 2f057d731df2..977dc5ba8028 100644
--- a/drivers/mtd/spi-nor/issi.c
+++ b/drivers/mtd/spi-nor/issi.c
@@ -101,6 +101,12 @@ static const struct flash_info issi_nor_parts[] = {
 	}, {
 		.id = SNOR_ID(0x9d, 0x60, 0x19),
 		.name = "is25lp256",
+	}, {
+		.id = SNOR_ID(0x9d, 0x60, 0x20),
+		.name = "is25lp512mg",
+		.size = SZ_64M,
+		.flags = SPI_NOR_QUAD_PP,
+		.parse_sfdp = true,
 	}, {
 		.id = SNOR_ID(0x9d, 0x70, 0x16),
 		.name = "is25wp032",
-- 
2.51.0

