Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8793B5311
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 08:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789548454; cv=none; b=K4vGrxlmB0vYfB4GtUlvhkkoKxWOa9zxa1kxjRfh9bWRyyGgIJCFEFCWjWOdPbsOCWkFYim0IHtgDyeGdnaIkWN2viNWehNwB1a/GIdGWXamoyGX1coS4ri3Y2wBlxvpLl1Mwx0/H/RNVClCFXcB78bX8aCrLRth/6MZ8oGFQXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789548454; c=relaxed/simple;
	bh=jJcSGXRLoyAX6cOyjXBA3x0CsP9kGy7jE7wrjeXLFDE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HEm0r6srjVHRP+vBJEpT3/mJLLq7p089JZ4TfEOwd0CwyfksW2FGRJ27P7QRMoRoVAc04CkkzmqJ9Ni4ydmd8Vbb6VFCYPAZ5YtkcOouYfO4SUcabyesFpexxNl+6CGyqUhpd/UGxSZHvZMPAQeSMkJSp6A32t5Jpz9F1JkbEOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YQ4OytTh; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YQ4OytTh"
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-396ccb65437so467719a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 01:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789548452; x=1790153252; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nt3TtR6D8MLcyrkfRup1NcE0sH1AfJOXgLL4PDCV9cM=;
        b=YQ4OytThbXe3cc7YtSToK3dg3uHlTZGk2Zc+ZYwTfGWXKPRgQpMZu0foRlE9BbimA1
         irlyDRfEif9HrqWsFKwsbq3q0DGBkUm5nSsH+nvRASvHUlaW0nWpJJ4I+4yMz73aiGDX
         EyaE4kPyEb8noVyGxwGF72kH3eTK5zIGAWXaVumw5odS2WcI3eFFKslwcZpFillN4qG8
         gKwptg2Om9DFrWdxSPMcJvjtvq1RtzSHQly/SpgTp2NnxqPuU4TmNDghQAr3viUEiHI2
         9jJrWB/srFv0oHf+V7hDEfq4ijQxLyCSF45BnHHxoLSoIoykKyR1VabYdXa23VrKQl5e
         nGvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789548452; x=1790153252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Nt3TtR6D8MLcyrkfRup1NcE0sH1AfJOXgLL4PDCV9cM=;
        b=CfW9nBUifJsepPkre37eCmx5v9TxnjKURMwguZ1ehLmtLBgawctTgHj69U2mIGgX6t
         YrjW3r8oduWMZO1obSJORU48DiB+HD6Vd0RZzRxND0b+JI/lMpaEXvFvkA1UHXvmP1HK
         pKEYHraMJz+cdftDvtbY4Bltu65gV8N/ud9tWQHIiQFPHfv+y9WcGC+7KKaOBFfRltH2
         XKOC6LDd58tCMa7Zuwq5rvAmm2jFqE0WAG4asgItx+iNu44v2bvRgcPmOM9hjS/5xu+0
         5lKZl9c+XJ+R05JBU68JjNBOMN4vbM/MdNZ+10SwykhH0vX1CXQbhOLMq7teE2u3sdKe
         AoIg==
X-Forwarded-Encrypted: i=1; AKwUvBzvOCIgp6wG65hcCvco4TCqlyg2pjIUfPQRs26UyNAaG+bSoSgH2rpLDmRcuZMg9SamJTsT4ZPYhRIXWyY=@vger.kernel.org
X-Gm-Message-State: AFuF++kNh/ECuloFTid5GSP507DW3avsaM2lfrVoJcxLqDmHlJQaWzpJ
	4aEPMS0BcvRSJCUpBSoZgzptruuWbofH++mD1fO+fdL+MpjOtMjq330W
X-Gm-Gg: AYBFou1vZ4sGQ5s4fVxTmXs/9y7di9HCriziyIBCRUtuJQypb8Plc9J2YWGB6DrBHDN
	tIcw2fV5lee26E2VqCr5z1IRqBNKprnNRpxHV7h5o2QuIl/O5aXsqKRFIlxY6jMtBQMeCDbICR4
	4SdF6gb5pOf9P1rvFmrcBE7leR/kNIaJsJPaU7pmTiNPJBXQNNi/qA6U2OP8DKMA/pOrNnvn12u
	+6NynRNyTDU5qtXIZi7pQ/XmpeqS+ECnKhxlwYKSwpo/+L8QCKGjpL1SChAkfCBv1jOdQW71swz
	pc8zwULeqaI68oP5Z/KvRBF68RIgAJ9fKcEaf4RV3FyVe0Lh3p5ZZOhZei3JxQBbQ/7JIag0yvJ
	fvisMDoAR+fPGiDJz/O08fdNuabJ7nehS/sjhOl4Qb9yTgtrTDQYesn6RxNs4C57Bn6WfMurYSQ
	XeDKCi1PyoS6apam7as6qDuHDIG81qkX85IzheL9drhJe9c0g8+A4J8pQiT2Mwm/OmyY374bBUF
	Qexd9DWKg==
