Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B811E3BBA1A
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 05:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791956488; cv=none; b=BzBiOUI1NLSwb+Y3M7fK6+XXwMLO5pELkVXATrhTSpcmaKgP7hBoo5OZf8VOFWcFBGmck4kYfqnGIRLPL6BsFjmxuazSu7VOaLN5qWo+CDvHpg/foecmxoBU6OXvCkVzVhlRG9yixw3OMPa7lObKTZauVOjfiMzO3/n36zkptqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791956488; c=relaxed/simple;
	bh=UiCMp9/mbXDOv9B80OTIXeVoRdGMfKk6pMvkikdtARs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jBgW9nqSpB+bqL4t/I0wFChkpWi60QNnqVGNPlVIqq8cCTC981RR/7bKhDmvykql8dGUlw41EcQ/IEVTC1o4EINoXhYPAglQriK1ApXsPkjNPpUT3mMlPo9i7hyzcsUVjV9/rxxdVXraS5rGWHtDjOfcKbWyGdKgjpAGdUzI/b0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GGAhk4tu; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GGAhk4tu"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-15ea896ddc8so870253c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 22:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791956487; x=1792561287; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/zFJfII781OXM3XVdyaHXmQsNX/Uoncqqxm/Oj8RxVE=;
        b=GGAhk4tuqdU5gUlhuU0bB4QzsnK2HPYsv4N5oAsIF0Ib/4Jpi8yPd1+jWxlVTSGO/w
         XuQXyc5y8p+HX0cCZwyshmXMEpNbVfK/rs9PrmvQzXeoy74p4hnPO54lrQKsPXV2l5KI
         O+suHcZhrMVlPl2AlwB7meL5szOnqG2sUsVdyxzYSPw67Da8feMmuRTVKmFt1jUs5pm6
         j75xyJ0lrObLlROwams7Ia+hFSiMps0S5SuYmRcN5sX28L+cKNoMCxjXnC/LQKMCAPYZ
         E0JgV4tJiuv6js/He8ljzA7e+QS4kH+r3P7iisTurePI/+icJnVeF01OWFgiLzWaBYBt
         Tl4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791956487; x=1792561287;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/zFJfII781OXM3XVdyaHXmQsNX/Uoncqqxm/Oj8RxVE=;
        b=D6v5lqh4FajM/lqAjPwKBV6YGxuiA6AmVbY0PavMklaQm0aOKoYwrELb+Pi4NPxIsQ
         avxg5YcbfYYrb8b/JUG51WgvWkqCKKJqo+S+J5/sIL9OyTGLp+K0MoobTUVzYyuQeVDR
         6z/GqVcNfAarvBQlsVKjFSlyh5mRN7Mpp2hzcCkOAKO24QDliNflWMl5nQFFYxj0xqQh
         v+1K9RXYHvhM41eqbSW4ggG7LF+BhnnIdEAD9a0AjSCjVdGu7kDF1KK0T0YqIg5BbrYG
         jRNpInB41KLTjnHohn/UCk6BNVyhRqjuhH098rqxAQTY8cIvqD+r415UKXLoUlt/dDAs
         RNFg==
X-Forwarded-Encrypted: i=1; AKwUvBxfBRhDwal+ncIEuPDnoFu16zsHubNGkKYUAz9HXuJ5BDgd9XCVDxFBBG+E+EVBFiHoB3vsYtt8WfEgOyk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKwJf80Ajp7UbfKYd3FX1lbrzojlds/+44AIJKUuz8JMjZ+UtuD
	uAg1TifjBZtxODETXtemlQ+Zsm85aWeItbnpYh9pDqr5ZUowLuLCgsa2wauFNDfk
X-Gm-Gg: AYBFou0xL/sUt4RPbhqfGgsO5mYEsSua6ePKnMrCWDWNVoB40Qu1uNQ/TqcSTWntRPB
	CQ/frrYEZNsMO64xwqTIEAJeCdXL51ma4f1sObTKNEPenzMilfvaofnHOiq/t/Z7u0lnzAOpF6B
	wBxW9T8FHaM45ceZ6vuPtAe9XwBMG2mns5jQSKaE4QmIm8GrbNFBgt4N3hhsrEc84rntm3l6BBl
	dTXWVmpXycW6oukySgQeFr0oy5Zej0bJCXsVu/OIboZJCNDvJgWe8qdUVd58IIDCFk5WrO3kIqY
	ke8Lu9eSkk2/6JskH2BOo546UE9WymG4xvNR46Rpsd3zK/nkyjF5jvw4LKRL7cC0r4FNuXZBCmr
	5qIORiH7KagqHyd6Ay5P2067M79PAsQVdFTqf8cxezts0MPKtgyqoZJiYxT2+hq3m/d8IxaBeub
	fElVDMEVK0na8Q/tgikTCez9AVCXW8CMnJh19ua5NNa5QePKzPPLqaqSDUuodBvrkyhCRWGNOgh
	AbfuhPH
