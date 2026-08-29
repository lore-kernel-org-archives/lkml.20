Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97EB212CDA5
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 07:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787989991; cv=none; b=P7/rh1T1YZFdsfPMnxdu3ryvqPHn3RfQLNxSOMTVsETS+VWtL4NxaaFQlu4062PmOZbALQyzN1dG7q3ZgVxpuEj9OOYSNoKTa25j2pyh4MFuw6VIjW19mmF0DiwqxXaqUXwBAgIJIdBk7glQsjDTD40RYqnFGiy9rpg/UfuzZwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787989991; c=relaxed/simple;
	bh=UxqJXvFBdjwr2wD+zBN4Ru/ByXkkod3JWX8Z4PelXdo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IkPsM2+nUwJpeia/dl9VIl7WN0y2z87igCUeNvURinZ+XPUCT10sZdSnWzu5ZFinxr0bPKH/206FlrU4vb8BxD04opqfhpC5JqYjeHfhUgIkcQotCmPn7wOPRneWmrslKcuoERpHmaZZFuH10dWEoUrpwwjCGKkRuoDeN63PAfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OievMS34; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OievMS34"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-499840a2575so11130855e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 00:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787989987; x=1788594787; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+jbQ6QwM5+BlZ7cOazrDoJ7hDb3esvgCSdcu8xIlmJE=;
        b=OievMS34zh8vq0mAUFeKe1Rd226XdLn0uPXKpTJ80ogXSrj6dqLF5KGSYld9TsyDv8
         ElFV2+RO7CiSf9XdTNIhlMuC5alYqbHyrGSfv7aTXLK8HN9dF+XUmuHOkF3tKQUKE5np
         JXXd+icfhScfG5ksNAIoaNp0lBTrYXm+eAm54agjWwMyy0jk07LlP5rDzWnbHpKnRIku
         xrx9L8be0UFs4fh5367bWyN8Uw0BPcyAwonLHtX7nRvwtqwNp0079ig7BI+GY0xQe2Ee
         xQeL1J8UChLpDvTMlaGf5kJ57UBknSYezYI0edwJI5TKBA5dcOeuzecnfG9OaUC9IJwm
         XVlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787989987; x=1788594787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+jbQ6QwM5+BlZ7cOazrDoJ7hDb3esvgCSdcu8xIlmJE=;
        b=I0IYWGd6ONYDwjuherMYW5oiZyxqdBQOfje1prvMvsPNtsWayuIhf5HoIYxlBJbQfR
         KrKKl319OhAjlls0jF/rFHvq7K+Xs5+FI/v6J3cx9Fm2aZHIUKTzQ5MUV7b65zys4e91
         6JYCdP2e4I0UpIO7FsNSu7HsVxggvgB8NC7ZC/B+xyTxRtYeBX5x2y14FOrJab8siNwN
         9SApNj6vMcW0miu8M0gRgOpyO+pGfjU1oL32h/eWvnKlwwIFliWdskU9mpPq4MWF0kwX
         csZOxMgwRVfVEHrMLJxg7GV2lrFPSrab5oAPJSF8cbX9VpV4YgmosLl9jHE2xk7hZFSB
         HYhw==
X-Forwarded-Encrypted: i=1; AHgh+RpqYViWEhzreDOOWc3RSk6QwlWwONgDPBSdVWT3d2JCKwLaUgXSZUIXpb2A83yxNhFv/Wp8IvW50nubucs=@vger.kernel.org
X-Gm-Message-State: AFuF++nRow27YvCT0njr79NqINmQoaNwUhN6cVHNYO6TQDJ/cxj7vvVN
	ImEzxtg/L/m3oaDckMCoyPHuYgijXieaorGW/nLOEHp7D95Z25Z/yFUpfT0/T2iPzoh+bA==
X-Gm-Gg: AR+sD13DYfyWKdbZuYIYWrrTXleJK+5tofJmiEGdW56QagZANxLoLJFSLxPZ0RyQA0w
	hpWbRitc83cmaEAZg3YW7I2YiN8N3iEsPTovISOV4VZX6sO5nRygZisp6B6Rdxsr1M6k5I/BwVQ
	6ACSgSmT0nQJMa2ksQPGOgB3y51g9F6Av3r7rKu2sQ2Ytv11Y4bTiY4jwR3KzQfhPcemfpMRzeW
	wQVnWgIHFP61mvy3IbmCSA0LmU64ZWfu79o5cWAiPGbBIvV5Uuv3BVBuItAlMg1f3z1g9+GI08c
	PyWNJOszcnni4Q6W13HzfFp95lgEKKcybL2M6fjYQ/Ki/+Bk7/pmLUwiQZDVuVU8SOdWuxi8XTn
	FASx8mACarA6SDiBNR+hRkBanJijwccX04wUVQaTpGweGzL+uXAOoO8mXJitWER9OLWO37UsaU/
	ihQpEP6tvEW0xdzdvwbV4c0B+rN0uQ5zc0Pdg9mUZ+lmQlb2kXXPvfp67CAyy/J+A26wy1gJVrp
	EvpXQgxFnpnLevadwOIrzqQRsO6V1LWq4ubJVKWroDDxRlK7efSHeSOp3J/gA==
