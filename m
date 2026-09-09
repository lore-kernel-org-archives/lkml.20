Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB8B32470F
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 02:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788922250; cv=none; b=VYLSERbRue3ZqHk3UBHfqhgIKXAVfa0nLDTgmPjeK6K6nPm8GaFRKeDDy9NdgdpyeoizfajPWEIl8oxMiP5j91miJSOF1AVr+r/ragMXL5WpIT6q/6qoU2APVZ7cZL0+prqN2HSXY7Dg3G0hdq5QHInEEoE8Xp59BZn2BB7IxBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788922250; c=relaxed/simple;
	bh=Jor5oXgeuFFmM9DJt4tFFBEGt97G7Zs2U7XOztWKBic=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l8GFSGG8aE3TjqlSX+v1PRF4wJ9WI+r60EOPSUVh49r2l/fq20YHS/jk2yH7WCgPTiDazfXusX1g2M88Wt0UBKAE3EMGU2BUOUDhNsCLwd8aTIu6zziSwnJHCAZ7AL23fFGAwAS2Sg7ZrUsXqXG0TE6lujwNRsmWBEPnhV50YWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U9o/zsnR; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U9o/zsnR"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-85aa9c1308dso43174017b3.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 19:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788922243; x=1789527043; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XNYcnB2WxFeBr7ZY16EYpHfgp99fE4ngetuj/d9sZ7o=;
        b=U9o/zsnRIS7SCjOq/dpU1KRO2hr+5piGvO0oW4quatlg0WoaZNSjB6jbJbMkyFvEPO
         9Ei6X+NA2mxXRxSWpN6HTh0oTI0Rw3sDt7/ixBiOweL6yNx/nfR5cYy64JKg7Qh/8mvp
         CeOhBozaaDiw7OFFjBczgmhQXS4F1v98YkvtPEqaH1PvsJiLJ39TAYMJf5FbDTnt6eK9
         TIoQOo9MWh/+I/4LqJacEgYY/O5mmhg4hG3ytrhP18+oGV/TyEhEJFU3b4qkDDwxHx5y
         yVuW+6epVw+L1x2MGa1ycGMwjwyreU1uQMMzTTn1zRswR8p/VjLR3qm/vx4jH+3Fbrgk
         7JOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788922243; x=1789527043;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XNYcnB2WxFeBr7ZY16EYpHfgp99fE4ngetuj/d9sZ7o=;
        b=r4kTHYFoIT+1wfYSz3FZpTKOEE7I1XpvkWkjnKVdI6BtGVHQweIL94ID+jUc1ib/fB
         8UpMyb6TOticiILbPoTUjsGQZ17/FcFMD4mmv+jb4mwIQSWlsNaXz3QRe9J65zwJKnW1
         yT3r0AAEW8gnDhXeHd4xU0mtA3abVbo2oV3EwpkI9Raw/fyx3NK780BJqnxjvzEYAWmg
         TB9+P2Zg0Hd4bIhp7iSperF+Htzeetf6cEjLVJt2+AHmGQJvqMmxnrLqR8oGWyBTLU6N
         1bqypGaLvuXxX5//PJNPI1JuZSo2uLUYSGEjwe6h/8EEDlZAeOKkEzh9GX/host/XQYa
         h+vQ==
X-Gm-Message-State: AFuF++k2Uw1iqoykpkh4ytL9RM4dJK3i0Kx9a5mKrsenH1UYksiE/kaw
	ABDluaMwfJfR7CIJ1z/mAgumz30mYqepZb4G/68k96Jv7lHTRKE/BXwo
