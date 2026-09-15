Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB6B3019D9
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 20:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789503952; cv=none; b=EURd/x1m7KpC+Hu7VRzAsUC0Bkkod6KpbsrNsMH//Ka1p3MLhF9d4MTS0eW/wq/McBWxDuCGpG19hVVS5hkoUR1xEAqXWiT3DwcX9eyJXx6y5GM1nK4AW+GpPiUK+Q7L0vANeoZLOgcOlUcbI0oE9EGlnvL//a9KpPNv9v2gKvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789503952; c=relaxed/simple;
	bh=RvjCwhFGET9Uj66Osagy6a4qssD8e7inBSdkIa2r4RE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BB8tJWlOmukt1A15s/PFm1vT0qzufLZOEYRs6w3/gkcL85cZI72SpNbl4hlUTBzHdQqb0Ae6yyxJgNFyJu0dZnU+oVK/RMgqGTe+dWARZk+qfr+XQJqnYcCwKCETxxyqwgVeYPoJG2i5Nt2J/S2itZx8aQ4sBYazslGMrnMTujE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LQ4SIr0i; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LQ4SIr0i"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747f05ffdso1726085ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 13:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789503945; x=1790108745; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vNdtcRPen4btN0ZzDjINeGYvdaPnuO0V2FcBebJBxrc=;
        b=LQ4SIr0iJ2j0rSMPS75BkS/YsHHcvyEwx7hEYHSOzqlkoNVZPXUO5DFr+gzIGR7gil
         c5cnsBqFQhFf5lCkCSGvKDDkW2jXS7AVhXK1+BBHJdYPJ9z52DiOtr4XrttK3lJwDTvu
         Bojx3wUptCsFl2y0zPB+7YaWHgog3ZfFIx3odNqGxSMgsRLJKf6XX5YNe3ZxzYCd2zdk
         yMiCybBXIgt4fYeWGHjK0WGdfbUvvkkrUJ94ehuW8ZFE0G5pgHOGxL4fBPW3Qq9CBuQD
         imBmTTc1D5CUZOwB2Hc6BQEspI3KxNPRlUXlT+Jgk4YNU59p/ZLAd1+cSd0a99odW2wR
         DVMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789503945; x=1790108745;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vNdtcRPen4btN0ZzDjINeGYvdaPnuO0V2FcBebJBxrc=;
        b=lI2QwoWoz8hoNs10eqdMyW1XuKtuEYb9zloSxt01RB0JLzS6VWUIhlIOz6F799D8Ag
         pFauTSaH033ysHS4EkjwqgxTbTPB0Yg8fXjCUnVPSLwPR4P4twOk1JIXRT0JL8kMSrG2
         FrBV2MsS1+8dThqIGVikssd1XWPJvmsvhUDORHf/sf5I+rkAPSSNH86Jvj2/z4NorCam
         2qnyzhfKbvvQ3QXTHMuouknBCINvD6A/mvweRSvonn1n675+yDivuzzDhUUNqbk9x9p/
         6kz4ySHMPoXskFfuOKZHv/8ZeQUqq97REqzgdEEsIlHNRYDD1tgqxp1QUVwfc5834yv5
         GL8w==
X-Forwarded-Encrypted: i=1; AKwUvBxXX0yTP1clynWWPqVCzizEPU12rXqH8tkFOASuRKADM49DN/ek5ffK5YDpECBafrHaYXh1uQAnLMSnAUc=@vger.kernel.org
X-Gm-Message-State: AFuF++n9t/8f+k/gyfxWOsZ/8mKGv3ZqMZFxGZL79cQm4V0TWVGMryxs
	csxe85g3s1/rjQ04WNa5WSOhTfjKzX/NyBefkCn5+uPKaldzFRU1PC1U
