Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEFB63A9624
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 03:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787888269; cv=none; b=k10g63YxENvkVtX2V1+jyukdLd05CJtoaAqd/iG01Mh8PWeY2qJk1TxrwlCdxhdH8ejx0lzL2mIJKODV381jGDnRNn1GkHl4yXhEX2QMoJuv0txGCXDNK69Lu0oAI+NaCBJpGTNGv/r4uOoUgrx3/lyVwE7DTu70l+erSroC0k0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787888269; c=relaxed/simple;
	bh=oKNkbcDjhqaU7VazfR6G7Gci9K7/esIF41rpT8JLR4U=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=uL3UnDNP1engY0dOLNOmr+PKLNiKtZftzg7efRM8Nx22j/s05BgqK+5TReIRQhghePBH2MCtcoAycT+zKzhfZDjsPgjgFK55Wtmycvb0Udy2uEKfjK6HCrMjP0PbyCL7h8QZ1lXZmZfFz+HG4MnvN9lSRN9Cqq8Q8tcLbAUp8To=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wfelipe.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rtV7jP8x; arc=none smtp.client-ip=209.85.214.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wfelipe.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rtV7jP8x"
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d63bad3d09so8096595ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 20:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787888267; x=1788493067; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iw1AZp3bUhdmNrIROh1eTkPB8qZz7RwC72kTx0xosUY=;
        b=rtV7jP8xVJJ149s09TRapoRC6MO81+Wb5bLo+P3sDtc6aX0EOnyAxFwT1hLUzPGmhh
         +sZ8oCdQyKI/J+7gusg3ls4VtJzrs/F1SHqoMc3GpGd0vjpRM8ZzsulCsxQsOkIf5KBv
         6IF2ZfCiAZtyF3HWaMW1bOpB8yUHKmou2g0wwOkGbFw99U/oUsiY02PIE3DKOJWm7HTK
         zpsyTLcHUtXBLWECxleqvBNDx8RAehNfLDriJQ3w7lXPvMMdb0ZKJmJq1Jv9Lwsr3kRb
         4YvRXGeHEkKR2jzVtDnsli03/xrzLNudZk+2BpWHESr/M7aqh5f4a2aMWJm/czUl6mMp
         iQGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787888267; x=1788493067;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iw1AZp3bUhdmNrIROh1eTkPB8qZz7RwC72kTx0xosUY=;
        b=bhjxyYwZ6f/Z+7VXv2iSEElGyrIvP/9tH73syrmv0wcMobi2w3ei9LBNRjpeo8o+bE
         dRP8UKz8nnJkEWjxa7lcvMAi7oN7GdNjzyn6xF6U3hJFhMJvJuRKvCuNTTK2uDOdwUlq
         6Jecd1OMJuuUtHTNnxCds92mQDmuRoHbkQj50zGus2LLGAdANi4TkueuPatY18Tvr+AE
         BvwSAgGVw1odRYWl6h1yiycICjiFQHg3qtWff2MSQPqzto5C3k0aNRp4H0H4tgyWaqqu
         GzzbMgIPE6nq0e85OvA2XPePGH9D0uyYe8sxSAkzO7g6dtAVPPDjNpUDXlG5pKkjusca
         fH3g==
X-Forwarded-Encrypted: i=1; AHgh+RpkX+5y/x/1ly19ErpmeCJsc5NdKSyotdXRG1rgaiOzvosaJffGBsHpHWfsVP2CtMSQxfrzLzzJde5Mufo=@vger.kernel.org
X-Gm-Message-State: AFuF++kjyBlW4l23AjhummTLYmpxRucm0qz1TU4GySnkM0kIQ1dT9fh8
	997esHMHxDphBBYWNJP2IJ9LF6c9sSnU/TH7scb9ucY7gfiBnHXa2bwL/rt31OWqjpyXvTR/Y/x
	3CsY7MBvoug==
X-Received: from plav22.prod.google.com ([2002:a17:902:f0d6:b0:2cc:eba0:9e5a])
 (user=wfelipe job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:3a8b:b0:2cf:a108:7605
 with SMTP id d9443c01a7336-2d74ded6a9bmr72947415ad.11.1787888266459; Thu, 27
 Aug 2026 20:37:46 -0700 (PDT)
Date: Fri, 28 Aug 2026 03:37:32 +0000
In-Reply-To: <20260828033741.2184560-1-wfelipe@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260828033741.2184560-1-wfelipe@google.com>
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
Message-ID: <20260828033741.2184560-3-wfelipe@google.com>
Subject: [PATCH v4 2/2] selftests/cgroup: test_zswap: fix implicit unsigned
 promotion bug in test_no_kmem_bypass
From: Wilson Felipe Pereira <wfelipe@google.com>
To: Andrew Morton <akpm@linux-foundation.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Yosry Ahmed <yosry@kernel.org>, Nhat Pham <nphamcs@gmail.com>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Tejun Heo <tj@kernel.org>, 
	"=?UTF-8?q?Michal=20Koutn=C3=BD?=" <mkoutny@suse.com>, Shuah Khan <shuah@kernel.org>
Cc: linux-mm@kvack.org, cgroups@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Wilson Felipe Pereira <wfelipe@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

In test_no_kmem_bypass(), delta (stored_pages * page_size - zswapped) is
checked against stored_pages * page_size / 4 to verify that the pages
pushed to zswap belong to the test memory cgroup.

Due to slight stat update timing differences, delta can evaluate to a small
negative number (e.g. -5MB out of 1GB). Because delta is declared as a
signed int and stored_pages is an unsigned size_t, C's usual arithmetic
conversions implicitly promote a negative delta to a large unsigned 64-bit
integer, causing `delta < stored_pages * page_size / 4` to falsely evaluate
to 0 and fail the test.

Fix this by declaring zswapped and delta as signed long long and comparing
against a signed threshold, ensuring negative deltas correctly evaluate
to true.

Fixes: a549f9f31561a ("selftests: cgroup: add test_zswap with no kmem bypas=
s test")
Signed-off-by: Wilson Felipe Pereira <wfelipe@google.com>
Acked-by: Michal Koutn=C3=BD <mkoutny@suse.com>
---
 tools/testing/selftests/cgroup/test_zswap.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/cgroup/test_zswap.c b/tools/testing/se=
lftests/cgroup/test_zswap.c
index 1d3c410252e4..2e7d123e0949 100644
--- a/tools/testing/selftests/cgroup/test_zswap.c
+++ b/tools/testing/selftests/cgroup/test_zswap.c
@@ -630,11 +630,14 @@ static int test_no_kmem_bypass(const char *root)
 			break;
 		/* If memory was pushed to zswap, verify it belongs to memcg */
 		if (stored_pages > stored_pages_threshold) {
-			int zswapped =3D cg_read_key_long(test_group, "memory.stat", "zswapped =
");
-			int delta =3D stored_pages * page_size - zswapped;
-			int result_ok =3D delta < stored_pages * page_size / 4;
-
-			ret =3D result_ok ? KSFT_PASS : KSFT_FAIL;
+			long zswapped =3D cg_read_key_long(
+				test_group, "memory.stat", "zswapped ");
+			long long delta =3D
+				(long long)stored_pages * page_size - zswapped;
+			long long max_delta =3D
+				(long long)stored_pages * page_size / 4;
+
+			ret =3D (delta < max_delta) ? KSFT_PASS : KSFT_FAIL;
 			break;
 		}
 	}
--=20
2.55.0.897.gb25b4bd76c-goog

