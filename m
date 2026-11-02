Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793616139;
	b=wIDekdHoJSkZvPcObxDfS9wwqOVYJNZLaUmOPStO+wS+CgDgwVqcqtkk6J43cgK3YfdP
	 CN6IzILNLMsEqnM53GAl0VzjrXnQBYgdQz0h+u3tFN3RlvKM3fewvVoeNWvy+1W3xTAkv
	 +A0WlxskW7ZASgISO7ZSn8MaqROXaiUXc1SM3O4bOhWUwTTERQucz6rel1VwGhkFMeRUy
	 aC4/MSg/DlSiUEzmFqqu/UFdZklkr6xVqm3NOyDhZSUyW0XTA5U+ftY+d5LmvrFX/OWpr
	 VslxQsmAn0UIpRc2mrFaWYS5PntRfQfKV1ZRcP7ioMl/Yx5cpN3aF7i7I3p3TCQP1hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793616139;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=qEbNqFOgYezn5ChmEun2RQFN63KFPUOZ2CBu5VznSKk=;
	b=aVW16HlMqRddgulRkqU1dMKiaPrF1NsJmqGSk2zqFigtAIymLlFD0cgHkxsu4NENFzf1
	 giGA+EZpYmIDSjbRD0jeTc2EOtF4nBZ252HvuTQ/ziO6IOqxCIi+JAJJOo5hWd0QwVgZ+
	 jWnyDP8eJFhaQ6jnuZkLYXt+EsuLyow25Ffd//hX9deHqGbuNfj2T1T92MjXLdQ9qyEtx
	 ko30dEu25MZ+k52KLySyvhxJtTJWNRECAv21M4vWHA51xfqo2W12lZr3qkKIFTk6Cg/W/
	 QkmicCNLbk8456dBHWtmfgQdFO60lpedvOnfSl6Gq+jVn52ExI48n7Oe3hL16nJnkow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eC9zvIJm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iyikbCeG;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AEC2606A32D
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 10:42:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8AEC2606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eC9zvIJm;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iyikbCeG
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AMtr1821213
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 10:42:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=qEbNqFOgYezn5ChmEun2RQ
	FN63KFPUOZ2CBu5VznSKk=; b=eC9zvIJm2kWelTUNNeC3juL8N4fiy5dZcybCDz
	zuZKbU+9DNTTMCzbdMLD5NavUKcx/p8MgWRJn1CsmW6epQkba/s3SZxgWPsr0Wxw
	wUtWW7Jlwx3TGl69/Hr/ly4pmEu+G0zTBY/pL9xg5chLdCSyxAiypT3k8wZtm6Tt
	wGUPbBeyi2C3N6XrNUrhXgTHCSIB2hT09+5wDxb+hEEkB/+ZonLIf8sJrziPVeLa
	yVs8mLCJNvQvjQfEtmulisU3pGCIsSINefoXWY6ADxfhHLuj6I9jj2iaLCX2SU2s
	3FBJh9FD+HvZsB1LYKeQ4EJgyPVnqzOu8oed9vkh8uiJyZVg==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpky4h8u3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 10:42:17 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4b597558c4cso4358299b6e.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 02:42:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793616136; x=1794220936; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qEbNqFOgYezn5ChmEun2RQFN63KFPUOZ2CBu5VznSKk=;
        b=iyikbCeG+x+Bin30gXq031/MCeYa8d/WElswNDFMZz5XCK4IpiHKpOS6YrBZx5RzrL
         1zTsE4CgqH5Umxm+RyNLIlJHcw0O1tmHfqpJRvSnFAJsuQOWGtlYEyUqoHIln5tkcZL4
         L+UhDXpolEfQPaML3LML/k9oJMzHtig4LIzkOXVMNV/gCZwO00FDYCeTweszDnFAkYfl
         uyRhHgBTgoqjbsd5YhJOGZqDxTU2XHxKUvy68AnphuEbOB58PjEBNojpmb+4Kv6RZ3jL
         mTAnaEMxI4+iW4j5e2psX7HBZiJuC0FbT2+s++uZsGFuvKfOX82PDQmAVLY+nXsIuXSG
         TrTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793616137; x=1794220937;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qEbNqFOgYezn5ChmEun2RQFN63KFPUOZ2CBu5VznSKk=;
        b=MmMVSt6wiNrJzQUs0u0qjuQyS2MP9THt5rwaSNMSZEEfe/eodFVjMo6R7kjURqP38X
         Gt9dxUcNotUS+5v4dcnu1iXH5LVqqJRu2CFvyqtp5dlmreIjZ7GG15ghV0Oljff0F9Ns
         NRMmmWMzp9MBUOAKH0PM/ucl72KTS6wSdTxL4jFRW6SOB5g+EU0afepGIB/h9ljH41yR
         aVz5F/VCOUTFt0wYKqrXwIUA1F+SdnhKTU+PyuOvGnKZafAZhaIQLgEMqtGWnPfcapSK
         hB5IhaGmQ2fTFL+bbMvYnubE9zKqqrH/wdP+wQRJI2NuzDyxMu7J6AlOgoVZ6Q5q0CcO
         jXIQ==
