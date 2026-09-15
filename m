Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 806BA47F781
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789464483; cv=none; b=AXVfLw2M8x7ZdKNjwmRC5PORdKx1CLy+yiTpue38Q3x3ju6RyhAiFhF8HwvqilAamE7pM6z4siVYM9V12WR0d/VmLz8XqQysaALhDePJjFOLZLDKs4FiM6d/tCQ93gfPUR9X/ZKCxnmrxfCxejQBfVLMVoKjspr53IsjR1/7uzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789464483; c=relaxed/simple;
	bh=tS5jYHAOJiHwqtVjHphp88eu6y5+S+EodtZQBgori04=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fsKKw9Uv/fNOFigHUOb9CZ5YGUZFx1Jraqch2eJY27du+iy0hjIoLcoeCoahX0hDfWMSb2A8vBayStu4UFuqrIKGWbhrpShWvUjHElbubFKwm8NVOhF5BHVFuOGKeKCg/uaFP1GMFc/J3O6ZwXPJLALIZXNzbPube7QDBFB9RBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZoGFAlzi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JRfsSa9T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZoGFAlzi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JRfsSa9T"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6ZdUQ3824091
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:28:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=dwbltoz28/icpViL8WHNMd
	s2UytK2mXXode9Ychb5S4=; b=ZoGFAlziyitaTgGpu65LmxS0uRwG2cMA71LkoX
	x0tMBvewaN8k7Q0bxYZaR9zcRESzLpcEvmpX0qeOKuhxZi+NDIxY2Ftkcscaba0z
	57LBiewrups+gasJKhB70tEc6E6ULLIVa+0vDvDVvZntL5doZK5LizlfwxDDgJ3l
	XILpOnrYgBV9qcrpZoHjH/oBNFTDM3GF3UH+SrWUXcgy7BWGBzy72XC6UIgagQs4
	s6uje1Gy5oFbIDoMkRnHytetmdwuQQSaA1vKkfQTLUhezLDzpFDTBl7AJtb6Bwnz
	VLfRDbuxvSKqNCNML5rCKl9tXwHoyuY2trMCsmO5eDnsRsQw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpn41unqy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:28:00 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-939f27c80a3so842673085a.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 02:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789464480; x=1790069280; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dwbltoz28/icpViL8WHNMds2UytK2mXXode9Ychb5S4=;
        b=JRfsSa9TcKeq+pTh8qDLtM3OylgjpHonycobyOS02tLK55cOhbG1NY43zKNLY4TqVa
         XgS//Km2msxxzYGR6Dr+8W3OHueu2dnB4OqLSQKPQOcEsapJWxopbOYsP3f7CrNDZqOd
         RphrBEb3IJHVAhb+tLqJ0qeISqr14kWGVx9Ot7V+8oWmv5+DDgANFFqQaHEVDaoMktpk
         i/4f3IPvzHppttlOg7wZGRWg8CMWtk68TJDuBFcYhZmtOzmdL1agXnON8KHEbqxx9L5e
         5uN1OJvPrST5loxFRTrcjMDpnLW5WjmHQ2XbrRrbibxHrqtQxF1lqcv6ngcoVFckzapF
         U9SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789464480; x=1790069280;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dwbltoz28/icpViL8WHNMds2UytK2mXXode9Ychb5S4=;
        b=0VsWnoIKL8FB1tLYCHjc/qoIymXH5fbuKDnE9bMw0NRrtBQg+RN3U2HVjWplLasFw7
         aUXK1xOHwxAHpzClIqid86cmgx4TpBLTH9gfxdChDRxCyO6U8/v7uWUeORxWPyG8ql8o
         Xc8KgACCWdfPYzVd+oFS8Nrj+Oo8pOv5Tkw2fyEkmS4qSCdNVQ0Lo/0YKG5n8uQn6pqx
         52uPtz6A+fTR/tJWtuWsF8/4I17O8ByxP2GCC3lFhkK9Rqks3FU/qb66wEYVlsR8BV0y
         MUlPIP6Kv5vNqDKZsijnSBePD8WxUWF1/zRyODYvpFYwzwZ1eEjJwCvjo2GAfLGhT7+y
         BhnQ==
