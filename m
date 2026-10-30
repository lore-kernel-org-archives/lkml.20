Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793332366;
	b=XEsGOUCQcyvrX6+nkEgK1gFRcOd4Ps4Xk38tmyyAss6rt1raaaH38423fPFQ+caxX5CY
	 LefN6oyoo6EI+P48DIP/wBRcCmQ/fQgpGf2h9tD2AGxmmB+VA0DTYxy2hmOcNAq0Rek4r
	 mUwyxutLYc3ppX7fTOnHQZ8bQIXXftXJnIvBTBsSra8zx9CA2ECwuFeJjaINSU5Vw3/ta
	 kjzWCekXff7TEEKyqAiircykly5nYzNyJnDvYkvbYiaSmahLEjM9+2zvKH3zYHr2ZuSGb
	 7uLfK0u+XZ2fG08iR+c18TIVY+dhvojaXAK6eUAIDspmhH3rESRsUnPY9Jnddan7KOQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793332366;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=iysMAEzBYuRpLgnQMNCkF8C+wwy010ieTKcmJAPE1LY=;
	b=tt5gYc5c4hT3n1/2koJx/94U+nN+ymRPdT9FVjpYLqfLzOIa/WulEag4OynJrLL61+tA
	 w5pQfp77zafBaEJJCYSkMG5CYEoWDNnp6B9eiTiwgWvfphgnY79u9kgzFWQLsC0joT2Za
	 RvYXLM0e1fZVCCZn8ces6FflkZX0aGjzrEka5GqAtl5jAMvqX5TUvKZbchblqeMrZBei9
	 rD2B23Q7RgWaaZZB6Nqh4YoS1aRmXRiyjkTjkcQMagqXnsurnVYqKJ/j4dZ/aGLAV/evd
	 XjaBgfVGl+Kxscj1RPUwAbiNFyKRMWHlMQR+QBSxwe/8A/A+ShDin4lziDKpe/z3QGw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XHdkd5og;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C99AF606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 03:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XHdkd5og
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793332365;
	b=NIAFCn6Gp942P6YuC4F1Rck4ykmuGKnOhUV0THIcHm/9OAzp2Gk8z4bspeZCt3h1QNB+
	 hSNgaXJqJlItvJE8fihRXRiWHlc5mlVSh3NrcxUGf15om0jzHHgiRM4QmfWETHAG0Y99+
	 OPckIrlPesQJDuGq94ixnfGA9Xua3bd1oObWBtYej5lNV/EVZmNBKalyRQqkRCa5z/SBX
	 hMh1AJAiwU7RL7ix7h4B1ZOFU3hXKlApDaCPvkW/wpWlusaCBhakw4B2/ar3V+o7tOLFg
	 NPbqd5zVoVeB7/Px9umfDuZY6mFcGvnWr2xdx+uZXYBzErcXJFMbIe839fOijXCEdew==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793332365;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Endpoint-Received:X-Original-From:Reply-To:
	 Content-Transfer-Encoding;
	bh=iysMAEzBYuRpLgnQMNCkF8C+wwy010ieTKcmJAPE1LY=;
	b=M7Kw+saMKBhIJM8P0O5CmEEIRtVx73GB/noMs0wff7/Dk4ONciuZeOI6fI2tIixno9Az
	 BhyWIHappbAk6JC27FRu8HOSjwD9xCI5sraGeA6GynAe7lPoZiGZCUNnNg4UJ6G+EjNeE
	 ixzc5uJRvoRh90SbuVmhmyOr85F3Ox2mDdZ9uZJlU1A/fVpF6mKA2r1xfabGasHXXqVUp
	 W5L5skiDy6cDkt2VRHfedOVTt+Mgy0RZylVh5HjP0N1vamkPrG2uWRtR+l9VRweJud3A1
	 y/X+JJvgGcfNsM9epI0t5sRNlRAZ7yykoM8QSAxx86kOTCgE73uVocP2I+xj6iSSadA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CC5FF1F000C1;
	Fri, 30 Oct 2026 03:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793332365;
	bh=iysMAEzBYuRpLgnQMNCkF8C+wwy010ieTKcmJAPE1LY=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=XHdkd5og36XBX6Y0CKOirURH4O86UuKspW7B0vwL6GEdcv9KiUKw9f5b0BF1Jw1av
	 sKkNAjmnbVli9io0JC42m2CgBPk6EMScyP3JZcE9TA63WImPALjQwsinIvIwdoDOm/
	 DyHIWmqL3dO8guWKZRkLc8pgzSTzqVyIuUzQzjDYlc5d4MWlBwes22sziV4dCbxSPb
	 vNARyKDxLW25rSzGASzokJFfvsbcREraKe5lQprsSfoR8Zwv2maAQ1fqfupwfHGI7W
	 +bWLU3ffIhlH8WzROEIfHQHXejit1DaIdO042LqyK5oA3K6uB13rSJ3JpBZcNq73jI
	 MrzLVQsK3iEVw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 293474363D;
	Fri, 30 Oct 2026 03:52:44 +0000 (UTC)
