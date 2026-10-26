Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793011856;
	b=11s3vRgDbcEaO69AS7eX2p8Jo0K1d62qrEmqk9ta6rrgjB0c8I7HvKS/gXvon6gzid9Q
	 s2akhNx7mZ9GbBUfMlKWmNEIUzBf2ipun+sygD14sWVZ3Hp+Cl+Ivo1GS/ObgZmOuWVUZ
	 e/zcrkd7P1Ow7H6kko9Ag2vBDyznOSH6UvKnCFYOe2p05y3zw4Ocea4sB5/sSKta6Qf/8
	 Cc1tuYQ0V51uxg401i8zboIco8hqLsbMcc0gaXWm1Jvp7skiq6HXpq2vsSqU3y8+Pxb+V
	 zjFPI8OOVzwsKazfTSm3Jkqfp8JlEk04v6NbT7m9Z1JviEApBupvXBKkuuWEVpGlY1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793011856;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zpoGBsTQ1MMQtEr8iRtFOb/elu0nHODI5EyL2pzDfwY=;
	b=o6dNjpb5IfblcW8247rbWz9M7r2fdBuDoergbhEXOE8+jiQTD4YmkEA5C5M6eNXliwYb
	 Be54S27Mnb6UcOqb9VWICBf2OwbLOQ9QUe3c0qM6SZ1jWK61zoeIr/jHk4s7dmKSYBh1p
	 xMZN+c9CnFgeXraTUKqEpWtSUsiLfKI0gaARPXRzP8nlS3BYLkynWNmUAb7ekhTqTlVF6
	 82U6c3TFLX2KAWXrne+BtMb/NAOnU0TdfXqkkSSRxCPVhXCdrYfXq2pxxspnM5mFrwVOL
	 8gBy+4tIbSt6eY5zsAdwyqUErsoctpOLK/AZI03yrJavNNOSkxQOosI1cMKYLAKEaEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eB3nclYt;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B8F606A327
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:50:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6B8F606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eB3nclYt
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-156cbe59622so2049527c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793011855; x=1793616655; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zpoGBsTQ1MMQtEr8iRtFOb/elu0nHODI5EyL2pzDfwY=;
        b=eB3nclYtzQ1Vfnnnt0Y8TG+UyWLz923k7t7nN2Di5brv/ggzQ4Dz3kBr1UOF2P8UZE
         rz+Y090lcdMA/sMuB9DsSHZFLY7RVlzw3y0PGtEXtkL/Y4FAFikeIaHOUzD2IEZCOaxA
         xVRlD1KfozP9xRkz1IaAX3XtZnrsE3Raa9Pw30n08wG0fllkcWIKlA7VekuMCA3kJiHw
         vBvJrntCZLk6Xlq60v06lgHfFWxfRZ8PaM8jwcjMusAZX7hZMcTR+ZLjnAdTMDniTYBa
         4qSAULj9o4/FXp67/nlVWKsQROJqdPOMYg8TLnbm7cYw2MucyIhtcHympgNclzaiclwd
         WeDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793011855; x=1793616655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zpoGBsTQ1MMQtEr8iRtFOb/elu0nHODI5EyL2pzDfwY=;
        b=d2bGyIly9IQ5bwKzh7ch3QO5jdcEOgU82Bqi41jDapAjVbXgFDRYcPD0c9t5yfURD7
         m6aTXSIJYSAUIRmIU3j/0Aq3YkWHz7kwB3deLTSpmid+2KQ8JLazQeYuxBsWWfuwZHLX
         LmqidOHhyiY5/ZuHyASCkjgKSS9iNMNkAucl/KlMH/z2MxjHSqFWGAwdYZGOdyVAgQzQ
         PXOGrJ3+ZDTeskDBu5o9jm3ZRoXrTUGEW+SpZksmzS+tob1yL0hQvzaMRanz6qo65PpZ
         vGnk/V0RYq1UWn93pKB3iUNGosmPqfI+ha9EiEFdvw6eHP90296CaSkoxqdiNvfPr1w3
         1Smw==
