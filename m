Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A683538D90
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788189692; cv=none; b=kBQ9MN0squknqTN6V/UUwWxG14punM6nVH3rPshhMbho/Ee1Ve40L9VubvgdFINVTrbpv3klK+PO3qB1Sg4PUFfjaPDbFvZqEtRlhhis1qu3mtx3Ku0W9EVTCFkSqMIdlszStgKZ6TYxCxObZ9tD8WFSzbshzB8+zlIGmKiJi0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788189692; c=relaxed/simple;
	bh=d4C+oISs8ASeTjE405C18tiA451W0TvVEaZooCCeh1k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dbAB+K1rIQ7ibRHlxmD2QG/9Azw8+CkM2cLSUXLWeVvV/SZ1HYf3ojGfRyBhUTXXznTBIdqslas29jDSmmKfu76RYQdSrZkSOuiPmFL780rK8GBmB+0EO/8/Q2rTgOZ2RoGpTd8CF1BGQZqmpJR20BTSAjYYn0RxBuesHT234aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rV5ZoH9M; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rV5ZoH9M"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-484374f54d0so985693f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788189689; x=1788794489; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EeDOa3UQ6qSuniQ8iVMBKVscy2UT6ZrGGYbSUHa/WVQ=;
        b=rV5ZoH9MLOAUQet/ZDRqvdwkiguJwC09jiMjTt21FF8HNPBEKovBiXpPgfNwnm51KA
         tMWr7r1/Pv5waSeceP8jMrKAn7IrPJZ+TPaB1KzSNrbQsK+fHhP8oi8pQSlpml3I1cgz
         /ghVmWI+WUXtRk505yAaivcW+5pvUBx1DywZvHdjFS1KDImRzFcmU2lpt/m2erP6fsML
         udD7YJJTJUGGsC1It7yHCm+FQZENCUC6GEgqeuJI+rPJED8BizWEUCxOQ042S6/V749I
         Q18ZoBac9Gcl7RJ483ORIipypQCWvf/KtSNffKNQpQ44hWuZ/fbJH5QrL429okyXDrGd
         iFNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788189689; x=1788794489;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EeDOa3UQ6qSuniQ8iVMBKVscy2UT6ZrGGYbSUHa/WVQ=;
        b=H15Vb15CNB8loe589kYU6keGD1TkiZwTprBuSFCGlOVOiqVDdXidfRLeK2MwVG1jR4
         OI1Fzr2x7tvFdWqUVXrOqJ0T7CwunnUqE4bkMlC03FnDNMNIAJS+8V1gH19p6VZIrVnn
         0Mix0p9NVAgwEuODPiFMGE5ed2F8pMFiEL6zXlAtu35Adz9ynlw7C438SUo4hZAsDU5K
         aK9FFilwg/jpaT101NLDe/2Rtjv9Ti3TiuhuqTGvTmLOYqnUvV8WK7IUy1OEEGpTbKee
         Dpo7V1s2g+85R7VjA7KOJmbdc12rk7y61Ka0Oi3gMRZ9IOWvfJD0u0BP64OVAOovIwgK
         8ypg==
X-Forwarded-Encrypted: i=1; AHgh+Rpva1WJMs4U95sqKJUbbvRYrqKdL78t9Vs1x900IUoSafeW3Ad3T9kQP40LKdDzMzALG1NgT0ehcef2Ow8=@vger.kernel.org
X-Gm-Message-State: AFuF++nfJqBhP1OwiQ9vK+0BOMmIBhFDF25OX3dxtgIAHKKz5LnWAUNP
	dwZNnphUH44No1GlYoSanIk4JT0RHUjgXfUKwI1Xu9GNpH9B97R4HAc2d45mWN4Ek2Q=
X-Gm-Gg: AR+sD12bODJw442ZDsHlhYwUqtuo7ch92ebvGk9pN9iaAmy7QNo/qNncQZrcDL9Cccp
	IkJ0z1CQtmFYAKa30D7i1/Q/5Qc07+IeCxH+BX9Fxg5sP5N6OrTsB2cseEOj8uxHnqTW7FLPtwu
	8n8wN2mK+d4DnpBMeR47bpwz3XG7RQcxQrtjNXyq9e+f7b4Kl9W1cFMap4Nv7nTbhBxz24KpZdz
	SNsUpOsS64p2p3BWJOW0u6fPvDJRyKR22LsQsx4NSLhYNkIDNtmPE1X+6qncraI5O2qGt9GSv2K
	C+8O++NqDlg2ucODcFeM35SCSgbVvnTJJoTQL8F1tSaupclXSD6xDHDGs62kJhPy1iL18a0OJUj
	N5gmK5LYXZlzZ2WH2j/qLEDee5AwJMBHaXJAMNbAc6M/bPCKMxwt0B+RU2j1rdvCq8fKQdxZgxf
	17N87Pxa0md8UYqI3KuvlQZdwF7AXQeXDIrxqKjpxYN0KLBPJ9Ih/t2lVp0SSHMEyiM99PUc+3X
	LGRfmTnBTBWfRAO5aVdw0yD
X-Received: by 2002:a05:600c:8b5b:b0:49a:5b88:f551 with SMTP id 5b1f17b1804b1-49cdc429f0dmr27121445e9.6.1788189689334;
        Mon, 31 Aug 2026 08:21:29 -0700 (PDT)
Received: from unix.. (244.red-81-44-253.staticip.rima-tde.net. [81.44.253.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b963c3c0asm528166815e9.10.2026.08.31.08.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 08:21:20 -0700 (PDT)
From: =?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
Subject: [PATCH v1 1/2] block: brd: destroy xa on allocation failure
Date: Mon, 31 Aug 2026 12:20:43 -0300
Message-ID: <20260831152044.166353-2-ivanrwcm25@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831152044.166353-1-ivanrwcm25@gmail.com>
References: <20260831152044.166353-1-ivanrwcm25@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

xa_init() runs before blk_alloc_disk(); on error the path called
brd_free_device() without xa_destroy(), leaking the xarray state.

Signed-off-by: Iván Ezequiel Rodriguez <ivanrwcm25@gmail.com>
---
 drivers/block/brd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/block/brd.c b/drivers/block/brd.c
index 00cc8122068f..c18262295c39 100644
--- a/drivers/block/brd.c
+++ b/drivers/block/brd.c
@@ -346,6 +346,7 @@ static int brd_alloc(int i)
 out_cleanup_disk:
 	put_disk(disk);
 out_free_dev:
+	xa_destroy(&brd->brd_pages);
 	brd_free_device(brd);
 	return err;
 }
-- 
2.43.0

