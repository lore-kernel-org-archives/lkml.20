Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C56440DB59
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791886638; cv=none; b=nZckrnIR6FsAid1GWcAZBFRCVu2qrmR9saqxkBaTBF+QdSZ20deSwmn0d6CLgdVrxoBnSOhxkK07M2kshvRRZJ/I4r9Q4n+34+2BaTqyqajLx8fCBsYApai8iBoU7t0XCcphrT792rKXsDazESHoPCDamIJ6IDp0YNvDmx9ewhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791886638; c=relaxed/simple;
	bh=0ADpLYpNVCDZL7nrJXO7P37xOu+fT5ppfN8VnN4oLWc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e+2FHLQZiJ5NWu/flc4PEWr6UmhbD6M1ViaDiEkSlYnPY3n3pSMCIlziv3WdaCAtrLqzLh42N+R4Xc5rLLCGHDLQ4nngAh1H9PurLEI5SGCNQhO3yWwuHxrzd5zj8F5amGUj5UhILeRBuLNrxREyipzqIPgDN9Lx1Rm9O5oaX9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V0nzuV3i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IHl17Q4O; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V0nzuV3i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IHl17Q4O"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D7OXaC015284
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:17:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w+gBaUzjZVMrpeVDlkni2Yf8Bw2QnTnJ/9RryeaIQlc=; b=V0nzuV3iCTBiPkJa
	cLYXulDlNNK5UvMrTUrNgFLbOxMvX42XrKZzFX+5QGAvBmpLYS47ysov6HTgQijX
	pPZYT7P3kxEoNPUDqtaxxPkMqXZgQeC6RkQFO25dc++jsPzopKl/7qLYaBJtyePY
	H0Sz5F8/vnaqd9TJ9FnicFvVykCa4ov0Wp5KAucnZhqLmPBq/u54zpdoVtbK8/ni
	PiUKV4eZV00GyrnigNVzArPqWZ8EVusijtMFrw076BxyrwGACWgPmf14zmlNjtXH
	Fj+FDvASKpMN4a1Gq3uypQxXpulO0kHPo4BGBNXTbV5ijLj3jwl2PCz3M1NagljL
	Qic2iQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9g7ugqg9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:17:16 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39b77130a7fso3422820a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 03:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791886636; x=1792491436; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w+gBaUzjZVMrpeVDlkni2Yf8Bw2QnTnJ/9RryeaIQlc=;
        b=IHl17Q4OWgwekVhoe5cgj71NbKy1XwcVlF1eSYfJP8nBTFnsqYKpi9DdTKMU1gdnCp
         arFI6IKv/kzerk+7kIC+Ral4SeC9YeJn6l8tbjoLUJZXEekvnNrDAiJ5FFL5LnQJWCm+
         FcGjcJTIMIrShDYJtyLTG8aJLWy0+m8vf6pXDJlagmhGYJDfhjqtXRaJFlJXWuGRKuFX
         DbJTqMHtk67O5V0B6vr1/536w9va/oa8fNDzB+MrjsN4hcDzyP4bbmP+FFbBgSoH1lC4
         CC09Fip3JXXrwqILxgpyCprizbK05usZzJQ3zgzVrifwUgkuTD5Z4AwJo2Z4AuzR10xL
         v/iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791886636; x=1792491436;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w+gBaUzjZVMrpeVDlkni2Yf8Bw2QnTnJ/9RryeaIQlc=;
        b=DwgpvGUcEAFozxQFUgcH7FPazMMfeYWqmn5uHUXzfchqZ/x5xHhtD8PeOTVRYp1I/a
         eMO5v3va9fgRBWtlsKsDyJn89LIMZ3OlN0fexGQm+T1KV4ZQY6CRVbJBxRy6qE+WWTFO
         eX/zrqbZNS4BIt4qYQp4cCGdx9KEni0WhSyOooxANpXRPbzqJAUuHaQvWBwgU1sizWut
         4mY9rO/fh6OoMLOW/5oZoYOz+qxrMi23+HS424J6WOg9Q/GrcNmszRdtfzYFwNkcDRhM
         y2BVYQMyBx2al8JdCHhDehdaWbDj6zdlL36rrfonC/nZZqILozL0A4M/DQNZXet5mItw
         /lWQ==
X-Forwarded-Encrypted: i=1; AKwUvByvAk4TdF+dNJtYH4bXWmGf/Zg9xmAygRWkvFDHDaPEWDhMtsyIKk9PlcRSyHfygTlSE85CXb56xSAFw14=@vger.kernel.org
X-Gm-Message-State: AFq9FYIOFl4s8KuAaAk+eHtsPvwdV2843Aabp4QlHs6Msg/n1IINMErW
	QpcJV0jQMaXcLTiTHScH5R9z3YsMkJxCxkkbi9YZhsnSQIpS/WsqSvBAXT0RqhZ3TGSA3od2Rd0
	np5lueZK0VGOgrCvqVojXsehJPmBS0wAt7h4oo9tG6+9vgQXF0G5E4CvHJbT6w8UNBwk=
