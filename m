Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793803588;
	b=b57wbZlsAGXoFp0WZ+I01mgGHXWTDS1LnYGO7fVlvAX+2rJrY8xPVbHuHlXyo6I3ACOL
	 XE8im6p1zTmilLbjl9UVf1ebaoojQTG/hC99uEWo6LwjY2juojp/Ub8Gw8NkHO3G4YojX
	 V98NaPPveYbzYODP9Upj7l8Xx/czFerRxhDDEEO0VaY7lEfJD2exqmXrkU+vaXgfBDP+R
	 kU+BJWk04gPfzdXNsDstx1j60pTKNFk8Ji11B0y4p+Dgjjz+C44YZ0sJjMbKynYZQoiw3
	 DOCI7JapUksVefkN+E4qA6m9uj4LmPdWPmiX5yYgvb0sjRwjJmDd4kbukHbutrLWyEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793803588;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=/4QbgBs/c0TTeo2pDtbxLuBrO703ms5M2m6y5vvr+PA=;
	b=W2oj6q+G0nYyLU8R9/AwWkZ24kUE0WpGyuUNv/1U6U2BftJAwJf0ow0hfEmyEV46qge4
	 /0Q9h63Rs9f5oA9qcZylZnzQMpBerH8RdN9XjuIFLS9VpcnZ5vu/E5cKYt9ztboBC2dZN
	 BqaVr9S891KZKflM7SuYezdOsGO6lmY6iI8TW60EQtNSTbpZRtNFZsgv+59jpVwjHDpbc
	 D8KJ8NF/DGx0oPP38HcBkKF64etNn/cHh1v3Dqn18SQDeN55TjCp7PF9A64xpx8HC2Kqa
	 Cpr7XfDtPQSFWeZJCXb+Fk50gopqE67bYITgesDQbV1bFnRGm5TXdjJ/5fbnvvOVvgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AMv+GR0T;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="T5j/2bzp";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE926606D803
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 14:46:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE926606D803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AMv+GR0T;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T5j/2bzp
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4BZvrW2310132
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 14:46:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/4QbgBs/c0TTeo2pDtbxLu
	BrO703ms5M2m6y5vvr+PA=; b=AMv+GR0TnUb97oyiyqdIN8lpHnOOw+83b5pJAc
	JoZqPs0Dq/QzjQoUiePj5mX0bX3rgS9/jUNWswXv/v6kQuyFYlQvZlAMKlOBlBVR
	p8flCZcQxo5xLrTccC1fQfrksG+cBPYLp0shgHcfQO26rGJBbzv99OojsGpCzwdV
	r+jv+zhmcpmiDh6Xxir7Gbu8WkAXWad3nP//L6YiVW2/SX9zBw32/my1XMvH389N
	W9VykiO0KlserBc9VTNF6gjrd/Ic4bdH2ScwzEzYT4Wdkl1571yd28DWiuhg1QxK
	Xhanbvt+UfPyaQeb4BQ08i3+WwDT+wKBocuaGrOQdVB+yJsw==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqn8mvb4b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 14:46:26 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5eac2cf3905so189967e0c.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 06:46:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793803586; x=1794408386; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/4QbgBs/c0TTeo2pDtbxLuBrO703ms5M2m6y5vvr+PA=;
        b=T5j/2bzpQH02t8oyr0N2rag8ImX3lxMxdIwIbhZ4isPp/CSvLCSmf1+vx5pRq5phI7
         kTQkEmxYLH8nCNn3rX1PDVE9ycPHWrvEyxV8cjyRXXdXpRC4pNilFGOfVz1mu+08It3O
         UHBg1M3FS8uhDwML1Bp9JiBBItMS/aaLyQ8PjVNskFAwKIFZ93DsC9RLmGi3H3Mr5xuk
         8gF/llNW10KyYChVPVtvDal31+ZWo02TKPRBgwS4EtE4STChvJENtN88prWUOFWxQm2f
         K22jhFYyq5w5uTutFOg+2f5u4dtxcEtkvvsAdvw0Gh7e1KtN3aZj1sd+Nrvw07buY/hv
         rAkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793803586; x=1794408386;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/4QbgBs/c0TTeo2pDtbxLuBrO703ms5M2m6y5vvr+PA=;
        b=N6awXHie2z02pDAuEk71grW9sn4Y81zow64h8tl4g7mh6tRGg0DCq7tLslAaehsmbq
         23a1YAQtvOjphDq6OJwq1TIGZAKwhyNZ9bOpWpKF0C/dPpzLcRmTT1ot86CxLjQ4x2eB
         cAJ2Wca36et/kAgOhABRaLAaLWanNRTtNstNX9H8bkYy0V54oElSqwkwRLh7vIOIFzjN
         eqqqWDZrZGdZpyrRWlMtriHegfc7MOkeW9HAoFJ/gpoNRoEaj06e7Y/Zn33eh3FG4MDZ
         br+NCPgG/Ok/TU68n00QlGkvQG7M4Gj9JsH7l9H/XULO+dNcl2VVDb/AuWgOwT38GXAD
         pdFA==
