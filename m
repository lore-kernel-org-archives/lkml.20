Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794413200;
	b=j1yJm3/CU6cGEy4avv9PHOl/yWAG+fqKpI6Q5jq81dip3imU/ONTIl4KJeoVVRBvDegH
	 c6zIDeP1wkU91AQCwvsIpoLNp8xxTCsObiKq6P7nlSo9PaovRB4lDggHyxjSlh4tLJ9PC
	 D1Kgie9LOWVHq7DogplMu79g2lDQFkYIz8wfm2sBV20YH4WBfHTHWsFcXrb4jf7f62W1H
	 pnbvV4RYt0GHu1mfl2H91oFlydek6gtlWhb565/dTZVnD/15AAfmtfrEKEjaEKNrlWRYX
	 rXldtrhOlDrAZle5hXfybGSXeE2hOE9RuxTUpFnn6ozinwJDDupWmiaN+Evm8fYGFvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794413200;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=Zwnj5luvWXI+zz4DC9yFt+NfwoUiaj5sZIrQqKOOYdI=;
	b=KFuEx9B6j/wvUwoJ8C1wX2dSJ8NnDzlVXlG2wRto8f5EIUGFWcI+EORWsCWBL0m3Thiu
	 elU4QlTJNpPCS+sS+lRKMEzrfeL/Q2wIr0rH4z2h3MbdQmV/vYACBypN4CQ/iC64YpFaP
	 BuI0xzNRRmQTXkq8F2W+JamqXqE6qGIVYJonQIeaH9zasuXzC+kQfv4sMqo98WdAiHvUB
	 FQlHC0JiFfn9tFb5dCe8ajs5phW+22WgiyjBz+ZS1ogJQCQ3jN1r/S1lacnoGw90adALI
	 FXTo1Dp1ntTADmIW+6RsaxkCSYubBtmPVqtPpLvw469+43CP1nLKE6fhibHt03iqRgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=DCN0npQz;
	arc=none smtp.remote-ip=209.85.221.69
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3509F606A324
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:06:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3509F606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=DCN0npQz
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-4925ef75fc4so2821884f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:06:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794413199; x=1795017999; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zwnj5luvWXI+zz4DC9yFt+NfwoUiaj5sZIrQqKOOYdI=;
        b=DCN0npQzkcgHdIljUjZSEekH2UprJmei8+FwUUX5uvbx9YNdBfhFkoCALlDt/cGlE1
         mDLP4vBA8s74V6oUUKShrv0DNKZZh6Mt0EISQf4R/XNOgtyBKl9fgnsfb8xxhQf0LTIL
         hf8H+P9MayjBEyh+FgWSr0KzvG6twbPG7Rf+dQhaYaEWPwPG68IPU2zue6+04uHkMug6
         rT1bLCNSFxXgLwfHlbxZktpJhIYzmY1F1EsB9/AKtKXq631/hQ9O/Br3vbfnnOpakIKm
         fD7h8HC004an8iHLLccz+hFvpz2Gim+CocuQnC7fOGTdYvjE75RS+HGkdkc2K4bYsHyn
         xxXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794413199; x=1795017999;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zwnj5luvWXI+zz4DC9yFt+NfwoUiaj5sZIrQqKOOYdI=;
        b=B5/BBOIezb3vlVle+V4RSz4TViJp35Rjc/WmavbOdwJP3VXAHGjaZs8sGhjXAgp5yl
         3oMuQ5rIJgeAvJPUyDQMfrq2sgoo1n17U9k1ZEAH3MSOvMYMC0N1hX5kpGjpLdCEV7r2
         OhSnWom52q2mnmM5JrSCQm6kk7H5i2bH9NEvKgiCVYffZOXYwXGqP3yEvsrWoU0zlzkW
         DaLd8HHnu9zlNwAf/z4gicofIO3MrRs2NHJoDK7o9xS64EY0HXVuPZ2duuPCBehGjKqe
         PfAbcrm2wmt/9L4HcWSkPueH2uSemdyY8BE2yLf6jBYP+nd5W0vJ6Et/7bWyODXqWq5F
         /glA==
