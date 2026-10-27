Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793142930;
	b=h6Yloq5Vqmjau21z2ZkFPCbdURswHi9L1j4K/eGUlaiCDqWMXM8WYsq9mDlq00jSF6GU
	 jxopGV9+UXr0M7kt2sfBIDTsnmqt0S42GGt7lg4NVoLk0h+OrNW5QEtfJtl5VR4WgTwae
	 VjMqdOH24zlPqYmz6/JoWEIpvLPvxFnmmn+qPM+kgXTj+a+UzL+kZUAtb2Pln2CvnsY5b
	 qXh27IR1t2DzMLY8s2QDekFsYRcowuZEJKyhFa/b592jCfPAtqAem262CU58oYEvoGOhB
	 V6JfaTEY2dUHzf7jVbkbDp/vrBu1lQy3CuQoYewIkOTJsVk2XiW0d/pi8lHZW3aiEvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793142930;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=1BbjDV/G8k9/BbDXqFFKYGtAlZFq/V/hDkVkSx9koiQ=;
	b=PUPYKglFRvc/xT0PIhKvGyy4ensgmmHgxAoNkucI4mCUsIcs91cGz9lliAmw3DjWo25W
	 nfQQcfPFJlGWhuM8kxanXNe4wSOyRT2TwgQrY0DzPCCSoM+eMM/AqKHI4LkoeMaHMSrOj
	 mJRjAsyZDPrXmrNY+2HeJmavhfBWHMKI4bv5Sx7zjwdA+pRxmrDtf/K/kZv7F7ZY7u413
	 MF76Pd9iAy3YWkD8ChLdtTZtXUE/0nEhHOzRI5HaMymhMdWa8Ov/7iXnAhYBEiDyc5U/C
	 HDdSMm5XzFDE969EbF2VzI90+9JK/xiqjDWHqKaQ3IRWJHSZGre0gvitNOHk5lWXlPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=kQtyp+3K;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA27606A321
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 23:15:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CA27606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=kQtyp+3K
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35cbea41088so486820eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793142928; x=1793747728; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1BbjDV/G8k9/BbDXqFFKYGtAlZFq/V/hDkVkSx9koiQ=;
        b=kQtyp+3KWZe6lhKa0THcuoL3gpiDukejVbi4su3A0IFOpRefpWok/+zJiEvqdxUg0X
         6q74T/cu+Wt1AjtbBmVKxJBK98RInHN4UMJtlO0uHoDBuDJmTXTkq5n5nLdlvGPrEEGt
         Dg41KsoGLNUGoSnA/oojCW0T0WeuTPFBIsD+cT444IWjG1YYBQ+HKoH90Ak+vB6ao5mb
         ODVQkmmJt/uwnhXPA24aA/8w470GMMN4ZkRnD44kOCDThlrHUtt3YjXq5TzEHBRGBA1o
         dfQgAQZhQPHN2Vr6THRqoRfaondPifVoirHXPYn0V2LqR0JjZ6OkoNvpvbfxRYP/tDnD
         E2AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793142928; x=1793747728;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1BbjDV/G8k9/BbDXqFFKYGtAlZFq/V/hDkVkSx9koiQ=;
        b=sktl/uii8o7mfa/s94YyFEhA0ntdkrvOxE2v64Y9lAxBYU7/GY8j3qI/Czk+FZ0MDO
         q2Yza6LXL7/4hU96SKnjgNXxAMvNE1OjvRONcHrhU15Wt7kj81LUfK1wnx4bk+c/I1fR
         Qwxhzk04JriaPxqgCcpBsatjMnv4gA4XK2rhkQG/aUdvl/QDoMLLnc+I/efyrfeVUkEU
         3oWYWcdXfNLJzOtOAAtudqTudtzsUNCI9mNWlu/D1e7eX9lBQUwDI53s0J6KezEEghfT
         htUniQbiVkc29MnHposYITdllFfxvgodIqmTMA7crG40/5Wr5R92IQIgA7RWB0BhtAxh
         ndGA==
