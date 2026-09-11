Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0DFF435A9E
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 10:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789122592; cv=none; b=NeALBmHL2xFFyfc8C+f2M+DurkxM8JaulrDjh91ElaXR9yPYr77dE5Kp9B2u1pCI95k1vXyQLfhSBH3rLoa3b4Mb1lq7VVwuL3Kej7VHgXDcY0IfGpwYFAC7icq8eFalAsi67VF97WCelqS13oP4Ay0GDLkWDHd8QJ8xgZRYOE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789122592; c=relaxed/simple;
	bh=ZG093MO2ef10q/LWPvFaNq71LX74/rGkq31nYz5GUvY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tNYrgFf4uJFL5STZrXuQXCbYMvqdN8axdNlyOA6lTBeMEwIKmCl2K8nDAVfxQvVBX23X7jMcdInJJXmwLFT9k1rLaCi6rE4vajiqybOh1WeeERN0Ear7q8jpjdHdIYwH8S8IT5U+UoVi2DQ6zG5cLccaQwpuijTd/sYf8RwDG3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I/DZKTDj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RurVLEC8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I/DZKTDj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RurVLEC8"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B7kqcN3845456
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 10:29:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	89kOUuqbTMD7KBwxWQmwEktFk33uBWpQA+q0IsoXFqk=; b=I/DZKTDjmhSTvIGb
	QsmmmXilwWEUyUu6wBHwE/SOfshnkJ36+XtfmYcYVHn7UgJvhotzwLZD5ECiKj2l
	58m+EmCH06BJoRrdoKkfxH3p5CkpPu+t1sunbS5YbsWbskh9tr/q53JXe60+jHDo
	YsObcHE8lhTniLTbYWm5493BlwYvXVvtwHgq2WLq+7s8rdIbvFPhI6Q+HAzDPADh
	UL1FvarMYGQLUdU8hAtZHZ7Y0AspUrRsr1ygS/zBArOaIJDFZ7mynW2x7fGwLd4P
	JlZXfMyPfJohbxq++WQ70Z9j6fzELh5TOCCbIen/N/0ZyFgeljEbrFM12o2PopGk
	X244Nw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm5q42dsd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 10:29:49 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9382f9430deso132879285a.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 03:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789122589; x=1789727389; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=89kOUuqbTMD7KBwxWQmwEktFk33uBWpQA+q0IsoXFqk=;
        b=RurVLEC8mDTiYLe41X7fC0AXWojGwrFjt7/GYSwKB4P7jcj8w3mNeROOHbes3u8NUJ
         yxVmlY6s+tCiZiJLLEqgIU+8iVhlwaI2UuLEpgyETE0hkKZJj6cqgZbWabAP5Ub4QJ2I
         wpymdWj0aP7rHS71yJhA6nVB16YFaL+Mpj8zWkpAg+qagkNDNKQ/wXwz7mSxuwamdcjX
         DyndvviL1hakeVsIZdrXXdMlx49ti38b5ZC2gVh3o1ZfAAWof2z/ZRcsYAQ1/SdCWN1G
         xaycXFvd4pgUF0nfXG5WPnX548t1k/q+lM2QfX9Rdbhjql+42Pw7vg+HUCTDL4xBYe0c
         yR7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789122589; x=1789727389;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=89kOUuqbTMD7KBwxWQmwEktFk33uBWpQA+q0IsoXFqk=;
        b=Rf+zPBcgvaMrDxRwlmM3U2um9dVvZXEP7zKJCArF7qxGa8cn3c9hYcpqEkBDRccZVh
         qicblr8p5Lxj3k1S0A/9Qa9DuF0uV2ys7HDIID0nFRtgfApl70BwlUbmTe1pMSkNt197
         tnMZCztZU7LWNZXG3QhKl28ugJtb80T/EILOvOM/sdE2smr6qOc/kiHg4e5vwJHMEIPQ
         t3hHnHuoR7AMcZVrO4tAKbaNDXvWm7hK9MH9VoMRkGWtaM0/We9TE6Z5BuS5EPXOHYTs
         nq4tVMTeds5ped+TSynv12+KVwJWfX+oQSYesMlTujmtw8dWPo+o3i60G/tLeLWCGo2R
         LB9A==
