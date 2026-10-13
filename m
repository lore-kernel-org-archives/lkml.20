Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40424B4873
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 06:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791873226; cv=none; b=d2a7uyWJERPHZqanJv68MArQVWIaGMwV9rCt+GOmXAotJao0wWKqDqBXF1+01/18drnvWVgLLPXbynIymDWcpVOUTVdPGCkrIbWB0p8OyPnGeNhZlPNzPPqGd//6eZe6N79VlDDVc2Pd6x44eZsPFM6/hf0+ZEhKltRsIRJnE30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791873226; c=relaxed/simple;
	bh=BnICTOirhKw3nfpXzrb69X/m6lphJO6tTNr5tzRTrRI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CPKRg3W/MDGOvgp/tkO5d5ojA4pMHDR36tAjxZ7iIKQ3OYaK6XSEkrSklj7G5jM5RNoLA59nKPDSUQawV6EorlkmnUkq7UtzWgWiHBOOl/X3RQKy0GD4Ym9FTW13cZbuz84tH4uXMDK28hhYs27THXQ3JZ9H3bOsFKGTw2T+ejs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aUcqn13m; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aUcqn13m"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3a7cfe8f761so2771136a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 23:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791873224; x=1792478024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WApmH6KSOyvplNUAO8ZIsi5ChpYHEUPqlrpAEqDzH6o=;
        b=aUcqn13m/R2IhONoekrkO5vz3VEgRYOMN8QK023K6NqDuKExVEype5BlkG8TagwnDv
         jo05j4ZDWAgEv3pvmDuOvnpAWfD4FhNBabk6wxEU94u3dCuBYfYWmDujKYoYFTq9LmEe
         5QgbIchOeoSP/GdrrMhvj5VsOIa+uCfWBAo18OcPkJuHi9Qjf2VLpL801C6l3qGMRw4/
         s+dc1DxfbwFZbo2+Gl6+Jbi8R+6rbigkkbCOHg5m4YsNMpHWSxN+XTM76SeMP8AOiFLA
         P1hD2Rqi7FwUHqXsRgQ2F+cZriGTs8QqoZmRnjKTPX+qmDEe3fyTY7hG4aUZbWWAl8u+
         PkhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791873224; x=1792478024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WApmH6KSOyvplNUAO8ZIsi5ChpYHEUPqlrpAEqDzH6o=;
        b=rQnEZ5UhjbZR81o13f/TpF+3DMRRmMnf+EE7u8Lfm3GERtQ4UhvYCYLG14RTCnjGp1
         Np5bj4Gryzv8qH9FovatEXiqdZu9gtDZJ14EQ5g40P7tMLcqspkEF1VxM19Kz1SfVx1b
         MPnZVfUTFCoPAzvkLtW/hUEZD+1d6PDGh4aGZLdKmPIZssGSm1dWeSbVHpQhUJGiLGYd
         eUAyVADu7FMmwhamlStiyCpAn819vNRJzTBCsxZV2vle1UeaTLQvLFXLrZHdDTR+Cz0Y
         0TeotXzbJOajz1FKiGZeTwTS/iP+/ZxmFCzdVAQZIS5i1/bHrY5P4vJoLbDNDLMEimeY
         gOYg==
X-Gm-Message-State: AFq9FYLAff3QAVc+znQfRTUwCzjczujZYjcDqoGpU2XGRwceNHwxGMp9
	MGdR7yeYbBeaRHNd+pDJI9iSdV9n3/AJWYmf/xulkbBKCryfB/g3T2FN
