Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794807879;
	b=PEA6w29tmV3sM9CH92m1ELp5i9/KMunPwYfh0Fd+QSircooeQx4DQovexonZdrZuefMb
	 ANHOUpBlmCHbxnZ0AOK0EUQ3lNmfSGxUrfNWy85sDcdPDVgiQFOLY6ymPrXEtz1PHoQLj
	 RbX3VJL+uBj4a+eLAte7xY3wbs45YgSz8o8c7Hik1PXy7vneT13DajUouqUXkUHSUrtzq
	 zRd/i8KRtmP1+h60j0JljfDdjUYObK07yRwjfVLCBcUSdJZNCTFDWDYv958rJZjSirgcC
	 xVv4ZsBKH8BryHHYXwppTEvqQx5QcD6jEs/lF7f0nAF+wnyzmMjKezsG+Xw4vLxuYZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794807879;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=6juYiLwJPfjMMa1PV9mnBM+MXTPlKv5dj+C2Lcf3/rs=;
	b=ILVDkHcyP9iew9nGHy+tSmUc5/NTdnI3wmF14Fh5Ys5zlfLZMiQJPbs3MdIdB8gzAbGT
	 wtbm+fl5Q/gSDZtZiSh8xlWmtB1IUl/v+v/Wr5Pd7ldfjiiVzguykgOdnSsIJdXw7k31b
	 2tA12xR7MkwDzbpWG8D8b2OxgsuplCYVRzBfCQzVPmxOoC7oOUUfOG6JmOfHc644E2dVR
	 4HyrBFmCC11v+J4IIuiSF536ckIotLkf9B7wxX6YwCQjUNACOsbYt51tBs6Tjg5e9dR+x
	 flZsNUQlD+nN/GpIwznl07ZLAUuCAvKXtLJvt9Rt2KpEn/B/wDcWg+wCeJMUKPJYOSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KbcyvYrO;
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDDC5606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 05:44:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDDC5606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KbcyvYrO
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8b6a88e4341so1127657b3a.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 21:44:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794807878; x=1795412678; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6juYiLwJPfjMMa1PV9mnBM+MXTPlKv5dj+C2Lcf3/rs=;
        b=KbcyvYrOCF+jA/uX8xFI7qHAQ8AL6G1YvRWtN85kZR2PmGYHc7TC+9VQ3cPwdGWmqG
         H5j7xrNlK1JTWUj0vR7kLwPYPKw9X81xik+JOqeQ8WUFGlSTOQIRIpsQON7TTO3FdJ8G
         R8QsafxUs7UHjig0wcEilZjBOPXx9tl7royOiKw7YIV/cWdmmkNjgZ8yTcTGEFcj04qW
         m916fnhskK0NTAL0aAtfkttXYrnGzGg78TjjXXoBlGvsK6oGuFMbQErcPc+h0ui/vw0Z
         LsrJ1bwLNgL0RMknkL+OAfflZQH9zBLrmfKz8z34OTZqjW8yWVcyNcxgtgrBrRp2K8P+
         6blw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794807878; x=1795412678;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6juYiLwJPfjMMa1PV9mnBM+MXTPlKv5dj+C2Lcf3/rs=;
        b=v90C9PtRc6d1uioXO1muxWsT4mmGJTI/RcTknNCtoS3owLdKvILjc16RjTkR54ZLhF
         5oMD07zn5XIWd/jKoh4/H/4trz5ozpyGXsZLkIN+dt+QNIfYIpmS8GoXQ57RZ0jYZEmp
         UO1o+dACf+ScQzVf1UdzAIjlCY6ml36N7RpWADT8r7b757UrIJYDp02DZno1vjt1rY7z
         ABg1y7WqZM9Wednrgmw6KAKyjjADZnnZ8NshtPG6J7kcKS48QNhcgAWRbiMkXXX5FaOv
         RYXkix78NQ8OSYKAySpqQvodXcXOEHUjEmMqnA+Ux6vRhKvDt3M03a4A+kt7IXsVxGFM
         yVmQ==
X-Forwarded-Encrypted: i=1; AL+hErGz0eJlUsgpMGGkU544r51MtcrjyZtqlE/WNj+wuggkLfSyhE+b3ZPywG4UXlInIwjNRnDe2zswonl4GbI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+42JKfvLDQKFjJTDD5ah1JtOgRExrkhDzHp26R8mUazeSyJMiw
	37NFlGoz6Nn/KxSBAoVpMDGZxt7TSbRPRjENyNIbjhRufxtXpOQ84pgX
