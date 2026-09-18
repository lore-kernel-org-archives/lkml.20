Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31DC3DAAC0
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 04:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789705745; cv=none; b=FVhd5C9iEUCJ2tR1A6xr1gCi4aY47XPmy/BRXEjb265Z0E8hf/9p4vJvSZL4ricg7w6cSWWk2BH5yWARyIgZWkgXGgOqwPWapL5LcpkN5M4vCVwDxu2A5lZHqtYX/cfMy4jQuNFNQU5nkfwcwjSLeaYQdwyd5EIRLGlhBMJ0eCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789705745; c=relaxed/simple;
	bh=fkshNoOWORxcvxgu+mHBvzKLk1LKeo0M93slrqpG66Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uaqkrN7dbHY2gy/u4mP4wXJVgXRFgCgqUX5BeEocmoRpfsRvDKMhwQ9NUHn5Kj1BTbDZml5c7IyfUpDp90ABn/Ud7BZRekZLbdRSrESRYV1Nm9jd16R++Ce562EPXZaCKdBerDpH1gUG0GReHXQhYkdx/g6Cr4rm4FnKtnjd35o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i2B7M7XQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fyhUATJU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i2B7M7XQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fyhUATJU"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I2VH5t3947595
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 04:29:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=YQYMUwldQNeOArNPJiMgPQ
	AymRC/XtF2MwaCIThFuCM=; b=i2B7M7XQQCYESnmSdWoJdsNEwlz4cj3YndyRxa
	kCgNFmUx/m8eVUSkGYQcSk7giLievmqA1RXX3fIp3oUy6Rc4tb6fLnOHEFr+QXJf
	cEWr5ZrjgSfoOy6yZzIGuH9aV+J4fVosBOSkZWPdz2/1ch23U+mBjukSaOsAHsE/
	cdnAAVbH2AFf8kbSGxg3E1vHhp9TyBGrltEuzx3lQ6KQpqiFA0BfHThoKOPIVejY
	w1ksgBb7EDsYIPXTwuUsO5aUTntw/DWHdB+/fRKjD6kp94KPID2GnzvCG9cKILwa
	ECIIJ1sHmvMs6b+vEKWsm7Oour26p+DEAWNXbEjLBVVtRm+w==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grfppm2gb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 04:29:02 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc1ca15334cso339041a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 21:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789705741; x=1790310541; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YQYMUwldQNeOArNPJiMgPQAymRC/XtF2MwaCIThFuCM=;
        b=fyhUATJUZH+F2/im/IogqbnuVlNKptjuYKxvZ9iMUq7UD2NFOvTA2uRGI9ishXCmxt
         E+lsQBKhPZ1/1IPgs4PcasuF6Eztp7PEWzGydeMoDyYLnWFRNfl9tNSxG18Xu+9PiTDf
         dWs4Rg7kiIAoLTDpGf/vWP6ni03G7YsqdRA0y/4xeLQgtwc41zMpgrTKIHfT1Udwnjzo
         9PqFEg9+ZnlPAEIxzvkR6QaNdvTnkHTVm5g3MsMi/imhrp0wBrcjrSS4bR20hIW8icvT
         ka73g82ZEzBlq/F+1qmBJQ05a3Yk632PMqgDRRGZQgEcAIA7UQnF9sZAA/zdDxuRRkfB
         N9Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789705741; x=1790310541;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YQYMUwldQNeOArNPJiMgPQAymRC/XtF2MwaCIThFuCM=;
        b=HOcWNOz702QRrki9uvjfOFWm57m3mcVmF2pgODWzA3bcXQj3xcE7I7ScUMgnXwfuSx
         fTOoMT01vVtV+D9NKsduoWZN3f+o7m3JWpPK7MQpi9j8R5BsW39Jsu8SBKiLBpeerD9n
         Te8xXEXCOiWoSS5H2ng0uFbPjS1dPOtSyoVHNWIKXTYBDQCByR2iqaYNAvj/eshADi66
         Y1Ze0W5eXe81DZhooFq+wUKxHPbWYritZST+9YLZNty74ETE+lLUY7kY64x8584sfIqn
         9EVBkjzT4F4AXgkAm2+km0Mcvwp+I9QT2kt4EYX5dP3Z0wdUTjrzYT4LTYPWyb0NXhSe
         1Ltg==
