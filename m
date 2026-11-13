Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794585556;
	b=HyxjxPe606sdbmjozYo+sDKtrsWP496eCkeE5ABC2ETjsvodgB9ufcHPQjpYjQMgdO/6
	 UyBdTLAxvMvqyG+9KqJaVmpOkCAK7bymLwzDO7673YTPV7c3iviN5W+L3Y3nq36X012xJ
	 ZvZwjwXhd+dKhZoSUMzwmMzFkmuaJsOSMCS3H4ViguETB4G3dgYeEYelyoBntR0Vgacaz
	 CpqR6OvchHL80vgff6LAzZYilzDezZmptbXD8YhQytlxNoc5ThXxfO40ajVjOo0LMFfRs
	 M6eMsz+YxdGp3XfLJXxujIpwUX2q325Qx1/fOXi/6i9mbLLdMQ2maFoTn/WHGxJOUOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794585556;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=/inMl5ihTFO44VU9pWq4Bx3NmmHKW+CV93YX/kcCu/0=;
	b=Dsy9qXaZNoCfacs9zq1fqyKjzRry5HmpPlus8NL6046sBE+n2jKwwpw1U96JZUi1xi2m
	 gPTeBJsDt/l8fzkZL8ZuLfNmk6QURRU/+8Q2CBRYVbUNjt01ZSdaDwf1WaELUOiEXNAfR
	 925fkulOf5FO8CkNkyYzpOUOifadPLtpQTC+BApXyyag3vi7sXssDYFiG54vRF82KFXGx
	 1pbknd5/mGsKDXDkEMrX25VwfKRd3/pUHWzpXJL5gzpazC3uwfR7HTvir+C8x1iqJ1s6m
	 k/0hnqzbo1cDf4igaWuEH7/PdKp9qqk0+4a33XkUh6C7qCxmoa+a6fU8J8+dJ6RHS4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ucla.edu;
	spf=pass smtp.mailfrom=g.ucla.edu;
	dkim=pass header.d=g-ucla-edu.20260707.gappssmtp.com header.i=@g-ucla-edu.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=oIFCheFK;
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED12606C547
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:59:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6ED12606C547
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucla.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=g.ucla.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=g-ucla-edu.20260707.gappssmtp.com header.i=@g-ucla-edu.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=oIFCheFK
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cd6028ff33fso806269a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:59:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=g-ucla-edu.20260707.gappssmtp.com; s=20260707; t=1794585556; x=1795190356; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/inMl5ihTFO44VU9pWq4Bx3NmmHKW+CV93YX/kcCu/0=;
        b=oIFCheFKgMMDCtPZJCwQgPbbxP7fPdYy+e037XNBRdANFQw985LtHlJ3Cu/sc/XCAA
         Zg3iGcayT1zqeas54Rub3t4RfCoSAOYV9F6WLKGsJ6MtgfWuNnagFzvkrq6wRp0y2qCv
         w/3kG6n7GrWCHoOszNrkcpQdu1jpnkqy7l9uUc6baiRelUTj4hZ6VdTctZvQOsFwogZp
         dpkQy+eAx4UPcoeVjRZQWpcY2lkEP+ghKASSCdWxU1Ded5EJEPhhYfPVOAHf7rLONmBC
         d5ujqrBJmSnt+KaQAOHFPe7DNaBn9qa/ncd/+TxFZbsL42Wp6Y6//z2pofScP/H75TYS
         V71g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794585556; x=1795190356;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/inMl5ihTFO44VU9pWq4Bx3NmmHKW+CV93YX/kcCu/0=;
        b=NH7Sx8JQO9ueArzY19yDdQBbUIfx3xlXnkul3FRJZgKiMqu5H4NyVubsl2CKnOueoe
         ge44NPT/Y8LrBmVSLqwOgIf4xcEXDgbCwxgWCAgHRE5VkDuFilXkVZrlL4I1MRX6AHcu
         bmaXVO3nQ+BhXrEWeyqBl4AjuRXHV2+mep/y3vovhWj87x8EUg51dsestFUa+USoPdNd
         qk678UxztxbfykM2P2fk/JownXIH2/V6tAdAwT+4T0UQcd3JkRYL4ctvrPl//cQ9j3O2
         57GwLEBZx6DgV0gBqG/8Th2F1t6yo8pZS4CuiLH840eJTTLELQxTC4UUayZ43rXNtXfp
         qccg==