X-Forwarded-Encrypted: i=1; AKwUvBzgKb9TLOVBgvqJI/TtAyB/tgkUUWeZ8hwORVrI/56k7EqSN9KFy4O5u/OKu3HdeU+yDbDQLZHuoofotYM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJli87apRIOJ29QFoQyApPmeJm1tK3oMdVr4j6wZ+bvXTZ7o/Yp
	jv9N4AkYqfFwpZeliaUJCUXQilUqGeFxe64VC8kY44FYfsfSRTA9AjQJacQsnQNxfo5/QIn4yHV
	M4yy+QI7qXYEQwUBHAGGSxveU6PwO4kFuv0C9mW8N98M4+1U7U+Sb8i9VCr0byofS4EQ=
X-Gm-Gg: AYBFou3eoHa6yW2KchyVW484iN61iwMYVdf9E6UEOJvn/nrFl0n32+luoFXZhSCuMbY
	T59/1d23PcV2d2MSztSZInfNIRCnEZBsJxWpDOx8sxRqr3XqHRjYZaW3uXGbZ61B0Y9rLcUGtd+
	HIDNYHTCjv+VYHlsWFIv+2uziv0MNunw38hv5QI49auNeaYfXSZ5TGjzkuESWFKqNITqOYy0psK
	LoVidpqEspehMHhzKX4BFveOGeST1IMQL6jq5CSMl7DRNVbMMBF1xry0Zzl0sejZ48tKB856qa3
	hn+Y0chptp7Hpg1uxGT8JbiCra62lYh8Czg7/bdzUPfcYqVWDbfjpYsTDA809KuzbnovCDkvcN9
	sDVgff8zYx/j3Z5U4+NKyc2bCEbIf88QC9y2sySBu11ZDzRkFw1kk9SkMjDUjse2BfsL6dM+Sms
	HALH7EYo37Qv/nGzUgkK0EsKL1sDX8StCB6OBP49FCz1h2sjcOg9ILXjv7+kc=
X-Received: by 2002:a05:6809:2791:10b0:564:30ff:6cca with SMTP id 5614622812f47-56430ff6e84mr2159452b6e.60.1793616136286;
        Mon, 02 Nov 2026 02:42:16 -0800 (PST)
X-Received: by 2002:a05:6809:2791:10b0:564:30ff:6cca with SMTP id 5614622812f47-56430ff6e84mr2159433b6e.60.1793616135739;
        Mon, 02 Nov 2026 02:42:15 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fe0fc77sm7447171b6e.12.2026.11.02.02.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:42:15 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Subject: [PATCH v24 00/15] media: qcom: camss: Add Kaanapali support
Date: Mon, 02 Nov 2026 02:42:08 -0800
Message-Id: <20261102-kaanapali-camss-v24-0-d6b8f3f6f66f@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XSzU7DMAwH8FeZeibIdr458R6IQ5o4UME2aMY0N
 O3dSYfEKpFcKiWqf7H+9nkoPE9chofNeZj5OJVpv6sHUnebIb6G3QuLKdWLgYAMIJJ4C2EXPsL
 7JGLYliKstJaSUpyzHWrVx8x5Ol3Jp+ff88yfX1U+/F4OYygs4n67nQ4Pmx2fDmLBESQMS8HrV
 A77+fva0hHxWtJ9vf4gQDhklbUPOoF73Jdy//kV3pcX7uvnih5R3iANrgHJCpFWmBxrbTT2IHW
 Dak8NSFWIrclkQjDGdyF9gyxBA9IVijBiRDQ26tSDzA3yteg/ZBbIZ5lNVugg9iC7gqiVka1Qi
 hVK0mZrupD7gxBANiC3TM2OQfHIkMZuRn4NtTryFRopaic5a2DoQAQrCBth1wGAMJK9i+xD7GZ
 EuIYa46dlIUHlRC451NH0IFpBpBoQVcimIDkoH13oZURyDTUyomWzvc6k6y45g9SALpfLD1iq8
 qMMBAAA
