Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B42337F8C4
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 04:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789102166; cv=none; b=ZmjqCfKbic/tWabs4/yTIzA8Bx0tjqISuohMPQOslcHlq9inw7t2kZ1DolT4U6arCjhfWeBa7B5gG+j8Vzv/fazzKqEgruPeISkfsqpQiXW4RjWNvjef0nsp8c94s+BtzIwEeDtBzmK/dHiE3zti6yHJ/n4atEnM0Hm8e8sLPOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789102166; c=relaxed/simple;
	bh=+bL8Rk6CStx8UbXDkUw/Qh7xUt1BHtB/vXrgsnDtA68=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BnLIZa6Zt8j72CIvqhqbKHP8Jt9VvArkKI8K553buZrgvpsigVkV7bQoUNzDHUfLz5jpWIGIV/tD4r65ZB2jmvulk5/BnlJxgO+p1B61TnT+GR0LD7Hzdmkc3sK3hNVYjksH7/vbclkKyPbuzhtU13JGEIVxO2GhhK31LRm5K/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mgZzFnQp; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mgZzFnQp"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2d71d1cc8b2so4406105ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 21:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789102165; x=1789706965; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w4tObarZqWzLfPDYSwGxwQwAXuFMWWhRAhqBOMQynsA=;
        b=mgZzFnQp2xexFiLdfJGHlJwd5BFV4ujejGlmosBsib43JyJClSgT3raon98gYfYYi9
         0hO//28K2PLjFw8RTb2G2B+OBodvnDMNWCRyfG2QSap6nlVA7vTPum7FPNu0NqFo9fV7
         Uui3JcTny+k8upC94lgB5/LbKhQb183aeaUFP69wLHKkHc2VdGplDrjsbnDUoGSAAhhr
         vfbt1f8xh3OTQE4f0UyxcUndUjPq/xVb8x7uHNN1Ci7S2OnVTWZ0bc7TeZUnwurKSIQu
         njlSG1RQ75ApmYj1s3WzTFSXIZdaWc4UOLEJTmun61Ng9/3PzrRmMPZrdOyPZNlTMlu9
         mTjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789102165; x=1789706965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=w4tObarZqWzLfPDYSwGxwQwAXuFMWWhRAhqBOMQynsA=;
        b=W2RGTBb/Hnezqd2AKoHVajYo6Cp+ATAcY1EDXK/S8bTWun2Dsi5XDhbgRizJfv6E41
         XkVhLG7TQ3U4arhADdGTq7yYej8Pw131YF8/WxswOmFvZVnAstt/jB00CsL9ZLtSjG6I
         dyTNlMLN+XOXKEqemhHiOK708e9MZ17q0OiCNd1nfQQvZ+Zeb9JAYzHkn7f+ZAnzFZZw
         Iw6O5ooiVNRK7kOlYqb9PX/ObEJfZ1Z9HIbLG2WUhsmOgZ3uXp1Jiq94DAFHfFt6yuBN
         9nKCx+1jEfKOs7N+qkUqKLX4YzQMvds/9VQpSE1rPiFOAXyAUoBxKaZwamHta7azh1M/
         a73A==
X-Forwarded-Encrypted: i=1; AKwUvBymMpeKI6BiKjVWXGAN8Q/aD8sMSkON39ztEGXKSKKycSjhMoL9BQbH5m4iF+tPT08uHQyziTPC8j3gQCI=@vger.kernel.org
X-Gm-Message-State: AFuF++kEUqjNRMN7LKv+3XVrbE4reiWpDxhKO3E5jjsmIx3dkd3kikiI
	sVqnazyfRKITZAkX2r0WuQn8TfFczHxWow/UTYgNQmbvzywY5CmTtbYj
