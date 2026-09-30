Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4614E9C37
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 14:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790779953; cv=none; b=HuwiykafeOBTUZzMPkEAnZnBrKZ1Rm8DBRjwXl4ePMRfrBEfP+KhF8O525FkrGEcIGnr5Z3W5lz7JjQhkuJrGHDm4gwCvLuzuejSH9Y8YuxPnn6WfyI0wZAKjTfBU6/luvjnHTHnXiODIh3ysjAjRg9QFAFsMLA7nYTG8NI7Pew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790779953; c=relaxed/simple;
	bh=9cXLQQHKl6yEKaTCBAgfXYVQ5NuyFBWmetQmFW80k6Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RMA7iIwFGwLJ/+fOn3SBoi0cJzZ0HJnImM3SnhN4AKlSTfTh36xmodREMcaUiyvMrh5UwBc6uVqTyVwMNjlJsOBZNsDo5qu3k6z2KEKSC5+fx/skx3I60n6+RDAEwJJH70+r9hJm/qH2VaVgF4k68m+VAhRTMrfAOaDg62hd2IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g4vmgpR+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PlV9kU1i; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g4vmgpR+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PlV9kU1i"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UE042s3942332
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 14:52:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Xm8ZEn8ghmOcAG3oNkRt/e9q/WbJ/MPAnge
	ljbhU5zk=; b=g4vmgpR+Wv07QF4yjUx3TTAZx5u3STyLEcb+kOa7MSOFCac/7mS
	PBph/bxk3J8/oY00Is2fhhNR7Zk2JKpHWvQ3uE85tVrNvM8CfFKkT89kOhdf/xKv
	ORFvzE4LkDRydyo/LoN4hI44GNmZcriByZHEEI3LsfqRb+JPhn7ol8we51zLukeV
	w2q7Xt6P7OUlNufe2GoXgbNEiOINH78xsHsavpU1r2w9Ks8tmH9tACzJxm5w7GpD
	1RIA+aS/kQq7ExbmuroVz/tZ9CiD/h8Q04nHETLEOm4sa/o9V1IN22pOb6lTH5OK
	a/2RtiCDrlSYOhj3/meKR1niJOq3NgPwG4Q==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h10bk96uv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 14:52:21 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-34d49d8dee1so463377eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 07:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790779940; x=1791384740; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xm8ZEn8ghmOcAG3oNkRt/e9q/WbJ/MPAngeljbhU5zk=;
        b=PlV9kU1iaBRQesYC3WrtcmAV+VXaPFJJaIwVSv+uKHVIm0AWhTSAwaXMw+szEb97le
         2V6ayCRnR83Z855T4PHPiw7WfhfAwnvr0FV4O2xlw1E4qqA69B16XRVzReIpicnVHMho
         vVcKCa3EH1sPMioNGkyWg+VIngy+tttk+Aow6zNshpRE3pumtlLXpI9f0XqSuEv45Y/E
         pt87MOpcFc6UpDvQHKoPBfTD/hOvv/n9t69gRNXA+J2Laq1a+sbefeMbXf9z/4BkPRV3
         E27ZUaZJ6bZUCDeJ1oC3SNMjQZ62Ta/M07O8TZy/fYmZyt7IJXv49VWtbxSqJ4y+BDdA
         T+Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790779940; x=1791384740;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xm8ZEn8ghmOcAG3oNkRt/e9q/WbJ/MPAngeljbhU5zk=;
        b=MdIEonQaGcbYBNEq5z7a4+hjzd1z1Nd04O/Lw9QE77NNFJ0BK8JvyC55e9phJSa73p
         fK80lqa4MUAMIKoOs6p+Yv1eAhZI8FNb9Sc+oqTVhkCtNC7yyH+rhd6DmjQJTPgsU9gB
         VTz5DYnLC+LH6QECRce9YD1YfTCo9ThEfr1oXemevBG/r6gDXs0m5vPzbSiLGQcUNVcn
         EBxb2saYMl9OF71n/mqSodwIFm+HB0ySEXTqQ52bed2kDtbuWqQOzlcaz9q4NSwrYOTJ
         HkOdaodv3rbuvpQCCyx16mCPRScS3Kb1TBxTE5rx87F2TjNZyk/oNJIWxIMkBpYjlRNj
         RCtQ==
