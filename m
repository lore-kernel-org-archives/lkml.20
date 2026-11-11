Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794413766;
	b=zHkY2rYY5jUm0mJe0XJ/5/Kv5O9X/7c9OHy5YrjdpAOgO6IkrzljRh/KTPM54K/6ik0N
	 aySPnIjZ25kmlwK5QJ6yjbAq08sLykwRtUtoAjX1naqusGdsCBArZnVOcw9BxInhs83ee
	 wquqhPx+DgrMLVECCrN6U/4J09ckzBxP9y04BK1UxWttgyUbPZLJekCAq36XlZc6FvwUm
	 VLU0p6UwNXP8o72xGmPDR2Mt5O1uItvZlDu88bR7h3wvRKIg9Ms8gYHzI1n/bfoXtVvxG
	 cHIVuW5/lelpeVgcWlzroEzNQq2hsduV5VIuuNdvf1MAbno7yjr0y82Q0vDdHKvdoLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794413766;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=yN8rEZouC3yfilpL49Nn9rYRbZQUqv2Fvy1imuPZoCo=;
	b=VuzjNzJYHb7vYbA6l2UT7nzAb9Mw85A7AN9Vfg+XDbKLigaPLRDrWyC9X2zHbSqV4ccC
	 LXfACA0eLNP8pDs3LRNiQYdQKZbug3ydWSGMb0aSsZcoQwWSor4WLuaImoz75fUSlbrt5
	 oOqEhsDZMjp+N0x5ykJzjm2yIhhobqa0G5hDzByEJHvUWKb3ZX3lY581UnIs80RPzbHHq
	 42WqmpwskhEYMb/ju1E6Oc7AOEWhLwMsLaimht5LcBFkFwxwaTDRX6XRw3MalvlXH9fje
	 GTV/tyW1zaJrmkxESU5FHs5/YzOERDaHXTawKNsO0auHxkfe8DBitmTeOCGviluovMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JUphMJ03;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EqQhPN3a;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5BD606A324
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:16:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B5BD606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JUphMJ03;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EqQhPN3a
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABF0Nkg2665071
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:16:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=yN8rEZouC3yfilpL49Nn9r
	YRbZQUqv2Fvy1imuPZoCo=; b=JUphMJ0330lneS4Ke67Ym/G1OlfGxwhhr9TBaM
	qzZJARTt2KTVr9oBC6yMM1gyGqszmGF9ukpOZ26JDmNUb3DCUIU4vIprmhTmtfL2
	hURWWTVrHopLFC/EOdvLfuyj9NkEtkm8rXvyzXs0ne2khAnLq7sTeGyCFJm8pn15
	T+tuYMHDR0CJg5iVif/L1zayearw518TC90g46csH87sQ0LoPn2frYTAbpki3aLJ
	hQi8GLqYijsiv0T1WkxjZ10tcO8Ol+jIovD5ABFi+tmGHtSlKN0Q/fJD9U9NJTqJ
	h16Bg5pEfxt0IUc18HwFB2Iz4H+Pa5XIDsjNMMEMgk2+cuNA==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvgjdjpp8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:16:05 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1aa0fb7f157so5328887c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:16:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794413765; x=1795018565; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yN8rEZouC3yfilpL49Nn9rYRbZQUqv2Fvy1imuPZoCo=;
        b=EqQhPN3aRrmFp+lXeKnLm8ckKMS3CB/lYJdNvDMsw7ub5yeya18mwwiLkJeS5j+dYE
         WKa8te3MbVRYQ3DohmKjomRpzFWb4CV2IJX9+uMI8+PvWeKTG4uLlAHVeiIv1QJnx3ED
         KW4WYM+4XjVb0m+Jj0TepkTnnbMasoJAQ4RzgMiu86/qfmRzDZI9MvlwdF4G0P8Tsmqm
         lNgJDp/IRd2ynipCoq+Eemp3NrumgFP9Ah64dGikRnSuby9OJisFDElLCTbsinR1w0HW
         6JNBN2OXSTHuvaifF0fa4zr3VH4kGlSVfSIlPtB5XF18F848E422Ml1yAoN+10Fx0BkW
         DYZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794413765; x=1795018565;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=yN8rEZouC3yfilpL49Nn9rYRbZQUqv2Fvy1imuPZoCo=;
        b=uzmYS7ZG2XBXgnBz6bFzYfDuIdr/bbmXTGKKBtFxoJ9PFoJPwTrca/CawuNpw2rAgc
         9l6QoAuD7/MGaOynHd2BjfjC/whp3pd5o6Ydundx6e+wcQL6CJc8gryGH9l6YYWLmqxE
         LTEGLrFsvLHYfEJpIthjcCTm+xrUJvXIkXIPyRix/m1glT5CdNRvvOrlewrLeSbP1Y5x
         6K8WAV+A7aJZA2RdHR3gQeFOJwzPvyLc9FmNyhOpHHjSuw3p0ehNDKg1BXRSQdiyKdRq
         ZsiuB2U2zYvWniFaub61flHAlu7wJO8xeauFml7IKO6Qzu/MEufj9NM97SbFQGfBEMxO
         oWng==
