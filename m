Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794232995;
	b=sAXN2arQ2dEmJTfkQ6tCBWnhQLnPZT0AHXKCSRz2IerLkj5JcGsyo+pzl0IpkLs1IxCa
	 e15VloHiNrRucZc07celJ44DPO9lHruRGyNOhyV9Sl4Gj9D1NLjExtuzF2gN7Hjsh0c3C
	 0R6l4RXrxUZLnooUgMfUz9qF3Z2V8FgXMPli98yr6AYNqGBra+PPHcnvtgQVilxtb8P2h
	 BtAbqV9f+8mZFxq8LI3EUFZVpl5iRlXT2s4UEe2+70ZLj1bJnUXJWlbmT9ZYxYl7Cz2ZG
	 njtIMJgz3Ns1IZK25uyON/7XE80Rf62nD8HU6wdD8c75iWNtOXldQC4Gjn+hmD3qYgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794232995;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=7RH+Tx78gydZgnX6w3uFzW45HdpF35BqgK0E/WByubQ=;
	b=sAlq3lYgF9qWJakILrXe+RUPAYbB9NB6uN9BC5khkp8NxHxmRcc4i0A4PIsP5kW5UdVu
	 psTP9ASThiq880p3LTJOIXoQYHM/QZFmcL+owNwPV9UF8RkvNRuBWcgcWQLi3LnlcROMU
	 tqUkBCphqm5RzaflfGWNHwYWeVOjKrPJJC+y7soLADhKWN4GYVbvlRiZOr4wgKBIKcNhq
	 HkDLyDGqRBX72daXMLZdrmwtZ+3TtFPhGjvVhdCk23q71fkSQt/5ELlaq6mOQvRxPFME0
	 goGDrCB+ZdGv3nCX+risXXSwnYceAILnbZ5evtJyKe3JrWELJSqoAlJpzsaukZ4spBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HqDlYJkC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UbXC60nV;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC6CE606D815
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 14:03:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC6CE606D815
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HqDlYJkC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UbXC60nV
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DFE1v4025863
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 14:03:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7RH+Tx78gydZgnX6w3uFzW45HdpF35BqgK0E/WByubQ=; b=HqDlYJkCOr/kG6f8
	bH2eOpS9eNEiL0TTYMOyyt536QJopmwlq7C+KI1/UfEPrgGG8G3W/9Cz4kFZYCU6
	uKoyHgOLk5BQYt1K8v2t/I7eseTJiCwHURGik7dZep/tXaLlhIQsfbYTrVUdbopQ
	TRIk7Cpbh+s+H4oIwvkqX+tWSUwl2OUSNkJhPrxufHdO8dbbRPrSmwhVUvwRs4eK
	ojtDw0VpZDLPRXqfIh92KVmxyoPLPBhu+4p0PFcoVAaYPLirAG6fe7Nns+jYCNlR
	A5JZJ5dDQAy9n3ZEeWjTw4F5FMOyd7fFgz2VTOatjszjRq25HvVgHTsaJu3WiMcC
	9bABJg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hua5898r1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 14:03:13 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5ead18311ebso214244e0c.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 06:03:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794232993; x=1794837793; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7RH+Tx78gydZgnX6w3uFzW45HdpF35BqgK0E/WByubQ=;
        b=UbXC60nVIgAuRVy0WcDwRq27zKPFtS9uLIwvlIXhG0Aw8e5T+odlZ8ffV4vJv0tFOr
         +fAVVH8mIJxciTAcKLEQ2VUSzfc85o+kgI5HYeIWGLdBiHD9TR7CsOAdVLsGZNUjFCvI
         ufVo1bosNOdHtEeOvTAyXp18jnb37kQZiqD2OMQGxcBqOcWG2S9ss3rw57/yNKEgcboe
         C2k/sutDdr1QTx9BTLN6bjudMKkJ5TR+UKd7A6Rxkn/63dqvrZ/j+y8Z1im6InIyCaQo
         0cYhoqAWspblZU9GBg8qgmopJbQf6mLlI/gnjOs5M/rglSg/rOGeEV97+jngrJ7Kw+Ru
         AnkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794232993; x=1794837793;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7RH+Tx78gydZgnX6w3uFzW45HdpF35BqgK0E/WByubQ=;
        b=C6BbaHqhvIf2wDP5kqoeYTGKLNjx1xX2CJHjjRZt0i3J7X73jtZcwaMkfmZQ9y2ULo
         Y3nz+GnrJfOkc/CdcyzJAI3bqXPMI7vKNLy9Fbjecufosn7FVg1KWwKpdi4XlVdzeJxf
         GHmq+V7AbrH4ua7euNdhjnmM0m5TwHzbexIszHJmNDHI5l0VXPy789wt9Fduaf/RWGx0
         xe6+CJgMb7yZf9Xl7KbZsghkg2wrx8nL66yFqBjNpxhNtJOkbkt7MkITG1ArJU6mYmQY
         LhApDAMWehxvrZlwpBnrF7khBSSMYBuLDMwZU4s++Xma/oVhXwsfW8w2iyXqIWohphxm
         pgow==
