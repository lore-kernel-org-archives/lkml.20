Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F201C48A2BE
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 11:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790939729; cv=none; b=WVk0lFYI1NmvoKzT5rLwcfGkbjQa0a5m/rqyJ+8bPrwj5Ji9ewi8S0AelwW7q+yo6Y1jBdgLuapDw23nJVF9BlI90gTWZ3QV396sWsVjz7kjClxAIA+d/DDPPTGy98xJK852kI60Cf/fc2nLA0CMaD1mFHJ7jEQmqTmU50ILduQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790939729; c=relaxed/simple;
	bh=Yl43KQcD80nr+qpYUYUO1yu7sTeH+HHuvtRO0Vi94e4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=EVhB+pvNbVwkoMEMCVYL10Oq9fVYNE9tP0OkMltte+RhzxT9Ju+T3gL6bobaXHX5k22Xfp4q5AxTH4yjHAvUDEWJloU5L0to6h+wjx37bkkeD6ivE/lnSaniFT8mmMLYx5soURh1BMQS4yYgDfH3HSVbWlOHhkyYBtEncWhZLc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bDn6fzJi; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bDn6fzJi"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-48b03eb33b2so1013118f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 04:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790939726; x=1791544526; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BTJQtxd9YgBbEY84uWjjyLHuqLD7niOkLwH2AgMU1JU=;
        b=bDn6fzJigyfyyxSglsH26OWHCAIUhyG0As4jn3C7plwAY6WuicAFeetX8gjZok+aqa
         FftemW9mrLX45hmU3KmpdvnOKuxro6o9sMCZIpYntlo9qpz1Jvdg/mLrIAR1bNMjTQGu
         eYY7F5H11QObyEhNjjVX3GCvz1sdWl5gvYeBydicYl+FcMETaCxJk9gcyVTVRxWvuyJS
         +u+TmrzC57xkRo0OKNO6BMVy4KSxSdyxcI4Cn2QVIzu19k9V6bjqZqIoU1EOXrONFB98
         dqYOVkvfD9q13+HN3NHlNCEE8v1PeMe90rfAIfa7wL207ks1jpK4yd1bs9YV6BUYEaXz
         GNTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790939726; x=1791544526;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BTJQtxd9YgBbEY84uWjjyLHuqLD7niOkLwH2AgMU1JU=;
        b=szt3nS8Du21OnCY4jNVa+fPh0bRfc9+HmayNsQk1280wNalaQMPpSUWdAS9brn20BK
         c6hq+dCwgnrGnCwNFtRq6UBc+cS19ADk52OvMlUA5DHJf1gQguErYc6KQGbeVxRcnn65
         lvmeaEuc7JW7mqB1LIP8Q5ngseU8pWbww2rSaiLaerXTsz5zC572/4++joVqGiVPtEhj
         qC4RutKj2PsBnyBNYpMX6bFWbhGJPFj0DG6100HzTccfRZ0NwMiwwNNYZ6f6JmVs5I0c
         Xkcr+8U1JC52GCiZO1PfWORFCyVhr8YoE94KBKyeUqe8WogA4UkPENYfqtN5oe1lnC2Z
         vpzQ==
X-Forwarded-Encrypted: i=1; AKwUvBxq/m3FQg8aNBMNiCFddWpIy9zKsgo9lxi6nh7HlDwrbIH0MaE4Ghw6avcvvpXcixegYIO88bWBZJaMFEY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLLw9H3Ne/1Z13FUZEX/cmog19xX1WDuQ5W2ToBvdVWRMfzTNWx
	jFf4IycFnw2RmIIRf2XM/4hUyOwrO2okOR3fDGBR89sjbUmAG8e3Sz7t4RNiG5cvzNc=
X-Gm-Gg: AYBFou3hItaHmtKCOnBxxQav9FwY1JSy+x51q5EI20xMW/I/0zuSc7c/sL+9hl3z20i
	2/EZa1/cF9G1cSfNPAXKdoEU3DgDHja4RrtEhQOo684FZz0znvJ19eYM8QPOLr8WTUF3As9SgGj
	8Bpy/S1tcNOw5hwWyt7KTgRUbsRwotLftHTkDlSaEwdvNDOVx602NfvoXSxDyox+OBMxToSzRX7
	TqemGvSTTc+88JA8O+nLdW4kvYlXEqeVLdzlSfLzM6P9rVQNNgpweG/6ZTq2GSL6xVQiKVgmDuM
	5OKNxqgA7yEopj5UgZMvPxotk9s5v44daSBxMDZv5q2pJv412uxp5cdil4r6KSYHNdFT59Oq6l8
	dcXDctehtPnHuJ9t/bb2ESZaucZin+GRggc1NjLj/kygGMIdL3Zv+ZX7ue9i6/6o6tum9FTsmKL
	VMmSdElOZtUIqGXRKlwV4fdpVMl6R/ZeDDnOGTaSS8Q38VCi8TJRN0jRbtyAXqEFH+9xPt9leF3
	w==
