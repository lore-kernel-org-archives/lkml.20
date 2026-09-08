Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F3525EF87
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 06:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788847277; cv=none; b=sWd1Sh/G6CckKJEt6YvMMzlR7PU4TiBsByM7uxjl0f+2gWbCLz9K1VCvTz5fZCVr3kppAuWrEJ7Snx+GO3cjplFIzQI510gcr9DNu+ini1fXTbGWGk1teoaB8yWY3Bt5fOocmCuRJs4PF/bSbua/ldmjUXmwgJAWGMEIYgd0k9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788847277; c=relaxed/simple;
	bh=4z6HMDyADD337DTmrscEfhf2b78PnKSq/MtQuserv6k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RLPwf/6ime/4l6YC++a0c9o/VEOn/eUQmgGIpbcTrahN7oX0KICJ0qOq0otcrRkCNLZ9Zu3a0tfXUkeZ4jDIW57Fk83zTosd84fXB2AKYZlUapdZj3kYx/O5P7RIsbI2ssDPNYPnd+b6LLuLYZj2WHv2H95yfWyE6avaSaafMiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d2AI5J1A; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d2AI5J1A"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-ca7c1176317so3407350a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 23:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788847273; x=1789452073; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rud7AzWXfFmh/miZcM84Tl0yKLFLgZncbdvuv1vQA1g=;
        b=d2AI5J1AgI94gkUjhLOm16/wanbNP3AeK/h79pObhbkNp3vAQjBBEl93quks6Feh5n
         8mjpx+nuCMwbUR+RRpNr3ebonyJjTOwN3GAdQlDpuGkSa7kdQ+xzHYTZDiB41fE2RiWc
         YDsGm4GDTmJea7kOeTXqNaw0/sG8N2+a5ElXOncbCYAaY+GFSGQvQCZrJjHES2vHIjl7
         6Vr2StmmmRxZ2FdUYZ9/mEJ4Z24jG+0lJa270bqVjleVMuyWjjJTRoxYao8U/2FSNMbQ
         5j27Vy9h774LCypEzXSFA3LQyMUOzcf8jDtzAhni/CpXGdPdQvOBHr77z4bBE2d7wDwJ
         ms7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788847273; x=1789452073;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rud7AzWXfFmh/miZcM84Tl0yKLFLgZncbdvuv1vQA1g=;
        b=OZzYor8C/nNIZzi97PrzRWFMxdqZIx/XvqQIZ1jA6+5Sjezm4yP8MsZZpQ9lGeDibb
         f7/o3ayhjs8pou/+FuR7x5JyJNHA9TYWJZrwwu00uNiFeLnJW3RwrOeWmiCQCYpxSfQF
         N+5HwbGja1EHKbul4NbX/v9nJd+7IMX7J2RkuNv+yUtkC9P4iG8T2baAoTRlQXjt1CwO
         I6F/2I5AH17R44I4VuuhfyS9cAgyHxk15aZPjUv/WCrvi5nufExULGi4oRRcOpPAX0kt
         fNLg/oDbSsav0zF4okIAPlLgorHheFoUWZW4N6I7u4q0W6F6zXvlKw7JsKQx44aFO892
         idVA==
X-Forwarded-Encrypted: i=1; AKwUvByHs1EVvvld3xbglDhCWFPnsUUSKHU/WkFLuFzN5Fm2aAKIWSuDQHq+f9CXfZqxKG0J2B8IERLt+rfB5FA=@vger.kernel.org
X-Gm-Message-State: AFuF++lXA8TyM54set1gXWyzkYx55Vr59MCPunH6gW2cdVfwBYz2uXXf
	b2+6ba0J/IW9VOQQVYsWl1VKIkWtVx32vzgyV+hAWLfPS259AZYu9ecF
