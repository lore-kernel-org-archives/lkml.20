Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33BA8497B8E
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 19:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791141004; cv=none; b=J6vI9jL9VBxIk/u0hNcwA72D8S9i5865ePPUuUjwQ0jG68fupxVkEHyHFInH+3YA4aHZQz0JxjQYPlNDQeL5y09KrKFfXAPvC4ZcggboHaIyOw4bnBaubaxhBQuL5M1RQAKS5Z1dGpmpp/NLLHkYQreS5JbDnySyCAwShGDMubE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791141004; c=relaxed/simple;
	bh=zfZfSik9Ra5uEGcIR+g+Z3ZffQov6U8Tjt4q6GJkSnY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nmoG8aEZEC76PesaaF71/7IfFaN32ItNyvFTjjFjr8j10WFVwE/aY3UN66z6hF9W7znr60ldIF2DxEQH+qK0rAg0doGwbzhDG9vHEnErPSi9rluC64vsBgGX7Q7IiPSJRgoFijtR8r+qTS/ksqLo7VUZ4gA88Phe0iekmv6NvkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BTOtQhd1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MJe+gYI3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BTOtQhd1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MJe+gYI3"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 694IHdQM4168118
	for <linux-kernel@vger.kernel.org>; Sun, 4 Oct 2026 19:09:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TmUbRGYzpS2MoSOB4G/bTI7qaTMTElcYjfvwTy1sbpA=; b=BTOtQhd1tP/9g9fm
	XXuqQBM0TO28ce2BcjaGSUwdxvJJDDdNC0dEszh2C92FwOqf0jB+IGS6xNuMZrpo
	uFdaoHVPxUIN+KuiSADB49DYtOtSuX0nVnXwYhmPv2vnWhCEcz9dbNt1l7G03waA
	ISZqanZ62JiHwGN6u/aDyUCLczOCD4mtlCDpds44r5jnG+pwCy8zS5JpqTL60mLL
	16bkitbR5VjuxqxgAGBWwv533Zwp724NT3Bw2Xg7WH2uPGdFiaYkN76A4P6oPhK+
	E36mNOPYdbTzkHnmjLFFQ5i+HiUAiPF8ns2jVhp8rCzrkM4rnZryUV6yw51UMpT0
	qdo0KQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2spa3mnn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 19:09:58 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93caa0ce0cdso116334585a.2
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 12:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791140998; x=1791745798; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TmUbRGYzpS2MoSOB4G/bTI7qaTMTElcYjfvwTy1sbpA=;
        b=MJe+gYI30Y1ipPsbPQ+FzJqLye2k7bf9JOAWRf6d7iLwbnlhpwTXi11VtCGurdVY4G
         XhxGLxlMpMKGGqMRNjKCLmIQIuchau4oo3ka+SqVKZ7mG9Z+eOCAGCz4pbtkW1YJuSot
         Be12sB6Pn69JPGmXAhuXWsGetktzYB8bC9zEqKcF4QS1GouScCma1ppIoStn/iW3xDqD
         I9RscI8VfSDN3dz7gh+H9nNcvF86/EiRnS5h9oftX3dj8hyW2tJ/wFlhPMGFbKOFJZYl
         jUvP7Bzkji79WIzzFpP2p5OOu44YTCH6rBS5b9eyJvFXf5xg76AelOEPNEtBXlhdCKOb
         jsVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791140998; x=1791745798;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TmUbRGYzpS2MoSOB4G/bTI7qaTMTElcYjfvwTy1sbpA=;
        b=SgjuAg81JtHj1qOkh0UiNkTw/0AAmqIj77nWVeBvmGS6j55uGklrWIB6xI39zijWuU
         sIfnmOTGivPMGQopuCyIaBFnXJ9pE8xUZqw2hA0ZZFHaNyQfvFa19UDRnyUMFnWd3RrI
         xkngMYEv6cn0YpCz5vXd0EwQdFzHltF+QIO1mGd0+26bePMra5e7VQhCuM9VPcAN/fT2
         zhrD1hPddpjQKTuB7JcHo2slFYtzVOWk4oqki0mswJbMsiywb6Mr3FTvtI/2o43D6qs+
         HqAO0nww4gcqFtsWYF9jlnkvgNPp0iMeE3oBebM1JK6ezP8P61OCqYSKSqArRM+wXlAg
         QK9w==
