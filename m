Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D99C471436
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 14:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787925967; cv=none; b=X5mjl17SN2GLjcGSrgRqWhs2qSdkpieOGlZKNG86emkFPlOEez7Sbe50WkcBwzimt2nIHedaTph7Q1qECn+DJEnU536OoAQVp5YcYH1vL0+zJlGWtwm4ZA7lIhgN++rhSKOZ5pBWcu0JZfdankxUunV84vsPTOca2atOGElf8b8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787925967; c=relaxed/simple;
	bh=TFD7OxK0nKgmK6LkkgSLDOQwhyzVdGMprTJzlWvgrQw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l1axqy3IXLpMShnttMOOGMhY0jJ2KnNt7w5QSybMXttBaVBcdRBBzxMch9eQ61pqmfARbcOXcTjk98bObQQCZRrpyl+0MNv6Ft48uaIOjFKlUg4H+FWlE49/HqsGAzg3P0nYjbNRXx2fUqA/o6wKA/oQECXzhlV9nvlc2Div0y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TVG60rPW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D/zLONz5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TVG60rPW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D/zLONz5"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SDkwJI2059374
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 14:05:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TuA61V9KIrJPKXiNzAYL18DVRFCt29el3seC+dFqtJw=; b=TVG60rPWDee+G0t2
	lW65leJJAI6QihO2tcEkzv3Uf1UZyI+H9WS7E7lt/GRKThtDuuCQl6/GEb28XlwJ
	nO3esmSxfEzVpvnsNGv8w+bRymuF/k85MksS7XReIHbm7L+EJcmwioZxRBWyS2nE
	DyvLRAi7u9Kcc3sy/Amnq+hvdixGYye1SqwVhClYN18mBXZripHgwixQFYwQa+mF
	S8pWHWdCIlyM+GmO46giAFRc0xU17QbtpAkFDZ1wbxefqDt600+NprUybO6m4GRn
	O3UMIF2JrsuLd7TbouiyERcdcGRcJyrtuYLnnWu5Uvb4qKLXzYMGIuSoZz3YcX96
	xUJutA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbag9ra22-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 14:05:57 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-783b725c8c8so888366137.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 07:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787925956; x=1788530756; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TuA61V9KIrJPKXiNzAYL18DVRFCt29el3seC+dFqtJw=;
        b=D/zLONz52q9CQHDKTFxc7e8r8RaxgCrqhsheU6kDds2YICLUvr+bUbd1J+2L/bOg6b
         2SH8rX471LH4MJ9jvBjV2tJiHN7cdty0YDwjM7waQvmQRmGYMYCfJVJ53XrCi6p2B0z2
         SXVgFkG2eOYzEqgGlI/YmLoz79vimwE1qIWZfwijmd3bHeZTHRe2pnsH/1OlFn6LWs8Y
         FlHES/D/78mG6HaRk4VbgQAz9AZCbWkMtLBWAirx7to+Ho73Zr6zvfa7F66gqrRjMxU3
         1iRhhTVm6WASuuZ/TJj0QJoKgzV/lLKJ4Zys4ORuBHIGnzouwCevM5H+GJnZrzLXhH3U
         vztQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787925956; x=1788530756;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TuA61V9KIrJPKXiNzAYL18DVRFCt29el3seC+dFqtJw=;
        b=QH/K/4yQ1g3TINt/XkLo1LGxkE7nrBkN+ZTyZCNG01Hog4tf0sJucbDc2qhmd46B4x
         x9TUvFx3ZWkW6Eli8FJTjpIs3uHl3kTz4IJqiZyOdEzGjDYlBoaPJ63YQH2meOHRmSwC
         7Ol1GdGV/gWAPrx+UIXdIb0aXBDLsEf2Gw0aIiVdjleQqSF3qA78RhV6NgwUUq7p0Gon
         Yb6xtALbut+wz/uqCN5nDz2cFHbvUjHvJZ76z2xYwd0/5SR66NHNwQM2jmbiR9RuAPMw
         GNTuok2urSVwXZaQB8FWRgYtqX4g08cozHZJItSyHLB54uPpLzKLCBqz0xxHWy1MRVjF
         JjUw==
X-Forwarded-Encrypted: i=1; AHgh+RqDAhEGrBOls5tOHgFeVA73D4xyhzkaorYprSZf+yBYp06+0J/+ZAfE4dvSE5l3sxFrRl+UBdGE/6IL/oA=@vger.kernel.org
X-Gm-Message-State: AFuF++nQ5M3+DYYv7ZIw/aMLiiM5g4f5vXSQGSVWA7QT39mpfenlNJYd
	m9BUSQWyrtvnzwFe800uJG7M0B+sQm0tyepP3eHllCyVol7whPdD+qbDy18OrhfrS5/AYGX5mz2
	y97ea+o0RloTy2OREiUK+W5LTpcN0N7MQRfGMJcDHEPf/imp7sV4gFbUWjltfko/soRI=
X-Gm-Gg: AR+sD10ozvOFotrW+DrcUXk5fy1GqiCglGpJJKK37odKMQiWi9Eck3hF/dZXeM8uN+R
	Bn3FevLzb3bZaoZ5Jmh0WDZ1fUk+Zwn7NuIMWjbFwoFodVI8yPKQW1KmkakgaAFmnfKYEQUS/km
	EnYBe4Y5NvLXy8RcydFSx+R7T5UN9fyZaQIihlpmboE4GYilWHJW3ZjpFNrMCo8q44L6RhJ+4sk
	qG2FOoR1yOLsI2lpXizYFP5Vjw4GoB1ZZFVB7kj3VuHbzv5uQm7tCqm9qxws/93oCTTtgqEDuLD
	E8F21cI5YNZSvvsLJ7cX4ekNOE9Qa8dYYXbhb5SuZSrtm9HJH1/awKvZA3t/sbENurylpFQLhmL
	D1bBO8Tr/RY31aX/4TVE1vFk=
X-Received: by 2002:a05:6102:8099:b0:786:8a7:92e3 with SMTP id ada2fe7eead31-78608a79338mr1681040137.2.1787925955753;
        Fri, 28 Aug 2026 07:05:55 -0700 (PDT)
X-Received: by 2002:a05:6102:8099:b0:786:8a7:92e3 with SMTP id ada2fe7eead31-78608a79338mr1680934137.2.1787925954995;
        Fri, 28 Aug 2026 07:05:54 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb20122sm3908633f8f.20.2026.08.28.07.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 07:05:54 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 16:05:08 +0200
