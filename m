Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793621469;
	b=Z56kCBhIcoJ4f8/76TigRsqa2z2k0HEUkE+3cUs5HpWuOOk3aINwcIda2D0WfNvvPV36
	 AuU/T0ozObU4xuWNidsRAejhM522QIggALDFCSCaE5IkT0rz0ruT79t1MYHM2MeRy2WiE
	 3Ifb9BmIpGCJmfrHtSFHNGpv+DY0pDY96eNLhPsNeI3O+v3aEM8HjAWZko5jTWl5D24b+
	 lZEsm3Mn5sKsCYX/WWu/WU0h+jNo3DKeV/6r6bAcIQQ/6FtgQWxQBwZ1SEfrQzf98xAq8
	 Fs5U2Z/Br3YwkKrKJjQhHskTLgNU1CgGspYU/+ZmsNwyX2rOD8Ekre/JCPJrfl3QiAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793621469;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=TjXNI/T0/CwXUSLJuSzNROpWLr0pYtFGtMJGWn8mNSg=;
	b=odaRyOdIiBTQPnI+uS+kYj1gy+H6VYKKJUx+syLv7QNM+5BO2T8ekUuylYABBnkw4m/F
	 Mm6IclPx7VpY+mhrnbf3+V778yuEZE6q+qmexNgRW+OnTuXHb2fUiAlLMv7KR0BnCTC+u
	 EBpaNVgg3CVzgNINBgLOhDYottblSQh65lftMwx9CPtSIklQRneAM87QX3BVP8O3WQ5fr
	 3ImRXVe9xnCv8GFXwxEL9B1sF59EE1bh6hkW+l4aXSEY5Q8XPN4MqXFwgFuh67V5IXS+f
	 3o4RbGj9bGWBE9y6g+o5Wp0ER6wEaxwevCT4Ov7C/f7KplH1bywf+xa4OoxT3MeZj7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dxy0R1Vl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Em+i8qB8;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F129B60A5BCD
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 12:11:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F129B60A5BCD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dxy0R1Vl;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Em+i8qB8
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AIDH2880814
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 12:11:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TjXNI/T0/CwXUSLJuSzNROpWLr0pYtFGtMJGWn8mNSg=; b=dxy0R1VlIzkQWLIR
	kouaBbH51jjvxxja7cWo4AyVjyTapr+n2wvqWmRxfAL7JKnsUUpx4rehLMf+d2mG
	7NI615NLzd89ahfco6beN9ZZphzBbuka/tZRWGXMZ+lsdqqzKYB0LutDoEpb/MkC
	zd6rl/ub2rhS+J68kF3yzqQLFnHP2R7wZ4WdwujD1ktKyXWYQkd/rEn3e1j4X+F8
	72cT99DreGbOTz9maxXQzwSSAqxzkV3gleVWIoo4ftjSlJRwHCXdg0sBA38dQJ0X
	SSVnUdKiTJqfZJuVQ4orWmirCy9Y+YV9CHl9mbcYzaG0+VtnaZ5c+li0jcCjtir4
	srFRrg==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqfrgrgd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 12:11:08 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-988bbb0ed9aso2409092241.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 04:11:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793621467; x=1794226267; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TjXNI/T0/CwXUSLJuSzNROpWLr0pYtFGtMJGWn8mNSg=;
        b=Em+i8qB8fOjrB6jTnP/jjmTx5uBOkO2IbvuvHTbl9aR9osMX72pcOPI4IARPz+WGWY
         pOobUtXaDu/KC2gpItEJJOrn1GT2KSzdcuF9eT9IUnW8aODROZD1yCqFDIIoCJkCNlje
         eVeiCOuf0M818YGOM2lHcwLxTZ8/N8BamzJqnR0hN061kPMzh1f1lfMlxsxed6CW4ihT
         VW6wVLIZKWnS/Fbc5LKftaIn+gtU2TVZ6XFGC5/rPaj3EQ7vfEskiVNdncKl+6sC6LCM
         vI1I4RXZqrvX3WSVdAst2oPD5EsrlqvLdOlyPHK3PnbO1yC92r9c2Nh0umfXJIcz6ZWu
         6Esw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793621467; x=1794226267;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TjXNI/T0/CwXUSLJuSzNROpWLr0pYtFGtMJGWn8mNSg=;
        b=N4fJA3D3IWUPJLxeuWwIvfArzi4emVdX7sZ7ZUScXDorAgmiBj4g5he7vnI031Jpw6
         jXbYfJWQmN9+wH5f9i77oOpxfElIlhga5ScBGwE9h09JqKyII97gejSbpr+PCjvn2GoL
         44H5yzUN5FeLpZGu5AK5Lp6CP8z88SFKWFupvm26l2ahSHEeCwmoJEKdsh7sfL6iuTmM
         8DAzXCN1Y36PekbnWVTCcOg2pMN8OzClC0hdHUWA++kgJOEW6e1zEJNEf7Y+n+CZNTzE
         GzLryzZULegdKnGNG41tXpjaAuJL8a4iSXKjh9BXWY2bGFMDtYkrkp6ktPQ+hqunrI52
         FirA==
