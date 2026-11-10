Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794280982;
	b=tWRPpFoQ/8aC96sywu9oNsrJYHYyB5s0V3yKCmZ1/ZQ/J9+0gpRz6qWwCgwU7e2bvQzw
	 7jvF8Sku9os7pV7p+BOjA4L/uKfXPLurEPQFPjKnSbzR7zAPq9XY11d8Y2fQoIoZ95tOl
	 ONLQjOTdrvYku017wJJgbVndk4TDmto10igIm64TjvXO95jwazPXdH1HcNTv5qcB8ka30
	 gJWdyN/HCpsboYPDINrHeY2891573q/t4KsuSavx+baDSCVGhMTpmhnTqww1LiaePzHgo
	 4rzHzMCbDulpv0slioyni+KNS2wxQLDa2hgSKxb2OZZ7G2LRVswl9mYeFUySatIsIsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794280982;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=NWa5T56TEnrMrallUCe57/+LSgQ3nVs3in5jWSMvRFk=;
	b=Yz53l3ldSGKPPitrX3IVGnWahQGtCvSzpow9ceaZOvO4/wVyucMfoCUObOo9s65os2v6
	 1797OQjw3sbZSfHRF1cjVgFJ8ExoIEaKPXkDWj1NpERMFtkjxhyZQITCCp7+VRPlkvuR1
	 /bYx9EfIzyp/ZqajCccCwtyjRgkud8WzxT5FWZJlmx3ywq/ORSbe1P1Z4e/ZL6hlHYqBD
	 fTl4cNs0AhNKT88gNPgDQTY/yC1INxooQf4bSmRneXihplR7tHyu1A+xXRxysXMI35Z5f
	 eR0b30g7Sk9fbx+umsBfF0O67qiqfxEk028RdcUGgXEKTz8stiq3OpOYRsc/X8SUWJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cDXIMjsf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZLKtub9a;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5935A60A2615
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:23:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5935A60A2615
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cDXIMjsf;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZLKtub9a
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA2q6rh508892
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:23:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NWa5T56TEnrMrallUCe57/+LSgQ3nVs3in5jWSMvRFk=; b=cDXIMjsfl6j4V4Wo
	1ZRwsmwKaVwJH4y9gxLJ7fWo5UdVYOMc61La/8pG3oGeD6223+czOtC9KEa+9RqX
	44YNObHHPhz+aOJa37xcZEJONVamiGWp6ttbMDOJI9sjBJPIErOWreikwJnKXWSp
	GeGWH0JLWT1QfCOE3BhTzl3s3VpzWaAB9u4SyCz3uVpHoEGoz6fSS2ocmOv5ZP5H
	TaAhPjPQea6Wdqd9NfiubhwGRxUJWkHO5fFs7g8Mwtwjm0NFyfLjpAPQDAN27Igo
	UhSxHji6TtG05l4619YfL5hkbMrpahKuMMh102ugVV3xjE9YUah0bFIl22ZY77Zp
	ifnazw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hutv483my-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:23:00 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b08364cdc7so1390540a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 19:23:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794280980; x=1794885780; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NWa5T56TEnrMrallUCe57/+LSgQ3nVs3in5jWSMvRFk=;
        b=ZLKtub9aOsQIb6jZEOvRxpYJ6s1roylVdZkOPGfYQjM2i8f6dww/7aZoSY8A2zow5k
         rYQODIiCJf0Mtkc5GaLEInwY4lAtQ7Qa9lkxiKOdwPD4oONER5yz9WctludkPfTcdY2X
         O9yTKnj3kPesP9nBD9JIQ5d9G8xYmH1g9ZO1/eBRSQebrgA/Mnfk7Jh62i/Ch9YGLUye
         iNMA5Py/TkRm1KwRzRCtJu2ym2EgrUQ5PK23gjVQv69nXuYnr2BW2vA+B9qJU+/Xo5TK
         wUvNORu4KMcVEwzFbTQjKwB9tghmAOyF9RTOsslJ+TqU3vhLg1mujS2pGW7AiS03ON9n
         5WSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794280980; x=1794885780;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NWa5T56TEnrMrallUCe57/+LSgQ3nVs3in5jWSMvRFk=;
        b=uFRQfXIpHvcClp3qRxuhk/wQ4wc4KL7tTUBXIn/JJX76kK2pIYO8ZjzHRQrgR+RuRi
         V7fgSEP9fN2qahRXl6fT/sry1MMYMLot+5mBmRFKHs6xzDCQfIseeP+5KiM6J5hDEVii
         Ns2/vCKXhvCsS/79QvBcLxkRieg1d5nMF7dB9IpE0yUWR/Mxxl98kl2mfSBHfqwfmybT
         PA0QtvRXs1GJ6fzTDW8J5PqaxSAvwlCr3NsBzqVziv7IjBuL6iGzPLxu5ayVvoAIxKAQ
         3JLRawpiT6Bm+j7tWdKMmNY/+csZUJBw/Ia1AUHouysyeLUaxpOaic1qqHL5nSVfexg5
         1lzA==
X-Forwarded-Encrypted: i=1; AL+hErFF9KGNUY2Wm/v2hguw5CFJMUGWKYbsvBtrUs5gD4JMLXakwjRHKWsWIvHzK5cpFLt3i883Yaydlxq0mxs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+EP3Sq140nFIbg0ctF3H0Az4JB7tJ+btaLQTVGSQd0e9KfW3gS
	sfTLP1BXAoW4UP3WJhbBc4GJ5JP/Nw2c4dnQ1vxCkUlasTc/vE4PhhtBwo899tvjsm6TwLeM6cG
	vzl6QvL4A68KPVb7agmz3DlNRGOnkj0LIyDDDaabaZkuz5wVL0ipggUY0X3EFh7IlZqo=
X-Gm-Gg: AYBFou3TptNwNrQvds4mPykk1TJ9VXrTd2fzgUHCF/rdpE9swgr+Vf5yFgUHHQ+cA6x
	8ElbK+Edjfk5Lpgv0X8sWCZ0bF4mKn+ySAqgvA9phMakA/NFKyVu0/AdiykLTj8I8VGlit2ld8y
	e/gCC0A41Gcg9izSbgtYi6q6djF3Z2XVRm6nbcbCqlHvT0ukPo9yDnTGXKzclA9EfAeF+utaHGq
	JHdwPpccNTAj3wynL8x1ZFx/qwMS3HK6jiMcl4S9ODGAlRi8lx7tHTGQxVsYQX8EwQj8xfmPCWV
	A7AeLx+gg7ULxASzm+aaJKeSmDhyxaFVHaAAnsgyWR4enViJrTAWHsiTTSrzgJFyyg6HW0DHaUm
	RmvJbyHjoTThFDHIt2CoDfdOhnaAP2b4A9+wL1uL2oFBM9+P3mPn3Q40JDYxF3vJ4POjdoBWang
	iD67iwnqunCPShGak79dZPEE0r5ocmd8bMqSZi
