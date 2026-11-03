Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793695635;
	b=nqnvU3JyXvuXDN19vyx2JCymkg5jFV4P0T3qRgk3EhrOtVvjPEbZqUA/DiY1Ye3UCf/f
	 qgG97bnYQu1Qw3RsPYwKevzj8vb7/bRtXszPir8GR3CKdDzw3FTFSeXidfhFJsM/gRvZB
	 ENpzDoRAE/9Qssr7+0PX6ouVECjU761t4Yx7zVV14K+3UekCikloDLEU17tXau5YAO65P
	 v+gDmJo9YXiMS0xtwM2mjs6qLsOzobslry36iRVsVi4yD/k24LLjD3PgZW8l8RTBHuzxW
	 ARntnOk+osT7aGlLqevUs/tWoG0zBnnkfUcnAplAQF9gFBfhPdUcltlMKGZwR9ifizQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793695635;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=aKHO6s+vDpsbcy/6pYNvSAfUraC/MEbz6EzD41uF6vs=;
	b=eXz85toxl0d2d74nuE41bQz6So/AuernL61tr4JuuMcIbCY9PtQR0tHvS7RTGdDfLiH+
	 EvMFIVfq6v4J+g2j9ueyNwaDu09ALZ2DojPYGI9GCH6/kMctioyb1Zw5jL5lv4yZkf6nX
	 2IgB1JEeaRIP/6DmU54++plyHE4S4YO/JwLIQ6JYQnxJLDSTvoLGLJycYBPfH8D8BgpFh
	 PmN/VpYTVq1C3oE2JYnta1/ltXJmnnmhj0TAmo8H0hGv00LTd8etbtBR69Wb0FiGpnIb5
	 piyT4mVEc+PK7dTrj1D1yioYj9KLIzl+4YumMVw0or3nlmrIkTpOOn5Jc08HQWh/4vA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AnxVS1J8;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF16606A32D
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 08:47:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FF16606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AnxVS1J8
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ac78f4c10bso1743711a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 00:47:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793695635; x=1794300435; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aKHO6s+vDpsbcy/6pYNvSAfUraC/MEbz6EzD41uF6vs=;
        b=AnxVS1J80qJcvRAlxIaGjp7cDqrd1lbtGAUeTDA8+MYBkQJy0p4Rp1MtGhb7pefD+h
         1Cy6S/h4hh+dvemHj4UysWtOVHQ+P4Xz7KtZCBbqw70TkxUGylPv/EZKBMZ+RFd5lsra
         fZRz+DO507tSsxL9TsYtjTM7gDA6kJEt4oSytJM0+bOO36Mu0cKTb+UK8M3xCmhIEjSE
         7YQNKNHd6wh2wyMsmZORNyLz1UIeH5Xipg6iSvUl3NWzH4iOkaswTOyOuholg25XgtQR
         ukuVhQNWvj18SVFF2bBDrELhW6SrmWYZAioH6OtqWZdLZTSZi21dx0cbD3P73oOEYEGt
         rZNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793695635; x=1794300435;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aKHO6s+vDpsbcy/6pYNvSAfUraC/MEbz6EzD41uF6vs=;
        b=eaHvhr9bLfhh/2fUHI3ELSB/PB0Ae3Avg8FQ+6K7d8omjzsfJ6O/K/n6+Vn9tduvLM
         PvEnxbeB1gjto6bDOkzLoW/xuSEZT8t3JqUUJHo0L3Ngy3eln1DBh81dBD1axUcnwXXu
         D1B5d/PZSrqjwtr40aKKWrowGG9RAmYg4Zafa8DJQJG331W5R+6LaazeqfetE0wJstFB
         LdCU3UH/Md+RNTW9vl08bGa+2Vxzvd/DewZ2VkTOMzVQdUmtAbezh+V3+7M71QSJtpyU
         GBNoUMmvPmweDC1QosizfkLnDFd3Fq1G//rwGQSpJjkJGX1dOuqtQOexly5jPTu/8pAF
         3MzA==
X-Forwarded-Encrypted: i=1; AKwUvBx4vdDrgZ8dma/6G2HtFTJS6iovuUIe0wlCn1yFW5ZZQTnbeo9Psy7VS2F9mc/sSq8leIE41CN5K9i7E2A=@vger.kernel.org
X-Gm-Message-State: APuU4Z9FXZKaAN2M/i47y+Fm8h4fTaIpZxJcajX56pGICS2ytz+dFnJV
	PH3aokPkFaZ5cDRZzIIXOYXI7iuqDzm6XqNx5OJASdJ5kuII3judhQ+7
