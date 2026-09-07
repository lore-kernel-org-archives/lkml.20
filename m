Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F41540A93E
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 07:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788766366; cv=none; b=tvA1qyoOKym9XqHOfJPsKhV6CMmzG6W+W7XfXn36IurrdBfeakvUsKIyTjH6eAsvui2vMwQ+UNZsgTFjeHivPGNem4eruWzoOPCXnJ0h4XKjrd6mFOkACVhsVKppEtsDnljOH29DwF8JKqxJj0CT+OLMLDnXv8zFNkNl5VVdfPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788766366; c=relaxed/simple;
	bh=qdnLSmLDrUnjvMcBYCIpqfYJR9lMILmSId77EtiLjqk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=V10cvSU7YjPH0Ij+wWJH132EGsK3zDUEgMunloRsbFkvDTWuBoFVTQt1+EVwsOuOgR7AO4IhW0iGAXO1Cf7P4uPP1KMzGUp4tg+l9OHJgKvqB5SPnAJcywHwKjozZaaS6+MBBK/DYiUMnsv/FJb6zkfABPikTS+jtRcOUFKB0Vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cp5XGyX1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QRELTZnR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cp5XGyX1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QRELTZnR"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68777XEl2724165
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 07:32:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=DgvyY850ucz63LNvnvMhLT
	MTlVbPvAG0b4V5wXXP0Jk=; b=cp5XGyX1nehEGQ2b4zjOWbv/kF9mwWoVYF+4HP
	kto4OpJaMSJC/8oINh4fswTWxm7XB5HGZ2MyRPP/aeneMZfzhVlQMIhLLYAfjJ4a
	2pV8fZCNO7PXBSH2+RT6eqUv0t6V2a3/RTZpVSkH9RZdavwxQkHr+QQdu9FyDw+7
	UpBGdWkbQeeKUICzxXnLhF/RdRUSWZPsWbgXKdN9zygrJjZC1Ju9lWobAdRvVIlG
	V1GeKbGIwLiX3otN4R9QMzo8kqBb8Fd2EkwGXa1MABboAtPWqswq724xXNi36eRZ
	kDVEnzhr8drfwpZLrf8vlXpfI1ApkDFuqo/pye5V0ObLzs6w==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghfxksfsx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 07:32:44 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84e5a0317a5so328890b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 00:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788766363; x=1789371163; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DgvyY850ucz63LNvnvMhLTMTlVbPvAG0b4V5wXXP0Jk=;
        b=QRELTZnR2NrC9i/lxB4VODPeVG8HSa19BTd76hhdJBBZa0exz7NgGe/3h2c5gPFAGr
         c8BMi9hHI8fKfUrRpFkj2W61venTsaCpSH6XZ7R0VD3CBbhjzxR52DNNbZFczQdcn/z0
         NSpfDeTLcnFgSur3/qaeseyyd6KywnQ4DcKly2Vpi95fCwmvq3pp4tNdEAUWvr6wTJnT
         rp01ujqgRLB8BCJSz3hcpjiBIsrnvi3Ar7OT285dsqgy5IoYkOO56L8vL5+XluU7qXOO
         FaLZloiTAxcTWu3x8RErYbW5NcKUB8bRzqCKdsMWEdyNryiHgTsbuZRULlV5o3iggk4Q
         7BVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788766363; x=1789371163;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=DgvyY850ucz63LNvnvMhLTMTlVbPvAG0b4V5wXXP0Jk=;
        b=Vf0HrcRl3k7Srnm/W0ltWLz8ndwL7pmb7zLPXHd41oHl0AJ9UMlUnEEC9X3Yh+0fmy
         FuzdLDtA9xiV4TQG1OBm6+a5qU9uv4J3BezOZoCOOygcnI1tujN6DtIvtCSlX9QKa8ZR
         5Gd73DaCiCs7N9kCAUjOeo5PVk3ewi83NiFtXMqru9JR4AnV7AfjdRxbSbukWFlmvrMQ
         GUf67wfUPgC0ktzg14uw3mpLTUpFEGTMqQ9hn6VOQEkFeLQntB+tCBiQRcaYoWYZE6ZN
         77ilZAHODxFZSWjkLD5vAq/HawX6ZQlTdofRx8usSKwA1RuMYF3RjNjPdNqGjT4J8vuu
         rM2Q==
