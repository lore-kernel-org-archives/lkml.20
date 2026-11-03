Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793717819;
	b=d069KNXeyEz8c0jKnyAlgPc2Fz+8YMdTyl6N79uRygMpieM89YkZB7Kd3NeCrgPEEAsI
	 oTO4nvjDKwLC59qX5E7dTes/P1vdVu9RxOeSoQ0vyEiAVbpqkRH2JRyCTpFFdHF4Hn+Fm
	 ehK9Wklj3fG7b5d5+tS1ESMcEj1iWFzNf3oLE/aNfjNc6zUy/Cx6/DP0VGHZ8nPDhS960
	 Z0GY8K+0fi6j0jcSY7DDcJMtf709iye6miNncwNTBDEWP8a2aMn9wtKIrDBixfG917uIl
	 Du7HqgsaOM+sRLBjKxJ9GRYxOLX6+D9RzODaLW76QaGx1DgJkZBvrWRYliXD0RhaiHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793717819;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=CxRFMAsJ+VFJvYEEwkTyCVJVUBTdh4sTWBpZZ0rFhHI=;
	b=ljBqS6kAP5WaS9dEbupCt4uqbMCS4Xoa3Ufml4O5RZ15Rj5UiVflpYXOQwXi+rF1l73k
	 dbWqX5KZkxx12q8cvZ5GuhK423J+65M7AmfU6TWoEe0EMiCE82f4IWClkUlaBKV9CywVe
	 paY9CWQh3aFn0tDvkESkhHAbZSUZnSLeJP0lqjXlPPUThmHVJPZoMArvEzutYFo+KDsUG
	 bh2kUC2ofErAm2K3z53gDJ23syiTl51Z1yX/trfhy6P9WFXFA2Udgqk0wvLlFwFNIcGlj
	 75Rprsr2c/1Twv8gKWvqi6N+1rqKU5M/7VfGHjYt7IZukBfB9Sl0ErMvYVwRjETC8BQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F7cpy9Tv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="KZN0YW7/";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731E76082BD7
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 14:56:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 731E76082BD7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F7cpy9Tv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KZN0YW7/
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3EAHV63690011
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 14:56:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=CxRFMAsJ+VF
	JvYEEwkTyCVJVUBTdh4sTWBpZZ0rFhHI=; b=F7cpy9Tv7DXa07GrLaw6XePHHgF
	lr9TQbW18YHBYVnh2AFUK3o3FUKk7+AF3BWZmPfIMzjcf55Gh/B1hoMSQsX7IOM0
	PABuRBu5wNHS4JdtysvxjzT54w/5lW5+7kDE8k+qfM+zRjQ91PqnsAGUyoCProsS
	MqnckyTvN5US6YY9O9St5qDpqfoyMypLS5qZn0K/Vha4aX7k9eSacYF+JEsRfUAo
	mhuqyNcFYpE8Q74N1LfGfh5psh8B5Wb/nYuVp/HAc7VcFRlaiDrj/RVxMGtiSdxj
	tD6tq7MCFVcFrrhmVIIGFqDpGXnnVe+ojkEiM2W/p/85m5uabYn4DmeA2ww==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq6m9at70-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 14:56:58 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f37c94ceeso138309285a.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 06:56:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793717818; x=1794322618; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CxRFMAsJ+VFJvYEEwkTyCVJVUBTdh4sTWBpZZ0rFhHI=;
        b=KZN0YW7/f+2Y96RS/pb0Zczi1DBZkMwnJ7PEsW3IByiLmcf+EC38QZ7R3qWgYbFv/h
         PuyGuGd6LoFsGsIn59FhPP3YfF/mpKg4lXbSigv7nsZqAkcEgk9iBb5qvj5mazIgGtm2
         Sr/PE46LEOCRVaRVjkahjQGcNXcEOucariX56dRxI4hEe6Cb4sQDkALquMBdmrI8ZHuQ
         +v0A38jDbI7md55hR01yOzKjDQK0coocQhHzSHUAdHF9wgHlgn1W2qaXT9WTu2+G58AD
         LimdtF4fuf8hWyI/g55SdGnim4R4Ac/NJuD7e3gFsiPGKnF6wf4gIhPCkW2V9dFpo1zX
         vTag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793717818; x=1794322618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CxRFMAsJ+VFJvYEEwkTyCVJVUBTdh4sTWBpZZ0rFhHI=;
        b=0BZogXYvjrrS1fu9QLsKlGCybAevbVx3ODMS1mFQSNUyV7jOc8JZNWOcf/+f27nrQY
         szY3mQk7a7KNRg8bI2pzHO0iZoZzg/lRIz1ZBZ8lGDIoF3iDe8x+E/+7LXvbu1cLRatU
         gqyyw+RciO/oUGGLfQtKP5Q/H161JOYpKCQaure9tqkHUqs1EKrXjczIBxXNUTGeKho3
         DuXKFnGrZO4EaCExZRsCYMgWpBSZVu2c0mwtYkB/9YOZUeaj/t1sdr3+DkuhB7zMHxtV
         wLoiue83NTc6Lnyva9HPzopnot/qjlfuK5fOn0N7xxEzi/jaXul7edGt6K061lpMhMrb
         SpjQ==
