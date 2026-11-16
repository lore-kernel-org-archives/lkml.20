Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794830796;
	b=PKbfqr11PO8i32jwSCfuJ/jQpiMF2HJWXXWRkECJpWGJ3RpN6rS9o0qKlxTHS7tZT3CA
	 lXeBO3iE3Ebn0skrWYWEzVTh3Ukb+Di1WBQvE3xkPkYRpXbxt5WLJBOnvo+zDWabv6/1+
	 c6lIwGMfa46BB0QIqb8s6e8fGgpnCudnR3sULiOfZ+Xf+cLOHVgt1TnMLbInDJPTTF48f
	 UdxEVi01reaYhLSpB3VJUrKllWPxiKPeTynpXh9edmoH6ewS0fF6JwtpTgHC5eK6iixtN
	 mm5oB+XHmlZnNpE31O/eDE5o6zPLqzBEQnxaKvQWUtirPqvAC5yNZIb4p6BsLq38h1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794830796;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=zW2/gkGq4nmG+GVOGBUwZNxbaEMh5XvK4WG9k00wmcc=;
	b=vx8Y5kObImPp1V+ZItrFXteysbgjb30yVrriEzRLPmlYp3Hww4+o+JiaY6SB6A8TKmUu
	 xqZc4rpYTccXAJvNfy3V4dKKLE6sVmyTflII0Eg89EeriqqXn1/vWAB3sJmh1FtSDYFPZ
	 kk+PYA52wv7DtQzVhiC5DP+pQMMko8tPiyTp9nVUOodHGS38OjnZX+ZQ7Mqry1Jww+lgi
	 fVUZPSQzMnJWUeFRcNXP/+GaMakpIheTfyLnA9EvhA17JqIYVQa1vqhUwWLcWrcHdFeam
	 xermd6vwn+lna7VYZq5HPt91SnLgTQinLa7t3pDroCGNnBkcqDrVlhIGGrZxrD60awQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZrD260gc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dqnc6rYI;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB420606A333
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:06:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB420606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZrD260gc;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dqnc6rYI
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGC1PWc1004710
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:06:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=zW2/gkGq4nm
	G+GVOGBUwZNxbaEMh5XvK4WG9k00wmcc=; b=ZrD260gctRypcdquqIhXZNM5DUL
	SVu/Z+em3Ag//0e+nCXBEM7kBImeDezWUi4mmC7MGNSl8ro2AEDBdOU1TsEUDcXS
	uiAqVmPVL+ih6YqThJgp51YtjtKzg18NP/Mw2X28V1Y2JQspLGK4SsDjeUIiSbxK
	pxk07cqCCMP53ZwA3/mropsnjcN2wZkL0mvZiT4Qg0actwgFszSSXMTDIThMpn4h
	cuNNkShpXDMzWdUS5Gt3vB6xT3egwDjwVWkzqDyhFRNwxQwcoQQu65BiGkAvOiXI
	d/heAaFuXbsJRhpwZIl6BARNPSJZ3HXDG32SIzL7zVxfyMUJHcwpxDyf5qQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j000g0bxq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:06:34 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1b3a348a6dbso2460241c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 04:06:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794830794; x=1795435594; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zW2/gkGq4nmG+GVOGBUwZNxbaEMh5XvK4WG9k00wmcc=;
        b=dqnc6rYI1ZlLQLVe0hkOCydUHBUxL4Z5hYClzv+wZUQg7h8OCtK8A5KzUdXNR8XNtq
         knuL40owDL4Wxq0NCijlNueBZ70KsvzpTJTSmnPyBHiknuHPWR9B9kA86pq7XBSsg9HB
         njtl9cLpjZBDxd6nN3P9sWIp3BbVrpGxa8tr9v5IFwRoccaxjeHAPdsWSFvSNwwGQogw
         i88Yt7H9kwcyRaV+SOxxWCujyyDdJ4sSCnr5sQs2X1qeS8D2PyvhG8AAfZ7KhDIl9yV4
         fcGcRfWP3EUaBy5qQVizQfGDPsmevYQ7nADzQDFiStwx2JiZPULpwj5INxR2oSZQ80k3
         YI7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794830794; x=1795435594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zW2/gkGq4nmG+GVOGBUwZNxbaEMh5XvK4WG9k00wmcc=;
        b=Waw+47ohsVmaAgjoufx1PbRJKq67Y3Y/0kVUGPUhnSKNv58wViwDjSQKgy5bBG84RH
         kN4wFGPZLUUpJH61kq1THr0qYEGj/DWEZdMTqpeA+JhxJvybp8O5x4fgXUucgydGsLSL
         9MalAxyL0zgEOtKZgKlniKUU2w6BWHTQev0LlfvkeuJk/LkyaxU15hR/nZt0+Lqognev
         yhqAa+D9uMDQP7Wfl0Osi9PXccuIJkNOLnj/rgAd2an2UbaMsGDionmc6KkANAIb2o0x
         1cpif3Vt/4dPcWdOFbdBLkuHkH1+hAXrAoHf9v9bQA4oa+/9rX0WTV0lyZc73ReJx03F
         ZN1g==
