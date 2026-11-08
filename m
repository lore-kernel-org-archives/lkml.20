Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794105809;
	b=yon3/oN4VmH05V06QBssaXYsKKfbVElRml2oTNXnRqIoAq4DJ2e/uFwpJ4RqsJ7EHFPD
	 /3WPfdulVg3jf/7RIpv5kQQPDWPL8s9xM/i/le1Rsqffs376YMjIWwnBlKlQVzMKFZUxN
	 g43y4EfwA3Y70SPWJQM9CrvxXZdF9iNXCS2fTB1AKHfsmjS7Hn1nHDPV2zP8k5ylgfYMZ
	 JJnnAL7VE1rp65obQPSWW8r0F3o69W+xXwB/CGHSDWKcgrCoRamwVD4sJRiX1a95EKVi8
	 tAHl9dgGrRw77v7XK+hVtpp8mzSAUL2O7iITBSBSIP/W8Sp7Cia5QwB63RApdElkqqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794105809;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=NFuoGXXrkyFliEzMqju+9q+B5cpIirOFosUPmdC6VLM=;
	b=Rst8mndcOMuzJy5To4k9xullD7QWKJ9Rf0hTFXA9k570UisBBKAK7DZzD/E5J7hPSxHR
	 6lAtxU7o3WBvWdjIQfyb+URdvG6afcwYoB0TwFlnQE5lY56Ro3eFe6SumiBXZw9vcrKq9
	 bozwPs2/0sPtVz/ft8d2Rmazx4IOSQLqTHObx6aMNETHPzWKFa7cHdnTSEuFo1mtrX9H8
	 YIgcoksVTlsWdHJA+FLW0BoeIRTAInZhbHRYdouRX3JBCzwFffrrh1lZVQPQ2bpb51HGO
	 uhXxbfmVKTeOoFxKDBZ0W2mNQczpgiqFq9qSr4Aj1KBWhsrhR0jZWxGvZCamjSGHh0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arista.com;
	spf=pass smtp.mailfrom=arista.com;
	dkim=pass header.d=arista.com header.i=@arista.com header.a=rsa-sha256 header.s=google header.b=Jl9pwlY6;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1ED606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 02:43:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE1ED606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arista.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arista.com header.i=@arista.com header.a=rsa-sha256 header.s=google header.b=Jl9pwlY6
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3720addb068so221957eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 18:43:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=google; t=1794105808; x=1794710608; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NFuoGXXrkyFliEzMqju+9q+B5cpIirOFosUPmdC6VLM=;
        b=Jl9pwlY6Vz8xlJjs9eT7zB2WA7ep53ej4TTB6op5RXS+tQr+kUo6q8+nqH0cWxg9mV
         PUvdsc0gXlDmdLJcC7H4qJTR6t04xcbZT9aot/C9RIt1pJh1xHBqYTriHsQfOCz1YLWD
         zfJFnaeaySI8KlwMOkjt9fth0DtjnRHtVtFonr+ShnG1xghQIR2aWntFTfLMf4iRS6OU
         EYzqYzHJGff+dyDJkJTYnGqSdiYYy6iyyAoducnEJjfoWKgz64MSFCPidpF8bk9psPrG
         x+JsF4OJXq8lj1hRQifAHtXf9oV9pOthlqo2MrsAq3gUsn760llk2LhRHMqa/g1qS86b
         cirQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794105808; x=1794710608;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NFuoGXXrkyFliEzMqju+9q+B5cpIirOFosUPmdC6VLM=;
        b=CLQPMXkmGrDsoVT2hdp9IU+6nxYzDlOVKPXhQOO8c/BdhB2+3/la5zHo3YX7VDHyDS
         lNqA1J6dsewzGtYyWOA7LPNL8dcceC3bMcsYzJSPBw2uVAzi+jZNNTroiFUwAbWk9TcX
         7HFB8OPAWHjsPxD1/6bHE/6g2+DpyiZG05IkP3ocUtWqN088BTtpZe7Xl4eSyq04uGV2
         nz0Nmqk8/1H1iPGiplZ8V4QPZV3X+A3YVMA4CMrRI57fl+eyKnS3/IVcuRVmLqQk/4oC
         PA7mUCroUzTc0YtquzpmTyNH63bqFkB5AmamS/ucjNYlblBclhYXUM4Xf7oN25E8/VKT
         bV5Q==
