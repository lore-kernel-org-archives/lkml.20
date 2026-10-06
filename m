Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D93322798EA
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 00:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791247196; cv=none; b=SOlL0XnWbiiJ1YJ/zCflGxAsZDIPEbLTAgEeupsyZBV9XrDQWnLoumMTBNxJOdUdLjdivho5wa6kn8miZZGFpGR6oj7p0B8B1v8e+yWvCAGgmz1XiwM3Id1pFovI2QhEbq5rUZwnIYUNtpZct2I0F1b7A/XhASKCJh1bOMaRNq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791247196; c=relaxed/simple;
	bh=abj1jjKzR2uaLnvVbZ1eDaH4O4J8gzuXFkGnxdWUm3U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Ga6URi47E+e5ajBOk+yfB72P4RpILTUSkTQaIzj+L/BEjFDAJWU6Dx17zRWNUArZbxw/B6A4j7wN5vXZPRbLBYJzUW2N70IXO1UHvCDNx78QYbOGF1ZLXTVqwQp4D0OV4AiHKhAisiQGyJMgB7b4BiWxqgma7ehbgF6t0+SlWGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OJk1AieW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GBxEimlC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OJk1AieW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GBxEimlC"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695KNGrO3301100
	for <linux-kernel@vger.kernel.org>; Tue, 6 Oct 2026 00:39:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=IsDRn63F1MTcQ80JVeDfNz
	DYjnKG8K9IOfHI2D6YUAs=; b=OJk1AieWEhmc3sW+TPPMYs1Dc47Ie4CEluAbH3
	cpGLNulRnef1HZLRSNwdA0b0C2XRV2huk+MfGIE4hMSvjxzY9eX2Skl2V/zV+UG6
	hWJ4I/CHoJ9su3sqC/tr92yWRibIPxzSdjZzO8Q969b+xKb9Bxf8wEJUBr8FXUFi
	ap7MzkK6kBLBXQARCwjenkf2FsYAEH6zNaSkEWQuKxAXR41w6M551pOMDLZYmotr
	vx+8YrbWjemI9jjmuIiK6bMoBmVQLttNXkXMovt9gS9J5NX8mEDKx1aQBkoO1BPQ
	nsQ6m41O1j2y1ZCx038TuQN1zEbtRzNlBmHyx41SflNBYnIg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4bhg2ra5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 00:39:53 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso4647713eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 17:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791247193; x=1791851993; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IsDRn63F1MTcQ80JVeDfNzDYjnKG8K9IOfHI2D6YUAs=;
        b=GBxEimlC98wruRdfK/ANWWGuLhuoaMXdQRF9bzpT4Cbj3bQburyLbfU1+rU6HaPA6o
         FmNWw/Dvrc3TL5BkxFvR/oVtZ64hp+dlsJ1YX7HnjminwJQrdRwwY3HbMo2936lt8RUp
         3Ryx649EJqC4JBC92O/TTGGEwLHAg6smTFRhavdZEkDYqiHUJXGH4espU66YaoBC6cpt
         0Pgq/3uBlozfqZA3Lw3sMczBTEQEuY75FvEMgJ9FhnMtBADwnzHcImxvk5viLuL48pfY
         JpCXKPhQIWaNQEtWE03TKmL6/zsB/eFaEPfivHM1121sHmAGI8IWGGNPhBSWefAVzL5s
         CQiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791247193; x=1791851993;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IsDRn63F1MTcQ80JVeDfNzDYjnKG8K9IOfHI2D6YUAs=;
        b=d2BJplIbgcHWJ7gVQE97PQUzaMXMGRU1mzdtmD4oH48DOoFyLcR8ZfW78lTY5r+B1B
         NKTXKbdPji5aBzR7lUJFZZ3E6RugxwVs1AJNfxrmMKiLCENJJca5PuoiENnhiEdojj2P
         nPSz1ZqMSNUIb2EFgEWTmLKlSGwCDtodWJHiNY9PJKKlGBigycIx4jWWC0dOm5T00/+4
         JnEy/ohYFeBZH1q6Aua7+s6UdMA7+lQPG16mJ2aoryTzvbwtGLyO6sQiKhLljZrfJ9ur
         bc4W2byyUL34BfoCF4f6f5HkcS8bJutulh0KB2zOpOYMEmFSf+mtQ1ZTJGwD95NF5+23
         mLxg==
X-Forwarded-Encrypted: i=1; AKwUvBwabQ4WHMSAukyfIvpi6w/E64LjunA0MWieaePWlzM30wH7ynFp9/8ey6G7UQwA5i5gRg9AjVU6byhqHn0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKBkaaFTPvTyKWzf3latny+lJrakoz0yZ20ZvtjnCP8dYyilnvT
	oN5a9QkrMLqQzuhyW46WYZFc/01jhTxC51Chr2ZJV83Fo8RG9qoCa9Y/SX3n6JJADchIcVRfgr6
	69oxJ7MxL50X2hJBn+Sxq7dFCvshurxqR3fdDpQAWrGGaz25VVsTOIPNzKRXja5Me3Q==
X-Gm-Gg: AYBFou0m17ImHQMCyYCp+9td+AUdJt0oT+C/rUVwUfk9rZ7IuYoF6LsubJzWWoivaoB
	tZ3KKir5ZQajgSbkesOy2AK1tYtI0IU0CLaE4px/44Ug8ijkoGNBOAVO6KI0F5MRzzI4bH6f5/L
	EfGJVOyCdBaaqtGb7SdRgPdSkFaxL6L8NOQ1A7pcMFiEynQLvQ3Fkz876AOMATsJPaQ6z6RxpOF
	d8GyL/Hs+FSpa7/wpeUBE1Rxt4BITOMNAbA4oPPQ1supYr/eDlYbzwZOqG/KmOzAzbG/k1mGsP/
	3J19EFZO5zerM+pkIA37jLCgkUX2EqGSyVeGKazasdsj2/U3vv2lvVi2vH8epgW4wz/7xmudTaf
	2QOUtsT9ho0bq0rpwlq6VZH8fwaXcpq0xgC+/pXeZ1cOMPwinQgY7rFBcGw==
