Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C243AE199
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 06:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788762938; cv=none; b=jucSrY7VZtgGh9RYQhiRRUvqyVTglcDrA+j/R+I2HNi2pqKwLI3j8cpb0RJWrDrqp9zaiWXpEt1zPh+QfOKlqDfYTwZzttvnYF3yy0vPIkDh9+uEhyPIU5okXGpdJS3kraDzmC6z8fAfvchx2ABQ3jaifpL0unT6xhq7D8hIr10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788762938; c=relaxed/simple;
	bh=4Gfy17V7FzI7j7+uvkegy6iqdwRYBhYG7cqL/hxfzWw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hxqQlPBO2nYrKzPAYiLqFUSCY3R1UjPwWFtoXltar7dKtlLf1vY233iy7r+m9d4sDeKzhumctALLJjB4bA0uYh6J6zsE5f53lH1SdaUEmz7WfkFXOXIX6d8U2AjfsdMvNMLq0WNdIpi6snmfB2mDtV55rDqe0ilzdz+26b/o2po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YlNVUdav; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YlNVUdav"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-84e0688b7e8so2412571b3a.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 23:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788762937; x=1789367737; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4J4rYjNQoetFmHhwvDThjrrPfLTRssIW7zzZbk53w90=;
        b=YlNVUdavf/ePiDv61spsZ5Wx4nFqISGk88YzuA+U3EcUeeoyOESkREoNRm9IPURJ+c
         Z6Zsj8v4Wdwv+/O+gvLddTmvFIp5VEfudBBB6ey3mZjtgez0WbTqpn90NJSRRab/HbbJ
         9V331n2HOMgJpMi7DYdqOQpL5mAZ6x2xzccEVQMFGKaF6em+2V+wVQItKthbJz0bx1nl
         WA0S+T52xeDgS/KKqdqSEPSaPe8i/UQLt1Mriw1gI8p2ogMYXJPcK6HM96/1jXK0iHpo
         hPwmkaoFNbwqaX7RPpg7sbFeXHnY6yftip85xfjSmrjE+7vOBN8IxgGH8p49jjQGlT49
         WbZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788762937; x=1789367737;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4J4rYjNQoetFmHhwvDThjrrPfLTRssIW7zzZbk53w90=;
        b=MFeG0Yw2yhShRUtqiqphlj7WZYj+5+mrY784Jf3IR4kXrgog4t+Qmrs/2CB4boCOag
         A0w6bzjJx3ZrfqjF2dTsKOnUq24biXWCLqcmshORk6kavVDOe10q8DRlr7o23lzrDQSj
         C6TpCQY2/WB8ZqMdWW4FafGWZyUHFBQ6O/MRMkHMTs6Vm3qxQLvjlm5xkQK27Ezounay
         RGI0lD3/oq70rfk/CfXBK3BIIvc2/gaNHZCuzXSdbN0X+8Pibd24Fu4P3V0hX49xRyna
         AydTehPkjyKSgInlCPr99FqdjeqlcLWXo3Ouc79CWQI3w8n7mkl8Zwc3qnqcjLuKT5ko
         mgDA==
X-Forwarded-Encrypted: i=1; AKwUvBxLiIC1Tp07mDd1l6CapWXZcWU34VlGlmWC1cb/5azVPFmuTj3OCFibuP6TbjUQSx2eOy48aBbfYyzn1gg=@vger.kernel.org
X-Gm-Message-State: AFuF++maNmmmWGUyP8oDSKQWk9UWpycizgjdUSkAD6Pcxekvu3CKFaAv
	1RiYLVCWLdBJz7PJJE/zmRaH146pMT7d4O/t7SJGfPdynOWnEmXR9PGi
X-Gm-Gg: AYBFou2wdFtOz+ma9IlwtezWgijdq8tJyr/7MWTkYiSgpkPt7/jFH8XBTqIDoWo0wdA
	kvWaOZ3N/fnE6Igh+YGwap0UYI0eTxvkcIPKh6tcHYgA6jvoux2wQJD1IOh6zMGnEMMQGbOpTIo
	O+VxiMXVum8638pGkyyy6rFJsjPBDoWcllMyP5DGqaCah68E+qSRJnbsHprEP5dwfX7MfDo1+BU
	Q6j3zsarbnIG3pdzD9QqgEMpdQraOeuJjsVCSa9e+1u4cyMfetC172FFTlXft7xykTDdh9FmAGX
	baGReZCcdI7QV52Mqwzn5nwHF/WFOmSkzHFWo+k/xf7hZWZi8r+MGzuFuuKuqPBEbtt2yerKpES
	Y7FV6mKdmqVG5HOWBg/OELiWHNy/RrzLUoWzDvOviXmMuFUszX7ZWl8jQyJT9Q1vVjA7u59jd1C
	9MmgM0Q+JjDUDPgUeAXYklmpcERsAN4eE2gFgzhrLTuN/9/rhv21xCP2V0fgqbqUQlSdumShGWM
	QeDT0GUaDRssg==
