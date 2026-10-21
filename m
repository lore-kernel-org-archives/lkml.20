Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792571914;
	b=EtmaP3BlVLWYFP56ZcZ91fXR4a4M2gDcH4WLuRsnIdqVbYlvfRtQv8j/XZgwX57HVv2r
	 Qe/gvPlbJi1zz63z9lbmQhqIJIg8u89gd/X2l2Ge46evOJG+RxwZZOxiCqvbdntppDake
	 ebTfoEBa0g+xSWeLpgs7mxWos+eysuQzf/q+8HVgbmzmqP7jEQhsqNJo4V5DjxQMKzdIF
	 oQv5LRpHPCY9Secmdx8QIPsXDQep3oH4D1dLGT/mNGyUNVEwJzR7RsxsDG/JtWJ216Lqk
	 i/r8oEj9vBPfenQzqTx2qq7F7JnNOxjijGYwKE8WkuABAKZ+Hq4x4PUBkNJPBD64m4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792571914;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ezaUw4HbM92qbq50KCeRpsCuDK1ahVr0MqnfbwD+p5c=;
	b=Z4J73Gy3jvbjIo3FLvujF1wD068bqyOD0CurQ+V6z954jNHvE2+hY4rpfHxikGGMKGzq
	 wHlo0ThGtQHKkGm88WYo6aG234WGRR+J7MLu+ELB/bMDUtCuFB82e5GI5RHqkJAex2FpX
	 mHL6xPmc6r+YfkdFulmL3M0MGwRvc75CgQdNR36c6Y2+fvTOV78INslp10c+k0WCiRJu+
	 ejhE1VlfABakIDtoDitpvw3+orsg4a7ACmBVhITaYSFvsBX6LZKBr2ai3hFUd/h43LoOD
	 03DsS4j4WbIUzV/3OxgkwUARpCXBHK5kYVbzDxZnVleQSRayRhbMXMpf6RphMzcEVGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Sc438LRA;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2911606A32F
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:38:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2911606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Sc438LRA
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-36681e85e87so914435eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 01:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792571913; x=1793176713; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ezaUw4HbM92qbq50KCeRpsCuDK1ahVr0MqnfbwD+p5c=;
        b=Sc438LRApyTpSreJ2uVrqCx6QYKAesxvwh3mQBDucT8nngGIfn/JLHPOGQX3LKkUO7
         a7kNu5jrEPLbZwIaHTlir0LJPhvqNjvSQkxdXfcB4rfdWqNprujV2Bzf5b7FeYyRwaiF
         xFiMuD4wOVvsLu/UGBXbru/3s3X4bjLI7pbkMWed9bxe0hGXZzsh7cL7iI9AaoAYHigB
         1vVCeLgiaNKaVtTfJ6t8fG2vK7AqWXWHdl0b74mXMCcbi8uytjMbD38t4my9JF2C/M9e
         G1YdHPheMNiPSzx+MyUdvNe33Owwk4+hokAgqJUfyAE2lt0bukmA4NgrGIF8giW/UcQZ
         AIiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792571913; x=1793176713;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ezaUw4HbM92qbq50KCeRpsCuDK1ahVr0MqnfbwD+p5c=;
        b=oVbZbS4cwhHX9uhyXYl39+4Z9AuVgB1Y5j1UIqNFkLAOJXCdZsTqEXHgPWZqAfruPJ
         S6KJd69zYW2jhtwBubCY1cXXNuv8y8bWGPc1xGV26jy92w8d2cPyQkwklmiqgI0/ZyDN
         I2QwVCnBgSsPIk+4ilBCddeBtlPNymJN3uxUd6X/AucpJtrTvVsKVPR2KVpWkdMUov1O
         PowmOBu00GqrZaHcegdE8XGRCU3Ul84gL5IZIZskUWi5MXtoZ9y6sKmsH1Pg45Kg00y+
         UVoPqcvEoB9NCN//jA8CG0HTIVn/pMTS9uFbCZYyk0MDf2phkNhvtJ2E4FqnVuMpjYLB
         c1wA==
X-Forwarded-Encrypted: i=1; AKwUvBy7r6a8Wle//btk9GAxiOJukxSoxJjjCFrqPHDJspjiq6rzUtEqZyPo3hcYTM4r5087PEzV9RPBec6hhik=@vger.kernel.org
X-Gm-Message-State: AFq9FYL+YoLvFFsuXzdghd6/qxj95ckzBBKt4J9ckJ7y2q/y2S9+m2AN
	I/8n3e1qmK/8mhRruNBRL7ti3qewlgwYSvJIzw2/kR/J+0JnRXE1l64Z