X-Forwarded-Encrypted: i=1; AKwUvByxTfhC3UEj7oj/ryQqwaIV5E2viN0aIdkRMyc+/SiM5fGRM99FGYfM4jp2yyGcQhBX0w/uhZGW323nk0A=@vger.kernel.org
X-Gm-Message-State: AFq9FYJzFCsJUx1kU6cjgg1qtLBFRevCINV5ttduVGpFSaY11Ug3fJV5
	qSaK3ANwWNu8DSWArygCnnBtTPQqdZWABN2nMREoWxV9IUo2t1wrgJjTzsTND2z8WhM=
X-Gm-Gg: AYBFou1X8lP+Ul+LsrSBkptfECbMr4XZ2Nxu5BJYUQ1EI9lNa9wCq69FuD6w0Zaqupv
	XW9jDM9NrSxjQMc9YGEHk09crCKaLUzbLROJ/zAqqtC5EVVXsqNkiZ9tYvfUGZ4DSRMFGyQj/SK
	aZFf1JBz9Fm1lHFqLbH2Fcfzaqo2VKx6727qskgvyjFRIsYf5/3v6GhalOdCdEDbBXpC2xeBRB2
	8nKRfV6Q1RDHav3ng0rc5pemFK5PJrSOxl5KwFL0O43yDDQSo0oJ4K+FmnCMGluTNescxDhuhFV
	CgdEzOccHg/2XhSZ5mjVaqU3JywGxJ8RiIRCotv69MQH5Z3xChVT9290EhFtN+Bxncl5Azqu2X5
	i4Ou/XNPJaDRSm3fY2b/YO31ztAERaJQmBMqAanjloUK3lal+6DFZ852ewNus8CxJbTidyMS9ad
	WAiNCBwiKT5TH0joLBEy2iOoOFXqUygwqHDfUWEBgVu+orLFw0RybYYynySndaZml97dvi1MwH9
	J3DsWY7vjIuoKdiwWMkgBFnpYzesmbe2PCzHmoGwa7WOgrjHHZQuDDJ1kjaCv22GspH5/YEjObs
	uBRAaPCLQvHqS/QHmew=
X-Received: by 2002:a05:701b:4586:10b0:196:4eeb:76e8 with SMTP id a92af1059eb24-1993562594bmr9140816c88.20.1793011854790;
        Mon, 26 Oct 2026 03:50:54 -0700 (PDT)
Received: from youngkk-vm.localdomain (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a020df20sm27897863c88.6.2026.10.26.03.50.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:50:54 -0700 (PDT)
From: Cheng Yongkang <teel4res@gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v3 1/3] f2fs: reject non-directory parent inode during dentry recovery
Date: Mon, 26 Oct 2026 03:50:39 -0700
Message-Id: <20261026105042.1148554-2-teel4res@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261026105042.1148554-1-teel4res@gmail.com>
References: <20261026105042.1148554-1-teel4res@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

recover_dentry() takes i_pino from the on-disk inode and uses the
resulting inode as the directory for __f2fs_find_entry() and
f2fs_add_dentry().  A crafted image can set i_pino to a regular or
special inode; the recovery code does not check S_ISDIR() and then
writes a dentry into a non-directory inode, extending its i_size and
changing its directory-only metadata.

Reject the record with -EFSCORRUPTED and mark the filesystem for fsck:

  F2FS-fs (loop0): recover_dentry: ino 4 is not a directory
  F2FS-fs (loop0): Cannot recover all fsync data errno=-117

Fixes: d624c96fb324 ("f2fs: add recovery routines for roll-forward")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Cheng Yongkang <teel4res@gmail.com>
---
 fs/f2fs/recovery.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
index 54b524660..3e8054324 100644
--- a/fs/f2fs/recovery.c
+++ b/fs/f2fs/recovery.c
@@ -209,6 +209,13 @@ static int recover_dentry(struct inode *inode, struct f2fs_cached_block *entry,
 	}
 
 	dir = fsync_entry->inode;
+	if (!S_ISDIR(dir->i_mode)) {
+		f2fs_err(F2FS_I_SB(inode),
+			 "%s: ino %u is not a directory", __func__, pino);
+		set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_FSCK);
+		err = -EFSCORRUPTED;
+		goto out;
+	}
 	err = init_recovered_filename(dir, inode, raw_inode, &fname, &usr_fname);
 	if (err)
 		goto out;