X-Gm-Gg: AYBFou3E/jchvj7nyVD8HiQwU3pg5+lc5/RschPRbhEXw11VWJtTFC1O42BVuVvHbdM
	15sxDxP/I/lSxX4VlBb/Qgjz0gPdwfIvFEAprYSExa7+DVCe2WKh75UTo+Bmts30hDVKXrst/P/
	oHCMC5V7EkvDntS2ulczn//q/B/PAw3ujVSJ21YEFY6PgxrkExUAt4uAs3OalLZlOZqFMxNCdRd
	UpjooxxS2PB1DkOZn6Wi5spOGOmL0RV28bF5v8OsLC/WIHLfXW2+qJ2IXvh2OWH0kznWNn/pdnU
	Y/XszAgCVyGDheI8jY6k7xDsNgtYrMoxglFZXgBfVyo+9m+3ILq2odz9i9bRg15c7x0PidSQoli
	N2YDw1j6Dp7A28+A9SnJAz6k6TrF0AecZhr9E900eUkKzpXNbty/6DbmLCvyeAAcJntGTozANS1
	JmrCP0PrbHYJg0G1yRxtaPWMuKZUwyH+MBomcPK+1NXKJNQyBCCjAPBILra6JoelxNuxQ/Jc9EP
	LN+gOSj2Isui2zHOvVDG6q+xFWyrndwDaBUYc7LO61ZKp35TLfeaKUzGDAi2RVsceFuXtfaOIjf
	r4WKdpYW81So9y7hOReAQmjsxKAzIHQ8jXmvulDICOaga9cv
X-Received: by 2002:a17:90b:3e83:b0:3aa:f875:3385 with SMTP id 98e67ed59e1d1-3ae8973162emr10835468a91.26.1793695634691;
        Tue, 03 Nov 2026 00:47:14 -0800 (PST)
Received: from spiderman.taila3fd8c.ts.net ([202.112.47.77])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c627193sm3537031a91.6.2026.11.03.00.47.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 00:47:14 -0800 (PST)
From: Li Ximo <lixicaicai@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wang Haoran <haoranwangsec@gmail.com>,
	Li Ximo <lixicaicai@gmail.com>
Subject: [PATCH v2] spi: pic32-sqi: guard against empty BD list in pic32_sqi_one_message()
Date: Tue,  3 Nov 2026 16:47:07 +0800
Message-Id: <20261103084707.1582675-1-lixicaicai@gmail.com>
X-Mailer: git-send-email 2.25.1
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

From: Wang Haoran <haoranwangsec@gmail.com>

list_first_entry()/list_last_entry() do not return NULL on an empty
list; they return the container_of() of the list head, i.e. a wild
pointer.

The SPI core rejects a message with no transfers, but it accepts a
transfer that has neither tx_buf nor rx_buf. For such transfers
pic32_sqi_one_transfer() iterates an empty scatterlist, queues no
buffer descriptor and still returns success, so a message made up only
of buffer-less transfers leaves sqi->bd_list_used empty. The subsequent
list_last_entry() then returns a wild pointer through which the driver
sets BD_LAST/BD_CS_DEASSERT, and list_first_entry() returns another one
whose bd_dma is programmed as the DMA base address, corrupting memory.

Bail out with -EINVAL when the BD list is empty, setting msg->status
the same way the timeout path below does. The xfer_out cleanup path
tolerates an empty list, and normal messages are unaffected.

This issue was found by static analysis.

Reported-by: Wang Haoran <haoranwangsec@gmail.com>
Reported-by: Li Ximo <lixicaicai@gmail.com>
Signed-off-by: Wang Haoran <haoranwangsec@gmail.com>
---
v1: https://lore.kernel.org/r/20261026115219.3528114-1-lixicaicai@gmail.com
v2: set msg->status on the error path as the timeout path does, and
correct the description of how the empty list is reached (the core
rejects transfer-less messages but accepts buffer-less transfers), per
Mark Brown's review.

 drivers/spi/spi-pic32-sqi.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/spi/spi-pic32-sqi.c b/drivers/spi/spi-pic32-sqi.c
index 5d3921e29..ce8d60497 100644
--- a/drivers/spi/spi-pic32-sqi.c
+++ b/drivers/spi/spi-pic32-sqi.c
@@ -391,6 +391,17 @@ static int pic32_sqi_one_message(struct spi_controller *host,
 		}
 	}
 
+	/*
+	 * A message whose transfers all have neither tx_buf nor rx_buf
+	 * leaves the BD list empty. Fail the message like the timeout
+	 * path does, before chaining the BDs.
+	 */
+	if (list_empty(&sqi->bd_list_used)) {
+		ret = -EINVAL;
+		msg->status = ret;
+		goto xfer_out;
+	}
+
 	/* BDs are prepared and chained. Now mark LAST_BD, CS_DEASSERT at last
 	 * element of the list.
 	 */
-- 
2.30.2
