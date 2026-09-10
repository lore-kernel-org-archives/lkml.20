Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C864A4824
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 15:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789052828; cv=none; b=S54mHlosscCRPYdhaHSkDU6Y7rj/rSjSqZ3ssQF2CKHsEE0ZOnUI4aXNOXeot675nn26AfuO1uVwisJ7TMGe3YxE97LiXlFNjjaoZRm9nAEI6RnwRovId+Lnqo55Vlnzohd5AwUVqjd5DsTTTD2tzG+Eb3b6lBsWmIXLlUJ+F+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789052828; c=relaxed/simple;
	bh=7s56hedfMt6xo4EtMYvPtFK+eE/DojvFLwBrjurDfgg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LTJoZQGYC3NG6GuR/Burz3QfUVTGAkAgOomX0zIT8JhGf55mpNBbSJAcKVzke1znBGlpQMt/vjj0C3iuTZxHwC2HDZc/uQqq/9GxNWl3hRTw7DOHNVTbMgIV+jTDJvLg4LxskyR0ppUwhoyGqKz3UgeX1JoiPXYot73gALAl8a4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oOPVuXpz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HxjBvlM9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oOPVuXpz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HxjBvlM9"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AF4lHV1652851
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 15:07:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=s87bDm459gzFOj55oDZI3A7T6XGhO6ay/8B
	4TZ7cexo=; b=oOPVuXpzV1mOZi/o4eiInvoL/TLHpIiFFXLW8ANoiJHIfMn4PM0
	vNmYnphgurjB9AGFjiZ2x8tJDUxJfvZlnv4GRGK5Hqvckxh3+kZoBpLdakWPXh0v
	tOzJNHwPwrkAkkCaQih/qekHj2MGC1tCEyb+huXs4nmc2czUhqcxsWkBs+TkL0j9
	fWT5hoGwFc9+cVAouPX9YH2nnVe1mI2nsjcWSVJUTn4WnhwAuB8Z3sMzYk8haNFp
	c7KjG78e6juZR63WifRLhzQlLxMfo/6HScdDMGi1woAu46qM84kx5RTopnkpwiZI
	sFi9UfNLMsm14bbMgZkwjEmK9kGI5K/c7hQ==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkrcjt10a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 15:06:59 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4a45b3f0bdfso10985573b6e.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789052819; x=1789657619; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=s87bDm459gzFOj55oDZI3A7T6XGhO6ay/8B4TZ7cexo=;
        b=HxjBvlM9Ai6IJBN9xXFB4xzt3zkQDS0QZuzsqkERL1Of25U87uZ/NjeLJioXPUpSC9
         256B30C+B9WPekiIOiPIvZNhT4oDlSaY8bmO60morGvlKq6kscJ5MGVyt+M8HTB2/PYj
         8zibqlDGZSnq7STN51t47iWBrqNr2VSi7QNjMhLaUHeGnOj2AmX+5H9dEC/ULpq2ULNf
         0qiCq81EOTCw90ug97wMkMA8E0Ucn2GkfoRM2+HFNAIZSiLitnFd4xVhiD3052Plrkqy
         mn9O8TmT5UGz6vqaF36axBGYd4eoZ+atXivbpGXGaZRF965jCRjKhD16+VdgFnMJGN2Q
         MrbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789052819; x=1789657619;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s87bDm459gzFOj55oDZI3A7T6XGhO6ay/8B4TZ7cexo=;
        b=CqNOA0WiKZ6Y/RGmxCBZBwFsoDKYLoBlctCpc8mkdQU1CfGZI6z6PAx6VRRaB40X5w
         LpxpDmY6IEERoXtpgoxyTbYyDCmIAlMUsDro+EEwUkZYjys2X3c06+i3wgYH961+JoMT
         UDOMsEYVSOHqfqk/5SjNCOjfGZvAtwaH8C/Wr2me8UdjvrXtRVTWjpWiq3d7ncY8RR2x
         b8UscOM377r/+wRtHCXXLJ7rfTp4wRSSwj4qKNQZ9afS2mh7R2UJ8tAxhQJ9fnBZDDEB
         JOUFY4iYb903x+WS4mn/ixvLt1IxWGLiCXbDGJtCFX9uSeoyMvyuYHwbR//nkM4/cueA
         wsXA==
X-Forwarded-Encrypted: i=1; AKwUvBzeVjboUuC5wdtLXbJboctTNjKdecmqXOxE5LdWty7GTbjGgZjPzG+8JEsZIAU/aWiD5dxD9sOTcQEAaR0=@vger.kernel.org
X-Gm-Message-State: AFuF++kNwc9DwfnJrpAefdnx6bJUoj+qxnCUxFgf1wEdXBkujVPVJotf
	Ic7ZHhFFswv+INaNIkOANI8LCU7tI7WUZWnrsHPDYxKoJdfEShbT84Umme+mEpl+V3cNP2bGEcS
	7un44kbIYNiAWpi44OXESSeg8gWTT5h6XefOOICN4PPSPqdDJA0spUvMnuLsMX784MEg=
X-Gm-Gg: AYBFou3J3dGfHp8bMm7qAcvgxemkhXlnzIQgm9KhYRFELVnWGp2bHE6M7Qj0jEHSCUs
	28dQukB3xBf+q64YqDh3mpP1RLeV9LtkDBxG+aZRGbmP7WxXAc2Gk6zgCE8dA7tjj6Phqj+2f2R
	WiWzfVJfj8v1VgGSpddxL1gzYweUojN9U6kaE5osRcSIt8rRzi7+6T8+T82Bj9Cq/cJkS+aJUcc
	a6F7NUwXSstjUTZRHdbwyVg09YX0CdHZ1XidCh+pdpYRSCaHGKoCd7Y1keBgQaS3k5bfIpNBHL2
	PAmu4325BVhYAoTHQJSQKZPlS2S2S8/y0/QHxxvc9wFZuv9oFVhZ0hGL7Wo7EyXMb2ySwudw71X
	MV9JNFcyGaT0gT+rLcOoIxOwmUp0=