X-Gm-Message-State: AFuF++ltUfCouM75ZmffD7QYZa6nxhzYcEQs2wK2HS16s/2GhFeKnCCz
	8RtNfodUlSDpAzivmpOWB3NtU+037dpoglaGU65iZxyiG5wyHr0dimIfbIffo5VyFqpGwtT8JAi
	rCh8qh+hgFa4d58AgVpUyWp9FS2GSiXN8I3nka3yOjAWiq2Ay5cXwgsOIKxZQf4LkJ0s=
X-Gm-Gg: AYBFou1A9LXQgCMGkUtdAxfy29jnQN6xh4O9COwjAUFlqT+3zyVt7pqM3HV1X+s8pfT
	MgVE1gP0+xRGcNOC155j/d+S+sgknYnLRmuA2xl9Yj28t8lIqObNchiWXw/vaAZwFUt8tVDcS/N
	goDjPlIcyye2wU2gKCa4dAYCZDnOJxEC931JBOtT3bA7XvojfO2M5SpU0eeKLAnIK7/MshY/lF+
	7DT/ueHdjicuOJYMl25yP5MNRBnXai6DLZvgEtwFEoahq+colGh4yp/qT+1JyhKOOP6QWo4kptM
	4O7jdHInftmZHFO8HN/SFM+cCFRY4g5lj5Jk2JOXxsswqkkskG9TrCKAxBY1VNMp9V8sGr6vv1W
	gkxcrmYBxov3cryrtcisX1Jirt0WLseGzyS6+6XoBtBJ7iZZUQ7CxNGXkAeDGzJ6Z1VZanC47T4
	ysz/mcvEPkWimYAXz2jeHS
X-Received: by 2002:a17:90b:17c5:b0:396:d28e:b52 with SMTP id 98e67ed59e1d1-39b3d7595b4mr14132937a91.3.1788766362986;
        Mon, 07 Sep 2026 00:32:42 -0700 (PDT)
X-Received: by 2002:a17:90b:17c5:b0:396:d28e:b52 with SMTP id 98e67ed59e1d1-39b3d7595b4mr14132900a91.3.1788766362484;
        Mon, 07 Sep 2026 00:32:42 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b123731sm24010857eec.18.2026.09.07.00.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 00:32:41 -0700 (PDT)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 13:02:38 +0530
Subject: [PATCH v2] arm64: defconfig: Enable Lontium LT9211 driver
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-for-next-lt9211-defconfig-v2-1-c9af0c085b78@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAJVonmoC/3WQ3WrDMAyFXyX4eiqR0zk/jLH3GL2wLbk1NPFqu
 6Gj5N3npGU3YzeCI6TzHekuEkfPSQzVXUSeffJhKkK+VMKe9HRk8FS0kLVUdV834EKEiW8Zzrm
 XiEDsbJicP4KxhJa0JNeyKPtfkZ2/bd6fh4eOfLkWRH40xcgp6Q0xVG9Pwh400dPcgomeysDcQ
 Q2NIqVQdYyt+ggp7S5XfbZhHHelvK9EoxPD2vF5qFihdbbrsJha1xP3ZKgxyrT7V1mMyJlCRCf
 WbCefcojf2xtm3ML95vn/4hkBoW+lRFcXDLV/YonDsiw/wQ3USWUBAAA=
