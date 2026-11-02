Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793621464;
	b=HkEPM4y26qDn7vQDRx1ud2wHusTKv5MjEKtH8F7ag3HLbu7lnQPvHAh2wQV2tY2em3SL
	 2UftN4D3wTzt8yUo9sHfOfN+xZgBSmoWkVY3rkcO2pOqVw7B3GhSHJMycjv4f5ojReuVy
	 6VfdGKmbs90WBr9tbI5o/hJCd86vGYxw132z3O6KKxy3WgXMalJePmqBWpF6ueu2akH1Z
	 pk9Jy2jwbVoL2sZ6ok1hwb9VQvQ4QmJPjNjsewb062NG+8Tgpm72rF8rebIVdvdmBKV+e
	 AT8UE7LDQ6UbiP+0V//d67Bo5Qt743sTr4neUBTgcbxXVCs/gNE1IWQ6jpAAZ4v267A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793621464;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=V6i6LCGvUD2nDQbYxoIlsW3C5T+sr27Q100xAPamH7w=;
	b=Fgf30wTCNLi1ZoTQ58pn8P11Ngzm0I/2dJYHlECLWRzUy6kge4rNBg2u+CB//yOyh1nD
	 S5dxg9qyF8UcHbprgqFoSwEzAUrSGmSPfWp6pGbQBnjAEoY6kfB261gZz7rmgUvQC2lgg
	 +zMcZiO3RasWiKxKllALxeFp63AOR/QTw+FUp9dkQP+F/jEL4jUP7cmRGUtjroN9BWgKq
	 +O8668uv9ZPqojsOpGczOLY+wsaPXBmO7uGlMmMuwldqv81+luf/lNzrsVsB9o0Y42A+P
	 Xotlx4jUvBeMhZ0Ph6Ziw2jfpbVXokoiLt+CTeXEXat1/OKVM5OVBGUrvfrs4D1t7Iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TQjICIMU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ar9wwc8y;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D964606A32E
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 12:11:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D964606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TQjICIMU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ar9wwc8y
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29A3XC2466298
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 12:11:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=V6i6LCGvUD2nDQbYxoIlsW
	3C5T+sr27Q100xAPamH7w=; b=TQjICIMU1NPymle4/oTI3o3IUMxyYS3jjA5Raa
	eBh1W9M+PBqvZ+2P8cXeBN+lKS5NV4bz6FY9T8O2WzoTNaXZM4+GfGxSmmfwmn6Q
	WJAZdYz05aW5kgEdzBJXDeNVadRWRVoySveaMS5TE9R048KhNLhmHsYgrD9yPnAr
	QQA0ZueIQvRwhW2ouB5z8OVEWidpRHPEAHybj5ykcRRDjjjr1gyrFiXYUDNPeRJR
	avGPuTEgBLblFit0+pgUpxWaLLONnb5WHu0nvZB8IYFyiEteE0COHLq9QxbtX6Hm
	YWxa2DBrZugsAuT4du96rRKGOH18/gCfLztPdmcxMwaHESng==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpk9rhqpy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 12:11:03 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-98304865f02so2536842241.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 04:11:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793621462; x=1794226262; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=V6i6LCGvUD2nDQbYxoIlsW3C5T+sr27Q100xAPamH7w=;
        b=Ar9wwc8yNDinPvHtz+yF/YdycSeYUtu87CWbBec7AeCvY7Pue4wpd6MSDpRoePpXWo
         ZWqdOtY+Mj9kZPvZTK3MLUwgsC3M4GdPizLhyGoVmlukRCwzEytOwmsbFaZuTbh7f/cx
         vEOlWZiPp1Bb3blk2h52nYo9XnuQBFAorAS8/1vWyjCNW78m0PUGGeOSfuw+VxLVwRDq
         uNhSI3ZH8DWS9JULlqFGnTT9E+139iaZ5+3u8RgEUefh/9PndToF1RzLLfuscSOCiXTd
         DzzutlBsIjgSOvk2CMcL77xqWzIH2QWAaSQHDxxlAZejDlFQaVEYRjSWFOMGj91Q3Rqi
         XHlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793621462; x=1794226262;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=V6i6LCGvUD2nDQbYxoIlsW3C5T+sr27Q100xAPamH7w=;
        b=zzFRV0Z+qfoXiZJjl0IFRHyY97Q98vPd9ETbQXDuEqj/45/7BBbZcYn/7CVNDSlyt4
         CgWGPFYn2L+8n5vKDiF4YqEOG1FlEaf2o9vHVW5DtVSo5FpMVfTv8joI1mojT1W46iP9
         bV5pXghPRNuH7JSHpt3obQjKePiM02rd2DMxmWcpvsSZpODBD5GrKvfnfK7hpgrfPBrV
         enH0ZEbTsW2YUW4WslYALJc2ylaDNWPmp97EZAO8rxRvRSEvX+/f14yDWzvtf9eJyJCm
         wPrZKairlJe8oniiyEV58DUYZI/Xo7bh9BkCFwJf+7PQM2LHBJfOK1eO8gwEBp24ufUj
         TKCA==