X-Forwarded-Encrypted: i=1; AKwUvByTaHvY3kxr/idFp7Tds9Ky2wEmgqzT4aiGsQc12P7D0UAcb9HtwmPQ/+EqHQDIaYsHj6fL/IiVc6VpqJY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Nicx4WpzxLC4xQ0SKhfbgwUYTpLw0lhYkOwm1OYgQms+AFgeT
	z47oC2XIW+dWxdIYXUxTxa3QQY4ohcKPucesukvjzlhLLE3MOlYLf5ZRKGgXWUpSx8y7fo2j5uh
	uCi7mwZZBKZQG1zZzMKQJyl6c2mITrJ9Hlccg3B+iQJQ4JBfCd9INwDtq+SGn21wGacw=
X-Gm-Gg: AYBFou0N+POI0LD6FqArA2NjXCP7iwwNv4GVZ4sYvtUBp9wgKAere+S5f6tHbqhKBrl
	SsKx2XiHtU7viF5/gQ9MDnFwg4FqY2kTaUae6TnjZ0nhQKmfr6tTuqomP37n2Gys2K/6ivSnkuL
	87BjD8FEaPQyU7tAGF7ihAF2eTBWys32GV0+EwzlsRGVrDNiNCMUvGFHdtFXQGt0g1BXFvEc6M/
	qitYrmr83xyptp5ZbWrcL7uYMnGd44I0JaOKMc/pKxxYtWyxGrKDRzp11S90fd3euqFbvGMMDTh
	VnDpvX+Cgj615Lpm4CKN77F6Jsy/PZIK9/z80GihDHS9k1Ph1z4sk+sFjZ0XMk6VF+w/9PBld+2
	6++ZYRex/o2zw5+kRXvDFyarmtht7oHGuF0NTNM/uyVQQF9ojPeWLXVl1vH9b0A==
X-Received: by 2002:a05:620a:1b8a:b0:93f:36d8:5334 with SMTP id af79cd13be357-9441338900bmr2433457385a.21.1793717817703;
        Tue, 03 Nov 2026 06:56:57 -0800 (PST)
X-Received: by 2002:a05:620a:1b8a:b0:93f:36d8:5334 with SMTP id af79cd13be357-9441338900bmr2433453285a.21.1793717817213;
        Tue, 03 Nov 2026 06:56:57 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a82cebdbsm69772645e9.3.2026.11.03.06.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 06:56:54 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Andy Gross <andy.gross@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 3/3] soc: qcom: apr: Narrow critical section in error path of gpr_alloc_port()