X-Forwarded-Encrypted: i=1; AKwUvBx9oeMZ4H6PUfUJWhRcLoQAAtf5UipaJWMnfu2UzS+yUU+rMbb4NOOy88EpF2UKAsu7c+x0JMK3FLYYskA=@vger.kernel.org
X-Gm-Message-State: AFuF++kQJyJIl26nD2z9axc9mmG+gaaHlqsYjlI1NMfrLXG1YUM1jbDP
	8xOdHlDQv3WkABDH5ru/2gRglMVO7HP4xiBw5osNoTJ9oqV2IZx2sHNcpqCOc8yfKq2A57ydCXP
	C3ESdg+4toJ198AT8ZVkUIFaD5SKtEARURLWxTDoDGMVKEy3B4Kxn4xTRMHZ9Vh9/Ixk=
X-Gm-Gg: AYBFou0z+BrfR9giJHp89mc5IJEQslawWHfxvccbmq6Rt2ZQzDVcF8ajqS2hYGt4kTH
	bcUSw98yZeXMz0Tnyej+egljl53PkxxRjgPSdLEEc707XwXb4u4MIaCyCAJ8cikFgo+73IaeQt+
	5+HzqC4fd38W7cHAJ+bfu/WB49y18tYMoWXyUDXO4zzICkB4Dy1/U+3pB0BvrILUWqy06LqXaxB
	xewY7T915yRX8EGuL7CORn9MJeaHO4wCAcbmfPBaxi9WVRs0QCuzkjj4ghyu2HNfVEFBwi/4Yo5
	yhXrU+pPdIVFyrbv4YFAEafyXrE0w8QhS6Dbv3dydapr+u16K15kh4JhTyYXZARgULqMIjcBosZ
	aexVENXl8BAgALxGwmoBQS4I=
X-Received: by 2002:a05:620a:2a05:b0:939:72ae:e536 with SMTP id af79cd13be357-939ea08d7f4mr427003585a.13.1789122588916;
        Fri, 11 Sep 2026 03:29:48 -0700 (PDT)
X-Received: by 2002:a05:620a:2a05:b0:939:72ae:e536 with SMTP id af79cd13be357-939ea08d7f4mr427000585a.13.1789122588563;
        Fri, 11 Sep 2026 03:29:48 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e61a81943sm38651965e9.1.2026.09.11.03.29.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 03:29:47 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 12:29:34 +0200
