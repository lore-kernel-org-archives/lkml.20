Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793951220;
	b=cDElZYPHXGtahISj9fbH8QojMTlq20HXyVk2F/MTUnVKStUBRJXRw+pzefvJE2nxMUrU
	 k4R0Qz0Ud1spTK61iqrqETqzUd83ksBWCgBMep+2+DPqY91U/apPh/UyeAGj69YWLzSwu
	 SMKXWGzlhQxtyKmt8NyPvt1M/P5SNvumaPJBlaGusP33EtDg/eUhpndHGvQiJYaAKTnFV
	 R7jIVUmZyi2mhksNy1T54wkLa5gfEbTDUcUK4yM9UWHP6JkCa6j5Uac2KxIGK/b00kL9y
	 DunhmAmt8SPGrH1ErQ/qiDjlaibHmn+zx2clSDkESja7FvYvtSBEQJ7JIKR8vE7IurQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793951220;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CuJmOzkn/aajdKzupwKXYaLbxRN7lmDJXXx5kcYCJHM=;
	b=kfDnJoIJWFMVHu7EzsWCe8usZOvr8i3nW3vzc2aZUn7ocpVsLinfL8ePdk4+HI4+zdaV
	 r1JwDcyakpLayP5ItFZ29sLaREV6HlRKUwJp14UC3HYkivFntgKKHnCBNnk7Cm0zzKaAK
	 n1r4n4qwEx8CDFKxQ48FaBi7VP3MZWKCxau2hdrlmsdvj36ojhRyCrAZaW4F+xwANF633
	 WCjxqSQLnyaK7+jKIFeQxq9VcBy726uRdtJFB+tvJEybVyANKfbwQ1SdFkS1exsmvXElX
	 KEeOllVnOjQBKUTV3M+xFvJQ4loIho5Ft1T64qX0N88eqEt/WEyCZGw90uxNgu0eG4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x6WIGICk;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716B6606A332
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 07:47:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 716B6606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x6WIGICk
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1a2761c69fbso929297c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 23:47:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793951219; x=1794556019; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CuJmOzkn/aajdKzupwKXYaLbxRN7lmDJXXx5kcYCJHM=;
        b=x6WIGICkrsqiieFicNlGJmFPW4aEQNGk69o+2wmMufM0fNx2hU9/SpfVwQZ/ggkb4E
         lFAGbZjwWyP57KOsh7SN8BNeBSOENVOg5RRoFIWaG3Z+KPxOAHsvi+m42Ts3lwL26oZc
         RjNooBOyLI8fXnb2xCXfKoqHM9GKC+sN+zXjSZ+UVOWIhtyhooABhiW1WdQJ8qxQZT4y
         AV4Fyndf3PSvS8AlJ+xRP9mrLOCCpW0+SX7Ou/xXevWzxSm9dDG7FUvEExEMe7YrbnZT
         6Pqq6TL80tS2mVsWLrNOZWe4RyGY0AeZvP6jKzBlP1ieoS0pVX0NigOhILu5ij0Y5ZVn
         ky8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793951219; x=1794556019;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CuJmOzkn/aajdKzupwKXYaLbxRN7lmDJXXx5kcYCJHM=;
        b=TimgNvnmnEBL7TXtZ+E78aYjaKFFNuK4iZ58MURM/Pcls0bhynrr602uKztoJlwFCz
         2K60f7pFS+RpoAy1zFCh1PjeSQD6XxoCfXbVqZ4m+VI0F2GUNkwJ9AuYX2qM8DTzxI6G
         khxxB72oxI1IusyQp2pOkOjwfB3g4/rPprRLrC8nuWsk1eANJ1cetcJNg1T11ErWdnhA
         P2fIIBgXgw5nlcXu4gDt2FCB7m/lmcgK0oZAqzK24urii9V1EzDsCg0NWaTS2a1FJoPD
         GuGeo5GnLEGyTpKi+43S7E9uDHsuRPUI0MPhUOBQVwaDkMDZEy7whaEkQ+L6zn7UBsiT
         Lc6g==
X-Forwarded-Encrypted: i=1; AKwUvBxWeHtRCCza9++aUXMILZZX1vIyAKb96jRXitDUWF4ijJVLaWZbVxRW6rE5kvcXRhwNSsxb9KwEin192sM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9MvYOkGbgtp0nWznBcluZGzoybhABp3hQxvbkEBDMKb/04RKsx
	7uRVLcQTyE6JXnrDSU9jJXPe2ZsQCo6zlvmgqZKpQj1YMR87Je9PnRMY
