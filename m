Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E0342882B
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 10:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789208151; cv=none; b=HeJgbzkCeAvCHEstMnYj0sL9Rep7LDjv1r6k1Y7fW1SglcyH9BuecDmGyCOTx57gG+uwO8SFUSGdm4wcfPNjt8FjBvNPzrzoBTlnFeF2N2WE8DkywcwYgTmTvWwid5enwDak7vGKCbym1ma/lv7yJYM0ujZvOdVsOze2xB7MtGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789208151; c=relaxed/simple;
	bh=3i/FrZXVmWI7Atm0YNsVJ226agJdLQqGFQnqYBQUV1U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tW3DJ/AObg/nBjFZ4D1D3HR2oaIHn7wVhqNycpGMOdE/fBWGZOLd+ZNCBId05jdnA5G/rDmPRsZz763kL+ydk1SmPf/SWtZNm8GqzZUESPKkmL3S4TKAoBwUqj0W3G1odTBXxGO8ivcUxlLL5gaPvBKOc/BSchvksUJoosj/Obc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hZNawyG1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hi3yII+w; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hZNawyG1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hi3yII+w"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68C852xD1803872
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 10:15:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=R5jHNQqpCxih0uhIATPS5R
	+CswhgM6mi1nkI0T2LCp8=; b=hZNawyG1cAWEXrtAytMyqklfS03eL509lBJneE
	b2VbFNBOd5m5zXDHkmAUqxntKNhlOVwtcx1/mOjxlsRg7zpPNlaHlN8G4bioqCva
	VWbNBG7R6+PnTjBdIj40swU6nbXPGIBGqNv+25uClJFoSFY+FDU6CLkqArHsUDKb
	PDmAOuT86uAAQkJVlLiWSoBY4dxCHcKrVxCAPQMFnIsLVIXvf+LVm6SLJVgiUwpJ
	6rtd9w3vJvA435vbapOsOzEz1p6FCcvCklRYok9IPml02JWekCwv/e+koo+3f8ns
	XcyFWa0RdyEeJ+e1iykMy/GHhUHrkjHRHXBiJ6+sD7CWd2Ew==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9c8nyq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 10:15:48 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e7ff7b375so2195232a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 03:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789208128; x=1789812928; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=R5jHNQqpCxih0uhIATPS5R+CswhgM6mi1nkI0T2LCp8=;
        b=Hi3yII+wMTKvV3nJ7Rl0CaibiAzeiHUcZF/sVuscKGOqv1FiciUq1jPI8uKCPtlWJG
         ItV2+pCP7o9H5uN4DLS7BFvRVUzzp3Ji8EXrwWNAxfSNdo5fU+5Be3ozXlCdv8TKWLRO
         9HZS9X9odo4jivFZm0JFC8DA8HJejk8u5Qo/D5mxcy6T5lA1fJTSV7j4klgho6OkYuLP
         LoGRK6LfXyDiLi6hdsNWV74jFZx9WxWikEWyisYoHn14W8phdn8sJnNuPqAMde3hAJkT
         ig+y4F0++plORtsm48912NExuelmBOUUxJtMEmz1AKo/ON6ew0J9DpmncbPcufR83pGs
         ic/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789208128; x=1789812928;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=R5jHNQqpCxih0uhIATPS5R+CswhgM6mi1nkI0T2LCp8=;
        b=oPJACPzy6TusR3tegaz8ObCAI6rrRrrqpt7tyO20ou2NGLVPeNYIq1NTD5wVYfWFij
         Bq8XkBt1ajFTHoQ0Hq1WBspo4JzDCMiNed0Hlgn/KmBgoeW3oPtsqxtNf0hCsbSAdcrA
         qUo7o/Sx4xAF9ZOXtN8YVnX9bulZTbm6j1xXw3iHG6eBmDkG5Uld93OrHRoOhQCNugUQ
         j/stgJMARjr2+KfhaHD7R5QHE0nZ3BTfxdNQLYZgwwx9WKbl//rv9cbjtAJNwBbCj0uC
         +QMgvIS0AhDbyxx8Qqg+DqksN/oacKOq5KYnfP7Ww5O0HeW8JI1j+N2m0VkLpLecb/7Q
         ACSg==
