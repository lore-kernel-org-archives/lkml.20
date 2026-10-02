Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD6B30ACF1
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 13:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790946212; cv=none; b=tzc4z02DEQt2Ix/aFbRBlx4h0rqvjJuqycYtzpsrtQtIa+0/Eu/Wkcj1k5R9RW3tyuzp+QlCl8PReDXFtl3Hpiod6VTi0yXtXtCVHk1GzdngVQXulh2r5+lgyxc/7FDH3AZpoQqz2sFj0hOpZ3y0zc+k4zQJxXvjeXpXH4b0LpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790946212; c=relaxed/simple;
	bh=mfA0CnRmAV4YQ2CmY8kjWDR7BmLBBgtPkPhCwBQXJUY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ue0ZnVNaxc9F0t3JKlTiJcpJJfU/qyJWQu+ogHmnwcsSXNua8/MrFfhxH8d5bza3um6HI5yBC58K2l6Glaq2i4HTussOPUjO8j372klihU091S9keett5lTOpShfoa7iesM+bxkyhTdgP1wMXBtl9QKRxDf4pZY+S/rFVI7VGUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UJU3ovl3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fV9fpAzJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UJU3ovl3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fV9fpAzJ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6929naUi557502
	for <linux-kernel@vger.kernel.org>; Fri, 2 Oct 2026 13:03:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K3uT7R5I6zQZ/I/4CcpOlVfI0xqA8Gs5rj/a79yNNKY=; b=UJU3ovl3vT9hvtWV
	iXZ+RTCeLQfHczV6rDEjCw48qgjoh/nay3XGg9vZ8w+a/bB7KdcN9tCKdE/ioimG
	5YkDyItSG3vY+3PG/ZjtmVgn2o7rnhlivtgZaBY0UGV5Xk1SKcVIH7OzRZ3tQXx5
	aPxj/8SmVEgv5VDv3N5bAgTjgSLJcKNqY+prSSiv3pcx3UizPBSkEculk878c0dH
	HlHcUkNWOitd/dmsj4Qi0DTJ3wFMbsoO9oQTtWonWwdEt1ClQuoLc+hNoQDZJJYU
	POGxCmpE23FzkuQvppzDmzI46KNfTEx7BjsX9IOONx0fdN186nxp/5j28cFKLjDU
	bTf2Qg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1tbgc1v5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 13:03:27 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-341eff9e381so11829133eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 06:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790946207; x=1791551007; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K3uT7R5I6zQZ/I/4CcpOlVfI0xqA8Gs5rj/a79yNNKY=;
        b=fV9fpAzJMU6VRzOfB6s/CnEuUHeaRGznsM0solnFsZHfdsiHE4LO9+vfV6dmyxdH3v
         WpTu7pMcRzwbD2ql1VUZVLAYV0EsqEgAEFiwQKLbeAOOlnHThTkyFCznakkg07+MO377
         WoAW1ilPrHnFCRo3ADNSHSOm5LFjpkfsoggmPZ8cYRgSj+Bv1jFZ04hzv4lWbW6Vrx6n
         qScJ9+AKZEw0rq8yD+OXer8fesMnAMjQDMs7m3sIaO6E5gXbCqMLTrITTmkZOqlJWp19
         xYSpBPBsZi7sv/5UWrXMjq+A9uq6CisXe9/lblDmqxJIv3jlTMm5vPlb3//p+UXA0HPo
         c9kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790946207; x=1791551007;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K3uT7R5I6zQZ/I/4CcpOlVfI0xqA8Gs5rj/a79yNNKY=;
        b=YjEUqP3XqDxl3rfO8oep9WEkp0L6Qf3byNNVdu5uwFJsMkZFg7jCH2RKBeBq7W6ejg
         VoErn9oaSiedBhBX1EiNf9gfavnx64xIW8/ej/b071FmGUHnkHCZuUaI6cxwSdbl0iM0
         voBc4A2oW40FJbk/UWa6rmKPyAPQhhONw2WnDgASveNrDGr5pXQlVSXBWF06KGgdwjLu
         YrVw3Ya8Qnhv1PCMUvppXpA0fomb2xIF9OduG7Ofek7/yiCd0OxS4hr9UKTZmqtROR0z
         225RMV3DRxXfpIjvP9u3q+p8ZrnRyh8lCEWibRW+GNQuHvLiPFfPHlsnhg4N+dJoX0ps
         45Ig==
X-Forwarded-Encrypted: i=1; AKwUvBx0VI6j9lHlsDobCrJlhBRubmOcHFepw82+h7ElriQxLFKnfTX93fZVqDAqn4UFcsH0AtHTkrzKm6/YIrE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJH766h2fDV7qz58O7nz2+iOKP61+cjnfuVPx/jpBRLnUdlcW3b
	PoJJ441pbdSl8vWLedLsBUmO8htvWjf167KZmH0ibLu7Ndbwu6X1h5a3xi8aEmpmAjlnUQjNp6K
	1l0EHt8ZONM9dOuJCcysZ98c4LPjDwZONlO81b5MPwJdQjAPFkfSzaHuDIYckSG9IGl4=
