Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1DBC30E85B
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 05:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790832208; cv=none; b=X02Ncvr1R7V/tW4yktn6udwLWtWnT/j3+dA3jSQf3F4SCT5eeVmiUmSlmCZKLtsDnvWBgu0178k+UAC3G1T+O98LbLqsYyCrcxqmmpbk+kYKZ04HaRKpKyGf7TYX24yifAZQezav4TDr4gdI0PgGTS/Y8TC7/U9xI0kMiv+mlZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790832208; c=relaxed/simple;
	bh=WICCUBitUB85OCh21FIUAUOYOI2jyJs7GHEq8ouBpf4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l4HOs+EldpGOFDi5gGsxhXmBK3T2tvsI2ALiTEC7mkT5wyMUdt3QyBq8M05LaMH3rtSV1eWTnOX39c5Xy2vOVBasd3rez8MjukZE3HxpZvGWbTKsP/U6yDP1wK38koG8Cxhj4RkErGYDgXVlCm370k/rvVkRiRRPYDspsaFwlrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mZM73UNI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PARnEubV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mZM73UNI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PARnEubV"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6913gRVR542942
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 05:23:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=wRMZ5C+W4s3WBTEwnJCNbG5XG3HtxGnpkSf
	0y0USG3E=; b=mZM73UNI311C0UnbbwbOBngeN9+DmwbCj103ngjjqzmtlUWFg94
	JYBnCpzaLT3q43NB6AdCgB2AoLKcLEzED60viLnvkvRTY7hAXcL+k/aalZC5VshI
	P4Fr4XnMNE1iywZmRt6DBOMXAUloph0W3PfuzqD1lUQpQ7v4k/bWue4PkfImEqOC
	agAanG7EpMXqzRSpcqBDkjGIKRsD7ut7HBoR75hMpXbPsyLGBiH7jE4NtNacYtJS
	kJfFDBWcS/lbxYv2d64mUA3uWLLAI9HDg9IdLHDXSyBWXq0flHg+wJwgSzkZvX6/
	WJBQOPLT7P14/FOx9jRmpjYdCt3ce7qzdeg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h16wctca1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 05:23:25 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2df5a65671eso6090735ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 22:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790832204; x=1791437004; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wRMZ5C+W4s3WBTEwnJCNbG5XG3HtxGnpkSf0y0USG3E=;
        b=PARnEubVycN5wZg2T8hmLD/+zKq/d3gqZDwDum2TwD9cvqQIXKVqW4vSSCi6wDODue
         jSZto17pUG1AeE1Xlp6V7JzsFF8mJA9Qp0N0k1cwK9y5naTQEtoU8Ronbfigj2GA8Afk
         zhrIJ7LdZg9FJ2QetWi4eTdF+rRcr/kCuK734astGzLxjP0mBS2wgMWlNR6DHUQIQ1Yx
         X283bH6pEKGM/UExuJncHkKDzCOuSS7Eo4mB9mL2TIaOXGxwvPtgxnQYrar4EZFxAwXo
         /AV28BtgIDAR5AVEzuqlyRqzO/zwaE+uUoYc2/WfKPsbeRTIQBA88RnreSwJVUCmfqIy
         z9uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790832204; x=1791437004;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wRMZ5C+W4s3WBTEwnJCNbG5XG3HtxGnpkSf0y0USG3E=;
        b=ECn205Uk717WdRyswfpQ1DbuqrsQl2NlwqzxhixwpWOBKJAKdDBM799n6usM6dbHOw
         MvdqiG9JX/6w/RKf5embhVwKhF8g3UHKSA17wpN3uDFNJlXP31KkCWTBERThSC512MA/
         h8tpeyuSCFL0YssvuVch6sBxgqwfswKKvZ+cwXIEnQFF16pvsgOknW09ID9QsYwmIFdN
         LNm1tSr9OynFxUHj1G7ToikvW0BbS0xjirhd9c6icOsfDiz4JWam9FPLo0NpgGSn4zQH
         7qnbNFGBPEW6t6Hug4kiZ+3evBmR2Gb1QHqpDKE5qmNWMz5FGNdm6keVO0G5o13V0K3K
         7k4A==
X-Forwarded-Encrypted: i=1; AKwUvBxTtK5qs3gV2Agj834g921f+HEWqd1UGYXWSAnAsvqoP7z/G+3DxpOVxWwnDwhARtowO0PKvtjAWE9ZQBg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJPBHxIRA4z5C/O7LyfS0i11QqViH7q0BA4Hc6xQLlK/ST7e4YD
	14jl/JTwSC/PJmpqTGeUlIrZj55jO4e/PJiIfn6Vwm++YeEjoNvFKzezjbvqxTuFI7aIoJyfy5n
	jmX3U1H3EcouiLg21TTKNE5TzCG5Ppk7L5HhLz41WlZXD/m9iLxcwtqSLKhiBphsw5V8=
