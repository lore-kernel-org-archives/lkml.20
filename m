Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B8E3BB132
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 10:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790506639; cv=none; b=I6ey2iFR7TxGRRdbfKzeSHSWeCY1cJtr1AAcl23B5W0A/Sk1gDnM4c6C+pFNlqwX6zDjtXMpVR3x4p07sV64pdU4RxdMg3Eci7L1Gn0O/s7+jFRspTasoW7xZY9VR4iGrMQVgKev6ibLD+C8eP1FKKxXl1fcmkL4MGZZfcpYcHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790506639; c=relaxed/simple;
	bh=TMXpwMrgBc0WthLXYnkP/QxmhL5jxeiWxjSvV6naBUE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hCWCWdB0iAYPgKtrlXoFmchQ000GUoNPgjdsGxqT0gK458Hst78xiPpqjeIMy4NAyVa4RlKjtZQxfrArX2ExPbd2H+9nOQs5q3q+1w4AlIQa23I2sKds5y1hEIOOu1CdDBUYO4OXMjs8fXkbHCHaXNaZhOmC73EXakTkkaD371E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D/xF3HJM; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D/xF3HJM"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d91ede8035so18762685ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 03:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790506634; x=1791111434; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xSjyGs9dHuPWxLkKlfnkoqKEvH9ZWWVKxeYf0xIQxxU=;
        b=D/xF3HJMuGGIE0HDKvhkTBWU4bdOV2JDvw7VZ2rHnUnt4TrnmLUS8uPGX4gS7euK9/
         6WXHkFSwN5ghYxjtANuimS4Uau2jBZUaWWCldghhCkvPMIQJxMPJtP2MdIPou3YzXHdA
         MJnJt3TsMtRRz6Ua5M5q/HkZ+meDjVXwneeBpCNfxo9HrpqvRO+x4gniRGbQBCKvBIfA
         m/ww/dJdpXqvjqRMCYG7FGW9nQ9BwnJ2f3tDDmKj6UwrqJrdu6oJk7iBZjSCOiAAmcZi
         KzV4X669PQD6KjTjdLwL52eZUIZYni7u3V6TxzedSdaV3cRNmwZx8mhO1bxLYROj9UtF
         Llwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790506634; x=1791111434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xSjyGs9dHuPWxLkKlfnkoqKEvH9ZWWVKxeYf0xIQxxU=;
        b=GYcgrvbE7sxlxnW0kOmz6j8Vv3y+992We2EeTvEN2Ms60PrltkQHpgDmJKwYzZOId5
         0fNupi92VInxhMS2f4CqadkRYNoSfErLatzPV1mDINz19ySaVuADMgnEwIA3PRCILXY4
         6OEYYoWqGyrkWD1O/PuGoQxsAWeETM32+yZBrAl/ZLTL5BVoqtCEbgCUWaxIog3NISpC
         YCjfiIgvBLjd26y7nF2gfH6ybZQa0hqgiP6Q3A4IphT+7dARVYTlmSUAvciaSSYATL7c
         aligrBodur3RKp4STS4H55i7u/ogq+xupnyJUhE1f0FP+2fD9CjWSAS2AjXPdZMBprHU
         LxCg==
X-Forwarded-Encrypted: i=1; AKwUvBx0bcdLuPw/5h0ROQH7VAAghx26QcvUzKSw2096K88Omda8JxM03u2kTQv5Mns0SZr/a9pl5WomwSydDtM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKy4N96jp4rc96iUha3ASxBgSVNnj4QS057JgtPNFNtsogev9mZ
	8yBDT2aWA3WUd4TCxKyOTvcsqcTbKwk/1bLuma0DegfjtKlC4JsSnr65
