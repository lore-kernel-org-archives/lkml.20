Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EECEA47126A
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 09:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791364993; cv=none; b=Gi2ujiGzFSpLvpKLjxX/azl2io8Lf1FVcOCjW8odKNw5Pkee4ydJBtbewqoORAjsGnqp1h0eYPCq4jJsHszR1JIkethSMNsoqOi9qCjQKRmiD3AVFWw8XwyBCG715/hEHdyLBkFTqh6P0YZCLdlOAGC2Xh4uGvHZ6dEC31I39gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791364993; c=relaxed/simple;
	bh=RWd0CWGVolWgNflT2TfbDNl1hJPYoD5qLghZYbWezPE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EVsvq8XFiE//rsBDNclcAS19cUOZPKK1s3GaHnyvhKPpzTjAgCun0W7kk8RdvNk+baVTnIq3MOKQCQWlXf2PfZjzT93q9qMxr+0EhlmFGxxXiOggscQn47uoN1d0qR+UVbrEE31EziuVm3lPlfvj0Lkn3IF1BMg/UREhZaZuZ6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dtJHt6KL; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dtJHt6KL"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e2e064b932so20057515ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 02:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791364888; x=1791969688; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kt77OAyXpC7f7bzDw4WTjQlmEMJKd9flF9dr7sAWONA=;
        b=dtJHt6KLNVYfm7lunxvwL+J1D0uaZZM+VHyHvrmIGGtBvBw+/JyUF4ruQIPzsR5Y4i
         ipJA/8dt1nNSzokxuDdFs0k5gjcS3SR4Q0Cc3nmFGNdhqRyc8wKFRyWWgRQ9m0Lwq8dE
         VX9zvIE9+bH+aFBHvqNBySrUdn/x68AAVIuzjU+f/QjWwsyMRHnn7amWUfDhPLDJOvSd
         gDwKwHZQXfwthjCDf9ofytPBsS8RmNFQBzO5T3bv2LbWbREmLf6gEIz4Iq9UUsyG1WrG
         zo3646DAYnA5//abvUxrkagXEN5Yts++hs9AlMSLM0iRpOoWC6qwjNDVmZHwv7QiD8+Y
         wrAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791364888; x=1791969688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kt77OAyXpC7f7bzDw4WTjQlmEMJKd9flF9dr7sAWONA=;
        b=ffy/sILZoY8motwJcCJc/3RYfRL9zPjADOsWZgdxNlM1ExhGZ3SxGdemPZ14Oltrlz
         uengvRlIE0m0lL1JT1D8eqQhbX+wyWDJQDAr4/TowW+tkITM8+s2yFdfMU9zx4CINvpg
         7KO07GDkubYpo7uNKM2QNtOTSeC2lkfdRjZRIpNW7CEWoWnp83IUq7lqRRxmvsOa2TmJ
         IHYbhLgvXCY7Mexj5lcZPqvgtm8I/HdvBseGYGBF4k8Ht2eMPzrhg8icVJ6XSp1V2Hyg
         bD2HZDuyXhOV3Gn24qnXcWogzy44QITKqPP3GOuXtetRWk/71yY9cXY8nT2gz7BTPEoV
         X6Dg==
X-Gm-Message-State: AFq9FYJ/hhQn+bfuFX5phjrNItbf8S+NQpCOqu93azxhLnCPiTL8p6l4
	J+U9CyaDXS449jEHLWop1cE7J/uSJBxhIoWu4mweru+6Jsnko6UeX3/V
X-Gm-Gg: AYBFou2rlBzsnMmmz2pR+Q5hLflBtyPSrlUrBzyaMYLTrZ+zHFGSn0ib0zoDR//U0S3
	2z78UCSvsPwgEAPQJukzRpTiZ02q3QVvLmRz4nrhfg/naLgWoydfmE/N8lkYauYnB6rHzftC+gn
	gRxlu52HzpnwwiKNmlWxD9ZgS53+TV0P13KD6vMHOq6nglNnDsec0tXRokl3QZYytJMNuFHIMQT
	5bp8zbevSofH/exgcK+XM/Kmf28ydY2qKRrL8dTvemFAVmIUokt1LbsdjT5/K7e7t+1YV7DrJPu
	yUXkKa+7QWlOy3UWSJS2IBeo9/V8NAO8zApX2YUjYKIUpxJ2GJSXAl+7hxyoOnOTpkHloyX4SIC
	w5eR9LgK2N1HjHXpwngJgncqWwTyWdpIs+wt3bZHHw0wZPq2e9DUjn1MA+WLVNEtl+avITs0pbr
	1ACoZ/QZ7BGMOMaSZKoxiwpBMokSCz8N4Leg0J4dFwacHDFTPaamFc8QtUwKvANqMx3LnWQeUZ0
	4JHv8PrBZzkA9ORqsQo3qB/aUhbQm7S9CU7ZTDM
X-Received: by 2002:a17:903:1210:b0:2e5:ee16:2f8c with SMTP id d9443c01a7336-2e6003914b8mr16683325ad.16.1791364887907;
        Wed, 07 Oct 2026 02:21:27 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e6046fe0e8sm7180675ad.25.2026.10.07.02.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:21:27 -0700 (PDT)
From: a0282524688@gmail.com
To: lee@kernel.org,
	Ming Yu <a0282524688@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v8 03/13] mfd: nct6694: Check the length of received USB packets
Date: Wed,  7 Oct 2026 17:20:52 +0800
Message-Id: <20261007092102.3768818-4-a0282524688@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261007092102.3768818-1-a0282524688@gmail.com>
References: <20261007092102.3768818-1-a0282524688@gmail.com>
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

