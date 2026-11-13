Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794585560;
	b=uEDpNICiuofChcqYaXPfe0imL20UMHdsqIndPjDoEvNVEZLCz1kfNJ0SCl9KZaKfaj1G
	 lP9hJWcq4ZSqJrhzks6nAGK86ySCzgbcKuxJ9iLqZ9qz2QRhlEKBPnsY6ND2Pzj/a8VlE
	 2sRJ9rMcXzxHBkaDhe6QiX1cAEK1VEeJFNacTlEJFwLt1uFe0kq26+biPvgU7L4HA6rbt
	 vn2xnC1H9n1A6zpGrpVxeOaWexLwdv9L2VYJInkNzeXTCvIb2ZLjAB4wTDiX/X6WCkRF7
	 jzMJxJDq07CPWPSChxPJyyfe7UM2b/2L9B35tuZYRwfw4WFqKsxiYXV5vjutLulsF6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794585560;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=CQfzRALCDpL4DLVl9bz2Iqb7R2/WHPaCJ3qKGqNNiOc=;
	b=TIcleFBsiVZeZu99n2n7fXrnexGjes8wu+ZOfnpnBG4pygVPvtNimCTY5mSBZbhiiSyv
	 Rai3xuhBTDuVbQnbaY/HYkgVk+9JeF1hvPlOJ0kqJpyRuXHJjsZVvGSEtzYIJqVWrf86P
	 djvJ6INJRQsyzwWh7d5TA3nQbjxBC8ru8E7O9sNA7i8rPRXkJ9ultZRl4A/n8JeKokQY6
	 2QimL5xlCHygPLLv09ZkwCIXyTPkvGH2QKVetpLOqdCKYMWzBYLsT9o1INeLDFlimzFJU
	 tRxl2mQBQG8dXIRdHdG7Ne1I3jGt5ajcNPTGLEEyN0UXTh3xT1UpEB7dE2dlO5YsMYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ucla.edu;
	spf=pass smtp.mailfrom=g.ucla.edu;
	dkim=pass header.d=g-ucla-edu.20260707.gappssmtp.com header.i=@g-ucla-edu.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=oPQDozaR;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4B4606C56B
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:59:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB4B4606C56B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucla.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=g.ucla.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=g-ucla-edu.20260707.gappssmtp.com header.i=@g-ucla-edu.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=oPQDozaR
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3720addb068so1782841eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:59:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=g-ucla-edu.20260707.gappssmtp.com; s=20260707; t=1794585559; x=1795190359; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CQfzRALCDpL4DLVl9bz2Iqb7R2/WHPaCJ3qKGqNNiOc=;
        b=oPQDozaRzv8xcZNqKtSvTaZvitqnaOLWu6w/oJHoe6ez3uLgeneg74t0SppSml/W8d
         fg7/yjLcUm5nwCcBP1CuccAM7mJynV6uG43TO/KMNJwq37zuzw7yUSD2FTsqA0qQeua0
         IvTJRs2ThIH27XNuwh6ReJ4stm+2nV+PURxddEtQMtzNDYLh4MOLXrlq+xar/m/eyU7A
         hgPsSo/8nKXX0s6LNumOMl6R2ayGCEIUJvaqmhFmyw/NJoxcIoq/FKR94HMMtn1oI57q
         znEDTiwxmdLzeTTc45ESLgE1LfDqpCwffuiM8fnC2wAQM+cEu/AaxOcT/kI8146W96+e
         fWMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794585559; x=1795190359;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CQfzRALCDpL4DLVl9bz2Iqb7R2/WHPaCJ3qKGqNNiOc=;
        b=wP12yXfH7avUZP7mXs5dj/R2IbvtVfGI8x6rtn3fZjtQxCySX2sPfmn6SpFV/kspmW
         2p/cInutdjD6TZLPru5QtFt0Eg3Th6DX/a/a/xEBq3lvhr8c+6F+q7B/WorHblqfR+XH
         q/61RrgEqZL2bg7FeWfBdM60qdrX6ePyYNonrUD2gVAQjjD+X32Ete4U6wVJbZ+d6AiH
         NJN8wXN3CMRaxkqLnybu/PQ3pej+FwiQtCDIUy2npbjgx4Lt8bKsQ8UmX/3eVjSlyvUv
         ZuhUvqrQyH9lB7z+oR9E5ReV+W2yJrRP4JdYTqPUsYt/P3SkELt0cB5ZkHy3jt1jepMv
         Hq4Q==
