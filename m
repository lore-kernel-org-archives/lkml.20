Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6DD8155C97
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 13:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.16.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788701431; cv=none; b=ryXZZc6rbRl5gGL36oU0SgySxvH4tIMBObBlgWAj82VmVnL+GewVE+IkHsKT9tZFo9AavrasTxs/RhOxLAHpPMtwzKUkUa8jOU3HH7qjGR8d9ZDQNo0QHI3WKB0LwHfXcaeilBbSIqniz9MeLGCMEK3iGO1ngk9lcCtFrC03cLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788701431; c=relaxed/simple;
	bh=q8NPgh2AongVC5ji9dIdBTKB59XNafcA6arnzRGWaXg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=H6PGlVyuS+utvCwXckYl8sbi+dQStpgJqLTaj1hTjCvBbrClQx36AfPBOtmNAQmzzD5UZqHGyADNq2Al3cSEsowgDzL4olMTa6eAhfnMEuksVnQxhGrAmDqkNXvH6Q602pDTHoZhHMmyah6zVUYjMYxw1p+GBV9aqc0KT3rJ/c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=JuVP7VMQ; arc=none smtp.client-ip=54.206.16.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="JuVP7VMQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1788701356;
	bh=+S8ttCoCMy97kRUS5c0xmIv9QQhnjS7Q0Eixl0YMrw8=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=JuVP7VMQxBuw1B0UsbbfbJEtw8fbz5qahd3zNK1hZyWIUzeXNvaG+Jw2TJVqWkxg2
	 nNTSmlVY4CPHdIfZy97u2df0kDU+tbtJVEjEWAih0fv6RyZT/8yMH5HJOru4PRhJAk
	 IZ6Z9n3AmVjKSJpkZhoLvED+ZY/vmQrZO254ArVc=
X-QQ-mid: esmtpgz14t1788701352t8e9fda0f
X-QQ-Originating-IP: 8l7GrQphbZsRqienUxFziZMX9t2dpfGiPcUVVuTjKJY=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 06 Sep 2026 21:29:10 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5099097618670319179
EX-QQ-RecipientCnt: 5
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Sun, 06 Sep 2026 21:29:08 +0800
Subject: [PATCH] MAINTAINERS: Add Troy Mitchell as a SpacemiT SoC reviewer
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-spacemit-add-reviewer-v1-1-b2ebba238ec5@linux.spacemit.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CMBBG4auQWTvJQEKtXsW4KO2PjolIOqAkh
 LtbdPkt3lvJkBVG52qljLeavoaC+lBRvIfhBtZUTI00Tk7i2MYQ8dSJQ0q8F/gg87GrnRPvpW8
 9lXbM6HX5fS/Xv23uHojTPqNt+wJwmDj1eQAAAA==
X-Change-ID: 20260906-spacemit-add-reviewer-7b1660880f58
To: Yixun Lan <dlan@kernel.org>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=794;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=q8NPgh2AongVC5ji9dIdBTKB59XNafcA6arnzRGWaXg=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFlzs5YYX9U8uvNIYBnvk23ez92vzj2aNeVUUSf/PbH7R
 QlBxezZHaUsDGJcDLJiiizdD3i2FfhE2RYIFPrCzGFlAhnCwMUpABOZ48HIcLEm4qTUQucToicm
 pK8+Od3toh77/Bu7jyYZ3lvw7fKshB5GhtMtzbyfi7Y1HDPyk5wZvnKX0aV82aTC+Mg86bCFz4s
 P8AEA
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NM/Va/AgX/pNu5n61BjJ6zN9zwGi6/60hEcObO8TLskYdYwjaxZYV2Np
	A5ZDLKrV7vFX+wDg/4x3rUj93IRNdoocJuWUvjTU68H4GMJF/8yVvYzGbJ6nJmPXkk24a3a
	OwZJUIDzTRpEy/aIJzcJeycudMU1roqyqy+1CzJCOPuzFRmKnV/4luPPtmu+qStohRQkSWR
	g4qdFZ9P/WSicMzhYGWpAAIZ9xjbbtD67j4aCkRB3IV+72cpx9ZXpadTqNGCQCc67dp75f/
	539ldu8wC+G034+TULQWn/0wJ/otgKCVyU/K4XEL53m238/lhdNTxGDKpFlmo34iXH/Ax0c
	dCIvjlLpGBYQM6Ufsuce3YzlTB5B4OD/WE3UfNeiz6IvQa5tINXk8aDtx2yR6BQXVgjootM
	JTL+u8VP+fM7i4bGmZOoecsEPxAV7sUlG3IDmtY0f7NMVM/xW8bnbcAoDxWU5c5YMcp2aWy
	hL23+LerIfswvMOM/a+CqJwmTvi0M40w8kTAayYHGu1zwtA+2v9fSC4PcaZ3zAcBT3QeTIZ
	+NQNxSoqGLN0wRmsGj0e7y5/N7vPosE3uKfWb0Rhe7DDEhTXef6loC9yUfkKdK93aIrciXT
	dv8yn3+Udk1DFuYO9qvP7tyQBNXnSUIalm5sUE3R0nQpOFCUCjJPmoDZ1Wly1YU/hhNPZ8X
	kaTSAoT+D0E+JmRNROsGd1eNjsMsOXBfchKMo7wTUcYskDahjd44a5IjsytRQZkSG1L7y4G
	z4RTX0MyruVWs4Yp1Pp6KYwueOZAhUvVJvEcZBzTIYmGO9QuKWNSQdn8RpND3g0zExL1z9M
	DRggxIH0QzqqsDkymA57lw/rzjigYG6xlW3OYBMewQ6fFZjSRX+CsADOiJM2wlvOfM4rQLu
	0jpd8zbNhJDk7R1k81IJcf8QctEeavwZgQujJnXiNyZCAQxRZeq5lXKLtY5QV5500jCeOjO
	5ShzS3oHqnkHJVUwbpWAGIeMnZn6oSuiFQH8Q0RpFcyW0uZMr6x/s2YlpLbUf0UGZZvR/hQ
	IzmXLR0aF+51kUZox4K3iGqaiVdBzhQSQhaqc/IhwOhA+t+0rAUypIlRLKPkuND47nerNih
	C1cLDcLdGXWpAShXsYXHX5oKvjIw+Gf0VutKhSMQzRq
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0

Add myself as a reviewer to help review patches for SpacemiT RISC-V SoC
support.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3a19da74d00c..97ca10e2b7b7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23589,6 +23589,7 @@ F:	include/linux/mailbox/riscv-rpmi-message.h
 
 RISC-V SPACEMIT SoC Support
 M:	Yixun Lan <dlan@kernel.org>
+R:	Troy Mitchell <troy.mitchell@linux.spacemit.com>
 L:	linux-riscv@lists.infradead.org
 L:	spacemit@lists.linux.dev
 S:	Maintained

---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260906-spacemit-add-reviewer-7b1660880f58

Best regards,
--  
Troy Mitchell <troy.mitchell@linux.spacemit.com>