X-Gm-Gg: AYBFou0uIQ1PDO7QC6HeSwxZT6pdBEUBRllA7jGzo5Lmu0xea8Lf9uj10sXUWXBFy2D
	qpBIVO1wzp8ezkvNJPgTUiRhykh6VRKzSLqIuWTeQDFilmf8obfqUZ4l8CgmdmCTNHEjDvstr+/
	gHtyaXDkcIHgSW2LtMpSP4tPmZirF3xHlSAZ3q5earNa3nEezvV7YGcKegJ9yMh9ldpZADUnX9r
	3in+HQeRkmx4ClNFuqoqSbXNCM7IymBM0pHgkqBbKBSTeGu2va9F42HdHC3RiG3uAMUSFVE7i6k
	3r5VQF0kOiniS59HtyrwBBFCBLB2lyrpcX8sJr8e7le8OoudIzd/zmZUMdXDRuSRskh9mQDjHIE
	9bqM8UbZRpJ4KCsCvoRHbY2FF35oVInauF0M1G9HbMpJdhLG9bYMFKdvp9CvU9uBlQOZFK8ZEfC
	utm7xvCtF+nXqIR5fpX04PtGAB1MRhKkSh5WUx62KcKy2ZgIYXmSK6E//PeS3Mjl0LLE1jgD1fP
	W4P5tmzSXS1WHvlTWQWHF/FIgTFLtiqxVjKdc2dT3pArarBAm/Iwn7oAy+7L3GAjtlMQkIzCEq/
	VvLAVjtfthmifvsCDUIQoncg+IdBDApmM0LDlW9j5ccl0kQmzo3E9tw7eQM=
X-Received: by 2002:a05:7023:a86:b0:144:c127:dd1b with SMTP id a92af1059eb24-1b25d36f504mr2959762c88.39.1793951219227;
        Thu, 05 Nov 2026 23:46:59 -0800 (PST)
Received: from homik.search.charter.net ([2603:8002:ad40:56f0:d023:a7eb:667a:a3c5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4a610fsm3040853c88.11.2026.11.05.23.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 23:46:58 -0800 (PST)
From: Mariia Nikitash <nikitash.mariiaw@gmail.com>
To: hverkuil@kernel.org,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	kees@kernel.org,
	justinstitt@google.com,
	morbo@google.com,
	Mariia Nikitash <nikitash.mariiaw@gmail.com>
Subject: [PATCH] media: radio: Replace strlcat() with seq_buf in TEA drivers
Date: Thu,  5 Nov 2026 23:46:39 -0800
Message-ID: <20261106074639.452630-1-nikitash.mariiaw@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In preparation for removing the deprecated strlcat() API[1],
replace the strscpy() and strlcat() calls used to construct
V4L2 card names in the TEA5777 and TEA575x radio drivers.

seq_buf tracks the current write position and remaining capacity
across appends, avoiding repeated scans of the destination buffer.
This preserves the resulting strings, including truncation behavior.

Link: https://github.com/KSPP/linux/issues/370 [1]
Signed-off-by: Mariia Nikitash <nikitash.mariiaw@gmail.com>
---
 drivers/media/radio/radio-tea5777.c | 10 ++++++++--
 drivers/media/radio/tea575x.c       | 10 ++++++++--
 2 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/media/radio/radio-tea5777.c b/drivers/media/radio/radio-tea5777.c
index fb9de7bbcd19..2b1c7f6ddd60 100644
--- a/drivers/media/radio/radio-tea5777.c
+++ b/drivers/media/radio/radio-tea5777.c
@@ -13,6 +13,7 @@
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/sched.h>
+#include <linux/seq_buf.h>
 #include <linux/slab.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-dev.h>
@@ -255,10 +256,15 @@ static int vidioc_querycap(struct file *file, void  *priv,
 					struct v4l2_capability *v)
 {
 	struct radio_tea5777 *tea = video_drvdata(file);
+	struct seq_buf s;
 
 	strscpy(v->driver, tea->v4l2_dev->name, sizeof(v->driver));
-	strscpy(v->card, tea->card, sizeof(v->card));
-	strlcat(v->card, " TEA5777", sizeof(v->card));
+
+	seq_buf_init(&s, (char *)v->card, sizeof(v->card));
+	seq_buf_puts(&s, (const char *)tea->card);
+	seq_buf_puts(&s, " TEA5777");
+	seq_buf_terminate(&s);
+
 	strscpy(v->bus_info, tea->bus_info, sizeof(v->bus_info));
 	return 0;
 }
diff --git a/drivers/media/radio/tea575x.c b/drivers/media/radio/tea575x.c
index c37315226c42..e49228eb7c46 100644
--- a/drivers/media/radio/tea575x.c
+++ b/drivers/media/radio/tea575x.c
@@ -9,6 +9,7 @@
 #include <linux/module.h>
 #include <linux/init.h>
 #include <linux/slab.h>
+#include <linux/seq_buf.h>
 #include <linux/sched.h>
 #include <asm/io.h>
 #include <media/v4l2-device.h>
@@ -221,10 +222,15 @@ static int vidioc_querycap(struct file *file, void  *priv,
 					struct v4l2_capability *v)
 {
 	struct snd_tea575x *tea = video_drvdata(file);
+	struct seq_buf s;
 
 	strscpy(v->driver, tea->v4l2_dev->name, sizeof(v->driver));
-	strscpy(v->card, tea->card, sizeof(v->card));
-	strlcat(v->card, tea->tea5759 ? " TEA5759" : " TEA5757", sizeof(v->card));
+
+	seq_buf_init(&s, (char *)v->card, sizeof(v->card));
+	seq_buf_puts(&s, (const char *)tea->card);
+	seq_buf_puts(&s, tea->tea5759 ? " TEA5759" : " TEA5757");
+	seq_buf_terminate(&s);
+
 	strscpy(v->bus_info, tea->bus_info, sizeof(v->bus_info));
 	return 0;
 }
-- 
2.43.0

