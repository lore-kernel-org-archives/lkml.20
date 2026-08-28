Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657F9470431
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 14:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787925939; cv=none; b=Bt0xyWrjyNy0Dt9jHyeHDB8E9OsXoN5FeiUS5nmeGhYEkVtr7EFqy/AMKI3EXy6Be1DDREzXQkX3xHGapMCHNaTUsaisMk3LRxfAxWQirGdiJp/7owPsspLTK5WFEFuKwVKcxjKLpBuzr09VO0MRDsonR1Ugf6STLJoRDggQABE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787925939; c=relaxed/simple;
	bh=tW0/V98WOWAWLqVlgzVwKvZe5FLR97Vr/8EkD1Pe00U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r1ukp4BZ0cCHjmN1/k1G9wBint7esCgh+wtOuMd+XPMeqEifpdQo5oPGhZp2phorrIAkKMAIXofg6TfKHXs+3YTW7P4WK8+s5Zl3SIQyp+XMpadkKDXgssTcJHfebWHheqifnAIkS7F7rEfsLO+l45/ek9Y+LTJu4CxF7NsV9zI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lEykGVwz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=axWKx8Sp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lEykGVwz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="axWKx8Sp"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SDlSnj3546413
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 14:05:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KTDS+bbOanujBaA6LavrEivitiq85Hyu7Sk6HDc/4Hs=; b=lEykGVwzCrMDFdeb
	9e+QDLAcIZ2XB7THfDrgjzLic1KuB4Lz6y2gR+ZXQ4RPwS0x6qbaNYL5rZTIfYMz
	j10wOar/678L1YAwliMD2yDQmxixLCvu/4SsB8tifv3MszctofHUVMQcYb1twJNc
	Eun6mwsep4wEJvzvFZH9r7DruoazC2p4161cRML5mSHW1o4uzF8vsRVmBfUppO6z
	1zToiG2xEpn3SZtegZBG3mvoGEN/uXCizrqgQcQzDhV211VHui2YBioaRC/oHGSf
	01TsOUHj0lWEOJd6G0eQhz1OWzqNrqbZDCDOqxHdsFC8ReESkkGjsKYs0b6L4kbS
	gRibDw==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb47n1xmw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 14:05:35 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-979f42d6f5fso885007241.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 07:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787925935; x=1788530735; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KTDS+bbOanujBaA6LavrEivitiq85Hyu7Sk6HDc/4Hs=;
        b=axWKx8Sp0pUWNyMJ3595ZkfajjWdK913Ig5bh3efdelYpa0Ze7SoLsTpC2Y+5xYiKf
         whJTBXECZ261x1DeZdfhCkgwBmKWkj+pkphCC52zmby+6w0s+gQ/8LY3u+KNhlSPG0+g
         Lmxk6juZHPNJr56AuBvWpq6gs1KWY8f3ZzaZgDhGUsBfi8B/1kFQB/luEF9SjwVw/6en
         FRJkvjZf7uCQRCumofEOYXCFi0t4cQCtj1atfNlRZ6aslE8kDUmVDaGray1NKZG4uYm5
         XPUWlcVp9CQu67IBCCBYHmpTFKut4Y8w9L7Slqa+8D69pSBywrW1Lk3V0w+P5hh3vjRx
         buBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787925935; x=1788530735;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KTDS+bbOanujBaA6LavrEivitiq85Hyu7Sk6HDc/4Hs=;
        b=drWWIdStt0RcbH0DI9P1+cFPEc6X4v7P1xw/weficfwOQ7pqAAvM9vyoIXT38tvAO9
         AaxlVLFK51xmPaB5mShemSgjUFRB+lHoIihcfK8CWxvnDK7+GPq881b9rhAAXcMhiDjm
         vda148sB1HDHi3xnM6fVcgAHTJq6S8lMf3DOytIfjW4ar3iO/rpmW589vPW/lz80s+px
         D22IZTMWH3R7pv1GxEFu7M4R8E3jyu/vmRbckM4ENXoM28d968C/HsSPI6icyRASzgOe
         p5kO3e9uW63cdaJjiVwSW17n96jiKRjX60b5QbMSQYTrArM6CqGcQZp4D2HShfruai0a
         np3w==
X-Forwarded-Encrypted: i=1; AHgh+RoztXFbs6HKvkeQlll181oAl6hhFrgEUlqOlv189Pe4V10oRlzXj7Butb6K575bbR1PBBhH2qJKO3tXgEA=@vger.kernel.org
X-Gm-Message-State: AFuF++lmpDkNGZWMvgXaqNdEcoV6pzLlJsMw9Y754yMZLIVSeEBg3WGd
	lBVE7qToA6gVDWxXthBSZx0A5D17AR2xDnHb10tV+BfejQvOOTzba0hNh86FuPsh4IdrQqK5y+h
	7ryqZJT8o2m3QuYGYwK6yFLflcysAlt9lUIW6gT57X55be18qhQyMi8q/fdqXGIH8yyE=
X-Gm-Gg: AR+sD12gkOW6Z+jBEUu0jTY34o3xNBdmCC91rftMq9QeQ/BJ/xjQA21QBR0kidCpodE
	YaYsnYabddltsFhodr72+BWj0rahOEOTFF3v1l4lY9I+R1qXubNFR5gnRtfiddKbP5jw1CNheAL
	4TmH+AlR4MG/hBwJ/+QO5xAVxxZeVleX3RggEWTTj7wWYnsexhM9vg13Hw4ysOirGznV5qi1tr3
	WX+zImu5mWkp8m0P2iX0wmHHzyegibUJc5IYZObzRouG0pQWhlxUH6K2AC9DsqoEQY+whdExv4h
	Qh+Ac0YufxjbNyWv4rW5BrkC0vSCGTVH1u+Ip17d+bxlIYfEHHyY4FOi05qX2XKJTyI4nViTsvX
	6LAoTHLJ4AYdlFaox2+E0rsY=