X-Change-ID: 20260112-kaanapali-camss-73772d44eff7
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Vladimir Zapolskiy <vz@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-ORIG-GUID: g63ZJN40um-UBwI5_dXrsNfE3cXfn67Y
X-Proofpoint-GUID: g63ZJN40um-UBwI5_dXrsNfE3cXfn67Y
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0MiBTYWx0ZWRfXweFk2RZcmb3p
 CTMrgGI03BeU7co6skGZ6tO8XC7OVF1TTmhXvOqdzKHXK5zOtmEQv2fSrD867QbknMT6L2Xk2Dz
 KP9V+piwFof0ZSb5IJpI3gdduwcf6rs=
X-Authority-Analysis: v=2.4 cv=QoHLTlyd c=1 sm=1 tr=0 ts=6ae86909 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=WKFvwPXwjq_RLCbLkSwA:9
 a=PSv5JvSRJg7gKycj:21 a=QEXdDO2ut3YA:10 a=TPnrazJqx2CeVZ-ItzZ-:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0MiBTYWx0ZWRfX3H5VDujvQ2/Z
 O9HQNjdmHhk52tPQjNQI1k9AY9NpXLp83jZQMA1CcC1jaeuj6R/xPbE8D817/3DTbll3IO9+0G3
 p17C8JhPAbFVHXWkxVTA5/eFYGxc2uCREEmD9G7ASetyEfb0XbZ6pQUrrSww3YiBUC7F8i3T3Qr
 t3sFfz04nPNjoJXmqaE7U7jieUVYncp3kNME/zG60G9joKFw7ZQLlSrDuWGXaQzVsu4KEiRsZ8R
 mQX4oSbdpCBiAudidWxPN0uoBdWl97uL3UILSwsqq5AteIozrUkRiUaAeXsdP8I/fPgz5yWOGMt
 rgtz8kVswJzPpCex5KHMiHrF/yYY7LGgzEDSXl6CRl6vSAjpR+tPgy+djWPNSmMEf6iWrO6XpwU
 3dRPC0MaMWgqdZjGE8spEk/8BcJsdAHf5nfTv1V3hK0EKZZIDfSRMgj2SVi5tvpF5aEpxBu4aXv
 uDFIgIBE3OvlmtcTROw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020042

Add support for the RDI only CAMSS camera driver on Kaanapali. Enabling
RDI path involves adding the support for a set of CSIPHY, CSID and TFE
modules, with each TFE having multiple RDI ports. This hardware
architecture requires 'qdss_debug_xo' clock for CAMNOC to be functional.

Kaanapali camera subsystem provides:
- 6 x CSIPHY (CSI Physical Layer)
- 3 x TPG (Test Pattern Generator)
- 3 x CSID (CSI Decoder)
- 2 x CSID Lite
- 3 x VFE (Video Front End), 5 RDI per VFE
- 2 x VFE Lite, 4 RDI per VFE Lite

This series has been tested using the following commands with S5KJN5 sensor.
- media-ctl --reset
- media-ctl -V '"msm_csiphy2":0[fmt:SGBRG10/4096x3072]'
- media-ctl -V '"msm_csid0":0[fmt:SGBRG10/4096x3072]'
- media-ctl -V '"msm_vfe0_rdi0":0[fmt:SGBRG10/4096x3072]'
- media-ctl -l '"msm_csiphy2":1->"msm_csid0":0[1]'
- media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
- yavta  --capture=20 -I -n 5 -f SGBRG10P -s 4096x3072 -F  /dev/video0

PHY driver part for maintainer Vinod Koul (3):
[1] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add Kaanapali CSI2 PHY
[2] phy: qcom-mipi-csi2: Parametrise the common status register offset
[3] phy: qcom-mipi-csi2: Add Kaanapali support

