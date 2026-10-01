Received: from mail-pj2-f38.google.com (mail-pj2-f38.google.com [74.125.227.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51EF46982F
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 06:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790834540; cv=none; b=M01Znzv7F++KqA47Z8/OtHA+8U6jLPoRuMztUN5ou34brFwS0OoNA8xhsX6rUcj1gm4UJEdIG0clEeW4nBE91tjj5EfMwFAHymgD0PXw8Zd88gY1Lw2KowQ+d0I7QHYMdoYqWrrbHASYdEQMIjAFxNPwAInNKPMElRbtiGHGMZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790834540; c=relaxed/simple;
	bh=M9kR7a3ZqEHF7vLzh2ghQg1hJZv9fRtWQ3Te/AweEeI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WMaYPfKkhJPH/0W1lCBknLVcbRFxqn+xOPco2ayLQQbjbso4GM79IYBVv0dQPL/CxQHnroOS110VeUJo2l4BRQq2J1XXUDuPH3TGOatfoDoUJLpKjTtn51HRbKIaQpb9B4rjl3grFQb4ayufNBX6f1wLjS7xwFN/+hWG7BkFT6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BaFW6rgw; arc=none smtp.client-ip=74.125.227.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BaFW6rgw"
Received: by mail-pj2-f38.google.com with SMTP id 98e67ed59e1d1-3a4c276e1c7so814280a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 23:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790834534; x=1791439334; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7NgYYXX+3pYT7yeSiDeSwVSAtcZqCQ1BZxSB1MwHyIo=;
        b=BaFW6rgw9Gg5zVTkM9eLbXxRmECRefg+IKvATn9YXbq9ePmfOPQLmvCSTlyZBFeZ6V
         KioWi8TysyMabCLviYFnPnejkMDhxBqoYV9IFEL7BNL1UWFBs5mkLzvbj7gK859P0RiA
         1gkbU1ss575WW8NMvLzlsQ8VBvchkeYqV76GihFoe5sERAB+21YU/op3Y0s61Ig+YHxy
         0QSMFGP7xrHb4tOaQnH5SqdzUHhtnwRn6c/fiI1sacTF+kLUcMRA/VHpDpuwHFT2WWje
         gdIuKNGlctcRDHGGBr5Ii0//671bde9pUgrhJ1GEFdpuZ+O4CEZVPgbdKuvqhpqnQjFf
         ivHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790834534; x=1791439334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7NgYYXX+3pYT7yeSiDeSwVSAtcZqCQ1BZxSB1MwHyIo=;
        b=JBPxPZTAoi7Zm3zx8z5VklA7gtU6TbR8+rMvOPIVIN7wvc0XMYtrR5MwcSWunTiXO2
         MtnJcFrknwjXYGPrBn+YLIgkg2SK7mXQGVvRHZkNzz40S41UgAXtK3xkiJyhq4iXRa7s
         dqU0uMW6qxRzE4X4S/JtW2iv/KXRMfCSk2OpK8238Pu9/QX7u0uTlV5KDeJM9r6Mlhpa
         TDZ/ysVveHBJsHGOokhLOeQ2LzS5U1elvLfiKa4mQcMG/+8J+xsy9TSSDPylsB7V3kgk
         cVTkup+CovFaVJGMsrKyXUmi8S+sYP46TsRRoGD02DPbw+ZJcHz6C+M9mNRTTosC4whu
         Bfog==
X-Forwarded-Encrypted: i=1; AKwUvBwRNAtAq+NsqN78KixT4LwaP5TzgcWEtz9ewfaeA2cm8rs2phQPK9NR3jc1BNC0pESN2QDt970pqcl/hkA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKb9fvstVEa+RATXuz6Q1KHGPiCmAaNcYsDC1eWTgmPWYMtpHKg
	CatUCJWm2Mz2IKINssUWODtZKK+jP+hnyj5DFNbeBWBq3q5KUTTsAkZq
X-Gm-Gg: AYBFou0//QMkn797uf5M9mVW6ukZQArDFBxGuZtpuoUQ89/lJ/TstfwNzIoLGe5qnnW
	mTKqE1Z0qBvfAr/cLPwH7G5qt9q1OkXbwJ4i9S0pFwAeFft8x6/wUTtV3doRDbcvrtYMSIj9XxC
	JlVtdUf8OE+V5tWqn0l4V8s8TinZfb3ftZXKivHFLgmQhkMK3jeEoRIktS68MJ5i9CUElxWJMwn
	PbZCeCkh96dBzHdAqR0GPDp3oeNgVvCIqsaXvxCntlzYTmcEdJFRJIwA/gvVJR1x0kc233MXLs7
	kH3E8LuHaRj4GBTh9BYtKTqXdAg0vile8zyl1BLEEE1arhHxudf6h2LTdNGXvcf/nZKI2Yh866C
	4tfUz9sFDHkshGz7IZTAHT/u62ql6/edZgXYXl/gGSBSxuOVpTJrrX0VPWQC4TYkt3BHeUnMuvY
	YtC0KvMve7qCSAblhdiWYX9EhW3fyy9YVcBFV4saXDG+Qgc42mwy0/Fx/WAFGSFxAcA6n0o3o49
	Zc=
X-Received: by 2002:a17:90b:1c8d:b0:3a4:b8f6:e176 with SMTP id 98e67ed59e1d1-3a4d18f39c5mr1377205a91.53.1790834534478;
        Wed, 30 Sep 2026 23:02:14 -0700 (PDT)
Received: from vb ([2409:8a2b:a18:4ab0:48f2:54b4:489a:3ce0])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f44c02absm2752433a91.15.2026.09.30.23.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 23:02:13 -0700 (PDT)
From: Binglei Wang <l3b2w1@gmail.com>
To: xiang@kernel.org
Cc: chao@kernel.org,
	linux-erofs@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	l3b2w1@gmail.com,
	"Bo Liu (OpenAnolis)" <liubo03@inspur.com>
Subject: [PATCH v2] erofs: fix folio reuse from a different address_space in erofs_bread()
Date: Thu,  1 Oct 2026 14:01:31 +0800
Message-ID: <20261001060131.51103-1-l3b2w1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <ar1xOV3x9ZMGx9XY@MacBookPro>
References: <ar1xOV3x9ZMGx9XY@MacBookPro>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

erofs_bread() reuses a cached folio on page index match without
checking folio->mapping.

xattr.c calls erofs_init_metabuf() twice on the same buffer without
erofs_put_metabuf(); the two in_metabox sources differ, so buf->mapping
can switch while buf->page still belongs to the old address_space.
The next erofs_bread() then reads the wrong mapping, dropping shared
xattrs with METABOX.

We require folio->mapping == buf->mapping in the reuse check; otherwise
drop the cached folio and re-read via the slow path.

Fixes: 414091322c63 ("erofs: implement metadata compression")
Cc: Bo Liu (OpenAnolis) <liubo03@inspur.com>
Signed-off-by: Binglei Wang <l3b2w1@gmail.com>
---
Changes since v1:
 - Drop the redundant erofs_put_metabuf() call; setting folio to NULL is
   enough since the slow path already releases the cached folio (Gao Xiang).
 - Rewrap the commit message to 72 columns.

 fs/erofs/data.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/fs/erofs/data.c b/fs/erofs/data.c
index be63b89f0862..4b9fe670fdda 100644
--- a/fs/erofs/data.c
+++ b/fs/erofs/data.c
@@ -33,8 +33,12 @@ void *erofs_bread(struct erofs_buf *buf, erofs_off_t offset, bool need_kmap)
 
 	if (buf->page) {
 		folio = page_folio(buf->page);
-		if (folio_file_page(folio, index) != buf->page)
+		if (folio->mapping != buf->mapping) {
+			/* the cached folio belongs to another address_space */
+			folio = NULL;
+		} else if (folio_file_page(folio, index) != buf->page) {
 			erofs_unmap_metabuf(buf);
+		}
 	}
 	if (!folio || !folio_contains(folio, index)) {
 		erofs_put_metabuf(buf);
