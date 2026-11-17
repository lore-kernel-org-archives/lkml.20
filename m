Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794915898;
	b=ZX7eLgfQZv6rPyNPisXqW9svqkXtPhM0MeQmsa5SLkIOkNQMBpuOLRg151Rjp9qyYSSR
	 4LGAGE+c30UmlYCmUV7WxoJUr5fcIclYg5NQLlkJWza1rpHRMFJjDx9NeoftC5Y0YT8H5
	 Rp8MMO8aplhIn0o3cllpIdOLPt4GEOkls8Gd+mM5l5/J8x322l6nwwF9axtdU4z74N3Oj
	 3KzHgfHKyJAzD9h4H0PPr8inqtAF2s1XqN79UlaOLmPFiTWMGQGwZiSGioyCbAW/R0gsb
	 XvCTJ75CCh4NIy6n01bAAeqJ/pzI0W+W2zCbDl4ZMCGwLgjN5B5+3F+9bUuVJmsIpbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794915898;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Nbu8rQxMaMgMEPPSkppPthaf3CvTR3LtDewzs5lk7CM=;
	b=5M2JKxRXCPG9yVpnpwpMkT1jPFtXyxAArXv8prRYfcyGoCa6++VvqEAhyn3x1FbrIeaj
	 Q6M3jvdyKO4b2zHYcZynogwPc7O+Mwzx9bH3FxlGiNZ1dw8jY1IT2v6r1ExMgz8aI1Ods
	 8YYzunFuwWARIsQCU/HwDYiKaGjHYH/41IQo81eteb1cIoaS58b39t3rWOlFVkJ8klSSB
	 /GSzummd3GjPR+rqq1GxJFqMgqoAvWGBdmmJt7iNIt9r1P1Ug4vj4IYDeiH4klb4cMg/H
	 pGImPGt/CyVovgEuKXGjZmVvXFnn/8iI4pYQ+TLT6fMRCRJqBkDOAFNPiHj374jNe1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E8AjxNev;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Or6SNHNt;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5172606A89F
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:44:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5172606A89F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E8AjxNev;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Or6SNHNt
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH6LrTp3980793
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:44:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Nbu8rQxMaMgMEPPSkppPth
	af3CvTR3LtDewzs5lk7CM=; b=E8AjxNevxKGiR8+3lv2VKepeheN+iAlDGnMjZM
	pSEGYbLsAKJdyid94RryJyKFAbyG9fkILrv9C/NjDfN0krHwMzDurrtlxBwX0btL
	jxdofFhJjAAANj7AULLpiMjhcbeOmhDDUMdHVFILOizmxGcaSzR8VN7ZUC7+oc8d
	La8otQ+OtsiJ+zMPMrF3fPuAV4mE+gFBgDNMSm05ldPujWadNZ9YMqO7eWK25/mg
	NRUt+pbVzK8Kn+BQFNNz/GQ8Cc+3NxG2ecDXIRuDPV5IA90QVBcKyG0Ic18vaGrl
	zfT+fqBGXaVpu8jN8HtG7WmFsR0o1PLVqWnUT99S1Vz5iPYg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0hkd175h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:44:56 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b17b31c3beso4175301a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 03:44:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794915895; x=1795520695; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Nbu8rQxMaMgMEPPSkppPthaf3CvTR3LtDewzs5lk7CM=;
        b=Or6SNHNtHB5KVtmjVrsGg+kBqKQAl+UdTjbgL+VXfDRAiAzclHm0aDm4On8r5gBj0R
         KzAzF7BKr5lBbcCvDg8DCjFXsVSoMj8kMaIfh7CMjwZZ/2slKCwi143fH5ZSeJwKuNTc
         YR8rdsdiPshYUfBTCgKQ/1HgK9S0FiLWUjs9lf7cniGw0msb96l+CqqxeAnccuBLA34c
         wt9p39P/gWKL5PsJTpC3s+tTBXY+Z/gUkk0beYw9m4TCmp9uOy0zx7mWxknAJ5Q2TctO
         pucxsP/0jvscCTRh3GuE3objfdPKZh3rwTDJB7iyhiDWvDeu7C8eHUQsoGzVBtBU88eZ
         SYww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794915895; x=1795520695;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Nbu8rQxMaMgMEPPSkppPthaf3CvTR3LtDewzs5lk7CM=;
        b=hLeiuHJz7nOKIwmtUc8F6C6xtshPrzn/rAi2k0xHkrsVmpxa1kzXEvXhL6tfGr8xu7
         /9uSDgK3bOGBLl+AW4ruo5IIcnYhqANZgzh4ArNva0boAamsXPxDmRo+Hyl2Jfsa0Tb2
         Q63lLy3OEzz2SblC9PfY3vQ3jAvOui/fDR3q9AXiZdRHYPTJyL8e5L3mpgHgCvmdbOEu
         oFU3VUdYD7eYoe/0k98pBMNGUwqychr0IWvXqpgMyFO+E2l6SAbGNXO8z1WNDNl9PiQV
         Y7GxrMJHik/nRvJxgipaaKgffsTXiB2Wycy2sRep9zFABtECh92L9Ep6sUjcA/OwqfJD
         dNcQ==
