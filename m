Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02823245020
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 07:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787814235; cv=none; b=lW+dvzjsz9VR/RdNTJKtnGkTAPn4NyGL69cG0Hqh2Q/QAgF0WRhLTcQ7ODQYDxZ9QoJsTtXfX6Nvq57L1+6dTdHbwtvPoZtqN+pqMKtIVB4SHIqo6W912tz/C6ml7lbGgcwDkV09E6L4fOO20Ye3o9vijz5u7e2+QASsX/FEM6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787814235; c=relaxed/simple;
	bh=YU+dpOx506Gyv3qnb05But5K7iNWhb4zHsEv2N0EA9A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f7ioLhzvRcHlHGLZ63JQfX0S/3X9hqWOz10BjQ5bXN1mgcMBFu590EErhBTcDuSAiZSqpm8MIzer5Nwqz7Lneu8cwHK9lAwTvX0l6wItuP9ezRsKmoUqDNzioHjtQw5Lqaio8GJs2+PRYgB26S4COA2viAOa1Xc4cUUiQaLS+wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mNdlHq7j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZsJXiIFN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mNdlHq7j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZsJXiIFN"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67R6RBDS3835103
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 07:03:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=9GHTnyyGYsUI5zmnXqS8PIIxqLj0GNfc1Ae
	++1SY2R0=; b=mNdlHq7japmunS0CjVaRdcv0SSvbfZ+oqyufL/COpsNChuX5usS
	d7MRscPXlwiEFRtVUgNjGFrzzdli3bvw+pETX7CgLVvRMyjkk72IzVC4pMLn4ech
	co6/tO32WUDjp9n9MIdiO0lPArD7fRPG927dWrZcg22LKODaepIVrd9OZYksxweB
	uw5XHO3+IWJ0hq3IuMGiI6IEjwnyCfSvCTjDkQtW3CSzq1spcsB9H5+1GgsFftfl
	WtuzAj1DxU9sqpfcWredb4K4WbS1e8jzvDQhv5FbjwYE2GSXt93BVK3lNjbaUiJa
	5KMqWz76ojcUIGML249ZU2rKJWG4zpuWSfw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga0wbudgv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 07:03:51 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-526da7e3c9dso17485511cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 00:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787814231; x=1788419031; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9GHTnyyGYsUI5zmnXqS8PIIxqLj0GNfc1Ae++1SY2R0=;
        b=ZsJXiIFNROeDln2DvsCL/5AZlh8prKaq4WjqDYvR0ZLtfnMMhpQ29h4Ig9Exc+CEp3
         Q0SLXWUcVVCwHkMrD1AvwW49JWsUHUC3Etkk2WtDlJwYNqeXwTlBB825IzY4E38fZzIR
         JHUqdpeglnHJf7S7F1UyLQDhm2hCwfNcHfste8g0Lg7PwcanFZ4r7Iv3cVYauErCOCkB
         sHYmLeFXGySBKxE/VnFxiDUn3YpJFt7+ymLK9k+JOaHWw9mJcNkHSFHzpl5MeELVx7dG
         HbPfgNSLxkwHq3KYLH8Xr7VqU/j1EPQ2ex3ruQlRm4nfEkIOSgMgJINFVrbptaJnZ2jw
         MfoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787814231; x=1788419031;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9GHTnyyGYsUI5zmnXqS8PIIxqLj0GNfc1Ae++1SY2R0=;
        b=qdDqCuWO/ZhYE6P3MQcKP+MvMmPIk7qcA5Oe8TyJTeYwySrBnNSYkQ+Zq4krpk6CWy
         EUDV+7orKofm+jOBGxZjIT3rjoiIIOMu+H5drYGsX0Qp5FWxhcX4/H9STKijt47/pvbJ
         oDK8WaYGTYfhBMJRbPE07iM4Asgb3mNybNi7qkqLo7V2aHMxSrvIgbEHlRD0M3CKOGY5
         xUa0BRwYvopLKc/v1H/NNaFpnnqniLa0fKobd/bGq9tUd0ZeU2pN6PsDrl+ZETj32IVM
         4pQKfTrJyEhoxy82l5nXTTl66vUudG2a6jgoHZihqwap3Glj4dSGV5IUe42FVDgdLqdH
         ciCQ==
