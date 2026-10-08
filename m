Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FCA52931F4
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 03:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791430125; cv=none; b=HEm6zQheBlIVbyECaje2Hz9IOvKN0thnGeep+g64YnDoXDjJ2HrIHPEZarnNHpOIXNACiDZJWsrWwOxVm+xtuPC62bRtqFdiP3fwudOUBPDxg1xk22HNQPTFItKogJeQIvRP+PcrzqD4nxNEAmEPC5v12UOnkz1Nk63M2XzwMZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791430125; c=relaxed/simple;
	bh=yiJw88o1NE33K/+V3e5PZxRTllIkYcC4XKkFJ47QaEY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mf16IpVRucw62e4OdgWADSYkK09Icoqo2K3aZF7j2H4vimFtxCquQEWIxDUylsrBMehrveYQPj1ahWnq864Mm2GjReM6togc2hyLJaXJOZUjVfnT8/nhIEXhoOrNGPbr7IArUAWoAU6XVri5wG9uOZagjJgWBZaKp+jVGbq84Qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fts2kROd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KZpXgr2u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fts2kROd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KZpXgr2u"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6981hTBu1114212
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 03:28:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=5gK0vuRBFrk8vBpkM5BWnX
	DfFggS1T8IA5KrEN635M0=; b=Fts2kROdMYAjKia4zIi+65KIR+xMwC/gZ2eHfi
	O9RJxWbpfJ9U8+9BCAXzJ1ga63zNX8sU2bMKEaax8gVFIaOHI48MAI0PXYvaRotg
	cmrnlMS9Mb4XWw5dRcdOoD5SyuISsSToYPoLpqWIIDeXNFRIWYvf8WP0QgbNDkLN
	1fxqS5a3Sxt5iSdxFuBmfwZT09qyDiNM2ZNTPeqqL853tRz4IOB1x66NWfuU0NUY
	Rqt7A2amwKCj2ITPgsi2IW/38kXz+g+egW+dyExpVlq/wBcVnpAk0BXpyxyVkku+
	LovvrEEN6jX2AezxcfK3WmFFXFV4tX+P6FUYgSTE8C9587sw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe3h0xc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 03:28:42 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso9122806eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 20:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791430122; x=1792034922; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5gK0vuRBFrk8vBpkM5BWnXDfFggS1T8IA5KrEN635M0=;
        b=KZpXgr2uSSbS1bT7o07CKXu3MLP/DsybLdVi/vlQKb4rYMDLRsgeJk6w28Q1GzSSTm
         yDtOUYW1uwHwCex1LzyH2hAUHJerW9GCLrbps7/weEgDibuVgpEY3ArrdbvdAff5qSy0
         dFDn+8Y43ml5s+iqIgxzaQLmDk52Vp4oSR/MihdrEoA26EL5YM4d4yapL0baKiPbIvia
         euJxWwq0yRMorxmepMVBbDYZQKiX+1zgJ+3BMkUTnk/B3p7DKDtGOF/6nfJYl4igAWn7
         5MXU438wIcXRUzovyQxXM7O72zLN8gv9N0yyqYhSokam+iuAJ376dkbItsaXDvMODx3D
         jGJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791430122; x=1792034922;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5gK0vuRBFrk8vBpkM5BWnXDfFggS1T8IA5KrEN635M0=;
        b=g7VxkJrhUY4CfW9Le75M9+sKZA3tunhnV4dfXdbi+JcIaM1tzZlzXW2NJ1IncCEaK4
         4kf+0zKLOCBiVmtLtk+oGo5kR0Pc+AAIcVHlzgNgMZs99l3Cx3nixGqUxLaXSoVjt0XS
         QBkpqx6CCowYgGYetSCNt12oCY0yaYuwqTbdWkJoDeyafTJotQ+7dM6d2KAcAuT1ymP5
         YF/hshUXkApiVVbyiENP2S6lSeVx5QNEZW5gWW07UDjN7K7AK3wCiGU8xRW9WsBjwTow
         WR92248Eto6BRidgjckm9YnVHosKrbfrvAK7nww04qEb+cb5DnPmAiuiENP37tILUdeP
         cw+g==
X-Forwarded-Encrypted: i=1; AKwUvByC3xcITezTjaynpuftHf6Ki3yHKVKeZDvFRXbqSnCFQo+yI1NPjWiZleooseDYAV2+raHNM9sCXflC8lI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKbq/qcQntij0UT04jSgWsYrnzdAa54qbAUhYqLmER4UJ2sb06p
	R1ERzC4q6rSe1qCdhKypTW5MVLvkQvjHAN9B7MxNJNLz6887NMyoODmgVvp7cZGfZvRzdjE8FIS
	bAvAbJe7t46sJ+qpTtkGr5/i7To5u8+Ge4lUY6oC50f94nDBYDH+xesHnCulLDO1bcg==
