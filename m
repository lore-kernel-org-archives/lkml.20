Received: from mail-qk2-f37.google.com (mail-qk2-f37.google.com [74.125.230.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB257238166
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 21:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791063115; cv=none; b=ObBcy7OSzJNYW+hfU/hgeiqDpuJSCprpb5V+1lzqvq9Cygbhgc1fdSNPNPfh2N7VXYVnp28KEAi0S0p338fDG75amN5S7oCghsk9syqLen+N5Tma/2DxT0NZPTK4+yB4O25RKbnaJxDBKaHCW7vsIH73CduW7dwOccgaCY5X72Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791063115; c=relaxed/simple;
	bh=3IGIouzNerHBwDt2XZKFq7EhkZ7ohljzRYzr3vY2Skg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cHU7hEqhA6RdtNtYl8ZYFQ90RjB/G8p4FcDfBrTN9YWLmr0528Rajc1gqMv93CnDVfE2ubS25CnW+aAA3y3dKYLByyBv12MAbVf03YTKBvOc23pIx2FZVj5JKQToAZ1ByXjINoULhwOcgwvQfAQDJnJgTX16dpm8qlQCuomQ47c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cO1qEDJF; arc=none smtp.client-ip=74.125.230.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cO1qEDJF"
Received: by mail-qk2-f37.google.com with SMTP id af79cd13be357-93d9310b207so50963785a.0
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 14:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791063112; x=1791667912; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EF7nOMoHU/lXOBcLECCEmjeD1XvCzGTt0zKSXYTVC24=;
        b=cO1qEDJFBTZ8RbLpwOuMh1JIxExF3V/qbsYRFXR2/n08qpclkWkRrTLPcxGWazDYz0
         lmPavltJ24kckZOQvfDpvpFbw3jJTZ3IjYRBmPwuB/f6hn2yTvMLARJt0EJ+Ni2Hts3E
         ZoiLepzyGXD4wxrNtG1Stqh/FqwAiIe4Ed5JKqNDkSMmN+2tfRLqyk8vY/sdlC0kXz63
         qN6mFCSQsjbxgWUnjJV4QIxEtqK/QnmdohT56jgA2b+rZUN0Mu64VAS30YKWh+aBD2JO
         uVlZ4VRsxumD8LPedX3+ZOeoZxkMGvHcYVZ8GYMAD5RAwYEDGAZzaOhePQSyizuDLnIq
         KyKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791063112; x=1791667912;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EF7nOMoHU/lXOBcLECCEmjeD1XvCzGTt0zKSXYTVC24=;
        b=f04MrVle25nUTHf2YiiRHVrZ7tCham4kEbMg4sLd3HPUruhEIxN4qj9HzUuILvUy3+
         g49R0+HVon4hriVvC+1XvH5dZyHrqig7Z4/LzEL+etYdjKAYkuNaziwaLbJYO557s/lN
         2y2b+/VfO+6CcaXbBeGVRm4yCivHBQJQlkBJoI5Yvf7zQfDv3VjgOVjonwX5s892uhVH
         AsPMZM/ktdt/B3JX+IcKfI5W3xthpuiGDyOhondzGYl2BhY5O6WNw9FRM+jUFl52sIfq
         gYNtJmtnFZJbAwvLuToBGfNVqinjHmMMLED3CGH8AIEqAKogtB3Ar6GAVTKOM4DZsRdC
         k4HQ==
X-Forwarded-Encrypted: i=1; AKwUvBwMy9ASHoNVls9rKtq3H9HIUmfIdraa5snEQD8rpUpBilkkbchQzjZha+1G0BYyofksI+MrL2VFDS1McTA=@vger.kernel.org
X-Gm-Message-State: AFuF++mF1ZsmcCUtpx5k7RcV06fKB2IH7sqJidX+SYviHr8sN2KS5H30
	YT/wC8kyCTSQ7ABeZSa4IZbAaAn9N0QKWMt9QStoI0UmB91O7lp/lTDf
X-Gm-Gg: AYBFou2d9Kkrk8oQ1AR0rtrBWW/mHlmZAca6ndKgeFqQUrEdpzaIjkvLOlFz/pDlBEG
	1JvuTTzlTMLaxEmMctSwZctSxaBMmUxKFpdBGfVfNdtJm2d/tTrh6M3mJzSlPBvH/C2B9hNdbqd
	xV3h/NyOvArFNzHG3EhVCh4J3EQ0ybb2DWvKKipXEBA+99qKpSda/qXcXL40iCEDi2mIa2xqoNg
	jozT9qBY4lhF3qEKgUbKb1+fp2TaPxOuAtL3v6HfYQ03R0McB3Gt3od6I91wr9z9OQy83ykRt4Q
	YHFA8Cqc6ZiRpgcSBKlbIXNyGf1IT5apbKHdn1UzGBgMRtLCI5j+NSDJn1UFE1jVRlbPmMlTZsx
	hN+ljLt0FoYMJb9tyJCw/+BQ/2FURipGEJOhW6pFSWVW50fb7UO3Q1w0PYmzk1Ev9tfKnewT4Dn
	sXluhGiExc+Lcjj6OgYvnE3hgmz5nV3aw9LnA6QVVejp53CIlsN+sjbj/5ZwVpPzlAoL1Emkdq/
	jD2PD+07SS9m3bBR4aXiVJk0DKboVQLzItFQOHkf9M71UpfncaZg/h9rsCcm/XGxGmFo9huIU44
	+73qUwd5ahd2pZvao3eTZyAFLAwBlcv7vC5zP7WoMWdiHkVS
X-Received: by 2002:a05:620a:6190:b0:93b:f402:a204 with SMTP id af79cd13be357-93cf1787c37mr1300849285a.51.1791063112470;
        Sat, 03 Oct 2026 14:31:52 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93cca2c96f4sm526896985a.43.2026.10.03.14.31.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 14:31:52 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-serial@vger.kernel.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	linuxppc-dev@lists.ozlabs.org (open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)),
	linux-kernel@vger.kernel.org (open list:TTY LAYER AND SERIAL DRIVERS)
Subject: [PATCH v3] serial: hvc: use modern IRQ acquisition API
Date: Sat,  3 Oct 2026 14:31:48 -0700
Message-ID: <20261003213148.137206-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use platform_get_irq_optional() to be able to handle potential
-EPROBE_DEFER and other errors. Move it earlier to avoid having to call
kfree() on the global array.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v3: resend.
 v2: move call earlier to avoid failure to reprobe.
 drivers/tty/hvc/hvc_opal.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/hvc/hvc_opal.c b/drivers/tty/hvc/hvc_opal.c
index 402da9e7c534..fb9a566ca213 100644
--- a/drivers/tty/hvc/hvc_opal.c
+++ b/drivers/tty/hvc/hvc_opal.c
@@ -13,7 +13,6 @@
 #include <linux/slab.h>
 #include <linux/console.h>
 #include <linux/of.h>
-#include <linux/of_irq.h>
 #include <linux/platform_device.h>
 #include <linux/export.h>
 #include <linux/interrupt.h>
@@ -157,8 +156,9 @@ static int hvc_opal_probe(struct platform_device *dev)
 	struct hvc_struct *hp;
 	struct hvc_opal_priv *pv;
 	hv_protocol_t proto;
-	unsigned int termno, irq, boot = 0;
+	unsigned int termno, boot = 0;
 	const __be32 *reg;
+	int irq;
 
 	if (of_device_is_compatible(dev->dev.of_node, "ibm,opal-console-raw")) {
 		proto = HV_PROTOCOL_RAW;
@@ -176,6 +176,10 @@ static int hvc_opal_probe(struct platform_device *dev)
 	reg = of_get_property(dev->dev.of_node, "reg", NULL);
 	termno = reg ? be32_to_cpup(reg) : 0;
 
+	irq = platform_get_irq_optional(dev, 0);
+	if (irq == -EPROBE_DEFER)
+		return irq;
+
 	/* Is it our boot one ? */
 	if (hvc_opal_privs[termno] == &hvc_opal_boot_priv) {
 		pv = hvc_opal_privs[termno];
@@ -209,8 +213,7 @@ static int hvc_opal_probe(struct platform_device *dev)
 		dev->dev.of_node,
 		boot ? " (boot console)" : "");
 
-	irq = irq_of_parse_and_map(dev->dev.of_node, 0);
-	if (!irq) {
+	if (irq < 0) {
 		pr_info("hvc%d: No interrupts property, using OPAL event\n",
 				termno);
 		irq = opal_event_request(ilog2(OPAL_EVENT_CONSOLE_INPUT));
-- 
2.56.0

