Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A60533CEBA6
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 18:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790621956; cv=pass; b=o0EmOOMgy7622bDmOA8bXiAyMdiwwrseElO4aEnAFKV/u/RFCVC6BFjsMY7hXk05MBISrZBzjXwoyNhjN9lAtljlJvNiHBKgVqlkAXwiI9ThsgdZP6IJuRiPiRgWqLm7/Yo+fn8twPlZcBCuuDgQzqdm4FBlDA+o98f/03Re0g4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790621956; c=relaxed/simple;
	bh=ZckUBzuxfDct7Xtg49y5TXXNnoeTTdLGKQnVGpqLnmQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=BvQslehMV7lU6MUibsjFG7iI3qLnRsyuQUMy73Wc2rKc6rVIQ8XkmTlOBhUB6uwFtg2ITqYuBAnrGpZgeeAGRd8YYDXhJzkFj2EillFuNdAN5vOv6S5XZ/zgSKT/hnf6xlrke816GMnaDvC/VVYgL2QaF4+x8UOsOPWEufWlXtk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h3SffaIu; arc=pass smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h3SffaIu"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f1e419so1179956e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 11:59:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790621950; cv=none;
        d=google.com; s=arc-20260327;
        b=pOqCGCRKL6WFkU1bLdEj7A3t2NoxS22m1o8t1OtwbfcqBZkqNLLWU/y3gkcFRZP5Fy
         /rrX5GSRRlbm6zyEbb38wHO6kQl03q7cYCfyLlu85lusZg+araX1A2uYwFLeulCHioOx
         DXRzySeXKPwfG/Ej70+ug+kp3PfbVY6H06mr81DuZw91bxSaSBM6Sm2WWvym62CIX/8L
         QovSahpsIAbD4ow7ze43LHyOaK/h4zNq28T8QuV0PdeM7d1fiduySZlROwnHcfbZSdXm
         AfCmZSeGsidoCgSdntBP/HesqMYSW1535ZzGIkeZ7Ow2a8PrH63lCwjw60JfR8LPWvt6
         fdfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:sender:mime-version
         :dkim-signature;
        bh=Pu/ssd8DugN/kj01xDDdGW2HkDyQcHTA/d4qIgsVPkw=;
        fh=BN7pgEG+VSu+TQ0CXe13ckSrv82vYbbLhex025K4cDU=;
        b=cwlSZHfxzqHN8PtcbmHPfV5ohOIHyrIqRqlgI9Fq0g48IYqRQ8c0vXzAxpeHb8luvE
         NV7MXZvGvzRM0fQKH5AWpF7YpH6l4BmY2YaUxx4sdR+F4Sw2W5Q0WNT9q+76csxKhicV
         WyUPp/QVOjaP0RzhGbq7uYwswMOi5UHOjfCi6Z+wrzjVae9pRSXVIQK1lGgX46pgetSg
         YtvI94hlIvLs/jdTnBrCtSwWG1/OaRT+1Q3AIVm8O6+R6KKVlPPQPJz7mIBkHnt2lTSa
         kVPtPE6OhZgn3JE8jGNAs4PAahVAtc62YCpCwldZ0w9mTaimlM1bhrxwHdZ2yWaAV1Bq
         0rVA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790621950; x=1791226750; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:sender:mime-version
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pu/ssd8DugN/kj01xDDdGW2HkDyQcHTA/d4qIgsVPkw=;
        b=h3SffaIuXFZFlrN3ssHMWUrw9m8vbhLctkQmnh/rvdVVzzlksx4S5ogP1wK1h5TGAI
         wgUF7yo0fNaktuyNZJoMC5eSIIc4tibqykGmSyVkpCCmpVbQZ173yEv6wm4D/oZjZfMa
         HUgJkW25BBx/4ngNI5m39GxRf7pVm5kHjXAqSsx33ReLW1N4uKQK+qESkc7n/62N6pxZ
         iDq8jbO7ge5JdBa1+TCocUuJzCYbOqF5oFo7g3LUp1Uu87AonWLkTyO39Hg7C0A+uSe8
         fv8S5qeTXQlSYWymNgOix5a2Fr+3Oj6wp1fnhd2CmeBa/jTbmIMltZqWrGYpyNbo70wa
         qq9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790621950; x=1791226750;
        h=content-type:cc:to:subject:message-id:date:from:sender:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Pu/ssd8DugN/kj01xDDdGW2HkDyQcHTA/d4qIgsVPkw=;
        b=OFhMqHSKIeLzuFCha34zLFzGLR/5tP0XMSEEg0fJI9tNDMPSqt1ySwt/MdmBSts7Sf
         ZypZTQHasAODisRJvug5cibH1j7E2uT8UABtzEcNFU5ixJfOCGMJBW7TeKAvKigo4IV/
         ICp2qm0kWIk6AhnQJHDR2HQSvh/WwDj/B9R92JgIwIFU6mydu434dYyQ3mrLtCBjYKhm
         ITSNEZMkuUFwrNS54CQ+ItD3fHnmRtzIsVtenUGzH1fK0/eAk+J7WNI85UAMyLDhi6IC
         jUfXMvx+3atdE9vlPbLJKjU0qgO+TWk7wCfZ2oeynVkRz1EQgH0AzZdMEdl77vD7lb1z
         xucA==