X-Gm-Gg: AYBFou3Th860AK8MRqUHxdPiPlpQrNjN7AqSqqJciDZK7+le1x2Us8cCCE9kH0n4BP2
	oBJvbHd464SUndKWCTNZVZU6tGCZz0cR/ZRzFMUGVImWQb1iBqaBK6+IxIb7I0rEjlOpABLOBqM
	HCJ5dBWapO0VYEwUI0aEcBRRdvKAkmZGPrXB1nQaJbDSANAzMBCasdmTleHjiow3ZB6nbca28vn
	bHtLzvGA3GQf5xgVSOzNVSLarKoTlH9KQGiSpq47qoNFyIt2kIVtScm0VAyHAdw8LQtPoaQoUN0
	ttl6uP03mvKYwbcz35ew5kim9T8sm6SCXhrOvtV6lp9vArGqwGgbBVG6gw7GUxPr5sdYH3pECk+
	ZlHIIrnRz6tsOeDjMXkV6Cj02YRlTK119+rpShRWvmpJOE74q1QaMbi/0EnxkwcxYWLRVa1w7I4
	FbHaJDLqIynZJykEHYUlm9wq4wVCbSITV2btb1wCMNtNKBIgtb6qKgjEHNC4fUCM/jKkAEVcw=
X-Received: by 2002:a05:690c:e653:b0:836:ec3d:b5e6 with SMTP id 00721157ae682-8712a9ea11amr97294587b3.28.1788922242884;
        Tue, 08 Sep 2026 19:50:42 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8714bb0efc1sm103407387b3.45.2026.09.08.19.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 19:50:40 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Date: Tue, 08 Sep 2026 22:50:36 -0400
Subject: [PATCH v8 3/3] perf tools gtk: fix two hierarchy-view stack buffer
 overflows
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-perf-gtk2-v8-3-e90d5d155f0d@gmail.com>
References: <20260908-perf-gtk2-v8-0-e90d5d155f0d@gmail.com>
In-Reply-To: <20260908-perf-gtk2-v8-0-e90d5d155f0d@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 James Clark <james.clark@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4405; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=Jor5oXgeuFFmM9DJt4tFFBEGt97G7Zs2U7XOztWKBic=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLIWnKxMDHS7uH7V3Gqnmbe1LwVavFsj+GfHV9aCnjWXG
 +e6dfmqdXxkYRDjYpgppsgSt16RZVbbjqU+p6V/wcxhZQIZIi3SwAAELAx8uYl5pUY6Rnqm2oZ6
 hkCGjlE8RE6PQSOzuLg0tUg3raDIIS+/JLEkMz+vWC+/IDWvIL1ALy0zrSQjI7+oOBVohF5eaom
 pq6ObkaGBiaWjhZmThaOpibOzk6GTm6Ojs6uTkaW5iYGzpaOJq6U5AxenAMw1ClUM/4MN5pnu/S
 1V3LnqF5eIYq2KutSc1vjI+uUNL3qezz6l28Pw38lhY5d11J8G+SKz04vtF2v/NFzoL9z6bc+51
 tJlj/z42QA=
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

perf_gtk__show_hierarchy() builds a merged column header for the
hierarchy view with unbounded strcat() calls into a 512-byte stack
buffer. The pieces being appended come from tracepoint field names and
sort-key headers in perf.data, so a file with enough dynamic sort keys
or long enough field names overflows the buffer.

perf_gtk__add_hierarchy_entries() has a related bug in the loop that
formats each entry's value columns. fmt->entry()/fmt->color() return
via scnprintf(), so ret is clamped to at most hpp->size - 1, but
advance_hpp(hpp, ret + 2) doesn't clamp: when ret hits that maximum,
ret + 2 exceeds hpp->size by one, and hpp->size (size_t) underflows to
roughly SIZE_MAX. The next iteration's fmt->entry() then writes into
the caller's stack buffer using that bogus size, a second overflow.

That same loop also saves bf/size at the top of each iteration but
only restored hpp->buf/hpp->size to them before recursing into
non-leaf children. Leaf entries left the buffer state advanced from
the format loop, so the next sibling in the traversal inherited a
shrunk hpp->size and an already-advanced hpp->buf, eventually running
hpp->size down to 0 and pointing bf past the end of the stack buffer
for the strim(bf) call.

