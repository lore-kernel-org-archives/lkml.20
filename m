Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794468028;
	b=o4ghNMvRSN/wgy+t/9xD4sB/jRYEdJra1ez5pzf0Wh83gRornLK7/sOGv5Zv9pAyxwao
	 BlLNRimwr2MjqolgtqUVbEfQ1UAtvM+C04jN3qsTzb1KSXxgZYEGwmace4E8Xw/enHUeH
	 849MsOz6ufflSU5NdCcSbk2eVsKewpIyxUezsOdwNwJ77cMfgxWLPDErkS22d+AiQALRo
	 4GXuqHjloAQHMl5X2TmZK8+FomK+g/KwdNo1ti3GaXZs230m4NhQjBtyrPUyWOLCZeKFP
	 FVoET3sOSdnZKV0x/fFTNUpsbyq/UW5Sk6xItG72Rx3ZdJuVtaO1QwpBYx8Rc05QCig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794468028;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4qfL7piDG4Rh9USRDzIt+sOlvyefKyWytxUWwXJiZms=;
	b=O+/90EBDJlWLbsAkEZyBx1GNeIITNbk8RWPrD/fMdhur/2W8CVZ+9sEOrdkEGv3JGG+/
	 PL5B5HsJZgwYUU00CjAlkkU4aV6P7mrG6EL18Zlqjnw/ZzE8ieFD8S3DbpNYZE+NzHR88
	 sFyfMoVd7BZ7gvV+9GRWe2VUyRCPfeQVazX0DOPIvJ5pHRsAvv5bs3002MgGsT3m6RUhz
	 WdfpyDe4KnmYogYTvGzlNXk6CAAmYQVq2jkauBI0u5OdmGlTKZAUCh41a5EqdA2mZr1sc
	 G2BbOLXL64mpjhRMPEUK6Eojc2frJUs81UWhAZcXpm7x+RQ1aFTzAk4eqO9BZd844Gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o7kINskI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HqWfq3Nj;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F3E606A8A3
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:20:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27F3E606A8A3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o7kINskI;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HqWfq3Nj
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2Zk3c904025
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:20:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=4qfL7piDG4R
	h9USRDzIt+sOlvyefKyWytxUWwXJiZms=; b=o7kINskIVSfsohNxfhtPNksdu4R
	nwr4fsYh+RohlDcR5574SVPu4Ekm8w5eA/XkoaxitHR0S+qnfgXlNrwQO5P2JJmw
	twkMcpVrjKQllZ+if7BAw3m0cO4WvskP041LRMGPzMoFWobpOltVQlGx+aawk/jS
	TO6FvF+RYnlOw11m0vOZIhhoMhrYURWk8h4CePPNdSJzxt0lxEQbJH1mDtVLhHfN
	BmWuTtLClpEO380/+MTCI+iCU0sRFC+bx5ahid7OWjrH9Ip2/IeP5UjKrrRrD99T
	XBPeLIO2fg0sN+kx1cqcORzaA48SpQ4Cc4FrFPluFxQNrk9Gt/0wjrAuR6w==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvt1ubfce-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:20:27 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cd5e8574384so207419a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 23:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794468027; x=1795072827; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4qfL7piDG4Rh9USRDzIt+sOlvyefKyWytxUWwXJiZms=;
        b=HqWfq3NjQsajwFW4bSYoH7mLXQa/AEjMwUBNC3IPxJklUJO2VW9Y1Jkb12WKBssz6u
         XUSat+/kiE4pfj9nNdkdg/1T/0qjw2gFVugYs1vX+1G9Ul1JOgZH7/Yr2kofZWTsd+/c
         I0oHbnCfQP6x3e837gJLAAGOcwe7gHwJdx4zl+yAL70cv1Adz7iMvomODH/iSwZMrXB3
         tN6X3fdi8MJougx18d29VI7T9mPcR+qok2xoWDyBPcN7lTpoPT4qYz2LKm9Fi0mgVvKs
         +VpkZdGGcQvi75a08smVZdBynBDPTr9x3DsodoWQXuySrLch4dTwi9BjeApTF4Ne6EOs
         i67Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794468027; x=1795072827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4qfL7piDG4Rh9USRDzIt+sOlvyefKyWytxUWwXJiZms=;
        b=zizzz2ie+4vz08ed0Zzpp/pFVVFtnP+CdDbx2e8/zwU8UmirXNCJ0f5M9SDVZPqHsE
         URkYm4MeD0F6RX7jn218BqFZXc9f+lO6XDl4RjBYR9hPMIQ8nwySUk2EdwVPZy1jYyIN
         5ZJWmFyNRJRGJM9g5JyCDHzRE8XE6hFw604YaCD21UyBvyVFHMmWcOmjvki0BPb5AscS
         prtFA6rmcyUo8epm7lSbJRbylUz55r2bEoOZsAxrrPvMr8pJymqhBUOpJjcfacTU7OT3
         wx9ZrFQI10GwaHHSdIcz2dySQzzm6z3LL9tpglQmisLVb50WxzFdcyH/PUGhgJxBmgcg
         Oe3g==
X-Forwarded-Encrypted: i=1; AL+hErHySW3FF2CAOVeGRYjNL9Dwnq+9pR/fExYd7bn1g5CYidhiWTsuQ8cRj6mMliptdjzsS81TUZAbroiSTp0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/SqqoJ2wiwVbFtv9OEexvhcBeogicJBTPldhZTQ8hTZkp0VmK3
	kwCzjarkPYQT3/RXtc4GMOI3QPENozSI0FeAzensXu3rWs+ZBmxOfFeCiBZU78L3G3muObdGctc
	jCJHG0YZvc6cqxehwQ4W25HjeaWBn1pE4GIeEojs3Wkm2g60hNbovLLNTZbJ/6spl9pw=
