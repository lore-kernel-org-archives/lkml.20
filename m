Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793340089;
	b=vE2VQfcpQxhgNftvfl4kIJIDAdOwOo6avbNKfgBMl4aIMq/9TUycJydsEfTBSHsiT5sj
	 NXtnP17poS5f2hXLZywrOH1EARTkAa13bfBwpFvkEQAfmLVCEK3Bev5WdIuZ/TMdXHt2m
	 EWLopgzI43gGuGEnUiZNIDOfCuXPNlnWcWQSa/iurFWS0x1YKyH6IluMUjaBXxDtElCxo
	 FE5XZhNA5zBGoOv1lGv9pEH5hTuKm2eKDp77WikmC0WFTfSNM5VCANnzWhCTAvOrHynAG
	 jsoOCe5K/xDXOcAGaVIIXzgp6w13oQ9x4KOfps1P8N5Txz7MX+FvSyqNXNgzk3scxPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793340089;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=RJHXK+MFaDtO/JdfjhrhaIZu1mnby3fotukr8/GjCbY=;
	b=ZrryvuvM9Jemcf85kv1/ax0eE5g0DeY0yRM8a8qwUcT/8S3QAyOK6R554iSVqs301exa
	 5vREDeBvRUy66MFcbx+56tLRtkUQ8HNIRCdkftTAr4giQlouLWTyNW4F/g3sZkMrb9NZt
	 XIfKsI0ZxSBNJ+LhEHkOTbqgtFuMuTrT8eHYS3WdQx2AVcLYYR3VFnQW68fQN3pVNZ4b1
	 bfs5smu+4TSnbC4X6VBkIGViH2eeWy2OBKbZLxMV7dKXhMNJ+UatHqga5i4WsteHDyePi
	 D34B3Bqqpoi3Ts4gvhsi9JrftRCsBMaKQEi7oH0+ZkcudkrkNwSXZcK83CXoCIrP0gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=an5lq8il;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Yrdig/Jx";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C6E606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:01:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71C6E606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=an5lq8il;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Yrdig/Jx
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U5FCvp2337154
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:01:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=RJHXK+MFaDtO/JdfjhrhaI
	Zu1mnby3fotukr8/GjCbY=; b=an5lq8ilgNcZkdiyjLqPW5AfHNTJmrgeQ+BkuI
	wovawDS7ajh6tjZdJGmrIxICrwgtGW/+6d6VTbHfaPgjtyzCKWeq6hA9y7Vt3cdW
	c9YGi1tRCFLxYFGNUQeKTZc0kTmL6wOl909Y61NrOyU3u7k+lfH0FCprTYrU1MU3
	Dd92TF1r2jVmyPCIKLYHXaU0dPncjkhiie1h03tetuE4uNHp4ixziUQRl2pq9hxe
	v5muvq4mEHyuGcMZQB7i7R/hTJVVpodjP455Hrv6yg32AmOQQtJSpWUfZ/gGPw6D
	qX2G3KspcFid28bwOBDQimztvxLRpHW33xMdfH2kvt2xraMg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qhet8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:01:26 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ae6fda7a00so422551a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 23:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793340085; x=1793944885; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RJHXK+MFaDtO/JdfjhrhaIZu1mnby3fotukr8/GjCbY=;
        b=Yrdig/JxyxGdakVygDzNV8PZGnB+1lmpA5Z649ba/TOK67XqbgK1MN+06LupcCI35A
         bhYFwqsB9bJFYNS//41OmS5ff5AOApdfRaOf+s1yA41dr7xZFVkkWIhVHIWMQbKxPmOz
         /5QdgMS0F40JiDRu+UgXO+SDiNwDyKp/e3SuHHI3LiGTXSr+F8jAethY5r9kKAcLf5QL
         WV2LTROctztvT72WsGZLp5we9I+6Fd1o25T20fJ8loYeE4Ge77a4ixpNzY7mnpHvE1E2
         u6DWJHWT7G6zpyfkYOSFJbsmI2czKJcyJqJHMoYBShpHspmzB8IYA6FyrNChAJr74RPC
         1vnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793340085; x=1793944885;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RJHXK+MFaDtO/JdfjhrhaIZu1mnby3fotukr8/GjCbY=;
        b=AVyRsrTQoWg/CG6/j1LfT9CwO7DEfksoJllQYVO62b2pHwnwOlA6TKXfgh8W0696ZS
         OjJLO1t9yhv6BN6NJrcyM5D8g5LQKLFodDZObIkGOqk1n+hX0fhrMUzi97SQJzqM1kK6
         cvJuj2z6icLqlUAyT3DpRWmh2bZDJjF1brUfhP05BliWR63w789w4FcIaOrJbl3OVvwv
         z6kPmv+DxpLQelIO8lxkwwTi/O7rBMfme150W/3P9sFvYY+edYM41t5IWTU02RUV6Usx
         ERMplPZmp7edvWnWMMaTD0HyfxoiNiotJ3McjcaZz87OB1v7Wfrp1oPYYQOwJ0e5diTY
         e2Yw==
