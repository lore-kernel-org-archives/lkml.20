Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC8E3E49C7
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 06:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792046300; cv=none; b=fVnuKGaqV+QrIJSStTwZgmVG1j5yG5vkZzpvQUEjpxorTWCGXJd36+cscrqJratUHqHbMAMRjOqunMUaHBcAiDzsLlVoMRP7Wih25vvl2psEyHDmM6uaj4in0Rne+GOyNlOxHsdq4zvYH0dHED9sdzCXOP/WXss5pnJ1GeXaIxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792046300; c=relaxed/simple;
	bh=M0bO5pV7rOWhaoU6+z7kLmEATwugnVvfR+Tk3mM83CU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FdzUM+SXXqOzXCssq/acwCFBsHUTQFVVVnCVBATC+U4gD8A0QryulRPZ40r+1g9Mbkh5qfHsCkhdIO72M2hSQysZzjiHzYoVot6CBbsIhWLiBdhfPgYmN/+/mR7NeUQnH90DlbRewos0mw8JXFx7noiFRztC3RtLrdkbh7I7ATQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=giRqNbQJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z9OGCEqi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="giRqNbQJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z9OGCEqi"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F5mjDj500266
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 06:38:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1gwU0tcX13myESEjxMHLTQ
	2r/QSifosTvZ0kTue5VFs=; b=giRqNbQJYawxS/9sjUldbIgXPHx5WjkeK2pjT9
	EKxIer3TV65dvlPftDAG9DzN8PxjrUWphhzBbPzmJewRC1vCWI4RyNXfC/iwC/4B
	x0UoLVdoxw4K3XZDL0TFTLdPt1Jmsixn23tNNEqZLlceS3LdiU5P4IAS71ZJhlkh
	zV5VuW8b3BWePQdthn7RnOXLsJ5nAPDMVHqkxXoE/s9Vn49xViuMvOAvAWhK7il/
	XzdxEqF1qI4dZ/KStJqIaw+45m+EuQmReGFAeVQccB2xPgfRZTibz3gDL1+WsRyt
	gDif+omN/9CFuZJLqTugqCavNFySaE7L2Ymi3rfx0vLOkNqw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haagf3k85-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 06:38:17 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ab868fe362so6469566a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 23:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792046297; x=1792651097; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1gwU0tcX13myESEjxMHLTQ2r/QSifosTvZ0kTue5VFs=;
        b=Z9OGCEqiOjoas2PrkSqxfx19cl/bSy/i4S3bBx+cn3JZi1lVb/H1oOb/ywEUTJQsXl
         35BGjhvZPXagM761L0u7ymQxROSh1YuEDBQ8K8YnZEUxBFKyAU6usiBV0+jqL9w4upBA
         PcWUAejJW2cDQ7opz62OHULN37HvRC/aPOAiRJSS+ebQNaW9pfscsBtHgL+sGIo6pvNZ
         PujtpI+vFPQ9+V4yz8fwCIvuvLhv07imauOT4PUhe+wA5Uhu6cot5uwm9abnxQIBWtyM
         Pon9J3R7bfF/hCGYTvuV3W11W1n6jwmBXBbi+FA1fotf5byPEhZazjOkUieoHX8xsBUJ
         4UQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792046297; x=1792651097;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1gwU0tcX13myESEjxMHLTQ2r/QSifosTvZ0kTue5VFs=;
        b=IZSKD4+8iTJXhJrD4f+dqSGglPpLj0gP17E7g+WLVOTWKK7t11F8Q1qQUKO5iX9T1P
         PAcFxAblwdVxDF5o1RqH3jLzosYi4uuWLzfWOInoRgcufhvcoeXhanToOawGghAbd8Ph
         lGuMVvQ3cwDm7sBGdHqprI0dPcIGruTbbs4/U8Un/OjlIx/maxjtas+NryEp624IW6Ph
         syN3YgLOM8dScDdW1KG7jdYI3NgUuq53DC4GDj0YfZUP6Mp4AxKg2HRsUcEP3WRg+/qZ
         zInS7CEoMAFNJvTFV5Mn2DUA1lOvOv7znbmoEYmdK0AgGodTQzi1TyhKCzeQA1Yhl0tI
         miTg==
