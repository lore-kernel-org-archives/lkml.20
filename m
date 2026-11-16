Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794802180;
	b=ssAvWZ8jlfrmxvLx6nAke3skYEIq1pRnIEEYpTnm9cZx3xcDu/ZfZDMFnK+akr4lGHFL
	 CrBthETKfFfQJd0vjUhYNtM5mAt7855FbCbQD+Ls5oTVm77bvGw6KVfllXzT1vmsQi7Z3
	 YyUf6JjmUKyG/6wcQ7n6DiSKlSOFPrFP1rNXbvtxx82HPeHuGg0e4F/QgJNd57EggA655
	 OjEmO5sCUDJsfAXPrf+n0mpesjFLrbCIj5yrt7g/9tSWXn7xBgRgDOfOQhlEx0jJgDO2M
	 DmpyqUhYj1oEl/Q4L/aD/VBDfJjmA/5ivZEie0wyPxHM25lAFPPoos7kjDFb7ks3SHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794802180;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CQYaNjdcGQv9Uj6dMxhoXtev65GzOguk0tG1Y60v4H0=;
	b=aav4gPk9wgCtLdSUsd9tpPaohJCDVcp1pbM1WC5F0HVQS8Y/zAls5zponkY9k+xaPjxw
	 5VdGshety5qXRM1V4B4x7KR8kZ0E1vZ/GLGa/LhcrD+Hj6F9RqguURN7jQfjuPPTAG+Fa
	 KGdkUR02Nz6HQCa70au7gQfMbhPoJS8koWNQQtweHtoo5vLxSu8A43GaKvg/vIVnLIvPm
	 i8MaErR11MKTTDWSxVDkC4LNaPSgsyMdhQQApbt3zpl6Ca9trsSUdXNEbd8exbh7WLFs5
	 mtBtMBNkOKiErUyBt4MQRO3hbeTvQusm+kT/KbTnIET1EbYIU4wMlr5H+OkmuuQbTGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=flNYjci6;
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB9E606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 04:09:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FB9E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=flNYjci6
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cdde3597d8bso325632a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 20:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794802179; x=1795406979; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CQYaNjdcGQv9Uj6dMxhoXtev65GzOguk0tG1Y60v4H0=;
        b=flNYjci6z+ES6Fvb7kik1Qr7Ky/6aBJFmQv4NmR62G/CSUp7piUrPybOGB3p82neo1
         9QSDw0hXbp1c7oE6z5FxuB/oJ3Pm5bfR4UXB9IcI4kgK320vnR4FpyDOEqFEahAd96Kb
         gNWi4GR40vP75N3HIEUM9KuFJ4cMO5ULIIvqf0o2hMHnuWiXUxaj+dUZ9CsZJvdYtjnv
         28mMqVya9duGjaXyNoqumZ3RRVeL/7vv6FzMywOGW7p7VqoItn+gmjRoFgxaoid53yqi
         YoFf5oNOJJgP4TAo4K+GQX60TNKZ/qAPNNPCcC0I2130CY5OCbIuSSm9+L6Vlh0Kq5jn
         15Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794802179; x=1795406979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CQYaNjdcGQv9Uj6dMxhoXtev65GzOguk0tG1Y60v4H0=;
        b=uC6uGTpnbvv0OqQacLrCxYBkit5kjj1GBKBVBNxd2r8yeojqRzmbAt7ReX4q8DgDSI
         zUUGG2TMV+qNAWhsACDvaFodaYBEDii91NqccIy0/lovUo1FL9aXFKyhmnuje3rJOkfK
         +Oxns/RpjGiNMLwAmX60d/isqelwzFfYmkChqemjmN7W5avXazJlD/qRNUQoV9n92qpj
         /Dfsmo5RlUwCDJtGNlm9T4ISawJewUsqGNDpjBkmSXCbR8AAyIYj2uKqIvHFsrjaLh7g
         9ZFgnOEyrlG/jVv7I1NGjRizF0rls9XQY5hv/vZMLmOIfhUkclUQa4DSQ7UaCN03DNnk
         YFIA==
