Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAAD4383C89
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 00:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790816268; cv=none; b=pntPYFmWUMganF4qsKwl8fRbtM3/kBf3fPXtQxG1kh2HrM06uHYU3Vfbu7KjAsY+R/2h12YQGhNYbRoMCywRCtzBVFkNqCAxasVAHSZCx7cvHm5tqLuplYeU5DaJQTKtIw+hlqp/pKyt7LBJr4YM4ERC5S8oNuCQU0LDg3uGXZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790816268; c=relaxed/simple;
	bh=Nc0WoZYQl+gv4Qt2NgRPdkYosMEU3iiZOCyEnszjKNM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=lLhpDUcRNreew0PsAsOybfSIxknBTVr1EcAKColVy+tShHs30gi9TjmRFm11bEHNXdJF4ur4zzV5TIJ826fdm+l+yILBW68c9yKlz3sQVM+qdw4xrby1q9/A3U9tfBM4HpHhgGPHOiUMc/KG0//d0nebtwW1lvAzXkJ5O9M2Vys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--skhawaja.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=shQOB9NH; arc=none smtp.client-ip=209.85.214.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--skhawaja.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="shQOB9NH"
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e305755a01so3278395ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 17:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790816266; x=1791421066; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yIoi1CTTQE+H6lBdui6vFwHZt26KiAg5p1JL2AMiq80=;
        b=shQOB9NHgrxzcHeP8OG0EQzJY0+gzzpe9S6MpI/HcamGH0JhDZIf9kI+R+gN7TOaZd
         vgLDHRpUre7ge+hrRbPfQ9cXxclfVt1uvchu6ufFheA+zsH9L/JWdCNEhApWxjACCedC
         ryjjnIaTlAAi0B+DcxRUikfmCjZBQyqw9Sl+pzeO13UeftupsprqpYwsIWT0H0KhLHUN
         P9ZXhfOHfCfVQ1AaKpNnAPU/QUdgvZGNX3g1eRm766LIxQ8hY2m3z+NAsswnb+Z6ZyWV
         952K5Y3GmHoY8ATT3YpBmBlbMZf2ExRTvmPqr9uZ1r6oiLem8SkuQ+dG4TXCWBuFNzuO
         9pwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790816266; x=1791421066;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yIoi1CTTQE+H6lBdui6vFwHZt26KiAg5p1JL2AMiq80=;
        b=nsfzBUsiYcEOCJNZUFmJs0SnspcTyPF1U5MveLyn8ufDrQzj7JGHBHJTL9Y6Zn16mU
         +ccdEtr2GFgMLsdYEIlm0uNVJUeMkD8z0If9ybXUSO+DVANT3CRYRiYoxgarQWsHiqUt
         62nQmEhCJIYIBn0SQyIYvDeK8eS0/ljxv73zo1wAaPOFAMV051KtwiamzuPK0qsbmH4l
         mI/lQR7FozO4THTI4G5G322YNQ+5q9RdTHjIpj1NjjsmFePgyU972tLvvqWsBPTZovYI
         sF4UdlqQzrmkR/Fft87LF5I0Q2yt8wMK+JeFxMu9pzoNiR3QZ8rC9AFmuAEZhIawd0J4
         QNjQ==
X-Forwarded-Encrypted: i=1; AKwUvBwffW/7xGnarHnu9ALzNzqW/2ffE1//dIiD8kQzYdEBMDZ/pGq06mn3DG8lgzBlwwVNIN9VU+tUS5skjIQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJx4YkdlaoWtZoQryc7FVS5LV7Espx0hEGAh/eBTl3iQZDV4zXo
	N1CEqlQN+egQRC0hB6Ru85+cp7ECEf4muZex6NgaaNLmNk8DMDuUr8PwLUKvlAO7l9IjXleYVcE
	rUV3jnSfKddzdgw==
