Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794018478;
	b=wnMjssh2S7poCQqd6ASLl+4HXb7wCFNb0/wMbQeE/9epRV9THc63QfqREn0IQt+Hp/vb
	 9gc3RSIrtF63uWFOobMdSm35++3ob1IeTNKaz24KG9CvVe+VYmr1Hm7MACTreK3VAPVyq
	 Z2ezxhYxnryve744cl4jrIvPdVigFjUC87CIjxBO6FgaaKi5+BIFfsTH/Icwwc6Yz06dS
	 E716cozix8yaO2kKrB6NaUJXm0u33EKnMZC7FIpBm5gIWbFHo8QiNiSvP6347UJpjEKMC
	 2FOoh8+yDA3Tce+eEaYRKS6g4fXyVOdychT65tPT38VUauH1Vd65s4bFqybaoycV4aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794018478;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=J5JkOT56hoLiJhpiw9niBsTW+dkcEFrjzT5nkIrHFH8=;
	b=CFPdI0TC6CLxRvc0JOxWfyvn2LlwjFb5Fs30xmHo51RSJ8lZUTIGxAXIJToB1JNl+X+9
	 BMe18DNkV1aRIQd5/JiBstD98rmmaObIdUOn3hzMYxyW9wp0waqv8uj+nxLGmG+uiUFAN
	 J4NJwf4utILdgGTuoS4hHDcgZ5nSZLYZ6CH6W33k4p2ELiy15W2+7UFizJYVm5xk13KHA
	 KT7plHhd9M864VFhQX1pD8IN+ek/d70GoprrOiBloVvKAy+UiVgnLE4NZyyQtgWNyOkEX
	 HFVY/F7vTb3snACu4Brynpvsax3w+dq26y136I1ED6dDL4gm790Bx9/RMiyaFU4T+lQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YMDIxTRP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Jo5/WK9j";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D6D9606A32E
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 02:27:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D6D9606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YMDIxTRP;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Jo5/WK9j
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A72Ark5436636
	for <linux-kernel@vger.kernel.org>; Sat, 7 Nov 2026 02:27:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=J5JkOT56hoLiJhpiw9niBs
	TW+dkcEFrjzT5nkIrHFH8=; b=YMDIxTRPC0X4XzZv8RtQmHy4YgcY+krY6/vud2
	du3MKOvgyzdW6jqJXhEr6BQLb08fxxcEhCiBf0qi1cBm1ktILVQ9sTf1u/oeomsu
	DwAyHxtBIQ1Ng4DXMEhQHg9Y+g1bRBWoTY1vt+zsx0V+PnbFBoq2xv4HggqGi2ou
	elnekuwXprvsLJX2c0l2Cawl/x0kYscDg4nFIR6AShBRfjw7MOFLOLovRkFoxIPn
	ZV8iU0u7P8GBh9TcCqJx6G4y36UdvrSbLRoqIMW9TuY2FXrKGXx+W51/luo24scd
	qHQDpybwWptKp9Xkm2kV+7sE++nlUA7flfNSTEu+HjfXUj0w==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsmeb19e7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 02:27:51 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-351788121cfso3012604eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 18:27:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794018471; x=1794623271; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=J5JkOT56hoLiJhpiw9niBsTW+dkcEFrjzT5nkIrHFH8=;
        b=Jo5/WK9jVvV5/Ua1HQ0PVsUtfJZu6AprZzUwucNzecvc59SJi9/TSByHoPuF5ar3tU
         eIA1pMHtyy/ZVSxSuTQrVErqFTStgoiVmyAy0T2DFnDKf1qXOaf/oFdc9ZXu/WNCmHQd
         g6s7+SjmqNPbqoAZ6N3NpzUenbmqwJWbjTDADdsr/gKznrJtJf1VQa+7LfUqpBHZg+yc
         eLRfJeeujaH8iX5Ktn2LVNuf1utfR2OiREcwuM3CCElvVxoVplZ24JCwzqMMyZbL9Axi
         4nEjQ+KoPP7UB3hXXNb79cSyMj52cMfVVTy8JJ8xinWDr3xA/lUU6fUQ+ze0ZGaVWC0g
         iiYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794018471; x=1794623271;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=J5JkOT56hoLiJhpiw9niBsTW+dkcEFrjzT5nkIrHFH8=;
        b=c12tqH29K7ok9rGPE/FSRjnEwfTI6Xg2xPjF/XYyQg26q67srE21AxS7zMVy+iiizn
         +e39A9awUAJlqmZUFTuMPClACP/NN4PLJlHBYPTLdF/GN6jEqrfnenhLE8KaUr4EWyAJ
         qPcH8bIcZYeJraxXrNRNqbRm0JLCs8WoozR+Gc6Ko8YAIJBLC/Q365vsQsf/9tOdioq6
         hN3qi+9HdRO49Nv+5zIpi4jsQmFLGnoW/1ZmWtPYhp8pVSnMcs27iiGFwtrIClcqdWAH
         D7S/fN3Wo75p8CLfkixqf+LQ7vLAuHL6GMFpdUT0daVJcn+whLvJ1dzSmCwFZYJh7NgP
         mrdw==
