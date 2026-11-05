Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793879131;
	b=ikOLiq053ju+A+VWe7fSCGLI30K+DRFgNd+4Y/tiCyUFhMJ30ocEjBNGs6hqWiolhHDo
	 iSReOv08oqQX37MjgEGlI+8KMtdb3Qqachwo3rBhN0VOsoN1Dfvq3H6tOJ7krwZdw/thw
	 mcuyxno0OsicLBOKLgyq+zsmSCxlHyEcVDeLM4Q8aJOCpfX2RYTlkb3xWZTq6zoxJrYtB
	 S8N4/S2nxGVRwHHHwEq9k+UfP1XSonxiqKPfGXmNt79g7uoCcNT+Jv74btr2RKkbN2FQR
	 k0ofBpgNbTGPXLXr1IBnwh+ypNpVI1P06raFLbUVLur7R+3qmxDpep1IDUDedSLqyhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793879131;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=hQ2y5T12ktAE5iaKWCwzlas8CkbZmdyxwRbpbd+A6KQ=;
	b=G8GExHhjc/ezKILnOH47mpgqjl4LfdTm1bUFn0MSEuT4idWL5LEbM7IzxBzxLRz8Dlcw
	 a6WsMfyOvFlN4fBxQ0COGwmqQVikOXKLa8TGXRSqxwrstS534KYY19tya8NXnlpx0gROB
	 GZ0QcStsk/BQ1a0oyuIz5TksaX5OqSCMEEgKsOi/N//qw3l9uCrWT/PDLU1zbAvlAv9sv
	 I9fGSH+hHge8BEHCvvQuLWBpPaDmO1NW35ShLbPDiIGRpPLO50sF+XUOZTYnK/96hbpe3
	 FgsmpjbKyP6dNgbLRxDR6gFw3KiF07lE61iXXDVfrX/bx4xZThOnSzGW6DgjgqcsiQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=a0iLDWSp;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F55D60A3811
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 11:45:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F55D60A3811
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=a0iLDWSp
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so5932335e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 03:45:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793879128; x=1794483928; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hQ2y5T12ktAE5iaKWCwzlas8CkbZmdyxwRbpbd+A6KQ=;
        b=a0iLDWSpLDPHcpGFKmm8lzHC0sFutNhJXYUgiG7HVQgwCSFhJlwlsvCW08Oc2ikCUy
         ssDFylEyRiQa4+YyibCAfFvUTDb1nSeFv0gLFV2VBqSO2MQhJT6S4uJDdUu3etiYLAxi
         455GCYHxWCEbRa1jDdMeJcb4EvDX5HjVVWUub7S5JMStHjnEKeUozb2rTORjCnfBC53r
         5pR+lpU2ZkYZBPZBgDJguKY2Xkhyw07H6fJLgYL4GmOJoIaT17MLuC8PbxSPaOB1wGFM
         IT0I0a4AhrH0OtDnyGoSNxeBMN+NO6LuSNEYOS/AV58DP+id57CQYbtT7MBqFKUkDH2C
         vgOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793879128; x=1794483928;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hQ2y5T12ktAE5iaKWCwzlas8CkbZmdyxwRbpbd+A6KQ=;
        b=qsL2lb48Lackux7LPd9qjWTY8DjbrFe8VPQmfCw4WhTG8RnSFLRZLL4IutvIw8BcUd
         jHcQHBazqV6L9DIotZfgSc4DKFrlJ6k6VJI4436a/XLAGAxVlr1zKGeXfDcGPes5GptJ
         uFRySiBTXT9gJ4df/uctqsPT02ojAoOYhqopsXvOjbUH8cgyQpn6lHxyAjrrOEKVMJo9
         VKX+R9MtiZwA+cgmjmjspY0vK3gsAylVecMQkUW3sKYNtBR5IvJlIhdTCevzTeMri0xd
         9T46hSXLY9zZSWtm6jbQ665N5WmqVDtrL9SbRotEdSp+mF5ltm4w8TmjdZcmZ5ZbyDXM
         KPIw==