X-Received: from plan4.prod.google.com ([2002:a17:903:4044:b0:2df:8ab5:8354])
 (user=skhawaja job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:2983:b0:2e2:dc0c:1615 with SMTP id d9443c01a7336-2e2e4b3399fmr25155855ad.31.1790816264954;
 Wed, 30 Sep 2026 17:57:44 -0700 (PDT)
Date: Thu,  1 Oct 2026 00:57:33 +0000
In-Reply-To: <20261001005734.1033516-1-skhawaja@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261001005734.1033516-1-skhawaja@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261001005734.1033516-6-skhawaja@google.com>
Subject: [RFC PATCH 5/6] selftests/liveupdate: Add API to preserve a batch of FDs
From: Samiullah Khawaja <skhawaja@google.com>
To: Pasha Tatashin <pasha.tatashin@soleen.com>, Mike Rapoport <rppt@kernel.org>, 
	Pratyush Yadav <pratyush@kernel.org>, Alexander Graf <graf@amazon.com>
Cc: Samiullah Khawaja <skhawaja@google.com>, David Matlack <dmatlack@google.com>, tarunsahu@google.com, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:KEXEC HANDOVER (KHO)" <kexec@lists.infradead.org>, 
	"open list:KEXEC HANDOVER (KHO)" <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"

Add luo_session_preserve_fds() that can be used to preserve a batch of
FDs using the LIVEUPDATE_SESSION_PRESERVE_FDS ioctl.

Signed-off-by: Samiullah Khawaja <skhawaja@google.com>
---
 .../liveupdate/lib/include/libliveupdate.h    |  2 ++
 .../selftests/liveupdate/lib/lu_utils.c       | 20 +++++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/tools/testing/selftests/liveupdate/lib/include/libliveupdate.h b/tools/testing/selftests/liveupdate/lib/include/libliveupdate.h
index fa07fed08364..9aaf6f28ef56 100644
--- a/tools/testing/selftests/liveupdate/lib/include/libliveupdate.h
+++ b/tools/testing/selftests/liveupdate/lib/include/libliveupdate.h
@@ -29,6 +29,8 @@ int luo_get_session_name(int session_fd, char *name, size_t name_len);
 
 int luo_ensure_nofile_limit(long min_limit);
 int luo_session_preserve_fd(int session_fd, int fd, __u64 token);
+int luo_session_preserve_fds(int session_fd, const int *fds,
+			     const __u64 *tokens, __u32 nr, __u32 *failed_idx);
 int luo_session_retrieve_fd(int session_fd, __u64 token);
 
 int create_and_preserve_memfd(int session_fd, int token, const char *data);
diff --git a/tools/testing/selftests/liveupdate/lib/lu_utils.c b/tools/testing/selftests/liveupdate/lib/lu_utils.c
index 74d41115c281..1290f27ff004 100644
--- a/tools/testing/selftests/liveupdate/lib/lu_utils.c
+++ b/tools/testing/selftests/liveupdate/lib/lu_utils.c
@@ -93,6 +93,26 @@ int luo_session_preserve_fd(int session_fd, int fd, __u64 token)
 	return 0;
 }
 
+int luo_session_preserve_fds(int session_fd, const int *fds,
+			     const __u64 *tokens, __u32 nr, __u32 *failed_idx)
+{
+	struct liveupdate_session_preserve_fds arg = {
+		.size = sizeof(arg),
+		.nr = nr,
+		.fds = (__u64)(uintptr_t)fds,
+		.tokens = (__u64)(uintptr_t)tokens,
+	};
+	int ret = 0;
+
+	if (ioctl(session_fd, LIVEUPDATE_SESSION_PRESERVE_FDS, &arg))
+		ret = -errno;
+
+	if (failed_idx)
+		*failed_idx = arg.out_failed_index;
+
+	return ret;
+}
+
 int luo_session_retrieve_fd(int session_fd, __u64 token)
 {
 	struct liveupdate_session_retrieve_fd arg = {
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

