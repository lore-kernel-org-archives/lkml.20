Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F614FE2F5
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 12:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791981451; cv=none; b=DH7cVUHRZQQj/CyJbNovbCeQMU663TRh0gfycN6FoCfkOYtwPfvRKQbnDI0eLwTn7BpknyD1dKr6hG+NIC19DdgntmETAneimCT1Yqoiuc7WiGMnE/HjoSUIh8KQlPRd2GW1cp2iRTiBuPdR2PlWjZV23oenoOJ6W29KAiD66Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791981451; c=relaxed/simple;
	bh=E5+bN3D+sOSMI+IUMfDwqXdFOaJHc/HOHr/CKTtiO7A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=adGuigSsmg1pjIyrHdKtgZNCE/TtKWGVOeChagnFOGa+7U6StRwZ8L4/RtiwxXaZxEW6T0aKWxmFBPyT84vNR5MncAV6Hpa5LKbdDEKHh4dRBTSUdoUZanr9hvIL7X0f+9+fe76zjk9gsbsusEjZKVg8+/wpsWgiUy4x4095woE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fBAjplYu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CLN+83mK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fBAjplYu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CLN+83mK"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E7j2ZN3018226
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 12:37:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XhTimWLRVLL9+eUM2tB3gMhCDeAxv0EnsYkhKM2B8BY=; b=fBAjplYu8rnbz4pl
	jLxXGNu+kn88qr66sJRjr353pRJXQ+/rBFN+0aqlhl46LDOAWG0LbxNEkTNdR2OG
	jh1H4R5LqZMmFPyQ2rI2gGs6l1FPP8+SxjtTehM2Wn2Y52Fd9vXWF1RMrxeehR1Z
	30ev5PQXGqOXNdfEh3a7L5rEzIEnkUv6ZTLcGbCoSADextAVQauEL6bmSfgntujO
	cfc6vVng1YzOrC3BDEZie98cFbxqcQelZ2fLWqDPFBDD8Ig0I8nXi4F67OMEcwcX
	7KRryUFURIJdSyn5CN0O+P51SrtDHC6GDcQ/QuFL8EZoeWTYmWzR6+b+uPpd8xDp
	w1VGGA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9s2b4a47-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 12:37:28 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-917a2de2cc1so4066906d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 05:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791981448; x=1792586248; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XhTimWLRVLL9+eUM2tB3gMhCDeAxv0EnsYkhKM2B8BY=;
        b=CLN+83mKhzigU82e1D8xIVgJWfPdXEQB6SxtlmTVVkp53twUv2sM3m0uz7L2qxA0VU
         gpA1wH9+ATf1tmXp7BPSlwrch4oeLZq2kZoRlz3CqFRN1+jxmAHw7ITW1F3n0BhRs4xF
         f5XMrvNDb5KyA90ie8etqaoZJ95VU3/7dKhUUe6GUE6aCOQ7ff+4+c68EpWzMMGsrbyN
         qmZRcMCA6XV02qwKCvL2x+LuuEIC53cL05WPxktrqnrIJ121P5CGPq+mna5mLuXRRSGe
         C0JAw4+vUDzvl5eNnS6zwOhEgE1Lt744oA4ZhONOggdSLcSZP3bKdJ5izGHP/xenZCUz
         eizA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791981448; x=1792586248;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XhTimWLRVLL9+eUM2tB3gMhCDeAxv0EnsYkhKM2B8BY=;
        b=tR1d9NuOYVfY/VCdqkhKdir9aLhjIf6ZYQgx6yiQuvTHCOq24aNNnkl/42RbTfa9cQ
         hq3lgYyzZqzghECHwW3h1KxNMG6b02hHZ5IUDnIl8c8+cMWvtO2u5z2Bx2cn0J2lMUXL
         9dYBpeUxcKB1KcJSRec2O/P+i849H8T5OtP+IZRBEUoKFWwy+XRpq7QORJF6ZZO8F62+
         hY9wUoD802BEx7UevuURF7+/48EA623LtpZQG3L7Y2pY8fbRKYYwWdtIRUSEkWXpPaQE
         YhZEIVcqWZmK17Ec9KA1v6NiP4bsCOm/LGVN0dpBMg1/uhFvUUdC6H19XMDBFm+5+U06
         CZ0Q==
X-Forwarded-Encrypted: i=1; AKwUvBwv9CoAtsaMYL+6lJC3HgOgSSFSAjFXJVv2hIaL256B77iBvASSHRogLT+zBm72mPJXwO55Z6uiJ8J3JR0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKLbImc5enBQ6ZDf+aVUyp8aheCDEQwZcPNgfb/purd79DcblWR
	GMjk5tI+1SbZzhsKqBesugxiEhPly7EZXmI343PPHx14oGZksIzzWHNSFe+BVQHCx5GEWiEC4r2
	iZkGwdLQNPZCwit9SX4scQjLSXYfWpeGq2MaU9fqZ+fEmn4QcDuZg6YPZQbfJZLZ2fkQ=
