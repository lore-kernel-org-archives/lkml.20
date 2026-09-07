Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF1A4B04AE
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 12:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788785082; cv=none; b=ctGWVqCIEZuga1g1X5BOlbMQ9v3JSlWLH3PD1e4pXChIntuYrKj+ZMmjMXauT43hfu7cBW2WiPw5SwcHYMTZRhuswdR1QfV2YpWabLUC5rKy2G1FO/Az2owClis9sBdfMEMVDQ7SKFTjoAhn26a3DNG8n9LZ7whdqs0ohS860SM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788785082; c=relaxed/simple;
	bh=L31dJLB138outhVcfW0X4aGPP9PzfKLuAQivI2gWuvc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zznuynv8Asi1Vo1VkCY11KGuGa4B07/VuoN+jcy1OAzXMnOE9E74S4imzk94jHmcPXhBT0M+jSeH/BZoOM2KzGH2atrfayNdGcFElGtaxx3hoXo5md1ZWJiybYPqO+sqoaIU2FyVOdO3Gz/KxTx8/Xr8IWW6kac11eVQ1Nf0aGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HOFJ2CHU; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HOFJ2CHU"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2d9004f39d3so43020055ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 05:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788785072; x=1789389872; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lje10pCj7urJUHzIwnwqeIHuLqNQwa+6AfG6B0cmdh4=;
        b=HOFJ2CHUm/jHLMQVvR4V7TI6eQ0VXpykVSCgYy0EesOdCN8ZLIwaghz2DPg3SsAjQg
         YzKbkCnrkdb26UIQLglXVw0xyZFjzwx0b3tZlQAWoVnuNjNPaEnZy93MPiHGYytCAwRZ
         Qj0bQNTgjmnllvwvyxD4Zjn7bCeotcnPUjI2CE4ALdjCIcw0pOsurtUEebQcs45RyZxp
         dC9NRWilvq9VYJFUljgHCV56R6fiua2+1hJYaAjsfeV6qoTReWM5hYey/M1w3VC5EBuS
         JcDLTb+gyiH5ag4tu4Qa7NtuLHLCI21r3GxMn4dHumBsr7l9W1YnOoZtVvksp8MaGRU+
         JDyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788785072; x=1789389872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lje10pCj7urJUHzIwnwqeIHuLqNQwa+6AfG6B0cmdh4=;
        b=sRnPkKZkMaNfLSQQyGnYrVGwQZ5ceJLvnF4e5cZeyfQqhbFurrovgZIjZxzn1Ks4LN
         CTQW+B86Hi2wG8kceCKj7pbo2RqB34pyIJ1TAUE9WwX4/O4906k3ibEW6HQ00+A78ma5
         kInoEkNza8KRQCQa7GpeHwkWi7hRHuG+gObmFV/wSZwhFXeo3di0RbGU5ELyxlaH1Q/Z
         NuS0CgaOWrQmUcR924iUOpgrE9lnmthjnNgsASqNWtnx/J+XinePaDVaYsOfrSwr8wq0
         NJwwlJTjOdnspxuCF4+urQ6+mPdyzY2z36AgZK5gJzEWCCNe6hNg8zdL4a5SOUvDu5Um
         clRA==
X-Forwarded-Encrypted: i=1; AKwUvBxuC9IwhKmhZ1rhsAM/hvorSq4c8M9d6u/7rfKIu3rsDkDr4UoDyjaDJ2Vz63Bv9pRQJG3B2KpCJQS/9Iw=@vger.kernel.org
X-Gm-Message-State: AFuF++k9IdogCpKEDEQe+8mvw33KyJlOg5BgirqotKWwKVP1UKhYfTR0
	xFQvtnnddggaefxnqJH9eZWugI8xYvGIfgR80mMyQsHdcg2vU+Ns/6c=
X-Gm-Gg: AYBFou3y2Hceu/Ytt5I+OYri0MLac4ORBNB0VGPK/n/6pwB3eyBKYwhB5NKW+A7hhVE
	fQrwnbfncEPDKkW9kqkc9gCfoWga+gz8rwUp5yLDQQkqCzZeRhIRywM0XcHTUlfAmSbpRee1Rxp
	4UqpPTy8adOULpHmYyNAXyHYnEty5vOahlW8SyK6fZ/eysfvvqV5ZyISUCHivDSyG4LNs5gXeqJ
	bVcVwfuGK4mwjdHyCaWTJGyaQDRR4j6JsNk4GXcI8rVX4PRDCZjbHvvHRweDkve/zsr4AwQFhoQ
	QMcnq5PVDz7wb4l82K3cyRFMTvPqdJEOPYNUTP2yc6YHQD3VZQTg9hoW7OICxpvFq+t3pPyxr4M
	yxDa7BOTjZ9bsIZnF7LO/xFk/IGy1IQXdpzEYcpLWjBCVLwzfsCOfv6P1eJKyAb+06+x4gsxHWU
	ZmzWxwKMJZI4Gz+cU1AGw1zY1IbH4jFdv0YLHcM9C4qVDx1hxDCkvDg5+ca8knnrwUr0CLlFWux
	tcQQZk/fTojeA5/swuVoF9evLY=