Date: Tue,  3 Nov 2026 15:56:38 +0100
Message-ID: <20261103145635.309032-6-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261103145635.309032-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20261103145635.309032-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1103; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=U4DKx8MMiCRhcURxj0s5MqGMwNt0kESinKP9ZIRoZRg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq6fYlmtozzSuoxt4g+Yf6h4QKEby6PWKuCSTiU
 M1iNwDveb2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaun2JQAKCRDBN2bmhouD
 19DyEACOlcNQpYZmE9m21aYxKuhM/A175nzFHKe4HnXyq4p+l6crVJ75W9HI0zhaRmZqciuGpFA
 V20iscomAfrOYRWUmKtrcRL/OusO5KF7dKsH968V8UvqromAv2eXV+gvS0MWawvwbMuAtdS9Mhd
 h2vbAJue3kKjt4XMGN14LLAO55BqENiDHcI3tM22Gc2XlzyRIbvdBd+9O5IFaQIbpEuwiGixGpM
 EN83+bblsAoHimmMLLoLgLxhCr/MbQ/Fdn5L2Idlvwmnq+9J0En9hdpg2UKf1E/Vmtl2SfIAcOi
 we3hobgdwVzLLgqrtWi9OHlI51dfIHO0WQZYZFbQewSHcZh1RhBRUPsfx1Kb/gHJ79fT2UEitMy
 H61MSv0P3NuzaEQZbZhfEAUHfthokjZJ7Dclpj3smthNjYesq9Oun1DRLLEguGFS+/Qkrsj5xvE
 ZxYMnPiTEQKXiu9NoS6M4jyQZUQl9UZ10gymoaK22F4TyWlGRPx/Q3orlsOc47G7URkVRhGsxOi
 H2Ru62FnxJdPYnnEQ6DIhLiUcpVipfOVL5Y79EubVy0HfPdN69EyC7DrMRiRkUKqNsPNsq0o2EM
 Qx+4FfIdbYunvzMvn+YMoVHPkyBppxnXgdm3vWDMqJqUWFxmE4CBXOLJxNS89t5WCKTou6wR+bP zyW642TPYGaKpqQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: qRvgBi-Z5LvcG4khCmcRPcY9xtwj6py3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1OSBTYWx0ZWRfX3G4uJDSFwI5H
 Z2LfiN6YflY8o/95Eb9KiTz5DFnJLvdG3NL3lebSm6sWwMuoaszoUCAWUM917s97Rkc0ZLPWIJ0
 zo9Jf38cFHL9TJ2YnypNG/HUIbFDkrk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1OSBTYWx0ZWRfX2oHHLz/Y9xSl
 /INHUhBN67fbn+okVnQ3gg1zuW5irqbbIwb7IbsCGtmyCrTv0IiOxrXqodXKKV1Q7T/10XT0ASA
 Zz4hLPzYHBaQxjkMi6nWE7cKBJpAMN+F3vrysZHc+zVye7gY4BwdjO5x6pqcxg2WraQxP6oa4ch
 qRnAoJV5trzSFLbjlpwYVW9V44HFl5EHuqbKJpKvnk99jkxk65kG3O/imX1pVLh3JM8NAbeYYEm
 fcLZeqpUdEpYEXlhFtU0LHvRiLNk+OoyQ8/WwBQjOXqvFmdvFxyXQ/0trkF+i0Dzh51kXilHMFk
 YH1fWfmtcSfCx/aySOuFoYiAcHhuogr4otmLlnPQoaFKSjcsNFBvRTUI0hIzziivXMD+mBHVz4G
 stkNZQWqrpiE+LbwCABFQkH+cbRY0QfuwkDCR4LAsU9eJTxw5Jzi5rZNcesV8LLASHUfkpR8waS
 AI/NfrMgI6OnTXqnI7g==
X-Authority-Analysis: v=2.4 cv=C7B8WgP+ c=1 sm=1 tr=0 ts=6ae9f63a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=M4xG5xDUUUIxRXP9NZYA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: qRvgBi-Z5LvcG4khCmcRPcY9xtwj6py3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_03,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030059

Error path of gpr_alloc_port() can unlocok the spinlock earlier, before
printing error message and freeing the local memory, because the
allocated memory is not published outside of this context.  Shorter
critical section makes system more responsive, although gain won't be
likely because it is only an error path.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v3:
1. New patch
---
 drivers/soc/qcom/apr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/apr.c b/drivers/soc/qcom/apr.c
index 80056bd0686b..edddf473943c 100644
--- a/drivers/soc/qcom/apr.c
+++ b/drivers/soc/qcom/apr.c
@@ -117,9 +117,9 @@ gpr_port_t *gpr_alloc_port(struct apr_device *gdev, struct device *dev,
 	id = idr_alloc_cyclic(&pr->svcs_idr, svc, GPR_DYNAMIC_PORT_START,
 			      GPR_DYNAMIC_PORT_END, GFP_ATOMIC);
 	if (id < 0) {
+		spin_unlock(&pr->svcs_lock);
 		dev_err(dev, "Unable to allocate dynamic GPR src port\n");
 		kfree(port);
-		spin_unlock(&pr->svcs_lock);
 		return ERR_PTR(id);
 	}
 
-- 
2.53.0