X-Forwarded-Encrypted: i=1; AKwUvBzJaLm5G/M4JLlzAcjkxIsXeIeO+38fZ1uEHXjHJ2kVqxgnO/u0mYiw8I0yeswitcsI9UrcvkX/BnC89R4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/w9Cc/caDgb67XCc9BiQqO6nHlnaX+Dx8KAGOVQnmr/vG8TocM
	oRKdVFJ+Yi7fFerJj7ru+6DRzyYeMMHC3yN+IfrP/gFkEU5ThYjnHd9D+9XDiVaMcppu7g8u75Z
	25aGz90f0HK7CZycQQ8ImxcrWGuDc6+hAWgdPsnylNOBzj87iBxYgc+22j0jwnB6akqU=
X-Gm-Gg: AYBFou2P2Qf0xnfjXa/eux8rEdqXRuNQXGgonaIoWGgrO7GVcZu63yG2qOlaS4lx+pM
	pAzIS7zyCCYpNLSUkUhfprsil0r0YhASrz19UE4Mrc9f+KJ3rSJVAcCTdJGyej4zHqQdWMtlzVT
	V4icuymA5UZH+bP0W5qXaHqzC1VNo8Xh/gMQ+Nv07kxlK4RmGYxvzUkB6aBiMyKcpy6cVkOr6aA
	55qK2yjYMr4Bu3+ztCQ9MI/qgHO/pPGHSGmfKt0Oy0LuBP71WS1FuFtcsnxzTh4/u+CEglc8UlJ
	aWMyCJTw4YYTJFBTai1VofzGz7YANfWunseLTr2liOzxgXM95vNvkUx/n5kxUuaZyIsMooACZcI
	jso5KLxWN5H9tVWGNgVbSX3v4WAY9+OAdtyvMTDU40JsSlNi9Ucj4L9a/uA==
X-Received: by 2002:a05:6102:fa0:b0:7b4:879c:bb76 with SMTP id ada2fe7eead31-7d072c45613mr3944761137.21.1793621467010;
        Mon, 02 Nov 2026 04:11:07 -0800 (PST)
X-Received: by 2002:a05:6102:fa0:b0:7b4:879c:bb76 with SMTP id ada2fe7eead31-7d072c45613mr3944753137.21.1793621466335;
        Mon, 02 Nov 2026 04:11:06 -0800 (PST)
