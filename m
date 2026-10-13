Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7133F3CC7CC
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 05:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791870109; cv=none; b=K7etZWZSF3qPO2wxdkfw3Q3HigSyfo2yk9NNBR85gUu3WwUL0dxpfrEyivwOhZjFhtoZeNcBysKAfaYBh5ZgRgWBSZT7+VmC3czLzwd35kUy9/KCVPUh8RitU5ZM5BGFMOs5tJ+PQ2d/K85K15lS8j6szOpfVD8vLtFlS8B1h5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791870109; c=relaxed/simple;
	bh=GmyzzdSR34wcKZ7wk84YNudIPZ2Gqjk5ieu6wm2qqMw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=S4+dMxae4F3FcSJ62yYDtXc7/mg9zlTXzRUzCtcbGmZsZDkaTvpXg+n5J1jzvmP4gg2AJIW5l4YI2N/a1KCcwBJIo6zWA1UXaD2Mv0wVL8ajPQJvwfVEKcaqI5vSRwMaJCAF8EMGgiZoA7y7waRF/Frq8tNW5a8iomwFfu/nQEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gqdYoTgZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MEWtJPO7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gqdYoTgZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MEWtJPO7"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D3x7Dt3475851
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 05:41:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=fywdYSI+QwC3MxSFOMdWKg
	lnBFD0ZX+8NEQ03S4/7tA=; b=gqdYoTgZGf5IjK5iUfVOUexRw3UKrGN6us/1gm
	IUlMQFYerLX4BtF5n2YMb0M+BsEwQClp+WuY4ZdGO7R0Y5IP3RVhp40sLp9TaZhz
	LAjwZFPF6d3iXQQo+5QJhXP3EjSm0hfTOeqkB3Ehj4ShFIg9l90tastmJb2XH5rv
	6IUfqXw2aMg3i1BdCF6pVYT5M0hLNFU1QAizwO5B9ZSTx5muoM9yBDXnQEn4+dN3
	Sa8+oQQLZatkaJ8cj6SWUBSIImg4JPKhb7z7wLIbuXBNlF8s5rVuJD2De/rNrvJl
	RXvh+t7XP+1cZXsmbOvDaK0AV+StZe6FcD2CrAM8dJQzmO7A==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9d7j8aw4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 05:41:47 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ab27eb38d6so2663386a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 22:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791870107; x=1792474907; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fywdYSI+QwC3MxSFOMdWKglnBFD0ZX+8NEQ03S4/7tA=;
        b=MEWtJPO7fmQmP4ER31RoIoFgcizn2gt7taSFY6bhvrIuIT3Hh555cqM2T6B520t8a3
         yQhh9OJSazvmKaeq8Uo66WQuX3uBEo03QpozwCjvHYUP8amHU8nWzLf3sOGDWBWQweDt
         nu17uZiD8NVDuekQm8+WJWVeuOh6sP18v8APM5sn6tf+zY5Np2pQS4Fw4WxuYVGllGyY
         8n0jc2vbAKYrHMb6BREGgWVBw75q9n7HL9XWJvwWEEx5dmWa6pSc09A+g1/9EPnHNS6N
         4UxtELlAmId2PJys0E7yry6iJZuZIwcp9cjNZb8rczmlk//f5o2Or7nLQ2Uj+jpfSlc+
         ySng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791870107; x=1792474907;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fywdYSI+QwC3MxSFOMdWKglnBFD0ZX+8NEQ03S4/7tA=;
        b=znem+nTvtLspVGkoYLy/ZMOwK0iomg9jtn4JZAVMo3De3IIQWGfklIA9JovGBCMRdF
         wYgIptbLGg6/xFXJKx2oRDELitOG+egyt5GgUD8UjnDg2+l/wy4t+RGMkMlYIa5b0yB4
         ryejd2thT/8ZKa5FJvSAqDsoCM0FdBp+GPNNf4hvVn5jyjvoHZvuuEUQ9ct/nlEENqRw
         6utX/tPJWmujvHmlfowgTjP/NUcefF09xKlxBFIEi6GFTAx5ENdY0HbHjwXtsWW/j2/4
         QszXamX4Y2EkHgLbikc/iUBwZvK0YKnJCXjX6FFBCGRn7Mk+i2A2WISgILGPz6z+E0uG
         HkHw==
X-Forwarded-Encrypted: i=1; AKwUvBzwk5HDB3BmgJdkXlXeGVE+OA8B0cCK55deBq+2UxEbhEQIU9fJY8+7T5DVt0G+N/XUqmMQCuzSMonCxrs=@vger.kernel.org
X-Gm-Message-State: AFq9FYL6bpYTeHNR6uUWRo4qw65Yib3O47CGQEBH/+UtII2yNf3pDN73
	rhIAsJ9iyb2N+ss02Yy9ooCLdk/0EesR7gVEYeqGgSXPKVX5cUIqDbAWXBOgsbb3m44t5ZN0+7m
	vLLVgan1w6CHn7QANzB/neJ+3Wk9cknj2SUyrHQQCxwStiHL1L1Kr29AVUXc58qVQ0Q==
