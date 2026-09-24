Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C44B4052B5
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 06:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790231730; cv=none; b=lODyCKbsCN02TiLmld+Ck2wcVd6PuUN59EBhVt7ajzdQIP2schmIV2dhdgVOj3DHcnQZHRvJkaRYNeymzBpxuaQdY8SKtILqiRtQ/xTupolG5YfnBvOtd1HzO3DVkI1xoqt8bD2TowSbwv0xlW8o5cgIXXeJGyoFRoa7eBwGpsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790231730; c=relaxed/simple;
	bh=3AbSrUMjHcNwweoxrwa7fSRqHGF8abFFrjw6zZ2hhhE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F+pThKpHff3fUTE1wweBBn2poaNSUGRktVDZYqWQuLy8koDnxf9VYr5BhmEZ18LYY7WWG555Kunup043wcxpj94EwPgmSwaKLsdLiksM5n+Np5OSd30hg1P3O5PTz86NDmd7+0JyFdnM//GwqbjcpJVbE9nkWii4qD+4qjoVlA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=paYQdgj0; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="paYQdgj0"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-398beb616f5so707738a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 23:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790231728; x=1790836528; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F+Sroy11/gckPEHKGdrfw2wtlJa78votk3/kT41m3uM=;
        b=paYQdgj0OqOiVoA72matpo3XrEJfsv0Yqn/gK67ht3wNXyPpWZkmpmmolS7gNNucQx
         apUcDgLuL0iffLZCGUCXGMlgfc+pe+bTnivKU2UVsjPeErXeGB6qmIBfOD/ZeY0t8Y1L
         /TOS6liN4OMOF5ODGD7aKAKgJouGaSoxehG4UaHHo4RFOcJgr0mjMvMHwikmtoIXlNV3
         BjdnDS460dtiZti50VtPzH5spG74SBh4Bp09Pydl396tcjfJyEnY8QoruqGeU2JPoThG
         iIUE2jWpFH43joVaNrtrc70sEPCQks09fPiTDYg5W7QNl8CPSwzJaq9vF6V7v8u/5Chu
         zFgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790231728; x=1790836528;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F+Sroy11/gckPEHKGdrfw2wtlJa78votk3/kT41m3uM=;
        b=RmMsLiGr0g5EtACkjg+VyMx+5p6znzKk7vmjQWUtveowA5+DuKnCcHZHusA0kjGPZP
         HDLwt6mcfN6wAjsGfpkGvIwiCtXIq2nyLwAo85PjkHo+lDEYqXQyl+/iwDCox1SfCG6q
         lkPRMpJvheodA+1rNJR1sQBgozayeG9hbJ3DLhKdqlfVtj6BSzm9Vz8/bJqFqUvQVrEh
         eHXaNnjsYzXLQvz3RC07XCAT9JR8bTWWD2IdllELux1lrWA4bzC8lO1wkHdTNnVxVuRB
         ct3KZN37sDDgbI9Sjpt3Z/Qy1yorxE/auk4s94c7ksnHudTseNf2PpZeLvw+WgoGkEKI
         6gPQ==
X-Forwarded-Encrypted: i=1; AKwUvBwM1ZeIdjsinlXk6j15Cllp0QcC2RcFDCeVrlYiAF77aP4JrsJwNBybtU9iNQta5k1s25sXxahKV3fQ+h8=@vger.kernel.org
X-Gm-Message-State: AFuF++mwplxPwKUJMydAvCDkZ3vGnIK0Gk7z3iOjB3MnhBK6r//OAXFw
	Z5cpfkk3f6zcbDVjgh9/mMvhTAcHDw9LRxbzIjHHCnUvFxbVVu89qiXTVag8boC+