X-Forwarded-Encrypted: i=1; AKwUvBxiAhN+V+g4LR/aYN63+vkhtnR66+VPmR0bIREV79o5YmvAqrVqpvt04fKkt5xblRWbd/sqNjrk6Tjm3U4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLqfKfcwbAlCxyImwWxcHCo2Qs5nekxrL9Z3SKjwNgVY9IHwsX+
	8bEwX6z2v0zIAplig1JlDZBBOO47yo/f7DGuGylFSjFYhGT8SF35RzU1XTAUy4r1yHgsbNPGGcj
	rbGsqkMu1vq3N0+/pKjSgEAOFhitSZitpk+JVKKiItG0cakDtUEk9/aM3GHWvRVjvBXM=
X-Gm-Gg: AYBFou1/ZITRBwpgmbrpzuJ7ikWqNO68Wb9Zk2dNPARZbQk1wJ2cZckwpdGC9jozzzL
	EbYR5KwVq4fX3rOvYV9teiwSsKuxQtLFwdaq0Zmhunk5HTJzxDHDu9UyjAbKSDWZFJ+NMCpXl+t
	dLfTUmaHQeMW6iRW8eutKFL9ixrmCHI/DY/5Lp8Qajrt4xQNrqrs02wCzKl8oy6bo6qHDYLEBuP
	gNxwQscY4LwFbixUdAXi93iwpd45BqNwk55vaXFIVKvIpPFx/+ddeT4FBE9lqmpOcghztCSddix
	4MCZM4etBL7+78a6Q6C1V4RRbt1i9xq1/lZ87hvaAcH5g44Ctmorm8T+7EKgBHWw9PSrKSZ35Tv
	ML1FLe5a26sYRxccEUtV3+oJRXfJDvrgTbVUygqzOjjjtuGglHJ0gFKePVrjmdD2FMdAzQ5QyNY
	XBTjPncKQAwptsbFdoZ9mIYpZLCjKsUKPiz+Yz
X-Received: by 2002:a17:90a:ec8e:b0:3ac:9599:a689 with SMTP id 98e67ed59e1d1-3ae897d5fc0mr830913a91.34.1793340085114;
        Thu, 29 Oct 2026 23:01:25 -0700 (PDT)
X-Received: by 2002:a17:90a:ec8e:b0:3ac:9599:a689 with SMTP id 98e67ed59e1d1-3ae897d5fc0mr830874a91.34.1793340084291;
        Thu, 29 Oct 2026 23:01:24 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb09706f01sm252292a12.20.2026.10.29.23.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 23:01:23 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v20 0/7] coresight: ctcu: Enable byte-cntr function for TMC
 ETR
