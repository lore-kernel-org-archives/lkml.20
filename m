Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793874007;
	b=pez/kxK3GxbyCwq7p7sWo8tRdegjKMY389d4knYvYFLgCexanJqDnGUFF+MSNAwAj3qL
	 Sfap4/ftuFM2XC0sNPqqPoBq6FEanI9EWgJ3wlp0kTAeBACa+RTiomZ/gemPlkmp2AZf2
	 8n1euy64npKz3zmeQ05h8qwsgdb9Yzw7utLRgPiPpAzZdGx++cUb9rz/zZG/Gj2n02mpP
	 avRf/8WKwGxZsVR4scxyryyd/oikLQMvITnpLMx9VN+Ir01bk4ZH53JuhiG8Dsf9hwZXS
	 iEr2mAasLgCfEby0F/n04p3gEy982vRmlX5Tz2VXjxk8FWC0j0LPXLYB2yu/GkCtrjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793874007;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xbEXO/Ngm9jeafq/5uyGx+v2CtkgTISFS/vJlPqiL/I=;
	b=0fQzDyPkzDhhHrq4y3tvslsitXxgxxtn2IEmg2i24HLq3SQlxx8U/7/fAhsLoNUX/Wbt
	 d/40OilLDpzJclMYK/gtYoDnJRpEEoawpafELu/Z4O0ZUc+mQQHgpjwyXPxTM1ZdDYyYg
	 4IBAcYcPYdxPx8vJvnE1P/FAwRwkvpazbpP9DU7jg7tf8+ecKiws7R0qRIqlVT3gKSXLD
	 tLVzK6ybrZowAxUCyc+8y3TpJsS9k74yqx/lPbOXprU6OHMlgiQRPZQH6IchYSB2hg3qD
	 jd0k5cUYG4BLCci94c0TX8DSPWUaZJFJ5kJy2IwknTIdi3RMv4GOq9AHYVps0mVX2Og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fqJTKMBh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AnYI3BZe;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5648606A329
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 10:20:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5648606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fqJTKMBh;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AnYI3BZe
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5A1ZiI1416602
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 10:20:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=xbEXO/Ngm9jeafq/5uyGx+v2CtkgTISFS/v
	JlPqiL/I=; b=fqJTKMBhW4aavmTcQ0VMupvk2GhmzYCL2OcT6vje1EbdODUGgny
	DX0PylBe9xVUfhlz3yU66mFmhhZ7SjN5H/8gtFf61txmTEVhsbIqKkcO0LK5YdHI
	sPeqkjPTMhks7Byo5eFsHS/QNZ9itxzJRbcXSoqsZrPh2y3iMETwe7013a7FKNaU
	A4I3M57QT3wEyT3U8s061gEYyf8O+wIcY0SPvVuIH9SzbUzPWS9EqRjpAniLqmBb
	oBa+fhpgECJpZJ4cELFBaxGBslCVVEGDluCU5VMDIVs6tqf4ZeG/dNn78fXAf9BI
	X5y3Y7oSCk9pXi7WYHDYws8lmp8WMErucQg==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrqpd02g8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 10:20:06 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1af203073e0so2900801c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 02:20:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793874005; x=1794478805; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xbEXO/Ngm9jeafq/5uyGx+v2CtkgTISFS/vJlPqiL/I=;
        b=AnYI3BZeaP+ICk7WLC0cWYn8OZeLob+F1FojIxSGzwgcctKkOPROXPPYuUR1nUscRe
         R9wann55kivoWSdsPddJCmTHSWPMlvPISSo+NOrrSEgK+Z1mKwan1cCRVOSrNIfJ4toc
         UqEc9Db+MvFLnOUx2OU6hLfkpB+WlkX+6UbLgo70blnbCY6HoUZC+MNazR+DbK5hT2bm
         iQK1xO9mqSx0JzPzcHPmpwlkyXldF/oR4pWzWrHhxJ6OuKeR9evTkxiqO1xq/5kB98zq
         ZfuoWF2u/PSD/V4Vm8FzgKvlvR/N8gQx264eXVaufLUAsKkHRdWomtGzGIxctu5v+vtS
         3jJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793874005; x=1794478805;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xbEXO/Ngm9jeafq/5uyGx+v2CtkgTISFS/vJlPqiL/I=;
        b=cqAFmDvRSnFPQkFs+uRbq0TuJGPiKX/Tbni91wuL9VmNF0jrjyQmPxt0qzXkHdbFUy
         rkMux1tD25uAivNSRACPzpm0ZB5NTzqCHU8Ch/EquIvL9HHkdxBUbGIm9Pk08luTrxYt
         m8Qld0d7YSKttdyBxJ/529aROInFeTZf36ypoZ1Bv4buSdDJrxlp1x/pnoOzUzDtGm97
         D+jR2t19wqmpnMkrNQfU/zcprRKhsStd74JZHVM1j7jNswDiwIxRURsIO9xnPhlNYJJG
         odLfQ1WIzzxXbBy8gjfTVUPfDJ0tRNptvlh2xTZq2fUEo2h1eg/TcVPECPV8u4z81Sb1
         rDYA==
