Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793085035;
	b=xQgJJn5GPBtcZhhn5sOgwJ7VP0DthhbEE1QI8+sBTA/w9LBiFTAR16/9SOAoczoZEDVj
	 bbfJDAcUPqLT8zyM/Mg8ueajuFC3EVzNSHvkTirQYdUoY69JBUInky1p6MulIAlcd1HqU
	 nWZsMZxf3ckufq+Haw4mlrah0zNlGKF14mQUvAVY8jO7Y3TE8uRlVO2KlC1jMyUR1SWVg
	 ueKNOIlL1rMD8/rsUPj0qyViGS/50WPlNB2L/aZw2L50vUZtzjE/vJqYWRjduI/CBnG3K
	 PMB3245BG1Lg1Il10KzwzqhbJJLliAy2X2DGy7dha/faYpsXW6Qj/SGov45n7UPaVYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793085035;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=G49yOkjHll/OcWD0zAplg4x1BvQSWYpduHQ9gxRuz20=;
	b=VZPFbSH49WITDYZk+T7sYvv5IjglraUHRCG+EP0yU+5cgaR9ROmSEjTMNh6N+npDP0j5
	 8ZDPapm7YNW6IaYkaBUmLsWn9FSSO9KyPHzH5yJuE39QZIr+QrhvgMqV6fbdhEGZ1Pqzc
	 nmX803i+wwm50xnCeqp+zMaVS52pYNk56Q1THk3e44TJxbjkcrfXY1l7Vib90Oq1aFnrL
	 VXst0RFsZMtFWO1t0bRV/tMeuZB15k3z0mF0SqikBJGZhUtcxn73XnTFPOtn6iXh05ROo
	 +Hjm2Acy5RWb2hc9mB7JtgiLkb1Yy3pCF3vyQiK4090pPooZd33wxWbksH4g86w2llw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="peP6IJm/";
	arc=none smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC823606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 07:10:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC823606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=peP6IJm/
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-89f28c3ac7bso1237808b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 00:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793085034; x=1793689834; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G49yOkjHll/OcWD0zAplg4x1BvQSWYpduHQ9gxRuz20=;
        b=peP6IJm/nau4y6pkCgIupWs11PFiNUnQYajlr00rPZH1G5YNbGP+zhAlc68/Ku2ljK
         an3vLR5F5drIfv4WLeC0Rmqx24JH33kliW/3DxlF+qrTn9VRRxoN7pyNUnjJRxonSPUr
         RG0rAZD5Ie4UzjtLrI9EpkadlI3TqQdbAMNu4rYwbJKBqiJcS4X+QlQYdFLw6jxzbr3l
         V8QlG3PFv+T+wi7xMa3xq9q53wfOJI7HZ1+KOKKZhtECP5TKKANar6oVUSE1uJ0CYuPY
         Xpjv7U0P+w8p6Nmdv+p26XLSlTQzhob+piYLojrKv+tPaFoGuyQt1bm0pPUCDoTLg21/
         ZZ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793085034; x=1793689834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G49yOkjHll/OcWD0zAplg4x1BvQSWYpduHQ9gxRuz20=;
        b=c+8Pl4RPjUfhY+fzG7f8tIYNml/R+TeWYGL/beMEoJK1LCl5V2W1lPfeSln8Pavefk
         CZKhquRblzLNEZXJhWbi4tczBeuYlAXTYZ18wdYk6Oy4CMsthwKlPmhqgs48qtPkB93i
         QVFkEvRE5u2OH72EAb27cW29Mt9qHLNNqD7qga9sctdT02bmUHlj5UmA/bkaD1jvoz1M
         Ov/s0Ag+l2zzT9GweGQsZVKltgYO17Ry0mj5JYYMmwB9Olgb/FCRoP6Dsx7tP0WxIRYq
         +jnBBuTn9370hOgFKpzggxKDaAcy3TNmEtRArEOTFnyxl4ahkEIlLwCjG7NgMIRYQyRS
         AJzQ==
X-Forwarded-Encrypted: i=1; AKwUvByUnAtiul1GDJsa2hD3i9FrynGFMfbgq+8I+FJ1Q78Au3vEqXONLAEJ/guvrwxwD/6lqbm365M+cZhKgGY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKcs6IMkZxOwnR+AhcaZNbbvZbVzCSwx0hvFu9K3SfrgJa0xAHM
	khtAJIZKlGVxg3OKhjRBYdhX0ah+JnUS9GAATGN4DiBqx/vtF4Wo0H9p
