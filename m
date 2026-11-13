Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794585380;
	b=vsqFDlr/vfxjFBFHHC+PHoYsdHJuCftTXmo7qoEiaUq5swkJKNDLAMIHB1/0KwAgQrRm
	 kYBb58np3BcGSq5u8ft8ra+PyleThFlxU0S58eDlNYibOdTEaoj6s+Ox5xTx2YiN7Dyy3
	 ctI16hVEm4vZgxpDShyd95iAkZikDiGQdgurpk4MJw1b9lEphxcC00p/eyZJR3subAiMF
	 jj5nPi/nUE3T1qkCAq0SZcQJJ29kAgf3PdqyXfSDKnPxZi2+RPr/Us/G1AJDEcjfCPGVr
	 nxY/E9R1pAh31PnhSblkAEHhRdM93fOKjoeKZFuEQQS/2Jm6jz58EOVAPdssmJq+JQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794585380;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=s5iAmd9keKHbPkTvN1jZmn2G9L4EyhMScdGm+wCTAPo=;
	b=lAa2x21H9vwLE4HqHtmuQhVfsxVW37WYCY3ikE6SL8LdhjIC33SblVz4h0Q7sVRBWgbw
	 QluiSL3ZCDQKJhSXYHYXD+UwC/iJDdqTXw0i628lWg85jxlAX1y8bdNHLSrKlBs7qkP+M
	 sxuvikr3BpspyiAeEp/qh9Ps3lcKNx9tt1ZMBQOok/jXvkkmo+/EqQTo9ba3dZGSiVKpt
	 450L8KNb4BZbFwogrwDi/CI9tkb+R2WYcUriuS7QcmrquBXyImkHc1YlfeL5v+1MB2qn7
	 EfGjtZjDrDcMQBeoXujUd90u2jiqRlKQyEUt5vXvE1Ruer/Ow6F8Yt6L0AFR3WWtKZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=S9BEhMuY;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5311606D458;
	Fri, 13 Nov 2026 15:56:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5311606D458
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=S9BEhMuY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=s5iAmd9keKHbPkTvN1jZmn2G9L4EyhMScd
	Gm+wCTAPo=; b=S9BEhMuYjfi2Gj7iBsCKhbXC6VhaI1YGU4qAemlqfRb/r3i5Yh
	TKFwqPWGqhna1gdexFbKgyDASFKOjSS+RPHNFKxGWkCtOI41tvBnqM4cv+lyaLr2
	RWXjNRA0syFODEIetoi4dxdxdnyOLH4c8IZWPUPw3kqZAZheL5D8hcPcc=
Received: from xuqianhui.ustc.edu.cn (unknown [114.214.188.15])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgC3KS4WM_dqbQ66AA--.937S4;
	Fri, 13 Nov 2026 23:56:11 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>
Subject: [PATCH 2/3] drm/msm/mdss: reset all block resets described in DT
Date: Fri, 13 Nov 2026 23:56:05 +0800
Message-ID: <20261113155606.1677313-3-xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261113155606.1677313-1-xiaqinghuan@mail.ustc.edu.cn>
References: <20261113155606.1677313-1-xiaqinghuan@mail.ustc.edu.cn>
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
X-CM-TRANSID:3pYKCgC3KS4WM_dqbQ66AA--.937S4
X-Coremail-Antispam: 1UD129KBjvJXoW7tr47Aw15KFWrKF1rCw1UGFg_yoW8Xr1rpr
	ZxJa90yr4j93WfXa1UJ3W8ur1fAayfta48G39Fv34fC343J345Gry5Ka45t3yUJF97Zry5
	tFs3KFyrZF1qyrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBSb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUXwA2048vs2IY020Ec7CjxVAFwI0_Gr0_Xr1l8cAvFVAK0II2c7xJM28CjxkF
	64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcV
	CY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIE
	c7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I
	8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCF
	s4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262kKe7AKxVWUAVWUtwCF04k20x
	vY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I
	3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIx
	AIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAI
	cVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2js
	IEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjxU4NVyUUUUU
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/

msm_mdss_reset() acquires only the first reset listed in the MDSS
device node.  Platforms can describe more than one MDSS block reset: the
SM8750 display clock controller also provides a reset for the MDSS core
INT2 interrupt controller, which is left out of reset when the
bootloader hands over with the display block still running.

Switch to the reset control array API so that every reset listed in the
device node is asserted and released as one group.  Devices without a
reset in DT are unaffected, and for devices describing a single reset
the assert/deassert sequence is unchanged.

Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
---
 drivers/gpu/drm/msm/msm_mdss.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 9087c4b290..84b8b4bc9b 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -310,7 +310,8 @@ static int msm_mdss_reset(struct device *dev)
 {
 	struct reset_control *reset;
 
-	reset = reset_control_get_optional_exclusive(dev, NULL);
+	reset = devm_reset_control_array_get(dev,
+					     RESET_CONTROL_OPTIONAL_EXCLUSIVE);
 	if (!reset) {
 		/* Optional reset not specified */
 		return 0;
@@ -327,8 +328,6 @@ static int msm_mdss_reset(struct device *dev)
 	msleep(20);
 	reset_control_deassert(reset);
 
-	reset_control_put(reset);
-
 	return 0;
 }
 
-- 
2.53.0

