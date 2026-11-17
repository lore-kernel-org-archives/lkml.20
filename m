Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794923174;
	b=4o0gpvVD5KDG3VRAQuCgge04ZAJhSUrzUNYe7EippydRWsoqjpyIwzdFbIw+t4JFt/Tk
	 CPBny3oeBlvDE35+gxTVzhqA4AQ/0dyHAz90cjMpllYt8uZwaGS3FdIK+MixJv/kS4W9u
	 hVOsexou4jxYsdjc71Qs5cRaWoOO3pxKZvL0quj7QVkKpMddnAB2y2cbmDfeb1bRLct90
	 m8DJclSOGmhk0Qw1hwOVfnh86hkMcg0yTJWkZUOLDWBP/EuRyr7JPUmZrj8tAONgUtfuZ
	 OeTU+4KtSNAEqypuFsm/STd49YJXIDvFzrOzsn92GAGBJ3mFoVLNHWGQqyyZxjnR4fA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794923174;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=iNYXgW14YJe8oSqCFEU11pf6U/rhOa8i8bpr+7yIhtI=;
	b=ctaG+1+sKd6fQa/wK3TUxML449+poucfKkrjYOaVqPPWW21IleEMsHxYqELCucGtSNm2
	 w77DNP6UC02s2t783WERQNHrnMGK+K/L3LeWIzdQvTNFcBOQ8J5LVEFq9dyZcX1VpC0Ia
	 8u1TESqKk8ikqQXe1Qaa3cgdSlKzcWgGAgSJD+MBcGl8mgWNAAggTS2epE1UDjumfBaeV
	 xZ1Vugcxf5gvDyoLPZaCFxYmw1uYds5mQfROh4C0cnVLXE6okv0bjgbHhQkdqHq/QVQwY
	 TOrekLWmBqAMIgdeniCB7yLAGbbzY+yq+FNpotagOLuJjZ5B1ASuomYzfXKucIani1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TqwR8CQT;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8402606A329
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:46:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8402606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TqwR8CQT
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so4161528f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 05:46:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794923172; x=1795527972; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iNYXgW14YJe8oSqCFEU11pf6U/rhOa8i8bpr+7yIhtI=;
        b=TqwR8CQTdLUXOb25oFu3C4dDWkXJrCfASgUeJ8SYiGfF4qzgU9jorovVEAXvr68pj4
         2UfImRI9WA+qYM0zYTgWutMfzQRATFOY55TJYa7kRM4FslsYdU1QeJYUGMxngjv4+PpA
         IoRlqJ3A7658+EgPzAtOz1qIbqCoiyDEQvFUc76Hoi7cA4RO+aPvnmf93vLT02SfzViM
         xtx0zinDEUHEVkBhY+59EBMWxZCqL/HrLytWFk4DtonWZitnlOPh06RhZUxCUDiqNGAg
         hQIgkyy8E10Y71whp8DdURZ3raXbYvxuG4j6ZAMWjE0IP39O/P6Whz1DEYqD2k4s6VeA
         SyhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794923172; x=1795527972;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iNYXgW14YJe8oSqCFEU11pf6U/rhOa8i8bpr+7yIhtI=;
        b=X/z9csl3n1/Bws/8wEBu/PynwjQJGvLsBVCA/ZIN69/f86waN+AtUXzOIhLH0LVijU
         gZcKb1gHKyhw5NRDDjRjEGCuugVgKseFmw3pG486wcdDjcTX9gu9ZFd6IW4U+7muKvrb
         J0Lh4rpqDDo3uAf8cAGx7egvnIXvVrac+MGffYoeW1aW0GHSCHF3d++ldzrcLGcJb0G0
         t6GeR6PEyk9+4wYaJLbj/+G1yLl/kMQZMnQrbbKTI4VOS54KpOwrx5FJyuq13XWvyMix
         JpLFUUa+C8QNyJC03MuzqasxYJUa1vtJyZqfPqyFqoljasO0OPe8D8qnkZVt5YVQp3uB
         10Cg==
