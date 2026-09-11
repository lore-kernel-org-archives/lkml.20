Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F91B3C4B79
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 04:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789102761; cv=none; b=aPaS+qidmsnpuhZLrmwvvNpytoLW2DaKdP1bC1bTjcBkUezvjfGLWxYzqcPqpPcdxVfK9aRPe4RKuhrVeoyg6e+9l2xiRfaf5Ov9Sp4vlbptFrzTpe1g+W/eNgjr/XlKhEBhCnpotaAg2mNqU7rwDix2dp49OTBohE7YKFRsD2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789102761; c=relaxed/simple;
	bh=x6e1VD6DAjwkYHlAuCKFBq9VSgMnvVwyyuhPVCgAQkc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y0ppfkxRuhyw6b9O1jay56JoTNq5KLqZY1UDWETXMjpy908WeKZvB2wlnW4faZXXbbg3rOjPf6tdGQ0N6cnq1CgZeaAkSwe+WEXJ4U5FrFT1h9cf4D/Isk+OTjle23tYuqL46WwzaOoeUUdhfjmPecC0dC1F1SLJimELxVkyRU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aFxgpp8B; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aFxgpp8B"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-53031a57d7fso6587831cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 21:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789102759; x=1789707559; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wCXPH5qyN+T/QDXSJDvMi96nm7B2ecJ31ViCwFmjhuA=;
        b=aFxgpp8BETKWpi7Mh3et0QFvJZABV1LQ7TaKJFiCdtXF1agyoVDOw1atnPCLr5JIc+
         OapJh/XhG2eFWnLtlHHjHT/LcYHfbYvd0bLvPPMR3QWDGuq2Sw4gBA7ThuG40ihj+7Aj
         7LFSDBYEwNBJL8swnZtEgvQ6CMgT791bP4jwG+6ouKrtpgOWfnYSxGMBCUwcYNfrYXEP
         Eslow3bspTpk1xjF8IjZFBnTffw2Fy2JFMlAn3Xs2bCv+/xVilKTwKUu4vtwP4jnaDUw
         KdYifSRaZfXEz9bf2sL6vq4yjE3zAk92RCydurJN7aUCmfu36X28F6XCyjd0+zBkgUfm
         67cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789102759; x=1789707559;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wCXPH5qyN+T/QDXSJDvMi96nm7B2ecJ31ViCwFmjhuA=;
        b=mi/HCJ7AN/uS/az2SH6JrgP16q/mBvrKul+c7IU/dG1FL9zWKiqdUXga+MKCZzqS6K
         zH34tkgphxxlB5RIpZGCWJ1OHdbhqh2VjIsceLUZlgm2irKbW9Kskh2Q7+rS34Q6q7uO
         8gaMh5to3wcPBa0AXmVmw7XtKCqOn/1X8Ls4mkr5CGm4iegnmCfWva8BQjJzhl+m5MEa
         SUOjOPLSpWimJz+Via7zffaqDl9y2UJlG4f/3wHHFUEjA5Tah38nkDgn5UmPCvfDbGDI
         oszgewO9KqfoH+6GhcJY13xij8DPw9tAYGoSk3TEv4WlhBCvtahhrhgCyqI9g687dXy5
         eCfQ==
X-Forwarded-Encrypted: i=1; AKwUvBwiigZ/kQcf9DHeVcBeXJi7nnOtQF1iDE+D7HZCGPCwBRSuG8dd8RezGcfOgfVZUdR1ui6MXzLuBg0vVYI=@vger.kernel.org
X-Gm-Message-State: AFuF++lCX4liyWiwZX1xNVW1/1yuiNsA22BLS8+KmvVSj0OboaCjXYZV
	FRBzKFL3PoYJj2gZFgxdAnJBLHf/tJPkPIWDY6ECa2gRcDW20hmC01oE