X-Gm-Gg: AYBFou02JXFDs5X8+FRv+bL28o7HPJ0uRFqCnDpzMIQzVoqNsMWhxLbnOesErMO2G+N
	nVLoCFrHXg3zyq8hZXZrGDxg1cxfghMc1mKoKCQDB/9niJC8FahWl7Ty4pmZVdXr/WB1CAAlBtr
	jCCPxw2MQmwb1gFSEyeBZvPF9Lns3VL0b3rwr1iVCE1ZhWnp9ChXY+huA0SNguWiavdWwZ9PRdj
	m4rXUIOafi8UvExDKO1vaga6hzmABFZq6BT1bQGDYtBEty/nkMtZxtdDJFoNU/SvrgxBmXxJvFd
	wyAm9n2ctcWTS365Ukmb34L0dCHR9qhONje2Saa/5Y0m0hfzIggtGK2VUQ4/cBDg9VPcZCo1DbG
	TqSGnuAUC7EVw5vD5wTXl7YSReRlHD9oTVcM5Wt3F7ZJeHu+jAPOi05ONsv36ggYa+uDNCHSAXO
	vb9g==
X-Received: by 2002:a17:90b:2ecb:b0:3b0:d0be:f02c with SMTP id 98e67ed59e1d1-3b183000402mr6586917a91.6.1794468026618;
        Wed, 11 Nov 2026 23:20:26 -0800 (PST)
X-Received: by 2002:a17:90b:2ecb:b0:3b0:d0be:f02c with SMTP id 98e67ed59e1d1-3b183000402mr6586876a91.6.1794468026028;
        Wed, 11 Nov 2026 23:20:26 -0800 (PST)
Received: from sdciot-sh07-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c73e27sm3149185a91.9.2026.11.11.23.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 23:20:25 -0800 (PST)
From: Linghui Wu <linghui.wu@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
        Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>,
        Shuai Zhang <shuai.zhang@oss.qualcomm.com>, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Linghui Wu <linghui.wu@oss.qualcomm.com>
Subject: [PATCH v4 1/3] dt-bindings: regulator: qcom,wcn3990-pmu: document wakeup-source
Date: Thu, 12 Nov 2026 15:20:07 +0800
Message-ID: <20261112072009.3815276-2-linghui.wu@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261112072009.3815276-1-linghui.wu@oss.qualcomm.com>
References: <20261019093911.3199891-1-linghui.wu@oss.qualcomm.com>
 <20261112072009.3815276-1-linghui.wu@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAyOSBTYWx0ZWRfX1FA7Q236yE/o
 b4rbPyJWy+8FrbZlXmnOu1TMlcWtIwimIon8CBb9G+k8B0wVQ4N2aUZrjs9Hq/8dbWdCVwxBkxe
 I2iNpODkCKQuDUjWJKjMjfGET2kwMbQ=
X-Proofpoint-GUID: NfYRrdj3R4cIVQqENVmxHPwm493GvP06
X-Proofpoint-ORIG-GUID: NfYRrdj3R4cIVQqENVmxHPwm493GvP06
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAyOSBTYWx0ZWRfX6H1rDJcVVPWV
 r4uguZCyV/xuyC66o/u4Rrj7OblLmjf5bAiGfbmVyGTM8PFIMkLQttnFYSBn2hlPMmDBsY1HeLf
 90xxCPN2LDbqucdWQ6utITkwX9Q1MiP1bPZNwUx6LXIicXuZ75W9NZfycfixsCixTsyOSaMgVsL
 Xa1p3fG8DOBZei2dJOJkSkOOsfJBgva/9/LN0MBk1qM7z5E49NeHzf7VLlyQLwBhev/y/+wv71D
 t3WhDT4BrQa8UV4XQ9mOJjjQZ6dn/En8Xahq7W/QeagKegaLAhXgN+C3iXD+C5O+zUPnAzzo1E1
 pAewBjxSrCnfR7Nd1caljnTK/Jl15USOyn7SHCJkvV3t8ByU0Eyq2qSFBPSwme5N+NB36DhFOf+
 mz5cQZQ2HU7jDqCT5h0sDTlcsYDs8+HX6qCU4rEoCSC+EOe8plkPQGZ0azerSJ6MZXLXSJ7iwxu
 KFS6yvTi1VC3f9njBDw==
X-Authority-Analysis: v=2.4 cv=LvcHWXdc c=1 sm=1 tr=0 ts=6af568bb cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=brVOnVl_E7YOJ4RIXMgA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120029

The SW_CTRL GPIO can be used as a wake signal on platforms where the WCN
device needs to wake the application processor.

Document wakeup-source and require the existing swctrl-gpios property
when wakeup-source is present.

Signed-off-by: Linghui Wu <linghui.wu@oss.qualcomm.com>
---
 .../devicetree/bindings/regulator/qcom,wcn3990-pmu.yaml     | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,wcn3990-pmu.yaml b/Documentation/devicetree/bindings/regulator/qcom,wcn3990-pmu.yaml
index 9a7abc878b83..f0372e28c99e 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,wcn3990-pmu.yaml
+++ b/Documentation/devicetree/bindings/regulator/qcom,wcn3990-pmu.yaml
@@ -42,6 +42,8 @@ properties:
     maxItems: 1
     description: GPIO line indicating the state of the clock supply to the BT module
 
+  wakeup-source: true
+
   clocks:
     maxItems: 1
     description: Reference clock handle
@@ -67,6 +69,10 @@ required:
   - vddrf-supply
   - vddch0-supply
 
+dependentRequired:
+  wakeup-source:
+    - swctrl-gpios
+
 additionalProperties: false
 
 examples:
-- 
2.43.0