Subject: [PATCH RFC/DO NOT MERGE 10/12] drm/msm/hdmi_phy_eliza: Add support
 for Synopsys-based HDMI phy on Eliza
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-drm-msm-hdmi-eliza-v1-10-67843277de17@oss.qualcomm.com>
References: <20260828-drm-msm-hdmi-eliza-v1-0-67843277de17@oss.qualcomm.com>
In-Reply-To: <20260828-drm-msm-hdmi-eliza-v1-0-67843277de17@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-phy@lists.infradead.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=35366;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=TFD7OxK0nKgmK6LkkgSLDOQwhyzVdGMprTJzlWvgrQw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqkZWhxwFRkSDeg7hFwENH5Duj9noh8zuI973Yn
 5T6W73ltTmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCapGVoQAKCRDBN2bmhouD
 19bPD/0ZS2P3unGyhQ7el/GaFcJiBnh/BCJAInMUS79XlLIZGnWMPfzrVu5zkmL601iwKK5dWg7
 pb6vJNiKhwjvi/MYawhqyVe1Ev6zeNAniWMiX0nQPJ0vKbbwPAvocfoyyXWqzH37rsm+7e9flxF
 Ws1Op2F3sMiosurjBxNdBmOMrkSZiSRz2zdH8NoUqwg5QvFw3wh6tUf4I6bF/DDwNI9G/dxZ2uC
 Ygc8xgW6LCbkWi38K82xI8Cmz+Amv1Ea+SxHRD3yVcwTqwaN86gQMLP/1PvW4hIyx0bClKg4I03
 +olGPS2hFXNwEancybLR1ZoXXokujWTbOFdGNagyJJZhcj8em1xw70duxqrN8+afO5naBuVcGkA
 lVKELBsW9AiBDAv0zl8SaoauNIo8m5/Ry3f6+4/q8ke+tiYs/UI2/Ho9MhT4JeBhIC58aMKV0UL
 Lq9MRqR7EGVtyNDs3GjpotmxEedMEQm1PtA+onnBU6EqndP1X4bNWeKie3h8riL40yUD7L4G/un
 +KrRZEXJ4lFGt3t+3dQFu2NJjQpaoQHFx49LtQi3KZczuW5bQG3hCXtpfXmAjvoK8Iz5N7tQssW
 K2fgc7z9xl1HvYfsVU5yR2GP6OKUcUhyQiSn5u1vlAFYH/gLUxi9I4CW+tDsSf2TylgPOLyMIRE
 bgglepvmcJL8ofA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=UalhjqSN c=1 sm=1 tr=0 ts=6a9195c5 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=NH6Z_mJ-D20XBFIEgKYA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDEyMiBTYWx0ZWRfXx2xZRH9xL1no
 kmpxR/TyW55y37DlywlTdN5RPu03Pxg2YPYfYzcHO4fzM16DRulJOPFgOwpqujDTQ/iA5svOoTe
 CQWlkwMwx4qxjiGwrclLJRoOmMwVUdU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDEyMiBTYWx0ZWRfX0bpE3N1Ov2AQ
 jRCRbmT5b4HGutYvAXiYHyBgm3PoefxeRwwTRYKpegSQDmlw+rpnxiM3fbzKKR+NWQuYG6EfZM2
 u7ShnJGG4ZhYvifrx/EDTugXBwHZH9332PqgpzKRJp2DrLaEPudzvvoSHsH5z8rmQobtbbTEZ2m
 1+5rhDBYGPWOB0ZYFTgIlE5f6ZWAw01lB9dEQp3o/VWCgfGWCydUu00NpIoMu67zab3cLIRGzqS
 mYumWxa3ZsZwZpZONvOmeu2RW9nciOgsf3lhIR+Z9lEAks9S+RDnlHkuLnnVGEaYXhsr+wejVDI
 ny2RspuCJyfVe6VQhcHlznIrSJwuHRQCc8N6WrTC7ekeS8Ma5GDxImfU0ggB1rhhe3ShgjtqTBI
 c2Afe937cfC5yXmAD8tpcLaJ2nA8coVx2A+4wFwi1DgEdhi6slN/1H/A0Dr+PZGSNTDiR9LNtCb
 +mNMYYsBP7B0zX9ms+g==
X-Proofpoint-ORIG-GUID: 4onSq1uezTVCfqpO_wuxfAMSm5GDXldG
X-Proofpoint-GUID: 4onSq1uezTVCfqpO_wuxfAMSm5GDXldG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_04,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280122

Add driver for HDMI phy block from Synopsys used on Eliza SoC.  There is
no similarity regarding older HDMI phys.

Core parts for handling HDMI phy needs some adjustments as well, because
according to programming sequence:
1. The HDMI PHY should be initialized before preparing its PLL.
2. Final power up - enabling the TX lanes - should be performed after
   PLL is prepared.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/Makefile                   |   1 +
 drivers/gpu/drm/msm/hdmi/hdmi.h                |  18 +
 drivers/gpu/drm/msm/hdmi/hdmi_phy.c            |  12 +-
 drivers/gpu/drm/msm/hdmi/hdmi_phy_eliza.c      | 723 +++++++++++++++++++++++++
 drivers/gpu/drm/msm/registers/display/hdmi.xml | 140 +++++
 5 files changed, 892 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index d0c3a4c6703b..ae343a250bb0 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -43,6 +43,7 @@ msm-display-$(CONFIG_DRM_MSM_HDMI) += \
 	hdmi/hdmi_phy_8998.o \
 	hdmi/hdmi_phy_8x60.o \
 	hdmi/hdmi_phy_8x74.o \
+	hdmi/hdmi_phy_eliza.o \
 	hdmi/hdmi_pll_8960.o \
 
 msm-display-$(CONFIG_DRM_MSM_MDP4) += \
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
index 2fa9bec455b4..945fbb4d9888 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.h
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
@@ -149,6 +149,7 @@ enum hdmi_phy_type {
 	MSM_HDMI_PHY_8x74,
 	MSM_HDMI_PHY_8996,
 	MSM_HDMI_PHY_8998,
+	MSM_HDMI_PHY_ELIZA,
 	MSM_HDMI_PHY_MAX,
 };
 
@@ -169,6 +170,7 @@ extern const struct hdmi_phy_cfg msm_hdmi_phy_8960_cfg;
 extern const struct hdmi_phy_cfg msm_hdmi_phy_8x74_cfg;
 extern const struct hdmi_phy_cfg msm_hdmi_phy_8996_cfg;
 extern const struct hdmi_phy_cfg msm_hdmi_phy_8998_cfg;
+extern const struct hdmi_phy_cfg msm_hdmi_phy_eliza_cfg;
 
 struct hdmi_phy {
 	struct platform_device *pdev;
@@ -190,6 +192,16 @@ static inline u32 hdmi_phy_read(struct hdmi_phy *phy, u32 reg)
 	return readl(phy->mmio + reg);
 }
 
+static inline void hdmi_phy_update_bits(struct hdmi_phy *phy, u32 reg, u32 mask, u32 data)
+{
+	u32 val;
+
+	val = hdmi_phy_read(phy, reg);
+	val &= ~mask;
+	val |= data & mask;
+	hdmi_phy_write(phy, reg, val);
+}
+
 int msm_hdmi_phy_resource_enable(struct hdmi_phy *phy);
 void msm_hdmi_phy_resource_disable(struct hdmi_phy *phy);
 void msm_hdmi_phy_init(struct hdmi_phy *phy, unsigned long pixclock);
@@ -203,6 +215,7 @@ void __exit msm_hdmi_phy_driver_unregister(void);
 int msm_hdmi_pll_8960_init(struct platform_device *pdev);
 int msm_hdmi_pll_8996_init(struct platform_device *pdev);
 int msm_hdmi_pll_8998_init(struct platform_device *pdev);
+int msm_hdmi_pll_eliza_init(struct platform_device *pdev);
 #else
 static inline int msm_hdmi_pll_8960_init(struct platform_device *pdev)
 {
@@ -218,6 +231,11 @@ static inline int msm_hdmi_pll_8998_init(struct platform_device *pdev)
 {
 	return -ENODEV;
 }
+
+static inline int msm_hdmi_pll_eliza_init(struct platform_device *pdev)
+{
+	return -ENODEV;
+}
 #endif
 
 /*
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
index 8ce87d9adf74..94dc0e5c5c3e 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
@@ -141,6 +141,9 @@ static int msm_hdmi_phy_pll_init(struct platform_device *pdev,
 	case MSM_HDMI_PHY_8998:
 		ret = msm_hdmi_pll_8998_init(pdev);
 		break;
+	case MSM_HDMI_PHY_ELIZA:
+		ret = msm_hdmi_pll_eliza_init(pdev);
+		break;
 	/*
 	 * we don't have PLL support for these, don't report an error for now
 	 */
@@ -168,13 +171,17 @@ static int msm_hdmi_phy_probe(struct platform_device *pdev)
 	if (!phy->cfg)
 		return -ENODEV;
 
-	phy->mmio = msm_ioremap(pdev, "hdmi_phy");
+	if (phy->cfg->num_regs)
+		phy->mmio = msm_ioremap(pdev, "hdmi_phy");
+	else
+		phy->mmio = msm_ioremap(pdev, NULL);
 	if (IS_ERR(phy->mmio)) {
 		DRM_DEV_ERROR(dev, "%s: failed to map phy base\n", __func__);
 		return -ENOMEM;
 	}
 
 	phy->pdev = pdev;
+	platform_set_drvdata(pdev, phy);
 
 	ret = msm_hdmi_phy_resource_init(phy);
 	if (ret)
@@ -195,7 +202,6 @@ static int msm_hdmi_phy_probe(struct platform_device *pdev)
 
 	msm_hdmi_phy_resource_disable(phy);
 
-	platform_set_drvdata(pdev, phy);
 
 	return 0;
 }
