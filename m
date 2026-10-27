Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793117889;
	b=s6EhoNOcZHLO9DG5miOVK/2SfYey/cs+ia2ECb//oyKuA8waDpQ71rmeK3L0j9gcjWXa
	 zWP6aAMozG2iwKvvl79tvg2KNLERRZIibJ5AxFvbrFHOCktuMBD7cv1HSY7upJRV9h9hB
	 u2KE1jz8+NECRqO6R+MXom5OQxprEw4HYoyVHBsO8Vgrp3BpQgVYlonU8k2+EPXLCLKzA
	 ICAIbnm9VVLpxoki7HXiALs9ykp/sMbuGlsCPp9hJCmOx7DJ2F9fyhtIKuwCiDFs/jhQz
	 ZBWZLYiFPjmOT+qDSD10TZPAjRYMWdKdhojrruxIeqw3Vr5s4MTyGzpp6NT8iqf/L+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793117889;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DPXZ2yO3cU+s5EkiY6YjtMfPdHRJToYSpXviTD5gzv8=;
	b=HtJ/M3Da9ZWqiFfavF7b+C/S5cKJYTJZSUJLGhAiS4zMiDUQV8r0ejPOEm338dl6Bg0S
	 oSuNwKo2lO4bhwkArZiGYVIZjV4Kotax7eEEGR6dhs4n/gkISLTIuwtX+7S0wjD0rn5Lx
	 XJUMUM7XyijK85BVwHKEnBqrpa4fq9P8GbQglYrDhoNUKVENhHi9E/HbxrVK3C1y3a+Ty
	 y/t5S/ubilcOMe7QQDms4c4dP9BbbENEx6RG0PAtM18dW2v8jrEhvT//s6HToPotI4Jsy
	 7POvCKKclrYuDC0UZKvp/93YiEZ6ZwL4idEFl75CqNqQVUDlcxyPSFTXRpO+BTbaqRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O+JlxNbb;
	arc=none smtp.remote-ip=209.85.128.173
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F223B606A320
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:18:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F223B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O+JlxNbb
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8b0ca86a515so6344397b3.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793117888; x=1793722688; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DPXZ2yO3cU+s5EkiY6YjtMfPdHRJToYSpXviTD5gzv8=;
        b=O+JlxNbbBci8nKYL2Pt4pT1VkmDlJsEd1AdhRhqw9wYVP/lt7TDymN6QDIQOPZVQq3
         HUA/xOfvzFYdfdao/+3O66XnwpitnwgsFXdhICCmraATdxZa4LwGXUdvwwNukG1cLe2L
         5qN5g2BveaYqj6x+IUjtD/oWIa3LZHMZPB3OSKx6SzVBcL5HDu5em3O+ORdHWQ3qqStn
         bIr81WEClQ+YbTAO/hc5rh0iDu4rFJUC6zZclKwpjN2YSRsr8Hcj7dm1GheulqnVJiVd
         7sRV5FMdTBhs48Wh/8Cmp0zYffAFLRWmoEY1HwUDDLAVf7U7NYOpWKNLQjx8xM2ecX1J
         lOkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793117888; x=1793722688;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DPXZ2yO3cU+s5EkiY6YjtMfPdHRJToYSpXviTD5gzv8=;
        b=ZSjJAyyI2RGgqYVXIuiTh4GVZ4bdPpHB5SVLTZmFAiRoseiohk5gQU0B3BJgL8ejJC
         2SAgngu1dsvHOif6smxh3EiAyh5AcjNEYe4tCS1dUXkNNY/pkpDOxdADYtt9Hap0ifHm
         LMUZwe0gTCEse0gOTNzNhRr+t6iPW3WNM1yWw4gPgM+bv17U8VIC3WTdhlJFlhfJddQu
         yNGXrMdgqL+5uEqfFsWEURWK+Reopy0+tXQ/zOTokASF0s83PfptR0QLKsSIdNmjbTep
         vaDFsiwAI+swBizWb1hKY2JUBDbx53oIxAh1Ie4qullC5ZvEcxzOP5X8RLLaxVh/Max1
         KRZw==
X-Forwarded-Encrypted: i=1; AKwUvBzkQ52/puCQnYKDWeeNXrJ599ZH+EsSiZfd13xurgfPuGrRd1KGfzqMNqhOkgIMMKVokDMrVUvBaSdRDgQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJjt1fSk64rszyr98pOqFOIgoUv7B0LV9rbVaPegdM8yUeZuTb3
	wPCXJb7vrR475RdxU041m4bVJ2xBJ/pka3Ff6zPtW3B2CZPs7tWt8PUl
