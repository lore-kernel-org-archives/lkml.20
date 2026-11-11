Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794366831;
	b=PuWG96d4zXxoEaXjqpPRO4gmThZ3EyJzkMSXmfFFbGpjaC4/Htv+wfTgg1Bjj4Ke6J/n
	 2+vDkCyR2lYXSCX+gan6z50CtrmqT3ieakKl/zgZ50BAr8mHVln1KsGGtPKS5cK0gbGWF
	 Ys7gaW3yHFHsG/1+2UnOXFDRYqgM+GbNLX+5owGYEAoyBz/7jqr1OnxBQVqCGSEG7hnzR
	 PnPDfYwVODDaalrnHD0RkayEFMg606NIPhI+M5qgq7ejiYhSnFKP0+qt++CMiw7ZqkwGm
	 DKpmk+1gwXQ2p3WARg0GqRmZM/EigMvRPz7/OzyZc8aryPy8VvHkHI2jLpcTIYgKUjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794366831;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=G+ckLtpXnouNmS0+eGz1d3M3aH311DkqhG6zVtoehMI=;
	b=N4GFMJdcmR24870479T/Wg1s1XHzE+nak3LHuGCllABmH/Mj5Wvs+Larj2vvug7DKs6V
	 MGCS+iOQvqkzg/sc1RL2sJNGKQ9MBOPEagMdf2VddgoDJbyMZAOrYM2nbxaECDn4axpxW
	 hrJpD7zHQnF1sPWomBiflvq1EhleAu+9KZaHd48SoJSDafICqKrJsD/qrjQTxs6WWfRHd
	 6taL2OR0iJbpdty8I561C6P1nStTRHVYCWGC2/KdNO/KAcpN12W41ZmjgHFkrVu/KdSh1
	 u5RaooP4l1vUTrra2W6HBiYcaAKAc9nCcMp13u2sIDtyManXm8STx1qMv2+ojb1sV2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EBYhTxGp;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CAAE606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 03:13:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CAAE606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EBYhTxGp
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-37123334649so11432eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 19:13:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794366830; x=1794971630; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=G+ckLtpXnouNmS0+eGz1d3M3aH311DkqhG6zVtoehMI=;
        b=EBYhTxGpNuq/Dvi6xARbRbdOkxkTcUCjPII0f3YI1NfPJAlkRrTcSM9rSKlV7UMmKr
         y5fDADDweQNkE3ko+GC3f3FmSa7mGw4Oa9mE0oOTjNA0FGcOfu2VPVx5OCfbHmhm4jxj
         Uqu3MvI8zZU6HkQ4oaKuFDCAadGMupOHlGiNjXWlPBdy3OJVpU3fnhoWWRpB+msBTVOr
         WXXmU3BpavFgcysc0CJEZdW6R7Xp0bVb7lwTEtXWZD2yEVUWYepXVOfQRk9YPuOY5weW
         R9p8rCECVl0AHuDhUFq9Vro4bbTt3119H0J0RZ/R4aiyALFs3lbs8bTRDKiD+2pDfki3
         9PJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794366830; x=1794971630;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G+ckLtpXnouNmS0+eGz1d3M3aH311DkqhG6zVtoehMI=;
        b=JQyAu4UEcflw8gzn3FC9RUEmJHde7uLhBISA0TZXiKSUwN6bcO+R+Qo9fg7J5/fek7
         N0Ci8WAkBAaSVMo91eEpd7vCn4BXFdLgfluX3IjWpSqwlCteWEju9z0DMFMzOOiRnHeR
         sgKBXw0+HThy5aJp53W6KN949lFoseOkNp2PH/i2j6GjxjFPksLi6G/9OMG9ZJmxMqau
         Y+JsrTQ6+/S6AG6vVaTvpAWEbN1cF2XtefuHyO3EUm2sxS/d9tyYpcr0PXgmJWAF2vtE
         SbQRLThh9D7sZTJPnqZeP8pC0aIXU7ctKQrlw9PCZZDoWmLsReKFkDJlMhJSFZzXZuXp
         B2Tg==