X-Gm-Gg: AYBFou0iUwS68RqFSEJLkVZZQHol71LAa/hHAMt1jkkJ7eyY3OHrwCigBBML2+imnSx
	IsT91unEAgQMCffzyDpWo6go3dYs2fnur+6lTsSpABu4FoS/gRZhUJQyffwc3k+hJcrCJ9l9toi
	0/IAdwxSQR2PVOGrtAbHXCUBwygTB21rG8N41GDKKGhnOitftdJkNqHJKJwqGewAD8yjhE9f/Xi
	wGd3QGbABH2436z1K+NQmDlkHunDrvXCVUqLzriMtSmH0qaEOjsaXGCDm1SEK7lKQOPNLSY4ZQQ
	Nr1JmE4i+IujhoOBBrM4xPtqrv5K2iqfp9SLH2gWUsdUTTh15pNZYdC/ySQMfqsDxdwyUhU1Pvc
	N4rF1naRwhJ4UCJn6U5q984f7i/qAMiHK5toBiujaZd+huIA4kB5iU8eN2u1NvHzN0OjaxaH+As
	GkRSa7FImweoVi9z8UjLJ0NlkiT8C1nLvORLqlBAJ70PY+Cnp2NyaSGhrWte7iDejBnU2voA/yy
	2adCsMpKWZjQEeyTXy2XcK4K8zYvVfgAikcZkwM8Fx/oBK8R1by2KnnZjnxXXrsU25MUnsAYOeM
	EZazyLGdXpxAn0cEtg7f1wdr137cEbnNFiZxJOVR6of+ulk=
X-Received: by 2002:a05:6a21:2c15:b0:3e1:d43e:367f with SMTP id adf61e73a8af0-3e7cd5cb5f1mr6607387637.73.1793085033781;
        Tue, 27 Oct 2026 00:10:33 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([185.220.238.37])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ccc21274sm2277512a12.8.2026.10.27.00.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 00:10:32 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: jiangshanlai@gmail.com,
	paulmck@kernel.org,
	josh@joshtriplett.org,
	work@onurozkan.dev,
	frederic@kernel.org,
	neeraj.upadhyay@kernel.org,
	joelagnelf@nvidia.com,
	boqun@kernel.org,
	urezki@gmail.com
Cc: rostedt@goodmis.org,
	mathieu.desnoyers@efficios.com,
	qiang.zhang@linux.dev,
	rcu@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kunwu Chan <kunwu.chan@gmail.com>,
	Kunwu Chan <chentao@kylinos.cn>
Subject: [PATCH v2 03/10] rcu: Record callback registration stack for Tiny RCU
Date: Tue, 27 Oct 2026 15:09:16 +0800
Message-ID: <20261027070923.3054462-4-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261027070923.3054462-1-kunwu.chan@gmail.com>
References: <20261027070923.3054462-1-kunwu.chan@gmail.com>
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

Record the callback registration stack in call_rcu()
for KASAN diagnostics involving Tiny RCU callbacks.

Suggested-by: Zqiang <qiang.zhang@linux.dev>
Signed-off-by: Kunwu Chan <chentao@kylinos.cn>
---
 kernel/rcu/tiny.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/kernel/rcu/tiny.c b/kernel/rcu/tiny.c
index 656b6a682e31..bd22fa43108d 100644
--- a/kernel/rcu/tiny.c
+++ b/kernel/rcu/tiny.c
@@ -12,6 +12,7 @@
 #include <linux/completion.h>
 #include <linux/interrupt.h>
 #include <linux/irq_work.h>
+#include <linux/kasan.h>
 #include <linux/llist.h>
 #include <linux/notifier.h>
 #include <linux/rcupdate_wait.h>
@@ -251,6 +252,9 @@ EXPORT_SYMBOL_GPL(synchronize_rcu);
  */
 void call_rcu(struct rcu_head *head, rcu_callback_t func)
 {
+	/* Record the caller: the irq_work's stack says nothing about it. */
+	kasan_record_aux_stack(head);
+
 	if (should_rcu_defer()) {
 		call_rcu_defer(head, func);
 		return;
-- 
2.43.0