@@ -218,6 +224,8 @@ static const struct of_device_id msm_hdmi_phy_dt_match[] = {
 	  .data = &msm_hdmi_phy_8996_cfg },
 	{ .compatible = "qcom,hdmi-phy-8998",
 	  .data = &msm_hdmi_phy_8998_cfg },
+	{ .compatible = "qcom,eliza-hdmi-phy",
+	  .data = &msm_hdmi_phy_eliza_cfg },
 	{}
 };
 MODULE_DEVICE_TABLE(of, msm_hdmi_phy_dt_match);
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy_eliza.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy_eliza.c
new file mode 100644
index 000000000000..fad4e828154e
--- /dev/null
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy_eliza.c
@@ -0,0 +1,723 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/array_size.h>
+#include <linux/bitfield.h>
+#include <linux/clk-provider.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/gcd.h>
+#include <linux/iopoll.h>
+#include <linux/minmax.h>
+#include <linux/types.h>
+
+#include "hdmi.h"
+
+#define REF_CLK_HZ				38400000 /* 38.4 MHz */
+#define HDMI_PLL_MAX_FREQ			600000000 /* 600 MHz */
+/* Unscrambled clock freq threshold */
+#define HDMI_PLL_HIGH_FREQ			340000000 /* 340 Mhz */
+#define HDMI_PLL_MIN_FREQ			25000000
+
+#define HDMI_PHY_MAX_BIT_RATE			2500000000 /* 2.5 Gbps */
+
+/* Number of TX lanes */
+#define HDMI_PHY_TXN_CONTROL			4
+
+#define MPLL(mul, qut, rem, den, clkd, vcof, pat, rxv, in, prop) \
+	.multiplier = (mul), \
+	.quotient = (qut), \
+	.remainder = (rem), \
+	.denominator = (den), \
+	.tx_clk_div = (clkd), \
+	.vco_freq = (vcof), \
+	.clk_pat = (pat), \
+	.rxvcosel = (rxv), \
+	.cp_int_holder = (in), \
+	.cp_prop_holder = (prop)
+
+struct hdmi_eliza_phy_pll_reg_cfg {
+	u32 vco_freq;
+	u32 rxvcosel;
+	u32 tx_clk_div;
+	u32 cp_int_holder;
+	u32 cp_prop_holder;
+	u32 quotient;
+	u32 remainder;
+	u32 multiplier;
+	u32 denominator;
+	u32 clk_pat;
+};
+
+struct hdmi_pll_eliza {
+	struct device *dev;
+	struct clk_hw clk_hw;
+	unsigned long rate;
+	struct hdmi_eliza_phy_pll_reg_cfg cfg;
+};
+
+
+struct hdmi_pll_eliza_mpll {
+	unsigned long rate;
+	struct hdmi_eliza_phy_pll_reg_cfg cfg;
+};
+
+static const struct hdmi_pll_eliza_mpll mpll_lut[] = {
+	{ 25200000, { MPLL(0xb0, 0xe525, 0, 1, 5, 2, 0, 3, 0xc, 0x11) }, },
+	{ 27000000, { MPLL(0xc0, 0x8000, 0, 1, 5, 2, 0, 3, 0xc, 0x11) }, },
+	{ 27027000, { MPLL(0xc0, 0x9ccc, 4, 1, 5, 2, 0, 3, 0xb, 0x12) }, },
+	{ 54000000, { MPLL(0xc0, 0x8000, 0, 1, 4, 2, 0, 3, 0xb, 0x11) }, },
+	{ 59400000, { MPLL(0xd6, 0xc000, 0, 1, 4, 2, 0, 3, 0xb, 0x12) }, },
+	{ 72000000, { MPLL(0x76, 0x0000, 0, 1, 3, 3, 0, 4, 0xc, 0x10) }, },
+	{ 74250000, { MPLL(0x7a, 0x5800, 0, 1, 3, 3, 0, 4, 0xb, 0x12) }, },
+	{ 82500000, { MPLL(0x8a, 0xf000, 0, 1, 3, 3, 0, 4, 0xb, 0x11) }, },
+	{ 90000000, { MPLL(0x9a, 0xc000, 0, 1, 3, 2, 0, 4, 0xd, 0x11) }, },
+	{ 99000000, { MPLL(0xae, 0x2000, 0, 1, 3, 2, 0, 4, 0xc, 0x11) }, },
+	{ 108000000, { MPLL(0xc0, 0x8000, 0, 1, 3, 2, 0, 3, 0xb, 0x11) }, },
+	{ 118800000, { MPLL(0xd6, 0xc000, 0, 1, 3, 2, 0, 3, 0xb, 0x12) }, },
+	{ 148500000, { MPLL(0x7a, 0x5800, 0, 1, 2, 3, 0, 4, 0xc, 0x11) }, },
+	{ 165000000, { MPLL(0x8a, 0xf000, 0, 1, 2, 3, 0, 4, 0xb, 0x11) }, },
+	{ 185625000, { MPLL(0xa0, 0xae00, 0, 1, 2, 2, 0, 4, 0xc, 0x11) }, },
+	{ 198000000, { MPLL(0xae, 0x2000, 0, 1, 2, 2, 0, 4, 0xc, 0x11) }, },
+	{ 297000000, { MPLL(0x7a, 0x5800, 0, 1, 1, 3, 0, 4, 0xc, 0x11) }, },
+	{ 371250000, { MPLL(0xa0, 0xae00, 0, 1, 1, 2, 1, 4, 0xc, 0x11) }, },
+	{ 396000000, { MPLL(0xae, 0x2000, 0, 1, 1, 2, 1, 4, 0xc, 0x11) }, },
+	{ 495000000, { MPLL(0xe0, 0xe800, 0, 1, 1, 2, 1, 3, 0xb, 0x12) }, },
+	{ 594000000, { MPLL(0x7a, 0x5800, 0, 1, 0, 3, 1, 4, 0xc, 0x11) }, },
+};
+
+#define hw_clk_to_pll(x) container_of(x, struct hdmi_pll_eliza, clk_hw)
+
+static struct hdmi_phy *pll_get_phy(struct hdmi_pll_eliza *pll)
+{
+	return dev_get_drvdata(pll->dev);
+}
+
+static const struct hdmi_eliza_phy_pll_reg_cfg *
+hdmi_pll_eliza_mpll_lut_decoder(unsigned long rate)
+{
+	const struct hdmi_eliza_phy_pll_reg_cfg *cfg = NULL;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(mpll_lut); i++) {
+		if (rate == mpll_lut[i].rate) {
+			cfg = &mpll_lut[i].cfg;
+			break;
+		}
+	}
+
+	return cfg;
+}
+
+static int hdmi_eliza_pll_calculator(struct hdmi_pll_eliza *pll,
+				     unsigned long rate,
+				     unsigned long parent_rate,
+				     struct hdmi_eliza_phy_pll_reg_cfg *cfg)
+{
+	const s64 bit_rate_multiplier = 1000;
+	const s64 bit_rate_divider = 1000;
+	const s64 cp_int_param[3] = {4524, -679588, 30860643};
+	const s64 cp_prop_param[3] = {8023, -1160252, 51717042};
+	const u64 gmult = 1e4;
+	s64 expon, base_rate, bit_rate;
+	s64 ref_clk_int, ref_clk_div;
+	u64 aux0, aux1, aux2, vco_freq;
+	u64 utemp, utemp2, multiplier, f_rx_vco;
+	s64 stemp, stemp2, stemp3;
+	s32 choice1, ref_ana_mpll_div;
+	s64 precision3 = 1e3;
+	s64 precision6 = 1e6;
+
+	if (rate > HDMI_PLL_HIGH_FREQ)
+		cfg->clk_pat = 1;
+	else
+		cfg->clk_pat = 0;
+
+	/*
+	 * base_rate = clock_khz  * bit_rate_multiplier / 1000
+	 * Division by 1000, nullifies the conversion from KHz to Hz.
+	 */
+	base_rate = rate / 1000 * gmult;
+
+	/* bit_rate = clock_khz * bit_rate_multiplier/bit_rate_divider. */
+	utemp = DIV_ROUND_UP(bit_rate_multiplier, bit_rate_divider);
+
+	bit_rate = base_rate * utemp;
+
+	/*
+	 * REF_CLK_HZ: 38.4 MHz
+	 * min_ref_clk: 50
+	 * choice1 = floor(log2(REF_CLK_HZ/min_ref_clk))
+	 * choice1 = floor(-0.38)
+	 */
+	choice1 = -1;
+	ref_ana_mpll_div = max_t(s32, choice1, 0);
+
+	/* ref_clk_div = 2**ref_ana_mpll_div; */
+	ref_clk_div = 1UL << ref_ana_mpll_div;
+	ref_clk_int = DIV_ROUND_UP(REF_CLK_HZ, ref_clk_div);
+
+	/* expon = floor(log2(4.999999e9/base_rate)) */
+	utemp = 4.999999e9;
+
+	expon = fls64(utemp / base_rate) - 1;
+	if (expon >= 0)
+		vco_freq = base_rate * (1UL << expon);
+	else
+		vco_freq = base_rate >> 1;
+
+	/* multiplier = 2*(floor(bit_rate) * 2**expon / ref_clk_int) -16) */
+	multiplier = DIV_ROUND_UP(vco_freq, ref_clk_int);
+	multiplier = 2 * (multiplier - 16 - 1);
+	cfg->multiplier = multiplier;
+
+	/* f_rx_vco = bit_rate * 2**floor(log2(6e9/bit_rate)); */
+	utemp = 6e9;
+	f_rx_vco = DIV_ROUND_UP(utemp, bit_rate);
+	f_rx_vco = ilog2(f_rx_vco);
+	f_rx_vco = bit_rate * (1UL << f_rx_vco);
+
+	utemp = 4e9;
+	if (f_rx_vco < utemp)
+		f_rx_vco *= 2;
+
+	utemp = 5e9;
+	if (f_rx_vco > utemp)
+		cfg->rxvcosel = 4;
+	else
+		cfg->rxvcosel = 3;
+
+	/*
+	 * aux0 = (bit_rate * 2**expon / ref_clk_int - (multiplier/2 + 16);
+	 * aux0 = aux0 * 2** 16;
+	 */
+	if (expon >= 0)
+		utemp = bit_rate * (1UL << expon);
+	else
+		utemp = bit_rate >> 1;
+
+	/*
+	 * Need to store the floating-point values as they are
+	 * essential for precise computations; thus, increasing
+	 * the precision by 10^6.
+	 */
+
+	utemp *= precision6;
+	utemp = DIV_ROUND_UP(utemp, ref_clk_int);
+	aux0 = utemp - (((multiplier >> 1) + 16)) * precision6;
+	cfg->quotient = (aux0 * (1UL << 16)) / precision6;
+
+	/* aux1 = ref_clk_int * bit_rate_divider */
+	aux1 = ref_clk_int * bit_rate_divider;
+
+	/*
+	 * aux2 = bit_rate * bit_rate_divider * 2**expon;
+	 * aux2 = aux2 - ((multiplier/2 + 16) * aux1 * 2**16);
+	 * aux2 = aux2 - aux1 *aux0;
+	 */
+
+	if (expon >= 0)
+		aux2 = bit_rate * (1UL << expon);
+	else
+		aux2 = bit_rate >> 1;
+
+	aux2 *= bit_rate_divider;
+	utemp = ((multiplier >> 1) + 16) * aux1;
+	aux2 = ((aux2 - utemp) * (1UL << 16)) - (cfg->quotient * aux1);
+
+	if (aux2 == 0) {
+		cfg->remainder = 0;
+		cfg->denominator = 1;
+	} else {
+		cfg->remainder = DIV_ROUND_UP(aux2, gcd(aux1, aux2));
+		cfg->denominator = DIV_ROUND_UP(aux1, gcd(aux1, aux2));
+	}
+
+	/* tx_clk_div = log2(round(vco_freq/base_rate) * 2) */
+	utemp = DIV_ROUND_UP(vco_freq, base_rate);
+	cfg->tx_clk_div = ilog2(utemp * 2);
+
+	/*
+	 * FIXME: For rate 198000000, LUT has vco_freq 2 but calculator gives 3
+	 * FIXME: For rate 198000000 and many others, LUT has cp_prop_holder 11,
+	 * but calculator gives 12
+	 */
+	utemp = 3.389e9;
+	utemp2 = 5e9;
+	if (vco_freq <= utemp) {
+		cfg->vco_freq = 2;
+	} else if (vco_freq < utemp2) {
+		cfg->vco_freq = 3;
+	} else {
+		DRM_DEV_ERROR(pll->dev, "bit_rate and vco_freq combination not supported: %llu",
+			      vco_freq);
+		return -EINVAL;
+	}
+
+	/* stemp = (REF_CLK_MHZ/2**ref_ana_mpll_div) */
+	stemp = (REF_CLK_HZ / 1000000) * precision3;
+	stemp = DIV_ROUND_CLOSEST(stemp, 1UL << ref_ana_mpll_div);
+
+	/* stemp2 = cp_int_param[0] * stemp**2; */
+	stemp2 = stemp * stemp * cp_int_param[0];
+	stemp2 = DIV_ROUND_CLOSEST(stemp2, precision6);
+
+	/* stemp3 = cp_int_param[1] * stemp; */
+	stemp3 = stemp * cp_int_param[1];
+	stemp3 /= precision3;
+
+	/*
+	 * cp_int_holder = floor(cp_int_param[0]*(stemp)**2
+	 *                      + cp_int_param[1] * stemp
+	 *                      + cp_int_param[2])
+	 */
+	stemp3 += cp_int_param[2];
+	stemp3 += stemp2;
+
+	cfg->cp_int_holder = DIV_ROUND_CLOSEST(stemp3, precision6);
+
+	/* stemp2 = cp_prop_param[0] * stemp**2; */
+	stemp2 = stemp * stemp * cp_prop_param[0];
+	stemp2 = DIV_ROUND_CLOSEST(stemp2, precision6);
+
+	/* stemp3 = cp_prop_param[1] * stemp; */
+	stemp3 = (stemp * cp_prop_param[1]) / precision3;
+
+	/*
+	 * cp_int_holder = floor(cp_prop_param[0]*(stemp)**2
+	 *                      + cp_prop_param[1] * stemp
+	 *                      + cp_prop_param[2])
+	 */
+	stemp3 += stemp2 + cp_prop_param[2];
+
+	cfg->cp_prop_holder = DIV_ROUND_CLOSEST(stemp3, precision6) - 1;
+
+	return 0;
+}
+
+static int hdmi_eliza_pll_configure_pll(struct hdmi_pll_eliza *pll,
+					unsigned long rate,
+					unsigned long parent_rate)
+{
+	struct hdmi_phy *phy = pll_get_phy(pll);
+	const struct hdmi_eliza_phy_pll_reg_cfg *cfg;
+	struct hdmi_eliza_phy_pll_reg_cfg cfg_calc = {};
+	int ret;
+	u32 val;
+
+	cfg = hdmi_pll_eliza_mpll_lut_decoder(rate);
+	if (!cfg) {
+		DRM_INFO("no valid mpll entry fall back to calculator");
+
+		ret = hdmi_eliza_pll_calculator(pll, rate, parent_rate, &cfg_calc);
+		if (ret) {
+			DRM_ERROR("PLL calculation failed for rate %lu\n", rate);
+			return ret;
+		}
+		cfg = &cfg_calc;
+	}
+
+	hdmi_phy_update_bits(phy, REG_HDMI_ELIZA_PHY_CLOCK_PATTERN_CONFIG_0, BIT(0), cfg->clk_pat);
+
+	hdmi_phy_update_bits(phy, REG_HDMI_ELIZA_PHY_MISC_CONTROL_2, GENMASK(6, 4), cfg->rxvcosel << 4);
+	hdmi_phy_update_bits(phy, REG_HDMI_ELIZA_PHY_MISC_CONTROL_1, GENMASK(7, 2), 0x11 << 2);
+
+	hdmi_phy_write(phy, REG_HDMI_ELIZA_PHY_MISC_CONTROL_0, 0);
+	hdmi_phy_write(phy, REG_HDMI_ELIZA_PHY_MPLLB_CONTROL_10,
+		       cfg->cp_int_holder & 0xff);
+	hdmi_phy_write(phy, REG_HDMI_ELIZA_PHY_MPLLB_CONTROL_12,
+		       cfg->cp_prop_holder & 0xff);
+
+	hdmi_phy_update_bits(phy, REG_HDMI_ELIZA_PHY_MPLLB_CONTROL_0, BIT(0), BIT(0));
+	hdmi_phy_write(phy, REG_HDMI_ELIZA_PHY_MPLLB_CONTROL_2,
+		       cfg->multiplier & 0xff);
+	hdmi_phy_write(phy, REG_HDMI_ELIZA_PHY_MPLLB_CONTROL_3,
+		       (cfg->multiplier >> 8) & 0xff);
+
+	hdmi_phy_update_bits(phy, REG_HDMI_ELIZA_PHY_MPLLB_CONTROL_0, BIT(2), BIT(2));
+	hdmi_phy_write(phy, REG_HDMI_ELIZA_PHY_MPLLB_CONTROL_6, cfg->quotient & 0xff);
+	hdmi_phy_write(phy, REG_HDMI_ELIZA_PHY_MPLLB_CONTROL_7,
+		       (cfg->quotient >> 8) & 0xff);
+	hdmi_phy_write(phy, REG_HDMI_ELIZA_PHY_MPLLB_CONTROL_8, cfg->remainder & 0xff);
+	hdmi_phy_write(phy, REG_HDMI_ELIZA_PHY_MPLLB_CONTROL_9,
+		       (cfg->remainder >> 8) & 0xff);
+	hdmi_phy_write(phy, REG_HDMI_ELIZA_PHY_MPLLB_CONTROL_4, cfg->denominator & 0xff);
+	hdmi_phy_write(phy, REG_HDMI_ELIZA_PHY_MPLLB_CONTROL_5,
+		       (cfg->denominator >> 8) & 0xff);
+	hdmi_phy_write(phy, REG_HDMI_ELIZA_PHY_MPLLB_CONTROL_1,
+		       cfg->tx_clk_div & 0x7);
+	hdmi_phy_write(phy, REG_HDMI_ELIZA_PHY_MPLLB_CONTROL_14, 0x82);
+
+	val = hdmi_phy_read(phy, REG_HDMI_ELIZA_PHY_MPLLB_CONTROL_0);
+	val &= ~BIT(6);
+	val &= ~(0x3 << 3);
+	val |= (cfg->vco_freq & 0x3) << 3;
+	hdmi_phy_write(phy, REG_HDMI_ELIZA_PHY_MPLLB_CONTROL_0, val);
+
+	/*
+	 * Ensure that vco configuration gets flushed to hardware before
+	 * enabling the PLL
+	 */
+	wmb();
+
+	pll->rate = rate;
+	pll->cfg = *cfg;
+
+	return 0;
+}
+
+static int hdmi_eliza_pll_set_clk_rate(struct clk_hw *hw, unsigned long rate,
+				       unsigned long parent_rate)
+{
+	struct hdmi_pll_eliza *pll = hw_clk_to_pll(hw);
+
+	return hdmi_eliza_pll_configure_pll(pll, rate, parent_rate);
+};
+
+static int hdmi_eliza_pll_prepare(struct clk_hw *hw)
+{
+	struct hdmi_pll_eliza *pll = hw_clk_to_pll(hw);
+	struct hdmi_phy *phy = pll_get_phy(pll);
+
+	hdmi_phy_update_bits(phy, REG_HDMI_ELIZA_PHY_CLOCK_PATTERN_CONFIG_0, BIT(1), BIT(1));
+
+	/*
+	 * This Synopsys PLL does not have a PLL lock-like register, thus there
+	 * is no way to tell when the PLL actually locked.
+	 * Returning now, would lead to stuck pclk or iface RCG clocks at off
+	 * (disp_cc_mdss_hdmi_pclk_clk status stuck at 'off'),
+	 * thus obviously the professional solution is to delay.
+	 * 8 ms was figured out during tests, not based on any datasheet.
+	 */
+	mdelay(8);
+
+	return 0;
+}
+
+static int hdmi_eliza_pll_determine_rate(struct clk_hw *hw,
+					struct clk_rate_request *req)
+{
+	req->rate = clamp_t(unsigned long, req->rate, HDMI_PLL_MIN_FREQ, HDMI_PLL_MAX_FREQ);
+
+	return 0;
+}
+
+static u64 hdmi_eliza_pll_vco_freq(u64 ref_clk_hz, u32 multiplier, u32 frac_quot,
+				   u32 frac_rem, u32 frac_den)
+{
+	u64 num;
+	u64 den;
+
+	num = 32ULL * 65536ULL * frac_den +
+		(u64)multiplier * 65536ULL * frac_den +
+		2ULL * ((u64)frac_quot * frac_den + frac_rem);
+
+	den = 2ULL * 65536ULL * frac_den;
+
+	return mul_u64_u64_div_u64(ref_clk_hz, num, den);
+}
+
+static unsigned long hdmi_eliza_pll_recalc_rate(struct clk_hw *hw,
+					       unsigned long parent_rate)
+{
+	struct hdmi_pll_eliza *pll = hw_clk_to_pll(hw);
+	u64 rate;
+
+	rate = hdmi_eliza_pll_vco_freq(REF_CLK_HZ, pll->cfg.multiplier,
+				       pll->cfg.quotient, pll->cfg.remainder,
+				       pll->cfg.denominator);
+
+	/* rate = vco_freq * 2 / (10 * 2^tx_clk_div) */
+	rate *= 2;
+	do_div(rate, 10);
+	rate >>= pll->cfg.tx_clk_div;
+
+	return rate;
+}
+
+
+static void hdmi_eliza_pll_unprepare(struct clk_hw *hw)
+{
+	struct hdmi_pll_eliza *pll = hw_clk_to_pll(hw);
+	struct hdmi_phy *phy = pll_get_phy(pll);
+
+	hdmi_phy_update_bits(phy, REG_HDMI_ELIZA_PHY_CLOCK_PATTERN_CONFIG_0, BIT(1), 0);
+}
+
+static const struct clk_ops hdmi_eliza_pll_ops = {
+	.set_rate = hdmi_eliza_pll_set_clk_rate,
+	.determine_rate = hdmi_eliza_pll_determine_rate,
+	.recalc_rate = hdmi_eliza_pll_recalc_rate,
+	.prepare = hdmi_eliza_pll_prepare,
+	.unprepare = hdmi_eliza_pll_unprepare,
+};
+
+static const struct clk_init_data pll_init = {
+	.name = "hdmipll",
+	.ops = &hdmi_eliza_pll_ops,
+	.parent_data = (const struct clk_parent_data[]) {
+		{ .fw_name = "xo", .name = "xo_board" },
+	},
+	.num_parents = 1,
+};
+
+int msm_hdmi_pll_eliza_init(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct hdmi_pll_eliza *pll;
+	struct hdmi_phy *phy;
+	int ret;
+
+	pll = devm_kzalloc(dev, sizeof(*pll), GFP_KERNEL);
+	if (!pll)
+		return -ENOMEM;
+
+	pll->dev = dev;
+	pll->clk_hw.init = &pll_init;
+
+	ret = devm_clk_hw_register(dev, &pll->clk_hw);
+	if (ret) {
+		DRM_DEV_ERROR(dev, "failed to register pll clock\n");
+		return ret;
+	}
+
+	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get, &pll->clk_hw);
+	if (ret) {
+		DRM_DEV_ERROR(dev, "failed to register clk provider: %d\n", ret);
+		return ret;
+	}
+
+	phy = dev_get_drvdata(dev);
+	phy->pll = pll;
+
+	return 0;
+}
+
+static const char * const hdmi_phy_eliza_clk_names[] = {
+	"iface",
+	"ref",
+	"xo",
+};
+
+static void hdmi_eliza_phy_txn_write(struct hdmi_phy *phy, u32 reg, u32 value)
+{
+	const int phy_txn_offset = REG_HDMI_ELIZA_PHY_TX1_CONTROL_0 - REG_HDMI_ELIZA_PHY_TX0_CONTROL_0;
+	int i;
+
+	for (i = 0; i < HDMI_PHY_TXN_CONTROL; i++)
+		hdmi_phy_write(phy, reg + i * phy_txn_offset, value);
+}
+
+static void hdmi_eliza_phy_txn_update(struct hdmi_phy *phy, u32 reg, u32 mask, u32 value)
+{
+	const int phy_txn_offset = REG_HDMI_ELIZA_PHY_TX1_CONTROL_0 - REG_HDMI_ELIZA_PHY_TX0_CONTROL_0;
+	int i;
+
+	for (i = 0; i < HDMI_PHY_TXN_CONTROL; i++)
+		hdmi_phy_update_bits(phy, reg + i * phy_txn_offset, mask, value);
+}
+
+static void hdmi_eliza_phy_configure(struct hdmi_phy *phy)
+{
+	hdmi_eliza_phy_txn_update(phy, REG_HDMI_ELIZA_PHY_TX0_CONTROL_8, BIT(2), BIT(2));
+	hdmi_phy_update_bits(phy, REG_HDMI_ELIZA_PHY_TX_COMMON_CONTROL_0, BIT(0), BIT(0));
+
+	usleep_range(5, 5000);
+
+	hdmi_phy_update_bits(phy, REG_HDMI_ELIZA_PHY_REFCLK_CONTROL_0, BIT(0), BIT(0));
+	hdmi_phy_update_bits(phy, REG_HDMI_ELIZA_PHY_REFCLK_CONTROL_1, GENMASK(2, 0), 0x1);
+	/* Select MPLLB */
+	hdmi_phy_update_bits(phy, REG_HDMI_ELIZA_PHY_MISC_CONTROL_3, BIT(0), 0);
+
+	hdmi_phy_write(phy, REG_HDMI_ELIZA_PHY_MPLLB_CONTROL_11, 0x18);
+	/*
+	 * MPLLB_CONTROL_12: missing in programming sequence, but present in
+	 * downstream
+	 */
+	hdmi_phy_write(phy, REG_HDMI_ELIZA_PHY_MPLLB_CONTROL_12, 0x12);
+	hdmi_phy_write(phy, REG_HDMI_ELIZA_PHY_MPLLB_CONTROL_13, 0x18);
+	hdmi_phy_update_bits(phy, REG_HDMI_ELIZA_PHY_MPLLB_CONTROL_16, BIT(1), BIT(1));
+	/*
+	 * MISC_CONTROL_2: missing in programming sequence, but present in
+	 * downstream
+	 */
+	hdmi_phy_write(phy, REG_HDMI_ELIZA_PHY_MISC_CONTROL_2, 0x4d);
+}
+
+static void hdmi_eliza_phy_tx_lane_config(struct hdmi_phy *phy,
+					  unsigned long pixclock)
+{
+	const unsigned int bpp = 24;
+
+	/* Set BIT(3) for MPLLB and clear BIT(0) */
+	hdmi_eliza_phy_txn_update(phy, REG_HDMI_ELIZA_PHY_TX0_CONTROL_8, BIT(0) | BIT(3), BIT(3));
+	hdmi_eliza_phy_txn_update(phy, REG_HDMI_ELIZA_PHY_TX0_CONTROL_9, BIT(0) | BIT(1) | BIT(2), 0);
+	hdmi_eliza_phy_txn_update(phy, REG_HDMI_ELIZA_PHY_TX0_CONTROL_10, BIT(4) | BIT(5), BIT(4) | BIT(5));
+
+	hdmi_eliza_phy_txn_write(phy, REG_HDMI_ELIZA_PHY_TX0_CONTROL_7, 0);
+	hdmi_eliza_phy_txn_write(phy, REG_HDMI_ELIZA_PHY_TX0_CONTROL_6, 0);
+	hdmi_eliza_phy_txn_write(phy, REG_HDMI_ELIZA_PHY_TX0_CONTROL_5, 0x3e);
+
+	hdmi_eliza_phy_txn_update(phy, REG_HDMI_ELIZA_PHY_TX0_CONTROL_10, BIT(3), 0);
+
+	if (pixclock * bpp >= HDMI_PHY_MAX_BIT_RATE)
+		hdmi_phy_update_bits(phy, REG_HDMI_ELIZA_PHY_TX_COMMON_CONTROL_0, BIT(2), 0);
+	else
+		hdmi_phy_update_bits(phy, REG_HDMI_ELIZA_PHY_TX_COMMON_CONTROL_0, BIT(2), BIT(2));
+
+	hdmi_eliza_phy_txn_update(phy, REG_HDMI_ELIZA_PHY_TX0_CONTROL_9, BIT(3) | BIT(4), BIT(3) | BIT(4));
+}
+
+static void hdmi_eliza_phy_disable_hstx_reset(struct hdmi_phy *phy)
+{
+	hdmi_eliza_phy_txn_write(phy, REG_HDMI_ELIZA_PHY_TX0_CONTROL_0, 0);
+
+	hdmi_phy_write(phy, REG_HDMI_ELIZA_PHY_RX1_CONFIG_15, 0);
+	hdmi_phy_write(phy, REG_HDMI_ELIZA_PHY_RX2_CONFIG_15, 0);
+	hdmi_phy_write(phy, REG_HDMI_ELIZA_PHY_REXT_CONTROL_2, 0);
+}
+
+static int hdmi_eliza_phy_ready_poll(struct hdmi_phy *phy, u32 reg, u32 mask, u32 val)
+{
+	u32 state;
+	const u32 sleep_us = 2000;
+	const u32 timeout_us = 3000000;
+
+	if (readl_poll_timeout_atomic((phy->mmio + reg), state,
+				      ((state & mask) == val),
+				      sleep_us, timeout_us)) {
+		DRM_ERROR("poll timeout, reg: 0x%x status=0x%x", reg, state);
+
+		return -ETIMEDOUT;
+	}
+
+	return 0;
+}
+
+static int hdmi_eliza_phy_tx_ready_poll(struct hdmi_phy *phy)
+{
+	const int phy_txn_offset = REG_HDMI_ELIZA_PHY_TX1_CONTROL_0 - REG_HDMI_ELIZA_PHY_TX0_CONTROL_0;
+	int ret = 0;
+
+	/* Poll until TXn_ACK==0, downstream is wrong here */
+	for (int i = 0; i < HDMI_PHY_TXN_CONTROL; i++) {
+		ret |= hdmi_eliza_phy_ready_poll(phy,
+						 REG_HDMI_ELIZA_PHY_TX0_CONTROL_2 + i * phy_txn_offset,
+						 BIT(0), 0x0);
+		if (ret)
+			break;
+	}
+
+	return ret;
+}
+
+static int hdmi_eliza_phy_sram_init(struct hdmi_phy *phy)
+{
+	int ret;
+
+	ret = hdmi_eliza_phy_ready_poll(phy, REG_HDMI_ELIZA_PHY_SRAM_CONTROL_1, BIT(0), BIT(0));
+	if (ret)
+		return ret;
+
+	hdmi_phy_write(phy, REG_HDMI_ELIZA_PHY_CR_ADDRESS_LSB, 0x3);
+	hdmi_phy_write(phy, REG_HDMI_ELIZA_PHY_CR_ADDRESS_MSB, 0xe0);
+	hdmi_phy_write(phy, REG_HDMI_ELIZA_PHY_CR_WRDATA_LSB, 0x18);
+	hdmi_phy_write(phy, REG_HDMI_ELIZA_PHY_CR_WRDATA_MSB, 0);
+	hdmi_phy_write(phy, REG_HDMI_ELIZA_PHY_CR_ACCESS_CMD, 0x3);
+	ndelay(400);
+	hdmi_phy_write(phy, REG_HDMI_ELIZA_PHY_CR_ACCESS_CMD, 0);
+	hdmi_phy_write(phy, REG_HDMI_ELIZA_PHY_CR_ADDRESS_LSB, 0x5);
+	hdmi_phy_write(phy, REG_HDMI_ELIZA_PHY_CR_ADDRESS_MSB, 0x90);
+	hdmi_phy_write(phy, REG_HDMI_ELIZA_PHY_CR_WRDATA_LSB, 0xc);
+	hdmi_phy_write(phy, REG_HDMI_ELIZA_PHY_CR_WRDATA_MSB, 0);
+	hdmi_phy_write(phy, REG_HDMI_ELIZA_PHY_CR_ACCESS_CMD, 0x3);
+	ndelay(400);
+	hdmi_phy_write(phy, REG_HDMI_ELIZA_PHY_CR_ACCESS_CMD, 0x0);
+	hdmi_phy_write(phy, REG_HDMI_ELIZA_PHY_MISC_CONTROL_0, 0x7);
+	hdmi_phy_write(phy, REG_HDMI_ELIZA_PHY_CR_ADDRESS_LSB, 0x1a);
+	hdmi_phy_write(phy, REG_HDMI_ELIZA_PHY_CR_ADDRESS_MSB, 0xe0);
+	hdmi_phy_write(phy, REG_HDMI_ELIZA_PHY_CR_WRDATA_LSB, 0xa0);
+	hdmi_phy_write(phy, REG_HDMI_ELIZA_PHY_CR_WRDATA_MSB, 0);
+	hdmi_phy_write(phy, REG_HDMI_ELIZA_PHY_CR_ACCESS_CMD, 0x3);
+	ndelay(400);
+	hdmi_phy_write(phy, REG_HDMI_ELIZA_PHY_CR_ACCESS_CMD, 0);
+
+	hdmi_phy_update_bits(phy, REG_HDMI_ELIZA_PHY_SRAM_CONTROL_0,
+			     BIT(1), BIT(1));
+
+	return 0;
+}
+
+static void hdmi_eliza_phy_init(struct hdmi_phy *phy,
+				   unsigned long pixclock)
+{
+
+	/* pa_iso_disable() */
+	hdmi_phy_update_bits(phy, REG_HDMI_ELIZA_PHY_MISC_CONTROL_3,
+			     BIT(1) | BIT(2) | BIT(3), 0);
+
+	/* sw_reset() */
+	hdmi_phy_write(phy, REG_HDMI_ELIZA_PHY_RESET_CONTROL_0, 0x1);
+
+	/* assert_tx_lane_reset() */
+	hdmi_eliza_phy_txn_update(phy, REG_HDMI_ELIZA_PHY_TX0_CONTROL_9, BIT(5), BIT(5));
+
+	/* phy_init_config() */
+	hdmi_eliza_phy_configure(phy);
+
+	hdmi_eliza_phy_tx_lane_config(phy, pixclock);
+
+	hdmi_eliza_pll_configure_pll(phy->pll, 396000000, 19200000);
+
+	/* sram_mode() (with SRAM init) */
+	hdmi_phy_update_bits(phy, REG_HDMI_ELIZA_PHY_SRAM_CONTROL_0,
+			     BIT(0) | BIT(1), 0);
+	/* qcsram_init() */
+	hdmi_phy_write(phy, REG_HDMI_ELIZA_PHY_QCSRAM_CONFIG_3, BIT(0));
+	usleep_range(5, 5000);
+	hdmi_phy_write(phy, REG_HDMI_ELIZA_PHY_QCSRAM_CONFIG_3, 0);
+
+	/* deassert_tx_lane_reset() */
+	hdmi_eliza_phy_txn_update(phy, REG_HDMI_ELIZA_PHY_TX0_CONTROL_9, BIT(5), 0);
+
+	hdmi_eliza_phy_disable_hstx_reset(phy);
+	hdmi_phy_write(phy, REG_HDMI_ELIZA_PHY_RESET_CONTROL_0, 0);
+
+	if (hdmi_eliza_phy_sram_init(phy))
+		return;
+
+	if (hdmi_eliza_phy_tx_ready_poll(phy))
+		return;
+};
+
+static void hdmi_eliza_phy_powerup(struct hdmi_phy *phy,
+				   unsigned long pixclock)
+{
+	hdmi_phy_update_bits(phy, REG_HDMI_ELIZA_PHY_TX_COMMON_CONTROL_0, BIT(1), BIT(1));
+}
+
+static void hdmi_eliza_phy_deinit(struct hdmi_phy *phy)
+{
+	/* sw_reset() */
+	hdmi_phy_write(phy, REG_HDMI_ELIZA_PHY_RESET_CONTROL_0, 1);
+	hdmi_eliza_phy_txn_write(phy, REG_HDMI_ELIZA_PHY_TX0_CONTROL_0, 1);
+	/* assert_tx_lane_reset() */
+	hdmi_eliza_phy_txn_update(phy, REG_HDMI_ELIZA_PHY_TX0_CONTROL_9, BIT(5), BIT(5));
+	/* pa_iso_enable() */
+	hdmi_phy_update_bits(phy, REG_HDMI_ELIZA_PHY_MISC_CONTROL_3,
+			     BIT(1) | BIT(2) | BIT(3), BIT(1) | BIT(2) | BIT(3));
+}
+
+static void hdmi_eliza_phy_powerdown(struct hdmi_phy *phy)
+{
+	hdmi_phy_update_bits(phy, REG_HDMI_ELIZA_PHY_TX_COMMON_CONTROL_0, BIT(1), 0);
+}
+
+const struct hdmi_phy_cfg msm_hdmi_phy_eliza_cfg = {
+	.type = MSM_HDMI_PHY_ELIZA,
+	.init = hdmi_eliza_phy_init,
+	.deinit = hdmi_eliza_phy_deinit,
+	.powerup = hdmi_eliza_phy_powerup,
+	.powerdown = hdmi_eliza_phy_powerdown,
+	.clk_names = hdmi_phy_eliza_clk_names,
+	.num_clks = ARRAY_SIZE(hdmi_phy_eliza_clk_names),
+};
diff --git a/drivers/gpu/drm/msm/registers/display/hdmi.xml b/drivers/gpu/drm/msm/registers/display/hdmi.xml
index 0ebb96297dae..4afc36fef172 100644
--- a/drivers/gpu/drm/msm/registers/display/hdmi.xml
+++ b/drivers/gpu/drm/msm/registers/display/hdmi.xml
@@ -1101,4 +1101,144 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 	<reg32 offset="0x002C" name="LANE_MODE"/>
 </domain>
 
