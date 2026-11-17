Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794908678;
	b=K0PoC0cDy4R/mxNv7h2R4KQllEdzC7RgqGyLyxAiNWJPsldw4EJyaFLDFM2/BLjIEUl2
	 S7l8Nroc8mwyxU9FucQQ32/M7Ok+Is8lBoIaRTn2nrGeAFJThibGGpRyT9X+mLNASfgbN
	 WZgpjrGQGcyP5rb0SoL74bPyuKv8ly3p2O5n1PVdVFDqKeHqvlhElf+XiWDyE1v2m7TCY
	 UVUoDVUsBIehUTbw3Ep7eZw86eaMW/HmWa3j8ecbcJ+Kfqi0LKHDl996h5sFO4DwHYL7/
	 RZ/VJkY3BrekKX7fUA4RHN8GQ3tnYhl7mkRne6KfKSDSidXk6zqfugpjEjQY/QK7ruw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794908678;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=bpVBOHCqTNlmSYDRormllaIQWrWpuayTwUPbDNGy6w0=;
	b=OxOz8E4bvjQx2C0TouWBjnj1XaxyC/Wovs4I2ciEvAOct/KnXjPTr57RuQeNuKj8UW+f
	 gmqh6k9Ba3KkFN4DT/PakNlIwIOCv6R8saYndkTPegcuxkIBFFkWN6e6sIQncUlERqDd0
	 0Og2xJln/coEBi9veHH6w0EmjU2YGg9H8WePH1DAFbZTdgKR4zjHK2TJVuNWkxdrSNR/Q
	 UeA6b1QjptONwQkqzBeJtV52/Ar5vJdvtz3McotJD09+SnyhpA6AnR/HwPrXmjCihRtDu
	 egBsp5rTB8TfIDvmeE+KCH3ptBTABRGr1hIntjgKCvngDehYS3QuPGnwZqMhQPy73+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ibn59nDn;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C653B606B5AE
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:44:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C653B606B5AE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ibn59nDn
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e987a2ba0cso26560545ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 01:44:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794908677; x=1795513477; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bpVBOHCqTNlmSYDRormllaIQWrWpuayTwUPbDNGy6w0=;
        b=Ibn59nDnajmbpxSmVCbdMujxlpU2xp7zr+ALPIpdphgEd4gO4RRUzcqnftOFGrxtmQ
         DnP1qix7dGJ505+2a69wh2drHmZ+6mHExhJ6xa6j9T+ef1h3z4jFJ17RhJxFPOwmj7Tq
         ceoQHZI8h38rpyuKLlNGko9rrljwHvmJT1EBq3TGs7glnozjV5T+FJU00kKEP/RajDAU
         U7MGTihjuOdOrtLOGN8DCOOWQEZcQwBONbWvOcWmJjJQ+d6xskQ0eN6keqbQf5H0KUSH
         w9LQBYUPigMAlbp9T+3ozAWQoLyyhTlloN2bWEzXpsylC3GCGDBDlWs2ORejIGjPXMU6
         B1pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794908677; x=1795513477;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bpVBOHCqTNlmSYDRormllaIQWrWpuayTwUPbDNGy6w0=;
        b=V8CJ0Um+IXRbrcVljvGEYcxizgKZSyNfLLn8kL0JlKBJs7nvz9gLEfy6fnqYm3/dwB
         qbTTBf1ilD9X9yQ4wqlztnBq8fzisaNMrPwB6Rr2x2oMhBmEQGDUNNRxL78tCHbDyV2/
         dFQd01pi1gPA6ZVDUhv3ekuMurn4j2bVmbIBPrroWzul+HtrVzENyk/gdEcG40VB50j8
         LGp5nybwbqgOExZ4j0ftY1kc0OX0lXOC1iDgP72rGmgLwnkhwHZU/W7z6h8V/1aWG8Y1
         4eWTmRZBGWt2+A/6QMCQwfH0D677388/QCCv61mFn8dgQlGdgh1gZubA6aqeg0rgiXfi
         HgFA==
X-Forwarded-Encrypted: i=1; AL+hErHMHfRgocjd58FPVKhzywwqMo0XAa0WMRnUByM2ihzzuxlT5crSqqu+p0i4xeQTCQa+NcJ1o1NOklg6M54=@vger.kernel.org
X-Gm-Message-State: APuU4Z9gs+mojUfvgw0aUzrJ1Mr26tWvtGkt+NQYeItcSx1ORzliiTnO
	VAdSbfZvgUPng3bbbrhmkDwApcwqzwRXdc1/BPun3IdjTTwMiOPmxTPIFfgKoQ1K