X-Forwarded-Encrypted: i=1; AKwUvBwZj+8NsKzUz9L578qW97vzTVlU5JA1pZ4QPAa1s38tTO08XUoYHU0z315tGEeMakR4iJdqo3TC9zdSCbU=@vger.kernel.org
X-Gm-Message-State: AFuF++m8EZ03mZalHtRp0K5WfK/VREdQWV1Cf9Nt76fpprHP6H8mxux7
	FO7wBvQt3dvqVg88kbVhWUH1Ackwok1BnH4bPzFtlCDHboAHxVB0R4KAMoNeTf14Zv6lYAVkEmH
	6zyCtuzSFEoZGTB1ST0/uQNeFuRfWGsViOd+z0g83j2Win5/aFHhpnsr/EcsrD7ZvZk8=
X-Gm-Gg: AYBFou1xQp5xSexYtXsFitoiUga3kx6gFn8D1hrx5NQ89qHz7WhnZb/Cxa1mwGntbY5
	jMaXPU3og07Wjo4gBo9a/ULLUICFuFXMV20sAu6yVNf9WIBQ0nkQKHS4PY3giEv/vcCRM7L+CZj
	wL6cYCHzCMgYddioIaDl87fCHVa9y/aDxgk22+lPPZ/HVjzJoXJGoVSyZ2LzIqlXIt4y5649ilA
	ITVDNJIUG2Q4waJWnUflj/vk2qs+KApMTssCvKOoWYe/b5+7WzJLMh69WXvP+bO+h/lEAyw65Xm
	OtFooatSlCxW8WIUvhZwI4bl/8uKlaVc/eEV3hrlGD5USicqvGdnydq3E/ljtwvetgtYWyfHg+o
	MtuknnaqIhIBPKWkVTLnkNvtzdJeKgs2LrLbeiF2y5rXBodp4tfFntyd+Cfkq7I8=
X-Received: by 2002:a05:620a:1a28:b0:939:ff11:5338 with SMTP id af79cd13be357-93a29a14534mr962820985a.40.1789464479670;
        Tue, 15 Sep 2026 02:27:59 -0700 (PDT)
X-Received: by 2002:a05:620a:1a28:b0:939:ff11:5338 with SMTP id af79cd13be357-93a29a14534mr962818785a.40.1789464479293;
        Tue, 15 Sep 2026 02:27:59 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93a3f467566sm18939785a.39.2026.09.15.02.27.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 02:27:58 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Subject: [PATCH v2 0/3] drm/msm/dpu: Add INT2 GDSC power domain support for
 Kaanapali
Date: Tue, 15 Sep 2026 17:27:47 +0800
Message-Id: <20260915-msm_gdsc2-v2-0-9157237b8382@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAJMPqWoC/22OywrCMBBFf6XM2kg6rUnqyv8QkTwmGrBWM7Uo0
 n831q2bC+cynLlvYMqJGLbVGzJNidNwLYCrCvzZXk8kUigMKFFJjVL03B9PgT0K7zpspERtMUC
 5v2WK6bm49ocfZ7o/inL8leAsk/BD36dxWzkirZqwiU1bu67zsdVoI7mNNKHtjIkKrfK2hq/rn
 Hgc8muZOdWL7M+iqRZStMpoo1RQ3sndwLy+P+zl+3RdAg7zPH8AH0qKE/UAAAA=