X-Gm-Gg: AYBFou2+HeLGVX5hNx3M2fx1XRWNgsK89Yb0EFdXtcmDVc5tuq9yQK+DP9af+qmFp0o
	bvi40GPzlMRT7RjVFl1qVr5tXejmPvTWMfoqH1J+Tfg88hdKhH1ovttLJ9FZMYIdfuPvD7xr6K5
	QAcjYvvJmchMygXDQ/k4WctUhVzdMoofNgx58jFNFrIzRpQN+CUmjRHQYd193A/qzqDY/joQ340
	C5eGsDedYx8RmxoqgNCEwo9kqVcSO5J9c1Lhco2COBJU7Dh3u2h4AbnIZ3Z3ndRFQ9M4FoGtoHK
	hIXAA/dvv1bz6tQCXve2BlF4SKghJdykgbwueDvssn/oEJnT//VxQJsbrrVlNtWuSMLQiM/GJYK
	/9CrP9Fydd8mn2Imc1uvejqeblRqFFSPxOuG4yFBdah4uWmaOTEsOjy4C9PbJdKpFYoOrJbD/g4
	Wy52k7JEpY+boLbXxmm5mzNQaM
X-Received: by 2002:a17:903:3201:b0:2dd:86a3:232d with SMTP id d9443c01a7336-2e3000ecbebmr9988235ad.8.1790832204327;
        Wed, 30 Sep 2026 22:23:24 -0700 (PDT)
X-Received: by 2002:a17:903:3201:b0:2dd:86a3:232d with SMTP id d9443c01a7336-2e3000ecbebmr9988055ad.8.1790832203727;
        Wed, 30 Sep 2026 22:23:23 -0700 (PDT)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2e300b851b9sm5152715ad.78.2026.09.30.22.23.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 22:23:23 -0700 (PDT)
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Ian Rogers <irogers@google.com>
Cc: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>,
        Alexandre Ghiti <alex@ghiti.fr>, Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Mayuresh Chitale <mchitale@gmail.com>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Sunil V L <sunilvl@oss.qualcomm.com>, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Zane Leung <liangzhen@linux.spacemit.com>
Subject: [PATCH v6 00/14] Linux RISC-V trace framework and drivers
Date: Thu,  1 Oct 2026 10:52:11 +0530
Message-ID: <20261001052243.3042627-1-mayuresh.chitale@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAyMSBTYWx0ZWRfX3yK0I69SnK42
 FZWawVySfEvqmPzjn4AY7eZ2tHBUtm5Wmpe8JdcX58n8vbm4nCA3On9/vErPUW8P+eqJr4QXzTB
 G2BHc57ty/ziXAZJ7Gq1ugqx75zvz6udytGOyUaDvT5FxvBvQMzTJAtdx3z+JqEv+VU6DJlgtn8
 GphFXmy3fFmsFdWyKfztMBlAnyEescKKF+Do0YHuuClxpZbmYIoYXroD9d6SKdRQhY4ZB6XlcwB
 WpwyBjTpMeY052pWQxqPGaGEZYuYB2bwfVfX4ET4Nqnza1WrTXPnvkYy7VMHQvC2Ww6gJGjWwec
 20HRd6kVx2be6SozSTu6uK/GWh75lGZ1W7n9L9GJoFsUkkWMUGIMOvE2zXFGn5KFJSB19mjhpvZ
 F2UICgp5S6ET2TRhDIRHyXExXbCO0kAtQO3LPyIv9tEB67wBP1S8RstMwrUdaREFQ04knIxni2R
 XcgBCaLMmawVwLNaO8g==
X-Proofpoint-GUID: QYad6yn6r6fBwfY6aXmVOVAOSy2n9Gyj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAyMSBTYWx0ZWRfX7193jgUYzwh0
 PCZGSg7N7tjcSwzNTKelWSyZ/HrzhR+sLyU+PcFyDFJjbyS1FmZrhRwDwnd9YDMO9bOhX26jJ9A
 Yz6uVhxSyLEDoW7wGh5QiNyqdTjI+h0=
X-Authority-Analysis: v=2.4 cv=S51MU4sP c=1 sm=1 tr=0 ts=6abdee4d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=V1jnuoLLAAAA:20
 a=NEAV23lmAAAA:8 a=p0WdMEafAAAA:8 a=141_r4vzzXyHVjRiWNIA:9
 a=324X-CrmTo6CU4MGRt3R:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: QYad6yn6r6fBwfY6aXmVOVAOSy2n9Gyj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010021

This series adds 'gtrace' which is an architecture-neutral hardware trace
framework with RISC-V E-trace as its first backend. The 'gtrace' core framework
has the minimal shared plumbing (component registration, path create/destroy,
path start/stop, etc) and the RISC-V trace drivers are its first consumer.
It should be possible for the required ARM components to be adapted to the same
framework in a future.