X-Gm-Gg: AZFdTZeW29FctDZG+H9cKQ0/Z9XUblZp1EGov94QqtAPRtrzGBihICZDNPMlsmPzKuJ
	153NZvR6UhWp7lB3aE7LECKp227W8QXiHSaPjNHCMtMtYpMQVv7w7bosroyIDw1yMUAiSzECAon
	BJ4ZdgvnGk0O2K8iSS1FsnW/2PXFWZJr6Zal2E1Qtdoagk5A48DxeQdgql1XrDQ4Nl9XWvEae+5
	6nTxodqyL77FyyJwjMi4Jui7fl8uWwMfFHZ71hdiiuDhBNxuwO2lZQBis5bS06xFVBd2Rhbp3zC
	+dBhjdodpD8vAfJ4FSuYNkFXByQilPDrV9SYgrIhNAYTyamrUvyEdA1tk1gXh/QsGgtu9BhwNDv
	+TzgWQjPXxO68db4CSGd3eVIRd0vEJVuQecWYcUMcAB5uvYnUENCg2+93cF3+czVzTmuHEbczik
	opUIxf8AWiHWWuTOGuxJQQRhVD4sxnrXLXRHOG5PqGGHym3nfq26iVqKIQGPnk2tvdanU2X5Z7n
	oVCFVDifHrWWsJ390Z+XYWFCPzsRpWdBjS/egNvG+cMgtNEuQ4FQxTbzXv4xLRc+BQi7RqIQ48E
	s2sgS0ZErrWy2uXcMPqGpSZ99RIr3Oa3dwfeKFY4tcd4dzL/
X-Received: by 2002:a17:903:3887:b0:2e9:528c:ba02 with SMTP id d9443c01a7336-2ee0dcca259mr118714855ad.60.1794908676979;
        Tue, 17 Nov 2026 01:44:36 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd76db218sm12114815ad.3.2026.11.17.01.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 01:44:36 -0800 (PST)
From: Hyunjung Ko <hj351016@gmail.com>
To: Tim Harvey <tharvey@gateworks.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH] media: i2c: tda1997x: fix out-of-bounds read with a one-block EDID
Date: Tue, 17 Nov 2026 18:44:23 +0900
Message-ID: <20261117094423.193684-1-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
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

tda1997x_set_edid() accepts one or two EDID blocks, but always reads
256 bytes from edid->edid: once when programming the CEA extension
registers and once when saving the EDID in the driver state. For a
one-block EDID the buffer allocated by the V4L2 core is only 128 bytes,
so VIDIOC_SUBDEV_S_EDID with blocks = 1 reads 128 bytes past the end
of it and writes that data to the chip.

Copy only the blocks that were passed in, zero the rest, and program
the chip from the saved copy.

Fixes: 9ac0038db9a7 ("media: i2c: Add TDA1997x HDMI receiver driver")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
 drivers/media/i2c/tda1997x.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/tda1997x.c b/drivers/media/i2c/tda1997x.c
index 30dfd8a7b42b..a523fc2b2b71 100644
--- a/drivers/media/i2c/tda1997x.c
+++ b/drivers/media/i2c/tda1997x.c
@@ -1891,17 +1891,18 @@ static int tda1997x_set_edid(struct v4l2_subdev *sd, struct v4l2_edid *edid)
 
 	tda1997x_disable_edid(sd);
 
+	/* store state */
+	memset(state->edid.edid, 0, sizeof(state->edid.edid));
+	memcpy(state->edid.edid, edid->edid, edid->blocks * 128);
+	state->edid.blocks = edid->blocks;
+
 	/* write base EDID */
 	for (i = 0; i < 128; i++)
-		io_write(sd, REG_EDID_IN_BYTE0 + i, edid->edid[i]);
+		io_write(sd, REG_EDID_IN_BYTE0 + i, state->edid.edid[i]);
 
 	/* write CEA Extension */
 	for (i = 0; i < 128; i++)
-		io_write(sd, REG_EDID_IN_BYTE128 + i, edid->edid[i+128]);
-
-	/* store state */
-	memcpy(state->edid.edid, edid->edid, 256);
-	state->edid.blocks = edid->blocks;
+		io_write(sd, REG_EDID_IN_BYTE128 + i, state->edid.edid[i + 128]);
 
 	tda1997x_enable_edid(sd);
 
-- 
2.43.0

