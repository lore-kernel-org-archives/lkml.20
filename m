Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794436362;
	b=5BaaKMfwQnm7PagraQMbvdSighfndBKdg0oy8ZsU8oLKTRXrbFfzcK81wJONz7Q14D0h
	 iCZhDuLRbt47XFNXuMCVtTbR/eyNraoU+oL4OVvcAeWjvDWmUpdZCAuf/1SUofaQFe7ZX
	 05kglTcTJ9iQP5VGZ3Tb2+JteIJOB7pzrbh8WrJguENBiFb5U7qSfArhKLTAPPfC6Jod7
	 5dMDRqtsuHc6LFDYGAcJcJQSIvT2FEhSxL0f3Q/cdiGDvkXUaggQ6Bc0ar2am0HTHn1aK
	 7/zn/x/iHZui9aJiqJ7SOmibfshfj5UoJ6drUugkZRALdLGiBsoRJc9XYSb2LwgoFww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794436362;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ifjkH+2k40MmZV7RSbPynQ7YvHJ4bk5X1IWs8GsBC/M=;
	b=fhxMOQpMlS7JbDlcuqvhiA3HnaYq1X59uBsju58WbFqK7HA63oDOMI6qDIJGY9kuHBBV
	 AW9roJBOYfVAq1Gsz8tFpmUQAGjnlK4CG0vSQkJ/HNLYbz++hyyVE6PJqKoLV7InoWFMz
	 Lehbijvg/ccijURUZ/81pcsNyRGBDLF40mDlIvkwt7eppg6o6dDUGABV69cUxV4CO6SQz
	 LMJHg4hMfW8oQCqaAAx7dYN03Bl6tKz/Odwy0aTNzBlmnKjIIYUZQA5xkgNR0xii6gQE7
	 BjN2eSke82ZKQSPI6KD8+esR/oRpaUcmebsy+FhZsMObSEI8EqLVXX83TKkN2d5fF/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q8Gc1mFV;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 192B8606A327
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 22:32:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 192B8606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q8Gc1mFV
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so38677775e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:32:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794436360; x=1795041160; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ifjkH+2k40MmZV7RSbPynQ7YvHJ4bk5X1IWs8GsBC/M=;
        b=Q8Gc1mFVPVMJ7Kc526aYIIYaPlqHJb/kg30LX16srMTTFtW8mTJJVYR3Vvk9GKpN8x
         SzWST2y5RrhIWkmHRPq2674Bs6mUVvK+RDaMZZ9CbBsl1gOK+oM+HbD/ZZNAVfYAoZj+
         x63/uBZDVSgruZhKsPKYVX1kwMxcPjHH2uy+TXqDxLWqaoeZ1nyvYkVbdUChiUT48y8S
         43Op2zvSrze6xKkKQepttO5SdxeWgGsDM6VNNOTT/L5ltXA+E3zGoA9AW98lqjgBidfI
         XtMUcZKel9XEeb+SvrogKwvQspT5aBA4TW8dvoXkkcse30vsKNLIzpBSl7Aeok55T3AG
         AiKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794436360; x=1795041160;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ifjkH+2k40MmZV7RSbPynQ7YvHJ4bk5X1IWs8GsBC/M=;
        b=1GQ7FoI5g+9hym+4xKdh3q/Wgf7CidGnjzG73YpHjQmyJk/9rrcERKYFdB8H7XOQ4o
         6+7EzLPFawJPM1bu8dAtlHI0c6ulx5yppe2Vs6F8qwLxllg7M66mCiaxF00ap3VJl1vO
         hgdwdWYXXehaKUcn0itIQI8p4AFBkDsv/BMlNuDVXA7lsCqA89A5GzaME5uhLA14BNzb
         7tIrfNr42nUrUT1bK3d6ieOftEL1Jo0pRZ4rdaQzeKvhCjmPn2Qpl5DULXljEklRYWgL
         LDRN4qwXxFYEcvRGKbGv3zgoOttccvbxEmABk29Uxt8wBp1yafU320NQ9MVP65LetIVx
         FHRw==