X-Forwarded-Encrypted: i=1; AL+hErGsPASJqfJ4jTz28kHspdS8u8Xar3DKErO8sWG7HYK0a7ySJjBnDf2bfxKMs55Bes5tffddduroMEs/EMc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8rv2zIYS2b0goQd3rDPfcjSWbXjNaOs3CX3SHGh/42h+gu+xa+
	TE7FG6kb0b7JW7Wjei54wIzXsdTApkW0unaoVpFidhubA2jPWegI9ZZ3eRplpi0EsBtg/GoG+fD
	4eb8eJl3id9b/AB0l2eC6qA==
X-Received: from wroj9.prod.google.com ([2002:adf:f009:0:b0:48d:ef24:b9a0])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:5d0a:0:b0:493:c0a:5087 with SMTP id ffacd0b85a97d-499c75526fcmr6092201f8f.51.1794413198261;
 Wed, 11 Nov 2026 08:06:38 -0800 (PST)
Date: Wed, 11 Nov 2026 16:06:24 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.542.g3ef89b7020-goog
Message-ID: <20261111160624.1294946-1-vdonnefort@google.com>
Subject: [PATCH] ring-buffer: Let the reader spin on head page update
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, 
	linux-trace-kernel@vger.kernel.org
Cc: mathieu.desnoyers@efficios.com, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>, 
	Breno Leitao <leitao@debian.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

When a writer hits the head page, it needs to move it. The update
happens in two steps: first it swaps the HEAD link for UPDATE and then
swaps the following from NORMAL to HEAD. However, if a stale
cpu_buffer->head_page sits past the UPDATE link, rb_set_head_page() will
find HEAD directly and allow swapping.

This is where things gets hairy. If a outer update is interrupted before
setting HEAD, this nested writer finishes the update first. Another CPU
running trace_pipe can swap that newly installed head page with its
reader page. Now back to the outer writer. It resumes and tries to swap
the following link from NORMAL to HEAD. It sees PAGE_MOVED which is
fatal for the ring buffer.

To prevent the race, mark the newly moved head links with HEAD_UPDATE
(HEAD | UPDATE) and only convert the final link to PAGE_HEAD when the
outer writer exists rb_handle_head_page(). This effectively keeps the
reader spinning.

Fixes: 77ae365eca89 ("ring-buffer: make lockless")
Reported-by: Breno Leitao <leitao@debian.org>
Closes: https://lore.kernel.org/all/20261105-ring-buffer-head-moved-v2-1-05da40cebccc@debian.org/
Cc: stable@vger.kernel.org
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 kernel/trace/ring_buffer.c | 44 +++++++++++++++++++++++++++++++++-----
 1 file changed, 39 insertions(+), 5 deletions(-)

diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index 1fd28a72e6ee..73f31e6719f9 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -1306,6 +1306,7 @@ EXPORT_SYMBOL_GPL(ring_buffer_normalize_time_stamp);
 #define RB_PAGE_NORMAL		0UL
 #define RB_PAGE_HEAD		1UL
 #define RB_PAGE_UPDATE		2UL
+#define RB_PAGE_HEAD_UPDATE	(RB_PAGE_HEAD | RB_PAGE_UPDATE)
 
 
 #define RB_FLAG_MASK		3UL
@@ -1455,6 +1456,15 @@ static int rb_head_page_set_head(struct ring_buffer_per_cpu *cpu_buffer,
 				old_flag, RB_PAGE_HEAD);
 }
 
