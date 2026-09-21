Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA0433938C
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 04:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789964718; cv=none; b=O2qdnEdhSBgzDrmaVvPWLAtORZ7a9NL8TOtpn7BHFtg64hqLAPhDkqCglO/aAoAjfHNIaQ2fc9MHr8Gmw9UhdhohSwsLgPLFRiAwQeyaJrxFJ8bKc/3HEHOW2lgZzzYLoMXKVlr6NjJ8HDD5a1Whr/HiBHU5bHSe1vU4Gk3sFAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789964718; c=relaxed/simple;
	bh=UXX242uwM9CJbd75dgBpovw7CdyRLI0nhFevS4pmY30=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=swwUDDcwucWbHGFm84fZMSp8NuTCDeeBbrLVH/AzmzwE/Eqc8llYu1DTLiXBCF/jnXut3yRvNgLj69jTjnlUJX2E1Lf4Xf1ac4SQAfqD9T+5BlAcAZ4ejUZeJFoe6ZQeKEL8ryULCAVhLbpscVwlcH2XM5TPq8hUMPg3NtoMq6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AYZIovRZ; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AYZIovRZ"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-398c066106cso1958833a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 21:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789964715; x=1790569515; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KlcejhybFRwk+waXcujN7WP0JBvoJyfPnbBAG+LwQp8=;
        b=AYZIovRZoyIsUjyI3U/Z4K4eWjMmJ3TNkBIREnYW4m97iy1yqLPdxVjaWepLcxvM9Z
         k0DJMAmW93hnBL36osPKT2sxw3E/eC4Te+nHiD/aU9cnotZix4LPwlV4OmfkHqXfD3+/
         7FJv5uc9ts5aYh5WcZBzDEB184slHv6028uHiOuCFrLucXF/d5SASqe/JhETxxFHOsjH
         zwQug/GI6lgh4aUap2YCeI0UL9LmsNqfDtUL9yw9R/TE51GN/LEei/HSY370NamadSMj
         6d71YovcZnGL8LShcuiPWSASjnnzsaqqQ40WAYwhtLJuuoNCevhyANoLsLW1ftMXJ566
         qYNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789964715; x=1790569515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KlcejhybFRwk+waXcujN7WP0JBvoJyfPnbBAG+LwQp8=;
        b=ChAkOmnWyQcveyPkNhF/G8XOYjfszBqO8ct6RURp9/C4fpamAXhxeZfteqEdE7xFXP
         wpG8xhq10aYiU56NUqnvQ9CCYvtRQ3I5cU9JNkKVDh/6rv4HDSu52fzLkTwDBHhGg53J
         UJS7AHX7b62nQCZ3l8+40LMsoMJkspaD/85612XcEpXvQ3NXbboZ0sVGmPpcXRwpHMUv
         4WTgb+ImMAlc0ms9NviXMMLkR9c4qhWb2GUH9uhRUt4lIKhpQj2aC7YSpuWBsZUwrsiC
         keVca6QoijLkXgTq1uZ1in2SFLIBKtahRWkm3h3WWRZVHsl1Ikl0I/69+XUGM1pdz360
         7MNQ==
X-Forwarded-Encrypted: i=1; AKwUvBzJ3hRXtmsydU/FInOEGK5tynLFO7S1SqKEDNwWYys1Rs+Cy9FbeCi/M+QMFs+IaPipoXnyIvkcqd1ATVA=@vger.kernel.org
X-Gm-Message-State: AFuF++lwG7JueFY/b4jJedOuOlJVw7thhCOjyrWnB1nEFH9lZUVU2loU
	j4GW/yBAJE+8nOE5AuIkL8dCOZG8y+4/xsWMGl71XTVuZR3oUQts7tPv