X-Gm-Gg: AYBFou02ymoUgrgp5Pqy+DCRp+Q0Ltrbm3OKqoMrpZBkt9hgUj9quK8HcHSpIPS9P+8
	CS1qur6iOoq/jR3vQPVd9k2wyW4MbRTVRdJRo1sRpV35ICZK3FDRADgP53t8vBa6B7y+Xl2XJbS
	6f+XMbXi00iuVCgodqUHupy9UcOiDd2FIrGH+AY2PymOVHcmq4PZuMBVaCZqUEWp2ueKLOI/CzU
	L+LrtopCO2NM77D0zqV4qdp6PptBPp0PNHqfBBWV+Li/zkyyBwygUk2L5HixGNW18oYrrhtEBwS
	Xdszm7TGNDTVOYMVHWSBEGd/j5C36yk65NxJ7DIKhvYfy6LK3NW89TB1dh8IA/uL1+o5gslbPEj
	9kbUMqHF7csXLz+c+sxVAbHv9iE5izi6bu/NhvhOWZ3sHsqJuhElpp2GT0A==
X-Received: by 2002:a17:90b:28ce:b0:3a4:85c4:68fc with SMTP id 98e67ed59e1d1-3ab3a79df67mr9708190a91.29.1791870106686;
        Mon, 12 Oct 2026 22:41:46 -0700 (PDT)
X-Received: by 2002:a17:90b:28ce:b0:3a4:85c4:68fc with SMTP id 98e67ed59e1d1-3ab3a79df67mr9708173a91.29.1791870106161;
        Mon, 12 Oct 2026 22:41:46 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38f4863esm22926361a91.11.2026.10.12.22.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 22:41:44 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Subject: [PATCH RFC v3 0/9] tee: optee: add RPMI backend support on RISC-V
Date: Mon, 12 Oct 2026 22:41:27 -0700
Message-Id: <20261012-rpmi-tee-service-grp-dev-v3-0-975b574667e2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIfEzWoC/4XNwQrCMAwG4FeRns1oUzadJ0HwAbyKh9mmW8Gts
 51FGXt3Sw+eRC+BP+H/MrNA3lJgu9XMPEUbrBtSkOsVU10ztARWp8yQY8VrgeDH3sJEBKkYrSJ
 o/QiaIlxREZpKEteGpfroydhnps/sdDywS1p2NkzOv/K7KPLpvxwFcBBaaFkqbLZlvXchFPdHc
 1Ou74s0sh3x4wnOyx8eJm+DBhEJJSnxxVuW5Q12Ove/HAEAAA==
To: Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Rahul Pathak <rahul@summations.net>, Anup Patel <anup@brainfault.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Marouene Boubakri <marouene.boubakri@oss.nxp.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-GUID: WqidBPZj57o_SuCWkPoA3ByeKyQyHrd6
X-Proofpoint-ORIG-GUID: WqidBPZj57o_SuCWkPoA3ByeKyQyHrd6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAyMiBTYWx0ZWRfX7LB5f/VHwGuu
 7P2UekrExnjglFY4fL+oBpJlmj07VA2g4tbbN32LtaYZijdI7lnTqvUwx8l6TuTfUmer08uaQmS
 WlhMZ6VUf+6GDQiJAK8LN0een+Rp/w0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAyMiBTYWx0ZWRfX5IKUGQve0DiW
 PmKv2XHkBv9VbZNc3USIx+14wPY/SrByIB0KwlomIXTSVTxNm3lfvF/Hc/+mw9ABGV9vgCSHFZX
 3c581ulVgeNis/+gYRuKQG7p1RHdRjB0JdiEGpLPkflHnPwT9F6h3evjI0QE529KER+R1Pg/DNZ
 qFwrJroFnEv2K0MH/dsioywe/3BbkawUgy9fpm5g9OB4br9+LB7mCFASetjUPlpIOvkqibGLDDN
 UbZn4k1BqZaj1Vu0xl5rEj3FYTEMfbXhsipR4FQ8GGNVEknLW0PlV6AxEqgVD6bS9KvYaXBY70Z
 ltY5bNI9Iy1466iP5pl0e0ZhwDB0i8ge4ydLztxFabF+wz9tODPUUUnGDA9qX3u+jXqwKadsEw2
 wSRP2an9nkHhuARCwY/Mtd0DHEFXpWDtswxPgvaEs8Q4iX71NUR6XorIf1NkSrchFPo6sOHouz6
 UIz+boVi79MjvuVtceQ==
X-Authority-Analysis: v=2.4 cv=PMGaavqC c=1 sm=1 tr=0 ts=6acdc49b cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=CKDX5oWuAds2uq8u-J8A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130022

This series adds an RPMI backend to the OP-TEE driver for RISC-V.
It builds on the separately posted RPMI TEE transport series [1],
which provides service discovery, synchronous calls, memory parcels
and asynchronous signals.

This revision is effectively a full rewrite of the original RFC.
The generic RPMI transport has been separated from the OP-TEE backend,
and the backend has been reworked around the service bus and a new
OP-TEE control ABI.

