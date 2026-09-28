Received: from mail-ed2-f33.google.com (mail-ed2-f33.google.com [74.125.228.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93C54052A2
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 20:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790626130; cv=none; b=ggLoaE9jBQACZHco4u81cUcIuuSlD1qvJtWhcSVGUa7jnUBShijMOhX8C+qejSYLc4Vi7YEew0tvJOl3Cz9DEMKrp3k6st7spiT0RZ/K/YYBelPyuaHJWC4kBfO2ekdCa5UH8oJbyAk8DNweDiLp9zlgf0CKYjRykD3UW9krzRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790626130; c=relaxed/simple;
	bh=AzdGodhxKE7DykxVHyS0xooKhsrpCAjLMp0Dm5wVvZA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gJkk/amIv34mgD5PQ3IxbMdepR/dQt8WuYM5nGbkbafL4pMgflTJii5QXlULI9eDmZ+fJI39QOpSzbrLbTKVQUy/KwnLb6NYNQ1oI/9YMGz2GIvpxivJovQtTZzhXLV3nl6F6jzTJm/kRaDpOFo20fm1uoLELNEtLRw3gwAoi6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RqoUdbVo; arc=none smtp.client-ip=74.125.228.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RqoUdbVo"
Received: by mail-ed2-f33.google.com with SMTP id 4fb4d7f45d1cf-6ac6f5c507fso2281069a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 13:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790626127; x=1791230927; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CE3tEgZ4a44KtqLZ+CTK+zzBvwh13usPnMe5fmHTEY0=;
        b=RqoUdbVo0WMwpRDmK1sdxvJydGhZJijtpBo/xOFGBn2FJj8VoPxhcVYHZ0H5e0QRJS
         z5Vv4V9czbSK52bApuVIfJhd3w5JGkE97qH9TKgptHRJQHJ09Gja+XKRCCgRcNDAfsnJ
         lfY7jEBY1yZtopfhlcb+aexUzPjFHn4GJ6t/TsHI5KnYvGdaZd2U/6dBc65Jd/B52ReF
         qcAOMOPsQLM9y76c4aVuYnTz4DA/DbOUPXjshVXGkHAVayLrRxyKYJwWU01I0K8/+KfX
         2iybwoOtYE3i+jRKmqji6uUDQclchT6kN02DCGkctTAwnwe4G2Kuacsi2nzyK+lcTdfj
         Jm1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790626127; x=1791230927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CE3tEgZ4a44KtqLZ+CTK+zzBvwh13usPnMe5fmHTEY0=;
        b=vHeLOZtdDbp1PDEquaehbFGtklO7SSsWnEGnpmkalhbd7NwjZPHmM3dgR6sngm1V1G
         1TrDct02qiFEd9bZx4Lghyd53d4l3580gTNTsYIvqA8y0Y2DlhIoxZHBWDgWxvjfHhZ1
         UYPWw44vCN/rcBVzeWN5Eq3vJ+1p/eIRtfZ956UqA/RN28/cDEVct/AFjDYA+rpkU3MP
         Kg2rXVAlCjgW8cJTz9rKQMwF6EgIeVwJkSmohdS/I1BWAReLWvMhtB+TsFU2edZRHPY9
         M6qv2qnIhJ/S5Pm4vvYIv/uiS3p22GhPxNzRWzDxd7Qqz8Ik9mA4tPgNf69HRDJgn+2n
         a8ew==
X-Forwarded-Encrypted: i=1; AKwUvBxnxoLMATDVock7oQ7PoGM5c7U4cxp5BftHeLCYk0zcorlYwcvT2ZCkoxzrd7vSsW669HvHT7VhNj6SzLk=@vger.kernel.org
X-Gm-Message-State: AFuF++mQDibf2pjBQbea5tw9omWn3iT0o4bBTfxvanFLFzLOB0HT2FmH
	4tuXeh12j+xC5tgGTvg+KDqTUHRVXCS28Q/wlGqH4Of/xcJjoxZ8x76t
X-Gm-Gg: AYBFou2RLXBWFQg3hl6ZNot49MmLgS+VCnos9It7XoYhlaJhw69cj3k9YCqrvUYOYiH
	hfPI9bFWMKB+j7C4s+ve9o3Wnal38DqZTt0RbmCtF1cA7bqE8ETjDDbytF33AxxEje1FkHsk4sx
	a2UelNNfZbj5rp4l8b5Nip+bVSvPUyPGkiec0aCjkKE5x51ilrC6NqOi6d6bjJpE0eI6krQ9baf
	nBROukLdlpZ1/jdJq8AKeoWSuBRZe8BDWJyihaWKYVSt+zDFmarNEOFuIq8MlOrWWxub+6VLf0w
	DQWwtVOnl+PnPvscc80KxZKfOhCJNp+y9FdaTyMAVQ3IRkrefz98/8cIf+G+G3rDfOnnqrmPtMK
	no9Pvo4gD37cEwNtEpR3+1i81tofp9H90jrp5+DfMpX/IPWCxtinzwRe7eGqc7YaaCABv+bNIB8
	190NrFzVSCMRfJZ8gzI8w/Gj1aF5/UWN6V+nGtGP+IAZZYL9Prquj3TpmEE+D9L3QmN5K/HBfZg
	wAIkrtWxVa9iVzilNGUkh42nfInGAF0RIgG7LU0dVu4uqgctTKC
X-Received: by 2002:a17:907:1888:b0:c29:286e:2e3e with SMTP id a640c23a62f3a-c2ac25ef36fmr1148656566b.38.1790626126915;
        Mon, 28 Sep 2026 13:08:46 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ae76abc3asm509778166b.37.2026.09.28.13.08.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 13:08:46 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: davem@davemloft.net,
	andreas@gaisler.com
Cc: linmag7@gmail.com,
	sam@ravnborg.org,
	sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/3] sparc32: advertise relocatable kernel with HdrS 0x0300
Date: Mon, 28 Sep 2026 22:06:24 +0200
Message-ID: <2ed67cfac2dd3847de19eeba566254593a661e93.1790548064.git.linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1790548064.git.linmag7@gmail.com>
References: <cover.1790548064.git.linmag7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

HdrS version 0x0300 tells the boot loader that the kernel supports being
located somewhere other than physical 0x4000, which is where SILO places
the image on the traditional path. Anything older is copied back down
there, and refused outright when it no longer fits.

sparc32 could not make that claim before, because setup_arch() took
phys_base from the lowest memory bank rather than from what PAGE_OFFSET
maps to. It can now, so say so.

Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
Message-ID: <20260928002035.1-4-linmag7@gmail.com>
---
 arch/sparc/kernel/head_32.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/sparc/kernel/head_32.S b/arch/sparc/kernel/head_32.S
index 8c320fa25a67..11a1746829a4 100644
--- a/arch/sparc/kernel/head_32.S
+++ b/arch/sparc/kernel/head_32.S
@@ -69,7 +69,7 @@ sun4e_notsup:
  */
 	.ascii	"HdrS"
 	.word	LINUX_VERSION_CODE
-	.half	0x0203		/* HdrS version */
+	.half	0x0300		/* HdrS version */
 root_flags:
 	.half	1
 root_dev:
-- 
2.43.0