Date: Fri, 30 Oct 2026 14:00:24 +0800
Message-Id: <20261030-enable-byte-cntr-for-ctcu-v20-0-bd5c3ac9f916@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAHwy5GoC/43NPW7DMAwF4KsEmqtApKy/Tr1H0UGSqUZAYreSY
 zQIfPcqWZKhNroQeA/kxyurVDJV9rq7skJzrnkcWkDxsmPx4IdP4rlvBUOBWkjhOA0+HImHy0Q
 8DlPhaSw8TvHMU7KaNDgbTGLt/qtQyj93/P2j5UOu01gu918zdLf6P2xb5YJHYS1KUt6Sfhtr3
 X+f/TGOp9O+DXbjZ1BPJMhNUjUSjDEJOuoluDVSP5G4TepGGt+B7BEg2H6NNA+yQ9gkTSNdTFK
 npFSKYo20D1IJs0naRmLAXjnRaenlGukepEa1SbpG2hRCQiQrLfxBLsvyC2FyPttrAgAA
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Mike Leach <mike.leach@arm.com>, Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793340075; l=13989;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=JSDbbVB/nUbW7rRza6+inEekdLiTXXxcFhsLbevxAs8=;
 b=hN4Ayizc2MIU6SIQylelgLZRe8vfDvEgMvgG78Roa+GMeU2ADq+MFriENYuJjG+ogXkO6kOdP
 csSj1OKejkFAA4KZOugrV6XSOj2OG+2AbzZU7C4N1Xab2J8qy5XuQS+
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: GW-YBJjmOlclvqBtvUcwO3pWtqvm9Q7T
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAyMyBTYWx0ZWRfX5gch4BhWV5KE
 BeSpe+/dDYwf6Ne+TwJ7rsYO19UVFZ38kR3D0SPK7tghRoJcO15ga0X7XPj5/jsIuLjaJhjYm65
 zrOHzyk3gqWxCbgxr6djde1+xYcoVcE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAyMyBTYWx0ZWRfX98hvcyP5I9C2
 YzhYj67qGP3Hvg2bnB5HjDLtUmjibsgMzGUsIC73wyT+lkmJbDfaBb5tF6nyIAnk0er5DzSinzs
 /QmjcFg6pvqaqNBJr8bu8ppmf6luwJDwE6xDh1FtCWht9IyQBXzrWYWC5uQakPP4Ffue4Jomf3a
 p5L8MxX/uB5IA33dB8hvOGYiBNsheSxqbl8TGwS6TxtFO9suWPfzFyAgSas4UdJrlBoGsdtQ1hz
 U3lghcl4+1AzA665uJhI5fpt79Uz4Ulz6bJie/cDcsdmSchjqszd7sLDirDBQdY8BOWbj8UpGK1
 Q1LQPWbkwjPlYuyYBtWw5OUypbVqV0Oxhu/d301hom5NxC2TIK5ZIo7Tlr8MEE9ktBf1cxMdMPJ
 BOKR0UsRUmByf41hnQrIUbAIIVmta73dssI1o7Pvj4dZ6QIKD0x7gpVXALHigOQ96aqY4Gr1L4j
 tn12l5ZFx3WlLwnYvqQ==
X-Proofpoint-ORIG-GUID: GW-YBJjmOlclvqBtvUcwO3pWtqvm9Q7T
X-Authority-Analysis: v=2.4 cv=TpVzFzXh c=1 sm=1 tr=0 ts=6ae432b6 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=TPi084Elyj_kzCtqOFMA:9
 a=Y7M9M7T2EXNFc3tv:21 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300023

The byte-cntr function provided by the CTCU device is used to count the
trace data entering the ETR. An interrupt is triggered if the data size
exceeds the threshold set in the BYTECNTRVAL register. The interrupt
handler counts the number of triggered interruptions.

Based on this concept, the irq_cnt can be used to determine whether
the etr_buf is full. The ETR device will be disabled when the active
etr_buf is nearly full or a timeout occurs. The nearly full buffer will
be switched to background after synced. A new buffer will be picked from
the etr_buf_list, then restart the ETR device.

The byte-cntr reading functions can access data from the synced and
deactivated buffer, transferring trace data from the etr_buf to userspace
without stopping the ETR device.

The byte-cntr read operation has integrated with the file node tmc_etr,
for example:
/dev/tmc_etr0
/dev/tmc_etr1

There are two scenarios for the tmc_etr file node with byte-cntr function:
1. BYTECNTRVAL register is configured and byte-cntr is enabled -> byte-cntr read
2. BYTECNTRVAL register is reset or byte-cntr is disabled -> original behavior

Shell commands to enable byte-cntr reading for etr0:
echo 1 > /sys/bus/coresight/devices/ctcu0/irq_enabled0
echo 1 > /sys/bus/coresight/devices/tmc_etr0/enable_sink
echo 1 > /sys/bus/coresight/devices/etm0/enable_source
cat /dev/tmc_etr0

Reset the BYTECNTR register for etr0:
echo 0 > /sys/bus/coresight/devices/ctcu0/irq_enabled0

---
Changes in v20:
1. coresight: core: refactor ctcu_get_active_port and make it generic:
   - Check the port number returned by coresight_get_in_port() against
     ETR_MAX_NUM in ctcu_set_etr_traceid() to avoid an out-of-bounds
     access of the per-port arrays with a bad DT port number.
