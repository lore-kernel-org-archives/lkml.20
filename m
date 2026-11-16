Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794827209;
	b=MvD1fVEs187IS4Vni5mv50FwX49+yQF5bGB28OKE/fBiKOiWA5NI3FSpUVncbyMrGdGS
	 IsjrmXlL+kgF2ILShh7Lx1NHuMRTmhvAfu3ZT3QK+VJXXT0XMfFbpepdafvXUPteByQeE
	 VtyisuJohjMlsigpMVtFCqjgVwuBw5FycNi4vM9o8d2SItbuLzxaggBYCko1b+i/29X+f
	 Gc6QWPDT27zw90gE+RwFQkwBkwqsc+3i+KS+4HbchI7mA/ZAReEXTuuNzzqBviOXD3XkU
	 yYIp01k68UMVkjn8okXqJz1b/YquFRoSc3H/90IG1ql0YptrJ/BKS4xfOukxDUtP6yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794827209;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=n1STAPeBDhVJdiPrWnEBENabND8c5F/YLGiEN4UGv2I=;
	b=egGAQ18lrVat8BLj7NcR9XtPHA7sm8QoC9FWUxpnMO4DdRT3F3Y/AiAXVGwtnjjMlEuz
	 Ct8S/umHZGnWcKgSd4h+ejfPd6evL0C38L/FEQqRnnG7g8D78BgJh55v6eYF6ox/9Vkl+
	 0Qww95u2qsC/La0tqaN6HJQX5r3WXrJILP1B0dTQJxG1NSVM4yk42o6ZWbh1DOGAcsTIT
	 Lhpd95UmuoLNsLKO/Cs2Zav3H/ML15uU7tsY5eQ0assE0vJg2P+SPzh3frXkstajMKy0L
	 q0ZwQH4S11ouhTuTw6Y6he4qUtmLSX7QsRpShs+gVnu4p938XRj/j9JDw9za6bnBU4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ucla.edu;
	spf=pass smtp.mailfrom=g.ucla.edu;
	dkim=pass header.d=g-ucla-edu.20260707.gappssmtp.com header.i=@g-ucla-edu.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=YQCsHma8;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE6360A261F
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:06:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AE6360A261F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucla.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=g.ucla.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=g-ucla-edu.20260707.gappssmtp.com header.i=@g-ucla-edu.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=YQCsHma8
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-36f6295304dso2629399eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 03:06:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=g-ucla-edu.20260707.gappssmtp.com; s=20260707; t=1794827208; x=1795432008; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n1STAPeBDhVJdiPrWnEBENabND8c5F/YLGiEN4UGv2I=;
        b=YQCsHma8F5S58mDhmYSTCXfnc7z1n0p0UlEc4SxfCobzqiZUUNqhA5o4k2xxtnkdZQ
         mO41bpWclDC6e633TtXKkLBe+EahJapsdmBm212H2zSgyDaxKq/S5mBoQwcv9SJ8069S
         tGKJhAmm7nqmhP9/ZyGPy4QkgmfT668RKp/VJm2yUGIPefU6oPrLTkVJZaYm+sBqtwUk
         Ry+fdkitFnqBUfzEIszYWCjXHBt1NDD/NFWXBWxbAe0ZZ62IC8LrZx4AQQq+AvWBSeGL
         vb66D/FZ/XdXhEHREz50o75zob+9EfY25oENY8wFKyZlRP9ijbQR2SVaZRyhyHhOVcnN
         NQhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794827208; x=1795432008;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n1STAPeBDhVJdiPrWnEBENabND8c5F/YLGiEN4UGv2I=;
        b=0dtu0RD0F3Dhyg3csHkzN8YkxjXu4J984N19A8xRFk2TWW4azpZXZQd0zogMaYCfYE
         A9nAqn3XjmTDzE1GILux10Obi8OCUtvQU6dDDEGKRVUDYE/qii8DNrC5u80xaK1QTsTN
         UKds0Wxi8OJrkUn/LcwkJ6lYMsc+uT/JeLFSJxUp4N/FCbcfmF+q5Q3HofpreO0jkWkk
         ASSLxITrMDaPCcKspP33hMAY52GyPF1upNpixRLhSSo37qEqMOrEp5QkyCZ/l0ylkzJu
         B8RcJOBOOXwQfDJ4BzdRpJK5ObBq6NBKdwGT4sBL/P9x9vhIUEBvV0lRTUoIi1dD4m8m
         jNxA==
X-Forwarded-Encrypted: i=1; AL+hErGh7w03VnuvmHEHKDS1FQx3iir2ZKcC2q22q44Bk7vHRA5buOdmnxHQs0NYFxI/ocziYzOnlDHpew2D9yY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9+gl3NN2it1+TRYwf8WqKOUlhovArtCWnzS6wDxU7mnf2e0zjG
	pd7aUP/ckbZSIE5bcwyle0F4m+tz7LJ0GX0Vbi5RRx1UFHMm9WEIN8vEL7rozCAsy+Y=
