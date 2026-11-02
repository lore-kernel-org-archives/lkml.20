Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.62.57.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793602729;
	b=vcLE5jLVAf6C+/dEQ90JWDmWtB/3fN6SLrXUpsaMiwEfwrpiEHv7CKsrN3N7dzBeyCbp
	 Ydb1C/J9s56faWlQhvLEk+QEdPDN5T5rW2hP5jx2krO+ETxPNvtgLZLT+nHSVvY7FWhwB
	 7LkYW137useJsfz/a2cZsXDg62ZgS8Qx02bpG0Lbsim+jLyX5lHr/9Du8AcbugwAb4Rm4
	 URxOV9Ckxz10zh209W7cnrX8KypEy5Pmkur0pjUo7QnPEtTPlsd5ztgFfV9De7Lsmq/q+
	 /Q76dRFpG0XiQ0XZ6LSTZ+JM1RHpFykX3bNuMFRNOLouwjTKzhJGI6WfEiJHRUPNqNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793602729;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=IZZF6U/ZVUgtpcnr8Hx2KYL3BSBMhJDzbOvkfSE3p7c=;
	b=hffJm06x37y5x1nRfONWy4CRTIpPCf3xT9SS6iUCxxI5einjrsvkvvuGiaNKQgIyO6g0
	 ga30QMsi/+kUPvEI92RFkJoNF073njD/rn+6xVX2Tcg4fFdbRj2JQjGQXGYeWRdRMUJML
	 cQK1/9jBn3BcBkt78JJwr6gOes4P8wWGJGAnDPDyiu4XlP5JA+pjkNiMakKlQIUKBwN0D
	 LqzAbg9ir+loHSQ78VZvpBV/yTp/CsHJCqsJsf/MCevXs9Hyg3/e1Twe+awWDGjwMrHKQ
	 QFwzg6cColOTwT06IFUQVgLLYqmUBE5mN7csodOxQHJhAkTkeSxoBZ2kWZ/5qvZxDcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=mvoyWL+g;
	arc=none smtp.remote-ip=162.62.57.137
Received: from out162-62-57-137.mail.qq.com (out162-62-57-137.mail.qq.com [162.62.57.137])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB8E606A324;
	Mon,  2 Nov 2026 06:58:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DB8E606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=mvoyWL+g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1793602717; bh=IZZF6U/ZVUgtpcnr8Hx2KYL3BSBMhJDzbOvkfSE3p7c=;
	h=From:To:Cc:Subject:Date;
	b=mvoyWL+gv5+kVu33cp/83nqjLzooStWywIniOFePFr9CWv3FG1LYKl+6ILxBKI88q
	 rvWbezJ9LkzhMHdj8HVARcS4UF5Dl164dZoToYk7MJEKSas5sDSp5cuk+967o0M5fI
	 mty3Oi5foyq9HZJJsSouuacj+niCy6esX+HqCvIc=
Received: from shuai-VMware-Virtual-Platform.. ([117.158.156.199])
	by newxmesmtplogicsvrsza63-0.qq.com (NewEsmtp) with SMTP
	id EA224239; Mon, 02 Nov 2026 14:58:34 +0800
