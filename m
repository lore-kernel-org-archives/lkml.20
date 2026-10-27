Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793085023;
	b=Zt6C254LXWHbu0/18PMOsRjFWWXWe6rHCf+7gwelhFwrNtWpcbW3oFgvA/HpOXEK8Mh4
	 mQz8FqA/RkPD5Qh4Lpx0ywsFx88fhU086niw2vkvf1WZYfz2o4hVXt1Nmo+n8091jqtPm
	 ucH4NA2yDLrKCHyA69us+BtunPa3c3v7EbNRCZmEZ0yngs5GK7lEJGmN8dKLT6c/UTSnZ
	 ZELYsnWK8Weaqh8k03hAmM4mB9l40JUI/6v78S5jSrJeAFtqv2HaqqUFuOTrhj2ruznaS
	 jPi9jlpx5sXwE3v/KhxVMqOGhbR52QeZPOMS70pGl4YKasn7qfNqjjG9Dfjm7RD01dA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793085023;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ccfSLrgWT8yZZMCQWDheXOVMnyMH2wrHGPHQpEmc4TY=;
	b=FXJEpy6h50e79rBK/ANy2exxcaWZh9C+/Tya0oSF9RqJGz8bYDS/gYWyaYSY2s8h0QOB
	 B4S900NOIACU7s9sX/TFTt7SAs7/JzwmTrFT+GvZsQTUBBKc26UedEfjtVQ8RENbi+eC1
	 BC/dfgmmKAzt41k0k9Pdf+hZC1Hwtbzyx5u66PtemrF8XDlbjBhsUnvuFraitYQapPXmf
	 I+9l8hLcaZE/WmxL2H7oSXu7KGjTPNKNcS7IWtn9s3I9j5lXbCSKPbohRShyng82UfKQS
	 rQnFwoj2ympEkNlVf9FlTA/lkoC0yHHAkroG3DyUtbM8RlvOC601TdYVNom7AZudgOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MP7dcyUu;
	arc=none smtp.remote-ip=209.85.210.181
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 766AF606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 07:10:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 766AF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MP7dcyUu
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-89f28c3ac7bso1237727b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 00:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793085022; x=1793689822; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ccfSLrgWT8yZZMCQWDheXOVMnyMH2wrHGPHQpEmc4TY=;
        b=MP7dcyUuR/CsLPEGJnMAwlBC0l9Ey9m8yHP+/5XVCmXHJjEpBP/FirJHePk2scnegw
         69ewc14JYqKDWEiUGB7BnikTVinxRqSwME9MfL/QqlK6ZfGNs0d9yfomDk8ll8Y2iUZQ
         7rHkMfk6qMivvSmJL7/w855ApT2qWVF+PHNAZDY5gVQzMcx1vm/KjQ4jCgMJhiftIOrD
         orhsYyCnlGo+1NpyMCV6V5NFjieMw1BDuK6Gk7qAorUP0Vv3tv1sZk0OTZoG/ciVdtSi
         AHiYfZNHThaQ7pBViic8d+EOfk5sL5OJ2i4+tNguAJaDoXa/8Tgs8IcsoYotPoEMvifY
         DQlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793085022; x=1793689822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ccfSLrgWT8yZZMCQWDheXOVMnyMH2wrHGPHQpEmc4TY=;
        b=jqFMxE1jyECcXzzVE85NsY6gZaYZ0DdFvyqz2ZOPAhUY7OEIGGVjYwdTjWext4XxPv
         AYVDti0Hbfeio8IHp6ey4Hbd34FNswqcPy7YBq8y7mxnMnO12l8dWrmGSCyOFA69EEnS
         Bq9ffBzcRIbR/EL6davW45RyngpdJLUrxuSfKPEZHvi4cqzzxh43vxxlD2hmC5AMtRK9
         KnAz4yqANJM+7uTpG8OmRvNXIWMcXbmx3IAdCz+MZbZoT4bpEvaCj1LhLiFkAsYvSLj8
         ZwzVVwfJJQ59I3K3M44/PUFlFd6DWgEQPTfuMrImWRFs2RGNSo23hzIpkZiiKbnZ8N05
         UHrQ==
