Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE9F352842F
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 15:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791993387; cv=none; b=DidNTReD1QaKZHQGGSd4tPRAKQwQhbwLjrxeaNRQEi/ybIg25Rv9aP2f0qBQCTS4QsBhpqWxRNlPyYG5HPcscZYnlsYtL5JVBATOvZeq82aIRJH13NbVY37saA6J8IKtM8XHqrUj2Oa1B08VoBdajgT4Rv9xgBxmKUswLNXBj/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791993387; c=relaxed/simple;
	bh=QcP01yeYANmnSOpCckxi4SHgUGs/ns1aGF7CqSeJ3UI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=EsQ6wVHXwHat5tJXGt4vXjruo8ZePK5m0pwBfHAWTh8TdNKo3IV30GKGpMOdrsoUL0M4sX+l/yhSMATBmkpZ75cKVaV/Z7UAIG2GMg/npDuB6OiuenKFmYRCNpW2/EnRVNq0hb0Wkjs9FdEwxs4jvjfVIvQ3oH4D+elySaS70rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VvjzfRk5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=URkttb1u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VvjzfRk5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="URkttb1u"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EEbJPL152429
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 15:56:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=nRN5mwPXK5jua7t9LUgDQO
	MkK+R4yZYyk715f9CNhO0=; b=VvjzfRk5J6Z9CkwIJwodw+ihTsee+ukv63IqOX
	Q6WCjbh4ntyQsNl40UV0YtscS8XbHAdRr1bSL5Lwkxd3jYJQPOdWAsMF+a+byAjn
	35O78uSyLMmGd+S3EukL4LU1QVoUfA12dDj4tlsGrsIO+mHvy2h/ZVFhFiSukeTS
	/5Acr0uNCgHGOGLKOD4cwQwAiEsEXn1PgSImFhcWwDYowpNtjbqbzh7eX6aqwZqw
	8vgCAyuoLnXxJdI04NgbxrW+XRC6Gke2cjuUNaC8UNVrSr9A3/BXMS+HiAmXJ7uz
	XqJT2pK4mL6e28eD/AIb7o8SWS8IbWXweKZyKtMVnlRUP8gQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha7aehfhr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 15:56:24 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc7e0321ec1so5166501a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 08:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791993383; x=1792598183; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nRN5mwPXK5jua7t9LUgDQOMkK+R4yZYyk715f9CNhO0=;
        b=URkttb1ut8eimOCDpWhwtTxTZstoPc9C3UmmbNqVbdM5lQvNR+Ij6iNk03ZQ/EQlQE
         Lz6X2VvCumzJJryuNWf5IkiOT5rqJ/9JtWDukWYqMFw/mzgtADKrcWELI5Na1bd1XZyg
         KoB5K0moxBJcCqRjwgyPVvci2nxxDOzTU07Zlb7gbTxAuo0c12qfJjykXEqDaObLZwd0
         BPyGSWt4+qYM61YHSrxGKbRC1vSKVgfb/HnO6DPDnExY6f5wLLc6ZmEBxilagIJ346DX
         oAS0wrZaVlkl7s/hwjbd+cIJjQsZCy275jRO27mfJW58sfkaFPJaRZMfCK/K1Z+l7WT6
         XDqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791993383; x=1792598183;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nRN5mwPXK5jua7t9LUgDQOMkK+R4yZYyk715f9CNhO0=;
        b=sPrA7pM2nvsUp5I3VXZMJXNvdbFKEBUArqXgX3R5UQxlesMl929WHJU9SNgyIaDvbu
         DbStUmle9as7ljVPhRDhfXTC6z6BUAaJyWd9kJkG3zNYZwHa9tVtykz8W/rdwPQwe2y8
         lw/JtcfcdPbY1RduGMkoI3YPJycoXuPN4O45JQqJbEKH2+yreVCCiIqRBDc9kwWCv/64
         TJY8mni7+9rWDjLFtn7DAY8Xby3skh8ICBfONwDSPtaSj6rwxdENqSn6u92qpvwrFX8t
         ECULvJ6JMu66teW2Jlerg94U6tFfRvf1igMd5No8cmltBdKpZWmClQpvvgu1c3J91Fsl
         3c2A==
X-Forwarded-Encrypted: i=1; AKwUvBylSx7frXiA8jgLtu0bmE/IDxQRQvJrCA83rBSApkoeR+BvOiLz7hc4G4UB54/5Wea1K+0QDsFOWKdY+J4=@vger.kernel.org
X-Gm-Message-State: AFq9FYK7Bnbdj8nBOzLNaZE6lSoDVRM3anvQbgaihT2vrjflr0oejmIx
	CgKvUzVyx2CBtwWUo0vhLE/FyJd/+H8eFU6MCBN/S9nyLjjrcA8N5Xp8pQHyaDcyGtucSDuMWdQ
	RvcG6SuLRAh/5AAyJmcP1IRAqEvBle7joaHmzp3p3tKyKegEBTY9Nnic+mxQ3vAMnRO8=
X-Gm-Gg: AYBFou0JQQqUjV1v+zOj1P5dCzUtmzMZp8k8lUtQ4LAu4WTdbHBVuiD4VdsR0VbFN4D
	v6NAKAwJE6fdnrh/Z1IAgHTrgCAkyERthXOMZzJJwIKbBWvwZ9E7SjIGlRSZwK5D6EynQ/gBsxh
	Xj89EWXFRiB2r/py2Q25UVJts+yXQ8nbDV8COcOx5ePhK0JHwiqXimMqMoJMNmcZeQXC18NPb90
	/Vf3bc2iWBOrmxhhOvAcY0sDgZQjxsta64UIAaED3ec+8I4swAyrOIaJTTtDf0BPws5Gf7w5nYu
	IovNA4Q94ziCibRFEDNA0OOKVzuH53XyYr5T3shLkb4bMyOyZzBDqLGiNqRKPRH0IZ9FCPziAMc
	4adgs9JiZVpEnvk/KMj8SqMDWdQ5h72VgdQ==
