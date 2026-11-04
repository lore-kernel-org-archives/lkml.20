Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793783293;
	b=FANDrKwMPvkt0PE49P9Njn/K0WYk9sr5HJvwuaFAcdQb2TKAeHU/ujTBkcfcY4me3vw4
	 cfyGOgoEPoRTt3ZUZ4r9h+J9JzPmH5k6QYCmV7GwGcRjpWlfJDcNrDitdQcBr77CSJ1hp
	 pBU6KUAb22wK6D1+IjRUfRCSzug8qMlPlRngGeDy8wdKAdJ+ZbPynx4uipnlv9g5o6EZM
	 OITGN9RLHrSxddB1ZwDV1uVulGahh51JU02ZEI/HOoLQgRVq9Rcl2bLByeFgOaQ8FWXNm
	 WXlQ7Ec+3K659Ew+nOERQYnkX1TUIkR1M+eCi/mjtT7HhqK3cpvspRzPtbgy57gA5iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793783293;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=D8me2QpoNUYpkzCrzP/COkjEOzARHLPsOFtTfm8ZtJ0=;
	b=U2zo/9iwmvkKqJcUxGV/EDmorRU11ZTPfyjzBVSIWHKhnnsIax1VJIKDNZB+dirmA5tL
	 TsIW81MV6F5iPnaMUtEYQCpozcicx1vP8MGaXZ/TCM8XKVjaERw74JNUlHMBheoPxIrac
	 gsG9ARw3vhIPiQ9xy2B1SgRjL3vjRv3kAw2sfrFe770RQtzYdnOf2at7c7NQuj7r6/rHB
	 DUqGCDHjSVQkUqzzzU56GQ7j949kkKp00bHpX9ZoYUB7mdS/XD30XCv173GBgK9WCNXk1
	 O+gfVJkTUwVnc//h8Wig4/CDW6lOKW7TRvJ0ODw7G0n3joHHB8VWEuYH9hJaGBrECfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cOyzIDyj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d1Z2u0uV;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A33D3606A33D
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 09:08:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A33D3606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cOyzIDyj;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d1Z2u0uV
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A48KWex3875516
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 09:08:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D8me2QpoNUYpkzCrzP/COkjEOzARHLPsOFtTfm8ZtJ0=; b=cOyzIDyj0a2Iuht5
	k9JzBA0s6Lx3awvT38wo9fsLbOjYVLkvyKWAW2Cv/RaDkQ6JtpKMkrIa2eiYE/c7
	9+QeWk80lsvgrjUxqee5ZXrmUpSWEd2zHxXnlwGT58DswAuXoHdfV7LdiA5W4/7Z
	YI3ExzuPi1esPo/dvGwmDWZk5XsrhkgmOSJFNWYw1KFWu00JnB4CNlzL32cBYfCu
	2HLOguKmaXxqXSp88HqLcctetV/TBCyHOB/yWwHqwuZyAbn93xYyXgM5b7CSDwXj
	Xps25NLLOO3LOWyfztjJYvIJjtrk1Kkeag6zjTndhhgYxtoiOE3aRbw80HI9CowI
	0VQ7fg==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqwb0978n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 09:08:11 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-8255327a28fso616441a34.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 01:08:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793783291; x=1794388091; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D8me2QpoNUYpkzCrzP/COkjEOzARHLPsOFtTfm8ZtJ0=;
        b=d1Z2u0uVUc6BBvhiM5lYH6Ot/Ywjl7cq2Ru/F7Y8Etbs1GqAfXE8fSKao3C3o8bMmI
         WgqB70Fmlv9bKHl27NQNjizYOEFUObYfpL5EHdpk1LVJPxTshtas2MtWYzRRbhv2IzxH
         zz7Tdam53M7exAa9F1KTBhIv/Mk4B0mE8gDpqJDeaDn1mXVdgasAXOOTQyQ0I85M8LbO
         RzWTAJj6gmqpeU5RhN+tklI87wEFQsGSz5urnaBpgL9s8HahoazhTVmkY6Q8Vvz0S6k6
         K5ewdbqbfmukULxzcL7lK7fUm2d70ABxSz/0x3YPSjL3aSogbQZddFqubmo5iOvji1dN
         0iPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793783291; x=1794388091;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D8me2QpoNUYpkzCrzP/COkjEOzARHLPsOFtTfm8ZtJ0=;
        b=OBuAZk8w6J25YCvJctqhrMB+dSNs62xp2P3bpHlj+WQFe3wyhT3iK1EY+NIr5yOZK6
         yLPvFXv4srBJYGGEAwKpXuuoyYTkmXlkSuHsaWEpTwnYsemEhtpkLqas889ov+96L0+L
         kbZKGr7CpfL0qPwXoyxYl4hjRUi/Fi3sKoZhk7r+mkJ9jJHQXWWTQwh7MVHBDHtt8+LH
         9d4Q66OjFIoX143XQneVRcISU9BVtQy7hb4fc8u22lS7b06vgrQvZqlcvF7maoEkjjIi
         wi6QPjh+SX5vvthBV+rjpedM9gVcNyZeu9HVWB9R93uwqM8MtC+LF1KU6AV46hl/4fG8
         LtlQ==