X-Forwarded-Encrypted: i=1; AKwUvBzI2reXxqX4Dpu6owYcyy1vj/J2JEszVxHbIy0nqJ11VIvNCxm8lEQTFqNTHYj3VTZPwDXeyo0jZ1PukvY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIDiC39TLJF6UGocj+KqbiYbVTFB4uw+KXKFWCpVDGILeMLSIkk
	PM1KIsHmJV3WOLi3aOjUksRVCag177ThAK8CaMNteUyci44HTeuv2yKmDdxN+gcY+nKhE5Ruzz1
	Tfps7FHMeDgFgxBMWUeioKJlnVbAHhnnDSCq2S7B0IXDrlAXbpr6H2Un/j+i/DukBjgw=
X-Gm-Gg: AYBFou3HiGl+q6mHLgComwhXbZi/T4xpdHlIBYkgLWST8qxbttsQ0i6cUA/sgZCvfKz
	sbjinOJo63kEPNjnwP0BNfCBfFIVPXu5mMviOh5AJgTfqOkyI/1RbppkRMm1HBnm7UcjN4Q3Uq/
	we9G+w5Hlhz81nA0t6I9/bfXSec2b4YNRT9UwH0cgg0/d5aD2OrpmitYWvpUYVV5gu85Jh6XQVe
	UUAh0Nkmk4dKe/VHLe0vKkdn8aZcZWdRgLsIh2m/aD+xb7gTfwcUH7087cjnyjzMdO75ZyLaEV5
	0HHUPXIexshGGFWWSq4zADXEo5KNh4XmO//RmkGBIzoq4r+zxiQltm4B+gMzz46ZFyg7yXhuXyE
	phR5g+fOElrZTHrL4ooR80FrBqGne71AC
X-Received: by 2002:a17:90a:d44d:b0:3aa:f4af:1e17 with SMTP id 98e67ed59e1d1-3ab3a9d6d17mr13213368a91.39.1792046296588;
        Wed, 14 Oct 2026 23:38:16 -0700 (PDT)
X-Received: by 2002:a17:90a:d44d:b0:3aa:f4af:1e17 with SMTP id 98e67ed59e1d1-3ab3a9d6d17mr13213353a91.39.1792046296059;
        Wed, 14 Oct 2026 23:38:16 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac93ff4474sm2844429a91.0.2026.10.14.23.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 23:38:15 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Subject: [PATCH v3 0/3] Add TPM support via Qualcomm TEE TPM TA
Date: Thu, 15 Oct 2026 12:07:45 +0530
Message-Id: <20261015-tpm_qcom_driver-v3-0-247c8e50250e@qti.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALt00GoC/3WQwW7DIAyGXyXiPCowBEhOfY9pqkhwWqalSYBEm
 6q++wid1MO2C9Iv7O+zfSMRg8dI2upGAm4++umag3ipSH+x1zNS73ImwEAxIzhN83ha+mk8ueA
 3DNQB7zUw1KIDkrvmgIP/LMTXt0eOa/eOfdoxPxUBlzWr0qPsaWqr4pHM0OJYMytib+f5NPpzs
 AmLOyFSLoxqnKyRcdlucgd3NiLN36NPbeUkb5wyALV2hotB9Z22YFBCJ2rH0A3SOiYM2Ye8+Ji
 m8FWusPEy078Lb5wyqgauBqsakIM9TjEeltV+7OpDfgpygyemYfo3BjJGc6s6rmtw1vyBud/v3
 57Rln+hAQAA
X-Change-ID: 20260831-tpm_qcom_driver-d21c720e73b2
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Peter Huewe <peterhuewe@gmx.de>, Jarkko Sakkinen <jarkko@kernel.org>,
        Jason Gunthorpe <jgg@ziepe.ca>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
        linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAyNiBTYWx0ZWRfXytIUYUx12dRO
 WiwpZw83O0mpZW5ZbnxhjRVs54npKYrN6FLrU+xUW10PaJL04/GtR5ShltrK1eHxvyofH/okE8n
 YFJJsW3AQt/fJIreSnZo6SJ8z4UhrpsOYnRllAVYlStYjVQ8Ab+/p0oXu2iUl2yGPAxJLn7e/ih
 8vSEInp1qevw5hG9873VfMSD2esRMqgU3cUGKn4XTGn9au4zSsd5O/wAs9SCyVdf3zx3FfhkKm/
 usSELrpc9Ccj9maQ6vBV+crVzaK0buiYCZP9YRysECZCEB4ITR3OsLDD31XwnTwhYfv4hH/7m1T
 PdT08FW2+RiZbGaJjtDsiKjtYY2m4j2NGfZYzxQrm/LtTKKKDut6FwmsUK0C70gpv67E5xWrgLP
 FmYJJCKXJ81iCJOIs4yJPhAikaHDz/2tGVBNOYJw4T/mY7knWiwhQ/oFrT2iahaCibSy+0MQhFf
 l8eIyQ6fVhT7VwST3vQ==