X-Forwarded-Encrypted: i=1; AKwUvBw4/5R5MPEktkl09eFS0xlNJYvQMty0S0ebaKWctzLVLoqpDnJxCqArtfiXS4BabkLu9XYYHkRFIE0gbVQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9LYixZlV2D4G22R4sMigLVi9FT7hYySsi0hBMigbPSnFJs+vPE
	SIlxKz/buX7H+nL0KN3dTmKaMENClRMlOimPCtGtrlsqCI6ialVlWF7fKvpathYfyGtViQ4nUm3
	MKBRDNZ66MZWPYv9IH/cls9BhIjTynrEtTJJEChvxTMdZke5TSkWC06lafTOIOAviyS4=
X-Gm-Gg: AYBFou3gvrzDBuPxPPN96GVfCrIYqlJvCobSXkqYCnR6v2SfYe5YQbgbSNI7snW5v6M
	pH0gjvbE9ewcgEIR/jAN2h0jvwuwI9SDg0r4BCCkGoE5w+UMn/1QucQ/5cWpOOBhcKq2cgMOEll
	KVAItEV68ZltJdWdlCN7WUDKfe0p4BYtKZt7L0NWjQ+L6jbEBZDB3yJN2FU5ErkF9mpyhnzBCmb
	nvsXnI0Xv9WmnktjfC7L1N8uflMVunIszP7FmZc+3ra6TBz8pA30UZKS4hWk9NpngPKj7Tb0UJM
	rNrzLlA1W1DhjABjkp/8UjJDll5oNgoKaoklytjqwCQD0MaFKlq+a7QPrGAw7yEVAKpnzV8T/eV
	HYLdheerNlht568JfTNg/ma8fwHz591bVAXOIM5nIkKQYUoKJ/vUYWCWdjA==
X-Received: by 2002:a05:6102:8092:b0:7cc:56a:58d3 with SMTP id ada2fe7eead31-7d07279cd1amr4118061137.31.1793621461943;
        Mon, 02 Nov 2026 04:11:01 -0800 (PST)
X-Received: by 2002:a05:6102:8092:b0:7cc:56a:58d3 with SMTP id ada2fe7eead31-7d07279cd1amr4118042137.31.1793621461230;
        Mon, 02 Nov 2026 04:11:01 -0800 (PST)
Received: from [127.0.1.1] ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b81c74sm19304405f8f.36.2026.11.02.04.10.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:11:00 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v4 0/4] arm64: dts: qcom: eliza-cqs-evk: Support eMMC and
 UFS SoMs
