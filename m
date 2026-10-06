Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D2D1B3B19
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 06:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791269275; cv=none; b=RglvpCepah62O7f7qG4AC1ne02/4eC5GHnq6X21TJRR1Thx7h/raayyLSqvIKWHn5MdOU8SzncPra5mw/Mgyi1kvP+oeimKMFkmoOExPcZniIq1d0NNj9+GOQeuXX8EUqj77WhuoTxgNoJlGxbsPDvdQvgDIUDZwn6J0B1Qdu10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791269275; c=relaxed/simple;
	bh=MPN/w4fd5TNJiZBv1aH5s59Vk8uQssuUdgllkMx+sZ4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p/QtxUvL07UcOu7oHcLxdtO1lPDUzgtuk8VwOnbz82yP/STAC4zOREy8Sa1Wkhu6wU9bJNSpxmowRMTQowN4FTJv2Wq/F7mgCHoY/wLfJYdMB+A64wnX4RqssuVOTp6X929AQiaMq5dI0S3v69rCWkEpGLi192e8MvN91g/i+4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GbEO/cFr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A2JqbWo3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GbEO/cFr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A2JqbWo3"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6966eCIA061314
	for <linux-kernel@vger.kernel.org>; Tue, 6 Oct 2026 06:47:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=YTNWcUy5uXfw5fcm4xIoTb6pkrtsUZy/boO
	3vBsoZfw=; b=GbEO/cFrPWAN0gxCRfLYavIkiXFDz/wuiQFIJkecaPdvlfi08sl
	iDL/YviDPfBtCT3g/+U18LN1suVP+K3fPWlhBgPF0Y87u+lu6KOddA2qT13hR9M1
	SJdU5Ia/c8FPHYDysunEvGpZU1315osC84WjGOpwYB0e3P7PL5lpsgEgIprYRuiy
	d5qf3O+aVTTFsg5d81o6gUlttwdQLXMDzJYMCKkBux/zWjOxL3kk8BK6xHUcmzck
	pT10FQD0at+h681FA4Lp+7eNj44qRKkKuFYvSGs/4XZwRnAZxo+cWSOlcHCXgXXA
	FaXuEtucDyT09lkFXaRAU9O1YyZ3fIU/8yQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4cj63mu2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 06:47:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cc40759b2so533176085a.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 23:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791269272; x=1791874072; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YTNWcUy5uXfw5fcm4xIoTb6pkrtsUZy/boO3vBsoZfw=;
        b=A2JqbWo3q8ajMk8cRe98LwRyW4t2IpcYMt3nalKnoRPu0uhD4dWnB7ZmQHo6lAGWmt
         CnQSPbLtLdlSOkKtugfRcLohYlVKc1VsYhzv5qRBvHIyaDHOZc8Bb5MRWawr3Qwaata+
         EBFd2p3cnicrai64EDUOpoxtV5cr14HwsbxwgO8BYImUIKC+UjrCjo8KeRVmZ8Ap2VsP
         8tJG6FUd9pztrfL5uCtwv+pYFp8EU2V+uG0nevP3RO6XBjwDubYfT/Kq+xYVipQMtoXS
         BHUaWXgsP6vfrjxH+RHdE6GiQJvRefC3DDmgjr+XuA8VjIePhIgK4RPp02my+blg/QOR
         8P8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791269272; x=1791874072;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YTNWcUy5uXfw5fcm4xIoTb6pkrtsUZy/boO3vBsoZfw=;
        b=qDCp0qrLAU15hwvom+hBKHlBY1MHhNgg1YmfAly3Nhwl1GTK7nmwA9EuOtwutAgZjf
         0t8njRE+kyLocwjnXs//A2MErGYZrHpib+1ZSCF+OgcrYqxJIjHLIZxZZ/9XgwKbde0G
         80Gnj+Ar666AVmIiyPF7IxarWkJDE5Zo1X38zDAkrK0y1h4kXlSRBZSPPHZKWs3TnfNP
         EQGlHYpzDmEGuStf+fsxq+kC5OxbVi2YqwwY24piPhrDa5Wr87KcTP1MVHqeuD4dSCnb
         b8BSqhRpQTzci7Di1MaPcIXUrLHgtOgl8jE7UcCeiZT233t+Y/DDQEhniQQqZWjCuqeL
         h1Kw==
X-Forwarded-Encrypted: i=1; AKwUvBxCbufp4+2dLVnZUfWn9imtb6yU40Taogrk1uM514SPsYhFX+eb6e+/CGVGtY57Z2XAbfKgyyX2tvk+0Tg=@vger.kernel.org
X-Gm-Message-State: AFuF++kFdMj3Vz5zzW+6Jh2jcWQMTurFRU8shfscm4j//T7CMtCPa3xd
	HUgd6BzPH4N+ELLxGV18yPnfaJ3iFCdFOO5EPzwRYxvHT9znWueW09EFactkCvnXtFslyXWECGG
	nAuRa38i9LL4PujBJvKWb57ly1eh3YRROMWx2f0irS9VLJTpIRy+rC6CoJIVVy+xQY+8=
