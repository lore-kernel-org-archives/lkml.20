Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76A24D598D
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 12:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789646774; cv=none; b=nK5sJZIkBbOUrtjmosnPcqzN0j3m9RZa4F5G15miS36iEkOdU9y9Zv4qaahrqNu2iBfOXuh81xTYbMoFhM/pt7EjEGUOXKSiRyZffWBMIvz/y1RH1Nm/doIk9tcr8ZNJx0TU7is9BhB4Ke3WIQ5Xu2o81y7RbUZ5TsDeQ+XK3s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789646774; c=relaxed/simple;
	bh=1Ic/ajQCpJA33O6z7Flj6meuJ1EDpwKmwsUa8nUX9CQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tfnVolIszcpXRLoL892tj7sEEEnRdubVn3C5iMD5TRaZSCw2RNkSfjuBAbpGjkh25wxFiKx2wNCb2FBIgwlh3ooQXLChxOKislp5c7YkaYqETQe5UuFyY588o1duC5MYUkgD6KJknLliiCWaD5iVX7CIIwokjP69fidrYM6TIEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pH5gG31d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VET0ycEN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pH5gG31d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VET0ycEN"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HBop4c2013121
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 12:05:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=fxCdJOR5Pgh524oOvQjl8c
	yBG0pHwcfz9ZpkSzCUxeU=; b=pH5gG31dAfC4nFz3qPHIVfEWnT3WhCdfozZLsg
	dTmXDIK+FOi78Y2BC5Ee1MND0b9bnCLXAyMRkpuLBCki1EaJ7CEKPjlh5x5Ib0ZO
	oc3up9EMkeXvKVs+DiIeyLFvKOw8jd79qkzSx1UAhibDfELpFwVSs5kmfJagDu6N
	RjEa7T9MjN60Yl6sr+kJKDFnlkdEgNbe6/0ptiPR93803YGF/BxvtZbU/46lmlt3
	BpELSwN7tHSCeaQNvArZhCCdbBwZznQmlyktEveRghE4PswWFkkwXzWZKMpbKHHH
	BffkvPUM+reOSP6/0OqLaIZMC962QVL8nF3VmhYIq0p/STsg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grfppg1qt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 12:05:57 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39e087a17dfso1389175a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 05:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789646757; x=1790251557; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fxCdJOR5Pgh524oOvQjl8cyBG0pHwcfz9ZpkSzCUxeU=;
        b=VET0ycENGVb7OYNJfR7fBmjcQDhlV1cSyjissC3sCmNQ6RmOpoE0Jbnf3k7KqMk0pN
         9MJTpU6DWcau2XzpoWRvAwKu12woTBWKnMIPvxW9Hzt1Otqb/nGvBuGHCSSdrdemei5c
         aWkAKW4YeH/Kvr/Pke18hC7PS8DOIUqvmODM0U1uyMNGTTIn1uaNLgvGoIxjqzYPRBKK
         xGrV42Bi90t/SwPejgWGF+RqrN5pgVpVoFWByANKKnWFY54JgGnzw+Z4bhFJX3aT96/y
         Xwqnvf2rdI7izp13a6IossqQDr0RpV1KcBstDITVjDzF+L7YPxadCfwv/pCWgZkcC8Oj
         +NyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789646757; x=1790251557;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fxCdJOR5Pgh524oOvQjl8cyBG0pHwcfz9ZpkSzCUxeU=;
        b=A6A7PwuogujX4dK3/0DDwT4L8RrCEtlFUbUeUBNnvd6NuVFeZ8VRVbJafDVjD2T/jj
         TPSEUU8d1zCN4HIwpQD/pGojtUp+YQZcfID+enF0FXD0RiCxZcKsryD7RvYvIcXbSzrJ
         1/pMKu7u7SN4F0XFiLMg8RaNNFsYJMADILqxgLaFShUMLMJbjYy6hH24jEnBvCzOp+QU
         aDJIPGh2KO0EC/KoScSAMfMo3tRM8rvtzHvn4teYyeiI2xqP3LQ6cvVKl8IL7FKMdjgi
         r24FOiY7C8yky6HU6sCeQJZYodryQgnFzFS56lLb89qhwDag5ZAeg73LIcUIFFF030nl
         S9hA==
X-Forwarded-Encrypted: i=1; AKwUvBzUVRDu3lQCcHD7PPdmrOyJjT7vaux1GgN7lSn106KMFssYKibPfW/zWJStWtCCeqhOonw7FIvmTMmlygc=@vger.kernel.org
X-Gm-Message-State: AFuF++kNKpoT3IS8LcgHYbwrWObHBgjhcQe259gxl/mOm/3vSAoJvTrV
	XwfQKXYoVqfpbnrD5YPXRaasOOV7WhLHf6TpG3MBt8KfHgh9kcDv5mjT38sAkhE9LpQ1IqufCwX
	OgpWI6uWTS35KCyvru1P49wQPV9xUZnk+IIK/qjQIrTEmmhNMSgNygr8rwMyYRaVSPZE=