X-Received: by 2002:a17:90b:37c8:b0:3a0:4668:4cb0 with SMTP id 98e67ed59e1d1-3b166d1efc2mr1671754a91.47.1794280979308;
        Mon, 09 Nov 2026 19:22:59 -0800 (PST)
X-Received: by 2002:a17:90b:37c8:b0:3a0:4668:4cb0 with SMTP id 98e67ed59e1d1-3b166d1efc2mr1671728a91.47.1794280978558;
        Mon, 09 Nov 2026 19:22:58 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16fea4243sm2341a91.14.2026.11.09.19.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:22:57 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 11:21:29 +0800
Subject: [PATCH v22 7/8] coresight: ctcu: enable byte-cntr for TMC ETR
 devices
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-enable-byte-cntr-for-ctcu-v22-7-05d48c0eb110@oss.qualcomm.com>
References: <20261110-enable-byte-cntr-for-ctcu-v22-0-05d48c0eb110@oss.qualcomm.com>
In-Reply-To: <20261110-enable-byte-cntr-for-ctcu-v22-0-05d48c0eb110@oss.qualcomm.com>
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
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794280922; l=36976;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=AGBQbk1Si10KLffINc0f8bwkbRxtKqkixWmatMXop58=;
 b=saYGB3WzBNitB5vWRzUcTijD+srVYheELu94HXJM53SJqpgV8uPVk3qrQEiUqHJ10ehPBbUof
 wSMI5ii3XHvBYXy2VNf+iJCBQY4M9MzDBmAKZnIOmadhpiqcjXqRH3U
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAxMyBTYWx0ZWRfX11S3uPAUSGZ9
 UL8nbfkWarWnd5onHx3QmEPQ3/qCF6+WL8qKv5rvirquOKP9bZbAx2s8GiVH9aowFCnTyVRuF+G
 VMRic4W2+vhBvMBUzuuiVr8QrFt3YEE=
X-Proofpoint-ORIG-GUID: 3J7VYT-9aHe4P7Rqif47p6SQMgUP0Lzq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAxMyBTYWx0ZWRfX1CbXYxLYVk2o
 6B1vv/qyPgvLZphGHNeH4BmeEcg/phFzowVjfzbacMkF+E+MiE+HdMX5bE3rax+LQbAvzQTeO80
 KWnB6hZBBkXlflTA9ww82eRLib6jfPlkyDvTQToK4yw5dVTCV0U3C6oF6x7bObA0ZGtPUYn32z8
 TyF49taQPaEu8AoRfihQg7nZI+xNIce5WW+aN4Njhzas9hoUf6co4hKh2ik3eLkGlEPIYoyUGaj
 xxRnV2XOfbjo3DTFTOYrGqtKerfnjMhvLDK9Ya83mMTEg271U1UXUdb9W9E4ym3x+Hw692n6dhB
 ooz/pEhstLf3XW6fI/BT5dGZXaaylI6GnC9kHFT+EeDrdnu52YaDTySMobC/iAMotrsos6L810s
 6QLNXpodnDqNN14acPP7dLs2Oa8g3RVPlt3OaYLXjL1i5xTh7iLleNGjEjeN4rBwGm1wSmd+lMt
 APIYhV8glUGeRrx/QEA==
X-Authority-Analysis: v=2.4 cv=B54sQ+tM c=1 sm=1 tr=0 ts=6af28e14 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=gzjODHL2Su8ay9s4ooIA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: 3J7VYT-9aHe4P7Rqif47p6SQMgUP0Lzq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100013

The byte-cntr function provided by the CTCU device is used to transfer data
from the ETR buffer to the userspace. An interrupt is triggered if the data
size exceeds the threshold set in the BYTECNTRVAL register. The interrupt
handler counts the number of triggered interruptions and the read function
will read the data from the synced ETR buffer.

When the current etr_buf is nearly full or the timeout is triggered, the
ETR is switched to the other etr_buf of the etr_buf_list and the synced
etr_buf becomes available for reading, while the ETR keeps tracing. Once
the trace has been stopped, the last etr_buf is read by the generic sysfs
read of the TMC.

The byte-cntr read is exclusive with the generic sysfs read of the TMC. It
is used only when it is enabled for the ETR, otherwise the TMC falls back
to its original read.

Byte-cntr workflow:
start -> ctcu_enable(ctcu_byte_cntr_start) -> tmc_enable_etr_sink ->
tmc_read_prepare_etr(jump to tmc_read_prepare_byte_cntr) ->
tmc_etr_get_sysfs_trace(jump to tmc_byte_cntr_get_data) ->
tmc_disable_etr_sink -> ctcu_disable(ctcu_byte_cntr_stop) ->
tmc_read_unprepare_etr(jump to tmc_read_unprepare_byte_cntr) -> finish

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../ABI/testing/sysfs-bus-coresight-devices-ctcu   |  13 +
 drivers/hwtracing/coresight/Makefile               |   2 +-
 .../hwtracing/coresight/coresight-ctcu-byte-cntr.c | 439 +++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-ctcu-core.c  | 172 +++++++-
 drivers/hwtracing/coresight/coresight-ctcu.h       |  91 ++++-
 drivers/hwtracing/coresight/coresight-tmc-core.c   |   3 +-
 drivers/hwtracing/coresight/coresight-tmc-etr.c    |  97 ++++-
 drivers/hwtracing/coresight/coresight-tmc.h        |   5 +
 8 files changed, 794 insertions(+), 28 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-ctcu b/Documentation/ABI/testing/sysfs-bus-coresight-devices-ctcu
new file mode 100644
index 000000000000..1f69316fcc05
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-ctcu
@@ -0,0 +1,13 @@
+What:           /sys/bus/coresight/devices/<ctcu-name>/irq_enabled[0:1]
+Date:           October 2026
+KernelVersion:  7.5
+Contact:        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>; Jinlong Mao <jinlong.mao@oss.qualcomm.com>; Jie Gan <jie.gan@oss.qualcomm.com>
+Description:
+		(RW) Configure the flag to enable interrupt to count data during CTCU enablement.
+		An interrupt is generated when the data size exceeds the value set in the IRQ register.
+		The byte-cntr function is started when the trace path is enabled with the
+		value set to 1. Changing the value while tracing doesn't start or stop it for
+		the running trace, and the value can't be changed while the byte-cntr read of
+		the ETR is in progress.
+		0 : disable
+		1 : enable
diff --git a/drivers/hwtracing/coresight/Makefile b/drivers/hwtracing/coresight/Makefile
index ab16d06783a5..821a1b06b20c 100644
--- a/drivers/hwtracing/coresight/Makefile
+++ b/drivers/hwtracing/coresight/Makefile
@@ -55,5 +55,5 @@ coresight-cti-y := coresight-cti-core.o	coresight-cti-platform.o \
 obj-$(CONFIG_ULTRASOC_SMB) += ultrasoc-smb.o
 obj-$(CONFIG_CORESIGHT_DUMMY) += coresight-dummy.o
 obj-$(CONFIG_CORESIGHT_CTCU) += coresight-ctcu.o