X-Change-ID: 20260903-for-next-lt9211-defconfig-bcd1cda2df7e
To: linux-kernel@vger.kernel.org, venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788766360; l=1507;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=qdnLSmLDrUnjvMcBYCIpqfYJR9lMILmSId77EtiLjqk=;
 b=gIJdrP4fqSasQYIF5SgKpRWG+LF84EtgsW8DGG1U82TLrg76i1FHDZQTQxTEg4vzQ3dY4hGDz
 0BCKP0pBbNICP0GCKDRSyKAuBTsnycPc2CgkYWIGmiu+hf9fAgs587G
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA4MCBTYWx0ZWRfX/tQvAJbdwZ/4
 WUX4gu+wXa8Z9aGSeXwBOKdZlltzptw3fRdEDQjFG9XoXhhIWJYV7OjDoJ3puTYh0TPU0GYuLhI
 5U60V+iubMYlJhDZAuXHUI9FUKwwUwpPIqCU8jgngmSX2IeSDVzEAEjKjmdah8LBtMMZmVPE8Ky
 6LfGYgBwcBM5bvNhJ7wLSvuwlbKYnsg5e+3KiUXpIuSThf052LseQdQHW6lmOnGM1peQPD/UWXf
 iRysasHEqZ9gudstn20aShGG2OBiqtPdUsh20c7eG9FqsSyIv0PTrfqL3k+NzC4Bk5AZbRceSKt
 UON0vV9uhe8gVIcw8wfg7RU/wQty2RDZpRJ0sY49jGXPiXhPCgXrY+Im6DPeVNT9piAm/DUwAwT
 gF5b+tPVN9E7V1U2jL47/3+zQ76Jb+yMEjmbYtbXm7nnxgj56qCYkEktCNc7yL+yNatAEXxduKC
 v2ZHIxyZEcumhsrxIxg==
X-Proofpoint-GUID: Qpy8P7YDWsfbYqT4CTaI21vJA0DOytUT
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA4MCBTYWx0ZWRfXwkeDy8Dnh1U6
 coG0Euh9fP+l9cjHzZikPVRT70wD1ac5tKts05Tk3QGqOXF2+eDcjwjfo/DBGw61WdPJumYoC6b
 rsAQFY/fRjZtCbVlVX8KNq2FsCHGTmA=
X-Authority-Analysis: v=2.4 cv=daOwG3Xe c=1 sm=1 tr=0 ts=6a9e689c cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=jZNqlOFJJHs4K5NEIZcA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: Qpy8P7YDWsfbYqT4CTaI21vJA0DOytUT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070080

Lontium LT9211 driver is extended to support LT9211C bridge,
which is available on qualcomm ifp mezzanine boards of lemans/monaco
and QCS6490 RB3GEN2 Industrial Kit.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
This depends on the following series which adds the LT9211C driver
support:
 - https://lore.kernel.org/all/20260904-add-lt9211c-bridge-v8-0-36d66168e176@oss.qualcomm.com/
---
Changes in v2:
- updated commit msg [Krzysztof]
- Link to v1: https://lore.kernel.org/r/20260904-for-next-lt9211-defconfig-v1-1-97221f0109d7@oss.qualcomm.com
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 87a6c50bdd14..5666192659f8 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -969,6 +969,7 @@ CONFIG_DRM_FSL_LDB=m
 CONFIG_DRM_I2C_NXP_TDA998X=m
 CONFIG_DRM_ITE_IT6263=m
 CONFIG_DRM_LONTIUM_LT8912B=m
+CONFIG_DRM_LONTIUM_LT9211=m
 CONFIG_DRM_LONTIUM_LT9611=m
 CONFIG_DRM_LONTIUM_LT9611UXC=m
 CONFIG_DRM_LONTIUM_LT8713SX=m

---
base-commit: e61cfc881090cf9de9dbd3b6b7452661dfb0261f
change-id: 20260903-for-next-lt9211-defconfig-bcd1cda2df7e
prerequisite-message-id: <20260904-add-lt9211c-bridge-v8-0-36d66168e176@oss.qualcomm.com>
prerequisite-patch-id: dbba64d1ace696df388c5df3d1cb05a0701df194
prerequisite-patch-id: fac2b93f3e250589dffd7c076d2ef1aa7a2519a1

Best regards,
-- 
Vishnu Saini <vishnu.saini@oss.qualcomm.com>