X-Forwarded-Encrypted: i=1; AKwUvBzkfsNX4kWoxh10/qWe7nGG5Cm4/VFKUqP1J5aBpfsxmHOX2X59WpzlD9WNveLyEOQ+9+/gs5seI5BqwQg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKru1i6inS0t1YowDY/iN1GRJ203LOLCtgN1v8mywueiVzZeuJd
	DuYq9dBmTzOISom3a38VszNwFCxSub1Hzj1z87wRKf0diMfXQdml4IrFoJYPkl0NyriVNNI1E6m
	+eCmfk/ipiA==
X-Received: from dycoi9.prod.google.com ([2002:a05:7301:da89:b0:36a:1653:611c])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:a230:b0:369:a113:7578
 with SMTP id 5a478bee46e88-36a1ff4734emr1028923eec.1.1793142928189; Tue, 27
 Oct 2026 16:15:28 -0700 (PDT)
Date: Tue, 27 Oct 2026 16:14:58 -0700
In-Reply-To: <20261027231513.816148-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20260928075237.3055101-1-irogers@google.com> <20261027231513.816148-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.313.g2479322e68-goog
Message-ID: <20261027231513.816148-5-irogers@google.com>
Subject: [PATCH v2 04/18] perf map_browser: Compute symbol browser index on demand
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, haghdoost@uber.com, james.clark@linaro.org, 
	jolsa@kernel.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

To wrap struct symbol in DECLARE_RC_STRUCT(symbol) and reduce per-symbol
memory overhead, negative-offset allocations ahead of struct symbol via
symbol_conf.priv_size and symbol__priv() need to be eliminated.

Remove symbol__browser_index() in ui/browsers/map.c and compute the TUI
map browser index on demand in map_browser__search() by walking the map
browser's symbol entries when the user searches with '/'.

While this changes finding a symbol's display row index in
map_browser__search() from O(1) to O(N) in the number of symbols in that
single map, map_browser__search() is only invoked interactively when a
user opens the TUI "Browse map details" view for a map, presses '/',
types a query, and hits ENTER. Even for a large DSO such as vmlinux
(~100k symbols), scanning the map's symbols once per interactive search
takes well under a millisecond (and becomes a flat pointer array scan
once symbols are stored in struct symbols).

Previously, '/' search in the TUI map browser was gated behind
'verbose > 0' (-v) in builtin-c2c.c, builtin-report.c, and
ui/browsers/map.c solely to avoid adding sizeof(u32) to
symbol_conf.priv_size for every struct symbol across all DSOs in normal
runs. With on-demand index computation there is no per-symbol memory
overhead, so remove the verbose > 0 restriction and allow '/' search in
the map browser unconditionally.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/builtin-c2c.c     | 14 --------------
 tools/perf/builtin-report.c  | 14 --------------
 tools/perf/ui/browsers/map.c | 37 ++++++++++++++++++------------------
 3 files changed, 18 insertions(+), 47 deletions(-)

diff --git a/tools/perf/builtin-c2c.c b/tools/perf/builtin-c2c.c
index f51fa23f3bf1..719f47dac2dc 100644
--- a/tools/perf/builtin-c2c.c
+++ b/tools/perf/builtin-c2c.c
@@ -3412,20 +3412,6 @@ static int perf_c2c__report(int argc, const char **argv)
 
 		if (ret < 0)
 			goto out_mem2node;
-		/*
-		 * For searching by name on the "Browse map details".
-		 * providing it only in verbose mode not to bloat too
-		 * much struct symbol.
-		 */
-		if (verbose > 0) {
-			/*
-			 * XXX: Need to provide a less kludgy way to ask for
-			 * more space per symbol, the u32 is for the index on
-			 * the ui browser.
-			 * See symbol__browser_index.
-			 */
-			symbol_conf.priv_size += sizeof(u32);
-		}
 		annotation_config__init();
 	}
 
