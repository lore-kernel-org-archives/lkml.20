Received: from mail-pj2-f41.google.com (mail-pj2-f41.google.com [74.125.227.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E9C547063
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 20:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790542023; cv=none; b=i8tTx1AGgcZxhULtc+mLdt7SvNdR1dgMcNXOkLYICtNKwLNyyAwNWMzO7VVNz8ky7zO0QqlKWUJJYSxJL2fOb3V5h1nnnClp8Jv5Tkyi4SW+hpZSe/kT4U+Iu/R+j5vMddp7yokbpNzSLcsbXRuWQbny5iNd1/hNzVMv7Zed65o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790542023; c=relaxed/simple;
	bh=hkxpKe0SXBxESz4zdGObY/hj9vh8GKNungvJ0a2BW+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mBCiJdYQvUOjbOuc1XFUAcCYFa1dC9ohk4UeC7/P9rgmJV8qby7me6npyJ6rhAd/5vTHNRcjMrXGiZRbhm3BoWYBMMLJnO48sgjzAiT38Fj4FNHo74SfbTebL7VETiofqIGj4EkcUcYKXGzVe5skSvv9s0zOLNQ8ZwWberCzFDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FOe0L0++; arc=none smtp.client-ip=74.125.227.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FOe0L0++"
Received: by mail-pj2-f41.google.com with SMTP id d9443c01a7336-2df8bb777e4so7750355ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 13:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790542021; x=1791146821; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ryZRJZuTPWZfnBV/TlZKfTdjR8/6L8XQUKUndimBZns=;
        b=FOe0L0++rFmU7kT3UnUN5GfLVxoaynbod9v9oVo6cErDMQmZQs/wVwaV5IfReW6K3c
         Ioj5Epau7CmU8tjxSPw8h574S3XLM0s5zICJFRyA1WLnvww3CVFvlsnhuqJuH342f/Gc
         n413KbCnigfGmJOhVn660UIDwIcFmqSnk1Q9JOYwifX8qCpCnzuhvOQkAuxnbXrzzBZx
         sHhn1MR67OVJr6d2lgDwB85i9pv9E4EBhJGr3835SZYSbNXTU01RNW8Xer9VG57Qs3UK
         7nS3TSAJsCIMNPQj2BY+wdf6QCgaWI3YKzwUF4ihnXayov+UBcGpgwluLUy9hOxgzkj4
         O14Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790542021; x=1791146821;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ryZRJZuTPWZfnBV/TlZKfTdjR8/6L8XQUKUndimBZns=;
        b=BoVrMTRgWHr27U/tAveIAho0wl08XtSF788KKOgAvMCKujuDoSI/AgpPY2cSK3B9LP
         t5Xl9beQwMxThXrwQlxKjVidkT6+ZIAFIbBHAFiS+CBPetmEcq9r8RH2zV+Q/ZdKxE7b
         9NKjlvNfE+xJiYOrkbnhp/AXU+OLupxGo+IzhODiKGxgureO9oBgsvg/GU/tkkuvs6Hb
         A0OT3f/wvOxJoeTVcMQmy2WjpgiAes/T0qkb1jiwQ326zTqNJz6K88oqO6E4d4uWdXXz
         oVuaEBHzfIJKTNR6jpIXjhJMr0FZWSD+jGAfCymIEQ0tnCSABfxIOUPebuxKTJla2lbo
         DKMQ==
X-Forwarded-Encrypted: i=1; AKwUvBye4w1UJfY+aG+wz7MVJ8RTIRMy/fKkCL9MoAGpsE6mP/AlvWoQOMMW6BDD5OaN2SQOjcCAubw0NApvWjs=@vger.kernel.org
X-Gm-Message-State: AFq9FYIt+6H0udYmI30HjFQoIwSDKzAycauFDQVwu0V4bRq0LWeAfeQD
	CbPPsktK2hAXyYnF2CTu5oc284h0Wg2mfeX6JEQlxHVlWzrwJDI/MtKE
X-Gm-Gg: AYBFou24vk/d0ScXvVu4bTBjGeBQO3KOU0D1R22C4yZq1RoDcby2704ta76f7E5Wr5Z
	8aHz+vQxn7QFjfT/XyYn5PAKC4wmXu2qF1qcBwqMBB3VcM+4VK3eSHMISSKuvWnnbNtCnbLDrQ/
	cGAOACPsJ5iNYm9mdDd7AJGUHfYF6lrfC9H4KaRDGOST6dl1zbATccsDzBGun5ojOW4ajquTexD
	3fWmQ1xI4TL21vLsX4XxFhMgOHWUQTulwONC99HX7GSZ/mrQ2M6WDZFWoXLXHs9CXgc3Sh6rVL7
	CpTR8yZaVr2tV2rTR6kTP3WNZcCvZatVSp5fe5DLV5Z2z8J2M9w1C9IDCN/4TBkDJiIUpaF7eGc
	dCbzLu4XUCw5PcqmfzJcqv9hh/DNaRTAN5Xh3yOv706OXvkp0Fr/lV3khYbbH6DDEsMSkNAzLEK
	CJJvbr9L/vGHxq94Rq7l9Fhz1YkWOr/1jI4DRJNus5g7JsOEqn+pize2Xal76A6WGjiwCelcPLZ
	/KNcLbtJk6nQi+LkZaNljJxVjs4z4bMwcVnp6R5rfMf8mi3slT2MCai7ctJP4AZLAEbH/mY+LyW
	vQfQk1M7iZY41ysNgjYdunkdgASbU6Tkayo5Agi6awwA7mEC
X-Received: by 2002:a17:903:1aa7:b0:2dd:ad74:6d1d with SMTP id d9443c01a7336-2df7daacbdfmr95981625ad.26.1790542021386;
        Sun, 27 Sep 2026 13:47:01 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df91443823sm31303465ad.57.2026.09.27.13.46.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 13:47:00 -0700 (PDT)
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
Subject: [PATCH v2] serial: hvc: use modern IRQ acquisition API
Date: Sun, 27 Sep 2026 13:46:58 -0700
Message-ID: <20260927204658.24338-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
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
2.55.0