X-Received: by 2002:a05:600c:1c0a:b0:493:bd2a:93be with SMTP id 5b1f17b1804b1-49b91c276efmr191294575e9.6.1787989986916;
        Sat, 29 Aug 2026 00:53:06 -0700 (PDT)
Received: from drago.hgw.local ([2a00:1d34:e90c:f900:e29d:3a79:ac40:9edd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb2794dsm9017193f8f.25.2026.08.29.00.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 00:53:06 -0700 (PDT)
From: Deniz Aydogan <denizaydogan1902@gmail.com>
To: lizhi.hou@amd.com,
	amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Deniz Aydogan <denizaydogan1902@gmail.com>
Subject: [PATCH v2] accel/amdxdna: fix race condition in mailbox send path
Date: Sat, 29 Aug 2026 10:53:03 +0300
Message-ID: <20260829075303.7457-1-denizaydogan1902@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260828221641.10034-1-denizaydogan1902@gmail.com>
References: <20260828221641.10034-1-denizaydogan1902@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mailbox_send_msg() reads and updates x2i_tail without any
synchronization. The DRM scheduler and ioctl paths can call
xdna_mailbox_send_msg() concurrently on the same channel, which
allows two threads to read the same tail value and corrupt the
hardware ring buffer.

Add a mutex to serialize the entire send path. A mutex is used
rather than a spinlock because the existing code calls
read_poll_timeout() with a non-zero sleep, which can reschedule.

Fixes: 3ba13f5e7180 ("Merge tag 'devicetree-fixes-for-7.3-1'")
Signed-off-by: Deniz Aydogan <denizaydogan1902@gmail.com>
---
 drivers/accel/amdxdna/amdxdna_mailbox.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/amdxdna/amdxdna_mailbox.c b/drivers/accel/amdxdna/amdxdna_mailbox.c
index 271617347..8338f03bd 100644
--- a/drivers/accel/amdxdna/amdxdna_mailbox.c
+++ b/drivers/accel/amdxdna/amdxdna_mailbox.c
@@ -8,6 +8,7 @@
 #include <linux/bitfield.h>
 #include <linux/interrupt.h>
 #include <linux/iopoll.h>
+#include <linux/mutex.h>
 #include <linux/slab.h>
 #include <linux/xarray.h>
 
@@ -60,6 +61,7 @@ struct mailbox_channel {
 	struct xarray			chan_xa;
 	u32				next_msgid;
 	u32				x2i_tail;
+	struct mutex			lock;
 
 	/* Received msg related fields */
 	struct workqueue_struct		*work_q;
@@ -205,6 +207,7 @@ mailbox_send_msg(struct mailbox_channel *mb_chann, struct mailbox_msg *mb_msg)
 	u32 tmp_tail;
 	int ret;
 
+	mutex_lock(&mb_chann->lock);
 	head = mailbox_get_headptr(mb_chann, CHAN_RES_X2I);
 	tail = mb_chann->x2i_tail;
 	ringbuf_size = mailbox_get_ringbuf_size(mb_chann, CHAN_RES_X2I) - sizeof(u32);
@@ -225,8 +228,10 @@ mailbox_send_msg(struct mailbox_channel *mb_chann, struct mailbox_msg *mb_msg)
 		ret = read_poll_timeout(mailbox_get_headptr, head,
 					tmp_tail < head || tail >= head,
 					1, 100, false, mb_chann, CHAN_RES_X2I);
-		if (ret)
+		if (ret) {
+			mutex_unlock(&mb_chann->lock);
 			return ret;
+		}
 
 		if (tail >= head)
 			goto check_again;
@@ -240,6 +245,7 @@ mailbox_send_msg(struct mailbox_channel *mb_chann, struct mailbox_msg *mb_msg)
 			    mb_msg->pkg.header.opcode,
 			    mb_msg->pkg.header.id);
 
+	mutex_unlock(&mb_chann->lock);
 	return 0;
 }
 
@@ -487,6 +493,7 @@ struct mailbox_channel *xdna_mailbox_alloc_channel(struct mailbox *mb)
 		goto free_chann;
 	}
 	mb_chann->mb = mb;
+	mutex_init(&mb_chann->lock);
 
 	return mb_chann;
 
-- 
2.55.0

