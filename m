Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811441;
	b=w+8Gh/2zrGnnL4t+rBA+UkV25idSFgYPgIDqXn+GRn822MH7MnaXSk3kDFZjYNcH10Mw
	 NHBxaq/pp13PY/FueZ5gSrpzMFZI+n8asfvvnMwyzXr04JzkbT8cW0MXW07quCF1RMTMr
	 yE5T7RJILrNImxPDp9x9Yj1WWGikxto4Fw1HKwLOcr92g3ipcd9xuv7Ysn9QF5JrFQdLZ
	 fXUqkRdj7GgwST/g46rrQ9QIMb4fmr7mtX4e0rRc9G+mzF0ZHGXYbWrisG4XKryUPv3/o
	 e6bb8AJg7+mSuhEaUwoGNMHAcrmI7dFWmlr3frvLdjlWdRXdnQTcfSKBAP9rIQAsE0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811441;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=T7J8ny2XgS4VVLgay75kRvU9FcVv7Jejhnbg0Ab9f3s=;
	b=JUX0d/oQJMnO2J/3ZtkPAeHk/FO+0NgV1WWlVPVzDkaVAB7u+i+05vyPJs42ZLIl+ZcN
	 9q9hcjZO6zBI3mbGmtUSk6O8uFxuT+PVjzhoCXgAH+tI2b9Zsb8bV1VNigNmqdPr9J4Ey
	 iG4itkxgXlogPFIT+h2BKlWzm85+ZDFr6/V4lNEsP782p/2G4O2IAwiLtA6EPz5gFv3eL
	 pSn8MxcbMGYVHeMjTPUwOVxJsBDkhggRzfmaN31b4Hrm5sZABSDsxJAP/VOrg2E27v4vk
	 0xDhevltCWavcPHWfFK1K2sSvBktYYiQDGZ42geMLdHefKK5Ic+TjpmrlK+ZLRTVH+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s2vGqyXw;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55AB2606D823
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 16:57:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55AB2606D823
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s2vGqyXw
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-15ea896ddc8so1615341c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 08:57:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793811439; x=1794416239; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T7J8ny2XgS4VVLgay75kRvU9FcVv7Jejhnbg0Ab9f3s=;
        b=s2vGqyXwPr8s8Gwnu+VGfdfhZQeEInJKusCv7m1LoH8gsWmASFBvbyNMs9FBKJlW4O
         w/PVKNUu/g2ucDcu6JfiST2Wof2Fl94gdHZ4+ToBlnIzT/4AIJVZdBXNtfPGgAsBSqgL
         1/H7gD79joZjeV2l7BTgbhHhmsrcUArqUyxofoaxNIRNKZ6pXyvjQoIzVqbOhoi8nuhZ
         fkgYG+m4CXSEayHsN/tPLXn4fNqtbBO24dqtc4eImBmZZc46UFPcDPz6pSP8397LHEzs
         VPar8yqhNIXgw10k7ke3w5+ezHaZBRs6WLV+x1r+x1dxeu/U2t3tk2qW6oum4qlCYTQ4
         cs9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793811439; x=1794416239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=T7J8ny2XgS4VVLgay75kRvU9FcVv7Jejhnbg0Ab9f3s=;
        b=MZ6Z0c8gtD9egdIZ8zjdvghErG0X94bQ2eEJVAI2mBuRq2TUEj98HfB2KzIwvf4lWW
         m/7DGh/V1gLCP2eE7dV/jAQaufJ7MkvH0ATH9hCcRhOhD7Q9sWeTXhJNxeSCqKHHWdzV
         ScnZzTEDWdWsw5jQqjLcZDqGCgRRKJoOsj0szy2WAga49AVWtRb+EoajZUg7LBhJYEpi
         iIvYNtfzN5S9lEfmgVZNbMM67/paBrrcvhKgcy2kAAoTrD4TQWgAM7DONLDKA20d7UtV
         W3oXMWOuOmk/sg283qNhpujjC+fP/+QYGZSOH5jcy5hVccjEMghGWJ60YptIkU6S0mkD
         3wJA==
X-Forwarded-Encrypted: i=1; AKwUvBy1UEHkS2wlnH+IrBuB7tXs5YVLzfe40kGEmJZnY+5C7UE2i3raqVxe6zc0whPadrMTm6PHJMVJoZy/BSQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ZY4CM8WHZ5Ss3Io0IYwtxCKYQfTzgms98VBybYR139KPrl5J8
	9DXsPa2fCkXUO6II6T5+VwTFERd8KgHNhXnFZ//UltyJZ8i+U88A/JeA
