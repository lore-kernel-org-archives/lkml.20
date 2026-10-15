Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BFE63F6606
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792055739; cv=none; b=Mi4jw6DOr03dIEZQFljwTMjGKWzqzYGJA2HsCIN2lErsbJQCcqJqYvEISVy53yHHckMINtUkSlHkkgxfTz843HZJU7vQdqJ7OjgdXjKjMPkRcDmzX3gF6Y7WJlM2lqhK8dcLMlGu11/hm7mDNvAWAgngpEC/VThK1ABwLdg9pbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792055739; c=relaxed/simple;
	bh=SAZiJgOhlwllm0S2j4x5zt29+UNZKWd0sSq869mkUX8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VX0H1ygyRVIZ7JHYNBQ7o3DAf9zeZcEeVsMbsnS9F3eIdCzAXWylG/tpGNl0MrBJ7MEEvmuXJ1CU4FqOAgIHPFEiu6wUiSLX28o5V1ZzA7XGiU4tsrfHv58D6VkWDmT5LkVlQMV1Xd0mZk5/+bbZG2cbipvCXKiXdcgDa+2u1LM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oLS5QHQl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OSp9yEAq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oLS5QHQl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OSp9yEAq"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F77f672121309
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:15:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=woXKUhGLmE4bOAlEMK+/5r
	eDN4SYGO3zQeVkhZzPyq0=; b=oLS5QHQl3od3e8Febjbn6MMNRB+Ao32qLmVhn3
	WNnjjnaLellkm1HJJEcs7RtT6medOBsqtnsmEGjPbeBSatxSVZlwe9KkzxcqITiH
	CC7R6yJQpnP1nI/MmJbLbKibAA2HUM2rjdcpwwIAWdzK9ijEK9/Io2ZooGwyzH0B
	1MthrGFdGJ7i6lDPrtP+1zo75CqRlvZ41aHHhW87h1TlbLmeBZiHs8BJGb7Rvx5J
	lwOPvxPDt5K/Nr/0JoklMl2Wct4mYAXyjjUkwMG0orSEUTYwbsDHhMcY4IuntTBe
	UMw/A13ovliMmHYsBBR+tisAeBieNNb25j481xR9yrqjypRw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hakwn1xnj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:15:36 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-341eff9e381so14312182eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792055736; x=1792660536; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=woXKUhGLmE4bOAlEMK+/5reDN4SYGO3zQeVkhZzPyq0=;
        b=OSp9yEAqtr4ScPqti8a6SMb6oGrwWTjzLyZU0mTO5akosCKcCA5VFyClHT/UNgaQA1
         v4oSDgXFU8K5/keRG4ldQtM7DvJXG3yNQ4qsmECbA+f2Fwtc/wqkZw5NVgaq1L7oPZ+9
         uf+PWp40A5ZoYb/0rv/wtZQREGc5ht3CykS1ciiq9aOO3LcPUutHxKQQyn0uAEgGR+e+
         0PTK2Kz0IdPFKx2Wgb0FQYJkLdNWLWtDg/3X1V1PrOtVdiDzypBOgHOzt+lccAllSQtl
         tVGiHSN2KkMIMUMhgcakvVo342tXs0UmMeNyF0xma2PccXO5ir/0GwDpuZ1eUkLDhgFV
         Kjjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792055736; x=1792660536;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=woXKUhGLmE4bOAlEMK+/5reDN4SYGO3zQeVkhZzPyq0=;
        b=JQa8MyRNMyAr+kItOarJLN2rtQArPFhgZQ4DzlGbgWr1wzHMlMD5/JUPmFdvgCFdpA
         n8fEF045uyFF5nwi11pfLsG4Tu8OF+DQ0Sm/1p8pWw7Om7NsrsGLJkdJOK1re7JflfDS
         3Bj4nCtLUIUcs2nx3d6dqOb6lTtbOF2LzdSCw9daUA0fOOrpTIYATyAqMQ3R2uGHcQgF
         CNb54SjVgrGCR/lctrqxT8qo3uglIA/1tXB7SSUyjOO0inAKGt580Pz7mijMgB4Z2Rzf
         5F2/0CFDbDQkpQs4p/F89d1047Yf4UjuHeqYSAqUFTDXz0VZpIYXp5rHYduDHGkjB0b1
         OXAA==