Received: from [127.0.1.1] ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b81c74sm19304405f8f.36.2026.11.02.04.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:11:05 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 14:10:49 +0200
Subject: [PATCH v4 3/4] arm64: dts: qcom: eliza: Separate common CQS SoM
 and eMMC configuration
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
Message-Id: <20261102-dts-qcom-eliza-add-ufs-variant-v4-3-c92512c7c759@oss.qualcomm.com>
References: <20261102-dts-qcom-eliza-add-ufs-variant-v4-0-c92512c7c759@oss.qualcomm.com>
In-Reply-To: <20261102-dts-qcom-eliza-add-ufs-variant-v4-0-c92512c7c759@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5258;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=XhU5F0eY2Y7JLYfyJ9y4P8Vpj0VdO2+8mmkG5/S4AYA=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBq6H3R7RY1xfe3qvgfhBpKfBsT+hXbcciCqCel/
 nVndBdTxr+JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCauh90QAKCRAbX0TJAJUV
 Vl/5D/98RaUjw79+FRL/W0qjm6SAV6ROSYp92L9YDFLgk/tPB9gAwpOIcRpY9samr2lwBk55GKm
 3znf4wB2JOzHYlHNtfxFkIx10NEGb/SsID6EuYKLa+vrPcjCHO/7LNQwInvLV2sxCc5XyvlSvc7
 QSJY1sLeIiTrsuirqrqRnFbMSJoJQVIyndCMelfDHzyu646KZ8NA3niSrOulHvt9f3SQNiD+uvk
 UhJMiM3WYXMHRC6ZJ5yuy4P1MimmTjYqTFpHpmb9Le/DDLKZ7lpp33lL3/R+was2REylmDxbgw2
 3SqxNnq0IHQJgDMW+LhcpTynp80b5B0BFmeNkaiV98mUgZGW2neNVshbfLyiyjZ6aEhDoCJL8Vz
 gRllsgFeORN7I2jX6Wmvcnygo7ZrRN2+tcUPWfZZjCm40tjPjBJm+M+S3nt+OzYhqX7NIVysnq2
 qQ+h3dWxWr79mvf+X2swjOWJEyVlfEN9AD5lsJmZO7tljM1DCaE/YQbxwWJNx3hNbsV08oT+LND
 j3vxnv+S/lFrES9keM47taFteytlW+maaRlED2Ixlv4oQV0MUfhX+ZWByCRco5CpT9Feb45ZbCQ
 ZvXjMFeEn0drpDrezD5f5xz1fPjA39LoiS13DsA0rUOSc9nRYYaASFXaK5j9j3lxmTEkUJKc8te
 lVUq3uKnje6ReTQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=HMJWhYtv c=1 sm=1 tr=0 ts=6ae87ddc cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=FfUMhDFI_infzSTnTwkA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-GUID: RvK9vGuHKdUsM0Or7y7YkvPhqB5JdLiB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0OCBTYWx0ZWRfX7mO2znt0R788
 gigPujJog4maJhBWbc2JU9w3CY2e4isxHHnQpXjjyyVG7tbzfCr1CghaNqzPy6lZpk+bt4Brsbu
 g56M8wH115eq0u4zbhDJw3GcECNpGTI=
X-Proofpoint-ORIG-GUID: RvK9vGuHKdUsM0Or7y7YkvPhqB5JdLiB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0OCBTYWx0ZWRfXzqukxnQRuBn5
 YmSgJ/DvcuAyNeroDRJS88czjnR6Exgs4rYm8/cDBtpwLexXeAkIzS4YnRH+QGEJVA5eftN8pTv
 Im1O+4hjZ14qAAuq/RrTlA0lFrb+WUWK1iFFcVkscblJi3g538rqgG116KjxN4+71Ulali88Gla
 i/N+emuIeI8Zz0LyV0EMhWzFor6iPLNjf5w38MnSWy5ndltcXaPZd8INBd9Jti+71FBV5L1Wxxi
 q6bLwo/VeWU//WIHAOJY9urqKX/Ygpo2NDWzC8Y5dNxaaFXNL17hxoOj2dDiEwko6CvoQ3Y4uV9
 6y/YeKpo2bvJioXMDdIdEash10+vNLM9UEUfjCHtyoNJ4TGEAHwNFgAz8+GtNIEHaZMQW96ObQ0
 KvLr4wpqdmDwvvXYi0YWw+Wt0gjhzvMXcV+Mq8LzABqtqI9PHHXEATEEN7JvEPWhLHrvb6caTvu
 wZRWLm6p/gA0XTjRxSg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020048

The existing CQS SoM description includes its eMMC storage configuration,
while the SoM and EVK filenames and compatibles do not identify the
storage variant. The UFS-equipped CQS SoM uses the same EVK carrier and
shares the rest of the SoM hardware, so duplicating the existing SoM
description would leave two copies of that shared configuration.

Keep the common hardware in eliza-cqs-som.dtsi and move the eMMC
controller configuration and its 1.8 V I/O supply constraint into
eliza-cqs-som-emmc.dtsi. This lets the UFS variant include the common
hardware directly without inheriting and disabling eMMC configuration.