X-Gm-Gg: AYBFou35rvjSZMo4fHsCn6VV/LOTBIfCsHmFbimugscxFAJgCKN+gT/gv0DVdFhfEp4
	1Ex+DyUBAbVZscsXK1VQqJyIN0gj7cUVsuEkNqYddTThwPW+fiNL5SnaVZjgsCBwWd1Q6CeeUBo
	YVFhEgox7bW4L0MyhlWF64p4kf8eL1SgMRRotsQiFvDbrZwTf8hMEGZYwh3eb+sXPIlqgpH3+8X
	zM3q4HoGfVJmSu2/GPfdki35qbv9qn46orO3hR5unj8WlHkSJ4qsQ0LQN3j8MFConHx+iKl8dOm
	cWgxkkrjbT70vSQJZi1VX2VPnP0s/EFds3qMKQ2D8ok9NRM2VKT88L5lgcV4ZvVYKqz2LA1Ro/4
	FgbKVsPovAhSDZF9BzgGSrXPMHGgUKzXJ0cZyM2YUFMgkH77Dka3M8ZS5F1EITnm5aGyQqbf0o2
	/y7TjprNG0pubgh7933/el+Q8jmF7BQo79vIdoeaO85Iz4NjhzmT+/+g97z2qYF45ESW6+eDX93
	vvFDN0a9EBGcnX9RQnQiNCEn4RRYWPLNY0zyw/gfgRSYM26x+nyPBvI9eXnIP2VI/Mvkf6BA8tG
	6cEPQ67k7A==
X-Received: by 2002:a17:90a:d2ce:b0:3a0:797b:443e with SMTP id 98e67ed59e1d1-3a0986084f2mr943846a91.3.1790231727654;
        Wed, 23 Sep 2026 23:35:27 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (67.51.127.34.bc.googleusercontent.com. [34.127.51.67])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a096b8753csm3109897a91.0.2026.09.23.23.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 23:35:27 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: axboe@kernel.dk
Cc: io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hui Peng <benquike@gmail.com>
Subject: [PATCH v2 1/2] io_uring: only insert skip CQE for IORING_SETUP_CQE_MIXED
Date: Thu, 24 Sep 2026 06:35:24 +0000
Message-ID: <20260924063525.2500081-2-benquike@gmail.com>
X-Mailer: git-send-email 2.56.0.rc1.310.g51773c2048-goog
In-Reply-To: <20260924063525.2500081-1-benquike@gmail.com>
References: <20260919203516.2581409-1-benquike@gmail.com>
 <20260924063525.2500081-1-benquike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In io_cqe_cache_refill(), when cqe32 is set and off + 1 == ctx->cq_entries,
a dummy CQE with IORING_CQE_F_SKIP is written at the last slot of the CQ
ring and cached_cq_tail is incremented so that a 32-byte CQE in a mixed
ring (IORING_SETUP_CQE_MIXED) does not wrap across the end of the 16-byte
slot array.

However, on a pure IORING_SETUP_CQE32 ring (where every ring entry is
already 32 bytes wide and indexed by << 1), inserting a skip CQE and
incrementing cached_cq_tail writes IORING_CQE_F_SKIP into the middle of
rings->cqes and advances cached_cq_tail by an extra slot.

Restrict the skip CQE insertion in io_cqe_cache_refill() to rings with
IORING_SETUP_CQE_MIXED set.

Tested in QEMU against Linux 7.3.0-rc3 on a 4-entry pure
IORING_SETUP_CQE32 ring (where every entry is 32 bytes wide): on the
unfixed kernel, when posting a 32-byte CQE at off + 1 == 4,
io_cqe_cache_refill() wrote a bogus skip CQE at slot 3 and incremented
cached_cq_tail by an extra slot, corrupting the ring index sequence;
whereas with this fix applied, skip CQE insertion is skipped on pure
IORING_SETUP_CQE32 rings, preserving exact 32-byte alignment and sequence
order.

Fixes: e26dca67fde1 ("io_uring: add support for IORING_SETUP_CQE_MIXED")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
Changes in v2:
- Split out as patch 1/2 as requested by Jens Axboe.
- Added testing details in QEMU on pure IORING_SETUP_CQE32 rings.

 io_uring/io_uring.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
index 61053421d809..ae7c77158c58 100644
--- a/io_uring/io_uring.c
+++ b/io_uring/io_uring.c
@@ -733,7 +733,8 @@ bool io_cqe_cache_refill(struct io_ring_ctx *ctx, bool overflow, bool cqe32)
 	 * Post dummy CQE if a 32b CQE is needed and there's only room for a
 	 * 16b CQE before the ring wraps.
 	 */
-	if (cqe32 && off + 1 == ctx->cq_entries) {
+	if (cqe32 && (ctx->flags & IORING_SETUP_CQE_MIXED) &&
+	    off + 1 == ctx->cq_entries) {
 		if (!io_fill_nop_cqe(ctx, off))
 			return false;
 		off = 0;
-- 
2.55.0.1082.g2b9226bbc0-goog
