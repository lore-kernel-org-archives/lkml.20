Received: from mail-wm2-f10.google.com (mail-wm2-f10.google.com [74.125.225.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7E236494B
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 10:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791368821; cv=none; b=pwWz8Aa7gaNtPCV7LB+EJxggZf8fwc/7hbCyDyA+E8XzHlds1CjUchq0pibg0aUHz7GmBCR0QD6dlSHyc4RqycyNfaw28eo65bQP8fhs2RWY/nSjLz2eYN/hFm7ALrnCgu0bbksIHaY2giLim8Yfrh/JKSBqe+YFFSByFVt9HpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791368821; c=relaxed/simple;
	bh=zuZBrHMl/2EhgqEOtENaeZynhYUC3YcD95kEgbgVQFI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G48pKzXHKqN+VUz6K+2x2qTgAt3Ql2lcwrlY9jkxXOnB6ce1jR+656BBwDah+rCNeOHbbv+SunL0Nh0a5Cm3D1pr60lII5qJ7cyvSRbembIhmIQyL0Jk/gneD8FrvznxP//QutpZIni3qDjM1bdewEIJQ/uuY4/rMSTQu7//iNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LogLUfhb; arc=none smtp.client-ip=74.125.225.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LogLUfhb"
Received: by mail-wm2-f10.google.com with SMTP id 5b1f17b1804b1-4a0f23b853dso11195935e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 03:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791368810; x=1791973610; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HumvXknLbwxIHtnR1xskfJjNHpMlUAF4ybfL0BilI/o=;
        b=LogLUfhbObFTrKprGKL2uXKkNynTvUoHeukaUqytlsoiHEjp2CXAeMn2WdL0wrWyRs
         ReGAWprCW4ySIk/hoJhZOunwBYmLpVzIOncRsqbeo/ufEiqOSfFMlX9p1DNm/RoF0phP
         ezD2HewCcAv/6xYSQWmRAF5VjEjDSpM3snzf5Q8s2BINLltQ/Y7jdqWnrcUsa5ijDnlz
         VfdH+lwPVnj55H8wlH/OtwOUeWUVN3gENxS+eFu0myMv3Yn0tQlnDOWyjc2qse/eMONA
         +4MgU/lMOUfyJCJ0lUNoTFbQN2R6qBzSPQXVG9/OjWIbpMu7GUI9ZuKA7jZE/nklfl0f
         wJMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791368810; x=1791973610;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HumvXknLbwxIHtnR1xskfJjNHpMlUAF4ybfL0BilI/o=;
        b=mM1xPxlLWgFy0SRXKdwyqpbBrvi3Goa7luRScsZVr8w4kNFHwdudiyd+8qQJDO+yQx
         eR3Yb/Toek/p84dz+3/6HR0OC+jH2/02vCKBkVLJbNpGLqm0r9PkddNgaVqzaq1y49TI
         3F3BFDVz44Qza3+aTaX+z6Xa/NzeyW50Bg97tWXPwzLgcv4KKJN3muAopFbbKvIJqLXN
         hAusDGGxs98kDrfbA2jnfpJbe5VBJwlVXYhy6YxGLSE6HB30dMsa1u1BT2kGpPSj7SKy
         1WyAbZZyJ/RlUdOCJuKyfe7o1SBZ3J5lpnvwoLPOQeTiDc6l5QgO4gqz/ndxjLiSyWBx
         PcnA==
X-Forwarded-Encrypted: i=1; AKwUvBzE5+x3s80eB7CnGK81c0hm8cvk+Zld93z5Yl/BnxvdxbyZjRBzDQpBJ6n0Gy5Bz8Fyzr5VC1CfOhCVD+4=@vger.kernel.org
X-Gm-Message-State: AFuF++nqmse+2Kps6F3LbUuQ1M+c9i0UW+STESwQfp1Xw+xwn81UnJdE
	JP20GJDjd363nwDngS6JNBn2eZeR5zoJLARTFCLpkHzoSRyza6jTPS/Z
X-Gm-Gg: AYBFou2s/tt4xj90VaLyoOSW9N3BAXVWEPzMMGkhR8esKSbbWziPEF7nnU+tSF2ZWng
	qy3jaG9GoGcx0ZuXUOtN5+GSyXwcV7SPtw3nR1KxF9vH3m1LPlsqE88wHPF0F/+lxSp370d3wOU
	ifD9u6oAFFRqoaSBnjvlBAuL+Z13lrDk/fay7WWZmtxGqDGH6/ynL7wnTwiwsZ0hXPJMDjY7S6t
	aNgS3OItaFa7uNeECo906Zz9yetB/f4qzG/eh2AzsK2Ls2Ax6rrjiXDBaKYo9S7VGlkQJfNgiv9
	BqwM7TrbZcK4GnsE0yKqBHwDu0sKoLunR/hhCnN78LIk2aun7dI3PtOKUSZFXO+x0fdn9WzCike
	jJVUYtkwok1SWl5MozmCui57SAToy1ums93hXB8uxbLM1bt3j+RvKxfhrW+DzoSBsa6X62xWHYv
	mtGgofEBMjkRxBlr7E2sSzecYBUyKCnsoGWZuTViAVy3SO3eRHu6DaXt9DlM9ZszMSF+ZLkhWRS
	VGhUbyCaNfieQ==
X-Received: by 2002:a05:600c:a30c:b0:4a1:80d8:aed0 with SMTP id 5b1f17b1804b1-4a180d8b180mr18101365e9.15.1791368809492;
        Wed, 07 Oct 2026 03:26:49 -0700 (PDT)
Received: from serhat-ubuntu.home ([212.253.205.12])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1787e7792sm133976735e9.0.2026.10.07.03.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 03:26:48 -0700 (PDT)
From: Serhat Kumral <serhatkumral1@gmail.com>
To: njavali@marvell.com,
	GR-QLogic-Storage-Upstream@marvell.com
Cc: James.Bottomley@HansenPartnership.com,
	mkp@kernel.org,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Serhat Kumral <serhatkumral1@gmail.com>
Subject: [PATCH] scsi: qla2xxx: Fix fcport handling in session creation race
Date: Wed,  7 Oct 2026 13:26:32 +0300
Message-ID: <20261007102632.11971-1-serhatkumral1@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a second WWPN lookup finds an existing fcport due to a race, the
driver continues using the newly allocated fcport instead of the existing
one, then frees it at the end of qla24xx_create_new_sess().

Smatch reports a use-after-free of pla in the trailing cleanup.
qlt_plogi_ack_unref() may have already freed pla, making the subsequent
list_del() and kmem_cache_free() invalid.

Fix this by switching to the existing fcport, freeing the
redundant newly allocated one, and removing the trailing cleanup.

Fixes: b5d1531260b9 ("scsi: qla2xxx: Fix slow mem alloc behind lock")
Assisted-by: LLM
Signed-off-by: Serhat Kumral <serhatkumral1@gmail.com>
---
smatch output:
- drivers/scsi/qla2xxx/qla_os.c:5627 qla24xx_create_new_sess() error: dereferencing freed memory 'pla' (line 5573)

 drivers/scsi/qla2xxx/qla_os.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/scsi/qla2xxx/qla_os.c b/drivers/scsi/qla2xxx/qla_os.c
index 3c412c7fb6fe..1231265365af 100644
--- a/drivers/scsi/qla2xxx/qla_os.c
+++ b/drivers/scsi/qla2xxx/qla_os.c
@@ -5456,9 +5456,9 @@ void qla24xx_create_new_sess(struct scsi_qla_host *vha, struct qla_work_evt *e)
 {
 	unsigned long flags;
 	fc_port_t *fcport =  NULL, *tfcp;
+	fc_port_t *conflict_fcport = NULL;
 	struct qlt_plogi_ack_t *pla =
 	    (struct qlt_plogi_ack_t *)e->u.new_sess.pla;
-	uint8_t free_fcport = 0;
 
 	ql_dbg(ql_dbg_disc, vha, 0xffff,
 	    "%s %d %8phC enter\n",
@@ -5529,7 +5529,9 @@ void qla24xx_create_new_sess(struct scsi_qla_host *vha, struct qla_work_evt *e)
 			    __func__, tfcp->port_name, tfcp->disc_state,
 			    tfcp->fw_login_state);
 
-			free_fcport = 1;
+			conflict_fcport = fcport;
+			fcport = tfcp;
+
 		} else {
 			list_add_tail(&fcport->list, &vha->vp_fcports);
 
@@ -5542,6 +5544,9 @@ void qla24xx_create_new_sess(struct scsi_qla_host *vha, struct qla_work_evt *e)
 	}
 	spin_unlock_irqrestore(&vha->hw->tgt.sess_lock, flags);
 
+	if (conflict_fcport)
+		qla2x00_free_fcport(conflict_fcport);
+
 	if (fcport) {
 		fcport->id_changed = 1;
 		fcport->scan_state = QLA_FCPORT_FOUND;
@@ -5620,14 +5625,6 @@ void qla24xx_create_new_sess(struct scsi_qla_host *vha, struct qla_work_evt *e)
 			}
 		}
 	}
-
-	if (free_fcport) {
-		qla2x00_free_fcport(fcport);
-		if (pla) {
-			list_del(&pla->list);
-			kmem_cache_free(qla_tgt_plogi_cachep, pla);
-		}
-	}
 }
 
 static void qla_sp_retry(struct scsi_qla_host *vha, struct qla_work_evt *e)
-- 
2.53.0

