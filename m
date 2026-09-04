Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F7147F772
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 10:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788518744; cv=none; b=ZfwxjsTqebtUh2kJTtwVcdBjc8otWaVRtuQ6UxAcKsuvDqNkd/ZhHBzojx1lau8L2kwPNHZLIQdqWtX7EnV5126J42B2ArybxuH7ycTMXTx2rBXRiTKVN63KdoMAMojG7sO237wFo5NLQ+ldc4lywYIEsqYpVqaBow6BA0QBlwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788518744; c=relaxed/simple;
	bh=jEf1ZbVyuLx6xB4AQkVW0+fkW4EE8HbhofCfHRXscDM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YvhlktjZuy/EJRzgodxDkVHbE7fEgMgqXI7hRuNLFR2qaS6kZeMyAKSqxQe15YRFnVMDIyLpE4lPYkQVfsBd4Iat1yCb6++3/atFUp6P1TyUY3lC4Tjth2J7Z4V6UekD4SPOpdQDHsZFttHTFGNm368SEZxL4iIe0FEssRNadfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P9Zdt1dQ; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P9Zdt1dQ"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-39682983a0fso900851a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 03:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788518741; x=1789123541; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sa11veKQeR2jL6eGP/Q2IWwnSfActcWrUSQM+GRtqgM=;
        b=P9Zdt1dQLhucRjA1BpbT6ZlR3ecC38lK8k4i0+f+Pat+WADCAFl5gIvJiueI6tPDzI
         8w0zszx5rvgJwYFBH0tD9DYbCf9Jt8wdMge0TmK981A5Ekxn/rNE3/4vB5ukeK28TEMJ
         VhE7YVauBhJByxI0l+4mE0AdbHPa92XStkt0+w65z+KNGyyAXQsESKtBCjXCzTGopM3Z
         Xv6DcX6oCHEG4KOSwu2FHhVPoOPtBju6nBQb3PNjw1gIuXmaUao8NIumzytzQ00/EXY0
         teveatR9A3dVjAyfJE+VzPwyg5nkPzutLASKRcbgtvAWWNWq7g+Y2LjyQbegrLS3nbgE
         q8ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788518741; x=1789123541;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sa11veKQeR2jL6eGP/Q2IWwnSfActcWrUSQM+GRtqgM=;
        b=SybNC7e24ThYgRkzA1hsn7CW3PrNAwqh+2uusMnIZxHA5eP6HtlSI07g2qEyKiDqpx
         erJ6Ln3ZCt/DvRbCoS6ZTv0knYyiFuJUBcZUb1IYjJ8KqeHncPefzbxp+V4MKmKVYCRD
         vQ0tFa1wEpJm7s+XER9rk4UbQI5YqD10LO490vMgIJPH0w45WhewzlufL6MphrBZircb
         x0Xd7A6rz+kJo/buSWTPBsiOJGKbqCeZ6TLmpCJV5LLhZRyqc6UtN5hTmsw7cIwk+9j9
         iffjDcSgmqwUxrHNN5M7O9GMolYbS01qUB1tzTNewXR+LcmehDrvJ1YJXUy0JraD24Do
         qorA==
X-Gm-Message-State: AFuF++nGzA4sMP9HHdeEdpogsTAJaEjEETKLcVeqnEm+TOQk1w6/xUZQ
	i0sRp0C9PtSDtls+QNbNmwdD524Bdf39cFyvrm27bnzICkPnakQ6kf3MHjG7lzkpjyA=
X-Gm-Gg: AYBFou3QxK3o4fkAEZAEDyui1LMpzZRxirPssQswa7CBHek6YI2rZbUOD1/oI140UGx
	wyYrBSFv+ELj/ZRExJOJCPMkmgLJY9XR0vjyH6wG7roJc553YxkjOpwP40aGS0Zx6Q+fnSZQHxz
	d/PY0WfPzS+vb+FcWKKH8aFY0j3H9SKiJ1lLC2k1cQhtfeBay1+aQn237f1+gj+o1URIEYrQCsW
	lnunDsr7vDT/KWI5Qeeopa/bR2++KoX9h2QJfACvVTlxM5DF3ENzFnWFnFAAfPemFjRaUlpbM1b
	Z5uYX/yJfvfWU86uUmAkEfZNzy7j5yJ0gKwdOw8NOQB9ONw7QgHyyn1C0aXMxCqVPN8/SXmQJSs
	tqvKco4KsEIPN20mftlbLTkGobeC6rUmKvYsztdgtYz3x205ufxIgp6acKge+8VYTehdccfSJPE
	iEmr95vxY0uzNhTxOPd4OahZ+Gqqaf6Jt1btU37cCIwq8VpW4UhpYmcN/LmCqfUdx2y4zUF/ubK
	6O51/1MTwulYVs=
X-Received: by 2002:a17:90b:2681:b0:38f:5801:dc0e with SMTP id 98e67ed59e1d1-39b261d52a4mr7706671a91.15.1788518740880;
        Fri, 04 Sep 2026 03:45:40 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa36b37sm5674895eec.14.2026.09.04.03.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:45:39 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Sathya Prakash <sathya.prakash@broadcom.com>,
	Sreekanth Reddy <sreekanth.reddy@broadcom.com>,
	Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com>,
	Ranjan Kumar <ranjan.kumar@broadcom.com>