diff --git a/tools/perf/builtin-report.c b/tools/perf/builtin-report.c
index 29085fdc91e5..6672a4d16529 100644
--- a/tools/perf/builtin-report.c
+++ b/tools/perf/builtin-report.c
@@ -1885,20 +1885,6 @@ int cmd_report(int argc, const char **argv)
 		ret = symbol__annotation_init();
 		if (ret < 0)
 			goto error;
-		/*
- 		 * For searching by name on the "Browse map details".
- 		 * providing it only in verbose mode not to bloat too
- 		 * much struct symbol.
- 		 */
-		if (verbose > 0) {
-			/*
-			 * XXX: Need to provide a less kludgy way to ask for
-			 * more space per symbol, the u32 is for the index on
-			 * the ui browser.
-			 * See symbol__browser_index.
-			 */
-			symbol_conf.priv_size += sizeof(u32);
-		}
 		annotation_config__init();
 	}
 
diff --git a/tools/perf/ui/browsers/map.c b/tools/perf/ui/browsers/map.c
index 47f2743cae26..2f070a53b5cb 100644
--- a/tools/perf/ui/browsers/map.c
+++ b/tools/perf/ui/browsers/map.c
@@ -39,12 +39,6 @@ static void map_browser__write(struct ui_browser *browser, void *nd, int row)
 		ui_browser__write_nstring(browser, symbol__name(sym), width);
 }
 
-/* FIXME uber-kludgy, see comment on cmd_report... */
-static u32 *symbol__browser_index(struct symbol *browser)
-{
-	return ((void *)browser) - sizeof(struct rb_node) - sizeof(u32);
-}
-
 static int map_browser__search(struct map_browser *browser)
 {
 	char target[512];
@@ -62,10 +56,21 @@ static int map_browser__search(struct map_browser *browser)
 		sym = map__find_symbol_by_name(browser->map, target);
 
 	if (sym != NULL) {
-		u32 *idx = symbol__browser_index(sym);
-
-		browser->b.top = &sym->rb_node;
-		browser->b.index = browser->b.top_idx = *idx;
+		struct rb_node *nd;
+		u32 idx = 0;
+
+		/*
+		 * Walk the map browser's symbol entries to find the matching
+		 * symbol node and its display row index, then position the
+		 * browser cursor at that entry.
+		 */
+		for (nd = rb_first(browser->b.entries); nd; nd = rb_next(nd), ++idx) {
+			if (&sym->rb_node == nd) {
+				browser->b.top = nd;
+				browser->b.index = browser->b.top_idx = idx;
+				break;
+			}
+		}
 	} else
 		ui_helpline__fpush("%s not found!", target);
 
@@ -77,8 +82,7 @@ static int map_browser__run(struct map_browser *browser)
 	int key;
 
 	if (ui_browser__show(&browser->b, dso__long_name(map__dso(browser->map)),
-			     "Press ESC to exit, %s / to search",
-			     verbose > 0 ? "" : "restart with -v to use") < 0)
+			     "Press ESC to exit, / to search") < 0)
 		return -1;
 
 	while (1) {
@@ -86,9 +90,8 @@ static int map_browser__run(struct map_browser *browser)
 
 		switch (key) {
 		case '/':
-			if (verbose > 0)
-				map_browser__search(browser);
-			/* fall thru */
+			map_browser__search(browser);
+			continue;
 		default:
 			ui_browser__warn_unhandled_hotkey(&browser->b, key, 0, NULL);
 			continue;
@@ -124,10 +127,6 @@ int map__browse(struct map *map)
 
 		if (maxaddr < symbol__end(pos))
 			maxaddr = symbol__end(pos);
-		if (verbose > 0) {
-			u32 *idx = symbol__browser_index(pos);
-			*idx = mb.b.nr_entries;
-		}
 		++mb.b.nr_entries;
 	}
 
-- 
2.56.0.313.g2479322e68-goog