CAMSS driver part for maintainer Bryan O'Donoghue (8):
[1] media: qcom: camss: Add addr_update hooks and guard CSID reg_update
[2] media: dt-bindings: Add CAMSS device for Kaanapali
[3] media: qcom: camss: Add Kaanapali compatible
[4] media: qcom: camss: Add PM clock definitions for Kaanapali
[5] media: qcom: camss: Allow CSI2 PHY devices without CSIPHY resources
[6] media: qcom: camss: csid: Add support for CSID 1080
[7] media: qcom: camss: vfe: Add support for VFE 1080
[8] media: qcom: camss: tpg: Add support for v2.4.0 TPG

DTS part for maintainer Bjorn Andersson (4):
[1] arm64: dts: qcom: kaanapali: Add CAMSS and CSIPHY block definitions
[2] arm64: dts: qcom: kaanapali: Add CCI controller nodes
[3] arm64: dts: qcom: kaanapali: Add camera MCLK pinctrl
[4] arm64: dts: qcom: kaanapali-mtp-camera-s5kjn5: Add DT overlay
  

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
Changes in v24:
- Reorder Kaanapali CSI2 DPHY compatibles alphanumerically - Abel
- Refine the CSI2 PHY binding commit description - Vladimir
- Use 8775p TPG resources instead of x1e resources - Vladimir
- Align tpgX and csiphy_rx clock names with the 8775p platform - Vladimir
- Remove the unused gcc_axi_sf clock - Vladimir
- Remove redundant CSIPHY resource definitions by introducing
  compatible-specific code and keeping .csiphy_num instead in the
  resource list to denotes the CSIPHY number - Vladimir
- Remove redundant .is_lite entries from CSID and VFE resources - bod
- Link to v23: https://patch.msgid.link/20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com

Changes in v23:
- Add the CAMSS top register region to the DTS - Loic
- Use the GPIO function with bias disabled for CCI sleep states - Loic
- Move the common CPAS/GCC AHB and AXI clocks to the pm_clks array
  in a separate patch and drop them from the VFE clock lists - Loic
- Replace the CSID AUP/RUP union with separate reg_update/addr_update
  field pairs to simplify the logic - Loic
- Link to v22: https://patch.msgid.link/20261024-kaanapali-camss-v22-0-7da3ea49c8a1@oss.qualcomm.com

Changes in v22:
- Add addr_update operation function to CSID and VFE to extend the
  CAMSS capability for split AUP/RUP in CSID instead of traversing
  the media graph to dig out CSID reg_update capability - Loic/bod
- Modify CSID 1080 and VFE 1080 to adapt the split AUP/RUP design
- Add SOF and EOF enable bits with top level RDI status offset to
  allow their corresponding interrupts but not configured on - bod
- Remove redundant space between the specific property and its
  paired property name - Konrad
- Collect RBs and Acks from Bryan and Konrad
- Link to v21: https://patch.msgid.link/20261011-kaanapali-camss-v21-0-04fd28d815c6@oss.qualcomm.com

Changes in v21:
- Drop reg_update_after_csid_config flag. Skip the VFE-side stream-on
  REG_UPDATE only when the connected CSID implements reg_update - bod
- Add address and size cell properties in camera node to avoid
  potential warnings during compilation
- Link to v20: https://patch.msgid.link/20261010-kaanapali-camss-v20-0-63e98ce9ac0c@oss.qualcomm.com

Changes in v20:
- Remove the redundant null check for reg_update_clear in VFE - bod
- Define the port property for CSIPHY nodes and align the style of
  CAMSS and CSIPHY nodes - bod
- Replace bias-pull-up and bias-pull-down with bias-disable for the
  SCL/SDA pins of CCI nodes in TLMM, as internal weak pull is inproper
  with existing board level pull up resistors - Loic
- Align the if-else condition in TPG version judgement and remove the
  redundant comments in TPG code but describe the hardware changes in
  commit description
- Add Kaanapali camera subsystem and S5KJN5 enablement dtso
- Link to v19: https://patch.msgid.link/20261008-kaanapali-camss-v19-0-b2c583ef50e0@oss.qualcomm.com

