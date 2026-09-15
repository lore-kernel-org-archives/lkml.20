Received: from out162-62-57-49.mail.qq.com (out162-62-57-49.mail.qq.com [162.62.57.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C3B3A1A55
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789463096; cv=none; b=mQa3RDviXtEqxyzMS3j5umEJpo8BHKLVXxJwl5MtxoLaOr4PY6scKRyMFedy32KI22HgZM1U9mYz/muwNQSWZwoCYLqKoD5DTqUlA41vBUIeXMCZFSE4GtH3cigbVT5eWL3D86+wAOwyRMRdBH8k1+QVb3+NrC+O4ix48PYBaa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789463096; c=relaxed/simple;
	bh=slwCTfyGtFEkbOKCo5bVfeyGm1DOvwjOyySd+b8MD0U=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=aL7sMOpEypzE5OwimPoQKC7tOyoQmf1FmVoGH8lchfY4vz//S1lU2qa/qPEeQvadr3U5jDkqJ5sI5NK/1KJ4TVPgtDxnVxLvr4klo46dinEteC/fBuA6KrAO8ZTpNcitX92dNU2F3zEgmMISnEQW4w0KsLokgc7ghOx9ka5x+tQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=ryQmUQn+; arc=none smtp.client-ip=162.62.57.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="ryQmUQn+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1789463089; bh=Q7wi6r9wAePoWVCptBPKcLKqO0Nzc9N9NB8MrkgmWxo=;
	h=From:To:Cc:Subject:Date;
	b=ryQmUQn+MABfd6Kli6Jq5yz5Ocr1UaQk+ze64EYDTD6jQQZlplSwHnYS47H8HWQdT
	 PpfHrSGAlyzhPSYIyggkLFVnNyvqwyzXko9dLqRHu56XkU8F/4tf7OaTS3jkKZXa4A
	 wP/HkdqTrxFgKgKThWuum+Pjo7AHybtSAkZhv9GA=
Received: from winnan.localdomain ([2408:8207:7883:f750:f55f:bb89:a2d7:fb33])
	by newxmesmtplogicsvrszb51-0.qq.com (NewEsmtp) with SMTP
	id 12E94204; Tue, 15 Sep 2026 17:04:46 +0800
X-QQ-mid: xmsmtpt1789463086t9soi69em
Message-ID: <tencent_FC9BD4844FBADF31F931DC723D8F4C3E1808@qq.com>
X-QQ-XMAILINFO: OTDiW3m6JtSJAr5KUinNGlyDnf8h29tlDnDBzEmlhhpm6TSgUqEfM+n5gTcjfo
	 oa2ok5p7JxStcKx8CtV6Uz6t2oCBQgjIVIXq6qI+vo2KhrRAdO4g55GharhrONzFsnJTb+OHI8fh
	 AuuIOZFX/cSbGfDkI3keyAFX+CnflcMgANAzmuX37O/01eXj+5h6QOL3wzoqdjSE8xXPB7kpvgaV
	 BXyNZYrUkmsf8ms0KqrAAA9OdPKCphUZxdFHHtEBMdNOHM6R6V78gQICvfIkLccgWuWWES+cMI8B
	 o1ZdUn0z4d8lWc3HEauSQprZx07t86Wbpdq4GN37t8v56yvrOo3cJgxXWHh9OBAAu+mpbh0TwNoL
	 xWO/5psnCOlk1pc6kZPHM6Dsu0qMDvFP8Oc4/rVzy5gFOO1iqN+60664QuqEWH4+Me4SgJO1OLk4
	 cAhw2+wU7BSTLLg43VRj152qFG7C9EWvpmaTnIQNLWl03HxRpzDHmKifpNm2FbEnr366U2IFMlr2
	 mHmetMJjO3W8JV52QPYoWAkDg9oouvNDjsNbiatt1V/9bBbOF87D/89AYVbeGMhi9A9jRVAenLph
	 Y+tgtESzjZJ3y6ihx28noxnYaYzd/iD3vGHJB5RvgNuNPiJihuoyQ7ZedUODh5vlzzqWYrMHUj5i
	 3eyacnWmAyaYia6Fm9FT8j8no1FPboJKHkgS1QMLeLO1L40dYuF2Hm2iAow7FNbnKarU/XrWSJyd
	 3oQfT6vxxGChVBGiNEw/J+UpfSiSMRG5jd82f5pxbQu3Ct5m/Obt5/oqgivjeGos43lrJeS0TZ4C
	 m7+S/M/8qfXyd33ksETgl0+QOZkUBj12qIpzzMh90/zWS5lSaIexoYl0E8kyn4AZ6ybWlxknA2I9
	 febqgb7DcgWyGPHwN9vJxiQigWyHXQp3l764slLx1cKEYeDo/cHkuhjeUtwkTeMaB1as1TjKXfmj
	 hn4w4IGVGAC4+fuI1w6TpblGLU6qQGdQYviLKECsRH6sKapTJztl+6lMjAkCdW33WPrWqQrmR921
	 M53/XfscCg8VD280lkLrc4fd9FdMaz3M+YaKie66dnoqr3DZsWSbikGLEKimI=
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
From: Xiaonan Chen <chenxiaonan101@qq.com>
To: Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Radu Rendec <radu@rendec.net>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xiaonan Chen <chenxiaonan101@qq.com>
Subject: [PATCH] irqchip/gic-v3: Fix typo in eoimode1 comment
Date: Tue, 15 Sep 2026 17:02:43 +0800
X-OQ-MSGID: <20260915090243.170981-1-chenxiaonan101@qq.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop the duplicated word in the gic_eoimode1_eoi_irq() comment.

Signed-off-by: Xiaonan Chen <chenxiaonan101@qq.com>
---
 drivers/irqchip/irq-gic-v3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
index 6e1fa5b247fc..69ca208eeee6 100644
--- a/drivers/irqchip/irq-gic-v3.c
+++ b/drivers/irqchip/irq-gic-v3.c
@@ -687,7 +687,7 @@ static void gic_eoimode1_eoi_irq(struct irq_data *d)
 {
 	/*
 	 * No need to deactivate an LPI, or an interrupt that
-	 * is is getting forwarded to a vcpu.
+	 * is getting forwarded to a vcpu.
 	 */
 	if (irqd_to_hwirq(d) >= 8192 || irqd_is_forwarded_to_vcpu(d))
 		return;
-- 
2.34.1

