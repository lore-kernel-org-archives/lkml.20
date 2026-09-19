Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C5D37CD47
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 10:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789812646; cv=none; b=tPFj1mdpZZgJqhlGBkYoLL1DB9BW//oY+cEDDERNNS8j12Y2LwKugXTB0LkoiIZKJ4dLcakWt5o9vJgq4Q5U4KkBQXzv3jClaspV1KnBxmmaPUu2nSJmtMz4ddguE/zutit/0TWvs2cFj5KGGmNkGdIFS48Rtwc6xillYmsRsPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789812646; c=relaxed/simple;
	bh=AgeA2/0yaAie1oxugGl0NMqzpkSnjs2feCS1fA7m8Cs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TG7i9IzgZq/KAb/s2IYzkax70SnRhfXOCBS1f23kTxq5WohBC/LnnyYuBq6fOTheXlMNpAlQhgGC2VJ4htLGnVtkU/s6ZYZJBDqOXNx+b1PghzZK6tQoK6krGO1w1sm6AS7rmw6e3M8qSqYqeMQ22jxI6fkvhVcrSSooCs9PegE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IEau9zNN; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IEau9zNN"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49d1fb0cf5eso11238095e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 03:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789812643; x=1790417443; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZbPnqDvacY/gcigjjJwdEfY3Aaa8wSWZwr6l1HMTaHM=;
        b=IEau9zNN7oAv97HX3l59OIeZFoLFFhPaO4pvl9fG0nzaAZ51BTh7Y8c8NUaRAd5wTF
         HQ4QYIYyLMxbTkfF8RpWHCfMWfsuH5g23MO6W0YFe/4OgA80GkqPxOViJkZ1mXyk0CY8
         QYFMciieJRyGQNRdf3oHmGkpv3t5fcy38rkDaLCir4fCQxv7osewk0d0yefPg726abFu
         ENykopOu4hzQIzjN8cMXYmn9c12YPByz6CPJRUxH0nIGOvZ8IqHMnLidHVxeVVOT/UGR
         ONFWspl4PYH7WoA7BzsogNgirGVY9sMkJm9QBEqQ+MYeXStR4d3aHneGMQ7/h9AsJ2OU
         8pUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789812643; x=1790417443;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZbPnqDvacY/gcigjjJwdEfY3Aaa8wSWZwr6l1HMTaHM=;
        b=2jMozUkC/Dc8OdK2UhrNVzlxkLGX1TXnNpCRm3rCQkPYChylhrsppi1ux0JJCXGI2y
         0X2jjN08Iql6MXrBPMOXjkpS7279ZfjSP+BSsgx56W4XHi5aqYN7x6HvN00n6QYJUidc
         BHXPZ4oz74SgmuHuX7UQTelb2JXC4csc/NKQvx9UjnplKrK7BW79tbKKA/4UJcd1THZH
         D54OEUScQFt2eV4/JbkHzgU9Mw2XknAakHL2YbsUB7onZ9WmSO35NyQfTVYLLJKBX9W8
         3lKaX7YPLbXOs4Y7DwyKAYngI6lWmgPotiMqVjLvaShfQ+8TgFIVattsAYKAWBZVY8Gq
         gBsQ==
X-Gm-Message-State: AFuF++m9uINQsg8z82PHY//B3Gym11Cy7a33coFtayyKnVIgT4MIwVkK
	tRsKnWc/AoIZsaVW9ZcQxeTR87LoxkuNEgC0vG7Z4NgVo0VG/HkLdwKs
X-Gm-Gg: AYBFou1LOATfcgT6Y03CQ8a8Oocu8m3iy1DfMXKD6LZdL8RVN3Ftu+jFESifTwD8aiF
	h9udy7zxalrj5s5J188hsHCXGkkSPnKxyZylnTpqQ0qIwZumgL+YNXxOVqzeUvFb6MM2A+NEpIy
	7b6PR85PgeCqC5uvOxghqE7F83TyPf0lBcBrBNcw1V4qcWA78rrbuRBYVs6QiDVt+VzvLT64qH5
	nWVgM7GEnETpoHd0BjYGbKqxfhif5FptEMD25J4C8tFzWXz85h//92xVVTnIOUjKII26/RBfym/
	OKkYrNTNvBnEUEVCrDpJ9ghvwgz58hebYFft3i+dAK9idhW9A1pHKKyDvyAmL8R8K4bEfXDzyz5
	0FmCm64LZbK04Pwg/Z34r5TuvD12iO41esZOBut6zUtWUY6pJ1yhhToZjY6gFNC+Sdwt77IItV+
	Lb7LMOQtQtb85PSisocMX7d6+0U0/+CuV13EUgRhe/gdJ1S4pDGdCpxOdv3ZbnGh6O+/SzFPSHw
	gEoX0Vki5YRdoLBx/PJHEiPlvptTDEGb3CXdgNtZeTz87mVAUSXBVXN
X-Received: by 2002:a05:600c:138b:b0:49c:f89b:f82 with SMTP id 5b1f17b1804b1-49fc568f8dcmr63857195e9.12.1789812643037;
        Sat, 19 Sep 2026 03:10:43 -0700 (PDT)
Received: from julian.home (193-248-207-30.ftth.fr.orangecustomers.net. [193.248.207.30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd2f7ef3sm58499105e9.0.2026.09.19.03.10.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 03:10:42 -0700 (PDT)
From: User <julianpoulainpro@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	User <julianpoulainpro@gmail.com>
Subject: [PATCH] staging: axis-fifo: validate tx_fifo_depth in axis_fifo_parse_dt()
Date: Sat, 19 Sep 2026 12:05:11 +0200
Message-ID: <20260919100511.16032-1-julianpoulainpro@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tx_fifo_depth is read from the device tree as an unsigned int and
later used in axis_fifo_write() as:

    words_to_write > (fifo->tx_fifo_depth - 4)

If tx_fifo_depth is <= 4, the unsigned subtraction wraps around to
a very large value, making the bounds check ineffective. This can
cause the calling process to block indefinitely waiting for a FIFO
vacancy that will never be reached.

Add a validation check in axis_fifo_parse_dt() to reject invalid
values at probe time with a clear error message.

Compile-tested with:
  make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- \
       drivers/staging/axis-fifo/axis-fifo.o

Signed-off-by: User <julianpoulainpro@gmail.com>
---
 drivers/staging/axis-fifo/axis-fifo.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index 3d358f919..bc8a380ae 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -413,6 +413,13 @@ static int axis_fifo_parse_dt(struct axis_fifo *fifo)
 	if (ret)
 		return ret;
 
+	if (fifo->tx_fifo_depth <= 4) {
+		dev_err(fifo->dt_device,
+			"invalid xlnx,tx-fifo-depth (%u), must be > 4\n",
+			fifo->tx_fifo_depth);
+		return -EINVAL;
+	}
+
 	ret = of_property_read_u32(node, "xlnx,use-rx-data",
 				   &fifo->has_rx_fifo);
 	if (ret)
-- 
2.53.0