X-Gm-Gg: AYBFou2PPoJY5H01KDRxh8sRvctRBxzm1RHTN24ffAd2ec5lz2tSNYU3DE4W+8JNmv5
	DehwBapXClhZMuBdDjDCmSODIk2uyKwub55tY+Wrc4MCXTp+qvHmUj7kJeCpdu1bP4o461sQueT
	JkOrmkDbTqGXH0jGJaflZ5p/x4JhMMTsnbuqMaWsSgDxKVNMlxCkZiN+pbF2kn643ULvlnGEov6
	TUMpqBWAEWQ+dwaDf+Cx330y+4A8V7plb6xDwd5sizVGlenpfsPms0OCCYAefSFppcMRgd8zqeo
	OtQDmdyYuKU6XNW/M9vNzO6jGEpscTAb4r32Gn8uSQhMxuaVEt3zutV6PtJckBHm+2JuSAP4V2t
	pNxaFVQ1Erj8syIN1oI2nWPMDIuw5lHBqTZl0D0tL9I+pWOMQcOhot0Kbf1FyJW0fPdbgrmweiA
	3sOUe6efCqGxPbVwOE8NpDI76dnqwLwDJUQA==
X-Received: by 2002:a05:693c:65c6:b0:341:bd7e:da35 with SMTP id 5a478bee46e88-34f1508f93amr2400213eec.11.1790946206574;
        Fri, 02 Oct 2026 06:03:26 -0700 (PDT)
X-Received: by 2002:a05:693c:65c6:b0:341:bd7e:da35 with SMTP id 5a478bee46e88-34f1508f93amr2400188eec.11.1790946206032;
        Fri, 02 Oct 2026 06:03:26 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3510752b575sm4217543eec.6.2026.10.02.06.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 06:03:25 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Fri, 02 Oct 2026 18:33:05 +0530
Subject: [PATCH v2 4/5] arm64: dts: qcom: ipq9574: add support to get
 watchdog bootstatus from IMEM
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-imem_restart_reason-v2-4-61703c6362e3@oss.qualcomm.com>
References: <20261002-imem_restart_reason-v2-0-61703c6362e3@oss.qualcomm.com>
In-Reply-To: <20261002-imem_restart_reason-v2-0-61703c6362e3@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA1MSBTYWx0ZWRfX8Y5Qq9NG86WC
 Mlga9YOvaATZPsdFS7lJIrbC2tiJB2Lm49SvM1yy3v7vAsiBlrm4+1q7x2hcl5qa6ue5K4NtkZz
 u7oGqRIw75pT8pI8WR842rt6q94Xq2U=
X-Authority-Analysis: v=2.4 cv=QY7zLcbv c=1 sm=1 tr=0 ts=6abfab9f cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=WbeaI0-OC7IQdSlKmUMA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA1MSBTYWx0ZWRfX4eeTnywJmff3
 PizugOQWGo9gDzk9sJd2MMmjrD4LgsDhgj9oVUaJHBl2ZUU5ddK4BSFw0f/EIxeS5XpEwxaSHhL
 cAHvwwUB9KoG4oCgxUH51VH0pJUu4qXHwYepVWsV9bcEUbP68thhVyXbog9l8Jr/AJNMkBmshDR
 jMeHpYStJi154AvcnZtHUH7jB+a5G9V3IQtadhgy+eiao/Am9Ev5McbDE+HPLhKXdnRvJa53RIZ
 zfP2GgaquwENMUZTCtDDg1gLkfJdSmfyOWKlHVpsVNeDbvmX6W6ipjMQ1fkI9LSE7clAZ3E6mgO
 yunoaRiATTenePhmDjRHeFYv6TaL5mjEdjo+vt+IDyaZKTjo7hKGcvVaskv7l4arhcz07IsU7nx
 GF/7XGulneMNtOykBfe0yWNFRMOTfnUZcL+CVUUQeBUNn9v4ju0a+03FFtx+PVnNtVH15UNmzaT
 cw6Og8Ax+sekYDFb2Rw==
X-Proofpoint-ORIG-GUID: cj4TAZ4hvYmGMMFAvRWTTjsynCa0NHSS
X-Proofpoint-GUID: cj4TAZ4hvYmGMMFAvRWTTjsynCa0NHSS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_03,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 bulkscore=0 spamscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020051

Add the "sram" property to the watchdog device node to enable
retrieval of the system restart reason from IMEM, populated by XBL.
Parse this information in the watchdog driver and update the bootstatus
sysFS if the restart was triggered by a watchdog timeout.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq9574.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
index f7cc6f274ca9..e1908f01851d 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
@@ -760,8 +760,16 @@ usb_0_qmpphy: phy@7d000 {
 		sram@8600000 {
 			compatible = "qcom,ipq9574-imem", "mmio-sram";
 			reg = <0x08600000 0x8000>;
+			ranges = <0 0x08600000 0x8000>;
 
 			no-memory-wc;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			restart_reason: restartreason-sram@7a4 {
+				reg = <0x7a4 0x4>;
+			};
 		};
 
 		usb3: usb@8af8800 {
@@ -854,6 +862,7 @@ watchdog: watchdog@b017000 {
 			interrupts = <GIC_SPI 3 IRQ_TYPE_EDGE_RISING>;
 			clocks = <&sleep_clk>;
 			timeout-sec = <30>;
+			sram = <&restart_reason>;
 		};
 
 		apcs_glb: mailbox@b111000 {

-- 
2.34.1