X-Forwarded-Encrypted: i=1; AL+hErGTuPSwCD/VC8rTq3ObeekeQQY92+ogKwb4VDCsLFa8NlLSHiRu2+95/oEpdY6qJpzq6R/a219i7Ss6pNY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9jyWHAoWSnK8vlsG6cv1/dx1VzHv7TiNquEADlMLh87rG1zJiD
	llcwYXX5Xj55DFa+TO71tLrW/Jipjw9D55UjSH9dG0OH03Rk1JskweqX2YGrNGJAi7A=
X-Gm-Gg: AYBFou1p6zcNq2isl9mldOrj79sabT0mwZ8+DaQllzZ99UzJ9CkqR7sIKUf52KE8aY0
	aoDKSr7opDZW6iIc4/Fv6MeV/aI2qo5QQvfumyTxzsdrYcwi6UbLmBHHw0K+ZKevED6AYYlGJHX
	5nOl5sNli3474uoWq5bU9a5WtXu8yzp+6Y3gk/+8IqteeA7IGOs/DIOtFIPiU6dRfHHV3eZu2LV
	vXNbu2vMMjhEhGKRS09siAqIGrwOus6dsc6flDPI6MxU4Iao5fqIIvBzyMS6ln7jPU9LX5qD0Z5
	tSYDOkuCabyhoSdZtJLyCRI8by0bjy24zoQKIvSF3cxN1Q0R8xuSHL+QOyxPd0uEtT7DWyqzwE4
	cse5ED1RRv1whdi5qgOCx66vcsLFYnwH0dEATfQeVTuTwsrJ+j7vHetfhCjS6m2xpQeIqQc5crY
	sSuAW70LUemkwCE0jiURQ/ds7ywnvvIDlTKVXoleIXYyn2BdygRXwLW6qTDdyY7AxEMcmLNz5kF
	ru95JgUIcPwKZ1oPyluAFoJ0lJpL0aU2KcBN+axMwSUG3rtiWNNIzmBeQ3iNckqnvOwL70FaKzR
	qf/KKN1VD3MbbaHy09Bd9sQkC+Jk+LMAxU6uCJdINGFdKISO9NAu1nQ=
X-Received: by 2002:a05:701b:42c7:20b0:16b:4f52:a08 with SMTP id a92af1059eb24-1b3c016cf6emr1879186c88.0.1794366830410;
        Tue, 10 Nov 2026 19:13:50 -0800 (PST)
Received: from mi-ThinkCentre-M760t.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2fc14sm10960507c88.12.2026.11.10.19.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 19:13:49 -0800 (PST)
From: Wenwu Hou <hwenwur@gmail.com>
To: rostedt@goodmis.org
Cc: mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wenwu Hou <hwenwur@gmail.com>
Subject: [PATCH] tracing/hwlat: Store the maximum latency in nanoseconds
Date: Wed, 11 Nov 2026 11:13:04 +0800
Message-ID: <20261111031304.1442318-1-hwenwur@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tr->max_latency is expected to hold nanoseconds: tracing_max_lat_read()
converts it with nsecs_to_usecs() to print the usecs documented in
hwlat_detector.rst, and the other latency tracers store nanoseconds there
too.

Fixes: e7c15cd8a1133 ("tracing: Added hardware latency tracer")
Signed-off-by: Wenwu Hou <hwenwur@gmail.com>
---
 kernel/trace/trace_hwlat.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/trace/trace_hwlat.c b/kernel/trace/trace_hwlat.c
index 65e184d800ff1..701b6a542e51a 100644
--- a/kernel/trace/trace_hwlat.c
+++ b/kernel/trace/trace_hwlat.c
@@ -293,7 +293,7 @@ static int get_sample(void)
 		s.count = count;
 		trace_hwlat_sample(&s);
 
-		latency = max(sample, outer_sample);
+		latency = max(sample, outer_sample) * NSEC_PER_USEC;
 
 		/* Keep a running maximum ever recorded hardware latency */
 		if (latency > tr->max_latency) {
-- 
2.43.0

