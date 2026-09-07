Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B2448CD72;
	Mon,  7 Sep 2026 12:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788782999; cv=none; b=C6GqIgnuyT3q56fP+CuKBiu6dg55kaEa++5g4FBRW+fmoxROuHTuhK2IhQpWp8I4XrH0YU+I8xNKeo0NBmtQ+GI6DlBk462n9IipbNQuX2BCxS8aBV+s4teL6OuQmoLY3I01wQFg20LmivHELuT4u9hobbpZQctzZ54Yq80/+0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788782999; c=relaxed/simple;
	bh=/VLPwU7IBziP7tJTYFhfwJcKF4KpF5h6IYddLt9oIQE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gEJBoCWYp99oqqGvy/90IGK0920095foT3kXBNQyO7asTZe3Ws9/TFhhwANdS7nztte0gAQesGgUjJ7xrrscNKt9Qaig/Sc1k4/ZnbClp3RqdXNUfdG6MPbMzgBSSduNclPvyqS01tQCkpstSXpKnJqDZLlLHEvn3UXKrPzToNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=or/Ne8ND; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="or/Ne8ND"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687An3xW3230482;
	Mon, 7 Sep 2026 12:09:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6zrOdq1zF5td3T+JYJ2hNSlQsoDEC0oTmGx6Ybl0UTE=; b=or/Ne8NDByghKsHZ
	4/eki14pgjy7QuxGrmth73G2SCsemKxragOwxaGhZVCj9dPFzLCDGTDBAtXhqGRb
	7TvkGefMnbFHmtRLBdy/nFojEYI6hgK03egAy2/OLaZuJ0GnBCCZYPIW3b/5K4EV
	lVBan1tICZ+5knFVKcG3JWTyo6XYmfwW47PzKaODIFtJDDi8Lubl/lpaTL0mHQOz
	0qwrV1DBs65pGe8TTJLOT+Jx4X5/dCnQMEI/O9lLxWdCpP5f069r+Nrdk2SMrxM6
	0OcaVOOYvQEve2IhDuE0fqj81gQzQ3gm3Vi8xkx+yZyV5DZgSqFaGElZL42Qxl/p
	0Ux5Dw==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghfxktmcq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 07 Sep 2026 12:09:41 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 687C9awR3932911;
	Mon, 7 Sep 2026 12:09:39 GMT
Received: from hu-hgautam-hyd.qualcomm.com (hu-hgautam-hyd.qualcomm.com [10.147.247.91])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 687C9XQb3932854;
	Mon, 07 Sep 2026 12:09:39 +0000 (GMT)
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 17:39:35 +0530
Subject: [PATCH v5 10/10] MAINTAINERS: Add Qualcomm QAIF driver entry
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-b4-qaif-shikra-audio-v5-10-6d8ad9ba5c9f@oss.qualcomm.com>
References: <20260907-b4-qaif-shikra-audio-v5-0-6d8ad9ba5c9f@oss.qualcomm.com>
In-Reply-To: <20260907-b4-qaif-shikra-audio-v5-0-6d8ad9ba5c9f@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Harendra Gautam <harendra.gautam@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDEzNCBTYWx0ZWRfXxD76hRxavuRg
 ViIAZW6fCf8KbYIVPrJ63u0HfjuUn+fRQCdiUKXE1D6Z6006MBBiqdzDx6z5guHWh46LfTyTUFM
 +avWdE3NQr/p/nej/gZXFFRceYAt7UgbbM+m7AdhyZT7cy8vVWvE+nPi/7xg1YyxaTsp/H+7RVs
 smgv8bInojHsuxpWssL1fIw1uizxj0VcUq6jZacLGVu7LFuEoMkktW8V5HkQgHyNODzlOLXIWzH
 gPd2xf59FQ7RN+drfG9XOPnIiPrt+JlpfEwl0BpxLiiNmCE3bgxrUfZvFyVp9lzYb+8ckHpB8tD
 vZaRF9R8DtLwiN1yNzJcnM0tO04V9RxMRkYlUBVJe9f9odhX+hdVAYD4O2h6Gw2aaOoA3d+tcQn
 4ZnbaM027d75ItFiZ5/IPQ7/FqU/nYMjb/Sw+/d7dWf987x8RugvxtyLgY61R3FaXp0pxcEHHIL
 NIiX5RtkybA48qbmWww==
X-Proofpoint-GUID: P29E9S26mQmb7TTYqJL37xK9_XNxP4st
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDEzNCBTYWx0ZWRfXzs+kvwUzz8zk
 Cls4jnmVDoULh5p/R8v4T5y1k+l2Xp6MyY3ATJ0BKCO0eTMDbGjINtgyQlOSUSJhfZAL9qaStky
 DWD2ZRwg9acuVG+sKq+TP30hsBo/jSs=
X-Authority-Analysis: v=2.4 cv=daOwG3Xe c=1 sm=1 tr=0 ts=6a9ea985 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=PFusfAj7JESbPCsvM_wA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: P29E9S26mQmb7TTYqJL37xK9_XNxP4st
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070134

Add a dedicated MAINTAINERS entry for the Qualcomm Audio Interface (QAIF)
driver so changes to its devicetree binding, dt-bindings header, and ASoC
driver files are routed to the Qualcomm ASoC maintainers and mailing lists.

Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7291238bc09f..4296f812ad36 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22133,6 +22133,15 @@ F:	sound/soc/codecs/wcd93*.*
 F:	sound/soc/codecs/wsa88*.*
 F:	sound/soc/qcom/
 
+QCOM AUDIO INTERFACE (QAIF) DRIVER
+M:	Harendra Gautam <harendra.gautam@oss.qualcomm.com>
+M:	Srinivas Kandagatla <srini@kernel.org>
+L:	linux-sound@vger.kernel.org
+L:	linux-arm-msm@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/sound/qcom,shikra-qaif-cpu.yaml
+F:	sound/soc/qcom/qaif*
+
 QCOM EMBEDDED USB DEBUGGER (EUD)
 M:	Souradeep Chowdhury <quic_schowdhu@quicinc.com>
 L:	linux-arm-msm@vger.kernel.org

-- 
2.34.1

