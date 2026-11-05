Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793879123;
	b=M0h6gk7W4X/1S6Y6vDQIYRpNwuSIEyv54BwaX4KAZr3n/UCyNng8iS1rxvHVM0Czk6jf
	 dm/H1bAheTLej8Xn55rnZadLGYUtjm6JfRaQeuO7kDckQmvG9/WWD4gfAi1bVF2CvIWMU
	 PYtlyrYusjXhI9VkBxLZPi7o5dgf4ysOi+kIVWU62J5OKqbvnc0vXX7jkjKxvxjjZkA6B
	 bKzQ6vlPVFltk60W6NB/XNmXiM4WJO+faTo+2Z4BfyUE62UEP3SAgtntOrSIWcjo0UnGk
	 rs1bSeewDwLaKBMFD6dWKeHjm5IBO0neS//z1fD3izfiEv/vIv/FujiqXvllZJWeF7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793879123;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=W6GeqvCDvQ3QbN1jcZxC8ady49yeVHXTODTPfPeIuGY=;
	b=mdqMq4Ljk3zRAveDoGsqphCtHnqnb/Thrl3zyPZnc+Ynd9tXuepAaW7dwdzWWLlRHWEe
	 wGkxOlQacAVxZIIBnrHXgCCltTpuo5lhAaYZqH6EfEVWQCeDT18V5lGkY94J2Zqg43MUi
	 IsSC4RLW/kvaWxs4RmG3UpqYD1jmnPDUiQaOB44QeO+UPY7vlQkVpmwPrr6rvzFMq0Hmg
	 Lx9eu+3e/V1PGUWlC5hj+AgO+F6qjXOCUQPqEoNgafGwE6fGCJsCzEMdXk/tJHxO5+LTL
	 fXJjd2DNF1OgclwIH1SYoQ6y+VKFDKOFMGok10IvmotxroZBga8Dk9wjFfUOZJVX5Pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Z1qyw+go;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FBD76083618
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 11:45:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FBD76083618
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Z1qyw+go
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso11830285e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 03:45:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793879122; x=1794483922; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W6GeqvCDvQ3QbN1jcZxC8ady49yeVHXTODTPfPeIuGY=;
        b=Z1qyw+goqKq0ulI1TfrViW8NeoXgdHe4XMoj/zL+7NaseRo32DFCq9fCsKIHTsSnzB
         U7XlszNcUgctorLtiL5kyyLJTODbM5IGCB6M8mqyMkmrbDqKxIvlDwePqm+cekiUBi8v
         kONFd2MxNA/8xB8erm+gufZVlW1h9IR/vUjZExpxFXqTpAc0DJ321ihd6xtCII0UyXaZ
         cmKCVzdj7FHsxT9QVZMnwPOeAtQbgWNtwVMsOoLRanYCtDdNGHemzmEvmb3z3gIGjmzR
         f7ObqX5rcpCyVYQR2Vdk6fDuIQYE/GFvDIW7sGpalgrpM81bBRG78RuYpIh8gGSJ/4Z8
         CK2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793879122; x=1794483922;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W6GeqvCDvQ3QbN1jcZxC8ady49yeVHXTODTPfPeIuGY=;
        b=pgR0JqGKDwp5AasgVrFNTHPhyIR4K2rJCIecFOZrm14GmhBXguVmhuqoL5INzffzPs
         9ILRnJbEaQ9Xw1X6x51jEXA04EuJo8lcfPNcE4GRLwITclGux2yCim8IuQkaL/AKKgdm
         PIEzdvf/6MNifYT1HxSMtnNOApPR/kHauwBe/XSzVEv/PFOxFU0G0G1A/PN+DSLs3Lps
         Hku8RUFXVfAuM6UOhYuZ86IXkFLAaNH61TZ3bRcD0xbXx4yK7sZ/pD82JQCJlto9t14A
         iokQI8Gs/l5XYFWku7o7QUqvDfvkCztZJO2aFisUFNQ+wN++I025b7qiOzF1Aig2coHM
         FzXg==
