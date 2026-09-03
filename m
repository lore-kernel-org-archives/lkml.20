Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D23A37C91A
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 20:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788467861; cv=none; b=CBLvvunWSNrsp64Q69uUrm7cVTQU1a9SvRsICSeSKjKImIdjXNDUAS9Dv6KuuzpVXU2ehl1UfoBwPqepp4CGBpS6/COhjBiXXopveVorTvZIQOevfAlawr04Tr1Hb6iIYOB2rSuSJ3qLW4Y1hiVvtMimdnegXCIVduraHsInYmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788467861; c=relaxed/simple;
	bh=eQHeON0BpQBd/tO8wP0/baPlZbNUwkPl8Dihm2uv+Ak=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Jl8WtR5mVuIP/UsboJyFD8XXSObnhbTl0fjtthGNZXKZzc96j9QjXAf3YrjQmwxnot2mUw7MS4KOAfg33XcEsUji7owj+5l2cCdDWJz9V27WKSEV8NdvGJSn4/uFV4wMQU6HHr83nKroD6DyrJhmsC+64kSIAO3QfRyZ7kZDH+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mwEpWRJf; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mwEpWRJf"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48441fa5c37so187314f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 13:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788467854; x=1789072654; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=akOv2wAC7HX7aMxE6Q3m1WKBtSvSbn9vu4HmmhmzJNE=;
        b=mwEpWRJfPNFDWPxOlO/VlG+oSUnCC0DJcFaMhm9k7VwmmC4T9CEChBEFNfxl4XsAhn
         SIdLqat59QFWXM2b4BiKBFBLtrYZfUTAfHzk2CbM5cB8wMeqTOefupPU0mmmgWAOQdZB
         GHr6Vi3gQXfltHNFLJuPydI2g/fN6HlvBFljHdU1PB57ow+Za2pRod59QPcJLAvEdiwA
         lDuJS805xmAZgdX2ydvi9QU3pfo1/+OpwOMJBj3XUUQ2ULANALZuCEKJSLv3ixv4o3vZ
         Y7hOvlsFvrzWf1CLBQmA4+Y7j0EJGOYesP7OIYJdWpjF5tpKX3y7QdKpp0C8ERy20GUy
         KvXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788467854; x=1789072654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=akOv2wAC7HX7aMxE6Q3m1WKBtSvSbn9vu4HmmhmzJNE=;
        b=BsQxLWV/JeZ3GSw0d4fwuZjalDoVfum023w6lKXfBYoTySwlTjyNcNf5JF+/esAvm9
         WAHmmwgmuTIE/AFCjaka4KkmOaQBKsBsGJtzM3nF2R1N7GemQ9wjqcJswg3K1fh/Icvp
         X2ya2VhGjwJEQoOXmpzECcKgN6Kqp8lEU/8n5/Gh9GH5FH6Y5yJzezSzRVfPOAH3we4g
         lj9kEgLENVjzLo3o9xUU+FrKpMiJspdnkb77XL+tsFp5PEopDukzk6HU6LXAHKb7SNIi
         MG2+vGnU8+R3y6GIaevWXQW3kcfLK0xZzPPkILarcDYRxzcjk7ilZxgK3f7uW8Xx7Usp
         Jrzw==
X-Forwarded-Encrypted: i=1; AKwUvBzLwS6W09LKmuobIR5N34/V9k5AjlsxReJF8vMgX5q+C/C+bc1L4d7gIU7Wmgtv2KSTvEDoo0Fr74wcT0s=@vger.kernel.org
X-Gm-Message-State: AFuF++mKM5IfdKaDSRkJ28xqakjYq7f5dk/DMYYpYympSBPOAbCHpFED
	s44v+OOjpnkPWfL2r3vtmVbiqnAMO0m5kE0zEG5nrnRhvxYUBSgDH1uN
X-Gm-Gg: AYBFou0s7Jwfa6vU86eTpR2ycWYu+XVAQU+4o6ATr+rsgg2btyGmcej7kMbfUPhH0I6
	e94W73p8+FdGnFFz1u4IIFBbHQW+GLrCyAeLAUnNa7Josa+bEsv5uzQO5SO88iSJO7eblwswuxo
	+xelW76uZfZc+By+5SQo2lFzMqDcOHks78gGw70JpK53jSUojLxxfRmIwIOVbVs+U1H2/soavWl
	hNmto6wA3A+UaxA/n4+RajAnghB+V9zoEdXcBn352Waa2SooFsirB3WxcZc5EAQqoy5hBAWQKFY
	BnbB3tIkFyVVIfG50/w01c28PY7zHpQleD+9ymLLWb+i7Si3g0/sW6OdapLOo+Ie2CyVmoCzwls
	GqAKDbS/R2qY5MHrLKQUtMP54giBRn0zxt35XRKNJeHm7XVDztk/Jxmm8Y+uaTZfYAa3pPByjXl
	mW+09zd2CD642MR1kabR8FoAjmsb0X+s8n+hVKF6qNF8BBV+WSRYQZh59dTwQfNFnLZdpLps6+p
	NJCNnm/CS5qhgalZxV9ngCJE++zXe1J1jsMELj5QrH9+7rxJYyDUnf7kzI3f0u2wGLsTai+Mwoq
	o8jxsCIKZTQt4o5qxSAmzEaPrnE+soSm6vHU/f0EmH5JjuPvihTd1PuSWnultgaBVAGdW2jyp5Z
	61OGT