X-Gm-Gg: AYBFou31EIEVrLhKxpO9l7ccG/P/Ou8g9bpcs5rg2AOM0VAiUImPDl5wuZma2BorC3L
	m+I665ybXtISEaerE4mCXMGPBGFX2pWKIRqFmYhfSJ/QVMz6JBT/qOd0UcPpAELfA/mmH7k9wMo
	z2Kq4pcX/4REv23ee+vNnAOyOmKZ3zvqo0zLYiLL7urU3Nj33mwGD3rhl6eOd9Zl6uMwKk9acUQ
	pq52BY0nNLXZqFmUI2WyyhGKNlvUk+X8PJEmmVKbqNAVU/MzqPTd89ZYxNPYbf2pYcbW5CLWPnZ
	fO+tnP3To8LBI7HQzDeppDAXVNgkDHksAi7P4UrGR5SbrQiJ1wJzQ5XS9TO+xSin3Hjfuvrfi8g
	cCTiieOdon7+gaFXT4Jw5CO6CBc4b
X-Received: by 2002:a05:620a:2985:b0:939:93a1:1383 with SMTP id af79cd13be357-93ebd2424b1mr2428522685a.32.1791981447323;
        Wed, 14 Oct 2026 05:37:27 -0700 (PDT)
X-Received: by 2002:a05:620a:2985:b0:939:93a1:1383 with SMTP id af79cd13be357-93ebd2424b1mr2428515685a.32.1791981446514;
        Wed, 14 Oct 2026 05:37:26 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a19f318c31sm206122615e9.3.2026.10.14.05.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 05:37:25 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 14:36:46 +0200
Subject: [PATCH net-next v16 7/7] net: stmmac: qcom-ethqos: add support for
 sa8255p
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-qcom-sa8255p-emac-v16-7-0266c2ead980@oss.qualcomm.com>
References: <20261014-qcom-sa8255p-emac-v16-0-0266c2ead980@oss.qualcomm.com>
In-Reply-To: <20261014-qcom-sa8255p-emac-v16-0-0266c2ead980@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vinod Koul <vkoul@kernel.org>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>, Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
        Romain Gantois <romain.gantois@bootlin.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Christophe Roullier <christophe.roullier@foss.st.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>, Radu Rendec <radu@rendec.net>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Drew Fustini <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev,
        linux-riscv@lists.infradead.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6602;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=E5+bN3D+sOSMI+IUMfDwqXdFOaJHc/HOHr/CKTtiO7A=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqz3ds1bIQs+DrRQ+UYZftvNuSxlqf0zl+QMIyW
 Tsd+CGnBBuJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCas93bAAKCRAFnS7L/zaE
 w2ziEACOjqFQuy0x40XxJZ/xl0i6ictP/z9z/Go10rQHDy+qpTl8SUcFwtVm8Qeg9H+66IyRoUM
 CTIK+9lLDnklaaK/X7v+vWqiuFN35N63oG+feQwfCu6epUnRbc86UWuVadyneO3VzlZc/RRhT+U
 6FJxQpcqb0QtjTeCQCHGMJj8+x+viVHyrLS2lStC4LBs014PiFN8XkG6vCOZBFW1XVTiB5kIcLj
 qI6TTqk505KpR5vhFeT3U0Ddt/bpbmZBxTKcWhUj9aGw1kwJS24Ha4UoRMMufJZhJYTyI/4q5cP
 I+V7MdCJZuKjXHoNl6G6BUo/QfTIV76quGOeM6P/z8mdA6QqpMsHnfUGLwyK00XUe7TL8xxIjRZ
 9EsKu5ggGAgC5b1erWogRHFB6Z3Jx2nQ03tNlDak//JgZU5uj4TeA1Ue0Kt55qj47gbNq8ePzFc
 m9YkpHijAPorQQ+/0tsviy7JXVlYrzIxRQm4nMR8y2ZMPup3PCn55FRJpMqN/0ZoXdq7KAWotwt
 yapYd8yGv6j8+zQ1MMLj7eSU+Z0uzcY0YHiaNRujTBFS7Wb4x3Y+JHZJCIvxWVAAI5MsIkx+1Wk
 r/GkGbq/G3dGmrCXTz/dbejgc26jAb2SdGJD+GJrbszdKXoPuwH5W+Q1JqPX50rbqs4FFKnzc05
 UzwFJ1st9Ah5JDw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=RPQmjIi+ c=1 sm=1 tr=0 ts=6acf7788 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=MNMbB-VoU2yS88OP0PEA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: XIzCajVGH1Z4UH-ouXMrYkgvVJq-mUFG