X-Forwarded-Encrypted: i=1; AL+hErEJ8VXwzSpg//k5zFEEaKRnogzqsWncK2+LkEvBVApCme9hGUklyno/VmGAoOtZApmSlTFlq6ZbD8Pra9A=@vger.kernel.org
X-Gm-Message-State: APuU4Z9XbwVmImlpQ4ZtTnvDRpnperFUfwehx6LqmfbInepIbxbAcGeL
	WfsGVhDOA2Us3XRY6kEKciQFS0yv+/fSTWG42bvhU2aGWKsU3VQG4R7u4Z04bgB4hQHTB3edjxq
	JTQ4TqEVepE9RtfzyGF+OXnInvPW9u6LIgV5lNmb8yxu/SuZsxh8yYuge1a884AmtOf+LvuGfGs
	vrwQ==
X-Gm-Gg: AYBFou18UfvJV6MLfqYbGcRZNqGsg8echE5JBvftSc49YV1c58yZP7gWv2cPi1WKPIg
	x/k423T+FSiCTyf9G0dsQ4iUD0U8thtQPDawLhDcnaUlxLPBAHgLHrrDgJd20t8xU4mG96JtUxB
	UFpmpsYJ0RGCocIP30ahLJP4gsJ26AT1CymiJ8jcSMpcLXG2IHl4wlbBGrhPi/f0GVI0Gs9eBh9
	eKVb8pnH5k+4SDTblE+fQ7AxqsN/bM1tvneDgLNKSioqWgiWe4QJSedN2bR6fKb6N8XgiEjLKdA
	QqhSrKPFfUe1QVyTLHOtogpuYS3vXGgc+HmKgfnw8OYQj4HrU9Yi19g7u883MUYkkQIBBLq0yEr
	B/C+piha14c0hoGRGPnyjqzeg+E0S/BUEeNvzSOGIEd3shzhGX493+91s3sJyTqSjCx/8/+KipM
	SdY46N5GaNf7tyMbyaSXMrCIp6fiF/p3FkTX0222AL18gKbXu9qJhlgt01ypTB+U4aqhqMGHh4p
	Bs4e1mbDb9SIGJjbTvUVygMWrjJ
X-Received: by 2002:a05:6122:32d3:b0:5c9:a60b:e5d8 with SMTP id 71dfb90a1353d-5ece73590cbmr1407571e0c.18.1794232992582;
        Mon, 09 Nov 2026 06:03:12 -0800 (PST)
X-Received: by 2002:a05:6122:32d3:b0:5c9:a60b:e5d8 with SMTP id 71dfb90a1353d-5ece73590cbmr1407486e0c.18.1794232991474;
        Mon, 09 Nov 2026 06:03:11 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:f9b5:154f:6aa3:35d3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b79502652csm161515845e9.4.2026.11.09.06.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 06:03:10 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 09 Nov 2026 15:01:59 +0100