X-Forwarded-Encrypted: i=1; AKwUvBxVINzjBaGT8uEokFeXC4j+2ypQU/h2DKIvuESm10jRcI3PUhGs8ufgVG5szZUfiJSAT6e3Nz5839aCgd8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKQsxUx+i1Ixya8n+q7a7nSeAQqc9BHsvv0dU4oIY5mUdHw3IAu
	v+CjB2Lj3ZHBQc7+grzEY2mqi1cInNNNFzx2kiZBhrRypxT1zy8aq5mvhFWMB/78NWz0LdQpTXJ
	SrNfJbzBXYdSuih9edkjv6R0D98HNyZMX+c7pcS5o1WqSostWx3PWptkiPqU0oR6Lg1s=
X-Gm-Gg: AYBFou2SWTp5QwT6V8+KaWs5xJN3dRHtXez51JPTixbyTbB91+rPFQtXu3rR6vriJLr
	DEVUSdq7AJR4LPjFPIRRt88+RtwdWmPIVx9HIFAZPJEtAJiZlDZ8D5oYb7o+B9jQptw0p8kPjn/
	XfhPyymTZqPbM988p/A2hMMmR5GWFwj8WPMwAqTWgvi6kGvkLDLStK+ATgqas7LD9bCIfGEmsxr
	CnVB6h88NR4GjsCFYlQ2M7YHLvbGkCYI5kuqirTMGw2ADwyWFSDtw2JALnNTB0N5O5SWqy18Zxd
	M6Bk/ndj1fn2fuhhEtrPg6iHyX5aG+tIXyqI7IEEd/b2nfH9j9S8Bq9PiQP/18UeB07aKKFnAp6
	m1W5VPQCYCpKjiJwPn0h2ppUoVwMIYduw7xcdb1A6u+5w0ef79JSidRo=
X-Received: by 2002:a05:7301:fc84:b0:34b:a328:c28 with SMTP id 5a478bee46e88-34cd9177b73mr1684540eec.5.1790779939778;
        Wed, 30 Sep 2026 07:52:19 -0700 (PDT)
X-Received: by 2002:a05:7301:fc84:b0:34b:a328:c28 with SMTP id 5a478bee46e88-34cd9177b73mr1684502eec.5.1790779939129;
        Wed, 30 Sep 2026 07:52:19 -0700 (PDT)
Received: from hu-c-gdjako-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34cf5639339sm4524609eec.18.2026.09.30.07.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 07:52:18 -0700 (PDT)
From: Georgi Djakov <georgi.djakov@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        minchan@kernel.org, senozhatsky@chromium.org
Cc: axboe@kernel.dk, rostedt@goodmis.org, mhiramat@kernel.org,
        mathieu.desnoyers@efficios.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-block@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        djakov@kernel.org
Subject: [PATCH 0/6] soc: qcom: Add Qualcomm Page Compression Engine (QPaCE) driver
Date: Wed, 30 Sep 2026 07:52:09 -0700
Message-Id: <20260930145215.3380977-1-georgi.djakov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 9bZjJaCWr9dBnIZTr5L8w3sjPqOzZZdo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA1OSBTYWx0ZWRfX/18R5Af5j3On
 lQBReNToLE6aCKEJ3/mDjOKlM+mU8p7j6Myj3dep5LHNgGyKfeV0/eAkOG27Y/i6axGcJA/mVnK
 mlqZ1DfMhdpsBRWNBXYNzUyL44yhTwWZqA+K/qb9Yu9dXfZAvHotCzSigCqI76hXaEC6tWPa0bb
 itEqE5wIz3YtwpQWOBNgKlvP609NOiIgl6EL0QTADq+iJmD3LYNIMnM2k28r44ODIG8GmHcJtvv
 8muEo36ZS0I9XR/Hj2urtwNO/2hrj+/8ShGru4CvSNKdxCwZObpKxrAFFf3v1pxg+hLhlu0Zv3s
 /xEPN9sWZYDeoiJOQcYwkvDG0DL8LClzqrPDDMPnOKG+014fkdIIdXT2QdUZhcy4RGzg9X6j3WD
 CNY4eMbkxfOab/iotSxOkPP/XL8IOrXeEexZsoou0PeUncgFBD9gie6UZX96UPIXYllIeDNKkdS
 2RYxszs2aYysFY89E9g==
