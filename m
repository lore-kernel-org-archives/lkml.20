Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792750767;
	b=Jlkr3iXN48oWDKGaxexxBuB1v4HwAerWaD14FuqKzoRcIV1T3CQxkKrZ8xyuV+OoRFqU
	 3W+N0DnlKWtVGrymdTAgsNdUWgcrlRicFsxGEr3Cs/VgpkljHgvjg8JFJ/CB5T+b/24yU
	 OFZztgORXAXbYA0ao6qdBy2UoKuJqZEJtJRYxQ3vpskoLEQLSAhfTvoDpdscvU44BCe3r
	 +m1aQ903EYPbt5Xw+Q6spkIF+mTCoSbMfNC9Jswiax44C1t/B1lHomTG13ih7qZ0xZlri
	 CTC3ej279SExQdtqvBYDMQ4ygoM2HLCC7HmVehgzWLP7OW/1O0/OrqlSalpFOOJ8ySQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792750767;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BYJPXc+YDbxsGoRWSqtP/HKIWWRHUzZIapmesZ/NvQs=;
	b=Wf2kTO5D/kEsWR/5BEIUBlKQuwt89zXMvyX2mh4gu4BUwS/u5zY7JVamdBXqmM25c+Ji
	 yZHCtw4tU/0FEnBDLLFChFQuEL9tfEQL/yBBS8JSDnwLa+3+5S4Xs5yAdj1HloC7SVb5u
	 8RloTVWH4vA6ViGTEPO+3hOWLhB1JDPRXBU7xHVODGlCKRtNqjKT6QcrtWOAb19Cg2QA9
	 F35K6zDHoHThjGNzmwCucAu2u2kVTdGfLRTgjapmRaGoSOwF7KXdnAJcJ0al73q5lnxHZ
	 R9Ia0gsr2rl6tZre0Rcx3fbmXrLJeRETs6Ev/GETiSkfuD/u4ZXsYdK1+GKxyXVqExQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=e2OSohK7;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB2B606A323
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:19:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EB2B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=e2OSohK7
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-35ef6b49813so1027632eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 03:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792750766; x=1793355566; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BYJPXc+YDbxsGoRWSqtP/HKIWWRHUzZIapmesZ/NvQs=;
        b=e2OSohK7cttTvuEXSEqc+hUVErL+2Xh5npnbSuKKkV07uKAJ7c5vJtSgPow6aActFu
         Cmyp/RcrHntwA4CfQIWOw5raN70BeqvFaMoy4HdJjOzstdZFKaalHgSVWe79o5T2or2n
         2SYfO96y4so/EWoG8kG4aZU9twxlAfFQdkH3v2mY3/FjQechXZb32ocQLQ1KFyx2cPw0
         EwzftDLLA4BK1NGxg4fWH9uWMSeq+nAanIqQcJLmRrlzFbdpdY35O/cjWx4+ojY00rU8
         zR6PW9vrhTjcSpF6x1/o5mOmDHH4/0e/HUE8n/HsqRdMSDJx37Ri1f1xTzu9AYyATbhS
         2/2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792750766; x=1793355566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BYJPXc+YDbxsGoRWSqtP/HKIWWRHUzZIapmesZ/NvQs=;
        b=JQlglhftvC7INy9WuiX5zvpG3QxN+rGKQwGGuGRycIeHEzf3uguSTLW+lLwCvCc108
         CMpkJKlz+PP0Vp8c04eQb50hZZg1xiPXI2HLnosPed10arMGGPIXpS/EWU95LBSMfNAZ
         62o4T+Z2Mx+udvV3ZL+Ir0IhM6q8udbzpfKKTO8/xdlENOtgEZ1iyx4wIW98Uek0Qyvd
         QERllHhNgt6xN8fbGYeDn1nQxploODATshps6eqWj5OlOMBmT3H2QEuq5cL3+UwL4IZx
         8144BaAEDAqJMZrzuEeD9Tt66iiQb58TVKrczKzIACsnwMrFTfmJpCClIC0Bsvbx/g4f
         Wiqw==
X-Forwarded-Encrypted: i=1; AKwUvBwHVGVKYObDT3+jUii2UYpAcXDrziiQcOeoo60KuSysy5cEKSwmAIvvDiTB/tUlidIAjgsc29WBsSb5BLE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLdShDuer6vJB9JmWkuhIe4sujg2ru/U3+Jkvv+9SGvv5rNrkIv
	eedXEb7qqMedjODbEDrrVaKxjdFNBv/HJSrYNIxXBB5AujY4nOiw+0I7