X-Forwarded-Encrypted: i=1; AKwUvBxWl/MxgwT8xDUMaH81/WWS+2+WbYTs3N3pP7LoJbi6LdlY6UaD4UUWabOIf5pa2H4jmjmhTu47YkyQeco=@vger.kernel.org
X-Gm-Message-State: AFuF++lhabW3zRKE/q7MTT1E5nanMGHj+wlftXIEbj2LV2XrX5LODb/n
	ScBlA5u1dQAfRHr4+cjLM0po01Oci/0GgCnv3Rh1Y8EfwJ59Yp26WPXI0Z/GnyklAAOUE7aNhWF
	XZWWTiNQOQ+dH2zX+UGF5XVIkG1w7iML/2Eh9D0ypdZjN0Zq6HL4N3tUIdshs5280IA==
X-Gm-Gg: AYBFou1GpGn8FgyI+ACma7ImvUnMP+6uVhohOQVhQNzTs/9gpot3GCPtZxR32ZpmXLf
	ppWzO/16SzD3zXEiPXnLOT3pOMfNUBd24sSDF1mN2J9UGg0Yv7GlHjrkiR82903wfXHaelK/DcM
	r9E+f8Tfl3b9oKIANvWKqApuiER0zYolRGqyLnK4/4ZNqZUbvF0+PB96OfYqB0ayte/ICA4q3p0
	udbT9PUv9begI59X3cjfzcGrvWRwy+PT0yn1c313n1JLAoASEf0rNkvHs6uH6od0gQTWw7w3I6Y
	jNAhV630uiKRaszquCJdow1fi6IOUYFZbqAGxfgQaOhTzbBqQ0jMB6nBZjX85e2GGG8vOYr6pZr
	ZHEXUm460pxgfqyAwsARcQ57tI+LnqwSU7A/jQony/FVsHKQ23s7FslyREv0=
X-Received: by 2002:a17:90b:4b83:b0:396:b98b:a3c2 with SMTP id 98e67ed59e1d1-39d9bd67a22mr13716500a91.8.1789208127850;
        Sat, 12 Sep 2026 03:15:27 -0700 (PDT)
X-Received: by 2002:a17:90b:4b83:b0:396:b98b:a3c2 with SMTP id 98e67ed59e1d1-39d9bd67a22mr13716438a91.8.1789208127398;
        Sat, 12 Sep 2026 03:15:27 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33baf0ea9a1sm10340085eec.8.2026.09.12.03.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 03:15:26 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Subject: [PATCH RFC 0/5] tee: optee: add RISC-V RPMI TEE transport
Date: Sat, 12 Sep 2026 03:15:11 -0700
Message-Id: <20260912-rpmi-tee-service-grp-dev-v1-0-1d1d35c2a859@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC8mpWoC/x3MMQrDMAxG4asEzRE4KgTatZADdA0ZWvt3qiGpk
 YMpmNy9puMbvlcpwxSZbl0lQ9Gsn73F0Hfk3899BWtoTeJkdNdB2NKmfADcYFEPXi1xQOGXeEg
 cL3AhUuPJEPX7X8/0mO60nOcPQEwISG8AAAA=
To: Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Rahul Pathak <rahul@summations.net>, Anup Patel <anup@brainfault.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-GUID: DHH0dqQPnq_ONkAzMjxjpCL-Sed9HwiY
X-Authority-Analysis: v=2.4 cv=Pv4G/AM3 c=1 sm=1 tr=0 ts=6aa52654 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=NEAV23lmAAAA:8 a=V1jnuoLLAAAA:20 a=EUspDBNiAAAA:8 a=MT4jQWGmPZThi4S9qkAA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDE0NiBTYWx0ZWRfXzuLwQdvk3xjR
 pk3VJzF6/WMSrIbJNnlRIIMA9MEiwcnxmqTgr88WXkZ6IZqcKB21jDDkw4hYVQbdeJDbXnZ6C2B
 PsKAy57T1p3K5hNDvW6dBRig7jU7Dsk=
X-Proofpoint-ORIG-GUID: DHH0dqQPnq_ONkAzMjxjpCL-Sed9HwiY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDE0NiBTYWx0ZWRfXxt4LWVVPDW2H
 IUyiu6A/cYhBa3enn3wzBaWQCXnaRMRwrJcpsj8BEgRe8+d/2wqB1midPF60hHCx7WhWpkCP2Fh
 ZQ3Qe/hvsvul5jybFNhaJ24w+MdBhvDlBMq9ZkXkDDlfkNUXh3MBS3gp0CDlvHW9aUGQJjIUWYd
 SBkc78cjUzlRl9dip8D3HjonPCLe9Tl4/HnTI3d/0Jn0ZgSU9HyYmrS8GNTDlu8K7UFkXymJNXE
 EL2qj5QHrNNmxDbrnb16HidR7fMf4AU8JSznqflu2TtSmygQNqptZU5ojeRmP4gMs95q6aNvffB
 ZGswDR5bF6rcwJ3fZWmBlWqbc33iABFyVSoASWHx/NliwgEgZxQu03BhMMXkkUkUFrjU7I9ND1a
 0Rgm2d/ctrRmocn3CcPnfTROB42ZmKWx7kyZwTOfg250maky9w6qTMQBpNgFwPDWsOeg9YLZG6k
 QcoHUTpwjVu7smJCopw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_03,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609120146

