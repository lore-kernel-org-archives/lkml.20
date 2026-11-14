Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794681090;
	b=DmMkOiayskyqtM83iWl3rgwaTWi2Xnj1EPaCowbgXFumZJz6puzV4mPunAy54ZXY1LcJ
	 33osJe1+PX9YPpHhcwrHS04xcI7juEnyzDAY6nMRu9TMyhITqKOg+tcKhm5CNolG0iBly
	 cvOmAV0LNlfKrzoFLa2IQshpMMgIXcRJKmkNqJWCutDBN+e/mE4yKqePe1j20GpFXNc9b
	 b753bqqVUgadhMjD9PF9Jqu/KlIhHdJtLnnjLwHD+m70ITmPT866AG+0sJhlKbgmhuMdQ
	 t7L+OFNREdAtFdw+ltmENwGoq+J9wcRyMATanM/CpwLDANb5UHHdx0yAXdxlCiNgBdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794681090;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mLtlrhyK/6g0u52Jzk6ZQfKICIxuEk7VcSNcDVEOcMc=;
	b=1au7/2l3Qe0w5lM8ad+CNiI9ALCq+fnGyS1vvqBwvnz2ZsJOOFMpLHxk4FJE/k2XJ1c1
	 ki4LIGBT/tE/StTd0oTsV49PLLOGjPd/a+rInBrUkzInG9F7S7NB57qksQgWXPRuH6Us5
	 xYMVwCE+Sz99p2Oxnv6WK6+Nl5kc/+l3szMHhst7iOc9JbIAEtNnvQNItbL6xeeLvPdqB
	 NOhP0W1bZHX61/UTVy7IzhhV5QJnWsBprYxMOosCXVEk/AGaEE6eCe84SAIPB4OkTjJFh
	 y2UO2b2+5xy2iWPLq0GUfwOdv9fwwz9IiKYM/LlqtWy16d5HGGdjAaJJ8Of3FXA1Dag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZZU8Wv8c;
	arc=none smtp.remote-ip=209.85.222.177
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F49E606A32E
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 18:31:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F49E606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZZU8Wv8c
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-939ed428e11so43066185a.3
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 10:31:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794681089; x=1795285889; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mLtlrhyK/6g0u52Jzk6ZQfKICIxuEk7VcSNcDVEOcMc=;
        b=ZZU8Wv8co+qWSZtx8nc3GIbSAtiq9clqcMpHrBzyvLcZcvMEU6V22rYopnyG4I0Mp7
         nsPDASa5XCjbJ0yKkl/TjS8v7NR2uM1iTYdzlLH95LYIy8lg9s1HwN64p0JKpUk+BPWM
         wHsheBBPOI1NYs9GDJz7t974CN7xgQoZwQMq/OyxY2K1g/vgDK+6NJtmgOBIqh4PM9eD
         QLsr2HGLQceP9rSCESuySRNiMNB8U+egSh4RtO/j0RQFVaCQk1oIR9Ai8GTsnNwCaxgK
         i2PYA3WOTaNxaeeAEGp10UTi585R11cChkruNP43uTQZXJa4cncL1MyBYvV8guCKoe85
         HZWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794681089; x=1795285889;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mLtlrhyK/6g0u52Jzk6ZQfKICIxuEk7VcSNcDVEOcMc=;
        b=eruRf/VcEJj7jhvknuQSZJT9Blgk721FDnWRlmO0p1UCG0ha8fuxgH+Zi7nuz53WDL
         ImB+9Ct0JHPoSpXxEgcVWItmJkVPsvPkEKPc0ywIJl7XRLKXb5z0uIh37Uy6EAIO+aL3
         o2XSmHt/uMbnVglzPq+SGfi+QGSUmkDh5bmg5XMGXTf9XUbSXHHYbkWEFKarCaSrdQ8H
         YWsFhS1rGbIAsnHroqJFz73aTDwYxnzWswWqFX8qglmw42Iowo7G8M6qmDUGsWMh2yZs
         kMOPV/Kz35H//G5mdvazQ6mE309y7Lnmo/VAYlPBeQuV4x0RuQko7PvPKU2T3JnpZnoO
         3A+Q==
X-Forwarded-Encrypted: i=1; AL+hErFWHkYogkelJvX2ZxqzxD4PL94VPmwKjUiCqORRvEMgCB3HRNpUVZPyk1OWv5w0T6xfB18teBvbutYdHkU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+afQDLxAJcN42xd8y63L2QvZuZhNJru2P9vsErzjC59rFzgRZ5
	7aJD2W75Fquv6NZHxqfm/STqabQpdLswdLqgrgMfpzQefTdXjgw/Exma
