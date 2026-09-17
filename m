Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1008449A3D7
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 23:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789686226; cv=none; b=icFkAmnUINxrqejshrQF91qiCmXks9mlHwwGZi61d1vbulSsLAk33sEkhq8E1Ez4K5tH103aS7Nd2fhLK3R1Z0FksdvSfqI3GfyL3E09FhTHt7kFSgc+OP4C1WdEXDbRhpvBqaXEz2IfE9ugzW/wtwk9p8pt7q4guZr87hT2ck0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789686226; c=relaxed/simple;
	bh=fX8Mv2j3jfcMNfxZ/Vvl78fSymNk3CAWNNUODUyuZUQ=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=b62Pin4eAg2yjJfahnvneXTW5y2cxaa4eVOB5qSIRtyr/EA86WghqQzkS2jgR7L5LaEQyfLNfZnbfFOfBYRRjANlqwSRj9R5xNg5ZjXZqnTMYInCNr8QR1IoqqFV76DRKtyfcshZvjHlu1QFl1C5b3Wq0DDFY4S7s2NC5QETa50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mclapinski.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=m2bxTF44; arc=none smtp.client-ip=209.85.128.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mclapinski.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="m2bxTF44"
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-49cd55ee2f7so1111605e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 16:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789686212; x=1790291012; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oYAViEKIR6jmAp5mlWeLAMEKyuMg7x9lqO4x+CGM4FE=;
        b=m2bxTF44XTcKTpY3xqttoDLnQN4QjQHAEimEgc7Xu1QCNtCVZ7+4itg/IbrUaQHQoE
         gERpju5e6FjGobgSjq0jrR1froxe5iLWYu4KYGw9a82BowA+6m02Hm0iVp8qjHqJlf8o
         gL8puHyceBbzWE7VhHAnmvSg6c3DKTnTXpM8QIEd93sEWZevxYfmeGR3ICPEEUkJOnbW
         CuGPO2rAmL0SFPsfhYKn0h/PJMMZnuZDDbzQVsklDpAVDb17Ja4HPGbUKmakNkWHCnKu
         ff7IygsqHzcnn+SgOEaOFLmZE3gkcPtTWUlOlYqeHvutXbh7d2882WGS6rt2+gyzNg6C
         nCeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789686212; x=1790291012;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oYAViEKIR6jmAp5mlWeLAMEKyuMg7x9lqO4x+CGM4FE=;
        b=QoRxY/rzm3qowzxRvsiTiMYf4PPvmOmqTWNDE8ka1X5AU1UB7qftAmlsFUaRF0PltS
         xgcHyPqSy1IFvUy0wwssk1hxbQvtJQWrqTOtamFu7jIyZuNSHyVkyZ8wFxtVt198iTRR
         dx0IVMTRvMyDTokN2t9lbUjNEMlVJ6loXih8Ytmg06/ahi7YoR3rKDAnqdqGtjQ1pHI7
         QT6rxxQ6b6OJ/rOmytRcTOzEKMA+/zf+BgNPnLm/HRsJCdpwt4C8yySsqrBWXa8BExjQ
         01d1kwmkbJdo6oj4ZuteRoa3jQMD/wIh5vpXfXFeOr4FRqlqqftfFHGRFU7dw0iRT3jm
         NTow==
X-Forwarded-Encrypted: i=1; AKwUvBzg5lov/38injqbqlqdBJv6jHAWIGID6mkSWtI+gnJ4jBBDgaQYcg+ZhmXYNJ0RNKWBky3+ByX44u38XlU=@vger.kernel.org
X-Gm-Message-State: AFuF++kUFOr7jGIHdAzwV5HjdcdhvJo0XX4W3lQsLZE7h9kA/VWDTlEz
	gM5GGuVJ1Na4vonVrMKTLrFm5NARSgk2IrBRERTcH5DfCbcdiE7Ph1t2yyPDdoMIVQvHNW91YYG
	Kz1rDAFEAyWtEis/NiU21Yw==