X-Forwarded-Encrypted: i=1; AKwUvByIpstDTOCbd84CnzoZ48Y4FzD0Lm8HgvEAUfUhTKv/4cYg7R+L5xZfsBdxh0KpBtS0m/S+ckutnMZ1Prg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/LiLEh94WfQbMfdsA8yW55YZ/JrhcTKg/5MGhEcs1B6/a6AeW3
	sJJuck7hQVQXwGI58CZRghNLjZ+iaOyNr8Ak9no4ebXRWsaaAHwuRolMhw/R5VI2kfunkZP+XG1
	9IIX846jqFcilSOZ12/0/KgznaVKbhAG5Cggb6QlSvcyr4YuKah86rRbjymzM5hNus9Q=
X-Gm-Gg: AYBFou2/Vdc/gr2JjnjV3ZsIjH0gLKWOteNW6w9gys5jgz7nGs9Csu+tZzzwJCXHGEs
	qJd6IxndXdNQ9kdYorn635aIiqmvVDkAiQgXY5zL1pwXnyfhuR/qTdWf1r73UvtYOIitzxAK4bJ
	FloVejMYCClqrz6K2WiKSsx81C8wjPaBd5TFMXWoFZvKtgJa8u/XaTrXZUhPMk7jv8AZwXYJh3n
	1FPXOLxlbUhNyNT0NVkmmSQvExpHJmPgI6mXkaxKFP1Ej/mFtTyiO5YdGeLkjKKaS3FKGFEYdYm
	bDK1C2NVxg2H/AWlYDamQYMTxodk5D7an2CdB9BT76/dr0Xhcj3QSD3pqyGRxC1nrmK5D+DuOMw
	f5j39Erf/smV9IU+Fce9zMm+LDC4+1T23SUDCb+K3kR9bR3oua+w5x635LsOm0ifQn80JXx/lEs
	pCgEkUTZw=
X-Received: by 2002:a05:7301:1529:b0:36c:991e:c9b with SMTP id 5a478bee46e88-36f76620085mr5671905eec.14.1794018469753;
        Fri, 06 Nov 2026 18:27:49 -0800 (PST)
X-Received: by 2002:a05:7301:1529:b0:36c:991e:c9b with SMTP id 5a478bee46e88-36f76620085mr5671861eec.14.1794018469013;
        Fri, 06 Nov 2026 18:27:49 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa8d44a5fsm10083729eec.7.2026.11.06.18.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 18:27:48 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Sat, 07 Nov 2026 07:57:38 +0530
Subject: [PATCH v3] PCI: qcom: Add register dump support for PCIe Link Down
 events
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
Message-Id: <20261107-regdump-v3-1-c85648af91ee@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAJmM7moC/22NzQ6CMBAGX8X0bEl/gIon38N4gHYLNUKxhUZDe
 HdbPHDQyyaTzHy7IA/OgEfnw4IcBOONHSLw4wHJrh5awEZFRoywkpwoxQ5aNfcjplTQSotCAZE
 o2qMDbV7b0vX2ZT83d5BTypPRGT9Z995eBZq839VAMcWaMdVw3XAh2cV6nz3n+iFt32fxoDQe2
 J5XpNhzlnKheK4rleu8/JOv6/oBYP5D2vYAAAA=
X-Change-ID: 20260811-regdump-11719f75de0c
To: Jingoo Han <jingoohan1@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794018464; l=18241;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=n+oemVFfVvvFpb+HXoRKks9VESnI2piWhqW2Y/i1P/o=;
 b=K0IngBh8ztHoEg7FFzPpL7k+oqLf0372Ufg9Zd/IUGGLwh7lIzDmRtduXMxsg8LxeMqngSVXj
 hlDHrYnA1/0CHi+4iOB49tR1kkJSf3hO4FL6YlvkMnXB9KD9kMWUpRX
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: aI11zugAYDwVn7NN57obPyLhlmnvSKNX
X-Authority-Analysis: v=2.4 cv=DOAacCNb c=1 sm=1 tr=0 ts=6aee8ca7 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=gg493kEN4VsyBVRm_50A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA3MDAwOSBTYWx0ZWRfXwrdgRNCPZSdM
 MeByuPbWr0ArX4HpglN4/f55drill8kQLuLbb69TbGVD1LuiOSSr9wLAZyZvxxIytMHKE/yR8wR
 TFPMz5J8AFtRhxIl0Vadh+7t3E+PM1k=