Subject: [PATCH v4 1/7] drm/msm/hdmi_phy: Cleanup after
 msm_hdmi_phy_resource_enable() failure
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-drm-msm-hdmi-fixes-before-eliza-v4-1-87bdb9f1987f@oss.qualcomm.com>
References: <20260911-drm-msm-hdmi-fixes-before-eliza-v4-0-87bdb9f1987f@oss.qualcomm.com>
In-Reply-To: <20260911-drm-msm-hdmi-fixes-before-eliza-v4-0-87bdb9f1987f@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Archit Taneja <architt@codeaurora.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, stable@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1590;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=ZG093MO2ef10q/LWPvFaNq71LX74/rGkq31nYz5GUvY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqo9gQpFoZjDhMzPsUy+LdmdzrFOl71cZhEMXi1
 mgUxSmEFceJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqPYEAAKCRDBN2bmhouD
 15LsD/4/L0NDXHF/U4+guLhfAlcFLxQHsCCkbhDa9SOS7C/sitVrIcbNTbKbx2SaBDKTzOIw2Vt
 7fBhdDez23YI8P6u/LyNQl5OOzReoKr4QHgoiJznFhA7kDD5g7uivqKOQk5gLtoUzdC2v4LhDvN
 bc0kf+BHkLPNrtZjXxnHrbai3byrm3eG0S2uSximL2J2iBxbw20Yq/Al/jaFyzp/RoTBBfqcpRp
 G2lRAzNdW6oTkplvqMfsArEIpSBhxhUefh9HTMwcQ6GXzuMpJTZt2xhF9lzWMIevTQ89wn/p/px
 lOGDeaCXHXkVVdyoGglrP1wZFoiPDRfXqtP84gsD97V1+InM8iel/9wAyhFzq+DoSxs4YoagUbE
 UVKdtRU8cyWu94bEJVIUq+PqsIm/j2xtl68qOyLls03WVMFf7fhz3yx9kxzytJJGymPrb6p3w+z
 qkgL4q007YVdg9DnaEjPnogP59GM6b8ftIaUTEDU2lb9rhv447d2EyqHriIqarFmqWJOPqbjikr
 Sc2Ich4Mekhl6pe0ih/foIR/m5gAB/D5s4W+gFOe2wRxaEso3MyWe+Nglgdgg4zcNX1g1v3JRsN
 PHpj53uzFB3laL/R+BBF8EtRVZANl365wFnxP31ti6FZhX8VMSzrLPLxhD6R7eMzuIbQJJYKx+T
 yaZAFMi7MQwvBZw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: z4ycgNt-r7whhlz3IY2rHU44QAePPR7S
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDE0NiBTYWx0ZWRfX/ZJ82SajlW1D
 X/JmlkfWYyKKY+Jm8nAjKn4y2Izjdmgekk1CxQ4kMqRM/HjA9JR6ktpxsMv8dnAT/57iCulW1vn
 ODnPMUpJ6PfsKqLVf11Q3jffyQLZVNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDE0NiBTYWx0ZWRfX8/+rfBa1gyh7
 HPE8HcvTvRxFhfsy+VOiliBD1AtxBz/zMTAKfkq/T9Q7tzjLSrP6HvAH9xNYuejF1v5A6wXy8wM
 iZ0HCjgficLIVBr+59mcMpBaPo24bPsbrj9D4MTcn7jkWTDv8w6TdCZpf/7pXO2hTgvzUnOCDaI
 fN8jilTv0sg0maH4BkwrIZqrRnZf79KkCinAxIbAYHrLvcjsgElKSUI0X8ExzVkxZV1xE5guSdx
 yS5A7hDCrV1Ac4MIFR/mM08TC2mT7Q3pyBz6pRvI9nbeBS5PhV9eNxVzBLmgoOlTaabeMcWA/jE
 e/yfrx4RjVjBPcdkA5a3r3hYx69p/8EkaL4ftadlNSURdSKhPMOnfHrHXUDEshakIxumEbGRazn
 TbeuASQiFEGDJl+c82EDZc/03LviT6bJ77CVxsNpk1tbA4UCFFKOAr/V9KkQz7/61KNNXKDYh9N
 Z87CAhWfeh8eQbkkXRw==
X-Proofpoint-ORIG-GUID: z4ycgNt-r7whhlz3IY2rHU44QAePPR7S
X-Authority-Analysis: v=2.4 cv=Wsa+otfv c=1 sm=1 tr=0 ts=6aa3d81d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bp1g5Iz1D7c7guLF1_8A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 spamscore=0 bulkscore=0 impostorscore=0 clxscore=1015 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609110146

If msm_hdmi_phy_resource_enable() fails, e.g. when enabling regulators,
it should reverse the state of things already changed.
msm_hdmi_phy_resource_enable() is used also in probe path, thus such
failure, which could be simple deferred probe, would leave these
resources permanently enabled for the rest of the runtime.

Cc: <stable@vger.kernel.org>
Fixes: 15b4a4523859 ("drm/msm/hdmi: Create a separate HDMI PHY driver")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/hdmi/hdmi_phy.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
index eb1088755cb3..15e37596bdb1 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
@@ -67,16 +67,28 @@ int msm_hdmi_phy_resource_enable(struct hdmi_phy *phy)
 	ret = regulator_bulk_enable(cfg->num_regs, phy->regs);
 	if (ret) {
 		DRM_DEV_ERROR(dev, "failed to enable regulators: (%d)\n", ret);
-		return ret;
+		goto err_pm_put;
 	}
 
 	for (i = 0; i < cfg->num_clks; i++) {
 		ret = clk_prepare_enable(phy->clks[i]);
-		if (ret)
+		if (ret) {
 			DRM_DEV_ERROR(dev, "failed to enable clock: %s (%d)\n",
 				cfg->clk_names[i], ret);
+			goto err_clk_unprepare;
+		}
 	}
 
+	return 0;
+
+err_clk_unprepare:
+	for (; i > 0; i--)
+		clk_disable_unprepare(phy->clks[i - 1]);
+	regulator_bulk_disable(cfg->num_regs, phy->regs);
+
+err_pm_put:
+	pm_runtime_put_sync(dev);
+
 	return ret;
 }
 

-- 
2.53.0