X-Forwarded-Encrypted: i=1; AKwUvBw2S4WsHZq50u6Jc53LcFqxVtyj7F8K5hv2XJdHD/xQiu5d5S45tLtdoz8yMNp3ObsBHNne7tHA/zJbIJU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+5Pyctgj0feIihQu0ZZc0MxoSRByrEk005O6gIIbr/pZ2ImM2o
	uEZbLicrvEACNQFEXEx9fOwwrZBIZBvsSmL6jJswRGlHZzTgaNMk9LnqHBupnkSpH/s=
X-Gm-Gg: AYBFou0zj0aqxFaenTZ9OteeI9iSrhaotseLF1Bqht4vlZt4hWo1nFA1UsxOzNSWXw+
	QLehU/1a9gATWveO+kEjZDAjF3xhJ/4oXKcNdxzv6VSYwfZeUIOx/zHwKxe+5ppOz5jzRDvU2Cl
	PecDKcfvoSX1b5L1o0ysAy2BZtxwtyg3dAh87C10FOON+gXJaXezbQasb5BWca40C22l2Yh6zO/
	cEgK6OfHAibJipk+qleECJ5QeYVVgVOZa5GLfHMSZ8ZiWoIL9Ypd/mIeX3kznIJ9RZSMJKhmEv2
	EsUm1RnGixscAN6+7sOHl2wZIzzquqN9RIi3trwA7XWX9Oodi75dPtOEPc0iNlZMDrljthRmM9J
	pISuOnNFM36tDAWrRl/YhXGM4sRgBOTRQWsEoW4tkr4S0nRR1e4vE5EAx27h1cLltZfiSGn/vi5
	M7c4R8jYyM4RR+Pqj92WT311sH3wHBiBz/ZWcB0lpDsUMrCbGvlgRFE3eqm9bPE/9K7ty5kaUZ8
	KmUyL2qDAEiZAnV4LWX+jMEP+12PKfEQzGyK8hdF8NEERQ70mkE2kQw+2LL2LHDyDzzOP95xzET
	l495PhhWIjlQJdCpiHtzaktD57MyBVSK
X-Received: by 2002:a05:600c:3e8c:b0:4a2:180a:3417 with SMTP id 5b1f17b1804b1-4b55c8743a7mr39562485e9.1.1793879128464;
        Thu, 05 Nov 2026 03:45:28 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b571f46538sm56679525e9.5.2026.11.05.03.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:45:28 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Thu, 05 Nov 2026 11:44:55 +0000
Subject: [PATCH v4 07/19] perf python: Expose sample instruction length
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
Message-Id: <20261105-james-cs-unformatted-per-thread-fix-v4-7-7759e0ce2449@linaro.org>
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

Expose perf_sample::insn_len as a read-only insn_len attribute.

Trace decoders supply instruction lengths on synthesized samples to
indicate whether an instruction was executed or not during a call or
exception. Let scripts read this value directly.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Tested-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/python/perf.pyi | 1 +
 tools/perf/util/python.c   | 1 +
 2 files changed, 2 insertions(+)

diff --git a/tools/perf/python/perf.pyi b/tools/perf/python/perf.pyi
index 087da00728fd..525d34ed08dc 100644
--- a/tools/perf/python/perf.pyi
+++ b/tools/perf/python/perf.pyi
@@ -215,6 +215,7 @@ class sample_event(_sample_members):
     sample_data_src: int
     sample_insn_count: int
     sample_cyc_count: int
+    insn_len: int
     type: int
     raw_buf: bytes
     dso: Optional[str]
diff --git a/tools/perf/util/python.c b/tools/perf/util/python.c
index 42c587cd54a5..a4f1e316e5b8 100644
--- a/tools/perf/util/python.c
+++ b/tools/perf/util/python.c
@@ -1380,6 +1380,7 @@ static PyGetSetDef pyrf_sample_event__getset[] = {
 	sample_member_def(sample_data_src, data_src, T_ULONGLONG, "event data source"),
 	sample_member_def(sample_insn_count, insn_cnt, T_ULONGLONG, "event instruction count"),
 	sample_member_def(sample_cyc_count, cyc_cnt, T_ULONGLONG, "event cycle count"),
+	sample_member_def(insn_len, insn_len, T_USHORT, "event instruction length"),
 	sample_member_def(flags, flags, T_UINT, "event flags"),
 	member_def(perf_event_header, type, T_UINT, "event type"),
 	{

-- 
2.43.0

