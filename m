Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C8736604B
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 03:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788406487; cv=none; b=NvsRGax5sBP4Oahb3OzVFeI0MJ/J0kzMrRzjgoxzHq6+NSfQsYfGZ5myk57dsk64pknWvvhek8bjW/xNABhPoGg32IXKa1hkEKUT7UBB4DA0ZMG4qSMQ5UFkCeSwdVYnfySSAkrzZyiFaprVBcc8sEpnNwYWbDf2fOWO+4FIfhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788406487; c=relaxed/simple;
	bh=aIoghjXx6AVRZdTStyBOvDyftPf8mmSjjyNh+gwUU94=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LpazvpNlqyPeVn+hnDOMb8OdLlKtPkeTdTYaEa0k1GcbsR6XKEz5wDr/J3AI3xj8NiG7oPXZ3kwGE+xj0j/A5ymB47xfNpeSuv8CN0fszdbGlgwyKG24Lea60fDCukzkxfQLjqKYJVK6JqYpymkDRPRwekwrwm0dXsbaHlIEzSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S9jOPrTG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A2Edxnab; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S9jOPrTG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A2Edxnab"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6832xhdR3547107
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 03:34:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LpLw0Zeq9QHYUh5WFZl+iJsyGiCuxAh1isv86OZyLC8=; b=S9jOPrTG8btAAWgt
	dgvhIo01manQLgAHCuqvidawVFjNmUIgKmpkBfhxkcTq7yWdPUCxfMznsGnFP5VT
	Nrv1IGmfm72Pzz0j+iAs1Vjs00ft4YhZgsexmSZOUmCSW0pomtJNmDb+rkAQQc9N
	ZMxTwkayyV/QpGSoh6tr4gjNfkEeXcpRJ71RXj4RtZILMOjBVoNbHqny6OpM+4tZ
	SJGtMHwrHS0FjgSnCAi+AV8TAR5jyDHWyTzBR1cPLnGJWEPTsQItUnfKNmmlFxRg
	mr1VmEnqiYvGu02jbCcOUcpr9/n4vxq/T+rQVf9AE2etOKrgIEyz4PHzRD+PIagt
	HOrCcA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gejv8bqj9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 03:34:39 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-384d033f7f5so409433a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 20:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788406479; x=1789011279; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LpLw0Zeq9QHYUh5WFZl+iJsyGiCuxAh1isv86OZyLC8=;
        b=A2Edxnabj1tbJMMbua2jPessrDopdtuGYEn/UT6fq2ASjOj5zsXbOboNgQaz7ZTzTS
         KmhoGQP1w5JT7xsUJiXASdBHfcSv2fjik3n+voJ7cRylXAN8KR4l7qhVirJyKfodcOKo
         bDx4XpXcyAyNuGFDqlhuI/U3U/Ebv/W1ddQ8Ci3M53UKqLuGnmHL+79Xa2KhF9UHmO5O
         RMiuXnFlNKk3ipLq0UHE/Kfj2TY1qmQ9+avWcILrh3VCDdQsAvHcalMM0B0xRcpdYT66
         hL0rnE/DE7bGRP5+5DiDmIlBRMz9hQTPLXsva2J0e0jcm1k3ERxYwrkioUcOE0jrlXZg
         Br8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788406479; x=1789011279;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LpLw0Zeq9QHYUh5WFZl+iJsyGiCuxAh1isv86OZyLC8=;
        b=dtSlhj5HO+SaQbY2op6YQKG2NTORcRKSBHO/tenIwCRhAKeAen14LAccfvLp7u4cfC
         HRtRa6JC8ie5PkZ9hvw5CXCI1ZFafS8G3btf8ULeJTnZ7LTN0Ug2yIWpZKoyM80Rlaui
         Cu+f+IUHopReCwCbXD974tahKV8vknpRIEWQAUlbRhPzkQT7PjbdzwZtDT/TaoWI9tbm
         v4cTHZ8+ARI/giRJNSt5BzynMz1YUilArgnRmjv3fVHd/ZUFgsqN4RtnE7uw4ObyOViY
         CL+Tv2r9nio7vp9iENlZKn0iHwzE2HKIGhQMyLYvup4C6h4hbnYP4Xv3jwHyfm90rWyV
         dqiw==
X-Forwarded-Encrypted: i=1; AKwUvBzzXvW6eoSt9bG0vWIDRtFa3RsZC1dQtf0WfKBIxQV8FnWhwJFYMtmAeLDIxyTfhV/IE6vY4kfatfvZleo=@vger.kernel.org
X-Gm-Message-State: AFuF++kz9eUaTyboCrHQwrVGiiZ2yy5fzYRC2ri3Nq6Raxa9QPCEklx1
	KgTWsfzLoqaeWYfiEYoAm7r337cnbmOi+zXGZJ4aK0UHkspAdok732BJC1phLJLKhc1LLNfH+d1
	QmmGj3gDGlWIqYpj9P6uVPulwIbXlmgMQo2ymkXruxr6VvBj6ZYxg9L3fXmZmeMYwP4o=