This series also adds initial support for RISC-V trace compnent drivers.
The RISC-V trace v1.0 specification is already ratified and can be found at:
https://github.com/riscv-non-isa/e-trace-encap/releases/tag/v1.0.0-ratified
https://github.com/riscv-non-isa/tg-nexus-trace/releases/tag/1.0_Ratified

The RISC-V trace component drivers are designed to be agnostic to the
underlying trace protocol hence both RISC-V E-trace and RISC-V N-trace should
work fine. The discovery of trace protocl parameters are left to user-space
trace decoder.

In the future, there will be subsequent series adding:
1) Sysfs support
2) ACPI support
3) More trace drivers (such as funnel, ATB, etc)
4) Support for upcoming self-hosted trace specification
5) Arm component support under the gtrace framework
6) ... and more ...

These patches can also be found in the riscv_trace_support_v6 branch at:
https://github.com/mdchitale/linux.git

To test the patches, we need QEMU virt machine with RISC-V trace support
which can be found in rv-etrace branch at:
https://gitlab.com/danielhb/qemu.git

To capture gtrace data using perf on QEMU virt machine do the following:
1) Launch QEMU virt machine
   $ qemu-system-riscv64 -nographic -M virt -smp 2 -bios fw_dynamic.bin \
     -kernel Image -append "root=/dev/vda rw console=ttyS0 earlycon=sbi" \
     -drive file=rootfs.img,id=disk1,if=none,format=raw \
     -device virtio-blk-device,drive=disk1
2) Run perf record to capture gtrace data
   $ perf record --all-cpus -e gtrace/event=0x1/ <command>
3) The step2 would create a perf.data file which has the gtrace data.
   Now run perf report -D and look for PERF_RECORD_AUXTRACE event
   section(s) which point(s) to the actual gtrace data offset.

Changes since v5:
 - Moved the DT connection parsing into the gtrace core as gtrace-of.c.
 - Added start_count and a lock to the core's private component data
   to serialize start/stop/copyto_auxbuf operations. Dropped
   perf_buf_lock.
 - Added handling of partially enabled path by disabling all enabled
   components
 - Added cycle detection when walking the trace component graph
 - Added trace source ID configuration in the encoder driver
 - Added trace format (E-Trace/N-Trace) selection via the platform driver
   compatible string. It is used by encoder and perf drivers to set it
   into hardware and perf data header respectively
 - Modified the ramsink buffer setup to read back the trRamStart and
   trRamLimit registers, and program the sync frequency, memory format
   and stop-on-wrap settings at start time
 - Improved error handling and added path owner in the perf driver
 - Fixed several issues reported by sashiko-bot but some of its findings
   are deferred to a later version.

Changes since v4:
 - Introduced a new architecture-neutral 'gtrace' (Generic Trace) framework
   and moved the RISC-V trace drivers on top of it instead of a RISC-V-only
   'rvtrace' core.
 - Added new PATCH3 "gtrace: Add RISC-V platform driver for the gtrace
   framework" to split out the RISC-V platform/DT code from the core
   framework patch.
 - Moved all rvtrace driver sources from drivers/hwtracing/rvtrace/ to
   drivers/hwtracing/gtrace/, with single Kconfig, Makefile using
 - Made the perf driver (previously rvtrace-perf.c) architecture-neutral
   and moved it into the gtrace framework as gtrace-perf.c; PMU name
   changed from "rvtrace" to "gtrace"
 - Added new PATCH8 "perf: Add gtrace AUX buffer trace format type" to
   define PERF_AUX_FLAG_GTRACE_FORMAT_ETRACE which is used in later patches.
 - copyto_auxbuf() and gtrace_path_copyto_auxbuf() now take an output
   parameter so the AUX data format can be reported by the sink
   driver by setting PERF_AUX_FLAG_GTRACE_FORMAT_ETRACE.
 - Renamed the generic side of the perf tools support from rvtrace* to
   gtrace*. perf.data ABI is unchanged.
 - Fixed gtrace ramsink start/stop to call gtrace_enable_component()/
   gtrace_disable_component() to remove duplication with code in
   gtrace-core.c
 - Updated the MAINTAINERS patch to refer to gtrace framework instead of
   rvtrace

Changes since v3:
 - Rebased on Linux-7.1-rc1
 - Use kzalloc_obj() in-place of kzalloc() in PATCH2, PATCH3 and PATCH9
 - Improved PATCH7 to save the previous WP value

