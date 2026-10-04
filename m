Received: from mail-pz2-f36.google.com (mail-pz2-f36.google.com [74.125.228.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FCB53F1045
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 09:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791107783; cv=none; b=TYAQrfx4mW+DDet6it6kvq5th457nJxRxcjW5zAL1iOMcDe2wOzqy//FgxbHymXPQix52nzm3OJkoc2mnO96UHqvIruQJo4W1/PJusTONrbm39Q+IDOmCqLfY49zIMMA6eC3gzm/VyWl2Dw5E3mfWDVdsCgcypWcDiy7dgSuzfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791107783; c=relaxed/simple;
	bh=Xkp8Ip3A8seD3miBA/ZSjvmtqN7r7RiaLWsa9arQrP4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fgzj2unSHU4a4LkEN+0DNpA89Z5BRTS1F6zqdvM6yQvigB1EN3jV4dEnmZnq24A/q76b5tA1kAyrzN76JWmOQk8QX5q8o0ax/WizGSlYkNP5QkR31cIzgruUfx7YqXeuxQJtQZk3uBiC4VZl7SdpQD/waB2XL8dENnJUNlrL3h0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R0DfNlQS; arc=none smtp.client-ip=74.125.228.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R0DfNlQS"
Received: by mail-pz2-f36.google.com with SMTP id d2e1a72fcca58-88a0f29ce98so292588b3a.3
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 02:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791107782; x=1791712582; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sv3Xutg7k+QurrnMBqbS8TX2eZEovTI1Y5eV74+MZfw=;
        b=R0DfNlQSzkwjJg4UjxwRVcHfQ7CvsmiOa1uRIksI8ToPNMaph/EiM7trbAyii0Cryz
         SNy/OCbk4e9T7GmJWGqNjHjZgBb4Hg8kcAcprSkHFG8ePkD/xz2oY+KO7aH367Lq+i34
         HEQ8DmM5fnPYmdpPTRgdNcu/pPTXY/vyeMv/jK8/azoEs4Jo6KWODFTVpsG0QABuRLoS
         NAzUHqmXIEkcn9ha5bgGKZ2sNCYeCRUhGboU+taj5sE2Hbd6HyZp0B9ZspAf6uhVQ2Nq
         LvdcVECq9tW7LUtjSUE8tn7WadkJYqlY+0IGh1waS9DOXc+y6KnZuQTDCIeorRGAz3e0
         Zouw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791107782; x=1791712582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sv3Xutg7k+QurrnMBqbS8TX2eZEovTI1Y5eV74+MZfw=;
        b=S3y0yYjmeU3YadlI3e0vq/X+cPKf5mSqI2MbCHAdt7Ory3+4ArX5HRbeLis6k5LGHO
         4UrPVip0fzdgk7uf+qCFuuidU//s3dW0NyZXlF2IaxfUupxgW2WLCsmpGMptUCKpVZvy
         OLBLV6m5SuQ530dK+zraXtzh0cp9wVqJAaGqPFmL+xK0G3W3oAb2L5yewRDht+gLzGR6
         nRU7mmYBYXB7Adv0cARjARLCXtEqH8z3uU+WTwhQ35yeMGgfbd+N7/Wc5KwXjtj87LMh
         gGDUzgLAmNe5abRyXpQU8ezJ1sKn/Vcklnfb9P7MT22TbDalutMwkOX/MSQk5FxvjJkH
         BF3Q==
X-Forwarded-Encrypted: i=1; AKwUvBy9nMqKcq5170UfnRyfj7EtmV7L23Tm6pqoqHNopKbgcqyyNoZgsDBt3scBiBS2Hjy46x14BnUB8God1Oc=@vger.kernel.org
X-Gm-Message-State: AFuF++l4f7WZ6/dDCXIJYJxy9JhbRfAWLRYZcOlAxlpHxg07EMP1kZxj
	hbbODm1KfAbwwmu1dydn400n/sybG0FpduHi1nZ3TReuam65+z5oDlbmMtbd6R7+tWNQSQ==
X-Gm-Gg: AYBFou0/usmJQb3gnlgZDOS43fTBSG/zEPtTHIqL5mpmTXnypNc4E0n/WXVDR+64NG8
	95PfQQDd6pre7W7AMW3SS0W3I9R50qtoDWkw8fzpXiYMeoXXyuiVnyc2pN6ZO6TZVCblAS9UDJ8
	l4PCMQ3a03Lm0PajUbN8X2eSgdB4Ewv9mDmGv4YfrOLDbP00jHZHOQ4wmjPK74yx2sWhQXrr5k4
	IcHH9axhRjX1Cvpe+Q3vo6ftaZXrz5ydbmt2rLFvG8gdUwbAuOaPBYPE4TkrOn/2bHbHwbvZYz3
	ErmpfFF9LgaMH5EgToPGdEH+3oJE+nN3F/uMBGVUgsJCsW2QhPF/geQag2XcmNmm1vue2DOxWSh
	43xY7Feg0RPw/O8hs884sVknhjsBJu/hT9ggubmPjmv2Vvh56wksiSMxDJ+wLBjFK4LYeexKqgh
	dd4DPI504AmGitfCF3GHra9tJvzFCxqNqQ4KOT11FDiez3orHOdb0WVACxvrcbwGKCUzdvvoKE/
	QLK+uk98cbTSbxNMTG4FXDZCesCvAtzIBQR+f5RTBBAHcRCtoXy/1/P2iQGwfc2yFa2ShakpDmF
	Qibln/r3A9yPDaN/hxtwVaBP0/lVllNr09LC26YWzn/iPKHaHi16cfUYPsk=
X-Received: by 2002:a05:6a21:e10a:b0:3d3:adbf:7781 with SMTP id adf61e73a8af0-3e0bd17ecf2mr7842316637.22.1791107781655;
        Sun, 04 Oct 2026 02:56:21 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0c3a39f6sm2418175b3a.28.2026.10.04.02.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 02:56:19 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: Baolin Liu <liubaolin12138@163.com>,
	ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/4] ntfs: do not refuse fallocate() when the MFT zone is empty
Date: Sun,  4 Oct 2026 17:56:07 +0800
Message-ID: <abb9876394e7ef057b327270682e4ea864ca8d1b.1791107674.git.matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1791107674.git.matthias.goergens@gmail.com>
References: <cover.1791107674.git.matthias.goergens@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ntfs_fallocate() fails with -ENOSPC whenever the MFT zone has shrunk to
nothing.  The cluster allocator gives the MFT zone up when it cannot
find free clusters elsewhere, and nothing restores it before the next
mount, so after one such failure every fallocate() on the volume fails
with ENOSPC, punching holes included, however much space is freed.  The
allocator failure fixed by the previous patch was enough to get there:
afterwards a one-cluster fallocate() failed with ENOSPC while 123 MiB of
the 128 MiB volume were free.

write() and truncate() do not look at the MFT zone, and
ntfs_allocate_range() already fails with -ENOSPC when too few clusters
are free.  Remove the check.

Fixes: 9c87959601e8 ("ntfs: update file operations")
Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>
Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>
---
 fs/ntfs/file.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/fs/ntfs/file.c b/fs/ntfs/file.c
index 3ec82715a588..762045d26296 100644
--- a/fs/ntfs/file.c
+++ b/fs/ntfs/file.c
@@ -1163,9 +1163,6 @@ static long ntfs_fallocate(struct file *file, int mode, loff_t offset, loff_t le
 	if (!NVolFreeClusterKnown(vol))
 		wait_event(vol->free_waitq, NVolFreeClusterKnown(vol));
 
-	if ((ni->vol->mft_zone_end - ni->vol->mft_zone_start) == 0)
-		return -ENOSPC;
-
 	if (NInoNonResident(ni) && !NInoFullyMapped(ni)) {
 		down_write(&ni->runlist.lock);
 		err = ntfs_attr_map_whole_runlist(ni);
-- 
2.56.0