-coresight-ctcu-y := coresight-ctcu-core.o
+coresight-ctcu-y := coresight-ctcu-core.o coresight-ctcu-byte-cntr.o
 obj-$(CONFIG_CORESIGHT_KUNIT_TESTS) += coresight-kunit-tests.o
diff --git a/drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c b/drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c
new file mode 100644
index 000000000000..56a9aa2f693a
--- /dev/null
+++ b/drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c
@@ -0,0 +1,439 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/coresight.h>
+#include <linux/device.h>
+#include <linux/fs.h>
+#include <linux/interrupt.h>
+#include <linux/mutex.h>
+#include <linux/of_irq.h>
+#include <linux/uaccess.h>
+
+#include "coresight-ctcu.h"
+#include "coresight-priv.h"
+#include "coresight-tmc.h"
+
+/*
+ * The byte-cntr sysfs ops are shared by all the CTCU devices, so they are
+ * registered by the first CTCU with byte-cntr and removed with the last one.
+ */
+static DEFINE_MUTEX(byte_cntr_ops_lock);
+static int byte_cntr_ops_users;
+
+/*
+ * Drop the ops user of the CTCU device, only once for each device. It's called
+ * before the CTCU device is unregistered, so that the ops can't be used with a
+ * device which is being freed, and again by the devres action.
+ */
+void ctcu_byte_cntr_put_ops(struct ctcu_drvdata *drvdata)
+{
+	guard(mutex)(&byte_cntr_ops_lock);
+	if (!drvdata->byte_cntr_ops_held)
+		return;
+
+	drvdata->byte_cntr_ops_held = false;
+	if (!--byte_cntr_ops_users)
+		tmc_etr_reset_byte_cntr_sysfs_ops();
+}
+
+static void ctcu_byte_cntr_put_ops_action(void *data)
+{
+	ctcu_byte_cntr_put_ops(data);
+}
+
+static irqreturn_t byte_cntr_handler(int irq, void *data)
+{
+	struct ctcu_byte_cntr *byte_cntr_data = data;
+
+	atomic_inc(&byte_cntr_data->irq_cnt);
+	wake_up(&byte_cntr_data->wq);
+
+	return IRQ_HANDLED;
+}
+
+static void ctcu_cfg_byte_cntr_reg(struct ctcu_drvdata *drvdata, u32 val,
+				   u32 offset)
+{
+	/* A one value for IRQCTRL register represents 8 bytes */
+	ctcu_program_register(drvdata, val / 8, offset);
+}
+
+static struct ctcu_byte_cntr *ctcu_get_byte_cntr(struct coresight_device *ctcu,
+						 struct coresight_device *etr)
+{
+	struct ctcu_byte_cntr *byte_cntr_data;
+	struct ctcu_drvdata *drvdata;
+	int port;
+
+	/* The ETR may not be connected to a CTCU device */
+	if (!ctcu)
+		return NULL;
+
+	drvdata = dev_get_drvdata(ctcu->dev.parent);
+	port = coresight_get_in_port(etr, ctcu);
+	if (port < 0 || port >= ETR_MAX_NUM)
+		return NULL;
+
+	byte_cntr_data = &drvdata->byte_cntr_data[port];
+	/* The port is not initialized by ctcu_byte_cntr_init() */
+	if (!byte_cntr_data->ctcu_drvdata)
+		return NULL;
+
+	return byte_cntr_data;
+}
+
+/*
+ * ctcu_byte_cntr_get_data() - reads data from the deactivated and filled buffer.
+ * The byte-cntr reading work reads data from the deactivated and filled buffer.
+ * The read operation waits for a buffer to become available, either filled or
+ * upon timeout, and then reads trace data from the synced buffer.
+ */
+static ssize_t tmc_byte_cntr_get_data(struct tmc_drvdata *etr_drvdata, loff_t pos,
+				      size_t len, char **bufpp)
+{
+	struct coresight_device *ctcu = tmc_etr_get_ctcu_device(etr_drvdata);
+	struct device *dev = &etr_drvdata->csdev->dev;
+	struct ctcu_byte_cntr *byte_cntr_data;
+	struct etr_buf *sysfs_buf;
+	atomic_t *irq_cnt;
+	ssize_t actual;
+	int ret;
+
+	/* No byte-cntr read session, let the caller use the generic read */
+	byte_cntr_data = ctcu_get_byte_cntr(ctcu, etr_drvdata->csdev);
+	if (!byte_cntr_data || !byte_cntr_data->irq_enabled ||
+	    !byte_cntr_data->reading)
+		return -EINVAL;
+
+	/*
+	 * A zero-length read must not be treated as the end of the buffer,
+	 * otherwise the unread data of the current buffer would be dropped.
+	 */
+	if (!len)
+		return 0;
+
+	irq_cnt = &byte_cntr_data->irq_cnt;
+
+wait_buffer:
+	if (!byte_cntr_data->buf_node) {
+		ret = wait_event_interruptible_timeout(byte_cntr_data->wq,
+				(atomic_read(irq_cnt) >= MAX_IRQ_CNT - 1) ||
+				!byte_cntr_data->enable,
+				BYTE_CNTR_TIMEOUT);
+		if (ret < 0)
+			return ret;
+		/*
+		 * The current etr_buf is almost full or timeout is triggered,
+		 * so switch the buffer and mark the switched buffer as reading.
+		 */
+		if (byte_cntr_data->enable) {
+			byte_cntr_data->buf_node =
+				tmc_etr_switch_buf_node(etr_drvdata);
+			if (!byte_cntr_data->buf_node) {
+				/*
+				 * The sink has stopped, let the generic read
+				 * handle the last etr_buf.
+				 */
+				if (coresight_get_mode(etr_drvdata->csdev) != CS_MODE_SYSFS)
+					return 0;
+
+				dev_err(dev, "Switch buffer failed for the byte-cntr\n");
+				return -ENOMEM;
+			}
+
+			/*
+			 * Get the interrupt count of the switched out etr_buf
+			 * and reset it for the next etr_buf.
+			 */
+			if (atomic_xchg(irq_cnt, 0) >= MAX_IRQ_CNT)
+				dev_warn(dev, "Data overwrite happened\n");
+		} else {
+			/*
+			 * The CTCU device is removed while the sink is still
+			 * running. The generic read can't be used then as the
+			 * buffer in use is not synced yet, end the reading.
+			 */
+			if (READ_ONCE(byte_cntr_data->removing) &&
+			    coresight_get_mode(etr_drvdata->csdev) == CS_MODE_SYSFS)
+				return -ENODEV;
+
+			/* Exit byte-cntr reading */
+			return 0;
+		}
+	}
+
+	pos = byte_cntr_data->buf_node->pos;
+	sysfs_buf = byte_cntr_data->buf_node->sysfs_buf;
+	actual = tmc_etr_read_sysfs_buf(sysfs_buf, pos, len, bufpp);
+	if (actual <= 0) {
+		/* Reset buf_node upon reading is finished or failed */
+		byte_cntr_data->buf_node->reading = false;
+		byte_cntr_data->buf_node = NULL;
+
+		/*
+		 * Nothing in the buffer, waiting for the next buffer
+		 * to be filled.
+		 */
+		if (actual == 0)
+			goto wait_buffer;
+	}
+
+	return actual;
+}
+
+static int tmc_read_prepare_byte_cntr(struct tmc_drvdata *etr_drvdata)
+{
+	struct coresight_device *ctcu = tmc_etr_get_ctcu_device(etr_drvdata);
+	struct ctcu_byte_cntr *byte_cntr_data;
+	unsigned long flags;
+	int ret = 0;
+
+	/* byte-cntr is operating with SYSFS mode being enabled only */
+	if (coresight_get_mode(etr_drvdata->csdev) != CS_MODE_SYSFS)
+		return -EINVAL;
+
+	byte_cntr_data = ctcu_get_byte_cntr(ctcu, etr_drvdata->csdev);
+	if (!byte_cntr_data)
+		return -EINVAL;
+
+	raw_spin_lock_irqsave(&byte_cntr_data->spin_lock, flags);
+	/*
+	 * irq_enabled can only be changed with the lock held and reading
+	 * cleared, so check it here to keep it stable once reading is set.
+	 */
+	if (!byte_cntr_data->irq_enabled) {
+		raw_spin_unlock_irqrestore(&byte_cntr_data->spin_lock, flags);
+		return -EINVAL;
+	}
+
+	if (byte_cntr_data->reading) {
+		raw_spin_unlock_irqrestore(&byte_cntr_data->spin_lock, flags);
+		return -EBUSY;
+	}
+
+	/* byte_cntr_data->enable may race with ctcu_platform_remove() */
+	if (!byte_cntr_data->enable) {
+		raw_spin_unlock_irqrestore(&byte_cntr_data->spin_lock, flags);
+		return -ENODEV;
+	}
+
+	/*
+	 * Pin the module for the whole read session, so that rmmod fails with
+	 * -EBUSY instead of blocking in ctcu_platform_remove() until the file
+	 * is closed.
+	 */
+	if (!try_module_get(THIS_MODULE)) {
+		raw_spin_unlock_irqrestore(&byte_cntr_data->spin_lock, flags);
+		return -ENODEV;
+	}
+
+	reinit_completion(&byte_cntr_data->session_done);
+	byte_cntr_data->reading = true;
+	raw_spin_unlock_irqrestore(&byte_cntr_data->spin_lock, flags);
+
+	/* Setup an available etr_buf_list for byte-cntr */
+	ret = tmc_create_etr_buf_list(etr_drvdata, 2);
+	if (ret)
+		goto err_reading;
+
+	/*
+	 * The byte-cntr register is configured and the interrupts are counted
+	 * since the path was enabled, so irq_cnt is not reset here.
+	 */
+	scoped_guard(raw_spinlock_irqsave, &byte_cntr_data->spin_lock)
+		byte_cntr_data->buf_node = NULL;
+	/* enable_irq_wake() may sleep on slow-bus irqchips, call it unlocked */
+	enable_irq_wake(byte_cntr_data->irq);
+
+	return 0;
+
+err_reading:
+	/*
+	 * reading was set before the sleeping allocations, so
+	 * ctcu_platform_remove() may be waiting for the session to end. Complete
+	 * the session with reading cleared in one critical section, so that a
+	 * new session can't start in between.
+	 */
+	scoped_guard(raw_spinlock_irqsave, &byte_cntr_data->spin_lock) {
+		byte_cntr_data->reading = false;
+		complete_all(&byte_cntr_data->session_done);
+	}
+
+	module_put(THIS_MODULE);
+	return ret;
+}
+
+static int tmc_read_unprepare_byte_cntr(struct tmc_drvdata *etr_drvdata)
+{
+	struct coresight_device *ctcu = tmc_etr_get_ctcu_device(etr_drvdata);
+	struct ctcu_byte_cntr *byte_cntr_data;
+
+	/*
+	 * Do the unprepare operation only when the byte_cntr_data->reading
+	 * is truly set
+	 */
+	byte_cntr_data = ctcu_get_byte_cntr(ctcu, etr_drvdata->csdev);
+	if (!byte_cntr_data || !byte_cntr_data->irq_enabled ||
+	    !byte_cntr_data->reading)
+		return -EINVAL;
+
+	tmc_clean_etr_buf_list(etr_drvdata);
+
+	/* disable_irq_wake() may sleep on slow-bus irqchips, call it unlocked */
+	disable_irq_wake(byte_cntr_data->irq);
+
+	/*
+	 * The byte-cntr register is not accessed here: the trace path, which
+	 * keeps the CTCU powered, may have been released already. It is reset
+	 * when the path is disabled.
+	 */
+	scoped_guard(raw_spinlock_irqsave, &byte_cntr_data->spin_lock) {
+		byte_cntr_data->buf_node = NULL;
+		byte_cntr_data->reading = false;
+		/*
+		 * Complete the session with reading cleared in one critical
+		 * section, so that a new session can't start in between.
+		 * ctcu_platform_remove() may free byte_cntr_data after this,
+		 * don't use it anymore.
+		 */
+		complete_all(&byte_cntr_data->session_done);
+	}
+
+	module_put(THIS_MODULE);
+
+	return 0;
+}
+
+static const struct tmc_sysfs_ops byte_cntr_sysfs_ops = {
+	.read_prepare	= tmc_read_prepare_byte_cntr,
+	.read_unprepare	= tmc_read_unprepare_byte_cntr,
+	.get_trace_data	= tmc_byte_cntr_get_data,
+};
+
+/* Start the byte-cntr function when the path is enabled. */
+void ctcu_byte_cntr_start(struct coresight_device *csdev, struct coresight_path *path)
+{
+	struct coresight_device *sink = coresight_get_sink(path);
+	struct tmc_drvdata *etr_drvdata;
+	struct ctcu_byte_cntr *byte_cntr_data;
+
+	byte_cntr_data = ctcu_get_byte_cntr(csdev, sink);
+	if (!byte_cntr_data)
+		return;
+
+	etr_drvdata = dev_get_drvdata(sink->dev.parent);
+	guard(raw_spinlock_irqsave)(&byte_cntr_data->spin_lock);
+	/*
+	 * Don't start byte-cntr function when irq_enabled is not set, when the
+	 * CTCU device is being removed, or when the read of the previous trace
+	 * is still in progress: the sink can't be enabled until it is finished.
+	 */
+	if (!byte_cntr_data->irq_enabled || byte_cntr_data->removing ||
+	    byte_cntr_data->reading)
+		return;
+
+	/*
+	 * Don't touch the count and the threshold if the byte-cntr is already
+	 * started by another path of the same sink, as the buffer_size may have
+	 * been changed since then while the etr_buf in use is not.
+	 */
+	if (byte_cntr_data->enable)
+		return;
+
+	/* A new trace starts with an empty etr_buf */
+	atomic_set(&byte_cntr_data->irq_cnt, 0);
+
+	/*
+	 * Configure the byte-cntr register to enable IRQ while the path is
+	 * enabled, the CTCU is powered then. The configured size is 5% of the
+	 * buffer_size.
+	 */
+	ctcu_cfg_byte_cntr_reg(byte_cntr_data->ctcu_drvdata,
+			       etr_drvdata->size / MAX_IRQ_CNT,
+			       byte_cntr_data->irq_ctrl_offset);
+	byte_cntr_data->enable = true;
+}
+
+/* Stop the byte-cntr function when the path is disabled. */
+void ctcu_byte_cntr_stop(struct coresight_device *csdev, struct coresight_path *path)
+{
+	struct coresight_device *sink = coresight_get_sink(path);
+	struct ctcu_byte_cntr *byte_cntr_data;
+
+	if (coresight_get_mode(sink) == CS_MODE_SYSFS)
+		return;
+
+	byte_cntr_data = ctcu_get_byte_cntr(csdev, sink);
+	if (!byte_cntr_data)
+		return;
+
+	scoped_guard(raw_spinlock_irqsave, &byte_cntr_data->spin_lock) {
+		/*
+		 * Configure the byte-cntr register to disable IRQ before the
+		 * path is released, the CTCU is still powered.
+		 */
+		if (byte_cntr_data->enable)
+			ctcu_cfg_byte_cntr_reg(byte_cntr_data->ctcu_drvdata, 0,
+					       byte_cntr_data->irq_ctrl_offset);
+		byte_cntr_data->enable = false;
+	}
+
+	/* Wake up the blocked reader, which exits the byte-cntr reading */
+	wake_up(&byte_cntr_data->wq);
+}
+
+int ctcu_byte_cntr_init(struct device *dev, struct ctcu_drvdata *drvdata, int etr_num)
+{
+	struct ctcu_byte_cntr *byte_cntr_data;
+	struct device_node *nd = dev->of_node;
+	int irq_num, ret, i, irq_registered = 0;
+
+	for (i = 0; i < etr_num; i++) {
+		byte_cntr_data = &drvdata->byte_cntr_data[i];
+		/*
+		 * Initialize the lock and the waitqueue before requesting the
+		 * IRQ, and for every port as ctcu_platform_remove() uses them
+		 * even if the IRQ of the port is not registered.
+		 */
+		byte_cntr_data->ctcu_drvdata = drvdata;
+		init_waitqueue_head(&byte_cntr_data->wq);
+		raw_spin_lock_init(&byte_cntr_data->spin_lock);
+		init_completion(&byte_cntr_data->session_done);
+		/* No read session in progress */
+		complete_all(&byte_cntr_data->session_done);
+
+		irq_num = of_irq_get(nd, i);
+		if (irq_num <= 0) {
+			dev_err(dev, "Failed to get IRQ from DT for port%d\n", i);
+			continue;
+		}
+
+		ret = devm_request_irq(dev, irq_num, byte_cntr_handler,
+				       IRQF_TRIGGER_RISING,
+				       dev_name(dev), byte_cntr_data);
+		if (ret) {
+			dev_err(dev, "Failed to register IRQ for port%d\n", i);
+			continue;
+		}
+
+		byte_cntr_data->irq = irq_num;
+		irq_registered++;
+	}
+
+	if (!irq_registered)
+		return 0;
+
+	scoped_guard(mutex, &byte_cntr_ops_lock) {
+		tmc_etr_set_byte_cntr_sysfs_ops(&byte_cntr_sysfs_ops);
+		byte_cntr_ops_users++;
+		drvdata->byte_cntr_ops_held = true;
+	}
+
+	/*
+	 * Drop the ops user when the CTCU device is removed or probe fails. The
+	 * action is called at once if it can't be added, so fail the probe then.
+	 */
+	return devm_add_action_or_reset(dev, ctcu_byte_cntr_put_ops_action, drvdata);
+}
diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/hwtracing/coresight/coresight-ctcu-core.c
index 739105acb0a1..564ecc5ad515 100644
--- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
+++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (c) 2024-2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2024-2026 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include <linux/clk.h>
@@ -18,6 +19,7 @@
 
 #include "coresight-ctcu.h"
 #include "coresight-priv.h"