X-Gm-Gg: AYBFou0Xq/M4OfTrgZLpEizB5i25vEvafnwe7+NQYHe/cZy7J8nxyBPbCn7Bl1ZqGaM
	HsHmXmKXDr0zhJ42m54BrOPQVBWxaAy4cHoWhu6giyvMxXeObDq5pJ75iUpcahUzLs+1D65us1p
	wwDL0S8uDdMWtL6KDA6KoIINSofWKaGmR2H3ay4gbtkG0rBpADmn8sWPW7U6i/T9WSVhprLbdiF
	G+4+DRPrjOOhYBQ8Wv1580cO+lBLodYch/rARq4+FdOpGFGVpKquHNvHQ12FqPRnUd6o4oAxvsl
	PAgEgH6+kO053oK4ZcE1h8bOapDFBH7HTUWrx/Q5+seSybIbf8Ylx6qKY+Os+CBphV0l1/BSNL9
	4T+iHzrREMxDbGZ3PTzqwyffkKdeej7xdRj+fcupCfK3NQHBCm1hMSkBXndWhg47Tj/mp3C5QGj
	cneEXx/Q4mCbIZCRAeLdEuNJlSzwPQzLA4KrzGLq2lSqAaRuo0yLt3MXf9qbuG4j+444E2KWiA2
	G+4nRkEZVb4ecW1LlaxapjLx0TlnxzCCeSrYGQI7e3YZ5Mr4O1C8E7boPm6yWVDed1A+67BFxmT
	R4Sm9SzsHw==
X-Received: by 2002:a17:90b:3909:b0:39e:359f:8539 with SMTP id 98e67ed59e1d1-39e54f35cf7mr19843880a91.15.1789964715138;
        Sun, 20 Sep 2026 21:25:15 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6c5b3932sm11742139a91.13.2026.09.20.21.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 21:25:14 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: Damien Le Moal <dlemoal@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Jeff Layton <jlayton@kernel.org>
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hui Peng <benquike@gmail.com>
Subject: [PATCH v2 5/6] qnx6: abort mount on superblock magic mismatch when silent is set
Date: Mon, 21 Sep 2026 04:25:10 +0000
Message-ID: <20260921042511.1473629-5-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
In-Reply-To: <20260921042511.1473629-1-benquike@gmail.com>
References: <20260919222556.3792829-1-benquike@gmail.com> <f68323da-e90f-46a4-b3ce-70d26de115e6@kernel.org>
 <20260921042511.1473629-1-benquike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In qnx6_mmi_fill_super(), when the superblock #1 magic check fails and the
silent mount flag (SB_SILENT) is set, the goto out statement is inside the
if (!silent) block, so execution continues past the magic check with an
invalid superblock (unlike superblock #2 at line 93 where goto out is
outside if (!silent)). Move goto out outside the if (!silent) block.

Tested in QEMU against Linux 7.3.0-rc3 by mounting a crafted QNX6 mmi_fs
image on /dev/loop0 with sb1->sb_magic = 0xdeadbeef (!= QNX6_SUPER_MAGIC)
using MS_SILENT | MS_RDONLY and "-o mmi_fs": on the unfixed kernel
qnx6_mmi_fill_super() ignores the magic mismatch when MS_SILENT is set,
logs "qnx6: superblock #1 active", and mounts the invalid-magic filesystem
(mount returns 0), whereas on the fixed kernel qnx6_mmi_fill_super()
immediately aborts at the magic check and rejects the mount with -EINVAL.

Fixes: 5d026c724220 ("fs: initial qnx6fs addition")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
Changes in v2:
- Split the qnx6_mmi_fill_super() silent magic check fix into its own
  patch (5/6) and remove Markdown formatting from the commit message, as
  requested by Damien Le Moal.

 fs/qnx6/super_mmi.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/fs/qnx6/super_mmi.c b/fs/qnx6/super_mmi.c
index b8afb6f388b2..18298e273a13 100644
--- a/fs/qnx6/super_mmi.c
+++ b/fs/qnx6/super_mmi.c
@@ -51,10 +51,9 @@ struct qnx6_super_block *qnx6_mmi_fill_super(struct super_block *s, int silent)
 	sb1 = (struct qnx6_mmi_super_block *)bh1->b_data;
 	sbi = QNX6_SB(s);
 	if (fs32_to_cpu(sbi, sb1->sb_magic) != QNX6_SUPER_MAGIC) {
-		if (!silent) {
+		if (!silent)
 			pr_err("wrong signature (magic) in superblock #1.\n");
-			goto out;
-		}
+		goto out;
 	}
 
 	/* checksum check - start at byte 8 and end at byte 512 */
-- 
2.49.0