Changes in v19:
- Remove the internal CSIPHY hardware operations for CAMSS - bod
- Collect RBs tags from Bryan and Rob for CAMSS binding - bod/Rob
- Split the PHY and CAMSS into separate parts and document the
  corresponding maintainers in cover letter - bod
- Link to v18: https://patch.msgid.link/20261003-kaanapali-camss-v18-0-87ba4ebe0db1@oss.qualcomm.com

Changes in v18:
- Rename CSID and VFE hardware version from Gen4 to 1080 - bod
- Correct the description for CAMSS ports in binding - Krzysztof
- Add lane count fallback path for CSID RX configuration - Sashiko
- Align the TFE lite line count with the commit description - Sashiko
- Use hyphenated pattern for MCLK node names - Sashiko
- Resolve conflicts introduced by Glymur in CSI2 PHY binding
- Correct the spelling mistakes in cover letter and enhance commit
  description for compatible and CSIPHY
- Link to v17: https://lore.kernel.org/r/20260928-kaanapali-camss-v17-0-dcf3fd37f76c@oss.qualcomm.com

Changes in v17:
- Rebase due to CSIPHY re-arch dependencies merged - bod
- Remove redundant CSIPHY resources in CAMSS block
- Enhance the commit title description for CAMSS and CSIPHY blocks
- Collet RBs from Loic
- Link to v16: https://lore.kernel.org/r/20260915-kaanapali-camss-v16-0-c9f3f6f4180c@oss.qualcomm.com

Changes in v16:
- Remove RBs for binding, CSIPHY and CAMSS DT as tags stale due to
  split-CSIPHY re-arch - Krzysztof
- Update CAMSS bindings and driver support for the standalone CSI2 PHY
  provider and graph-based PHY lookup model - bod
- Add the CDM IOMMU stream and simplify CAMSS binding example part by
  removing redundant subnodes - bod
- Improve commit descriptions for CAMSS compatible, CSID, VFE, TPG
- Clarify the common-status-offset change with x1e80100 compatibility
  details and future SoC offset considerations
- Add Kaanapali camera DT descriptions, including CAMSS, six CSIPHYs,
  three CCI controllers, camera-control I2C, and MCLK pinctrl states
- Rename I2C and MCLK pinctrl nodes to include interface identifiers
- Link to v15: https://lore.kernel.org/r/20260720-kaanapali-camss-v15-0-c0b1c1167c5d@oss.qualcomm.com

Changes in v15:
- Add TPG v2.4.0 support
- Drive the CSIPHY through the standalone phy-qcom-mipi-csi2 DPHY
  driver, which let CAMSS csiphy_res only carry id, ops and formats
- Add a preparatory patch parametrising the PHY common status offset
- Add the mipi_csi2_dphy_3nm_kaanapali config and "qcom,kaanapali-csi2-phy"
  based on the new split-csiphy arch
- Link to v14: https://lore.kernel.org/r/20260601-kaanapali-camss-v14-0-e76f26aa6691@oss.qualcomm.com

Changes in v14:
- Define 'CSI2_RX_CFG0_PHY_SEL_BASE_IDX' locally in camss-csid-gen4.c - bod
- Align csiphy lane registers value capitalization and case rule for 2.4.0
- Rebase this series due to conflict - bod
- Link to v13: https://lore.kernel.org/r/20260508-kaanapali-camss-v13-0-2541d8e55651@oss.qualcomm.com

Changes in v13:
- Remove prerequisite dependencies that have been merged upstream
- Remove redundant empty 'regulators' initializers in csid and vfe  - bod
- Revert binding from full hardware description to CAMSS-only scope for
  modular and incremental development - bod
- Rename icc path names and vfe clock names to drop redundancies - Krzysztof
- Separate port index from VC value in csid_configure_stream(). Previously
  vc was used as both the loop iterator and the hardware VC, causing
  misconfiguration on RDI path starting from 1 - bod
- Link to v12: https://lore.kernel.org/all/20260112-kaanapali-camss-v12-0-15b7af73401e@oss.qualcomm.com/

Changes in v12:
- Add CSIPHY regulator current due to regulator interface changed - bod
- Link to v11: https://lore.kernel.org/r/20260112-kaanapali-camss-v11-0-81e4f59a5d08@oss.qualcomm.com