X-Proofpoint-ORIG-GUID: aI11zugAYDwVn7NN57obPyLhlmnvSKNX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA3MDAwOSBTYWx0ZWRfX7eB7CdsnAUyL
 QdS4gec0yeSJtJTaqKQVS6CNnc6+3AE0x5KLk3Nw5Dyaft09jGlnDB7nmfs0o5kTJdKmZHdxMaF
 Tzyc8PAfzANiRwHNGJ03qgG4deFafvMRoYKEgmMxJaqFdkA7CUPRLl8gI+E2EavodVlVdY43cFq
 mIHn7kXM8tbrHBWt9XkJWkeIJnmbgSdHsdA3IP/ZTRJRSf0sQuksdO8StVqF6EUYAh9uT+SYO4I
 mEQjlZab+vh9sb3DfDXHFUaOpFLTryTIyFVXOcj9UC8+fmh1EbGNBrbdff3G2mwjd8MZyYyvlK9
 ciTIFr9IpF33cty38y8jzvDbMNSvzkhmM7AFpr/cTN/EY/oWfK+nqkCSgnLSFtplDLBGy9C00AO
 hThovaTbPGsuuim8uUX4wcB+CPB6assqMugQlG5r9ZDRFb4tZzzQaFYxMhNy6UHQMhc7bNR3Ylp
 l53+eY/vVXqaoi/S6Tw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-07_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 bulkscore=0 adultscore=0
 impostorscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611070009

When the PCIe link goes down unexpectedly, being able to inspect the
state of key controller registers at the time of failure is valuable
for root-causing the issue.

On a Link Down event, dump the key PCIe controller registers to dmesg
via dev_err() so the state at the time of failure is immediately
visible. As printk() truncates messages longer than LOG_LINE_MAX, the
dump is emitted one line at a time rather than as a single call.

