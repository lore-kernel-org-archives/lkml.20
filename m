Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793601964;
	b=2SJM6pkVtQ0IYLjoWkVZTgqBA7Fl3LKRj8Y0Lvp891hdUIgGvUpfaYIQMtqtMd/6EEa6
	 85+Nja2/2/2MoCLNl9GqGpqOElTg7wZXevSM7DntJrzEMkaP+mBGoP/8+pazjhIiiFus7
	 fcMGARYk3d6simsnsDsbyk764kG5BH+VRNNui9Ys0ZmVuWcSEUo2a/Gfn1VOQ0vw/vMJv
	 YxFMnZdohl+MVDyA+1KrZSTIPM3o9jJR7Lv5msC5OE962I3AKcLB93G3oiyYhKz3rzpJn
	 hFgina8wd5mm2yqGc9j/BxU5PRI4MscmdXDkoOY8mxM6zOsCvbkBRjx+8hM2I2c+57A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793601964;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=fij261aOp4ff0AwpnNS7x2Qa4LrIQ9juiwmci3p7/C8=;
	b=d2lK8KL4YIffIUV8XuRrZ68snAG1qXlfSOROfbZfdQjenMi40AwhWiouqlT6ggnAYaV1
	 7gnKsxqDECrUL8a3ZPtHmPYYNM/fqqHipUVVEHJVrU+AVa+mh40t9DJrvKk6NW4TfRl8P
	 2S0ggp6rdTxwUPyHsRtT4j5ib1KixwXT0RIgar3RO/dIJmHwQGTaHVuhKkpAIoj9/kj9g
	 zsBqRRZQv36C4ABqgaZ3sppcTYg2W+nLbFGRBY1XjPCcPgeEP17LpkK7BufBYAnlhw9ce
	 whCBvA9rtOJXjIC0JFYYcAy9t1QCuHfqzl6YVsusT9FmwUYBEu0yT+nHSf5XfMm5lqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DkkY6yVh;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17D0606A338
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 06:46:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A17D0606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DkkY6yVh
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-ca766c1c9ccso756599a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 22:46:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793601963; x=1794206763; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fij261aOp4ff0AwpnNS7x2Qa4LrIQ9juiwmci3p7/C8=;
        b=DkkY6yVhlW19p20cip40IWfyeFo87XoLCfLVmtsuFv3Jn3Npzdowkn5M25Jmb/i6bo
         i0F57NFibN5ZS52ANQb+W4/hf9358zsLgKLwgGahPbvsexO6hbXCAcbcdCzRTEpYGLIr
         oLJp3DKiVFjwIq3PTJSya+wU5PK7hUlPqPWmHW6HCjw6QjLbCEud173RB5MhT1LPfZrs
         4vqlU01Z6qAPl7AjXrUSDKwrrbmNqQYOvqupwQEU1sXfd8qngoQH7AtNdu9I6NjSuUYJ
         RAxI2hINsaTuOjSrdJAVIIOXrfrY3WUQHn+Dbni2PKuJvzL2deW0wOso+q7sCLfIBrYU
         YmRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793601963; x=1794206763;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fij261aOp4ff0AwpnNS7x2Qa4LrIQ9juiwmci3p7/C8=;
        b=K00LiADZX/Hj8PHBXvjeiSCS6HxGuG06PQ/hnI/+EaOT6OmFi7WoYYxxKHGthXHl7E
         TED8Wvvg1FJkCKhqaa093qmNBfi1aSTx4MBthb3DJKeK2t0q5QNhzrSjMX3Z+GMykQvv
         UP8YjkVDkci1INA8KAn3hlkdGH5mDhIw1Qj2suv0WpjOeiUMJ0vaVIOF6veDg2Led1VD
         Ek7aqr8wEuuOrmX4BgWKd5wM9BIukSau1J1zY6EVh6YZvcKleI/+QlbWRejuGUvYWjeJ
         sk9CZkPHn9jivA+LwCqNMS2nsiPJ8RO31HgBwDas74xn6EmbIjyG+FD/JeNYCObhEUjF
         L55Q==
X-Forwarded-Encrypted: i=1; AKwUvByx9xDIgzcTIboNqXLl6ZcI6nHS7GptMNrELd/40iO5M4JF7kfosFuvd8ogboJoZlnSZV6w3wi/wM1R3Qs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9PMtiDL8jSbbGFnTJ+mzLwQb8W7rh+/iegpffNYGCyotKuNpCS
	3ghEiIhlG2t6nD0JeJKjiECvfNZg6sMXExmqc+mU+XXyt17GBKYY+FAJK5hFd4Hs9Cv2Jw==
