Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961FF3DF01C
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 09:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788169405; cv=none; b=fCZeEiA8UJFwM/JEhr2Yb7rD9Rh04mdtdO+VumU6Z+6CPXsGB28xXG0RAhDGhhyH106P4QagwN0UsF6+OI2yDcJxX7ci+/l4PaUTGiFhX6CrWiie409VgWAwkHta8gBV+nOU/DwQmpsOSGZ7gDQLl9WneS3kiCYPSVaTrb3mAv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788169405; c=relaxed/simple;
	bh=Uz8K52ckdSGPXQ7DIRli6aJZfuZvAmohNlhPwXu3mR8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TSs0kC42jP7ghfyk0F57tc2soeFeNf8EF2F5pg93lsYS1XmPRxUb0dZdSn6LsAcPKzIFX2uqJrlhIrpPYBtjFo0oiDBXGPxb262+u9YaoS56ykp1F52pnzToAefI0blDd7R2D5D2pcSZxC06qwCyDIOSXHcHtr60I+9n2GJO5xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jCNrJKHq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JIt93nLc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jCNrJKHq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JIt93nLc"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V7xKsU2460296
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 09:43:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=R8skzQrcTOFob5OgyU8esN
	NdOJgcF5QRwXdZN6hrzvQ=; b=jCNrJKHqSFy/sVcK+6sqY1TgMZwmOnm/8N3x7e
	LF0D5eWUi5Ca3eRaTQN2bSdKPpaA0J6FD+0LXK3FMMHqchLXP9deRKWjvMdGwRJ0
	OcVlXeYFyH+mqJj558h0Fk58vLC49/P5kpMRn3qOOxZRrmQkN3+ksQA2Gx+kTFiZ
	PwIQmcBiz1FkrXoWsSN/1qWvFlAYVTWww/biv6geJzucRyuMJKmK5wja9m+RV0Cs
	eUExGzQDmOBxkpAw0SxqKs2wFJvvoNY/7zyz4snyLpBTLb+BVs15tXPfVAVhEsww
	dGO4ScAej5p1cU4guswFJqimMwlz5/DWbj9GZNw2QrhBA3YA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd556rkbr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 09:43:22 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-396638f9a18so5712286a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 02:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788169402; x=1788774202; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=R8skzQrcTOFob5OgyU8esNNdOJgcF5QRwXdZN6hrzvQ=;
        b=JIt93nLcSWgLvowHi9kL1W6NLA5ubsHmiPobqYzWLbolX7ku0WWTSNaHK2e9hFuFAx
         9sC+If7PvzgpMy4534acTqBEXUGqPEUxWvRrK9rdssIeJffTnHEp3fk3oVIp180rM/x6
         ad7Z+Z3gHH7HnU8Zngc8YRpd+YJNm38T6zf+jGabb1X9uBT/UKF96o6xCGepTaoRfmoy
         udX9F4C6UmNnrtn74eEYC4WfPFbXNBELCFcx0MeRjn/dVx8q8O97mpqP2tNmXR93kRB6
         xG4YFkKNzCycyl0FMAweI/4f1Ot884RNKbuy33QYXylTTa+ZbECBRu5BVgeF5mpl5AvX
         o6Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788169402; x=1788774202;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=R8skzQrcTOFob5OgyU8esNNdOJgcF5QRwXdZN6hrzvQ=;
        b=MJHRt4jmzuQFWGmgmO/rHWoiTaEqQZQhr4XVQHkZdk+qzBE0KkPOFNdiTFhXtfJekW
         OmQJcUlM5E3dA4qNEL/2CMr4CWG/bEfykEQZXy4OV9lXBs4fnfoJuc8xAb/BBzcf5Uj6
         ZR5pIaHFpzkJSmDLdCg5tBvA0QEqfNhX9A9S5WOslffPwtWFGiaDzfTpD8i+vwWtxMmI
         Hrtw/u7jIEnyOpWJYktff6nm++FCNd2xfDneMe83u3070/sSbPiieZmUI6DQF9JhGUEY
         jhPl1m3HIJauWtSfNxlSeQwtyGFpvQ/Wpoun7jZqvvmup8U5unBr5MSbE+aDdsqE7nYl
         a5mw==
