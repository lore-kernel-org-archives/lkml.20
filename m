Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793329059;
	b=t0KdyTG28aOaasHHSXgDZAtqdFPTYDGt1CfOZirxT9qehrtp4482cLl6HVm+uJHkjks4
	 P7QHNESmJlCXXMQG+CmIndo88ja4OTumG0p61gWMWYiPH9SdBB/qSJ0AIdkIL1+a8hXyq
	 MM9jpvM9HCEcnyeCvDYGfhAFWDDBnePUft/9KndRunrq526P0PFGO2lkeO7XdcQ5/GyMI
	 DIH82lSVrV2VNVIIi64paqCsDTKHtYATcJJx5PQuVhE5SAhER6nqvaMb4J3+kYenfaaB7
	 hYNdZ8xjO/SOmkL0pYlIHzR7IAUVtgRMUPWsoCDMrEbWvbtY+VtMgfVaQVQXIbdZFZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793329059;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=R29eOO7MluwzQ+8n9YmxiuPXIbP8eqbXNdA0VYXai58=;
	b=xeann5Bb8pfabcxUXJrdEVlm2lkKtqgb/eov+5K+MgdVavm91uC6BvJLSuLGZFeYKr28
	 ybS60AvAIlCQsPPNAUe3jIHY0WIctiGDnVQxVklObS5XE6ULwnTOowDsaVOFXjIvCUA9g
	 Rw5jUjcIs8STsR+3hyw3f8BN7n1yZrNbSH9d7TYxtTfOkOxR1fqW9ZTTZ6wQn+PsRexjK
	 HzvAGsV6ntPtVb2EtWvaIIoARDQh9BTob92w306zkUmj3z98PBsWu8HNSHgBHqYGbfqKe
	 1UEOABxEKjiWLAPWSIe3JfN1f6b8I6PouSiCCotJb9k9tapL6Sy/s67rzJQ9HY3EfTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cs.unc.edu;
	spf=pass smtp.mailfrom=cs.unc.edu;
	dkim=pass header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b=D0h1BDdj;
	arc=none smtp.remote-ip=74.125.224.48
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 419DA606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 02:57:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 419DA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b=D0h1BDdj
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-675617e81f9so179377d50.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 19:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.unc.edu; s=google; t=1793329057; x=1793933857; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=R29eOO7MluwzQ+8n9YmxiuPXIbP8eqbXNdA0VYXai58=;
        b=D0h1BDdjx/7rfkEfgzolA/olPpLTEtkcAC8fILKxjO6ClRo7FoeIHl3TtFT2euqOQN
         zfMslcyqheQPRgDV9RBjtgAZPrzG/20Wbe5GarD9g4supvFu2wBlfk93dan3O0LFaWyr
         X0rqlIhGXUm8vgBa0NaY7mOutQnpxMs+jON9lh1Y+msRnGBSePP9tFvWcqfyofMUtiNa
         FuH1SvPNkoKLosDdYSQI8hbWWNbyE+QArk4pbmL1jeNsT1FPDznP4/UkMay7mtHk2ApD
         1JlZRH6aptNzMRLrluUniTEJ6jccyc9NCbjHEsRI+Ee5iGqMkoLCyTrfdx1wXyazjMV6
         h6+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793329057; x=1793933857;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R29eOO7MluwzQ+8n9YmxiuPXIbP8eqbXNdA0VYXai58=;
        b=b7CGFtvkMsUaDax7De6fswu3h+Db1IJHKglmqQRU8Xo7co+ydMoKfvQnk3Mxs8Nv7x
         izuV2y5dIDWlrct74k8r/cy2gQJSvQyLuvATrh/c5OuWRYuVnPFd7sMEEbIPgf4rqPlV
         8tu7xrmwXY+bPpup7B1AOv2cj2jNJUn8T/g59HdBmr+2ayHAcKIqrOU4McdHJQoZO8n/
         VGPjl5ch9dA+4j1jqTQGq9D9prM98Ky/oy/+O9loUAckY+v2DUuBPCO0t+O87icjfT/B
         ilJZg4XCTY9rnZ8vex9uXJrc5myHT0xVONC6xkSI2P6KiGlrvDqo0PnF5/BHzR6lU02F
         mYFQ==
X-Forwarded-Encrypted: i=1; AKwUvByqSBVc7hzZ48ZYIdp5hTNR7PXJnFhunMLwpvN52FuC687wDZPZ5LcIuTu+v1eT7Xc+r+XNcSSn6fe7uvQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLLc6UV9u8rsPhYnifoX6Hq2sZyLe30+PaSpW3X8aDmHbxt1vKn
	2cx4InntP7IYG+zO8GDdBOS2vyTJvx0a8L8AypuwW6tN2f9sivOm+rAmqdew5chGzA==
