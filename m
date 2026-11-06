Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793962119;
	b=o3u2bOSd2eI7R+v5J5MeYRtovIbGV+mv+weBVnwLEPT3P6nX/Clc+wVFU826YzvUPjg6
	 j581tcfsMMUyXqprQAghTLbYk9R9ZO/Mr5b7pVCSYzYPsP6hOiFB+vkWy8OAIN+qczr6f
	 pzHsNKlDfRMpu6Ywuh5rxb8sCGyKqNB79ITtG7QuvQEg9vsDd/asEcnCTHFqN77MyCgt8
	 wiK3KOgvxRWfZk06NQM+4oAHWHdGMnyj/YIxIQwlq5lkfFrwL9mUli22ETWRJZVGhXSau
	 M3PNhR7/tK7zcCZSjuBgZ1BdycnVHQLUBzu+Oo0sba2vlurtGyQ+di2RNnPSAl686Dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793962119;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=+NDIW4GYlXIUEZa7G8ChY2/F4l8YQP7LThVem17rj6s=;
	b=oc13/p3DwlN0K2z9lFkLrm2y8I4PvaMsWWRPKvfICyTP8vjVp22U3fKMD0nLdLw28tAh
	 JWDEQ/wCNytl4nTC7CUTf1vhfcI5rDNjm4dbwZjP2uUlVqKdW2MsOTMcp5sGQ80sYvyjB
	 9SObUv0N2uuHQeooZi++Fz+m3oVXj5kmrG+bjZGNUaYWlnsEssaaRxu8yB4NdFPe4z+iD
	 dRT2oscumG8AArtDJF/u8zzjkMy5Sxrl6GNS+/CZaOTzcUGPGWsmV2icefU91zoSV54ev
	 isYxcDebQUb3GLkJQWtE5r2YFmpTRj7oCblxBNgVKiP8Oq5yZ5Li2F3Ee2XxnQEpmBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=SEFTbpFH;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0362F606EE94
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 10:48:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0362F606EE94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=SEFTbpFH
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-49376eb635fso71398f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 02:48:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793962117; x=1794566917; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+NDIW4GYlXIUEZa7G8ChY2/F4l8YQP7LThVem17rj6s=;
        b=SEFTbpFHSvLhuLD8ZLY6OFEBDgqKqu8thUW5FHT7S5WQjiAqQYAG9Ahg/9DGUSU9U1
         qUsPmJCeC6nZECCR0oz4PmyCtQbwl/shEd+2tn8s7M90lmANszukREymxoj01EXFFSXQ
         3xR/CKllP4ovUgJ1L+a/zmu61nFeWsMVwbuCBLiFufUtVJSgQNW6vUU+Z1HDGAYW8erV
         S+mitXBJy+xBqSl2+C/LWupcS7cbUEfe1JBOMZLMN0K5vPhQNj5PIGdYxEmNmgGttS8q
         CaYCiir5hGZgi65OKXDnhHjx6HPg0zSMbB9RZXjp2YaBc5X/8AmLweJiG7JFJDLxGtTx
         bMfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793962117; x=1794566917;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+NDIW4GYlXIUEZa7G8ChY2/F4l8YQP7LThVem17rj6s=;
        b=NoXC98rgPpwnlnCltQGxBFGVukO5+Tp9nkDrt8A0EWO3kQUusC0ikLXPpVp+Scp4bL
         tTzu6G2/86Vbg3V9GiDZ62KmapkGgcNyDpnknVLsUGNqwtMHM82Xi9ZckEyXIomBnp3J
         /IvbzKVd9HEKtw0CgL6FkIfRRyCQLywKQfWnSq+YrUNOMZajsIREVsDeVZjsJKMBjfaf
         uwDG5VBaR8JQ45uvHzz0UZfuLXklvU0OsrlaIpOH4M+rHEZresyrRwGbc19rkYEKC7EU
         vMr94l8BhL+gu/8C1Drl24+/8JD0oPDghrkLLTplkyjI5MzCBKWt8TIJrR1YmC7WUYSZ
         8Iqg==
X-Forwarded-Encrypted: i=1; AL+hErHRkCmrDM21RqhZXPE3MmQmkzZaV+DFWKXam9MoFgG+zXn+TMt6IgHAMwo0ZgKFXQLZk0f31/vxPfPeJYM=@vger.kernel.org
X-Gm-Message-State: APuU4Z87HlTtp+8CVcpGQImb0nKI2FWUtQUITy0EXGUwXlxPc42zTxpq
	U8+sVy2AditUqjGXuysVge/DqTHNQ92kXIS8VOPBwu8CS2/kAJZMmm/FarMvhWT5dkQ=