X-Forwarded-Encrypted: i=1; AL+hErHAqXzHPI8TmGPM5Z9cu3gsfncpG0jWZBiIm7CcV4+kF/aOn8nerVGukPHPaa3PQhsjtbH4Pw34NPE2f+4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8feOTNZ9PZuCVqvLzoeEJc7Ad3JGgLmOkBukQr5yb76XgzIS35
	rUdrUNkWHZwUwFVNiCXhxv03E+hrzMAWMomuxVPp993A615CqC5DVWhXrtQqoNMPtMBoY06rr8+
	RO/IrwDXcy3NWoB6ZuZV6LbsmQCZgiczMQkEKBKMuTh2TiD5BMTRPbtvEwrJGprPeoGY=
X-Gm-Gg: AYBFou1VrZEWoUuohJvh89Q60TYyunOOVbBlHpAhG9fEdZjnTlwjfjP3CQbaVLE61Fv
	CIWHFZxJSQDoe0KAoprlk5ISW4jKUmdidvQi6p86AjFdoKaUXAG54tQ0h47EaBPtwT6B3T7kd2u
	wW5BV5upbmLj+QX7DiNDP0BrrmBttC/f2EegId7+pMQ7XoTgdoifMTyAj1fIfBoYK1pMwhkV0sJ
	xLytCWVfgMb/XAMAx2+ISxNW8eslT5x3cyBrWouw+usQWTEo4LniLNkWqP9Pqa17skeBxW6WpKp
	2xn7Xldjow2a7AQdahoh/NTwPDkxLVSE/+vIKtpQySh7D0wdK0sEZprwVmqiWwJAx0bjsKJfDpY
	DlPqCZDyWxVjTLnvJnXLEuMrxBL4D3bY1JS2e4PsYOCS7dwbs/s70EQ9ldTPbThGTVsgJ5dp4WL
	opwSH6aIs+kDX03VYBVxXCoUSH21m+CjvwImS3335xcDBaPfCpVIxUXKChrtl1kZHzkFEweTzq
X-Received: by 2002:a05:701a:8148:20b0:18a:8164:ce4 with SMTP id a92af1059eb24-1b3c015056bmr2846264c88.0.1794413764894;
        Wed, 11 Nov 2026 08:16:04 -0800 (PST)
X-Received: by 2002:a05:701a:8148:20b0:18a:8164:ce4 with SMTP id a92af1059eb24-1b3c015056bmr2846245c88.0.1794413764380;
        Wed, 11 Nov 2026 08:16:04 -0800 (PST)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b11150sm23548337c88.5.2026.11.11.08.15.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 08:16:03 -0800 (PST)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 21:45:49 +0530
Subject: [PATCH] ARM: dts: qcom: kuno: Add unit address to memory node
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
Message-Id: <20261111-kuno-dts-memory-unit-addr-v1-1-89e965f2c3ac@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIALSU9GoC/yXMQQ6CMBCF4auQWTuJIGDqVYwLSqc4Gloz0xoJ4
 e5Webtv8f4VlIRJ4VKtIPRm5RgK6kMF430IEyG7YmiOTV+X4TOHiC4pzjRHWTAHTjg4J3j2xlv
 TtdaaE5T/S8jz59++3nZrtg8a0y8I2/YFspt2830AAAA=