X-Forwarded-Encrypted: i=1; AHgh+RogxebaPtj7BFIFqLFm8OVMeupvxsc8hx6cr1y7oqYYVtzlLAaB8DjUylWbMdNEBqvoByqavgnaFURbf/M=@vger.kernel.org
X-Gm-Message-State: AFuF++n28cuw3WZoKXs3zdoUwvFjB1SVdZWehSYl3Iv0JOqtbRZegQ/M
	ZaH3bxUDQjcCu/S1X4Zewcg65OYOOOfHCEzk9FqjCcPF4ayLOZDYipYoKTD6IASFLzasl/NUu68
	e58/yYd0Oaxpl4J2NDwL+S6j7taBo+HDbc8KmiLM+6BNuIhiJvsh1w6mkG8fdkdHn4DE=
X-Gm-Gg: AR+sD11Jv5UbBMQMYepWTC8STP0lOaMB8czgVvfhwVpk/QAFmDbs5nV2NfqO6iX8z93
	Fa1KReSBBVKri/J5pQb5lWrfT3hZa2ddOlwuzGCkHr8zFL/0Xd8j7S5aOZhn6USmIKKhLE/Pegl
	6BxOjA2LAQn3/h15pzf74tfN3TtvbrO8oGSsULSNK39Suii7W7XvrVSGREeS9dsnF7veid0sZV/
	mcvARRWDW7GvejK9KniXkePk6WqNi3ShrZxZK0YEFBMI7KTwag7h+eN/UFyEe5IunGeolxXaeb9
	C7lIL12I7iYyKNh7fOGUVBhobRfqlJpTZ1wKepymBJ2ozvdM5ou1rcr19/bW8GVCYT/kqVaofDV
	rW98IY304Hq319ITDF64jqrmr1ToPI0Pqz2/E6hPrpnuQEVRcJw==
X-Received: by 2002:a05:622a:6106:b0:528:3b9d:2c7a with SMTP id d75a77b69052e-52e4234d653mr131401331cf.21.1787814230813;
        Thu, 27 Aug 2026 00:03:50 -0700 (PDT)
X-Received: by 2002:a05:622a:6106:b0:528:3b9d:2c7a with SMTP id d75a77b69052e-52e4234d653mr131400901cf.21.1787814230265;
        Thu, 27 Aug 2026 00:03:50 -0700 (PDT)
