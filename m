Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792750774;
	b=m6HKFpe/ViD3oU31F26VkGW4Z0hcKtP79rZIEajYQgHhZv1y2xI42MHas1kZBO32DkzJ
	 1AtwjbhlOG4nL1llUE4AxImkfMVM2z2t6oib93ldRwBoQJZplBkzkag0flaRpfaX91Jfp
	 oCfIb0Maq1DtmGy/+H7Ywgj05H/6VghhC6MBs69OA54UsJLz50b1UQ3FcbQxw/Wh/bRdJ
	 l8moOiAW8xdm3donRzhiLamWqjyBiwyq5kMspDFLlZqjLIjSBOpo0JJWCguOls454L7TI
	 mr58eH9nP8VyX7eOQrpb3ugWjdQpjbFpJDITy4B6lR7exoBBVQ8z9sORsB4/k8lQDjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792750774;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yhX3Co88olrCtk6/h+mWMlsE2G5ipIoGvccQ3rnpw8s=;
	b=F6JsEtXJo3wL8iKVQQwmfP+oFWHXwhpi56Zs6lT7aJZdrsnY5McpnZqT0HtHLCP08Hi9
	 GkgTCviozcX8zsn8dBgY6eXtWDeZ+U1LDqfs6Ynxq8LeWRFaZGrNsVxTbrY5VOXEjhTUY
	 aqgRbLtXzMOikD2Ih4PQqlCTTpqN28vKQbdxiNM4hcwOwp3BDyNOmWdSat2ETISjHp5m6
	 iogVrGSdm8ZpBIHp+cnJSCo10nnRv4VmCsX9QerkwWkw+27/tFJTzxNnGRrFaPVpGkq1J
	 n5B+o4PF3gbaPV5a4bzzRY7pZbcQYGUYt+hwn7WJ0UmSdQ0POQXABBHK7o8sNIkSGCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GZX8x0Db;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10FAB606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:19:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10FAB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GZX8x0Db
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so1162224eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 03:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792750773; x=1793355573; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yhX3Co88olrCtk6/h+mWMlsE2G5ipIoGvccQ3rnpw8s=;
        b=GZX8x0DbuuImQ+h9JY2az4ttqUG7P94WHhMPGOovjKHFjT9smkGC/RTsLbASVqRW3q
         Qxrr/SzzGGr3lcN97RG5QOsm1W+9s3/Zsl/cc7Wp5+pg1Ju7OKE/fk1UBBf7Fhh25rli
         T27A+GX+3Oma+1oFMiEHlh2v/w07/hbDhZCVXCeGYDLoImpwQSIjeibKQXf/AuG23dzj
         c6JpLu8R0w/XxzEl3daWVCdrmOhBU+ylRtuN6+rTskq7zftYLIkMGsGp48WwV0ScGMM4
         UIgi1N5uH8lsT+rBYZ5YhupAQ0uqW7v1+1LIXnanJ9uf7b54Atb83uONYJeAjgJYZThb
         M0ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792750773; x=1793355573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yhX3Co88olrCtk6/h+mWMlsE2G5ipIoGvccQ3rnpw8s=;
        b=aNW25aZQTo8mVi0uLPGvRjvn3I57qEPQF6JzbIsP8FHiZqEs/V+zOQ1t4cHLWRHnis
         C5szR9coL4dpfSLVrKNLj3XwTgxlS97sFA9nvhY/lv6Q7KjKJU7X7DgzGUBnacxGy29U
         zac4P3Zb4r05/bqHcyYMFa9sXcDgK5c+DobIUBDCBtKJJi/P+d7ugO15uY277O5Dheuq
         dvdFDGP3V0cVMJY8Sv+ZlIkCaswH2V1iYwgWtkaJbnQYhPiUyCyAJVIUceJ71ihgXR0f
         JAIn3hSKNhRTY0MMh5JeiSM8/gGd1SXcfuFG2gSxDQnME3N/1L8xcZG79h1jCTNxys7i
         tsBA==
X-Forwarded-Encrypted: i=1; AKwUvBwkX/+YWwDnAGXcIgjoDycZNjJeZJCexam+IOmTEzni1CS5GvXYO1zDvGQepBIPE3Wbg7BeRUYnecKUf1o=@vger.kernel.org
X-Gm-Message-State: AFq9FYJyY+XQGKYKGmsSlICsAO5UpneMRXSIfFTZh7LufikV7EaRPUoB
	8y7f9vgmsDFPvDIbOK8AipyBilziSGSiqN4Tr0rvFSZjWgCcYEU5LuvG
X-Gm-Gg: AYBFou3/yGOgA6owNUshw0cX9wUKEPc7WofFTvH39UuffSRje7k0Cydhx5LYl/+99h2
	WpYTXJjomHQEUs0TE4lz86TnnO8kY/oZuYZiDisqLhqTCbJaSLY+pi+vJoJWdyMwX+MwMyv+rvF
	0Q13ovstwuyBYnZFhSWQDdHUkKaNlvMn9df0BLRzJAnDl/YoqSRut/K2KMa6JfIBvWFZoKA9BZ/
	e1EpCRjZlaL0V8j11ArLf0eAcWtfQ0kQXTmNpXSdc/CThHiZCCZHRzTMOmR8dRMhcWsWB2MLDan
	gnM6kxh786VK8E2qjT0RtDzFq8XgGB12qulvpYA1yC55eGwNBQa0459L16HMicu269egaHdxCza
	cdFHslaDLY/VBMbsYKHulE2hignljqZnN5DNleRxbmZRSFyW7ZKcuOe8KCNZMEyCiPpdJQp1/y7
	VNfbwojFiCdYDCRMuZssiQ8x1EYl13702x4/MMkgKrH1aw+POxYrwDC0wH8kP2FnJeR4e/R/YOs
	898cgluNB/aP73DUXKCrG50GT/fkS7/+DwuIHs0t/DO455yHgRXoW926ktO22cFUghYCeDDpQ==
X-Received: by 2002:a05:693c:8801:20b0:35c:e696:2d4a with SMTP id 5a478bee46e88-369d9851d1amr2182117eec.24.1792750772975;
        Fri, 23 Oct 2026 03:19:32 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([185.220.238.37])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369d9deef9bsm5852176eec.22.2026.10.23.03.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 03:19:32 -0700 (PDT)
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
Subject: [PATCH 5/9] rcu: Validate callback arguments in Tiny RCU
Date: Fri, 23 Oct 2026 18:18:37 +0800
Message-ID: <20261023101841.2910719-6-kunwu.chan@gmail.com>
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
functions in Tiny RCU's call_rcu() path.

Signed-off-by: Kunwu Chan <chentao@kylinos.cn>
---
 kernel/rcu/tiny.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/kernel/rcu/tiny.c b/kernel/rcu/tiny.c
index bd22fa43108d..ef0b0474f207 100644
--- a/kernel/rcu/tiny.c
+++ b/kernel/rcu/tiny.c
@@ -252,6 +252,13 @@ EXPORT_SYMBOL_GPL(synchronize_rcu);
  */
 void call_rcu(struct rcu_head *head, rcu_callback_t func)
 {
+	/* Misaligned rcu_head! */
+	WARN_ON_ONCE((unsigned long)head & (sizeof(void *) - 1));
+
+	/* Avoid NULL dereference if callback is NULL. */
+	if (WARN_ON_ONCE(!func))
+		return;
+
 	/* Record the caller: the irq_work's stack says nothing about it. */
 	kasan_record_aux_stack(head);
 
-- 
2.43.0