X-Gm-Gg: AYBFou35P4lNG3SEyhGqiP4ub4Gue7Rt0ux4saEt1sWl+P+L/H45JoAZ1v9B+YahZxx
	ULSW6rYX9OoZ0a2mZd5I4yCvK4+bzE4f67vxsDZgX91u0Ht4NKZPP4/5wWaodDJTXig/+Hv7r8h
	9W8qe7KqoCvUe6gLTfZ/YbfeemsVz5D3a23u14KoGSE6LnsKlXRsEumHRYS/DAEUARbgSNyS6DR
	8yQqN7IOQwVa5FUcZtEuH6QnOYVGgMSwNe1CKdQNO+cxGQNAx3OzTGMc/r/AxRg/sRv1jd2aWp/
	uvLu0nb1LymQSBXsGuMpyENn6kJg1EphZ9HICRCfv/YQkrxUAHz7Nbk9lNT4aWqatdxaezLKQTf
	comcyVxsPLf0LxOwq0iitkTHvU6T+p5kmi5ZI8CxWcdjmnsqTAL/Y6qCaDYP5JklQgTVMEh9NKP
	JR+uasyum7qAA9Zlku6Kj+AnnyAfAfVyL6pS61x7K69W/er4Zje3t4i7fgne1IjI5x7D+x8gt4c
	/0zbC8zhiEz3lGuczNezCoefoXr7K0YzZzTML62bSwQMQL36oAJ2qJkYELoBkEgs+lDwQmBiqn5
	9OMC3DJIrpmmo6sw2AOlBBo4dTtn6BA/IP0d6m1KgysuuLKhVY8mM8Jf4FkUIC2VarcVAusApn4
	y
X-Received: by 2002:a17:90b:224f:b0:3ac:8af9:4a6a with SMTP id 98e67ed59e1d1-3ae8976f156mr7826857a91.42.1793601962666;
        Sun, 01 Nov 2026 22:46:02 -0800 (PST)
Received: from localhost.localdomain ([155.69.168.11])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845fb9f6sm12614376a91.17.2026.11.01.22.45.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 01 Nov 2026 22:46:02 -0800 (PST)
From: Yuqiang Sun <izaiahsun@gmail.com>
To: matthew.auld@intel.com,
	arunpravin.paneerselvam@amd.com
Cc: joelagnelf@nvidia.com,
	christian.koenig@amd.com,
	mairacanal@riseup.net,
	airlied@gmail.com,
	simona@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] gpu/tests/buddy: Stop a test when gpu_buddy_init() fails
Date: Mon,  2 Nov 2026 14:45:53 +0800
Message-ID: <20261102064553.82038-1-izaiahsun@gmail.com>
X-Mailer: git-send-email 2.54.0
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

Three tests check gpu_buddy_init() with KUNIT_EXPECT_FALSE(), which only
records the failure, and go on to allocate from the allocator and to
call gpu_buddy_fini(). When gpu_buddy_init() fails, it has freed what it
allocated (or never allocated it), and the gpu_buddy is on the test's
stack, uninitialized, so the test then works on freed or garbage
pointers. The other tests in the file use KUNIT_ASSERT_FALSE(), which
stops the test case.

Use KUNIT_ASSERT_FALSE() in gpu_test_buddy_alloc_clear(),
gpu_test_buddy_alloc_contiguous() and gpu_test_buddy_alloc_limit() too.
In gpu_test_buddy_alloc_clear() each later call follows a
gpu_buddy_fini(), so stopping there leaves nothing allocated.

Found by kbound, a static analysis prototype for ownership mismatches at
kernel interfaces. Run-tested on QEMU (x86_64, KVM) with KASAN and the
suite as a module, with failslab limited to allocations under
gpu_buddy_init() and set to fail the first call's 1st to 5th allocation.
Before this patch, all 15 runs (three tests, five allocations) end in a
general protection fault, five of them after KASAN slab-use-after-free
reports in gpu_buddy_alloc_blocks() or __gpu_buddy_alloc_range(). With
it, each stops at the assertion, and the whole suite still passes
without injection.

Fixes: 932da861956a ("drm: selftest: convert drm_buddy selftest to KUnit")
Fixes: a64056bb5a32 ("drm/tests/drm_buddy: add alloc_contiguous test")
Fixes: c1696bf8d5f5 ("drm/tests: Add a test case for drm buddy clear allocation")
Signed-off-by: Yuqiang Sun <izaiahsun@gmail.com>
---