X-Forwarded-Encrypted: i=1; AL+hErFzlvcB34NZhdXwzqYiHAucKOBi7Ojy4ZgeXkZiovJ8maFZAQONAewtsLLWkIHMxXSEDi0DoVEzeKXz6HQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/6s6Ggh9XDLQiHW/Oe4XQgdrc8DSzF4gT2Bsrsm0d3dgxyDJ0h
	SJ0DIhvXrqbl/tBXj125vhhlFydnZiMdyou4eAEuzMLlZ192RcdA/etru88BWAwXOF0=
X-Gm-Gg: AYBFou1PcWw8KjD5VmMXatyeWvMs6kkOz/ZPJiWav8iWfOtV4VNWGKBhj5IsJ2SqN8P
	70jbKUr821s9HU1A+JiUP+pjz/6TSoOBzx+pfKWtrxMeL4kwmhMU+14RtgSyhY121PADH/SeQ1z
	lxrsFFig+ecI+5D6Mq3hn6XZQJWh/9BPEE0B4lRy9NtGfb0teRgL1SaEsC8HC1LTddNVSOmIuU0
	8L1PszcUJjGoTXCwwetcGyoiGuWfeYjmLsDrs8jqre/cUzkloHZIYKRLkh2d2YbSW+SkXChSElt
	2/h34jZqbkQ7jML0vEx/Zac1BC2E9iwOv+71xWwBbvklSDvKfTQRGYRtqnf1Q01l+3xcCV0l/kD
	/rCYA2gGxc0CbZPQWnn6EPvDEDUbrd9x+4EGJqOXgce0daiA/XikauYK8/78Ec1B/ktDwJt3sYn
	vycw39EbrkvRgzztk6ReFupHm/Mv6d/9o0A1MPpn31RB5yrRnoVpuF+oEiLrcC0+3BsOQFQjvFY
	W0r9DmXyz/2LvlwE/aK6b5Ogmv2rXur3K0+LKcVw0Me6yVSni5Yn4a7cu+MLNfzJl4uUfOTnXzr
	/seXXMkV+tSB79Zi4oh3rNzrxhYBgX9SXjl5pObAnOCyz80bkb8=
X-Received: by 2002:a05:7022:7e8e:b0:165:aced:1fde with SMTP id a92af1059eb24-1b502fe08c6mr3364841c88.0.1794585555597;
        Fri, 13 Nov 2026 07:59:15 -0800 (PST)
Received: from [127.0.1.1] ([131.179.95.34])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031bc518sm7868383c88.15.2026.11.13.07.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:59:15 -0800 (PST)
From: Jason Angelov <jasonangelov@ucla.edu>
Date: Fri, 13 Nov 2026 07:58:55 -0800
Subject: [PATCH 1/3] mm/damon/tests/core-kunit: test
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
Message-Id: <20261113-test-age-ms-filter-v1-1-b99eab2f71bb@ucla.edu>
References: <20261113-test-age-ms-filter-v1-0-b99eab2f71bb@ucla.edu>
In-Reply-To: <20261113-test-age-ms-filter-v1-0-b99eab2f71bb@ucla.edu>
To: SJ Park <sj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: damon@lists.linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 Jason Angelov <jasonangelov@ucla.edu>
X-Mailer: b4 0.14.3

add kunit tests that commit DAMOS core filter type
DAMOS_FILTER_TYPE_AGE_MS.

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