+#include "coresight-tmc.h"
 
 #define ctcu_writel(drvdata, val, offset)	__raw_writel((val), drvdata->base + offset)
 #define ctcu_readl(drvdata, offset)		__raw_readl(drvdata->base + offset)
@@ -43,17 +45,21 @@
 
 #define CTCU_ATID_REG_BIT(traceid)	(traceid % 32)
 #define CTCU_ATID_REG_SIZE		0x10
+#define CTCU_ETR0_IRQCTRL               0x6c
+#define CTCU_ETR1_IRQCTRL               0x70
 #define CTCU_ETR0_ATID0			0xf8
 #define CTCU_ETR1_ATID0			0x108
 
 static const struct ctcu_etr_config sa8775p_etr_cfgs[] = {
 	{
-		.atid_offset	= CTCU_ETR0_ATID0,
-		.port_num	= 0,
+		.atid_offset		= CTCU_ETR0_ATID0,
+		.irq_ctrl_offset	= CTCU_ETR0_IRQCTRL,
+		.port_num		= 0,
 	},
 	{
-		.atid_offset	= CTCU_ETR1_ATID0,
-		.port_num	= 1,
+		.atid_offset		= CTCU_ETR1_ATID0,
+		.irq_ctrl_offset	= CTCU_ETR1_IRQCTRL,
+		.port_num		= 1,
 	},
 };
 