X-Gm-Gg: AYBFou0YLjAr9aMZC3x0xnrCMvxJE++jK0TBhTIDht545Gq5i0RI+UyL0N1IvRcWeXr
	/s9WLx1Po6rJT4m0yO2+2CrpfonTdVLz4hw5vdHzz2Lj3MzM9YPOOJ9Dfg6RVkRfc3HRMuoG5E6
	iwsagkaWlwgrww0tPQ4VVwBhrVXNL4zUkpc7uRc4oDTdeSBR1bLgyWqNzuo5JlGeGsaTwtTvdcH
	Y3keTYB0tu0s3++on7r7/m34fhTgfoM7w4O5zLfGJBHxEFC/Wwd9f8DTOrXhpykiJIYQrKydwmr
	4pWEhIcwQiSXwTkFbEMkXIUj+M/WX9RttNebW8AGbfmlAINKn/52egsOz1Lr2i1sY5UclFC7Aw3
	BD+onottxSIlc1jDLPeIfrcPzWxf1sUbqq9yZ7Bn3XmXejyVCjbJQJitOcF4E0+U7Grrnyafd6t
	snspoFnN3jJ14xInwcMhj1
X-Received: by 2002:a17:90b:4c05:b0:396:463e:2eeb with SMTP id 98e67ed59e1d1-39aedc2cf4fmr8675690a91.0.1788406478614;
        Wed, 02 Sep 2026 20:34:38 -0700 (PDT)
X-Received: by 2002:a17:90b:4c05:b0:396:463e:2eeb with SMTP id 98e67ed59e1d1-39aedc2cf4fmr8675656a91.0.1788406478217;
        Wed, 02 Sep 2026 20:34:38 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33253672941sm2375624eec.3.2026.09.02.20.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 20:34:37 -0700 (PDT)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Date: Thu, 03 Sep 2026 09:04:17 +0530
Subject: [PATCH v4 1/2] dt-bindings: display: simple: Add boe,dv215fhm-r01
 compatible
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-b4-lvds-panel-doc-v4-1-861738a0d5de@oss.qualcomm.com>
References: <20260903-b4-lvds-panel-doc-v4-0-861738a0d5de@oss.qualcomm.com>
In-Reply-To: <20260903-b4-lvds-panel-doc-v4-0-861738a0d5de@oss.qualcomm.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Liu Ying <victor.liu@nxp.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788406464; l=1266;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=aIoghjXx6AVRZdTStyBOvDyftPf8mmSjjyNh+gwUU94=;
 b=GdA0yOy9sZkqisuLMxVOuPRs6wPmQZKY8asVdqr22N2zcboT7iHqBiojcfFNsdkg1N2SoeM1Y
 K82GwYW0ilfBBE9i9anGR8wj9A5GWHiIW2bDqH7H0cL28eH6M9pPU4c
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-GUID: 2rrzHyLA2eOGSGBYk6x-e0g97LPI5Dp7
X-Authority-Analysis: v=2.4 cv=L+wtheT8 c=1 sm=1 tr=0 ts=6a98eacf cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=8AirrxEcAAAA:8 a=fMfOcokNL7symIEKlBMA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDAyNyBTYWx0ZWRfXxzMpZOH76atT
 2LGH2ezbGf6SsLrr7BjOVC+lsJbhjROV/Yx+s1+4d3cJ490IJoYeZsPrxQIH+5WySNHvARmtGIn
 DquG24u1j0JtNZ53k+EeV0jtPsKtPPyl1n1p5kRo1yB1PT4a8cCvYh0QyK83NOsvSU015jQNO2t
 9clQBcG392AhmNcnRGcCSUJqWZpjpOfUeA++miA+ZlWbzQTfwbbdJFGlDmWL2KYnzmp5RT6OTI/
 zVdM4CFE8kbrLmQ19NWapOp+P5wXelwmeAXMIEHsfAhfIhQjmXSFoXOO8fpdLl64NN6O/5XV7yc
 U9hU4iXkPW1buvnegoDfLJ6wKXIPrzlNKlLt3JHUeZPMCI5ANOCFGTsCPaS0MhDtDygbE63In+7
 J24ZmHRbZsoiZAYCVvcR4djG0BB7pgB1l2TR4JAk2YVORt5fb4zx29CIRbo2cyh0KOVbEHVlX7M
 z1ul/Ut75UuCzLtuG+g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDAyNyBTYWx0ZWRfX33GGtlvuTafw
 fcEW4U8hu3OAm998fg6WrFS90gY9RzL/7Ljgt+4Ce3Xizvsp4wGeWOvboj4VKCIAcoM6oFVyPx9
 MBIPX6qv4AQ/IxEYj0m5qsbwEwvs7SQ=
X-Proofpoint-ORIG-GUID: 2rrzHyLA2eOGSGBYk6x-e0g97LPI5Dp7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_01,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0
 spamscore=0 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030027

Add BOE DV215FHM-R01 21.5" FHD (1920x1080) dual-channel LVDS panel
compatible string to the panel-simple-lvds-dual-ports binding.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Acked-by: Liu Ying <victor.liu@nxp.com>
Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 .../devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml
index 8a2f6feafd37..68beb476fb48 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml
@@ -44,6 +44,8 @@ properties:
       - auo,t215hvn01
         # BOE AV123Z7M-N17 12.3" (1920x720) LVDS TFT LCD panel
       - boe,av123z7m-n17
+        # BOE DV215FHM-R01 21.5" FHD (1920x1080) dual-channel LVDS panel
+      - boe,dv215fhm-r01
         # InnoLux 15.6" FHD (1920x1080) TFT LCD panel
       - innolux,g156hce-l01
         # Kaohsiung Opto-Electronics Inc. 10.1" WUXGA (1920 x 1200) LVDS TFT LCD panel

-- 
2.34.1

