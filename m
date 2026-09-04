Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE04523792
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 17:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788542988; cv=none; b=u+u4Fz1/BvwGnmsvM73TQ7EieCNv/IPQWaq/prmtB2Zua75myPuy3xQXiowrgLWMuo2M6A/iJh50ovH0E0550AFZ6jC4cE+xqxipuDOkafIG/7u3KSgc+Iuo8REjYdiabpW/2owXB4pSQpzOQJWojhWQqOXGabQ61k63cdNR/Dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788542988; c=relaxed/simple;
	bh=7rardkyifAR+2AT1JfxqXWVC4DUlTbqXtnaIiP3Z28I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OtapMwquHoT5cWFf7N6KUFwunpGP75uC3QXwkx5q5ugBvxA6Kcnfp4sbw0m6erS97xnQJ1MJsfZcXsA5Qe2HqWhrZlkNLk3iEwK7Vf/kWUdi30ba3HiMaoPPU4cI3cc3tSVG3XpjxRgQpuaHdU2I8t2ufzNvsfMRwu5WPxu1moo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=inya1+Uq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HJQztDRD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="inya1+Uq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HJQztDRD"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684HIKhg4125891
	for <linux-kernel@vger.kernel.org>; Fri, 4 Sep 2026 17:29:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nMeeDoM5kZU/bqV8HBx/kQzsngPCM+3poCWoyr7i+Wc=; b=inya1+UqMsJliKpr
	w+dFfqK1aasCj7jZifHiYaM9epQDYIZfPlOJ9avj/iSA1c1ya/JKtaMP0ztLn1EA
	TFRgguJLw40IAQ6fkxRWvEz3X1YPULLazXZWA2ybehn8jJ4w4gK14YyWpdJYIa7H
	4ucKFX4L4z4UlkDPg0chXvj50FhuoY0IWr0Et5WhkgDY2ZQTkonlfAntXUhdAAEv
	lI2yVxkE3+9waYaHOe7m0QwOR9sG91nVCj/8VdyX2JsBC3DkBaHZ/sx4S/nUhhOh
	/DucsJ1Gj22f3LiM2we7aDGBdCkAqlKBGIecEsoNWo65XYk0n2aUCkuoJW1NbQQ4
	CGSHCQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gg01219wr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 17:29:42 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-394f8176688so255216a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 10:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788542981; x=1789147781; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nMeeDoM5kZU/bqV8HBx/kQzsngPCM+3poCWoyr7i+Wc=;
        b=HJQztDRDmkUjeMRakNPm7rJC0T8zN8ARStLv1ezNOWyrI/D7diXfOLaQi7qdctcbTK
         wJh6FLfy8RnHRyPbXONRL1Vymc6QNboKuxSNEF5LtIMQ0hp9y/IUFAbXlC8wMK1Kld2I
         3Ct4gYeXDKRTS0TW/pkFPNHJ2qmPmQonSIBiS11qp0rVPpz4xKXT2+hK/uYUEpYqFwNe
         T0pHtBMUdh1WfnOjX0jgePPUVdo7JpWS1GisbLRAXb75RigooHHiEhvR0IvPmAubCl+C
         ridGfbD8YBeb7Inx2AGa6ZHXCgPP/7XgYHoPGuJmslWLyVg6hfoyY0YoA7PMM5meVh9L
         VKtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788542981; x=1789147781;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nMeeDoM5kZU/bqV8HBx/kQzsngPCM+3poCWoyr7i+Wc=;
        b=L4tHPSbRt5NFJ1D6OY22sr/S8RlyvqDMvvlnP6oiWeffstxP9LqHOX/GkdrdSCvfDw
         wvp4IcEjle7a9Qfxa/qlzbPf9tKxLtPOdlnMZ10tbRHmTJNNpKUemftWCEoZqFQqGnHZ
         PGk7jtQ4dGGPSrWMODDWzRzbVJlDlWXlaJhIBw66bCo9O3CWUrKL4i6I9abve6NP9dZ3
         fyJ7vOG25ZTOKBwDTmZSM8JULAXFAbA26wJ6ghCEgsrUT1TjLtronpTuhPXo9X2y26QX
         GvGLcvfIroQZn0dDmCO5l1t4z1JWz5MfB7muvo5dx3jZnY6OR22CbanOkaiqt3j3bkj9
         YVIA==