@@ -62,6 +68,93 @@ static const struct ctcu_config sa8775p_cfgs = {
 	.num_etr_config	= ARRAY_SIZE(sa8775p_etr_cfgs),
 };
 
+/*
+ * The register access is unlocked and locked in the same way as the ATID
+ * register, so serialise them with drvdata->spin_lock. Otherwise one side may
+ * lock the registers between the unlock and the write of the other side.
+ */
+void ctcu_program_register(struct ctcu_drvdata *drvdata, u32 val, u32 offset)
+{
+	guard(raw_spinlock_irqsave)(&drvdata->spin_lock);
+	CS_UNLOCK(drvdata->base);
+	ctcu_writel(drvdata, val, offset);
+	CS_LOCK(drvdata->base);
+}
+
+static ssize_t irq_enabled_show(struct device *dev,
+				struct device_attribute *attr,
+				char *buf)
+{
+	struct ctcu_byte_cntr_irq_attribute *irq_attr =
+		container_of(attr, struct ctcu_byte_cntr_irq_attribute, attr);
+	struct ctcu_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	u8 port = irq_attr->port;
+
+	if (!drvdata->byte_cntr_data[port].irq_ctrl_offset)
+		return -EINVAL;
+
+	return sysfs_emit(buf, "%u\n",
+			(unsigned int)drvdata->byte_cntr_data[port].irq_enabled);
+}
+
+static ssize_t irq_enabled_store(struct device *dev,
+				 struct device_attribute *attr,
+				 const char *buf,
+				 size_t size)
+{
+	struct ctcu_byte_cntr_irq_attribute *irq_attr =
+		container_of(attr, struct ctcu_byte_cntr_irq_attribute, attr);
+	struct ctcu_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	u8 port = irq_attr->port;
+	unsigned long val;
+
+	if (kstrtoul(buf, 0, &val))
+		return -EINVAL;
+
+	guard(raw_spinlock_irqsave)(&drvdata->byte_cntr_data[port].spin_lock);
+	if (drvdata->byte_cntr_data[port].reading)
+		return -EBUSY;
+	else if (drvdata->byte_cntr_data[port].irq_ctrl_offset)
+		drvdata->byte_cntr_data[port].irq_enabled = !!val;
+
+	return size;
+}
+
+static umode_t irq_enabled_is_visible(struct kobject *kobj,
+				      struct attribute *attr, int n)
+{
+	struct device_attribute *dev_attr =
+		container_of(attr, struct device_attribute, attr);
+	struct ctcu_byte_cntr_irq_attribute *irq_attr =
+		container_of(dev_attr, struct ctcu_byte_cntr_irq_attribute, attr);
+	struct device *dev = kobj_to_dev(kobj);
+	struct ctcu_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	u8 port = irq_attr->port;
+
+	/* Expose irq_enabled only for the ports with a registered IRQ */
+	if (drvdata && drvdata->byte_cntr_data[port].irq_ctrl_offset &&
+	    drvdata->byte_cntr_data[port].irq)
+		return attr->mode;
+
+	return 0;
+}
+
+static struct attribute *ctcu_attrs[] = {
+	ctcu_byte_cntr_irq_rw(0),
+	ctcu_byte_cntr_irq_rw(1),
+	NULL,
+};
+
+static struct attribute_group ctcu_attr_grp = {
+	.attrs = ctcu_attrs,
+	.is_visible = irq_enabled_is_visible,
+};
+
+static const struct attribute_group *ctcu_attr_grps[] = {
+	&ctcu_attr_grp,
+	NULL,
+};
+
 static void ctcu_program_atid_register(struct ctcu_drvdata *drvdata, u32 reg_offset,
 				       u8 bit, bool enable)
 {
@@ -140,11 +233,23 @@ static int ctcu_set_etr_traceid(struct coresight_device *csdev, struct coresight
 static int ctcu_enable(struct coresight_device *csdev, enum cs_mode mode,
 		       struct coresight_path *path)
 {
-	return ctcu_set_etr_traceid(csdev, path, true);
+	int ret;
+
+	ret = ctcu_set_etr_traceid(csdev, path, true);
+	/*
+	 * Byte-cntr works in sysfs mode only. Start it once the trace ID is set,
+	 * as ctcu_disable() won't be called to stop it if the enabling failed.
+	 */
+	if (!ret && mode == CS_MODE_SYSFS)
+		ctcu_byte_cntr_start(csdev, path);
+
+	return ret;
 }
 
 static int ctcu_disable(struct coresight_device *csdev, struct coresight_path *path)
 {
+	ctcu_byte_cntr_stop(csdev, path);
+
 	return ctcu_set_etr_traceid(csdev, path, false);
 }
 
@@ -195,7 +300,12 @@ static int ctcu_probe(struct platform_device *pdev)
 			for (i = 0; i < cfgs->num_etr_config; i++) {
 				etr_cfg = &cfgs->etr_cfgs[i];
 				drvdata->atid_offset[i] = etr_cfg->atid_offset;
+				drvdata->byte_cntr_data[i].irq_ctrl_offset =
+					etr_cfg->irq_ctrl_offset;
 			}
+			ret = ctcu_byte_cntr_init(dev, drvdata, cfgs->num_etr_config);
+			if (ret)
+				return ret;
 		}
 	}
 