Changes in v11:
- Rebase this series due to conflict - bod
- Update binding commit message to align with previous generations
- Link to v10: https://lore.kernel.org/r/20251211-add-support-for-camss-on-kaanapali-v10-0-39e8874dcd27@oss.qualcomm.com

Changes in v10:
- Update interconnect and CX domain AXI clock names to be consistent with
  previous generations - bod
- Update the struct name for csiphy lane register settings to make it reusable
  for other compatible chipsets
- Updated power domain names to IFE for consistency - Krzysztof
- Add description for acronyms listed in binding commit message - Dmitry
- Link to v9: https://lore.kernel.org/r/20251208-add-support-for-camss-on-kaanapali-v9-0-3fcd31258415@oss.qualcomm.com

Changes in v9:
- Updates the names of some of the resources in DT bindings to be consistent
  with previous generations and improve the commit its message. The name
  changes are also applied to csiphy and vfe camss resource lists - bod
- Link to v8: https://lore.kernel.org/r/20251130-add-support-for-camss-on-kaanapali-v8-0-143a8265e6e8@oss.qualcomm.com

Changes in v8:
- Change csid and vfe driver file names as 'gen4' to reuse for other SOCs - bod
- Add missing register descriptions to binding and cover letter commit log - bod
- Link to v7: https://lore.kernel.org/r/20251120-add-support-for-camss-on-kaanapali-v7-0-de27f9a67ce6@oss.qualcomm.com

Changes in v7:
- Add ICP SYS registers to camss binding - bod
- Rename 'is_deferred' to 'reg_update_after_csid_config' to do rup/aup
  after csid config to make it clearer and simplify its call path - bod
- Remove unnecessary bitwise AND while configuring image address to bus- bod
- Tidy up a comment and a couple of hex values and csid/vfe - bod
- Link to v6: https://lore.kernel.org/r/20251113-add-support-for-camss-on-kaanapali-v6-0-1e6038785a8e@oss.qualcomm.com

Changes in v6:
- Modified the bindings to represent the whole of the camera hardware on
  KNP than just what is exercised by the CAMSS driver by extending the
  descriptions and the properties, the regs, clocks, interrupts, power
  domains, iommus etc. In addition, use the word 'vfe' everywhere in the
  bindings to be clear that all of those resources are referring to the
  same front end modules. - Krzysztof/bod
- Change camss vfe power domain names to align with the binding file
- Link to v5: https://lore.kernel.org/r/20251030-add-support-for-camss-on-kaanapali-v5-0-f8e12bea3d02@oss.qualcomm.com

Changes in v5:
- Refine v4 change log - Krzysztof
- Fix typo by removing redundant numerical version in kaanapali camss binding
  comment description - Krzysztof
- Add missing tags that should be posted with v4 revision - Krzysztof/Andi
- Link to v4: https://lore.kernel.org/r/20251028-add-support-for-camss-on-kaanapali-v4-0-7eb484c89585@oss.qualcomm.com

Changes in v4:
- Add detailed hardware descriptions and revise message title to follow the
  standard comment format for kaanapali camss binding file - Krzysztof
- Format kaanapali camss binding file to keep style consistency, by reverting
  power domain name from TFE to IFE and keeping clocks name order as last
  generation - Krzysztof
- Separate the 1.2 and 0.9 voltage supply DT flags for each CSIPHY to allow
  for arbitrary board design with common or unique supplies to each of the PHYs
  in kaanapali camss binding example, based on v2 comments - bod/Vladimir
- Link to v3: https://lore.kernel.org/r/20251023-add-support-for-camss-on-kaanapali-v3-0-02abc9a107bf@oss.qualcomm.com

Changes in v3:
- Use the name 'ahb' for 'cam_top_ahb' clock in cci binding file - Vladimir
- Reduce and simplify CSIPHY supply, port properties in camss bindings - Vladimir
- Resolve the dependency issues in the camss bindings file using ephemeral
  DT nodes - Vladimir/Dmitry
- Update hf mnoc name and bandwidth values for icc module - bod
- Split CSIPHY status macro changes into a separate patch series - bod
- Add clear functions for AUP/RUP update in csid and vfe for consistency - bod
- Clarify why the RUP and AUP register update process is deferred - bod
- Clarify the necessity to keep NRT clocks for vfe - Vijay
- Link to v2: https://lore.kernel.org/r/20251014-add-support-for-camss-on-kaanapali-v2-0-f5745ba2dff9@oss.qualcomm.com