X-Forwarded-Encrypted: i=1; AL+hErET24cxQ0yR+ckLzPrP2UavRLFJA1qcpFfUvrQ3/35O9QnPfTYkjuZdeetfgHvUiyurLymOBoJVZkrOKpk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8LwDMHAT4xQwd5bXI6SxrtxwNbpOJm2/+nWWbofeTaAmwsJ0hF
	JZC3y1aPDTvODeigFr8Cz/1n+IZiqLhn5N9wnGuN4KZmu8KPH+YMckQFiwqv1VMAAQ==
X-Gm-Gg: AYBFou00atrulhw2Y1xJhVWbCs7AUIgy0NnlyM/mZoQK/EZbgoingkDcFFqVR1aebvX
	A85kEVv31QC+nisqys7O220OND929pq8KiXvC1BnktUng2rp9tEPnHhDPyG6wfWv2oL27a9BB08
	iivrBpx96+jvtGi3J+YjsYUtjqMcNJ1ss/BXE4OPdlKVZOhn6Or7rRbJwLux7oxY86k0MI0PDIe
	A45uHB+TX+Fy9PYWWCJ6wqqfMN+qsHcopirkWKoh5QmV7buwwAbnMHiPius5sWuq3g8h5GvHzvg
	kSx0xdcZPGqWoVyM4DK35ywAgsMWDEyTgzt1MSR6rssTDMuryXZok9ODFGb9qoQZRjGndg9wUPC
	JcrbfLwf0bcMg7i+K90CPH3ygfmqWfttVgvCgoNgQstGq15mWciSPXw8Qk7tuYLoOqvEZlJGZ9y
	GEDRIh4dMyHkl3d2SOuPtcmxrItKW8zcusHODcTPLydds2DjgAC1d1qt4zYuq08E5MSjUkwqFCo
	Rkxyu3igUrd6DGiiknsaEtHu51wV6slkyuHKX4qKnqZi+hs+Ic9jMDfqNzyK2N5Y+p6VX1ayQtG
	F/bcpY2EYtM9U8pbkA8tn9PQ+/eJCRmKPnN8IvMD18RUg/T+tGzbp1KZsTtMqGIsdX0jVCYAIUe
	bz0uo/1ZS2w==
X-Received: by 2002:a05:693c:62dc:b0:36f:5746:3369 with SMTP id 5a478bee46e88-3725807c859mr1143986eec.24.1794105807738;
        Sat, 07 Nov 2026 18:43:27 -0800 (PST)
Received: from mparker-home-xcrbr.sjc.aristanetworks.com ([74.123.28.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372665db8bbsm1681203eec.22.2026.11.07.18.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 18:43:27 -0800 (PST)
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
Subject: [PATCH v2] mtd: spi-nor: gigadevice: Add support for GigaDevice GD25B512
Date: Sun,  8 Nov 2026 02:43:17 +0000
Message-ID: <20261108024317.898917-1-mparker@arista.com>
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

Add support for the GigaDevice GD25B512 512Mbit (64 MiB) SPI NOR flash.

The chip exposes valid JESD216B SFDP tables including 4-byte address
instruction tables, from which geometry and opcodes are discovered.
Status register locking is enabled. Read, write, and erase functionality
across the full memory array have been tested on hardware.

Cc: stable@vger.kernel.org # v6.1+
Co-developed-by: Adam Calabrigo <adamc@arista.com>
Signed-off-by: Adam Calabrigo <adamc@arista.com>
Signed-off-by: Matthew Parker <mparker@arista.com>
---
v2:
 - Drop .fixup_flags per modern SFDP discovery conventions.

 drivers/mtd/spi-nor/gigadevice.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/spi-nor/gigadevice.c b/drivers/mtd/spi-nor/gigadevice.c
index 6a2e6ebda148..fe05c0f0370d 100644
--- a/drivers/mtd/spi-nor/gigadevice.c
+++ b/drivers/mtd/spi-nor/gigadevice.c
@@ -64,6 +64,9 @@ static const struct flash_info gigadevice_nor_parts[] = {
 		.id = SNOR_ID(0xc8, 0x40, 0x19),
 		.name = "gd25q256",
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6,
+	}, {
+		.id = SNOR_ID(0xc8, 0x47, 0x1a),
+		.flags = SPI_NOR_HAS_LOCK,
 	}, {
 		.id = SNOR_ID(0xc8, 0x60, 0x16),
 		.name = "gd25lq32",
-- 
2.51.0