X-Gm-Gg: AYBFou1h0zpM2EQbWrAUMH1fm/VIL9o9oOVEEy5IAOosR2jjXsag2cdpMitFXm5Vo5B
	xY1veoVtgZl5PDgP7YjnK1RlorxVEOYS6k1Gl1Z9urmqXkXQ95aCji/8VH7vh5XpMbWXs/XU7nT
	6nZ5vrfHJPEjfb6e8uH81In85fvnqiSAqOjK7mTChVkVH4yHidR+ZuBsteWTI9QG3/0U97Ebt9O
	NNXBluALYtEylg9+RqyFIHvNwNlQLSEdcJMNVrUKQJan/FWsuL8TDiux2lB8xYIirbCUGkO7bAc
	sahBg/4C9WJwmLPYBmQNOEg3M9f4hzrmsqgeCrOhQyo3BBHNXbeuwLBm/+0ZgePXwH6plz40Sf5
	OV+v3nuOmVuCWd4vfw6yQRaB+kzLyNU2OoqedMLuv3NIm6oArJbVNknhpn124qB/CqCfnpOkMB6
	6ACj27hp/QyJTYLTTZenSOOPLuDE4WeFHbuHrAiqfGhOXO/VpKeYfpa0txx102inmpBwuAamQQ/
	O0uCHpUnrSU651kkpv9sFt1n7brpe4RBSv7fu19jvO7n9sSIQe/K6CFJ1fqUsR74sudhnEcnYjX
	gXS7dgRAXldrSrOFC9k9PsWbupSrgLKdTelR8g2XOKXdlhnfjbHxJE8DTG8=
X-Received: by 2002:a17:903:4684:b0:2dd:ad74:ac81 with SMTP id d9443c01a7336-2df94b948b3mr51119405ad.28.1790506634463;
        Sun, 27 Sep 2026 03:57:14 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df91442ef4sm28521145ad.55.2026.09.27.03.57.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 03:57:13 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ntfs: do not use a stale runlist pointer when undoing $MFT extension
Date: Sun, 27 Sep 2026 18:57:06 +0800
Message-ID: <20260927105706.3111333-3-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260927105706.3111333-1-matthias.goergens@gmail.com>
References: <20260927105706.3111333-1-matthias.goergens@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When ntfs_mft_data_extend_allocation_nolock() fails after it has
rebuilt the mapping pairs of the last $MFT data extent, undo_alloc
truncates the runlist and then rebuilds the old mapping pairs from rl2,
a pointer into the runlist taken before the truncation.
ntfs_rl_truncate_nolock() can reallocate the runlist, and KASAN then
reports a use-after-free in ntfs_mapping_pairs_build().

Pass the start of the runlist instead, and hold the runlist lock for
reading while the mapping pairs are built from it.
ntfs_mapping_pairs_build() skips to the element containing the first
vcn by itself.

Fixes: 1e9ea7e04472 ("Revert "fs: Remove NTFS classic"")
Cc: stable@vger.kernel.org
Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
---
A forced lookup failure of the first $MFT data extent, on a volume
whose $MFT has several extents, gives the KASAN report before this
patch and nothing after it.

 fs/ntfs/mft.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs/mft.c b/fs/ntfs/mft.c
index 58676042444b6..5831ea7600315 100644
--- a/fs/ntfs/mft.c
+++ b/fs/ntfs/mft.c
@@ -2081,11 +2081,16 @@ static int ntfs_mft_data_extend_allocation_nolock(struct ntfs_volume *vol)
 	if (ctx) {
 		a = ctx->attr;
 		if (mp_rebuilt && !IS_ERR(ctx->mrec)) {
-			if (ntfs_mapping_pairs_build(vol, (u8 *)a + le16_to_cpu(
+			int err;
+
+			down_read(&mft_ni->runlist.lock);
+			err = ntfs_mapping_pairs_build(vol, (u8 *)a + le16_to_cpu(
 				a->data.non_resident.mapping_pairs_offset),
 				old_alen - le16_to_cpu(
 					a->data.non_resident.mapping_pairs_offset),
-				rl2, ll, -1, NULL, NULL, NULL)) {
+				mft_ni->runlist.rl, ll, -1, NULL, NULL, NULL);
+			up_read(&mft_ni->runlist.lock);
+			if (err) {
 				ntfs_error(vol->sb, "Failed to restore mapping pairs array.%s", es);
 				NVolSetErrors(vol);
 			}
-- 
2.55.0

