Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793391378;
	b=QxyDBSTVVC6Sz/6zM9xao2R+VsBW0iVLGpoZsxz+v54Nr1kQoIFOBEHoFhC3ySlr4EYe
	 JZfDaiUYZQZbrDmh47FcSsraQ6RR9IvSixHI00+Q5SLjpkxTGftRWoJthQifWp1Dw07ez
	 hEwVxd3entDe+V1prlNpYuyuK/K37x38yuKIGzESYdpn4G6kw0Bvs2LLWgP6iM9dbqyN9
	 Q48EAp/cSRAoYJERfOLt6LwnyKpDtR/UL5bbPiVcEVhXkTshaLYxfiH0pKYMnIa7S6Roz
	 C+gJpvdxUYvZFllALRH7xbHmvHgTipcALubFwjn/H8HKYlQBis1r4UB4fhv56jW849Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793391378;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=iIw1AGfeQ24ouNA/iY8clW6tbpIonHWmuXJGVpJDMOg=;
	b=1EmROkOK8pJX5SJ2+HPr84Obp+F8JVEff994QahmJcv3MSb7PehCHKI5A9LZenKiGYAq
	 x5Y4NH2I5c979reBarNhHg3ZC2YHNZDDWJQogc764p6ZFldMSUVswZ0mbVEnyG915Gp2p
	 jeBBEgAmuqjx2zftEiJyML1YfPNU/BZgtC3Qvsn4YBhHKcYLXoV6/Sh/jnxudLX2qWZeD
	 +jZq/HwC1aMRkrcl3VwRk356MyS00gi/v5eJ0SavQFamYUyZe9GAal+Vgw6nSVhtdGdv8
	 ybDLlsv1MdRcnUXIVTY/FgJar9x3iRTY0fHIpdeVNw3wpOYD1xMlj1uhn89DPRNo9NQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y2By3rpc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cpWupy6B;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7E7606A320
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 20:16:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E7E7606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y2By3rpc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cpWupy6B
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UIiWUP514388
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 20:16:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=iIw1AGfeQ24ouNA/iY8clW
	6tbpIonHWmuXJGVpJDMOg=; b=Y2By3rpc7rwdDaOKxjNQr+9JnG0lqBg6CoEt7Q
	9vDNWno8OuKYksU5HtCWDhB+B/FMgivOFsp14z+YVvg6PZ/zigbU1txciILFCjyU
	mGew3cHYgqULwSLLWfkAjeGB7UZv2NuQDXkjUJqiJTqHxLvDcK6En6/24Jb1gkYL
	ldj346GPRJAqXtC9oXo2xafsYsn5X/6P68K4QHBfpLlqh/HV82io2bM6wXbhnkRj
	BajudzLF/M9fhnVkbsqHmCwtbrUWfTyC88M9tdvTZsc86l/44MqQbq4sV2Cs1fLj
	iMVzRUzkB7/4/GFtZHn3QtypjVzUmCxXqEZ0woQgI9L/nZ1g==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn0sj88e0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 20:16:12 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35c5aef2a74so4342768eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793391372; x=1793996172; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=iIw1AGfeQ24ouNA/iY8clW6tbpIonHWmuXJGVpJDMOg=;
        b=cpWupy6BpbSYkkQGg5D6yGVwW0k60foSVeQx7wLQK6Q5vgb5Ar7Zo54wLndwkBuyj2
         ecAtxUg3FC7yYFjhG1jqmiXkWF2Ui2TajthAYNf7NeByaaGvQC2V6cTXwqGgdbBERGmQ
         CMSnaiUlGIHu/icjz6FhDZHlCsJSN2R01zmSqdDdKTAm11f2B6cAtZni+TTsNXx7e16F
         yi26wr0AB/Rvx1is6FuF9GKjP0s++G1uaBZO3+rNkZWl7y6HOvbcEuFOCeerU565d7sB
         5Wtk0Te0tuaZgj8vQklkoXCePmos9+dwQYlPk2LNbs3gz6eFUQaL64+XwrwNPvIQk+iV
         OehA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793391372; x=1793996172;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=iIw1AGfeQ24ouNA/iY8clW6tbpIonHWmuXJGVpJDMOg=;
        b=NRevECe6piMDDQML/X1n7pNwr7swO0XdS0SIZNITsK6joFEviZaZegihD7pti+kPN8
         11jkVjWzRzRnp8an8BtRSs88imlWNH59SpLuRbhCxSY9/tHE+dvLyqCayxoDSZDVD1QT
         rcngJFmdg8NvGZf8o1phSxZbRiErpoxCPgcR5eiEoiZX6GWv3gIJs236b80WBhrJkPFV
         gsV3pxTGZJmtRcmwcjTHUJBVUtp0wgk9Tm9CXGD8X4xJWwAkLYWZFkU7TFrHwW3iXJut
         Saq9KSuQOKVqly0lWkyQ/7S2ceAwSyseURP6Dj3c4fO4WplI0iLZAnnvDwOSJI/CCGPT
         lDEQ==