X-Received: from wmbds16.prod.google.com ([2002:a05:600c:6290:b0:49e:78cc:d2b])
 (user=mclapinski job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4695:b0:49c:d019:70c5 with SMTP id 5b1f17b1804b1-49fc55ac96emr5942785e9.0.1789686212281;
 Thu, 17 Sep 2026 16:03:32 -0700 (PDT)
Date: Fri, 18 Sep 2026 01:03:23 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260917230323.3701743-1-mclapinski@google.com>
Subject: [PATCH] PCI/DOE: Poll briefly for a response before sleeping
From: Michal Clapinski <mclapinski@google.com>
To: Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org
Cc: Lukas Wunner <lukas@wunner.de>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
	Ira Weiny <ira.weiny@intel.com>, Dan Williams <dan.j.williams@intel.com>, 
	linux-kernel@vger.kernel.org, Michal Clapinski <mclapinski@google.com>
Content-Type: text/plain; charset="UTF-8"

doe_statemachine_work() waits for a response by sleeping
PCI_DOE_POLL_INTERVAL (PCI_DOE_TIMEOUT / 128) between status reads,
which is 7 ms at HZ=1000 and 4 ms at HZ=250. Exchanges are served from
the device's local mailbox logic and typically complete within tens of
microseconds, so nearly all of that sleep is wasted. Every DOE-capable
endpoint pays it once per supported feature during enumeration.

Poll with usleep_range(20, 50) for the first ~2 ms before falling back
to the jiffies-based wait. On an Intel Emerald Rapids system, time spent
in pci_device_add() for a DOE-capable endpoint drops from 41.8 ms to
14.0 ms.

Signed-off-by: Michal Clapinski <mclapinski@google.com>
---
 drivers/pci/doe.c | 28 +++++++++++++++++++++++-----
 1 file changed, 23 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/doe.c b/drivers/pci/doe.c
index ac95b1d2d999..6dc85133a88e 100644
--- a/drivers/pci/doe.c
+++ b/drivers/pci/doe.c
@@ -27,6 +27,9 @@
 /* Timeout of 1 second from 6.30.2 Operation, PCI Spec r6.0 */
 #define PCI_DOE_TIMEOUT HZ
 #define PCI_DOE_POLL_INTERVAL	(PCI_DOE_TIMEOUT / 128)
+#define PCI_DOE_POLL_FAST_MIN_US	20
+#define PCI_DOE_POLL_FAST_MAX_US	50
+#define PCI_DOE_POLL_FAST_TRIES		40
 
 #define PCI_DOE_FLAG_CANCEL	0
 #define PCI_DOE_FLAG_DEAD	1
@@ -486,7 +489,7 @@ static void doe_statemachine_work(struct work_struct *work)
 	int offset = doe_mb->cap_offset;
 	unsigned long timeout_jiffies;
 	u32 val;
-	int rc;
+	int rc, tries = 0;
 
 	if (test_bit(PCI_DOE_FLAG_DEAD, &doe_mb->flags)) {
 		signal_task_complete(task, -EIO);
@@ -524,10 +527,25 @@ static void doe_statemachine_work(struct work_struct *work)
 			signal_task_abort(task, -EIO);
 			return;
 		}
-		rc = pci_doe_wait(doe_mb, PCI_DOE_POLL_INTERVAL);
-		if (rc) {
-			signal_task_abort(task, rc);
-			return;
+		/*
+		 * Exchanges are served from the device's local mailbox
+		 * logic and usually complete in tens of microseconds, far
+		 * below the jiffies granularity of PCI_DOE_POLL_INTERVAL.
+		 * Poll for up to ~2 ms before falling back to it.
+		 */
+		if (tries++ < PCI_DOE_POLL_FAST_TRIES) {
+			if (test_bit(PCI_DOE_FLAG_CANCEL, &doe_mb->flags)) {
+				signal_task_abort(task, -EIO);
+				return;
+			}
+			usleep_range(PCI_DOE_POLL_FAST_MIN_US,
+				     PCI_DOE_POLL_FAST_MAX_US);
+		} else {
+			rc = pci_doe_wait(doe_mb, PCI_DOE_POLL_INTERVAL);
+			if (rc) {
+				signal_task_abort(task, rc);
+				return;
+			}
 		}
 		goto retry_resp;
 	}
-- 
2.55.0.1082.g2b9226bbc0-goog

