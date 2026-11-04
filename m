Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793818154;
	b=MZtGLduwf4xu544yROv2gMMlBBxjSIgCFjZC2LHcn9IF3zg4NuqIWJjPqXJpsXie8yHf
	 YRTioaqHLRpWSvSyND1yjzRZtSHHN+1G7KwLRuzVaGJtRO6vWHc/JZysIah7A+9TIVYJW
	 jCJYjYoW71evuYOs1j7EeJgTRKVoQb7g6niMlNXXVJUgxh2PuleDBmDlceT8M9QsWtxEW
	 00ErO9L8OcO/VRzhADw65BTHCsoOfTp/TWHU6N1xxhscFJmfQQDo6JdZoZ4cBIWyE9XMf
	 WXgEZjUH3oR9PkmbDZGo7pQFfdlhGYy3EdDPSAkdh8/0hMvZpi2wLlWytbbdhg/5ssw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793818154;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=dosiBfQauFJU+WqcvxLeUWiXahPtDKDMOxRNRzp0hBw=;
	b=L+ukUkHOMspIEE1+FE6iBzcP0Mg+QpqoiAXgE+DpBPJzwaxAd4pLFH6KlWO59K14gJ4v
	 uDiXOwnQ984UTkmxm33/U6cwb5RpQSUXf1y/nK4UhPEOQQvaUwIEprcwqU6MZ5dAvCia+
	 jlGZG9cfPfhZZzy0VI8xO7nmJaqCd5U5oSkjGrmLWRvgHrJ7OeeO8wGG9RGBlqa7VlQba
	 fE6eFlJR/1c7lxAuJ3URSMy0y/jy1PccCLR3j3qaw+4hVvCvKZYno8KXj1bvyuEkhSBbV
	 hR9KnCl0er6G7MMr8pTM3cIA9SYmFz0UtymsQLeu/kRaEEFX+Cz+RkRz2M+4k+waKMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QggkXGn2;
	arc=none smtp.remote-ip=209.85.128.181
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D8F606D810
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 18:49:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14D8F606D810
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QggkXGn2
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8b0f59a5fdaso12437897b3.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 10:49:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793818153; x=1794422953; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dosiBfQauFJU+WqcvxLeUWiXahPtDKDMOxRNRzp0hBw=;
        b=QggkXGn2YSOj5IlaB5fj+scgrNojhUaAHCje/PSEvA2S+LDNHOnMUe14nhEy5POFwA
         NE4Mldy6SLOhm57tiM4I0ffTXHu6Dj3WPOz7rRf9t0ofYcmwxV1aJ5EG/dIAdCItvG9G
         wOxDJ/Y3gE85VIYdjfVhbPZFV++u7HptcKBqHUQh0obvpdaru98Utel8jrO0/cn8TjbU
         PXO1QeBzGr8cI4SO+VgAhk81qTMfDGLmyrdnwL8vexIycN/nIbBuN9H+0QRTMGEqKZyV
         o6zXQIoIbXHphZWmfXgYAH7vx2EcF6ttfiDsash0+oHIMVn7pfGlMkflWKpUVA9cy8Za
         aJSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793818153; x=1794422953;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dosiBfQauFJU+WqcvxLeUWiXahPtDKDMOxRNRzp0hBw=;
        b=QhbWN6kXUGtHV/SRSiv1KE6AlifKdNzDbLyNeNyQmU0+qYFAq4kPqncsqrWcrI5m8B
         1uRLRiM5Hm9x3yl4MV2dOL7Mzw0gf1yqooWRuQ85P75FdWNiGfZa8zfrUM4iYJAmXc9o
         Bp/hNOa/sPb7s3zvaOd2oBwL6zdLye3VckTsNMbuZCnhnshKgMltiWVoOetm9FI3vHLI
         +dgr//q1ZwUkKerupWVpsZJa6j48dL2x9aupsq4yfQowvZl882KDzBsybws1R6Hi1PnA
         tyLGoSBOQ4TbHtOU+inwVDqOSYiJYvEWXEOKq3o91TuJCqeKYfhfsDY8ty0dslEbgmLz
         Hj3g==
X-Forwarded-Encrypted: i=1; AKwUvByDJymol1bvZPVn/gZGM3zEzQoC938SgwY4YQMbA+YOKGcudaffGwKbztc8K0PM4Prxg57mH4WlBtjRwWc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+t5mXpISURV+LTm4/fYNDGMXcb+Pl5OEqAdz1YlOqN8lJN3thE
	d+S1zY5VKXHddXHJ4HnthXDoM9fREozaP3noPTd3kruhu2v162/YgA+P+hj01Q==
X-Gm-Gg: AYBFou1TmNExE/372k05fOZVdSsytp4afGxORq1vScOPHi16BkRMe6tBTPZT98AsKmZ
	YxZeBY2+LiS5RGm9Di4Tw+Pu+JmEtmYKhmv/4GOzZifJqt8RhV5EMXSwjfHF2l55pcRxTmxwidD
	kt9Mgy2YL8piGfMwahdJUQ99tVNRCU6741H1hIzQJGOFcoIradcsXWDIH3GqtEgUenTMTEt/2Vl
	AOsuXz9Et1UlIrWCDagKmi2W2DB4oG3w3bIpV5qYC8JKATcjRnfWjPX9bDWq3TAkBkmYu+Jr3dZ
	8t3R64sTU/p6sVmcqAnMM6ol2Ucy5/HDWkNeO6SrvVe0lvVIBG4PK66pUk+XY2IkndAfmRr7Fqo
	FEWLTQ+UM1Jk7isZTzKNnQuKA6w3uqlHcnP0G2BEX199BZYM7z5THGXPCeRKE/2V5fuzc3zf+h1
	ppqXUx88QSPjTPB16BAQZCZhWYvtK3luAUqbYZJza4x7DttFoEMH5NV1e3DyFuxCyQyEFym0MRL
	K9VpRrO5VUDFEC2YrkilnrGm9nq/sHdSC3bJyp1GNkeyRC9o3HjQZf5tz9SMw0/xPNhcUqGXpC/
	M1h0dDw7NYcHpatrxYMVGc3ud7oJkSiERG2qcbv2ge5JoDypD6gUGnJI6bctsCLJN9BcAVZPvcn
	E0ZLmwc8afQ==