X-Gm-Message-State: APuU4Z/IDqu4K6awJ73XW7O7zDdcld3bFKnGN+FR37sXw2WWr90T9Eqr
	FMxddpyGr7Mqlj1zl3LMCgqvHdR/+VdN62hKoCuzDlNOXuYENHei3B4e7w3vQQ==
X-Gm-Gg: AYBFou3LFCCmvdo2ne8dyu58D9KVikxxwOIKHaz5+GnLWhkqVJszSjcgSTLxm8Jez4d
	89hf4jhMzZ8+GKRdoEQiBu42XK/i83SnVkxAwnOyVB8DdOfCFY4DJj6e156kLvqSQ4aD9LSdzk4
	SwNudy0WuYv6Up3HlDjG7yQ1nRVMhxj2TPjhqIVTMuWUkCm7H6fju8ZZ7UEvqAlgTdn006QBeuG
	qd1QFEkP8iY3sc5/kU0+27mKDMu6KInNamLiqwLOAXb7vxmiMKYoYsyy71xO5Az9LSe6d2nPmse
	yZlueIgm2yhjLbOl8YJcjsbwHJuxkp4ytIGzhA6RZCQtMWN8HpcMi0Tb2iFFP0dyJwcWH26CgBT
	wTNntumvCDQmvYB/nadMIddFeEs5MLy0MotE7+LgPyzwYZB40xwAJuqmgsCbUZn2m60w2E6UWm1
	Q9Zun94/jSz68wIWSg8BwKLAi7rNjXr8k8jO51hlPjQVgYhxdn03jyFQ7cJP8boR2VqOoVs1FL6
	c5yW5fT5zKdCB5pvKRv6GCPWx4On27f3jPPoMKZjwCq94a1KWEXZAGi6va9QMWf3Jwa8O37mrP3
	kxp+GnOe1kP0pYF9dxHe7yV+QSPBATBa9dDR9Zd9tMYVyyWDXo2JFtx2QaOPiM+L+hBddDih88r
	HBfhJoCMLXscGeC+qEal/7avDDL6Ck7OlDMlutmARay0EDKI=
X-Received: by 2002:a17:90b:3ec9:b0:3a7:a3c8:8f4a with SMTP id 98e67ed59e1d1-3b1b0b9207fmr6746777a91.18.1794802178829;
        Sun, 15 Nov 2026 20:09:38 -0800 (PST)
Received: from f2fs-test.c.googlers.com.com (193.67.125.34.bc.googleusercontent.com. [34.125.67.193])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b3f09b92sm7191989a91.4.2026.11.15.20.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 20:09:37 -0800 (PST)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	kernel-team@android.com
Cc: Daeho Jeong <daehojeong@google.com>
Subject: [PATCH v2 19/20] f2fs: count compress cache entries in pages for its memory limit
Date: Sun, 15 Nov 2026 20:08:50 -0800
Message-ID: <20261116040851.2849696-20-daeho43@gmail.com>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
In-Reply-To: <20261116040851.2849696-1-daeho43@gmail.com>
References: <20261116040851.2849696-1-daeho43@gmail.com>
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

The compress cache holds one filesystem block per entry, but
f2fs_available_free_memory() compares the number of entries with a
percentage of free memory counted in pages. With subpage blocks, this
limits the compress cache to a fraction (block size / PAGE_SIZE) of
the memory that compress_percent allows. Convert the entry count to
pages before the comparison.

No functional change when the block size equals PAGE_SIZE.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/node.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index f1eae132c4d3..c83a5d79f2f3 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -116,10 +116,12 @@ bool f2fs_available_free_memory(struct f2fs_sb_info *sbi, int type)
 
 		/*
 		 * free memory is lower than watermark or cached page count
-		 * exceed threshold, deny caching compress page.
+		 * exceed threshold, deny caching compress page. A cache
+		 * entry holds one block, so convert the entry count to pages.
 		 */
 		res = (free_ram > avail_ram * sbi->compress_watermark / 100) &&
-			(COMPRESS_CACHE(sbi)->num_entries <
+			((COMPRESS_CACHE(sbi)->num_entries >>
+			  F2FS_LOG_BLKS_PER_PAGE(sbi)) <
 			 free_ram * sbi->compress_percent / 100);
 #else
 		res = false;
-- 
2.56.0.611.g1030f0b940-goog