Changes in v2:
- Aggregate CSI2_RX_CFG0_PHY_SEL_BASE_IDX definition into 'camss-csid.h' - bod
- Remove 'camss-csid-1080.h' and use 'camss-csid-gen3.h' header instead - bod
- Remove redundant code in 'camss-csid-1080.c' and align the namespaces - bod
- Slipt 'camnoc_rt_axi' clock in vfe matching list into a single patch - bod
- Add whole vfe write engine client mappings in comment - bod
- Remove hardcoded image buffer number but use 'CAMSS_INIT_BUF_COUNT' - bod
- Remove SoC specific logic for vfe ops->reg_update and add a new variable
  to determine whether ops->reg_update is deferred or not - bod
- Add description to explain why 'qdss_debug_xo' should be retained - bod
- Add the procss node in csiphy register list comment - bod
- Rename the variable 'cmn_status_offset' to 'common_status_offset' and
  align this with macro in csiphy register structure to avoid ambiguity - bod
- Aggregate Kaanapali items into the definition that introduced by
  'qcom,qcm2290-cci' in cci binding file - Loic
- Format 'kaanpali-camss.yaml' binding file
- Link to v1: https://lore.kernel.org/r/20250924-knp-cam-v1-0-b72d6deea054@oss.qualcomm.com

---
Hangxiang Ma (14):
      dt-bindings: phy: qcom,x1e80100-csi2-phy: Add Kaanapali CSI2 PHY
      phy: qcom-mipi-csi2: Parametrise the common status register offset
      phy: qcom-mipi-csi2: Add Kaanapali support
      media: qcom: camss: Add addr_update hooks and guard CSID reg_update
      media: dt-bindings: Add CAMSS device for Kaanapali
      media: qcom: camss: Add Kaanapali compatible
      media: qcom: camss: Add PM clock definitions for Kaanapali
      media: qcom: camss: csid: Add support for CSID 1080
      media: qcom: camss: vfe: Add support for VFE 1080
      media: qcom: camss: tpg: Add support for v2.4.0 TPG
      arm64: dts: qcom: kaanapali: Add CAMSS and CSIPHY block definitions
      arm64: dts: qcom: kaanapali: Add CCI controller nodes
      arm64: dts: qcom: kaanapali: Add camera MCLK pinctrl
      arm64: dts: qcom: kaanapali-mtp-camera-s5kjn5: Add DT overlay

Vladimir Zapolskiy (1):
      media: qcom: camss: Allow CSI2 PHY devices without CSIPHY resources

 .../bindings/media/qcom,kaanapali-camss.yaml       | 303 ++++++++
 .../bindings/phy/qcom,x1e80100-csi2-phy.yaml       |   4 +-
 arch/arm64/boot/dts/qcom/Makefile                  |   5 +
 .../boot/dts/qcom/kaanapali-mtp-camera-s5kjn5.dtso |  81 +++
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts         |   7 +
 arch/arm64/boot/dts/qcom/kaanapali.dtsi            | 758 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/Makefile         |   2 +
 .../media/platform/qcom/camss/camss-csid-1080.c    | 413 +++++++++++
 drivers/media/platform/qcom/camss/camss-csid.h     |  10 +
 drivers/media/platform/qcom/camss/camss-csiphy.c   |  16 +-
 drivers/media/platform/qcom/camss/camss-tpg-gen1.c |  23 +-
 drivers/media/platform/qcom/camss/camss-vfe-1080.c | 213 ++++++
 drivers/media/platform/qcom/camss/camss-vfe.c      |  11 +-
 drivers/media/platform/qcom/camss/camss-vfe.h      |   4 +
 drivers/media/platform/qcom/camss/camss.c          | 244 ++++++-
 drivers/media/platform/qcom/camss/camss.h          |   3 +
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c |  32 +-
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c     |   1 +
 drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          |   2 +
 19 files changed, 2113 insertions(+), 19 deletions(-)
---
base-commit: b6784eb814994ac227b455067c11f09da0b635ee
change-id: 20260112-kaanapali-camss-73772d44eff7

Best regards,
--  
Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