X-Received: by 2002:a05:6000:220a:b0:485:81a8:6f09 with SMTP id ffacd0b85a97d-485870982a4mr3472028f8f.9.1788467854295;
        Thu, 03 Sep 2026 13:37:34 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-2a02-3100-a979-9501-3df6-d7fa-8a5a-06c5.310.pool.telefonica.de. [2a02:3100:a979:9501:3df6:d7fa:8a5a:6c5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48588394fa1sm1005070f8f.8.2026.09.03.13.37.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 03 Sep 2026 13:37:33 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Vlastimil Babka <vbabka@kernel.org>,
	Harry Yoo <harry@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Hao Li <hao.li@linux.dev>,
	Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shuah Khan <shuah@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-hardening@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v3 4/5] slab: test zero-size allocations in slub_kunit
Date: Thu,  3 Sep 2026 22:37:19 +0200
Message-Id: <20260903203720.63689-5-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260903203720.63689-1-kmehltretter@gmail.com>
References: <20260903203720.63689-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add KUnit coverage for the zero-size allocation contract, including
ZERO_SIZE_PTR alignment and exact ZERO_OR_NULL_PTR() matching.

Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 lib/tests/slub_kunit.c | 43 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/lib/tests/slub_kunit.c b/lib/tests/slub_kunit.c
index e3b63f0338d5..923d8646bca1 100644
--- a/lib/tests/slub_kunit.c
+++ b/lib/tests/slub_kunit.c
@@ -465,6 +465,48 @@ static void test_kmalloc_nolock_and_friends_kprobe(struct kunit *test)
 }
 #endif
 
+static void test_zero_size_alloc(struct kunit *test)
+{
+	unsigned long zsp = (unsigned long)ZERO_SIZE_PTR;
+	void *p, *r;
+
+	KUNIT_EXPECT_EQ(test, zsp % ARCH_KMALLOC_MINALIGN, 0UL);
+
+	p = kmalloc(0, GFP_KERNEL);
+	KUNIT_EXPECT_PTR_EQ(test, p, ZERO_SIZE_PTR);
+	KUNIT_EXPECT_EQ(test, ksize(p), 0);
+	kfree(p);
+
+	KUNIT_EXPECT_PTR_EQ(test, kzalloc(0, GFP_KERNEL), ZERO_SIZE_PTR);
+	KUNIT_EXPECT_PTR_EQ(test, kmalloc_array(0, 8, GFP_KERNEL), ZERO_SIZE_PTR);
+	KUNIT_EXPECT_PTR_EQ(test, kcalloc(4, 0, GFP_KERNEL), ZERO_SIZE_PTR);
+
+	p = kvmalloc(0, GFP_KERNEL);
+	KUNIT_EXPECT_PTR_EQ(test, p, ZERO_SIZE_PTR);
+	kvfree(p);
+
+	p = krealloc(NULL, 0, GFP_KERNEL);
+	KUNIT_EXPECT_PTR_EQ(test, p, ZERO_SIZE_PTR);
+	r = krealloc(p, 64, GFP_KERNEL);
+	KUNIT_EXPECT_FALSE(test, ZERO_OR_NULL_PTR(r));
+	p = krealloc(r, 0, GFP_KERNEL);
+	KUNIT_EXPECT_PTR_EQ(test, p, ZERO_SIZE_PTR);
+	kfree(p);
+
+	/* Only NULL and the zero-size sentinel match. */
+	KUNIT_EXPECT_TRUE(test, ZERO_OR_NULL_PTR(NULL));
+	KUNIT_EXPECT_TRUE(test, ZERO_OR_NULL_PTR(ZERO_SIZE_PTR));
+	KUNIT_EXPECT_FALSE(test, ZERO_OR_NULL_PTR((void *)1));
+	KUNIT_EXPECT_FALSE(test, ZERO_OR_NULL_PTR((void *)(zsp - 1)));
+	KUNIT_EXPECT_FALSE(test, ZERO_OR_NULL_PTR((void *)(zsp + 1)));
+	KUNIT_EXPECT_FALSE(test, ZERO_OR_NULL_PTR((void *)(zsp * 2)));
+
+	/* freeing the sentinel must stay a no-op */
+	kfree(ZERO_SIZE_PTR);
+	kfree_sensitive(ZERO_SIZE_PTR);
+	kvfree(ZERO_SIZE_PTR);
+}
+
 static int test_init(struct kunit *test)
 {
 	slab_errors = 0;
@@ -489,6 +531,7 @@ static struct kunit_case test_cases[] = {
 	KUNIT_CASE(test_kfree_rcu_wq_destroy),
 	KUNIT_CASE(test_leak_destroy),
 	KUNIT_CASE(test_krealloc_redzone_zeroing),
+	KUNIT_CASE(test_zero_size_alloc),
 #ifdef CONFIG_PERF_EVENTS
 	KUNIT_CASE_SLOW(test_kmalloc_nolock_and_friends_perf),
 #endif
-- 
2.53.0

