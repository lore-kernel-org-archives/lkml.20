Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794348504;
	b=M1MdGDHtn3Z0ZWG5w6Hvm8T1zJz1ScII6Qvzivub19rkBk7TsTOu6aYth/DtEUJKxEW+
	 Tomh3rY/z6LmDW1Mf4cbNEOBRxUecRFOBy+lAxqujrv9Ydq0OnD44JtzvzphHBJGqna3L
	 fBRMixeonTG4jQRzEDhMtkCG5qhriY5lP3m1ssAXHLX5Qwrkwe2wOPWmCw1AuSdJ/4K/7
	 q2U9dQO8WFnPrLC4c7AwWQ+kwvpydRQcOZnPV+VVFFiUnHIUWsC0nUPSEcGUn34xWOZLj
	 oFq3K9NDdd7IfV8hVR9m4gtRvDmTIb45HinG8V0mCKji2k8GqGIJn7MfXA22NqxJb/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794348504;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=mGcfYbMPj8IwWwyiHhdRUSmz+4bidkToTLWPH+Ookn4=;
	b=seOiSr/q6BSP0i1+QtbqR9SlGvPZHXSSKZ7GyReW3nG3ryf8EfcCf+idcYRvGP2cXtbp
	 KSe/KaxZn7EtkIpYwdqxZPZGMGCeP4Z5EPspJaHMeuGpKEQpjow9uaOS/gPUa1viYfZNl
	 9gVODsppjZXPO4WQAljDymqgcG8enGYgVvUhv8NQAQSv5cGb6S+Z52rft8hOpmhYJHhwQ
	 XIX24yrd5qiHWkERqC+I5n4mz/bWpMZk+XIwEsdK5KN3BKMV78TRHucROsG6a/10mfwpc
	 dbNehLimSFvXkWCIRFmxV6mnDfhkoUSJgPtzzDFzGmcc4ERN29XsartN07oymPEOJ5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XjRtr9io;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2576360A5BE5
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:08:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2576360A5BE5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XjRtr9io
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36f479b9819so4480775eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794348503; x=1794953303; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mGcfYbMPj8IwWwyiHhdRUSmz+4bidkToTLWPH+Ookn4=;
        b=XjRtr9ioXzaJEDYsbRTqM0nVMi5yc+sSFRyWieAdm+rPmmbuMu06DL5cdnMiXOZPt5
         ZJZwxNIPMBD0DAuhFMRNiggSg3RBWaXgV3iZFTInD/NCw9ygluTAQJDJmMeXzSTfVqBp
         lIbD9k/e9T4uJXYmBWrvD1zbcO6mJP5B0MEBcpukYV2z6VPlVzKJl+8pnHPCZhT6aOXi
         omg2UyGvIVGSciU9PevJgI/uPkpEtbzkX/tPrRJ7VplsSUaFeeaqEAJ1v5w/whesyu6R
         RhLI6euXpqXNov4EQDgIWcXWF32pbyT6ovjQgzPwZl/6QlcFJac/tEN+kjpD1oTjeoMl
         YqyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794348503; x=1794953303;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mGcfYbMPj8IwWwyiHhdRUSmz+4bidkToTLWPH+Ookn4=;
        b=n2pzIUvpPIXnkAOtFgy4TaWRyvsufSBWqTLhouTqhfkHLjeIfUl7WoGc7hRmhxoNnb
         uSJdAD41GDziu4S7jDTvJB+mryKMLRh0/tjEZFqMvdtJ7HLoSN+zf0la44zsJPyCP6s9
         qXWByVShQbWQj9mCGQvu9XhQMWgDSg5pEBgyIgm7uqXeqSTAS57SDvtpCwa15Tb4spm7
         sJI2jEQXR9zaJ+Ct1pdp/8aKU7K40g/RjAD9ef3xsUoDZg2rqKl02h0McY9P1p5hIGB6
         HHHxwCCqh5S594KlMu21e7uGUAh7CIuAwxwd18Ur9fncOOl8oPh8Qq1ooFR1Zrzq3J6r
         hAhQ==
X-Forwarded-Encrypted: i=1; AL+hErF53o4l2OddMRa0Cz9k212/4Ifqj7M6youXfGodtXXVzW+pqOQ5PrJppEsGyDgu34NSg6NH5cd8whEnJ+Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z+xiMdNGTUSb4AmmR0z+RBC3R0mb5T9Pkn9zB3zg58pCFduI12U
	pPnn1AiN8LRj7ZRB7pGDBqeaIX6nRhXgNiwCdtOV0UiGXY/OXGFFqyRm7Sk9hCn1gjgTfjcgtTJ
	ooOXhA3R0RA==
X-Received: from dlar3.prod.google.com ([2002:a05:701b:21c3:b0:195:d59a:94bc])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:458e:b0:1b2:42db:8a1d
 with SMTP id a92af1059eb24-1b3c0337490mr470920c88.29.1794348502797; Tue, 10
 Nov 2026 14:08:22 -0800 (PST)
Date: Tue, 10 Nov 2026 14:07:46 -0800
In-Reply-To: <20261110220803.2503416-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261027231513.816148-1-irogers@google.com> <20261110220803.2503416-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.542.g3ef89b7020-goog
Message-ID: <20261110220803.2503416-4-irogers@google.com>
Subject: [PATCH v3 03/20] perf vdso: Constify dso parameter in dso__is_vdso()
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, haghdoost@uber.com, 
	namhyung@kernel.org
Cc: adrian.hunter@intel.com, james.clark@linaro.org, jolsa@kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	mingo@redhat.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

dso__can_shrink_symbols(const struct dso *dso) needs to query
dso__is_vdso(dso) on a const struct dso pointer to exclude vDSO images
from symbol shrinking.

Change the parameter of dso__is_vdso() from 'struct dso *' to
'const struct dso *'.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/vdso.c | 2 +-
 tools/perf/util/vdso.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/perf/util/vdso.c b/tools/perf/util/vdso.c
index c12f5d8c4bf6..7f2dde70f3e4 100644
--- a/tools/perf/util/vdso.c
+++ b/tools/perf/util/vdso.c
@@ -361,7 +361,7 @@ struct dso *machine__findnew_vdso(struct machine *machine,
 	return __machine__addnew_vdso(machine, DSO__NAME_VDSO, file);
 }
 
-bool dso__is_vdso(struct dso *dso)
+bool dso__is_vdso(const struct dso *dso)
 {
 	return !strcmp(dso__short_name(dso), DSO__NAME_VDSO) ||
 	       !strcmp(dso__short_name(dso), DSO__NAME_VDSO32) ||
diff --git a/tools/perf/util/vdso.h b/tools/perf/util/vdso.h
index bc74ace603ae..b6e05bc2d9f3 100644
--- a/tools/perf/util/vdso.h
+++ b/tools/perf/util/vdso.h
@@ -19,7 +19,7 @@ static inline bool is_vdso_map(const char *filename)
 
 struct dso;
 
-bool dso__is_vdso(struct dso *dso);
+bool dso__is_vdso(const struct dso *dso);
 
 struct machine;
 struct thread;
-- 
2.56.0.542.g3ef89b7020-goog