X-Gm-Gg: AYBFou1v+3PVSAgEMCzmti+WfLHLSN9F70eTbUkaF8zF61Q17IKOihWJkoeq/qQlZpw
	DsOdKwLZ+nM3+zBj9YVw5T6zcO9jefmhNX4GIp3HrHwpfjYwPNyk9DZ6g/M8sn8UcLWXgJqiiLq
	kvvEzulD5ERJSCBM0d5PUd8kjgl3MNMtwQeUiUfkq3oe8TaLi7PgyATT36K4B/Bfn+td5iuOzQ9
	k4d4jEwinZtqZV4ool2zy/qGmo9FEev84qTaQrI36VvV2JrLeulqhPBROYVH2jb1hSIjW7LvK2H
	YcmHq6DqQJ3i0uk7NQMBexbbTTnj9JfIzuXV+QnAsISvuTLAxCpwvEXh7tTElZ8Y9d09kycRUzy
	THLJXiMTXj284B6xYF5Ya5nKWBDgo9GCjErDSkAvALsUkZVZnDOhbZvRiC6eTUVMwA3MayTjtmz
	XW5BRrpHqgs2+57suJ1Z9Cwkie8Laz1MFVJ8A4KXMQvD/XSVBAGJUGOUdJayscWZgg1A0L+PU4p
	g2608Xf6h8eWdmKKRQBF5wYX/hIv+v1YmYDr1P7q4OmMIshnU6pdJ4I7Ix4ZBWobqlCRNg2Ze6b
	oZmfvHbfuCrHUkLFp+OaSpNh6g2oX6dhzVNIiEoqBo3I59cy+g==
X-Received: by 2002:a05:6a21:d84:b0:3d2:2011:d184 with SMTP id adf61e73a8af0-3da3a096045mr45740365637.14.1788847273403;
        Mon, 07 Sep 2026 23:01:13 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc455485c25sm4850041a12.26.2026.09.07.23.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 23:01:12 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2] mtd: rawnand: fsl_ifc: allocate shared ctrl with devm_kzalloc
Date: Mon,  7 Sep 2026 23:01:11 -0700
Message-ID: <20260908060111.41244-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allocate the shared fsl_ifc_nand_ctrl structure against the controller
device, which outlives all NAND child devices, so it is freed
automatically.  This drops the manual kfree() and the broken chip
counter that was decremented in remove() but never incremented
anywhere, leaking the structure and leaving the freed pointer in
ctrl->nand on re-probe.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: rebase.
 drivers/mtd/nand/raw/fsl_ifc_nand.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/nand/raw/fsl_ifc_nand.c b/drivers/mtd/nand/raw/fsl_ifc_nand.c
index a88ac2cfaccd..4c2d95461c2e 100644
--- a/drivers/mtd/nand/raw/fsl_ifc_nand.c
+++ b/drivers/mtd/nand/raw/fsl_ifc_nand.c
@@ -50,7 +50,6 @@ struct fsl_ifc_nand_ctrl {
 	unsigned int index;	/* Pointer to next byte to 'read'	*/
 	unsigned int oob;	/* Non zero if operating on OOB data	*/
 	unsigned int eccread;	/* Non zero for a full-page ECC read	*/
-	unsigned int counter;	/* counter for the initializations	*/
 	unsigned int max_bitflips;  /* Saved during READ0 cmd		*/
 };
 
@@ -1033,15 +1032,13 @@ static int fsl_ifc_nand_probe(struct platform_device *dev)
 
 	mutex_lock(&fsl_ifc_nand_mutex);
 	if (!fsl_ifc_ctrl_dev->nand) {
-		ifc_nand_ctrl = kzalloc_obj(*ifc_nand_ctrl);
+		ifc_nand_ctrl = devm_kzalloc(fsl_ifc_ctrl_dev->dev, sizeof(*ifc_nand_ctrl),
+					     GFP_KERNEL);
 		if (!ifc_nand_ctrl) {
 			mutex_unlock(&fsl_ifc_nand_mutex);
 			return -ENOMEM;
 		}
 
-		ifc_nand_ctrl->read_bytes = 0;
-		ifc_nand_ctrl->index = 0;
-		ifc_nand_ctrl->addr = NULL;
 		fsl_ifc_ctrl_dev->nand = ifc_nand_ctrl;
 
 		nand_controller_init(&ifc_nand_ctrl->controller);
@@ -1121,14 +1118,6 @@ static void fsl_ifc_nand_remove(struct platform_device *dev)
 	nand_cleanup(chip);
 
 	fsl_ifc_chip_remove(priv);
-
-	mutex_lock(&fsl_ifc_nand_mutex);
-	ifc_nand_ctrl->counter--;
-	if (!ifc_nand_ctrl->counter) {
-		fsl_ifc_ctrl_dev->nand = NULL;
-		kfree(ifc_nand_ctrl);
-	}
-	mutex_unlock(&fsl_ifc_nand_mutex);
 }
 
 static const struct of_device_id fsl_ifc_nand_match[] = {
-- 
2.55.0

