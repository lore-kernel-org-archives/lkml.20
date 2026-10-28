Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793212301;
	b=MvbXbx94PQLcG1Xrp3uuDIsMBh4DG+6HLKDvzAAp6evMnEfJ+ulCGm4LuwpQ9RHER4ce
	 xPqyWMpkRnqIp0tgoefag/DJk9qVPW8/VGVT5bOHON18evapbDoNCX8ryKaddlXTlv2xK
	 TjTPJJ4YWcTRA2JvbAmXaL2YtIfVSS+Qt+MtU7NLaI6d2nG/aIwxakxGPs+PLOCy+tVCE
	 4thaHvK+/5jqvAP3HvKhSPLOFOeQoFa2I8iMYUAmP3KpxJfrxtNHqp4pWgD5wvgJj+1uI
	 O5Q8UIeGNzYOWas8trqYSNVrQO5h+A1QstZx5tCK+OlfB9KmcvbCZjjHeIwl0c1LI3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793212301;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=X+QvVRHeWMxizCTRKzuAHQ+22/m0nu959maLN9qWALg=;
	b=ufmqqTaDJCBRz7DO3wlwdGMK/19ofDHQ3xtCmKRXDs2lbnVtM5GyYgSwG2wr5XKW4DFx
	 95+yvcx/2VOj/NuagbqcI+1dydILCW47G/U86W3oyKDDgbLBVuu0PIotVSZBFmFTJqwae
	 IKOUxauIUDRM7sI0so2sKW/dxmZSAHQGSSTpy5fhAVywDgyjnYpZKcPaaw2JzXRkF6F5Z
	 jiispw/B5f0dUoC2ZbGG0lLpfkcFEF3SIm5YxCNm3pVJ4GE0bjhfWeYpArWnzTHN0sHsl
	 kkyR5rMEg6ZSbncInYJKSRVPI9R9lFqtBZbLjpMDOkOHXSv2hTuhbORS92qdULIuD+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Q3I/SShW";
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4542606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 18:31:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4542606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q3I/SShW
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so12873635e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 11:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793212299; x=1793817099; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X+QvVRHeWMxizCTRKzuAHQ+22/m0nu959maLN9qWALg=;
        b=Q3I/SShWWIQLoN2RtHEvS3tWyt5qY8W/OL12MoF4oRRZohECYlsMONQyUzyl3lwFs3
         dS8/l5SIzHnQV95IUGRfYVivCw80NKIlwiVbB5EfxMB2OSFPl/mQQTgSbC83u9K1E5gB
         beQYiwuVcn+D1KL+RCmy+NZzb5kgy7hbubOhgQdyADaiKZa3TLTwWRrr05JHXZ6Hrq7L
         UtyDKdZ7795d7EDIeGC5/E0R5wXO4N0GIBIUC0LTKVMN2Mr+aHlzWFAIZ552k6mDtHby
         dsLy5FvT5eOaQOEtxMEDuMGr+KSRP+VoW1ehD95Cio/5wcmRqahTaDDG02V3tIwYsa2E
         8fWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793212299; x=1793817099;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X+QvVRHeWMxizCTRKzuAHQ+22/m0nu959maLN9qWALg=;
        b=LkVEIkgbpXbSyMdiH1rBEYiVsG5xr6j63y8TRPcIxZJGnbFKwmra3Yt+BD/z3Itx1l
         DMcuS6nMvbnTQIdyaai5MJSLHHxuuFZ3phsy75+mNCRPYR2fLaaSf+evRyJ0NGd1mB9B
         1Wt9Nmp1RLQhwZpeQPWWSUiOi/rM6hLTHE0zwqmsSzLJnPkBwACsfg/xAOk4pBpigIjb
         yY1L1tedTlmTV1X4hL6dRIrLzUl4rT+YrEirE082WWHTM5fbBnRIopMBdKXOc6rSuqH/
         yJODc5z0dBIkYpCtrPhMCjF7We697ez5YfcNb6Z+u905LJP2RL0L1U56YzHfZvrbxh8s
         zMNw==
X-Forwarded-Encrypted: i=1; AKwUvBz3a1bIn59W7T0dhS4Q8/3mDCh2yCVv58VASWDmEXuMLWTZcqhDuYmaUAl7Pr3uPizHmCXhoDddA0q5XLs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKmah1M7uS1ZTKVfs9LBSxFQTdJ7CwUWarMvsVireHK0tcGrC57
	gix7K4GDBr+ydn4Wdf8k7uYRYjUo8/3GebXwL08ttkqWNO1Ye+HxFVm0
X-Gm-Gg: AYBFou1mRhF6C0pkyAPwsFZPZk+EhtI5wvUzJ05rEHc6oox7/f/tkiuS75oREYG8Min
	ESrFWK2rqzFve0W3Jri+w2fsiZBaIhT6GTPeO/tfXyssayY0bJu8u1sBXY60xC0WikjY2qP8f6m
	PNwrDxyhKHnfYig7iYvpH7uAO1mgY+u3NKYVpTXzmSQeFYJDQ0nd2JwU74ySxYPMhEV/B+lbzqE
	KTKNzPWezxMakit/1FB1DDBqAYWp27LT8JvJiA6xdonqWxlMpkwnuWg4PqwT1dhleITh5YUGtYE
	5L4+fmwFl6/Arlew7BYxWfvGAXRVowE0sPH7GyCRsyupKP1XSkgAseOzK21ehut9Yr7SSPxn0it
	fQkqyRRgkIt54TdoOjfubgPaDX9BsKnc2uQfRELIKGHNt0hLBGQqaXxz65FAaf6XwxVFCzosOsR
	PO+6n4+kyopWuR11h1DLdcLgOVn7f52PPa4ssKXUEWGixC+GZ1waEhgppfrv0U7RfqIvR/nwnxo
	MbpGwaKqk/ARke5hLPHx9kIoOWTlS15PM5IaantzvcCqFCBQTNw6rvXTbyCrIyKetSX6IYmM+sv
	mZ0f32Ka3TAdwQEQADTTUmE7qcXEngNNZpsQiPChyHlAFNYI
X-Received: by 2002:a05:600c:4452:b0:4a2:fe3:121b with SMTP id 5b1f17b1804b1-4aa4eb767d1mr29197025e9.28.1793212299033;
        Wed, 28 Oct 2026 11:31:39 -0700 (PDT)
Received: from localhost ([5.83.201.131])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3eb8f25fsm29193591f8f.2.2026.10.28.11.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 11:31:38 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: John Garry <john.garry@linux.dev>,
	Will Deacon <will@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@arm.com>,
	Leo Yan <leo.yan@linux.dev>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	coresight@lists.linaro.org,
	linux-perf-users@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] perf cs-etm: Fix spelling mistake "should't" -> "shouldn't"
Date: Wed, 28 Oct 2026 18:31:37 +0000
Message-ID: <20261028183137.537812-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.55.0
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
Content-Transfer-Encoding: 8bit

There is a spelling mistake in a pr_err error message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 tools/perf/util/cs-etm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index bdcf94813129..65bce2450549 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -434,7 +434,7 @@ static int cs_etm__map_unformatted_trace_ids(struct cs_etm_auxtrace *etm)
 			continue;
 
 		if (!intlist__empty(etmq->traceid_list)) {
-			pr_err("CS_ETM: Unformatted queue should't have trace ID\n");
+			pr_err("CS_ETM: Unformatted queue shouldn't have trace ID\n");
 			return -EINVAL;
 		}
 
-- 
2.55.0