X-Forwarded-Encrypted: i=1; AL+hErH5LOHb4QsUQHsjNUfjIiBXeKvlINJMIaQ9pXRO0+o9Cw2bCB5rcrWTuF/eGJo/lssk/8BSisYf8LWJNHs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8iaASkMOEBVgJkoH/CxDblHh1tBCkYFIp8f0pACJ0DBGpu7sQa
	vjiPLWV7HbP5KfUyiQkYQk3fVLoBrwOGXlMKtlo6I4tgA2n++FiZOFlJkm7dp7AB4qEoVFG2lG9
	7D/pYWP7g2V5N1OFOt7+KT940o15OicMTElU3CDJqTn2JdKVmFKai21Eyymk7GEo1fpM=
X-Gm-Gg: AZFdTZeIwHtolIneXjsaT11mWi2ZbSBHU2sE9qXMLA5W2oT49Svd54UFzZnyo3hnIrp
	fpL+zR6bBsUfX2HPWLZlT86BkG2kVQB1JJBOO2HgPTrJl1CE5wEJYvuDsrHHGbmS7HVMPV47OXK
	4VQPFScNiOFBh6Eq2yuktD0kzdjOtY6qSm5Tt2Oj38oT+t7TOWnkHAOwN4dbExDewVqXa88hlku
	ZaDDVAX9mpo0XKcE3BLOwJbEfT/lvLfouN+P0eiPVINeLtmLJ+gk+P2V0KWbCr4u+nJ8afV05Nb
	bOCFikTvYIORUESJ02c2+tPNEx5k56gVtQXBblD4YZ2tQ/6nK1iKLa9HRcGc7StuGcp0e2MieHp
	7zR7yeVfnk+EtPmufp3bHGN4xx38mW0YNab/Zb53/4KIyZ0nijgCOvlenOvySfs+NtoGubSwem9
	KpZPEl8kM=
X-Received: by 2002:a17:90b:2cc3:b0:3ac:8af9:4a73 with SMTP id 98e67ed59e1d1-3b1b0a0db9emr12314445a91.28.1794915895463;
        Tue, 17 Nov 2026 03:44:55 -0800 (PST)
X-Received: by 2002:a17:90b:2cc3:b0:3ac:8af9:4a73 with SMTP id 98e67ed59e1d1-3b1b0a0db9emr12314374a91.28.1794915893918;
        Tue, 17 Nov 2026 03:44:53 -0800 (PST)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1bfb607e7sm7915954a91.3.2026.11.17.03.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 03:44:53 -0800 (PST)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 17:13:57 +0530
Subject: [PATCH v2] media: iris: Fix out-of-bounds read in timestamp
 metadata fallback
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
Message-Id: <20261117-fix-oob-tss-v2-1-8bbf753a4ee0@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAPw9/GoC/1WNyw6CMBBFf4XM2iFM0WJc+R+GBX1JjVDtANEQ/
 t2CceFmkpN775kZ2EZvGU7ZDNFOnn3oE4hdBrpt+qtFbxKDKISkgkp0/oUhKByYsTIlVUaS0K6
 AtHhEm+LNdqm/zKO6WT2sirXReh5CfG/vJlp7P3P1Z54ICZ06SrfXjXLycA7M+XNs7jp0XZ4O1
 MuyfADbvGrTvwAAAA==
X-Change-ID: 20261013-fix-oob-tss-7d317d612cf0
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Birk Skyum <birk.skyum@pm.me>,
        Deepa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794915889; l=3032;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=I/GiyQmoZ483N/YWsU85jJMknyYU+leyDsAvu9qjAKU=;
 b=CdfZCYPqRbRh2RcrYm8twA7+SB3Md25+5j/7Oi6rznTX5pC+e34vFD8ON43mgBhW8uKuNPc6r
 NIcGubfpw6IBdEaRT5rc/H7P1+CA61AZvLONtvFc/XpEUr+uWqS2Sb6
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Authority-Analysis: v=2.4 cv=eqFKXYpX c=1 sm=1 tr=0 ts=6afc3e38 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=WY0cn2rLi3i19Q4nf74A:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA0NiBTYWx0ZWRfX6ODyOMg0+Kig
 LAeOExAmW0fbph8DXBrJBaIQ80ruEpZ1iBy0KphxYmbhQUP9BE4wFMajlBQBe4ouRspf76KgCu6
 mrbjKPf+6OHuADKe7BxyJkCUyVbWi1E=