@@ -209,6 +319,7 @@ static int ctcu_probe(struct platform_device *pdev)
 	desc.dev = dev;
 	desc.ops = &ctcu_ops;
 	desc.access = CSDEV_ACCESS_IOMEM(base);
+	desc.groups = ctcu_attr_grps;
 	raw_spin_lock_init(&drvdata->spin_lock);
 
 	drvdata->csdev = coresight_register(&desc);
@@ -244,10 +355,59 @@ static int ctcu_platform_probe(struct platform_device *pdev)
 static void ctcu_platform_remove(struct platform_device *pdev)
 {
 	struct ctcu_drvdata *drvdata = platform_get_drvdata(pdev);
+	struct ctcu_byte_cntr *byte_cntr_data;
+	unsigned long flags;
+	int i;
 
 	if (WARN_ON(!drvdata))
 		return;
 
+	/*
+	 * Signal all active byte-cntr readers to exit, then wait for them to
+	 * finish before resetting the ops pointer and freeing driver data.
+	 * Without this, a reader blocked in wait_event_interruptible_timeout()
+	 * would access the freed ctcu_drvdata wait-queue head (use-after-free).
+	 *
+	 * The wait ends only when the userspace closes the tmc_etr file, so an
+	 * unbind with the file left open blocks until then. Unloading the module
+	 * is rejected with -EBUSY while a read session is open, so only a manual
+	 * unbind can block here.
+	 */
+	for (i = 0; i < ETR_MAX_NUM; i++) {
+		byte_cntr_data = &drvdata->byte_cntr_data[i];
+		/* The port was not initialized by ctcu_byte_cntr_init() */
+		if (!byte_cntr_data->irq)
+			continue;
+
+		raw_spin_lock_irqsave(&byte_cntr_data->spin_lock, flags);
+		/*
+		 * Set enable=false to signal teardown to racing readers, and
+		 * removing=true to keep a new path from enabling byte-cntr again.
+		 */
+		byte_cntr_data->enable = false;
+		byte_cntr_data->removing = true;
+		raw_spin_unlock_irqrestore(&byte_cntr_data->spin_lock, flags);
+
+		/* Wake up the blocked reader, then wait for the session to end */
+		wake_up_all(&byte_cntr_data->wq);
+		wait_for_completion(&byte_cntr_data->session_done);
+
+		/*
+		 * The ending session completes it with the lock held. Take the
+		 * lock once more, to be sure that it has released the lock
+		 * before byte_cntr_data is freed.
+		 */
+		raw_spin_lock_irqsave(&byte_cntr_data->spin_lock, flags);
+		raw_spin_unlock_irqrestore(&byte_cntr_data->spin_lock, flags);
+	}
+
+	/*
+	 * No byte-cntr session is left and a new one can't start now. Stop the
+	 * tmc driver from calling the byte-cntr ops before the CTCU device is
+	 * unregistered and freed.
+	 */
+	ctcu_byte_cntr_put_ops(drvdata);
+
 	ctcu_remove(pdev);
 	pm_runtime_disable(&pdev->dev);
 }
