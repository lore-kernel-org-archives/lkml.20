Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2AB9388E60
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 03:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790134101; cv=none; b=jDTQCtIj6oUOBPgfhnEwwoVyNOxi9+o2Jn5wUnl/9Q7YExIwT+ng4YYCLUCjRUr+RSXVgk7h65pgfhhhkcFr6YPob+qZuqirg7uruEvblE8I43qhIUILBeMzbVZ3ipMDJsCAduv13aTdwRClUDjBmn3NmV5wEdklv7JHfqk0DTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790134101; c=relaxed/simple;
	bh=zxhGJSHiGIeCebzdJ0LixXPiFS0l/DfRsu8DA8EwrRI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jP5PcuXQcgd0RhrPrhDcJ00UNptqSl+//KqhRjskz/LPvTV0GY5WId1rKNaMKtbzmJcBRMskwUxdDgSl/oc7mKcxSOsXeEkip+X+2J7eAWTwSLXoonVMMPeuWzJEGtipi2iQkYeJ4nKsUJh5kGe0bCXCznU2wyjdUsx8zwvb2gM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kTFABAt5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K8HsHXPN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kTFABAt5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K8HsHXPN"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MJBiwC3897608
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 03:28:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=jewBqMO8HF/TWwiTuUXnGO
	8ueYXAmR4fC6wIuZof/MM=; b=kTFABAt5Y1NuR7r+JCUHZHSkNsugcRMQWYrPoG
	t/R14GuIsWLsU7GHBVabrMs8qG1wcadUqU/JiiQLtY3xqU3tiYqyWrpZNc2ixWDn
	glReCxZL87A3PZaMhNQ+CpMmZySpWKhmetQrw5D/FILiucYYt6x5YRlXPugzcwlb
	G1YvsxWLfD7+iBZYuuR3JwmCKoow4Db8YH8TdiWLn164NJ/ppK1IpJ9Pa6xt3TvG
	CQtOxm7uFCf4r0ANzVIczCGGtv73r7qMoqJg/AUGfPHwOolo+MsVSi3ba64kl8+O
	gcb5w4Wm9KF/YJ63RniwfI792HeQsiiTC8hCf0ew92hjAvPg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guyma1s3m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 03:28:18 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d63bad3d09so5224975ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 20:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790134098; x=1790738898; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jewBqMO8HF/TWwiTuUXnGO8ueYXAmR4fC6wIuZof/MM=;
        b=K8HsHXPNLu2koEfqoJxSVerasDeGOLBavg1ZldPHxsMo52GJPFLjSvHOZhgQVMM1/M
         RDZAythDw+1mW++wqJGOLxevywF3hLRrCRzRZFi9Q7mlehMsOi6WJbSi++F/Q25bMP6J
         6hzqDAnG1bGtlE/7gXYpXwdmUpGRrcvNjhhdEq6WOs4arAhpCbDsT+Slk3r6GsoAbLDQ
         GON1Q2XWVkOOODa1D0+Dyc7govAWwrGQZqPWP0+9cViCeXA2T6LhtUTbPfhZhR/zahs0
         kfpGfD2/dOw/7QoEggtvLbq/x1s1pzu3RSyc8B8KCH51YmEAd9leO3n5B7brzMiHSKGw
         r1Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790134098; x=1790738898;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jewBqMO8HF/TWwiTuUXnGO8ueYXAmR4fC6wIuZof/MM=;
        b=GKsU9xF8dCShCYIGmoghDeZw6Lw4BmgNGDoT62qjYKLS2BFqE0gf+MOnqfhoUG5i/l
         iodIZN0EcDfD7kzsA55QymPZKtRnM30hDxCGUbtcHf4tIonIo00wElpgRgRHNbM0wLnj
         Dx9tGTYn9eA6FDXQAadWjTQNt0Y72FTWFOAhiFPlMPFQqVu0vLxb0W/0nEdKbBNzBQsF
         HUmDIRwgxGrv0+Gx9RKtxbKYiqmMHfLQmtpdEoPmOEWUH2PFveROF0XoDnDhn0YUC35/
         8XvbUsNe3BjCd7nGb7dEc5unVwY7WHpXItStigVwrMMRpvXbtIir9w/HvDmes+KKwbh4
         z+QA==
X-Forwarded-Encrypted: i=1; AKwUvByOu/nbeIJKUHvNHGD3Vb3Zj6xB+yT7bI9tL/W4MFLEfLXal9/47WNidFcIi2Iwv3+aqQTW412VpprXxEg=@vger.kernel.org
X-Gm-Message-State: AFuF++mTky6ziqST4CqJX0Cj3GRuPrhCs7+Y697vv97WOoQMXyctLtvC
	YpXxk6ogXUe8Tqcakls02A18HBjb4d+G4zA+rsFaHmrZW6WneJuCQa56d6N2l2WdsDFnnPUqwYb
	fDqVn6/NHfB5QMl2p4qcfHYn0GWoAdzrt2+Ntk6QbnlNk9a/4VdovQmaOpcCUoJEu1MU=