X-Gm-Gg: AYBFou07PsxhJfuLKWMFXqZopQ9UPYxtmGWZhkECSfndeu35jvkaEa4mjjySOeV08a3
	utcDj6bLNjTO94T66C826jkXmGQmVRxL2p/NhdWcy3Zbe4u2FaUnR5ig8hMa9YB2ZAiw39ATwdw
	BS+xnOoJF8NRmFKgojiwqzeGV2zQTQivNXmaU/qxmLP4baW6juYF6HV8tWKIvCm7SDwvid7PtHx
	ubXQFcubyBqHQFnWg1vWFEb7NmlmZeGeMsOdKA8l0Oph6cCBJCsS8xmIxl5/67rxQkMGDMYCSUj
	QwxqD+PIAEd5LJsxafGOL9CX873XLfO6sP5NZJ2+EtCpFl0DdFwI0iIwWv3Xfb3Ay92RIwFU5Y5
	dRSHUdTCjKSZu9m5tEseI6qHmkkcq/dr5VOWs5ZoN77V0t1/NqH5UfAP3rQ==
X-Received: by 2002:a05:7301:700f:b0:350:869:d106 with SMTP id 5a478bee46e88-3515de5a743mr4808187eec.34.1791430121613;
        Wed, 07 Oct 2026 20:28:41 -0700 (PDT)
X-Received: by 2002:a05:7301:700f:b0:350:869:d106 with SMTP id 5a478bee46e88-3515de5a743mr4808156eec.34.1791430121023;
        Wed, 07 Oct 2026 20:28:41 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35179d07566sm2168349eec.30.2026.10.07.20.28.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 20:28:40 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Subject: [PATCH RFC v2 00/10] firmware: riscv: add RPMI TEE service group
 transport
Date: Wed, 07 Oct 2026 20:27:06 -0700
Message-Id: <20261007-riscv-rpmi-tee-abi-v2-0-45939a13d223@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIsNx2oC/32NwQrCMBBEf0X27JY0rSXxJAh+gFfpIW1Xu2Cbm
 q1BKf13Qz/Ay8CbYWYWEApMAsfdAoEiC/sxgd7voO3d+CDkLjFopStltcHA0kYM08A4E6FrGCt
 VkHVFUxbWQipOge782UZvcL2coU5mzzL78N2OYr5F/zZjjgpVaZVpTN4Zczh5kez1ds/WD0OWB
 Op1XX9lLf7dwAAAAA==
To: Jassi Brar <jassisinghbrar@gmail.com>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>, Rahul Pathak <rahul@summations.net>,
        Anup Patel <anup@brainfault.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Amirreza Zarrabi <amrzar@gmail.com>,
        Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Marouene Boubakri <marouene.boubakri@oss.nxp.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, op-tee@lists.trustedfirmware.org,
        devicetree@vger.kernel.org,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAxMyBTYWx0ZWRfX6SGIhU5IbguE
 AmOn0S2RATcEJ8wR4i1MwmF/419t+mMfurEnlNfC2lu5rq1Q1znt+5ym//otyFl9ZBpdey0mzrB
 uIIWYVNW4S1AsTcFDaZfI9IR3TGbNAM=
X-Proofpoint-ORIG-GUID: 5INu_2P6gShKfMDoweq8-duXUqVoEDZR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAxMyBTYWx0ZWRfX/OO9/V2Hp3YF
 mZ/cSOXIGNX5ZWXMffXgBBWtbZgX3+JnGR71+i30YlRvglDaqffXNC1Mfk8fGZDcrk+4v1LbFsi
 m7mUxpkRUj85jpjHhP7LIT3OVz/9guTyb/qdbICzSkrMAgNGovCi7MASOzqRHG9V2Bgd6AL6aEn
 RXpTowZvFncQ9ahpBovn4Z0Q6LhuACOUPmWzNg8ZjIwQFT/M4OuE2m8r99rauFFngpbjuB8Hjtq
 rRRnc7s2xFp4+MoxIZ2Sdu6rZ5r35Q7YIIBNR4MqxrobEwTbTcFquzl/2fmLdGpUdGCg5BagOk9
 6SLq26GZMKDry+FFh4RBVkGVFClwhHtWCk9u68/uHNYo0eblHnkSrLswmC6FtoWNOptFrJ+AO0h
 lxJR4jejlgsgIb6ik4hIvnbBFs1vsq44z9fCR0MtIVb0Opn8r5X30SyLDykah1MRiC6mLvxfYi9
 aWNqtFtzb10WcarfTKw==
X-Authority-Analysis: v=2.4 cv=IIuXmQvG c=1 sm=1 tr=0 ts=6ac70dea cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=NEAV23lmAAAA:8 a=V1jnuoLLAAAA:20 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=hZ86olN1w1Q2TqJtmf8A:9 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: 5INu_2P6gShKfMDoweq8-duXUqVoEDZR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_01,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080013

This RFC series adds the RISC-V RPMI TEE service group transport [1],
which provides RISC-V systems a mechanism for Linux to communicate
with TEE endpoints. Linux and a TEE act as endpoints of the RPMI TEE
service group, while the RPMI framework in machine-mode firmware
mediates communication between them over an SBI MPXY [2] mailbox
channel.