From: Daejun Park via B4 Relay <devnull+daejun7.park.samsung.com@kernel.org>
Date: Fri, 30 Oct 2026 12:52:44 +0900
Subject: [PATCH] erofs: apply the stacked fs check to extra file-backed
 devices
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261030-erofs-stacked-extra-devices-v1-1-39f7df7ac01b@samsung.com>
X-B4-Tracking: v=1; b=H4sIAIsU5GoC/x3MQQqDQAxA0atI1g1MRrGlV5EuwiTaUNCSiAji3
 R1cvsX/B4S6acC7OcB1s7BlrqBHA+XL86RoUg055Z5SfqH6MgbGyuWngrqvzig1LBooT6aOhBO
 1LdTD33W0/b4Pn/O8AHOgu11tAAAA
To: Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>
Cc: Yue Hu <zbestahu@gmail.com>, Jingbo Xu <jefflexu@163.com>, 
 Sandeep Dhavale <dhavale@google.com>, Hongbo Li <hongbohbli@tencent.com>, 
 Chunhai Guo <guochunhai@vivo.com>, linux-erofs@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, Daejun Park <daejun7.park@samsung.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793332363; l=2715;
 i=daejun7.park@samsung.com; s=20261006; h=from:subject:message-id;
 bh=ewjS8koWFn8Z4rafq/egOLIaNXTnJqYTfaJQKrbMB9s=;
 b=Bxud52oBS6RR96umz1PtXO37YvER3b+2EfdcZL8t9uPHVWsq+/Uz3ePCKWAOKbZTXGR7NGnva
 nFn3KIa7gzFAP/HdYKb9DQZFWkBJqKLaV5LyPa3JI2b8LA9yVJcSgKT
X-Developer-Key: i=daejun7.park@samsung.com; a=ed25519;
 pk=4yUfDqGRZTIj0Ik43z1GoMZRWCNm/rgX6uJuM9dtNIg=
X-Endpoint-Received: by B4 Relay for daejun7.park@samsung.com/20261006 with
 auth_id=1122
X-Original-From: Daejun Park <daejun7.park@samsung.com>
Reply-To: daejun7.park@samsung.com
Content-Transfer-Encoding: 7bit

From: Daejun Park <daejun7.park@samsung.com>

erofs_fc_fill_super() rejects a file-backed mount whose image is on a
file-backed EROFS or on a filesystem with s_stack_depth set. This
bounds the nesting of reads. Extra devices given by device= are not
checked. File-backed mounts can still nest through them without limit.

Apply the same check to extra devices.

Fixes: fb176750266a ("erofs: add file-backed mount support")
Signed-off-by: Daejun Park <daejun7.park@samsung.com>
---
Tested on erofs dev in a QEMU guest with KASAN and lockdep:

- Blobs on a file-backed EROFS or overlayfs now get -EINVAL.

- Blobs on XFS or a loop-mounted EROFS still mount and read back.

- Lockdep warns about devs->rwsem vs i_rwsem for a device= path inside
  an EROFS mount, with or without this patch.
---
 fs/erofs/super.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/fs/erofs/super.c b/fs/erofs/super.c
index ce05557bd9..ee01a5ef85 100644
--- a/fs/erofs/super.c
+++ b/fs/erofs/super.c
@@ -122,6 +122,14 @@ void *erofs_read_metadata(struct super_block *sb, struct erofs_buf *buf,
 	return buffer;
 }
 
+/* see the comment in erofs_fc_fill_super() */
+static bool erofs_is_stacked_file(struct file *file)
+{
+	struct super_block *sb = file_inode(file)->i_sb;
+
+	return (sb->s_op == &erofs_sops && !sb->s_bdev) || sb->s_stack_depth;
+}
+
 static int erofs_init_device(struct erofs_buf *buf, struct super_block *sb,
 			     struct erofs_device_info *dif, erofs_off_t *pos)
 {
@@ -161,6 +169,11 @@ static int erofs_init_device(struct erofs_buf *buf, struct super_block *sb,
 		} else if (!S_ISREG(file_inode(file)->i_mode)) {
 			fput(file);
 			return -EINVAL;
+		} else if (erofs_is_stacked_file(file)) {
+			erofs_err(sb, "%s: file-backed devices cannot be on stacked fses",
+				  dif->path);
+			fput(file);
+			return -EINVAL;
 		}
 		if (!dif->dax_dev && test_opt(&sbi->opt, DAX_ALWAYS)) {
 			erofs_info(sb, "DAX unsupported by %s. Turning off DAX.",
@@ -701,9 +714,7 @@ static int erofs_fc_fill_super(struct super_block *sb, struct fs_context *fc)
 		 * It MUST change if another fs plans to support them, which
 		 * may also require adjusting FILESYSTEM_MAX_STACK_DEPTH.
 		 */
-		inode = file_inode(sbi->dif0.file);
-		if ((inode->i_sb->s_op == &erofs_sops &&
-		     !inode->i_sb->s_bdev) || inode->i_sb->s_stack_depth) {
+		if (erofs_is_stacked_file(sbi->dif0.file)) {
 			erofs_err(sb, "file-backed mounts cannot be applied to stacked fses");
 			return -ENOTBLK;
 		}

---
base-commit: 209108a5456171ab430e25b54b2dfe083455bfb6
change-id: 20261028-erofs-stacked-extra-devices-d7a141da0133

Best regards,
-- 
Daejun Park <daejun7.park@samsung.com>