X-Forwarded-Encrypted: i=1; AKwUvBwyXKuDIyC0RvrjOZgxFngi4nP7iuRL1eCcVUvY7uY8Yi2qD7PiM3xsO9G14jMVsZvl/VKDjrBT5nHrFzo=@vger.kernel.org
X-Gm-Message-State: AFuF++lODtufTC5McePXeGjM46n8AZkh5CdFgggAmZx/kHfKbp3HkJ82
	eDp7kc5vC/0DT0oa6t7EPSZ978hWuLALaHfr+tAnaYLUMMLk+lG6I9H5aKanbj5fWVgc071laYh
	kq2g34+/gw9SyLB/idysRgtrGZi/PYgwDGMxJV7zQGD/zKCdz0mwHzblIAgHUMoX9DeM=
X-Gm-Gg: AYBFou3FoX7J150KsiHgTKqmRlbdInCVS7uGcaha7UwYBOI7YR7vab0HO1kilBzqK9Y
	zVUPjw3DF/4yOVLVs21zrthShwHqAavJ8PA6bhOZZWE1653yCGJ8moEDVm8ucYiRKbZKxh37//9
	VmVKXUDnBoko7A/AmVc3/tgHfd+zOKkEuJ/O30MFCY4BrOGSU8DUv1HbyT8fRwFHy4RACpJAL7e
	rbYUoN9h6Z3SrHAINOBsOVaCVLCHxlOSXKA7iPc8EvawMnHqQj5qBZFXjUCOKtpkMe2IHazB6of
	GUe8uzJiHA3LOyQB7FMJjxo7+IcRzfvx5/6oGP5l+RuIYgym7S70pFiXtuSwyCmt7Kk4PKlYWbf
	twtkpKAHxAe9F30PDpDYzz2IizXZPfHGznijoeeeoHymBd400SEyWVq9irrkHvIqTUepyBFVeK8
	xwyvm/9RH1+3AGgOJ/jYdJzmmI58/XcSQMeT7dBP9hEZMrU31oXQ==
X-Received: by 2002:a05:620a:f01:b0:93c:c2f4:9182 with SMTP id af79cd13be357-93e50fd5c4cmr953281985a.20.1791140997639;
        Sun, 04 Oct 2026 12:09:57 -0700 (PDT)
X-Received: by 2002:a05:620a:f01:b0:93c:c2f4:9182 with SMTP id af79cd13be357-93e50fd5c4cmr953278785a.20.1791140997157;
        Sun, 04 Oct 2026 12:09:57 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([37.169.59.74])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0394ca0f0sm176318385e9.1.2026.10.04.12.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 12:09:55 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Sun, 04 Oct 2026 21:09:47 +0200
Subject: [PATCH 1/5] i2c: qcom-cci: Factor out write command queue
 programming
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261004-cci-imp-v1-1-227d12cb4829@oss.qualcomm.com>
References: <20261004-cci-imp-v1-0-227d12cb4829@oss.qualcomm.com>
In-Reply-To: <20261004-cci-imp-v1-0-227d12cb4829@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA0MDA3NiBTYWx0ZWRfX+hIz8pamtOoD
 MhsgXeBRtguNkew+1xkjxquCl+rfAJo+xlDfmX7GfHDGPgh9gs3ckpTI/LhEgxGV7AoGq47AmKK
 KNC9YiIWM8vg7gaBbzviaAB8M8Ncykm0RPJ1DJ9SzkQjuFLKZQ880/UGlR1cdUjysab4uSnM4Wm
 a1ffwkBorefnAOR1/XDaFh8F+VRIC7rA+OQ6jFr+Mf+S+7Rz9pDPKySAIBl+HvmCoHTIEBy4fhH
 xeySbwu6E3zkuAOsw3YCkXzl6T9tdh6zrXwRbDMuMMo1rRK44roBdz3mYdSymhXrmZDna7kyr2P
 Inbq4ficmGTjmR1RF3Mxj2XAStAzgunwaR9c5//vN5XyMobrHcULEBDJ3627kiQYwN9aZByT77a
 YZBGkDB/scfELK/2BMkuDiUQTM8m7HLXvzIIYLYVauREO1mlN+FXt2wyfvG6yIon4E07fHcGls5
 r2+1T0L2US3pKAWkZpw==
