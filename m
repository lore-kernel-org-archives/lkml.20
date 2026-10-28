Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=71.18.227.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793214797;
	b=Dq4fGpOfpIwy1mCB4pcBXeyQ5UntYTCkYZUql0OAi8cG+6ORvwnz+8GKJSr9IH+Ks4Tk
	 79TLv9ALNs5c/5LMamSaDsuWtwgsCD7zPWlppu5OLEeMFKuPjRegz+bgiNytM8UgI50lt
	 lmDFwKkgMG/s3xx+R9EK0PnnjsqqzlDugEr9/7714o7LRaW3oIGhCSoCZ/7JulQMXPxg2
	 ZgaMKLFcJEhdSyIEvp9T+zj/is2ffF9C4EoVjnD98sMZq/3Yto13C6FdtJzsypsIf0ryJ
	 VH/fwJ5XUGZECi9uCZ2tGGVMBOOJd+OgLJgFqLNYi9sNj4hWwKBG83N0EfbEPL+RojA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793214797;
	h=DMARC-Filter:DKIM-Signature:Cc:Date:X-Change-Id:X-Lms-Return-Path:To:
	 Mime-Version:Content-Transfer-Encoding:Message-Id:Received:
	 X-Original-From:X-B4-Tracking:From:Subject:X-Mailer:Content-Type;
	bh=5Ho613DEFXGKANIja0pHs3tOiqG6nqaHpNl0UxzSoSQ=;
	b=NTMd7TEB9RlO3tClco4qnNk6AIoQne0ricBwPkPj4eOnvmMcuWPAE3HcaAVOYMjb19Ht
	 6tAbcfNBorebbT3JnkQjld1tUGbSZw+X7eMPf0VoSQY+9HQrikcXLyXVyE/Xa6nPwnQb0
	 ZPWqbs9rgfO5ORjknINlwvx+BJg208NFJIwsudZge8CVxbg066cuRHmmHGFoEM2FjtCkg
	 vsLgEA3UkYdl1aIgk2hX9NT77uUFheWycoJy1HvGq+kpDCLnqz/w2x7ih2B1EM0KgUtTZ
	 knEEUHVQZnxmH0m5RaMDcJrUpqkEE7DbCUMyZWvfC7qpci449fMmu/SVc0JtdKKZZmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cherr.cc;
	spf=pass smtp.mailfrom=cherr.cc;
	dkim=pass header.d=cherr.cc header.i=@cherr.cc header.a=rsa-sha256 header.s=feishu2604220257 header.b=sdaAd5sD;
	arc=none smtp.remote-ip=71.18.227.4
Received: from sg-2-4.ptr.blmpb.com (sg-2-4.ptr.blmpb.com [71.18.227.4])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB73D606A33A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 19:13:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB73D606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cherr.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherr.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cherr.cc header.i=@cherr.cc header.a=rsa-sha256 header.s=feishu2604220257 header.b=sdaAd5sD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2604220257; d=cherr.cc; t=1793214790; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=5Ho613DEFXGKANIja0pHs3tOiqG6nqaHpNl0UxzSoSQ=;
 b=sdaAd5sDasqUo/v9Ym1bRsiUTApO5wNunRezUl98f0W08jjDFL2OqooCervkoa/WJXK9Nb
 G4yzXZvHatjk2rzkLrtvHtMxfn8O7LKiwBk/GLGNEBKbd+28grC3sotl1kbm9aYiGR0l3c
 EZ2i/zAxn5l7Qo23pXBQGx+YgkVwz5wSzMUeqrlNYrLr+Wl4jPVDTzViNF05olX6xWEEn3
 QUQP8YkWPXeN47ne5XBZJVUSjaNWXcDsy0sjj+N1OAPOEXvqItDTBG1i9V4Hm0esz2vfNy
 Puc55z+aXE32uePaRvCJ+yoD4mtSj9ECPiUvnAdZ6WTaqaLRa2auChqTttu/sA==
Cc: <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	"Jiale Yao" <yaojiale02@163.com>, "Maoyi Xie" <maoyixie.tju@gmail.com>, 
	<stable@vger.kernel.org>, "Shengzhuo Wei" <me@cherr.cc>