X-Forwarded-Encrypted: i=1; AKwUvBww/gm/RnoFBuzx+NkQpcrf1Y9cEUj75ZhQxoIJZ+YqZ5sS/EatJYMgQiDZ+PozHFQTYkQyiK4dNU8uRtg=@vger.kernel.org
X-Gm-Message-State: AFuF++my7nOMnH9K7v6bSp5HWfHV7u4IdSImPPnm5A+vGiGKE9e1aWag
	38xPvia3ptTNWftGp4eMVFilnQJpdiT2GI4de4u3Vq14f+iyQu4FqaAMOCw8Q4t46BMuyOqQ9cI
	gvzd6WOORTjGv6n0ZpMN5av4zuTDmy3BYFdQfSl1j9+aGhZqvckZwKTp43WO9Hzl77PqkS41Ldp
	w=
X-Gm-Gg: AYBFou0U19nCzuZV51kwH9TKhGDlz4NtM5prrDtXoePA4yFbBFSO0xlOPuKasFoPO4h
	J+rLar0Gx0MjhkFZRnDctUVXVfRzVLvSiMWz4LlmJLWVj4obB8N8qSmqs70eMegzQsknVVPJcJJ
	S8GR5ghfkkBIFK5+Mwj7OMaObrDRCJuhaaAlnZUnSyJr6ynCS+B/cLgxZXb8jeJ767K3SR4VOdF
	QCkkt0O3yxycMt1CvEp5r+Hz8hnVVS4471T23APzWJfexTjeJ1AypmlBEH57i3o6LOwpQbBDcbR
	/UUdSr0wAxCLvFYb1OyvddaTDvMNcYKaMQsdDIAjJKT+/2AcdMyDjugMvpM5UO0E3qjH+R4J/YI
	jXmHjl3K3UvSOwfEq+PbKmxUYSOgGEAo+DUAMCdD04P8UN5WQOo0/bI0kEFXOjbInnpgJIODekB
	GgNvC/okiwXzeDsUHe3j4I
X-Received: by 2002:a17:90b:1e04:b0:396:463e:2eeb with SMTP id 98e67ed59e1d1-39b264b24e2mr7080379a91.0.1788542981155;
        Fri, 04 Sep 2026 10:29:41 -0700 (PDT)
X-Received: by 2002:a17:90b:1e04:b0:396:463e:2eeb with SMTP id 98e67ed59e1d1-39b264b24e2mr7080342a91.0.1788542980707;
        Fri, 04 Sep 2026 10:29:40 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14324356931sm12396019c88.4.2026.09.04.10.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 10:29:40 -0700 (PDT)
From: vishnu.saini@oss.qualcomm.com
Date: Fri, 04 Sep 2026 22:59:21 +0530
Subject: [PATCH v8 1/2] dt-bindings: display: bridge: lontium,lt9211: Add
 lt9211c support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-add-lt9211c-bridge-v8-1-36d66168e176@oss.qualcomm.com>