Cc: linux-kernel@vger.kernel.org,
	MPT-FusionLinux.pdl@broadcom.com,
	linux-scsi@vger.kernel.org
Subject: [PATCH] scsi: message: fusion: fix typos in comments
Date: Fri,  4 Sep 2026 16:15:31 +0530
Message-ID: <20260904104534.20126-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/message/fusion/lsi/mpi_log_sas.h | 2 +-
 drivers/message/fusion/lsi/mpi_raid.h    | 2 +-
 drivers/message/fusion/mptbase.c         | 2 +-
 drivers/message/fusion/mptbase.h         | 2 +-
 drivers/message/fusion/mptctl.c          | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/message/fusion/lsi/mpi_log_sas.h b/drivers/message/fusion/lsi/mpi_log_sas.h
index 27fe17a75eaa..a0465f2db050 100644
--- a/drivers/message/fusion/lsi/mpi_log_sas.h
+++ b/drivers/message/fusion/lsi/mpi_log_sas.h
@@ -191,7 +191,7 @@
 #define PL_LOGINFO_CODE_ENCL_MGMT_SMP_READ_ERROR             (0x00200010) /* Error occurred on SMP Read */
 #define PL_LOGINFO_CODE_ENCL_MGMT_SMP_WRITE_ERROR            (0x00200020) /* Error occurred on SMP Write */
 #define PL_LOGINFO_CODE_ENCL_MGMT_NOT_SUPPORTED_ON_ENCL      (0x00200040) /* Encl Mgmt services not available for this WWID */
-#define PL_LOGINFO_CODE_ENCL_MGMT_ADDR_MODE_NOT_SUPPORTED    (0x00200050) /* Address Mode not suppored */
+#define PL_LOGINFO_CODE_ENCL_MGMT_ADDR_MODE_NOT_SUPPORTED    (0x00200050) /* Address Mode not supported */
 #define PL_LOGINFO_CODE_ENCL_MGMT_BAD_SLOT_NUM               (0x00200060) /* Invalid Slot Number in SEP Msg */
 #define PL_LOGINFO_CODE_ENCL_MGMT_SGPIO_NOT_PRESENT          (0x00200070) /* SGPIO not present/enabled */
 #define PL_LOGINFO_CODE_ENCL_MGMT_GPIO_NOT_CONFIGURED        (0x00200080) /* GPIO not configured */
diff --git a/drivers/message/fusion/lsi/mpi_raid.h b/drivers/message/fusion/lsi/mpi_raid.h
index 36688a921ef2..5fa3f4000800 100644
--- a/drivers/message/fusion/lsi/mpi_raid.h
+++ b/drivers/message/fusion/lsi/mpi_raid.h
@@ -218,7 +218,7 @@ typedef struct _MSG_SCSI_IO_RAID_PT_REPLY
 
 
 /****************************************************************************/
-/* Mailbox reqeust structure */
+/* Mailbox request structure */
 /****************************************************************************/
 
 typedef struct _MSG_MAILBOX_REQUEST
diff --git a/drivers/message/fusion/mptbase.c b/drivers/message/fusion/mptbase.c
index 3a431ffd3e2e..7672ab523ede 100644
--- a/drivers/message/fusion/mptbase.c
+++ b/drivers/message/fusion/mptbase.c
@@ -4453,7 +4453,7 @@ PrimeIocFifos(MPT_ADAPTER *ioc)
 				    "Request/Reply/Chain and Sense Buffers\n",
 				    ioc->name));
 			} else {
-				/*Reseting DMA mask to 64 bit*/
+				/*Resetting DMA mask to 64 bit*/
 				dma_set_mask(&ioc->pcidev->dev,
 					     DMA_BIT_MASK(64));
 				dma_set_coherent_mask(&ioc->pcidev->dev,
diff --git a/drivers/message/fusion/mptbase.h b/drivers/message/fusion/mptbase.h
index b406fd676da0..6f3091dff920 100644
--- a/drivers/message/fusion/mptbase.h
+++ b/drivers/message/fusion/mptbase.h
@@ -62,7 +62,7 @@
 #include "lsi/mpi_raid.h"	/* Integrated Mirroring support */
 
 #include "lsi/mpi_fc.h"		/* Fibre Channel (lowlevel) support */
-#include "lsi/mpi_targ.h"	/* SCSI/FCP Target protcol support */
+#include "lsi/mpi_targ.h"	/* SCSI/FCP Target protocol support */
 #include "lsi/mpi_tool.h"	/* Tools support */
 #include "lsi/mpi_sas.h"	/* SAS support */
 
diff --git a/drivers/message/fusion/mptctl.c b/drivers/message/fusion/mptctl.c
index 77fa55df70d0..fc0c4670b203 100644
--- a/drivers/message/fusion/mptctl.c
+++ b/drivers/message/fusion/mptctl.c
@@ -213,7 +213,7 @@ mptctl_reply(MPT_ADAPTER *ioc, MPT_FRAME_HDR *req, MPT_FRAME_HDR *reply)
 
 	/*
 	 * Handling continuation of the same reply. Processing the first
-	 * reply, and eating the other replys that come later.
+	 * reply, and eating the other replies that come later.
 	 */
 	if (ioc->ioctl_cmds.msg_context != req->u.hdr.MsgContext)
 		goto out_continuation;
-- 
2.48.1