X-Gm-Gg: AYBFou0KIiJ8IjEu2SxMk+l+0oR4PsA8SBikhW1bJLDAYlY+065qTgsCbVE+4idKSiu
	nw7ebJrusmerZyins6u7tj8BBt0s8POtyu+DCAKkmzJVws9HLiGKECg3jO8dQf0tx5awPaN9zlJ
	Vtj9unoa/gANQNbyDEXMx4Maf6fqw4/Qk4Ow6XL9WHXVN1Ggn/4/2WU5DbpB4mEBAis1jVlpfnv
	pG7Og/NKXQQAJjlWzWQ7YfqlxQDFRExa/Jk64AW+MWWSHfqZriAsZiy0ifZyxVeTarDTsD66d45
	04qkbdcfpYpQQAZuEi1m/bKccb8hRKULflDGuvogGO6dKCTZSj1+7oLLaa1Y34IM7r2BiUIeCD8
	C1oWqXPP1mdXiWqvXagOBK1tCTwUKyjvJQlTdRrr/orHI4DpVXBIVlf/QiSIVwhJvcIyQdCQUFz
	U4RaNgKYM6dWCmtblbkYpLrCYYqrlEiM8UBx1AA6srkUiLAEailhr5ZqLzDWuz
X-Received: by 2002:a05:622a:453:b0:530:b2e1:2f46 with SMTP id d75a77b69052e-530c879db6cmr40766121cf.61.1789102758964;
        Thu, 10 Sep 2026 21:59:18 -0700 (PDT)
Received: from linux.. ([8.34.174.240])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530ca4b9a97sm11586281cf.18.2026.09.10.21.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 21:59:17 -0700 (PDT)
From: Changyul Lee <lcy8047@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Changyul Lee <lcy8047@gmail.com>
Subject: [PATCH] slimbus: messaging: hold lock until transaction is completed
Date: Fri, 11 Sep 2026 00:59:11 -0400
Message-ID: <20260911045911.1327413-1-lcy8047@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

slim_msg_response() drops lock after idr_find() and dereferences txn.
If the requester times out in the meantime, it frees the TID and
returns, so the handler writes the reply into msg->rbuf and calls
complete() on txn->comp, both of which have already benn freed.

Keep lock held until complete(txn->comp) finishes, so a requester
in slim_free_txn_tid() and cannot return while txn is still in use.
Call idr_remove() because slim_free_txn_tid() takes the same lock.

Fixes: afbdcc7c384b ("slimbus: Add messaging APIs to slimbus framework")

Signed-off-by: Changyul Lee <lcy8047@gmail.com>
---
 drivers/slimbus/messaging.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/slimbus/messaging.c b/drivers/slimbus/messaging.c
index e2dbe4a66b70..aa98f5480ba4 100644
--- a/drivers/slimbus/messaging.c
+++ b/drivers/slimbus/messaging.c
@@ -29,22 +29,24 @@ void slim_msg_response(struct slim_controller *ctrl, u8 *reply, u8 tid, u8 len)
 
 	spin_lock_irqsave(&ctrl->txn_lock, flags);
 	txn = idr_find(&ctrl->tid_idr, tid);
-	spin_unlock_irqrestore(&ctrl->txn_lock, flags);
-
-	if (txn == NULL)
+	if (txn == NULL) {
+		spin_unlock_irqrestore(&ctrl->txn_lock, flags);
 		return;
+	}
 
 	msg = txn->msg;
 	if (msg == NULL || msg->rbuf == NULL) {
+		spin_unlock_irqrestore(&ctrl->txn_lock, flags);
 		dev_err(ctrl->dev, "Got response to invalid TID:%d, len:%d\n",
 				tid, len);
 		return;
 	}
 
-	slim_free_txn_tid(ctrl, txn);
+	idr_remove(&ctrl->tid_idr, txn->tid);
 	memcpy(msg->rbuf, reply, len);
 	if (txn->comp)
 		complete(txn->comp);
+	spin_unlock_irqrestore(&ctrl->txn_lock, flags);
 
 	/* Remove runtime-pm vote now that response was received for TID txn */
 	pm_runtime_mark_last_busy(ctrl->dev);
-- 
2.43.0