X-Gm-Gg: AYBFou1HNiWbtNxxoKu34wsGLbHbPkv4yCeC1tlQyTFTOY+MBnCrfTQioON9o6BebGB
	Gw4C0lx/Upork7j36v1hVWU6hjO2iw6fwR/VY7xYzHEVOtTWDtzZPFzpr9AbI8hfcOGMO1rszK3
	QG+MI1IcLc+dXY02GkysnFUymZeKA4VDxI/S+he/vko6vEmVFDZfeU+eVSrHseDNgxYrI341pJ2
	/8TorUtJpHH7ESaqxx1xPeaWgRQyDZd/zlpJv/6MANXqS8Z+ZLUSuBhjWMq+lQmu2alCYzkrxTO
	unAkk6QcMzajTQBX1q4hRB5AWc0RKavfSA35hXXjs9UQOBI2JSDX4nBQvBzQf73afhFpfgprTxm
	7592TkDyK0pvGB5TeAWYH4l2VNfbPDhVWSCCKDB0vgmbOLlir92HNO4UsbXe+YtG8N9S1FPF13D
	jsqGQBr90g+AbUWek4fJOV4A+JSTTIBhkpnGi2XL8LfRmN09vtLLrbNmg1BVbv4agcWFfT8PyXK
	zRYrr2EIBwXAh5oOn16mXRRcKHtq4wqrqM6EpRn7qU1oUg9lhtVEpE/F+82Vbq0BO/VkS6VRWs4
	fItB6pHLjEKCDMhlJHOfNoqZIG6TfzI1cQIm8i2IraIQLN4YN2Pr0nNaFDMNHOOgCUg=
X-Received: by 2002:a05:620a:8a0d:b0:949:728b:51f with SMTP id af79cd13be357-949728b15edmr90967285a.6.1794681089114;
        Sat, 14 Nov 2026 10:31:29 -0800 (PST)
Received: from yaozhao-prestige14a10sc ([198.58.190.97])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c836f62sm458876785a.23.2026.11.14.10.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 10:31:28 -0800 (PST)
From: Yao <dragonlinux@gmail.com>
To: 
Cc: yao <dragonlinux@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	Ravi Bangoria <ravi.bangoria@amd.com>,
	Jin Yao <yao.jin@linux.intel.com>,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] perf annotate: fix annotate crash for fused instructions
Date: Sat, 14 Nov 2026 13:31:21 -0500
Message-ID: <20261114183124.685561-1-dragonlinux@gmail.com>
X-Mailer: git-send-email 2.56.1
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

From: yao <dragonlinux@gmail.com>

Function is_fused tries to find the previous fused instruction with the
current conditional jump instruction in the annotate_line list.
disasm_line is the container of annotate_line.
The annotate_line list uses list_head and the head is in annotated_source:
notes->src which is not an annotate_line, so it couldn't walk without
checking the list_head. If so it will read annoted_source neighbour memory
mistakenly and most likely cause crash.

Fix the case where current instruction is a conditional jump and it is
the first instruction in the disassembled list, the original code will
walk to the head and treats it as disasm_line which is not.

    -------- backtrace --------
    #0 0x564dd8d5d5cd in ui__signal_backtrace setup.c:0
    #1 0x7f1737e3e6f0 libc.so.6[3e6f0]
    #2 0x7f1737ec10b1 strstr-sse2-unaligned.S:41
    #3 0x564dd8d625ef in intel__ins_is_fused annotate-x86.c:0
    #4 0x564dd8d4bcde in annotate_browser__refresh annotate.c:0
    #5 0x564dd8d49bd6 in __ui_browser__refresh.isra.0 browser.c:0
    #6 0x564dd8d4a960 in ui_browser__run ??:0
    #7 0x564dd8d4cbcf in __hist_entry__tui_annotate ??:0
    #8 0x564dd8d50a91 in do_annotate hists.c:0
    #9 0x564dd8d58bb1 in evsel__hists_browse hists.c:0
    #10 0x564dd8d5a7fa in evlist__tui_browse_hists ??:0
    #11 0x564dd8bf7a98 in cmd_report help.c:109
    #12 0x564dd8c713e4 in handle_internal_command help.c:109
    #13 0x564dd8bd6ac2 in main ??:0
    #14 0x7f1737e27781 libc_start_call_main.h:83
    #15 0x7f1737e278b9 in __libc_start_main libc-start.c:127
    #16 0x564dd8bd7095 in _start help.c:109

Fixes: 7efbcc8c075c ("perf annotate: Fix fused instr logic for assembly functions")

Signed-off-by: yao <dragonlinux@gmail.com>
---
 tools/perf/ui/browsers/annotate.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/tools/perf/ui/browsers/annotate.c b/tools/perf/ui/browsers/annotate.c
index cf36b5347f72..07449944fa2e 100644
--- a/tools/perf/ui/browsers/annotate.c
+++ b/tools/perf/ui/browsers/annotate.c
@@ -155,17 +155,26 @@ static void annotate_browser__write(struct ui_browser *browser, void *entry, int
 
 static int is_fused(struct annotate_browser *ab, struct disasm_line *cursor)
 {
-	struct disasm_line *pos = list_prev_entry(cursor, al.node);
+	struct annotation *notes = browser__annotation(&ab->b);
+	struct list_head *node = cursor->al.node.prev;
+	struct disasm_line *pos;
 	const char *name;
 	int diff = 1;
 
-	while (pos && pos->al.offset == -1) {
-		pos = list_prev_entry(pos, al.node);
+	/*
+	 * backwalk to the nearest neighbour instruction till the list head
+	 * instructions/non-insn are ordered from head to tail
+	 * head is not a annotate_line/disasm_line
+	 */
+	for (; node != &notes->src->source; node = node->prev) {
+		pos = list_entry(node, struct disasm_line, al.node);
+		if (pos->al.offset != -1)
+			break;
 		if (!annotate_opts.hide_src_code)
 			diff++;
 	}
 
-	if (!pos)
+	if (node == &notes->src->source)
 		return 0;
 
 	if (ins__is_lock(&pos->ins))
-- 
2.56.1

