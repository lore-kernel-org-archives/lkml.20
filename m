Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36F248551C
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 08:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791966778; cv=none; b=Cr0YpGbjyaeFjv2KBVw/tQDVsSw+aV0fXHv1ag/RJcpVYgY8hQlyOwwaOlxquhBpQU8kp37iQQcskqCSQa/JRzhOTDYoQ+VB0YPyz6IOWrVOXcBEOs0nIEIg6XMmdJxYib1vkTkMC06skdYnTXaiUWDEkY2SOG+SIUii62kfoUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791966778; c=relaxed/simple;
	bh=QXfv7oHLhUhY9C5cnazY56Fw9rjVwnTel2t+VYCmWpI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u0/G1yfUpM5vJCHTb0PgzLV5MnKrhXSjWBkFKJRFNffjmVJlOnFUri01ldU6QBDErewj3AVZXcJYWBEOVljsHJiu7I0Y6tL5wy+UGeeV65OpT4qgu/Fo6ij8x9qelgAWjKvYxBmqEvHAHr/EbEceEwlRPZK93AwCrdPNmq6Znrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V0p4fo56; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V0p4fo56"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2e5378b281aso20733975ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 01:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791966776; x=1792571576; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SYPI7OWeVGXSmmHTKBEjUpdac/OQBSSeGCeQqh4Sbw4=;
        b=V0p4fo56be6NXTnlUp8Wwb+2cLiyQKLYfr7FMIpGGmIpmsr4kTfZJojmvIiir+DUq8
         G9gs3JvlY85Q0ivwcW3N7ca86GPWnmE3kj0XtxyXsYZxAaaY1RAu4aeCegk/C9NBHBlI
         LRhLSuekMsDs8X80h8b3+lmnh42EBsoFgGBk45DrqpgcX2RVwYzlAVmgBAn+bJ08M9kG
         Ccc1OwCK372xlw3Iz8Fs5GsnGvDIbp7CgIt+GqogpjOuUGYG7L/hxr9T6RayQ7AdRBkG
         ZYnDI/UmyLH4h1jke3Y1MVYiLXOOxYIypewH+vnKQ9pOxKmSRHKbeNiZtXmVZ7XK3JqC
         wUHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791966776; x=1792571576;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SYPI7OWeVGXSmmHTKBEjUpdac/OQBSSeGCeQqh4Sbw4=;
        b=NtA5wERpfR0NLVypb3JKpg5+AlvS64liApy+WhcoPuroWDt4eGmfjDpyq96qGE0Wmd
         mUPh3vbK2HpK/YrgD33KLOyq1/BhWVnJu3kRyub2AadJfybgcHL52OniJIOat3co9kAK
         F7sgRFXx6cewZkyi4FwPEg5cs6sfAJ4RjqrYCKX13Pp/WCo6eWQKgSjrk4mpzvjpd6KE
         FsWT7svgn76cKgpcCumjUssnyHzduxllMJEGKZscpf9C+1QqYYHCm3sBlcGXjrVX5OOo
         apO7vspD/ZxH2S8n9Q5YEeYExSUDT1zEQsAcNR8uHR4L/gJUiJRqBbm8yOr6ZcngsSlP
         drdg==
X-Forwarded-Encrypted: i=1; AKwUvBwevsm3v4PMUr+qcZoCG1d7kSwdDp8JbydrqFaCglDT5zY3IUZDDZOLcb+guGiEkJP0wzoptZLqX9AV+84=@vger.kernel.org
X-Gm-Message-State: AFq9FYK8LW53rOJXZl96VKxB/BJXQS7w8AnrQP7gIYLyytdnj0HNOOIQ
	27TLNVwvMws/APf6hATKNV3t/DnUD5Ex0l+fbueVVpJrfFhxHUZS/9GDXFonme2B
X-Gm-Gg: AYBFou1MhplJn2Q+yQUoqeaLr+gVD0lXyLUdHXjyF0JLk01rq74f5CaXspabdbC1W5O
	E1DsMIikHRJp74VFR1awRs8ALxNkSB+67BPGIKfJh2OA5KircGRv/aLuLPwlcF35pKhgvsyg+GZ
	2NG6ZBxGmxJAfJt1LcFnvumVEqXOiB6b6ri7MgrAmOxNpFoMPhNlqsAzIjHIT5DWVHdvyoUSFc5
	YPw3xHTEYSPfsnGY5GMl7Gj6WmjJaUjWkjN7bRYi4CNQKDjjJ8eA2WNRBpA3KFnAe8EReD0hQCK
	C3t17VHMMMMIETBLSEWKxNxGG4Z5pL4Pjn5m4qKOTcsSEfO65FacRD5n7iFMvtpZ5CfG/OLhD7c
	b/TFpdLBNwHwUjF+l17Na0V51KzKOc8c055CZCunHoICQd6+TfiU1V9PorSkfKm5C2BSvonUL2v
	ELeQXgSktCxCaNnKnO22pVDVfLBJvdcVNqr9Hl9W3K+VAprjH2N3aVm9meYF5mgnLGfMau6br6V
	lWgCmzNRQ==