X-Received: by 2002:a17:903:4b27:b0:2cc:f5b8:4c2e with SMTP id d9443c01a7336-2db12496889mr314116275ad.9.1788785072459;
        Mon, 07 Sep 2026 05:44:32 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:6467:d689:c773:5f09:906c:a72b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db149c3b80sm45350955ad.63.2026.09.07.05.44.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 05:44:32 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Tom Zanussi <zanussi@kernel.org>,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	donggeunyoo.kernel@gmail.com
Subject: [PATCH 2/2] tracing: hist: undo the registration when enabling the trigger fails
Date: Mon,  7 Sep 2026 21:44:20 +0900
Message-ID: <20260907124420.607097-3-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260907124420.607097-1-donggeunyoo.kernel@gmail.com>
References: <20260907124420.607097-1-donggeunyoo.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 6f86bdeab633 ("tracing: Fix bad hist from corrupting named_triggers
list") described how a trigger that is registered but not on file->triggers
ends up freed while still on the global named_triggers list, and moved the
registration down so that hist_trigger_enable() follows it immediately. One
path still gets there. hist_trigger_enable() adds the trigger and takes it
straight back out when the event cannot be enabled:

	list_add_tail_rcu(&data->list, &file->triggers);

	update_cond_flag(file);

	if (trace_event_trigger_enable_disable(file, 1) < 0) {
		list_del_rcu(&data->list);
		update_cond_flag(file);
		ret--;
	}

so the list walk in hist_unregister_trigger() matches nothing, test stays
NULL, and the ->free() that would call del_named_trigger() is skipped.
out_unreg falls through to out_free, which frees the trigger anyway:

 BUG: KASAN: slab-use-after-free in find_named_trigger+0xac/0xc0
 Read of size 8 at addr ffff8880091d3160 by task init/1
  find_named_trigger+0xac/0xc0
  hist_register_trigger+0xc1/0xa00
  event_hist_trigger_parse+0x3146/0x6af0
  event_trigger_write+0xce/0x160
 Freed by task 69:
  kfree+0x154/0x420
  trigger_kthread_fn+0xfd/0x160

Leave the trigger where hist_unregister_trigger() can find it and let that
undo the registration, which is the only code that knows all of what
cmd_ops->init() took: the named list entry, the hist_pad reference, the
reference on the trigger a named histogram is shared with, and the copied
cmd_ops. It also pairs the failed trace_event_trigger_enable_disable(),
whose sm_ref and buffered event reference are otherwise left behind.

Since ->free() releases trigger_data and, for a trigger that does not share
its histogram, hist_data with it, out_unreg can no longer fall through to
out_free. For a trigger that does share, hist_register_trigger() has
already destroyed the caller's hist_data, so the fall-through was reading
freed memory there as well.

Move the enable_timestamps check in hist_unregister_trigger() above the
->free() call for the same reason: hist_data does not outlive it once the
trigger being removed is the one that owns it.

Reported-by: Sashiko AI <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/linux-trace-kernel/20260907092944.3950E1F00A3D@smtp.kernel.org/
Fixes: 067fe038e70f ("tracing: Add variable reference handling to hist triggers")
Cc: stable@vger.kernel.org
Signed-off-by: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
---
 kernel/trace/trace_events_hist.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/kernel/trace/trace_events_hist.c b/kernel/trace/trace_events_hist.c
index c6c04926bdf0..1de224a5a2bb 100644
--- a/kernel/trace/trace_events_hist.c
+++ b/kernel/trace/trace_events_hist.c
@@ -6679,11 +6679,12 @@ static int hist_trigger_enable(struct event_trigger_data *data,
 
 	update_cond_flag(file);
 
-	if (trace_event_trigger_enable_disable(file, 1) < 0) {
-		list_del_rcu(&data->list);
-		update_cond_flag(file);
+	/*
+	 * On failure the caller undoes the registration, and
+	 * hist_unregister_trigger() can only find the trigger here.
+	 */
+	if (trace_event_trigger_enable_disable(file, 1) < 0)
 		ret--;
-	}
 
 	return ret;
 }
@@ -6761,13 +6762,13 @@ static void hist_unregister_trigger(char *glob,
 		}
 	}
 
-	if (test && test->cmd_ops->free)
-		test->cmd_ops->free(test);
-
 	if (hist_data->enable_timestamps) {
 		if (!hist_data->remove || test)
 			tracing_set_filter_buffering(file->tr, false);
 	}
+
+	if (test && test->cmd_ops->free)
+		test->cmd_ops->free(test);
 }
 
 static bool hist_file_check_refs(struct trace_event_file *file)
@@ -6972,6 +6973,8 @@ static int event_hist_trigger_parse(struct event_command *cmd_ops,
 	return ret;
  out_unreg:
 	event_trigger_unregister(cmd_ops, file, glob+1, trigger_data);
+	/* The unregister frees trigger_data, skip out_free */
+	goto out;
  out_free:
 	remove_hist_vars(hist_data);
 
-- 
2.53.0