X-Received: by 2002:a17:90a:1c82:b0:39e:2065:5f60 with SMTP id 98e67ed59e1d1-39e20655f80mr2496696a91.18.1789548452224;
        Wed, 16 Sep 2026 01:47:32 -0700 (PDT)
Received: from ustb520lab-MS-7E07.. ([115.25.44.221])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1b6991c4sm3480351a91.6.2026.09.16.01.47.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 01:47:31 -0700 (PDT)
From: Jiaming Zhang <r772577952@gmail.com>
To: linux-ext4@vger.kernel.org,
	tytso@mit.edu
Cc: r772577952@gmail.com,
	adilger.kernel@dilger.ca,
	jack@suse.cz,
	libaokun@linux.alibaba.com,
	linux-kernel@vger.kernel.org,
	ojaswin@linux.ibm.com,
	ritesh.list@gmail.com,
	syzkaller@googlegroups.com,
	yi.zhang@huawei.com,
	stable@vger.kernel.org
Subject: [PATCH] ext4: clear in-inode xattr space before adding the first xattr
Date: Wed, 16 Sep 2026 16:47:23 +0800
Message-ID: <20260916084723.877552-1-r772577952@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CANypQFZzxTAH=4QRRDoqH6VAw1daAq88NDWiQKoM7QTOnP40sg@mail.gmail.com>
References: <CANypQFZzxTAH=4QRRDoqH6VAw1daAq88NDWiQKoM7QTOnP40sg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

An inode can hold extended attributes in the space that follows its extra
fields, whose size is given by i_extra_isize.  When ext4 loads an inode,
ext4_iget_extra_inode() validates that space only if it starts with the
xattr magic, and only then sets EXT4_STATE_XATTR.  Without the magic, the
space is treated as empty and is not checked.

ext4_xattr_ibody_set() passes the space to ext4_xattr_set_entry() whether
or not EXT4_STATE_XATTR is set.  ext4_xattr_set_entry() walks the entries
there to find min_offs, the lowest value offset.  That offset decides
whether the new value fits and where the value is copied:

	free = min_offs - ((void *)last - s->base) - sizeof(__u32);
	...
	void *val = s->base + min_offs - new_size;

A crafted image can leave non-zero bytes in that space without the magic
where ext4 looks for it, for example by shrinking i_extra_isize.  Those
bytes are parsed as entries, and an entry that claims an in-inode value at
offset 0 sets min_offs to 0.  Because free is a size_t, the subtraction
then wraps around to a huge value, and the free space check passes although
the value does not fit.  The value is copied new_size bytes before the
start of the space, over the inode's own fields and, for a large value, the
memory in front of the inode.

On a kernel without KASAN, the copy corrupts memory: it overwrites the
inode's own fields and, for a large value, also the memory in front of the
inode.  The bytes and their length are decided by the setxattr() caller.
Nothing is freed and reused here, so the use-after-free in the report only
reflects where the write happened to land.

Triggering this issue requires mounting a crafted image, which needs
CAP_SYS_ADMIN or automounting of removable media; after that, any
setxattr() on the file reaches this path.  The issue was found by fuzzing
and has not been seen in production; a reproducer is available in the
linked report.

Clear the space in ext4_xattr_ibody_set() before calling
ext4_xattr_set_entry() when EXT4_STATE_XATTR is not set, so that the walk
starts from the empty entry list.

Fixes: ac27a0ec112a ("[PATCH] ext4: initial copy of files from ext3")
Closes: https://lore.kernel.org/lkml/CANypQFZzxTAH=4QRRDoqH6VAw1daAq88NDWiQKoM7QTOnP40sg@mail.gmail.com/
Cc: stable@vger.kernel.org
Assisted-by: Claude Code:claude-opus-5
Signed-off-by: Jiaming Zhang <r772577952@gmail.com>
---
 fs/ext4/xattr.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/ext4/xattr.c b/fs/ext4/xattr.c
index 5c310747b965..2e5f39b710bd 100644
--- a/fs/ext4/xattr.c
+++ b/fs/ext4/xattr.c
@@ -2274,6 +2274,10 @@ int ext4_xattr_ibody_set(handle_t *handle, struct inode *inode,
 		if (IS_ERR(ea_inode))
 			return PTR_ERR(ea_inode);
 	}
+
+	if (!ext4_test_inode_state(inode, EXT4_STATE_XATTR))
+		memset(s->first, 0, s->end - (void *)s->first);
+
 	error = ext4_xattr_set_entry(i, s, handle, inode, ea_inode,
 				     false /* is_block */);
 	if (error) {
-- 
2.43.0

