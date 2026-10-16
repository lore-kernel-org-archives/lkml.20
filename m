Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4423328DB55
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.34.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792121987; cv=none; b=g4/wNinYj+qNbImjjolkAWWrv906dSoiUuv1TmjYMwam9fAvc72eGmJzMJEF/kYCHuuFWTcjbZXv1OL9zc+kxExgIYtcfzLgLko7sDk8R+9sWiH9zE8Cs1C4sLnVj8wcNHSM3kf9gYCUPIpbqbwurnZLlJwLJWFXuLBgRKA5i9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792121987; c=relaxed/simple;
	bh=c4gDC4uqz+E6v38Bfsis2mfHEo1PgDwdkadNbKU9XdU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=A1SOWEbS1np0KFCdK42ZaNdEOsavRuhDqE2f6UJjz5GqEwAlIPwOune0M42gH6iTTgwHgYLVqg9WwY1xlrjS4zfO0SsRrY0Pkb8WHVS7Z0QHV9HViF7LPvxElEGcVea1E+r+9zjd/GsyNkGwZywVzvYojILNJWHVnaAWGuLrE8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=Z1owmv3v; arc=none smtp.client-ip=54.206.34.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="Z1owmv3v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1792121904;
	bh=AGDNv6DXYCdi1YpS0B//tI0y8MWeq3h9UmAnwKtKtAw=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=Z1owmv3v9aNByffY6gO1tgZkgHNFKRfL1T36LUi5sJunuG4vmCDCoFAl+bsfeaYLW
	 jzdSZBlS7jpi+kY15Ua8IMMX2UvD8RuqfjgtVYB5b3cPz9AormoDTo4uKazl3Eq3/2
	 gD257y1u2IOW6hYp7yW8ODXtP51LHJQUjvoFgykA=
X-QQ-mid: esmtpsz16t1792121888tf237f946
X-QQ-Originating-IP: 6fQ2S3TEPi2t6gERGoZkbAJ10M1tt2OG07DsHcpNjxU=
Received: from localhost.localdomain ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 16 Oct 2026 11:38:06 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 5942305316129943371
EX-QQ-RecipientCnt: 7
From: Kun An <ankun@uniontech.com>
To: linux-nvme@lists.infradead.org
Cc: kbusch@kernel.org,
	hch@lst.de,
	axboe@kernel.dk,
	sagi@grimberg.me,
	linux-kernel@vger.kernel.org,
	Kun An <ankun@uniontech.com>
Subject: [PATCH] nvme-pci: force simple suspend on Inspur NF50
Date: Fri, 16 Oct 2026 11:38:05 +0800
Message-Id: <20261016033805.9978-1-ankun@uniontech.com>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz5b-0
X-QQ-XMAILINFO: MzMRvi13BjTiLT99NtVfTyXxOBdKLH2ZtaZpEXdas8RSs8ZJtw6UHfzA
	33idxN7xHPJ9p0cj4UMPd8FhUzWF7JuCOIfNuEYGHkfZ/ZJMDcGJ+4zeVndvB+n4KJreram
	CEC5zTbAgwMrAyMDeE84IeB4WuLuvqvx1zumbg/XYBSl9gsvHiB8lUnqep4xcRyQZoknRkD
	8VXpPe7uKypg72uHA5TQHGUqz3W/uLEih6uJ2ZHMEAO8pXQquft4VmJTTBbX1xUzxvpRl1i
	CRmdj8ihXfXG2p5Xo/z+1EhQMzywcFI7EJEjlrBZpydTIbaotNX5kL5S8hI2DLKPjy2xKtk
	Ath18Ueih4/RVHOUcoqHnrQ+wIcjTyEMGq4ZPs59km6r/EhypOGcRBX/cTZnjvl60Xkqvtb
	j45Y+rjqGjaHqcJrb4dac8h50NGOJ6NXWFX7xrMQl7HgUWZ73RUu0krmpA3pzaCEg0baWzp
	c7v7H/Qpbl2ELvMyJCElrcc8ot83QxjW3O8xn3smbA7cL81ORjbc/76A4xzFFpOoAwVG5hD
	qFhAtC1T/OU65lSQz253Ww8SpoWWtPWZM3tXWG5N/eIcpUPRYazH4uiGalwc/Q8/SLb6KO9
	kVWe3cSm2fclzelsGvAzvWdt8brky8prM/HMXoQXIuSTRFSEr1ZlcOBhKXix5T+ptROIQdg
	G6j88ZdKj3EVF6cJjH/02f4TpZUYlxzTtpNveA3usZW5fyqAxM61oBqxo6VgDwxy0RSHTRU
	9zELDDgbjBZEU55I0H7dW9uPclLdGkSaBRcoyITRbxqEEKff+xSQtoPXjpUcIczBP3mfkno
	UWJb0efyJMz3DULpPCFNlgAhEi+ggA0WgxRpP2LzBtz/d6N4tSr5R5F7oMKw1o2UbSA8hBJ
	orc7OZ3CMFTgD5G5/EjiIZb22JaHLy2lKcwurnJoWOH1DmAUzSeDsLBd5jGLnFKOSFEsaa2
	QLtHa/TKZEDrrZ+G5t2mWa3jxpsgesN5NPtzA0+8qVZNSwLVGbMI1gwZUou5sbuCg0VgDrD
	LTJOfxYE7l1Bc340p9Vyk0WinuRkpoabPnovv+2bIpiTlFDazmPVd83GIsMim7Q+DSkRNrC
	Q==
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0

The Inspur CP300F3 / NF50 platform loses the PCIe link across S3 and
NVMe resume fails.  Force the simple suspend path for this board.

Signed-off-by: Kun An <ankun@uniontech.com>
---
 drivers/nvme/host/pci.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/nvme/host/pci.c b/drivers/nvme/host/pci.c
index 77317e5d00f9..c24214c92e82 100644
--- a/drivers/nvme/host/pci.c
+++ b/drivers/nvme/host/pci.c
@@ -3664,6 +3664,20 @@ static unsigned long check_vendor_combination_bug(struct pci_dev *pdev)
 			return NVME_QUIRK_FORCE_NO_SIMPLE_SUSPEND;
 	}
 
+	/*
+	 * On the Inspur CP300F3 / NF50 (Phytium) platform the SoC root complex
+	 * does not keep the PCIe link alive across an S3 (deep) suspend, so an
+	 * NVMe controller that the host-managed suspend path leaves in a
+	 * non-operational power state never comes back after resume (I/O
+	 * timeouts, reset failure, filesystem abort).  The firmware does not
+	 * advertise firmware-managed suspend and the failure reproduces with
+	 * SSDs from different vendors, so key off the board instead of a
+	 * specific device and always take the full shutdown path there.
+	 */
+	if (dmi_match(DMI_BOARD_VENDOR, "Inspur") &&
+	    dmi_match(DMI_BOARD_NAME, "NF50"))
+		return NVME_QUIRK_SIMPLE_SUSPEND;
+
 	/*
 	 * NVMe SSD drops off the PCIe bus after system idle
 	 * for 10 hours on a Lenovo N60z board.
-- 
2.20.1

