Received: from mail-pj2-f30.google.com (mail-pj2-f30.google.com [74.125.227.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A19374E62
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 03:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790739365; cv=none; b=KSlFsDuzd/O9+ch5Uu+5CqFqZZVYoGMVb4kAmZIP4XlpnyTcEPnQR1z9WcP57ID4LqnIVTcsiZjJ+OdH3DXGM4sDhKseZEH9ucBgubZKXt0yiXPff1jhT+Bf5JFBMFuBXMIPij+7+K3dPz93taPNQPC3V88CE/sxajUwNF9Y0g4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790739365; c=relaxed/simple;
	bh=mh9mhqu0ZQ4ExEhM/xNb5urFxToWZfUd4NS+sOdTViI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XS5QHXDm5WoHshC9PSdOyXVOqKMqqKO7Ws12GA8o9Emc7jt/7mJJZNS/3FGZlxieNN+7OotsCnf+/fq75B1fj+HaqYJgmX88C/LOVFuKKjEa0RZZoeoqDHKvpkHzesaO6EpGAdvDjZbgiHtG5L7ke7c5ShcwunxMj+QidaYDmk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bk+KLBp5; arc=none smtp.client-ip=74.125.227.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bk+KLBp5"
Received: by mail-pj2-f30.google.com with SMTP id 98e67ed59e1d1-3a4c6bfce73so178959a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 20:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790739363; x=1791344163; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5BQMjxmVq6FxLbCtymk4LuxsnfyC3FQKLzprKTNA/Kw=;
        b=Bk+KLBp5AWDSLsm+jyk75ffqslIK27fAhnc5+A4g9GnAWLMee3Yu6irAiLnMIe7quN
         5z+hCjzmYMuzT2pMR+BS4uRnG2SZBU1OweFP0FQv6mR+j8D0Jdx9aytETSP0fXz6XcVY
         5aoXvQaQB0QlRtHE9C0tRlKkpLZR2jBHCYH7GRPFYNfYWg7bpFe1jj5C9gmyWLJTSm0Q
         XS2LB7hFnRinzS49JvN4H/ovH57MVV9aeRz+4bkHl5XuPCxDorILj8h0zTFKjMwZKTz3
         4KomHGUSsJmSVSSu6SxNg6PbpGB9L9vjZxZ0msb/VhfxlKLyHxcVv5vlW8T3EpXcSIhh
         +Gdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790739363; x=1791344163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5BQMjxmVq6FxLbCtymk4LuxsnfyC3FQKLzprKTNA/Kw=;
        b=EUBru/8cDbjMqJapbWwL/dOL1MgigWvvt5uYR1NjN5yfpjfQ3st6PboVZE4XPLhwHe
         JC38xM/TDytu9jLBDtuCIIfhaeHcH2L//ieo29DHu7iF85ovY08eq/8aYgwozH8RdNLi
         JCiSOdAtdQc4Wg3o9qWNeS7AKU/Xz1tFtzuLPuzv4PJjVP6kRrIeqfXuj01lFohFckVD
         mnoEuty8RhsnZchm/xmgzd067Z2hqzt6jJs/QIIxJwrT6hztlcd5TRC1BB6qhPnAyfvh
         aS7dOqhz8CVuUsTkspBSH+KTRe1L1nHhbCLyfeA+NV1ASOpgMp0OtUvuA66T3fvoPm79
         l3JA==
X-Forwarded-Encrypted: i=1; AKwUvBy21ahB2FanQG7K2hz09g61OW+ezffulUqFMqmTb5fbr5v/K2sSqBYjquSa3trVbTfO4yGw5yAFiJ/EV04=@vger.kernel.org
X-Gm-Message-State: AFq9FYLBYyCjep1IhSFxxS415+EuSqX6nZVRqChVc+0UVPrRcSLdBHTN
	5YzQDSNJAcPI3W1ATrUB6vvhpyJGL82w7RvD41riuf/qQ3d7uBYm5hymtelK1FQayuY=
X-Gm-Gg: AYBFou1MyQXWCowuBQ2WKOJSLssi3Q1qR+Vw1UaGSxeJQsY2WcfBDQPE+g5m38Zww3I
	pEi7GSLTMNerGb75ntU5tOCg/MM3Fnc/NtEurV4md3oY8Yvh0mZtJpjgVxNOAAh+u2ggBWoIRzt
	NqMlViugu6KUUHDLnjcFT1Kf+DAHdn0TdLGgsOlTq+zhjH+xVv3/qgIksr6Hz/rlCJ6PAaPtIyj
	dIAo5lN53xN3KB+ZfV683huc31MteBGLS55BnQPC5U1sRzmwOiaPp1A4iJXT9N5kHjoB84Jy3Hj
	6dYwjWeuXYzoKll0m8FDdSFFh4QgHFgUxHXuUHy59iXQjnFfjuw9p2I/vp3VcafcqQAMhlFt/M2
	X2uVGR/l0BNWupJyt0IE1h//vqCq8ctRM6rjvVwOeQf0foTq9H0PbaTlemPYaKkaAjOqy0TUT7Y
	p7dF2mbx4v13SnWEpx7hQ4qXJFYeHFmCctQMXKkPTp1dYXbiUie77V4Au825SC4cRaUnnnDc9OM
	IISKOOVdavEBQgsXeM+D6Fme+hd6BeSUm0IE1IIsChNT+Se+b9cV1Txz+biTfeDFpRs4mfvsszy
	eDf/xozUbAAlWTNJM3yvpod0GtAU1+PMXOATUwqw6ZLbo6xzj5vIFise2EQ=
X-Received: by 2002:a17:90b:4fc6:b0:3a0:8133:69a4 with SMTP id 98e67ed59e1d1-3a4d175e86cmr120507a91.26.1790739363226;
        Tue, 29 Sep 2026 20:36:03 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4ce16abc2sm669108a91.9.2026.09.29.20.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 20:36:02 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] ntfs: do not use a stale runlist pointer when undoing $MFT extension
Date: Wed, 30 Sep 2026 11:35:56 +0800
Message-ID: <20260930033556.169300-3-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260930033556.169300-1-matthias.goergens@gmail.com>
References: <20260930033556.169300-1-matthias.goergens@gmail.com>
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
Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>
Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
---
v2: unchanged.

A forced lookup failure of the first $MFT data extent, on a volume
whose $MFT has several extents, gives the KASAN report before this
patch and nothing after it.

 fs/ntfs/mft.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs/mft.c b/fs/ntfs/mft.c
index 8edc65911aa2..f1b2c3b51fd4 100644
--- a/fs/ntfs/mft.c
+++ b/fs/ntfs/mft.c
@@ -2086,11 +2086,16 @@ static int ntfs_mft_data_extend_allocation_nolock(struct ntfs_volume *vol)
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

