Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6DED469837
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 08:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790756398; cv=none; b=fB2+VbQk66bE++DfhHSBAwsnSvL+37j7RgZ7SjU6mS9c/3OQSFRF9agx4CHPs4sThmFS48N7m4e+zJNlXyZInfx0C3WC0St49CLD0YR2g0ICnPskXAnnzHfAYEJ16tinHKcipqQ2jHs+PQI7z7RHTvON8FCI2lJ6/kLy3MHpCM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790756398; c=relaxed/simple;
	bh=enU0N7uRFm+CiPQQfCZQiNG6I6dn5+gaY0icBM12JG4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JsWtjKmNPuGjCyc3jwJtHbPc96sdGzQnW76Cb42yTDH1njYe63AyaOD9dHygXL/UMb8fbd+qVZ72TXcvq3ONX9ziBzjQq5RpP+fEoMSCk2iMqa8xf7PEOPtiUWgdEdHp6FA1X8s3X+J612ML8KfDIcIwHdxvGe7hXC5/IpbxJb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=asMr0gWv; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="asMr0gWv"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc433d52421so1821349a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 01:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790756392; x=1791361192; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5r+yyKKy88D8/jouNE3+ZYHc7zwXUtNu9IJ40uPJuDQ=;
        b=asMr0gWvrTjdxI39gvU63MGsVsS8zzt/NXQAe5Ggx7HuJn8hMSIhI18zUm0fJlb8R5
         eTHYWOPiACH+SoRFUG6qwnl3biyF50pCxWsKoHGzf5YOr5wztF0K2Xu1ABJuSaBdtQwO
         e6fU0sPfju0cSxXMhqAhggK4yKc3CDE2TTOLNeHxM4Q0xtW1DRxWxPUio5BB6bCxJhbQ
         SEtDXM4oKizoPjao9i3Eam5S1/bkXEAgv6iGIaRfNf/B9oLkdzF2WfxfKmKlCd6nshej
         53okj1UGRonxBFk9p8xT+FYm+iy0RuZc/wRp9K8qciHNo/+0Czp6vLHfB1kQWN0E26Rh
         Biqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790756392; x=1791361192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5r+yyKKy88D8/jouNE3+ZYHc7zwXUtNu9IJ40uPJuDQ=;
        b=aA2MovJIdxDpaReJkdhsllC1iUEfnGj99wJFa6DgKOHpsM6VH74ksjb9qleMtzeV9c
         U7deIrsXXbYqIFOH9E7KsquuuobWT85Ikuf7VPGlUFkgT/jMiEzlOm4Nkt3NQNsk0E/U
         KUW+tPxMrxmaL7TFLyIu4HsEZ/CiPyCOl34QsMBxIefVjYyvZR6UVp+f7g1cXOt1W/Mt
         bnfBq/EtiloAVEvsGc59wG+aCHlwgbExgqmeZqjwZ+okHKEZ9hphem7OzQuMih418uTg
         l6iZqcOcv1ELtGmYviXyTlffaCkf5C4+aK3595k3tNFF0qQLNeEJdnMb8x6VQ8U6ZwYw
         5u2g==
X-Forwarded-Encrypted: i=1; AKwUvBy5VkVsiVywM0w30WskmDUs75b2z4DKflGDlpLEegWIUsKPOmsQMLL3JUZ6tq+ZXcbRTzWA3zXbDBBsNMg=@vger.kernel.org
X-Gm-Message-State: AFuF++nvG/JEI0az9RkHw2F2PcCCaGP/HwBQNapsdqsQYScT+GmHxN1D
	dkDSDoaqQq9qNBZOocZf3f7lmo5vidG0i+dnV7B+pAa+q4THP0W1cDrR
X-Gm-Gg: AYBFou1gVdDy6tY3PZR4Kuyx90e46I31EFGeGiUl5eNU75Lh1VPL2VTywxPq1DTxd/y
	468ZRxYk1W7DxcaUKD5k8yLK0YY51LIVhDvZX1l9I6A31t7sSAoc+70U+hfZ9Y0GOC41zHGdhCO
	LbpSBnh5xuFRerZOS8lBWkD09mtiHLIAfIMlW0aC2Yc85BlsSlL8IUutvXFyejIqhUMc8+RbuNe
	5T2amCwHfJM5e635YGQvYS1u+pJRFrdW1zfi15Xy+PvRsp8iWylLIgZw9/aO4+o65FNc02HX5BB
	R3FLsWotarmn9dnWQ4EimiOWMd7wKJJrQgagRYn0/7T0Or/JCbNCsnkWO2kw5diS49Ont6cvsXc
	E1ee6Cf4QzpAwno3OVEYvN/vsJlLUWfi2HvRsQ++YUnbz8skTgW7/FI+1uLDgIiICVdxMy0SWF9
	BJBhPFH3JFp31kY5DSilyrcfs9QX1kSjsARUBEuA3zmC8CpBovvSMAAwPKesZIaxpROF6skTDvT
	9UUOm+PytQ10cpRwi1oQT8oj9w3jOpZfIc/kzU1oDoKfTp8LDpbBtiheDIyBXH7Xrkla5lf3qCU
	CH4iSqxBWQ==
X-Received: by 2002:a05:6a20:d791:b0:3de:2d39:b5fa with SMTP id adf61e73a8af0-3de9e6e5c96mr587085637.14.1790756392513;
        Wed, 30 Sep 2026 01:19:52 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (25.187.82.34.bc.googleusercontent.com. [34.82.187.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc7da126a49sm453319a12.7.2026.09.30.01.19.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 01:19:52 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: Anders Larsen <al@alarsen.net>,
	Matthias Goergens <matthias.goergens@gmail.com>
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hui Peng <benquike@gmail.com>
Subject: [PATCH v5 4/6] qnx6: clear sb_buf after brelse in qnx6_mmi_fill_super()
Date: Wed, 30 Sep 2026 08:19:45 +0000
Message-ID: <20260930081947.511613-5-benquike@gmail.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
In-Reply-To: <20260930081947.511613-1-benquike@gmail.com>
References: <20260930081947.511613-1-benquike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In qnx6_mmi_fill_super(), when superblock verification fails, brelse() is
called on unselected candidate superblocks, but their buffer pointers are
left set in local variables.

Defensively clear sb_buf pointers after calling brelse() in
qnx6_mmi_fill_super().

Fixes: 3377755f1064 ("qnx6: add support for MMI (MME) media filesystem variant")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
Changes in v5:
- Updated commit description to clarify that clearing sb_buf pointers after
  brelse() is a defensive cleanup measure per Matthias Goergens.

 fs/qnx6/super_mmi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/qnx6/super_mmi.c b/fs/qnx6/super_mmi.c
index a8b512c09890..19f123d45678 100644
--- a/fs/qnx6/super_mmi.c
+++ b/fs/qnx6/super_mmi.c
@@ -102,9 +102,12 @@ struct qnx6_super_block *qnx6_mmi_fill_super(struct super_block *s, int silent)
 	if (fs64_to_cpu(sbi, sb1->sb_serial) >=
 					fs64_to_cpu(sbi, sb2->sb_serial)) {
 		/* superblock #1 active */
 		sbi->sb_buf = bh1;
 		sbi->sb = sb1;
 		brelse(bh2);
+		bh2 = NULL;
 	} else {
 		/* superblock #2 active */
 		sbi->sb_buf = bh2;
 		sbi->sb = sb2;
 		brelse(bh1);
+		bh1 = NULL;
 	}
-- 
2.47.3