X-Authority-Analysis: v=2.4 cv=b7MncdGx c=1 sm=1 tr=0 ts=6ac2a486 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=1Gfya9YG+27Uq/30OuQ23A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=S5OCs8wk23pqgH2W7UgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 0vukCV-eOalfSTDs6IANLRaY3ScbeV1c
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA0MDA3NiBTYWx0ZWRfX1r0jqCHTR3Eh
 YRo7AURH8PjIf+6xbGp9mBXfB2VhgVawURewE7mv7EaMYt/J9Zl2ffInNivKpOn0ERMssyksWBw
 lMX9JB8uhwcYisO1gWqG8fg9GxfkPMc=
X-Proofpoint-GUID: 0vukCV-eOalfSTDs6IANLRaY3ScbeV1c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-04_05,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610040076

Factor out write-command queueing into a dedicated helper and replace
the manual byte-to-word packing code with iowrite32_rep().
 
The resulting code is easier to follow and will be reused by
upcoming burst-write support.

Also add a sanity check on the write buffer length, which should
already be validated by the caller/I2C-core.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-cci.c | 41 +++++++++++++++++++++------------------
 1 file changed, 22 insertions(+), 19 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
index 526a699eee147996b2756b47c0e6982678990be0..c4bb97868c54de636be756328ca7ee4e46e6b400 100644
--- a/drivers/i2c/busses/i2c-qcom-cci.c
+++ b/drivers/i2c/busses/i2c-qcom-cci.c
@@ -77,6 +77,9 @@
 #define CCI_I2C_WRITE		9
 #define CCI_I2C_READ		10
 
+#define CCI_I2C_WRITE_WC	3
+#define CCI_I2C_WRITE_NWORDS(len) DIV_ROUND_UP((len) + 1, sizeof(u32))
+
 #define CCI_I2C_REPORT_IRQ_EN	BIT(8)
 
 enum {
@@ -485,42 +488,42 @@ static int cci_i2c_read(struct cci *cci, u16 master,
 	return 0;
 }
 
+static void cci_i2c_load_write(u8 *buf, u16 len, void __iomem *loadq)
+{
+	u32 cmd[CCI_I2C_WRITE_WC] = { };
+
+	if (WARN_ON(len >= CCI_I2C_WRITE_WC * sizeof(u32)))
+		return;
+
+	cmd[0] = CCI_I2C_WRITE | len << 4;
+	memcpy((u8 *)cmd + 1, buf, len);
+	iowrite32_rep(loadq, cmd, CCI_I2C_WRITE_NWORDS(len));
+}
+
 static int cci_i2c_write(struct cci *cci, u16 master,
 			 u16 addr, u8 *buf, u16 len)
 {
-	u8 queue = QUEUE_0;
-	u8 load[12] = { 0 };
-	int i = 0, j, ret;
+	void __iomem *loadq = cci->base + CCI_I2C_Mm_Qn_LOAD_DATA(master, QUEUE_0);
+	int ret;
 	u32 val;
 
 	/*
 	 * Call validate queue to make sure queue is empty before starting.
 	 * This is to avoid overflow / underflow of queue.
 	 */
-	ret = cci_validate_queue(cci, master, queue);
+	ret = cci_validate_queue(cci, master, QUEUE_0);
 	if (ret < 0)
 		return ret;
 
 	val = CCI_I2C_SET_PARAM | (addr & 0x7f) << 4;
-	writel(val, cci->base + CCI_I2C_Mm_Qn_LOAD_DATA(master, queue));
+	writel(val, loadq);
 
-	load[i++] = CCI_I2C_WRITE | len << 4;
-
-	for (j = 0; j < len; j++)
-		load[i++] = buf[j];
-
-	for (j = 0; j < i; j += 4) {
-		val = load[j];
-		val |= load[j + 1] << 8;
-		val |= load[j + 2] << 16;
-		val |= load[j + 3] << 24;
-		writel(val, cci->base + CCI_I2C_Mm_Qn_LOAD_DATA(master, queue));
-	}
+	cci_i2c_load_write(buf, len, loadq);
 
 	val = CCI_I2C_REPORT | CCI_I2C_REPORT_IRQ_EN;
-	writel(val, cci->base + CCI_I2C_Mm_Qn_LOAD_DATA(master, queue));
+	writel(val, loadq);
 
-	return cci_run_queue(cci, master, queue);
+	return cci_run_queue(cci, master, QUEUE_0);
 }
 
 static int cci_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)

-- 
2.34.1