X-Received: by 2002:a05:6a21:2983:b0:3d9:6f0:b42f with SMTP id adf61e73a8af0-3da39fd0822mr34557933637.17.1788762936771;
        Sun, 06 Sep 2026 23:35:36 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa37dbdsm21319326eec.11.2026.09.06.23.35.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:35:36 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K . Petersen" <mkp@kernel.org>
Cc: xen-devel@lists.xenproject.org,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] xen: fix typos in comments
Date: Mon,  7 Sep 2026 12:05:31 +0530
Message-ID: <20260907063531.23981-1-hemanth.selam@gmail.com>
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
 drivers/scsi/xen-scsifront.c     | 2 +-
 drivers/xen/mcelog.c             | 2 +-
 include/xen/interface/platform.h | 4 ++--
 include/xen/interface/xen.h      | 2 +-
 include/xen/xenbus.h             | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/scsi/xen-scsifront.c b/drivers/scsi/xen-scsifront.c
index 989bcaee42ca..f86a47056ea8 100644
--- a/drivers/scsi/xen-scsifront.c
+++ b/drivers/scsi/xen-scsifront.c
@@ -1076,7 +1076,7 @@ static void scsifront_do_lun_hotplug(struct vscsifrnt_info *info, int op)
 
 		/*
 		 * Front device state path, used in sdev_configure called
-		 * on successfull scsi_add_device, and in sdev_destroy called
+		 * on successful scsi_add_device, and in sdev_destroy called
 		 * on remove of a device.
 		 */
 		snprintf(info->dev_state_path, sizeof(info->dev_state_path),
diff --git a/drivers/xen/mcelog.c b/drivers/xen/mcelog.c
index 32ab419bb503..f19cc7a67f36 100644
--- a/drivers/xen/mcelog.c
+++ b/drivers/xen/mcelog.c
@@ -1,6 +1,6 @@
 /******************************************************************************
  * mcelog.c
- * Driver for receiving and transferring machine check error infomation
+ * Driver for receiving and transferring machine check error information
  *
  * Copyright (c) 2012 Intel Corporation
  * Author: Liu, Jinsong <jinsong.liu@intel.com>
diff --git a/include/xen/interface/platform.h b/include/xen/interface/platform.h
index 79a443c65ea9..462e36392a9f 100644
--- a/include/xen/interface/platform.h
+++ b/include/xen/interface/platform.h
@@ -421,10 +421,10 @@ struct xenpf_pcpuinfo {
 	/* IN */
 	uint32_t xen_cpuid;
 	/* OUT */
-	/* The maxium cpu_id that is present */
+	/* The maximum cpu_id that is present */
 	uint32_t max_present;
 #define XEN_PCPU_FLAGS_ONLINE   1
-	/* Correponding xen_cpuid is not present*/
+	/* Corresponding xen_cpuid is not present*/
 #define XEN_PCPU_FLAGS_INVALID  2
 	uint32_t flags;
 	uint32_t apic_id;
diff --git a/include/xen/interface/xen.h b/include/xen/interface/xen.h
index 40c9793e9880..f9acb21875cf 100644
--- a/include/xen/interface/xen.h
+++ b/include/xen/interface/xen.h
@@ -94,7 +94,7 @@
 #define VIRQ_XENOPROF   7  /* V. XenOprofile interrupt: new sample available */
 #define VIRQ_CON_RING   8  /* G. (DOM0) Bytes received on console            */
 #define VIRQ_PCPU_STATE 9  /* G. (DOM0) PCPU state changed                   */
-#define VIRQ_MEM_EVENT  10 /* G. (DOM0) A memory event has occured           */
+#define VIRQ_MEM_EVENT  10 /* G. (DOM0) A memory event has occurred           */
 #define VIRQ_XC_RESERVED 11 /* G. Reserved for XenClient                     */
 #define VIRQ_ENOMEM     12 /* G. (DOM0) Low on heap memory       */
 #define VIRQ_XENPMU     13  /* PMC interrupt                                 */
diff --git a/include/xen/xenbus.h b/include/xen/xenbus.h
index 8ca15743af7f..6424c5cf8ef5 100644
--- a/include/xen/xenbus.h
+++ b/include/xen/xenbus.h
@@ -63,7 +63,7 @@ struct xenbus_watch
 	unsigned int nr_pending;
 
 	/*
-	 * Called just before enqueing new event while a spinlock is held.
+	 * Called just before enqueuing new event while a spinlock is held.
 	 * The event will be discarded if this callback returns false.
 	 */
 	bool (*will_handle)(struct xenbus_watch *,
-- 
2.48.1

