Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9028F47B437
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789465391; cv=none; b=jhbIiko+fIf0Lym+aUAATZB0suQtY+ZQBotLj04C0TDYN63QNaQr38hbF4V5taV+b3YwYKaI7RI2C18Nqcfn0smjCcia3uq3NuS1RfXQFdOPSKnZtgnSNn78kWbOyAY2MqNGwl6qPHx4MPOT6uo6E0nZMwXOw/lqeOBOk9wUtOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789465391; c=relaxed/simple;
	bh=Y/Ynb8CMg23HSLFnvahuALwqonYoPmDH12RAnxUrtaY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MeDeXcT6HFV/hS5ZlnvYMIr6Blxi1Fp3GAMYsVQG1fERUJjTz+AmP8unOHTAKgJvnTlNHOh1wzMw3MiLWPOf83DCuKrflnrOMovp0cs3al/RIBHrHksDMmP9QA6sOcJ0CRrMtPNO5S1jS4sZSjWaFXBT4kMrGjzPhM6CJyfzMpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qeUfdszM; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qeUfdszM"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747f0135fso27192695ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 02:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789465386; x=1790070186; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X5e+gRweobBjhlv/HMhSt0aHVe80wymGJQQad+R8SpY=;
        b=qeUfdszMaM8E/1D8kFzgNSRUoHbyP9Yii92IZgP4xBd7RvloXZYhmcBmT9betpSGBf
         ODhL95zZ9a4gwo82AbZqQ1+ICaaSSPH1Hxh6lyeW0V7n2KrtMaINz6EBj4XTwCTxoq/u
         38VI8hG+/TdSx7Q3dAL2r/wDZbfx1wlEZNVQGx8lQlqXrnmZQCAIvTdb5ZJM7km2umAl
         gAlXB+G5ECkqDHsurBbhuXg+ij9zt5tz8KwrlBF7q53OCYmvyFw3syscPFNXG/AJRznM
         GDIzS8oJNcp4d1gDL1lYYNzsF1jCbp9g+dJGm+XIW/a5sb0Sx8x8XkGOGEdr6VaK0ITd
         e6vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789465386; x=1790070186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X5e+gRweobBjhlv/HMhSt0aHVe80wymGJQQad+R8SpY=;
        b=Df/F8my5OdoWkvwh6pHGFKNWYBjf2BPtqUzhpgJ0GLYTjbLqVlAllTOo0Q13PnY+9N
         hOU8ku2il5IDSBecZRJU3tzu1jumRiCnn228SiOXJpCO19iNHYVqjaQrc/Eo4eCach6B
         2dNsMenP6PND5VAyvKBoj5kZngRXN6y5NNqGrXGneFjcU5Uj4pCmraX0ks+MVFaLNepC
         SLOUfNo1GZQw9lMisCy8+EtagAPLlHpWNLZKHXgjbQLGu8MAlB+r3R7BNlSlvfEbF0BU
         acbTJK3VP1G1pg5Sut21h/jiGFIR+B2TUzoYS9sv1sObEkTV/Dz0IotLlpzOVo7F1BsR
         kSSg==
X-Forwarded-Encrypted: i=1; AKwUvBzIvHAlg7mh+4HBDDWupYx/c4tjM0bgmHjBDM/uVoM/w8ZiOxBWFQww9M0836uRLc9PRZ/POCd/XXxRGQU=@vger.kernel.org
X-Gm-Message-State: AFuF++noIqcvvSXiI9SZtDJRtG+UYoeB3liEvXyqyxGiCfaJQ83SpXB/
	sah5kpRpuRCTRCO3ipGTWX4JsQrrLMJ+Lc5K5At7KcLMUREM0t09Dfv8
