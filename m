Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.205.221.190
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793754692;
	b=sz20IsO8FJbCdiUy4o1enKLsgmhCoIoEYNkUhlmjvCASVkKeTvGIxbawa0c13SXWRbJv
	 cwDhSb4+tjtOJ6TZrfMJDSufCqLqmQdaDwAQVWyvnPbJgUg5vYWLTey5UWCAJdrvciFzY
	 kQfg4K9KCgjUJT2yH8CdOa5m9zr0QlJ94H4m+VpBKPVZ2S2LsQmnCE1kZhiFLYPjM/UQw
	 kWVBBtqfNOgsd7olAE2FztN5wzxygBW8jNLQyPD8nQp95O2rH5o4p09dkRO16x6fYuA4R
	 BKOPNeSm7NCFNlea8efK1P9GlYo7nA5E6IHxEDOzoLA/fLJ0n/ojGK0JKo9xOKEofBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793754692;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=sIQ9+UAP+T9i5P1ER9oC9FsDhW/tA+9UYBuAznrvwXw=;
	b=jCW5Fv2OeTEoX2/mbsi0apHXfk8P4+LCmTfGxIG40DoWalpakLV4v0yiOwdMIbA8s/Wd
	 VUrcSuhmBiuDS6Jj9LWj1aX+A7n1i0/PvmwCQwlyd0BbUJzGbakkv8MVHXsC70QnxAz56
	 XqhSZZAC5hs5lDTHhhGGa0UILit99y5JtcqOZuZoS30j2+VQL7hQ9jFUccCLXgI/Tzi9Z
	 PTQoOXiB86jmi+S3gALDattdpDGzGTAa6l9V+ZhSIY0FfkGRMV5F3INJK6FIWHiO6KWfW
	 IIV9Cot7+KT12AJJj6gmgcsj05icmAOSVBExp5u9zVmuO3UBXqp/lgoX9YX2OyeEsoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=XckCDUo3;
	arc=none smtp.remote-ip=203.205.221.190
Received: from out203-205-221-190.mail.qq.com (out203-205-221-190.mail.qq.com [203.205.221.190])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28F4606A330;
	Wed,  4 Nov 2026 01:11:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B28F4606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=XckCDUo3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1793754663; bh=sIQ9+UAP+T9i5P1ER9oC9FsDhW/tA+9UYBuAznrvwXw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=XckCDUo3yevlPgQZKZGLFP0ktoVcY1X1OO7DUGF5fH/TcPtUM3MDwg8iNR6Xdc8tN
	 H30nbe0vpm1lRvHuOc9rz6UZiIKfZoLSLEYT7VE+oSsIgtcG/q2WTfrLBZrPE99BOW
	 GFcsxqfEAuGkp+NfkDO9KZxGDD4noWRUTR3fABqw=
Received: from shuai-VMware-Virtual-Platform.. ([218.28.192.28])
	by newxmesmtplogicsvrsza63-0.qq.com (NewEsmtp) with SMTP
	id 2C01F473; Wed, 04 Nov 2026 09:11:00 +0800
X-QQ-mid: xmsmtpt1793754660t6g1vg8yd
Message-ID: <tencent_C589954C94BAFF49A7B030C93F367DE1620A@qq.com>
X-QQ-XMAILINFO: OVFdYp27KdlJbqk+LlwmVUQ2KYjzJKcNjveD1idqoyeT5DW3IAOGicR+nP7chw
	 OGDMxNHly0X8F9qsbll4+hZpUxXxIjnneYuBD/PdVifo60Uav4qGqcahzuejhaXpFX+E3Hyfd2jl
	 814pBevHYKOMfqgQgLA9Q52F4nCvSFkdTO4iSV8cKPwnFKJ8zSZ99VVFSl4F1fCXxu+BohL9rG0/
	 LHwfF/O6ACbX0VhJFIMoLl3G+6YhRnJYkQsB7+0dLU9NT/ZVu+uNmtffnsf5YtVNk6bVSyo8sG3F
	 oczUR4mapS0DDgF8N57+SikUiuEFqn+EpyJOC1g/KSM75DKAwIHFPCsGpY3etss1D2lhOtdjVAaS
	 xzlHIuz29apKrDQJgHcISEEcY6KBMxNvZ8Zu5440tyL2/vpv0wJ61GnJUJAxtWZIVzojnMJ7LQiB
	 7A9vdqIwavb3iQODrY+eu3JmRwrvevRxHwUP9Uoujfyv7u15hBoWLE6DnIqQMOQiqRRKCHGE4ERD
	 36PJtayXbR9wJcRnhson4pyI+AoWz3+s1Z1kcI5CA1dP0irFdLev9ApobDjMOyZVe6aih7SWxOkj
	 YFEIb2HUE2J0YlUrBsLNaATIm+7bKsN+Wu8QFzBko+GToD256CxlhFiCtRFtDE5fxXojPeYz6LL8
	 G7IaSBD2fpRHnYqM5VNaGShxV2AAZncohiPygpm8xdwU8yAc8Q5UHEZJap36dn74KPkYhRZZUpeE
	 AWkU/ng54TMRFKaCutqcB94CThjcdzFJSabbn/DKox/BYjNeUyY4ySLvKtg42zcdNCMVx85MdPQE
	 Cuw+bpm12t/iH/XKWJyidOB5c1rTLzFJixBy7mhCzmM9vm4Yrg4QCuRh3Z4RptGhctSjkwR+bNca
	 XVn36BQFK6UQVD5SbVfiQPhteRM8XMjphlygFJ2Bjes3cUh49CS+pNfLd5FWTd7YgDkwDM69avYy
	 b7i6dwsi1CgMpBa60loHrjB+451MIgLwZ5XaCJhK2K4o4cgFJjDvMROWuPKtvxKw9Auhp9HuJ/sV
	 C4f4wRuwZQYhtVzr5cBJNfTgQshfA=
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
From: Shuai Liu <847807867@qq.com>
To: linux-media@vger.kernel.org
Cc: bryan.odonoghue@linaro.org,
	vladimir.zapolskiy@linaro.org,
	mchehab@kernel.org,
	manivannan.sadhasivam@oss.qualcomm.com,
	loic.poulain@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] media: qcom: camss: select GENERIC_PHY_MIPI_DPHY
Date: Wed,  4 Nov 2026 09:11:00 +0800
X-OQ-MSGID: <20261104011100.384923-1-847807867@qq.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <aa7b58df-a7df-4d33-b2a5-9cc760dd9ed5@linaro.org>
References: <aa7b58df-a7df-4d33-b2a5-9cc760dd9ed5@linaro.org>
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
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
Changes in v3:
 - collect Reviewed-by tag

Changes in v2:
 - drop the redundant "select GENERIC_PHY", as suggested by Loic
   Poulain; GENERIC_PHY_MIPI_DPHY selects it transitively
---
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