X-Gm-Gg: AYBFou1IZRjiFnNY27pwOrmkfx6Z/y6stzg96i5sS3rIvIAnHn9MWD3Ki7KgqDfq7Z0
	CS/k3kM6PZwTEGxhz/DwvCNkkECV5gsVXai/H7uwC78lW6XDP1dDBk1gPmR/gP2oBQNUwyfh2Ez
	yVCbI05xgsl81OKxRxKUVFJMdJenCinAUU5mNmxdwy4+vnFeYnEN6WXEZBeOVIajpYTm+FpldUv
	C0QD1I5M/nqVdeww2AaaMzTJ7z+6Y7xMoIMHOKJGmHZ7oDqEjK+9+m2ZWNGYFSDPx7z5M/+nFq1
	PzwaQPvJqMn18r9RxM9SpPDW/sl8iDr9naxepwmCKccSNeC4CQAf9IrVmGqzwa5rWV7dJcSmkJw
	d8fa9+jSxPZvvWABUFDRHCgCQAbF/kyQBk0H3T/sUb6eg8FCJDPBSBClRvoSuq9t/mkBP6oH8Ym
	EVsoumfhMVpnCHeXFk/wzl1AGyRiqxBMu3bLjqAd8+8CVBwgPjBBI4daOu6jpaRF77bTFCTS7L5
	tuCk1r+K+DEMi3qUrp64+rfGj5yyg7AzGAkUK4V
X-Received: by 2002:a17:90b:1d50:b0:3ab:4e4:e97a with SMTP id 98e67ed59e1d1-3ab3ab227d9mr6479494a91.26.1791873223941;
        Mon, 12 Oct 2026 23:33:43 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38f4863esm23169595a91.11.2026.10.12.23.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 23:33:43 -0700 (PDT)
From: a0282524688@gmail.com
To: lee@kernel.org,
	Ming Yu <a0282524688@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v9 02/12] mfd: nct6694: Check the length of received USB packets
Date: Tue, 13 Oct 2026 14:32:48 +0800
Message-Id: <20261013063259.2734757-3-a0282524688@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261013063259.2734757-1-a0282524688@gmail.com>
References: <20261013063259.2734757-1-a0282524688@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ming Yu <a0282524688@gmail.com>

The response status and the interrupt status are parsed without
checking how many bytes were actually received. A short or zero-length
packet leaves stale data in the buffer, which is then taken as a valid
status and may repeatedly dispatch the same interrupts.

Reject short response packets and ignore short interrupt packets.

Fixes: 51dad33ede63 ("mfd: Add core driver for Nuvoton NCT6694")
Signed-off-by: Ming Yu <a0282524688@gmail.com>
---
Changes in v9:
- None.

Changes in v8:
- New patch. Check the length of the response and interrupt packets
  before parsing them.

 drivers/mfd/nct6694.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/mfd/nct6694.c b/drivers/mfd/nct6694.c
index b9526b22754c..de0027c98726 100644
--- a/drivers/mfd/nct6694.c
+++ b/drivers/mfd/nct6694.c
@@ -117,6 +117,12 @@ int nct6694_read_msg(struct nct6694 *nct6694, const struct nct6694_cmd_header *c
 	if (ret)
 		return ret;
 
+	if (rx_len != sizeof(msg->response_header)) {
+		dev_err(nct6694->dev, "Expected response length %zu, but got %d\n",
+			sizeof(msg->response_header), rx_len);
+		return -EIO;
+	}
+
 	/* Receive data packet from USB device */
 	ret = usb_bulk_msg(udev, usb_rcvbulkpipe(udev, NCT6694_BULK_IN_EP), buf,
 			   le16_to_cpu(cmd_hd->len), &rx_len, NCT6694_URB_TIMEOUT);
@@ -173,6 +179,12 @@ int nct6694_write_msg(struct nct6694 *nct6694, const struct nct6694_cmd_header *
 	if (ret)
 		return ret;
 
+	if (rx_len != sizeof(msg->response_header)) {
+		dev_err(nct6694->dev, "Expected response length %zu, but got %d\n",
+			sizeof(msg->response_header), rx_len);
+		return -EIO;
+	}
+
 	/* Receive data packet from USB device */
 	ret = usb_bulk_msg(udev, usb_rcvbulkpipe(udev, NCT6694_BULK_IN_EP), buf,
 			   le16_to_cpu(cmd_hd->len), &rx_len, NCT6694_URB_TIMEOUT);
@@ -207,6 +219,9 @@ static void usb_int_callback(struct urb *urb)
 		goto resubmit;
 	}
 
+	if (urb->actual_length < sizeof(*status_le))
+		goto resubmit;
+
 	int_status = le32_to_cpu(*status_le);
 
 	while (int_status) {
-- 
2.34.1

