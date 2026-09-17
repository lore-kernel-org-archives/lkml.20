Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4093921DE
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 07:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789631372; cv=none; b=q5AYLL9zoIEILg61+4a6Aba2bZY8XPl97qjNSAPSYtg3hXh1a6R70tbrjcT3U4AfsYo2pFC2S+EsrHhY1fik13JHwZJglF3dSBPOE9NzQzl7e4OFfAsA/qPA5tQzHweBcW2bs/O0dnOCphl4TMftWx58hlogOZmbcvNP/+18B7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789631372; c=relaxed/simple;
	bh=6WFtxOwbTGAnJVVIwPxyjEIJvq7yi35MlXVMFGyeNW0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VgrUDjR4n8XEpmoPnTPBku9lKCMwxlhX//ZxYlI8pHdvfoD5VO3XtVHE+FQG+zL0kR7arGaqY0fSNcNglrWyZlo9kAFDynJAk+rjMUprXMVQLJPvhqEL2jWsBvZjd8JWgeClkZrE9/8LduRkbWe+o18If0gg0dUZTrSthB8H+lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=TxSezOch; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="TxSezOch"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=3T
	Ahw8kdQ1bkc+p6ARnCv8c+rD9/bfuYAfSjbI9rJ7I=; b=TxSezOchSCRBSPleHp
	Cdt/NR9KrUKQzeMR12NCqPLsa79kxzDpiw6imQshkdVQhNxwYRi42zJWPiVOHh9A
	hj/H7FFN4VQBaRGvMxAvfCGVbmszyjCJ0ZHKUxB5wHh44zFyn7xjQ8fB5brsLAid
	Z8KFyeR04+B9Hfd+eyDP+LSjU=
Received: from thinkpadx13gen2i.. (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wC327hgm6tqF7HwBA--.39980S2;
	Thu, 17 Sep 2026 15:48:49 +0800 (CST)
From: Zongmin Zhou <min_halo@163.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zongmin Zhou <zhouzongmin@kylinos.cn>
Subject: [PATCH] riscv: errata: select RISCV_ALTERNATIVE_EARLY for THEAD GHOSTWRITE
Date: Thu, 17 Sep 2026 15:48:43 +0800
Message-Id: <20260917074843.52716-1-min_halo@163.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wC327hgm6tqF7HwBA--.39980S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7uFyxuFWkWw4rCr4rCrW3Jrb_yoW8Ar45pr
	Z5Kr1rK395XFyxArsrGrW8Kws093yfX3y3G34Du347Jw47ArWjgr4kKF4Dta1qyrn5Xw45
	XF4SkFyIkayqyw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UXXoxUUUUU=
X-CM-SenderInfo: pplqsxxdorqiywtou0bp/xtbC9AGEMGqrm2F8ngAA3Y

From: Zongmin Zhou <zhouzongmin@kylinos.cn>

errata_probe_ghostwrite() only marks the CPU as vulnerable when it is
called at the RISCV_ALTERNATIVES_EARLY_BOOT stage, and the mitigation
in ghostwrite_enable_mitigation() only takes effect if the vulnerable
state was recorded before the boot alternatives are patched.

The early boot stage is only executed when CONFIG_RISCV_ALTERNATIVE_EARLY
is enabled, which currently is only selected by ERRATA_THEAD_MAE. In a
kernel built with ERRATA_THEAD_GHOSTWRITE=y but ERRATA_THEAD_MAE=n, the
early alternatives never run, so ghostwrite_state is never set to
VULNERABLE: ghostwrite_enable_mitigation() returns false, xtheadvector
remains enabled, and sysfs reports "Not affected" on a vulnerable
T-Head C9xx CPU.

Select RISCV_ALTERNATIVE_EARLY from ERRATA_THEAD_GHOSTWRITE so that the
vulnerability is detected in the early boot stage and the default
mitigation is applied.

Fixes: 4bf97069239b ("riscv: Add ghostwrite vulnerability")
Signed-off-by: Zongmin Zhou <zhouzongmin@kylinos.cn>
---
 arch/riscv/Kconfig.errata | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig.errata b/arch/riscv/Kconfig.errata
index 3c945d086c7d..6121ba83cfa6 100644
--- a/arch/riscv/Kconfig.errata
+++ b/arch/riscv/Kconfig.errata
@@ -146,6 +146,7 @@ config ERRATA_THEAD_PMU
 config ERRATA_THEAD_GHOSTWRITE
 	bool "Apply T-Head Ghostwrite errata"
 	depends on ERRATA_THEAD && RISCV_ISA_XTHEADVECTOR
+	select RISCV_ALTERNATIVE_EARLY
 	default y
 	help
 	  The T-Head C9xx cores have a vulnerability in the xtheadvector
-- 
2.34.1


No virus found
		Checked by Hillstone Network AntiVirus