X-Forwarded-Encrypted: i=1; AL+hErHQYQ4+4Mu4pAgrFcxCv6VbpLYUZOsPW+VAe06RLSf9jIPeayPa8u6e75ftvcgVGt05/zPrwdWPJNcN1bA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+d88Nsc+9QyZmMKsYoef3ErcuB/5/Nf9NmTp6CikcicH9OiPDz
	lg/SDu9BiAxZnroHt0llhWF9lYf7aau4UTjIu3vijCMJ/aJelQDKAh8kAU3t+A==
X-Gm-Gg: AYBFou3pPX58k9Tk1btAVhDVo8giBgcYCcwP+wsgKuFogXJEnK1Q1BG4STykTSUZ8iU
	Ve13TB1RXxblh+vOn9wlGpY7hiNlahlY6r0L2/neV94SMva8IDHwTeDUkHoFNKp8xdJzvZuo8Fq
	ByRK6nAlQxnIwYDYCI+V7aGRHYb40meJuIe8iXs0zPvf8rhcir/I06yFaqCP50Z8papSkNGDLyM
	Sr1PwcKv2l54EcK+C/5bZKvCt2HcX+HJgDv5hXVGEcaoqiH9sFEUnCSck6LBWm1/Z7W75JJ+3ZD
	6P+hpU9oxYxoPUV+KePu2ATDyNPnRujRtaKNMJUpqBu7U+9/zw/ersCfS6G7Zk5xIltktV9iC0X
	VmqW0RCUbtWlYRjvaKhGP17wIF54u0CO8x82lci2XxMESntlpMmm86wvcMl+GZXO0PFGrD023os
	/R3umBjjphcFxWorH8YIrhWJbyjDkNc4JgCPYlZoj6LIODNLUB52HxENAOuKRFBb89totpIJEWZ
	v/YS+9Mwg7x3UuPRRz04tnXxikn7nS4C/7DK4YnkZjEMtwV52/UM7V3Vi7RTD5xvfAchrbqwaKE
	X/9ZjjBjKHGddlATjgvPIt4S2JhH6DTB+lxwoTin9kJVpzCn95oQiYuPHcuw+Bm/Z7UoNL89jut
	QK+PCvoTc3p4DGqP5+qPaCa2DszKB3BTaJGlOELg=
X-Received: by 2002:a05:600c:1986:b0:4a1:fa21:fd90 with SMTP id 5b1f17b1804b1-4ba09377221mr64220145e9.9.1794436360284;
        Wed, 11 Nov 2026 14:32:40 -0800 (PST)
Received: from DESKTOP-0KSTGNI.localdomain ([197.45.135.182])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e1f9e5asm18247355e9.0.2026.11.11.14.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 14:32:39 -0800 (PST)
From: Temitope obabi <obabitemitope765@gmail.com>
To: rostedt@goodmis.org
Cc: mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	Temitope obabi <obabitemitope765@gmail.com>
Subject: [PATCH v2] ASoC: Intel: Remove unused intel-sst.h trace header
Date: Thu, 12 Nov 2026 00:31:01 +0200
Message-ID: <20261111223102.1310-1-obabitemitope765@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Commit 970d299b0a0a ("ASoC: Intel: Remove unused code") removed
sound/soc/intel/common/sst-dsp.c, the only file that defined
CREATE_TRACE_POINTS and included trace/events/intel-sst.h.

Nothing includes this header anymore, so none of its tracepoints are
built. Remove the unused header.

Signed-off-by: Temitope obabi <obabitemitope765@gmail.com>
---
Changes in v2:
- Remove the whole header instead of only sst_ipc_inbox_rdata, since
  nothing includes it (reported by the Sashiko review of v1).
- Drop the Fixes tag and the claim about memory used per tracepoint.
- This also replaces the earlier sst_ipc_msg_tx patch for the same header.
 include/trace/events/intel-sst.h | 156 -------------------------------
 1 file changed, 156 deletions(-)
 delete mode 100644 include/trace/events/intel-sst.h

