Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A804C8FE5
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 15:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790349309; cv=none; b=RUGvgiqDCXh1SetyUxAeMCPUf7d3Knu7gwZ0hDmjwbkVd7SUrQWOTP58Uin8uVQAhGm+TT8pFKKElhX+TYWrX95C1HQTacG4CikWhJHyhxT+wY0g/yHYF0ARsMUBSp9IGyUYu009huaTDe3BuvgNxOBCEn1aq9q9PQy2TFbXMks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790349309; c=relaxed/simple;
	bh=c8exgZhRSt1K9Xf24aLucJv/jHBFcEoxLoxElZuV0CA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fQ9BA+XE86rKmzIyk9G/vvLgQXKKqbSV51eZiE9TRLXwFXhErUD+XFK+spLnALY0fItuJxaYzNWKyD4si3uYSTVRRjL5ImVGGouYpa67BMAt/Qibx9FlUB+QL/GMczyp2Jq/1EkBo/ZeIvHvlAvY/w/iaL+xIoOTcLXSI4+2u/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K1BNY1nn; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K1BNY1nn"
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-398cb5615deso835797a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 08:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790349298; x=1790954098; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B/+1mK2LTj63lAp9a9sBW+bMXSaZjbdP0wXTk6wt0C0=;
        b=K1BNY1nnnotVmMJFSnB93TlwlOquaInQY88AMov2CtswOd72N1VcYitVPze+N26WV6
         VHdhknGx/K6b6JClS/5rG0+rQ8J/MVcSRhGMJzALObDEjCJA8LRtbddN1YxfbN4qoeBW
         aviKMFbVrDQfNLw4usl4kBA8xlkBXHDTOha1wEJ40H26np3AiGaaAq4uWZLZ9Ht10gfM
         mLIipXyIQQWcoBU4RbVqwdgBxLC4J7ASzQDG32UfxzPDaiksD3f5/xbPT3Sc7HhkiytC
         91qQNA26ZjwO5ccwmfxshftU7zfDHvWchQbqdjt0n8w9gY/ETJw2gSK+ifSVo9DlnAqT
         +e6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790349298; x=1790954098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=B/+1mK2LTj63lAp9a9sBW+bMXSaZjbdP0wXTk6wt0C0=;
        b=KGP0pq/c472/Rdev04B5fOQWbBfG7bHN4EV4RMnrRMaEGFakEmKR4ahxUelHGPHVsA
         Se1NJhRvhIMvRvKEcaHmOb0KlVDdztg4HXcIc4oR7GCDgYH4wVdD4tmiA3Iv4nkt6CHT
         P9+I4AOiTxx9wrPTWpsJ/UJxUIQR61G+738GIgjVATGQCTrYWmIhvlS8PYBzEQ7NHc+a
         tWU9Zb21IaaWWfw9Y7hvzm9Fb+j72epl0UfzrUloFNn/jAvku4bkaU9xSvDvH3GPmaQr
         aavqOqduebSbt1Vrbm4YU/oe34PVLorjySe1XRZZ302Jr6ykWY6P94hOyBapD9/xrqmA
         Z+vg==
X-Forwarded-Encrypted: i=1; AKwUvBxnjh4JVtqPx8O9adCIu+RIjVyxbXGjV8VfBiBr6VuRnZ4OP3sUEeVgyZ3F7Fvw6LSpqtmd9OEkNjDvzZ0=@vger.kernel.org
X-Gm-Message-State: AFuF++mn6CUQnI75EGHqIQ6ly23pG9z4WWrIV8qcqM/0cWDDJ8krp6C3
	d1Bonux2jm2SvhTuLV6FLLWMWF6QA92cU+DC3QMsnRplnUk+rsmCpqsL
