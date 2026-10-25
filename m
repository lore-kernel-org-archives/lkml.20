Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792935820;
	b=YrWos7G091fWDqAEiL9pxuGuWhJJcL2Zmx8BCW2AAjGkFYzqCmySFAc3Z9eW2yZlAMGI
	 MYfYmUko7iTY8Ss047Tk1XeY82F7A8xLlzkZ93tju60uV4bk+hOqtXbs74Xdf9PNd6w6F
	 rCdR2nzKaU1QgNwMeU9Hiol16RWxxSYcX8QI7jiuTYkgq2Ew+gS7b3IyuJuUjvBIr/ypX
	 EnLxbQlg/WuyBPL/PRchEIA9ZU36ZMzLgGHH0gAkQAvA8MA+4NT9aKBjpWZYcGPjBC9zj
	 GT7khcic3q/jVSpua3Y78Whg25Yje5rs/BS2YIIUYaibTNot+drzWt1CD+KMPEAyPEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792935820;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZyVPnIb0kULpM+/plCk3hw12bg0v06X7Bexcn/YYCWU=;
	b=ihBUSRZQttJlv6kQLWnC0m7237CIuvQPCkLZwfY3uwpqY/Hgvu2ydMy9mcHJhkvT8LXo
	 VC7mQdx4E8hcfmJWGi0Vw2QtK1g+0QWgyJ4peRsxiovkKXm88axW8BJM8QlqpFCNlNhJJ
	 w9hymFgg1R8OyK+MocK2xAk7lNLrEM83YCz+71PSZx7rdT4cZwwwZqmDQp4TsMVuOE/E2
	 uYfqaSFmlL37bz0yisNjwX+0DSqizr9hvR+6NdT0XR64mdV0/B9LD7Ao4b6mK+9uaDKtt
	 /gIQIFut4LxNKRMXoznUTqZ7OxqzpZ7CUt6x7FPyk2CxC5uScyVk0/57zuN4MOUi7Rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OCo3xtms;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kZW+bZ2V;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD1B606A31E
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 13:43:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DD1B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OCo3xtms;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kZW+bZ2V
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69PClH0O3452791
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 13:43:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ZyVPnIb0kULpM+/plCk3hw
	12bg0v06X7Bexcn/YYCWU=; b=OCo3xtmsi814QbP993m3HWiNttysUi+BLzs3Gz
	lLVS+87bYkFS4NKaJGW3iCl1T+m5PBGFe/VE0YH1SINGjZF3owScWGAv6nNUH0u6
	yJDcSOfP9F0EvdcGkat1C2ZxG2EKlLgqxwxkAZ8CKJLwnEC0yyf49w7ugIrX4SNe
	u118TMf0sTdUPC3L2sis8WXjgIWa4hfyUm+BTG20lFdkw/nM10+Vro2QtmdmyqgV
	c1uzo5EtDf1+jFDqzilt1LtWggVcKYn589gqMJSLQKYB12PmbfqQ71e9bp9vqPL1
	bWoJW8zhAro4q8Fv2qmHkpYoNJci8oZrtYsPzr3j1+iYYrWQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgn27u53w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 13:43:38 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35c5aef2a74so10883546eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 06:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792935817; x=1793540617; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZyVPnIb0kULpM+/plCk3hw12bg0v06X7Bexcn/YYCWU=;
        b=kZW+bZ2VKw2KRIspehzJkbD3Bm4PLIJWwMwA2MIuATkeCVCjAAQzZPh/fmbuakSTN9
         UNJJG+FmsBkYTQrqe+tqXh5KeLFrIMy58r1P33ZjltS/a8ry05112juJQnEskv8EpZ37
         JevRI8L8Xet3AQSP309TMzWSq/Phr8Fp1m2mvqnBfnc1jQ4c4zbwZ7RIr7xGDAB8oaN5
         ZkgH+Klx8eotPy2U43QCxZXMNArU0vSFoyccIEAVMFs9qw+xeaAwweFS/pUJMAtea47T
         XHgr+sUlNHmrIRGBkbT8tlyPQ2ZNNJGRRUD92YgWt5tttAIORGdG8eQaFQcqahyfcqpx
         E/gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792935817; x=1793540617;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ZyVPnIb0kULpM+/plCk3hw12bg0v06X7Bexcn/YYCWU=;
        b=WzowuZUKq0SckgNEIML2xdtytUZQSdCp+lfE224+TjAj/hEuO7PiTebT0mcBYFgjem
         aMWmtKPeC7rROcWLalCspx2Qg1XEdwjGEub/AhQEYLv4GT9lRjqOuHBTdzHuSHcc01Ml
         tFyF5Dstq7XTQqFt88RV48QMlMLFPEc6z1bX78sGIqYQUl0dLufJjdl/LXX/8DFr6lRC
         v6Mbp5ryapMMwDOEobIz/DTgFwehxmsgqtXxefKa6H9kLqcwlk7m4Dt9x1ZaXC+4aIOn
         0rNEXVG7/I3+Sk84LRyNoOpPipIuZFKVrVNLwokTL4BGnBrWe6CwoCeoJScVhvY2j3s7
         TL0g==