X-Forwarded-Encrypted: i=1; AKwUvByhglDBlm1UovmHigCDMjUA4aooF78r0qHbcj6K7JCLF91bKiDvj6GQdwYXEibpgBy3NNYPRX8NjI/mQd0=@vger.kernel.org
X-Gm-Message-State: AFuF++lUqhw4tkZLp0dzN7eoeEKhbVoSKFNCiPVrtHiYUQqRvZTiKeaG
	CVYIfOdJol1aUXh29kAvvg2kbvxdsrXLDP3U1trB9n21IwXSQlrnijNTpTubtgvuYfarsVdBQ9l
	ahGtfwnxId2mClm1NRrrmL/CUCcN1XSPwQnOVu/29M+KUxZHwrfooLe1ZOwVRkUorbyM=
X-Gm-Gg: AYBFou33oBa1cEyW4i/UAR4XylduDAdKgsV7yNj+oMDlesof0SuYDE/V1oj0s+sdkew
	a3uxrxi+CcpO6Vg1mpP61R55CRpJfGZRCNKcaR5x5Fjqu4tiXwuFOvpfewOSWDsY6TPldr06v27
	7+Xuq7/AraRqu0vV3EQ57lu6wwuWYqt7AKZoYJWuK2AMVoJaN6Q4+UWGRCzDG/f3bX7zgAfUVEZ
	wfmgocSKD/6Uo/fGGdnx7ikictSe6jsuLT9CBsL9dvDlZlOuZW2xEDd1+Zf4lDLxb3rsdm2WH5b
	+i38jkYc99FnyU87epL6HqDORIRI+EtvpqnrzvJVr//uTam3BOrhsLF4vEgHIWHKoS6xFHTY3sH
	iQakiKcqoel8soA+k+cACSe3sT3thUrGU2w==
X-Received: by 2002:a17:90b:5443:b0:396:4cbf:45bc with SMTP id 98e67ed59e1d1-396d100313fmr38943818a91.16.1788169401979;
        Mon, 31 Aug 2026 02:43:21 -0700 (PDT)
X-Received: by 2002:a17:90b:5443:b0:396:4cbf:45bc with SMTP id 98e67ed59e1d1-396d100313fmr38943775a91.16.1788169401471;
        Mon, 31 Aug 2026 02:43:21 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0bf8a13sm40782983c88.0.2026.08.31.02.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 02:43:21 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Subject: [PATCH 0/2] Add TPM support via Qualcomm TEE TPM TA
Date: Mon, 31 Aug 2026 15:12:59 +0530
Message-Id: <20260831-tpm_qcom_driver-v1-0-6f16fa6924fa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKRMlWoC/0WN26rCMBREf6Xk+QR2Lra1vyJScplqDlRrkhZB/
 HdjFHzaLPbMrAdLiAGJDc2DRWwhheulgPhrmDubywk8+MJMkmypV4LnZR5v7jqPPoYNkXspXCc
 JnbKSldYSMYV7XTwcP5xW+w+X3zPfRMRtLar8if1MQ1M9mnpeHWvZSnBmWcY5nKLJqO4McKH6d
 u/1DiT0sFW1NQm8vOeQh2ZSaJUi303Q0krSZqKdkd66treq24OMF+Ww4/P5AksywzAGAQAA
X-Change-ID: 20260831-tpm_qcom_driver-d21c720e73b2
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Peter Huewe <peterhuewe@gmx.de>, Jarkko Sakkinen <jarkko@kernel.org>,
        Jason Gunthorpe <jgg@ziepe.ca>
Cc: linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
        linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA4MyBTYWx0ZWRfXxp2RVZzuYmbS
 ZsYxOU7iGdcrMb4BOVAb/rX/H8VOqH0Ck8pxq79rvGf2K8JIeOErmRIrLGSS4f+tO2mAKxcMM3h
 KRdnCYX4tr0o7xa1lWviTM756a5MVgE=