X-Forwarded-Encrypted: i=1; AKwUvByd4C4AcP9KPRYbuySvXz3Vk+ZELfKko4gUMW298l+U+tEi3VarvfsL/1R+tC6riJe/CJpPPlI+mO881Ns=@vger.kernel.org
X-Gm-Message-State: AFq9FYKuVgDesAEpPyh44O6HQufahmTDEJ315rIUD6YDuVzUNz7UuljX
	fcE/WHuo/HshboOeFSqgX58PZoN81NuUBwZmUAGxM9OcmuTpY7vmtIfjJyU7mZG+kYvjT4LiUyD
	tUXQ5drleHJOwCTHSEduPTCbunEEofcaeTTs9Jkx6LX+YZMhFZ5b620BPBUFg8/zhX4w=
X-Gm-Gg: AYBFou0A1a1gOATa965pGlvqeRI1iZolUptqfLh0tr92mWKh4lUq19Xby0ifkOBHt/L
	2qNFtJGkS/e15xLgrfuBs8PbwteZaoDz6F29JKcT0QHn4vlzQ9y2s6rIX4NfFBMwTOPBx/zPA+q
	lkJlroCR4MZL+IwGLoPAoHa9tsOr5cABYcPgy4rVBs7AONnItDlTykqcCH2DC0Fp/GxbnlmK/9Y
	sVJ9eWHXFdcZ1yioO3rGwORQmqrdLjk41v+y+08A9s3s1ZfpvIijdD07kv0Fos+lfnc6y59N11j
	rpQWiPk4G1qSnOzYA5UQnZY4fH17x03USPwnoiSb0ajIupAcejTe5k+3j4aJYCQfXnMcy+T9Xm5
	9H3bLLYQZNE65ziTneNpg7sChMgnt0e3wRYqXdClFaU4V78yMr6E2vkcvII13y+lG8RhF1bDL6a
	x6jdU9tA==
X-Received: by 2002:a05:693c:65d0:b0:369:f7d2:d7a0 with SMTP id 5a478bee46e88-36a423c5d12mr4990140eec.25.1793391371681;
        Fri, 30 Oct 2026 13:16:11 -0700 (PDT)
X-Received: by 2002:a05:693c:65d0:b0:369:f7d2:d7a0 with SMTP id 5a478bee46e88-36a423c5d12mr4990110eec.25.1793391370995;
        Fri, 30 Oct 2026 13:16:10 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428ecb61sm8357156eec.10.2026.10.30.13.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 13:16:10 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Sat, 31 Oct 2026 01:45:48 +0530
Subject: [PATCH] Revert "media: iris: reject open() when the session limit
 is reached"
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
Message-Id: <20261031-fix_v4l2_compliance_unlimited_opens-v1-1-f20cc9231ee3@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAPP65GoC/yXNQQqDMBCF4avIrBsw0VroVUoJOhntlJiEjIog3
 r1pu/wW738HCGUmgXt1QKaNhWMo0JcK8NWHiRS7YjC16XTdaDXybrfWG4txTp77gGTX4HnmhZy
 NiYKo8Tq0pkFtbtpBKaVMZfZ7eTz/lnV4Ey7fNJznB0JYd5SHAAAA