X-Forwarded-Encrypted: i=1; AKwUvBzDBqOH9MRk1WgKFkRScdLP8h4kOymEuqStIjmSKjHXlnmPUGiiuS8CkGVp4juwLOHc07Ru8/rt+LLenzs=@vger.kernel.org
X-Gm-Message-State: AFuF++mFQvFS6dueZYfx9KQMWT1C15V5HY7Dq/G+aqTjmxAEOGpufPBu
	xI6u5ZpODqHMIkd9gjU8jYWcq+5aF8hTenBySCBHSDEAZ9Bx/H3CxMmTYibSBeSUUgM3eWzR8T5
	pCP39yJMR3A508SATcIzQXcnJhJYc9yWMdMuv4AaaHTtPAWHAdpV4UslprgdY19ixmac=
X-Gm-Gg: AYBFou3BZLhgUSusrnUa+7spcJh/24cp7SNwg/lLBQFF0OdNLDa+Aext2Z6GiJ5keNF
	E0ayxgLtFU3Sf8IVgGqlRWmhxClTYyVn1ionhAA3mnu5QQs6T/+1O/QXY3a2WS4f/Mqtpoe2n9C
	GVCP2NzVzaodpcAh+Qjb7rrffNCravTgOETFtFQIyQplBHyoPneFIw9Pl9tfeKh+q62iZRcv/Od
	20Bh+J+Vt/jGuxod1CFaBYs8e3jZYlwwM7dSKwK13A8lfLva9INzN2YrxF/nJoq/p6m050/30ra
	S1DSsnUT4b+p1Czd06vQyBGnwf64+YecL3dGKQLVnONKc+Lj0HrHkozH2ie1Q5C0i3QgKcXUJof
	10zytcT9ZilN1sKkb562ptM3zyVR6BG4=
X-Received: by 2002:a05:6a21:b8b:b0:3d0:6c90:5a33 with SMTP id adf61e73a8af0-3dd8c3fdeeamr3090688637.4.1789705740826;
        Thu, 17 Sep 2026 21:29:00 -0700 (PDT)
X-Received: by 2002:a05:6a21:b8b:b0:3d0:6c90:5a33 with SMTP id adf61e73a8af0-3dd8c3fdeeamr3090653637.4.1789705740435;
        Thu, 17 Sep 2026 21:29:00 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc5c4dba322sm214595a12.10.2026.09.17.21.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 21:28:59 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Subject: [PATCH 0/6] media: iris: add support for hawi platform
Date: Fri, 18 Sep 2026 12:28:39 +0800
Message-Id: <20260918-add_iris_for_hawi-v1-0-ac60fd15c98b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAPi9rGoC/y2O0YrCMBBFf6XkeSNJOiZtn/yPRcqkmeiAbTWxX
 UH8d1Pdlwtn4J65T5EpMWXRVU+RaOXM81RA/1RiOON0IsmhsDDKWNXqRmIIPSfOfZxTf8Y/lr5
 uKICjaCKI0rsmivz4OH+PX050W4r6/j0Kj5nkMI8j37uK7N4hWECPjavjnjDWAzZGe0ugtLUOo
 DXBbuqRcsbPpq76XwRyvS49F9mWK5ZNU7jwdJIrSCVb3yoH6OoB9GHOeXdb8LK93pUQx9frDYw
 vXDACAQAA
X-Change-ID: 20260918-add_iris_for_hawi-b38ed47ef2f4
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789705735; l=3209;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=fkshNoOWORxcvxgu+mHBvzKLk1LKeo0M93slrqpG66Y=;
 b=dSxM/5fhj3haOh/4yq1Xy27O407JZTsrp/i6769SprQXpCrNFNL/0dsKM5ovTxG1LzMk/ukJa
 r35Ks89FEpcCbTAKyX3vSZDz3ImHAnSk71ho51og2rspnzNXwiv8sbL
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-GUID: dxy6g-wn6RD9_yTOGtCuD9zbMJtX-jjD
X-Authority-Analysis: v=2.4 cv=YcYodARf c=1 sm=1 tr=0 ts=6aacbe0e cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=RPeHkEnTs8eby-NZ5DgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: dxy6g-wn6RD9_yTOGtCuD9zbMJtX-jjD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDA1NSBTYWx0ZWRfXxGxNScVqS/qo
 0mUeBdharVjpBmSnro1KGYOKl7h8UQkfgTFuLz5K+fER/fqxxG3s/DJEE/GA7VGbSnKd2ZLwQge
 5oVyDPZ5mwbuN6InVVt97g8z5KVClA63YG3cXgIpld/PGb1AnPhO8KvIGuVRNQzV7rikjmqz/Us
 l1ZZxNL0MOpI645Xbfsi//S/Q4pzxduvrWyeNaTIIx9qWDL6MlUaZ7vjlk4IiZX6ubPCNFNL5/9
 pX1Ta0id9q4ht5PoxdQB6tutw2T+B/CR0e8mQlt2q6zIjgVCXHbaGN9XH0OBUmV9D8pEhZV3K2e
 NCWrolmeQ9GNSvEGe48szmQAAHph9iKOkIWt8c5Az4jvo4UgMBwF5pBsHfRSGu6jNnvrw03qSw2
 oINLx1JTiCjCbNdqyCIeCGHPZYWIpsyGbbxGmwMOBREDhTlByL7B/8Ydei+lh0jlVRIYsRqeenX
 EfEHEceN0aYynIR8eRg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDA1NSBTYWx0ZWRfX7buAZYOXQIXO
 xvh7dz0Kk3N+2SfBo8y1bxl0gQcVnuqae2xUpeRiewnbdDNv0MX35Kf36KFeUvigWr+KkP3IdSL
 PBNryFX28YTNEt+71vla1gZFQM+OzL8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609180055

