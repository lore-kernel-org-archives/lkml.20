Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32BAC361670
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 19:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789845866; cv=none; b=KN/GMX+Pdsft52C1PXEqZYnOMAvaLLlfI5yrSG+y3u1HJ44M3lgakfzJy6g+hiiouv0+hGYnkppl0jAYlagRq+AFcBrUmlvFmcs7dMxZfFgPLnKo1AoKxeuUbUo8vDhgj4f4FLhiyYmJEZCKSo4v4gPKPrh1OmMwLXL18O6sx+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789845866; c=relaxed/simple;
	bh=VVnhsfm3As+sMznpo73TbHUDuc6zMzaiuu2csJA8JAI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o/FGDCMKxBP2J3gMprrIyH77TwQqqqmICdn3pgrKQlN0Y9l6aphtWfOaTNcdrF9deIBTjdIO3v8FBXi94Sn/aSwV63oX25tXCyIczL6k6+fJvnGkjFh5GjtfDJ81hll+H6IZlW00fCQ00DCYSrkN7iC6/+5czmV+9VFnn8P2ivc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OoTH/dgy; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OoTH/dgy"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d8239so12826335e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 12:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789845863; x=1790450663; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zCBYukoxlIjOQo0Rl4nFIpPvgCBBr+Fx+MuYyRfGWBg=;
        b=OoTH/dgyo4HBXuPL+vCIvony8Q0Y7KWL2bwFFWxSIxoW6Vkv5M0eodMXk3mKl123ht
         fGphbHxjBls36cnT7NSXgmSR8TxmJyFEik8+Nfr7zAvWhxSIiB33KSXZM13H5baeyvlR
         E1B9PCBlZYy6qv8qLUkI5brbYehV+zaOrxb0iX6iUTSm5YOTrhsKLGfi5FYJ1WbeE5m6
         nz5Dsbp9r7z9ZKNMFjZjJvio8Xds+SAHVznema/5+MJuY9SNofNeunmYl64TXmZHjt5u
         7r4uhDFQ8MXc0/GxQgSXEgz7La8xe/ZsZb4QEdOiSWu8Iz8/Vp9Z/qVvZLW9R6tzvfIQ
         5Cpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789845863; x=1790450663;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zCBYukoxlIjOQo0Rl4nFIpPvgCBBr+Fx+MuYyRfGWBg=;
        b=bH/OMux8gv80PUSgmJzfCwpS++7dsQrNnRI80dTLsjEbwtWr4xnOWPtJBysAiRglAO
         EcPskArOzD/KW34g+GYrP+5Pg92Na+S+NFDVDcQO9hRPom0dfYt3Um9cTWcdrq/GXBWf
         TWbZhax0HYZu0xxfV3IbUMnC8cYG21JMMWPWFjYYG+azdstTJQhynb7kvkwZenDnM5hM
         pS72Zf8F/8iNvkSdesWijujCANrEu0T/a6qzovTmd2cpV/lW41/c/yNzQ/aIwplAtUQF
         RacF1Kdx/58x7zWuEBDQVXD1vS8dSzPZ50q3/afRKGeok7amBB+7ksX4iF0n1rQ+TZOb
         kRww==
X-Forwarded-Encrypted: i=1; AKwUvBzRajGBGnQFDXHiIvs86IzShlzTbgD3B5O4bB3CQNbfLu/ihmSVYl2O0S5M0oFaG+OwdMGnAuY7E8v4Qv8=@vger.kernel.org
X-Gm-Message-State: AFuF++kayHjWS3MIhHl3uE60W+8x3/rSoROfYBtLe45jlrC34GJg4cno
	F9WblCVLiTg6uRTqYp01Ns1oLKsPX6JEiZ8pPnEc8sqEGd8VnB7cKG7T