X-Forwarded-Encrypted: i=1; AKwUvBxKqfZxB1QouyrUCPcVvW+uopr7O2XEG+FGuSt1DCmltqCaFbCVys6/g4iRiLh7OX8gVLz1mjScpdO4K1o=@vger.kernel.org
X-Gm-Message-State: APuU4Z9e4yh8ejfRfoQCbpbRYUc0IpEVw2EPAIT+HYFWfY4RpnFm2sbE
	suOphrrmR9cR9/ApDmo1qf2FZ8IbGqhOQwszl3Sf6ngLDYl2CRJQZqMabi2GZjlZYWOqsfdaOg+
	WllmUV7yxd+/5FbHC2oa0iq2czpjBHDhBGrJe75+XHdaUTFD6t2Bwp25M9aMJdzA3n34=
X-Gm-Gg: AYBFou2kCeZT75TC6Wd8PQcWCxM46s9e7HPMr9m9qWL+wP18Ji2K51m1iZRmQERDHPI
	wdGgxtBVfBIPErb+28nwm7Zpg0D6QvwFifNELjd1a5Z9mkpPoFGkH4VTQaQIm4ZIP7ZZHqqGPNN
	lpGEcG+QkwRPvWvWp6jkp370zCGe9YUswGc+zLsdfDtXgctk8lIF/XS9BgTMijIhd/mVh9ZlSOm
	+TUiwSSrmtCwBXOFLfL7j3FldnPEPCWK4lSlQjw3zMt+il3SQOOUhZaFK3KXOl+5VcCLYEvIol5
	U915vW3IQijB1bUtrN6SaAQidV2kzDizUCttvN7guFujmd5Dlg9DYHZaJgvrOlGhrNF78VS9EUg
	SsvZ3iPNtQDU0l1Zut/av6/weC4brCfhkwmrXABFBZXxagkJTnViUwIRufN3WE9kZ9Gg/FQ==
X-Received: by 2002:a05:6122:1b82:b0:5ea:c084:6f19 with SMTP id 71dfb90a1353d-5ec688253ddmr6391686e0c.12.1793803586115;
        Wed, 04 Nov 2026 06:46:26 -0800 (PST)
X-Received: by 2002:a05:6122:1b82:b0:5ea:c084:6f19 with SMTP id 71dfb90a1353d-5ec688253ddmr6391628e0c.12.1793803585526;
        Wed, 04 Nov 2026 06:46:25 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed553116sm4194906f8f.42.2026.11.04.06.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 06:46:24 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 15:46:20 +0100
Subject: [PATCH v5] ARM/arm64: defconfig: Drop redundant Qualcomm
 interconnect entries
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
Message-Id: <20261104-interconnect-qcom-clean-arm64-v5-1-395baa0c0bdd@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43Oy27DIBAF0F+JWJcIhodNV/2PKgsek4YqhgYcK
 1Xkfy9OF940cjcjXenOmbmTiiViJa+7Oyk4xRpzakG97Ig/2fSBNIaWCTDQTEJPYxqx+JwS+pF
 efB6oP6NN1JZBS2rRB2s5KsEdacZXwWO8Pfz3w2+uV/fZdhd0aZxiHXP5fjww8aX331sTp4yid
 l4cu15AcG+51v3las+tOezbIMvJCVZUcbWFQkNtQHS+E8ro8AQVK9oB20JFQ40E7BE7dME+QeW
 KGi63UNlQ5cAz1NaA+Qud5/kH5pZp+eIBAAA=