X-Gm-Gg: AYBFou3BHMh29jmc+GV6Pr4ZbzAyUmZ5H/SpCUviVZHRWYbFA7gV385cRHb5rbw/fBI
	bYlULznwUxCrW2tuFNoJSG8kaSJlXpoL9IrwE3li5ouB/WiVHVTvRPf73tsXyA3a6vKtf8Oyboy
	GIjv12TXRHTUGJuk5cGfkWE+aJCQx72cAQc++KMCbO6f944bpSuSDHhV4LrbSbFUjaCgAm+PWZ1
	VuB8TPfHyF2XW6vW96eECo5ELEkXsK11fKG2FXn6nzcKqzqb38HNS5+73Ir4kowg46COJ1S8Eg3
	ABIhtFxOOX2RazQ/Gew/pcDgtwi50KwWvdS0rFVjRYgSJdwUEKEb+tZceGpfIPYbccrDvn/94gM
	FkhE706TKI4E207k9aMhJYUoQvGQEdMBEH5+O+IiCGu+CaSwJkwf9KhW992A0vEUL4TgT1ASeLl
	c2bvY1mhD7zAoW8AIrTSfQWtIKepLXjYZ10H5Qw31yoxwmutvxfa2qI2jseWCDFKUjiYHPlTNPg
	CtWxOgUqrDhdbXulLU1t4pLF6Ghrsu93XsM/VXT1W3FppC3zLUXPDxokNxniQ0VEcYxvbloqH3x
	76a9IB/r2Pc75Mc008Vk3law/CmER5+HU4ZbQG0aVhuUY9WmEA6MzSFa4mSS
X-Received: by 2002:a17:90b:2751:b0:39e:5c8a:33b0 with SMTP id 98e67ed59e1d1-3a098fe8b26mr4789508a91.33.1790349298062;
        Fri, 25 Sep 2026 08:14:58 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc78794f224sm1503252a12.25.2026.09.25.08.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 08:14:57 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: brauner@kernel.org
Cc: viro@zeniv.linux.org.uk,
	jack@suse.cz,
	benquike@gmail.com,
	dlemoal@kernel.org,
	al@alarsen.net,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] qnx6: use the active superblock after choosing superblock #2
Date: Fri, 25 Sep 2026 23:14:48 +0800
Message-ID: <20260925151449.1517608-2-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260925151449.1517608-1-matthias.goergens@gmail.com>
References: <20260925151449.1517608-1-matthias.goergens@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When superblock #2 has the higher serial number, qnx6_fill_super()
makes it active in sbi->sb and sbi->sb_buf and releases bh1, but keeps
using sb1, which points into bh1's data, for the Inode and Longfile
level checks and for the root nodes passed to qnx6_private_inode().

The mount therefore reads the inode and long filename trees of the older
superblock #1, through a buffer_head it no longer holds, while the rest
of its superblock metadata comes from #2.  On an image whose two
superblocks point at different inode trees, the mount lists the files of
the older tree.  brelse() only drops the reference and the buffer stays
cached, so KASAN reports nothing and the mount does not crash.

Point sb1 at superblock #2 once it has been chosen, so that all later
uses see the active superblock.  bh2 remains held through sbi->sb_buf.

Fixes: 5d026c724220 ("fs: initial qnx6fs addition")
Cc: stable@vger.kernel.org
Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
---
 fs/qnx6/inode.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/qnx6/inode.c b/fs/qnx6/inode.c
index 916de1e3ccc4..0dfe8a3dab83 100644
--- a/fs/qnx6/inode.c
+++ b/fs/qnx6/inode.c
@@ -407,6 +407,8 @@ static int qnx6_fill_super(struct super_block *s, struct fs_context *fc)
 		sbi->sb = (struct qnx6_super_block *)bh2->b_data;
 		brelse(bh1);
 		bh1 = NULL;
+		/* the checks and root nodes below must come from #2 too */
+		sb1 = sb2;
 		pr_info("superblock #2 active\n");
 	}
 mmi_success:

base-commit: 40288c9206c17eb66a603262e06a58d300d0f279
prerequisite-patch-id: 46f959e08f10dc22aa50f0dcf3b666bc797e16fb
prerequisite-patch-id: d556417ccc538855b2090601ca20abd209019457
prerequisite-patch-id: 66d4e443988c07ddde054c867da5ebdbb34c2489
prerequisite-patch-id: 873f6449aef25a36fb2a66da92cc2eb4f0a23d12
prerequisite-patch-id: 51ea17033b2899bab8950a36f880154df18a4afc
prerequisite-patch-id: 0a0f17ec064751ffb6558cedfaff3be7b2a41f79
-- 
2.55.0