X-Forwarded-Encrypted: i=1; AL+hErF12yjbsJoH4HdpQ6CdU+Ct03EI2FWhy1DS2UklK5R8vXISVEadxd2icgCqx6e13NHDgtHrKIi/c/8twZs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/r+lOBV6KKFxj4TAQJ2kGVlaruL3wnzRI3jmI0GxkFkz4fHPPb
	Y4QwU/e0e9w1iIwCVkPRk4GdqEl5DmB30EzWLdoIkDsNSLWcOqCmhtyT
X-Gm-Gg: AZFdTZevtD0rOfhI9ibz2DUPXbqJQ7lK15hU1aYvHe8l343hnMfL5si/sn3cBldQER/
	lwpMQREFi3Q+UVRGV03fX9YFughSDfVWWetTP5FXLqVwvUaSd85fR4g1xBjyQn3inen83rIcCct
	iJnhCsb1xFh0YMKsBJaY3OWV0LshAn/f0wnKjAjjJYQ6YoeUqZ3RYK5HOeAo5u4+N/5IWXpS1SK
	L7epy0ZPe/PbbmDBmfhMM2+V7BgjfJWGRTTbRzfodmUEH+tslZ23QGovmOIvpdixX9gSz9E5aBL
	H5gsHc6u2PDympD6mBvm9gWnYXco/oAM5yNWq2KUhHXjoiyY99HiRorq92MsUATQ2Cpq5Iuaml4
	+ZIdIKHSaTUgJrf0cWad/UmKYSAL6s/yYtw0SoPELLj/dvKAlHxvWLRsJob8DGO62yyEDI1P9UN
	6Bdazylsf95lAvC2ZWnrOtEj/Ast6NmU6czcskvlBCQ17pU0K1vYQTNaaQS3u87WKXxMtCMrm4r
	Y0s3GqDJ3kIXyvFDomxbGo2o73QFMUOcFFtwmsD5KoRU+bsM18xjJ7AmQaKFD65V0kFs0hn5sxF
	76oJHVhKtV8Dfcvf0I2++uUoqTnAHCxjYWIl+cMILHBTb+g5Wb/1WplFfuMgkFIQBfSA8n9OpAW
	RQXYmuEZTaLabZGZo4fgRXTUfkpgCRInk3JacxdE=
X-Received: by 2002:a05:6000:2006:b0:490:6e0f:a024 with SMTP id ffacd0b85a97d-49c70b051bbmr31562779f8f.13.1794923171789;
        Tue, 17 Nov 2026 05:46:11 -0800 (PST)
Received: from DESKTOP-0KSTGNI.localdomain ([41.44.127.147])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c888b90d4sm28285028f8f.9.2026.11.17.05.46.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 05:46:11 -0800 (PST)
From: Temitope obabi <obabitemitope765@gmail.com>
To: broonie@kernel.org
Cc: cezary.rojewski@intel.com,
	liam.r.girdwood@linux.intel.com,
	peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	rostedt@goodmis.org,
	mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com,
	linux-sound@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Temitope obabi <obabitemitope765@gmail.com>
Subject: [PATCH] ASoC: Intel: Remove unused intel-sst.h trace header
Date: Tue, 17 Nov 2026 15:45:38 +0200
Message-ID: <20261117134538.1251-1-obabitemitope765@gmail.com>
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
 include/trace/events/intel-sst.h | 148 -------------------------------
 1 file changed, 148 deletions(-)
 delete mode 100644 include/trace/events/intel-sst.h

diff --git a/include/trace/events/intel-sst.h b/include/trace/events/intel-sst.h
deleted file mode 100644
index ae7c269b0824..000000000000
--- a/include/trace/events/intel-sst.h
+++ /dev/null
@@ -1,148 +0,0 @@
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