Fix the header builder by tracking the write offset and using
scnprintf() for each append, same pattern already used elsewhere in
this file. Fix the entry loop by clamping the amount passed to
advance_hpp() to what's actually left in the buffer, and by restoring
hpp->buf/hpp->size unconditionally after formatting each entry instead
of only before recursing.

Both bugs predate the perf GTK UI's move to GTK 4; neither function is
touched by that port.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 tools/perf/ui/gtk/hists.c | 29 +++++++++++++++++++++--------
 1 file changed, 21 insertions(+), 8 deletions(-)

diff --git a/tools/perf/ui/gtk/hists.c b/tools/perf/ui/gtk/hists.c
index 716dcf02bd0e..80df3fec8ea1 100644
--- a/tools/perf/ui/gtk/hists.c
+++ b/tools/perf/ui/gtk/hists.c
@@ -449,7 +449,7 @@ static void perf_gtk__add_hierarchy_entries(struct hists *hists,
 		bf = hpp->buf;
 		size = hpp->size;
 		perf_hpp_list__for_each_format(he->hpp_list, fmt) {
-			int ret;
+			int ret, inc;
 
 			if (fmt->color)
 				ret = fmt->color(fmt, hpp, he);
@@ -457,15 +457,26 @@ static void perf_gtk__add_hierarchy_entries(struct hists *hists,
 				ret = fmt->entry(fmt, hpp, he);
 
 			snprintf(hpp->buf + ret, hpp->size - ret, "  ");
-			advance_hpp(hpp, ret + 2);
+			/*
+			 * ret can be as large as hpp->size - 1, so ret + 2
+			 * can exceed hpp->size. advance_hpp() doesn't clamp,
+			 * so passing that through would underflow the
+			 * size_t hpp->size and let a later fmt->entry() in
+			 * this loop write past the end of the caller's
+			 * stack buffer.
+			 */
+			inc = ret + 2;
+			if (inc > (int)hpp->size)
+				inc = hpp->size;
+			advance_hpp(hpp, inc);
 		}
 
 		gtk_tree_store_set(store, &iter, col_idx, strim(bf), -1);
 
-		if (!he->leaf) {
-			hpp->buf = bf;
-			hpp->size = size;
+		hpp->buf = bf;
+		hpp->size = size;
 
+		if (!he->leaf) {
 			perf_gtk__add_hierarchy_entries(hists, &he->hroot_out,
 							store, &iter, hpp,
 							min_pcnt);
@@ -505,6 +516,7 @@ static void perf_gtk__show_hierarchy(GtkWidget *window, struct hists *hists,
 	GtkWidget *view;
 	int col_idx;
 	int nr_cols = 0;
+	int ret;
 	char s[512];
 	char buf[512];
 	bool first_node, first_col;
@@ -541,9 +553,10 @@ static void perf_gtk__show_hierarchy(GtkWidget *window, struct hists *hists,
 	/* construct merged column header since sort keys share single column */
 	buf[0] = '\0';
 	first_node = true;
+	ret = 0;
 	list_for_each_entry_continue(fmt_node, &hists->hpp_formats, list) {
 		if (!first_node)
-			strcat(buf, " / ");
+			ret += scnprintf(buf + ret, sizeof(buf) - ret, " / ");
 		first_node = false;
 
 		first_col = true;
@@ -552,11 +565,11 @@ static void perf_gtk__show_hierarchy(GtkWidget *window, struct hists *hists,
 				continue;
 
 			if (!first_col)
-				strcat(buf, "+");
+				ret += scnprintf(buf + ret, sizeof(buf) - ret, "+");
 			first_col = false;
 
 			fmt->header(fmt, &hpp, hists, 0, NULL);
-			strcat(buf, strim(hpp.buf));
+			ret += scnprintf(buf + ret, sizeof(buf) - ret, "%s", strim(hpp.buf));
 		}
 	}
 

-- 
2.54.0