X-Proofpoint-ORIG-GUID: XIzCajVGH1Z4UH-ouXMrYkgvVJq-mUFG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1MCBTYWx0ZWRfX2oGf76l1gKgn
 2voZAkxcAyiDRvHoUgrCVpF9AAJjkEQpKomOvvYLzrqienAEUxLU861LogKNpdIEtja0UJR3VJA
 9VLhkOfH94Z0FDu+WJEll0mXR7QVH+wB8uwSItO7kCKi9OLAPNyPbA8upwdzkuSAzn3Enh8NeCX
 UbskTItAjtWxygv0SX6o2sccubERoZwOJqrPV1i++Rfn+ZFh5fsgGbpBj0GkTwv9ePZFXy1d6hY
 YhwhWfIMOP0P+rOtuNjFUuk2wXw4qfKnqG98r5iNnqorRZsAMPbekYk99BKiOL7Y3en2WV8BaBY
 YQefyViHl8Rj8Hynbp2FL3Kz46f9MPfQZ22vM+2+JIHXmQkmMoy8APxxwqtD7uc5xjw/LsXBO20
 yjwko3Iyi+inOZQYg3UeUcH3fjd/JYQFcJBiuJapL+XGTWAl6rZZalFcRAsoGDVKIMefwujucYM
 a/v/0AROi8qL1vwNTRw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1MCBTYWx0ZWRfX5PpST0wMT1W5
 yIBjmSNBsZCbTZqZtm2wBIQx50u0Wex1Elb59Xy/SnhPc0mZ85Ns8s4F6DOxO06PIQtzcpIZXfv
 ky7j8S1RahQMfc8kMMiAFnK6YIo9JOo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140050

Extend the driver to support a new model - sa8255p. Unlike the previously
supported variants, this one's power management is done in the firmware
over SCMI. This is modeled in linux using power domains so add a new
emac data variant and a separate setup callback.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 111 +++++++++++++++++++++
 1 file changed, 111 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 4e9c534fb240f0e08695282bb66cf6134415cc71..d59be76a20916de3febed400a64aff9763aac45d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -98,6 +98,11 @@ struct ethqos_emac_driver_data {
 	const char *link_clk_name;
 	struct dwmac4_addrs dwmac4_addrs;
 	bool needs_sgmii_loopback;
+	/* Fixed PTP reference clock rate, used on SCMI platforms where
+	 * firmware does not implement the clock protocol allowing linux to
+	 * query it.
+	 */
+	unsigned long ptp_clk_rate;
 	int (*setup)(struct qcom_ethqos *ethqos,
 		     struct plat_stmmacenet_data *plat_dat);
 };
@@ -108,6 +113,7 @@ struct qcom_ethqos {
 	struct clk *link_clk;
 	struct phy *serdes_phy;
 	phy_interface_t phy_mode;
+	struct dev_pm_domain_list *pds;
 	const struct ethqos_emac_driver_data *data;
 };
 
@@ -207,6 +213,8 @@ static void ethqos_set_func_clk_en(struct qcom_ethqos *ethqos)
 
 static int ethqos_hlos_setup(struct qcom_ethqos *ethqos,
 			     struct plat_stmmacenet_data *plat_dat);
+static int ethqos_scmi_setup(struct qcom_ethqos *ethqos,
+			     struct plat_stmmacenet_data *plat_dat);
 
 static const struct ethqos_emac_por emac_v2_3_0_por[] = {
 	{ .offset = RGMII_IO_MACRO_CONFIG,	.value = 0x00C01343 },
@@ -311,6 +319,30 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 	.setup = ethqos_hlos_setup,
 };
 