X-Forwarded-Encrypted: i=1; AKwUvByGJ3Z8MWS49LqUWestGyOo3lt6SbPr8YMkgd4xxnlpaK4ENV9udux6l6HcH1dn4MY48FGbMGB6ZCSSZak=@vger.kernel.org
X-Gm-Message-State: AFq9FYKh9IBKVrxOdHLjycyqYtoA2St+mSzkABwrmyS4wZgo1MstuyAM
	2I+/ChPV/bOqAZbaoldHb0sw3XtVXp/rjidK6h+VlueXSJP/kju105mX9MS1ekSs7DzDTyYnerG
	5cNpP7i/eiuYzc1AwPO6CM+mgVpSIIp+rhLPj2293JTd8TrxbQUjQI75cycJhVNc+rO0=
X-Gm-Gg: AYBFou03APKF3u2xBo05LD3EvhoAkYiF4a1rX/5z9i3WDeGD1RTpTdOfIzixmzSsW0w
	u9lna0mfJjuQLABHzNMlssXW10nw/HbywtxWUruOlqxbzM81Sxg85n7r/111YLbY7WwPJLIj6Z1
	NMICOQrjIfhf8Tat1/M9Ux8s0dniAbTIJATZvXlGGdQZIfwS2ijg5b6l9JgPwOs2PR+EIA4nTaG
	re0raccAMXLo9Zu19QcDWxSD14co8aolR3idQ08bc2NziBB0HIyE27dEWLDp9dFuHuzV2IcPhMh
	BrTXvuNsT2Nwd+YxPFCrB/munTW1jWoJ9zl77rzPwocdinmdWzE8+uxZMSbJYoA/z8tFY2QcrVM
	2/pnJ+v7EP/DbRQcFo0PfACzFIQ==
X-Received: by 2002:a05:701b:2511:b0:17d:7b45:f907 with SMTP id a92af1059eb24-17d7b55507cmr6057691c88.33.1792055735887;
        Thu, 15 Oct 2026 02:15:35 -0700 (PDT)
X-Received: by 2002:a05:701b:2511:b0:17d:7b45:f907 with SMTP id a92af1059eb24-17d7b55507cmr6057664c88.33.1792055735222;
        Thu, 15 Oct 2026 02:15:35 -0700 (PDT)
Received: from hu-mdsor-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-17dc865cbffsm19671658c88.6.2026.10.15.02.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 02:15:34 -0700 (PDT)
From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
Subject: [PATCH v5 0/2] Subject: arm64: qcom: shikra-iqs-evk: Add LT9611UXD
 HDMI bridge support
Date: Thu, 15 Oct 2026 14:45:27 +0530
Message-Id: <20261015-shikra-work-v5-0-5e075222b60a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK+Z0GoC/5WPyWrDMBCGX8Xo3AmSbI3lnPoeJQcto0bN4kSyn
 UDIu1e2W1roqZeBD+bfHixTipTZtnqwRFPMsT8XUC8Vc3tzfieIvjCTXCJHoSHv4yEZuPXpAGR
 ahVZhY6VnRWFNJnD96RSHWROcQ+VrY43iqvNeCK5kiyQ0dyibgi0Kr8MsvSQK8b4UedutnEf7Q
 W5x+vpIdB1Lw2F9+x23rf4Ttozpav49xg+wjs0wKeCgyQRU2nCq9Wuf8+Y6muMctCnnx0AgHIc
 OhXAwtTAV5FBK8EYG52Wj/kp3z+cnGx9/dXIBAAA=
X-Change-ID: 20260618-shikra-work-ea756b564b2d
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Mohit Dsor <mohit.dsor@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792055731; l=2870;
 i=mohit.dsor@oss.qualcomm.com; s=20260808; h=from:subject:message-id;
 bh=SAZiJgOhlwllm0S2j4x5zt29+UNZKWd0sSq869mkUX8=;
 b=p0bLph7LW/pNT0BCMfS3zf+EIfnhwqNZoXfvwP3nxKQSlBHthP+/qTqFJR10PjgixHoh55X4H
 nbn68O8FkTgDl1zi3g5P4kpAVIx81AhKlNmdwY75YGr3zKtjQoXfNPx
X-Developer-Key: i=mohit.dsor@oss.qualcomm.com; a=ed25519;
 pk=outHVBN53JhozDw1xkj3G1qrqqE5scMBP7M4WL3aHQQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzNiBTYWx0ZWRfXxWRx9AHwoCjb
 c+zAOdLFG/iDLd79/qQNE79HvVRGj3z/W6jIIvBJQdqmwXXITV1RSyHswuAVnKTMq+k9BPdS/m3
 TB9AyKKvhdoN0R4hQafWCxPDnK/A6q2hpEGg1Cl+g988xPAj++mSaW2pnSaYMLwjF75f6WX5pRP
 4i04y6Urw9cC5dYhA9lFO1p/7DQ6zjSWwnPRsBViOEwxTZlsgMJSBQ1EVoCl8Mo8ldgAyTA71Z5
 zSg6yLWM5WKdI2sfXvDewq7rJDlvPf/RFvI8mHAasarwszWoTuVJCZIttAIfjq+h+TO8aHKdPts
 7K+IGDJxxwRZQNIwDdAxLKQsRoeMMiKZBjPqURlP+6i4tD/IS9ivHHcVCgUR9zE/ZbCoULsvVSu
 /af8Tq4hyXH3p8982LBg/uPBc+HQXwUBRGAkAr/CmP9aTtWdEaxHGyfP1Mz4s7YxCRSeQJcVaRN
 IOQ2vr8a2Wt58UQmMYQ==