Date: Thu, 29 Oct 2026 03:13:05 +0800
X-Change-Id: 20261028-b4-goodix-attachment-pkg-size-3c7a69d6d4c4
X-Lms-Return-Path: <lba+26ae24944+5a1453+vger.kernel.org+me@cherr.cc>
To: "Jiri Kosina" <jikos@kernel.org>, 
	"Benjamin Tissoires" <bentiss@kernel.org>, 
	"Dmitry Torokhov" <dmitry.torokhov@gmail.com>, 
	"Charles Wang" <charles.goodix@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-b4-goodix-attachment-pkg-size-v1-1-ada7dda20f75@cherr.cc>
Received: from [127.0.1.1] ([111.42.148.226]) by smtp.feishu.cn with ESMTPS; Thu, 29 Oct 2026 03:13:07 +0800
X-Original-From: Shengzhuo Wei <me@cherr.cc>
X-B4-Tracking: v=1; b=H4sIAEBJ4moC/yXMSw7CIBAA0Ks0s3aSFgl+rmK6oDDS0QgNg6ax6 d1Ldfk2bwGhzCRwbRbI9GHhFCu6QwNutDEQsq8G1SrTteqMg8aQkucZbSnWjS+KBadnQOEv4dG drLl447XTUI8p053n33/r/5b38CBX9hTWdQMD+TE8gQAAAA==
From: "Shengzhuo Wei" <me@cherr.cc>
Subject: [PATCH] HID: goodix: validate attachment package length
X-Mailer: b4 0.16.0
Content-Type: text/plain; charset=UTF-8

goodix_hid_irq() reads the attachment package using the event header's
length, but passes the independent pkg->size to hid_input_report()
without checking it against the bytes read.  An oversized package can
forward stale buffer contents or cause an out-of-bounds read, exposing
those bytes to hidraw readers.

Reject package sizes smaller than the two-byte length field or larger
than the requested read length.

Reported-by: Maoyi Xie <maoyixie.tju@gmail.com>
Link: https://lore.kernel.org/all/178212703386.2270604.12694603282649418418@maoyixie.com/
Link: https://lore.kernel.org/all/20261028050901.139292-1-yaojiale02@163.com/
Fixes: 75e16c8ce283 ("HID: hid-goodix: Add Goodix HID-over-SPI driver")
Cc: stable@vger.kernel.org
Signed-off-by: Shengzhuo Wei <me@cherr.cc>
---
Validated by source analysis, simulated SPI/HID callbacks and object
compilation. No kernel/hardware runtime A/B was performed.
---
 drivers/hid/hid-goodix-spi.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-goodix-spi.c b/drivers/hid/hid-goodix-spi.c
index 03d549efbdce..b7092b85dda2 100644
--- a/drivers/hid/hid-goodix-spi.c
+++ b/drivers/hid/hid-goodix-spi.c
@@ -575,6 +575,7 @@ static irqreturn_t goodix_hid_irq(int irq, void *data)
 	struct goodix_hid_report_event *event;
 	struct goodix_hid_report_package *pkg;
 	u16 report_size;
+	u32 pkg_len;
 
 	if (!test_bit(GOODIX_HID_STARTED, &ts->flags))
 		return IRQ_HANDLED;
@@ -620,14 +621,21 @@ static irqreturn_t goodix_hid_irq(int irq, void *data)
 	}
 
 	/* Read the package behind the coordinate data */
+	pkg_len = report_size - GOODIX_HID_COOR_PKG_LEN;
 	pkg = goodix_get_event_report(ts, ts->hid_report_addr + sizeof(*event),
-				      ts->event_buf,
-				      report_size - GOODIX_HID_COOR_PKG_LEN);
+				      ts->event_buf, pkg_len);
 	if (!pkg) {
 		dev_err(ts->dev, "failed read attachment data content");
 		return IRQ_HANDLED;
 	}
 
+	if (le16_to_cpu(pkg->size) < GOODIX_HID_PKG_LEN_SIZE ||
+	    le16_to_cpu(pkg->size) > pkg_len) {
+		dev_err(ts->dev, "invalid attachment event package size, %d",
+			le16_to_cpu(pkg->size));
+		return IRQ_HANDLED;
+	}
+
 	hid_input_report(ts->hid, HID_INPUT_REPORT, pkg->data,
 			 le16_to_cpu(pkg->size) - GOODIX_HID_PKG_LEN_SIZE, 1);
 

---
base-commit: d135ab453a7400a34930bdda1ef4bdc8acfac80e
change-id: 20261028-b4-goodix-attachment-pkg-size-3c7a69d6d4c4

Best regards,
--  
Shengzhuo Wei <me@cherr.cc>
