Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E75A1C5799
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789465384; cv=none; b=KNdxJ3S2CeHZu+yUQmYJdtr+VCTQ5TDaLTlVgONIOJ1/gngMXqAXxfZCPbPk5PLBbDhK6LVjdpP3FhIASZmSh0iJQA6h4nBOgJxhosYeI8uPTBDuWTYvo5R3af2vaJugNEomYdP0MrUoidrVoPQcWeCOT+cOrZ6CQLkp9JmmFCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789465384; c=relaxed/simple;
	bh=DSm67Fef0PwVMY0lwmqgSFdetPGHsbit/KuByND9Tmw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ESXdMk4tAtl7IlAFGXdfM67+nlLyjc/p/kO5VnXHnW3qstg0zNau+a7QYNJRStp18JCiqiJfgVTBtPcUCb07ZX9x2OHh9gICSVLelLiOfi4risW0u6V22wwdKwISnbnHlw2LnpMO9dol6yJnJviB2u9PWr/qAWrO6TiwoiCuUYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GI8eZHYD; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GI8eZHYD"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747f05ffdso503655ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 02:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789465379; x=1790070179; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=69mrxJexhH+mB0/KG77Jb3FUWESkIXl1gYvn5Rky+CA=;
        b=GI8eZHYDA8tr6ZKf7vo/6vL2yl/VSbS98x3fvHXa0oiyucAXH2adJ0jcM85gSlU+QQ
         BDSf6ajoKmgp4gmBETr2zw0CvPAlUNGpaCYXS9oA+ZBJ50JChUHGpxrJ0joC3NaIUrKQ
         IvZJO2mXNPvlQ+EupXmUO+ldGvUxDCa98ch45KuO57WIZt3yqRXOgRPTCUIjP+rX6D0M
         DMQu469klJGcSAyvWifHxFglHtGlZxS1trsK9zhptDGIXrzlsBykmrUVE+FY7yhfQIsr
         DCZYnm+fw8Gp09gSkM8ad4C3aERvOwWQvusYNw8Gt3CrjWBduIc/JXVTrNRovYiZwRwY
         5p3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789465379; x=1790070179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=69mrxJexhH+mB0/KG77Jb3FUWESkIXl1gYvn5Rky+CA=;
        b=2Zj56yXe10phwdEsSMdpOgRvCu87T44ZGYHfGA+uXyhQH9FHmohtWDcg5yogdZBpGM
         S222Nb4hcD3imAbGffQClU1IHsf+pP06VmuB2jAaRM4Fv+Z7iCaZXG2+u5Wv/GAcIANL
         AofaKx7rQicCATnCgHz7c71oJL4LTw5FAH4GppzgaHf0sfC5sdNQkzPZgzpDb4rHITJr
         dU8eatpu+E8JqcKbzGX0Vn7bTbaWtUIkNef9A5AFaR4oCcmJmZahcrHbrg/i8IQjC613
         DGajJg8zXgt2R7i4SPW/LupB4WWN0+60yRb/PDvQfkALB6/VhWqwcdJ/AX6eUZlGoyst
         KFHQ==
X-Forwarded-Encrypted: i=1; AKwUvBxx2DFyXg3x8RowBRwSx9O9MWgV6ANWQj9kNlB0QVZzPqoDXF1wa+T5cCBpaSpiZKfsShLYT3YyCemGzkU=@vger.kernel.org
X-Gm-Message-State: AFuF++k/Y4ScDGa2GsmGw6n+qHH3Ksj0bQEOss2NL5O0bqQ/gJlDbDNB
	yf5FM1/IZg3UWaPiiTcAfdR2sC0EH4X0ui7tD/12zbdRnb3l0jsMcOuM
X-Gm-Gg: AYBFou1vpuSqyZpVR7IlhOzsU4/76I/agHq1zLG4aHGZ4sRszYJ1uwKUvNVQDmzjhS5
	UIga7Fpra/QI7IiXhqTBoj7OVYQLY7LltwZPaM4iBNXx9ygN4KJvaUhwf+rd5MrJmpzAe6Eb1Qi
	iXBNrlV2ePQLtZZgEAqxtbYxG1+pVQ7K9FiBXAWle0bndbIPAYwlz3+KzlJ+37eOkSwGkMjduBX
	CYqVHrQJhHK2igi3CCZAcO3nBLg8pRxqcAvb4NHB2Y7l6NzqkuXIrdaB5+1QaDdALCv6b0KDOkl
	qlAUkr1CKtVH/JrL4URS1Xqm8wmsTI2qtRYjO9wkIwgxK2Tuoq8+SiJQmcombX77WuNDv0g2yQX
	IyX6LSEkZ2OvZceWMXb4lq2JtmYZOX/UW3TsbK9Z7mdJa8g/woAVxbfWU7BfSrmmhhGTRgYf/+/
	SrCvGLsqALQ90uLZOFO+pARdnHP8vHwdfz2CJ+VA7ITTMJigJR9yic03szDTWRxQ8=
X-Received: by 2002:a17:903:40c6:b0:2d0:cc92:f7a9 with SMTP id d9443c01a7336-2dd837a6aeemr5238465ad.4.1789465378664;
        Tue, 15 Sep 2026 02:42:58 -0700 (PDT)
Received: from jia ([188.253.12.32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cfbeca2sm63625345ad.45.2026.09.15.02.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 02:42:58 -0700 (PDT)
From: physicalmtea@gmail.com
To: mst@redhat.com
Cc: jasowangio@gmail.com,
	michael.christie@oracle.com,
	pbonzini@redhat.com,
	stefanha@redhat.com,
	eperezma@redhat.com,
	nab@linux-iscsi.org,
	asias@redhat.com,
	virtualization@lists.linux.dev,
	kvm@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] vhost-scsi: preserve event ordering
Date: Tue, 15 Sep 2026 17:42:43 +0800
Message-Id: <20260915094244.7900-2-physicalmtea@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260915094244.7900-1-physicalmtea@gmail.com>
References: <20260915094244.7900-1-physicalmtea@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jia Jia <physicalmtea@gmail.com>

vhost_scsi_send_evt() uses llist_add(), so pending events are LIFO.
vhost_scsi_complete_events() walks the detached list directly.
This can deliver a later hotplug or hotunplug event before an earlier
one.

Reverse the detached list before processing it.
This keeps delivery in enqueue order.

Fixes: a6c9af87363c ("tcm_vhost: Add hotplug/hotunplug support")
Signed-off-by: Jia Jia <physicalmtea@gmail.com>
---
 drivers/vhost/scsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/vhost/scsi.c b/drivers/vhost/scsi.c
index 7a1f39a32..37f681aab 100644
--- a/drivers/vhost/scsi.c
+++ b/drivers/vhost/scsi.c
@@ -637,7 +637,7 @@ static void vhost_scsi_complete_events(struct vhost_scsi *vs, bool drop)
 	struct llist_node *llnode;
 
 	mutex_lock(&vq->mutex);
-	llnode = llist_del_all(&vs->vs_event_list);
+	llnode = llist_reverse_order(llist_del_all(&vs->vs_event_list));
 	llist_for_each_entry_safe(evt, t, llnode, list) {
 		if (!drop)
 			vhost_scsi_do_evt_work(vs, evt);
-- 
2.34.1