X-Forwarded-Encrypted: i=1; AKwUvBxowtrLtKu+MEJfDJe1/We8VEWHCLjBRe2EqZZi7PXQSdc5cux8//u09V2S8M0s4cy/nHZhwsOlCsMBrW0=@vger.kernel.org
X-Gm-Message-State: APuU4Z85Tzk+FWAJVDFKI/IhPynGM2r1UbGormV2AIFb6+u/ighpWvQJ
	hsaqVh4aE5MUaFN4nPQd/R+dpilFEAB6kcEVGYc2vDHGwi/W4Jyh4zKaVpS4WJNgh+bepR9Q5Bj
	TziCSSMXXKtaXxJtI1RIyDllgfFeKcWvg37HrVRiObJ/AmtZ+mXZERnchCNYa44YQwaU=
X-Gm-Gg: AYBFou0kikaINPu1c0riAJ6+KOK7+pSjB2pJbMywauQ0HzP0b29fWhJIUvc0VtAHNIT
	Er+PTs6AuGoxUpYZIXzhnznuxlfUAUK+FFkYKFCJRYzvYl6VsIVfMVlDCmjRhJ2d5VQLoiZkRfb
	yzbynuKX35ZS1EWWqjks4KuZVsJFBma3t/ZwYEWI5oOpanIZ0LHD0Lw0s/yqeia33yKNkpgPB1O
	hy4K+AOZ2bE6VVFVDVVR/XffNgJqLRE+DS1SUyPNKsQ1Gu7A9kphl0LyrjrA0LsrWhjeackgo3G
	HK488+ITGNcP24k3dO+y4+vjd5c8htKXnOMbzIF/74aW3fhSy+DitdYfKzFTm3Vy28Wl2H5R7oP
	t1ChZekcq1lF/Nwug4bNJ16yclhSpEvANDk6+wBHGNzLp0eHmjVBJYmQm6BPTxkeGfwnDQSiNdb
	FaN266rM41i92M1NgQQ6k=
X-Received: by 2002:a05:6830:2b0e:b0:821:c75e:5309 with SMTP id 46e09a7af769-85d3636e246mr12595628a34.7.1793783290884;
        Wed, 04 Nov 2026 01:08:10 -0800 (PST)
X-Received: by 2002:a05:6830:2b0e:b0:821:c75e:5309 with SMTP id 46e09a7af769-85d3636e246mr12595602a34.7.1793783290473;
        Wed, 04 Nov 2026 01:08:10 -0800 (PST)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85ef3d768c8sm1519846a34.8.2026.11.04.01.08.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 01:08:10 -0800 (PST)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 01:08:01 -0800
Subject: [PATCH v4 2/3] phy: qcom: qmp-pcie: Add vdda-refgen supplies for
 Glymur
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-phyrefgen_1104-v4-2-ba508fc6ab40@oss.qualcomm.com>
References: <20261104-phyrefgen_1104-v4-0-ba508fc6ab40@oss.qualcomm.com>
In-Reply-To: <20261104-phyrefgen_1104-v4-0-ba508fc6ab40@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793783286; l=2038;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=X0zqKLQgxtFqsdr2c8NqWI9DTymrR5SFOBpbqURcmZU=;
 b=jOmVb1vGw8nEqcFE5bWnDz1WHLHxQTvffqHoM0iOlxKkPjMbu0qP+0COeDgjSm43OG0So7hmT
 x3ll492AqDnDr+4Py0zhLe3Smv3XmkxJ/2pgmb3yWL9VHEsYZvwRN7a
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAzNiBTYWx0ZWRfXzO/N5eu9nicB
 /TFFAT5LFdmU7OkVgZpDIcujY4b+HrDFxS7EdnL3yxwVhSPGCAOg4qYaS21Vk65fle0dLhqy6Zv
 3ObSUuiy/hP8dT1Vv+b9/MaS10Rc7lM=