X-Gm-Gg: AYBFou2mtvk9IBRioUdtd6cHneLL9UbaMYte2jvZAM29w2eSMssEYFySO9xQhv8X+C8
	PxWVxyhS91PDCnjqy8CO6qfYd8lSHecj9cxs/621FpqNbyX4UCjNvGUb8Xlh1lS4l/BMZvJQVRt
	7li4DXe3dzsVgkPzQOUgRpaNbp+emIxfrBRfJvfGFMoMhlvku/1DJQr1pnZBNwpfGY5naAt7NT8
	TJ23vhVGCfqQ+Wig0x82I113VENLAThOOYM/lqUIM1/9l3eKwZZ470MPgZW59yC0s+VTGNSk0Kw
	HuPNQrVHiAUg9XnomzWVwqZzt1gFc51FBpdpA9tKvboMcp/wJEsAibKCwOmVCp3rxz3gm7ENeGr
	XU1d6SCiCmBVQflPTsC6h2rU2V7+hR7DwPyQOLK6Kr7XMzSicskn7T2DbZul+M6XyCI3yHiFvni
	uSSomnBxZ2e4dVKltsXCWIiRuU2plJx0WTRlYKZxE05fVFoJnprF8J7B1ohpmb8otw5FaDu44TF
	Qg0Szxj/+bWgPx+cDNxWKfS5Xylb04/bPMc7Ak+ZeJgtSKq2y4mJjTblTDurXm9rovXxQ7M7Q99
	PyBvCl81ZsZGvOe1JxO3IgU3e5Y2IbsRHLDCvX8=
X-Received: by 2002:a05:7022:eb42:20b0:190:3950:43e2 with SMTP id a92af1059eb24-1ac5a0b8867mr24847940c88.8.1793811439033;
        Wed, 04 Nov 2026 08:57:19 -0800 (PST)
Received: from kernel.. ([216.195.201.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d46fcsm9019567eec.13.2026.11.04.08.57.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:57:18 -0800 (PST)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: paulmck@kernel.org,
	boqun@kernel.org,
	mathieu.desnoyers@efficios.com,
	jiangshanlai@gmail.com,
	corbet@lwn.net,
	mingo@redhat.com,
	frederic@kernel.org,
	neeraj.upadhyay@kernel.org,
	josh@joshtriplett.org,
	urezki@gmail.com,
	dave@stgolabs.net
Cc: stern@rowland.harvard.edu,
	parri.andrea@gmail.com,
	will@kernel.org,
	dhowells@redhat.com,
	j.alglave@ucl.ac.uk,
	luc.maranget@inria.fr,
	akiyks@gmail.com,
	dlustig@nvidia.com,
	joelagnelf@nvidia.com,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	longman@redhat.com,
	rostedt@goodmis.org,
	qiang.zhang@linux.dev,
	kunwu.chan@gmail.com,
	brads@mainlining.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	lkmm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	rcu@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 13/28] hazptr: Add waiter-enqueue tracepoint
Date: Thu,  5 Nov 2026 00:54:31 +0800
Message-ID: <20261104165504.2430480-14-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104165504.2430480-1-kunwu.chan@gmail.com>
References: <20261104165504.2430480-1-kunwu.chan@gmail.com>
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

Production tracepoint fired when hazptr_synchronize() enqueues a
waiter onto the scan kthread's pending list.  Downstream users
include hazptrtorture's staged hot-address scenario, which uses
it to confirm enqueue before running its controls.

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 include/trace/events/hazptr.h | 29 +++++++++++++++++++++++++++++
 kernel/hazptr.c               |  5 +++++
 2 files changed, 34 insertions(+)
 create mode 100644 include/trace/events/hazptr.h

diff --git a/include/trace/events/hazptr.h b/include/trace/events/hazptr.h
new file mode 100644
index 000000000000..1eed4c9fd682
--- /dev/null
+++ b/include/trace/events/hazptr.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM hazptr
+
+#if !defined(_TRACE_HAZPTR_H) || defined(TRACE_HEADER_MULTI_READ)
+#define _TRACE_HAZPTR_H
+
+#include <linux/tracepoint.h>
+
+TRACE_EVENT(hazptr_waiter_enqueue,
+
+	TP_PROTO(void *addr),
+
+	TP_ARGS(addr),
+
+	TP_STRUCT__entry(
+		__field(void *, addr)
+	),
+
+	TP_fast_assign(
+		__entry->addr = addr;
+	),
+
+	TP_printk("addr=%p", __entry->addr)
+);
+
+#endif /* _TRACE_HAZPTR_H */
+
+#include <trace/define_trace.h>
diff --git a/kernel/hazptr.c b/kernel/hazptr.c
index 4784df78be4e..16f6e2acaf87 100644
--- a/kernel/hazptr.c
+++ b/kernel/hazptr.c
@@ -19,6 +19,10 @@
 #include <linux/bitops.h>
 #include <linux/bitmap.h>
 
+#define CREATE_TRACE_POINTS
+#include <trace/events/hazptr.h>
+EXPORT_TRACEPOINT_SYMBOL_GPL(hazptr_waiter_enqueue);
+
 #define HAZPTR_WILDCARD	((void *) 1UL)
 
 static DEFINE_MUTEX(hazptr_phase_lock);	/* Protect the list phase flip. */
@@ -411,6 +415,7 @@ static void hazptr_synchronize_queued(void *addr)
 
 	mutex_lock(&hazptr_scan.lock);
 	list_add_tail(&waiter.node, &hazptr_scan.pending);
+	trace_hazptr_waiter_enqueue(addr);
 	if (!READ_ONCE(hazptr_scan.wakeup)) {
 		WRITE_ONCE(hazptr_scan.wakeup, true);
 		swake_up_one(&hazptr_scan.wq);
-- 
2.43.0

