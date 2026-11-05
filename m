Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793893767;
	b=SJ+sjp2LVqotBbJgVc7EX1/H1iVMpgBk+mnw8b8VOXHkNcHu9O6uRtRhRuMJhmkFBlFU
	 iXWJybO2FeprS+po9cxIGB9labvUQD6Z3j92EA/F2eHZ/sNvUtEyl3RxT2FvdJ8yGh6I1
	 Qa934FfayxRyl5J/kfj5z/p5+JfvvunRexAdNa0V2J163R7IRjwp0LoaO5gxrEE1MBPqR
	 PPUe3F35CyG1oE/AZubx0v2B6AO4kQx5m+32HP9eNB8VKtbZiW6/WUem5c9ITqaIhfpe/
	 /BKNHFnFr9qqHWe4w1CNNv0Q//QacS8tfNXLRRDGc8EIM43O7TLA70DrS2LaT9voEWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793893767;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=+NDIW4GYlXIUEZa7G8ChY2/F4l8YQP7LThVem17rj6s=;
	b=IFbC3rb6QDbM7PhwS4Pm+XOar/VqquDJ6scCg3Eod5LCU6ntemClLaXSftqtI05bca72
	 Tcey/VnzZ+INZw6Fq5ej6x9tL06n1iTvT4sH+TF+njFWSF1EPqSQG96IZRnEhHLNeH664
	 PZhuwxaDbp2bAnvqsKD10z03FGNXdW0nW04odnykWDj6LQ0CXvATa0c7hrhZPMyScq5Bx
	 WTujLiRSsecw5PhcSgAs1YhGuxdHFK5jtxDtX/bWsAfN0+kbARvuxitFFac3XvgNVen+u
	 /Q6CB7PjMf8AFLzkTrXIZrVWvcZD2nX1cHPrxrfpRI9kI8kxOqUsXnmwR5LkjP+eoig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=idD7VuqM;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A263660A262A
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:49:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A263660A262A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=idD7VuqM
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48e3b22e971so1081767f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:49:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793893765; x=1794498565; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+NDIW4GYlXIUEZa7G8ChY2/F4l8YQP7LThVem17rj6s=;
        b=idD7VuqMdAuKpVjtue7PXp4JiSfknDVNoAXXtFFZVgPrCMLqisx+icEby56tjmLiIk
         CG94c8CKGAqRcu8KlWVpXo/HdNWBeDAZHg6kWKyfPaP2MlK2iXtQfw1kge+wkAyJDDCG
         TTHD/VVJ+HmYoxwfUnpdZA22vJtK3m26BeeaIQoW/Juo0nqtRq5owT0v7r3jgtV3j8sg
         Kf1hGqoQYDNiEo4beiWs7So5xEejNqcNGspsqumFjjPW81583Vx+5VPP8Z74tIYrs2G4
         5+2KwoPBL4xSSLPez1B9Ndf5eKhW5r2VywxKi8PySvpXFIjH6HCuHClyQodQ2mYBmxFZ
         pDeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793893765; x=1794498565;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+NDIW4GYlXIUEZa7G8ChY2/F4l8YQP7LThVem17rj6s=;
        b=Zpxh2FihGSr3zCzPvq4LX3ZhaxCYBymqc1X9cJg6oAdC1mCOuNVNODdNQdbNoMk+7T
         HcK57e9EufNrTD/mKsfiEOcr7cq6j1c88H8iUiDT8Ruw5LEgAjZ0uo3XKswT0cbbvH8u
         M7FwTS/k9Efw7iCJnsNuzP15GH4/mgWg1dLYkPHkGRcGonpNIA8kKKEezHag3hdOVwsv
         +wHXfGVJiawB1k/u93XpFXoKAE2lpSz8Ja1ww2vceB/alQK4NLJ+0lHpu6mqQeUaKWZS
         tOg96iV4THbZDmkQZEbogRmvq7aOyzFxNKQucpH9T+NzwpksHOzxhc8YE3iWenut9Ac1
         R44w==
X-Forwarded-Encrypted: i=1; AKwUvBxfA9+Mqb+ZQeR5fH/VJ2o27exTMw5w3r/JmB0B614gr0FhEBagHFA0gfbu4qfQPJ9jaT7FDWZMZYVYYsM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/+eCCYGtV+7/a6imqa0JQzlCwKYCccee8XmY4RRDyBFO1dKZEc
	u57mK+flVtIgO+HoatF86P4K1e1mDt4FAjm18/ORJTFHwj/Uzt8FFUIawZDE1ikCSJ0=
X-Gm-Gg: AYBFou0AhGnKeiLXgLtjGoC1kCzSn1CMeIQnv3BMsFdvwnYLiqCtLxhOFdWCnyAvlDq
	G67Nj1kF0D67v6UZHzMAL4WehKMtyf0vfDLIWldpLrBjZ85Bq/JJAAp6qEhaJT7xY2tGKT5rMjc
	s+SqGbSryECcyVD/luwqSEVb8y0PQlmDfeV3tRtBTvpqu436wqVKNzT6yTw8WpV5gjESN/j6HxN
	LFa5OB5UdoF54GdusCzu76Ry7HOZPe9ecHmk50KKFYgdssOYsyGmN83Nv3igXUk8yhaC+jzsQPL
	Ti1Z8V7uo8qYiubRkwuvjxutO86y0kw8CX/RKefud9utAuJHbTZWn0ySeIn4wH/scZJLD1zCPjz
	H4SBqA0jcPWw51F6AMlBS1KY7/rb97I+zpPlY4iOydXATGCRr9hzl69KSVYd9B1kyv9u5/WiGmL
	2bsxMk/BbFXI05kORjsey98oVHI7Vn9IgQLqdDoY6UaRNuQty+QYaHVND8HuPfETh6sQib3or+P
	oBv3iuWCaqI8hCWOit7VYFEjKv9D0rCPKrcSzxV9yCHeKKGPVF4mxzteVdbxpsjq9EsGo+R3RJu
	eaewm3MFOVea4s1VYPE4P+B5yyAmEu8B
X-Received: by 2002:a05:6000:481e:b0:490:2d81:ccbb with SMTP id ffacd0b85a97d-4902d81cd6cmr8334242f8f.52.1793893765046;
        Thu, 05 Nov 2026 07:49:25 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec9cd40csm10650462f8f.13.2026.11.05.07.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 07:49:24 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Thu, 05 Nov 2026 15:49:04 +0000
Subject: [PATCH 2/4] perf dwarf-aux: Support DW_OP_addrx locations for
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
Message-Id: <20261105-james-perf-test-fixes-v1-2-0b279bee5830@linaro.org>
References: <20261105-james-perf-test-fixes-v1-0-0b279bee5830@linaro.org>
In-Reply-To: <20261105-james-perf-test-fixes-v1-0-0b279bee5830@linaro.org>
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