X-Gm-Gg: AYBFou2+nqQhYQ4dAhSKdRozFK2VA5NzldnHKHnWjRY/VZMxFDaQnnF+gP97fuVnr5R
	mdHrWkx0mvfybd+b0CAJ5hXe3nXcJzzgpurd4dD7KenvF6eRrXkV5zpSu70plhCk2NJ1JDaoCTo
	7C4swb9/vSadoyEetGjEHLOWVkoJeD9kHpfsRPwyao7fgJD3w18K1VG8Ce6mXelzcxol/YQoFG1
	b5oR+LPJjYufFymnsuJ/fkVYIr49wTVOfe+u0cRGtGS7XnIjTmSY83fVjTk+/YhSGbEsS1IL/Wz
	tKhFllIUNt+X2JTzStnUtgMSWw+LBPegATX86qywu0lO+1shi+kP0j/vVDPgH8GeDydUB61S0cq
	WmnvR3UEgtKNuUXamr0aiFIai2VF4PQ==
X-Received: by 2002:a17:90b:1b08:b0:39d:ee20:1e3b with SMTP id 98e67ed59e1d1-39e1e4cf1cbmr14346654a91.23.1789646756704;
        Thu, 17 Sep 2026 05:05:56 -0700 (PDT)
X-Received: by 2002:a17:90b:1b08:b0:39d:ee20:1e3b with SMTP id 98e67ed59e1d1-39e1e4cf1cbmr14346591a91.23.1789646756196;
        Thu, 17 Sep 2026 05:05:56 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e35d9869csm5007612a91.4.2026.09.17.05.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 05:05:55 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: [PATCH v3 0/3] Add CAMSS support for Qualcomm Glymur
Date: Thu, 17 Sep 2026 17:35:40 +0530
Message-Id: <20260917-glymur_camss-v3-0-1d0e2d47ad2e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJTXq2oC/32Q3YrDIBBGXyV4vRY1MWooS99jKYs/k0RIYqtta
 Cl59zXJ1bJlb4Rv4HyemRdKED0k1BQvFGH2yYcph/KjQLbXUwfYu5wRI6wmnCncDc/xHr+tHlP
 CTOhWUENd6UqUkUuE1j+2uq/zniNc77n1tg+R0QmwDePob02hdGWdVVw6J1Rra1saRgynmhIHB
 vJAE9WCXatHSElvOk1x3GwUFfhBc1vyDF/6J56pxATXnHLDGeetVqfBTzqGQ4jdJ1qFep9uIT6
 3dWe2GW1dktS/N5tZrspfM7BgK6jpKaR0uN71sMof8rNK7Sx7x1bSGlnTSir3D6uIeMMK3golW
 T6NLP+y52VZfgAPECj3uAEAAA==
X-Change-ID: 20260529-glymur_camss-27af71b1d3d3
To: Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789646750; l=3114;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=1Ic/ajQCpJA33O6z7Flj6meuJ1EDpwKmwsUa8nUX9CQ=;
 b=85vFhiq14hMDnXr7VPReoIxyoZVQofTTZfe6kw8Fc8+WvmcoSZ9/xvWKMxc8R8oiNIiQopzh4
 K4jymdyRwuLBfJMTYB+sXxrSyvFDGCXqgXmr3kOZwIOPtd/7+jK6rJn
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-GUID: _gl-o2WeE9Sm4JtYHSvmXOn_flJvp6wp
X-Authority-Analysis: v=2.4 cv=YcYodARf c=1 sm=1 tr=0 ts=6aabd7a5 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=0ARVRLQPdUDne_cnrioA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: _gl-o2WeE9Sm4JtYHSvmXOn_flJvp6wp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE2OSBTYWx0ZWRfX6LZlQbGaUa9T
 rUqBRWWIEvNct8jia/+2EjqcCvdcozm1BKPWz9VhUMhhEgWG2GnstKO2DNw2wfz+x+fJtNonusH
 G/v/gwqIMyUwN7NGllbzDptjv9FoWysHMQqoSbI3B1bdnJMd+FCqwbXLLNW0Z4QejFdgJthLdv/
 GLvjNqucTaugcM3rbyWNraasMVWc27D7STlfRaAcMIJCl/YQTb45FYsg/MDmKYhEaXmpfjKmNN0
 oeWjQFeatgLdKpXUFfub+WNKSlnAMuPDwm/A49hjyGMayrsJRVaVpSZ5awS4KFgpflFNvfKI35f
 XiYIuyDgOyIyzN2VV6rc2gQrVuoisePNV/YVfNbjONThm/j+7fgStZktfbMl0ZvjIJ4RdRZQdys
 bcVov9k+9y+RR/zt17AVbaxB9rxpbmYJTHAkfo0B4uijjBDz3BJkG98Eo6a/uYP2sOi5ZjiEjkj
 5hSxZ1SCYZbN83YgoSA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE2OSBTYWx0ZWRfX30HVnjbWeHsL
 kryVqK/BkD54BaJwWdUAQf4bl5U3Ub1L+PzocDU+wBnnVWHioly2ZYL6Q5M/h6abHph4/IyYS85
 zfiwZ5zcXXo6fV6swFj7P/87Kjcg5RU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170169

