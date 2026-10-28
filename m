Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793184152;
	b=Ubxq5pbzjaSssb6MzLG5bxW3z9Q4tcx+HqcLcWxYlNBf/+Z28VWlh8Zj9wdjkOl5g5qa
	 AAmVRNOYXEQ31lTR/gonPcVZXjcnnS5LeKHI17BoA56Vvsa1YUAhsmBtPwnDxwAj3nE6S
	 SPtCPeS9IHkClA4qIyHZ79vpMrIi4OrnFB8c/wzLPqhDUERNwwvcCdt6ztvERJeXr0tg/
	 frkwvVmXpaZVfdf0UWKqJ1iq2xj1ugBK9dsedB5IKVeFKbmTgibJKXB9csIQz3lg5dEPR
	 M5yxOv7/bx1u8efbLUgTW5uvCuUDc8Jm7e+icEDiE5LdbGHnNPOnXLBEBUcfBssMFyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793184152;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:X-Proofpoint-Reinject:
	 X-QCInternal:X-QCInternal:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Wr5H6194Ck7Knoj7DEU9DgmJ1Wo5pcWbmFkeajBfofU=;
	b=j+b8ktbQ2EUPajQZVgJAF3WbpnndFCEXAi9SCw9DRUAgfPehOseOabPyqaXOuEMS5QhL
	 L1kBAvM9Ln0zyse9vWE1qiAeecblPHXJCpQt1BMKwSuEmnLHJYD6d0LXiMsGGU2OTEEwa
	 Z6F72XBQZL9RiJ57fEzWnRpppAgzFVYrTJ3olE2e2i5yllCGqrFGGo0KzskcvCkl0jW+0
	 zYKQ2JVDYvVYdd1zafDk+5jlpEuQDUzdXFHDRl1yZtr4Ra50yfnZDd4lJnurnsDHrGh22
	 HChwHV5s5eWmbGDronA9vsHUhg+02gUTx12JXPTJqCcg0vvvLkckbIwPpeRwjfl3g/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mgEV0PF7;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8193606A325;
	Wed, 28 Oct 2026 10:42:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8193606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mgEV0PF7
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S8KTWd3265161;
	Wed, 28 Oct 2026 10:42:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Wr5H6194Ck7
	Knoj7DEU9DgmJ1Wo5pcWbmFkeajBfofU=; b=mgEV0PF7YLHYrrSFJUzwQNWUXWy
	5o4BIY7BwWtgjKnXWO8Ay2bzrwCZFmkNm81rZ/b/6zoNXfaQk1OT0uCuyXfFSw2n
	JhBTPtR/LAH75easrUIY67Xa7AjRKqAjb5jDxWa3mz/jAXsGL40ptxrS1QFBcNFY
	qNZATvNmyyrYnzKnM4EiWY1FXraeDJEOQ2LdxIvc8s5v1r9XjQRHgV873I6YmeJO
	Onm9a5Qo6x6rvcJmLImHCmS9zMGd7qJ0bkioEQV6FTw+Urd7DiJNxq/8oYmhE/TR
	LY1ogIG9R24L6m3MNt3jRHHDXthrHp8XE/U61WomkiEQehzucWB7kTM6+WA==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjy713rxq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 28 Oct 2026 10:42:29 +0000 (GMT)
Received: from pps.filterd (aptaippmta01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 69SAgRKd3208767;
	Wed, 28 Oct 2026 10:42:27 GMT
Received: from sdciot-sh07-lnx.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTP id 69SAgQXA3208758;
	Wed, 28 Oct 2026 10:42:27 +0000 (GMT)
From: Linghui Wu <linghui.wu@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Linghui Wu <linghui.wu@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: qcom: shikra: map WCSS firmware stream in EL2
Date: Wed, 28 Oct 2026 18:42:26 +0800
Message-ID: <20261028104226.1075335-1-linghui.wu@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918-shikra-el2-v1-1-07bb072baa31@oss.qualcomm.com>
References: <20260918-shikra-el2-v1-1-07bb072baa31@oss.qualcomm.com>
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
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA0MiBTYWx0ZWRfXwEpz8o9u3J+L
 ZKOlePpQHHFE/WOqKHH/366UuN6cYXorMe1db2pSjR5SUHiQZjS5BStAuwHG5VJHE9V+zLYXDvs
 UbCjGGpP7F1F809FT13DhTMpiKB+n9i+66XW5Q83ALdOZLqOwG/bRHM5iQFKF8cLShEJ+zj/0FE
 uPZSQLRJkb/OelEac0k6yQtrzzjnkd+dBw0ilJxpxwgQwHaHyrq9Tbtyd4ifaPFKsD6jahQAVJ0
 Pv3MvLaaGHPy887wR+AtkUOepcSUjTiYFeM1yQTIFTvkhh982cxgCIeyMo08DPS62pIKvXSpCIC
 AAolpOUqb7dcl3YT7B9Rks4Df88nIdJ2fbQGc74PsHMn2xD8Sv9Dz2oqrgLbw89MhgevW/8fbk7
 2Yt0Bacy3FdDYf7zaxH7WCmuC4OFuPKpgW/rCRr4fiiKcRWHmUUcuFMxKrM1Jf7UNeBlmQpTFW9
 3AJAo3LCxLChV8ojAFg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA0MiBTYWx0ZWRfX1OuKggLBIPTd
 qKlwG2LA/g/sSL032196/LpYvVRX/7IcOW574n/14QNmZ5HMaI4thmAGbs+dDmh3UhKFwFj6u+s
 Pf12zDLmliJ2G9c/O0yVcF53GOdQgWc=
X-Authority-Analysis: v=2.4 cv=JspkP84C c=1 sm=1 tr=0 ts=6ae1d195 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=_6-XGTQBvWoJhf-V3jsA:9
X-Proofpoint-GUID: i3txTG8uyg-yl-_tiIFi1HPi-wLB1Fy8
X-Proofpoint-ORIG-GUID: i3txTG8uyg-yl-_tiIFi1HPi-wLB1Fy8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280042

When Shikra runs Linux directly at EL2, the hypervisor does not
configure the IOMMU stream used by the WCSS firmware. Without a
wifi-firmware child node, ath10k assumes that TrustZone manages this
stream and skips creating the firmware IOMMU domain and identity
mapping the WLAN MSA region.

The resulting WCSS access to the WLAN MSA causes a non-secure SMMU
global fault for stream ID 0x1a2, followed by a system NoC error and
secure watchdog reset.

Describe the WCSS firmware stream so ath10k can attach it to a firmware
IOMMU domain and map the WLAN MSA for firmware access.

Tested on Shikra KVM/EL2. Wi-Fi initializes normally and the SMMU/NoC
fault and secure watchdog reset are no longer observed.

Signed-off-by: Linghui Wu <linghui.wu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-el2.dtso | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-el2.dtso b/arch/arm64/boot/dts/qcom/shikra-el2.dtso
index d2f3186bd47d..a0f7c4a635ad 100644
--- a/arch/arm64/boot/dts/qcom/shikra-el2.dtso
+++ b/arch/arm64/boot/dts/qcom/shikra-el2.dtso
@@ -21,3 +21,9 @@ &remoteproc_lpaicp {
 		 <&apps_smmu 0x0366 0x0000>,
 		 <&apps_smmu 0x00e7 0x0000>;
 };
+
+&wifi {
+	wifi-firmware {
+		iommus = <&apps_smmu 0x01a2 0x0001>;
+	};
+};
-- 
2.43.0