To keep the dump readable given the number of registers involved,
entries are packed as "offset: value" pairs, QCOM_PCIE_DUMP_REGS_PER_LINE
(4) per line, with a section header ("DBI registers:", "PARF
registers:", "MHI registers:") identifying each register group.

Also expose the same dump on demand via a new "regdump" debugfs file
under the existing per-controller debugfs directory, so the register
state can be inspected without needing an actual Link Down event.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
Changes in v3:
- Remove devcoredump as per offline discussions with Mani.
- Link to v2: https://patch.msgid.link/20260905-regdump-v2-1-f7d34f9d4f46@oss.qualcomm.com

Changes in v2:
- Fixed the sashiko comments, add missed qcom_pcie_ext_parf_dump_regs
  usage, print the dump one line at a time instead of as a single dev_err() call,
  create debugfs even if mhi is not present.
- Link to v1: https://patch.msgid.link/20260811-regdump-v1-1-f22db3fb37c2@oss.qualcomm.com
---
 drivers/pci/controller/dwc/pcie-designware.h |   6 +
 drivers/pci/controller/dwc/pcie-qcom.c       | 323 ++++++++++++++++++++++++++-
 include/uapi/linux/pci_regs.h                |   2 +
 3 files changed, 327 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index 6d788aa00011..1d50aecef380 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -288,6 +288,12 @@
 
 #define RAS_DES_EVENT_COUNTER_DATA	0xc
 
+/* SD-EQ (Gen5 32 GT/s per-lane pre/post cursor equalization) registers */
+#define PCIE_RAS_DES_SD_EQ_CONTROL1		0xd0
+#define PCIE_RAS_DES_SD_EQ_CONTROL1_LANE_SEL	GENMASK(3, 0)
+#define PCIE_RAS_DES_SD_EQ_STATUS2		0xe4
+#define PCIE_RAS_DES_SD_EQ_STATUS3		0xe8
+
 /* PTM register definitions */
 #define PTM_RES_REQ_CTRL		0x8
 #define PTM_RES_CCONTEXT_VALID		BIT(0)
diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index d903f10211c2..147aab6f4155 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -34,6 +34,7 @@
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
 #include <linux/slab.h>
+#include <linux/string.h>
 #include <linux/types.h>
 #include <linux/units.h>
 
@@ -45,6 +46,8 @@
 /* PARF registers */
 #define PARF_SYS_CTRL				0x00
 #define PARF_PM_CTRL				0x20
+#define PARF_PM_STTS				0x24
+#define PARF_PM_STTS_1				0x28
 #define PARF_PCS_DEEMPH				0x34
 #define PARF_PCS_SWING				0x38
 #define PARF_PHY_CTRL				0x40
@@ -63,11 +66,17 @@
 #define PARF_STATUS				0x230
 #define PARF_SID_OFFSET				0x234
 #define PARF_BDF_TRANSLATE_CFG			0x24c
+#define PARF_CLKREQ_OVERRIDE			0x2b0
 #define PARF_DBI_BASE_ADDR_V2			0x350
 #define PARF_DBI_BASE_ADDR_V2_HI		0x354
 #define PARF_SLV_ADDR_SPACE_SIZE_V2		0x358
 #define PARF_SLV_ADDR_SPACE_SIZE_V2_HI		0x35c
 #define PARF_NO_SNOOP_OVERRIDE			0x3d4
+#define PARF_CORE_ERRORS			0x3c0
+#define PARF_L1SS_SLEEP_MODE_HANDLER_STATUS	0x4d0
+#define PARF_L1SS_SLEEP_MODE_HANDLER_CFG	0x4d4
+#define PARF_INT_ALL_2_STATUS			0x500
+#define PARF_LINK_DOWN_AXI_ECAM_BLOCK_STATUS	0x630
 #define PARF_ATU_BASE_ADDR			0x634
 #define PARF_ATU_BASE_ADDR_HI			0x638
 #define PARF_DEVICE_TYPE			0x1000
@@ -101,8 +110,12 @@
 
 /* MHI registers */
 #define PARF_DEBUG_CNT_PM_LINKST_IN_L2		0xc04
+#define PARF_DEBUG_CNT_PM_LINKST_IN_L1SUB	0xc08
 #define PARF_DEBUG_CNT_PM_LINKST_IN_L1		0xc0c
 #define PARF_DEBUG_CNT_PM_LINKST_IN_L0S		0xc10
+#define PARF_DEBUG_CNT_AUX_CLK_APP_REQ_EXIT_L1		0xc14
+#define PARF_DEBUG_CNT_AUX_CLK_APP_READY_ENTER_L23	0xc18
+#define PARF_DEBUG_CNT_AUX_CLK_APP_READY_ENTER_L1	0xc1c
 #define PARF_DEBUG_CNT_AUX_CLK_IN_L1SUB_L1	0xc84
 #define PARF_DEBUG_CNT_AUX_CLK_IN_L1SUB_L2	0xc88
 
@@ -207,11 +220,48 @@
 #define PERST_DELAY_US				1000
 #define FLUSH_TIMEOUT_US			100
 
+/* Dump buffer size for the link-down register dump */
+#define QCOM_PCIE_DUMP_BUF_SIZE			SZ_8K
+
 #define QCOM_PCIE_CRC8_POLYNOMIAL		(BIT(2) | BIT(1) | BIT(0))
 
 #define QCOM_PCIE_LINK_SPEED_TO_BW(speed) \
 		Mbps_to_icc(PCIE_SPEED2MBS_ENC(pcie_get_link_speed(speed)))
 
+#define QCOM_PCIE_DUMP_REGS_PER_LINE	4
+
+static const u32 qcom_pcie_parf_dump_regs[] = {
+	PARF_LTSSM,
+	PARF_INT_ALL_STATUS,
+	PARF_SYS_CTRL,
+};
+
+static const u32 qcom_pcie_ext_parf_dump_regs[] = {
+	PARF_PM_STTS,
+	PARF_PM_STTS_1,
+	PARF_INT_ALL_STATUS,
+	PARF_INT_ALL_2_STATUS,
+	PARF_CLKREQ_OVERRIDE,
+	PARF_L1SS_SLEEP_MODE_HANDLER_STATUS,
+	PARF_L1SS_SLEEP_MODE_HANDLER_CFG,
+	PARF_CORE_ERRORS,
+	PARF_LINK_DOWN_AXI_ECAM_BLOCK_STATUS,
+	PARF_STATUS,
+	PARF_SYS_CTRL,
+};
+
+static const u32 qcom_pcie_mhi_dump_regs[] = {
+	PARF_DEBUG_CNT_PM_LINKST_IN_L2,
+	PARF_DEBUG_CNT_PM_LINKST_IN_L1SUB,
+	PARF_DEBUG_CNT_PM_LINKST_IN_L1,
+	PARF_DEBUG_CNT_PM_LINKST_IN_L0S,
+	PARF_DEBUG_CNT_AUX_CLK_APP_REQ_EXIT_L1,
+	PARF_DEBUG_CNT_AUX_CLK_APP_READY_ENTER_L23,
+	PARF_DEBUG_CNT_AUX_CLK_APP_READY_ENTER_L1,
+	PARF_DEBUG_CNT_AUX_CLK_IN_L1SUB_L1,
+	PARF_DEBUG_CNT_AUX_CLK_IN_L1SUB_L2,
+};
+
 struct qcom_pcie_resources_1_0_0 {
 	struct clk_bulk_data *clks;
 	int num_clks;
@@ -294,12 +344,15 @@ struct qcom_pcie_ops {
   * @override_no_snoop: Override NO_SNOOP attribute in TLP to enable cache
   * snooping
   * @firmware_managed: Set if the Root Complex is firmware managed
+  * @has_ext_parf_regs: Set if the PARF block implements the extended
+  * register set used by qcom_pcie_dump_regs().
   */
 struct qcom_pcie_cfg {
 	const struct qcom_pcie_ops *ops;
 	bool override_no_snoop;
 	bool firmware_managed;
 	bool no_l0s;
+	bool has_ext_parf_regs;
 };
 
 struct qcom_pcie_perst {
@@ -1692,12 +1745,14 @@ static const struct qcom_pcie_cfg cfg_1_0_0 = {
 
 static const struct qcom_pcie_cfg cfg_1_9_0 = {
 	.ops = &ops_1_9_0,
+	.has_ext_parf_regs = true,
 };
 
 static const struct qcom_pcie_cfg cfg_1_34_0 = {
 	.ops = &ops_1_9_0,
 	.override_no_snoop = true,
 	.no_l0s = true,
+	.has_ext_parf_regs = true,
 };
 
 static const struct qcom_pcie_cfg cfg_2_1_0 = {
@@ -1719,6 +1774,7 @@ static const struct qcom_pcie_cfg cfg_2_4_0 = {
 
 static const struct qcom_pcie_cfg cfg_2_7_0 = {
 	.ops = &ops_2_7_0,
+	.has_ext_parf_regs = true,
 };
 
 static const struct qcom_pcie_cfg cfg_2_9_0 = {
@@ -1728,6 +1784,7 @@ static const struct qcom_pcie_cfg cfg_2_9_0 = {
 static const struct qcom_pcie_cfg cfg_sc8280xp = {
 	.ops = &ops_1_21_0,
 	.no_l0s = true,
+	.has_ext_parf_regs = true,
 };
 
 static const struct qcom_pcie_cfg cfg_fw_managed = {
@@ -1855,6 +1912,260 @@ static int qcom_pcie_set_max_opp(struct device *dev)
 	return ret;
 }
 
+/*
+ * qcom_pcie_dump_advance_col - advance @col and append a separator to @buf.
+ *
+ * @col tracks the current column within the active section and must be
+ * reset to 0 by the caller at the start of each new section; a newline is
+ * emitted every QCOM_PCIE_DUMP_REGS_PER_LINE entries to keep the dump
+ * compact in dmesg.
+ */
+static size_t qcom_pcie_dump_advance_col(char *buf, size_t buf_size, int *col)
+{
+	*col += 1;
+
+	return scnprintf(buf, buf_size,
+			 (*col % QCOM_PCIE_DUMP_REGS_PER_LINE) ? "  " : "\n");
+}
+
+static size_t qcom_pcie_dump_reg_val(char *buf, size_t buf_size, int *col,
+				     u32 offset, u32 val)
+{
+	size_t len;
+
+	len = scnprintf(buf, buf_size, "0x%03x: 0x%08x", offset, val);
+	len += qcom_pcie_dump_advance_col(buf + len, buf_size - len, col);
+
+	return len;
+}
+
+/* Same as qcom_pcie_dump_reg_val(), but tags the entry with a lane number
+ * since the RAS-DES SD-EQ status registers are read once per lane at a
+ * fixed offset, so the offset alone can't tell entries apart.
+ */
+static size_t qcom_pcie_dump_lane_reg_val(char *buf, size_t buf_size, int *col,
+					  int lane, u32 offset, u32 val)
+{
+	size_t len;
+
+	len = scnprintf(buf, buf_size, "L%d/0x%03x: 0x%08x", lane, offset, val);
+	len += qcom_pcie_dump_advance_col(buf + len, buf_size - len, col);
+
+	return len;
+}
+
+static size_t qcom_pcie_dump_reg_table(void __iomem *base, const u32 *regs,
+				       int nregs, char *buf, size_t buf_size)
+{
+	size_t len = 0;
+	int col = 0;
+	int i;
+
+	for (i = 0; i < nregs; i++)
+		len += qcom_pcie_dump_reg_val(buf + len, buf_size - len, &col,
+					      regs[i], readl_relaxed(base + regs[i]));
+
+	if (col % QCOM_PCIE_DUMP_REGS_PER_LINE)
+		len += scnprintf(buf + len, buf_size - len, "\n");
+
+	return len;
+}
+
+/*
+ * qcom_pcie_fill_dump_buf - fill @buf with key PCIe register values captured
+ * at Link Down time.
+ *
+ * Returns the number of bytes written into @buf.
+ */
+static size_t qcom_pcie_fill_dump_buf(struct qcom_pcie *pcie, char *buf,
+				      size_t buf_size)
+{
+	struct dw_pcie *pci = pcie->pci;
+	u16 exp_cap, aer_cap, l1ss_cap, secpci_cap, pl16gt_cap, pl32gt_cap;
+	size_t len = 0;
+	int col = 0;
+	u32 val;
+
+	len += scnprintf(buf + len, buf_size - len, "DBI registers:\n");
+
+	exp_cap = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
+	if (exp_cap) {
+		val = dw_pcie_readl_dbi(pci, exp_cap + PCI_EXP_LNKCAP);
+		len += qcom_pcie_dump_reg_val(buf + len, buf_size - len, &col,
+					     exp_cap + PCI_EXP_LNKCAP, val);
+
+		val = dw_pcie_readl_dbi(pci, exp_cap + PCI_EXP_LNKCTL);
+		len += qcom_pcie_dump_reg_val(buf + len, buf_size - len, &col,
+					     exp_cap + PCI_EXP_LNKCTL, val);
+
+		val = dw_pcie_readl_dbi(pci, exp_cap + PCI_EXP_LNKCTL2);
+		len += qcom_pcie_dump_reg_val(buf + len, buf_size - len, &col,
+					     exp_cap + PCI_EXP_LNKCTL2, val);
+	}
+
+	aer_cap = dw_pcie_find_ext_capability(pci, PCI_EXT_CAP_ID_ERR);
+	if (aer_cap) {
+		val = dw_pcie_readl_dbi(pci, aer_cap + PCI_ERR_UNCOR_STATUS);
+		len += qcom_pcie_dump_reg_val(buf + len, buf_size - len, &col,
+					     aer_cap + PCI_ERR_UNCOR_STATUS, val);
+
+		val = dw_pcie_readl_dbi(pci, aer_cap + PCI_ERR_COR_STATUS);
+		len += qcom_pcie_dump_reg_val(buf + len, buf_size - len, &col,
+					     aer_cap + PCI_ERR_COR_STATUS, val);
+	}
+
+	l1ss_cap = dw_pcie_find_ext_capability(pci, PCI_EXT_CAP_ID_L1SS);
+	if (l1ss_cap) {
+		val = dw_pcie_readl_dbi(pci, l1ss_cap + PCI_L1SS_CTL1);
+		len += qcom_pcie_dump_reg_val(buf + len, buf_size - len, &col,
+					     l1ss_cap + PCI_L1SS_CTL1, val);
+	}
+
+	secpci_cap = dw_pcie_find_ext_capability(pci, PCI_EXT_CAP_ID_SECPCI);
+	if (secpci_cap) {
+		val = dw_pcie_readl_dbi(pci, secpci_cap + PCI_SECPCI_LE_CTRL);
+		len += qcom_pcie_dump_reg_val(buf + len, buf_size - len, &col,
+					     secpci_cap + PCI_SECPCI_LE_CTRL, val);
+
+		val = dw_pcie_readl_dbi(pci, secpci_cap + PCI_SECPCI_LE_CTRL + 4);
+		len += qcom_pcie_dump_reg_val(buf + len, buf_size - len, &col,
+					     secpci_cap + PCI_SECPCI_LE_CTRL + 4, val);
+	}
+
+	pl16gt_cap = dw_pcie_find_ext_capability(pci, PCI_EXT_CAP_ID_PL_16GT);
+	if (pl16gt_cap) {
+		val = dw_pcie_readl_dbi(pci, pl16gt_cap + PCI_PL_16GT_LE_CTRL);
+		len += qcom_pcie_dump_reg_val(buf + len, buf_size - len, &col,
+					     pl16gt_cap + PCI_PL_16GT_LE_CTRL, val);
+
+		val = dw_pcie_readl_dbi(pci, pl16gt_cap + PCI_PL_16GT_STATUS);
+		len += qcom_pcie_dump_reg_val(buf + len, buf_size - len, &col,
+					     pl16gt_cap + PCI_PL_16GT_STATUS, val);
+	}
+
+	pl32gt_cap = dw_pcie_find_ext_capability(pci, PCI_EXT_CAP_ID_PL_32GT);
+	if (pl32gt_cap) {
+		val = dw_pcie_readl_dbi(pci, pl32gt_cap + PCI_PL_32GT_LE_CTRL);
+		len += qcom_pcie_dump_reg_val(buf + len, buf_size - len, &col,
+					     pl32gt_cap + PCI_PL_32GT_LE_CTRL, val);
+
+		val = dw_pcie_readl_dbi(pci, pl32gt_cap + PCI_PL_32GT_STATUS);
+		len += qcom_pcie_dump_reg_val(buf + len, buf_size - len, &col,
+					     pl32gt_cap + PCI_PL_32GT_STATUS, val);
+	}
+
+	/*
+	 * Gen5 (32 GT/s) local/remote pre/post cursor status, read through the
+	 * SD-EQ registers inside the DWC RAS-DES vendor-specific extended
+	 * capability. For each lane, write the lane selector into
+	 * PCIE_RAS_DES_SD_EQ_CONTROL1 then read back
+	 * PCIE_RAS_DES_SD_EQ_STATUS2/3, which carry the local/remote pre/post
+	 * cursor values.
+	 */
+	if (pcie_get_link_speed(pci->max_link_speed) == PCIE_SPEED_32_0GT) {
+		u16 rasdes_cap = dw_pcie_find_rasdes_capability(pci);
+
+		if (rasdes_cap) {
+			int num_lanes = dw_pcie_link_get_max_link_width(pci);
+			int lane;
+
+			for (lane = 0; lane < num_lanes; lane++) {
+				val = dw_pcie_readl_dbi(pci,
+							rasdes_cap + PCIE_RAS_DES_SD_EQ_CONTROL1);
+				val &= ~PCIE_RAS_DES_SD_EQ_CONTROL1_LANE_SEL;
+				val |= lane & PCIE_RAS_DES_SD_EQ_CONTROL1_LANE_SEL;
+				dw_pcie_writel_dbi(pci,
+						   rasdes_cap + PCIE_RAS_DES_SD_EQ_CONTROL1,
+						   val);
+
+				val = dw_pcie_readl_dbi(pci,
+							rasdes_cap + PCIE_RAS_DES_SD_EQ_STATUS2);
+				len += qcom_pcie_dump_lane_reg_val(buf + len, buf_size - len, &col,
+							lane,
+							rasdes_cap + PCIE_RAS_DES_SD_EQ_STATUS2,
+							val);
+
+				val = dw_pcie_readl_dbi(pci,
+							rasdes_cap + PCIE_RAS_DES_SD_EQ_STATUS3);
+				len += qcom_pcie_dump_lane_reg_val(buf + len, buf_size - len, &col,
+							lane,
+							rasdes_cap + PCIE_RAS_DES_SD_EQ_STATUS3,
+							val);
+			}
+		}
+	}
+
+	if (col % QCOM_PCIE_DUMP_REGS_PER_LINE)
+		len += scnprintf(buf + len, buf_size - len, "\n");
+
+	len += scnprintf(buf + len, buf_size - len, "\nPARF registers:\n");
+	if (pcie->cfg->has_ext_parf_regs)
+		len += qcom_pcie_dump_reg_table(pcie->parf, qcom_pcie_ext_parf_dump_regs,
+						ARRAY_SIZE(qcom_pcie_ext_parf_dump_regs),
+						buf + len, buf_size - len);
+	else
+		len += qcom_pcie_dump_reg_table(pcie->parf, qcom_pcie_parf_dump_regs,
+						ARRAY_SIZE(qcom_pcie_parf_dump_regs),
+						buf + len, buf_size - len);
+
+	if (!pcie->mhi)
+		return len;
+
+	len += scnprintf(buf + len, buf_size - len, "\nMHI registers:\n");
+	len += qcom_pcie_dump_reg_table(pcie->mhi, qcom_pcie_mhi_dump_regs,
+					ARRAY_SIZE(qcom_pcie_mhi_dump_regs),
+					buf + len, buf_size - len);
+
+	return len;
+}
+
+/*
+ * qcom_pcie_dump_regs - capture a PCIe register dump on Link Down.
+ *
+ * Print the dump directly to dmesg via dev_err() so it is immediately visible
+ * for root-causing the failure.
+ */
+static void qcom_pcie_dump_regs(struct qcom_pcie *pcie)
+{
+	struct device *dev = pcie->pci->dev;
+	char *buf, *line, *pos;
+
+	buf = kmalloc(QCOM_PCIE_DUMP_BUF_SIZE, GFP_KERNEL);
+	if (!buf)
+		return;
+
+	qcom_pcie_fill_dump_buf(pcie, buf, QCOM_PCIE_DUMP_BUF_SIZE);
+
+	/*
+	 * printk() truncates messages longer than LOG_LINE_MAX, so print the
+	 * dump one line at a time instead of as a single dev_err() call.
+	 */
+	dev_err(dev, "PCIe Link Down register dump:\n");
+	pos = buf;
+	while ((line = strsep(&pos, "\n")))
+		dev_err(dev, "%s\n", line);
+
+	kfree(buf);
+}
+
+static int qcom_pcie_regdump_show(struct seq_file *s, void *data)
+{
+	struct qcom_pcie *pcie = (struct qcom_pcie *)dev_get_drvdata(s->private);
+	char *buf;
+	size_t len;
+
+	buf = kmalloc(QCOM_PCIE_DUMP_BUF_SIZE, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	len = qcom_pcie_fill_dump_buf(pcie, buf, QCOM_PCIE_DUMP_BUF_SIZE);
+	seq_write(s, buf, len);
+
+	kfree(buf);
+
+	return 0;
+}
+
 /*
  * Qcom PCIe controllers only support one Root Port per controller instance. So
  * this function ignores the 'pci_dev' associated with the Root Port and just
@@ -1962,8 +2273,11 @@ static void qcom_pcie_init_debugfs(struct qcom_pcie *pcie)
 		return;
 
 	pcie->debugfs = debugfs_create_dir(name, NULL);
-	debugfs_create_devm_seqfile(dev, "link_transition_count", pcie->debugfs,
-				    qcom_pcie_link_transition_count);
+	if (pcie->mhi)
+		debugfs_create_devm_seqfile(dev, "link_transition_count", pcie->debugfs,
+					    qcom_pcie_link_transition_count);
+	debugfs_create_devm_seqfile(dev, "regdump", pcie->debugfs,
+				    qcom_pcie_regdump_show);
 }
 
 static irqreturn_t qcom_pcie_global_irq_thread(int irq, void *data)
@@ -1983,6 +2297,8 @@ static irqreturn_t qcom_pcie_global_irq_thread(int irq, void *data)
 		qcom_pcie_enable_outbound_blocker(pcie);
 		mutex_unlock(&pcie->reset_lock);
 
+		qcom_pcie_dump_regs(pcie);
+
 		for_each_pci_bridge(port, pp->bridge->bus) {
 			if (pci_pcie_type(port) == PCI_EXP_TYPE_ROOT_PORT)
 				pci_host_handle_link_down(port);
@@ -2430,8 +2746,7 @@ static int qcom_pcie_probe(struct platform_device *pdev)
 
 	qcom_pcie_icc_opp_update(pcie);
 
-	if (pcie->mhi)
-		qcom_pcie_init_debugfs(pcie);
+	qcom_pcie_init_debugfs(pcie);
 
 	return 0;
 
diff --git a/include/uapi/linux/pci_regs.h b/include/uapi/linux/pci_regs.h
index facaa324bd86..0e82d89e747a 100644
--- a/include/uapi/linux/pci_regs.h
+++ b/include/uapi/linux/pci_regs.h
@@ -1176,12 +1176,14 @@
 #define PCI_SECPCI_LE_CTRL	0x0c /* Lane Equalization Control Register */
 
 /* Physical Layer 16.0 GT/s */
+#define PCI_PL_16GT_STATUS	0x0c	/* 16.0 GT/s Status Register */
 #define PCI_PL_16GT_LE_CTRL	0x20	/* Lane Equalization Control Register */
 #define  PCI_PL_16GT_LE_CTRL_DSP_TX_PRESET_MASK		0x0000000F
 #define  PCI_PL_16GT_LE_CTRL_USP_TX_PRESET_MASK		0x000000F0
 #define  PCI_PL_16GT_LE_CTRL_USP_TX_PRESET_SHIFT	4
 
 /* Physical Layer 32.0 GT/s */
+#define PCI_PL_32GT_STATUS	0x0c	/* 32.0 GT/s Status Register */
 #define PCI_PL_32GT_LE_CTRL	0x20	/* Lane Equalization Control Register */
 
 /* Physical Layer 64.0 GT/s */

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20260811-regdump-11719f75de0c

Best regards,
--  
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