X-Forwarded-Encrypted: i=1; AL+hErHfeMT9yd27i7eHzZQBvxnl8cHw1/h55qDUGgocpPBW+R0XPVr2MvlY5lvCcYoRgbisNt3MOIbRamj2I14=@vger.kernel.org
X-Gm-Message-State: APuU4Z/VhDmZHRWBGX2aiwZ0Ea7xbw+sVubi0eWabO5gUcfEBX3IBWhi
	j3tOSrAiF93M2QkCwGgtEXvmf5beT2hNPYtLqFm99WA5jwG/X3jefTJv1L5XPE7pbzeP410gEYv
	07PMQy3wiv17Pixv+Hh3xKs3UEkxwWFg4Yv4HzDuPpVtcaI5ICWIhoHr94+p5kG/er5c=
X-Gm-Gg: AYBFou3aglty3/qziVcTCWJGu+PnwMW2qwB7xhvK0pbqZc82Hl/aUHZLDsLvOWDK3dd
	LPnaXD89Q5CH/CEfv6PvCRirruN/nkVK9cioVwLP/EYlpVKGK3gzW3qaKu2zI6z1fkbzQkUz7Zk
	oMt3W5h5YwW4VxuXgM+xGevVMIPVNHqHGp14mKk9n5eC3CiIIqizBzJ0jbMoO9n9JfxcB0oGqXI
	mSGAwlx0WFa0TyE9R30w81CSRkz4VTBoNOiTuiHnYUY98GUJMzKjCp/wSjdjUXgrC3FjQ5lRvaO
	Bj4t0xA69ZrFySjy1pf05kmYqcVvtHQflt0lxJDnLyzlv1wh1izLXAo8ApNA80ZX/wgi+V4S0KA
	XmNvUkr2LBY6dDae/9L2nl6yQVYqK+ljaTU6T+BUEaCNWOnHBGDq+f51Ou1QaHlMp1q4Kz/k/Mb
	VJXg==
X-Received: by 2002:a05:7022:b045:20b0:190:d0d9:3110 with SMTP id a92af1059eb24-1b50319306fmr10877404c88.45.1794830794287;
        Mon, 16 Nov 2026 04:06:34 -0800 (PST)
X-Received: by 2002:a05:7022:b045:20b0:190:d0d9:3110 with SMTP id a92af1059eb24-1b50319306fmr10877375c88.45.1794830793583;
        Mon, 16 Nov 2026 04:06:33 -0800 (PST)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm36961530c88.5.2026.11.16.04.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 04:06:33 -0800 (PST)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Dmitry Baryshkov <lumag@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] arm64: dts: qcom: talos: Add graph port placeholders for USB Type-C muxing
