Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794870422;
	b=L3ghgo/Te66OAeRAG6BaqT+/XXHXhu3E26K+iZeVjzD41BcSEiYd2iIyuN/mtlNVEV0W
	 6WM2hCTehZP/Y/2ZoXuhWMKRtRSOsNNRMw3S5kY8AnIYX47mkMitcxpdOXzw4XZYqg4zX
	 P5hv0jHP5xof5kux9vu8oVi7lIgW2WAbG+siCxrrOK/BOm0EtVN0lUR2xvQWs7sifJ1D9
	 cpKj6Y3n0B89dvqPkkFQKPzhdYEdOWJyeqV88QXKYQSySSz1k5GuXSHMES4gN5FGsLili
	 mZvF84pg8XbRhdY4QOnJdgpVjHrbk6w3LCWVdjIhDlqAtBNDQMtO//gF20tMuP7bnkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870422;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7noARN/sft+NtmJTHmUDUAvU1Dihrn7FLenu365oKlA=;
	b=jNt1C+/Dvx+qmBRi9+dWXILi1iUi4165CFctHpEpP7RTJ+QqzPMbSOkD1xz0qvCzOV12
	 ovG3DwIZUSfvMfpSYv7bDgJHeSJh3kIU9Yx8lPkxrioSOQmBwU+deJyqZNUsrx7uJtJRw
	 9ezK3DZ7c+9k8yx2BFIKzRuYTa8a3bd0MMm2fsuEsvISu2ExOfK8H2svIY9/FZQnfn7w/
	 7YnwWe87oHMZLh3x4WqF9orRJRaQbwwSWb0NFWmAJd/3YzMKa84aFGN0xqNJTCZILsWEn
	 D6Cy938NqrGQanZ70CJjBY9gz5DB66JioUGdiDAO0Fd3Snx2TArHXDbF4fVcsMQwHsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=enUWIj8X;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A398D60A2603
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 23:07:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A398D60A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=enUWIj8X
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3b083afebe4so728153a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794870421; x=1795475221; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7noARN/sft+NtmJTHmUDUAvU1Dihrn7FLenu365oKlA=;
        b=enUWIj8XP4fdmByupRV6Q+NzmHYsTToCdcISBTo61x8Jh1LpzrDWa09rQhw6o8j0zf
         zFZqaE5P63pazT1sef9+1/JrWGdxK7weHtli/So0ILcKKBw6LqEx3uK8nYA5wk1bU87v
         3OK/vKMMFLi4B13HeojKSBQbJ+ujWeRibOE9k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794870421; x=1795475221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7noARN/sft+NtmJTHmUDUAvU1Dihrn7FLenu365oKlA=;
        b=FQ79h6b6p2vSZ7fCAwDpm/Fz6haghBlGfotI4CWCKIzkHqLoJ4TKWdyzdOFX/mSMBN
         FU6usmqCyR/sPVlWokWjrUROzvMWgslByp0vEaqDBM5YPaE6DzHDcQbQ/PO1BunQBKOS
         RkALdnGFih17Izo9cyNO3u6uis9X+lz3k/muDcbUqPE2pI6ZcgCgwUXwEVp4hn9texBA
         w9NDFuCiWvR/TQw/2BLDa0sXPpjCAWgPAtoe6UA1udNrE2veh6PuPtXrX3WwALTZBsfn
         0vLtlLcetSpG/mpGE9SsEltsEzgzNxq0gGAvzwLyAP/9m2BJjoDoJLVrFqsrnv9a/X6g
         nxWQ==
X-Forwarded-Encrypted: i=1; AL+hErF80/ef5OMYxITDYcyKTc9Nz1H27l5lD6ciBB3SzF1uAI96tkirt2k+/1I96kd3hU0P9pcVWuHO9tPSG04=@vger.kernel.org
X-Gm-Message-State: APuU4Z9pe5BOWxifXDaqBHESuzv5ejBeOQlhqDzcRPWs9z06WAD64wTS
	jfie0JRtUkEhxMqs/dSIjREZmNMUxoF1Bo+m2k/CDHftb3UoMC9gbaYoZ518bpd+zw==
X-Gm-Gg: AZFdTZde6XPUe03kmDunhp7ndxNULRaFOMZDa5UbZMYv6Puudg7bDqVWGS29z15GTx5
	K/GKAPjcubKZnQz6vv2tR62NSYxMm+Dw9Mip3MRyMsugXjRGD769Woh0mT7gcA7HCwiRWVWxdkF
	pLH8XgGrO5nmm2XKDdy3InmgBosNyIkSg3RlMmV67Pu0hof4v2SGZRzS6IWbm9UDIeQ5xzPDx/n
	WKGFKuGSF7F2FmyOG7x6IQmoggF9DxVXxrqXe8mUigUvJ+5iedeoIjAgH3R0RazTtwgP9OKicVU
	eW2UFpJg2KTvCVzVsUni4H/b9Ww1SBWPI7+hu40ezk9Zf4EPmO4jyTczBA9bZz6zkEchQje3lWf
	8UJ8gNWEXtA5PvALlGqDQWBVx0lIDjenjwPJ6GXli8xGtwYyiIu4v8LuJWbbGie3PJ63ZiC9w5z
	0Yf4x6Y/W6HVHe4nxtzQ9CNGxvQEmrIw8Jysc3F6fmGEK0qyj4B6GsSo4Zbb1D/+2MXIpemUO+0
	CDoGgXl83EgEvsJ1wywvvyojHR3DPoCXfh+anFarxM990XHa7sOyGBFVqu7LMeJCzfJqYB2G34L
	xIyePCfWZn7ShTw/m5eF3YzCL9tqPm97Q/3/ZGHHFzPlK/azGB5kvGww4p0UA6bs/W6Vopk=
