Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794548036;
	b=vuuOyCDfa8Gw73ZYwXgnZTqUlRSexWLKYY82fwSXpWbRkJylLSEA3DZVV7L1TUurZZOs
	 /D7JznqAlYLVgr3dHWMwkbadZo5S0myQp2aOOZVXxYvkFbUzDOVl816zdHHzo/R9QKOKM
	 Kxlys7GtNFBbcXVd2mKCCljpIckt6uGiWEuaquvHkEHDPNn/C2QQGIWOmQYGSX+0lmZyR
	 MXNBNJHktsBScxA6MoB1OKDpVBtIt2vZdoJJlc1YaccFa1PcMP/4wk23+KJyisHUK0FtQ
	 O2Go1DIc/+ojSJAsnmxgsyxZcO3/geAXQZxljeV6E8ykB6f8/Gm6Cd7VcInHNq5t+Bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794548036;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=asLbez7FLOaYj49SqrBBO/AOYptIZJLZqQ0km9mK0C0=;
	b=4T/zBDoA5If1pd9yLKlqBBBB2zgVAki2Nrhr049csfslrZqZFYwLLvLPTTbOfLFdyMSm
	 //dhPhlS+JLtXnXEAssjNYNmGndDpgndbwBB5b6TdXs1MQC8VrqVhx+Xyri0gsrIUhqzG
	 MLkcoyzr/PYo0WTT2r8jmyveDYuMYJgg4Pwh+Cpav70PbSWfBJy9OoALJZ8BS2aY0Cmto
	 Y/sEd8pMDtuvnJ4bndaq8YTJeqAyavZcTPXt3KVr5Bp64F6FVZwfpyk2wzAhhz/UFLj7W
	 2N2ZUITFgLhavJl9nAWZ/1168DUElstsds52Yyw+XJMVenl283uhn55vRWn5wMuEz4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Qy2T/DcA";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HCfgJheD;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C53606A323
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:33:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81C53606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Qy2T/DcA;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HCfgJheD
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD574gT2619511
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:33:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=asLbez7FLOaYj49SqrBBO/
	AOYptIZJLZqQ0km9mK0C0=; b=Qy2T/DcA+79q4NRBbiAnVlXGIvKBFxQBDuMvJH
	9DMhO+zsR/3xLSW/fRRqMOwuJfQ93/AIbAmEvDgSMlhjS7hkVRcdyAcjjz0Sb98/
	anQJlWNYsNtQNjT9Uui6obWIfJduAJl2Pe5xrqbstQVyodpsaInBC0w52jmPrHXt
	BoC0Vw/q4IkdL4WYn7aIRlZIV1zkZrOXg+FY0TC9YeAQgNiza5a58R6KAj+MAbhY
	femhgNsiC9gnk0tyiQcoSLjhWI/0WjgxhPAPJgNgYky/ZW8/SoCmfb3nVeMd8Min
	JsLxq0KMgIxLhkOE1jNqR3vfOP7tL3q/raaNx91x1thGcPqg==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwu2mraeu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:33:54 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-49dd26d6f07so597501fac.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 21:33:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794548033; x=1795152833; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=asLbez7FLOaYj49SqrBBO/AOYptIZJLZqQ0km9mK0C0=;
        b=HCfgJheDD8OICkQfz9p3ErLI/MLN8Xoy3lR5IYjKcqh7v8Qv2vaR+5NHlh00QjKP45
         yYUZEaScbQJWZPt7V0ciZF5VDQ3uGZXVVzyxtRlqPEG00Yo/3PhlxtTJvmPXERWsg3j3
         DCM7eBe2y4iy1flLOP7YdCPD6EvvX1eWCEaEh5wU2j5HXJu7x10y1ZGArinf/lq2ZxSX
         10a1KlFejW1G5kjJ1ol++xAmqBk7JsT5BP52q4m1iT7OxhQcISt2za5B31Qs/zFNr3LQ
         cHFYHTFo03I+f0+jUBmfF2wi/tx6DVwgiMapwDDWVECpW6F+0sUsEFnEMT64U4BA4hoC
         KIdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794548033; x=1795152833;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=asLbez7FLOaYj49SqrBBO/AOYptIZJLZqQ0km9mK0C0=;
        b=iqSWylT3E+3vA3wXNgdLpmLwna3mAE4ENhnUZdQHXDHNRjn9SQ4Kl+aU2WNynkKOYc
         Lt1Dz1ie2KnSCjivZelog3bXP+o7W3L4KR9Eh4U3myDhjhxEVOhiNidNdkWb5UGUdvdZ
         9sJPR5ZlM4HC6lk7wiN3u9XMNSVRAF3pnKm6nP1G8hLyqXMFl5TkZDnRL5BjzTLTDaoT
         irLZAyHpSTm2OaaBm1woVRcgTrrqTR4XThm6bnWF3S1yypUGmzqRkZhAS5ucsrjPnRR8
         uxxS7+nVTesjrOuFyVJXuzzyTd3Mgvn0Pe5gy95R+++mIolO15zF75nnKEjH6uvzUEaf
         iFiQ==