X-Forwarded-Encrypted: i=1; AKwUvBz78OctTSGB4HdU8jmiZ9Sw6lCjXWGK1IkfmQSN8bIvwQlvh20h5tsbZ1QS9/GUNpBITOex1piAQVELWP4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8s/YYmD1vPKk3eNw12ZaFg0IAF0ezStF/G8LJwvKm/Fiz6h6bD
	dIIJMpz43+MbrmkvkJvPuay2y+FxbT+u4jHOJgAh4mrA3UoJvZfBq1mhLHc1R/yO1i0=
X-Gm-Gg: AYBFou2q6MiV2XVjKhQBhocJmhzJfCpLrVD9P3NhGYiNQ5Tb1a6v58mCbKRjuXeFvBR
	oN4Fz/DS/P2dO2wECoSLHquySHTRa5q35tByJPI9Re7GJfc9OUt52T0gDhxzbqoWnj7oyTj1pxD
	j2xLlVv5DviEb8yWA8Z0eVvsbMrVOLYiFiwRuANXn6ZYIhBmBPXR5ZjsQ54G1Yf83cUbewToWZM
	OKjaLF7arv9mE+Q5IFutJWY40PlcUwkAyeIc+sn68J1rMdRmr6AEn9g/ebZLTTSnTk6Kvmm59Si
	4pKdtqcdOBGJGC8Nrbr4RDw5o8bqQkHP95hJsu3vT91aOOZAT6ZHbwiXun1JX1dpbZZSnrpSW8q
	dxQouITlGTxaWcnPJGmRjx/QTqdOVOnBEKTR5eOsOdUoTBg2V3w9JXyplnbrkCc5tzK1sjYkYLM
	bYX30neUI7sQGMvGUoZnPyATWl3m+w08cBmRh2c/fV7SHql19rVvj6uGXB5aY1hKab0GSAQlCeF
	DhZ66gng+/hXnOcvGDORa0LfQPCaLMAO+3TeZQxjrBuSsWuDq3+3Sz6w9wDHAQyqPU7ED1SIm58
	lJUmmPMLPKm1nPbxmkB2TLMOHmDpkUy02Q==
X-Received: by 2002:a05:600c:6099:b0:4a1:811c:8078 with SMTP id 5b1f17b1804b1-4ac185bc1d2mr385653795e9.26.1793879121877;
        Thu, 05 Nov 2026 03:45:21 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b571f46538sm56679525e9.5.2026.11.05.03.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:45:21 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Thu, 05 Nov 2026 11:44:50 +0000
Subject: [PATCH v4 02/19] perf cs-etm: Warn for invalid timestamp option
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
Message-Id: <20261105-james-cs-unformatted-per-thread-fix-v4-2-7759e0ce2449@linaro.org>
References: <20261105-james-cs-unformatted-per-thread-fix-v4-0-7759e0ce2449@linaro.org>
In-Reply-To: <20261105-james-cs-unformatted-per-thread-fix-v4-0-7759e0ce2449@linaro.org>
To: Leo Yan <leo.yan@linux.dev>, Adrian Hunter <adrian.hunter@intel.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>, 
 Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>, 
 linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org, 
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Arnaldo Carvalho de Melo <acme@redhat.com>, linux-doc@vger.kernel.org, 
 James Clark <james.clark@linaro.org>, John Garry <john.garry@linux.dev>
X-Mailer: b4 0.15.2

Instead of silently returning an error, print a useful warning.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Tested-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/arch/arm/util/cs-etm.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tools/perf/arch/arm/util/cs-etm.c b/tools/perf/arch/arm/util/cs-etm.c
index d2861d66a661..acfdb3f53821 100644
--- a/tools/perf/arch/arm/util/cs-etm.c
+++ b/tools/perf/arch/arm/util/cs-etm.c
@@ -176,8 +176,11 @@ static int cs_etm_validate_timestamp(struct perf_pmu *cs_etm_pmu, struct evsel *
 	 *  0b01000 Implementation supports a maximum timestamp of 64bits.
 	 */
 	trcidr0 &= GENMASK(28, 24);
-	if (!trcidr0)
+	if (!trcidr0) {
+		pr_err("%s: timestamp not supported by HW, disable with %s/timestamp=0/\n",
+		       CORESIGHT_ETM_PMU_NAME, CORESIGHT_ETM_PMU_NAME);
 		return -EINVAL;
+	}
 
 	return 0;
 }

-- 
2.43.0