This RFC adds initial support for communicating with OP-TEE on RISC-V
using the RPMI TEE service group [1] over the SBI MPXY [2]
mailbox framework.

The intention is to provide a transport for RISC-V systems similar in
purpose to the FF-A transport currently used by OP-TEE on Arm systems.
Linux and OP-TEE act as endpoints of the RPMI TEE service group, while
the RPMI framework in machine-mode firmware mediates communication
between them.

The implementation closely follows the existing OP-TEE FF-A backend in
drivers/tee/optee/ffa_abi.c. Where possible, the same overall design and
lifetime rules are preserved, with FF-A operations mapped to equivalent
RPMI TEE services.

For shared memory, FF-A memory handles are replaced by RPMI memory parcel
identifiers. Linux creates an RPMI memory parcel for shared memory and
makes OP-TEE a receiver of that parcel. The parcel identifier is then
used in OP-TEE message parameters in a similar way to the FF-A global
memory handle.

RPMI TEE_CALL is used as the entry mechanism into OP-TEE, serving a role
similar to the FF-A direct-message path. The request and response contain
a small register-like payload carrying the OP-TEE call information and
state required to resume yielding calls. The existing OP-TEE call queue,
RPC handling and shared-memory infrastructure are reused as much as
possible.

The transport uses one SBI MPXY mailbox channel per hart. A TEE call is
issued using the channel corresponding to the CPU on which the call is
running. This preserves the execution model where entering OP-TEE on a
hart results in secure-world execution associated with that hart.

Shared memory is implemented using RPMI TEE memory parcels. The driver
maintains a mapping between parcel identifiers and struct tee_shm objects
and uses parcel create and reclaim operations to manage the lifetime of
memory shared with OP-TEE.

Asynchronous notifications are implemented using the RPMI TEE signal
bus. The RPMI TEE service group does not provide framework notification
events corresponding directly to the OP-TEE asynchronous notification
mechanism, so the signal bus is used to carry notification values from
OP-TEE to Linux.

This is an early RFC and the implementation is not complete. There may
still be functional bugs, incorrect assumptions, missing pieces, or
interfaces that need to change.

The series is being posted at this stage primarily to get feedback on the
overall architecture and on how the OP-TEE ABI is mapped onto the RPMI
TEE service group.

The implementation deliberately follows the FF-A backend and ffa_abi.c
closely. This allows the existing OP-TEE driver design to be reused and
keeps the RISC-V and FF-A transports as consistent as possible. Some of
these abstractions may need to be adjusted where the RPMI execution,
notification, or memory model differs from FF-A, while others may
eventually be shared between the transports.

[1] https://github.com/riscv-non-isa/riscv-rpmi/commits/main/src/srvgrp-tee.adoc
[2] https://github.com/riscv-non-isa/riscv-sbi-doc/releases

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
Amirreza Zarrabi (5):
      optee: riscv: add RPMI TEE service group transport
      optee: riscv: add shared memory and scheduled calls
      optee: riscv: enable persistent shared argument cache
      optee: riscv: add asynchronous notifications over the signal bus
      dt-bindings: tee: add RISC-V RPMI TEE transport

 .../bindings/tee/riscv,rpmi-mpxy-tee.yaml          |   65 +
 MAINTAINERS                                        |    1 +
 drivers/tee/optee/Makefile                         |    1 +
 drivers/tee/optee/core.c                           |    8 +-
 drivers/tee/optee/optee_private.h                  |   47 +
 drivers/tee/optee/optee_riscv.c                    | 1621 ++++++++++++++++++++
 drivers/tee/optee/optee_riscv.h                    |  334 ++++
 include/linux/mailbox/riscv-rpmi-message.h         |    1 +
 8 files changed, 2076 insertions(+), 2 deletions(-)
---
base-commit: 68142f986ff04b2b70b31db00f719bf690f64a9a
change-id: 20260912-rpmi-tee-service-grp-dev-b2ce2f63e0df

Best regards,
-- 
Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>