X-Gm-Gg: AYBFou20B7B9aMS/cCEIuNqrTeGTyWpMHPVhS3ecZWNLCJcDGUoiBAKzGWdcqcytTun
	oLl/MXoikBWon0RzZDMibyy5nbDPKTKSS2cnvkAmf0kAWsM/YtrhS8jErX5MhLyFToiMI8Lm329
	bCT28KiEwyl1AwmOvhFbafh2gOIoy76EKyrcDpzXRp61zZsZPkE7Ootql9AB0m5ZuKQwklc2XMY
	/wCvcd58WjIUJ1U5L+ANZc1Id4/MV2O60eOQ3aXWmVBZxKnuWt65mJDLo4A3a5rZQhLv2CmuJ+S
	MtWMDPiBM++GEFMov7uQamY54OUeVkj8kMCd+0KJbJDnxeipDbW3tCvRGfwt68yCD2op0n7G6PF
	X6L6TVusF2w/PlW9e7dNgfeGw9YnV2ul2NryyjpJ0D+3ua1F5UDX0/UpeZOuAC4Qo4JOurQOIO2
	xemJ9BDqwX7vPN60zdKOMjfojK2qVDLWi/i/VRg3sHsl1rtGIEZDlxcxkexPTMIgcfAwZVP1Rgi
	O8tPC16F3WGNszxHSnKwcM=
X-Received: by 2002:a17:902:ec89:b0:2dd:7593:8634 with SMTP id d9443c01a7336-2dd838536b6mr44291865ad.13.1789503945178;
        Tue, 15 Sep 2026 13:25:45 -0700 (PDT)
Received: from nixos.tail966018.ts.net ([2405:9800:b530:f677:2b6:42de:4884:aa25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5aa1194sm1560592eec.14.2026.09.15.13.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 13:25:44 -0700 (PDT)
From: Tanawat Jukmongkol <tanawat.jukmon@gmail.com>
To: axboe@kernel.dk,
	tz2294@columbia.edu
Cc: linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org,
	regressions@lists.linux.dev,
	Tanawat Jukmongkol <tanawat.jukmon@gmail.com>
Subject: [PATCH] fs/buffer: fix NULL deref on folio-less bh in __bh_submit
Date: Wed, 16 Sep 2026 03:25:34 +0700
Message-ID: <20260915202534.468958-1-tanawat.jukmon@gmail.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

jbd2 submits buffer_heads it allocates directly for journal descriptor
and commit-record blocks, which have no folio backing at all - as the
comment on buffer_set_crypto_ctx() just above already notes. Unlike
that check, and unlike the bh->b_folio check further down in the same
function, __bh_submit() calls folio_test_dropbehind(bh->b_folio)
unconditionally, so committing a transaction on one of these bh's
null-derefs while reading the folio's flags:

  BUG: kernel NULL pointer dereference, address: 0000000000000000
  RIP: __bh_submit+0x90/0x140
  Call Trace:
   jbd2_journal_commit_transaction
   kjournald2
   kthread

Guard the call the same way.

Fixes: a2c924c240e7 ("buffer: set BIO_COMPLETE_IN_TASK for dropbehind writeback")
Signed-off-by: Tanawat Jukmongkol <tanawat.jukmon@gmail.com>
---
 fs/buffer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/buffer.c b/fs/buffer.c
index 427d8a817..4aea0bb08 100644
--- a/fs/buffer.c
+++ b/fs/buffer.c
@@ -1106,7 +1106,7 @@ static void __bh_submit(struct buffer_head *bh, blk_opf_t opf,

 	bio = bio_alloc(bh->b_bdev, 1, opf, GFP_NOIO);

-	if (folio_test_dropbehind(bh->b_folio) && op_is_write(opf))
+	if (bh->b_folio && folio_test_dropbehind(bh->b_folio) && op_is_write(opf))
 		bio_set_flag(bio, BIO_COMPLETE_IN_TASK);

 	if (IS_ENABLED(CONFIG_FS_ENCRYPTION))
