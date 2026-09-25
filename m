Received: from mail-oo2-f41.google.com (mail-oo2-f41.google.com [74.125.231.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0A33B47D2
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 18:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790362217; cv=none; b=hfGxGbOxdtlr8wm+WlsMrDJrwczRP2CWSXOH6CGc7pGqrL2Isv9HXleoiwAMGGBYDoc2euZAf2DultCDfBrnvtX8f/nBUAGYhZ29ZtuZv1Kq7Ak2vE/IlXUyy43Jb/0Yk/e1FS/jybj4j9XBxyZUmVncF/iFFwiZ3ELfMycaYns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790362217; c=relaxed/simple;
	bh=1CkZI619eGDXJdnc0U7GJAVRdXtkFYT7XHWfh10YLww=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lBCO0Ox10PIe+dctjy+DJwF6I/13/l2ma7LShTMBgMLhuP4t8VBipdYTCq0jMHoJGcHxNxmBUdOopjHOs9Kd8r3PA0VW2dI1tjplleQ4qE9zVQPoivZmJ+wCWsIB0w0CfFIdtP6eTySsXmALQFSLI2bLUSsByogOMI9gYD4QsFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rerNL4mk; arc=none smtp.client-ip=74.125.231.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rerNL4mk"
Received: by mail-oo2-f41.google.com with SMTP id 006d021491bc7-6b1ae6b1b26so653594eaf.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 11:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790362214; x=1790967014; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=isylCd+SEsmLJzgVMJ967rAHOM7cwy6tX3oI9l3rtxI=;
        b=rerNL4mkQdXjWHEhP5k8jF4AU36k1u1xvKutVyWS187/b0Bs9bN2llRlD10Cu6GdWM
         0VYLLwaBAlvQzYKIr7RDXotr4tLw2kyuOW5rUAF9BRtP+9yf2jnxKTi9bYCYf+pkc9vd
         de8kJxZbhyVIdXdGO1hXXzzQ9doLv2P0GsNpojg6nbxv5Y1mjuIBmpo6WpCj0KtHg64S
         ONoMxMHWwV7D7ZIq/gKMtjwoWgNMSt7J+tOt9PmbrusJNOooALlzKLEx9x4ez59/HSFE
         yC7CFm4jJPr7TsTkSjeonSwz2Ie+gxEiO23cT5CCStjQdu0bF9JXQ+h8yuZ1QAd4fZjq
         GE+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790362214; x=1790967014;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=isylCd+SEsmLJzgVMJ967rAHOM7cwy6tX3oI9l3rtxI=;
        b=yJRCy6TlkHAPSyiAZjP1mu3YQHMp1Xz0QfAzG5+zh+vR29bmg6vXO+EAIGqt0FuUv3
         zXtn7jJV/OSt6C7exN+IkRjyrLTBY/yS/Y0SF59D+7lVAF/DtZuHSN28Oj4UcEL4W+Q9
         0RH3BVAU97/wdUmvxCpWT9TMOD7srbuR1LM3Q/TZpyAiqWCarc3JUQbFFp6PkgqzJVD4
         wRVPhaje4Q++JbtA1QcXN2jD6oNMtWuslLtPzkppCUuW5uVVqfJ/myyNil4qp78uQ0YB
         NbZDV+t5vUi5xH8QMDKsEqg63sBnQ0BpkNqambZ/MNk6A/eKg0DUabFfb1Xk7kKcWyLF
         zSvw==
X-Forwarded-Encrypted: i=1; AKwUvBwU+w7jba4RhZhmje9UMG13G/CPfoC6WxRqq/XYRS1oZxWOhask3F9dqQ1SgEsWrnxiQKbQXV20/+VKkoI=@vger.kernel.org
X-Gm-Message-State: AFuF++mvJWgaeNNYUDgqT7CJMi60tUSORAqp/K6W3xM+iHHDjfxJWOub
	rDMLDjiA8wlz78bg95SV8lNDdZNQnxIug31cEyt7bwdVOpZ5GF94epgz
X-Gm-Gg: AYBFou1c2Iz58eyC29zZTRDLtZwmYnCRgTC5CGf8U1Iize+Z49KEM6J+NLQTO7uikOt
	CB0/1ePvbS3NIqKx0u3NPrWEHq1lN39HjMUC+DAuj7PS0e0J41JKyw/BcqT2F7FF1JvG/lwQplx
	TlbW6Yezo5w4cdZ0n6NN3gJBcacc1JeqlxK3elpaZ0LX9S5E/9GsDmxpB8W1WhN/az44fM5SCQe
	Us+cxpGawzQFEoveDmpH9Pk1HFCQk28co3sfP/zMGbbNm3NpqGeJDZNLbf62PBcK7p+h8wnK3vN
	ZljyR7UIvSSMGwzzOdLeoDErg6CGNBN6b7vF+Sm/FRGtgzAPH4Q5Bg8wJE5KRsV43qR+rL7Hx3K
	5B1BPeXoH2xWx6/nZUrCkw6hF5XfTJR2jB3f3PRxZhXgTWs8QRp6NCqnWmUxKs3+CnWJBJsa6bW
	ZdlrAsQ8/zbmUIKnCJi9AFV2/oXusH+tC1eWccdWZ0xcs1M55ABXq+CBh9kTNUHdKjkpS7W+iw6
	EV4KIVN3mre/tCyuwTSaCWiId3IetsazGH+tze1J+snO2Ar7caKBs4Xpp1Yn709bP4qg588bsyt
	h8AFCtuNb1iAUy5vER9aM04aP8EJlgvs1BuvlF+C/JBGmELw
X-Received: by 2002:a05:6820:1c8d:b0:6c2:396e:b991 with SMTP id 006d021491bc7-6d44053a4a1mr6522021eaf.61.1790362214384;
        Fri, 25 Sep 2026 11:50:14 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-49347da3079sm2555780fac.14.2026.09.25.11.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 11:50:13 -0700 (PDT)
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
Subject: [PATCH] serial: hvc: use modern IRQ acquisition API
Date: Fri, 25 Sep 2026 11:50:11 -0700
Message-ID: <20260925185011.61259-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use platform_get_irq_optional() to be able to handle potential
-EPROBE_DEFER and other errors.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/tty/hvc/hvc_opal.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/hvc/hvc_opal.c b/drivers/tty/hvc/hvc_opal.c
index 402da9e7c534..ce726b8b5ab0 100644
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
@@ -209,8 +209,10 @@ static int hvc_opal_probe(struct platform_device *dev)
 		dev->dev.of_node,
 		boot ? " (boot console)" : "");
 
-	irq = irq_of_parse_and_map(dev->dev.of_node, 0);
-	if (!irq) {
+	irq = platform_get_irq_optional(dev, 0);
+	if (irq == -EPROBE_DEFER)
+		return irq;
+	if (irq < 0) {
 		pr_info("hvc%d: No interrupts property, using OPAL event\n",
 				termno);
 		irq = opal_event_request(ilog2(OPAL_EVENT_CONSOLE_INPUT));
-- 
2.55.0

