Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792750760;
	b=OLSgKfPbypg49bIasfdhlpAhCtQsTva44g+HyqnFtiBofmPo/Wf2PoCE9c5AAzteWh5e
	 Ga/ZCoD5KLq0cEz7t1RfWuEPcYOqkbBA7sXkJjeQ4d/V1Vj3sK+XtPnYIeMZSzLvK1O97
	 pIuvTJqmPsGkDkfu0MBPsSOJWTwTqQ7OaYXx7g5jteSaLQB5ocRvePWCodQ5t6q6PcuJ+
	 ZgDQWOkBt3hZOUejEgxU3t5StNIoQDu/uExk3lZhDe/FBH00xEifJh8z8mU/AU/4Dkqxb
	 gEI/hIg7yyuRb7K8YNfB3pb4L/Fdsk1/gB10XCBKQMJGl0/2pZgQ6T1RDYGjraIfjdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792750760;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=G49yOkjHll/OcWD0zAplg4x1BvQSWYpduHQ9gxRuz20=;
	b=Q11P7OzHAinmOEgOlzVwKh4YHYLArMaZe40VxIYiDjGVC92VSl/YLZStr0pdDas2gkKi
	 TY6i1vbw5mGUAkfXxEcJLxvVAkbAugR69EMSpGo3tD57Bv1LFsDKvgepFh9VwL7Kle80n
	 WMFz0XAlVBJk9/duiVRMFINHO3OpqnVIkpCZeGLVhALqu2efnrU7O8k7nzxAUkbcZPte5
	 zIGRIgFd4uDAIq09jYZsdZW2F6SP3h56ucDnnA7AqWfBNR2ptjd72PnjeShfrotINefie
	 K2vx0klas8y6a+nfvGMDNHnmxii4F7klDkf8hnxl4s3pM8FG7bak1MUx/1KXg1hJpSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GxKTl4Ni;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E12606A327
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:19:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34E12606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GxKTl4Ni
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso559530eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 03:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792750759; x=1793355559; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G49yOkjHll/OcWD0zAplg4x1BvQSWYpduHQ9gxRuz20=;
        b=GxKTl4NiT5VlWes1To8m5EiuGCyixml5Z/nlkvjLC43aUCUXu/l6mOr+/egw/Hzr/i
         +O0sLThydVEm2IX9WV1Zk+P0p/R6ZOaeL8vLuKl481/iDg40pvCNctwa3DlzcsYGQ51T
         z3tv/sQlJ+WPkfp8Gw81C7bXGP3fRj5ryNVhp3C7cLEkTsAnjYwbazJ4biDs1ZxqoyMe
         bwuc3kU39/UgkQ6ULOSbcg4sgZbO9MQ9iRsc2k76DPPsvWAsLtoB1/YYK6h1PjFhMlzT
         rtuC3gpbXlHKy3cy575X1UfM5Zk3Nrp9zxZJZ0piYKr75Ws78HpP6fToZ0kpcfEEGHQh
         uNPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792750759; x=1793355559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G49yOkjHll/OcWD0zAplg4x1BvQSWYpduHQ9gxRuz20=;
        b=MVZixPuvw18JV2RjLVxWOeIyCk1ozdzb+scZwsvEYwlnn1i2ji7trQjBvFKiRgCsKt
         2IYFF59edzyyijQkNO3Ct5oXfOpLwHvgDzr22ma7LH79oZkC0WiPbGr5+bahigQWpwpJ
         Y0n5i+Z1nbMXwawZjBLQBvviyyJNyixnIUyCg09zG9/k8SDGcbM/C5H3BzMOMKmdXGlZ
         rIS/bgBPk2g4l/F+0Vf3CDoXY5cp/zWx8NsxAxXsWfkTfM3OO3CbiSK293aJZUf5FROh
         ABD29Uw4YQ/h8u22iZGBK3CSGwzlneNrTytXwfjYt9I5DS4op6jWTtkOphFMcEfwN/pl
         fKzg==
X-Forwarded-Encrypted: i=1; AKwUvByQXu5Fi+V52Kw1YHw4BhIHXkBbpREtFjoA2KTUNA2cVOwho7cAcpIGg09k7ANJBCZ5STr94wIHPqwwBkY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJBPWDIjULOB27srmMDsYGtL5e8pNusbmIsR+IVeIkALmYlWP8t
	/pe5HP1BNp0qRh6uA1XDeb2ToNvCsvQTXsuUNVFQ8JHnidcGDYqfkfL3
X-Gm-Gg: AYBFou1vjdupw/B2aC+Dizy1bYdefYYXMsxsPmWRVHkrogIiwA0ZwPt5bRZzWzQnWBK
	eOCJlt01dR6vlP9EjCHraLhShipWhZR1b/s64udn/0fEESCJ32LocgZRUKJV3m7ONI8ucfCzXpV
	vfpTbeaDZ26Cv2m30siBhZjOi8nBjQbbk5HD/8iGush37N51ZI6+AzgwvEzKl03bSYT87IAzcFC
	S+yoCO4SsoYkSs9QtRHVEQPn5ixNhGv/1cmH6ZQPG7uFghabpsGMzIvPMs/TFVliRVigKqfh7r9
	Sn+wuV6V54gil67pUaxw4QzBAZOZPnhkOu7FiCCX1+1Dbi55JN1rxuGKl1dA1g7ETxg0yjp/K1D
	lVyoWcoulpmqoaFdwbZHe+SkGtSZf/5CyFz66iyVO2tRYMJFZ5aNu6DEXpRt2wO0vN9J6zlSawf
	XeIDiqOKxrCczbB7WCueojWIBdRlJs5aCTUQCveSh8fHoM6wdLmD+Q4dioip83AsJKcYL+lzt8I
	XnpbpYEe7kD6VBLlQzF3W5mDdV0ZWM0W4DWrkKNjm0q1fhtc0F7H4lP3OjIALhUOb4bioExvw==
X-Received: by 2002:a05:693c:4195:20b0:35b:9f06:e383 with SMTP id 5a478bee46e88-369d971f26dmr2682188eec.8.1792750759159;
        Fri, 23 Oct 2026 03:19:19 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([185.220.238.37])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369d9deef9bsm5852176eec.22.2026.10.23.03.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 03:19:17 -0700 (PDT)
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
Subject: [PATCH 3/9] rcu: Record callback registration stack for Tiny RCU
Date: Fri, 23 Oct 2026 18:18:35 +0800
Message-ID: <20261023101841.2910719-4-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261023101841.2910719-1-kunwu.chan@gmail.com>
References: <20261023101841.2910719-1-kunwu.chan@gmail.com>
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