This series adds Camera Subsystem (CAMSS) support for the Qualcomm
Glymur SoC.

Glymur's camera hardware topology:
- 3x CSIPHY (CSI Physical Layer)
- 3x CSID + 2x CSID Lite (CSI Decoder)
- 3x TPG (Test Pattern Generator)
- 2x VFE + 2x VFE Lite (Video Front End)

The CSIPHY block is the same hardware version as x1e80100 (3ph-1-0),
differing only in instance count (3 vs 4). TPG, CSID, VFE, CSID wrapper,
and ICC resources are fully shared with x1e80100.

Used following tools for the sanity check of these changes.
- make -j32 W=1
- checkpatch.pl
- make DT_CHECKER_FLAGS=-m W=1 DT_SCHEMA_FILES=i2c/qcom,i2c-cci.yaml dt_binding_check
- make DT_CHECKER_FLAGS=-m DT_SCHEMA_FILES=media/qcom,glymur-camss.yaml dt_binding_check W=1

Patch 1 depends on the following dt-bindings series:
[1] https://lore.kernel.org/all/20260917-x1e-csi2-phy-v18-0-6515b5255fa9@linaro.org

---
Changes in v3:
- Dropped PMIC changes; will be submitted as a separate series
- Dropped Hamoa from commit log - Bryan
- Collected Bryan Reviewed-By
- Link to v2: https://lore.kernel.org/r/20260907-glymur_camss-v2-0-75f7982dc983@oss.qualcomm.com

Changes in v2:
- Glymur is now defined exclusively with the new PHY API architecture.
  CSIPHYs are standalone qcom,glymur-csi2-phy nodes falling back to
  qcom,x1e80100-csi2-phy. The CSIPHY supplies and register regions are
  removed from the CAMSS binding; they live in the PHY nodes.
- CAMSS_GLYMUR enum is dropped. Glymur wires directly to
  x1e80100_resources in the OF match table. The CSIPHY instance
  difference (3 vs 4) is expressed entirely in DT - Bryan
- The incomplete compatible + resource enumeration from v1 are collapsed
  into a single self-contained patch. The pointless VFE enum patch is
  dropped - Krzysztof, Bryan
- Add dt-bindings, MFD and regulator support for PM8010 I2C PMIC with
  qcom,pm8010-i2c compatible; qcom,pm8008 is not equivalent - Konrad
- Drop dt-bindings: i2c: qcom-cci: Document Glymur compatible; already picked
  by Andi Shyti into her i2c tree (now in linux-next as 7c9474bd4a8d)
- Link to v1: https://lore.kernel.org/all/20260529-glymur_camss-v1-0-bee535396d22@oss.qualcomm.com/

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

---
Nihal Kumar Gupta (3):
      dt-bindings: phy: qcom,x1e80100-csi2-phy: Add Glymur compatible
      dt-bindings: media: qcom,glymur-camss: Add Glymur CAMSS
      media: qcom: camss: Add Glymur compatible

 .../bindings/media/qcom,glymur-camss.yaml          | 300 +++++++++++++++++++++
 .../bindings/phy/qcom,x1e80100-csi2-phy.yaml       |   6 +-
 drivers/media/platform/qcom/camss/camss.c          |   1 +
 3 files changed, 306 insertions(+), 1 deletion(-)
---
base-commit: 9a4cdc958dd79fc6c3b20b51a10debec6ca09fec
change-id: 20260529-glymur_camss-27af71b1d3d3
prerequisite-message-id: <20260917-x1e-csi2-phy-v18-0-6515b5255fa9@linaro.org>
prerequisite-patch-id: ab0db8f40ef87320e67543686702109ac045784f
prerequisite-patch-id: d6b3dab26f8a95822465a176f691280a5610c22e

Best regards,
-- 
Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