X-Gm-Gg: AYBFou2Je2dg04mzLzlrcu8G32zgD8v1E8tf4g95ifMoWWBcwXm3UcIq6MSsBshEsDI
	/xpuIl/uxrL/DDZzy2VoGOSX54ng19sFT+sZ+oFaVaBqsg31JLGD/qxzs63Am+pcSAyaNNhR9v6
	73BObce1AUYuqSqSMgHXjTTtkH6TXLv3FAEXZl4Fjmk1dLa9ndcnD0ab4FHM/biKg5ldT16h8F9
	9rcEJTe4FX492HhgfHQQO0O2LjQtGi8SohkX1Pw5PoJKpeS0bUPtlvMJPU69IzDNBvqZ4ocAQUY
	9sQxyWFT0M70Sy07MY1AMzpIpnAvZZsapmSQvM4pLVDY6GglkWCYXWjlFWCYeCsvRnHqyDykw25
	Y29QKkhMA1nOiUlAjWmmCm5ol/Z5TkURtBq2Yj+otc9YCxwxXN2nS8pFiiDLksKoLxqLzRgllsh
	qx7rpvLgM0hjCTNYeaTiI9lkHId4kgyUpRzjPNNk5jT2+Odivu/6KZB4M8HdmY47uJzD7JSLpF2
	+9MKru8i2obOKJI8G+flSzsyCbj6DiobJmJWtGk6QAllFAyFqJwWwLWl5T+ojJK4oLvVXhcpA==
X-Received: by 2002:a05:693c:894c:20b0:368:5750:9869 with SMTP id 5a478bee46e88-369d96dd67bmr2226866eec.8.1792750765447;
        Fri, 23 Oct 2026 03:19:25 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([185.220.238.37])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369d9deef9bsm5852176eec.22.2026.10.23.03.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 03:19:24 -0700 (PDT)
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
Subject: [PATCH 4/9] srcu: Validate callback arguments
Date: Fri, 23 Oct 2026 18:18:36 +0800
Message-ID: <20261023101841.2910719-5-kunwu.chan@gmail.com>
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

Check callback-head alignment and reject NULL callback
functions in the SRCU callback registration paths.

Signed-off-by: Kunwu Chan <chentao@kylinos.cn>
---
 kernel/rcu/srcutiny.c | 7 +++++++
 kernel/rcu/srcutree.c | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/kernel/rcu/srcutiny.c b/kernel/rcu/srcutiny.c
index 3ee28885b96f..98864977bed2 100644
--- a/kernel/rcu/srcutiny.c
+++ b/kernel/rcu/srcutiny.c
@@ -291,6 +291,13 @@ EXPORT_SYMBOL_GPL(srcu_defer_drain);
 void call_srcu(struct srcu_struct *ssp, struct rcu_head *rhp,
 	       rcu_callback_t func)
 {
+	/* Misaligned rcu_head! */
+	WARN_ON_ONCE((unsigned long)rhp & (sizeof(void *) - 1));
+
+	/* Avoid NULL dereference if callback is NULL. */
+	if (WARN_ON_ONCE(!func))
+		return;
+
 	/* Record the caller: the irq_work's stack says nothing about it. */
 	kasan_record_aux_stack(rhp);
 
diff --git a/kernel/rcu/srcutree.c b/kernel/rcu/srcutree.c
index 46fe2f0cef85..1993ddbdb828 100644
--- a/kernel/rcu/srcutree.c
+++ b/kernel/rcu/srcutree.c
@@ -1529,6 +1529,13 @@ static void srcu_do_enqueue(struct srcu_struct *ssp, struct rcu_head *rhp,
 static void __call_srcu(struct srcu_struct *ssp, struct rcu_head *rhp,
 			rcu_callback_t func, bool do_norm)
 {
+	/* Misaligned rcu_head! */
+	WARN_ON_ONCE((unsigned long)rhp & (sizeof(void *) - 1));
+
+	/* Avoid NULL dereference if callback is NULL. */
+	if (WARN_ON_ONCE(!func))
+		return;
+
 	if (WARN_ON_ONCE(ssp->srcu_reader_flavor == SRCU_READ_FLAVOR_ATOMIC))
 		return; // Leak the callback rather than corrupt SRCU state.
 
-- 
2.43.0