X-Forwarded-Encrypted: i=1; AL+hErHGnloJecnNHTLihJQlCb3Efsn06pZovubKNbpIxsw9FveWdomhvGp6hdJVMkNE+NGqDVhj0BteZKKUPgc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8iCBxLmt8pNFPmlbJC3XNnqmWQWohkQDlnOgts5lDkTLxO1aUv
	yXBj5tftjXQ7EhT6U4WTr4RXii2wZFHNG5Ze5URsA9PP7ploGYpeD9Ew1NZtFB5zFuyvb9C6T+g
	aB1e4HZyYi8vWGHs21Z/rlvubj/kEhUrwD2IvKrLeqWrXYeugE9iecVj04X3zyqyD+Vs=
X-Gm-Gg: AYBFou2XgIwkmJdrtzRWwLc3H4Mh5c5dUjgw2KbPu/aqx6kkPbdjPraCdljONvBDMuF
	+oYyV9+kLYHVCtUdByTzEmYEValkd8BlxIpK5/Q0nUeZ2eBN7JsjchBa+bH+Ii3jOxKxbJEde9z
	lOi9i4sz7RczncXYw9RD2WpJBl7BhjJR36ElJgHtyXtHmNpTyazd0RoBxxUClejvql6oKMKGGHD
	fDNcGf8/DH46NX69F+dyPZhTyMQ/OblF6zTV6e+GTikb1Tn6nlxVjb4XnPWEqaV8tcU2hGCDHaw
	vx/2C6bPTtKGEO+yTlpk35AkyF2jW+eaA/ckSmk/Rw3SWIM7iazWvIzBvSfuipu08oiLX+B6sBb
	G9gvU8qAiX0pjCeAk265ZYVu7WM0DNleONRxHLsjOcWhEjjmx4j3mDN236ZBxwbXfiT4/PFQGWY
	LIqltCB/kr6H4lIJWt7XHDVYRXGLuVSdKqRVsqQ7NdTjjPU+FUHDKe0BMvvrw9
X-Received: by 2002:a05:6871:88c:b0:47a:7564:9478 with SMTP id 586e51a60fabf-4afdf449ecemr1598435fac.16.1794548033180;
        Thu, 12 Nov 2026 21:33:53 -0800 (PST)
X-Received: by 2002:a05:6871:88c:b0:47a:7564:9478 with SMTP id 586e51a60fabf-4afdf449ecemr1598415fac.16.1794548032579;
        Thu, 12 Nov 2026 21:33:52 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4afe22576bfsm803252fac.7.2026.11.12.21.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 21:33:51 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Subject: [PATCH v25 00/15] media: qcom: camss: Add Kaanapali support