X-Received: by 2002:a05:7300:4628:b0:34c:d1f2:b552 with SMTP id 5a478bee46e88-35105291bd8mr13290854eec.4.1791247192364;
        Mon, 05 Oct 2026 17:39:52 -0700 (PDT)
X-Received: by 2002:a05:7300:4628:b0:34c:d1f2:b552 with SMTP id 5a478bee46e88-35105291bd8mr13290821eec.4.1791247191741;
        Mon, 05 Oct 2026 17:39:51 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35146ac078fsm2108874eec.22.2026.10.05.17.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 17:39:51 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Subject: [PATCH RFC v2 0/8] tee: optee: add RPMI backend support on RISC-V
Date: Mon, 05 Oct 2026 17:39:44 -0700
Message-Id: <20261005-rpmi-tee-service-grp-dev-v2-0-72f222e23ec1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFBDxGoC/4WNwQqDMBBEf0X23JVkRak9FQr9gF6LB5usulCNT
 WxoEf+9wR/oZeDNMDMrBPbCAU7ZCp6jBHFTAjpkYIZ26hnFJgZSVKlaE/p5FFyYMRWjGMbez2g
 54oMMU1cVrGwHqT577uSzT9/hdr1Ak8xBwuL8d7+Leo/+L0eNCrXVtigNtceyPrsQ8te7fRo3j
 nkSaLZt+wE/f/jqzAAAAA==
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
X-Proofpoint-ORIG-GUID: H66fMh7WwshC5O1nuIFotmbv8V0WA_jv
X-Authority-Analysis: v=2.4 cv=GMGdgeNK c=1 sm=1 tr=0 ts=6ac44359 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pTLlcG3b_zTeakJ_RZwA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAwMSBTYWx0ZWRfX0/J4tqEgJMtW
 oyrf2uh4SWMXxpZpHw93r/4Olr6n8H+stdsdW/NHbMpiJYSQPkLbD245TYoYWw6tYU1qhzY1cMU
 ViYe4I/Ms1Y7/LSoZ2kFb3AH4nu1JF0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAwMSBTYWx0ZWRfX+5A/3KJTfrKf
 TJ6Ys6Bvzjd8/hE5gHS5jJeI5UWIdGYRpl66DfMq4G7GdBtfCK04sCLGuZfwPDGu8bSM9HNi+DE
 rjr4cnqbTzOXV9lotlb2jkodFQDLpui7uMRvcppWSLdSO8pq9Z7d7npURNRpLO4/1JRWX91VuFh
 Mr5QR1+iJjsyydH+o4ItuUyqyP3biJO6fmAb2RzMirYHeCZXLfGVCSBQ0AikwPvNFPsFx44foIg
 Gn3Fv5vugMgO4tkKzeplrtqNEfqvQ1abjzOOGgFS+53MlJiyVzxiig+cjRS/CQ6Cyao16xeMJIO
 2CAd3Wy9U0S6DuzOsci8ggc8myLncKrUOMx7GT/Hu3aywwH2xJeQemP3+v//uYHKc091+xFIDxR
 PNfWRBmxWVGqHQcpVY8C1kwkAQ90zvmj0LQGe8XyNCCMgR8hdqQlW5+26GHHDJLMV+zOQUk7/hH
 sbk0tIlhQ3NgqLRVONA==
X-Proofpoint-GUID: H66fMh7WwshC5O1nuIFotmbv8V0WA_jv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_05,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610060001

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

Matching OP-TEE OS support for this ABI has not yet been implemented.
This remains an RFC for review of the backend integration and the
Linux-to-OP-TEE protocol.

[1] RPMI TEE transport dependency:
https://lore.kernel.org/op-tee/20260928-riscv-rpmi-tee-abi-v1-0-04908b81d885@oss.qualcomm.com/

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
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
Amirreza Zarrabi (8):
      tee: optee: allow RPMI transport builds on RISC-V
      tee: optee: define the RPMI control and parcel-reference ABI
      tee: optee: add RPMI shared-memory and parameter support
      tee: optee: add RPMI dynamic shared-memory pool
      tee: optee: add RPMI RPC handling
      tee: optee: execute yielding RPMI calls
      tee: optee: bind RPMI services and negotiate backend capabilities
      tee: optee: support RPMI asynchronous notification doorbells

 drivers/tee/Kconfig               |    3 +-
 drivers/tee/optee/Kconfig         |    3 +-
 drivers/tee/optee/Makefile        |    1 +
 drivers/tee/optee/call.c          |    2 +
 drivers/tee/optee/core.c          |   10 +-
 drivers/tee/optee/optee_msg.h     |   38 +-
 drivers/tee/optee/optee_private.h |   54 +-
 drivers/tee/optee/optee_rpmi.h    |  234 ++++++++
 drivers/tee/optee/rpmi_abi.c      | 1059 +++++++++++++++++++++++++++++++++++++
 9 files changed, 1389 insertions(+), 15 deletions(-)
---
base-commit: bf1ee2bd5c2da8992f33c8950ef194aaff74ed6c
change-id: 20260912-rpmi-tee-service-grp-dev-b2ce2f63e0df

Best regards,
-- 
Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>