X-Received: by 2002:a05:701b:2091:10b0:143:2968:564c with SMTP id a92af1059eb24-16a6043be98mr21192916c88.26.1791956486625;
        Tue, 13 Oct 2026 22:41:26 -0700 (PDT)
Received: from Hruday.lan ([2409:4091:903b:c404:eaf9:32de:ddb8:3440])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1699718c547sm42313351c88.3.2026.10.13.22.41.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 22:41:26 -0700 (PDT)
From: Rahul Rao <shreeramrahul94@gmail.com>
To: David Heidelberg <david@ixit.cz>
Cc: oe-linux-nfc@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	syzbot+93f169a8e7d66864f800@syzkaller.appspotmail.com,
	Rahul Rao <shreeramrahul94@gmail.com>
Subject: [PATCH] nfc: pn533: fix slab-out-of-bounds read in pn533_recv_frame()
Date: Wed, 14 Oct 2026 11:10:13 +0530
Message-ID: <20261014054013.120482-1-shreeramrahul94@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In pn533_recv_frame(), dev->ops->rx_frame_size(skb->data) calculates
the expected frame length from the frame header, and then
print_hex_dump_debug() dumps the frame payload.

However, if an incoming USB URB delivers a malformed or truncated packet,
skb->len may be smaller than the minimum header size or smaller than the
declared frame length. When inspecting the frame or calling
print_hex_dump_debug(), this leads to an out-of-bounds read beyond the
allocated skb buffer.

Add sanity checks to verify that:
1. skb->len is at least dev->ops->rx_header_len before parsing frame sizes.
2. skb->len is at least frame_size before printing or validating the frame.

Reported-by: syzbot+93f169a8e7d66864f800@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=93f169a8e7d66864f800
Fixes: 9815c7cf22da ("NFC: pn533: Separate physical layer from the core implementation")
Signed-off-by: Rahul Rao <shreeramrahul94@gmail.com>
---
 drivers/nfc/pn533/pn533.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/nfc/pn533/pn533.c b/drivers/nfc/pn533/pn533.c
index b0133e51dce9..6b0005395b95 100644
--- a/drivers/nfc/pn533/pn533.c
+++ b/drivers/nfc/pn533/pn533.c
@@ -2178,6 +2178,8 @@ static int pn533_data_exchange_complete(struct pn533 *dev, void *_arg,
  */
 void pn533_recv_frame(struct pn533 *dev, struct sk_buff *skb, int status)
 {
+	int frame_size;
+
 	if (!dev->cmd)
 		goto sched_wq;
 
@@ -2193,12 +2195,29 @@ void pn533_recv_frame(struct pn533 *dev, struct sk_buff *skb, int status)
 		goto sched_wq;
 	}
 
+	/* Verify skb has enough bytes for the minimum RX header */
+	if (skb->len < dev->ops->rx_header_len) {
+		dev_err(dev->dev, "Frame too small (%d bytes)\n", skb->len);
+		dev->cmd->status = -EIO;
+		dev_kfree_skb(skb);
+		goto sched_wq;
+	}
+
 	if (pn533_rx_frame_is_ack(skb->data)) {
 		dev_dbg(dev->dev, "%s: Received ACK frame\n", __func__);
 		dev_kfree_skb(skb);
 		return;
 	}
 
+	frame_size = dev->ops->rx_frame_size(skb->data);
+	if (frame_size < 0 || skb->len < frame_size) {
+		dev_err(dev->dev, "Invalid or truncated frame (len=%d, expected=%d)\n",
+			skb->len, frame_size);
+		dev->cmd->status = -EIO;
+		dev_kfree_skb(skb);
+		goto sched_wq;
+	}
+
 	print_hex_dump_debug("PN533 RX: ", DUMP_PREFIX_NONE, 16, 1, skb->data,
 			     dev->ops->rx_frame_size(skb->data), false);
 
-- 
2.43.0