X-Gm-Gg: AYBFou27AaKCO2vmZzOI78ARF3BGPgduUCPlchmjfT1BJ5vfXxJyb7Q0HP0R070yqKl
	hH9KOzvK1BVOj1zolKEUvU91ACwnT+8WW7n5OERfOYiGIpprQVE8rsPOj6FuMymhSV0OHLp8oi+
	BQvxjGZ64MpE4+o1ivh3FdQXOh/YmJYBh6bokRU4qjEQjYwcyE3ILJeT4OhlAkJOvC7txy83tph
	xYVs7i+Uzft9zOplvVUuzkHl/HO5hbKuojguMkBp/ETYuVRgBGOj79ur8BWu8hH5C9zc1kbdjWA
	0Jgy3BKj+jUfJ66nB1er2Cp/Lxdj+L1JhypclQNrh4iUu54ipNBSzLTVKXUO4Lf97Z3gIZ6MTOi
	LLZpTFMGXz/iU+Y1XmfaZgez47Yhg8wg1ZXI/pIQakSEH4Z3u8E2mxbPUeRI3CIHsuq4Az5kDLR
	pjLgBL+IRg31gFbwo8mIQCZ/HO8QrqXTLZ4R8ZMYM7vguRvyIWWRsXNl49IJUu9Jw=
X-Received: by 2002:a17:90a:c2cd:b0:39d:f2a1:3a with SMTP id 98e67ed59e1d1-39df2a10424mr10688797a91.15.1789465386330;
        Tue, 15 Sep 2026 02:43:06 -0700 (PDT)
Received: from jia ([188.253.12.32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfdd0ada3sm4269410a91.8.2026.09.15.02.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 02:43:06 -0700 (PDT)
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
Subject: [PATCH 2/2] vhost-scsi: do not relock event vq mutex on send_evt fallback
Date: Tue, 15 Sep 2026 17:42:44 +0800
Message-Id: <20260915094244.7900-3-physicalmtea@gmail.com>
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

vhost_scsi_send_evt() is called with the event virtqueue mutex held.
If the worker is gone, the fallback currently calls
vhost_scsi_complete_events(), which tries to acquire the same mutex again
and deadlocks the caller.

Split event completion into a helper for callers that already hold the
mutex and a locking wrapper for the event worker. Use the helper on the
fallback path.

Link: https://lore.kernel.org/all/20260905005352.1E5B01F00A3D@smtp.kernel.org/
Fixes: b1b2ce58ed23 ("vhost-scsi: Handle vhost_vq_work_queue failures for events")
Signed-off-by: Jia Jia <physicalmtea@gmail.com>
Reviewed-by: Mike Christie <michael.christie@oracle.com>
---
 drivers/vhost/scsi.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/vhost/scsi.c b/drivers/vhost/scsi.c
index 37f681aab..9cd181cb1 100644
--- a/drivers/vhost/scsi.c
+++ b/drivers/vhost/scsi.c
@@ -630,19 +630,26 @@ vhost_scsi_do_evt_work(struct vhost_scsi *vs, struct vhost_scsi_evt *evt)
 	vhost_scsi_log_write(vq, vq_log, log_num);
 }
 
-static void vhost_scsi_complete_events(struct vhost_scsi *vs, bool drop)
+/* Caller must hold the event virtqueue mutex. */
+static void __vhost_scsi_complete_events(struct vhost_scsi *vs, bool drop)
 {
-	struct vhost_virtqueue *vq = &vs->vqs[VHOST_SCSI_VQ_EVT].vq;
 	struct vhost_scsi_evt *evt, *t;
 	struct llist_node *llnode;
 
-	mutex_lock(&vq->mutex);
 	llnode = llist_reverse_order(llist_del_all(&vs->vs_event_list));
 	llist_for_each_entry_safe(evt, t, llnode, list) {
 		if (!drop)
 			vhost_scsi_do_evt_work(vs, evt);
 		vhost_scsi_free_evt(vs, evt);
 	}
+}
+
+static void vhost_scsi_complete_events(struct vhost_scsi *vs, bool drop)
+{
+	struct vhost_virtqueue *vq = &vs->vqs[VHOST_SCSI_VQ_EVT].vq;
+
+	mutex_lock(&vq->mutex);
+	__vhost_scsi_complete_events(vs, drop);
 	mutex_unlock(&vq->mutex);
 }
 
@@ -1829,7 +1836,7 @@ vhost_scsi_send_evt(struct vhost_scsi *vs, struct vhost_virtqueue *vq,
 
 	llist_add(&evt->list, &vs->vs_event_list);
 	if (!vhost_vq_work_queue(vq, &vs->vs_event_work))
-		vhost_scsi_complete_events(vs, true);
+		__vhost_scsi_complete_events(vs, true);
 }
 
 static void vhost_scsi_evt_handle_kick(struct vhost_work *work)
-- 
2.34.1