2. coresight: tmc: add create/clean functions for etr_buf_list:
   - Take drvdata->sysfs_buf and add the first node to etr_buf_list in
     one critical section, and do all etr_buf_list updates (add and
     delete) with drvdata->spinlock held.
   - Return -EBUSY from tmc_etr_get_sysfs_buffer() while etr_buf_list is
     not empty, so the ETR sink enable path cannot free or replace a
     buffer that is still owned by the list during a byte-cntr session.
3. coresight: ctcu: enable byte-cntr for TMC ETR devices:
   - Fixed a NULL pointer dereference in ctcu_get_byte_cntr() when the
     opened ETR is not connected to a CTCU device, since the byte-cntr
     sysfs ops are global to all the TMC ETRs.
   - Fixed the sysfs read fallback: tmc_byte_cntr_get_data() now returns
     -EINVAL unless a byte-cntr read session is active, and
     tmc_etr_get_sysfs_trace() falls back to the generic read only for
     -EINVAL. Errors and EOF of the byte-cntr read are returned as-is
     instead of reading the live buffer.
   - Fixed a race between the buffer switch and the sink disable path:
     tmc_etr_enable_disable_hw() now checks the sink mode with
     drvdata->spinlock held, so the ETR is not restarted after the sink
     has been disabled.
   - tmc_read_prepare_byte_cntr(): check irq_enabled with the
     byte_cntr_data->spin_lock held, and clear reading under the lock
     and wake up the waiter on the buffer list allocation failure path.
   - Pin the module with try_module_get() for the duration of a byte-cntr
     read session, so unloading the module fails with -EBUSY instead of
     blocking in ctcu_platform_remove(). Documented that a manual unbind
     still waits for the tmc_etr file to be closed.
   - Dropped IRQF_SHARED from the byte-cntr interrupt: the handler does
     not check the interrupt source.
   - Read curr_buf with drvdata->spinlock held and handle a missing
     current node in ctcu_byte_cntr_switch_buffer().
   - Initialize the lock and waitqueue of every port before requesting
     its interrupt, skip the ports without a registered IRQ in
     ctcu_platform_remove(), and only expose irq_enabled for the ports
     with a registered IRQ.
   - Refcount the byte-cntr sysfs ops registration across CTCU devices
     with a devm action, so removing one CTCU no longer disables
     byte-cntr for the others. Replaced the single-CTCU-instance comment
     on byte_cntr_sysfs_ops accordingly.
- Link to v19: https://lore.kernel.org/r/20260625-enable-byte-cntr-for-ctcu-v19-0-8fbbf22e8381@oss.qualcomm.com

Changes in v19:
1. coresight: tmc: add create/clean functions for etr_buf_list:
   - Simplified the kernel-doc "Locking:" note on tmc_create_etr_buf_list()
     and tmc_clean_etr_buf_list() to state only the required contract
     (caller must guarantee exclusive access to drvdata->etr_buf_list),
     dropping the over-specific call-path details.
   - Lock the required code block in create/clean functions.
2. coresight: ctcu: enable byte-cntr for TMC ETR devices:
   - Fixed a stale reading-state / double-free when irq_enabled was
     cleared between prepare and unprepare: the byte-cntr read_unprepare
     would return an error and tmc_read_unprepare_etr() would fall back
     to the normal unprepare path, freeing drvdata->sysfs_buf while it
     was still owned by the byte-cntr buffer list. irq_enabled_store()
     now returns -EBUSY while byte_cntr_data->reading is set, so the flag
     can no longer change mid-session, and tmc_read_unprepare_byte_cntr()
     additionally guards on byte_cntr_data->reading.
   - Moved enable_irq_wake()/disable_irq_wake() out of the
     byte_cntr_data->spin_lock critical section in
     tmc_read_prepare_byte_cntr()/tmc_read_unprepare_byte_cntr().
     irq_set_irq_wake() may sleep on slow-bus irqchips, so it must not
     be called under a raw spinlock. The threshold IRQ is already
     disabled by the in-lock register write before disable_irq_wake() on
     the unprepare path, so no wake event can race in the gap.
   - Added a comment on the byte_cntr_sysfs_ops pointer documenting the
     single-CTCU-instance-per-system assumption.
- Link to v18: https://lore.kernel.org/r/20260507-enable-byte-cntr-for-ctcu-v18-0-2b2d590463a3@oss.qualcomm.com

Changes in v18:
1. add a NULL check for the in_conns instance in patch 1.
2. fix a bug in patch 2: the tmc_alloc_etr_buf never return NULL and the
   previous check for the return value is incorrect.