Date: Mon, 16 Nov 2026 17:36:22 +0530
Message-ID: <20261116120623.1726089-2-akash.kumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116120623.1726089-1-akash.kumar@oss.qualcomm.com>
References: <20261116120623.1726089-1-akash.kumar@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA0OCBTYWx0ZWRfX8phaPc+a5W46
 usVWdqt9GejJub0bBK8goaFnill+O0rSv+PHeL0vveALJUTygzXsCKXkbviJFWK6QQZc4+EkwpJ
 4BEReOcXcAC7eb3ts8AVFb740oIZ9vSy4VIv4daRrZdmjSGJ9fp962WHK61O/FzxHe/y6XXBpN8
 dpz3pO723Eisyf33FhoeYCQPM+p8G3XvLQWc7Z6UHWT7bYpbDwpt7HEX20kJoLEs2RmGg6QqqXG
 xhL77n2E8wmMvxEnDCiVR/Z18nG8rg7rHWXppiNI02oFIz2vLLNGaE0N/Pjfl4WHvncL5L/NUtr
 UmbSD8IqqJpiWvNf54ueBo4S2zS2muNkH0ry9pccvXOTjltAZpDbL4NNvcMFnCeDgxPvg+F5IvE
 yNGBRQnXjQxLVzXzGPe41ZkY8KRyRTgxyffxOHWATlEhO5C8vn1MuF9faKTocOMttj/FV3vE3vH
 BR9YTeEPuJf/H05aM4w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA0OCBTYWx0ZWRfXyFSXVfOEJE+x
 UqxDUMCgWWRi9nG1RzPLxvI3LTVuNDggYN/iEkm9rbts5LHUkhZoB7wjprrnyyx+WfePqE73oRR
 eGPrW+Qb/GKuX2sbx6OZcUgONcjx468=
X-Proofpoint-GUID: YIjUSlxSKo4N6dcoUOoYrxJDz1A7ls-_
X-Proofpoint-ORIG-GUID: YIjUSlxSKo4N6dcoUOoYrxJDz1A7ls-_
X-Authority-Analysis: v=2.4 cv=Vdtir1p9 c=1 sm=1 tr=0 ts=6afaf1cb cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=OnC3CdEk30aKpSFVcR8A:9 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160048

From: Akash Kumar <akakum@qti.qualcomm.com>

Add empty port/endpoint nodes on the primary USB QMP PHY (usb_qmpphy)
and the usb_1/usb_2 dwc3 controllers, along with orientation-switch on
the PHY. These placeholders let board files wire up a USB-C PD
controller's HS/SS endpoints directly via
&label { remote-endpoint = <...>; }; instead of redeclaring the
port/ports structure on the shared nodes.

Signed-off-by: Akash Kumar <akakum@qti.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 35 +++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 1d74e459f892..04636fd88807 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -5078,7 +5078,21 @@ usb_qmpphy: phy@88e6000 {
 
 			#phy-cells = <0>;
 
+			orientation-switch;
+
 			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usb_qmpphy_out: endpoint {
+					};
+				};
+			};
 		};
 
 		usb_qmpphy_2: phy@88e8000 {
@@ -5163,7 +5177,21 @@ usb_1: usb@a600000 {
 			wakeup-source;
 			dma-coherent;
 
+			usb-role-switch;
+
 			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usb_1_dwc3_hs: endpoint {
+					};
+				};
+			};
 		};
 
 		usb_2: usb@a800000 {
@@ -5220,7 +5248,14 @@ usb_2: usb@a800000 {
 			wakeup-source;
 			dma-coherent;
 
+			usb-role-switch;
+
 			status = "disabled";
+
+			port {
+				usb_2_dwc3_hs: endpoint {
+				};
+			};
 		};
 
 		tsens0: thermal-sensor@c263000 {
-- 
2.43.0

