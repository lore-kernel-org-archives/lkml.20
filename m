Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794827213;
	b=n4OTUMMTLcP2yGWmpYxWzJi094g9ZjLHFBPyLbOgq7EhQQxd6CPXp6P5YAR1SEFkKnxZ
	 eSqLN17iOGx8SYiwicRZOVpOjIei0bATonVQKJHYdiZ2ZU6ZxELOSVib1okJ4Xs5/3t+R
	 K+nQTHm2kgg+lmbCyVTX3myA9Tp8lvX2WdxeHhEe1A/IVszxXzTOLrK+1vO8OfpdT6n2M
	 6XKsp4IxNVf0kWMWaXgypaqL4A6KYui1Y3NROnGI/FXIji7TL6GK6XBSw0Dns+25ris2w
	 Q80okgdGWxfWHvLyz1QIIuTGVo434LHWKAG/C7GsFSq0Wjhj64Ex0vwsLvnKj4M/ZxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794827213;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=G6Er2nPrtscnG/s8rWHw2Y9sWYYlyx2QveGZLr9tu7k=;
	b=NQdDGCvaPoU0u2M7fRfoj9z0svmPuv90w2VAm0cZQnwbkfLTDXi/QHjARL8+f/Sj6qjk
	 muRP/idFMB/J9nkqYbJzMq1CPk/wJarKTiyCVfi69tropN51RptF/U982no9ecBHkD4CR
	 iYksm8MUFhROicj/XnNbATHApjrHdB+pMRXkx4GRFuG5XfK028OlTbgkDSrjnMCMhJiQl
	 MmR6IAFo+vA5189l2C7irMmYYXhNU8pZw37g4/lPOtPy7e93AyVK7WyYfc+ml7jrLvWaM
	 CzhigzVfpfjVwHPlqc0R2hM+W0vQAo2zY+MNz+r/cWQh9D8fDN1gY59SNRkQmOAFVWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ucla.edu;
	spf=pass smtp.mailfrom=g.ucla.edu;
	dkim=pass header.d=g-ucla-edu.20260707.gappssmtp.com header.i=@g-ucla-edu.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Ggw5hE3Z;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D1D606E4AF
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:06:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33D1D606E4AF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucla.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=g.ucla.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=g-ucla-edu.20260707.gappssmtp.com header.i=@g-ucla-edu.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Ggw5hE3Z
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-170135e43c7so5235980c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 03:06:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=g-ucla-edu.20260707.gappssmtp.com; s=20260707; t=1794827211; x=1795432011; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G6Er2nPrtscnG/s8rWHw2Y9sWYYlyx2QveGZLr9tu7k=;
        b=Ggw5hE3Zctg02U6xz+QeMZq7S4LPqXPnH6aDbh/+6Xt88DbT9EWflJhzh4up8qKgR2
         IOqICBR24fea70715NBCz6HD08ZRorsKbI+m9j24et+7OKRYjTSyUVgpf+qcVeLL7pHX
         //I9LImqXhoZHX4+1DPDLgMC1hqQwuTcSKHy53lgqpvhQLWG9i6fJVukt55CFUWE21n7
         UmtUXRN812SY5g6CUrOKR8rxEBrz1Z5Cb6PA00/P4l1hGcKKyM7HAlmomcLVrx56rBHL
         VheLSXfTULLf7KLQDUO/iBU5py8hkskd/kDUz3B3bivJQ5m3W/mlHcBhXift+1w3dU+2
         gxVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794827211; x=1795432011;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G6Er2nPrtscnG/s8rWHw2Y9sWYYlyx2QveGZLr9tu7k=;
        b=TNUz3dBxfm4XMwYOWFDues/taEh26vXCuF40ClCNbKNpHvPKn0q8h2GHLo39bJ7jdP
         fRtt3iUnmoeJ/gP9t6Xv9uBUbu586+iyM094qy37ze37E0loGthxLJRWYaKtSe+RYDkn
         g6TPfVPLIwTPdCLyS7LaRhUq7xUVRIlNJBIxlbBPTu4nri7wc8FD91rGD69hkb4NtxZF
         RESEXRFVg9/uTxMQjPI3xvI02GXEjTa9Jht0J3TEsmz5UVutFf3VM3Dl12jcBbbTt6z8
         QaBC+9hTA6zeF86ik+CFCCBkcNoRknUV8Z5yTiE3yxun3Va1tSMLdX3JXy/vQLpnXVb0
         OqcQ==