X-Change-ID: 20261031-fix_v4l2_compliance_unlimited_opens-f5b423c1271d
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793391366; l=2893;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=TM5MeP+ywe4I5eSUjfCJFFS7wSDSIT7ACdjm5UAfaTA=;
 b=Om5CGeYYU8mgBZLHAQ+aNqYEeQGuT72prtMVsvsmo+R2E4pldgyAXAC8BJwSjgsKtDHmhnypL
 Rd2O/NRynxCBu8xRaA9JC3f2PGzS3xwQnmdt7W1Z+RBzSz+Au0/AI+g
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-ORIG-GUID: DnLfxpCJV52vBzYuSr6B19KeVbjEOB2O
X-Authority-Analysis: v=2.4 cv=Uun2pOwB c=1 sm=1 tr=0 ts=6ae4fb0c cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=7GKYziPKAAAA:20 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=XbppLPhIH7o2zzq4e_wA:9
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: DnLfxpCJV52vBzYuSr6B19KeVbjEOB2O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA4MCBTYWx0ZWRfX2mD7UQ1XyySz
 c5fVKL3TIG25DD06cmjIn+vn6m1Xi/3Rnsvo+zKzs67hW9p1xDqbZLAPcJZiKPfaKZUmC66T9iQ
 Q4hyhxjvYYB4hEFXZfRloCceHgRWXUyocctFdeOZdB8qIVBHZSluX7MaB+MtnSqIQGepMsMLf8c
 k24nure8Uw5xzha5LTk/VkmSHL/qBlFFgkDVgEFKK1IzKQU9Xe27ZBQYWKPbVn8ZdelmiohlQ0o
 MDizqaN7BL9JRkg395NpLmZrQXT910oxZUJ1BlMSYmV88C8SJF2PKzqlEel5crlfapjh/3Vd2G9
 hnpTa7UkmHLrrJuWgfGMjh1ejefNdwOkSEKq6CwjAVNfumhBLOzSVzbzfsfZTniVXQfF0uZki8c
 pRRroLMANpaRVnLupdiS/BCHx3l4FRbTDraGMn4YdfeORnl00jMEiXer7eX9i1BMsGCVImD0KfE
 xnw7kzMX0MJJSHKngNQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA4MCBTYWx0ZWRfX2GLxhh71yA4d
 HtmxSDdPzMpzn4AdH9DaI3WDWDV/NK74QMF58bGqx6D+RjttVER2jjXkcv7DVX95d5MB/N4fmU9
 762C9UsTQhwfYVxmH+Ky+YJEqko18yw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300080

This reverts commit 397ebadcbc21 ("media: iris: reject open() when the
session limit is reached").

V4L2 does not allow drivers to impose artificial limits on open().
Resource limits must be enforced where the resource is actually
consumed. v4l2-compliance verifies this through testUnlimitedOpens()
and now fails with:

  fail: v4l2-compliance.cpp(773): !ok
        test for unlimited opens: FAIL

Link: https://github.com/gjasny/v4l-utils/blob/master/utils/v4l2-compliance/v4l2-compliance.cpp#L747

The session limit is already enforced at the right place. An instance
that did not fit within max_session_count is not added to
core->instances, and iris_check_session_supported() rejects it with an
error from iris_vb2_queue_setup() and from iris_vb2_start_streaming(),
which is when a firmware session is really needed. Failing open() adds
nothing over that and breaks the compliance requirement.

Fixes: 397ebadcbc21 ("media: iris: reject open() when the session limit is reached")
Cc: stable@vger.kernel.org
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vidc.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index 05aab6e3005d..a27db6cd969a 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -56,23 +56,21 @@ void iris_inst_put(struct iris_inst *inst)
 	kref_put(&inst->kref, iris_inst_release);
 }
 
-static int iris_add_session(struct iris_inst *inst)
+static void iris_add_session(struct iris_inst *inst)
 {
 	struct iris_core *core = inst->core;
 	struct iris_inst *iter;
 	u32 count = 0;
 
-	guard(mutex)(&core->lock);
+	mutex_lock(&core->lock);
 
 	list_for_each_entry(iter, &core->instances, list)
 		count++;
 
-	if (count >= core->iris_platform_data->max_session_count)
-		return -EBUSY;
-
-	list_add_tail(&inst->list, &core->instances);
+	if (count < core->iris_platform_data->max_session_count)
+		list_add_tail(&inst->list, &core->instances);
 
-	return 0;
+	mutex_unlock(&core->lock);
 }
 
 static void iris_remove_session(struct iris_inst *inst)
@@ -223,17 +221,12 @@ int iris_open(struct file *filp)
 	if (ret)
 		goto fail_m2m_ctx_release;
 
-	ret = iris_add_session(inst);
-	if (ret)
-		goto fail_inst_deinit;
+	iris_add_session(inst);
 
 	inst->fh.m2m_ctx = inst->m2m_ctx;
 
 	return 0;
 
-fail_inst_deinit:
-	kfree(inst->fmt_src);
-	kfree(inst->fmt_dst);
 fail_m2m_ctx_release:
 	v4l2_m2m_ctx_release(inst->m2m_ctx);
 fail_m2m_release:

---
base-commit: 7649ba73f9e7e1e04d0b46213e39c79ae09dd55c
change-id: 20261031-fix_v4l2_compliance_unlimited_opens-f5b423c1271d

Best regards,
--  
Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