X-Forwarded-Encrypted: i=1; AKwUvBzMVEExhr9hQEFgX0P7YhdHutWrz1ecI2haOAXkAkDrGLlSqfD3vdsihLB/8Xn32aBapRhHFIWUgUfDnxE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLtdq38k7QDZ24iLdOpIr65DAekvSSOQdOgdK6VZFuCVNcs1voP
	ooSQBehSColDuA3oXhfRAkCarlgW1mt4RoO1mz9cz4FsD/6u3UvSMVs2j1LfGr/7ZAWE1pLXUoN
	R8TyXtx/nBKVF99UI/R0hwx/428DR9WhWmRFhGds2BQcm1msP3MRS18QheB6k1djK9Lk=
X-Gm-Gg: AYBFou1ms3vn9ajb5I/Q/xfxNcPi/NKoG/PBJh/8lYByk7Tt1EeKVvKX6FMZmhi0fSu
	0G/7icQ51PnV0+L0ABxYvPJjlHEE7jU3WdUksk9HvWQiSzQ84PEvFqPy+CgDAwvFF681pedy+L6
	fNCek+WUciNX2f4igNmvlTlhgSMid6Sk+GMyEBU6ovKwY8cwI2PDaRpCFg6IJQXqVeApFCfIrdZ
	JOoNwOkWerY0pD7c3LVNP1kb6/uymECEcoVQJC3w+G7BWvNhfOSpl86jvii9Cw7JpQfNP4AOklI
	Jp//HwR+K+A8Cq8QxrNb7qK5Z9eoMmyg26jdsGydB5KkzVRh06IG3N8OnermWKnSxiQ6yuWQAM+
	HhqBCNxiOLZsVdwldkVPt7O2Yll0IidutsWx1
X-Received: by 2002:a05:693c:6390:20b0:366:b36f:a9ac with SMTP id 5a478bee46e88-369e861c209mr6836973eec.34.1792935817340;
        Sun, 25 Oct 2026 06:43:37 -0700 (PDT)
X-Received: by 2002:a05:693c:6390:20b0:366:b36f:a9ac with SMTP id 5a478bee46e88-369e861c209mr6836944eec.34.1792935816817;
        Sun, 25 Oct 2026 06:43:36 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369ef6a71a4sm14608904eec.8.2026.10.25.06.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 06:43:36 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Date: Sun, 25 Oct 2026 19:13:29 +0530
Subject: [PATCH] arm64: dts: qcom: qcs6490-rb3gen2: Add SPI3 QUP core
 bandwidth OPP
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261025-qcs6490-spi3-opp-table-v1-1-d0e0be6ed1b7@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAIAH3moC/yXMQQ6CMBBG4auQWTtJOwKKVzEuSv3VMQZKB40J4
 e5WXX6L9xYyZIXRoVoo46Wm41DgNxXFWxiuYD0XkzhpvZOGp2ht3Tm2pFseU+I59A8wAvY7qdG
 Jb6jEKeOi79/4ePrbnv0dcf7eaF0/g81/YHoAAAA=