X-Forwarded-Encrypted: i=1; AKwUvBxu7GVq1zVkxlO6Z1JCdGNyfhDj/hrzLqnCdmOsLRgueQ8bLe8Rj7Hz49wlt5lfIWUcRCixn2QiUOjkPKI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJxWcvMuvKnOnCRIUDlnBoVaZ8uvj77Woh4cPGoD8mwPyCxkN9T
	KU4iz4j0juzgjHu36ISZzK8vjqxt06XMtfy2C9XMztrfimw0B966vbUv
X-Gm-Gg: AYBFou3wjrN5sgQ7uD6B63eGtVd2wcOdhVxRIswhqtUY5xIG1TBckpwygW6CUOhGkqC
	8LIfwUste5CBiN6G21OZJgy0seiw07Xu265PhbZyFEPTPTsxGhwWyI1ldyDiDkqseHGaekNTrXu
	AkdTE6aRBReTB6KxvK44fM1Yk/zc/QzKy9X7vQXpfsMDYta8y4TykVTDTGm0SLt8r/Ki7ep6zUR
	fJLz2B6ObPPMeGd8jryGik5SHzfQhKHlRzzVs8Fzt2g9ReOpsjaQ8lhaqY3nqgYjqYlWpa1gXtH
	6Cupl8riaS7MI+TNpcmHmGJ/WdJ63oXL+16qgrDKoJOPW8VW5ZF9Q94OUoFnWWbSFnqYKjcq/tu
	32y/ySxyjFIHIDyrUTkIKRUjp7qkJ+apBQmsZOQnrmU3UGCsV+aTnU2VQBvrx3scpmV1d9HkyDb
	IvI3UfVfEhyUGvgiVjoYhp6jrUqn/X33gC5D56F/ZlpLfNfCcJPLLccjio155SxHeyN/VVGepg2
	einnRpZbWaA1Kt0574mW+HGZA8CFl49JvrhPmZflfNM+X/K4Nrd90STcWn0xW4DuuS6LmH2Ovc=
X-Received: by 2002:a05:6a21:a91:b0:3de:1b92:a4dd with SMTP id adf61e73a8af0-3e7bfac2b12mr7185377637.18.1793085021537;
        Tue, 27 Oct 2026 00:10:21 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([185.220.238.37])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ccc21274sm2277512a12.8.2026.10.27.00.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 00:10:20 -0700 (PDT)
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
Subject: [PATCH v2 02/10] srcutiny: Record callback registration stack for KASAN
Date: Tue, 27 Oct 2026 15:09:15 +0800
Message-ID: <20261027070923.3054462-3-kunwu.chan@gmail.com>
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

Record the callback registration stack in call_srcu()
for KASAN diagnostics involving Tiny SRCU callbacks.

Suggested-by: Zqiang <qiang.zhang@linux.dev>
Signed-off-by: Kunwu Chan <chentao@kylinos.cn>
---
 kernel/rcu/srcutiny.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/kernel/rcu/srcutiny.c b/kernel/rcu/srcutiny.c
index 63a3f0a8bc53..3ee28885b96f 100644
--- a/kernel/rcu/srcutiny.c
+++ b/kernel/rcu/srcutiny.c
@@ -10,6 +10,7 @@
 
 #include <linux/export.h>
 #include <linux/irq_work.h>
+#include <linux/kasan.h>
 #include <linux/llist.h>
 #include <linux/mutex.h>
 #include <linux/preempt.h>
@@ -290,6 +291,9 @@ EXPORT_SYMBOL_GPL(srcu_defer_drain);
 void call_srcu(struct srcu_struct *ssp, struct rcu_head *rhp,
 	       rcu_callback_t func)
 {
+	/* Record the caller: the irq_work's stack says nothing about it. */
+	kasan_record_aux_stack(rhp);
+
 	if (should_rcu_defer()) {
 		/* A re-entrant call_srcu() during the drain would livelock it. */
 		if (READ_ONCE(srcu_defer_draining) && !in_nmi()) {
-- 
2.43.0