X-Gm-Gg: AYBFou0BUYRr/dnQHvTlVghB66GG7VSuT4DG3H6rGNku/1j6WVHMdEyt22N3xNqWtvf
	NC/3D+dlfLcFQfDvCk9YFkbIzvderP9Mevi6TBnr0SHEKcApAO/kvhiXdBzddzwU+GYyEcfIv7h
	i3PYxQmYF46/m2xGwufkWNPAiFDWETRZAT4Rt4oZpcsPjwx2dWXiknhLPiQInvswCCskSx7eHwq
	hPztuxB2/ShAO8qIZvSkJPLTdJFPSpCWDMtPO1OgqpYl0yaD7n8VtMXDc+fZWJ9nn0sXjmlST7G
	lNdANH5isiP41VbzC28BivY9iAMzG4Oq2dyoLk20poTGx9wW2cuZMSFUSPLaA8fPoEUmt51k2zb
	uX+cT7cPdthlbS48F8S7eOzApnoQzhZCRYg0T/na2xhU2VaSDNgbvBoUDSwT3LiHxZLTUGGkPWG
	FcB6g6D7znwjN7VyKhE/vPfLcT5leLyydNm5LAO/O2KE3JAllTT4jnEDuRzhzji6YgdenKGAE2P
	4qVjZbTZk303v8udszwEEHiXT7aV0gB4H0wJPFzGc5XEtlwaR/sKHj7AtPyKAxOR+OSxkdOiFZL
	Ec9ErsDx1+PVz+gW2tiJdZyPaxKdoqUV
X-Received: by 2002:a05:6000:460c:b0:48e:666d:c96d with SMTP id ffacd0b85a97d-4927807d901mr3965431f8f.51.1793962117373;
        Fri, 06 Nov 2026 02:48:37 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d6d63ae2sm3232248f8f.11.2026.11.06.02.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 02:48:37 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Fri, 06 Nov 2026 10:48:08 +0000
Subject: [PATCH v2 2/4] perf dwarf-aux: Support DW_OP_addrx locations for
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
Message-Id: <20261106-james-perf-test-fixes-v2-2-9a912662f822@linaro.org>
References: <20261106-james-perf-test-fixes-v2-0-9a912662f822@linaro.org>
In-Reply-To: <20261106-james-perf-test-fixes-v2-0-9a912662f822@linaro.org>
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
index 742fccba5376..2f0c4b229659 100644
--- a/tools/perf/util/dwarf-aux.c
+++ b/tools/perf/util/dwarf-aux.c
@@ -1658,6 +1658,27 @@ Dwarf_Die *die_find_variable_by_reg(Dwarf_Die *sc_die, Dwarf_Addr pc, int reg,
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
@@ -1665,7 +1686,7 @@ static int __die_find_var_addr_cb(Dwarf_Die *die_mem, void *arg)
 	int tag = dwarf_tag(die_mem);
 	ptrdiff_t off = 0;
 	Dwarf_Attribute attr;
-	Dwarf_Addr base, start, end;
+	Dwarf_Addr base, start, end, addr;
 	Dwarf_Op *ops;
 	size_t nops;
 
@@ -1676,11 +1697,11 @@ static int __die_find_var_addr_cb(Dwarf_Die *die_mem, void *arg)
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
@@ -1806,7 +1827,7 @@ static int __die_collect_global_vars_cb(Dwarf_Die *die_mem, void *arg)
 	Dwarf_Die type_die;
 	int tag = dwarf_tag(die_mem);
 	Dwarf_Attribute attr;
-	Dwarf_Addr base, start, end;
+	Dwarf_Addr base, start, end, addr;
 	Dwarf_Op *ops;
 	size_t nops;
 	struct die_var_type *vt;
@@ -1821,7 +1842,7 @@ static int __die_collect_global_vars_cb(Dwarf_Die *die_mem, void *arg)
 	if (dwarf_getlocations(&attr, 0, &base, &start, &end, &ops, &nops) <= 0)
 		return DIE_FIND_CB_SIBLING;
 
-	if (ops->atom != DW_OP_addr)
+	if (!die_get_op_addr(&attr, ops, &addr))
 		return DIE_FIND_CB_SIBLING;
 
 	if (!check_allowed_ops(ops, nops))
@@ -1837,7 +1858,7 @@ static int __die_collect_global_vars_cb(Dwarf_Die *die_mem, void *arg)
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