X-Gm-Gg: AYBFou19qmhLLzZ4aH9NadQAfGbFitQjwEYQjU43Cy+3sAsivQV7PJiGVpDwvgsvL1X
	y2W+2h0N8Imb7ucSSX8RgEdFgtOaqU+UGo3+ik6Uwbh5/IWnTR8RbYqdTywrlR3/5PgbneTAQBZ
	cocTlHZjiAXv/rHesInPDwc1oO0iVr3PmFz6gNBjvj/2CuJmLdLLzlfVc8B1PxTz/PRbjfi5HOx
	A6pO1nBfil6471erJeuLHR5Yt27hs3EdFpqArarDE1lOUvIIjoebkozuVdlq1EKLkohPfejv+0V
	pCFYlX8+TQhDMZCDF05xnjBdQKC7Zfkwv0xrO0DE8J9HYWJfDva97z/BHSw4g25bSo7eKq4A0rL
	XK5XWKw3sqIN5zUFq3g6qlCZYZbpJR5WruM4yyFQBsmtFUUVMtwKdGSUssNj53dWMogUJGGMsiy
	NwtW9LVEq4JOGDrpeqk8medLaL4gD/AeTY+96TFrmMw8rPNA2r2q5ISIOn2VVM+JvrBMud7Bmjc
	dEDyNS67XaOipil23e9sAGOgvAwxrDi3x9fhMXi/wgHAJaEiN8ck1FSCIAVLSxY0jOv3dk2m9oq
	vLHSdJE4epJgK+rlZ7BkXRrl42rrNKM=
X-Received: by 2002:a05:690c:a847:20b0:8b1:a3dd:a6b4 with SMTP id 00721157ae682-8b1a3dda6e1mr20302397b3.4.1793117887797;
        Tue, 27 Oct 2026 09:18:07 -0700 (PDT)
Received: from tacolabs ([2601:6c1:600:2d04:4132:6a2c:2819:9df8])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b19e656162sm15033077b3.44.2026.10.27.09.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 09:18:07 -0700 (PDT)
From: Reid Downing <skibletz@gmail.com>
To: Carlos Maiolino <cem@kernel.org>
Cc: linux-xfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Darrick J . Wong" <djwong@kernel.org>,
	Eric Sandeen <sandeen@redhat.com>,
	Christoph Hellwig <hch@lst.de>,
	Reid Downing <skibletz@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] xfs: fix wrong compat fields in xfs_ioctl32_bstat_copyin()
Date: Tue, 27 Oct 2026 12:17:48 -0400
Message-ID: <20261027161748.2760321-1-skibletz@gmail.com>
X-Mailer: git-send-email 2.53.0
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

bs_blocks and bs_xflags were both read from bstat32->bs_size.
Read each one from its own field instead.

Fixes: e94fc4a43e5c39 ("[XFS] Add compat handlers for swapext ioctl")
Cc: <stable@vger.kernel.org> # v2.6.29
Signed-off-by: Reid Downing <skibletz@gmail.com>
---
v2:
 - Also fix bs_blocks (spotted by Eric Sandeen)

 fs/xfs/xfs_ioctl32.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/xfs/xfs_ioctl32.c b/fs/xfs/xfs_ioctl32.c
index f6875a2cc70..77bc936bf0d 100644
--- a/fs/xfs/xfs_ioctl32.c
+++ b/fs/xfs/xfs_ioctl32.c
@@ -143,8 +143,8 @@ xfs_ioctl32_bstat_copyin(
 	    xfs_ioctl32_bstime_copyin(&bstat->bs_atime, &bstat32->bs_atime) ||
 	    xfs_ioctl32_bstime_copyin(&bstat->bs_mtime, &bstat32->bs_mtime) ||
 	    xfs_ioctl32_bstime_copyin(&bstat->bs_ctime, &bstat32->bs_ctime) ||
-	    get_user(bstat->bs_blocks,	&bstat32->bs_size)	||
-	    get_user(bstat->bs_xflags,	&bstat32->bs_size)	||
+	    get_user(bstat->bs_blocks,	&bstat32->bs_blocks)	||
+	    get_user(bstat->bs_xflags,	&bstat32->bs_xflags)	||
 	    get_user(bstat->bs_extsize,	&bstat32->bs_extsize)	||
 	    get_user(bstat->bs_extents,	&bstat32->bs_extents)	||
 	    get_user(bstat->bs_gen,	&bstat32->bs_gen)	||
-- 
2.53.0