X-Authority-Analysis: v=2.4 cv=OfINnRTY c=1 sm=1 tr=0 ts=6aeaf5fb cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=m2jQVEIWa0EwQwJFt7gA:9 a=QEXdDO2ut3YA:10
 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-GUID: ll6yT8D0rKVBayfkItCDbUuwpflMdaLe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAzNiBTYWx0ZWRfX3Vp69a42ziYV
 rMkIKvnwSz/Ywbx1/y8elLk9bMqS4O8iHK4UY6hw5CqZThLXhFOg1Nrtaj8pvXIQ4BNcWwlgmx6
 KuOvqked67eQ7piB+w1OKsqt9+WouRfB0Dxse+aBtgTPlJ3dJ75D/zqqdQniMnTQT4Ou2403pCO
 hOhSCnTBLhFVNbcVF8KiJDoCwmROiNPw3K5GGdNX4tgCe4QEGTD5amNcF9ACyE9E+sGAPNmywyr
 zDF6vA/jkA5FqBDu6MX61sRPx/D/gVco8BOZF83QMWPK6LysyMCp81UmfU+o2ZCuhf/Sd2Enn0h
 XSfMiUcX0xp/EH7pW6zPnLjoeujz9UW3r2uzUExUApjZVBgoIqfyvq2Tk9P8Z8ba0zqkG5E5ucT
 njndKGZKHAjuii6x4X7k8WlKnNGN6SFlD6nugePRvd6OvhH2yDuEqvlX5sdD9/6RlVhrf2AAd0g
 953Dxfv7Q8MgwbEimZg==
X-Proofpoint-ORIG-GUID: ll6yT8D0rKVBayfkItCDbUuwpflMdaLe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_02,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 phishscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040036

The refgen providing reference voltage for PCIe QMP PHY on Glymur requires
two power supplies independent from the PHY's core and qref rails. Add
support for vdda-refgen0p9 and vdda-refgen1p2 supplies with a dedicated
glymur_qmp_phy_vreg_l list.

Update both Gen5x4 and Gen4x2 configurations to use the new supply list.

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index 9cfabf474fd6..e226b65ec7c6 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -4106,6 +4106,10 @@ static const char * const sm8550_qmp_phy_vreg_l[] = {
 	"vdda-phy", "vdda-pll", "vdda-qref",
 };
 
+static const char * const glymur_qmp_phy_vreg_l[] = {
+	"vdda-phy", "vdda-pll", "vdda-refgen0p9", "vdda-refgen1p2",
+};
+
 /* list of resets */
 static const char * const ipq8074_pciephy_reset_l[] = {
 	"phy", "common",
@@ -5555,8 +5559,8 @@ static const struct qmp_phy_cfg glymur_qmp_gen5x4_pciephy_cfg = {
 
 	.reset_list		= sdm845_pciephy_reset_l,
 	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
-	.vreg_list		= qmp_phy_vreg_l,
-	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+	.vreg_list		= glymur_qmp_phy_vreg_l,
+	.num_vregs		= ARRAY_SIZE(glymur_qmp_phy_vreg_l),
 
 	.regs			= pciephy_v8_50_regs_layout,
 
@@ -5571,8 +5575,8 @@ static const struct qmp_phy_cfg glymur_qmp_gen4x2_pciephy_cfg = {
 
 	.reset_list		= sdm845_pciephy_reset_l,
 	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
-	.vreg_list		= qmp_phy_vreg_l,
-	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+	.vreg_list		= glymur_qmp_phy_vreg_l,
+	.num_vregs		= ARRAY_SIZE(glymur_qmp_phy_vreg_l),
 
 	.regs			= pciephy_v8_regs_layout,
 

-- 
2.34.1

