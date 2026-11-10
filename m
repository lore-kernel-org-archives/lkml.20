Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794319904;
	b=I8W2ggnQo3QPYBIcFKLLprv9nZjizAOy6Ir2bECewVp4R8LHysi0b3AdtGgcdrut2+NE
	 aa4odpv8yH+IQTK0cMJj+WOiOGX2108eLJm/2nE64colRjwZJJ8Y/3Fv28Q+3LUALlxgp
	 S3K0wzBpq0OBw99Y2j89xAfz018zJwVZQ95NySoEH5dPUuXcSOP3YNeD1iVfpM/S54LG5
	 3bAnxWQLSy3GUoFj8QvpAWQeA3BbAcFxXJ9nTmcUix8z3sllhBFHesSDyFOOa4lHuM15f
	 ECa9gNqVaTYD5M9i4OhAuLXvXcWSC/TrGLhCDXuTGlp5Had9Sz3CXf1R7p4gbsTB1iA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794319904;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=P0gDbpRYwXjrOiNSKkytD4TVz1o4q/cXx/36JYdIpmc=;
	b=m4kw4okKOUWPTGIXHbq7DAYY9W4Zsqu7dRO8O9lYYaaRvzstwj1BruwrSf2RUWC4hfSO
	 8eUE3yq5SkKbR7JUuR22Eevsa6zA0K3vGvfHxFIKAGK/q6svfUfwQMre+r8WLKxWNfQvr
	 scLuFyXSexEb3rDIghJZ2FT11wYauC/16GzkUcCB7k842ItLGiiK/4vg/SpObNeHWuHVK
	 tWnwAjFFQupOFJLXIfdb/399G7vDUBX0UR3vjsAdYpqKbnudd6S+US+iV+3hTj090/q7b
	 TTYNgYrWSWaaRfys3HZjr7TXzUsg4xXV3H3EZ9Najj0ESUAHwe94JR2nvHzoXNO9MxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eC580CI+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Qx/Gsh+u";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E9D606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:11:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9E9D606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eC580CI+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Qx/Gsh+u
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AABAF4P3178183
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:11:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P0gDbpRYwXjrOiNSKkytD4TVz1o4q/cXx/36JYdIpmc=; b=eC580CI+EfReaL+K
	QVb4jwWd8G+tjsJNPYyO/K1YKgPfdaAd+mUba9LUy0qDatR7/JERJ+CpZKHuT6le
	D3S1QRhu6C9rubOoVWoQpySfKI/KPzkJoxzpDBlDDhyYgZ+V9/0XmIvYn1tpKk5h
	YKAZs1HAB3Niyac1D9d4D0Dc3MLifS1ASJq7XzvCb9t6yBDBPb5I29TElU0nWsqI
	JylwUMG0RCoUgxTOCRRKbbvpERLmhT63ixMGF6PDCeJHcxLSD9mhT2ZNOL7ygZ+R
	n+eI3g5RA+rCzxXPtZWxehp+5SCVCxqTdzClXXKIlwGtiK8WknnDrTTelv5egwTa
	XJwLzQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huyufs46w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:11:43 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36fa5673fccso4671200eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 06:11:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794319903; x=1794924703; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P0gDbpRYwXjrOiNSKkytD4TVz1o4q/cXx/36JYdIpmc=;
        b=Qx/Gsh+ubCuML8FH5j79pHbTkGViMqVMeAOUwXU6SfsM/xrKdtXxPvaOSYvXjdN+At
         I2pMx3UecXAs4vMw039Dh1ba4dum/J3Bi5GGiq95TwnmghqXWpEXLNMX0IhICbdrUUya
         wt+qM3CYFR3FycXX2JvM11zCs6vEpe33cRmCH8hnyzrh4hS5TkfzfOgZykKYxqEdwhCR
         X9Py0651M25yJzdFduZn1mVFv2ZiKJBOCKUL08j3wdxt21V0K4Si5o8FHrBU0vXrbPEG
         8vzm7J/Bp5w33XujwRzeGnqy2SFcaSNiDwS5GoXiPzAusOqbDhaC+TpGraRN4Vuk9B4V
         UHeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794319903; x=1794924703;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P0gDbpRYwXjrOiNSKkytD4TVz1o4q/cXx/36JYdIpmc=;
        b=pvXbb6ca8r+Szq5WeG7S/hblYHvKLxnUnNJ3NLuKTfP5qP4201mVeLV7w5OjeTTCDk
         Jk4MgMXfVhhjyPm0yZhz11O4cukAB0YFZRVS8rwOJJneGZO+NuX6ILwynv6FcCXPUutN
         e8SYprhDg6OvcXNa5/VY5dYTy/lsnY3JJ+Qcn2HQyHxIydiFS7j8UOg1/7JCHQnjCx+k
         GHymTBSY1W+M1T1WKJkYSF9OJXBbUa99chZEQ3Z12C2Eq+M2AgAd+CdDs2G99nsBss9m
         Rtu/yhPqUPttjMSL90XuwhisSkhBPmvJp+55krO/CtBYSoyE+Nd26Y3/v1eHXvSQuwvS
         Y30Q==
X-Forwarded-Encrypted: i=1; AL+hErGn0/0iHetoJnn9SxtsBWxjauGl7ueQfVex/wewPFKI23yjMX3+XI8oXHPE7z/ga1HCAOLDD+lHseIMBHI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8laittihsBsIxqQ6uXXtl65kpb2XluucQLJEqRxZeYS4DNr7Ud
	0dKN1Q8rzAblgt8SAicSH/5NGtKTsqovIXGN8l22XianNHbwWtKX+PghgkcYSYnkc0ukE7JPEKG
	A480Yp18B6po7q6h6qiVLZUt5oYj4sLQYEKg2fn70KNyNyPHyNFnijEO/sbkSXp0oFCQ=