X-Gm-Gg: AYBFou0oUXB/cO4bogwP7hsl9mfP5ByO+oMBlM53SOm+fIHBtd6dbiG1VYKQKPd/mux
	rOra0KCXiTNKOLrk9jPVSM/iGlmic+b8f+eCTVISXTtCAZ5bLSKXDAO2+5SrmZ//UANznVjm/Dj
	vUq6lm17kUmyVibs9Cyzzt6a+271AEkSNgUKoTc6AqUVDvzZKJjVSoicDxPd3vMu7PhSpY/5QN8
	1Xy0Z3P9csrwypM/Fs/8Rx2ed7n7pw3JvytfbYkdXRUNCK217V/2dLwIsmhN4PFC/RRArfdLXe5
	vNuwVnx7KlviTahy6OF4vPczOud5YXV+yGPJhXIDkwTN2VMsBkAaxUkOMZ3yIQ6kLGbn0y/53RY
	ADk9OSDm0rmooke3SHP6yiM1wx1YZBBdep0Ls55XF4g2gNso=
X-Received: by 2002:a17:90b:28ce:b0:3a0:809b:1972 with SMTP id 98e67ed59e1d1-3ab3a745e5bmr9610773a91.26.1791886635703;
        Tue, 13 Oct 2026 03:17:15 -0700 (PDT)
X-Received: by 2002:a17:90b:28ce:b0:3a0:809b:1972 with SMTP id 98e67ed59e1d1-3ab3a745e5bmr9610688a91.26.1791886633045;
        Tue, 13 Oct 2026 03:17:13 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd5dadd0986sm4186777a12.18.2026.10.13.03.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 03:17:12 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 03:16:46 -0700
Subject: [PATCH v3 2/3] phy: qcom: qmp-pcie: Add vdda-refgen supplies for
 Glymur
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-phy_refgen_1012-v3-2-f28305289499@oss.qualcomm.com>
References: <20261013-phy_refgen_1012-v3-0-f28305289499@oss.qualcomm.com>
In-Reply-To: <20261013-phy_refgen_1012-v3-0-f28305289499@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791886628; l=1908;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=0ADpLYpNVCDZL7nrJXO7P37xOu+fT5ppfN8VnN4oLWc=;
 b=BykP0ddZeN6ZlZ/7OdUSfD1JB8/NhxkH8PR7HzfTJWa5XKzn5bSJ1ef+5KWk8mAqALIhTWzJH
 kNDQmhPpYGRDWvH1w41Cqil9qfNYYGdcCM0aG0UlT7djZkcHqQiDEUR
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0MCBTYWx0ZWRfXwkxKVWOOGzUE
 J1ahUxeJ/TEV4RelSqSa+5RgJHwK8bsFQaJIl1EP87tWjRK/tPN+t82JCFUbfjYvf45nmkd+WXz
 QIv0c8RVGV0gdEHsTB0Zt4TF2VOmv6ot767VnD1oKAKhjZfatAJOwe3K9Ykvf91Q2KM5BV7VNKG
 A6C2TsL6opk42Qda6kXITLYtl1kR0afbS7EDb8TCFPk3kX55DXKX1UoTvBXxRr8yPhqsuNSo8qK
 hewZ7gZipo+Bjp7ST++2YKss8o7V4piYtPKlDV9m+pGJ/73mWbgbAbKWsyZfMBoU2lOMuXmimJf
 YDqDUa31od6hpAbjtQ1yJ7Z8eqOeXs3D0CMg8fXsz0j04hY622S0F7VgWMwYVLqUDFaD9Ovtqj+
 tl3kufD8wp9N97yxRoBURJlOoyf2w9lVZStdpxeZFGAi8bSR48Ak6c/mwdRwknuP+Z7AhLFFmW7
 Be9GDAlqU211bAgsH4w==
X-Authority-Analysis: v=2.4 cv=Z495j3RA c=1 sm=1 tr=0 ts=6ace052c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=m2jQVEIWa0EwQwJFt7gA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: 7ocxwtI-38rA0f5byTgZm2btI4YUztYD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0MCBTYWx0ZWRfX7C2TI7r63V78
 YR5o1AqwU0ccvxR4Dh4wNdUrQ56KSDEIXhkRMU7fWaih/LiBMsq7aDyf/ZxpBSx2bA43zzj4ZTp
 CWSs6XmFrgNZjZuMNmIKCBzMDA9l1dk=
X-Proofpoint-GUID: 7ocxwtI-38rA0f5byTgZm2btI4YUztYD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 phishscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130040

The refgen providing reference voltage for PCIe QMP PHY on Glymur requires
two power supplies independent from the PHY's core and qref rails. Add
support for vdda-refgen0p9 and vdda-refgen1p2 supplies with a dedicated
glymur_qmp_phy_vreg_l list.

Update both Gen5x4 and Gen4x2 configurations to use the new supply list.

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

