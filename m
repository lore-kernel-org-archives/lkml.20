Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792573007;
	b=HQ9+V3qbAV5iOhqIFto8Sldqs2X0sEdwMGKp754xkaehjuSCbsfrTKYnGSwcQcBH4nct
	 z8CKAroy6nw5S7B1v6lWLzFONGA2aBp6o0j3CO/w3dNlERUYCRSld0SJSHBJxe1oC843e
	 Y0okWQ/4Qtq0nuswx4HBu1PHkakbQf2n1SuNqgiD60xtSjKW78BjXTy/MWt7mV28PbLEZ
	 gVUxW6ALDYT0Pe9Sj+hMpnffj56LS4NsyE/gBFMXoELq5C2tho6cdUIY+7Pv57V6B6y89
	 +PmKaIY4t6tDT5ia3Hy3MQmDuNTRicGcLXKgwLrxMf9VHnhlvZxUnz08L2a0V/9EA2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792573007;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=EbKXyleNFY9/8wO9jUa8etPnmUJItO82wpWtCoS+TCw=;
	b=SrZSNQGbg84icE44MQHxRl/nJKU1YJDqBsfR+6C+xayQJAtpfVZDRSWVMnAl8mNE7Grw
	 qOI7EbBjDSa4A6BgaQ2rwD6gwgUgsxyEp7KlGMFl6qpudNYhF4zfdCKW4h7jgwPmOShPj
	 X9EtXUAW41HKEDaRfelaWYEqPwpGKUg0Ev+HB4yuihK74u2EWAPScGsBQnukcPC3TonKq
	 0pXB6WKTpa2GrqT4qGtiQW6meiUZJODRu6ZRMlYtUbKEniGLMBW+CVe/KKugUWjVcCBU6
	 Lz+PIIiqDgJWKBqKqzmATP6fVwhPfVXJTgd15a2oDeg1z8B6pNJbSyf0cfJvT32pqXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fvWzPODK;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95206606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:56:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95206606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fvWzPODK
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e8b20a899fso2573525ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 01:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792573006; x=1793177806; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EbKXyleNFY9/8wO9jUa8etPnmUJItO82wpWtCoS+TCw=;
        b=fvWzPODKAaR1ZepcYCr4Kqnj8cfIodJG78eH5l7FhHOvNA79KP9MkM8zHh09kywfF1
         iP+u0Bdv4FkQGSHItaZieRNGU0q3Y1ZhcuBLmD6bCWYr4YWkzK0eBEZ1C1y8XVWUjO+P
         fz+oQDwmE9NVKZQoz0R0/nZ3yNf2Jmd2b/MzPO29SpseRLye1/a1ooORC7eKuZJgzJtX
         zvBeAhNlngPrLndmGii9iNklOd167rGKjHSdjFob0H5VxpdZJtsx4K0941wZnXWBnBSL
         CXcfopI7YRtqE23T+wETOfXxU3FLGgt2sqinvPb5CXJ8fZhFWcIhSS1humAN9+Dpd/VP
         qMGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792573006; x=1793177806;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EbKXyleNFY9/8wO9jUa8etPnmUJItO82wpWtCoS+TCw=;
        b=lD/7QcoAQRg4p2fzQo1MSwFRIvWEpYwf6CTGQYU4WDxj1OxB1X0LevHacaFs+uURGu
         FmoPZdsWPevOSQYKD6/Ek0CrOG82olK78+PM1mMDFQ5GRwYWOnQ1dMpi5BrdxC/0iO8v
         qJXzwFhEf0fW9GE6gXIOqg8zHtm037da1jECnsRxFPclu2D6Yr2Qb1IX4P8Hqjb2SFD7
         GxbyC5xPkSdjayH1RwiI/Uuj1AFVgWlqC5XNiYydvP0ca3JziNLkiIRr12mtQ2fffiLc
         SvIVHs2re7KykTtJJlGuZ06G7m+E+jl1/XHpgN1U4/D/dmqT7iBSApMNSQ5Q05aZ0C6c
         9lGg==
X-Forwarded-Encrypted: i=1; AKwUvBzQiFM+7OGqIJjaLDxFL0/Tn15h4xQ6S4eTq5QAFD+amHuOtDaR/bvS7LK1xiRosIvBNW0sn6ZZ8C3PQBo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJgjF8i/29bHEJ6iQjv4szXhDnd3buhzjnDzuSL1sNOBftV2x4D
	fKQw/2vuFaUrMrjZHrJTGJZdLhho/zg7NqQ7pwoilWcPX8aiSZ+TMniQ