X-Change-ID: 20260720-msm_gdsc2-cb9230027a2d
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789464471; l=1690;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=tS5jYHAOJiHwqtVjHphp88eu6y5+S+EodtZQBgori04=;
 b=7tl1t99L/eer1X7h6G9i0YVXv+uuiXjnDmBy1pJtQsinRKG6Wz0LgXvJ6daGyiR+PmRG70xN7
 AYrKFQ2cdNoCNBkvUufsDR+Gng9T4t6C5nSDS1KqOcHYRTUsWe2eYAz
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDEzNSBTYWx0ZWRfXw0xAvOOfz7QQ
 +oxVZXwxlMQE04APqzj/S72CigfxNETHT+tRUoKWd5asblX8mrduIQL4op/4MFkXWYDdBsSP/gG
 ArT2iQwf5dyWOoRmkJCoxf2Z5xHPG7nmjirjX00NInWS7qJbXxx/M8YqEsYU7bHyKfuGXcreHPh
 X1jt3DRHQ2mNBsoh+SDCRZz6fz8ZzvFtqG3ej9UY/I+J9kK4YvMG9e9rIoYexvws+o2Udv9EFiG
 a0A6511NS4jtYK4HftrSXmjLVAHmHPj6WdNzxmctwYEhXRx4TSX8XPy2UAuEG+MZNXw/cMjtyg5
 QZp8rQAx1JiLq2loZzicVghsjymfk5xpj3ngXHBH+lOp020X1r+flNKmEZEIbNrO9UZp3hwR0ht
 saFbQBd0ypHhSbptY8eB5eQ9Du2gz2VcP80cGYXfHRu89nLs9RxvVN4akQ5j0DBd5HVvVW4vWe5
 R36hoDxtlal2IyfWgKw==
X-Proofpoint-GUID: MNF_FvubVuu27uHhu0brtm1rqAygfQ-o
X-Authority-Analysis: v=2.4 cv=cqQOAF4i c=1 sm=1 tr=0 ts=6aa90fa0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=smZlIRouz1c8XS0CwesA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: MNF_FvubVuu27uHhu0brtm1rqAygfQ-o
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDEzNSBTYWx0ZWRfX0WtMJRKoajNY
 SqI1xVJvgaM1GjMopq2rTF2I5k4pPW+ED6qZKYzDwBFkvD56kW6oQG+Khc5cUkAlyoFPBqfQf/k
 rSzufABXi8jVVUlXJ40tsMAcZJNzI/U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150135

Kaanapali (SM8750) has an additional INT2 GDSC that powers a
subset of DPU source pipes (VIG2/VIG3/DMA5). Without enabling
it, those pipes remain inaccessible.

This series adds INT2 GDSC as a second power domain on the DPU
device node, updates the DT bindings to describe it (restricted
to Kaanapali via if/then), and attaches it in the DPU driver
alongside the existing MMCX performance-state domain.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
Changes in v2:
- Moved INT2 GDSC from MDSS to DPU, as it only powers DPU-local source pipes (Dmitry)
- Dropped Glymur — only Kaanapali actually needs INT2 GDSC
- Used if/then in DT binding to restrict second power domain to Kaanapali compatible only (Dmitry, Krzysztof)
- Dropped PD_FLAG_NO_DEV_LINK, let device link auto-attach handle INT2 as runtime-PM supplier (Dmitry)
- Link to v1: https://lore.kernel.org/r/20260720-msm_gdsc2-v1-0-4687866d6cb0@oss.qualcomm.com

---
Yongxing Mou (3):
      dt-bindings: display: msm: Add INT2 GDSC to Kaanapali DPU
      drm/msm/dpu: Attach INT2 power domain alongside MMCX on Kaanapali
      arm64: dts: qcom: Add INT2 GDSC to Kaanapali DPU

 .../bindings/display/msm/dpu-common.yaml           | 19 +++++++++++--
 .../bindings/display/msm/qcom,sm8650-dpu.yaml      | 23 ++++++++++++++++
 arch/arm64/boot/dts/qcom/kaanapali.dtsi            |  4 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            | 32 ++++++++++++++++++++++
 4 files changed, 75 insertions(+), 3 deletions(-)
---
base-commit: bee763d5f341b99cf472afeb508d4988f62a6ca1
change-id: 20260720-msm_gdsc2-cb9230027a2d

Best regards,
-- 
Yongxing Mou <yongxing.mou@oss.qualcomm.com>

