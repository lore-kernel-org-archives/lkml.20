Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA1E235358
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 03:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789011149; cv=none; b=SZfXmUjkcmhtAVXikO5I+jjm6x3pWBCDjhoa6OSHOGIoSYL6Di3bjS2h29iVOdigElj6XN9oTYqoPIi+V98s5rwoo6xV8AAXdZRt5LItwoyuXwMhh5XtPlainul4hOPIXsve4+6ZzU1hHEye1QzncR91NQGrpgbDO66zNIRfTII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789011149; c=relaxed/simple;
	bh=D4HunRvKzwgbz3wH3A5yR4Me0etry0KENkQiN7rdUVc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CBwsAZ2WuunO1evqSmA9R/scLSkFuv8Kgo+0nphuJNF6ExsUU6PCNMSlE3AV2G8IW6WTkcX5u+lhB40+Xy/zeCRulaNg77rkloz7LpQNDIX5XLxPhNkrkV0O56hr1IGSY8UnpHFPlR6eGJNLzFPBs02+uUFOFk6Myxb33cRYVxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fbOInQW+; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fbOInQW+"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49cd77e0f95so51579925e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 20:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789011145; x=1789615945; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UJRPReMfqlNULQmo1hdhh0WFJsW8FZ4M2mPbCe/HToI=;
        b=fbOInQW+UDgoKHz12Y1wQZPviQs5v37yubpHd+FmrWQ4XNfofN6rGfDsAQfZ1Ote4V
         t+zF5vx8Dr1ZQzJ6TE3WPWWf5U9l16+5cMfhFhzGQDByOLSYY/Fbx0uvjwW1VnsUGMqf
         7jG/EbDKIyD0B1F1GxayKIvdEup3yHWEx7zPDPc9zaVbHwXR6dBPSCvj/1KP2ti6g6hq
         IejpC+3p0HoD3wSwU9qOKwOgA2Grb8+A3YXYjayL+kaq4E0MGi+TZOla1+II2CNJO+XU
         hmm/OkH56vI+TRpN5YLnUPObctRQF4l3ptfd2ZuAcinKLa8rpVIHRWjPAw8OKRBhchj4
         7A7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789011145; x=1789615945;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UJRPReMfqlNULQmo1hdhh0WFJsW8FZ4M2mPbCe/HToI=;
        b=FZDUc2nRqowmfCK1eSkWIuXqWqxcLT0zQomFgpggqf/JsxTy5DyrpF9r4/aFTaIZUO
         AedgnQg6Q4RiG/0gmfc9zirvhLSZCdIlh4cs9LdsfdKrMcNlTZx3JWYU7wtMQnWTCyrQ
         GpgnF/QQFF452iteL2M89tiQlldzUaKJN2VZlPO0xs9RXKg4PvKP+I3DRtJ7f50tmuMw
         AjCLv3beJks7NKccOS+S9jJ9THXI8JEIiv1GSeVS/sVAupsyRqZcCAvjvsvW52eZT+Sy
         CTnEhkoUdT0Fme71R4yElvOhogYDksmblmbzlHsyXmnvQilNwG0UtOfxIekP3PYCtCcq
         /hMw==
X-Forwarded-Encrypted: i=1; AKwUvBwvWL1rfVA6ai9k6NdmgCVN1JakpV6RPblhDdv1bj7E4sYykhUAmntRChlsOuoULRkcbO2ZnNsxRnf7Qnc=@vger.kernel.org
X-Gm-Message-State: AFuF++nYwenmWRfsTffFDF+wTALO5QovKVeZm7Mc+0GIxg+F271hM9Lp
	RK9glODizxbvR81inT072FWvj55HuSPsiYeNIbmGsOYKLZrsjMR7cncj
X-Gm-Gg: AYBFou2SnbGks4jbATujpTr5lGstVZ0Q2yjZbOZIbWrYpEW1hOSEb5vPuRsfLyHRj+k
	d4GukCOgpj31nvqQnQrvr4DbE2Ako3j6Z7fhvaZJbJvsx+QJUqUNxjUFIccUSM/4mQJZ5hhBLff
	YBMyL0wBuUvBqiA18v8s2R1dj3A2EtTncntyHl/6v0VAZfk57LTBnPexo1EDx9R2yYwBZ0jcMmm
	eM23p9ZiolD4ky7T1pox5Xlopi6AxQHm+T80hEMfojHTNlGtXo9hrx1iuxma1jRDmo8iUrU8f52
	oVRt5ksaOO+V7FEciDtegmB/02wyBOAhEgHGdGInLPWLZOUblK3HfvRcVICj7UNbPz1JxpRzTVF
	QFwCORtcN/si4J6NMgZmBTVQ9JDOE3sDLdh7WL8+fX07MnNcGq7erNT8y5tmcsjfMg+nXzuuBkz
	naQYCsKwa2+3RUHKXo1J6On3Zvxh3PO8RQPwFPQ2vuN9nE1vOY7nEdqSQdIdHjsvsy3Mo6ZhCuP
	cOLgClw9NGO9+lv4jAy/81lDOT6oeAvu0NHjjRC0Yc4LhXQZgrx4dGgqkltB4p948UkyIZvkhVQ
	iJVPwxa6raRZJlBpEug3AOlPv50J2Xn8PSii5m1UZYt2E1+i1TQOPqe6dC5Y4eOj+UVDW89kbpy
	2isCPHqeYBA==