X-Received: by 2002:a05:690c:38b:b0:8ab:3b40:9175 with SMTP id 00721157ae682-8b2b67ba2a9mr119934617b3.66.1793818152689;
        Wed, 04 Nov 2026 10:49:12 -0800 (PST)
Received: from localhost ([2600:1702:7a90:6f9f:66f3:d5d6:2d12:d460])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b3098c28e0sm24623157b3.10.2026.11.04.10.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:49:11 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Wed, 04 Nov 2026 13:49:08 -0500
Subject: [PATCH v6 01/13] alpha/perf: pass PERFMON_CMD_LOGGING_ALL to the
 logging options call
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
Message-Id: <20261104-alpha-profileme-v6-1-63362e9290a3@gmail.com>
References: <20261104-alpha-profileme-v6-0-63362e9290a3@gmail.com>
In-Reply-To: <20261104-alpha-profileme-v6-0-63362e9290a3@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 James Clark <james.clark@linaro.org>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2126; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=IGfq8dWu2iMEFoz3MC34tYu6sOJyy2DqaUpgqZ45fio=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLJe16lcvRmg/U74dVjIvrJYdXEe5dA0y5AzplZhhT8LH
 ym0Lyvr+MjCIMbFMFNMkSVuvSLLrLYdS31OS/+CmcPKBDJEWqSBAQhYGPhyE/NKjXSM9Ey1DfUM
 gQwdo3iInB6DRmZxcWlqkW5aQZFDXn5JYklmfl6xXn5Bal5BeoFeWmZaSUZGflFxKtAIvbzUElN
 XRzcjQwMTS0cLMycLR1MTZ2cnQyc3R0dnVycjS3MTA2dLRxNXS3MGLk4BmGuWqTL8D4yMiA5t3H
 5w5ryvzTMWs0fZ3J3K83+2v+NK06iv6z6sO8DI8OSjQ/O5RWdYxQV/7Wg5b6N/7CFnCPei5Er7j
 xOqToto8QIA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

alpha_pmu_enable() passes EV67_PCTR_MODE_AGGREGATE to
PERFMON_CMD_LOGGING_OPTIONS. That constant is the counting mode bit for
PCTR_CTL, which belongs in the PERFMON_CMD_DESIRED_EVENTS argument. The
logging options call takes a flag in bit 0 where 0 means "count all
processes". It works only because EV67_PCTR_MODE_AGGREGATE happens to be
0.

Table E-18 of the Alpha Architecture Reference Manual gives bit 0 the
opposite sense, but the PALcode in the ES40 and ES47 firmware agrees
with the above: it sets I_CTL[SPCE], which enables counting for all
processes, unless bit 0 is set. Linux never sets the PME bit in the
PCB, so if 0 meant "selected processes only", nothing would be counted.

Add a name for that argument and pass it instead. No functional change.

Signed-off-by: Matt Turner <mattst88@gmail.com>
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/include/asm/wrperfmon.h | 2 ++
 arch/alpha/kernel/perf_event.c     | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/alpha/include/asm/wrperfmon.h b/arch/alpha/include/asm/wrperfmon.h
index c97b82a1f7db..1fa9bc813263 100644
--- a/arch/alpha/include/asm/wrperfmon.h
+++ b/arch/alpha/include/asm/wrperfmon.h
@@ -23,6 +23,8 @@
 #define PERFMON_CMD_I_STAT 8
 #define PERFMON_CMD_PMPC 9
 
+/* PERFMON_CMD_LOGGING_OPTIONS arguments */
+#define PERFMON_CMD_LOGGING_ALL 0
 
 /* EV5/EV56/PCA56 Counters */
 #define EV5_PCTR_0 (1UL<<0)
diff --git a/arch/alpha/kernel/perf_event.c b/arch/alpha/kernel/perf_event.c
index a3eaab094ece..2d9383425357 100644
--- a/arch/alpha/kernel/perf_event.c
+++ b/arch/alpha/kernel/perf_event.c
@@ -728,7 +728,7 @@ static void alpha_pmu_enable(struct pmu *pmu)
 		maybe_change_configuration(cpuc);
 
 		/* Start counting the desired events. */
-		wrperfmon(PERFMON_CMD_LOGGING_OPTIONS, EV67_PCTR_MODE_AGGREGATE);
+		wrperfmon(PERFMON_CMD_LOGGING_OPTIONS, PERFMON_CMD_LOGGING_ALL);
 		wrperfmon(PERFMON_CMD_DESIRED_EVENTS, cpuc->config);
 		wrperfmon(PERFMON_CMD_ENABLE, cpuc->idx_mask);
 	}

-- 
2.55.0