X-Received: by 2002:a17:90a:5184:b0:3ac:17c:6e82 with SMTP id 98e67ed59e1d1-3ac15d46137mr3909722a91.45.1791966775821;
        Wed, 14 Oct 2026 01:32:55 -0700 (PDT)
Received: from TheRealOne ([2409:40e1:cc:590c:6073:1121:77d0:14c1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac84dd4907sm61671a91.9.2026.10.14.01.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 01:32:55 -0700 (PDT)
From: Chandradhar Kumar <chandradhar.2003@gmail.com>
To: David Heidelberg <david@ixit.cz>,
	Samuel Ortiz <sameo@linux.intel.com>,
	Michael Thalmeier <michael.thalmeier@hale.at>
Cc: syzbot+93f169a8e7d66864f800@syzkaller.appspotmail.com,
	Chandradhar Kumar <chandradhar.2003@gmail.com>,
	oe-linux-nfc@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] nfc: pn533: fix slab-out-of-bounds read in pn533_recv_frame()
Date: Wed, 14 Oct 2026 14:02:36 +0530
Message-ID: <20261014083239.144506-1-chandradhar.2003@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pn533_recv_frame() accesses skb->data to check for ACK frames, dump
the received frame via print_hex_dump_debug(), and validate the frame
without first verifying that skb->len contains enough bytes for the
frame header and payload. When a short or truncated USB packet is
received, this results in a slab-out-of-bounds read in
hex_dump_to_buffer() or during frame validation.

Fix this by verifying that skb->len is at least PN533_STD_FRAME_ACK_SIZE
before checking for an ACK frame, passing skb->len instead of the
unvalidated rx_frame_size() to print_hex_dump_debug(), and validating
that skb->len is large enough to hold the frame header and complete
frame before calling rx_is_frame_valid().

Fixes: 9815c7cf22da ("NFC: pn533: Separate physical layer from the core implementation")
Reported-by: syzbot+93f169a8e7d66864f800@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=93f169a8e7d66864f800
Signed-off-by: Chandradhar Kumar <chandradhar.2003@gmail.com>
---
 drivers/nfc/pn533/pn533.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/nfc/pn533/pn533.c b/drivers/nfc/pn533/pn533.c
index b0133e51dce9..c730a84f1c62 100644
--- a/drivers/nfc/pn533/pn533.c
+++ b/drivers/nfc/pn533/pn533.c
@@ -2193,6 +2193,13 @@ void pn533_recv_frame(struct pn533 *dev, struct sk_buff *skb, int status)
 		goto sched_wq;
 	}
 
+	if (skb->len < PN533_STD_FRAME_ACK_SIZE) {
+		nfc_err(dev->dev, "Received a too short frame\n");
+		dev->cmd->status = -EIO;
+		dev_kfree_skb(skb);
+		goto sched_wq;
+	}
+
 	if (pn533_rx_frame_is_ack(skb->data)) {
 		dev_dbg(dev->dev, "%s: Received ACK frame\n", __func__);
 		dev_kfree_skb(skb);
@@ -2200,9 +2207,12 @@ void pn533_recv_frame(struct pn533 *dev, struct sk_buff *skb, int status)
 	}
 
 	print_hex_dump_debug("PN533 RX: ", DUMP_PREFIX_NONE, 16, 1, skb->data,
-			     dev->ops->rx_frame_size(skb->data), false);
+			     skb->len, false);
 
-	if (!dev->ops->rx_is_frame_valid(skb->data, dev)) {
+	if (skb->len < PN533_STD_FRAME_HEADER_LEN + PN533_STD_FRAME_TAIL_LEN ||
+	    skb->len < dev->ops->rx_header_len ||
+	    skb->len < dev->ops->rx_frame_size(skb->data) ||
+	    !dev->ops->rx_is_frame_valid(skb->data, dev)) {
 		nfc_err(dev->dev, "Received an invalid frame\n");
 		dev->cmd->status = -EIO;
 	} else if (!pn533_rx_frame_is_cmd_response(dev, skb->data)) {
-- 
2.56.0

