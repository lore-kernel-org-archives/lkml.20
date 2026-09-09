Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3467B3C4565;
	Wed,  9 Sep 2026 07:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788938429; cv=none; b=hNJ04VjTxOYPJtdhHkaJnFMWcar9kX3cBGleIO4legDeLOLEWYG7+25FmovTacyKvhRwawyFpswucymatiPqVNuZr/y1wxd4WBSGKBd87nV5cSCGWwF4JstCygMk5uCt8fH2B2GlYzFXNwMt5fI3isOzQyni+g2rk+IGgCTkvdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788938429; c=relaxed/simple;
	bh=IrThw0TgXmL+dxcTyN0U13yMKNIP/RG0PdaC4NjorhI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Vy4N52w91DWXJTqzx+3TCQmHoSk+lb7dqBss8peX0a5qicAZGNP0vGretgiDfcRVFjpM4e/OSLgrD2MeF5Sc/XQB6NxzwklFlvKQvmgbQHuHBbBD/x4hcdBF7nnpRhls2qYKEBmvxtayuSd4/OmQKVdEpR5peOB5ICUA1wv0zhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=C9Qt4eYd; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="C9Qt4eYd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=AB
	BSTkh9q3qbBgXCVORABM3uhato7TK6qhSRRxZrVqY=; b=C9Qt4eYd8wI/U+IBFp
	Z4/AyJy05/3QO3P04iIm18ArObaOj8tWPXLZFFYxrixj/hFj+7JD/rEeS3x+S272
	pz1usZeNOmMzTuwKX6rxvGJ85qZhkvn6Fzijouu5mNkKNDCN6asfCSxY/jPHF3C2
	GeZ7W0N8fSqS34ar6U7OIKyPk=
Received: from localhost.localdomain (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgD3vwyJCKFqxWVfPQ--.24733S2;
	Wed, 09 Sep 2026 15:19:38 +0800 (CST)
From: kensanya@163.com
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>
Cc: linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	TanZheng <tanzheng@kylinos.cn>
Subject: [PATCH] EDAC/ghes: reset DMI scan state after registration failure
Date: Wed,  9 Sep 2026 15:19:34 +0800
Message-Id: <20260909071934.314577-1-kensanya@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PSgvCgD3vwyJCKFqxWVfPQ--.24733S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKF4UXF1UJw45Cr1xWrW3Wrg_yoWDXrgE9F
	W8GFn7GF1kCa9xKrs7Ar45ur95KF4q9rWfXry7ta17u3WrJFWDWFs3uF18WrsrWrWxuFy3
	twnrt34fAFn8GjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8veHDUUUUU==
X-CM-SenderInfo: 5nhq2txq1dqiywtou0bp/xtbC6QonA2qhCIpYbQAA37

From: TanZheng <tanzheng@kylinos.cn>

ghes_scan_system() sets system_scanned after the DMI walk. The unlock
path always kfree()s ghes_hw.dimms but left system_scanned and
num_dimms set, so a later ghes_edac_register() skipped the scan and
indexed a NULL dimms array.

Clear the scan flag (and num_dimms) in that shared unlock path when a
scan actually ran. The next register() will walk DMI again.

Signed-off-by: TanZheng <tanzheng@kylinos.cn>
---
 drivers/edac/ghes_edac.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/edac/ghes_edac.c b/drivers/edac/ghes_edac.c
index d80c88818691..b0630f1a2815 100644
--- a/drivers/edac/ghes_edac.c
+++ b/drivers/edac/ghes_edac.c
@@ -499,6 +499,10 @@ static int ghes_edac_register(struct device *dev)
 	/* Not needed anymore */
 	kfree(ghes_hw.dimms);
 	ghes_hw.dimms = NULL;
+	if (system_scanned) {
+		system_scanned = false;
+		ghes_hw.num_dimms = 0;
+	}
 
 	mutex_unlock(&ghes_reg_mutex);
 
-- 
2.25.1