X-Forwarded-Encrypted: i=1; AKwUvBzLJUJiPDwQfkynK+N61dOTRj5GMkiiKcXuC8tL5dD4TmlNW9FSAdBjBMT05LxD57hZdq/3uwI3Qe/nwfY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/sfC1HD41pmLhJwo89pzBDnha20nqgiS+19oJheeHsIOsDMHJs
	591tJX179UCIMAFPAxQ1LqJF0mS63kJ+nY9BvHtDbRPoseDTlnKIoY8aFsItBrHjsCXqTskE/jp
	XQUJsrX8vIIgUCTgaz5bQUf/W1uP+r0lFKyq1xUbcq51gnuRtosIDi7R4lK5xxgHdHr4=
X-Gm-Gg: AYBFou25v3evE+/9ztObNiARFZG2FNuVv+OIDihcVhrno6XQRdBdmQbOoRFDqxok3HD
	BF5CAj/4Kclf71xvP2KpH3Ai/nqrNnJWr0hHYucsy++pE4r1Tyq2SPKukH/2g4ba6IBMtau5AiX
	ECTRvybPSFZbdI17aVmskUNsBJKABSJvnabihfrWlqE9n/SQOx7rWnUgL2FYTTgzQo4RCDVpPhe
	FlFFpCVxhJO982XEcPHw+c20XODVMsStGTgChVhMTzLHxJPEm4e+N/dUqX+qVzLddWJzwZ2I14W
	YElMvBgmjXsotOp4QRd07aerrKyIFq0GEL7cCJ4E9Qg/iMnM0lfNbcNrKy1ao8nAQB7MSJlVOj9
	YxXk/gd+10uQ/E5HbuQItVAyDNPIXZIipiTM1bVN0i0wXPlkxnp6z28tSx3XVqSfa4LNbL/bmQS
	dXPmCUSKrz
X-Received: by 2002:a05:7023:a5c:10b0:18d:5ef2:1644 with SMTP id a92af1059eb24-1ac5e6f4f90mr25354569c88.30.1793874005169;
        Thu, 05 Nov 2026 02:20:05 -0800 (PST)
X-Received: by 2002:a05:7023:a5c:10b0:18d:5ef2:1644 with SMTP id a92af1059eb24-1ac5e6f4f90mr25354538c88.30.1793874004436;
        Thu, 05 Nov 2026 02:20:04 -0800 (PST)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a6160sm14115330eec.9.2026.11.05.02.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:20:03 -0800 (PST)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
To: andersson@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, mani@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sarthak.garg@oss.qualcomm.com,
        pradeep.pragallapati@oss.qualcomm.com, nitin.rawat@oss.qualcomm.com,
        shiraz.hashim@oss.qualcomm.com, monish.chunara@oss.qualcomm.com