X-Change-ID: 20260428-interconnect-qcom-clean-arm64-aecdaa1e531b
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3712;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=tgc5oYY7RgZCSYGAvdoJW0IQ9Q4bRrF4qkJ4QRoOlSI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq60U/VlCr4Vvfz0y+8WKIa98Rh6Qke5D4vneXc
 Pz9yUs+fB2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCautFPwAKCRDBN2bmhouD
 12VAD/0WF+pAz2t1TjvxbHvL5Z3A1503H7KbTgiDdEv30JFilHv5EuLhvlgliIPNEVqWU3m2vlj
 V+4TGlX91TnE+1Wdc8txA0Vs5BEobr+dit0eQSFqWxOP1aGhQ2HO8est8MQ7C7QlLROKj5wtlo1
 x+AVukxjgXCyBrbhcUUbnb07UH7gzvp+TBygn1furpcwnfIx27CK2y/tN7mXVV91Na3vnvoBLlA
 IeVFHTyU9sGexShtVv3GM1T3WQuY/i4wWqQ1u2uiXPTLfYnJR+bXd7jXZotaXa4q/ALRdM0jCGL
 K5qo59/xsweGBOzu96+4xGd6oJ8TGPlmgk/BYxBZKqm2L8gX9Qp7kOw2GbL07/FSrtEb2pJdQY9
 abILLcE+nn6fJdDEFBdKMBxaOvSBhsEcVMLmjpknj92FJHBo3mM4prOg6kvWKmEId+d+pRpeCDD
 FLeUt2nVFHjwrE8zei2cCwLEwCODHrzyyJyZlA0AdXIgfpF2W9yPb8xliOE8Onva/gem00KJQGs
 jnXvX4o5KQmPwbxLsKfKU4RxHn6HFfkhPxo6u0B3w6VtHNdfEFnHothw4RanGxbDXFN7kqZg2Ck
 FOKfKLGVLOweMJO0QgTIAfmobApZuoAMrcDpHrJ1Rpu20ekxAawQyYoEmcRxNalGrEwYuDBkhBZ
 Lcf7loGAH8cxhjA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: S8XhhC_a65gA-nEc0TZws_gm_NgiwPna
X-Proofpoint-ORIG-GUID: S8XhhC_a65gA-nEc0TZws_gm_NgiwPna
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA1OCBTYWx0ZWRfX7pyR2heZb8KX
 4zy9yPQzpMyRYxp6kZQzopNEZNyenPOH+iPCLTTeJkwTHaNJaLzdGUk/I4+qxS+9flpOO+Ny2b/
 KbgGYmi/KQw+nlb6Zner8xEcIi9yA4vFqX4zDs7DSucqTsXlIJdZEYXg24Im4/Dj+8eSnNEngWl
 RYVib3iSHwmRJoEWvnxz6bRzMAGORFWz6g4QmW9rdiir/eAcBymjwfWl49sEhxvwB09hVLCka89
 pi4Q8HTYcPgM4YC75JGugctEpMphsluawGXFOECkkEpqr2qBeHCjHcFMd7C/Th54q5O+N20N1cn
 olP2SqXjmnQ1N0Sg2uf9MZEyHBpVCbAZdC6C4fqGZsLmiCFfXRdcmMcb+q3zw1UrCDrG44PlhUC
 h+YMT4h4hY0e+3ZMxwwBTx9r81DNYOCmWQmnuABVMRmrmCA2OeTVCpyazgXBz3yVvgFAyrnRimR
 jj1Tap9wq1wqEnMcmsw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA1OCBTYWx0ZWRfX97aqYucic4RQ
 v6tgx2g1HusAasgZznn9Bmg051PaP93sH42p02rGfWTMEcgvjIWvJPFScoGs9jnW8U7YMrSeAt7
 dJCwIp87ZyldtwgnQ2iwle6QmovUGs4=
X-Authority-Analysis: v=2.4 cv=HbWB3SE8 c=1 sm=1 tr=0 ts=6aeb4542 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=b2TuYX_1WW3iVv7oIL4A:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040058

Drop all drivers from defconfig which have defaults in Kconfig.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
This can be applied, all other patches were picked up.

Changes in v5:
- Drop all interconnect patches which were applied
- Link to v4: https://patch.msgid.link/20260914-interconnect-qcom-clean-arm64-v4-0-5b2c0e6a929a@oss.qualcomm.com

Changes in v4:
- Add also Shikra since this was waiting so long that other drivers got
  merged in between!
- Split out defconfig update.
- Link to v3: https://patch.msgid.link/20260720-interconnect-qcom-clean-arm64-v3-0-942e8ee7ebda@oss.qualcomm.com

Changes in v3:
- Update also Nord and Hawi
- Split defconfig to separate patch #3.
- Add new patch #2 for arm64 dependency for Hawi, Nord, Shikra and Maili.
- Link to v2: https://patch.msgid.link/20260515-interconnect-qcom-clean-arm64-v2-0-adeebc73596d@oss.qualcomm.com