X-Gm-Gg: AYBFou0eKEF44UgtCpBPi7pCCFjyC58cXPq0U4kxPB/lBe0mgKUHJYB8bpLu31RwoGK
	XE6oWSfAOk0Bg3OsKd/c61pOWlTGuvite1afMff2VB6TWio5stKEY4Xn2hfyqsxDoAgXY8hP9RG
	b03FQhVsspv9GmFPIjXE1i8VkCYs787PXIIkpaqC2azLRFMn3GXAjOrnFLfrhQgRW5HVt9IetKW
	OAKTS8zRLEJyP00vq0t85alo0q+CEp2pN8c73OXbnvEADboqVvptqnnH4jmlzFNxgL/5xONqh26
	j/piKc6jOI+aM/9FeHvYzJXix7jrRlv/AXCeGPDIREyA1bqt8gr5QxahgnmFZ3hwF2SjclrSnh4
	BLxc2WIuoxLcvgS173me/YXu0TzW4wHg152y9Am4zCJHOZQDEK0NDKy7k//VIjt6KuzDSbdPRzP
	v2NpzCH4N1s7L/A9g5ikqBSD1FJvxFks/w2si0yea1m4HuunGgi8v3Vqa0WAVFwEN1yFt2CSxme
	xSshHC9c3ViWtdPmdIc2lQ3BXHbAEIZ9FoGYuMFHULtlrUq+SKmZVPvoQ146Sc=
X-Received: by 2002:a17:90b:384c:b0:38d:b36e:9813 with SMTP id 98e67ed59e1d1-39d9bed82a2mr3634401a91.11.1789102164649;
        Thu, 10 Sep 2026 21:49:24 -0700 (PDT)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f1e434sm2883077eec.22.2026.09.10.21.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 21:49:24 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: kvm@vger.kernel.org
Cc: Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <chleroy@kernel.org>,
	Anushree Mathur <anushree.mathur@linux.ibm.com>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [PATCH v4 3/3] KVM: selftests: Don't limit LE dirty-bitmap bitops to s390x
Date: Fri, 11 Sep 2026 10:18:54 +0530
Message-Id: <98cc49bb43ebc45c14cdfd596a4e64b07d2e1f08.1789097569.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1789097569.git.ritesh.list@gmail.com>
References: <cover.1789097569.git.ritesh.list@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dirty_log_test already has BITOP_LE_SWIZZLE helpers, but they were
compiled in only for s390x, so every other big-endian host used native
test_bit().

The test fails on big-endian powerpc because it treated dirty host pages
as clean (because of the endianness issue)

w/o the fix the test fails with:
  Clear page 1 value (1) >= iteration (1)

Fixes: a049a377164c ("KVM: selftests: Enable dirty_log_test on s390x")
Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 tools/testing/selftests/kvm/dirty_log_test.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/kvm/dirty_log_test.c b/tools/testing/selftests/kvm/dirty_log_test.c
index af5eb0334a74..8189eaac713c 100644
--- a/tools/testing/selftests/kvm/dirty_log_test.c
+++ b/tools/testing/selftests/kvm/dirty_log_test.c
@@ -44,8 +44,11 @@
 #define TEST_MIN_WRITES_PER_ITERATION	0x100

 /* Dirty bitmaps are always little endian, so we need to swap on big endian */
-#if defined(__s390x__)
+#if __BYTE_ORDER__ == __ORDER_BIG_ENDIAN__
 # define BITOP_LE_SWIZZLE	((BITS_PER_LONG-1) & ~0x7)
+#else
+# define BITOP_LE_SWIZZLE	0
+#endif
 # define test_bit_le(nr, addr) \
 	test_bit((nr) ^ BITOP_LE_SWIZZLE, addr)
 # define __set_bit_le(nr, addr) \
@@ -56,13 +59,6 @@
 	__test_and_set_bit((nr) ^ BITOP_LE_SWIZZLE, addr)
 # define __test_and_clear_bit_le(nr, addr) \
 	__test_and_clear_bit((nr) ^ BITOP_LE_SWIZZLE, addr)
-#else
-# define test_bit_le			test_bit
-# define __set_bit_le			__set_bit
-# define __clear_bit_le			__clear_bit
-# define __test_and_set_bit_le		__test_and_set_bit
-# define __test_and_clear_bit_le	__test_and_clear_bit
-#endif

 #define TEST_DIRTY_RING_COUNT		65536

--
2.39.5