Subject: [PATCH V6 0/3] arm64: dts: qcom: Monaco: Enable SDHCI storage support
Date: Thu,  5 Nov 2026 15:49:52 +0530
Message-Id: <20261105101955.3732723-1-monish.chunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA0MSBTYWx0ZWRfX+0Do2x7qtgtR
 puUKn6NmtWsAM6Buy84Jc6LKDUOdFCtL7sePLoF3xJMWNwACT3Xm+wAREo9mXVs0cKKC5+IhYyU
 ck9W3TKMQUyydbnmXSxTnJoXwWHFGV0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA0MSBTYWx0ZWRfXyPLLSaV/E0En
 gCTaDYjUbiuFrziu0NiEPS9R/hNYYW84JG3EImE+Su383QSihPorJqnlmSjph1l7V7db+tzTbyz
 mHF7JyS99Irgg8xtul5YydfCQjmoJyHkK/PrAz14SOdd+rLc8ShlqNWWpTA3oKGSiQ89ndJ5DaT
 IepBm9ZBqSIo0ILr/Qyb7K3+gbRCX4rqKhQKeHHGJLDrHTUlcklkzJKAHIRQ7kQ2gG6PkMF9hST
 GlaCfxgul8efLPzlpU81f6XFpJDo2YmYY//MgbJXDTzm9NrEXBWSIvPMkMeCFv75pU+ppf8VqQi
 neAU6PskSIhQi0TxwHSYR4W8t+JvgPpA5fM7PV97YLxd9ihMzVRHyFGppTn2EnZbEpqmku23Sk7
 SFA+t0TGlCxOwd20Rm9nCxtBRWRCspn0zUd59ij8cRzinZ+fBs2PJztDzodLE672FjJIMH2hs9R
 //MMDq+4yzNO+5WZaeQ==
X-Proofpoint-ORIG-GUID: 4VUXGnEZMV__FS8C-HplXt4NgBqiYe8Y
X-Proofpoint-GUID: 4VUXGnEZMV__FS8C-HplXt4NgBqiYe8Y
X-Authority-Analysis: v=2.4 cv=Y5JtIReN c=1 sm=1 tr=0 ts=6aec5856 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Q5OXD4evTFBxQrppJ00A:9 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050041

Respected Maintainers,

This is v6 of the Monaco SDHCI storage support series.

Changes in v6:
- Propagate Reviewed-by tags (Konrad)
- Rebase the changes on latest tip.
- Link to v5: https://lore.kernel.org/all/20260826112456.482982-1-monish.chunara@oss.qualcomm.com/

Changes in v5:
- Rearrange the Makefile entries in alphabetical order. (sashiko-bot)
- Rebase the changes on latest tip.
- Link to v4: https://lore.kernel.org/all/20260716142445.2767955-1-monish.chunara@oss.qualcomm.com/

Changes in v4:
- Remove the redundant regulator node - vreg_s2s, which is already defined in
  base file via another merged patch. (sashiko-bot)
- Update the base monaco-evk.dts file to make it storage-agnostic by removing
  conflicting eMMC specific properties. (sashiko-bot)
- Link to v3: https://lore.kernel.org/all/20260701081715.2580329-1-monish.chunara@oss.qualcomm.com/

Changes in v3:
- Update the patch to handle the supports-cqe property for monaco-monza-som
  platform which also extends the monaco SoC DT.
- Link to v2: https://lore.kernel.org/all/20260616130347.3096034-1-monish.chunara@oss.qualcomm.com/

Changes in v2:
- Avoids using the reference to direct supplies as dummy
- Updates the eMMC overlay to remove the static UFS host disablement and
  vreg_l8a voltage override, allowing DT-fixup to manage the UFS-eMMC mutual
  exclusion dynamically for flexible UFS/eMMC configurations.
- Link to v1: https://lore.kernel.org/all/20260227105055.2364348-1-monish.chunara@oss.qualcomm.com/

Validated on Qualcomm Monaco EVK with both SD card and eMMC modules.


Monish Chunara (3):
  arm64: dts: qcom: monaco: Move eMMC CQE support from SoC to board DT
  arm64: dts: qcom: monaco-evk: Enable SDHCI for SD Card via overlay
  arm64: dts: qcom: monaco-evk: Add SDHCI support for eMMC via overlay

 arch/arm64/boot/dts/qcom/Makefile             |  8 +++
 arch/arm64/boot/dts/qcom/monaco-evk-emmc.dtso | 27 +++++++
 .../boot/dts/qcom/monaco-evk-sd-card.dtso     | 72 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/monaco-evk.dts       | 11 ---
 .../arm64/boot/dts/qcom/monaco-monza-som.dtsi |  1 +
 arch/arm64/boot/dts/qcom/monaco.dtsi          |  1 -
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts     |  1 +
 7 files changed, 109 insertions(+), 12 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/monaco-evk-emmc.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/monaco-evk-sd-card.dtso

-- 
2.34.1

