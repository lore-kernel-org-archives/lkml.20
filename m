Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794833080;
	b=OJwgiYFnjnpGAOORPv7VrolnoIjVRs6V/i76AwJ2jq8gK9UHU5t49gMaY6jI79ehb8+l
	 HGhEIoif6QdqEkBiNS9fIVXU0PcvjMU9ATDBn8yp16w6etglPe4DB8GZgWmG1Bj7ctTKM
	 nO4zSwzr7zvDeQk8l/5XvRG02AzioyWYkpU+0xlZDNg0rLvKjQd3c9ZPRo7Gau+mY3EHy
	 L4zabALc2CAIMOrZTZJpMltUNya0kkKzXRJkol63TsC8MNNGa+LJ1lGrnojIJKz97MMWj
	 uTqVAJDtkQPwSbGRIFvy9gi9xkAtq+fFRPmHCR49ACqEUp32wfhYAus9o1g2OiL3RoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794833080;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3CMJxVv9/aaz1Nd1h5S+aoZPa6Wsq51r76/7Qk+jCcU=;
	b=DyZxZfBB15wy8Iaq8nPSJmBPqxP/hVDxR/lByArxuLjFx1v1McEWCUOXc0E+78B2zkjb
	 NV26yiuR7l2N20P37Q/xN5yLhq/bADFUPjFiT0GA4I/+NAuub4kqFjDUUD+/HqpD6YpO3
	 W1GPNTc2w45XY9lMvIkcPqo8XDRNr9y9jsB/11cJ4lrimNJ9ABxhPZlg5axIrf07EZUao
	 KkMEzjufmQaq03yUE1xcQZLHyJ8C0FVgskQEwXuJ+e8D9FiJv4u8z7fmMoX52zUFpO1zg
	 l4l3J2QYQbY+gTkZpN8EjThXhJBoDgW3Pl53xe2oeCXgcRP/CPUJpuEVSSF/bLDIu2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="XFKY5V/o";
	arc=none smtp.remote-ip=209.85.167.45
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16CA7606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:44:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16CA7606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XFKY5V/o
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5c151178f0cso3252867e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 04:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794833078; x=1795437878; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3CMJxVv9/aaz1Nd1h5S+aoZPa6Wsq51r76/7Qk+jCcU=;
        b=XFKY5V/o0fvV9QZehP/l7g9fPYmKxqllsHjCT4DOfQMJYCPmzEbnz4qijBwT1XfN++
         gkWRWUv8CIxs6o/FJG7TaSM7iSeaFEunze0I2ugQX9/GDWxNl9i43YgB8aLp9qRpCGjL
         40x9jm3XWiS0JY3g/th95mcIQvgU6/tr5Li/PgwrBHqu4cIBBJtuN3jzMYwJI5W3ufOO
         cH8MiltsSDXpKpE8JtEBKuCpKhAsAa37nCvAJ8NjE+GKWMOcDJrIjaON6HuzozE4BqjK
         VeDTJF7NqblpFZmYkI7Lpxdp1fegmQV1nWPJ+OvjSOK4zKPhZGNoKWSpOpPE7+IXana0
         aAkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794833078; x=1795437878;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3CMJxVv9/aaz1Nd1h5S+aoZPa6Wsq51r76/7Qk+jCcU=;
        b=axf4aLNbXG0bw8kf7PBrJMMREWEuCeUofptisouZWvUkovEdzqcHvqc/zRW+cXsKKz
         IyCsGfxSUW4SgDqImy23mkiqml4zWAJtdtjO9RWNRgxV7t8feF1x3mkDWP4XZsXvjotI
         xSW0042RK3k+XxutrfYJlt/ruQlV7NBJ9FNcZ2panPusuN9t8lSsNS1bWgRRWwg15Qoi
         T5DfRSpeF5NXvs3ox0RlXPPBOzw25cB8tQHWIJXr0wygYkAyPVySKOBLJ5V2Wt+jYCRy
         iGW8T/4ZDJChrzLFqZAvd1dmUhDbxQz6Q4kXr/vz1xM3Fe2rZ1pLGJ+DdDtmiKYogeH7
         I0vg==
X-Forwarded-Encrypted: i=1; AL+hErEF4Iyu7WsPY2oACStW22AWKe1vw//WDkLUC4usppSa1lM3PpXQkNSlBWxuuSREBtb78T1MdgWXKqLJA2g=@vger.kernel.org
X-Gm-Message-State: APuU4Z/gpPgZ8P2XcwzTOi9eN5qJdTb2TLmhbA8U0QlmY5AAOVtyBd0g
	V3SnebIjotN9UYszsjyuXlC++o4xNTcG7PnCyzteOku3edngcJ2Om6nt