X-Forwarded-Encrypted: i=1; AL+hErH1HNssTreUlHsOJTkegB+x1+8D6DlS+ZDy+A2/O0njTixQg+1djxVtVDpd2C3nqQWxglXRdXrBZqGjBsI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+tYpRmcv+aY5Dh/2iIW8U3wdu8UaJhvy9T26/WU6O7Cvw5fIGK
	aF7/1NC9uSJmMWx95i7xjy543XIgL3QvWSxxtK3eF3Yd4IoFgOlAX4F+6p+OEPJSkPcuquCQPat
	WnN3Vo+yvSQ==
X-Gm-Gg: AYBFou2Dw8AnZNDyG970Ncf1AxC7uonFrW3WRpeBd6cGwVAqUj6H3LnXXSG8+reVV64
	fhHZvDVOPNOTjXl/7GOp8FJbeGImij6df8UpbB5fo0WrvBESrb3o/AMzUG4UvDvmb93Xr96ygMu
	XjKpSvqMHjBFJC3xnwyTmX/OZuyb4uINd0fxou7e4/DZfHcTZe77C3d8Bsk14QL2bjnmaKYAsQj
	5ihTlZPwhcToyOthfAw4gusBo0vPXCuSBm4wn1FjBRGh1Scmc/eLbXN+l4GWM2sf+IqIv3pHw0/
	XzKCbl1On48LQ0f+hY05Muls2UlE7pKFuoewJvbUariV560VJmSkOgruCSFshd3ZXEdlOAvFphc
	Ar5+V6GUdiVqw+Lmjl7nsLIqxRo1MGhi4R6h6HMZXnVoTpzjyF774ZiDFSvAN8nmvUwG6SxUdbh
	A+LJjKg5hDKndTcuKYXot1EAI/BQf8gt78H6494lCVIVr/w7ADQYc9vC3m/TDpijkUFf5qkHrrh
	reaaCIt/4YOR7qmO2j/q/FrF2wNicv432v57w7iUXRvAZjpzccFQJENe3+E2OqDP6azya1Z+kFc
	tIGVcADqPkWsXExKJv7IByX5xA5z6Q==
X-Received: by 2002:a05:7022:38b:b0:1ac:9da7:e881 with SMTP id a92af1059eb24-1b503175cf7mr11947613c88.36.1794827211184;
        Mon, 16 Nov 2026 03:06:51 -0800 (PST)
Received: from [127.0.1.1] ([131.179.95.34])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b524049e0asm12522103c88.4.2026.11.16.03.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 03:06:48 -0800 (PST)
From: Jason Angelov <jasonangelov@ucla.edu>
Date: Mon, 16 Nov 2026 03:06:22 -0800
Subject: [PATCH v2 2/3] mm/damon/tests/core-kunit: test
 DAMOS_FILTER_TYPE_AGE_MS in damos_filter_for_ops()
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
Message-Id: <20261116-test-age-ms-filter-v2-2-3b265d59ec98@ucla.edu>
References: <20261116-test-age-ms-filter-v2-0-3b265d59ec98@ucla.edu>
In-Reply-To: <20261116-test-age-ms-filter-v2-0-3b265d59ec98@ucla.edu>
To: SJ Park <sj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: damon@lists.linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 Jason Angelov <jasonangelov@ucla.edu>
X-Mailer: b4 0.14.3

DAMOS_FILTER_TYPE_AGE_MS is core filter, not ops filter.
Add kunit test covering this rejection.

Reviewed-by: SJ Park <sj@kernel.org>
Signed-off-by: Jason Angelov <jasonangelov@ucla.edu>
---
 mm/damon/tests/core-kunit.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/mm/damon/tests/core-kunit.h b/mm/damon/tests/core-kunit.h
index 0eb5dcdba0ae..156f74832c40 100644
--- a/mm/damon/tests/core-kunit.h
+++ b/mm/damon/tests/core-kunit.h
@@ -1832,6 +1832,12 @@ static void damon_test_valid_probe_params(struct kunit *test)
 	damon_destroy_ctx(ctx);
 }
 
+static void damos_test_age_ms_filter_is_core(struct kunit *test)
+{
+	KUNIT_EXPECT_FALSE(test,
+			damos_filter_for_ops(DAMOS_FILTER_TYPE_AGE_MS));
+}
+
 static void damos_test_filter_out(struct kunit *test)
 {
 	struct damon_target *t;
@@ -2593,6 +2599,7 @@ static struct kunit_case damon_test_cases[] = {
 	KUNIT_CASE(damon_test_commit_ctx),
 	KUNIT_CASE(damon_test_commit_ctx_keeps_quota),
 	KUNIT_CASE(damon_test_valid_probe_params),
+	KUNIT_CASE(damos_test_age_ms_filter_is_core),
 	KUNIT_CASE(damos_test_filter_out),
 	KUNIT_CASE(damos_test_apply_scheme_filtered_sz),
 	KUNIT_CASE(damos_test_apply_scheme_filter_sz_unchanged),

-- 
2.53.0

