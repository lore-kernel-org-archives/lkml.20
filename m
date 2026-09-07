Received: from mail-pj2-f7.google.com (mail-pj2-f7.google.com [74.125.227.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB7643BDB8
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 11:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788782320; cv=none; b=l7I8MMZZ2mcPd17PHUZWFQ+DUkMTp/YmZftqD08vQld35jMZJKkoNvfhEUs+NSKx7nzu2oOdNmNtbpxj3BUW3tuc20HOD2KWQMhd4u9qUJCe5z4Ae/S10Et9jsLyG1R96mlnRWBEUnpxNHZe5uhm/K/0GpM+9MhT80OWQfuEfY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788782320; c=relaxed/simple;
	bh=+O6JZlxaocmNlM1ddy+oJ5oqwHeapqTTPSzjKCwdTmA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uOP5N4/PuHn0mYqb6t9HYn/AB23dbtjCu7+RoRtBSi4NxEtzaIT6y4zbVAoDFRYrTM38pH6AvuzGY+2M0bJKCDNTHnUZTveiTpgT789nPEqFqCIQAGV8bQGyYVD9j04Ipwv+cEUW1ivOVrSi+1OdD7Ix5+I/xBWgS/YxaWMzHwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gbVxKc9k; arc=none smtp.client-ip=74.125.227.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gbVxKc9k"
Received: by mail-pj2-f7.google.com with SMTP id 98e67ed59e1d1-398e03cc38aso1285434a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 04:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788782318; x=1789387118; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NLEMjkf0TBn+Gk0VGOED7cVkR/se4a7yHw0GAA0vsQ0=;
        b=gbVxKc9k1MEvXK60ep2YMNaFRGLKvYOgEaR5cwLmw8krhphAJgGlHYDPS5Tn3kaWv1
         1owEG2kl3DuPNW8D/2+JmWtGceZJhzB2IgduTM8K4QzqDQu92HsUEpbiFXAreX9cUVAA
         HDISRmdqZKNobdrGIa51QZL6W8BtHp2IL/HVlH0tCzNY3Ovcbu0kjOS698HIX1jtNDh0
         s3WD6qv83b/RiwJRf3awHHdJjkrqNYQcZghwhPkSLtZV07k65+3kfQ4PA5TzxNSeuo4h
         qn6nM4EUiVv3fSPRkwJGCJJJnbHoMNvmZ5Mz2i6mDThxSp1Fj0bWehh+Qv3yDd+uQ5VL
         nqAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788782318; x=1789387118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NLEMjkf0TBn+Gk0VGOED7cVkR/se4a7yHw0GAA0vsQ0=;
        b=BCW1KMNjB3/Y6kF5+wmUpOmN/QKXCTZ7aEScXIkA6sGzh+2HmFGvVN1R4nlKtgYIZj
         mU9xwYblIsF8FJNfVFt2p0WMrEykvs6HqQwthec9nn6sAgYFpGBMyOuQeAS/dhCQGnK+
         xuoLI3Dd1H265O3s+2D77+5P+TRt6qzrAQ8rN6LmKXLLjRs/gewS0DmyYW2LKS9vll2F
         IwplBkas9lQ2Z54epP3VOZ/CNFzN5jMqZsYmrj7RZSGN/dVlNqq1EOM41j9V6QpeIUZA
         T2WB4NHqt3IB37VP/Px5OqWmvagEM4VEDb22Q7FneIEWDVFjXOASb2ruVFkEwV+ZN4eI
         si/Q==
X-Forwarded-Encrypted: i=1; AKwUvBxDB5nhUbvctLdJngwH5qnw6v1srqMHOmhbs1bOB7vzpz1T66jpWM5aHRkIDxly+zImM8osvX0v1VeCwWc=@vger.kernel.org
X-Gm-Message-State: AFuF++n6hdAYzyWfso76DfSIlxnhjskTPTrjH/oi+EFHjVUbQwPFs4f6
	zHcF02E1/e5sscwxtsXEk+16oO7QQDfIte8myCQbQqnPjx3M3r3h4PyX
X-Gm-Gg: AYBFou3Dn+YTi+g63LbJO4Cd0xWvPdmELBPeXYlU/pmyyzttiuYWHLQy3gQTU1AZ5lU
	FjkEPL1qb7Knmy5ddEdx9pRNeX6J7pUyjp74LrYwUmxT/43JmKDkaXFHAmDjg++JsdVJ9Iq/jAG
	83ju6uVEQ0Pto5t9FSQoXwIJBixAEHrJm0h9fl0ZjC62oS9/jXxG3nuiX0S4YSUeC26mXMDeLLx
	ydurPBt5r1130v+rFwMklbqRFjBy0YbCdN8R4ir/FN2xAiy8/OqpKDxzOJmJ9qlOKduDP6iI52L
	CRM022znPoDDIYbtP0nAg8xYRINznw6BT3v0HqbIkDqkQAPQZ6xNaAl/gUKWCa9pDIHgNU1kNnC
	G3gTEU+Tattpv/7myGlGi7raYcB5d1TCyiZ6exCriFpR2cHRgVpd1dIhfTVjNOzbTK6D7jaVfQu
	yzgICpaV4IdpzkSForrCBG9iSNiJvUGjCzlYVoZOQHoQlih4cIgHnFHj95wNll1a2phVfkm7NQV
	yET2IniYdPoias5GjWBoxLHKA==
X-Received: by 2002:a17:90b:560e:b0:38e:2e86:ed02 with SMTP id 98e67ed59e1d1-39b261e7931mr34668453a91.14.1788782318154;
        Mon, 07 Sep 2026 04:58:38 -0700 (PDT)
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn ([43.224.245.179])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b813fb4ddsm2668667a91.10.2026.09.07.04.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 04:58:37 -0700 (PDT)
From: Nanzhe Zhao <nzzhao.sigma@gmail.com>
X-Google-Original-From: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
To: Chao Yu <chao@kernel.org>
Cc: linux-f2fs-devel@lists.sourceforge.net,
	Barry Song <baohua@kernel.org>,
	Juan Yescas <jyescas@google.com>,
	Pengfei Li <lipengfei28@xiaomi.com>,
	Dev Jain <Dev.Jain@arm.com>,
	linux-kernel@vger.kernel.org,
	David Hildenbrand <David.Hildenbrand@arm.com>,
	Bo Zhang <zhangbo56@xiaomi.com>,
	Kalesh Singh <kaleshsingh@google.com>,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	Ryan Roberts <Ryan.Roberts@arm.com>
Subject: Re: [f2fs-dev] [PATCH 03/14] f2fs: support regular file buffered writes
Date: Mon,  7 Sep 2026 19:58:31 +0800
Message-ID: <20260907115831.2561825-1-zhaonanzhe@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <83fe187e-e3e8-4328-bbbf-a6751873b9e0@kernel.org>
References: <83fe187e-e3e8-4328-bbbf-a6751873b9e0@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 27 Aug 2026 16:56:53 +0800, Chao Yu wrote:
> Can we check this out of f2fs_ffs_test_blk_uptodate()? and add a sanity
> check here:
>
> 	f2fs_bug_on(sbi, !folio_contains(folio, index));

Thanks for the review. I'll move the check to the entry of the function
and turn it into a f2fs_bug_on() sanity assertion like this:

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
@@ f2fs_ffs_test_blk_uptodate() :
 bool f2fs_ffs_test_blk_uptodate(const struct folio *folio, pgoff_t index)
 {
 	struct f2fs_folio_state *ffs;
 	unsigned int idx;

+	f2fs_bug_on(F2FS_F_SB(folio), !folio_contains(folio, index));
+
 	if (!f2fs_folio_has_ffs(folio))
 		return folio_test_uptodate(folio);

-	if (!folio_contains(folio, index))
-		return false;
-
 	ffs = (struct f2fs_folio_state *)folio->private;
 	idx = index - folio->index;
 	return test_bit(idx, ffs->state);
 }

Does it looks good to you?

Thanks,
Nanzhe