X-Gm-Gg: AYBFou3UDocRtz/RZkfhqxXDdyqFkFy+BYMf0oFkbzbReU0XWVs7seiAoHQCQDF0Mdd
	J1AAyCUX2B2DZKygxDPhHW0BBUJAM18lYrgRHJN+VlvYuzhRlPtO0/BBlPKXjCJRlqqQO5uAvqi
	vYK78S9iWiI9JhjMmj6c6UH2AnJ0MXN+Sl91e3rXMtBmp8Brhz3H/iJMtbbYsD3s/Jyfa0NujxH
	nB2/B7QdX9SZZMDgwxfBdcv0zGx6z9rdk9oIO63Ibo8OtWyczJBd002EthOmVN8Y1Ks16GyhvUq
	/zyFaXDHNLHzyZT6Pv8/crmojBpQFhwWme/va1R7o6quolZ4Aqc8FJp99YYiYxSD5e8egBH7A3N
	mdsGjsD70O8HdgLQqbTo4lTK3W9dJXcDuoRCfOBsLbqIjERM82pK1Bij5fYbZuERXN+rLQqgY5z
	1/oeL16wJu8Ju4Cr87dO4orxGMy5DZ5+Q03NE0CI5UYpfFN5kRFVcrw3nEo0Dv2Q5kGLoiBUUk0
	5x/yKmp92Sh3lFbO0xFh21VFXnQCFsmXV3+ZVAHXbQ7s8hjdbfp08pjrG1V5Iu2eXo=
X-Received: by 2002:a17:902:ce01:b0:2e6:1a6c:abcd with SMTP id d9443c01a7336-2ea4391f99dmr10699345ad.3.1792573005536;
        Wed, 21 Oct 2026 01:56:45 -0700 (PDT)
Received: from ustb520lab-MS-7E07.. ([115.25.44.221])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b411067sm8420785ad.23.2026.10.21.01.56.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 01:56:44 -0700 (PDT)
From: Jiaming Zhang <r772577952@gmail.com>
To: jack@suse.cz,
	linux-ext4@vger.kernel.org,
	tytso@mit.edu,
	adilger.kernel@dilger.ca
Cc: libaokun@linux.alibaba.com,
	linux-kernel@vger.kernel.org,
	ojaswin@linux.ibm.com,
	r772577952@gmail.com,
	ritesh.list@gmail.com,
	stable@vger.kernel.org,
	yi.zhang@huawei.com
Subject: [PATCH v2] ext4: clear in-inode xattr space before adding the first xattr
Date: Wed, 21 Oct 2026 16:56:35 +0800
Message-ID: <20261021085635.3633692-1-r772577952@gmail.com>
X-Mailer: git-send-email 2.43.0
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

When EXT4_STATE_XATTR is not set, zero the first 32 bits of the space in
ext4_xattr_ibody_set() before calling ext4_xattr_set_entry().  These are
the bits IS_LAST_ENTRY() reads, so the space is treated as empty and the
walk stops before reading any stale entry.

Fixes: ac27a0ec112a ("[PATCH] ext4: initial copy of files from ext3")
Closes: https://lore.kernel.org/lkml/CANypQFZzxTAH=4QRRDoqH6VAw1daAq88NDWiQKoM7QTOnP40sg@mail.gmail.com/
Cc: stable@vger.kernel.org
Assisted-by: Claude Code:claude-opus-5-5
Signed-off-by: Jiaming Zhang <r772577952@gmail.com>
---
Changes in v2:
- Zero only the first 32 bits space instead of the whole space.
- Add a comment above the check.
- v1: https://lore.kernel.org/lkml/20260916084723.877552-1-r772577952@gmail.com/

 fs/ext4/xattr.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/fs/ext4/xattr.c b/fs/ext4/xattr.c
index 5c310747b965..8e1fd26329d3 100644
--- a/fs/ext4/xattr.c
+++ b/fs/ext4/xattr.c
@@ -2274,6 +2274,14 @@ int ext4_xattr_ibody_set(handle_t *handle, struct inode *inode,
 		if (IS_ERR(ea_inode))
 			return PTR_ERR(ea_inode);
 	}
+
+	/*
+	 * Make sure xattr space is properly initialized so that
+	 * IS_LAST_ENTRY() returns true for its first entry
+	 */
+	if (!ext4_test_inode_state(inode, EXT4_STATE_XATTR))
+		*(__u32 *)s->first = 0;
+
 	error = ext4_xattr_set_entry(i, s, handle, inode, ea_inode,
 				     false /* is_block */);
 	if (error) {
-- 
2.43.0