The series is layered as follows:

 - Two mailbox patches add a direct synchronous send mode
   (mbox_send_message_sync()) and its implementation for RPMI MPXY
   channels, needed because RPMI TEE requests must complete
   synchronously in the calling context.

 - The RPMI TEE bus registers one device per discovered TEE endpoint
   and service UUID pair, following the device-per-service model,
   so individual service drivers can bind independently.

 - The RPMI TEE transport core binds to the mailbox channel and
   validates the RPMI and TEE service-group versions before any
   discovery or service traffic is attempted.

 - Discovery uses PROBE_SYSTEM, PROBE_DOMAIN and PROBE_ENDPOINT to
   obtain the local endpoint identity and enumerate physical TEE
   endpoints and their services.

 - Memory parcel operations (lend, share, reclaim) let a consumer
   driver share memory with a TEE endpoint. Linux creates a parcel and
   the parcel identifier is then used by the consumer's own protocol to
   refer to that memory.

 - Signal buses let a consumer driver exchange asynchronous
   notifications with its TEE endpoint in both directions.

This series only establishes the transport, bus, and discovery layer.
An OP-TEE backend using these interfaces has been posted as a separate
series [3].

Feedback on the overall architecture, the bus/device model, and the
memory-parcel and signal-bus abstractions is especially welcome at
this stage in this RFC series.

[1] https://github.com/riscv-non-isa/riscv-rpmi/commits/main/src/srvgrp-tee.adoc
[2] https://github.com/riscv-non-isa/riscv-sbi-doc/releases
[3] https://lore.kernel.org/op-tee/20261005-rpmi-tee-service-grp-dev-v2-0-72f222e23ec1@oss.qualcomm.com

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
Changes in v2:
- Fix memory-block address encoding to preserve the full physical address.
- Report the blocks included in the initial segmented CREATE request,
  rather than the total parcel block count.
- Correct the CREATE block-count documentation and remove an unused
  include.
- Stop signal retrieval during shutdown so continuously arriving signals
  cannot prevent the notification workqueue from draining.
- Drain notification callbacks before unregistering child devices, including
  on partial registration failure. Keep the mailbox and signal buses
  available until client removal completes.
- Allocate signal-bus state before firmware setup and use automatic
  cleanup on setup failure.
- Skip disabled System-MSI nodes when locating the notification IRQ
  controller.
- Add rpmi_tee_info_ops.msg_limits_get() to expose maximum TEE_CALL
  request and response payload sizes, excluding transport headers.
- Cache TEE_CALL payload limits during transport initialization and reuse
  them for capability reporting and call bounds checking.
- Include missing <linux/idr.h> for the RPMI TEE bus's IDA APIs.
- Replace SYSINFO descriptor-table discovery with PROBE_SYSTEM,
  PROBE_DOMAIN and PROBE_ENDPOINT, and update service and feature
  identifiers to match the revised RPMI TEE specification.
- Move discovery into discovery.c and shared internal declarations into
  rpmi_tee_private.h.
- Store discovered endpoints and their service UUIDs in per-endpoint list
  entries, avoiding array reallocations.
- Link to v1: https://lore.kernel.org/r/20260928-riscv-rpmi-tee-abi-v1-0-04908b81d885@oss.qualcomm.com

---
Amirreza Zarrabi (10):
      mailbox: add direct synchronous send support
      mailbox: mpxy: add direct synchronous send
      firmware: add RPMI TEE bus support
      dt-bindings: firmware: add RISC-V RPMI TEE transport
      firmware: add RPMI TEE transport core
      firmware: riscv: rpmi-tee: discover TEE endpoints
      firmware: riscv: rpmi-tee: register TEE services and support calls
      firmware: riscv: rpmi-tee: cache TEE capabilities
      firmware: riscv: rpmi-tee: add memory parcel operations
      firmware: riscv: rpmi-tee: add signal bus support

 .../bindings/firmware/riscv,rpmi-tee.yaml          |   35 +
 drivers/firmware/Kconfig                           |    2 +
 drivers/firmware/Makefile                          |    1 +
 drivers/firmware/riscv_rpmi_tee/Kconfig            |    8 +
 drivers/firmware/riscv_rpmi_tee/Makefile           |    8 +
 drivers/firmware/riscv_rpmi_tee/bus.c              |  202 +++
 drivers/firmware/riscv_rpmi_tee/discovery.c        |  383 +++++
 drivers/firmware/riscv_rpmi_tee/driver.c           | 1583 ++++++++++++++++++++
 drivers/firmware/riscv_rpmi_tee/rpmi_tee_private.h |  128 ++
 drivers/mailbox/mailbox.c                          |   72 +-
 drivers/mailbox/riscv-sbi-mpxy-mbox.c              |  196 ++-
 include/linux/mailbox/riscv-rpmi-message.h         |   13 +
 include/linux/mailbox_client.h                     |    3 +
 include/linux/mailbox_controller.h                 |   10 +
 include/linux/rpmi_tee.h                           |  200 +++
 15 files changed, 2772 insertions(+), 72 deletions(-)
---
base-commit: 6375e61c01e93e35ee7acd336a689ac1fae4b509
change-id: 20260928-riscv-rpmi-tee-abi-603e9a3b4399

Best regards,
-- 
Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>