Notes:
    The bug was found with kbound, a research static analysis prototype.
    The patch, the changelog and the test setup were written with the help
    of an AI coding assistant (Claude); I have reviewed and tested them as
    described above.
    
    The runs were on mainline d135ab453a74; the test file is the same there
    and in drm-misc-next, which this patch is based on, except for an
    unrelated hunk in gpu_test_buddy_alloc_contiguous().

 drivers/gpu/tests/gpu_buddy_test.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/tests/gpu_buddy_test.c b/drivers/gpu/tests/gpu_buddy_test.c
index 2c6f1da1a6d1..e85d83e42bb7 100644
--- a/drivers/gpu/tests/gpu_buddy_test.c
+++ b/drivers/gpu/tests/gpu_buddy_test.c
@@ -975,7 +975,7 @@ static void gpu_test_buddy_alloc_clear(struct kunit *test)
 	LIST_HEAD(clean);
 
 	mm_size = SZ_4K << max_order;
-	KUNIT_EXPECT_FALSE(test, gpu_buddy_init(&mm, mm_size, ps));
+	KUNIT_ASSERT_FALSE(test, gpu_buddy_init(&mm, mm_size, ps));
 
 	KUNIT_EXPECT_EQ(test, mm.max_order, max_order);
 
@@ -1035,7 +1035,7 @@ static void gpu_test_buddy_alloc_clear(struct kunit *test)
 	gpu_buddy_free_list(&mm, &dirty, 0);
 	gpu_buddy_fini(&mm);
 
-	KUNIT_EXPECT_FALSE(test, gpu_buddy_init(&mm, mm_size, ps));
+	KUNIT_ASSERT_FALSE(test, gpu_buddy_init(&mm, mm_size, ps));
 
 	/*
 	 * Create a new mm. Intentionally fragment the address space by creating
@@ -1095,7 +1095,7 @@ static void gpu_test_buddy_alloc_clear(struct kunit *test)
 	 */
 	mm_size = (SZ_4K << max_order) + (SZ_4K << (max_order - 2));
 
-	KUNIT_EXPECT_FALSE(test, gpu_buddy_init(&mm, mm_size, ps));
+	KUNIT_ASSERT_FALSE(test, gpu_buddy_init(&mm, mm_size, ps));
 	KUNIT_EXPECT_EQ(test, mm.max_order, max_order);
 	KUNIT_ASSERT_FALSE_MSG(test, gpu_buddy_alloc_blocks(&mm, 0, SZ_4K << max_order,
 							    4 * ps, ps, &allocated,
@@ -1123,7 +1123,7 @@ static void gpu_test_buddy_alloc_clear(struct kunit *test)
 	 * and the split blocks should be merged back to their original size, so
 	 * clear_avail must drop to 0.
 	 */
-	KUNIT_EXPECT_FALSE(test, gpu_buddy_init(&mm, mm_size, ps));
+	KUNIT_ASSERT_FALSE(test, gpu_buddy_init(&mm, mm_size, ps));
 	KUNIT_EXPECT_EQ(test, mm.max_order, max_order);
 
 	n_pages = mm_size / ps;
@@ -1147,7 +1147,7 @@ static void gpu_test_buddy_alloc_clear(struct kunit *test)
 	 * the split blocks should be merged back to their original size, so the
 	 * whole address space (clear_avail) must equal mm_size.
 	 */
-	KUNIT_EXPECT_FALSE(test, gpu_buddy_init(&mm, mm_size, ps));
+	KUNIT_ASSERT_FALSE(test, gpu_buddy_init(&mm, mm_size, ps));
 	KUNIT_EXPECT_EQ(test, mm.max_order, max_order);
 
 	for (i = 0; i < n_pages; i++) {
@@ -1176,7 +1176,7 @@ static void gpu_test_buddy_alloc_contiguous(struct kunit *test)
 	LIST_HEAD(right);
 	LIST_HEAD(allocated);
 
-	KUNIT_EXPECT_FALSE(test, gpu_buddy_init(&mm, mm_size, ps));
+	KUNIT_ASSERT_FALSE(test, gpu_buddy_init(&mm, mm_size, ps));
 
 	/*
 	 * Idea is to fragment the address space by alternating block
@@ -1490,7 +1490,7 @@ static void gpu_test_buddy_alloc_limit(struct kunit *test)
 	LIST_HEAD(allocated);
 	struct gpu_buddy mm;
 
-	KUNIT_EXPECT_FALSE(test, gpu_buddy_init(&mm, size, SZ_4K));
+	KUNIT_ASSERT_FALSE(test, gpu_buddy_init(&mm, size, SZ_4K));
 
 	KUNIT_EXPECT_EQ_MSG(test, mm.max_order, GPU_BUDDY_MAX_ORDER,
 			    "mm.max_order(%d) != %d\n", mm.max_order,

base-commit: a1e63ab695ad76850ab9787b9eb6aab695dc2965
-- 
2.53.0

