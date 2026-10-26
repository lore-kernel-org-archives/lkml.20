Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793015852;
	b=HEvVSWJ+UgYdjDnnu7Up0zeptFWR/IVVc4AJ3TKmEU6Ri9P11FmyHb4Jy5ILIKvOZAIy
	 m+hYQI2C1+a0RSB9J9EIM0wlbze5poEahEK/UYSydqQiCOjKIno2r3/DA9BuHYyW0jtct
	 t4pdtUBbrTwIXCJXy+ATtUO6ia8zy5EBWF0eaWhVro2wBUhNoSwwFa9ZkmqCEZF57PGVh
	 Aa2KBjTI2mwDVMiwJXPM+59IODX0K2jt9/wYkfjjyHlmb1uDeF9WGUeBlUMGFDp/6GYia
	 +N600jo39a2vjD9JO6fAG6m18olTpgsoXb2UgohDiIv6iJtW+YvD5LBdQbQHURQcYDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793015852;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=aihAmrv00F2OMtOf34SnRsUmAwcEw3x/QZSSSBxus40=;
	b=cxOgLBLFLnndlX0F0ZDPZ81q5ogKY6lpoyS3ZS6j1M+GJQbWG/ymthop5rE1uxJj9QeA
	 Bg0j8zxfa1rw+D6L6+Yk0zQ3qnx72Zq7SjveKndkXk2f3gRiDo+G7UPqYQQ9ArB98TUqc
	 wn4jWvY0igP2S4ykgu1wBu06QHk0W8fyYTJkoPBW2xyyaaDl/z/M06Pr/gMIE7YkmEakL
	 GPV7FAY2Mcuoi/UQId358Ryr4DqAV0p/mTBnokSTHkdEqpmVlJUsKVmeaQS0USFSxX12R
	 AayCAjYpo4wUU35NPwv8oGI4jWx/mXmMLnoYWiFbidcbxnkJjuLQvQCJ0nGQE+MvpLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=DhsCI8wE;
	arc=none smtp.remote-ip=111.22.67.135
Received: from cmccmta2.chinamobile.com (cmccmta2.chinamobile.com [111.22.67.135])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BD1E606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:57:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BD1E606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=DhsCI8wE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=DhsCI8wE0saZqwqndtXmUDe24P6H3W16WI6ScFgThKvGhSxD1fzVVV2uEuLKT8juO98rGHafEjeYt
	 pB+WgIIrQFdrqySrfrZTgxvc+a1ZiFyyipMRVYV1poypdMMujCZ2VCEvD1Q93ZIunIiR9aUzm7xmUV
	 TkxtWJG3rV0LX2iU=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app07-12007 (RichMail) with SMTP id 2ee76adf4027d7d-4fb43;
	Mon, 26 Oct 2026 19:57:27 +0800 (CST)
X-RM-TRANSID:2ee76adf4027d7d-4fb43
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from FHA-W6400298 (unknown[10.55.1.71])
	by rmsmtp-syy-appsvr06-12006 (RichMail) with SMTP id 2ee66adf40251f9-b1442;
	Mon, 26 Oct 2026 19:57:27 +0800 (CST)
X-RM-TRANSID:2ee66adf40251f9-b1442
From: Tang Bin <tangbin@cmss.chinamobile.com>
To: rostedt@goodmis.org,
	mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com
Cc: linux-kernel@vger.kernel.org,
	tangbin@cmss.chinamobile.com
Subject: [PATCH] tracing: fix kstrdup leak on repeated trigger keywords
Date: Mon, 26 Oct 2026 19:57:24 +0800
Message-ID: <20261026115725.2939-1-tangbin@cmss.chinamobile.com>
X-Mailer: git-send-email 2.52.0.windows.1
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

parse_assignment() overwrites
attrs->keys_str/vals_str/sort_key_str/name/clock with a fresh kstrdup()
without freeing a previously assigned value. A hist trigger string with
repeated keywords (e.g. 'keys=pid:keys=comm') leaks the earlier allocation
each time. kfree() the old pointer before reassigning (attrs is kzalloc'd
so the first call sees NULL).

Fixes: b527b638fd63 ("tracing: Simplify assignment parsing for hist triggers")
Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
---
 kernel/trace/trace_events_hist.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/kernel/trace/trace_events_hist.c b/kernel/trace/trace_events_hist.c
index 8af97fd4e..4ce857072 100644
--- a/kernel/trace/trace_events_hist.c
+++ b/kernel/trace/trace_events_hist.c
@@ -1481,6 +1481,7 @@ static int parse_assignment(struct trace_array *tr,
 
 	if ((len = str_has_prefix(str, "key=")) ||
 	    (len = str_has_prefix(str, "keys="))) {
+		kfree(attrs->keys_str);
 		attrs->keys_str = kstrdup(str + len, GFP_KERNEL);
 		if (!attrs->keys_str) {
 			ret = -ENOMEM;
@@ -1489,18 +1490,21 @@ static int parse_assignment(struct trace_array *tr,
 	} else if ((len = str_has_prefix(str, "val=")) ||
 		   (len = str_has_prefix(str, "vals=")) ||
 		   (len = str_has_prefix(str, "values="))) {
+		kfree(attrs->vals_str);
 		attrs->vals_str = kstrdup(str + len, GFP_KERNEL);
 		if (!attrs->vals_str) {
 			ret = -ENOMEM;
 			goto out;
 		}
 	} else if ((len = str_has_prefix(str, "sort="))) {
+		kfree(attrs->sort_key_str);
 		attrs->sort_key_str = kstrdup(str + len, GFP_KERNEL);
 		if (!attrs->sort_key_str) {
 			ret = -ENOMEM;
 			goto out;
 		}
 	} else if (str_has_prefix(str, "name=")) {
+		kfree(attrs->name);
 		attrs->name = kstrdup(str, GFP_KERNEL);
 		if (!attrs->name) {
 			ret = -ENOMEM;
@@ -1510,6 +1514,7 @@ static int parse_assignment(struct trace_array *tr,
 		str += len;
 
 		str = strstrip(str);
+		kfree(attrs->clock);
 		attrs->clock = kstrdup(str, GFP_KERNEL);
 		if (!attrs->clock) {
 			ret = -ENOMEM;
-- 
2.52.0.windows.1



