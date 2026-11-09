Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794232106;
	b=QSwHRX6ljX76Ro0M5Wm7EO7ofX/l7ZBW1uLrwgY9XLhksGdzssTZZlACkeHfpNOKDWqB
	 3tHHiSXWruhLCRt+67jD0TnAKNN6VNREB3WD8Mkl4CtJZd45mTVwODML4subQp7iDrhqo
	 zx1pVGsbEbCoI2LA2i+BKRJGn34dUcnRtbTIy/LgKANlX9y45qV6grcEezddHC5ydyi12
	 2ody6SrzygYyLCy7OYgxkxMSbqNgG+KrD471aXCh1/+bwbYq/h5nrm6hkdcb6Fan13ckV
	 IHkl72PGdsDLww0yo2TVqUsUSZQpqrk1h0H7cuDbQq6YKhEL9hVH/wyI7v5rxBLh1PQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794232106;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=bvVa3bulUsYqSwCXV6o2ClwLUYzLh1XdnIqlWVEHka4=;
	b=ISSYhBv2q2M8hPeXyWlultDKAgCrBZq2waiNSijTnOzQ34bwLsAh6r1YvU4vjW4AsUmj
	 LMBdomEyalUBU2IlgUGcLdCeqV9fsIh2zPMoes6Aa6vGoik2HG4KfBdF1EPR0SBGcN7aV
	 Q6Iw4n5nrgjGAP1rS0Z4g6yZ5Loon89nDWpkqAUsCvOaLXdF8iT0yK/Abn5e/JS8w0CEI
	 CPJ4vgaIyGftAJKDu7MUzjFO9PGNsCTxixPBZ6Neb1Opj/Q+DXl42DqXICBchptBITPt/
	 1+bph4fy5Kh5EZ6N5v/8yz253ro9sAshUQTEpQKaBB4uLWiadm9BMC/R+TxRLEk0GpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=bQ1u8Cx6;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7903606D802
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 13:48:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7903606D802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=bQ1u8Cx6
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso9726435e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 05:48:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794232104; x=1794836904; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bvVa3bulUsYqSwCXV6o2ClwLUYzLh1XdnIqlWVEHka4=;
        b=bQ1u8Cx6ADf0WgR5Bas7K5VpPdlLILisbMB0KN7Kj3GFh/HlLT+erO22gSTeleDybd
         OWTzCEMEUgLnp8Jc1BggaM2xXERnVAVSpuYr2TFt+ys2ajVfBMr4FTQGtZA5OL5mVCh5
         Tfzz/Kigt9UVQDQaCmQ3cRx6xAg9jk0gl4GZl4FsPqYDdMp1N+Gxidru9SXH92EiUl8S
         aFI//wTPFs2gZE8H77d/gLDny4SASMaDnIV1LKX5zJfeg9eHYatQ0WZj4mkKn8QqZE6D
         0RqcvIE1ZmFVwt0FsPoqUU+JYx0xFNZRsJWjStHIJr0fyWxZyP4pbD/ZElYB8NUzYWeE
         lJCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794232104; x=1794836904;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bvVa3bulUsYqSwCXV6o2ClwLUYzLh1XdnIqlWVEHka4=;
        b=nnJ2CFFQtm6ZGnD3X/VXFBIVMWWljQdIkYSNYwM2Jg4nuE+llzPrUMIrygDAMJGWWh
         8lY+vz23WbIDDG84erDZM+X12Z1n6K4C84cvor0l/B/Byq2Fe2J4/9TmxJiPxhLgUtI3
         BYZ8055UaUpOXd4VYOxob6SutBPrwyk7H+XQ+YXWRfELov36RLAEFFDSLW/IfuJtLILz
         BTEJvtBxzahLPS6YhZjnUfBDuZCWACzxzAP024LFGzenbErrdE9gS/9FoMrKzy8TN7Y8
         GohBLLZyuFqnm1dwpUaqK3PQYJyIEzIZlQyhxmFawv+Wz90Z8DnCFBDY6Qh9TzHyl3XO
         cVxQ==