References: <20260904-add-lt9211c-bridge-v8-0-36d66168e176@oss.qualcomm.com>
In-Reply-To: <20260904-add-lt9211c-bridge-v8-0-36d66168e176@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Yi Zhang <zhanyi@qti.qualcomm.com>,
        Nilesh Laad <nilesh.laad@oss.qualcomm.com>,
        Gopi Botlagunta <venkata.botlagunta@oss.qualcomm.com>,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788542964; l=1545;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=7XMiXr7D3fC2Of65x2F+DhMxVAnk7abheQMCzBYJB9E=;
 b=kYhjbJfhi4tdf5UoHfJgq76far9xQsD3X5MeAsAZnleqmu4fUPtdapPrjfXwWRK0+aVjZlLwa
 g07Orgf2xqXC3UjbnwoncdZU6X7jFoBMm8eokQWf+KGd3Ypsenq9Ca9
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Authority-Analysis: v=2.4 cv=dfSwG3Xe c=1 sm=1 tr=0 ts=6a9b0006 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=UcubZVdaWCKl6vSfqw4A:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDE1OSBTYWx0ZWRfX+XvX3wysZr5a
 noi10JW2/3oS2E/0jkKAjC/SagQySp6hvhVYUH/tG/fNi5WCB1ojagJxOd1vzCvdU9/6xPYf8vk
 +SJGUBve0Z7p7bXW8HyeA0ArNhaR8Tsv3wJ8WLqdemX40x+Nngfeuf6zNv/S0r7X07bOVrY43fM
 7hGRMo0poLQzgZqy+7/CUnUynylErVRD01UKQl2Qp1MJhAAWW+lV/sovE7TcgkyE6w4pvi9w2nf
 ApJ+fvaJou1M0Msg773lzkKGwVE4yeu35+kIpDYihdyjHOM0dz33B7lIo80RGSqm4E8nSH8v2iG
 LMMlMkN1WoNPFSRzJwnAkoyAuMcS/WHko8l3F8k9rJOnYv7l8sJGB5ZbCZ7pMfCJp7v9GggZDMb
 MtSzaElB/jh9XaDe7UHqP/RcvGnytLvzd4wIfSYnA1mQF7LuWLx8+nH2r9KPmtDjeT4Hp+M38ey
 hykWHdww58K0h2M+eRA==
X-Proofpoint-GUID: KDDsn6UC59nE_4VtdyDZq5vwGZUgkz6r
X-Proofpoint-ORIG-GUID: KDDsn6UC59nE_4VtdyDZq5vwGZUgkz6r
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDE1OSBTYWx0ZWRfX884dKAQujmPb
 jyGavfDpxm0Fe67Z8V0srGUgpA1E14XlD8YT7q1oiaZfSiHWBubDVZrv/AW7P5oxBmHNkl6ZrxZ
 z5GizhvuNpw+izFSUIZaJjvEJn747YI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040159

From: Yi Zhang <zhanyi@qti.qualcomm.com>

Add binding for the Lontium LT9211C bridge chip.

Signed-off-by: Yi Zhang <zhanyi@qti.qualcomm.com>
Signed-off-by: Nilesh Laad <nilesh.laad@oss.qualcomm.com>
Signed-off-by: Gopi Botlagunta <venkata.botlagunta@oss.qualcomm.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/bridge/lontium,lt9211.yaml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/lontium,lt9211.yaml b/Documentation/devicetree/bindings/display/bridge/lontium,lt9211.yaml
index 7cfe92a8bcd7..de61bda09db9 100644
--- a/Documentation/devicetree/bindings/display/bridge/lontium,lt9211.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/lontium,lt9211.yaml
@@ -4,19 +4,20 @@
 $id: http://devicetree.org/schemas/display/bridge/lontium,lt9211.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Lontium LT9211 DSI/LVDS/DPI to DSI/LVDS/DPI bridge.
+title: Lontium LT9211/LT9211C DSI/LVDS/DPI to DSI/LVDS/DPI bridge.
 
 maintainers:
   - Marek Vasut <marex@denx.de>
 
 description: |
-  The LT9211 are bridge devices which convert Single/Dual-Link DSI/LVDS
+  The LT9211 and LT9211C are bridge devices which convert Single/Dual-Link DSI/LVDS
   or Single DPI to Single/Dual-Link DSI/LVDS or Single DPI.
 
 properties:
   compatible:
     enum:
       - lontium,lt9211
+      - lontium,lt9211c
 
   reg:
     maxItems: 1

-- 
2.34.1