diff --git a/include/trace/events/intel-sst.h b/include/trace/events/intel-sst.h
deleted file mode 100644
index 0416e91f8181..000000000000
--- a/include/trace/events/intel-sst.h
+++ /dev/null
@@ -1,156 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#undef TRACE_SYSTEM
-#define TRACE_SYSTEM intel-sst
-
-/*
- * The TRACE_SYSTEM_VAR defaults to TRACE_SYSTEM, but must be a
- * legitimate C variable. It is not exported to user space.
- */
-#undef TRACE_SYSTEM_VAR
-#define TRACE_SYSTEM_VAR intel_sst
-
-#if !defined(_TRACE_INTEL_SST_H) || defined(TRACE_HEADER_MULTI_READ)
-#define _TRACE_INTEL_SST_H
-
-#include <linux/types.h>
-#include <linux/ktime.h>
-#include <linux/tracepoint.h>
-
-DECLARE_EVENT_CLASS(sst_ipc_msg,
-
-	TP_PROTO(unsigned int val),
-
-	TP_ARGS(val),
-
-	TP_STRUCT__entry(
-		__field(	unsigned int,	val		)
-	),
-
-	TP_fast_assign(
-		__entry->val = val;
-	),
-
-	TP_printk("0x%8.8x", (unsigned int)__entry->val)
-);
-
-DEFINE_EVENT(sst_ipc_msg, sst_ipc_msg_tx,
-
-	TP_PROTO(unsigned int val),
-
-	TP_ARGS(val)
-
-);
-
-DEFINE_EVENT(sst_ipc_msg, sst_ipc_msg_rx,
-
-	TP_PROTO(unsigned int val),
-
-	TP_ARGS(val)
-
-);
-
-DECLARE_EVENT_CLASS(sst_ipc_mailbox,
-
-	TP_PROTO(unsigned int offset, unsigned int val),
-
-	TP_ARGS(offset, val),
-
-	TP_STRUCT__entry(
-		__field(	unsigned int,	offset		)
-		__field(	unsigned int,	val		)
-	),
-
-	TP_fast_assign(
-		__entry->offset = offset;
-		__entry->val = val;
-	),
-
-	TP_printk(" 0x%4.4x = 0x%8.8x",
-		(unsigned int)__entry->offset, (unsigned int)__entry->val)
-);
-
-DEFINE_EVENT(sst_ipc_mailbox, sst_ipc_inbox_rdata,
-
-	TP_PROTO(unsigned int offset, unsigned int val),
-
-	TP_ARGS(offset, val)
-
-);
-
-DEFINE_EVENT(sst_ipc_mailbox, sst_ipc_inbox_wdata,
-
-	TP_PROTO(unsigned int offset, unsigned int val),
-
-	TP_ARGS(offset, val)
-
-);
-
-DEFINE_EVENT(sst_ipc_mailbox, sst_ipc_outbox_rdata,
-
-	TP_PROTO(unsigned int offset, unsigned int val),
-
-	TP_ARGS(offset, val)
-
-);
-
-DEFINE_EVENT(sst_ipc_mailbox, sst_ipc_outbox_wdata,
-
-	TP_PROTO(unsigned int offset, unsigned int val),
-
-	TP_ARGS(offset, val)
-
-);
-
-DECLARE_EVENT_CLASS(sst_ipc_mailbox_info,
-
-	TP_PROTO(unsigned int size),
-
-	TP_ARGS(size),
-
-	TP_STRUCT__entry(
-		__field(	unsigned int,	size		)
-	),
-
-	TP_fast_assign(
-		__entry->size = size;
-	),
-
-	TP_printk("Mailbox bytes 0x%8.8x", (unsigned int)__entry->size)
-);
-
-DEFINE_EVENT(sst_ipc_mailbox_info, sst_ipc_inbox_read,
-
-	TP_PROTO(unsigned int size),
-
-	TP_ARGS(size)
-
-);
-
-DEFINE_EVENT(sst_ipc_mailbox_info, sst_ipc_inbox_write,
-
-	TP_PROTO(unsigned int size),
-
-	TP_ARGS(size)
-
-);
-
-DEFINE_EVENT(sst_ipc_mailbox_info, sst_ipc_outbox_read,
-
-	TP_PROTO(unsigned int size),
-
-	TP_ARGS(size)
-
-);
-
-DEFINE_EVENT(sst_ipc_mailbox_info, sst_ipc_outbox_write,
-
-	TP_PROTO(unsigned int size),
-
-	TP_ARGS(size)
-
-);
-
-#endif /* _TRACE_SST_H */
-
-/* This part must be outside protection */
-#include <trace/define_trace.h>
-- 
2.53.0