X-Received: by 2002:a05:6808:138c:b0:4b9:e65b:8c38 with SMTP id 5614622812f47-4b9e65b9bb3mr22963810b6e.38.1789052818904;
        Thu, 10 Sep 2026 08:06:58 -0700 (PDT)
X-Received: by 2002:a05:6808:138c:b0:4b9:e65b:8c38 with SMTP id 5614622812f47-4b9e65b9bb3mr22963757b6e.38.1789052818390;
        Thu, 10 Sep 2026 08:06:58 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b97167bd69sm19340773b6e.13.2026.09.10.08.06.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 08:06:58 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v4 0/2] remoteproc: Hawi CDSP support with per-PD proxy performance states
Date: Thu, 10 Sep 2026 20:36:36 +0530
Message-ID: <20260910150638.3270162-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE4MiBTYWx0ZWRfX+45jVePZIi18
 yzmiNRz0T7iOLD4hcHg77uFXbrGImoDF1gmbtzZDCxRlj2G4wIKXSDdTgFrdA8OfdAb9Q3xsZoc
 xkwLFjgMh8PrvUAba5gNNKtMmWyd3fE=
X-Proofpoint-GUID: aZroYJJXwIN5YLNkyCt3Rt8aPyiIDrQQ
X-Authority-Analysis: v=2.4 cv=aef0Dhot c=1 sm=1 tr=0 ts=6aa2c793 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=d7F-YeoA3MF6pYcQ2v4A:9 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE4MiBTYWx0ZWRfX+fTF3HLXr4CW
 m6PIdjzZuNEXxJ4mLlX7bXshSE2zocdC5Bp3OyoxsT83OADFcl02loBrwwHoU5YC4AOxr31Br1o
 ioUL9Ur+/7R3NG9cDyZPyAiUVGAcIqWp8carq8BPdDKIsgsdqg9+k53/1L4iI3KMfpZ4axT/OTZ
 CAlVte9aktui7AROVDPnMY3PyNG51QGyYXEZKY9icDYG21orI/gBKQ9RbRciIQ6+KgvgyWDasmI
 BOFnBb76TKmevUeYTF241DYTSvjNcklFslRtAUHwNIoUHbf5QiiQRF4upf3gwTg39qQAmpErrJe
 umWuP+/4XOtCUKz4JcrIkXvelUT99XKD2wKC30sAQjSIGvJXM15mjKuKYV+XQ5RJqHtReKiDfy0
 ZVSS8Qpcy2Gppay9vm8M0OH++Z2BcJ/GXOFWh9kocfkb9SFBB1jymeek2R2JQT1sPhyL+y+BDPm
 GloFL42yrayx7vDAdjg==
X-Proofpoint-ORIG-GUID: aZroYJJXwIN5YLNkyCt3Rt8aPyiIDrQQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_05,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100182

qcom,hawi-cdsp-pas was initially grouped as a fallback to
qcom,sm8550-cdsp-pas on the assumption of hardware-level compatibility.
Bringup revealed that the NSP proxy power domain on Hawi requires a
specific RPMH performance level that the sm8550 driver data does not
provide, breaking the compatibility contract the fallback string implies.
Maili CDSP shares the same NSP power domain topology as Hawi and must
fall back to qcom,hawi-cdsp-pas rather than qcom,sm8550-cdsp-pas to
inherit the correct cx/mxc/nsp power-domain constraint.

Remove qcom,hawi-cdsp-pas from the sm8550-cdsp-pas fallback items block,
add it to the standalone compatible enum, and extend the existing
cx/mxc/nsp power-domain constraint to cover it explicitly. Move
qcom,maili-cdsp-pas from the sm8550-cdsp-pas fallback to a new
hawi-cdsp-pas fallback items block; it is covered by the hawi
cx/mxc/nsp constraint implicitly via the contains check.

---
Changes in v4:
 - Dropped 1/3 patches from the series as that seems unnecessary.
 - Added maili cdsp pas as fallback to hawi cdsp pas.
 - Added Tested-by tag.
 - Link to v3: https://lore.kernel.org/lkml/20260909105049.1317985-1-mukesh.ojha@oss.qualcomm.com/

Changes in v3:
 - Converted warn into failure in 1/3 as per review.
 - Added R-b tag.
 - Link to v2:
   https://lore.kernel.org/lkml/20260902204334.2061226-1-mukesh.ojha@oss.qualcomm.com/

Changes in v2:
  - Propagating the err dev_pm_genpd_set_performance_state() as a
    separate commit.
  - Added a binding correction for hawi as it  should be
    standalone one instead of falling back to sm8550.
  - Add num_proxy_pd_performance_states count field with a
    WARN_ON in
    probe to catch mismatch between the array size and the actual
proxy
    PD count at boot time, returning -EINVAL if they diverge.
  - [v1]
    https://lore.kernel.org/lkml/20260828181311.4038346-3-mukesh.ojha@oss.qualcomm.com/

Mukesh Ojha (2):
  dt-bindings: remoteproc: qcom,sm8550-pas: make qcom,hawi-cdsp-pas
    standalone
  remoteproc: qcom_q6v5_pas: add per-PD proxy performance states for
    Hawi CDSP

 .../bindings/remoteproc/qcom,sm8550-pas.yaml  |  8 +++-
 drivers/remoteproc/qcom_q6v5_pas.c            | 48 ++++++++++++++++++-
 2 files changed, 53 insertions(+), 3 deletions(-)

-- 
2.55.0