Changes in v2:
- Patch #3: Switch to built-in for everything, with explanation in
  commit msg.
- Tags
- Link to v1: https://patch.msgid.link/20260428-interconnect-qcom-clean-arm64-v1-0-e6bc3f7832db@oss.qualcomm.com

Similarly to clocks and pinctrl, interconnects should not be a user
visible choice.

Best regards,
Krzysztof
---
 arch/arm/configs/qcom_defconfig |  3 ---
 arch/arm64/configs/defconfig    | 31 -------------------------------
 2 files changed, 34 deletions(-)

diff --git a/arch/arm/configs/qcom_defconfig b/arch/arm/configs/qcom_defconfig
index cc93a32342af..8e3278ec2d21 100644
--- a/arch/arm/configs/qcom_defconfig
+++ b/arch/arm/configs/qcom_defconfig
@@ -258,9 +258,6 @@ CONFIG_PHY_QCOM_USB_SNPS_FEMTO_V2=y
 CONFIG_PHY_QCOM_USB_HSIC=y
 CONFIG_NVMEM_QCOM_QFPROM=y
 CONFIG_INTERCONNECT=y
-CONFIG_INTERCONNECT_QCOM=y
-CONFIG_INTERCONNECT_QCOM_MSM8974=m
-CONFIG_INTERCONNECT_QCOM_SDX55=m
 CONFIG_EXT2_FS=y
 CONFIG_EXT2_FS_XATTR=y
 CONFIG_EXT4_FS=y
diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 7b4985b29b21..df780e5ca99e 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1764,37 +1764,6 @@ CONFIG_INTERCONNECT_IMX8MM=m
 CONFIG_INTERCONNECT_IMX8MN=m
 CONFIG_INTERCONNECT_IMX8MQ=m
 CONFIG_INTERCONNECT_IMX8MP=y
-CONFIG_INTERCONNECT_QCOM=y
-CONFIG_INTERCONNECT_QCOM_ELIZA=y
-CONFIG_INTERCONNECT_QCOM_GLYMUR=y
-CONFIG_INTERCONNECT_QCOM_KAANAPALI=y
-CONFIG_INTERCONNECT_QCOM_MSM8916=m
-CONFIG_INTERCONNECT_QCOM_MSM8953=y
-CONFIG_INTERCONNECT_QCOM_MSM8996=y
-CONFIG_INTERCONNECT_QCOM_OSM_L3=m
-CONFIG_INTERCONNECT_QCOM_QCM2290=y
-CONFIG_INTERCONNECT_QCOM_QCS404=m
-CONFIG_INTERCONNECT_QCOM_QCS615=y
-CONFIG_INTERCONNECT_QCOM_QCS8300=y
-CONFIG_INTERCONNECT_QCOM_QDU1000=y
-CONFIG_INTERCONNECT_QCOM_SA8775P=y
-CONFIG_INTERCONNECT_QCOM_SC7180=y
-CONFIG_INTERCONNECT_QCOM_SC7280=y
-CONFIG_INTERCONNECT_QCOM_SC8180X=y
-CONFIG_INTERCONNECT_QCOM_SC8280XP=y
-CONFIG_INTERCONNECT_QCOM_SDM845=y
-CONFIG_INTERCONNECT_QCOM_SDX75=y
-CONFIG_INTERCONNECT_QCOM_SM6115=y
-CONFIG_INTERCONNECT_QCOM_SM6350=y
-CONFIG_INTERCONNECT_QCOM_MILOS=y
-CONFIG_INTERCONNECT_QCOM_SM8150=y
-CONFIG_INTERCONNECT_QCOM_SM8250=y
-CONFIG_INTERCONNECT_QCOM_SM8350=y
-CONFIG_INTERCONNECT_QCOM_SM8450=y
-CONFIG_INTERCONNECT_QCOM_SM8550=y
-CONFIG_INTERCONNECT_QCOM_SM8650=y
-CONFIG_INTERCONNECT_QCOM_SM8750=y
-CONFIG_INTERCONNECT_QCOM_X1E80100=y
 CONFIG_COUNTER=m
 CONFIG_RZ_MTU3_CNT=m
 CONFIG_STM32_TIMER_CNT=m

---
base-commit: b0c953dba88a3412a700058817f08e7b5de4c338
change-id: 20260428-interconnect-qcom-clean-arm64-aecdaa1e531b

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