X-Proofpoint-GUID: Nfgce1JzFxKQPRg2Srizm2KXgUyo_-Xn
X-Proofpoint-ORIG-GUID: Nfgce1JzFxKQPRg2Srizm2KXgUyo_-Xn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA0NiBTYWx0ZWRfX0tAe40A6iKib
 D/oBNtX06lTaJiJ/uUeoGNlHWqEWBudtL8Zr1D3D9Kqf+mLr4mpHqyWDw5cfGMbPFipVibkbO3q
 gkfK1hqxRdoedfN1bnsvJlZYSgDLF9n9dlq8H8VLgCUOLli2twQfVRo6v5+18e9jUjtkcEU8jW1
 t22zTWQAvy53WZZUgCz0iLsbmobWFKqyNa9EmgBjhOE/SDpP2q1rLcRMYgxIlIyfgX7NewDvuoO
 3iQYnTb6l3CcKSdY1FnUvKNrQAyWD87I8sk5h++W9tYSbAiMVlR1auT9CtdqD1rEuFPy5e7La9S
 /xlSJ5KKsZAMIFcppNXWRVHQXsPoC4J/2YcpERSmi9i+iQbS4+E42mfp/hfowt5ntxHz1uyVTE4
 Z9+lw9PEJZhCnpmlyi5NSKEsj1AHNanmwsOKIlYbzazDWubr9Yip4nvcLu9Acsfu/JxBrflGqRQ
 H0InOs1Fz+jvRJG2vxQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170046

inst->tss[] has VIDEO_MAX_FRAME (32) entries, so valid indexes are 0
through 31. iris_set_ts_metadata() writes at metadata_idx and then
increments it, wrapping only on the next call. After the 32nd input
buffer, metadata_idx is 32 until the next input buffer is queued.

If iris_get_ts_metadata() finds no matching timestamp in that window,
its fallback reads inst->tss[32], one entry past the end of the array.
UBSAN reports this as an array-index-out-of-bounds error.

Advance metadata_idx before the write instead, starting from the last
slot so the first write still lands in slot 0. The index then always
refers to the last written entry and is never out of range, so the
fallback read needs no special handling.

Fixes: 17f2a485ca67 ("media: iris: implement vb2 ops for buf_queue and firmware response")
Cc: stable@vger.kernel.org
Tested-by: Birk Skyum <birk.skyum@pm.me> # Lenovo Yoga Slim 7x (X1E80100)
Tested-by: Deepa Madivalara <deepa.madivalara@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
Changes in v2:
- Wrap metadata_idx in iris_set_ts_metadata() instead of fixing the fallback read (Bryan)
- Link to v1: https://patch.msgid.link/20261017-fix-oob-tss-v1-1-fb86f4cabf65@oss.qualcomm.com
---
 drivers/media/platform/qcom/iris/iris_common.c | 4 ++--
 drivers/media/platform/qcom/iris/iris_vidc.c   | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_common.c b/drivers/media/platform/qcom/iris/iris_common.c
index 25836561bcf3e..2ff15edeac286 100644
--- a/drivers/media/platform/qcom/iris/iris_common.c
+++ b/drivers/media/platform/qcom/iris/iris_common.c
@@ -33,6 +33,8 @@ void iris_set_ts_metadata(struct iris_inst *inst, struct vb2_v4l2_buffer *vbuf)
 	struct vb2_buffer *vb = &vbuf->vb2_buf;
 	u64 ts_us = vb->timestamp;
 
+	inst->metadata_idx++;
+
 	if (inst->metadata_idx >= ARRAY_SIZE(inst->tss))
 		inst->metadata_idx = 0;
 
@@ -42,8 +44,6 @@ void iris_set_ts_metadata(struct iris_inst *inst, struct vb2_v4l2_buffer *vbuf)
 	inst->tss[inst->metadata_idx].tc = vbuf->timecode;
 	inst->tss[inst->metadata_idx].ts_us = ts_us;
 	inst->tss[inst->metadata_idx].ts_ns = vb->timestamp;
-
-	inst->metadata_idx++;
 }
 
 int iris_process_streamon_input(struct iris_inst *inst)
diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index 05aab6e3005d5..c85626195285b 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -183,6 +183,7 @@ int iris_open(struct file *filp)
 	inst->domain = session_type;
 	inst->session_id = hash32_ptr(inst);
 	inst->state = IRIS_INST_DEINIT;
+	inst->metadata_idx = ARRAY_SIZE(inst->tss) - 1;
 	kref_init(&inst->kref);
 
 	mutex_init(&inst->lock);

---
base-commit: 749a4de370409464cf8501ec5b2451df45c84eb4
change-id: 20261013-fix-oob-tss-7d317d612cf0

Best regards,
--  
Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

