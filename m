Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793648445;
	b=Ve2y/OK7ozNvJE/yjNGrmyOIW+j4480E/VGY38YFndlrNgsDi0+IqkyyMUxRF7Zxp891
	 9PW7cHVx7LDJptTgoQ6V2xI37Xvz1oqX1If51lirDx8y1sUj9DQzx5c2xeu5E+2Z9MQxP
	 g7EP/BVZEBu3+gVViwcqwtejL7/9nj/cJ1kPJFC9uzCQ5hLZAKIceBDX5U4VMjJZev5VL
	 /n5JhsD5xuWhlblzTRmmXmQWLFUwwmKsueWGamI225KfXWwZToWawlbX4pToeqFze1hDI
	 B7Nk93t79mw12gvIwc/SG8aLNtQ9P+DxCOSpsW0gcwG9Q2o5zN3gzHEGMqacOnlWnDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793648445;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=L/v1A7jUnmGOwntEyYw0zhVdD1xgsDIS+IQzdPhAISQ=;
	b=ZNgWLPASndsC4ab8B+ZoqP7XlYOXMVnOB21x9ncRXStRM+YTUyVAbOvg87nnR/c9PnKu
	 47xQd9YfLLHqFLBdJWp71TWxxJFCgEz+ZAW7UDxrYMeHQmTqTm1qz7ebtnhYQxUCzytDP
	 ZRL76fN3XjL4PCqAt4PAMkBmc6xzEPc9oGcOqDxjCPEcXmUJ2G3HA6TqfJ7kxU2prbDFU
	 7R03MgZSUVNK3A/mgCOmkjhfoubDNyE6Z5MM4zxSZNYZOeFBTQypANbmYgBBX9z4Q6ANL
	 PdOVAM0D3ozLgg0a0TszcZa/lPmsd37MTwanCLaNeVPsFaQJJZG5UgrTeI9Bckxb3WQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JKx8H4NJ;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3946085087
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 19:40:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F3946085087
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JKx8H4NJ
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cc751eddf25so2035694a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 11:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793648445; x=1794253245; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L/v1A7jUnmGOwntEyYw0zhVdD1xgsDIS+IQzdPhAISQ=;
        b=JKx8H4NJRMumTGpjMoKwnSSEkVN5XG0Apq3OKlVeP1EEdLUEduodmDcLd4EWel1Dop
         TF6VlRpuGItaApK+pSnxDvli74ypDJlizwLqNoevaQNCEwj2lbQ02bco1NqaTYFDYMEE
         9BfjthZU4bU4dJ0te4YX8AsjEWOjKDTUTf/+WBEpp57sr71flJuXpQHM/Qwh9Wq1D8CF
         MPuSsrLOw1NfIF3+5OotD+PXAdaJyGGb3y8XyDv/T5ofW1vIzzb1i4ZN6eDBqHYcM9Pm
         w2MncVYKQB8wRpqGnM6+7V7Cy1Ycreysy/Ek3Dyr1oWuT17bXIuwvjjwYyONwrI64Od4
         LRTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793648445; x=1794253245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L/v1A7jUnmGOwntEyYw0zhVdD1xgsDIS+IQzdPhAISQ=;
        b=N+B3xknQjatWCqXM64ECfHfkN42g95QhC1jj9xdmJlP8Pr3uew2m7FBerRIeWgbv8O
         vKFtTQaqmk4C0JrxEj5+GdC28S+2TBX0DLCx1BABoFBdhE2w+rDOmaTRGyEAAyY2fYLR
         RwXbMaI75xLF7JKBGt1uNcYKfkZkcQODzZ2gYY4/2ts71DLo0AcM4CWthCDU0l7fjwW5
         y0JcvrDg+W/j3bkf7RZKB43zLIW778RHu4wdR+PKRU5S/Meg22UIQqYBKj157KIHWYn2
         F2Vd0vjy3sKKj+Amz3FpsF2BX3MtimskmvU8XDJ2kXtaVRVucz/0cwHEOYb5JcLL+dkp
         xxvA==