X-Gm-Gg: AYBFou1Rv12yU+2NInvCJRB3im9wyn+f/jIdYLNlVOSAmn1bNo1j5icUSV7CYp61JuX
	Fca+eB4ue1PolSVWJnhnWvc3vTYC1byBIytZLUN+b+x4O2Wes2fRTizR6aX5RNgYnXsq2z1aSfc
	CyAY1qjrFeaoUBfg/2sq/C0SEMxhvUWi9DhuAC2YgxSMsmy85Elmi5LGBIj514WJhgWqodJuQ7k
	CGDMVREHEbIeo+jVw6oQfvCkCjXB+UTzq4C8ETkf00d5x9tFnUjjZpSpd4lZxymJWTlgH1Nebhw
	tbDwFMMpg3N7K4lY4SbvePtrA2QOoV+SEdHcUQ2MC6XzwVaT6iXjh8CXKImDKM1MYrVx5qLFbAr
	Xt1wPs85Du5v6cEwecavTjN/GBqh/WC9vARI+Lgvsdc/Nff7zDSWbjyrJhzw61wG0m6lS0at3cT
	GK4+XDve73iC4GFAbBW7uC5KXC4X+gbPcJQQ9rhmQD1ZG9xJBDVxz961FUQuMhFT63b/bRzRccX
	xcuzqfIczGyFGwUlnnoumDl3nhtA+6w2FqGi+DdPIlPUa88NBTYbX6vvMM1K371wDgHXuAvpLMd
	3FLy177W7Kj8oy2v5ugz3Hofe4VY4kNlNLj3PifkaPxtYtpqNVMX
X-Received: by 2002:a05:6a21:3d86:b0:3e2:26fc:2e06 with SMTP id adf61e73a8af0-3f7a77c053fmr6978259637.26.1794807878106;
        Sun, 15 Nov 2026 21:44:38 -0800 (PST)
Received: from localhost.localdomain ([152.136.45.109])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc18c7575sm3680304a12.27.2026.11.15.21.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 21:44:37 -0800 (PST)
From: Qing Zhang <diasyzhangqing@gmail.com>
X-Google-Original-From: Qing Zhang <diasyzhang@tencent.com>
To: tytso@mit.edu
Cc: adilger.kernel@dilger.ca,
	libaokun@linux.alibaba.com,
	jack@suse.cz,
	ojaswin@linux.ibm.com,
	ritesh.list@gmail.com,
	kartikey406@gmail.com,
	yi.zhang@huawei.com,
	linux-ext4@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Qing Zhang <diasyzhang@tencent.com>,
	Ahmed Khan <ahmadpsn95@gmail.com>,
	syzbot+9c29b92a3b6500bb347d@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: [PATCH] ext4: attach jinode before inline data conversion in setattr
Date: Mon, 16 Nov 2026 13:44:23 +0800
Message-ID: <20261116054424.62067-1-diasyzhang@tencent.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <6afa2521.84fe3b82.798c4.0005.GAE@google.com>
References: <6afa2521.84fe3b82.798c4.0005.GAE@google.com>
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

Commit ed9356a30e59 ("ext4: convert inline data to extents when
truncate exceeds inline size") added inline data conversion to
ext4_setattr(). Pathname-based truncate bypasses ext4_file_open(),
so the inode may lack a jinode. In ordered mode, the conversion
can pass this NULL jinode to jbd2_journal_file_inode(), causing a
NULL pointer dereference.

Attach the jinode before ext4_convert_inline_data() and propagate
attachment errors. The attachment in ext4_truncate_up() occurs
after the conversion and is too late.

Fixes: ed9356a30e59 ("ext4: convert inline data to extents when truncate exceeds inline size")
Reported-by: Ahmed Khan <ahmadpsn95@gmail.com>
Link: https://lore.kernel.org/r/CAOaS1==g3mdoqmS2AjOC0_-woXJbA_X0LJQt7+M7d1=+gfyQqw@mail.gmail.com
Reported-by: syzbot+9c29b92a3b6500bb347d@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=9c29b92a3b6500bb347d
Cc: stable@vger.kernel.org
Signed-off-by: Qing Zhang <diasyzhang@tencent.com>
---

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
 fs/ext4/inode.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index 10cd85d4c721..1e31933ae98c 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -7127,6 +7127,9 @@ int ext4_setattr(const struct mnt_idmap *idmap, struct dentry *dentry,
 		 */
 		if (ext4_has_inline_data(inode) &&
 		    attr->ia_size > EXT4_I(inode)->i_inline_size) {
+			error = ext4_inode_attach_jinode(inode);
+			if (error)
+				goto err_out;
 			error = ext4_convert_inline_data(inode);
 			if (error)
 				goto err_out;
-- 
2.43.7