X-Gm-Gg: AYBFou2ciYnOFj7n5BTx3rEeSttV1nhEiA2y+A1z0mTKnxD0zqbDFDY4/MAE4lh4NdZ
	G8K+PkBZf2DbUWTFMsarE3ikCVoJPmkNROLTcJSf69JU+rzhEz0bO19VuMQwPfPC2PpXmvVSrTU
	8dv/XpiQIv40qChiVp5du1ljuPr0buDN5HEYdwDdUbYnkEb8QYh3cYCboPrP32OCZoFJpK0GMvC
	jtlyjoGpfmfW8pxSx2pQXjR/jb+V9hajQUsKWugTDF/SMNNVjXUUEzQ3ddNVstomFsDTUPPgTYp
	Aw7Nk9PQ3kH3geYCbpk6/tI+/PXtOy8MPJ4EN0BNnMI7vZJVEuynEc6X4Hh6YP2BW+iiri/Qh3m
	SQU95PPyzoKsyb/AwFpy6v+p/eZBbI1zK96Hdq97wrWQ9AObINbrBlNACJ2j4fVnb+uDZJlNR9b
	XewqSdzl+vNQa9ixvzMLQ/HvSPYF4rvYsCs1pILjXXn5erCHjBJGxsCXfgY3z2fz0o3EUZRVjn8
	GZBHj2MzXXrbP3o+BwBtiZxDHfWUb4YutwbiDr5eTjRfUjIFBZCavpeElwF2u+Idplpveee4skE
	lCvB+19+RypCFaU2wc/QJGyHndQE0yXL19o=
X-Received: by 2002:a05:6512:3a8a:b0:5c1:5715:bd00 with SMTP id 2adb3069b0e04-5c170b1c313mr3742145e87.18.1794833078067;
        Mon, 16 Nov 2026 04:44:38 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c171348078sm3201870e87.57.2026.11.16.04.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 04:44:37 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>,
	Stefan Eichenberger <eichest@gmail.com>,
	linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH] i2c: imx: do not acknowledge the last byte of a block read of one byte
Date: Mon, 16 Nov 2026 13:44:30 +0100
Message-ID: <20261116124430.1358948-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
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

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

In the interrupt driven read, the read of I2DR that takes the count byte
of an SMBus block read starts the reception of the next byte. With a
count of 1 that byte is the last one, but I2CR_TXAK is only set in
i2c_imx_isr_read_continue() for the byte after it, so the last byte is
acknowledged and the target goes on sending. The read fails with
-ETIMEDOUT, the bus stays busy and the following transfers on it fail
too.

Set I2CR_TXAK after taking a count of 1, as the read before the
interrupt driven state machine did and the atomic read still does.

Fixes: 5f5c2d4579ca ("i2c: imx: prevent rescheduling in non dma mode")
Cc: stable@vger.kernel.org # v6.13+
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---

Notes:
    Tested on a Colibri VF50 on the Iris carrier, kernel at this base plus
    "i2c: imx: acknowledge the count byte of an atomic block read", with the
    M41T0 RTC at 0x68. A test-only hook passed the messages that
    i2c_smbus_xfer_emulated() builds for a block read to the adapter, alone
    and followed by a one byte read. Register 0x05 (0x01) as count byte:
    without the patch 40 of 40 failed (35 -ETIMEDOUT, 2 -EAGAIN, 3 -EINVAL),
    after which the RTC driver could not read the time any more; with it
    01 01 and, in the second case, the byte after it, 200 of 200. A count
    of 0x13 (register 0x04) reads the same bytes as before.

 drivers/i2c/busses/i2c-imx.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index ccf08cd63151..0a59ebe70eb0 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1095,6 +1095,12 @@ static inline void i2c_imx_isr_read_block_data_len(struct imx_i2c_struct *i2c_im
 	}
 	i2c_imx->msg->len += len;
 	i2c_imx->msg->buf[i2c_imx->msg_buf_idx++] = len;
+
+	if (len == 1) {
+		temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
+		temp |= I2CR_TXAK;
+		imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
+	}
 }
 
 static irqreturn_t i2c_imx_master_isr(struct imx_i2c_struct *i2c_imx, unsigned int status)

base-commit: 25e7ab89f4774b0f842cee0e8a20c11f755924d5
-- 
2.56.0