Unlike v1, the OP-TEE backend no longer manages SBI MPXY mailbox
channels or implements RPMI TEE service-group operations directly.
It binds to the OP-TEE service UUID on the RPMI TEE bus and uses the
transport's public operations. No additional OP-TEE device-tree node
is required.

The backend reuses the common OP-TEE session, shared-memory, argument
cache, call queue and RPC infrastructure. Shared memory is represented
by RPMI parcel IDs and nonces. Yielding calls pass command and RPC
buffer ranges within a parcel and resume suspended execution using
an opaque token returned by OP-TEE.

The OP-TEE control ABI uses fixed-width little-endian messages carried
in TEE_CALL payloads rather than reproducing FF-A's register-based
message layout. Asynchronous notifications use an allocated TEE-to-REE
signal as a bottom-half doorbell, while ordinary logical notifications
continue through the common RPC path.

Matching OP-TEE OS support has been implemented locally. OpenSBI
integration and end-to-end validation remain pending. This remains an
RFC for review of the backend integration and Linux-to-OP-TEE protocol.

This series depends on:

- The RPMI TEE transport series [1].
- The OP-TEE notification bitmap fix, which allocates space for the
  inclusive maximum notification key [2].

[1] https://lore.kernel.org/op-tee/20261007-riscv-rpmi-tee-abi-v2-0-45939a13d223@oss.qualcomm.com/
[2] https://lore.kernel.org/op-tee/20261009-fix-tee-max-keys-v1-1-1462d96bf438@oss.qualcomm.com/

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
Changes in v3:
- Use GlobalPlatform TEE result codes for OP-TEE control responses,
  keeping them separate from RPMI transport errors.
- Combine the parcel ID and nonce into a single 64-bit global_id.
- Make resume tokens opaque 32-bit values and track initial versus
  resumed calls separately.
- Remove unnecessary __packed annotations from the OP-TEE ABI structures.
- Share the global-ID-to-SHM mapping implementation between the FF-A
  and RPMI backends.
- Replace the fixed SHM nonce with a per-instance IDA allocator; reuse
  nonces after successful reclamation.
- Report the maximum notification key instead of a notification count,
  and use the negotiated maximum during initialization.
- Consume capability-exchange results during probe.
- Remove cleanup macros and use explicit resource-management paths.
- Use rc consistently for Linux error returns.
- Replace unnecessary unaligned accesses with endian conversions for
  naturally aligned ABI fields.
- Link to v2: https://lore.kernel.org/r/20261005-rpmi-tee-service-grp-dev-v2-0-72f222e23ec1@oss.qualcomm.com

Changes in v2:
- Effectively rewrite the backend around the separately posted RPMI
  TEE transport and a new OP-TEE control ABI.
- Remove backend-owned per-hart mailbox channels and the OP-TEE-specific
  device-tree binding.
- Replace the register-like control payload with fixed-width messages,
  explicit command/RPC buffer ranges and opaque resume tokens.
- Add a parcel-reference parameter layout carrying the parcel ID,
  nonce, and 64-bit offset and size without changing parameter size.
- Make argument-offset support part of the baseline ABI and retain
  the common shared argument cache.
- Use a transport-allocated signal for asynchronous bottom-half
  notifications.
- Link to v1: https://lore.kernel.org/r/20260912-rpmi-tee-service-grp-dev-v1-0-1d1d35c2a859@oss.qualcomm.com

---
Amirreza Zarrabi (9):
      tee: optee: share the global shared-memory ID mapping
      tee: optee: allow RPMI transport builds on RISC-V
      tee: optee: define the RPMI control and parcel-reference ABI
      tee: optee: add RPMI shared-memory and parameter support
      tee: optee: add RPMI dynamic shared-memory pool
      tee: optee: add RPMI RPC handling
      tee: optee: execute yielding RPMI calls
      tee: optee: bind RPMI services and negotiate backend capabilities
      tee: optee: support RPMI asynchronous notification doorbells

 drivers/tee/Kconfig                |   3 +-
 drivers/tee/optee/Kconfig          |   3 +-
 drivers/tee/optee/Makefile         |   2 +
 drivers/tee/optee/call.c           |   2 +
 drivers/tee/optee/core.c           |  10 +-
 drivers/tee/optee/ffa_abi.c        | 133 +----
 drivers/tee/optee/optee_msg.h      |  23 +-
 drivers/tee/optee/optee_private.h  |  73 ++-
 drivers/tee/optee/optee_rpmi.h     | 263 ++++++++++
 drivers/tee/optee/rpmi_abi.c       | 972 +++++++++++++++++++++++++++++++++++++
 drivers/tee/optee/shm_handle_map.c | 138 ++++++
 11 files changed, 1498 insertions(+), 124 deletions(-)
---
base-commit: bf1ee2bd5c2da8992f33c8950ef194aaff74ed6c
change-id: 20260912-rpmi-tee-service-grp-dev-b2ce2f63e0df

Best regards,
-- 
Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>

