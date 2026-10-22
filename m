Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792674777;
	b=ojtIfRXVvnMvq6UukeboyJULRSRcl/0L0ETMhFNuMH/CYJ+MiNI3YHOUb9GhpPWXFGI7
	 HJCZN7Eei9hOMJARrMZ6Nb5nxlNeJxAxU+O3WgYcs9Lr79bC2gcuZY6OQPSNb1reuOjVS
	 U5Kjg6NZOpDpOJ1OeAQjJNZ0D57hY0QhsDyGfMWmHgM6TktrM6ubGh6Ix9c8Ni6YUJD3N
	 8tUIxAt32pBou5v+a4bwmV6l4zRE9zs2fKc4zhQWR4tdf3/msihaqFFBMtRAWRU2r3IOI
	 LGp2F2GL7GLAkhn5+qufn8gkTVhS3SzaSvHLmZLfjkk1By1pCz8FjBlsZzlsITNsfgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792674777;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XegirbRv61k8O/v8C9GqnTzvwKbCvCQRqzC7ceZuaqQ=;
	b=NJ59FSUweQMWe6xmbBAwn147QnKnOfb0sA594rMn9LD98ivIO76QxF+GD6dGJwqBOsDI
	 RnPZSg9QPpumv52AtVcwZOoZbGKakbrXCh4Hga3KDvfPDYIwJQv2UBI8wndWeHBk4rMG1
	 5da5tPB6raeBKfT80t8VeBvvMtSaP+HRNPALEuRBHDpgXxtxa30J3fhQiQi+Pl0nVfKTc
	 UaQQUBwEIHUbWCYN+4K/weyMuV2b9nuTOvhnPC5SdsVeHWWKBQP/FsiEspBu7X2UxSxD2
	 jGlXhB6gkD7YBecP9j41jigmnQk5RkxcV+mqkEImA6/4mrkMilpmKIgQQnkwCHeQj+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y4bP49Mj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6211606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y4bP49Mj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA5AA1F000C6;
	Thu, 22 Oct 2026 13:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792674776;
	bh=XegirbRv61k8O/v8C9GqnTzvwKbCvCQRqzC7ceZuaqQ=;
	h=From:To:Cc:Subject:Date;
	b=Y4bP49Mj/nxRncXjpAF0hximuF8uFviKaJ0SvcxSEtZr5+LeebPpZA1ivo4VxTolp
	 OuLCEOtpOnQuR8/9jGyTWn9T15B3nAVF3A+MuoZrn5qovjXA9OdMbTKUtwV0a7l+gC
	 XOrjoGPerPsJ8iT422KCuSfJ15jIbIF3+OaNSF1nigc4laudwjp28oRDzlv/0Aa+EY
	 bl1/n05RGOezwuGfe2ERHCOyyE4ojAj9VBTZadqEeNWMigs8RgSjbnUEaw+83eqmw5
	 kCsHgo2RoR0SdjyXfsQHXTYc82+KJOENx9vYufrTTEPH+0r21Wzm1cb7vp8r3QhBQ4
	 +wbmLYN8JFBcg==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Chao Yu <chao@kernel.org>
Subject: [PATCH] mkfs.f2fs: fix to align RO image layout w/ block size
Date: Thu, 22 Oct 2026 13:12:48 +0000
Message-ID: <20261022131248.3440239-1-chao@kernel.org>
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
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

From: Chao Yu <chao@kernel.org>

f2fs/015 fails w/ 16k block size, mounting an image formatted w/
"-O ro" fails as below:

mkfs.f2fs -f -b 16384 -O ro /dev/vdd
mount -t f2fs -o ro /dev/vdd /mnt/f2fs
mount: /mnt/f2fs: mount() failed: Structure needs cleaning.

F2FS-fs (vdd): invalid crc_offset: 0
F2FS-fs (vdd): Skip to start discard thread for readonly image
F2FS-fs (vdd): SIT is corrupted node# 0 vs 1
F2FS-fs (vdd): Failed to initialize F2FS segment manager (-117)

and fsck.f2fs reports:

[ASSERT] (fsck_chk_curseg_info:3747)  --> Incorrect curseg [3]: segno [0x38] type(SIT) [0]

For RO image, f2fs_prepare_super_block() hardcodes the start offset of
segment0 to 8192 bytes, i.e. two 4k blocks for the two superblocks, but
w/ 16k block size, 8192 bytes is only half of a block, so segment0_blkaddr
and cp_blkaddr become 0, then the 1st checkpoint pack shares block #0 w/
the superblock and is overwritten by it, so kernel and fsck can not find
valid SIT journal entries in the compacted summary.

Let's use 2 * F2FS_BLKSIZE as the start offset instead.

Fixes: 50fd00b ("f2fs-tools: Support different block sizes")
Signed-off-by: Chao Yu <chao@kernel.org>
---
 mkfs/f2fs_format.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
index 33d3da9..7390fa4 100644
--- a/mkfs/f2fs_format.c
+++ b/mkfs/f2fs_format.c
@@ -316,7 +316,7 @@ static int f2fs_prepare_super_block(void)
 		(uint64_t) c.start_sector * DEFAULT_SECTOR_SIZE;
 
 	if (c.feature & F2FS_FEATURE_RO)
-		zone_align_start_offset = 8192;
+		zone_align_start_offset = 2 * F2FS_BLKSIZE;
 
 	if (c.start_sector % DEFAULT_SECTORS_PER_BLOCK) {
 		MSG(1, "\t%s: Align start sector number to the page unit\n",
-- 
2.49.0

