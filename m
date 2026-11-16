Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794870425;
	b=og95PYVzR1G1Mq8Pbo4ASv7D/l53IvSwLQQrdiikuUwoK2sz8MZxGZoUYuuyf1OnkuHq
	 fIUkn+Pl5wZjzwsdxvsw2Y1yQvyJii7XERDeHmbbuZivZwkeKckO2QXkWoEKEvVha2e9y
	 Yn8ZZtOdkAABE1aRmE6yeydZf4gzzDovpYvHlnJ2+QC55mbV3Li6NX1Okt1yPhqEw8WHj
	 txH6PGGSu77vx1N7s/7ShuWC/9bwNGVAyWavaf1TP33shGckxSFmxFVZclQAGyO2PUkUA
	 jMy5zEh5+dTVsHFMR42p/xEB4FcH7yyrMl62IwfsqfOGZHaJ1TP4I9bJncML8HGYU3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870425;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Ov7f0jCh2x7/B/l+YrluktAKi2O0zfS/6BcSjEJkDWQ=;
	b=eASb6E5hKC9Ls4fqcMfTraRgrlJmGJXs2LBFGfS1/DjGdkolLK50DMwRa8A7ZdgcqkNh
	 VBJUAhI8/x8wsnxHSMc9nbPBAj9II5Hd/Y+63Bqxi6qXKTHGUxDm+Wx86v7ET+ZpK8Ow/
	 qofElxnpce44AM/0mRx4zy8ShF9eQK+NgJja/Z2EBuF4DD/WPzNXMrcVQ9Azu0ceNlBcT
	 wcKRdjIfnbH7EtjeZjkzayikB70+W+Egdnnpa7zbA+/nc31+oZ7lYkck2RDsV8ElVh0+F
	 q4d3H1TwQXgYlvFT9eLzr0AJP2UbxOcefrEXvg0BP1nYj4vPKygKEz+OecolMG04x1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=MJR1HdCG;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D49B560A5BD3
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 23:07:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D49B560A5BD3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=MJR1HdCG
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3b09cc7ed1aso489095a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:07:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794870424; x=1795475224; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ov7f0jCh2x7/B/l+YrluktAKi2O0zfS/6BcSjEJkDWQ=;
        b=MJR1HdCG1wWH3hDIRoiEgv1K5UeU+oV3eu2gTuvSPb82VDk0dQt1fxMu575tdzDRGV
         nUFCKCO0UTGdyHAaOGD1thvWdC5zgS6BIK0tGbz0ddiEBrRU3UF7z1PABYXgFTbzfP7t
         p/Fggtbeu2kof0DUPF3WoBkPiM6QK+GVj83Cs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794870424; x=1795475224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ov7f0jCh2x7/B/l+YrluktAKi2O0zfS/6BcSjEJkDWQ=;
        b=ECWsWFBomgLoz8Ray0f9j7rCPiB18VqbOxM+Ond6Qkq+JyaHPITpdy4AqkwmUT/4Bi
         XknHMgp73eXq5o+9i/WftvH6wCFX70DWu9EQyzw+a7DDjNiP0ia+xNBbB60f2p3kuyMB
         JJOfvwDq+qdrJ91VRRic4byT8BjYIg9hiQ5A2n9CyiIeWENqeX43ZY4RxRA+Z2mgqd6r
         j0Sw1/CelVvh/opFAa5mZDp8JOOo4mlb/sNpV/MwN832Gj49TtGiV1gZLXyPKakdSwam
         UKSFl6kU3QSTrPp81NThO7QR8ejJsUvObXGVik9m8FdFN5yshkkakg4ZBFba/TczgRMS
         axGw==
X-Forwarded-Encrypted: i=1; AL+hErEnB2luO0fFSxvcOJRjO6XsJS4FO9ZY3XWENod6YYJjGJvAWYxHGCYlX86XViBiM/KVPkSF6o6okRbzoLs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/H105605dPIB8ILFdAw+m35O0/Q3Hw1dpQ4fjBrTaGmlJWTbeU
	SwEwzkZUUKSzU632wmrVL7eEnpbKp8Flvi7vteS80qkwsOgfAcY6FHyxxZYw7mH83g==
X-Gm-Gg: AZFdTZewkPaoqw1UHHfvJr7Smsj37k2yEEBTvRBwFv6RrgJBfM0x6h0zmzFkZE03k6l
	GboKvpeeARS4exXHZLWP8RIubMoPyPogB/ygKrVcaerQqg4IuNCs9qIlLqgYCBW6AnpAnEUji5S
	xyYT9/Zrwsy06y1E8Tzf9OY/O7NDKRK0Qj1vkuFE8JhDZDj2TGF+PzpMzRgPUoS3/bP2kSgYhdi
	ApobEsPmvlcBkJPiRSHsfLCQ769mmY6FiMuA+sAD267ksd8kqp0bSWrwlQxAHNbWsSx/WFBD2JK
	oJhb9Tft6AYOEqqI92tM5d4ACH2hxkaHuS9YEkI9rfQ2WsT+C5Xzh2P3YxsnjbYIKINjsOQ51Jf
	OM3yOJfxAXU5ies21VExFRvbLjjw7dZzExHlaiiYyZbuhP0s3qsZB0MhJ3NZY4N1QDtPu/7ebK4
	ggCt2tWD4arh2vmOBe6dZXElISF86WkUoweJgcdUeCGSRW0BlgGz0sZ20W0vLWjkCTwe7EVRCoZ
	/nMTkqU0G6H5y1v+P6v8w21ZrXm8FN04Tcru/1uAZnD4SnC9RDJEr5s0ZYUB18c7/NO+mNq4zT3
	yfDdVOznSZl3IhWoB8TnOrThRT4RwJ08WMT4uqM5pFMYGpCf9kj43XZK7fDWKwWKgAHclP4SMKV
	o5k4c/m04t+0NFjSl