X-Change-ID: 20261111-kuno-dts-memory-unit-addr-7f9fb954bb93
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel test robot <lkp@intel.com>,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794413759; l=1586;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=CSzQmEb5F718VpjW29JEnKagjfsiWXZUlmYmt8BWzBY=;
 b=FnK1YiaXFJxbht2Fknevak7wOF2gTBehm4QTIXKU84L4+P5N9blTlHv8WVyrtwPzDQAVQiEtG
 7QFwiGlWOQICfAmzPDYQYWjCrqBH3kui/I/QBiXEw7AFb5JP3sbmKxD
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Authority-Analysis: v=2.4 cv=E7tYNqdl c=1 sm=1 tr=0 ts=6af494c5 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=d7ooX_hxsFC440dZs5wA:9
 a=QEXdDO2ut3YA:10 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-ORIG-GUID: O4s5Wx0d7rj2MFf8Q2d3tqq5sEEPKD7n
X-Proofpoint-GUID: O4s5Wx0d7rj2MFf8Q2d3tqq5sEEPKD7n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2NCBTYWx0ZWRfX9Ta8iWNn4jGa
 rvivi3Ud0vptjL1lTEMsrihqutw6IvxzhnFfmOrJ3gSO1ciNYDv6Mm9gKxDkJwpyMiKrsJjOgcM
 YjqCz6Q18rKf3FJiXrPYpAUHpkMEzsGG6uA6RbdULJ5kDF5TK1pYkqJJeU+TGUoFqPSnHLQDklC
 MOJNmayoA5sGGL+1XlNvjKjEudGH1jrL/nDpjZ5i1kefUulJbJq6CSIvcKM6uB4zD1GUys47qn1
 91UyxpeTdG2MMsjDHKPMegjhHJ4N2jPEHdjmmZBneFsHYAOgRgjkt6CziVK0PFVKIXcFuPyElWk
 im3/mvOAAyxrldKGUq1MQWxEIArFH+6umZbH+kOWpGk3P6aiPt5TouAiSl4/OulXzDpMfGguT+n
 /G0MI1nwpkdRJ1/TpiGCaZRldhGd6B2sN9EnN66geFyV6tKYvqjIj/BGfQdK5exC/nBKVHmqSzW
 ll/3ho537KEeaX66e6w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2NCBTYWx0ZWRfXwP/SppL3cX8e
 LCXar2ChXHtj8ctb4hcTopUCqKV8XJSfsXI5Y+RPTnQhizQrihYbuf5FtiBz5MPlybpSCIGRdMp
 L8pEAEgPD1q2jFWjhHjZYPAieh0duIQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110064

The /memory node has no unit address. The dtschema root node schema
does not allow a bare "memory" node, and dtc warns about the missing
unit name with W=1:

  qcom-kuno.dtsi:89.9-93.4: Warning (unit_address_vs_reg): /memory:
    node has a reg or ranges property, but no unit name
  qcom-kuno-idp.dtb: / (qcom,kuno-idp): False schema does not allow
    {'device_type': ['memory'], 'reg': [[0, 0]]}

The bootloader fills in both the base and the size of the memory node,
so keep the reg = <0x0 0x0> placeholder and name the node memory@0 to
match it, as done on other 32-bit Qualcomm SoCs such as apq8064,
msm8226 and msm8974.

Fixes: 7f6a63bc5fc9 ("ARM: dts: qcom: Add initial device tree for Kuno SoC")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/r/202611101833.G7LTXoJv-lkp@intel.com/
Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 arch/arm/boot/dts/qcom/qcom-kuno.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-kuno.dtsi b/arch/arm/boot/dts/qcom/qcom-kuno.dtsi
index 9b111525e12b..eb5c1f3630b9 100644
--- a/arch/arm/boot/dts/qcom/qcom-kuno.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-kuno.dtsi
@@ -86,7 +86,7 @@ scm {
 		};
 	};
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		/* Bootloader will fill base and size */
 		reg = <0x0 0x0>;

---
base-commit: ae2005cea2e4f84692268e54199bb03f5c6f4558
change-id: 20261111-kuno-dts-memory-unit-addr-7f9fb954bb93

Best regards,
--  
Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>