X-Authority-Analysis: v=2.4 cv=MZn5KJ/f c=1 sm=1 tr=0 ts=6abd2225 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=oM0TwoE6PClt58MffhQA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA1OSBTYWx0ZWRfX8XRmek/z6RcI
 RqTKgrAy3JsrYx/cdOmqLpFmNQ7xOrFbOVKY8BbUuPfkw8x6La/m+/7E+/c/YhMAD/y9UAioC1H
 HtbVx85oWzZdNDm/2x02UWbXFiuLQLc=
X-Proofpoint-ORIG-GUID: 9bZjJaCWr9dBnIZTr5L8w3sjPqOzZZdo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 clxscore=1011 impostorscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609300059

QPaCE (Qualcomm Page Compression Engine) is a hardware block found on
Qualcomm SoCs that accelerates page compression and decompression for
use with the zram block device. It is composed of multiple compression,
decompression, and copy engines.

This series uses QPaCE's "urgent" (synchronous) path, intended for low-
latency single-page operations. A command is issued by writing the
source and destination DMA addresses to one of several per-CPU urgent
command registers with a single store; completion is then detected by
polling the command's status register.

The hardware also provides a ring-based (asynchronous) path for high-
throughput batched compression, where transfer and event rings allow
multiple descriptors to be queued and submitted with a single doorbell
write, with completion signalled via an interrupt. This path is not
implemented in this series.

The driver integrates with zram through a new "qpace-lz4" zcomp backend.
Both compression and decompression are performed by the QPaCE hardware
via the urgent synchronous path: each request DMA-maps the source and
destination buffers, issues a blocking hardware command, and returns the
result size.

The driver also integrates with the Qualcomm Last Level Cache Controller
(LLCC) to activate dedicated cache slices for compression and decompression
data.

This is validated on next-20260929 with the following patch applied on
top to allow booting completely to the serial console:
https://lore.kernel.org/all/20260911-rsc_read-v2-1-98675c248278@oss.qualcomm.com/

Georgi Djakov (6):
  dt-bindings: soc: qcom: Add QPaCE binding
  soc: qcom: qpace: Add Qualcomm Page Compression Engine driver
  trace: qpace: Add tracepoints for QPaCE operations
  zram: Add QPaCE zcomp backend
  soc: qcom: qpace: Add LLCC slice support
  arm64: dts: qcom: hawi: Add QPaCE DT node

 .../bindings/soc/qcom/qcom,hawi-qpace.yaml    |  94 ++
 arch/arm64/boot/dts/qcom/hawi.dtsi            |  17 +
 drivers/block/zram/Kconfig                    |  11 +
 drivers/block/zram/Makefile                   |   1 +
 drivers/block/zram/backend_qpace.c            | 134 +++
 drivers/block/zram/backend_qpace.h            |  13 +
 drivers/block/zram/zcomp.c                    |  11 +-
 drivers/soc/qcom/Kconfig                      |  14 +
 drivers/soc/qcom/Makefile                     |   1 +
 drivers/soc/qcom/qpace.c                      | 830 ++++++++++++++++++
 drivers/soc/qcom/qpace_internal.h             |  84 ++
 include/linux/soc/qcom/llcc-qcom.h            |   2 +
 include/linux/soc/qcom/qpace.h                | 154 ++++
 include/trace/events/qpace.h                  |  99 +++
 14 files changed, 1463 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,hawi-qpace.yaml
 create mode 100644 drivers/block/zram/backend_qpace.c
 create mode 100644 drivers/block/zram/backend_qpace.h
 create mode 100644 drivers/soc/qcom/qpace.c
 create mode 100644 drivers/soc/qcom/qpace_internal.h
 create mode 100644 include/linux/soc/qcom/qpace.h
 create mode 100644 include/trace/events/qpace.h