X-QQ-mid: xmsmtpt1793602714tgkqnxd53
Message-ID: <tencent_0D164F79882608DC3FB1B70913F736690207@qq.com>
X-QQ-XMAILINFO: OVFdYp27KdlJ97ztUa9THujk47MNnPJWV6PqGHmIDV3SAFloVm+xp5ENdvmIKT
	 ZoqgG6wytzf5iLtLTMSjH5MrBl8fP50YVkIMKvymAkOgZVTiWFCPCrbdIFictQntlF/aXlAuWfKk
	 pGugtUHwKoBvzisu7mAif3eVg4T6IwsAfBLoJN1z8FeU9FQ094Ef503AfKti5fqKyDR+fuiW4Zg5
	 wMqi4ziFVz7S0WpnavL1NhcN5j+0a2yXm0r+5euv6HtTYevDpDkuhB9fL4+8ib2o485VCVzn+1Sv
	 Mcg0ecpL3QuVyfCpD+AsVLxZnyQWh1B7VfFnuHF/KdS16w19txdLPRrVpR2SuEIAw7DyfU+s/gOP
	 7PNt5k9HWFys9eKr+igkaVy+x3xtt2mCPxgrxa15DFWrRKayEOpops8rgSWYlh4HsIpkO8m5z9YJ
	 KqDURBoO3JBLqXUCcfkYFAnpebdtNR3YZZLCUGGxeTRmuhZwpXAvGbQyzZpjrARs576GWLcngdAH
	 YqaxXw4u926ypkuILHTMNRJIeIBeAAxMdYh2SKBmeXOaF4qyXE7641TeVuvwIoMn9zO/aR7F02zf
	 a5esyEileDNC3Q1FhfJJTkZOo7lW4tZ3+9rzf8ABgVQPg+8JH3VvByzxdK1QFBwb79PfmaX8/uxj
	 RO+oKhhGlpRg+gC9Z3faCbi/JSBaTDcp5aeiKgi8dOt2aXgQuI9MvQvAUE3EK2Y5Zmo6MpqbhEN8
	 L0qOEUhHPDS/64EYKrJeIZlCwKn8jfS/3uFuOZVnCoHoEw9QUjIAmGu8aEnqLJ6ODYzIdw5aYPNG
	 jkbC/mrOt6qF+Onvu7VC+TW5yA4csyVOWbje4vpbI4KfParWxnODTMENKkyGouALa9uPCF7fMtzh
	 ZQjCXVUsK/y9vVLH6F3QO/XJUAsFAgeBBOlqc7UrcPmWDMnfAxp4UzhFN1ZwFH6XYUb76GdM6dHv
	 g2omucuc2j3NYUBdcLM7wI8nTCEnIjBvc+CWcHw0G9G8RrJLyuDS/Crb2q+4wnNr9VkCxaX8CdK3
	 45iEyoP1FbbXkn4gKiZ32EUzpbrL8s7AWWaHzTXW3b4Rf8pmB/mTonmIzo/rZzIl3TmOzdGA==
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
From: Shuai Liu <847807867@qq.com>
To: bryan.odonoghue@linaro.org
Cc: vladimir.zapolskiy@linaro.org,
	loic.poulain@oss.qualcomm.com,
	mchehab@kernel.org,
	manivannan.sadhasivam@oss.qualcomm.com,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	847807867@qq.com
Subject: [PATCH] media: qcom: camss: select GENERIC_PHY_MIPI_DPHY
Date: Mon,  2 Nov 2026 14:58:34 +0800
X-OQ-MSGID: <20261102065834.191859-1-847807867@qq.com>
X-Mailer: git-send-email 2.43.0
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

Select GENERIC_PHY_MIPI_DPHY, matching the other MIPI D-PHY consumers
such as rkisp1, mali-c55, cadence-csi2rx and sun6i-mipi-csi2.

Fixes: 0ee6c8a921b1 ("media: qcom: camss: Add support for PHY API devices")
Signed-off-by: Shuai Liu <847807867@qq.com>
---
 drivers/media/platform/qcom/camss/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/camss/Kconfig b/drivers/media/platform/qcom/camss/Kconfig
index b51745c942c9..b18ae4405502 100644
--- a/drivers/media/platform/qcom/camss/Kconfig
+++ b/drivers/media/platform/qcom/camss/Kconfig
@@ -8,4 +8,5 @@ config VIDEO_QCOM_CAMSS
 	select VIDEOBUF2_DMA_SG
 	select V4L2_FWNODE
 	select GENERIC_PHY
+	select GENERIC_PHY_MIPI_DPHY
 	imply PHY_QCOM_MIPI_CSI2
-- 
2.43.0

