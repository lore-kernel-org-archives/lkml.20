Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AACE3C4B79
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 14:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792075786; cv=none; b=FcpP+Gs2JDurcJP9HHpAze4vmuk0CqBh99aebhd814QA4ygv9q4s4+rWSXGXt/+rwMG7J+blFjpRDrP8Lf7ibcxeyXZG59dcOBtPQFMhTOIJ1YGgTuzak7zH5IDcMgY5A1ZtI4hayzn8PzXtPtRDKjFQOpSikjKXYmubggvir+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792075786; c=relaxed/simple;
	bh=kAMB98C2TO+dg0RpAZ18Gg4F2DJAMfSCQrSzGZazOmA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Td7/xMYHt71el990rIoxApz7kLhfpS9P47Nlp3u9eVd+QVfCpw2cUt+bHIPkcOqC+zapEHBK/NLwMwtmlj1byc7du4BpfYU/L7ceVztRZtImWVevPYcuhSzt+XCC5pN8pyiY3q7YutHmLarJv4RH93KkLSRQCj1WifjEwkbD8IE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu; spf=pass smtp.mailfrom=cs.unc.edu; dkim=pass (2048-bit key) header.d=cs.unc.edu header.i=@cs.unc.edu header.b=KuukSs23; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cs.unc.edu header.i=@cs.unc.edu header.b="KuukSs23"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-93e63ee7b4cso452968585a.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.unc.edu; s=google; t=1792075782; x=1792680582; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WAcdpcTpnQbvHYYEUHq7bhjUU7mNPvOKc1GObp15GFQ=;
        b=KuukSs23oDQ/EusgapzJfiECQBPqhI0oep/R1++k391hryAAHDJChRLm6GZkjjaYyF
         QFvVoz4CHgZ8JGs/E9w/Z+ouvcKZFOlYtLT+CNeggxPSgvzWEWbd7Fls7lunj9zLtt87
         I9QI4U5/Cjy52G1MPHU68RgC4NjHTUMvTMN7Kt3CMNnK8s2u7y5gAbkL93cBZsUR3N8p
         cGlTItcAuxvPqZSQ/knmGq5ALnD5wxpCimprkf3oFF4hwPIx0drdRPq44CRtanf4c68z
         baSrmoRBhmtOUDrhDL7qqV8984mhUzuweEz0Mchxi05mkkXPzXvXh8/lRiQe1btCgkq4
         XeQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792075782; x=1792680582;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WAcdpcTpnQbvHYYEUHq7bhjUU7mNPvOKc1GObp15GFQ=;
        b=l31K2QuBstc/amdbx80Jz1VLjbKdeD6jjqoxbV+edcHoxTKEoYn+32vOBrsDhHBW71
         +wjWmQC4Kls+FF+zUb3I1P42RGQXcnAIM78zRUT//r4xSpwu0AZmKGB5z4TYS0PV0FwU
         QFDOdRPmdyDtlxiDIPC9MDzP+/CIEFqLdwqtNJwrm3tELEfc9SVOYYxGbFz+3CPIQVtM
         r2zPHAjX5powLV7mkVs+Cov7G3XZ0q44e71wUXn8N7ci/lBALQ9ThPaKtY2aLLtLUCxx
         doVEntReQrynq2mf9l4kTE6pz8Cany7G4P2NwOWSevI+B8249YPfIh8nqUqCT7cev4Z5
         sg0A==
X-Forwarded-Encrypted: i=1; AKwUvBy8QYdYmjw5kyR5gxPgcMIFSoQCS33ZcW4xJ/a9pO4wT0y13KIAwii9vTZqfZ4WVUs2FgmAU0GBjiY2HpM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLG/bXreguFcZpSrZrEMPJZgUa4FyhFUaoOBtbvNpxoC6BGYhn9
	cqYz1JaqF4PQ6isLUSevvWH18FC8j/LsGjLGOG9z4SbN0EZ4og4mXPOifQSxq0UFeQ==
X-Gm-Gg: AYBFou33pJ/lbuSEIJUzMpA3ddZDKu8JHXOOVlp/NLUt2TpckRGsHH1ReSFY7kjRKby
	mwmjUnQSC+6xIDQKa/4nvIoGp5ysrcd+ZN7W/K++LIpJ2OJSj1j4+opX9OI7phybLlP+c5uw6pz
	GTopTUA9K2rl0aqLcKiXOPR7ZKmhh/s/gdGXDsBJC1glAeglQ7tmSpkYHWka5f278egaF8MXVhu
	4qXxO+21QNpsy6BgvZG1eojODsZhWS5WF9ZkGeNpxGcO2tnOsSYPZtZjsJuPu1ZGsDH9Zo8Vh2w
	ElKqlMyzc9TU3grgk/DbR/iHtzX0G8dqR7iByEGiBQfr5mnfbe2EbRBOjUPoaUhUcPT6q51yxDL
	Shh/a/DhaKiC7TcWDDAR/2k9uJi8yzo+DDTrlMkc4zX0WKdZYZ97BtaHbRFKbIpuhIxRakzVPik
	m6q5jmNiIWpKxk30MHGOoMStgjHyJ9Bx9z//Rl+axe11HB1XUP2SWSQcCXGcEfodn7Ps1RekduK
	D0dhnQBqj994CcJmf/S