X-Authority-Analysis: v=2.4 cv=O7sJeh9W c=1 sm=1 tr=0 ts=6a954cba cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=EAapQlX8VUJyPtJC71QA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: W50j38eWKyXijEHzktQ0otvYWXV82ImQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA4MyBTYWx0ZWRfX+B3TCzhH5A28
 Q71Mtll395GTJ+3gUtYoBuP/DLK/8yJhLx6r0SHds2/8PvjkxZbxeUNCpaEM2MvPMlI1Pcs7FQ3
 iYVpuSEA2ZgSivI/0ulAgB2zH03DNto/ttOz4vv4RxmwkMjQB9laroK0z7dR49gwLRQ3hZGSArN
 x8MzqKT/ce+/TTx1ly3RKbCRA6f5+tpCAJ/LlJ6CPwZ2F80vyUQpitoHUa1B25MS43gqpJLfGgj
 I5ChxNZkj+EcrS32nxTU+geVQyrDodNKE/BEARR/oNG3yXMS91MrQ7EoK74rhhQJ1afOcdLhNAP
 1i1mZF8C3tNq6UT79LHZQbdKDMYXi5PYC7KkJIil6cyPWiHcIxrc1jZVsfHNrXGM4sBbFGZA3nu
 0+FI+VNywNdLcVmZCQ83GFbXTyNillWDy3p8YRyNBBzTV/9+zc42DYf0ROMG48kBbvyVSmHCE+p
 MCJQcnb9dJGnoRobWQg==
X-Proofpoint-GUID: W50j38eWKyXijEHzktQ0otvYWXV82ImQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310083

Qualcomm platforms with a discrete TPM (dTPM) talked to it directly over
a non-secure SPI channel from the kernel. Arm's Base Boot Security
Requirements (BBSR) v1.4 require that access to go through TrustZone
instead, so on affected Qualcomm platforms the TPM 2.0 instance is now
fronted by a Trusted Application (TA) running inside Qualcomm's Trusted
Execution Environment (QTEE), which talks to the dTPM (or implements an
fTPM) on the kernel's behalf.

This series adds a kernel driver for that TA, built on the QCOMTEE
object-IPC transport (drivers/tee/qcomtee/) already used to reach other
QTEE services.

This patch series functionally depends on below(patch 5/6 specifically)
for qtee service discovery.
- https://lore.kernel.org/lkml/20260722-qcom_uefisecapp_migrate_qcomtee-v2-0-b8a8fcbe4211@oss.qualcomm.com/

Tested on Glymur-crd target with tpm2-tools utility.

Validations:
- Get capabilities
- Random number generator
- RSA key creation, encryption and decryption.

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
Kuldeep Singh (2):
      tee: qcomtee: Register qcom.tz.tpm service for discovery
      firmware: tpm: Introduce tpm-qcom driver

 MAINTAINERS                       |   7 +
 drivers/char/tpm/Kconfig          |   9 +
 drivers/char/tpm/Makefile         |   1 +
 drivers/char/tpm/tpm_qcom.c       | 371 ++++++++++++++++++++++++++++++++++++++
 drivers/char/tpm/tpm_qcom.h       |  82 +++++++++
 drivers/tee/qcomtee/call.c        |   4 +-
 drivers/tee/qcomtee/qcomtee_msg.h |   2 +
 7 files changed, 475 insertions(+), 1 deletion(-)
---
base-commit: f3e6330d7fe42b204af05a2dbc68b379e0ad179e
change-id: 20260831-tpm_qcom_driver-d21c720e73b2
prerequisite-change-id: 20260408-qcom_uefisecapp_migrate_qcomtee-13869d45e014:v2
prerequisite-patch-id: 4dc81445c9baf36f420da8c2e2bed96e71b31a5b
prerequisite-patch-id: b487dfe2fbc076f4815dc6c73b9e68b0b78c961f
prerequisite-patch-id: c5df2b3696520a96f95b2d3535ed84cdc21cc315
prerequisite-patch-id: bbdd5327c15aeaa99ce9b74bab324a98f084ed48
prerequisite-patch-id: 07d9c4e9fe9fd61f60e3f35b30b9d81716f0734c
prerequisite-patch-id: 10ff88d87586f21f3cff3f72dbd21c27adbfbbcc

Best regards,
--  
Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

