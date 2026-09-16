Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com [74.125.227.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3B93B0AC7
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 05:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789537060; cv=none; b=dFHbHJ+4Z0I8jTNOPTaumUC/5UJIqULYAjyjYhAJgz8jM7YTfNuoNTnSth8CAoXa9NYBcMCKhpNgjFN3B4UTjzT013J4oqx8IQeXhx2j82/Ter/SCwcGMy7H4n7yKkIZP90wZDwT4DD4ea1H9YJAkOBgzDFtnsrqgvmHNkkSIaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789537060; c=relaxed/simple;
	bh=inAX3pMQC/YXbe5iF5RfjOtOR4RaRYsQHML/jNQxEY8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=MAKFTUDU0z8AbmCsVeQByqi1C/d6rYts4hNbPE5A1HLGst1gb19LkcAbuznRjNhnfhXTIbF7iQ80RbL656hwmpXmCPXZgzbpJ85i2uY5PXB8J4idqHHbp4MTFtXwjc2aAzep4Klti0eOLn0hOcTTWf3vKjZr4j15AFzf3olziyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=js06mTD3; arc=none smtp.client-ip=74.125.227.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="js06mTD3"
Received: by mail-pj2-f11.google.com with SMTP id 98e67ed59e1d1-398a0a87595so4981825a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 22:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789537058; x=1790141858; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1ChxkeSFlEbvSOnTTbLD4S7oOWfz7/k8QbTvjMY/M5M=;
        b=js06mTD3tWPQqExwOHerKrRf1cGzAgbgpzfRMiJtvQkoF1wH1mRHHOeWynf1eO01DI
         XtmL0UZqW1a1D8N9bjY0nWYPQhhCRslpvszZ23Gjsi4MhfU/E9sfggN6GB6u43gYPF3m
         U9oc15jGwfANB2vrcNANGM22pCCGRyCi3hm2tn+6Sh7oX8iviXYIe+WqxM2wneuGAvAL
         PSlJ/blyGEj7k/UJpGaB7osrtmNIhzor5+4wSfNeEruhtD3dKV6PBUrGba+OQhasYhwN
         mdAKOHflBdO4HIJUjAwkqjXWkT6BLVTPJGlTd4CuuDYiMwyx+j3wL7GmXFfjrS60GX3v
         tLFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789537058; x=1790141858;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1ChxkeSFlEbvSOnTTbLD4S7oOWfz7/k8QbTvjMY/M5M=;
        b=YzKA3lBlwyxfnQCWUyZNEeBzIVRLJGl/iRDNUdBWEJ9CyHdm9lX3ZCr4fBMdO25kjN
         TfecwuNu8giKf1tzbOlnuQdgHVUP20tz5p7hs077RUINPLPcunH6ZAEOUR+5lWwaJRUm
         kXCATtWo1sNFBeFLyobQTCPihqN7AGUdiYqQmXGq+Sd4knnNscQehitiFcwznLKisgqz
         EtzWwGPSoftf5TEvt+NFfqOUB+MTmasEen4yVlkeVuMvHsMTpzI355Dw9XrHtiKC3ygj
         1/URMlOCToeOo2H1vDmwA+oGQhZ2GEP55r/AyuCnzE+lm1QjAoDyPDyUGYv7QPhlmrDt
         lL7w==
X-Forwarded-Encrypted: i=1; AKwUvBxtH6j6OdgQ/DnTZ4qom0EhDsabGkKmXrDZxQJ0ZmtChDQ+oPZCvzDY8uW9jaxwTkhHjwiQJSVyt6qbi6I=@vger.kernel.org
X-Gm-Message-State: AFuF++kQ0DVjPLnlA5KapUGikg6ZergpzRykuxO3WqGVyT2tH2TTelUR
	3cRtbQaHGCrA3oZ3pMu/I27y9cngBR5a/W/7R+o1Kw8WdPHzG6iMzcVp
X-Gm-Gg: AYBFou0/XouKYPGqPUrvIYnnwlx1807/cEvqYPG/U2RNxScF38VOD2+iULnAHZN8tNQ
	zXaYMivGZ/P1DSwe979qyHUkktMlcjskQouhwh0Q0ZXqUYnr4HH3H1V3SyZRT7WesGhfiYmJllA
	bC387uq4O+2ovS5Krb//ZUaD+/kMaV7XdpxuqANd1nCLsEeGEBzBnBPsULxG84dsuW6p6ghKrZb
	fjCC7YnR/tNUkFjHn/cN36k/xCyT2oXCEqLCeW3jrTEHXzB1wNk7gnnw5SmBU2S/FZzgX5nbFHZ
	baZZ/nYct/usFLWi0xDlyiAr575A3YRJXn/fYJ2exCp/IcM7CrrR5mlVzJYb+9zKq4yKEjOQgpt
	Fi6hgfxBsuFYSND8KP0JTLYnet5QWIFxbQG1lR8kZwiqgrEX8/QDGhx4BOmWMxeItaTy5sQDoeJ
	fKLhKTBdJ+/iq5jx0goDOHMBATNwoF4yN61LsS+DA7dnF5EDuhBjZ+i9jvEwqw5FKbQnD+xhkp1
	7rwzA==
X-Received: by 2002:a17:90b:5803:b0:39e:1329:7816 with SMTP id 98e67ed59e1d1-39e1e484be6mr3114448a91.15.1789537057735;
        Tue, 15 Sep 2026 22:37:37 -0700 (PDT)
Received: from MS-A2.. ([38.103.200.64])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1bbe3e62sm2474919a91.10.2026.09.15.22.37.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 22:37:37 -0700 (PDT)
From: Li Ruijian <li.richking@gmail.com>
To: Jens Axboe <axboe@kernel.dk>,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] block: drop stale @op kernel-doc from bio_copy_kern
Date: Wed, 16 Sep 2026 13:37:27 +0800
Message-ID: <20260916053727.340679-1-li.richking@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bio_copy_kern() no longer takes an explicit operation argument; the
opcode is taken from the request. Remove the leftover @op field so
W=1 kernel-doc stops reporting an excess function parameter.

Signed-off-by: Li Ruijian <li.richking@gmail.com>
---
 block/blk-map.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/block/blk-map.c b/block/blk-map.c
index 9cb9605d1f62..35212355b8cd 100644
--- a/block/blk-map.c
+++ b/block/blk-map.c
@@ -356,7 +356,6 @@ static void bio_copy_kern_endio_read(struct bio *bio)
  *	@rq: request to fill
  *	@data: pointer to buffer to copy
  *	@len: length in bytes
- *	@op: bio/request operation
  *	@gfp_mask: allocation flags for bio and page allocation
  *
  *	copy the kernel address into a bio suitable for io to a block
-- 
2.43.0