Date: Mon, 02 Nov 2026 14:10:46 +0200
Message-Id: <20261102-dts-qcom-eliza-add-ufs-variant-v4-0-c92512c7c759@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAMZ96GoC/43OwW7CMAwG4FdBOc+odUPa7rT3mDi4iQOZoB1xG
 7GhvjspXDhsgoulX7K/3xclHAOLel9dVOQUJAx9Dvptpeye+h1DcDkrLNAUbanBjQInOxyBD+G
 XgJyDyQskioH6EWpdtGiNrTakVUa+I/twvhV8bu9Zpu6L7bioy8Y+yDjEn9sHqVz2Xi5LJRRQN
 12FumViU34MIuvTRId8c1znoZbOhI/q5qmKWW2Mq5GQGq/rf9TqQcXmqVpltSX0rvOmI49/qPM
 8XwGpzBQckQEAAA==
X-Change-ID: 20260914-dts-qcom-eliza-add-ufs-variant-74092c6c35a4
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3190;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=m3ND5QsF7moyD5anPmTbv93YOMx6Fub4CbyJ4tpmG9E=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBq6H3O/XNcHPOq0E3G3rVVCKdFbkylE2vCr4gwf
 f++uR8+uSCJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCauh9zgAKCRAbX0TJAJUV
 Vt0VD/99shs2RaVFeTlsBqw+2OaELXmu/T7perFN88qhNJkPKD/fAmr0iwGXCTUKIA0IggfbGZG
 jtHccxovJfI1tNN66piLyz6aGDYNTQwxzgGzPfFbx+YtJbwl4LSu0x079JxrYgfNP3hj+M79S5K
 mFv6PoOYWkHJN7LAO1sXYLK5fUdFVWHcfRbAgmnoJcujpXFBweawFZm6zjJcSKWmAYgr9ZJ262G
 i/r4JyM/WgFw4epqJzNJhTDR0fBNZexuYOF3SP80ZKUMWgj/oMQzSUBB/zSEQ6JEojfDRkQLrCG
 6eeQLwLsgy2/boK3XkWfyFttBWmMdH7ZPoZFPRYUtTJ7D8t9LosS0VjQVPqGrOMZCldSmDyz0sl
 M/stUEb8FuWI2uPxHfRAoIfurdJ3R4/eNUwaFO3oomZkAJpOTZE9RcmKW7uB8mj5RSeNHjvDfhp
 RGnV3/RwH8APw+xRqro/io88AVIPgm0uq6g6j19Jq7Ycx0cIF9KPoqzy2ILQ+9nP+sNNTPtTaKA
 ZEIB17BHggYIDju7Slcw6qYkvOLYOcssf82aFvM6KDQoufnqQ9eVanCrL57tNSRoucMkZHt1RJl
 EnRfs3Y1rI6YFN3eZBBUZ1gW4HG9s9UBV6aHjNNvSlcaVHaynCMSFADjtjlRiqzgUCawwM85MQE
 wTzkneq32xbtrnw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: aUYLxERf5hCTl4yPOF2MT3M61Y6r2Rb8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0OCBTYWx0ZWRfXyiOSuum6q/Hz
 hx5bkgbcIlSBREpkvqwWVG5aOm7SkoKuTduCJOYIP6HF5aBKUOidEtegEZt+X7IE2Nk1rJCjPLY
 KkiujJM2ghCnA4mfPIUPbt8FFuXwlrakpU9f6WBVIzD10KPtG0HUwYqwDt9y+a/9SBkphG0rs2q
 2Aawv57x2AdJUcCgHaSnVuaq8Cp65aNewthP/7UC0/089C0Mih47yBA7VPFyXozq+Vudh8R39Ty
 l2BOx6C5O47StcRXRuUvEnnNNsKPlFfvpI2ercfA6Ac1KObDV6FJ6OujYlgf14LIn7uXQ8k2A4n
 qp94mRpHX2AhRAfm/NCVaa64M+nFe5343Z2d6/2B8Uuf59StZTrtB3wdvp3ndd7rJVYU2eX/Z7y
 NCHpE3Of/l3r9TO9oFxsFEqr8GGmYfpt3T7qsr/fFpbskHjsYmeBn4H1jM2l7LjdLlbVzGNgH2h
 r29F1bDi+oucrIHdWfQ==