X-Gm-Gg: AYBFou2M0OEmKhD06tVITvmlXx9l76VjDqrXsWBFgLyIxg3UBUinJBV5Fp9uX4eynpC
	lbSMyHT0bqKOTVyo+VYwq+ApvBpPYoC+BuHE16rO/8bG2pgCPTlldkITTdYNaoPo4JxIi4Nl9M5
	Y/EBfVJaBSyB2d8YWKJYrLotQZjtZFMY+egin8FaXUtRES4KP1pJpsRLNFsP0SjLWtQORNU3kJE
	dnLn6FQUgwciwQdpHIJuaX6pj/plPlbIw/GlCRDveqIacqKthZPsAefP0W9+BugcY0kLJ8mHBkS
	N7YU6xsX1EWUejhha6tHRgWQyuZpvtGfGE7SdnfNT1nTzFeQy6FWBPaq306mvOit2yTxRwhf03L
	ZDuP08fRPim+zNp42HXcItIUQGH2UmBkTZ255IMcqUGcIkVRnAC8LxsIuHD0zkEP+QrKGWg8ODh
	iwOoW/ycAf1F637mGa8uRBmw2ekHJXFcVUe4mzNNA4ZuOadiznmTIpPaOQOXeeCipO1qeRiH+HY
	TS2+NACE6of5EkxD/frLCduK7a4Xhh5MqhzTj4YJ81FU3M+yycJ+3QwOGBqe6iuzYqPL++oowbq
	vmuKgeV9vWXGPLcE+i5AvRmxqBNyvA==
X-Received: by 2002:a05:701b:42c9:10b0:1b2:6eef:3f32 with SMTP id a92af1059eb24-1b503137c87mr10395040c88.37.1794827208245;
        Mon, 16 Nov 2026 03:06:48 -0800 (PST)
Received: from [127.0.1.1] ([131.179.95.34])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b524049e0asm12522103c88.4.2026.11.16.03.06.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 03:06:47 -0800 (PST)
From: Jason Angelov <jasonangelov@ucla.edu>
Date: Mon, 16 Nov 2026 03:06:21 -0800
Subject: [PATCH v2 1/3] mm/damon/tests/core-kunit: test
 DAMOS_FILTER_TYPE_AGE_MS in damos_test_commit_filter()
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
Message-Id: <20261116-test-age-ms-filter-v2-1-3b265d59ec98@ucla.edu>
References: <20261116-test-age-ms-filter-v2-0-3b265d59ec98@ucla.edu>
In-Reply-To: <20261116-test-age-ms-filter-v2-0-3b265d59ec98@ucla.edu>
To: SJ Park <sj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: damon@lists.linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 Jason Angelov <jasonangelov@ucla.edu>
X-Mailer: b4 0.14.3

Add kunit tests that commit DAMOS core filter type
DAMOS_FILTER_TYPE_AGE_MS.

Reviewed-by: SJ Park <sj@kernel.org>
Signed-off-by: Jason Angelov <jasonangelov@ucla.edu>
---
 mm/damon/tests/core-kunit.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/mm/damon/tests/core-kunit.h b/mm/damon/tests/core-kunit.h
index a5ca4bfe2f0d..0eb5dcdba0ae 100644
--- a/mm/damon/tests/core-kunit.h
+++ b/mm/damon/tests/core-kunit.h
@@ -1271,6 +1271,10 @@ static void damos_test_commit_filter_for(struct kunit *test,
 	KUNIT_EXPECT_EQ(test, dst->matching, src->matching);
 	KUNIT_EXPECT_EQ(test, dst->allow, src->allow);
 	switch (src->type) {
+	case DAMOS_FILTER_TYPE_AGE_MS:
+		KUNIT_EXPECT_EQ(test, dst->range_min, src->range_min);
+		KUNIT_EXPECT_EQ(test, dst->range_max, src->range_max);
+		break;
 	case DAMOS_FILTER_TYPE_MEMCG:
 		KUNIT_EXPECT_EQ(test, dst->memcg_id, src->memcg_id);
 		break;
@@ -1304,6 +1308,22 @@ static void damos_test_commit_filter(struct kunit *test)
 		.allow = false,
 	};
 
+	damos_test_commit_filter_for(test, &dst,
+			&(struct damos_filter){
+			.type = DAMOS_FILTER_TYPE_AGE_MS,
+			.matching = true,
+			.allow = true,
+			.range_min = 36,
+			.range_max = 14
+			}, true);
+	damos_test_commit_filter_for(test, &dst,
+			&(struct damos_filter){
+			.type = DAMOS_FILTER_TYPE_AGE_MS,
+			.matching = true,
+			.allow = true,
+			.range_min = 14,
+			.range_max = 36
+			}, false);
 	damos_test_commit_filter_for(test, &dst,
 			&(struct damos_filter){
 			.type = DAMOS_FILTER_TYPE_ANON,

-- 
2.53.0