X-Gm-Gg: AYBFou2JbhRMoVFDDUh0BM5HKIhsnikSlUYZMB5pWADIIHo3NOGnqeGH50IwNIDEXxb
	O03iictbfryY281gPdKQyGQT6I7a4T9zA/3HVJE2pHzOp1lQqjIVqPS6JSnCEKThUKb9hbOHTkJ
	ckPiKzCt8qkMjGCZT3SCGj5xivYIL7hmL9iQpnltPykrOEliQibKAlC64Py0sr77kYXl0IF5YDo
	8r1nTPOWGM3yCun/U3dcBIaMGaSk3dqIHL144nrMQSN685jHANTH7AVVyA5+Dwn98MEW3VG7xeb
	4ZjmsfPDtbhrdWsZBULb/HOec7poQgDKY6qTHIfm9PajWUfdNjirK6QD1ywBMRqnihNCTn/T13L
	YcbOXBUYeMPh4vpUSWj13AsXnIjEyGp+mU5Jnj3mXQoPkjU3l3+s2qLHzrOWGWXNueBQ1Zspz+F
	9SwxF2D5lAGh3oQh6CbIvXFig3J62SVSBTAr66frso61R79jE8XoKL+s4c+zROIMP5LLTNwaBAr
	eoiyHh95qcoS1sWLEp+l9UH56lcv8Zd7+ko0yqDvIM2u10kb/+L
X-Received: by 2002:a05:600c:3547:b0:49d:2562:d670 with SMTP id 5b1f17b1804b1-49fc56aef66mr88814505e9.14.1789845863475;
        Sat, 19 Sep 2026 12:24:23 -0700 (PDT)
Received: from fedora ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc5748e56sm152023445e9.2.2026.09.19.12.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 12:24:23 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: ardb@kernel.org
Cc: ivan.hu@canonical.com,
	ilias.apalodimas@linaro.org,
	mingo@kernel.org,
	matt@codeblueprint.co.uk,
	error27@gmail.com,
	linux-efi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Muhammad Bilal <meatuni001@gmail.com>
Subject: [PATCH] efi/efi_test: bound capsule_count to what the int loop index can hold
Date: Sun, 20 Sep 2026 00:24:10 +0500
Message-ID: <20260919192410.272516-1-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

efi_runtime_query_capsulecaps() only rejects capsule_count == ULONG_MAX
(to stop "capsule_count + 1" wrapping the kzalloc_objs() count to
zero), but then walks the array with
"for (i = 0; i < qcaps.capsule_count; i++)"
using a plain int i against an unsigned long bound. A capsule_count
between INT_MAX and ULONG_MAX - 1 lets i wrap through INT_MIN instead
of ever reaching the loop bound, and capsules[i] with a negative i
indexes before the allocation.

kzalloc_objs() would have to succeed at that size for the loop to be
reached at all, which bounds this in practice, but the check should
not rely on the allocator failing first. Reject any capsule_count
that would not fit in the int index up front.

Fixes: 092e72c9edab ("efi/efi_test: Prevent an Oops in efi_runtime_query_capsulecaps()")
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
 drivers/firmware/efi/test/efi_test.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/efi/test/efi_test.c b/drivers/firmware/efi/test/efi_test.c
index d54d6a671326..683a0524dd31 100644
--- a/drivers/firmware/efi/test/efi_test.c
+++ b/drivers/firmware/efi/test/efi_test.c
@@ -611,7 +611,8 @@ static long efi_runtime_query_capsulecaps(unsigned long arg)
 	if (copy_from_user(&qcaps, qcaps_user, sizeof(qcaps)))
 		return -EFAULT;
 
-	if (qcaps.capsule_count == ULONG_MAX)
+	/* capsule_count is iterated over with a signed int index below */
+	if (qcaps.capsule_count >= INT_MAX)
 		return -EINVAL;
 
 	capsules = kzalloc_objs(efi_capsule_header_t, qcaps.capsule_count + 1);
-- 
2.55.0