X-Gm-Message-State: AFq9FYJttBK2JgawewODFyaz8yZ13Fy6uazhiY+BVhox9fF1Tg1lgXhs
	DQKEmkWaBF/4QN0TrorkvJs+yrBa4MSk+3NM22of0fIYE7QwrCDtWvL2hNVo/EBy
X-Gm-Gg: AYBFou3XygVAT9jEPBx7k+sTCjIOLeVkcfT2wuMPre5AP9+GGwG3XkKyeJjHDbdx2vV
	TeHybc41yzkceKdaCh4l4MisKE9uVS9Mdw9cvOm8HVAvgvOLu91J421H4+IOxAq7cdhXZjMzRqb
	pbkMDSs9LwLfze/VzgF+DUVfYL1hJj4FB4ndIznQ+zGhvoJ6nTU5jLa7jXFS53rBeA14FSIo/UJ
	OU5fe2v2yjKsRxDZejcUgGLupcNXPJ7Gd3v2qxAJ/FMR5BijxDnb7CDG8Q+cM1C6+Lm1yMyscnu
	syCLQRcTp8QB/CuyftRvaMM7E56Yj9CJyipnaoFI+DbpUBdWLwQFN1warafx7RVBBtM1mLstgHH
	uGbmifbuPPv2cev4TULnOGeHZjeRtMTotW5Gy/M/aUfHEAp+gFmoGN7ljeV+EZ8I4jVoyfBFARn
	37c1ZVf6akCNqYncobvqbJViiLJ5Fzp3uaaQ3JXlBqZCCK5nqf/gPph0YMTq1g4cDVL895BVi/j
	ziUfhOxmQoTaKKbs41dg2orpkZCenVFtBDMaci1bLq90egr46/bN1HOUXZvOzThJvsmIPWAVRna
	T6ZZAjyc5dAIWx0lBz4TvgdzXf90n+GCpKmtkB9NXV/ONvu+qF6uKyVY+Y5sq2fK6JlgG2iMpdh
	vRrQcZYJAGsi4iD8lLnwW5HhinhEPJCs+w1CABeyje3NDAQ==
X-Received: by 2002:a05:6a20:6a26:b0:3cd:67e9:8565 with SMTP id adf61e73a8af0-3e928645db2mr10568197637.9.1793648444623;
        Mon, 02 Nov 2026 11:40:44 -0800 (PST)
Received: from f2fs-test.c.googlers.com.com (193.67.125.34.bc.googleusercontent.com. [34.125.67.193])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb364c48d4sm241826a12.27.2026.11.02.11.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:40:42 -0800 (PST)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	kernel-team@android.com
Cc: Daeho Jeong <daehojeong@google.com>
Subject: [PATCH 20/20] f2fs: enable subpage block size support
Date: Mon,  2 Nov 2026 11:39:52 -0800
Message-ID: <20261102193952.3002018-21-daeho43@gmail.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
In-Reply-To: <20261102193952.3002018-1-daeho43@gmail.com>
References: <20261102193952.3002018-1-daeho43@gmail.com>
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

From: Daeho Jeong <daehojeong@google.com>

All paths now handle filesystem blocks smaller than PAGE_SIZE, so stop
rejecting a superblock whose log_blocksize is below PAGE_SHIFT.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/super.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index b2669057b7d2..4339e4ea7a12 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -4173,13 +4173,6 @@ static int sanity_check_raw_super(struct f2fs_sb_info *sbi,
 		return -EFSCORRUPTED;
 	}
 
-	/* Subpage block size is enabled after all paths support it. */
-	if (le32_to_cpu(raw_super->log_blocksize) != PAGE_SHIFT) {
-		f2fs_info(sbi, "Subpage block size (%u) is not supported yet",
-			  le32_to_cpu(raw_super->log_blocksize));
-		return -EOPNOTSUPP;
-	}
-
 	/* check log blocks per segment */
 	if (le32_to_cpu(raw_super->log_blocks_per_seg) != 9) {
 		f2fs_info(sbi, "Invalid log blocks per segment (%u)",
-- 
2.56.0.317.g454f8302e1-goog