Subject: [PATCH v4 6/7] i2c: qcom-cci: Add burst read support
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
Message-Id: <20261109-cci-imp-v4-6-4dc4095dd052@oss.qualcomm.com>
References: <20261109-cci-imp-v4-0-4dc4095dd052@oss.qualcomm.com>
In-Reply-To: <20261109-cci-imp-v4-0-4dc4095dd052@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1NSBTYWx0ZWRfX1N5j9VbxnZ0R
 zYrsOchAxzCeCmwQ2XMO5vpmfRrAvb1IbXctGyvytYQWl2EL0sJlv1aNrz6+dOtk4Epw6FasV6s
 62dofraqK02i7poJpy9Y82ZvUs+GFUqDi/Pvd/vBnf4g+EQsdr8KkFH8JdWd5OCMtzXCR1bbK6O
 XtVxqC8Hd9zfiB3Y9+BBnxyKOX8F/HpOMjCne2+9eL24bc+BWcPuePomcZ8ZgW1fQBM0szMEi7w
 3NbJRsL/0g2lQ6lxNtCUU+xi4Pz1+AWcmoWYOeSB0DRSJLVwKUDZYDeXSrJyxzxjo5c/Zh7OWNv
 HXNXS7sWFUSfFM6J3G0zzDVQNfbbQUbqs0V3SvQxKah5OI9A4vAf8sN9FZxHzV5S2sbF9JkNm/a
 g9noSGxJmRs1YTEB4Kll5GeaBklsI9ABnkCEc+izeZrhpWgVrBq51iExTieoYnG83oYvTuIBn4N
 yPHHMWpBlArKYmK2x6g==
X-Proofpoint-ORIG-GUID: uItVN85RqsyYurF2dO8KYCIENU-HbKOp
X-Proofpoint-GUID: uItVN85RqsyYurF2dO8KYCIENU-HbKOp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1NSBTYWx0ZWRfX6TLCpS6KnElp
 s2dNNBvGWDoNSOUp+80HLfT0ssQwXwp+yhv2plqEmJBhmvfl6TnFB5xzso7H/9YlAgETgUfSnN4
 lYnuviicbTp9ZYFRMWgwntkCW28Wt0c=
X-Authority-Analysis: v=2.4 cv=C9V8WgP+ c=1 sm=1 tr=0 ts=6af1d2a1 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=6lEk5nnyXwZhtSSSMCoA:9 a=0YZ0O0O0cT6BRUpX:21 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090055

CCI_I2C_READ transfers are currently limited by max_read_len to the
amount of data that fits in the read FIFO, as the driver only drains
the FIFO once after receiving RD_DONE. On current hardware this limits
reads to at most 254 bytes.

CCI v1.7 and later support reads larger than the FIFO depth by
generating RD_THRESHOLD interrupts as the FIFO fills, allowing software
to drain data while the transfer is still in progress. When the FIFO
becomes full, the hardware can also apply backpressure by stretching
SCL and reports this condition through RD_PAUSE_IRQ.

Program CCI_I2C_Mm_RD_THRESHOLD to half the FIFO depth on hardware that
supports RD_THRESHOLD and update the read path to drain the FIFO on
each threshold interrupt until the final RD_DONE event is received.

Older hardware revisions do not support RD_THRESHOLD, keep their read
size limited to the FIFO depth and continue relying solely on RD_DONE
for completion.

Also emit a warning when RD_PAUSE_IRQ is observed, as FIFO backpressure
is unexpected under normal conditions and may indicate that software is
not draining the FIFO quickly enough.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-cci.c | 206 +++++++++++++++++++++++++++++++++-----
 1 file changed, 183 insertions(+), 23 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
index 2e10e9775cffe57f291c48176ceda4ec14411db3..7452ee8eab0635bf6562f4dbfb2342263211cbb8 100644
--- a/drivers/i2c/busses/i2c-qcom-cci.c
+++ b/drivers/i2c/busses/i2c-qcom-cci.c
@@ -13,6 +13,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/pm_opp.h>
+#include <linux/spinlock.h>
 
 #define CCI_HW_VERSION				0x0
 #define CCI_HW_VERSION_MAJOR_MASK		GENMASK(31, 28)
@@ -37,6 +38,7 @@
 
 #define CCI_I2C_Mm_READ_DATA(m)			(0x118 + 0x100 * (m))
 #define CCI_I2C_Mm_READ_BUF_LEVEL(m)		(0x11c + 0x100 * (m))
+#define CCI_I2C_Mm_RD_THRESHOLD(m)		(0x120 + 0x100 * (m))
 #define CCI_I2C_Mm_Qn_EXEC_WORD_CNT(m, n)	(0x300 + 0x200 * (m) + 0x100 * (n))
 #define CCI_I2C_Mm_Qn_CUR_WORD_CNT(m, n)	(0x304 + 0x200 * (m) + 0x100 * (n))
 #define CCI_I2C_Mm_Qn_CUR_CMD(m, n)		(0x308 + 0x200 * (m) + 0x100 * (n))
