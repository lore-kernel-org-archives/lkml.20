Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB3051A73A
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 14:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790864497; cv=none; b=Ey5cKu6DLFGFjwrHTOE3BjcH2GgAJum9S4Fnc+FkRF6P4k1VRGV30jvMjhM3wFuL8PLUo4A9RSLkZ42/+oAi6wmAN++2uUQvpzh/rMMHxOtAvku+iEOGvq1DGrlPwhya3fsYjSUmm/imucKtZqsj9ZTMiz3C91MRsQ0Nn5kXgpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790864497; c=relaxed/simple;
	bh=znDGNmYS3o91MES6yjKJMlSzUYv2kb9QpctdsCLHqro=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ofdG3qF2/Lp9olgFNBSfp9XTnBDuIj6sdizrf2xFEpnZDlCFGD+5TRJONx1y0uQPjzmCgb1eYs8R854tk/PgD0MSf4iWF6eIevL2VN5dNUyZEKqrn0QbIukJY5eP0Ifor3I4d8NpblL88J1xifCmpAgM92QV4hX3bLOSh6/KmRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YLjWcveK; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YLjWcveK"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4887840c529so2288951f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 07:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790864493; x=1791469293; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=S33UzsYXrhxOtgRyb+fkmOHpk0z2PGLJbFC6/Ufui6U=;
        b=YLjWcveKMl7+IZd7c+6zXvlMgSDOKHNWJ4Id+61csENu9Y9TAww71xQMW5PymlzZY/
         YF+U2Xej5Jyoz5Q696OAiCQOlA+FLcWrjMIKMlRYPkyclSmXG5D5PkBpLB5cSsJYpq39
         2B+kg7SXYbCwGjtkGttYnC/kBRbzZ+d6EVvCmiEZ4qCHSB04ZoP8BTCnyEtMNaCAmQpb
         4KzWm0LtQzU6qDonjHjwgzS9rnB9H5eIRZ0/IaRuGn92o0ERP9yOfRj8NeutCRaFq4m2
         8t6fgtKRuTxMwIGk/LZl1z3ulQj89+W8qalb6W/nRD+UPWXuJHx/yk9KNhQC2+UhbqhC
         6cXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790864493; x=1791469293;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=S33UzsYXrhxOtgRyb+fkmOHpk0z2PGLJbFC6/Ufui6U=;
        b=XppoZMozyWhrzimUdmeo5HXh1mNeahhDnvyKlEgW+Rcpo4cH1iX3qLIwJSDhPV+ZTJ
         kiA9vA/+fodPJEwuPKlFNBy8mnj+jlD6ZAL8ckL085POI+tbwWItztVOzzE4AOEL0NeV
         S2+F7+gpMxxmr8cWM0K/IDhjZpUh4oowpS9GBG9j8MBLAsf9QeebXqPcQatqYPOdAxag
         12flRIz/pBYuLBYGP9Sa+slFlTL4f9Yi/ISqZWn7YcR/aOvUn/76V4MQiy2h1w6J0Hwy
         pW8TSRH2RWB8700ZaO46TSBtC1Sf3hWeXJ6SbQLh3rUQSwJWHsQin+XlQgw5FSZqiFgq
         Hbhg==
X-Forwarded-Encrypted: i=1; AKwUvBy3p0SH9BJDBxDFzb8bwECq77e6xCQ9hr8UbVP1+RU8P2rmXTFKt5IWI9r0Pcfo7xflCOPWXA2cS4ncuf0=@vger.kernel.org
X-Gm-Message-State: AFuF++mtq0FcZmTDGOdDtimU/3N/Zhm6T8bn/iDuzDWnIpdVNCEaP+ea
	7K32Ub4HQ3d7sgTehcOlpkK/c95v0lvEOq3CfPnxKe4H5rFpYQlaRhBCOcSasslKGlM=
X-Gm-Gg: AYBFou3OzqAQYZlbnSoT66sQcOA8gf3KcsG3GRVu79bNsmWixcLf2xMXxHlJ8eqk2GY
	Nf+paWtZnsIL0mT4NiR4fH+Fe5TiwsMVj9IEJZloF+7lMMNuDVA0Vg5zLn5XEWet0vAgR+RwgL4
	LmGMBykj4pO3l2gqxl3TJhuEM+UsiMsjao7CtCGlaWvi2o7oWNfAoBmy0+0/YYKBfKeyc29SHbA
	YtOWBL9ixcwBnpUgAegHShhI51xXcE8ck3eGwGZszgT0HKR3tduWmzf2uvOFyyeiX8SIy0w3Kn0
	H9hBzwNk5yDjMBNqYZQJ2ZxyCIzXHutemjZyP9mPHJYbG8q9XKV0+AprPJOqrzDIyBas2AJwGH8
	+Flvfmsl5fQMQfFWJWoLNUmFR7mPaYvIy9/Gx32dI4V4BxegLm6+OtJUrYZmlMT13Uk7rydrhh6
	bQwHqfbJs0rmFAcqYVd8+G35JJNuDuWdkDpmVRO0VL6ULvFourTFKbNuV7mAi+ostqYICuT5Nrc
	AJdlhXcWrhdrw==
X-Received: by 2002:a05:600c:a107:b0:4a0:1ef1:b62b with SMTP id 5b1f17b1804b1-4a01ef1b7ebmr38500685e9.10.1790864493549;
        Thu, 01 Oct 2026 07:21:33 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a020f7f1c2sm34783975e9.2.2026.10.01.07.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 07:21:32 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH 0/2] coresight: Retry failed HW_ID writes
Date: Thu, 01 Oct 2026 15:21:14 +0100
Message-Id: <20261001-james-cs-retry-hw_id-v1-0-4d45ab46cde7@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFpsvmoC/yXMWwrCQAxG4a2UPBuYmYKIWxGRNvOPTcEqSb1Ru
 ndHffwezlnIYQqnfbOQ4aGu16kibhqSoZvOYM3VlELaxhAij90FzuJsmO3Nw/OkmXclQlopKfc
 t1fRmKPr6bQ/Hv/3ej5D5+6J1/QAt3Ef0eAAAAA==
X-Change-ID: 20261001-james-cs-retry-hw_id-8f1ec3cf2db3
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>, 
 Leo Yan <leo.yan@arm.com>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.15.2

Extracted from the last two commits from [1] as they were only
conceptually related to that patchset, not functionally. This can be
safely applied to the driver separately.

[1] https://lore.kernel.org/linux-perf-users/20260821-james-cs-hw_id-output-failure-v1-0-9d532ddabcc3@linaro.org/

Signed-off-by: James Clark <james.clark@linaro.org>
---
James Clark (2):
      perf/core: Return errors from perf_report_aux_output_id()
      coresight: Retry failed HW_ID writes

 drivers/hwtracing/coresight/coresight-etm-perf.c | 50 +++++++++++++++---------
 include/linux/perf_event.h                       |  2 +-
 kernel/events/core.c                             |  6 ++-
 3 files changed, 36 insertions(+), 22 deletions(-)
---
base-commit: 75ba5c486ea071d44d3f61318c88a7793bc768d4
change-id: 20261001-james-cs-retry-hw_id-8f1ec3cf2db3

Best regards,
--  
James Clark <james.clark@linaro.org>