Changes since v2:
 - Rebased on Linux-7.0-rc1
 - Addressed Rob's comments on DT bindings in PATCH1
 - Addressed ref-count related issues in rvtrace_of_parse_outconns()
   of PATCH2
 - Made RVtrace framework more generic by avoiding implicit access
   to component registers in PATCH2
 - More improvements in trRamStart/Limit/WP programming and other
   improvments in PATCH7
 - Removed RVTRACE_BUF_LEN from PATCH9
 - Removed redundant page_size from PATCH10
 - Renamed found_etm in PATCH10
 - Removed rvtrace_recording_init() declaration from header in PATCH11

Changes since v1:
 - Rebased on Linux-6.18-rc3
 - Addressed Rob's comments in dt-bindings added by PATCH1
 - Get reference of conn->dest_fwnode and add missing break in
   rvtrace_of_parse_outconns() of rvtrace-platform drivers added
   by PATCH2
 - Added new inline function rvtrace_comp_is_empty() in PATCH2
   and used it in rvtrace_encoder_stop() added by PATCH5
 - Fixed trRamWPLow usage in PATCH7
 - Determine RAM sink buffer size based on component implementation
   ID and reduce default RAM sink buffer size to 1MB
 - Add new PATCH8 to enable DMA_RESTRICTED_POOL in RISC-V defconfig
   so that implementations with RAM sink address restrictions can
   be handled.

Anup Patel (7):
  dt-bindings: Add RISC-V trace component bindings
  hwtracing: gtrace: Initial implementation of gtrace framework
  gtrace: Add RISC-V platform driver for the gtrace framework
  gtrace: Add functions to create/destroy a trace component path
  gtrace: Add function to copy into perf AUX buffer
  riscv: Enable DMA_RESTRICTED_POOL in defconfig
  MAINTAINERS: Add entry for RISC-V trace framework

Mayuresh Chitale (7):
  gtrace: Add functions to start/stop tracing on a component path
  gtrace: Add RISC-V Trace encoder driver
  perf: Add gtrace AUX buffer trace format type
  gtrace: Add RISC-V Trace ramsink driver
  gtrace: Add perf driver for tracing using perf tool
  perf tools: Add RISC-V trace PMU record capabilities
  perf tools: Initial support for gtrace decoder

 .../bindings/riscv/riscv,trace-component.yaml | 120 +++
 MAINTAINERS                                   |  11 +
 arch/riscv/configs/defconfig                  |   1 +
 drivers/Makefile                              |   1 +
 drivers/hwtracing/Kconfig                     |   2 +
 drivers/hwtracing/gtrace/Kconfig              |  59 ++
 drivers/hwtracing/gtrace/Makefile             |   9 +
 drivers/hwtracing/gtrace/gtrace-core.c        | 858 ++++++++++++++++++
 drivers/hwtracing/gtrace/gtrace-of.c          | 126 +++
 drivers/hwtracing/gtrace/gtrace-perf.c        | 390 ++++++++
 drivers/hwtracing/gtrace/rvtrace-encoder.c    | 236 +++++
 drivers/hwtracing/gtrace/rvtrace-platform.c   | 186 ++++
 drivers/hwtracing/gtrace/rvtrace-ramsink.c    | 357 ++++++++
 drivers/hwtracing/gtrace/rvtrace.h            | 121 +++
 include/linux/gtrace.h                        | 332 +++++++
 include/uapi/linux/perf_event.h               |   5 +
 tools/include/uapi/linux/perf_event.h         |   5 +
 tools/perf/arch/riscv/util/Build              |   1 +
 tools/perf/arch/riscv/util/auxtrace.c         | 221 +++++
 tools/perf/util/Build                         |   1 +
 tools/perf/util/auxtrace.c                    |   4 +
 tools/perf/util/auxtrace.h                    |   1 +
 tools/perf/util/gtrace-decoder.c              |  95 ++
 tools/perf/util/gtrace.h                      |  18 +
 24 files changed, 3160 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/riscv/riscv,trace-component.yaml
 create mode 100644 drivers/hwtracing/gtrace/Kconfig
 create mode 100644 drivers/hwtracing/gtrace/Makefile
 create mode 100644 drivers/hwtracing/gtrace/gtrace-core.c
 create mode 100644 drivers/hwtracing/gtrace/gtrace-of.c
 create mode 100644 drivers/hwtracing/gtrace/gtrace-perf.c
 create mode 100644 drivers/hwtracing/gtrace/rvtrace-encoder.c
 create mode 100644 drivers/hwtracing/gtrace/rvtrace-platform.c
 create mode 100644 drivers/hwtracing/gtrace/rvtrace-ramsink.c
 create mode 100644 drivers/hwtracing/gtrace/rvtrace.h
 create mode 100644 include/linux/gtrace.h
 create mode 100644 tools/perf/arch/riscv/util/auxtrace.c
 create mode 100644 tools/perf/util/gtrace-decoder.c
 create mode 100644 tools/perf/util/gtrace.h


base-commit: 551c722f40809618230001baccf219193e22fc5a
-- 
2.43.0

