Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.62.58.216
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793611254;
	b=iAz05r3ITOi+tXsQA+czmReByYMHSOJSRVStjE5AMyd3TS16JjdsOFVWpsKXvy16loKI
	 if21F++S61jyJjzFHy53W+EipFHcrV4WIP6qhmG/LgaIASO0hToFUAFspeMqOadTvCYO9
	 Jlcp+N2QQrgL+hXGKNaxG+5sXmSDw7SUNseu/j1nbkQLrwIfqVyUrzj+FKUDphdzmz14n
	 A7ExE60PddiFW5d+xYXW8w+v9WShnwHNM4Vr/GX/Asw5Vp177oEdqRhTJqbmNcCGyPZ58
	 S3Yc75fZETf1ihPAo3vUb8LFws35DxWWGsyJK6fLagLCHNbOIj6C3ZTWo6oOcaqG0wQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793611254;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6Y1rggA6Mtu/lilR+9+h/oRqX3vI9AS1AEmMa3+GSNE=;
	b=bVb/hLVJG8LK8Sz3sCYqym1aP/Nj1W8TXuAO1J03IQwsLKMTENV/tzxuzmHjR6AeO9Ao
	 tyKZoPGzOW3cZ79Hn6A3CCJYxCFD5k/lJ5gHVnwHH5Nuc4o8F7rtOX1AtRTDY1K7dR8sx
	 P5nbIH/7aaKmLIbCVmRFLOKYwStG13Qgb04RuSf/cCME28z20yn40Pa5iR+CClzuyy/aH
	 dHFDHPNPr1zgvenGVb9HWmEghJYkS/MN5At51fpUOQ8oP7icVwstgr+CJOga6Uu84KCWz
	 9Dc7ax96LhlSuvXqNbE1qIRCrU/5S4oa4mMEX+JnfVQ6LCSRNgZyEe4IC9qYpUUmTiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=QrFl+qW4;
	arc=none smtp.remote-ip=162.62.58.216
Received: from out162-62-58-216.mail.qq.com (out162-62-58-216.mail.qq.com [162.62.58.216])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A78F606A324;
	Mon,  2 Nov 2026 09:20:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A78F606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=QrFl+qW4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1793611241; bh=6Y1rggA6Mtu/lilR+9+h/oRqX3vI9AS1AEmMa3+GSNE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=QrFl+qW4MuZRavkJoqGWGJIdE5NoGvk8k52yV0JTJYp1dzhDMbISOgYbZFxPtg6mj
	 6ZDrxIzNOTWxGVIz2G2WLi38E2yQSckQ5/6hhkFARm6UBp2n8zpwZM4kO+YMFfKUJb
	 OrS28y8k3qa5sn7mLdIMItjxcdc3kd7Yrbr8ObTQ=
Received: from shuai-VMware-Virtual-Platform.. ([117.158.156.199])
	by newxmesmtplogicsvrsza63-0.qq.com (NewEsmtp) with SMTP
	id 5271D4F1; Mon, 02 Nov 2026 17:20:39 +0800