X-Gm-Gg: AYBFou0AlAKB5bZGHdwU6gYC9rwVpKYzfuiXjeZfzesEVo36VQh3f0aPv4IPoK0xj+7
	YsVqaXBXwxCBIIs9y047DkXoYmqlXXiv7jYwL/Z3Klft+SRV8QvYaFFGmnYAOHW/Mz40qttr547
	2Fktl0x9F9I+2maY7sFvz4+x7ItDJPsAZYiWQGdYHHHEZ7D94P5ZvJWVVB8b/f0X3kVJKIMWwd0
	K3n+AsehamK2oeTdugeEVqe76lyBdVq8hji2UjkHAWeHgnVgczcx/l1fMDQgr74hyw06q5BaCsp
	8B+Y1oyxGyquxuQJhZvXknoH0auX2t9zeiwWtcQjFaWC4VIhOgTK+WG619LH0ZKTzP7pJ6R/db4
	2DfYgUYD6vGvSUEGym1r8XTFclBa5TEU59VIr5NlTu3+r
X-Received: by 2002:a05:620a:8084:b0:93c:72d2:ccc0 with SMTP id af79cd13be357-93e8f20d503mr78344385a.17.1791269272534;
        Mon, 05 Oct 2026 23:47:52 -0700 (PDT)
X-Received: by 2002:a05:620a:8084:b0:93c:72d2:ccc0 with SMTP id af79cd13be357-93e8f20d503mr78341885a.17.1791269271937;
        Mon, 05 Oct 2026 23:47:51 -0700 (PDT)
Received: from trex (5.red-79-144-193.dynamicip.rima-tde.net. [79.144.193.5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c6cd7c2c6sm1189326f8f.54.2026.10.05.23.47.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 23:47:51 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, mukesh.ojha@oss.qualcomm.com,
        andersson@kernel.org, sumit.garg@oss.qualcomm.com,
        konradybcio@kernel.org, harshal.dev@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] firmware: qcom: pas_tee: handle a NULL resource table
Date: Tue,  6 Oct 2026 08:41:49 +0200
Message-ID: <20261006064747.2454980-1-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAyNiBTYWx0ZWRfX7ZdPkRmaRYxZ
 0LHvU530q1SnQMGO85m3bI2LvtwtX2m4tVGtkSIpOKqbdEl2HROio1sSpRhfxJtYa3obIbPMEd/
 Dbqf8T89EU0lWWbMAVAX+4DWgBSvnx6hORvnD+vSLVdKA4sVuYHVdiPZrIZ0b8cNIjOiOEmoRFC
 2m5sb7i1hnjTXly6tMaGKRzK+3WbbM9WgFthBiA5kdt767vJHhme3aEh2LuY7wgEQULqzXJQud7
 URrUi6bmOtDPO0rjE4BUtTTcUlJCeQkjcu10i/o/YBP1pz0Hrh/is+7sSBpDhDs8+dfN2OP2hh6
 tqcu+VXF/XfY6ZbsAa7sZhPRSKcv7V/rTqvVFHATq7V9VXxCKTzYRdrQYh5BKZivYy2YM22NrmF
 lqN5yCR1NJX88AthBCwhQ/plfPoIjHzedAq3tkKA71VU9ISHJiXWm4nW80yREz9gPflOogaxUJd
 l5fFtZfP8JOaGBrPetg==
X-Proofpoint-GUID: b0327385wDqYOM_D-Kx9unuYzyJch22l
X-Proofpoint-ORIG-GUID: b0327385wDqYOM_D-Kx9unuYzyJch22l
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAyNiBTYWx0ZWRfXyXKVzL8xTrbM
 DN3y1ZtRN3DHYX+LCD7JerEqNCVlv2XgBrB3b96l0uSkwIr8sOl79oYqn2iv9yOrkdqkmlmLwEM
 FNdB0DYB5zxYRcWMoQ1bcQvHN8P5iWk=
X-Authority-Analysis: v=2.4 cv=bpTZl0ai c=1 sm=1 tr=0 ts=6ac49999 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=nno+U714v6U58lXnMUU6PQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=tEyIeYPr_htp-YW85GYA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_02,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610060026

Stopping a remote processor clears its cached resource table pointer
but leaves the size set. On restart, qcom_pas_tee_get_rsc_table() copies
from NULL when the firmware has no resource table:

  pc : __pi_memcpy_generic+0x110/0x22c
  lr : qcom_pas_tee_get_rsc_table+0xf0/0x244

Zero the input size when the table is NULL so the copy is skipped.

Fixes: b6f7978da0c4 ("firmware: qcom: Add a PAS TEE service")
Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_pas_tee.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/qcom/qcom_pas_tee.c b/drivers/firmware/qcom/qcom_pas_tee.c
index ac33a00687aa..a52a7df385ff 100644
--- a/drivers/firmware/qcom/qcom_pas_tee.c
+++ b/drivers/firmware/qcom/qcom_pas_tee.c
@@ -230,12 +230,15 @@ static void *qcom_pas_tee_get_rsc_table(struct device *dev,
 		},
 		[1] = {
 			.attr = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT,
-			.u.memref.size = input_rt_size,
 		}
 	};
 	void *rt_buf = NULL;
 	int ret;
 
+	if (!input_rt)
+		input_rt_size = 0;
+	param[1].u.memref.size = input_rt_size;
+
 	ret = tee_client_invoke_func(data->ctx, &inv_arg, param);
 	if (ret < 0 || inv_arg.ret != 0) {
 		dev_err(dev, "PAS get RT failed, pas_id: %d, ret: %d, err: 0x%x\n",
-- 
2.54.0

