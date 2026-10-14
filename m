Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03DBE568524
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 17:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792000690; cv=none; b=XFwjDpgHaiRDtkRdFJKUsy0p9az+uytzzxiDBw4s87I8sVp9LSDBoUqRIwDVgAawwbc6ILXlERg0NJg34Y4WcHov0r9CljDpuNrsaVmGeEwGj1ShaScIjfshNH59F4zytb8eh333vCkRpBG2cakHru2v18maxRgFtEJPgXVLNm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792000690; c=relaxed/simple;
	bh=RBY1rm5m57OTxM6rzLZnBppbmcBXepNbmDS03aHEmGk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=brw2FdbAkOnfh2vxX1OD6O0UnpNA046aWsR7cX/LRKqTN8MQluXGhR6ccFB2GCbH1eCE8TjNnozl+SnTY+W0iTd6HN4kY3ax1rQ4ISvPu47vtfxPxa/kn7yG+wSBHZgJiCXHIubL1v2edsTFEGUY9rQm6Ur6EDLk1r6YDPOBwns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=Ea8lSsHa; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="Ea8lSsHa"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-5339173489eso47954551cf.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792000688; x=1792605488; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pJbFkHFq6Y12l3Bi7MpiC5ltuWIc3jdeP3hN8D/FbRY=;
        b=Ea8lSsHahxNRRj609qdGWSFTN8eOkYV0T4Fx9mt55/19LMcvSHE0NwwsbbOxbpRAHH
         HpINP3xZEEqZH1r06V82hbv60Vn84Fc6YSewxBzg/WpW+rvYXADVtiXPrDm2KUHRMbtD
         QSnaQHOlqG3g3nQ++z96PSmvuWv7nAgOOy7Z9iDooZrQQAFxK9oZT4DAanb0Cadmpvzn
         vs+sLCN59LkMjCtUK54gk3LAhORs+/0oILGuNctL/GgH+h6VLqm2rZqPg6U+lr2le5T0
         1IrdLM2lNHVVTGzjlhdyTGmgs0jiIMF6d5TP1VPbdGXjVjfR0QH7gpP1+k4+8yVtoQHS
         Rpdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792000688; x=1792605488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pJbFkHFq6Y12l3Bi7MpiC5ltuWIc3jdeP3hN8D/FbRY=;
        b=mvvWwdEqkw8/k0UTok9iTIwWUyQSepdfipt4L9D+4tUv/y+JXmCJ2L3GkgVNw8DBTn
         Bh42qlQ/jAd5SNbc6m6c4M5Kl90NhAuSwaHdWeOKjSSPU71QUaDRNQUSyoQ0KfKBVtj2
         h4HOL0Fsx70uo1x53SfiDd77KpBeD9NwOizWKDfhaGiRZc7s+SZS3SLuKfwagHrsfIdP
         1FKRNlbMNFGEhs7QACSi32p+cUu+mDt0FavEEMbxhpaWVqvla08xBdKUf/Y9aE+DmsPq
         Jtv4RrL+LoXcK54kE8vNWDBHWvUd7UVeQZNDELpbgcgu00pd+41qX1TJFrShnlVVPIfk
         aKAA==
X-Gm-Message-State: AFq9FYJO9LSUh/BvNeLGnp0m+YywMxYkungqUMCS9KhZt2xegAGQdyZu
	NnYUuJQA03SKnhnpw0+c/rAX6ygw7vLL/WFLKCM/z8GckTOG4GIGP6Ld8flRPz9zkd0=
X-Gm-Gg: AYBFou3B1QObtNsdo1cdTuPxP81Kvpkyu+0/uKa54dak0DfhZvWZ0KgP0aL7WYArcB9
	kAmrv4bP8WNmGl83SUV9vBDKtokgbum59FL5qSkKgM8mz6apBO3C8gTIZR5xQ4W/XEnGIKTX5lw
	Dt/+N7ljGfP+2fpYOzaGHueTStsO3i/qEnYplp0SmAEmLDPQyRkTHFFLmaOsclL58p+mj3uZ2Mm
	TEYD3zLo5/jt6PLGpa+eFvlnWwiDlRsROl5peQ6LGjgQ92AObmo9rp4LCsncT2cJegmpm0FKVhe
	DWCF3H4021kRL5wYh2FbNV8Y1sgnHQ3lWjSljgTHZm+FJEIiHwsrVLLxp1kIXMUwuDGxxqiKVH+
	+JkEtszZQPB0JKK3CsDiEGYITdE0Y34MAq4M4cKmwNyHTfqNGuw+GDAWka/HOohNV9jdYvD/uo4
	zjr22lh1oJPNLmw0vzGikhYVK5n9cstk1CgBBwjDk6RQRUUriUMQePeU3gXWneVk3K1naiVfRpc
	jzXmfQOMYlKxMu6seWjNnH+6gBQgL0T4kxmH/bxq/ZQwHCJNJqyJ4s+OqXzHo9C2BK99ww=
X-Received: by 2002:a05:622a:418c:b0:535:a5f7:d585 with SMTP id d75a77b69052e-535a5f7f25bmr272204631cf.63.1792000687747;
        Wed, 14 Oct 2026 10:58:07 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97b95847sm58498006d6.32.2026.10.14.10.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 10:58:07 -0700 (PDT)
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	shuah@kernel.org
Subject: [PATCH 2/8] selftests/mm: check that MADV_PAGEOUT skips holes and swapped pages
Date: Wed, 14 Oct 2026 13:57:50 -0400
Message-ID: <20261014175756.2035176-3-gourry@gourry.net>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261014175756.2035176-1-gourry@gourry.net>
References: <20261014175756.2035176-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The contract tests check that MADV_COLD neither populates a PTE hole nor
faults a swapped page back in. MADV_PAGEOUT makes the same promises, so
check them for it too.

Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 tools/testing/selftests/mm/madvise.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tools/testing/selftests/mm/madvise.c b/tools/testing/selftests/mm/madvise.c
index bb4efb92e6da..42cc08fe45ae 100644
--- a/tools/testing/selftests/mm/madvise.c
+++ b/tools/testing/selftests/mm/madvise.c
@@ -85,6 +85,11 @@ TEST_F(madvise, cold_skips_pte_hole)
 	check_skips_pte_hole(_metadata, self->pagemap_fd, MADV_COLD);
 }
 
+TEST_F(madvise, pageout_skips_pte_hole)
+{
+	check_skips_pte_hole(_metadata, self->pagemap_fd, MADV_PAGEOUT);
+}
+
 /* Neither hint may be applied to locked memory. */
 TEST_F(madvise, locked_vma_is_rejected)
 {
@@ -131,4 +136,9 @@ TEST_F(madvise, cold_skips_swapped_pte)
 	check_skips_swapped_pte(_metadata, self->pagemap_fd, MADV_COLD);
 }
 
+TEST_F(madvise, pageout_skips_swapped_pte)
+{
+	check_skips_swapped_pte(_metadata, self->pagemap_fd, MADV_PAGEOUT);
+}
+
 TEST_HARNESS_MAIN
-- 
2.56.0