3. add more kernel_doc description for tmc_clean_etr_buf_list function
   in patch 2
- Link to v17: https://lore.kernel.org/r/20260421-enable-byte-cntr-for-ctcu-v17-0-9cf36ff55fc0@oss.qualcomm.com

Changes in v17:
1. fix race issue during allocat buffer.
2. fix user after free issue observed when remove module.
- Link to v16: https://lore.kernel.org/r/20260323-enable-byte-cntr-for-ctcu-v16-0-7a413d211b8d@oss.qualcomm.com

Changes in v16:
1. Remove lock/unlock processes in patch "coresight: tmc: add create/clean
   functions for etr_buf_list" because we are allocating/freeing memory.
- Link to v15: https://lore.kernel.org/r/20260313-enable-byte-cntr-for-ctcu-v15-0-1777f14ed319@oss.qualcomm.com

Changes in v15:
1. add lockdep_assert_held in patch "coresight: tmc: add create/clean
   functions for etr_buf_list"
2. optimize tmc_clean_etr_buf_list function
3. optimize the patch "enable byte-cntr for TMC ETR devices" according
   to Suzuki's comments
   - call byte_cntr_sysfs_ops from etr_sysfs_ops
   - optimize the lock usage in all functions
   - remove the buf_node parameter in etr_drvdata, move it to
     byte_cntr_data
   - move the tmc_reset_sysfs_buf function to tmc-etr.c
   - add a read flag to struct etr_buf_node to allow updating pos while
     traversing etr_buf_list during data reads.
Link to v14: https://lore.kernel.org/r/20260309-enable-byte-cntr-for-ctcu-v14-0-c08823e5a8e6@oss.qualcomm.com

Changes in V14:
1. Drop the patch: integrate byte-cntr's sysfs_ops with tmc sysfs file_ops
2. Replace tmc_sysfs_ops with byte_cntr_sysfs_ops in byte_cntr_start
   function and restore etr_sysfs_ops in byte_cntr_unprepare function.
3. Remove redundant checks in byte‑cntr functions.
Link to V13: https://lore.kernel.org/all/20260223-enable-byte-cntr-for-ctcu-v13-0-9cb44178b250@oss.qualcomm.com/

Changes in v13:
1. initilize the byte_cntr_data->raw_spin_lock before using.
2. replace kzalloc with kzalloc_obj.
Link to V12: https://lore.kernel.org/all/20260203-enable-byte-cntr-for-ctcu-v12-0-7bf81b86b70e@oss.qualcomm.com/

Changes in v12:
1. Add a new function for retrieving the CTCU's coresight_dev instead of
   refactor the existing function.
Link to v11: https://lore.kernel.org/r/20260126-enable-byte-cntr-for-ctcu-v11-0-c0af66ba15cf@oss.qualcomm.com

Changes in v11:
1. Correct the description in patch1 for the function coresight_get_in_port.
2. Renaming the sysfs_ops to tmc_sysfs_ops per Suzuki's suggestion.
Link to v10: https://lore.kernel.org/r/20260122-enable-byte-cntr-for-ctcu-v10-0-22978e3c169f@oss.qualcomm.com

Changes in v10:
1. fix a free memory issue that is reported by robot for patch 2.
Link to v9: https://lore.kernel.org/r/20251224-enable-byte-cntr-for-ctcu-v9-0-886c4496fed4@oss.qualcomm.com

Changes in v9:
1. Drop the patch: add a new API to retrieve the helper device
2. Add a new patch to refactor the tmc_etr_get_catu_device function,
   making it generic to support all types of helper devices associated with ETR.
3. Optimizing the code for creating irq_threshold sysfs node.
4. Remove interrupt-name property and obtain the IRQ based on the
   in-port number.
Link to v8: https://lore.kernel.org/r/20251211-enable-byte-cntr-for-ctcu-v8-0-3e12ff313191@oss.qualcomm.com

Changes in V8:
1. Optimizing the patch 1 and patch 2 according to Suzuki's comments.
2. Combine the patch 3 and patch 4 together.
3. Rename the interrupt-name to prevent confusion, for example:etr0->etrirq0.
Link to V7 - https://lore.kernel.org/all/20251013-enable-byte-cntr-for-ctcu-v7-0-e1e8f41e15dd@oss.qualcomm.com/