X-Received: by 2002:a17:90b:5906:b0:3b0:d0be:f02c with SMTP id 98e67ed59e1d1-3b1b0b4ffffmr17720470a91.6.1794870423621;
        Mon, 16 Nov 2026 15:07:03 -0800 (PST)
Received: from localhost (221.247.125.34.bc.googleusercontent.com. [34.125.247.221])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-cddc13275cfsm5035019a12.0.2026.11.16.15.07.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 15:07:03 -0800 (PST)
From: Jeff Xu <jeffxu@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>
Cc: Jeff Xu <jeffxu@chromium.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Zi Yan <ziy@nvidia.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Marco Elver <elver@google.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Chia-I Wu <olvaffe@gmail.com>,
	Dev Jain <dev.jain@arm.com>,
	Evgenii Stepanov <eugenis@google.com>,
	Ian Rickards <ian.rickards@arm.com>,
	Jann Horn <jannh@google.com>,
	Jeff Vander Stoep <jeffv@google.com>,
	Jeff Xu <jeffxu@google.com>,
	Kees Cook <kees@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Peter Collingbourne <peter@pcc.me.uk>,
	=?UTF-8?q?Pierre-Cl=C3=A9ment=20Tosi?= <ptosi@google.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Tomasz Figa <tfiga@chromium.org>,
	Will Deacon <will@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Miklos Szeredi <miklos@szeredi.hu>,
	Baoquan He <baoquan.he@linux.dev>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Allison Henderson <achender@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-mm@kvack.org,
	kasan-dev@googlegroups.com,
	linux-arm-kernel@lists.infradead.org,
	linux-fsdevel@vger.kernel.org,
	fuse-devel@lists.linux.dev,
	kexec@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	rds-devel@oss.oracle.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 7/7] mm/kasan/kunit: add page_alloc_highuser_kasan test
Date: Mon, 16 Nov 2026 15:06:27 -0800
Message-ID: <20261116230627.3537051-8-jeffxu@chromium.org>
X-Mailer: git-send-email 2.56.0.679.gc527c65306-goog
In-Reply-To: <20261116230627.3537051-1-jeffxu@chromium.org>
References: <20261116230627.3537051-1-jeffxu@chromium.org>
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

Add a KUnit test (page_alloc_highuser_kasan) to verify that, unlike
GFP_HIGHUSER, page allocations using GFP_HIGHUSER_KASAN under
CONFIG_KASAN_HW_TAGS:
1. Get a KASAN tag in page_kasan_tag() across all sub-pages of a
   high-order allocation, and the same tag in the pointer returned by
   page_address(), and
2. Are poisoned on free, so that a use-after-free through the stale
   pointer is reported.

The test fails if __GFP_SKIP_KASAN is added to GFP_HIGHUSER_KASAN.

Tested on arm64 with CONFIG_KASAN_HW_TAGS under QEMU (virt,mte=on) with
kasan.mode=sync, async and asymm.

Assisted-by: LLM
Signed-off-by: Jeff Xu <jeffxu@chromium.org>
---
 mm/kasan/kasan_test_c.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/mm/kasan/kasan_test_c.c b/mm/kasan/kasan_test_c.c
index 72342137bb18..285b82793bdd 100644
--- a/mm/kasan/kasan_test_c.c
+++ b/mm/kasan/kasan_test_c.c
@@ -423,6 +423,33 @@ static void page_alloc_skip_kasan(struct kunit *test)
 	page_alloc_skip_kasan_helper(test, GFP_HIGHUSER_MOVABLE);
 }
 
+static void page_alloc_highuser_kasan(struct kunit *test)
+{
+	struct page *pages;
+	size_t order = 2;
+	char *ptr;
+	size_t i;
+
+	KASAN_TEST_NEEDS_CONFIG_ON(test, CONFIG_KASAN_HW_TAGS);
+
+	pages = alloc_pages(GFP_HIGHUSER_KASAN, order);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, pages);
+	ptr = page_address(pages);
+
+	/* Unlike GFP_HIGHUSER, these pages must get a KASAN tag. */
+	for (i = 0; i < (1UL << order); i++) {
+		KUNIT_EXPECT_GE(test, page_kasan_tag(pages + i),
+				(u8)KASAN_TAG_MIN);
+		KUNIT_EXPECT_LT(test, page_kasan_tag(pages + i),
+				(u8)KASAN_TAG_KERNEL);
+	}
+	KUNIT_EXPECT_EQ(test, (u8)get_tag(ptr), page_kasan_tag(pages));
+
+	/* They are poisoned on free, so a use-after-free is reported. */
+	__free_pages(pages, order);
+	KUNIT_EXPECT_KASAN_FAIL_READ(test, READ_ONCE(*ptr));
+}
+
 static void krealloc_more_oob_helper(struct kunit *test,
 					size_t size1, size_t size2)
 {
@@ -2413,6 +2440,7 @@ static struct kunit_case kasan_kunit_test_cases[] = {
 	KUNIT_CASE(page_alloc_oob_right),
 	KUNIT_CASE(page_alloc_uaf),
 	KUNIT_CASE(page_alloc_skip_kasan),
+	KUNIT_CASE(page_alloc_highuser_kasan),
 	KUNIT_CASE(krealloc_more_oob),
 	KUNIT_CASE(krealloc_less_oob),
 	KUNIT_CASE(krealloc_large_more_oob),
-- 
2.56.0.611.g1030f0b940-goog

