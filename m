Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B552248CD5F
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789549928; cv=none; b=G7G3ieL+ficWfBgTFB2vDD9otOBlppC/rsbzH1YQT/XnErCeoHjH7VG/7sArNklEJ/g/JJ44l3SbdHb3mV157+xL+acWWJ1DAfDRF3tf735g7o45jZ60ZFBg+SjCg4OJcuAr1uo/QxwQPC3tmq33XrlwdS+RTRL5jtrEyLGDk5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789549928; c=relaxed/simple;
	bh=TF77Q79zFWQi+Fntx7XSol08DnELnNGQgAP7mdKGCQk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gwN08eikeQjMWj7moQpTG/wmRNH1RYjJqVe28uWbw/DXZ/pv8lvPr3PcmVnQkz/sZx/Cw9QDwgNmha0tHb2zu2DRfjFQzgbiHo7JkDoA0BRXiZ3ts7/Q8POm93CHoKEMQQTUq4fTSjrETSSJTGmpp3Eawg4c+diVjVccHIESQN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Td4JnIKZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kH2a2hze; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Td4JnIKZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kH2a2hze"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G92ZQM3169004
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:11:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xY2nZ+rb+2TgLQPRkuxCOGDJub+v+1UgrrA3cohnLn0=; b=Td4JnIKZXafV5ybZ
	KfpGn4rirwTJyjJUs8kG52ifICMmBSLbBZlZUaciAAy3C06OPdWl42k8ke1fTsyq
	OqoGu6ID0CIYODqUWshYvMgtDFv26fkhv+R/92RnumoIAzjZe0BfoYglUv5j0luW
	kdJGDysy7mKc8EKDxh0xagsiQbN3iO83YzQlHBe78bJHLwaGNMa1vjC6Zy744EjS
	jnt4Uy92737aLfQsvgpQpzsQN3OgQL8HMpzIYnrBVi87h2L7XfnODhRMUSwidCP5
	E50ttn0gULD4oidaL8BxuJ66QSI5SMNqriZ8EyUp4I9OjaqL5gKeY0aldxak3Gbx
	sQyVEw==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqpu2rcbg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:11:44 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6c748676f6cso1928906eaf.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 02:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789549903; x=1790154703; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xY2nZ+rb+2TgLQPRkuxCOGDJub+v+1UgrrA3cohnLn0=;
        b=kH2a2hzeb++VGDRzmlzzA/94fYR9fNgf7tID/1E37nO1StqWOB+Ye8VPT507QCSpRn
         GRormGYSHpFE1ZBU/DJmaAEywe1xhqZcWXcaoI7QO1TiVixb4rB+KX10h5wyra+lQuHu
         uhx8xd5Zvzit0llFN1x65KE/nAAjmdyqWUEpAHg1yCGX3khhdgeErZMnolSOsYg4NJZc
         PnveVi1vaqCQVEyVygvB5jG3v1KdaPN9ValIvuShsqTO2UFgTj91xoBtm6Y2sncAJLbE
         hVqQgjCpbqBiYRIdVW5dpfv2TvZiAnhS/JSUjgnGrtjNzIF0CJKkY8EQ+Tz5IYR3Q26o
         DIqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789549903; x=1790154703;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xY2nZ+rb+2TgLQPRkuxCOGDJub+v+1UgrrA3cohnLn0=;
        b=1u/MEUWcBji0bI4hEWvJUSQvDFtFKJT3EOzMI79vsG2J0RIYpQY5MGHQ67a2nk3vcI
         vYNEPpi9E/WiPC5C8D4hLAnPXod3rKVBOJVyqOYQhxZZFUfr4FNOl5HnUeEZ7Epogncz
         Xw6VvyAz0czwg89AI0aA3WXnXq/9nTB47TrUSvP/1iuctMtmuN+qVRQPmJYXjvzsBO6y
         v6tYrODvEtC64cBdhR/cjw38vLqTdXSIluGvdDrzNVuRkUZ7apB7aD1FDbq9/SyH6Eoz
         KINBy7EI7wwh07SzWKrh0NSCfwKl+6EBbbslsd0b+eruuTlx8nl+yF6hW3qyrRSiUsA0
         +dpw==
X-Forwarded-Encrypted: i=1; AKwUvBxXw4PzutpT9w5aVASkwln7UTELpQCz0shxmUQ6odEx7Bj77PT63PBkRnKK+zqk0V3V3CmXKJ7jB4EqWtc=@vger.kernel.org
X-Gm-Message-State: AFuF++n+yDrlHkKNYwd+RlP3uwVKbbXVCfCZ/JMNEVKo6bPu+fvkfbhX
	Kkbo1eLTygXdmI1vPbmnF7pWNDRDgF7O6pr4W4ejJp9qsyIwv+8oXvqVJQlcHXwGMF5X3BkZb7U
	OzSA8/iDJeWb7+fKpBqoy54FlAonPh3x2+ZQzNTvhRA+DCGNpZtd+zfEEOMrX0h+4U1ovAR7Ev+
	0=