Changes in V7:
1. rebased on tag next-20251010
2. updated info for sysfs node document
Link to V6 - https://lore.kernel.org/all/20250908-enable-byte-cntr-for-tmc-v6-0-1db9e621441a@oss.qualcomm.com/

Changes in V6:
1. rebased on next-20250905.
2. fixed the issue that the dtsi file has re-named from sa8775p.dtsi to
   lemans.dtsi.
3. fixed some minor issues about comments.
Link to V5 - https://lore.kernel.org/all/20250812083731.549-1-jie.gan@oss.qualcomm.com/

Changes in V5:
1. Add Mike's reviewed-by tag for patchset 1,2,5.
2. Remove the function pointer added to helper_ops according to Mike's
   comment, it also results the patchset has been removed.
3. Optimizing the paired create/clean functions for etr_buf_list.
4. Remove the unneeded parameter "reading" from the etr_buf_node.
Link to V4 - https://lore.kernel.org/all/20250725100806.1157-1-jie.gan@oss.qualcomm.com/

Changes in V4:
1. Rename the function to coresight_get_in_port_dest regarding to Mike's
comment (patch 1/10).
2. Add lock to protect the connections regarding to Mike's comment
(patch 2/10).
3. Move all byte-cntr functions to coresight-ctcu-byte-cntr file.
4. Add tmc_read_ops to wrap all read operations for TMC device.
5. Add a function in helper_ops to check whether the byte-cntr is
enabkled.
6. Call byte-cntr's read_ops if byte-cntr is enabled when reading data
from the sysfs node.
Link to V3 resend - https://lore.kernel.org/all/20250714063109.591-1-jie.gan@oss.qualcomm.com/

Changes in V3 resend:
1. rebased on next-20250711.
Link to V3 - https://lore.kernel.org/all/20250624060438.7469-1-jie.gan@oss.qualcomm.com/

Changes in V3:
1. The previous solution has been deprecated.
2. Add a etr_buf_list to manage allcated etr buffers.
3. Add a logic to switch buffer for ETR.
4. Add read functions to read trace data from synced etr buffer.
Link to V2 - https://lore.kernel.org/all/20250410013330.3609482-1-jie.gan@oss.qualcomm.com/

Changes in V2:
1. Removed the independent file node /dev/byte_cntr.
2. Integrated the byte-cntr's file operations with current ETR file
   node.
3. Optimized the driver code of the CTCU that associated with byte-cntr.
4. Add kernel document for the export API tmc_etr_get_rwp_offset.
5. Optimized the way to read the rwp_offset according to Mike's
   suggestion.
6. Removed the dependency of the dts patch.
Link to V1 - https://lore.kernel.org/all/20250310090407.2069489-1-quic_jiegan@quicinc.com/

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>

---
Jie Gan (7):
      coresight: core: refactor ctcu_get_active_port and make it generic
      coresight: tmc: add create/clean functions for etr_buf_list
      coresight: tmc: introduce tmc_sysfs_ops to wrap sysfs read operations
      coresight: etr: add a new function to retrieve the CTCU device
      dt-bindings: arm: add an interrupt property for Coresight CTCU
      coresight: ctcu: enable byte-cntr for TMC ETR devices
      arm64: dts: qcom: lemans: add interrupts to CTCU device

 .../ABI/testing/sysfs-bus-coresight-devices-ctcu   |   9 +
 .../bindings/arm/qcom,coresight-ctcu.yaml          |  10 +
 arch/arm64/boot/dts/qcom/lemans.dtsi               |   3 +
 drivers/hwtracing/coresight/Makefile               |   2 +-
 drivers/hwtracing/coresight/coresight-core.c       |  27 ++
 .../hwtracing/coresight/coresight-ctcu-byte-cntr.c | 392 +++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-ctcu-core.c  | 158 +++++++--
 drivers/hwtracing/coresight/coresight-ctcu.h       |  81 ++++-
 drivers/hwtracing/coresight/coresight-priv.h       |   2 +
 drivers/hwtracing/coresight/coresight-tmc-core.c   |  55 ++-
 drivers/hwtracing/coresight/coresight-tmc-etr.c    | 289 ++++++++++++++-
 drivers/hwtracing/coresight/coresight-tmc.h        |  42 +++
 12 files changed, 995 insertions(+), 75 deletions(-)
---
base-commit: a39c950806213f6861d00f90729acaaa21f2d95a
change-id: 20260309-enable-byte-cntr-for-ctcu-ff86e6198b7f

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>