X-Received: by 2002:a17:90a:c88f:b0:3b0:9a3e:bf8b with SMTP id 98e67ed59e1d1-3b1b0b5d63amr16850510a91.6.1794870420893;
        Mon, 16 Nov 2026 15:07:00 -0800 (PST)
Received: from localhost (221.247.125.34.bc.googleusercontent.com. [34.125.247.221])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-cddc1873531sm4674755a12.10.2026.11.16.15.06.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 15:07:00 -0800 (PST)
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
Subject: [PATCH v1 6/7] mm/kasan/kunit: add page_alloc_skip_kasan test
Date: Mon, 16 Nov 2026 15:06:26 -0800
Message-ID: <20261116230627.3537051-7-jeffxu@chromium.org>
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

Add a KUnit test (page_alloc_skip_kasan) to verify that page allocations
using __GFP_SKIP_KASAN (GFP_KERNEL | __GFP_SKIP_KASAN, GFP_HIGHUSER, and
GFP_HIGHUSER_MOVABLE) under CONFIG_KASAN_HW_TAGS:
1. Reset page_kasan_tag() to KASAN_TAG_KERNEL (0xff) across all sub-pages
   of a high-order allocation, and
2. Return a match-all (0xff) linear-map pointer from page_address() that
   does not trigger a KASAN fault even when the underlying physical
   granules carry a mismatched tag (such as KASAN_TAG_INVALID or
   restored userspace PROT_MTE tags).

Assisted-by: LLM
Signed-off-by: Jeff Xu <jeffxu@chromium.org>
---
 mm/kasan/kasan_test_c.c | 44 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/mm/kasan/kasan_test_c.c b/mm/kasan/kasan_test_c.c
index f34163e19bd6..72342137bb18 100644
--- a/mm/kasan/kasan_test_c.c
+++ b/mm/kasan/kasan_test_c.c
@@ -380,6 +380,49 @@ static void page_alloc_uaf(struct kunit *test)
 	KUNIT_EXPECT_KASAN_FAIL_READ(test, ((volatile char *)ptr)[0]);
 }
 
+static void page_alloc_skip_kasan_helper(struct kunit *test, gfp_t gfp)
+{
+	struct page *pages;
+	size_t order = 2;
+	char *ptr;
+	size_t i;
+
+	pages = alloc_pages(gfp, order);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, pages);
+
+	for (i = 0; i < (1UL << order); i++) {
+		/*
+		 * __GFP_SKIP_KASAN allocations must carry the match-all tag
+		 * in page->flags, and so in page_address(), not a random tag.
+		 */
+		KUNIT_EXPECT_EQ(test, page_kasan_tag(pages + i),
+				(u8)KASAN_TAG_KERNEL);
+
+		ptr = page_address(pages + i);
+		KUNIT_EXPECT_EQ(test, (u8)get_tag(ptr), (u8)KASAN_TAG_KERNEL);
+
+		/*
+		 * The memory tags of such pages are arbitrary: stale poison,
+		 * or tags set by userspace through PROT_MTE. Accesses via
+		 * page_address() must not fault regardless.
+		 */
+		kasan_poison(ptr, PAGE_SIZE, KASAN_TAG_INVALID, false);
+		KUNIT_EXPECT_KASAN_RESULT(test, WRITE_ONCE(*ptr, 0),
+					  "WRITE_ONCE(*ptr, 0)", false);
+	}
+
+	__free_pages(pages, order);
+}
+
+static void page_alloc_skip_kasan(struct kunit *test)
+{
+	KASAN_TEST_NEEDS_CONFIG_ON(test, CONFIG_KASAN_HW_TAGS);
+
+	page_alloc_skip_kasan_helper(test, GFP_KERNEL | __GFP_SKIP_KASAN);
+	page_alloc_skip_kasan_helper(test, GFP_HIGHUSER);
+	page_alloc_skip_kasan_helper(test, GFP_HIGHUSER_MOVABLE);
+}
+
 static void krealloc_more_oob_helper(struct kunit *test,
 					size_t size1, size_t size2)
 {
@@ -2369,6 +2412,7 @@ static struct kunit_case kasan_kunit_test_cases[] = {
 	KUNIT_CASE(kmalloc_large_invalid_free),
 	KUNIT_CASE(page_alloc_oob_right),
 	KUNIT_CASE(page_alloc_uaf),
+	KUNIT_CASE(page_alloc_skip_kasan),
 	KUNIT_CASE(krealloc_more_oob),
 	KUNIT_CASE(krealloc_less_oob),
 	KUNIT_CASE(krealloc_large_more_oob),
-- 
2.56.0.611.g1030f0b940-goog

