Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBCCF5383CF
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 16:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789663183; cv=none; b=s3vxtM+/mxaW5Z5GQrFl4HM+MkYc/1VgEFyU9waErfjri6g3vGP6+WXzi/iWHCUpergu2vKqrCmUFKgMlX9Va9T1Pf7VYvS/sZ1uqGxco3XXxefuRqya6Xb4IEK1qiCEfGSE0dLucBnqUO+NnidwJSw6Iua11f4psh0gJt9cvG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789663183; c=relaxed/simple;
	bh=Efwg6Lp4URje4K6ap1NY7WHw9tf5g4FaF0Uk7IwjA5I=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Z+5Z3tfFkmC+Srx/63jZo2Vwp9BkWJHQF6q+NBB8sJbXCZRo9jloDbyoInxGCjEiw/hK6cBS0IopnQZP6M9iikkr+12EkMKN6dyzQgyLfrHzsh/f4W82qpcgZHHgycpjOXeTMd9u2KXwXRMy1H7q8PkAri+sSP9Q2U/gx/rfpdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NfqamqF1; arc=none smtp.client-ip=209.85.215.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NfqamqF1"
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc4ac5feaa4so1458906a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789663179; x=1790267979; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Aji62SWFx1lY4aZnTGM78az2i6brsVbPSUcmX+4ftqQ=;
        b=NfqamqF1h7a1KzPOaL3E/NNuY9jA7D/i0qmKm0JO8IV71T/WM2RTAdmPLNuLYcUyMf
         PE2L/X83008mjqwzByJjQCuk6owpFQ6UYW+M30jsg4m6oDF8kHhYIoolFioy79KEx+iz
         9T4+U4cbQwYbQS4epXxqnMM95l2o7Vz+PcCvPdfuKujfLfcE5QWfDuwa3FPmV962+dYB
         GJKykasvlcP0kfuaYsBwpTUXSwkRvTlWtjYIGeD/7skAyXILL8FGTyI8XjcQjK1bRo9K
         L2HL3UzaxTsAbPYkvVUf7QYy2N8Smr2YxvLVIfTFcBQYoxG6A1l3SNjIMVo+ueLEipho
         CZPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789663179; x=1790267979;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Aji62SWFx1lY4aZnTGM78az2i6brsVbPSUcmX+4ftqQ=;
        b=fSCT9QmoxoqmzSxTfZjGeCFqFjHlbCfxUQfNegxAPvqfhMokGatjQAVhLZGjNkX0iH
         ALZhhXy0THukoTX95KUHZPqaQLSZhJhxucHDwh45g7TmcpHYgnAUsPMNBYo3hgn1gDN/
         +yTR10sG1+Ka152sRINRdNHyK4fhKeFBTt6G7kcEH98VHHsT7me9uutrfuiwrltEfTDN
         EQHCReOWBRYF9tcPBXzKS3DQAC86Cdd7V9JuE1uOCz4JZKA5QyOMuifIWvQFs+a6JAO/
         yWsgeqK5tbU3F1O5CLFnLmTb/trHQBsVQQqgXJOPGeJDhYPNBzpHw9bo3kzAvKu+l04A
         hIFA==
X-Forwarded-Encrypted: i=1; AKwUvBzqsJ7T3Ym5itahl5EBAZZjYXwFapxGZ5InqdJMLGbChEv6V/1Nfnj91fwP665JUo5n0H2XSh2PXvejD+U=@vger.kernel.org
X-Gm-Message-State: AFuF++kRcZgv9RZjgwcQ25lIbbXPRW2jCQfgEJh8kM84RLeJpUffTpCA
	GPLl8C/q9tFVDUz7Ey7nIhxp+RVXkHqGUo0BjiVYRozqmp+Gm7xsejnUITp1YH84fy/2Nli4ndT
	9GXpTN7BxYg==
X-Received: from dlam8-n1.prod.google.com ([2002:a05:701b:2088:10b0:143:c6c8:ff2c])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:8cc8:b0:3bf:b182:94e
 with SMTP id adf61e73a8af0-3dd5f40384emr17253609637.5.1789663179380; Thu, 17
 Sep 2026 09:39:39 -0700 (PDT)
Date: Thu, 17 Sep 2026 09:38:56 -0700
In-Reply-To: <cover.1789662556.git.irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1789662556.git.irogers@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <e2ea8c6dfff43fcaba7e6b1135cfdb6ba65b9bd8.1789662556.git.irogers@google.com>
Subject: [PATCH v2 08/14] perf test common: Do not globally disable tracing
 events in clear_all_probes
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, james.clark@linaro.org, jolsa@kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	mingo@redhat.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

`echo 0 > /sys/kernel/debug/tracing/events/enable` disables tracepoint
events system-wide. When running tests in parallel, this kills active
tracing and recording sessions in concurrent tests (such as perf trace
and perf record).

Remove the global event disable from clear_all_probes().

Assisted-by: Antigravity:gemini-3.1-pro
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/tests/shell/common/init.sh | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/perf/tests/shell/common/init.sh b/tools/perf/tests/shell/common/init.sh
index cbfc78bec974..d2c7a31e2c6f 100644
--- a/tools/perf/tests/shell/common/init.sh
+++ b/tools/perf/tests/shell/common/init.sh
@@ -132,7 +132,6 @@ check_uprobes_available()
 
 clear_all_probes()
 {
-	echo 0 > /sys/kernel/debug/tracing/events/enable
 	check_kprobes_available && echo > /sys/kernel/debug/tracing/kprobe_events
 	check_uprobes_available && echo > /sys/kernel/debug/tracing/uprobe_events
 }
-- 
2.55.0.1082.g2b9226bbc0-goog