This series enables the Iris video codec on hawi, allowing hawi to
use hardware‑accelerated video encoding and decoding.

Hawi brings in the new generation of video IP i.e iris5. When
compared to the previous generation, iris4, it has,
- additional power domains for internal NoC(cx & mm).
- additional clock for internal NoC(cx_iface).
- additional power domain and clock for apv codec.
- different reset lines.

fluster result:
H.264:
Ran 77/135 tests successfully

H.265:
Ran 139/147 tests successfully

VP9:
Ran 235/305 tests successfully

Dependency:
https://lore.kernel.org/linux-media/20260914-vpu_iommu_iova_handling-v4-0-9b9074a73c41@oss.qualcomm.com/

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
Wangao Wang (6):
      dt-bindings: media: venus,common: relax clock/power-domain/iommu limits for Hawi
      dt-bindings: media: qcom,hawi-iris: Add Hawi video codec
      media: iris: move shared APV PM helpers to iris_vpu_common
      media: iris: add VPU5x hardware ops
      media: iris: add VPU5x internal buffer size calculations
      media: iris: add hawi platform data

 .../devicetree/bindings/media/qcom,hawi-iris.yaml  | 262 +++++++++
 .../bindings/media/qcom,venus-common.yaml          |  13 +-
 drivers/media/platform/qcom/iris/Makefile          |   2 +
 .../platform/qcom/iris/iris_platform_common.h      |  10 +
 .../media/platform/qcom/iris/iris_platform_hawi.h  |  48 ++
 .../media/platform/qcom/iris/iris_platform_vpu5.c  |  86 +++
 drivers/media/platform/qcom/iris/iris_probe.c      |   4 +
 drivers/media/platform/qcom/iris/iris_vpu4x.c      | 109 +---
 drivers/media/platform/qcom/iris/iris_vpu5x.c      | 588 +++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c |  93 ++++
 drivers/media/platform/qcom/iris/iris_vpu_buffer.h |   5 +-
 drivers/media/platform/qcom/iris/iris_vpu_common.c |  91 ++++
 drivers/media/platform/qcom/iris/iris_vpu_common.h |   5 +
 .../platform/qcom/iris/iris_vpu_register_defines.h |  14 +
 14 files changed, 1218 insertions(+), 112 deletions(-)
---
base-commit: e657a464aba873f5eaf3ca821b6e4016674492d6
change-id: 20260918-add_iris_for_hawi-b38ed47ef2f4
prerequisite-message-id: 20260914-vpu_iommu_iova_handling-v4-0-9b9074a73c41@oss.qualcomm.com
prerequisite-patch-id: e1330b5a848460d14cd6574877fcf607d269d9a1
prerequisite-patch-id: 20d099e89443a097b9ec5b297f0129d9874ca54b
prerequisite-patch-id: 2a36ab03d78d8e9c19c900e203b05739a9fd1123
prerequisite-patch-id: 9e326a273e052af2b63300dd20f2fd6cc78dd5ac
prerequisite-patch-id: bb9ca73889bfca249029efb854fb1634a4360b5c
prerequisite-patch-id: 9e71460e2d5f1e4e2993819f4d9fa27c076946f1
prerequisite-patch-id: a2b127d41c7133ea30721a72eca01333334844f7
prerequisite-patch-id: e34741f76b6919db19236ead27c966b789736e66
prerequisite-patch-id: 359d24229ad496633892e70b1cf88c2d88dfad24
prerequisite-patch-id: 6e2e9069cb620143aa305b7b29b8b1982dd0648b
prerequisite-patch-id: 3e5fe6ef2271be5263a4bf7ffbd77b0996037b27
prerequisite-patch-id: e051524017c9f39f8593fb9d2e982e6a4c39fb35
prerequisite-patch-id: 1b4863f7a7f3a8390c825d76805e8e99de97a2a7

Best regards,
-- 
Wangao Wang <wangao.wang@oss.qualcomm.com>

