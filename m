Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793854126;
	b=TQx90Ba30eRz3ctCZGqrjnN4dvkJE6XAmZohNWwThmwWzFZY9gmyf0bH9J2RZoi/QUEP
	 zcjMJ8KWHDTUNU6pf0YTxhDDBqbzsW4PCH59LyBTIpvUvrugGXNLHpaCWONpyat87QVKD
	 JflZUjVB5DCU9yDMCAsjG8dyvVlMCjLuO0VyQHZ4MCho/+N04/fRLFRuc3Eog5SpJgVuO
	 UeAskiDmgFdQM5PHeAAJZeD27DEm8UHB8svc5G7Qyb0mDRD1I/dKPaCfjGUjuzgSAytzn
	 gYyvSQnD2AAfpq5orA1RgBBldbQEQGrEtRPyqR4qGJJ5KAPFn/ab9cczhzRXUe+9bMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793854126;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=3x9cT1KyByPhy6LKIu5Yv62mG19UO3yaYMnxIWxgiBM=;
	b=Pc5FecdhTxS9ZsJq+qqXi9ZEWr5HpKdPwWJ8pZPfx9T9GB1fBe/KfEeuG8C+f8c9InF0
	 5xL0sS+ay89EHqMEgQtV+oty2OLTom+aKFFEFY2HZGIhO0aqyVqZM0PP5AFJbZb32HWrc
	 VFbN/9mQtVI1phcrThSV+iCrke1BliLRxLupSBW7RJPNxYFTrg6IPzLbZS666mY8yB6r4
	 rq+SDAp0w8/Y/mRpvajltWh5fUxioQfu4c6HTY3Ckv7fz5y2pYzYQShbrBZ3BSf7lTrCO
	 vVpFoJ9DFKMWhIEzt2F7Q/lgqEktdnSuggtrVxyr68cPuk9KcDiMsUL3dbU8VfPxgdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=GuZyQNPg;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 195D7606A32C
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 04:48:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 195D7606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=GuZyQNPg
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3662e7a9299so5133833eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 20:48:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793854125; x=1794458925; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3x9cT1KyByPhy6LKIu5Yv62mG19UO3yaYMnxIWxgiBM=;
        b=GuZyQNPgVmU6HizjMMJ/e+W18mfv/8z5EjT6uaMNYIMCg6x8UvFeRmhgJlgz3rIV1q
         +LP70bHG0QM9+pvolRD9fu9WFQ12R80V2r8SCnm+yT+fJ7NN4p1JsfrevydJW/Rxxvxw
         rk2loLNAk88CjLXIR/4TiCgUab5Dh+JwX+9eUwvMeYIVde5IW3HOQiQYPPHlI6ctXxlZ
         r1wD5d3Nnx+nifaKy8NUd52IYskJCszSj9KyBgGjKL8QdXZAJ/xPtIxcjTvdVbRp8BhC
         SN8LD+skh7iC0wtZaQu7de/kcUsechKnbosOnHGfiYezmQSZCBIK7VEzIriuAPE7Z/EL
         1rrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793854125; x=1794458925;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3x9cT1KyByPhy6LKIu5Yv62mG19UO3yaYMnxIWxgiBM=;
        b=fmoH9HYuwRfO3ZBCnf9tOTjEOJixZfJPw9IYQI12VLO+qAP1gd0EtB1fv5wtFJ3B1y
         o5sb2ifmNYLI4vcXKbOE11PIf5fqCngpLTrNyRy7SGcdsjqESPQOl3J/nPxtdYoITICE
         YusIRG1xXELYMs0qZDK/IzO9dw85coYCMAboRyKkt0lTADH0KST9Ej7wRVOzaDdRYX4q
         UeUqazYTfz1etwXwDyv1Uzic6fwVDfn8NQJL/SbmSv0kA475InNO4hqNaXxUluj+Emof
         dX3firpxmVdZroRTieCShsuS9QtgMXj5hR/7z5dWQyGYEkou7w0wosdWfbfY7IebMf0D
         XVyw==
X-Forwarded-Encrypted: i=1; AKwUvByCMQZtJFQbv6qixloguWxTTkexVK+MSkxYCNe1p6oXnzCl6z76jDgFR4ejoG5fXdCAftAlSamOh4/oKPs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+BFkJImFN6M/egVmaqHextHipmdez/ZhKUZDODDKB/cbDHIh42
	gz55cHIGAHltfxW24zQpYPjtJoTWaNZta8FKBulWqYO05F7gx2Z6DLTFG563u1kJ/D916d1e8S+
	+wntU4KrFIg==
X-Received: from dybgh19.prod.google.com ([2002:a05:7301:13:b0:35c:794:f74])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:65d6:b0:368:72f0:353a
 with SMTP id 5a478bee46e88-36a42431e17mr22614402eec.38.1793854124717; Wed, 04
 Nov 2026 20:48:44 -0800 (PST)
Date: Wed,  4 Nov 2026 20:48:41 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261105044841.102295-1-irogers@google.com>
Subject: [PATCH v1] perf jevents: Don't encode MSRs with no value
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Dapeng Mi <dapeng1.mi@linux.intel.com>, 
	Edward Baker <edward.baker@intel.com>, Thomas Falcon <thomas.falcon@intel.com>, 
	Perry Taylor <perry.taylor@intel.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: kernel test robot <yi1.lai@intel.com>
Content-Type: text/plain; charset="UTF-8"

Fixes the events mem_trans_retired.load_latency (EMR) and
mem_inst_retired.latency_above_threshold_0 (NHM, WSM) that were having
their ldlat= value encoded as python's None.

Fixes: ffc606ada3d7 ("perf jevents: Add python converter script")
Reported-by: kernel test robot <yi1.lai@intel.com>
Closes: https://lore.kernel.org/oe-lkp/202611050801.67bb4af4-lkp@intel.com
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/pmu-events/jevents.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/perf/pmu-events/jevents.py b/tools/perf/pmu-events/jevents.py
index 080e04b51b8c..e083f7495e67 100755
--- a/tools/perf/pmu-events/jevents.py
+++ b/tools/perf/pmu-events/jevents.py
@@ -396,7 +396,7 @@ class JsonEvent:
         event += f',{value}{canonicalize_value(jd[key])}'
     if filter:
       event += f',{filter}'
-    if msr:
+    if msr and msrval:
       event += f',{msr}{msrval}'
     if self.desc and extra_desc:
       self.desc += extra_desc
-- 
2.56.0.455.g6c5a503b38-goog