X-Gm-Gg: AYBFou2pP/XFswUtkzx2HfTbAQlY2aGALiDmpgvcpHGoL0jRG5rBdgNoURQIA0ALGiL
	e82AW0AMvw1h5It6wTO871h4kYhkjFkojPpVnfVNTbQwwO6rMgZ0H4vqJUCCKAq9p5uIk8LJ+Ow
	NsEsrsh9/vQvuASnxSPNki70nIl6msF8ZkfHcZxPyzlwxSYmWf2uZ+xYIb8dD+3WtknygitmR14
	+A/R7s7P167WOzQoPgD3Di5S/WosDcJRV+9ymH/hiA/Axv24G13SYlp/z1Q9MwzOG8qUBwGColf
	VhzBb4ZIJhJjcMH8E2A54z8pP+/VNMaXqI0D/Djsk8+5zqoDF4HVit0u2w/8zFt8PoiPmA5k/5t
	NzJ/vqQaw8y/rPSfXxYZS1o2S6mx5fkfQuCV31dAPUI9UUB7FTBhP13OVQzwVUu55jjWkmkO7HG
	uqHHTlo6dYWNODxQ8kHfC9UrJk1GhwXZBrR+gBXOaXmsUzeBcSvqYGNaNJURcAXBlxPpSRZ5E7E
	ZoGhZl5BpAIMnzq4cEiPlYVAIil6ahqKSB7qeg417RHh+YgZ0GFv32x5T7I0wUG7wBkhNuyYqDs
	6+pjTIjxIsx+O7KYDTaPTTnwy7nfbwF0eqVc3QFrf2kzzJ6Qng4=
X-Received: by 2002:a05:690e:1243:b0:671:70d1:d6e1 with SMTP id 956f58d0204a3-67ba4fdb0bemr838413d50.83.1793329056973;
        Thu, 29 Oct 2026 19:57:36 -0700 (PDT)
Received: from cobra01.cs.unc.edu (cobra01.cs.unc.edu. [152.2.130.143])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67ba7509f13sm242820d50.13.2026.10.29.19.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 19:57:36 -0700 (PDT)
From: Hengyu Liang <hengyul@cs.unc.edu>
To: tytso@mit.edu
Cc: adilger.kernel@dilger.ca,
	linux-ext4@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kartikey406@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH] ext4: do not report inline conversion allocation failures as fs errors
Date: Thu, 29 Oct 2026 22:57:30 -0400
Message-ID: <20261030025730.3965245-1-hengyul@cs.unc.edu>
X-Mailer: git-send-email 2.53.0
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

When truncate grows an inline-data file beyond its inline capacity,
ext4_setattr() first calls ext4_convert_inline_data(). If the conversion
fails, it jumps to err_out and passes the error to ext4_std_error().

Allocating the first block can fail with -ENOSPC or -EDQUOT on a healthy
filesystem. Reporting these as filesystem errors records an error in the
superblock and, with errors=remount-ro, aborts the journal and rejects
subsequent writes with -EROFS.

For example, create a filesystem with inline_data,quota and mount it with
usrquota,errors=remount-ro. Create a small inline file owned by a user with
a 1 MiB block quota, then let that user fill the quota in a second file.
Growing the inline file with ftruncate() returns EDQUOT, after which even
root can no longer create a file.

Return conversion errors directly, as other callers of
ext4_convert_inline_data() do. The conversion helper handles its own
cleanup, and lower layers report metadata and journal errors.

Fixes: ed9356a30e59 ("ext4: convert inline data to extents when truncate exceeds inline size")
Cc: stable@vger.kernel.org
Signed-off-by: Hengyu Liang <hengyul@cs.unc.edu>
---
Tested on x86-64 KVM with KASAN, comparing ext4/dev at 8c4f6e337634
with this patch (28 allocation-pressure cases per kernel):
- ENOSPC and EDQUOT with 1K/4K blocks, default/nodelalloc/data=journal,
  buffered_iomap and bigalloc, using remount-ro and continue policies.
- Failed conversion preserves inline data; 16 repeated failures on the
  patched kernel do not increase quota usage. Removing the allocation
  limit permits a successful retry.
- Remount readback and e2fsck -fn pass for all 28 images per kernel.
- A device-mapper block-bitmap read failure still returns EIO, records a
  filesystem error and rejects subsequent writes with EROFS.

 fs/ext4/inode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index 6ede3644a738..02011f65ab32 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -7123,7 +7123,7 @@ int ext4_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
 		    attr->ia_size > EXT4_I(inode)->i_inline_size) {
 			error = ext4_convert_inline_data(inode);
 			if (error)
-				goto err_out;
+				return error;
 		}
 
 		if (shrink) {
-- 
2.53.0