X-Proofpoint-GUID: TVIDtnjJTVK1LoqIwvdpwW6VHNhmtRhQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAyNiBTYWx0ZWRfXxIzWVoHND+mI
 9Q+wilNUmniJtsIxmawiwt1rrnBdO3LJ2uY/y4uUPylHE6bDCFcWlL/tTGbdfKaI8ddjk3642Gf
 ToT9KqQ/kbqep+x/24dnhr0RsAIhK9s=
X-Proofpoint-ORIG-GUID: TVIDtnjJTVK1LoqIwvdpwW6VHNhmtRhQ
X-Authority-Analysis: v=2.4 cv=V/noQuni c=1 sm=1 tr=0 ts=6ad074d9 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=9jRdOu3wAAAA:8
 a=b45o4kL6AAAA:8 a=xG2GeFPYwsRGK1jMldgA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=FO4_E8m0qiDe52t0p3_H:22 a=ZE6KLimJVUuLrTuGpvhn:22
 a=dhdsR-PFWuPJUldTnwXm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150026

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

This patch series functionally depends on below(first 5 changes specially)
for qtee service discovery.
- https://lore.kernel.org/lkml/20261006-qcom_uefisecapp_migrate_qcomtee-v4-0-bf1c8e2a64ab@oss.qualcomm.com/

Tested on Glymur-crd target with tpm2-tools utility.

Validations:
- Get capabilities
- Random number generator
- RSA key creation, encryption and decryption.

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
Changes in v3:
- Merge tpm_qcom.h into tpm_qcom.c(Amir comments)
- Update return values of functions and drop certain error prints.
- Define locality_arg as default value.
- Add Jarrko's tag on all but drop from 2/3 as significant changes done.
- Link to v2: https://patch.msgid.link/20260907-tpm_qcom_driver-v2-0-71a6b1752da8@oss.qualcomm.com

Changes in v2:
- Use QCOMTEE_TPM_UID as 81 for service discovery in patch 1.
- Use FIELD_GET, zero initialised array and log improvement (Konrad)
- Improve commit title and other fixes (Jarkko)
- Split MAINTAINERS entry as separate patch.
- Link to v1: https://patch.msgid.link/20260831-tpm_qcom_driver-v1-0-6f16fa6924fa@oss.qualcomm.com

To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
To: Jens Wiklander <jenswi@kernel.org>
To: Sumit Garg <sumit.garg@kernel.org>
To: Peter Huewe <peterhuewe@gmx.de>
To: Jarkko Sakkinen <jarkko@kernel.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: op-tee@lists.trustedfirmware.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-integrity@vger.kernel.org

---
Kuldeep Singh (3):
      tee: qcomtee: Register qcom.tz.tpm service for discovery
      tpm: Introduce Qualcomm TPM driver
      MAINTAINERS: Add Qualcomm TPM driver entry

 MAINTAINERS                       |   6 +
 drivers/char/tpm/Kconfig          |   9 +
 drivers/char/tpm/Makefile         |   1 +
 drivers/char/tpm/tpm_qcom.c       | 413 ++++++++++++++++++++++++++++++++++++++
 drivers/tee/qcomtee/call.c        |   4 +-
 drivers/tee/qcomtee/qcomtee_msg.h |   2 +
 6 files changed, 434 insertions(+), 1 deletion(-)
---
base-commit: d419d682257d813f6cb7a28e42b35d0edf4ad038
change-id: 20260831-tpm_qcom_driver-d21c720e73b2
prerequisite-change-id: 20260408-qcom_uefisecapp_migrate_qcomtee-13869d45e014:v4
prerequisite-patch-id: faf4520d818abf0d7533f71d9c8b9a8aade34626
prerequisite-patch-id: b487dfe2fbc076f4815dc6c73b9e68b0b78c961f
prerequisite-patch-id: aef7dba7d7662f87cb06bbf5cabca93304843f02
prerequisite-patch-id: bbdd5327c15aeaa99ce9b74bab324a98f084ed48
prerequisite-patch-id: 6263a8a3b40df5cce7fbe4b119f4b9d67a4c06b4
prerequisite-patch-id: 0c1a650a54014eb20f7ab9ec20038b49e42680e1
prerequisite-patch-id: 7be993abea2ca36057d9352381a5890f50996dda

Best regards,
--  
Kuldeep Singh <kuldsing@qti.qualcomm.com>