Rename the existing EVK DTS and its compatible strings to identify the
assembly using the eMMC-equipped SoM. The carrier hardware is unchanged.
Neither the CQS SoM nor the EVK assembly has been made publicly available,
so the DTB rename does not affect existing users.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                |  2 +-
 arch/arm64/boot/dts/qcom/eliza-cqs-evk-emmc.dts  | 18 ++++++++++++++++
 arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts       | 14 ------------
 arch/arm64/boot/dts/qcom/eliza-cqs-som-emmc.dtsi | 27 ++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi      | 18 ----------------
 5 files changed, 46 insertions(+), 33 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 88230c4e00ea..1a06b321db20 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -14,7 +14,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= apq8094-sony-xperia-kitakami-karin_windy.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-db820c.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096sg-db820c.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-ifc6640.dtb
-dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk-emmc.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= glymur-asus-zenbook-a14-ux3407na.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= glymur-asus-zenbook-a16-ux3607oa.dtb
diff --git a/arch/arm64/boot/dts/qcom/eliza-cqs-evk-emmc.dts b/arch/arm64/boot/dts/qcom/eliza-cqs-evk-emmc.dts
new file mode 100644
index 000000000000..36f63dd1637f
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/eliza-cqs-evk-emmc.dts
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include "eliza-cqs-som-emmc.dtsi"
+#include "eliza-evk.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. Eliza CQS EVK (eMMC)";
+	compatible = "qcom,eliza-cqs-evk-emmc",
+		     "qcom,eliza-cqs-evk",
+		     "qcom,eliza-cqs-som-emmc",
+		     "qcom,eliza-cqs-som",
+		     "qcom,eliza";
+};
diff --git a/arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts b/arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts
deleted file mode 100644
index 43d428a4ed2d..000000000000
--- a/arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts
+++ /dev/null
@@ -1,14 +0,0 @@
-// SPDX-License-Identifier: BSD-3-Clause
-/*
- * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
- */
-
-/dts-v1/;
-
-#include "eliza-cqs-som.dtsi"
-#include "eliza-evk.dtsi"
-
-/ {
-	model = "Qualcomm Technologies, Inc. Eliza CQS EVK";
-	compatible = "qcom,eliza-cqs-evk", "qcom,eliza-cqs-som", "qcom,eliza";
-};
diff --git a/arch/arm64/boot/dts/qcom/eliza-cqs-som-emmc.dtsi b/arch/arm64/boot/dts/qcom/eliza-cqs-som-emmc.dtsi
new file mode 100644
index 000000000000..af4ade2d4e45
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/eliza-cqs-som-emmc.dtsi
@@ -0,0 +1,27 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include "eliza-cqs-som.dtsi"
+
+&sdhc_1 {
+	vmmc-supply = <&vreg_l12b>;
+	vqmmc-supply = <&vreg_l1d>;
+	pinctrl-0 = <&sdc1_default>;
+	pinctrl-1 = <&sdc1_sleep>;
+	pinctrl-names = "default", "sleep";
+	mmc-hs400-1_8v;
+	mmc-hs200-1_8v;
+	non-removable;
+	supports-cqe;
+	no-sdio;
+	no-sd;
+
+	status = "okay";
+};
+
+&vreg_l1d {
+	regulator-min-microvolt = <1800000>;
+	regulator-max-microvolt = <1800000>;
+};
diff --git a/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi b/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
index 03f9192324c7..a378a500d9e0 100644
--- a/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
@@ -278,8 +278,6 @@ regulators-1 {
 
 		vreg_l1d: ldo1 {
 			regulator-name = "vreg_l1d";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 	};
@@ -396,22 +394,6 @@ &remoteproc_cdsp {
 	status = "okay";
 };
 
-&sdhc_1 {
-	vmmc-supply = <&vreg_l12b>;
-	vqmmc-supply = <&vreg_l1d>;
-	pinctrl-0 = <&sdc1_default>;
-	pinctrl-1 = <&sdc1_sleep>;
-	pinctrl-names = "default", "sleep";
-	mmc-hs400-1_8v;
-	mmc-hs200-1_8v;
-	non-removable;
-	supports-cqe;
-	no-sdio;
-	no-sd;
-
-	status = "okay";
-};
-
 &tlmm {
 	gpio-reserved-ranges = <20 4>,   /* NFC SPI */
 			       <111 2>,  /* WCN UART1 */

-- 
2.54.0