+static int rb_head_page_set_head_update(struct ring_buffer_per_cpu *cpu_buffer,
+					struct buffer_page *head,
+					struct buffer_page *prev,
+					int old_flag)
+{
+	return rb_head_page_set(cpu_buffer, head, prev,
+				old_flag, RB_PAGE_HEAD_UPDATE);
+}
+
 static int rb_head_page_set_normal(struct ring_buffer_per_cpu *cpu_buffer,
 				   struct buffer_page *head,
 				   struct buffer_page *prev,
@@ -3699,6 +3709,11 @@ rb_handle_head_page(struct ring_buffer_per_cpu *cpu_buffer,
 	type = rb_head_page_set_update(cpu_buffer, next_page, tail_page,
 				       RB_PAGE_HEAD);
 
+	/* We have interrupted an update */
+	if (type == RB_PAGE_HEAD_UPDATE)
+		type = rb_head_page_set_update(cpu_buffer, next_page, tail_page,
+					       RB_PAGE_HEAD_UPDATE);
+
 	/*
 	 * type can be one of four:
 	 *  NORMAL - an interrupt already moved it for us
@@ -3711,6 +3726,7 @@ rb_handle_head_page(struct ring_buffer_per_cpu *cpu_buffer,
 	 */
 
 	switch (type) {
+	case RB_PAGE_HEAD_UPDATE:
 	case RB_PAGE_HEAD:
 		/*
 		 * We changed the head to UPDATE, thus
@@ -3773,8 +3789,8 @@ rb_handle_head_page(struct ring_buffer_per_cpu *cpu_buffer,
 	new_head = next_page;
 	rb_inc_page(&new_head);
 
-	ret = rb_head_page_set_head(cpu_buffer, new_head, next_page,
-				    RB_PAGE_NORMAL);
+	ret = rb_head_page_set_head_update(cpu_buffer, new_head, next_page,
+					   RB_PAGE_NORMAL);
 
 	/*
 	 * Valid returns are:
@@ -3785,7 +3801,7 @@ rb_handle_head_page(struct ring_buffer_per_cpu *cpu_buffer,
 	 *               the page forward again.
 	 */
 	switch (ret) {
-	case RB_PAGE_HEAD:
+	case RB_PAGE_HEAD_UPDATE:
 	case RB_PAGE_NORMAL:
 		/* OK */
 		break;
@@ -3816,7 +3832,7 @@ rb_handle_head_page(struct ring_buffer_per_cpu *cpu_buffer,
 		    buffer_tail_page != next_page)
 			rb_head_page_set_normal(cpu_buffer, new_head,
 						next_page,
-						RB_PAGE_HEAD);
+						RB_PAGE_HEAD_UPDATE);
 	}
 
 	/*
@@ -3824,7 +3840,7 @@ rb_handle_head_page(struct ring_buffer_per_cpu *cpu_buffer,
 	 * changed the original pointer from HEAD to UPDATE),
 	 * then it is up to us to reset it to NORMAL.
 	 */
-	if (type == RB_PAGE_HEAD) {
+	if (type == RB_PAGE_HEAD || type == RB_PAGE_HEAD_UPDATE) {
 		ret = rb_head_page_set_normal(cpu_buffer, next_page,
 					      tail_page,
 					      RB_PAGE_UPDATE);
@@ -3833,6 +3849,24 @@ rb_handle_head_page(struct ring_buffer_per_cpu *cpu_buffer,
 			return -1;
 	}
 
+	if (type == RB_PAGE_HEAD) {
+		struct buffer_page *prev_page;
+
+		do {
+			/* Interrupts might have moved the head further  */
+			while (!rb_is_head_page(new_head, new_head->list.prev))
+				rb_inc_page(&new_head);
+
+			prev_page = new_head;
+			rb_dec_page(&prev_page);
+
+			/* Try to release the reader */
+			ret = rb_head_page_set_head(cpu_buffer, new_head, prev_page,
+						    RB_PAGE_HEAD_UPDATE);
+
+		} while (ret != (RB_PAGE_HEAD_UPDATE));
+	}
+
 	return 0;
 }
 

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.0.542.g3ef89b7020-goog