+<domain name="HDMI_ELIZA_PHY" width="32">
+	<reg32 offset="0x0014" name="RESET_CONTROL_0"/>
+	<reg32 offset="0x0018" name="MISC_CONTROL_0"/>
+	<reg32 offset="0x001c" name="MISC_CONTROL_1"/>
+	<reg32 offset="0x0020" name="MISC_CONTROL_2"/>
+	<reg32 offset="0x0024" name="MISC_CONTROL_3"/>
+	<reg32 offset="0x0028" name="SRAM_CONTROL_0"/>
+	<reg32 offset="0x002c" name="SRAM_CONTROL_1"/>
+	<reg32 offset="0x0038" name="CR_ACCESS_CMD"/>
+	<reg32 offset="0x0040" name="CR_ADDRESS_LSB"/>
+	<reg32 offset="0x0044" name="CR_ADDRESS_MSB"/>
+	<reg32 offset="0x0048" name="CR_WRDATA_LSB"/>
+	<reg32 offset="0x004c" name="CR_WRDATA_MSB"/>
+
+	<reg32 offset="0x0060" name="REXT_CONTROL_2"/>
+	<reg32 offset="0x006c" name="REFCLK_CONTROL_0"/>
+	<reg32 offset="0x0070" name="REFCLK_CONTROL_1"/>
+	<reg32 offset="0x0074" name="REFCLK_CONTROL_2"/>
+
+	<reg32 offset="0x0078" name="MPLLA_CONTROL_0"/>
+	<reg32 offset="0x007c" name="MPLLA_CONTROL_1"/>
+	<reg32 offset="0x0080" name="MPLLA_CONTROL_2"/>
+	<reg32 offset="0x0084" name="MPLLA_CONTROL_3"/>
+	<reg32 offset="0x0088" name="MPLLA_CONTROL_4"/>
+	<reg32 offset="0x008c" name="MPLLA_CONTROL_5"/>
+	<reg32 offset="0x0090" name="MPLLA_CONTROL_6"/>
+	<reg32 offset="0x0094" name="MPLLA_CONTROL_7"/>
+	<reg32 offset="0x0098" name="MPLLA_CONTROL_8"/>
+	<reg32 offset="0x009c" name="MPLLA_CONTROL_9"/>
+	<reg32 offset="0x00a0" name="MPLLA_CONTROL_10"/>
+	<reg32 offset="0x00a4" name="MPLLA_CONTROL_11"/>
+	<reg32 offset="0x00a8" name="MPLLA_CONTROL_12"/>
+	<reg32 offset="0x00ac" name="MPLLA_CONTROL_13"/>
+	<reg32 offset="0x00b0" name="MPLLA_CONTROL_14"/>
+	<reg32 offset="0x00b4" name="MPLLA_CONTROL_15"/>
+	<reg32 offset="0x00b8" name="MPLLA_CONTROL_16"/>
+	<reg32 offset="0x00bc" name="MPLLA_CONTROL_17"/>
+	<reg32 offset="0x00c0" name="MPLLA_CONTROL_18"/>
+	<reg32 offset="0x00c4" name="MPLLA_CONTROL_19"/>
+	<reg32 offset="0x00c8" name="MPLLA_CONTROL_20"/>
+	<reg32 offset="0x00cc" name="MPLLA_CONTROL_21"/>
+	<reg32 offset="0x00d0" name="MPLLA_CONTROL_22"/>
+	<reg32 offset="0x00d4" name="MPLLA_CONTROL_23"/>
+	<reg32 offset="0x00d8" name="MPLLA_CONTROL_24"/>
+
+	<reg32 offset="0x00dc" name="MPLLB_CONTROL_0"/>
+	<reg32 offset="0x00e0" name="MPLLB_CONTROL_1"/>
+	<reg32 offset="0x00e4" name="MPLLB_CONTROL_2"/>
+	<reg32 offset="0x00e8" name="MPLLB_CONTROL_3"/>
+	<reg32 offset="0x00ec" name="MPLLB_CONTROL_4"/>
+	<reg32 offset="0x00f0" name="MPLLB_CONTROL_5"/>
+	<reg32 offset="0x00f4" name="MPLLB_CONTROL_6"/>
+	<reg32 offset="0x00f8" name="MPLLB_CONTROL_7"/>
+	<reg32 offset="0x00fc" name="MPLLB_CONTROL_8"/>
+	<reg32 offset="0x0100" name="MPLLB_CONTROL_9"/>
+	<reg32 offset="0x0104" name="MPLLB_CONTROL_10"/>
+	<reg32 offset="0x0108" name="MPLLB_CONTROL_11"/>
+	<reg32 offset="0x010c" name="MPLLB_CONTROL_12"/>
+	<reg32 offset="0x0110" name="MPLLB_CONTROL_13"/>
+	<reg32 offset="0x0114" name="MPLLB_CONTROL_14"/>
+	<reg32 offset="0x0118" name="MPLLB_CONTROL_15"/>
+	<reg32 offset="0x011c" name="MPLLB_CONTROL_16"/>
+	<reg32 offset="0x0120" name="MPLLB_CONTROL_17"/>
+	<reg32 offset="0x0124" name="MPLLB_CONTROL_18"/>
+	<reg32 offset="0x0128" name="MPLLB_CONTROL_19"/>
+	<reg32 offset="0x012c" name="MPLLB_CONTROL_20"/>
+	<reg32 offset="0x0130" name="MPLLB_CONTROL_21"/>
+	<reg32 offset="0x0134" name="MPLLB_CONTROL_22"/>
+	<reg32 offset="0x0138" name="MPLLB_CONTROL_23"/>
+	<reg32 offset="0x013c" name="MPLLB_CONTROL_24"/>
+
+	<reg32 offset="0x0140" name="TX_COMMON_CONTROL_0"/>
+	<reg32 offset="0x0144" name="TX_COMMON_CONTROL_1"/>
+
+	<reg32 offset="0x0148" name="TX0_CONTROL_0"/>
+	<reg32 offset="0x014c" name="TX0_CONTROL_1"/>
+	<reg32 offset="0x0150" name="TX0_CONTROL_2"/>
+	<reg32 offset="0x0154" name="TX0_CONTROL_3"/>
+	<reg32 offset="0x0158" name="TX0_CONTROL_4"/>
+	<reg32 offset="0x015c" name="TX0_CONTROL_5"/>
+	<reg32 offset="0x0160" name="TX0_CONTROL_6"/>
+	<reg32 offset="0x0164" name="TX0_CONTROL_7"/>
+	<reg32 offset="0x0168" name="TX0_CONTROL_8"/>
+	<reg32 offset="0x016c" name="TX0_CONTROL_9"/>
+	<reg32 offset="0x0170" name="TX0_CONTROL_10"/>
+	<reg32 offset="0x0174" name="TX0_CONTROL_11"/>
+	<reg32 offset="0x0178" name="TX0_CONTROL_12"/>
+
+	<reg32 offset="0x017c" name="TX1_CONTROL_0"/>
+	<reg32 offset="0x0180" name="TX1_CONTROL_1"/>
+	<reg32 offset="0x0184" name="TX1_CONTROL_2"/>
+	<reg32 offset="0x0188" name="TX1_CONTROL_3"/>
+	<reg32 offset="0x018c" name="TX1_CONTROL_4"/>
+	<reg32 offset="0x0190" name="TX1_CONTROL_5"/>
+	<reg32 offset="0x0194" name="TX1_CONTROL_6"/>
+	<reg32 offset="0x0198" name="TX1_CONTROL_7"/>
+	<reg32 offset="0x019c" name="TX1_CONTROL_8"/>
+	<reg32 offset="0x01a0" name="TX1_CONTROL_9"/>
+	<reg32 offset="0x01a4" name="TX1_CONTROL_10"/>
+	<reg32 offset="0x01a8" name="TX1_CONTROL_11"/>
+	<reg32 offset="0x01ac" name="TX1_CONTROL_12"/>
+
+	<reg32 offset="0x01b0" name="TX2_CONTROL_0"/>
+	<reg32 offset="0x01b4" name="TX2_CONTROL_1"/>
+	<reg32 offset="0x01b8" name="TX2_CONTROL_2"/>
+	<reg32 offset="0x01bc" name="TX2_CONTROL_3"/>
+	<reg32 offset="0x01c0" name="TX2_CONTROL_4"/>
+	<reg32 offset="0x01c4" name="TX2_CONTROL_5"/>
+	<reg32 offset="0x01c8" name="TX2_CONTROL_6"/>
+	<reg32 offset="0x01cc" name="TX2_CONTROL_7"/>
+	<reg32 offset="0x01d0" name="TX2_CONTROL_8"/>
+	<reg32 offset="0x01d4" name="TX2_CONTROL_9"/>
+	<reg32 offset="0x01d8" name="TX2_CONTROL_10"/>
+	<reg32 offset="0x01dc" name="TX2_CONTROL_11"/>
+	<reg32 offset="0x01e0" name="TX2_CONTROL_12"/>
+
+	<reg32 offset="0x01e4" name="TX3_CONTROL_0"/>
+	<reg32 offset="0x01e8" name="TX3_CONTROL_1"/>
+	<reg32 offset="0x01ec" name="TX3_CONTROL_2"/>
+	<reg32 offset="0x01f0" name="TX3_CONTROL_3"/>
+	<reg32 offset="0x01f4" name="TX3_CONTROL_4"/>
+	<reg32 offset="0x01f8" name="TX3_CONTROL_5"/>
+	<reg32 offset="0x01fc" name="TX3_CONTROL_6"/>
+	<reg32 offset="0x0200" name="TX3_CONTROL_7"/>
+	<reg32 offset="0x0204" name="TX3_CONTROL_8"/>
+	<reg32 offset="0x0208" name="TX3_CONTROL_9"/>
+	<reg32 offset="0x020c" name="TX3_CONTROL_10"/>
+	<reg32 offset="0x0210" name="TX3_CONTROL_11"/>
+	<reg32 offset="0x0214" name="TX3_CONTROL_12"/>
+
+	<reg32 offset="0x0218" name="QCSRAM_CONFIG_0"/>
+	<reg32 offset="0x021c" name="QCSRAM_CONFIG_1"/>
+	<reg32 offset="0x0220" name="QCSRAM_CONFIG_2"/>
+	<reg32 offset="0x0224" name="QCSRAM_CONFIG_3"/>
+	<reg32 offset="0x0228" name="CLOCK_PATTERN_CONFIG_0"/>
+
+	<reg32 offset="0x0270" name="RX1_CONFIG_15"/>
+	<reg32 offset="0x02b4" name="RX2_CONFIG_15"/>
+</domain>
+
 </database>

-- 
2.53.0