X-Received: by 2002:a17:902:e847:b0:2e5:e1e2:21fb with SMTP id d9443c01a7336-2e842ac8aa0mr158858215ad.37.1791993383405;
        Wed, 14 Oct 2026 08:56:23 -0700 (PDT)
X-Received: by 2002:a17:902:e847:b0:2e5:e1e2:21fb with SMTP id d9443c01a7336-2e842ac8aa0mr158857925ad.37.1791993382906;
        Wed, 14 Oct 2026 08:56:22 -0700 (PDT)
Received: from hu-faiyazm-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422e14f6sm71961375ad.69.2026.10.14.08.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 08:56:22 -0700 (PDT)
From: Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com>
Subject: [PATCH 0/4] edac: qcom: add DDR DRAM ECC reporting for Shikra
 (QCM2390)
Date: Wed, 14 Oct 2026 21:26:15 +0530
Message-Id: <20261014-master-v1-0-aba3cfcfbac9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB+mz2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDCyMT3dzE4pLUIt1EM2MLwyTzNFPjtDQloOKCotS0zAqwQdGxEH5xaVJ
 WanIJSLdSbS0AIWU//WoAAAA=
X-Change-ID: 20260824-master-a6381b7f53ff
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
        Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: PC4JwW9J7-5DlPslVvW43S3K_s71ELtP
X-Proofpoint-GUID: PC4JwW9J7-5DlPslVvW43S3K_s71ELtP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA2MyBTYWx0ZWRfXwKi8HRKcHxMd
 441MkZlczQL8/Q5GVxpSe++KqzAWpetBRNiJE5BjSgGk6NAUUtINmUUIAy68sU52zHsbZtGK0E5
 5lWgb16Z0bx/s6YiPeUlXYxVSeJthuk=
X-Authority-Analysis: v=2.4 cv=NctzRGD4 c=1 sm=1 tr=0 ts=6acfa628 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=28_99TRhucPTTWWXKPwA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA2MyBTYWx0ZWRfX2+UeKaehD9Sp
 3oYdu9YVb4SHhzLU9l9P10K9EG2lseb5asQbFtBksYXqWXEmmByRF/RqSTtNxv0kTJ4yCovJOzY
 fdwM3DO3i1KsAjDOYkICCLyPaPCvJ7HMJXB+j9FYLrAh82Meo15ahF81kSae53wuVgOIU0YDrvb
 A6HCHu4DHkj/swEFyIILzck/afLWWE3jRxi2hkvL8tSb+oQY1mCLY6cHP0lemKWt+o+i8tMIHNH
 oOeXNWikKPw4gtSTWfeDgtVe2XpxhXTwXZypOecLOtHsz2sh31pOVzr2ts6xFxfZuD7KxkdCA3H
 BrKH6cWXyuPBJgXJ1GSjLjPF73d6gR7SGwRxV5TAzFKTkYD9SJcdbw/RoyYsY3No9tcv/p/ZbQo
 tZPKMSwrd/+ezfA85h712o3Xrs2mJTETJfLaX5ow29Mth2WOMxh+w5WApEzZqQ9Vb5Ysz7diQs4
 uF7ZPuxmYrNcf2QS8rg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1011 suspectscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140063

Add DDR DRAM ECC reporting for QCM2390 (Shikra) via the LLCC EDAC
driver. The LCP/SRP block between the LLCC and DDR PHY signals CE/UE
errors on a dedicated interrupt separate from the TRP/DRP cache ECC
path.

Patch 1 updates the DT binding to allow an optional second interrupt,
adds interrupt-names ("llcc-ecc", "llcc-lcp-ecc"), and enforces both
are present for qcom,shikra-llcc.

Patch 2 adds LCP/SRP register offsets to struct llcc_edac_reg_offset,
populates them for QCM2390, and adds lcp_irq to struct llcc_drv_data.

Patch 3 adds qcom_llcc_lcp_setup() to initialise the LCP block and
llcc_lcp_ecc_irq_handler() to report per-bank CE/UE errors via EDAC.

Patch 4 adds the second interrupt entry and interrupt-names to the
Shikra LLCC DT node.

Signed-off-by: Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com>
---
Faiyaz Mohammed (4):
      dt-bindings: cache: qcom,llcc: allow optional second interrupt for LCP/SRP ECC
      soc: qcom: llcc: add LCP/SRP DDR DRAM ECC register offsets
      edac: qcom: add LCP/SRP DDR DRAM ECC support for Shikra
      arm64: dts: qcom: shikra: add LCP/SRP ECC interrupt to LLCC node

 .../devicetree/bindings/cache/qcom,llcc.yaml       |  26 +++-
 arch/arm64/boot/dts/qcom/shikra.dtsi               |   4 +-
 drivers/edac/qcom_edac.c                           | 147 +++++++++++++++++++++
 drivers/soc/qcom/llcc-qcom.c                       |  45 ++++++-
 include/linux/soc/qcom/llcc-qcom.h                 |  13 ++
 5 files changed, 231 insertions(+), 4 deletions(-)
---
base-commit: cbf6c6b201561342d673223d1e59ef771c7a9dbf
change-id: 20260824-master-a6381b7f53ff

Best regards,
--  
Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com>

