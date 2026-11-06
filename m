Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793975985;
	b=zeNHW7zt1Ae9Nq9VSoD9r8uMv0aZCOOLMnZAmCIXw0WtALAZMbeLHfi0Ar15b0rHvEWA
	 9zEfgzm4bJIG1Mh/gSzEkb8Q5F1lajWrYCC6RVQNetta+cMUtU+LK4hvpR5LIyvjDvXd0
	 E7vpBa590/fOdIFt23GV6udJCp9D8J6dST2+3+zmjG6jeANwaOxe5tsedm4tJkHlRKIi7
	 QKiao5b7VY6qRTMu3BqX1X/KxksULNZAF5yUqTbqambX7iVj8TxE0zL6nERPM2FNY9zvn
	 AADj3Ax3mdUxeHZrVwB4zbmx0CJYyjOq1RvkByaElaJimEcxglbaLnKNfn6TZgq/3+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793975985;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=UL2zPoMK6Vx7p/yCQJoqQjMHfRUNHZK6rMRN2TLEiXo=;
	b=CmthPra3m6and1NtO24u5G0mjvVte120KEdPQddozaGDXmpmvo7sqPBQrOAXeRmSOgYQ
	 3Pzcn6XuIbEDnghPNEJrYsposglUhaxVHZ60wuXO5V79fDKR+EtGn5wTDle81Rw26MVRE
	 6QZWmv92uB75SHDcH3nCUNRJZ2PHr+YNuy+3fsrKcYV9tLjku1GKHvIGOCsTFbEO/DNE4
	 zSooA3KMdOdvRKgBJYZ+fQz4AtaXSGuy7mPtdKzKTcE2GeyJfdJmOujlRgw26pTxSRQkr
	 QUHrgfXx1GV+cM5BmE4m/O0swsQ916+1gwG33crSj+XacoPSKwhpCYovuhiTiXlMrxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uR+3IA4s;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F9B606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 14:39:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9F9B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uR+3IA4s
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-33fb4680717so1320526eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 06:39:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793975984; x=1794580784; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UL2zPoMK6Vx7p/yCQJoqQjMHfRUNHZK6rMRN2TLEiXo=;
        b=uR+3IA4sBGd8EJPiIVr8576SD8mgkJaLtoaNXsCLB835eBK1DjgsI6ZvyuUTPIQtyz
         jev2ZFcbEwdyAkn8kqiEcdA8A1h+eTLEfZjvHLR803TA45bn/d7p2JdKjbbWtk1uQt/c
         TcqvATB8JApuv9N5IKi/1Y1rt/4133CR6pDREBk8PKUK1vTMWwUv4YN9XeBYHPFGmkst
         JxqsYCkwHgfF2/yQKoKpeuLPILl83R7AIt1H4IWVBH+3YNLAop3pqiX6HUmdeI8t1F7D
         XDwQeOL63Mrq7sUGd2kUSLrLfqGll1S66Xn2eQnDVB+Inw9lirccx34XSO05IlKP5Tpv
         bzbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793975984; x=1794580784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UL2zPoMK6Vx7p/yCQJoqQjMHfRUNHZK6rMRN2TLEiXo=;
        b=hG6vvVp4NMNB5A4Cr7FVXPrDGJKqX4x8cD5Ct0Tz+54/qkxqfH7SzW605nyWwAXUla
         u9va8ttDVcZrfRFA8GyOd3Cz/r8usa7ZBuZAEwj5Ia7ilRZPy3EDPRVECAjkPPLgH3YK
         05NCSYqhQfCfw5O7awKZYr5QBSBetGABdPrPeDjg1/fTYV2aoP5hRtzf1VXKJkajBG+Z
         sEU6xyx7uVZe6AKlUSBHWCpsDy+0nEfRPRGky9YJTWBlNI3yaKkYL9H+XDnoons/KHgz
         rr6dJOSQGqB0erXWNFXKmvGJq+VTiqrnAk+Fn+7LN4uWkFTcha4Fh6yF70ZbjKtRJG3M
         qY0Q==
X-Forwarded-Encrypted: i=1; AL+hErH691+cvriHoLO+q1wCCYIgb9zYG7xeLjwrvE0HsSfSM8F/wox6wSmwfw9sraBu27CFXTYLwWSZ6cZPiko=@vger.kernel.org
X-Gm-Message-State: APuU4Z+nij1Lp5OqCpxzq91h6VP8gnoIitJJo566ZOa3fOcSXgu3nh/4
	MIibbm8+Nb3UpoxrLf/BQrmT9wbgE6oMSct5VpB5QkqoBZYR1ptWGyJo