X-Forwarded-Encrypted: i=1; AKwUvBy4UI2dy8oa1z9NcN06pZrVqK6GxFR8JIJ79tH+pHmbXV9s3GxoTqSJTFUcNnNSBVl9zeL9ZWrVgs+xVN8=@vger.kernel.org
X-Gm-Message-State: AFq9FYI+8x7oTWRyq4yynhS0O2WZnE4Bw4nq/sZebzg12+NVexLFQ4qv
	1asiOUZnnWexhiXZ4E7mR23ZhwqQpRkXQ9aeZgieJgRNyVEGfrmzk2On0QoaMhy6wzTTrTE7XNn
	mMo+TRnOWPBjSwwQ5kMhdIFmRyXIBJ1g=
X-Gm-Gg: AYBFou0yWfgQvU/I5El8yl9u3GEleC3HpsB6wiClfnXFJd5f3QusAtfrdFHYIlQf3Zx
	qe9aY3UkT68f7hL4CP6WDk0OIIKTVlUH2YnYwUmTlEABIrUkXPuFgCuu2kmrFpRoNawzPvikLxO
	m+6zGWBQ0z7NX2Yjq59vcq89ZKzgQcbWUevqcI7z4J1Uz0QgE4tKnhqzqM8hzpSHisOQFRGs2Ea
	3YsKJiFOVKxlBMjLW+DXGtS22wQYRddwDHCYyc/4lVot4Gn5YR6Pi9XLGOds1hqR6ETOkFXzA/V
	O7FUCobXO65GN8qdR/Fycz0CZ4gRY9jFwdErfybFL6EdAw4acHzRpUrP2ecnKkXAjyC4QJf/vs4
	FXBmJUJlL/PY1
X-Received: by 2002:a05:6512:134c:b0:5b6:10bc:b864 with SMTP id
 2adb3069b0e04-5ba2e6289cemr39499e87.18.1790621950325; Mon, 28 Sep 2026
 11:59:10 -0700 (PDT)
Received: from 254448290189 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 28 Sep 2026 11:59:09 -0700
Received: from 254448290189 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 28 Sep 2026 11:59:09 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Sender: Vamsi Krishna Kattamuri <kattamurivamsikrishna17@gmail.com>
From: Vamsi Krishna Kattamuri <kattamurivamsikrishna17@gmail.com>
Date: Mon, 28 Sep 2026 11:59:09 -0700
X-Google-Sender-Auth: ZwCvM-sC4hIxe8N8dJb-AWb4nUQ
X-Gm-Features: AclHuK-2bu843UqJ0hkn0uiGUfhhfw492ZeGe05OpMyUNCkLbPWCoP_36qHDt24
Message-ID: <CAANnmVBmovjCL0Ky4F3ay8pnmm4jp0+HyXC9QYyHo_1Bi1FucQ@mail.gmail.com>
Subject: [PATCH] ufs: verify cylinder summary size against cylinder group count
To: linux-fsdevel@vger.kernel.org
Cc: brauner@kernel.org, marco.crivellari@suse.com, ali@iusegentoo.com, 
	kees@kernel.org, jack@suse.cz, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The cylinder summary buffer is allocated with the on-disc fs_cssize
value in ufs_read_cylinder_structures(), but it is indexed through
fs_cs(i), which expands to s_csp[i], with the independent on-disc
cylinder group count uspi->s_ncg as the only upper bound - see for
example ufs_new_inode(), ufs_free_inode() and the block allocation
paths.

Nothing requires cssize to be large enough to hold ncg entries of
struct ufs_csum, so on a crafted filesystem image where cssize is
small and ncg is large, every fs_cs() access is an out-of-bounds
access: a read when scanning for free inodes, and a 32-bit
increment or decrement past the end of the kmalloc()ed buffer when
an inode or block is allocated or freed.

Since the summary arrays are only set up for writable mounts,
triggering the out-of-bounds writes requires nothing more than
mounting a crafted image read-write and then creating or deleting
a file.

Validate at mount time that cssize covers all ncg cylinder group
summary entries, and reject the image otherwise.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Vamsi Krishna Kattamuri <kattamurivamsikrishna17@gmail.com>
---
 fs/ufs/super.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/fs/ufs/super.c b/fs/ufs/super.c
index 3569ac92b065..2052d5225d03 100644
--- a/fs/ufs/super.c
+++ b/fs/ufs/super.c
@@ -1139,6 +1139,11 @@ static int ufs_fill_super(struct super_block
*sb, struct fs_context *fc)
 		uspi->s_csaddr = fs32_to_cpu(sb, usb1->fs_csaddr);

 	uspi->s_cssize = fs32_to_cpu(sb, usb1->fs_cssize);
+	if (uspi->s_cssize < (u64)uspi->s_ncg * sizeof(struct ufs_csum)) {
+		pr_err("%s(): cylinder summary size %u is too small for %u cylinder
groups\n",
+		       __func__, uspi->s_cssize, uspi->s_ncg);
+		goto failed;
+	}
 	uspi->s_cgsize = fs32_to_cpu(sb, usb1->fs_cgsize);
 	uspi->s_ntrak = fs32_to_cpu(sb, usb1->fs_ntrak);
 	uspi->s_nsect = fs32_to_cpu(sb, usb1->fs_nsect);
-- 
2.47.3
