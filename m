Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793687373;
	b=xiudTlPp2m6o6ZxM0RkcGHfgQdtFcl6zWf6I5NUCbaZkE8bJ+tyseh1bC737IIi1Jn4E
	 fdoS1NgVa5xnVslPs8Yls7ll8y1Bx3nCSplcsW9ZtJH0zM3gmJBzNwNTn1xFZeFhDR9Ci
	 TRrpDyyRksyMccd32goRnZQVjZjcnPGbqsPvXB1JtnbzAfGeAiXxF8+JIlk5PotF2C6aH
	 nZCugfgSxMonolDWONxgss5teW1BmFKF6T1I1X8KKPElqzwL14vd/ijq12U5/N7UkKRuP
	 lHoD3DELtmx1errFGdvv85wJBnLF24ZM6w1XB/5afS6Ufy1bTT7iH3WifZH9xKUIE/A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793687373;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=YsyfiCpg9lxmYrMJMc2pVDhQtP06099TNCGNIqa+JxM=;
	b=FZ6Ge4SJYxjYuYXILS8/fX7QHBt35wDmHwymx865qIT8CTwdEBe46O7y8Zb1mvbGSM3N
	 qmG8LGuYt5lP5etuiLII402/zLxOJsO/VFG4pSjft3q5kHV4pjFgAvkKRzcu/6dNtLuSN
	 pafUqVU4Z0Y9lVnPfBGY1Et+TwwzFejvCekiW3OzOqlyNk9wAWsGPrzEUSItZ1wROkxII
	 OW8u+/DNkuHkCzxHN7V4vOMlane+gPWzm1y4W4eZciSablvrqZBC3P4WsuNPu4+pW+X4s
	 luHuYCjq/FPbB0QIaDI6JjNQMChMvoB9l5+SXy1ZPmFw50heBngF4bDOmYYbAsvBONw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ESVoQ6+e;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F29E606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 06:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ESVoQ6+e
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793687372;
	b=U3ZAt3aAZPhgqwkSq0h6QwcXdurN5j6DddbPLRIuZWMo+KFyD9iJdAkkmQLAUIrF3CBZ
	 LNGC76tx/BuvRVAR0eRwdyS99E+H1Nc1c+GIcLfeJr/pBdfsZd408vNG5j0wXV4OQXIdP
	 KPD8bDSw+8DVGKs4b2WW9odzfdxZS7s/SiAA/bTeUTkYl/+qn0hRv/3ywyqxZF7enjxlD
	 uQgt5epn9Ndg5+8FBZ6TAQccU1prgk5wDuB4DvjlqG+mkxQZ5lZgIrYbA2cRQC+GE9Ppz
	 ig6MDJq02MiaQF6ycEDVbgdjuvjjeRom6o5fOu3RSoC4xE1JiO45vBBLlSvcKgccSoQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793687372;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=YsyfiCpg9lxmYrMJMc2pVDhQtP06099TNCGNIqa+JxM=;
	b=2RMDRkd8m8z2Dpe+HvEUE+zm7PrhucVQrQqOsWnfPwjZNL0DG6iAaC497PH3g7SbCwLt
	 IlkH5H5O7GZPMEzEzoF3XYwKKDNgHQJSUI5/vcsuY26wZb6hZ747lOhXRKlNh0P+QPEn4
	 BCqVrI12hShXHrZrGYJTaFC0/Nv038iAp3z8PPnfYXOQiNrQYQBCSo+O2J94vP4SRfLHL
	 HDkPZ5B4oNjbZYXseeYf30mQcFoLhB/8MqQG9cdS7Wqphf8hXETo2OCsdhxwJDFHcOqTK
	 q6cyHgUAa7vyAt3Tr8xYD87mDQRzttUNJjGg2X+GQIARpalA3F16nICNBidXnqZQ6tA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B93BE1F00A02;
	Tue,  3 Nov 2026 06:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793687372;
	bh=YsyfiCpg9lxmYrMJMc2pVDhQtP06099TNCGNIqa+JxM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=ESVoQ6+e1ICd0qf5MASR6lW/koOQseOyNzvCCjPUoeJd/E4KGW7943urUX852eoup
	 +9UZP6uHA7TC+BhI6D4pxuqNwJfSHMGw1h9Pt+FFHe/y7GOaWaY39dnRYWRYdf0Ncx
	 Li8dyro36aWpirblux72rQF+rp6LCSCK1DeaZ7oIGYx5TramB3ZRcE7KTqyo581Ttx
	 FLhY6lAis5PxpSLnDg5c/ma2mDU4kVTdRYBjjw+wcUsLegu7xZPxGszu8pIs/I1rMW
	 ihnVAqXYvX8sbt55dAElbcjDbu/2pd47u0kxSJQ9WYqhRvGf5PqvYJ7UoPkP6L32s7
	 gR759PG9/O0mQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 30380467D4;
	Tue,  3 Nov 2026 06:29:31 +0000 (UTC)
From: Daejun Park via B4 Relay <devnull+daejun7.park.samsung.com@kernel.org>
Date: Tue, 03 Nov 2026 15:29:31 +0900
Subject: [PATCH v2 1/3] erofs: apply the stacked fs check to extra
 file-backed devices
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
Message-Id: <20261103-erofs-fileio-bioset-v2-1-5b91af423f72@samsung.com>
References: <20261103-erofs-fileio-bioset-v2-0-5b91af423f72@samsung.com>
In-Reply-To: <20261103-erofs-fileio-bioset-v2-0-5b91af423f72@samsung.com>
To: Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>
Cc: Yue Hu <zbestahu@gmail.com>, Jingbo Xu <jefflexu@163.com>, 
 Sandeep Dhavale <dhavale@google.com>, Hongbo Li <hongbohbli@tencent.com>, 
 Chunhai Guo <guochunhai@vivo.com>, linux-erofs@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, Daejun Park <daejun7.park@samsung.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793687370; l=2267;
 i=daejun7.park@samsung.com; s=20261006; h=from:subject:message-id;
 bh=sBPUwaW5nh1BZZ5bGZhc9yc4TVa5dHShdY8rmkDN50M=;
 b=illcO8XCFxG/SolTRokzWsZMW4CHgUDWCeN3ezbH5XDUb4PA8UF2JLJLIYffOSRXsQ7qTWBcD
 vt4ms4C8dIABzjmVDkd4HqwvwStFV82NyQF/ABTjbi0FhSITSqXTgyg
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
Reviewed-by: Gao Xiang <xiang@kernel.org>
Signed-off-by: Daejun Park <daejun7.park@samsung.com>
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

-- 
2.43.0


