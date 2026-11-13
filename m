Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794585409;
	b=49JSzLtVSzvpqMfT1HleG99zl8edQ/rPEtgKF8C3YVu4am+Q72xKsU4Ma/vZkyWkHuop
	 CLy4RAwgGKHBqTnG6ZGEb3ReHt6pT96+CY7/AAcQFDT8sU3LeEE8BET8gAhm5TXj8PK68
	 ZncrI8DqG5l6Whj+1bqaNzxk96yflA4sijIxIXM1yyBy5Bnhl+WFCBmP6xXPL7cSZt4+K
	 Ngw+7xh3aWvCxmXM4Mp2x2p7HudUzr1NKVtGHVnxXIH9fC74lVNTsjSc06+fITYOiRt89
	 UhLVa9SCmcYxNBPRrlye19l6VH0bgkYynh4RwyD+fod1JvLLLx4tpQaqohS9IcgPn7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794585409;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=s5iAmd9keKHbPkTvN1jZmn2G9L4EyhMScdGm+wCTAPo=;
	b=z3ZRqhYd5AqKQ2NZlDo2qkgZGSh1vtb3+ObFwpe0vuRb2taf+9ND7+814aLi3ni53f9n
	 +EnEirsUcyssIAB/sOF44m5SYlZ4RG0tfCUCUrFt7Xu89m67MqxIiLjeD+S0c0qzfxo3S
	 Ve4WpZZeU1U9YSYqBj2ESEjdcLbe8g6QHvWCWTsPOm37Uf5pD0RlEPlwDRuS49hPc/XTx
	 ZwhEw6LfEy2+dWN8PSBW9ZqaQct8sduLr8SOBqV+Ij3auF9uJyPV7lO6AB0BhDnIIlL/E
	 5oCdplu7ubth44h7RbLsSCIX2Is+EKBLRBQewppCXIBiewsIThrU+EbzKg5W/BBfeLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=Y1E2Lvnt;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 451246070FFD;
	Fri, 13 Nov 2026 15:56:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 451246070FFD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=Y1E2Lvnt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=s5iAmd9keKHbPkTvN1jZmn2G9L4EyhMScd
	Gm+wCTAPo=; b=Y1E2Lvntnow47znA4BAC8qwuJ9cwwdDhjFfRQLhufA943Ffxzo
	GyWCcmHDlTwC+JxlsKT1oiwzJTSl4lze22eg04byj94t0EeY/Uem5iaqgXltbnnO
	wb1jpvPE9HlBX83j1L9P3KjK6M9FUGL1+fLetZqL91vztFiRBJ3t0xT80=
Received: from xuqianhui.ustc.edu.cn (unknown [114.214.188.15])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgA3rDAzM_dqxQ66AA--.1851S4;
	Fri, 13 Nov 2026 23:56:39 +0800 (CST)
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
Date: Fri, 13 Nov 2026 23:56:34 +0800
Message-ID: <20261113155635.1677541-3-xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261113155635.1677541-1-xiaqinghuan@mail.ustc.edu.cn>
References: <20261113155635.1677541-1-xiaqinghuan@mail.ustc.edu.cn>
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
X-CM-TRANSID:3pYKCgA3rDAzM_dqxQ66AA--.1851S4
X-Coremail-Antispam: 1UD129KBjvJXoW7tr47Aw15KFWrKF1rCw1UGFg_yoW8Xr1rpr
	ZxJa90yr4j93WfXa1UJ3W8ur1fAayfta48G39Fv34fC343J345Gry5Ka45t3yUJF97Zry5
	tFs3KFyrZF1qyrJanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBvb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUXwA2048vs2IY020Ec7CjxVAFwI0_Gr0_Xr1l8cAvFVAK0II2c7xJM28CjxkF
	64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcV
	CY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv
	6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c
	02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWUJVW8JwAm72CE
	4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82
	IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC2
	0s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMI
	IF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI
	42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z2
	80aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x07j7kucUUUUU=
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