X-Forwarded-Encrypted: i=1; AL+hErEJlXqOSjiwGt/BuNdQF4m99+a7gm6q5doJtBdBN/kzPduMdasx9PZTCXeKqGKBVgK830L70fZRmsSkMQM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8e5irPFuOhLj7hmjUEyYBmNiq7qavBE43pAtRPTTm4YwQ6oa8X
	1IWYzKcCowaMyghA+lsF0MmKWn9MhErHmHAD2pF2H4HspPL1Vs/bIJNjtg6RCw8eCw4=
X-Gm-Gg: AYBFou2R3vkpvsMDYV4t/NaUqfYSUv7X+tXpPKfwJoCX0eNMAIteBOKF5Puc7xxSGE6
	//NbnJLGCfYe4PmgkQ37ijKAA8kxXj2JGnnUIZiVBHufUCuyMqhMJPC5J79jpT71MxFhmFubgyR
	0iUQ8a0m0enyioq3Srv4lzBLW/r5pzJUe+08voLz0UqpxOeWMwgt6rbIERBYVHiEjr5wp93iQz9
	LDto6U0IEavW1T5xSmV4XPA5HBhz7s45Df43XZ0eNtn4WzvH+tIqpD6NeVEbqRKufhPHapGUxqV
	7WAoGr4MCpItOYFJ6OM7DjiA8c+ARPw50p6cTxrSHD0mqHkw7HVuSviHMsNNdQ7OVMvsZsUGp1M
	GBvXOemMJnlWLTsyG1UQhcL+TDlErYBl7+FaiMCuREtDRoy70J9oTjDQCVEDUFhM0E9hJa9LVEW
	lzEGUB3ntkf7NfsgEjv2hdy7b5cJu+0paY5b/zmrQwWNqD/vMy2tCUej8TBvQaI5sBBW6x3ccIo
	mfEEFRxeOUeaX8MgO+UA52MJi9nrQ/KQOuTv8epp72MDWkRoJWz3Ehc0i7/c05Lexy3N/HcmwaL
	KoqFG8tiwMSYQO754z9J8jBzrLLBE93H
X-Received: by 2002:a05:600c:6087:b0:4a1:9663:7633 with SMTP id 5b1f17b1804b1-4b963c6cfc2mr74331665e9.11.1794232104174;
        Mon, 09 Nov 2026 05:48:24 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7bb101537sm98522045e9.0.2026.11.09.05.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 05:48:23 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Mon, 09 Nov 2026 13:48:09 +0000
Subject: [PATCH v4 2/4] perf dwarf-aux: Support DW_OP_addrx locations for
 global variables
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-james-perf-test-fixes-v4-2-355ee6b81917@linaro.org>
References: <20261109-james-perf-test-fixes-v4-0-355ee6b81917@linaro.org>
In-Reply-To: <20261109-james-perf-test-fixes-v4-0-355ee6b81917@linaro.org>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, Jakub Brnak <jbrnak@redhat.com>, 
 Leo Yan <leo.yan@arm.com>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>, 
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.15.2

die_find_variable_by_addr() and die_collect_global_vars() only accept
global variables with a DW_OP_addr location. DWARF 5 producers like
clang use DW_OP_addrx instead, which is an index into .debug_addr, so
global variables are never found when Perf is built with LLVM=1.

Add a helper that also resolves DW_OP_addrx and DW_OP_GNU_addr_index
through dwarf_getlocation_attr() and dwarf_formaddr(), and use it in
both places. This fixes the "perf data type profiling tests" test:

  $ perf test -vvv "perf data type profiling tests"
  ...
  Basic C perf annotate test
  Basic annotate [Failed: missing target data type]
  ...
  Pipe C perf annotate test
  Pipe annotate [Failed: missing target data type]
  ...
  Basic FS perf annotate test
  Basic annotate [Failed: missing target data type]
  ...
  Pipe FS perf annotate test
  Pipe annotate [Failed: missing target data type]
  ---- end(-1) ----
   88: perf data type profiling tests : FAILED!

Fixes: d60469d7c0e5 ("perf dwarf-aux: Add die_find_variable_by_addr()")
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/dwarf-aux.c | 33 +++++++++++++++++++++++++++------
 1 file changed, 27 insertions(+), 6 deletions(-)