X-Proofpoint-GUID: gEpOqhqeZ2gY0yLNSi_poxHqUZn6X9Zn
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzNiBTYWx0ZWRfXzS17lZCMBLK0
 F4ELKpM86NJ056cZzqFUsg0JLaOOecYeUsjtRiS1na4W/LfKG/rsMRPjtXXQ/3orJwm0Hiqz3le
 yOcg6UWzX64+zqZJdFqilD8tXKn++9g=
X-Authority-Analysis: v=2.4 cv=BqUIUoX5 c=1 sm=1 tr=0 ts=6ad099b8 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=AcGP7lXX_YB9EEKc68wA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: gEpOqhqeZ2gY0yLNSi_poxHqUZn6X9Zn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150036

Add MDSS display and LT9611UXD DSI-to-HDMI bridge support for the
Shikra IQS EVK, and enable the LT9611C bridge driver in defconfig.

Dependencies:
https://lore.kernel.org/all/20260930-shikra-dt-changes-v5-0-8eaf658a0e38@oss.qualcomm.com/
https://lore.kernel.org/all/20260916-lt9611c-v7-v16-0-c65042fcd245@oss.qualcomm.com/

Changes in v5:
- Rename node from lt9611uxd@41 to hdmi-bridge@41 and add label hdmi_bridge
  to decouple node name from the bridge chip (Dmitry).
- Rename endpoint labels: lt9611_a -> bridge_dsi_in,
  lt9611_out -> hdmi_connector_out (Dmitry).
- Sort &tlmm pinctrl states and pinctrl-0 by GPIO number (Dmitry).
- Fix defconfig commit message to describe generic driver usage
  rather than Qualcomm-specific board (Krzysztof).
- Add Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
  to defconfig patch.
- Link to v4: https://lore.kernel.org/all/20261007-master_lt9611uxd-v4-0-9986704e2a7b@oss.qualcomm.com/

Changes in v4:
- Rebased on top of next-20260929 (linux-next tag).
- Only two prerequisites remain: the display v5 series and the LT9611C
  driver v16 series, as all other dependencies have sincelanded in
  linux-next.
- Rename lt9611-specific regulator and pinctrl labels to more generic
  names since these will be shared with other display interfaces in DT
  overlay.
- Link to v3: https://lore.kernel.org/all/20260728-shikra-work-v3-0-e08c322596ac@oss.qualcomm.com/

Changes in v3:
- Remove superfluous comment from pm8150_l11 regulator node.
- Link to v2: https://lore.kernel.org/all/20260717-shikra-work-v2-0-86ae8552259e@oss.qualcomm.com/

Changes in v2:
- Removed port-select property.
- reset and irq is aligned as per driver.
- Rebase on top of shikra-display-v4 series to pass schema check.
- Link to v1 [1/2]: https://lore.kernel.org/lkml/20260627-shikra-dt-changes-v1-5-449a402673d0@oss.qualcomm.com/
- Link to v1 [2/2]: https://lore.kernel.org/lkml/20260618-shikra-work-v1-1-dc30381263f9@oss.qualcomm.com/

prerequisite-message-id: <20260930-shikra-dt-changes-v5-0-8eaf658a0e38@oss.qualcomm.com>
prerequisite-message-id: <https://lore.kernel.org/lkml/20260916-lt9611c-v7-v16-0-c65042fcd245@oss.qualcomm.com>

Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
base-commit: 6474fa070f2b8013b4b87350b775b8c3be6e8aac
change-id: 20260618-shikra-work-ea756b564b2d
---
Mohit Dsor (2):
      arm64: dts: qcom: shikra-iqs-evk: Add LT9611UXD HDMI bridge support
      arm64: defconfig: Enable LT9611C bridge driver

 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 109 ++++++++++++++++++++++++++++
 arch/arm64/configs/defconfig                |   1 +
 2 files changed, 110 insertions(+)
---
base-commit: fcc65d3aba5059dd1105276e180c624110761d8f
change-id: 20260618-shikra-work-ea756b564b2d

Best regards,
--  
Mohit Dsor <mohit.dsor@oss.qualcomm.com>