X-Change-ID: 20261025-qcs6490-spi3-opp-table-eae8724e9215
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: mukesh.savaliya@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792935812; l=2093;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=VikVOS7UVUNtPxV/SyOLt07vTrA1qmdxUJpVFVngMu0=;
 b=FP4dkY0t3VMeNsfHXth9EnKf0NyQiqZWgOVvIIVk2I0cQHeliWy5atcJ/6hq37/iiAoSuSnKE
 wdEkbYuaRkJAV//E/2/oQatDKOp64dJta7XFu5FwofRtJCqnGp9BU4W
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Authority-Analysis: v=2.4 cv=G7GJgNk5 c=1 sm=1 tr=0 ts=6ade078a cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=zOFECjqJgxj6X-Cpi28A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: sleX2pb2fFZlIj8LoW2SJBMGRu8Xeib-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI1MDA1NCBTYWx0ZWRfX8KAMJH1+BJdD
 NQI0jL+BHTI+TAPEmEJUo9I7jFkGhuTY9fAc6Zg+NYALslYoNbhvQU1ok7gYvsGGLI+2Jw+mLaM
 BvPugVK/WELw0xpMYB4K0BaGbdXCdN4=
X-Proofpoint-GUID: sleX2pb2fFZlIj8LoW2SJBMGRu8Xeib-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI1MDA1NCBTYWx0ZWRfXx4GYEwAddh/Z
 CIaFhSA+cxUgYkH634fw/WpeHBv8xjMnHmOwQg7aZvNqamulX5w89c2La2YJpVR76pK5HQK6Efi
 GqFVOiGD4tLVSZJPofgcbf2flp7l9zp38ljLBllSIUGFW7GrBbyvd7dMOnIKLkxs8kh2nh5HIqR
 oWMLcJug+dyjvuzAjH4OhhKbW9iD3Dd4PkWWTnA7Gbx9laCh04r3COCpQ/QNepJNUshVcL21gyC
 uuuGCxxvTUNUp4CJXKSfaUucQwY6MPKGgmIaJhY4+go4IV8rnM70rOVs5Mkx1jUB8fwWno8pMZU
 8f3DBEio3X2EjBG/ajtZKUghgQ7fym1k8dvzorknMH6qvEUbwPTi5gTnJtJgXn9J9sYd4XIK5Kc
 /A5ws9dJQ7P9AT1z8dfEd6uooDCW80s1A7ZhxP0TCtIfjeTrw27uQgw1zYgMqCYDjUvcyFvguzo
 H088VXsX2nL9PlXNNxw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-25_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610250054

Short SPI transfers are sensitive to the bandwidth available on the QUP
core interconnect path. An insufficient vote delays Serial Engine
register and FIFO accesses, increasing command-dispatch latency.

Add a dedicated SPI3 OPP table with the valid 75 MHz and 100 MHz
source-clock and RPMh power-domain OPPs. Add a 100000 kBps average and
peak vote for the QUP core interconnect path. This improves MCP2518FD CAN
payload throughput by approximately 38%.

Limit the vote to SPI3 on RB3Gen2, where it serves the MCP2518FD CAN
controller and its frequent short SPI transfers. Other QUP/SPI instances
do not require this vote, so avoid raising their interconnect bandwidth
unnecessarily.

Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index 909039816a21..bbc16f5cb808 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -85,6 +85,24 @@ lt9611_1v2: lt9611-vdd12-regulator {
 		regulator-max-microvolt = <1200000>;
 	};
 
+	qup_spi3_opp_table: opp-table-spi3 {
+		compatible = "operating-points-v2";
+
+		opp-75000000 {
+			opp-hz = /bits/ 64 <75000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <100000 0>;
+			opp-avg-kBps = <100000 0>;
+		};
+
+		opp-100000000 {
+			opp-hz = /bits/ 64 <100000000>;
+			required-opps = <&rpmhpd_opp_svs>;
+			opp-peak-kBps = <100000 0>;
+			opp-avg-kBps = <100000 0>;
+		};
+	};
+
 	reserved-memory {
 		xbl_mem: xbl@80700000 {
 			reg = <0x0 0x80700000 0x0 0x100000>;
@@ -1228,6 +1246,7 @@ platform {
 };
 
 &spi3 {
+	operating-points-v2 = <&qup_spi3_opp_table>;
 	status = "okay";
 
 	can@0 {

---
base-commit: 20a33c6b6cbe7e4805dfb6cd68816937443aa148
change-id: 20261025-qcs6490-spi3-opp-table-eae8724e9215

Best regards,
--  
Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>