@@ -59,6 +61,7 @@
 #define CCI_IRQ_CLEAR_0				0xc08
 #define CCI_IRQ_STATUS_0			0xc0c
 #define CCI_IRQ_STATUS_0_I2C_M0_RD_DONE		BIT(0)
+#define CCI_IRQ_STATUS_0_I2C_M0_RD_UNDERFLOW	BIT(1)
 #define CCI_IRQ_STATUS_0_I2C_M0_Q0_REPORT	BIT(4)
 #define CCI_IRQ_STATUS_0_I2C_M0_Q0_UNDERFLOW	BIT(5)
 #define CCI_IRQ_STATUS_0_I2C_M0_Q0_OVERFLOW	BIT(6)
@@ -66,6 +69,7 @@
 #define CCI_IRQ_STATUS_0_I2C_M0_Q1_UNDERFLOW	BIT(9)
 #define CCI_IRQ_STATUS_0_I2C_M0_Q1_OVERFLOW	BIT(10)
 #define CCI_IRQ_STATUS_0_I2C_M1_RD_DONE		BIT(12)
+#define CCI_IRQ_STATUS_0_I2C_M1_RD_UNDERFLOW	BIT(13)
 #define CCI_IRQ_STATUS_0_I2C_M1_Q0_REPORT	BIT(16)
 #define CCI_IRQ_STATUS_0_I2C_M1_Q0_UNDERFLOW	BIT(17)
 #define CCI_IRQ_STATUS_0_I2C_M1_Q0_OVERFLOW	BIT(18)
@@ -82,6 +86,18 @@
 #define CCI_IRQ_STATUS_0_I2C_M0_ERROR		0x18000ee6
 #define CCI_IRQ_STATUS_0_I2C_M1_ERROR		0x60ee6000
 
+#define CCI_IRQ_MASK_1				0xc10
+#define CCI_IRQ_MASK_1_I2C_M0_RD_THRESHOLD	BIT(16)
+#define CCI_IRQ_MASK_1_I2C_M0_RD_PAUSE		BIT(17)
+#define CCI_IRQ_MASK_1_I2C_M1_RD_THRESHOLD	BIT(20)
+#define CCI_IRQ_MASK_1_I2C_M1_RD_PAUSE		BIT(21)
+#define CCI_IRQ_CLEAR_1				0xc14
+#define CCI_IRQ_STATUS_1			0xc18
+#define CCI_IRQ_STATUS_1_I2C_M0_RD_THRESHOLD	BIT(16)
+#define CCI_IRQ_STATUS_1_I2C_M0_RD_PAUSE	BIT(17)
+#define CCI_IRQ_STATUS_1_I2C_M1_RD_THRESHOLD	BIT(20)
+#define CCI_IRQ_STATUS_1_I2C_M1_RD_PAUSE	BIT(21)
+
 #define CCI_TIMEOUT	(msecs_to_jiffies(100))
 #define NUM_MASTERS	2
 #define NUM_QUEUES	2
@@ -109,6 +125,9 @@
 /* The first and last bytes are reserved - not payload */
 #define CCI_I2C_READ_MAX_LEN(fsize) ((fsize) - 2)
 