X-Gm-Gg: AYBFou1rEDvtd7XbjV5EYMfAPIMY8kGbjS6crlnoSfmr90UoarHJf0pKfL01qpfYMI6
	6KgWnr6iYZTcVkH+4iq4S+TgjvWcxiWR8VuDzwrIUweoOClNQS12tao1ex+fl+M2uQ22TnBG+54
	by8+V3tts+cinghZvaB+b1JEYbA/ffvZYJ8WXByz34IQOLUDzBYTQGCXSk57/eQDKz7gJl/XkJc
	ajIebsi6OqWeU26CzXXaFGDifIrOCI6yj76+N6OgSwVCaJ8CfmEP10vhCB64ZhwBgb/nEgjNtdo
	uqnAa888cufXEGyGk0h6A64HDocqublcGXii3xXNmpiRgK2R3IU6Iy24fOjae13vl5RInYhxZCK
	uDKIPTgHp+fSv0cyIm8j/r0MCOP/A91gtjPlkm3reihPNLQcA+iPBFsjoALm4GCcwM3YcxnUY9q
	BYPYCo+WhZ2QNGv8/bXJKRUHtd/OXEnefyVYtTzoXYAwo2epQVrLEdSBtGY89bgi/x48frPO4bm
	2x7mRVTLyREcVpnwaM3hY+My6w0PXEhWS3in32pOvLkf/zIjJ6B3RR49jfW3IZswjQKspeLEA==
X-Received: by 2002:a05:693c:864c:20b0:351:1f56:3a89 with SMTP id 5a478bee46e88-3674e548e2amr2574946eec.23.1792571912854;
        Wed, 21 Oct 2026 01:38:32 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-367411b4145sm6102203eec.15.2026.10.21.01.38.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 01:38:32 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
To: Gao Xiang <xiang@kernel.org>,
	Chao Yu <chao@kernel.org>
Cc: Giuseppe Scrivano <giuseppe@scrivano.org>,
	Yue Hu <zbestahu@gmail.com>,
	Jeffle Xu <jefflexu@linux.alibaba.com>,
	Sandeep Dhavale <dhavale@google.com>,
	linux-erofs@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Zhan Xusheng <zhanxusheng@xiaomi.com>
Subject: [PATCH] erofs: don't reuse a superblock for a mount that passes device=
Date: Wed, 21 Oct 2026 16:38:26 +0800
Message-ID: <20261021083826.1870937-1-zhanxusheng1024@gmail.com>
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

From: Zhan Xusheng <zhanxusheng@xiaomi.com>

superblock_share together with device= is rejected in
erofs_fc_fill_super():

	if (test_opt(&sbi->opt, SUPERBLOCK_SHARE) &&
	    sbi->devs->extra_devices)
		return -EINVAL;

but extra_devices is kept in sbi->devs, not in sbi->opt, and
erofs_sb_share_test_super() compares only the backing inode, the
fsoffset and sbi->opt.  So once the image is mounted with
superblock_share, a second mount with superblock_share,device= matches
that superblock and get_tree_super() reuses it without calling
fill_super() at all.

The same command line therefore either fails with -EINVAL or succeeds
with device= quietly dropped, depending on whether a compatible mount
already exists.

Refuse to match a context that brought device= options, so that it gets
a superblock of its own and fill_super() decides as it does today.

Only the incoming context can be tested: a shared superblock may have
extra_devices set itself, because erofs_scan_devices() fills the device
table from the image when no device= was given.

Fixes: cd4108319bb3 ("erofs: reuse superblock for file-backed mounts")
Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
---
 fs/erofs/super.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/fs/erofs/super.c b/fs/erofs/super.c
index 16fa3b853f1b6..bc9ab5a6234a0 100644
--- a/fs/erofs/super.c
+++ b/fs/erofs/super.c
@@ -825,6 +825,13 @@ static int erofs_sb_share_test_super(struct super_block *sb,
 		return 0;
 	if (!sbi->dif0.file || !new_sbi->dif0.file)
 		return 0;
+	/*
+	 * extra_devices is not part of sbi->opt, so the memcmp below cannot
+	 * see device= options.  @sb may have extra_devices set from the
+	 * on-disk device table, so only the incoming context is tested.
+	 */
+	if (new_sbi->devs->extra_devices)
+		return 0;
 	return file_inode(sbi->dif0.file) == file_inode(new_sbi->dif0.file) &&
 	       sbi->dif0.fsoff == new_sbi->dif0.fsoff &&
 	       !memcmp(&sbi->opt, &new_sbi->opt, sizeof(sbi->opt));

base-commit: 1137aa577a35e2684e8046c3e53f920e79c7cc60
-- 
2.43.0