X-Received: by 2002:a05:620a:4454:b0:939:6dea:374d with SMTP id af79cd13be357-93ebd22f201mr3559144585a.49.1792075781768;
        Thu, 15 Oct 2026 07:49:41 -0700 (PDT)
Received: from cobra01.cs.unc.edu (cobra01.cs.unc.edu. [152.2.130.143])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93ef50295edsm790347085a.22.2026.10.15.07.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 07:49:41 -0700 (PDT)
From: Hengyu Liang <hengyul@cs.unc.edu>
To: linkinjeon@kernel.org,
	sj1557.seo@samsung.com
Cc: yuezhang.mo@sony.com,
	chizhiling@kylinos.cn,
	exfat@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] exfat: fix reading a directory whose FAT chain is longer than its size
Date: Thu, 15 Oct 2026 10:49:34 -0400
Message-ID: <20261015144934.1800240-1-hengyul@cs.unc.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 08cf4a8181b4 ("exfat: use exfat_chain_advance helper") made the
directory code walk the clusters of a directory with
exfat_chain_advance().

However, exfat_chain_advance() returns -EIO once it has walked as many
clusters as the size of the directory says. The FAT chain of a directory
can be longer than that, because some cameras stop updating the size,
see commit 1e5654de0f51 ("exfat: handle wrong stream entry size in
exfat_readdir()"). As of now, opening such a directory fails with EIO as
soon as the chain is two clusters longer than the size. Reading a
directory that has a FAT chain after a seek past its end fails with EIO
too.

The issue can be reproduced with an image in which the size of a
directory with 200 files and 7 clusters is lowered to 2 clusters:

    mount -o loop exfat.img /mnt
    ls /mnt/d | wc -l

Before commit 08cf4a8181b4 ("exfat: use exfat_chain_advance helper"),
the result is:

    200

After that commit, ls fails with "Input/output error" and the result is:

    0

This patch will make exfat_chain_advance() follow the FAT to its end
when the directory has a FAT chain, as the code did before, and keep the
size check for a directory without one.

Fixes: 08cf4a8181b4 ("exfat: use exfat_chain_advance helper")
Cc: stable@vger.kernel.org
Signed-off-by: Hengyu Liang <hengyul@cs.unc.edu>
---
 fs/exfat/exfat_fs.h | 28 +++++++++++++++++++---------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/fs/exfat/exfat_fs.h b/fs/exfat/exfat_fs.h
index a9131fe03302..f324c4cba26a 100644
--- a/fs/exfat/exfat_fs.h
+++ b/fs/exfat/exfat_fs.h
@@ -623,19 +623,29 @@ static inline int exfat_chain_advance(struct super_block *sb,
 		struct exfat_chain *chain, unsigned int step)
 {
 	unsigned int clu = chain->dir;
+	unsigned int i;
 
-	if (unlikely(chain->size < step))
-		return -EIO;
+	if (chain->flags == ALLOC_NO_FAT_CHAIN) {
+		if (unlikely(chain->size < step))
+			return -EIO;
 
-	if (exfat_cluster_walk(sb, &clu, step, chain->flags))
-		return -EIO;
+		chain->size -= step;
+		chain->dir = chain->size ? clu + step : EXFAT_EOF_CLUSTER;
+		return 0;
+	}
 
-	chain->size -= step;
+	/*
+	 * Only the FAT tells where a chain of this kind ends. The size can be
+	 * smaller than the chain, see commit 1e5654de0f51 ("exfat: handle
+	 * wrong stream entry size in exfat_readdir()").
+	 */
+	for (i = 0; i < step && clu != EXFAT_EOF_CLUSTER; i++) {
+		if (exfat_get_next_cluster(sb, &clu))
+			return -EIO;
+	}
 
-	if (chain->size == 0 && chain->flags == ALLOC_NO_FAT_CHAIN)
-		chain->dir = EXFAT_EOF_CLUSTER;
-	else
-		chain->dir = clu;
+	chain->size -= min(chain->size, step);
+	chain->dir = clu;
 
 	return 0;
 }
-- 
2.53.0