+/* Unlimited read via threshold-irq support */
+#define CCI_I2C_READ_BURST_NOLIMIT 0
+
 enum {
 	I2C_MODE_STANDARD,
 	I2C_MODE_FAST,
@@ -146,6 +165,7 @@ struct cci_master {
 	u16 master;
 	u8 mode;
 	int status;
+	bool rd_done;
 	struct completion irq_complete;
 	struct cci *cci;
 };
@@ -169,16 +189,52 @@ struct cci {
 	int nclocks;
 	struct clk *cci_clk;
 	struct cci_master master[NUM_MASTERS];
+	/* Protects read-modify-write access to CCI_IRQ_MASK_1 */
+	spinlock_t threshold_lock;
 };
 
+static bool cci_has_threshold_irq(const struct cci *cci)
+{
+	return cci->data->quirks.max_read_len == CCI_I2C_READ_BURST_NOLIMIT;
+}
+
+static void cci_set_rd_threshold_irq(struct cci *cci, u16 master, bool enable)
+{
+	u32 bits, val;
+
+	if (!cci_has_threshold_irq(cci))
+		return;
+
+	guard(spinlock_irqsave)(&cci->threshold_lock);
+
+	bits = master ? CCI_IRQ_MASK_1_I2C_M1_RD_THRESHOLD :
+			CCI_IRQ_MASK_1_I2C_M0_RD_THRESHOLD;
+
+	writel(bits, cci->base + CCI_IRQ_CLEAR_1);
+
+	val = readl(cci->base + CCI_IRQ_MASK_1);
+	if (enable)
+		val |= bits;
+	else
+		val &= ~bits;
+
+	writel(val, cci->base + CCI_IRQ_MASK_1);
+}
+
 static irqreturn_t cci_isr(int irq, void *dev)
 {
 	struct cci *cci = dev;
-	u32 val, reset = 0;
+	u32 val, val1 = 0, reset = 0;
 	int ret = IRQ_NONE;
 
 	val = readl(cci->base + CCI_IRQ_STATUS_0);
 	writel(val, cci->base + CCI_IRQ_CLEAR_0);
+
+	if (cci_has_threshold_irq(cci)) {
+		val1 = readl(cci->base + CCI_IRQ_STATUS_1);
+		writel(val1, cci->base + CCI_IRQ_CLEAR_1);
+	}
+
 	writel(0x1, cci->base + CCI_IRQ_GLOBAL_CLEAR_CMD);
 
 	if (val & CCI_IRQ_STATUS_0_RST_DONE_ACK) {
@@ -192,6 +248,7 @@ static irqreturn_t cci_isr(int irq, void *dev)
 			val & CCI_IRQ_STATUS_0_I2C_M0_Q0_REPORT ||
 			val & CCI_IRQ_STATUS_0_I2C_M0_Q1_REPORT) {
 		cci->master[0].status = 0;
+		cci->master[0].rd_done = val & CCI_IRQ_STATUS_0_I2C_M0_RD_DONE;
 		complete(&cci->master[0].irq_complete);
 		ret = IRQ_HANDLED;
 	}
@@ -200,10 +257,33 @@ static irqreturn_t cci_isr(int irq, void *dev)
 			val & CCI_IRQ_STATUS_0_I2C_M1_Q0_REPORT ||
 			val & CCI_IRQ_STATUS_0_I2C_M1_Q1_REPORT) {
 		cci->master[1].status = 0;
+		cci->master[1].rd_done = val & CCI_IRQ_STATUS_0_I2C_M1_RD_DONE;
+		complete(&cci->master[1].irq_complete);
+		ret = IRQ_HANDLED;
+	}
+
+	if (val1 & CCI_IRQ_STATUS_1_I2C_M0_RD_THRESHOLD) {
+		cci_set_rd_threshold_irq(cci, 0, false);
+		complete(&cci->master[0].irq_complete);
+		ret = IRQ_HANDLED;
+	}
+
+	if (val1 & CCI_IRQ_STATUS_1_I2C_M1_RD_THRESHOLD) {
+		cci_set_rd_threshold_irq(cci, 1, false);
 		complete(&cci->master[1].irq_complete);
 		ret = IRQ_HANDLED;
 	}
 
+	if (val1 & CCI_IRQ_STATUS_1_I2C_M0_RD_PAUSE) {
+		dev_warn_ratelimited(cci->dev, "master 0 read paused (fifo full)\n");
+		ret = IRQ_HANDLED;
+	}
+
+	if (val1 & CCI_IRQ_STATUS_1_I2C_M1_RD_PAUSE) {
+		dev_warn_ratelimited(cci->dev, "master 1 read paused (fifo full)\n");
+		ret = IRQ_HANDLED;
+	}
+
 	if (unlikely(val & CCI_IRQ_STATUS_0_I2C_M0_Q0Q1_HALT_ACK)) {
 		reset |= CCI_RESET_CMD_M0_MASK;
 		ret = IRQ_HANDLED;
@@ -232,6 +312,8 @@ static irqreturn_t cci_isr(int irq, void *dev)
 			dev_warn_ratelimited(cci->dev, "master 0 queue 1 overflow\n");
 		if (val & CCI_IRQ_STATUS_0_I2C_M0_Q1_UNDERFLOW)
 			dev_warn_ratelimited(cci->dev, "master 0 queue 1 underflow\n");
+		if (val & CCI_IRQ_STATUS_0_I2C_M0_RD_UNDERFLOW)
+			dev_warn_ratelimited(cci->dev, "master 0 FIFO read underflow\n");
 
 		writel(CCI_HALT_REQ_I2C_M0_Q0Q1, cci->base + CCI_HALT_REQ);
 		ret = IRQ_HANDLED;
@@ -252,6 +334,8 @@ static irqreturn_t cci_isr(int irq, void *dev)
 			dev_warn_ratelimited(cci->dev, "master 1 queue 1 overflow\n");
 		if (val & CCI_IRQ_STATUS_0_I2C_M1_Q1_UNDERFLOW)
 			dev_warn_ratelimited(cci->dev, "master 1 queue 1 underflow\n");
+		if (val & CCI_IRQ_STATUS_0_I2C_M1_RD_UNDERFLOW)
+			dev_warn_ratelimited(cci->dev, "master 1 FIFO read underflow\n");
 
 		writel(CCI_HALT_REQ_I2C_M1_Q0Q1, cci->base + CCI_HALT_REQ);
 		ret = IRQ_HANDLED;
@@ -386,6 +470,14 @@ static int cci_init(struct cci *cci)
 
 	writel(val, cci->base + CCI_IRQ_MASK_0);
 
+	val = 0;
+
+	if (cci_has_threshold_irq(cci))
+		val |= CCI_IRQ_MASK_1_I2C_M0_RD_PAUSE | CCI_IRQ_MASK_1_I2C_M1_RD_PAUSE;
+
+	if (val)
+		writel(val, cci->base + CCI_IRQ_MASK_1);
+
 	for (i = 0; i < cci->num_masters; i++) {
 		int mode = cci->master[i].mode;
 		const struct hw_params *hw;
@@ -414,6 +506,18 @@ static int cci_init(struct cci *cci)
 
 		val = CCI_I2C_MISC_CTL_SCL_STRETCH_EN | hw->trdhld << 4 | hw->tsp;
 		writel(val, cci->base + CCI_I2C_Mm_MISC_CTL(i));
+
+		if (cci_has_threshold_irq(cci)) {
+			/* Hardware supporting the RD_THRESHOLD interrupt provides a minimum FIFO
+			 * depth of 64 words, with the threshold reset to the full FIFO size by
+			 * default. Configure the threshold to half the FIFO depth to allow burst
+			 * reads while maintaining sufficient headroom to drain the FIFO before it
+			 * fills up.
+			 */
+			val = readl(cci->base + CCI_I2C_Mm_RD_THRESHOLD(i));
+			val = max_t(u32, val, 64);
+			writel(val / 2, cci->base + CCI_I2C_Mm_RD_THRESHOLD(i));
+		}
 	}
 
 	return 0;
@@ -476,12 +580,24 @@ static int cci_validate_queue(struct cci *cci, u8 master, u8 queue)
 	return cci_run_queue(cci, master, queue);
 }
 
+static void cci_clear_status(struct cci *cci, u16 master)
+{
+	cci->master[master].status = 0;
+	cci->master[master].rd_done = false;
+}
+
 static int cci_i2c_read(struct cci *cci, u16 master,
 			u16 addr, u8 *buf, u16 len)
 {
-	u32 val, words_read, words_exp;
+	u32 val, words_read, words_left;
 	u8 queue = QUEUE_1;
 	int i, index = 0, ret;
+	bool done;
+
+	/* The payload is prefixed by the slave ID echo byte */
+	words_left = len / 4 + 1;
+
+	cci_clear_status(cci, master);
 
 	/*
 	 * Call validate queue to make sure queue is empty before starting.
@@ -497,30 +613,72 @@ static int cci_i2c_read(struct cci *cci, u16 master,
 	val = CCI_I2C_READ | len << 4;
 	writel(val, cci->base + CCI_I2C_Mm_Qn_LOAD_DATA(master, queue));
 
-	ret = cci_run_queue(cci, master, queue);
-	if (ret < 0)
-		return ret;
+	val = readl(cci->base + CCI_I2C_Mm_Qn_CUR_WORD_CNT(master, queue));
+	writel(val, cci->base + CCI_I2C_Mm_Qn_EXEC_WORD_CNT(master, queue));
 
-	words_read = readl(cci->base + CCI_I2C_Mm_READ_BUF_LEVEL(master));
-	words_exp = len / 4 + 1;
-	if (words_read != words_exp) {
-		dev_err(cci->dev, "words read = %d, words expected = %d\n",
-			words_read, words_exp);
-		return -EIO;
-	}
+	reinit_completion(&cci->master[master].irq_complete);
+
+	cci_set_rd_threshold_irq(cci, master, true);
 
-	/* The first byte of the read is the slave ID echo, not payload */
-	val = readl_relaxed(cci->base + CCI_I2C_Mm_READ_DATA(master));
-	for (i = 1; i < 4 && index < len; i++)
-		buf[index++] = (val >> (i * 8)) & 0xff;
+	val = BIT(master * 2 + queue);
+	writel(val, cci->base + CCI_QUEUE_START);
+
+	/*
+	 * Hardware supporting RD_THRESHOLD can handle reads larger than the FIFO size.
+	 * The FIFO is drained each time an RD_THRESHOLD interrupt is received, until
+	 * the final RD_DONE interrupt completes the transfer.
+	 * On hardware lacking RD_THRESHOLD support, reads are limited to the FIFO
+	 * size and only one completion (RD_DONE interrupt) is expected.
+	 */
+	do {
+		if (!wait_for_completion_timeout(&cci->master[master].irq_complete,
+						 CCI_TIMEOUT)) {
+			dev_err(cci->dev, "master %d queue %d read timeout\n",
+				master, queue);
+			cci_reset(cci);
+			ret = -ETIMEDOUT;
+			goto out;
+		}
+
+		if (cci->master[master].status) {
+			ret = cci->master[master].status;
+			goto out;
+		}
+
+		/*
+		 * Sample RD_DONE before draining: once it is set the whole
+		 * transfer sits in the FIFO, so a single drain gets the rest.
+		 * Sampling it afterwards could miss words pushed by the
+		 * hardware while we were draining.
+		 */
+		done = cci->master[master].rd_done;
+
+		words_read = readl(cci->base + CCI_I2C_Mm_READ_BUF_LEVEL(master));
+		words_read = min(words_read, words_left);
+		words_left -= words_read;
+
+		while (words_read--) {
+			val = readl_relaxed(cci->base + CCI_I2C_Mm_READ_DATA(master));
+			/* The first byte of the read is the slave ID echo, not payload */
+			for (i = (index == 0) ? 1 : 0; i < 4 && index < len; i++)
+				buf[index++] = (val >> (i * 8)) & 0xff;
+		}
+
+		if (!done)
+			cci_set_rd_threshold_irq(cci, master, true);
+	} while (!done);
 
-	while (--words_read) {
-		val = readl_relaxed(cci->base + CCI_I2C_Mm_READ_DATA(master));
-		for (i = 0; i < 4 && index < len; i++)
-			buf[index++] = (val >> (i * 8)) & 0xff;
+	ret = 0;
+	if (index != len) {
+		dev_err(cci->dev, "bytes read = %d, bytes expected = %d\n",
+			index, len);
+		ret = -EIO;
 	}
 
-	return 0;
+out:
+	cci_set_rd_threshold_irq(cci, master, false);
+
+	return ret;
 }
 
 static void cci_i2c_load_write(void __iomem *loadq, u8 *buf, u16 len, bool burst)
@@ -758,7 +916,7 @@ static const struct cci_data cci_hw_catalog[] = {
 		.queue_size = { 128, 32 },
 		.quirks = {
 			.max_write_len = CCI_I2C_BURST_MAX_LEN(128),
-			.max_read_len = CCI_I2C_READ_MAX_LEN(256),
+			.max_read_len = CCI_I2C_READ_BURST_NOLIMIT,
 		},
 	},
 	{
@@ -767,7 +925,7 @@ static const struct cci_data cci_hw_catalog[] = {
 		.queue_size = { 1024, 32 },
 		.quirks = {
 			.max_write_len = CCI_I2C_BURST_MAX_LEN(1024),
-			.max_read_len = CCI_I2C_READ_MAX_LEN(256),
+			.max_read_len = CCI_I2C_READ_BURST_NOLIMIT,
 		},
 	},
 };
@@ -813,6 +971,8 @@ static int cci_probe(struct platform_device *pdev)
 	cci->dev = dev;
 	platform_set_drvdata(pdev, cci);
 
+	spin_lock_init(&cci->threshold_lock);
+
 	for_each_available_child_of_node_scoped(dev->of_node, child) {
 		struct cci_master *master;
 		u32 idx;

-- 
2.34.1