X-QQ-mid: xmsmtpt1793611239tn20iv37p
Message-ID: <tencent_964D3CB9DF49E7B244CADB34F5E05A8BE10A@qq.com>
X-QQ-XMAILINFO: NnA3IMNPwBd+spR8AX9zj8k+qxeMbmNHTY9p1oXiHPgh39vivtq80/p4+NngXA
	 6HbCM1dEZIr+MYLzAbz42wqnQSEa/yI8QpZY/utKn97NjD5pO2H2Y4rt36cX++J6erIFqCsxmuf+
	 OQapEGRQsVyNqdbmq8LQLOppIXrLhkaI02N5ZhRcNFTbBn5nE35fVo6mNnyVGny/2VAOB/1yb2D3
	 XCMrLcfwDqgTHeNEKG/e+oSwiWmEv/FDtq+OSsMi3NYLaRNCZkvqT4Ssed/ZGBLJHr2HtBF7G083
	 B+8LTmeHJbAA80JBwnazU6kmjEEXuXsDr3zt/x1r/0Dws6zG5DiZGBL9g/1ojAyzfwikNm77D+WB
	 2ELzGPHL5VISglnxAcxABN3QL4mRe3fKQkzS/7/WDc7q3dCIEhD052G4iiMyMNNLgbv6/7OghW8m
	 o81llDG8vd0aHdQLq6ln1Ze3TFzdUniyeyaEGrz4o5mYUHbg5hBA44p6MRKOogwuULjzRaslNCl/
	 2eCmugRVoTmwl/ytrV3eMB+H3SwqcQ9/2Fj0kUBOQom4zSoqZlb3jqUUueamq7VcsYcNY71yW6Oj
	 uvmN06GwG5XyuPnBQ7HJmLlfwIH+nx6DwmQA+Z91RILIwqY4t61OYpRX57cXx20Ri/xBGTaJXkg+
	 V8M/qEVXzRnyoIQR0Beft25LLCh4s6HERmwO6PH0OgZzDiK4sANBR5PCz48nKZIm+o/WRYa896w/
	 IEJ0bj4ei9mLC0HcBDvEsSNi8WeChtbbvnE7eBsqnxU9fBjslbfDo4EOPxUEFuzF7+lwwwP+yKse
	 lePfvziMKUG21LxCQwlM6hIG60WEW8ON/PeBtA+SIr7z1w4P5J1dYAGLdiDIXn3SGQDyndkUqsFE
	 Hio+kOspsVLLkz3jUq2sa345mRFx0ZQ+9kAnDkX19SXhEVa5Y5Fmv+T2no2pcCDVes2sIDhhsn1o
	 E9PCgK25vqBZdSUX4Mvbi766JMcyePq3Jt+bdZga0ehQ17WjWJZa/hHhY1jlM1upHVn7lAau+ikS
	 JsEyiQiVBR1/uzdUtrYSvLLxoADri3r4wGrpuI3RC0SFuxkslT48zPkNGmjw/hxu19EcxTfAN2VX
	 I2NlsKCtOMl2NbsZENZxtJe3rhyQ==
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
From: Shuai Liu <847807867@qq.com>
To: linux-media@vger.kernel.org
Cc: bryan.odonoghue@linaro.org,
	vladimir.zapolskiy@linaro.org,
	mchehab@kernel.org,
	manivannan.sadhasivam@oss.qualcomm.com,
	loic.poulain@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] media: qcom: camss: select GENERIC_PHY_MIPI_DPHY
Date: Mon,  2 Nov 2026 17:20:39 +0800
X-OQ-MSGID: <20261102092039.244346-1-847807867@qq.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <tencent_0D164F79882608DC3FB1B70913F736690207@qq.com>
References: <tencent_0D164F79882608DC3FB1B70913F736690207@qq.com>
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

Commit 0ee6c8a921b1 ("media: qcom: camss: Add support for PHY API
devices") added a call to phy_mipi_dphy_get_default_config_for_hsclk()
in camss-csiphy.c but did not select GENERIC_PHY_MIPI_DPHY, the
invisible bool gating phy-core-mipi-dphy.c where that helper lives.

With CONFIG_VIDEO_QCOM_CAMSS=y and no other driver pulling in
GENERIC_PHY_MIPI_DPHY, the build fails at link time:

  camss-csiphy.c:(.text+0x51d): undefined reference to
  `phy_mipi_dphy_get_default_config_for_hsclk'

Select GENERIC_PHY_MIPI_DPHY and drop the explicit "select GENERIC_PHY",
which is redundant as GENERIC_PHY_MIPI_DPHY selects GENERIC_PHY
transitively (drivers/phy/Kconfig). This matches the other MIPI D-PHY
consumers such as rkisp1, mali-c55 and sun6i-mipi-csi2.

Fixes: 0ee6c8a921b1 ("media: qcom: camss: Add support for PHY API devices")
Signed-off-by: Shuai Liu <847807867@qq.com>
---
Changes in v2:
 - drop the redundant "select GENERIC_PHY", as suggested by Loic
   Poulain; GENERIC_PHY_MIPI_DPHY selects it transitively

 drivers/media/platform/qcom/camss/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/Kconfig b/drivers/media/platform/qcom/camss/Kconfig
index b51745c942c9..e0cef2cdd0a1 100644
--- a/drivers/media/platform/qcom/camss/Kconfig
+++ b/drivers/media/platform/qcom/camss/Kconfig
@@ -7,5 +7,5 @@ config VIDEO_QCOM_CAMSS
 	select VIDEO_V4L2_SUBDEV_API
 	select VIDEOBUF2_DMA_SG
 	select V4L2_FWNODE
-	select GENERIC_PHY
+	select GENERIC_PHY_MIPI_DPHY
 	imply PHY_QCOM_MIPI_CSI2
-- 
2.43.0