Date: Thu, 12 Nov 2026 21:33:32 -0800
Message-Id: <20261112-kaanapali-camss-v25-0-1d709f57f370@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XSzU7kMAwH8FcZ9UxQ7Hxz2vdYcUgTZ6lgZqAZR
 iA0745bJFppk0ulRPUvlv3/GirNE9Xh4fA1zHSd6nQ+8QHN3WFIT/H0j8SU+WJAiVYCoHiO8RR
 f48skUjzWKpxyDrPWVIobuOp1pjJ9rOTfx5/zTG/vLF9+LocxVhLpfDxOl4fDiT4uYsGB8WEpe
 Jrq5Tx/ri1dAdaS7uv8g5DCA+liQjRZ+j/nWu/f3uPL8sI9f1b0CmqDjPQNSDGERkP2ZIw10IP
 0BnFPDUgzRM4WtDFaG7qQ2SCHsgEZhpIcIQFYl0zuQXaDAhf9D9kFCkUVWzR4mXqQ20HYmpFjK
 CeGsnLF2S7kfyGQUjUgv2zNjVHTSDKP3RmFPdTqKDA0YjJeUTGSZAdCuYOgMWxegBRWUfCJQkz
 dGSHsocb6cQmk1CWjzx5Msj0IdxDqBoQMuRwVRR2Sj70ZodpDjRnhkuxgChrOkreAPWhLNrDUg
 JZkZzv6NUnWlgZ0u92+ATe16SNVBAAA
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
X-Proofpoint-ORIG-GUID: ONfRkWHJj688Rlxr0pYxjTLWFEh5B5so
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAyMSBTYWx0ZWRfX4p/bvGrCnfYv
 fl+FFsCS2bBcbNxNm5j7sLIupZGpw9dB5CJBQdydsxAstj8/xJDJk3Bn5Qji5Y/nYcHQxEEOxdt
 RPKRMylLEzw9vmhFRQ433XAsNCsZgRKN1ZASptMYt6LhgVUKBZ+/4Lrnnhw3F4gXA52MoyzvbBL
 Z0MNWCSKO6iuTDgAEFmEj3yPv3e3qRVPLOxFoboPk8bjUnESTG2uq3Ls7hurJrPAkbuKzS6oKNv
 YJuK2XvWr9bWGcgsUJIyVMXlcarlOlRTM3P0pKsKj+mt64aU+ayUVnyTEmXx6P70ZO8ybpUEz1m
 S/OdV6BijjCZFz2hNTIoKQ40lmtjz3Aeq67uzD2utQzedNLjR4YsOa9ObRwX9mmlbXXXeH11JEd
 jQBQLEaBGGSgUIinhyyOJlcnz8gswCpyQ/rKvdWS4u24sSylA1x6UrqSu3X+/6S3YMjqcPiZH3w
 cuDdnBoNHrHHlG1nC2A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAyMSBTYWx0ZWRfXwCk5mRQblmzh
 6a7jezRV6JBEH8S2675M97dGIf7jSrVOO+dOlWfXI19Ac4jqsxFTlQVa4EkqVx0BB1zc/cMlGX/
 LLl1XaZeuUeepv38FQ3/5cZjzLSo2UE=
X-Authority-Analysis: v=2.4 cv=ddQVTnXe c=1 sm=1 tr=0 ts=6af6a142 cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=WKFvwPXwjq_RLCbLkSwA:9
 a=eDt_RosHp5uxsIun:21 a=QEXdDO2ut3YA:10 a=y8BKWJGFn5sdPF1Y92-H:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: ONfRkWHJj688Rlxr0pYxjTLWFEh5B5so
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130021

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
Changes in v25:
- Rebase onto the tip of next-20261112 to resolve a conflict
- Reverse TPG hw_version and reset order, as reset depends on it - bod
- Link to v24: https://patch.msgid.link/20261102-kaanapali-camss-v24-0-d6b8f3f6f66f@oss.qualcomm.com

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
 drivers/media/platform/qcom/camss/camss-tpg.c      |   4 +-
 drivers/media/platform/qcom/camss/camss-vfe-1080.c | 213 ++++++
 drivers/media/platform/qcom/camss/camss-vfe.c      |  11 +-
 drivers/media/platform/qcom/camss/camss-vfe.h      |   4 +
 drivers/media/platform/qcom/camss/camss.c          | 244 ++++++-
 drivers/media/platform/qcom/camss/camss.h          |   3 +
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c |  32 +-
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c     |   1 +
 drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          |   2 +
 20 files changed, 2115 insertions(+), 21 deletions(-)
---
base-commit: 161837d37055642b03475137461d4438c65dbddf
change-id: 20260112-kaanapali-camss-73772d44eff7

Best regards,
--  
Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