X-Gm-Gg: AYBFou3ChHrpg2viONXOSCDt2K5QeR8y4jnFWJVk5BCe2gRzbwhu4U5I8qFnK8s3XAV
	47Wqx7QYynnatW0JnaxgP3SC0SqNv3SSK1EYPvMFdGBdOgJIzkk3pEPxa1Fy+2UgHOtoQEe833v
	di37y5G8JJYosr0/dLhE6o/761CVgcmd0YPSRSvi9WLyNhspp5ELLOmfQKHVEeQTSdFmIkwdzXK
	aHJGnVvHsmGsOqdW2wUftXulosS2OBqF0w2GpDmF/Xh/kyj1x7RZXOQfNvsBf1gcUEUD+LCQtD4
	uJnmlzluKdLcr/B8VbVbPwZrhUWHJ+vFBUF56HLN7t+C9mTfqSbf1z7IIcoJ2WFzGIxW9H681Md
	GErjfCn4xahMk576bYpfvqC1BwqY=
X-Received: by 2002:a05:6820:208d:b0:6b7:83c5:fdf0 with SMTP id 006d021491bc7-6c7d44e81e0mr1694070eaf.49.1789549903342;
        Wed, 16 Sep 2026 02:11:43 -0700 (PDT)
X-Received: by 2002:a05:6820:208d:b0:6b7:83c5:fdf0 with SMTP id 006d021491bc7-6c7d44e81e0mr1694056eaf.49.1789549902883;
        Wed, 16 Sep 2026 02:11:42 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14395d3a31asm4779492c88.9.2026.09.16.02.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 02:11:42 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 14:41:21 +0530
Subject: [PATCH v4 4/4] arm64: defconfig: Enable ILI7807S DSI panel driver
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-shikra-dt-changes-v4-4-d5d5c3ffe070@oss.qualcomm.com>
References: <20260916-shikra-dt-changes-v4-0-d5d5c3ffe070@oss.qualcomm.com>
In-Reply-To: <20260916-shikra-dt-changes-v4-0-d5d5c3ffe070@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Arpit Saini <arpit.saini@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789549881; l=826;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=pjvXxkjE7K36h37LhIJX2wTGw0m6XqoLcx3Ny/40vyM=;
 b=gGpOF7+ZisxNgVau0+tPAwSQIR8kNqmBt9jSDw6ymVQjFu0J1RiPTwCcN1lA/f4Io7gLpxX1p
 9TtGoYpOglTBu2SOf5LAq4LanNW0dRbOsVY8ECMIYfeJKwMiWdN/zGx
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-ORIG-GUID: 6yiLkfYNS4L6JQpxS-v3AvE-X0m52-rz
X-Authority-Analysis: v=2.4 cv=NelzRGD4 c=1 sm=1 tr=0 ts=6aaa5d50 cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=aMhaXRkMA95IrCOZcTgA:9 a=QEXdDO2ut3YA:10
 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-GUID: 6yiLkfYNS4L6JQpxS-v3AvE-X0m52-rz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDExOCBTYWx0ZWRfX+pyXlm1rcfyl
 Latq2lJJY+Rq5L1XkwtIBS6IurthgfsiDsKX/deJCsywaImGQIHJ16cLTe6L6v6f59AYxtgLVlX
 ccoaz+ccwqo8LUIMTWKooT5OuDjv0Q7OJ2ZqmfT5xr8/nfLMVVNgH5MmE8RDJ/cVUu4CyD9Np9Z
 b/ELtEY53GGay85qj+r5NJQOeipQYizz4BJw4912fifUJViaIH2P5w3lDMBJOeAxJvpjsve0xLc
 32Xj6W7HLpU0vgUyGaQFOrD0SJSBLEEq4BMq6bH8fC/MVjpAd4DvMCcikW75Osggmbkh7M8V+Ww
 JzMXWPe+b+UqFFvVFyKaOKfOJJl5I4WfGco8zFkjLtUGThQR2bed23xEW43Y2zVH4+DoVTGJchV
 7lbseqo9xU1Pjso3U3AIj+mlyUc6JnorLjcyLrlY0qQop/kQXcyVuEa6HiXWwLQSoniDsjJkelM
 G5OB4UENIP7FrYulD/w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDExOCBTYWx0ZWRfXx5xORSs5Jd5m
 zoGR48n6iLda8hvbSAaadjM9oOaSp135Y9RczWCUquauUaTkgQHzzO33eellUO/KSMSGL2o8V/Y
 lzJWOOkGIIyw38GhcKQbRH3vETPpigc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 spamscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160118

From: Arpit Saini <arpit.saini@oss.qualcomm.com>

Enable the ILI7807S 1080x1920 video-mode DSI panel driver as a module,
used on the Shikra CQM EVK board and CQS EVK board.

Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5217de386edc..00dc52c8d87d 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1021,6 +1021,7 @@ CONFIG_DRM_PANEL_LVDS=m
 CONFIG_DRM_PANEL_HIMAX_HX8279=m
 CONFIG_DRM_PANEL_HIMAX_HX83112A=m
 CONFIG_DRM_PANEL_HIMAX_HX83112B=m
+CONFIG_DRM_PANEL_ILITEK_ILI7807S=m
 CONFIG_DRM_PANEL_ILITEK_ILI9806E_SPI=m
 CONFIG_DRM_PANEL_ILITEK_ILI9882T=m
 CONFIG_DRM_PANEL_KHADAS_TS050=m

-- 
2.34.1