X-Received: by 2002:adf:e188:0:b0:485:8ea0:da8c with SMTP id ffacd0b85a97d-48b1274312emr4732047f8f.16.1790939726167;
        Fri, 02 Oct 2026 04:15:26 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b38306dd4sm4752986f8f.43.2026.10.02.04.15.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 04:15:24 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH v3 0/4] perf: cs-etm: HW_ID improvements
Date: Fri, 02 Oct 2026 12:15:10 +0100
Message-Id: <20261002-james-cs-hw_id-output-failure-v3-0-1d8b6ef339c8@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD6Sv2oC/4XOQQ6CMBQE0KuYrv2mLVjElfcwxtT2I98oxRZQQ
 7i7BRKNK5czizfTs4CeMLDtomceOwrkqhiS5YKZUldnBLIxM8ml4hlXcNE3DGAClI8jWXBtU7c
 NFJqurUcQlivLU4lFrlg0ao8FPSd/f5izx3sbZ5pvWVJonH9NHzoxtvPcRoo/c50ADrldJ9Jaf
 TIm2V2p0t6tnD+zke7khxOcy3+cjFymRZ5qrYTIfrlhGN4sSMvBLwEAAA==
X-Change-ID: 20260706-james-cs-hw_id-output-failure-1d06d042ef96
To: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@linux.dev>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, Leo Yan <leo.yan@arm.com>, 
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>, 
 linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org, 
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.15.2

The driver might not always be able to write HW_IDs, but we don't need
them for unformatted mode anyway, so fix that in commit ("perf cs-etm:
Synthesize missing HW_ID mappings for raw trace").

Include some other minor improvements encountered on the way to appease
Sashiko, like properly freeing queues and ("perf: cs-etm: Respect
--no-itrace option") makes debugging broken Coresight perf.data files
easier.

Signed-off-by: James Clark <james.clark@linaro.org>
---
Changes in v3:
- Remove old b4 prerequisite metadata that's no longer relevant.
- Link to v2: https://patch.msgid.link/20261002-james-cs-hw_id-output-failure-v2-0-7a194aa61173@linaro.org

Changes in v2:
- Drop driver changes and move to https://lore.kernel.org/linux-perf-users/20261001-james-cs-retry-hw_id-v1-0-4d45ab46cde7@linaro.org/T/#t
- Don't process any HW_IDs for unformatted queues, just create decoders
  unconditionally with trace ID 1.
- Use zfree() instead of etmq->decoder = NULL
- Remove dependency on "[PATCH v2 00/14] perf cs-etm: Per-thread mode
  fixes and snapshot wrap support", it wasn't functionally dependant,
  just touching some of the same lines.
- Link to v1: https://patch.msgid.link/20260821-james-cs-hw_id-output-failure-v1-0-9d532ddabcc3@linaro.org

---
James Clark (3):
      perf: cs-etm: Don't add global v0 HW_IDs to unformatted queues
      perf cs-etm: Free partially created queues
      perf: cs-etm: Respect --no-itrace option

Leo Yan (1):
      perf cs-etm: Synthesize missing HW_ID mappings for raw trace

 tools/perf/util/auxtrace.c                      |   2 +-
 tools/perf/util/auxtrace.h                      |   1 +
 tools/perf/util/cs-etm-decoder/cs-etm-decoder.c |  12 +-
 tools/perf/util/cs-etm-decoder/cs-etm-decoder.h |   2 +-
 tools/perf/util/cs-etm.c                        | 184 +++++++++++++++---------
 5 files changed, 123 insertions(+), 78 deletions(-)
---
base-commit: 705da5b15ab89ba97b11eedbe507c2fd83d31cb9
change-id: 20260706-james-cs-hw_id-output-failure-1d06d042ef96

Best regards,
--  
James Clark <james.clark@linaro.org>

