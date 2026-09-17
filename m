Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E2C4915BD
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 08:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789634380; cv=none; b=r4LU7SKUFi2nMSqWFYpyVOex7YofBsQuw9SYx6RX4H8p1rJNqIuf9C6ijqhrqBUR1ly/Ut1EzCzO1sz3OmOuk16Udyc0pDqNeb18XLLr/eengNV77PURf570HPHBMTyrJpypYJSriYdb6S31tHtxCT0l/juP6EMwdhihWzEb2J0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789634380; c=relaxed/simple;
	bh=C4kFc9I6aVRIR23qveBzfUYCOoqafUcO8GKRY8IEUQc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p7o/BBGtGA1UPLgUZmu6z/lZLy4TxUctR7hHjMrVvVRrt9usCgWYV/1BXkqfz6vRv+vYgNjVxRgTn30Uos87trxEZGym+b/fHWjAGFoROjr1FqUlYUxy+BG0/5Ni2+VFBDZIBo2MnY79JTHtTMJc1X7yFUDVi8uvKFhrAAycBP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AEFu//zu; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AEFu//zu"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396ccc02279so473935a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 01:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789634353; x=1790239153; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SRUmR5tq1gmAFewuT5+MHhVWDUO1ZXIe6LR8I7vNdgA=;
        b=AEFu//zulXtVjumPlHI7xvNGFCO7l90G+bFXk8ZSNrV19JDF+veQ4oHp01BZ+AA+FS
         UbheYbgoXWzCdesBt9Cxlq5zAGC/wKc0/YwB7PsOsqvJs4vJ7KG6l7Lh3Ldw4qAEoRMx
         kt+e+YOYThjHK8P74TTL1jE+LJMJ2gk22yHJG7eSWLTEtR6ykL0nrzoI0p71XfBI9yfW
         1SkYVVsAJmUm1HqGKF4TXKPEeJNkN3PNscPfSVrY1OhIUMZoPxxIHHBGT15AtyIZcZ+k
         B3Uw2B8BTrkckErw10Lxu0CbvKVLk3u8Hi3xwzIvKNfrNx1CKYnXfieTHkB/J55sK96X
         tSCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789634353; x=1790239153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SRUmR5tq1gmAFewuT5+MHhVWDUO1ZXIe6LR8I7vNdgA=;
        b=mICzrkNX3BkuzkIaxX1tteZXjLk/I2mcWI+PbRRBvLWqLLtWoWmmRJnCeRyWsvkeGH
         1VihlBK1XfGeSlh2W8BHzv0PZo1RqhTKuz9S3H34hlD3DbnghrKlCtoyNSsKTePas69u
         +DpwCyXJKcsyIkoFTpSbEZbQdnwN8ndwhBIYeNPooX6p0rghrkn6mB6eoINyvxJwpqju
         918r8KkjtClrkmc3a8AV7weT1SJup2T1yw1BJDucO1hbpLEN2o4ycJll7jCzL8/sEQSH
         R4Icv3euAK8tCnPAcCnnZkTNM9XDeKHQ5yHkuB+7r+j255CcxYCcmHPniqJPVQS9HzUt
         XcBQ==
X-Forwarded-Encrypted: i=1; AKwUvBxQorcZOs/r6TqEuldxFhcD2He3Q5qI1vZcO9nvKW2O7V8zZpispxIdRc5FXIaA/D8z/+I4sQnZTopIKIM=@vger.kernel.org
X-Gm-Message-State: AFuF++lNlV0CJhrayuZfDpMMeVu7vO/JHntze/RTLx6qXu8vFJPE10no
	bOnEzkqdc34IMjllq6D3KVngH5ecH2aZJIvWYuzwY0nZWdMcHtW3VSgW
X-Gm-Gg: AYBFou1HTrEEzRhlsEO+Pb3fgpYcnP5aJGzX8IJGR14JOLlsYECanlUbd/mQxKvM27g
	csfJCuV51FzZw0DqZbIhQ2tRtTmif3twkTpb0uIeodyEdBkthAp6YvQFBymaIiHFIsInhMuwQGK
	ugjtbrtLE8O9+vVWpwZMoL7kv8rRLuGDHVxQTkzbGY+SpzoKSwmQiMyK/9dm+qDKr+BA92+8tj2
	xBTKYjvPFSQTVJUpKw0ktLFXDr/9Y0oiaKrx/ppxzmYIXkQdcmP5s6/Cb1G23bVbEb19rtGnoY5
	+1wMwbXfaODFIMIeSHhfh9z5ra3BmY93/iRHckQdGXc8iatfyHlVP5pkH6jn+LYLM0x2yxvdLqY
	YTotdGgxABbmNxLTUuWrO1nldQCh9sG1BS/VBKJAemrACsc+ebkKHtlwPOfJGLdrkel12XFfo/d
	JeQ7H9aH49tOxu8C3NGyRbqJrsQxQ3x6mUchtTQwtG4dAqMYVoHfd8arofhgK39H37qEOX6iZVG
	vhLwK0mY+QlJKXqJc6TzipxClRLkA==
X-Received: by 2002:a17:90a:1c97:b0:39e:1fb6:9659 with SMTP id 98e67ed59e1d1-39e1fb6994cmr8667721a91.22.1789634353131;
        Thu, 17 Sep 2026 01:39:13 -0700 (PDT)
Received: from localhost.localdomain ([183.194.144.114])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e35e56298sm3871317a91.9.2026.09.17.01.39.10
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 17 Sep 2026 01:39:12 -0700 (PDT)
From: zjamg <ndaugoing@gmail.com>
To: Song Liu <song@kernel.org>,
	Yu Kuai <yukuai@fygo.io>
Cc: Li Nan <magiclinan@didiglobal.com>,
	Xiao Ni <xiao@kernel.org>,
	NeilBrown <neil@brown.name>,
	linux-raid@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zjamg <ndaugoing@gmail.com>
Subject: [PATCH 2/2] md: add defensive bounds check for bio in md_write_metadata()
Date: Thu, 17 Sep 2026 16:38:20 +0800
Message-ID: <20260917083820.57091-3-ndaugoing@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260917083820.57091-1-ndaugoing@gmail.com>
References: <20260917083820.57091-1-ndaugoing@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

md_write_metadata() allocates a single-bvec bio via bio_alloc_bioset()
with nr_vecs = 1 and attaches a single page 'page' (either rdev->sb_page
or rdev->bb_page) via __bio_add_page(bio, page, size, offset).

Because the bio can only ever represent a single backing page, passing
a non-positive size or a length where offset + size > PAGE_SIZE is invalid
and can lead to out-of-bounds reads during I/O submission.

Add a defensive check in md_write_metadata() so that any oversized or
invalid request triggers WARN_ON_ONCE() and aborts before constructing
the bio.

Signed-off-by: zjamg <ndaugoing@gmail.com>
---
 drivers/md/md.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/md/md.c b/drivers/md/md.c
index d2433cf41e65..3fda2965c631 100644
--- a/drivers/md/md.c
+++ b/drivers/md/md.c
@@ -1142,6 +1142,9 @@ void md_write_metadata(struct mddev *mddev, struct md_rdev *rdev,
 	if (test_bit(Faulty, &rdev->flags))
 		return;
 
+	if (WARN_ON_ONCE(size <= 0 || offset + size > PAGE_SIZE))
+		return;
+
 	bio = bio_alloc_bioset(rdev->meta_bdev ? rdev->meta_bdev : rdev->bdev,
 			      1,
 			      REQ_OP_WRITE | REQ_SYNC | REQ_IDLE | REQ_META
-- 
2.53.0