X-Gm-Gg: AYBFou2XQK6Va13XtsQ8GF3tbBVPh7TLZgCcFAnUzr2ILUP3lrFmzqbMgGHybfXfpxC
	eV3tyBrs7+0Fe/WldmHcLOjKiwIE2VL5kO6OYr+Xf9UrsppWE3T5Z447zBbDSkrOWAFOBluRr8f
	DQz5kZ2RMH+jrFeE6UWxhOcRM6lpY1TSkVwt/jbTJ6juDLxlXyoWZGUsSycn+5T/txrbCcoZrxY
	5RBysUK0wQC3TXMAe4PM5jH1iMlK+OHoHkLFJa/WvZbE6p7FJjq/iFEyaNOooPPil2VOLofi4eY
	49uoLlJgqsU0bQnqtWIRfhG1phiMpY8ch7OXayct7uQkfygmqdpqOzv/xzVJSNAx6o2aeR+TwhQ
	BvlweWocaldtnBbxJFve1C2vHNHKux5Ux2L8s205wxHMDGzdPKu+c2+vtiF9RZWLF9/nMH0ESFQ
	==
X-Received: by 2002:a17:902:d48f:b0:2dd:c053:d73c with SMTP id d9443c01a7336-2df69dad802mr11725185ad.35.1790134098005;
        Tue, 22 Sep 2026 20:28:18 -0700 (PDT)
X-Received: by 2002:a17:902:d48f:b0:2dd:c053:d73c with SMTP id d9443c01a7336-2df69dad802mr11725015ad.35.1790134097542;
        Tue, 22 Sep 2026 20:28:17 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5c3733sm3603525ad.41.2026.09.22.20.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 20:28:16 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Subject: [PATCH v2 0/7] media: iris: add support for hawi platform
Date: Wed, 23 Sep 2026 11:27:50 +0800
Message-Id: <20260923-add_iris_for_hawi-v2-0-016ec3d24b79@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIADlHs2oC/42RwW7DIAyGX6XiPCowJISe+h5TFZkALVKTtJCyT
 VXffSTZZVo19WLJSP74/PtOkovBJbLb3El0OaQwDqWBtw3pTjgcHQ229AQY1EzzhqK1bYghtX6
 M7Qk/AjWicVYq58FLUuYu0fnwuTDfD2sf3fVW0NP6SAwmR7ux78O022DTVZo7W5tageaVY8ZVq
 pHCaykQUIFA7yWb0b1LCRenorgaSZovtzYU2FwzFqfBnsNwpFlSRrXRTElUopN8P6a0vd7wPH+
 9LeU5EgRd9rITvYxpopkXjpNcKmFq0I15lQO0x3CeQWmFYAeGG1Ubb/XrMr8SX4kZCk0BCFWyF
 4LZv7Q5+VNI0xi/luNmvkT/zx1/FGvmLa+6p3seHo/HN8oIEBEzAgAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790134092; l=4880;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=zxhGJSHiGIeCebzdJ0LixXPiFS0l/DfRsu8DA8EwrRI=;
 b=tHFx8HGNOR7UyomhmLD4Y4bt1hIKwr9sd43j38jVlJcxPm8Ac4X1vZlS6ON3R0MHEE1IZszaI
 LZ3qUqRrdmwAc2SeJlSvQWeqN+FnEf0aeJIUPXK6F3pKPXs9HPKuZMP
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-ORIG-GUID: -xpnTJ3xP7QVSbO3cjMGpsIzDs_SDjOe
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAxMyBTYWx0ZWRfXwA3fAwmFQiJ3
 pXs3Lmx0Cz0cOAwrSdgpkVNN6iIZ9hy5LT3fG5B+kGC04gSb5fXcVpwf18d1U60aCVbcqVtB03A
 eod3lp93JpXjfWIB4qehIXWk5f3v3Bk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAxMyBTYWx0ZWRfX2FFuRMhbgSYR
 f8fzqzuvHAB6Wt2/qtdnoiFyooD9/+FA2aCabcpj7qJQRZ5flkVfZET724vr9pjWRkmX3tF0f96
 VkEIPzJL8GdMCH45oXwuooIl/ZmZeVXA6/sXZCRm88i5NUq4WZQKyS79v0TfSBO59lkqD/7BX++
 DcStOdwmhXu3hSut5UgzW/ItqNAqdg4mJHUEW5w3zfAeqyoOjJoDitg4BcuMREq9zRpoxg3LSO3
 7AVJUjDuNq92Q9ytdFKeU9tOv6iaIuMzvc4m9O7jmU/5uFrpzH5L8uYz70aNcVuf9j+eA3E0cT/
 OlH0z0U4oi+ZeyVEQB6F4XNb32rFVSnWseKloUAilHgcigqVA6qyxz55Qclz5OWFBcwxz7cY1MI
 bMtmnYx/UT3iy6Kbj/10RiAuxn/fhNRlHQgUAFXyIhBNYhId1MjpeArKUZD1ISW/HT5nx2UgqNB
 bSMz6M85/HxLPAGaWzg==