X-Received: by 2002:a05:6102:2acf:b0:778:f972:32eb with SMTP id ada2fe7eead31-7859996dba0mr2597998137.12.1787925935057;
        Fri, 28 Aug 2026 07:05:35 -0700 (PDT)
X-Received: by 2002:a05:6102:2acf:b0:778:f972:32eb with SMTP id ada2fe7eead31-7859996dba0mr2597945137.12.1787925934482;
        Fri, 28 Aug 2026 07:05:34 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb20122sm3908633f8f.20.2026.08.28.07.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 07:05:33 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 16:05:01 +0200
Subject: [PATCH RFC/DO NOT MERGE 03/12] drm/msm/dsi: Fix indentation of if
 block in dsi_mgr_bridge_mode_valid()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-drm-msm-hdmi-eliza-v1-3-67843277de17@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=798;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=tW0/V98WOWAWLqVlgzVwKvZe5FLR97Vr/8EkD1Pe00U=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqkZWaCzqQTDLhYUd+TYlb9MS+fCMLIHN5sEpaO
 KPln5AS7zCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCapGVmgAKCRDBN2bmhouD
 16g9D/96CCnowO5YVeDTuX8794l+rCeRdeqVNKtfJ7zwdrh5WdJ1dnaBPBMQSnm/x/fVpcxwCYu
 arC0rbwF5A7wOmGm7T67qpA8GmNSqNulzSXmCVkSor9+y83n6waSu80HeiJy+iOntdvUy5hLmbO
 mjarJYL+eEfSYcMiZhIWtpuhYjg0diCrLSbHgFm1UQWm73y1MkDp/S5DsGL7C3ktzxnuZQYO2Z8
 R4tRxhdMzWCwB7HwMlV9tT6kM/Db+SG9OIj1ArPRfVso5lfCZ2sZ0ZsN8TVqxb7w4X2E2P/fBo6
 4aRTdoh22A0wJ8AxWOspRf9PxjJUiARGPpbZwUNK+T4VP0elnJpLhFtaNYdN3rbGVHA1YtLujYt
 0oAeXdDz2BNXUcoot5nAnzMSAFYgqWrXS8Hq/CyCx/hqugWNkaeSUC0epfc3iODek6SsXRzVCI7
 4cxwygFxa/SACEtV+HF+3HeeY7StL0m1q226kw/Nyzn+Ff1iYSsoH0+IORPJPH55JXT6wrHPle6
 +vxcw7ZqLXBglLtY4iBj7vKRtmfgnzmehfxap7F5BFLHv5/EO9s2pGT4faG16ueVDYg5Vi1RvZj
 SGKY58PDV4XrKY1s/2y0e8+1Dtb9hyNA+QGRx+e9DmbOKA7c3OZvRX4v8bjJPdQo5TVQvX+dAfF
 pNB23JQaNvDBvLA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=a8YAM0SF c=1 sm=1 tr=0 ts=6a9195af cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=mamL7KDpJlut8y4y1IgA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-ORIG-GUID: 7A87D-lYhLeMYQTDyx1l8XIvg4I5U4pV
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDEyMiBTYWx0ZWRfX62li+In9Td29
 gbAcizho5eOSnCBvFVEpgXQvHiFChCLAWfF8XlDhGqgP2ZKMXn1xIWxQ9m+uLeXwHzrdoBRgD0u
 mDoI/BYq049sLTaU7SYFtfYi0VTLbz8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDEyMiBTYWx0ZWRfX4+kRbqGRdF2E
 CRsxqumMFaalOwusHgZbxGWoDX2tZW9rg+/AkLsv9y5NF3awhli/M/3/3BmJ9XtVPAtgwe1T/Bo
 OOxhVNiNtjvcd5SoylOiRmdUnQkUIUxZESUftptd2IXtNexbpXBNzzLygkNdEbp86MgfW6S1PGp
 fsGgaZQ3vqwMR0FxnLzSTvG0s1LRsBTs2GVc5KlBF8iQVggAsLEmOoAMetFh+JH63Fb8EWPwMQ1
 5aB7R4izDCfy+ps7vf8XuIq11WBiljb9ZbZnY9MFh8xAN57bKHJcmO4O72zZj8dlce0qTCSg2e7
 E68XAjZBLop873JtUv26GiqXg1Z26QYwvDoJCqKy8pbGYLbUi6eI9AbPeesZclrnw08mPPcSHoU
 dMTog1/cwCRKp9YLn4EpFnw9n4yaCPxgQvK+mQIwygs9v2NRUIoZlW5sewKYLl0Jwbt+6G9Zw4C
 dcCNnqzkbQgCfMqmhVQ==
X-Proofpoint-GUID: 7A87D-lYhLeMYQTDyx1l8XIvg4I5U4pV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_04,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280122

Correct confusing indentation within else {} block in
dsi_mgr_bridge_mode_valid().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dsi/dsi_manager.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index 959daa88b1d0..531d4ff78f56 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -429,7 +429,7 @@ static enum drm_mode_status dsi_mgr_bridge_mode_valid(struct drm_bridge *bridge,
 		if (dev_pm_opp_get_opp_count(&pdev->dev) != 0)
 			return MODE_CLOCK_RANGE;
 	} else {
-			return MODE_ERROR;
+		return MODE_ERROR;
 	}
 
 	return msm_dsi_host_check_dsc(host, mode);

-- 
2.53.0