Received: from trex (137.red-79-144-199.dynamicip.rima-tde.net. [79.144.199.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b0d263dd5sm28306585e9.1.2026.08.27.00.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 00:03:49 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, beanhuo@iokpp.de,
        James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
        alim.akhtar@samsung.com, avri.altman@wdc.com, bvanassche@acm.org,
        beanhuo@micron.com, can.guo@oss.qualcomm.com,
        sumit.garg@oss.qualcomm.com, jenswi@kernel.org
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
        op-tee@lists.trustedfirmware.org
Subject: [PATCH v4 0/2] ufs: rpmb: make RPMB usable with OP-TEE key derivation
Date: Thu, 27 Aug 2026 09:03:34 +0200
Message-ID: <20260827070345.2853821-1-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: O6pr4M34lnOfXJRFnMEGf0WIx5KVGrZQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDA1NiBTYWx0ZWRfXxk0n68FYuotG
 IBET/NGKyJrDnqFRVZIuFUlU5aaMTAzFUg6F9/1klmHhle08QLnhk6zdTNXHhEMqxjyhCgFZERr
 Q/00nkpIJ8fcLhnWhJp1PL68R28tUnY=
X-Proofpoint-GUID: O6pr4M34lnOfXJRFnMEGf0WIx5KVGrZQ
X-Authority-Analysis: v=2.4 cv=SoCgLvO0 c=1 sm=1 tr=0 ts=6a8fe158 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=qBhfTSQT0jQfJ5OHMlDVQg==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=_EMmJvYMAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NEAV23lmAAAA:8 a=wgeUl87hhcvhY68aDoIA:9
 a=qcg49hLlgF0N60+LroqrWnV/Vu4=:19 a=a_PwQJl-kcHnX1M80qC6:22
 a=emCv1hD2LFd8cNRmW21v:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDA1NiBTYWx0ZWRfXwGqJ/bHI0N0+
 R15Y3uWFoSWB4DkKDpx+KHteyGbf0XE0p/8kiwiqObcFZsawrSs1brczQaW3cy5abgOUs5RqNuT
 FA3NmW0CdNFmacS1frkYIuZUC5ZdNM+Y5r3tjcePhr1HY1TmKW8c0Jl2tWVNeXNyocfHie+hFBx
 OEE/0jhnJ9flM8iUEQgVb2sCWK1BoOJkPpS58U+Z3WMZJB1LKX48gF4IVJk9t35aguz3E0y8HGq
 b6rAiBdtpvPz65qD47TM4uywmLNlWuZmXXx1a5Xa0vpPzrH12zrX2qU5l7W+iVF9/k+RKlQDk5J
 spSEnP5WhyNbH/rkBeYpsdc9flKbbZzMULsrpHk3TCPT1Ek+GqdiVFxn03Tb9wpl5invYqAdeCm
 J9vUesCoaNYYCtFguvjY7SMnqufMWJnuQKy+cTkp8LiFm3aFMr04qN0S/LhHLENR0xuY49/9jgZ
 LNdb4CTPg4mNfOflsVQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_03,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608270056

This series makes UFS RPMB work out of the box with an OP-TEE that
implements the standard eMMC RPMB key-derivation flow, without requiring
any fundamental changes on the OP-TEE side.

RPMB provides an authenticated, replay-protected storage area whose
security relies on a secret authentication key. In our setup that key is
never exposed to the kernel: OP-TEE derives it in the secure world from
its hardware-unique key and a device identifier (dev_id) that the RPMB
core hands down. OP-TEE's implementation targets eMMC, where dev_id is
the 16-byte eMMC CID, and both the fixed length and the raw-CID layout
are baked into its key derivation.

Two things stand in the way of reusing that same, unmodified OP-TEE flow
for UFS RPMB:

  1. On a cold boot the very first frame sent to the RPMB well-known LU
     comes back with a power-on UNIT ATTENTION (ASC 0x29), which the SCSI
     core reports rather than retries. RPMB has no earlier guaranteed
     access that could clear the condition first, so RPMB fails on every
     power cycle. Patch 1 asks the SCSI core to retry the power-on UNIT
     ATTENTION on the RPMB WLUN.

  2. The UFS RPMB id is "<device_id>-R<region>", which is variable length
     and longer than 16 bytes. Passing it verbatim would tie the derived
     key to a length OP-TEE does not expect and diverge from the fixed
     eMMC CID ABI. Patch 2 hashes it into a fixed 16-byte dev_id with
     blake2b, keeping the key stable and unique per region while matching
     the eMMC CID layout OP-TEE relies on. The hash algorithm and input
     string are thus part of the key-derivation ABI and must stay stable.

With both patches, UFS RPMB is functional from the first access after a
cold boot and derives keys through the existing eMMC-style OP-TEE flow,
(requires minimal OP-TEE changes pending on the CID proposal done here).

Tested on IQ-9075 with Open Firmware [1], pending OP-TEE changes
[1]https://ldts.github.io/qcom-buildroot

Dependencies:

U-boot:
https://lore.kernel.org/u-boot/20260720085202.537019-1-jorge.ramirez@oss.qualcomm.com/T/#mc423eb4dcf8a15849077029e4f7c1913bb7d8873

OP-TEE:
https://github.com/OP-TEE/optee_os/pull/7881

v4:
  * ufs: rpmb: retry power-on UNIT ATTENTION on the RPMB WLUN: open-code
    the power-on ASC 0x29 (with a naming comment) as the rest of the SCSI
    tree does, instead of a UFS_RPMB_ASC_POWER_ON define; add a
    UFS_RPMB_UA_RETRIES define for the retry count; reworded the commit
    message.
  * ufs: rpmb: use a fixed-length RPMB dev_id: reworded the commit
    message; no functional change.

v3:
  * ufs: rpmb: use a fixed-length RPMB dev_id: hash into a stack buffer
    instead of a kzalloc'd one; rpmb_dev_register() copies dev_id, so the
    heap allocation and its cleanup were unnecessary.

v2:
  * ufs: rpmb: replace blake2s with blake2b so that the same support
    can be added to u-boot (CRYPTO_LIB_BLAKE2B)
  * added links to U-boot and OP-TEE changes.

v1:
  * ufs: rpmb: retry power-on UNIT ATTENTION on the RPMB WLUN:
     - fix using uses SCMD_FAILURE_ASC_ANY to retry any Unit Attention
     - fix unused variable
  * ufs: rpmb: use a fixed-length RPMB dev_id
     - fix selecting a non-existent Kconfig symbol

Jorge Ramirez-Ortiz (2):
  ufs: rpmb: retry power-on UNIT ATTENTION on the RPMB WLUN
  ufs: rpmb: use a fixed-length RPMB dev_id

 drivers/ufs/Kconfig         |  1 +
 drivers/ufs/core/ufs-rpmb.c | 29 ++++++++++++++++++++++++++---
 2 files changed, 27 insertions(+), 3 deletions(-)

-- 
2.54.0