X-Authority-Analysis: v=2.4 cv=N828hG9B c=1 sm=1 tr=0 ts=6ab34752 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=nAo3HMRzd8Hqs_UDLvUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: -xpnTJ3xP7QVSbO3cjMGpsIzDs_SDjOe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230013

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
https://lore.kernel.org/linux-arm-msm/20260923-hawi-dt-post-v1-0-e41473b6298b@oss.qualcomm.com/
https://lore.kernel.org/linux-arm-msm/20260923-add_iris_for_maili-v2-0-7223738e330d@oss.qualcomm.com/

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
Changes in v2:
- Add device tree patches.
- Link to v1: https://lore.kernel.org/r/20260918-add_iris_for_hawi-v1-0-ac60fd15c98b@oss.qualcomm.com

---
Wangao Wang (7):
      dt-bindings: media: qcom,hawi-iris: Add Hawi video codec
      media: iris: move shared APV PM helpers to iris_vpu_common
      media: iris: add VPU5x hardware ops
      media: iris: add VPU5x internal buffer size calculations
      media: iris: add hawi platform data
      arm64: dts: qcom: hawi: add iris video codec node
      arm64: dts: qcom: hawi: enable iris on mtp board

 .../devicetree/bindings/media/qcom,hawi-iris.yaml  | 256 +++++++++
 arch/arm64/boot/dts/qcom/hawi-mtp.dts              |   4 +
 arch/arm64/boot/dts/qcom/hawi.dtsi                 | 155 ++++++
 drivers/media/platform/qcom/iris/Makefile          |   2 +
 .../platform/qcom/iris/iris_platform_common.h      |   7 +
 .../media/platform/qcom/iris/iris_platform_hawi.h  |  48 ++
 .../media/platform/qcom/iris/iris_platform_vpu5.c  |  86 +++
 drivers/media/platform/qcom/iris/iris_probe.c      |   4 +
 drivers/media/platform/qcom/iris/iris_vpu4x.c      | 109 +---
 drivers/media/platform/qcom/iris/iris_vpu5x.c      | 588 +++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c |  93 ++++
 drivers/media/platform/qcom/iris/iris_vpu_buffer.h |   4 +-
 drivers/media/platform/qcom/iris/iris_vpu_common.c |  91 ++++
 drivers/media/platform/qcom/iris/iris_vpu_common.h |   5 +
 .../platform/qcom/iris/iris_vpu_register_defines.h |  14 +
 15 files changed, 1360 insertions(+), 106 deletions(-)
---
base-commit: a8c591ed6b672915e0be57843f943a2a723aff40
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
prerequisite-message-id: 20260923-hawi-dt-post-v1-0-e41473b6298b@oss.qualcomm.com
prerequisite-patch-id: 239c169e15da44519b2dad09ecd92f0052757929
prerequisite-patch-id: 6c586be864944bb1eed773e8c211b898bb1289fe
prerequisite-patch-id: f3d8748ccdb6760563f3e07f701a18388a9408ed
prerequisite-patch-id: b1639353868bed10fd3cbfcd01cfb88b7e737ead
prerequisite-message-id: 20260922-maili-dts-v1-0-ac2b1b76bfd9@oss.qualcomm.com
prerequisite-patch-id: 36f12c16bf9cb0411d8be2f396407c724162189d
prerequisite-patch-id: 28ede1ab83d4b5b56423ebb09bae74b6599b3bac
prerequisite-patch-id: 6b3e28c55c07bfcdca8bfa9219fa0c6c763c6f6e
prerequisite-patch-id: a2007fdaaeaf2981860c54ae5514f5a6f06c6bb3
prerequisite-patch-id: af8aa3c630647336bdaeffa9c88de3650f1e49e4
prerequisite-message-id: 20260923-add_iris_for_maili-v2-0-7223738e330d@oss.qualcomm.com
prerequisite-patch-id: fa8eeb83ab2b58690611cdc650decebb76de2701
prerequisite-patch-id: 916449cf88458fd1f397ba9270ac827abd7ae952
prerequisite-patch-id: 1df4f51c20d475dd4b1d893070bad11ab70bbb04
prerequisite-patch-id: 72bd41701ada029b97746fa5eb510b677115b5f7
prerequisite-patch-id: 8ef88d4b1d275bda649d738dbd1ea92ed10a0140
prerequisite-patch-id: 7ce46849ca2123764767234cf65bba75cfcb82ee

Best regards,
-- 
Wangao Wang <wangao.wang@oss.qualcomm.com>