X-Gm-Gg: AYBFou01k8ckE2oDfBp5gXYESzlgHDf5QrZsCNIzKR/yqfosJrEpf7w7zTW7ppCQjtt
	SvucLtuCRAyvrVSNMoDO5Lo2JGMs25pY0PWFhSk5TVi3cdkA9bC0PQd0zxpZy/lTk3zA5tzK0Of
	xd/VpRIG4x1omf1PXrywRMnaiWLuSN3u4HZMEY4WKSDA+Ryh8AJAwPpsV5h4jOjmnj4Vja0uv/Q
	uHIExXcxK/ogJo4LUPyrGvr6fyta4Md3B4YCGEGxZRVIM4DxcStzqUfXCvrWVkKs+nGO/Bb4Do7
	klwqS+SBl7KFhulPuv4PIwEOIZ6dXUbhgDPIpC0EGHlGSAakSQlg5LtAZpBcJBz2mXpfsLOO7c4
	AaTRRRRqVjXQywD1glTFSx606v9j9vo5cTOWN4wdMAaUHyr5st4IG3QOv47p6+q7teH+/ZaT+KS
	KJRUkSypEhAXga2QSXlbRBylQRnvZ4ieTb1rmPaK0Er0hfqqj7sedFX5RIJUC4YGXTEkMhwt15k
	YEybWpYf5zh54wDiJSRkwTNHW1yxn5teOueDB/NuprtSMrD0026rC89AEQ3Z1FsqAOVXM94PskB
	kfkBjfEOwLFwG/1A0CQo9q4Xqp7FWBDxHDLIWnY=
X-Received: by 2002:a05:693c:68c3:b0:36d:dd5a:4528 with SMTP id 5a478bee46e88-36f75440686mr4121224eec.7.1793975983721;
        Fri, 06 Nov 2026 06:39:43 -0800 (PST)
Received: from kernel.. ([216.195.201.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36faa6a649csm7182068eec.26.2026.11.06.06.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 06:39:43 -0800 (PST)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: dave@stgolabs.net,
	paulmck@kernel.org,
	josh@joshtriplett.org,
	frederic@kernel.org,
	neeraj.upadhyay@kernel.org,
	joelagnelf@nvidia.com,
	boqun@kernel.org,
	urezki@gmail.com
Cc: rostedt@goodmis.org,
	mathieu.desnoyers@efficios.com,
	jiangshanlai@gmail.com,
	qiang.zhang@linux.dev,
	linux-kernel@vger.kernel.org,
	rcu@vger.kernel.org,
	Kunwu Chan <kunwu.chan@gmail.com>,
	Kunwu Chan <chentao@kylinos.cn>
Subject: [PATCH 1/5] rcu-tasks: Record callback enqueue stack
Date: Fri,  6 Nov 2026 22:39:09 +0800
Message-ID: <20261106143913.3627722-2-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106143913.3627722-1-kunwu.chan@gmail.com>
References: <20261106143913.3627722-1-kunwu.chan@gmail.com>
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

Tree RCU records the code path that enqueued a given callback via
kasan_record_aux_stack(), but Tasks RCU does not.  KASAN reports
involving Tasks RCU callbacks therefore lack any hint as to which
code path did the enqueueing.  This commit therefore invokes
kasan_record_aux_stack() in call_rcu_tasks_generic(), covering both
call_rcu_tasks() and call_rcu_tasks_rude().

Suggested-by: Zqiang <qiang.zhang@linux.dev>
Cc: Kunwu Chan <kunwu.chan@gmail.com>
Signed-off-by: Kunwu Chan <chentao@kylinos.cn>
---
 kernel/rcu/tasks.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/kernel/rcu/tasks.h b/kernel/rcu/tasks.h
index a20db323612b..fd43cd5d5a48 100644
--- a/kernel/rcu/tasks.h
+++ b/kernel/rcu/tasks.h
@@ -6,6 +6,7 @@
  */
 
 #ifdef CONFIG_TASKS_RCU_GENERIC
+#include <linux/kasan.h>
 #include <linux/mm.h>
 #include <linux/ratelimit.h>
 #include "rcu_segcblist.h"
@@ -366,6 +367,9 @@ static void call_rcu_tasks_generic(struct rcu_head *rhp, rcu_callback_t func,
 	if (WARN_ON_ONCE(!func))
 		return;
 
+	/* Record the caller: the irq_work's stack says nothing about it. */
+	kasan_record_aux_stack(rhp);
+
 	if (debug_rcu_head_queue(rhp)) {
 		if (__ratelimit(&rcu_tasks_dup_rs)) {
 			pr_err("%s(): Duplicate CB for %s, %p->%pS()\n",
-- 
2.43.0