X-Gm-Gg: AYBFou1wJV02CnG/tvaKVZ+FJa4eOB95RcAz2IMtUrOHaoNl8u3f047qqnDhdNtcDiP
	iW74qWBOxFF199XntpLHlVLTS/9F/6F9ERJ7iJQQplR/OeCVTnhYgvtDzBZWbMGv/XDjXXCCwsm
	wf2xJNEoDCS48jxFKwU28Ikp6j5QemeCvOfxC8aL5LLezWCsVnnabgLRUC38/OQyXdsCaVobJzn
	beMvdshEQlTnxN6YnGiid997lv2lCFVPaxImrk/QvMF22j8B/cVPGDqh6sUx2PxVaiLw9ioWwBc
	0AiUBaXt4Uc63UGpnZ4hUpl9yB59+PiVXv+K6NXq7b+OFJIJhrOZfqOs2jnGXKoL/MGD2Zg4ALD
	46XE+1swcPfsHy1jvMR/mbZAPvQ3AwVIZr+eUwvupuBK6pZVQBYv4cLgimSpixvRgWJPrZWQjmz
	OByxhPEI0=
X-Received: by 2002:a05:7301:1a0d:b0:369:fbc1:89c2 with SMTP id 5a478bee46e88-3751e6ad1e0mr3517231eec.8.1794319902077;
        Tue, 10 Nov 2026 06:11:42 -0800 (PST)
X-Received: by 2002:a05:7301:1a0d:b0:369:fbc1:89c2 with SMTP id 5a478bee46e88-3751e6ad1e0mr3517175eec.8.1794319901113;
        Tue, 10 Nov 2026 06:11:41 -0800 (PST)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375215d8889sm8059128eec.27.2026.11.10.06.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 06:11:40 -0800 (PST)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 19:39:49 +0530
Subject: [PATCH v2 1/5] media: iris: Fix runtime PM reference imbalance on
 failed resume
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
Message-Id: <20261110-iris-handle-unbind-v2-1-86d5f6f1dea8@oss.qualcomm.com>
References: <20261110-iris-handle-unbind-v2-0-86d5f6f1dea8@oss.qualcomm.com>
In-Reply-To: <20261110-iris-handle-unbind-v2-0-86d5f6f1dea8@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hungyu Lin <dennylin0707@gmail.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794319890; l=1181;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=uA1DrNWOT1xdT5YBsROagD86Vd8Mo/RENc8c8k3PgK4=;
 b=FyWfMZv+1k1zNofMJ+HLQJe8BENlNDsQx5dvjhx7AKhywMc470zwo5xpeS3NsG7ngqswsEnVF
 PajrSZ6M4LyB/ckJfR0fAbrL4ygIeerwh4Q9w0BOIlywc3c6B/5lBSz
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-GUID: bfCoj7rHt0Q4glXj2TYq7t09eXNJN7Mu
X-Authority-Analysis: v=2.4 cv=S6lMU4sP c=1 sm=1 tr=0 ts=6af3261f cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ohPow3cFOKvdjjdYMLAA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: bfCoj7rHt0Q4glXj2TYq7t09eXNJN7Mu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA1NiBTYWx0ZWRfXwS/nD/BLK5lF
 tUCN1TMqvKw5sv9cUWsnU2kxQIs4NiYDt5o/eDh8ZHV06twQURBFLek2Xt4SKDAXKx8oSE2aZ5Q
 nkR8M0ABCPpN3PaRMykN/LcCEiU5bqc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA1NiBTYWx0ZWRfXyKBJyL8xFRsi
 crgB4aDUxgocejeZUOhEfK+4cLW+v0jpt7ASSMIHTYq+LanJ/ZWHNIndqJYWACB0caUEk6xbSwc
 GryPVKYHGgPG7OHkUAafFdQYvibhcMEcEULAZWorUL5cTU9XKd8obK1nMRLYYQ92zgis7XR3RYL
 qSm1d6uZG/1bMYAojobcRT/hUXf69LD+Ndy6mvP1pYcfXA01c/eUbqT7YRyMMcfYOXvxJf+2Z9S
 5ve6F/HH3l1aY1ljhzhdNXCphs/n1h8mPUR/Kw6zg+K5JvmGKt5rVYPtcmsIzkLcZ2HroucvOLt
 bvER1FJMtVt72MuqLXNJG/f5IqqiMREiPMMtCrJlurtXgB4CC6JldeXI1MRDhob7kD6v0AFgWcS
 fZ/pexuI5xY82V0q+Zra+MxDqPqAEzGgSLn/TXLKo2Cp4zh5ZSYum/4MTp4XvLoumXxhzuFKAYn
 +t/HhLlt/1kDE/hncsw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100056

pm_runtime_resume_and_get() drops its usage count when the resume
fails. iris_hfi_queue_cmd_write() dropped it a second time on that
path, resulting in a runtime PM usage count underflow warning:

  qcom-iris aa00000.video-codec: Runtime PM usage count underflow!

Fixes: bb8a95aa038e ("media: iris: implement power management")
Cc: stable@vger.kernel.org
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_queue.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_queue.c b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
index bf6db23b53e21..545bbe75e1740 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_queue.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
@@ -132,7 +132,7 @@ int iris_hfi_queue_cmd_write(struct iris_core *core, void *pkt, u32 pkt_size)
 
 	ret = pm_runtime_resume_and_get(core->dev);
 	if (ret < 0)
-		goto exit;
+		return ret;
 
 	mutex_lock(&core->lock);
 	ret = iris_hfi_queue_cmd_write_locked(core, pkt, pkt_size);

-- 
2.34.1

