Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0079D31F986
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 04:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790915710; cv=none; b=GWbg+PcPGUREkmuqoNjeUZGo6CfMFcK4czXSykl1OULST+u0BcVZPgE/malnHhLOOti88xSEyQN6XMe/OkH341EK+TRwdyOfXggYedBYc/YKEHaedjUA2laazEDB9x+JHenKMbVn5FXH/gKCoB80efbiXzA/3fYJMK0cUObtIDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790915710; c=relaxed/simple;
	bh=FhlGtBDBqbooWe0RmMGrO55RxhWrm/DLJJot976bih0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FYNTyKwQkxo5lr2bpP6BugkgJH2894Z/BthaKL70IRTL6Ge/niF68JtsAubC0+zY33PZtG6wDV56Ed0eW7amUehICDIXAtweMNWknUOKS1UVt6nXTHrwVakZCvZi49DWgILvx/AsAszRSELkCq1P/k+NvPjRSby7ggcXkzfhshY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rg7DRtUW; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rg7DRtUW"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc797656e5eso3811545a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 21:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790915708; x=1791520508; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qGeFVvTCbU7hVv1m7NMiEfFFIPcZ+D554WZng02l/dY=;
        b=rg7DRtUW9/H+uj90hqy84hfoRJVV5x/RkYJfjpcMKW27d1KY94C3Pb1lzTRTHEXUOP
         BsAd+HdghLrwLrtdLs+Rq+vyeViPDpzRSIDXkM0KqyOsdf7GOnh90+/cO+9Bn6wEJOSd
         tA7FGInMoD8e918pccV9aVkSm5U8HBZn60SKqakgABRMOl1Z34bQW61aWobDIzdfFv3Z
         bckJUROSc2f1fb5iApaBQ2ik8TruWhATr3TVe+bOnADmt+PqgElYyJOwzx0kMQjAYH5K
         GrknzEhyl5FScQ+ZLBV3ZmF1TR2OD4ktlNKmrtuMZ39eH4Z37Ixwk/TrL0WVt2HJGOk3
         Erww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790915708; x=1791520508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qGeFVvTCbU7hVv1m7NMiEfFFIPcZ+D554WZng02l/dY=;
        b=CpOTR/9IfoyCyDijhlz4EU87hQbxOQ2yBEhh376vzYEpznGWC0J7ECNFBJpmWNK3w4
         y8ZysgpuB0DiWOv/vEzX5fV3+va23pD1ieJ4DMClH8RnMNdi+yRdfT+4ZROZJay9WaGl
         Mote87dUmayEqxlQVuL65Lh4arZMe8p4vFArCEG/TcjJQQu11Hs4ysdpr2ILNf2u/D9J
         oodZr0VN5wo/TFnD5rjKrWKGRtrxLPOs3OUtqvhKx6WQf/rOk3XbdYp/FHE2kAi8CPYW
         gka3eqU4Zv69i3zR9YpbKSRzywlEWZo8kbmFYi6OPzGiFc8ZNC1jEA8OveoYh07n0Yfg
         Oyug==
X-Forwarded-Encrypted: i=1; AKwUvBwfmQG4QfZvPtC8FUqw6rljxm4hWQKNpYxv0Oa8KCPA5TDtVd2dR8Z2kU5bX1bVP2bqZSOCfm2+1jR5+KM=@vger.kernel.org
X-Gm-Message-State: AFuF++mc+Rhvh4I0a7Wa3Iur/Ers9+nTWY3xePpNi9ZeEjq5x/8zHRZn
	WpD9qZBolSgsqqSquHCgmHMORqHjjlpZEUCBtE1N2Cko45orNMR6x7A0
X-Gm-Gg: AYBFou3KuTAbzXxeg1n0Ms9mxKZT9yw/7A5OTejMhr6gMcsrhJZsegL03R/ivzkkkvC
	YOKZoki98qOdx9LIMNHR+rPnjW7jJSchuReX8wRXS0bUw7C5CYlPiULm81M2p+EIpmj1P8Ypyl6
	uREOZ7h4HR2NBGTSAjl6BZpHlKh1SvgIDRUoss+T3Jxz6S//hi3rdTgoQFNykdes0TMNDRWNTP8
	ppGhDUxr+nZ2Rg3c8VsAeGJrVXKauh+z4EnE2YX/FigEcCbtGNtrJpuvZa2MpUdNJz2ik+rG90R
	eSPkoJVpAXyezhvtj6etxfPgYczT/SNWDGiMnL8nxe/9Ae7PaAb8ULzKlQXNAps6BswSxmY9fYW
	sURuuihxVJy1DXrKl278+tAkaSnTZnHb+pQy2+Q2FC/N0ys9EqVf5Gk0Om19cPOxrpHqR+bjfQm
	KTAT53OYBklb2eCB33TwOyGeGld4NAonf9RqevG0598KRxWIw6gJzISI4ZfcQiiE+SZf8CUnw8N
	3wg5CXZCfUKsjrs1756nfPpM/HtkTETJZTQflGuQBPZs/1xHAovL+AVBj+b3yPVx0a3+cmgsR3S
	t7xckaCfqO6peu0g2ZnpbyHImQyKIriLONi80ixvqHn165IDNM2EJmTW3R0=
X-Received: by 2002:a05:6a20:938b:b0:3dd:a196:53a8 with SMTP id adf61e73a8af0-3e0bd237011mr1615488637.74.1790915708114;
        Thu, 01 Oct 2026 21:35:08 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc9f7370db1sm436432a12.17.2026.10.01.21.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 21:35:06 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: Baolin Liu <liubaolin@kylinos.cn>,
	ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/3] ntfs: do not use a stale runlist pointer when undoing $MFT extension
Date: Fri,  2 Oct 2026 12:34:57 +0800
Message-ID: <20261002043459.1695429-2-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261002043459.1695429-1-matthias.goergens@gmail.com>
References: <20261002043459.1695429-1-matthias.goergens@gmail.com>
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
v3: unchanged, but now first, as it does not depend on the other two
patches and can be applied on its own.

A forced lookup failure of the first $MFT data extent, on a volume
whose $MFT has several extents, gives the KASAN report before this
patch and nothing after it.

 fs/ntfs/mft.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs/mft.c b/fs/ntfs/mft.c
index e01e367a588d..c2339acc6319 100644
--- a/fs/ntfs/mft.c
+++ b/fs/ntfs/mft.c
@@ -2043,11 +2043,16 @@ static int ntfs_mft_data_extend_allocation_nolock(struct ntfs_volume *vol)
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
2.56.0

