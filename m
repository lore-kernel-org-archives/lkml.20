Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793006546;
	b=sKysuUuwm+XBVor0J8zPgHOEjZ09gcUEL4e7OG4Umsel2E18QF3mfIaUb5q0zSH0VHau
	 l65I2jGtIW+H7PQQEGJ2U61tdXfd/SYQcgZJy+LLZOLiiPuuGiUnmhM/1qCrvCIalBwRj
	 apDL8m86EWh+UdO4SWkppUjQY5T5Cfp2tMIQIzl6p/ZNOUIccsohppncVyxq2ksG5Ntqm
	 wq3XZDPqyhXLWHwOpOkw0tWQS0pzfaGQ1AR1gcL3OVrPvve6a+GCMesoh70SDyo2pIOdV
	 82fRuQOK6bkXMrD5E8zR3MV2f1+T07IAEMh3e2PWuUQqPgmb8NMBVPsVReUMarNbILg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793006546;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KLAz+LSoKYpUFYpmLED3+ouddRavFyctHlwqyoedBik=;
	b=Wo+7LEp57/CAymoAtJ5suwdsrxxvdnJ/sWeVypvauSG1k6NEShaNqeqRJ8WAjWhSs2pz
	 vBIqI0rCv95Z+QGfgqd0M0HOzNCcmS/tlnCh3aueL/eNDfWTkowivRLmfHgEMHN2dAG3C
	 SfS+jUGwAgX38HNDahv+uNSPkLEPzt54wTePgA7lGZYj97LuFFxbXqqaWfZmKF9I+p0nC
	 RAU79csCZj92PcMtzpp0H60ULoNsLgksIfvrR94Q5U9rbfJPmfj4++mqk399mIwkGn5xh
	 xC83x8/TTy2adxm0Nwj9sgG39AuYH3Pc2hPpO9bn1/bkgIkuwiug2o92iYcDbEsWZMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kaoasQmm;
	arc=none smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89666606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:22:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89666606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kaoasQmm
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8a39e5161c1so912339b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793006546; x=1793611346; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KLAz+LSoKYpUFYpmLED3+ouddRavFyctHlwqyoedBik=;
        b=kaoasQmmDydfWLx1m9/jkMSVPSP8PixcxmKmh5tt0rOoQyw7Z9LopjuZwTTo8fJ6mT
         mL+FuHXT4+XZiOx8l+hAdgYbJ3x2s/3qPC+LwUuNLgyC9xVPC77zs1UayFRALWA3FEO0
         y5aQX5iNcfz9vKPyLeplWKRqJ9QjSh8R8jG0Z4HAYcKuJVZnihyKp6IlcrD3aDAdLyJY
         DsVLRyg2/OoZ631aEPTkckuQA72BdU0MTA2d+Zpfg8kRsDrGtENNaf3+coFwg8YfXrIO
         y/bEaPnYWzEcbIz1EGqS/V4K0K/1btYZZ9l0/+8x762SnowlfM2FgDqNaTRpWXsmV3CM
         DlDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793006546; x=1793611346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KLAz+LSoKYpUFYpmLED3+ouddRavFyctHlwqyoedBik=;
        b=L94HPeez1vPIbrt5Ki0mWJ+SiDrRg9YengQMaeLis2bqV9fxWC9O+ej219bpK2SteT
         0jfz8u5cBb0Lfro5Yfi4IRGP9U6Z7zCtoLgBVBbrldNPk/maxznBosp0OY4zBxeIrCiB
         3bLW/K4dW6b/HfPFYnj4wHngo/URrK1tfcBuoMkc2xZTOLpiDOd38t43j4zTUnf2nPGz
         fVKZYthqQVyba0688xGnT12H3zH7ZR0wFoy4rf7MvK9oKofa0evZ+Z9bMYkU7XQQM6pK
         5R/ta1xkufAwtAbtdZlqzMDCFAF8++JStEdvjBP34Thyb0E8/R2oPwj1CiZA4UP6Q3e3
         wS6w==