X-Received: by 2002:a05:600c:8b88:b0:49c:fc6e:a3d8 with SMTP id 5b1f17b1804b1-49cffde8d95mr350363235e9.23.1789011144508;
        Wed, 09 Sep 2026 20:32:24 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b3d9-b901-0402-5aad-0ef4-88ac.310.pool.telefonica.de. [2a02:3100:b3d9:b901:402:5aad:ef4:88ac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c494basm34734585e9.12.2026.09.09.20.32.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 09 Sep 2026 20:32:23 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	David Lechner <dlechner@baylibre.com>,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org
Subject: [PATCH] spi: docs: Use the multi-lane mode constants in examples
Date: Thu, 10 Sep 2026 05:32:19 +0200
Message-Id: <20260910033219.15996-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The multi-lane documentation names SPI_MULTI_BUS_MODE_* constants,
including in the transfer initializers. The interface introduced with
the document uses SPI_MULTI_LANE_MODE_*, so the examples refer to
undefined macros.

Use the interface's constants in the descriptions and examples.

Fixes: 05c3bd745bb0 ("spi: Documentation: add page on multi-lane support")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/spi/multiple-data-lanes.rst | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/spi/multiple-data-lanes.rst b/Documentation/spi/multiple-data-lanes.rst
index 69cb532d052f..802aece35d56 100644
--- a/Documentation/spi/multiple-data-lanes.rst
+++ b/Documentation/spi/multiple-data-lanes.rst
@@ -127,7 +127,7 @@ field to indicate which mode they want to use for a given transfer.
 
 The possible values for this field have the following semantics:
 
-- :c:macro:`SPI_MULTI_BUS_MODE_SINGLE`: Only use the first lane. Other lanes are
+- :c:macro:`SPI_MULTI_LANE_MODE_SINGLE`: Only use the first lane. Other lanes are
     ignored. This means that it is operating just like a conventional SPI
     peripheral. This is the default, so it does not need to be explicitly set.
 
@@ -149,7 +149,7 @@ The possible values for this field have the following semantics:
         ----------   ----------------   ----------
             SDO 0    0-0-0-1-0-0-0-1    SDI 0
 
-- :c:macro:`SPI_MULTI_BUS_MODE_MIRROR`: Send a single data word over all of the
+- :c:macro:`SPI_MULTI_LANE_MODE_MIRROR`: Send a single data word over all of the
     lanes at the same time. This only makes sense for writes and not
     for reads.
 
@@ -160,7 +160,7 @@ The possible values for this field have the following semantics:
         struct spi_transfer xfer = {
             .tx_buf = tx_buf,
             .len = 1,
-            .multi_lane_mode = SPI_MULTI_BUS_MODE_MIRROR,
+            .multi_lane_mode = SPI_MULTI_LANE_MODE_MIRROR,
         };
 
         spi_sync_transfer(spi, &xfer, 1);
@@ -172,7 +172,7 @@ The possible values for this field have the following semantics:
             SDO 0    0-0-0-1-0-0-0-1    SDI 0
             SDO 1    0-0-0-1-0-0-0-1    SDI 1
 
-- :c:macro:`SPI_MULTI_BUS_MODE_STRIPE`: Send or receive two different data words
+- :c:macro:`SPI_MULTI_LANE_MODE_STRIPE`: Send or receive two different data words
     at the same time, one on each lane. This means that the buffer needs to be
     sized to hold data for all lanes. Data is interleaved in the buffer, with
     the first word corresponding to lane 0, the second to lane 1, and so on.
@@ -185,7 +185,7 @@ The possible values for this field have the following semantics:
         struct spi_transfer xfer = {
             .rx_buf = rx_buf,
             .len = 2,
-            .multi_lane_mode = SPI_MULTI_BUS_MODE_STRIPE,
+            .multi_lane_mode = SPI_MULTI_LANE_MODE_STRIPE,
         };
 
         spi_sync_transfer(spi, &xfer, 1);

base-commit: 50d05c7c76c96b90462f24debacca971d2e86713
-- 
2.39.5 (Apple Git-154)