+static const struct ethqos_emac_driver_data emac_v4_0_0_scmi_data = {
+	.has_emac_ge_3 = true,
+	.needs_sgmii_loopback = true,
+	.dma_addr_width = 36,
+	.ptp_clk_rate = 230400000,
+	.dwmac4_addrs = {
+		.dma_chan = 0x00008100,
+		.dma_chan_offset = 0x1000,
+		.mtl_chan = 0x00008000,
+		.mtl_chan_offset = 0x1000,
+		.mtl_ets_ctrl = 0x00008010,
+		.mtl_ets_ctrl_offset = 0x1000,
+		.mtl_txq_weight = 0x00008018,
+		.mtl_txq_weight_offset = 0x1000,
+		.mtl_send_slp_cred = 0x0000801c,
+		.mtl_send_slp_cred_offset = 0x1000,
+		.mtl_high_cred = 0x00008020,
+		.mtl_high_cred_offset = 0x1000,
+		.mtl_low_cred = 0x00008024,
+		.mtl_low_cred_offset = 0x1000,
+	},
+	.setup = ethqos_scmi_setup,
+};
+
 static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 {
 	struct device *dev = &ethqos->pdev->dev;
@@ -759,6 +791,84 @@ static int ethqos_hlos_setup(struct qcom_ethqos *ethqos,
 	return 0;
 }
 
+static const char *const ethqos_scmi_pd_names[] = { "core", "mdio" };
+
+static int ethqos_scmi_setup(struct qcom_ethqos *ethqos,
+			     struct plat_stmmacenet_data *plat_dat)
+{
+	const struct dev_pm_domain_attach_data pd_data = {
+		.pd_names	= ethqos_scmi_pd_names,
+		.num_pd_names	= ARRAY_SIZE(ethqos_scmi_pd_names),
+		.pd_flags	= PD_FLAG_DEV_LINK_ON,
+	};
+
+	struct platform_device *pdev = ethqos->pdev;
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	ret = devm_pm_domain_attach_list(dev, &pd_data, &ethqos->pds);
+	if (ret < 0)
+		return dev_err_probe(dev, ret,
+				     "Failed to attach power domains\n");
+
+	/*
+	 * The MAC AXI/AHB clocks are owned by firmware and brought up through
+	 * the "core" and "mdio" SCMI power domains above, while the SerDes
+	 * lane is powered by the SerDes PHY's own power domain from
+	 * serdes_powerup() in stmmac_open(). The MAC wrapper itself, however
+	 * is in the kernel's register space: the wrapper bit that loops the
+	 * PHY TX clock into the MAC's clk_rx_i - needed because no recovered
+	 * RX clock exists yet - is not configured by firmware. Without it,
+	 * clk_rx_i never toggles and the DMA SW-reset polled in
+	 * dwmac4_dma_reset() never completes.
+	 *
+	 * Map the wrapper and program the same loopback/functional clock bits
+	 * the non-firmware platforms rely on (see ethqos_clks_config) so the
+	 * RX clock is present by the time the DMA engine is reset.
+	 */
+	ethqos->rgmii_base = devm_platform_ioremap_resource_byname(pdev, "rgmii");
+	if (IS_ERR(ethqos->rgmii_base))
+		return dev_err_probe(dev, PTR_ERR(ethqos->rgmii_base),
+				     "Failed to map rgmii resource\n");
+
+	/*
+	 * Register clks_config to run on every subsequent runtime resume,
+	 * which stmmac performs after the power domains are on but before
+	 * serdes_powerup() and the DMA reset. This alone isn't enough for
+	 * the very first reset done from stmmac_open(), though: probe()
+	 * fakes the device into RPM_ACTIVE without invoking the resume
+	 * callback, so whether clks_config() has run by then depends on
+	 * whether the device has already gone through one real suspend/resume
+	 * cycle in the meantime. Call it here explicitly so the wrapper is
+	 * always configured before the first DMA reset regardless of that
+	 * timing.
+	 */
+	plat_dat->clks_config = ethqos_clks_config;
+
+	ret = ethqos_clks_config(ethqos, true);
+	if (ret)
+		return ret;
+
+	ret = devm_add_action_or_reset(dev, ethqos_clks_disable, ethqos);
+	if (ret)
+		return ret;
+
+	plat_dat->clk_ptp_rate = ethqos->data->ptp_clk_rate;
+
+	switch (ethqos->phy_mode) {
+	case PHY_INTERFACE_MODE_2500BASEX:
+	case PHY_INTERFACE_MODE_SGMII:
+		plat_dat->fix_mac_speed = ethqos_fix_mac_speed_sgmii;
+		break;
+	default:
+		/* The firmware-managed SerDes only supports SGMII modes. */
+		return dev_err_probe(dev, -EINVAL, "Unsupported phy-mode: %s\n",
+				     phy_modes(ethqos->phy_mode));
+	}
+
+	return 0;
+}
+
 static int qcom_ethqos_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -851,6 +961,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 
 static const struct of_device_id qcom_ethqos_match[] = {
 	{ .compatible = "qcom,qcs404-ethqos", .data = &emac_v2_3_0_data},
+	{ .compatible = "qcom,sa8255p-ethqos", .data = &emac_v4_0_0_scmi_data},
 	{ .compatible = "qcom,sa8775p-ethqos", .data = &emac_v4_0_0_data},
 	{ .compatible = "qcom,sc8280xp-ethqos", .data = &emac_v3_0_0_data},
 	{ .compatible = "qcom,sm8150-ethqos", .data = &emac_v2_1_0_data},

-- 
2.47.3