X-Forwarded-Encrypted: i=1; AKwUvBxvlMZhx2uu9hT8+hwZEnmip6E/ePdJjWYM1lKUMRX70BinQFAn0Ckp3ph9fkoCtnto2PwJBRMIkjMyMqE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKI4zNh2OHldNDAGiMhivCifrmbJavNeWC2ARZddLspXXnUulXV
	b6rOUu+qE3HyiE2tqX4YrilM8eul3yHn8b79u/lcl350Gg0brCcLAjeX
X-Gm-Gg: AYBFou2NrXnHHW5ou7fpmVJ2c6Al8awQngTB+K8zHcRewpdUAIYmn3cLihq9In4uirg
	KEgzYeVy4Be7Wpaaie+/l/Q5E1zd2xPJ3n+f1oIzOMN9jmcsJ44yE8lXE1/rKlu3FTl1xvPOr8D
	l8vwhbPo3Oxas3MBbRrQKThV03ZQG6yKscvEhZsmH9N+debVDTnupKNCrErRasoAqwvJfk1o5CL
	wPAFSWc+ggGgxPrdxwDF+a2VAy1zZnKlZHXD2arz1ArcjcVOwUjv9jIGrTXS11MoTm+3Ben2XYR
	pV64zuhSwF2h4C7g4BOsuensmQ78aGZ1yxawGpkEl+ADlz9fWSlSYnGNkRqgaQaX9fT22FcU1un
	4m4YRO/s2yW901w4Eym4y3W+0Oog5Bb3tvTJzO+6g+PpsA/2rRCsm3ab26cN2ApVwqwIusjoFj9
	CNC6zHkNYlfm7D0GPJ5fQwa735ruA/eOPe/qyhPs2+5vwJ9Hp7tN28HqE0LQHZcq0VhG834Uivz
	dGptsZ/i1p2ta2oqoOODrBqoQ0XdAlAMux+iZOaPImER8o4btTMwnwuQO0Lyi3FTB66F+qTDw==
X-Received: by 2002:a05:6a00:98d:b0:89f:fdb7:a9df with SMTP id d2e1a72fcca58-8a364b4c9b1mr4646584b3a.5.1793006545834;
        Mon, 26 Oct 2026 02:22:25 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a36b37145fsm1055887b3a.22.2026.10.26.02.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 02:22:24 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
To: xiang@kernel.org
Cc: chao@kernel.org,
	zbestahu@gmail.com,
	jefflexu@163.com,
	dhavale@google.com,
	hongbohbli@tencent.com,
	guochunhai@vivo.com,
	giuseppe@scrivano.org,
	linux-erofs@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	zhanxusheng@xiaomi.com
Subject: [PATCH v2] erofs: don't reuse a superblock for a mount that passes device=
Date: Mon, 26 Oct 2026 17:22:17 +0800
Message-ID: <20261026092217.2129604-1-zhanxusheng1024@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <at8UCyjlHgxxBAaf@MacBookPro>
References: <at8UCyjlHgxxBAaf@MacBookPro>
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
v2: fold the check into the return statement and drop the comment
    (Gao Xiang)
v1: https://lore.kernel.org/all/20261021083826.1870937-1-zhanxusheng1024@gmail.com/

 fs/erofs/super.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/erofs/super.c b/fs/erofs/super.c
index 16fa3b853f1b..8ca44b1c0bd1 100644
--- a/fs/erofs/super.c
+++ b/fs/erofs/super.c
@@ -827,7 +827,8 @@ static int erofs_sb_share_test_super(struct super_block *sb,
 		return 0;
 	return file_inode(sbi->dif0.file) == file_inode(new_sbi->dif0.file) &&
 	       sbi->dif0.fsoff == new_sbi->dif0.fsoff &&
-	       !memcmp(&sbi->opt, &new_sbi->opt, sizeof(sbi->opt));
+	       !memcmp(&sbi->opt, &new_sbi->opt, sizeof(sbi->opt)) &&
+	       !new_sbi->devs->extra_devices;
 }
 
 static int erofs_file_get_tree(struct fs_context *fc)

base-commit: 52dceb88082b4c7983d1c8c7de1c181f018055ac
-- 
2.43.0