diff --git a/tools/perf/util/dwarf-aux.c b/tools/perf/util/dwarf-aux.c
index 4cc231ffcb2a..d972c121171f 100644
--- a/tools/perf/util/dwarf-aux.c
+++ b/tools/perf/util/dwarf-aux.c
@@ -1666,6 +1666,27 @@ Dwarf_Die *die_find_variable_by_reg(Dwarf_Die *sc_die, Dwarf_Addr pc, int reg,
 	return result;
 }
 
+/*
+ * Get the absolute address of a location op. DWARF 5 producers like clang use
+ * DW_OP_addrx, which is an index into .debug_addr, instead of DW_OP_addr.
+ */
+static bool die_get_op_addr(Dwarf_Attribute *attr, Dwarf_Op *op, Dwarf_Addr *addr)
+{
+	Dwarf_Attribute addr_attr;
+
+	switch (op->atom) {
+	case DW_OP_addr:
+		*addr = op->number;
+		return true;
+	case DW_OP_addrx:
+	case DW_OP_GNU_addr_index:
+		return dwarf_getlocation_attr(attr, op, &addr_attr) == 0 &&
+		       dwarf_formaddr(&addr_attr, addr) == 0;
+	default:
+		return false;
+	}
+}
+
 /* Only checks direct child DIEs in the given scope */
 static int __die_find_var_addr_cb(Dwarf_Die *die_mem, void *arg)
 {
@@ -1673,7 +1694,7 @@ static int __die_find_var_addr_cb(Dwarf_Die *die_mem, void *arg)
 	int tag = dwarf_tag(die_mem);
 	ptrdiff_t off = 0;
 	Dwarf_Attribute attr;
-	Dwarf_Addr base, start, end;
+	Dwarf_Addr base, start, end, addr;
 	Dwarf_Op *ops;
 	size_t nops;
 
@@ -1684,11 +1705,11 @@ static int __die_find_var_addr_cb(Dwarf_Die *die_mem, void *arg)
 		return DIE_FIND_CB_SIBLING;
 
 	while ((off = dwarf_getlocations(&attr, off, &base, &start, &end, &ops, &nops)) > 0) {
-		if (ops->atom != DW_OP_addr)
+		if (!die_get_op_addr(&attr, ops, &addr))
 			continue;
 
 		if (check_allowed_ops(ops, nops) &&
-		    match_var_offset(die_mem, data, data->addr, ops->number,
+		    match_var_offset(die_mem, data, data->addr, addr,
 				     /*is_pointer=*/false))
 			return DIE_FIND_CB_END;
 	}
@@ -1814,7 +1835,7 @@ static int __die_collect_global_vars_cb(Dwarf_Die *die_mem, void *arg)
 	Dwarf_Die type_die;
 	int tag = dwarf_tag(die_mem);
 	Dwarf_Attribute attr;
-	Dwarf_Addr base, start, end;
+	Dwarf_Addr base, start, end, addr;
 	Dwarf_Op *ops;
 	size_t nops;
 	struct die_var_type *vt;
@@ -1829,7 +1850,7 @@ static int __die_collect_global_vars_cb(Dwarf_Die *die_mem, void *arg)
 	if (dwarf_getlocations(&attr, 0, &base, &start, &end, &ops, &nops) <= 0)
 		return DIE_FIND_CB_SIBLING;
 
-	if (ops->atom != DW_OP_addr)
+	if (!die_get_op_addr(&attr, ops, &addr))
 		return DIE_FIND_CB_SIBLING;
 
 	if (!check_allowed_ops(ops, nops))
@@ -1845,7 +1866,7 @@ static int __die_collect_global_vars_cb(Dwarf_Die *die_mem, void *arg)
 	vt->die_off = dwarf_dieoffset(&type_die);
 	vt->die_tag = dwarf_tag(&type_die);
 	vt->from_alt = !die_same_file(die_mem, &type_die);
-	vt->addr = ops->number;
+	vt->addr = addr;
 	vt->end = 0;
 	vt->has_range = false;
 	vt->reg = -1;

-- 
2.43.0