diff --git a/drivers/hwtracing/coresight/coresight-ctcu.h b/drivers/hwtracing/coresight/coresight-ctcu.h
index e9594c38dd91..005d63c0c27f 100644
--- a/drivers/hwtracing/coresight/coresight-ctcu.h
+++ b/drivers/hwtracing/coresight/coresight-ctcu.h
@@ -1,23 +1,32 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * Copyright (c) 2024-2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2024-2026 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #ifndef _CORESIGHT_CTCU_H
 #define _CORESIGHT_CTCU_H
+
+#include <linux/completion.h>
+#include <linux/time.h>
 #include "coresight-trace-id.h"
 
 /* Maximum number of supported ETR devices for a single CTCU. */
 #define ETR_MAX_NUM	2
 
+#define BYTE_CNTR_TIMEOUT	(3 * HZ)
+#define MAX_IRQ_CNT		20
+
 /**
- * struct ctcu_etr_config
+ * struct ctcu_etr_config - ETR specific configuration of the CTCU device
  * @atid_offset:	offset to the ATID0 Register.
- * @port_num:		in-port number of CTCU device that connected to ETR.
+ * @port_num:		in-port number of the CTCU device that connected to ETR.
+ * @irq_ctrl_offset:    offset to the BYTECNTRVAL register.
  */
 struct ctcu_etr_config {
 	const u32 atid_offset;
 	const u32 port_num;
+	const u32 irq_ctrl_offset;
 };
 
 struct ctcu_config {
@@ -25,15 +34,75 @@ struct ctcu_config {
 	int num_etr_config;
 };
 
-struct ctcu_drvdata {
-	void __iomem		*base;
-	struct clk		*apb_clk;
-	struct device		*dev;
-	struct coresight_device	*csdev;
+/**
+ * struct ctcu_byte_cntr - byte-cntr data of a port of the CTCU device
+ * @enable:		indicates that byte_cntr function is enabled or not.
+ * @irq_enabled:	indicates that the interruption is enabled.
+ * @reading:		indicates that byte_cntr is reading.
+ * @removing:		indicates that the CTCU device is being removed.
+ * @irq:		allocated number of the IRQ.
+ * @irq_cnt:		IRQ count number of the triggered interruptions.
+ * @wq:			waitqueue for reading data from ETR buffer.
+ * @spin_lock:		spinlock of the byte_cntr_data.
+ * @session_done:	completed when there is no read session in progress.
+ * @irq_ctrl_offset:	offset to the BYTECNTVAL Register.
+ * @ctcu_drvdata:	drvdata of the CTCU device.
+ * @buf_node:		etr_buf_node for reading.
+ */
+struct ctcu_byte_cntr {
+	bool			enable;
+	bool			irq_enabled;
+	bool			reading;
+	bool			removing;
+	int			irq;
+	atomic_t		irq_cnt;
+	wait_queue_head_t	wq;
 	raw_spinlock_t		spin_lock;
-	u32			atid_offset[ETR_MAX_NUM];
-	/* refcnt for each traceid of each sink */
-	u8			traceid_refcnt[ETR_MAX_NUM][CORESIGHT_TRACE_ID_RES_TOP];
+	struct completion	session_done;
+	u32			irq_ctrl_offset;
+	struct ctcu_drvdata	*ctcu_drvdata;
+	struct etr_buf_node	*buf_node;
 };
 
+struct ctcu_drvdata {
+	void __iomem			*base;
+	struct clk			*apb_clk;
+	struct device			*dev;
+	struct coresight_device		*csdev;
+	struct ctcu_byte_cntr		byte_cntr_data[ETR_MAX_NUM];
+	/* Protected by byte_cntr_ops_lock, set if the device is a user of the ops */
+	bool				byte_cntr_ops_held;
+	raw_spinlock_t			spin_lock;
+	u32				atid_offset[ETR_MAX_NUM];
+	/* refcnt for each traceid of each sink */
+	u8				traceid_refcnt[ETR_MAX_NUM][CORESIGHT_TRACE_ID_RES_TOP];
+};
+
+/**
+ * struct ctcu_byte_cntr_irq_attribute - sysfs attribute of the byte-cntr IRQ
+ * @attr:	The device attribute.
+ * @port:	port number.
+ */
+struct ctcu_byte_cntr_irq_attribute {
+	struct device_attribute	attr;
+	u8			port;
+};
+
+#define ctcu_byte_cntr_irq_rw(port)					\
+	(&((struct ctcu_byte_cntr_irq_attribute[]) {			\
+	   {								\
+		__ATTR(irq_enabled##port, 0644, irq_enabled_show,	\
+		irq_enabled_store),					\
+		port,							\
+	   }								\
+	})[0].attr.attr)
+
+void ctcu_program_register(struct ctcu_drvdata *drvdata, u32 val, u32 offset);
+
+/* Byte-cntr functions */
+void ctcu_byte_cntr_start(struct coresight_device *csdev, struct coresight_path *path);
+void ctcu_byte_cntr_stop(struct coresight_device *csdev, struct coresight_path *path);
+int ctcu_byte_cntr_init(struct device *dev, struct ctcu_drvdata *drvdata, int port_num);
+void ctcu_byte_cntr_put_ops(struct ctcu_drvdata *drvdata);
+
 #endif
diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index 4b40b692be4d..6ad09995ba87 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -293,7 +293,8 @@ static ssize_t tmc_read(struct file *file, char __user *data, size_t len,
 		return -EFAULT;
 	}
 
-	*ppos += actual;
+	if (!tmc_etr_update_buf_node_pos(drvdata, actual))
+		*ppos += actual;
 	dev_dbg(&drvdata->csdev->dev, "%zu bytes copied\n", actual);
 
 	return actual;
diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index cc341cdf8d8e..d856f0a190f7 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1168,6 +1168,9 @@ static int tmc_etr_enable_hw(struct tmc_drvdata *drvdata,
 	return rc;
 }
 
+/* Shared by the CTCU devices, set by the first one and reset by the last one. */
+static const struct tmc_sysfs_ops *byte_cntr_sysfs_ops;
+
 /*
  * Return the available trace data in the buffer (starts at etr_buf->offset,
  * limited by etr_buf->len) from @pos, with a maximum limit of @len,
@@ -1178,23 +1181,44 @@ static int tmc_etr_enable_hw(struct tmc_drvdata *drvdata,
  * We are protected here by drvdata->reading != 0, which ensures the
  * sysfs_buf stays alive.
  */
-ssize_t tmc_etr_get_sysfs_trace(struct tmc_drvdata *drvdata,
-				loff_t pos, size_t len, char **bufpp)
+ssize_t tmc_etr_read_sysfs_buf(struct etr_buf *sysfs_buf, loff_t pos,
+			       size_t len, char **bufpp)
 {
 	s64 offset;
 	ssize_t actual = len;
-	struct etr_buf *etr_buf = drvdata->sysfs_buf;
 
-	if (pos + actual > etr_buf->len)
-		actual = etr_buf->len - pos;
+	if (pos + actual > sysfs_buf->len)
+		actual = sysfs_buf->len - pos;
 	if (actual <= 0)
 		return actual;
 
 	/* Compute the offset from which we read the data */
-	offset = etr_buf->offset + pos;
-	if (offset >= etr_buf->size)
-		offset -= etr_buf->size;
-	return tmc_etr_buf_get_data(etr_buf, offset, actual, bufpp);
+	offset = sysfs_buf->offset + pos;
+	if (offset >= sysfs_buf->size)
+		offset -= sysfs_buf->size;
+	return tmc_etr_buf_get_data(sysfs_buf, offset, actual, bufpp);
+}
+EXPORT_SYMBOL_GPL(tmc_etr_read_sysfs_buf);
+
+ssize_t tmc_etr_get_sysfs_trace(struct tmc_drvdata *drvdata,
+				loff_t pos, size_t len, char **bufpp)
+{
+	ssize_t ret;
+	const struct tmc_sysfs_ops *byte_cntr_ops = READ_ONCE(byte_cntr_sysfs_ops);
+
+	if (byte_cntr_ops) {
+		ret = byte_cntr_ops->get_trace_data(drvdata, pos, len, bufpp);
+		/*
+		 * -EINVAL means byte-cntr has no active read session. 0 means
+		 * byte-cntr has no more data because the sink has stopped, the
+		 * last etr_buf is read by the generic read. Anything else is
+		 * the result of the byte-cntr session.
+		 */
+		if (ret != -EINVAL && ret != 0)
+			return ret;
+	}
+
+	return tmc_etr_read_sysfs_buf(drvdata->sysfs_buf, pos, len, bufpp);
 }
 
 static struct etr_buf *
@@ -2207,15 +2231,59 @@ int tmc_create_etr_buf_list(struct tmc_drvdata *drvdata, int num_nodes)
 }
 EXPORT_SYMBOL_GPL(tmc_create_etr_buf_list);
 
+void tmc_etr_set_byte_cntr_sysfs_ops(const struct tmc_sysfs_ops *sysfs_ops)
+{
+	WRITE_ONCE(byte_cntr_sysfs_ops, sysfs_ops);
+}
+EXPORT_SYMBOL_GPL(tmc_etr_set_byte_cntr_sysfs_ops);
+
+void tmc_etr_reset_byte_cntr_sysfs_ops(void)
+{
+	WRITE_ONCE(byte_cntr_sysfs_ops, NULL);
+}
+EXPORT_SYMBOL_GPL(tmc_etr_reset_byte_cntr_sysfs_ops);
+
+bool tmc_etr_update_buf_node_pos(struct tmc_drvdata *drvdata, ssize_t size)
+{
+	struct etr_buf_node *nd, *next;
+
+	if (drvdata->config_type != TMC_CONFIG_TYPE_ETR)
+		return false;
+
+	list_for_each_entry_safe(nd, next, &drvdata->etr_buf_list, link) {
+		if (nd && nd->reading) {
+			nd->pos += size;
+			return true;
+		}
+	}
+
+	return false;
+}
+
 int tmc_read_prepare_etr(struct tmc_drvdata *drvdata)
 {
 	int ret = 0;
 	unsigned long flags;
+	const struct tmc_sysfs_ops *byte_cntr_ops;
 
 	/* config types are set a boot time and never change */
 	if (WARN_ON_ONCE(drvdata->config_type != TMC_CONFIG_TYPE_ETR))
 		return -EINVAL;
 
+	byte_cntr_ops = READ_ONCE(byte_cntr_sysfs_ops);
+	if (byte_cntr_ops) {
+		ret = byte_cntr_ops->read_prepare(drvdata);
+		/*
+		 * -EINVAL and -ENODEV mean byte-cntr is not applicable to this
+		 * read, use the generic read. Return anything else, including
+		 * the errors of a byte-cntr session that failed to start.
+		 */
+		if (ret != -EINVAL && ret != -ENODEV)
+			return ret;
+
+		ret = 0;
+	}
+
 	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
 	/* The sysfs_buf is owned by the etr_buf_list */
 	if (drvdata->reading || !list_empty(&drvdata->etr_buf_list)) {
@@ -2248,11 +2316,22 @@ int tmc_read_unprepare_etr(struct tmc_drvdata *drvdata)
 {
 	unsigned long flags;
 	struct etr_buf *sysfs_buf = NULL;
+	const struct tmc_sysfs_ops *byte_cntr_ops;
 
 	/* config types are set a boot time and never change */
 	if (WARN_ON_ONCE(drvdata->config_type != TMC_CONFIG_TYPE_ETR))
 		return -EINVAL;
 
+	/*
+	 * Only the generic read sets drvdata->reading, and it is exclusive with
+	 * the byte-cntr read. Don't let the byte-cntr unprepare tear down the
+	 * state of another session when a generic read session is closed.
+	 */
+	byte_cntr_ops = READ_ONCE(byte_cntr_sysfs_ops);
+	if (byte_cntr_ops && !READ_ONCE(drvdata->reading))
+		if (!byte_cntr_ops->read_unprepare(drvdata))
+			return 0;
+
 	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
 
 	/* RE-enable the TMC if need be */
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 2345bdbb0b9d..af89825ec041 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -484,6 +484,11 @@ struct etr_buf *tmc_etr_get_buffer(struct coresight_device *csdev,
 extern const struct attribute_group coresight_etr_group;
 void tmc_clean_etr_buf_list(struct tmc_drvdata *drvdata);
 int tmc_create_etr_buf_list(struct tmc_drvdata *drvdata, int num_nodes);
+void tmc_etr_set_byte_cntr_sysfs_ops(const struct tmc_sysfs_ops *sysfs_ops);
+void tmc_etr_reset_byte_cntr_sysfs_ops(void);
 struct etr_buf_node *tmc_etr_switch_buf_node(struct tmc_drvdata *drvdata);
+bool tmc_etr_update_buf_node_pos(struct tmc_drvdata *drvdata, ssize_t size);
+ssize_t tmc_etr_read_sysfs_buf(struct etr_buf *sysfs_buf, loff_t pos,
+			       size_t len, char **bufpp);
 
 #endif

-- 
2.34.1