X-Proofpoint-GUID: aUYLxERf5hCTl4yPOF2MT3M61Y6r2Rb8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0OCBTYWx0ZWRfX0ZzjiKrWQ0cO
 esGRdYFuJC9qTORU2j45WBAkoCmwX0qZ+E/6C3BzLWdN6lDI+waIDKkiTdq/9BXrWr8ju1sbUt6
 eFcsTIbu8RuCVYoMtU67xTPh+ZoUujs=
X-Authority-Analysis: v=2.4 cv=LvwHWXdc c=1 sm=1 tr=0 ts=6ae87dd7 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=9CqxX6DE0bQLs5YF1KgA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020048

The Eliza CQS SoM is available with either eMMC or UFS storage. Both
variants connect to the same Eliza EVK carrier board, but the existing
device tree describes only the eMMC-equipped SoM and uses storage-neutral
names for the SoM and the assembled EVK.

Give each SoM variant and its EVK assembly storage-specific compatibles
and filenames. Keep the shared SoM hardware in eliza-cqs-som.dtsi and
describe only the storage controller and its variant-specific supply
voltage in the eMMC and UFS includes. Neither variant is derived from
the other; the carrier-board description is shared by both assemblies.

The existing boards have not been made publicly available, so renaming
the eMMC DTB and replacing its compatible strings does not affect users.

Move the sound card support into the shared Eliza EVK description so it
can also be reused by the UFS assembly and the Eliza CQM EVK later on.
Keep the existing sound card model name for both CQS assemblies.

Changes in v4:
- Rebase on v7.4-rc1.
- Squash the CQS SoM UFS and CQS EVK UFS patches, as suggested by Konrad.
- Collect Konrad's Reviewed-by tags.
- Link to v3: https://patch.msgid.link/20260928-dts-qcom-eliza-add-ufs-variant-v3-0-9a2fdbf6baf2@oss.qualcomm.com

Changes in v3:
- Extract the common SoM hardware into eliza-cqs-som.dtsi and keep only
  storage-specific configuration in the eMMC and UFS includes.
- Clarify that eMMC and UFS are SoM variants using the same EVK carrier
  and explain the problem addressed by each patch.
- Collect Konrad's Reviewed-by tag for the sound card move.
- Link to v2: https://patch.msgid.link/20260915-dts-qcom-eliza-add-ufs-variant-v2-0-86d72a2a8f47@oss.qualcomm.com

Changes in v2:
- Actually replace (and remove) eliza-cqs-evk.dts when
  eliza-cqs-evk-emmc.dts is added.
- Collect Krzysztof's Reviewed-by tag.
- Link to v1: https://patch.msgid.link/20260914-dts-qcom-eliza-add-ufs-variant-v1-0-78b3249eae61@oss.qualcomm.com

Prepared with help from an LLM-based assistant.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Abel Vesa (4):
      dt-bindings: arm: qcom: Describe Eliza CQS eMMC and UFS variants
      arm64: dts: qcom: eliza-cqs-evk: Move sound card support to Eliza EVK generic
      arm64: dts: qcom: eliza: Separate common CQS SoM and eMMC configuration
      arm64: dts: qcom: eliza: Add CQS EVK UFS variant

 Documentation/devicetree/bindings/arm/qcom.yaml  |   9 ++
 arch/arm64/boot/dts/qcom/Makefile                |   3 +-
 arch/arm64/boot/dts/qcom/eliza-cqs-evk-emmc.dts  |  18 +++
 arch/arm64/boot/dts/qcom/eliza-cqs-evk-ufs.dts   |  18 +++
 arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts       | 155 -----------------------
 arch/arm64/boot/dts/qcom/eliza-cqs-som-emmc.dtsi |  27 ++++
 arch/arm64/boot/dts/qcom/eliza-cqs-som-ufs.dtsi  |  29 +++++
 arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi      |  18 ---
 arch/arm64/boot/dts/qcom/eliza-evk.dtsi          | 139 ++++++++++++++++++++
 9 files changed, 242 insertions(+), 174 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20260914-dts-qcom-eliza-add-ufs-variant-74092c6c35a4

Best regards,
--  

Abel