X-Forwarded-Encrypted: i=1; AL+hErESSU0C1DabXpCpUHjV65TCm9iT6P6OdbMq6X6caCV+J2+NdnCBHTknqdFbrWUaxiKxfEGaCb9DBGVv+a4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8GbWzD7n6ptV0ZG17r+xBpw2aVT6+H34BRABp/U4lV2mqnGBOk
	es7UA3BbGm+ZYBaEJmnOfHpt9THbY86CPX5WmlUadaBTPDuwbZDpdlQltBdfxbXjEkU=
X-Gm-Gg: AYBFou0Xo63VrAu5uYsKwtftLlihRxOIN+4uOlB0pMJoGI5LAlCbkY/kXe2B/1iK/I0
	s4jFI7yA/wuX+nFub3r/iB0etiTopp4Xr0St4ivNcngMDWb3uFrlPP86Fm5Lr8UKCJr1QlH6ZHj
	OIcqQW2o7DJ5ebmoLPn+a8CPf4ORv8bMp/5wJpbFKCzYzPlfJIv+eDjZVOc7T0vbLjBqEkuB1xq
	hGnW9mdxA6U4KLYV+YxxBSj41DTnt6ICnhOrVa35KJShDgfLu0bQW3ikyS6PE85ZWU3gSwHXAN5
	5kFIBfnR52JAxfZWRQxbS6Lpd46sw+rrhsTb6x+KZ79jp9uKjzshYEGFaDn6uILXl+PMgUPHm78
	VWGcq4x35l6qBWalVIt6++vWr4kKRuNRrn6vztWkAXnI7zxAO/RnzqfUuEK+BRgzWPl/df0FRtE
	pGFnMdYPYalkw/iwH/UuODI9rVFiwDuk598oaSxjEDRlHFhDh9ozJ1IVb90LI+RMPn0qdAQ0QvH
	2tp49UYUjOvKz2OZZdiPgFmgu6OPxoDfQZeRyzet6fKnDLYi6FbpbtOQVRd5x80XLrEFKIcDzbN
	RA2sLdStsG51Vy6S6Vuax/23fPdqeg==
X-Received: by 2002:a05:7022:f109:b0:1ad:4ef5:ffed with SMTP id a92af1059eb24-1b50313d936mr2385378c88.38.1794585558544;
        Fri, 13 Nov 2026 07:59:18 -0800 (PST)
Received: from [127.0.1.1] ([131.179.95.34])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031bc518sm7868383c88.15.2026.11.13.07.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:59:16 -0800 (PST)
From: Jason Angelov <jasonangelov@ucla.edu>
Date: Fri, 13 Nov 2026 07:58:56 -0800
Subject: [PATCH 2/3] mm/damon/tests/core-kunit: test
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
Message-Id: <20261113-test-age-ms-filter-v1-2-b99eab2f71bb@ucla.edu>
References: <20261113-test-age-ms-filter-v1-0-b99eab2f71bb@ucla.edu>
In-Reply-To: <20261113-test-age-ms-filter-v1-0-b99eab2f71bb@ucla.edu>
To: SJ Park <sj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: damon@lists.linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 Jason Angelov <jasonangelov@ucla.edu>
X-Mailer: b4 0.14.3

DAMOS_FILTER_TYPE_AGE_MS is core filter, not ops filter.
add kunit test covering this rejection.

Signed-off-by: Jason Angelov <jasonangelov@ucla.edu>
---
 mm/damon/tests/core-kunit.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/mm/damon/tests/core-kunit.h b/mm/damon/tests/core-kunit.h
index 0eb5dcdba0ae..fb84d30a712d 100644
--- a/mm/damon/tests/core-kunit.h
+++ b/mm/damon/tests/core-kunit.h
@@ -1832,6 +1832,11 @@ static void damon_test_valid_probe_params(struct kunit *test)
 	damon_destroy_ctx(ctx);
 }
 
+static void damos_test_age_ms_filter_is_core(struct kunit *test)
+{
+	KUNIT_EXPECT_FALSE(test, damos_filter_for_ops(DAMOS_FILTER_TYPE_AGE_MS));
+}
+
 static void damos_test_filter_out(struct kunit *test)
 {
 	struct damon_target *t;
@@ -2593,6 +2598,7 @@ static struct kunit_case damon_test_cases[] = {
 	KUNIT_CASE(damon_test_commit_ctx),
 	KUNIT_CASE(damon_test_commit_ctx_keeps_quota),
 	KUNIT_CASE(damon_test_valid_probe_params),
+	KUNIT_CASE(damos_test_age_ms_filter_is_core),
 	KUNIT_CASE(damos_test_filter_out),
 	KUNIT_CASE(damos_test_apply_scheme_filtered_sz),
 	KUNIT_CASE(damos_test_apply_scheme_filter_sz_unchanged),

-- 
2.53.0

