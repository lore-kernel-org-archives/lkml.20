Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C30483823
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390163; cv=none; b=N2fH35uXQexgrcwqai+1vosHKiuquRfVKyAKl4VmqP1bYwrB7lrfWk/8UZB6xP1v18PqpvLxJoVUmsyF/YVm13Dj06QXF9UrHIK39AJ26f5pMeK3XUK7gLjmKU2ThT9gScY03rGUYcL5k1bjsz9US7eniwV6R7tMUmM9JKwmX1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390163; c=relaxed/simple;
	bh=bSwOuS5iyvqMiUoi9APsbBdLW4Za4qn6mGoGPuU+9Dg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R9IVqcQIsvMXd6DExDe5kYFu+z6N5/m5NfzSuna+jCtmG5YqGvNQ3IkjzEyQcOW+pkBPx9rBnyz91FJ3Ss+WAznd/bYKvGF1aBrcTAa+K2ryRp2MHRJsGg2vgyw4Woa9t45EqxoSYR4LjxRpxCMv/DYX10bdyB9kGpALr37ng2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xn21/ko1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gG3hr+6R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xn21/ko1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gG3hr+6R"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm34t1216142
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:49:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zTAMdK4EQiK057qUnxoZBA/r8mjHCg4BzOnFr6zvPXs=; b=Xn21/ko11z6vy9kf
	60hIP0+PfXJ+j0+KNFOZjf5dxCoElP5mR2Ahq267QQe9mJKw0s9Z1wMKQVcDWEXW
	5/209Ig41xjrX1j/DeWgelo5koPvg7H1FbjDtLMTYchzIZUDyTfYwGwShKl/gsPC
	UQMZDS344r7Kzw00ovJIIwrnqfrT8wKykTLHqn5FGo1CJOs2TaTMTg3pb3waDob9
	s2ysSO2alZNi5bEEVjg+AIQRhGApIAN4UpHMcN8Jb2l/Uzi6ALAzH8uLBC4Df+0Z
	JjL4oRw/ls1eQa7Kr97E78NXTrMYLFnBi0Sqi0TrLLNOKFkPhWXlrFUUqWc9NeRB
	47RJ9A==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3k0aht8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:49:21 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9107002647aso40573826d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390160; x=1789994960; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zTAMdK4EQiK057qUnxoZBA/r8mjHCg4BzOnFr6zvPXs=;
        b=gG3hr+6R34itaMZthZLCjfB/9qEU6zBBXy2KLX67r+kMqczjhhsvJCGMcxK1BPxBh3
         VAW9a23E7YgDqMc/8h3+zQHw/mhnHKLo8RRLvaZCqlC2IKgIZhYkCYWIs37prOmf2hZv
         9bJ5br9ltFUdvpnJ8xiGiRmexcyLHfcFf5UGNy6yv9TcCQJdcrjVygOCt05ysarnTwK/
         S2ASF41/OdVbqyzzjhT7xOvSdIy0sxjZlfQEs2SasXSVzbfQFAs2bHzXG9v/uzzet7nD
         OPht7zdsSpKOxYHjUq8u7Mq884ncXAKVB4h7ymtxJlglLh7g+iIxt5Fdpw4ZuMN8f7wn
         zDAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390160; x=1789994960;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zTAMdK4EQiK057qUnxoZBA/r8mjHCg4BzOnFr6zvPXs=;
        b=FUYURNP4lfUIqR1dTeOPB3gWZ4SYMxczkhoWDfgPmF48Zpver4kRbszuRhAgrMaAPa
         0boIXssU2YLWbJwhsCcVHQpA/l2mgufXwYY0YCcL8BiKp3lqydHno6WUjOGDxSfhjo5/
         SsIcI5HBrHGNvKXIHWjRYHBqjSLXN9VO1KVMVCr4rlRw71j6tlY4wXfj0wAsjkeCJq2y
         5hv35nUadZskf9/8Ejs1pnF3VoTjcpWqb8w2uQcqN8IxThMkqSv0mdX5NkgXgvOxCYP2
         rQdVNcmtv1cyH6T2tRIQviIrzSHBFtp0i8rbKlfxj8Zzi/M/anPowGrbYuQDysLBryVP
         rtpQ==
X-Forwarded-Encrypted: i=1; AKwUvBzmyugPRzmZscPN6O18TOWwsf0IFxcbf3gYjya/X9/6t3hhgydETAI9vj9e5xnD4m2eYwH4ZbE3XTCSYjE=@vger.kernel.org
X-Gm-Message-State: AFuF++l9dIOe1+7MGkPRUuST/Cq6PvKFrGHP2XNS7DI5AtGYAEWcXbem
	yy0zqWbLPnw1Q5s0lS+VHAHCcIznoFq6L5IzvPtHLyLHAXZpYauO1CKxJhkCt9yVinWJuKffWHr
	HyMeUwE+9ecMzPsK+55PFJEBbpI4Zrj0M3K4R4kOgFsi7PjPL9iR1RcWN9gcuDpSnA1k=
X-Gm-Gg: AYBFou0j81/u3RQ36wgokDX+HF50i8/WuSrVAFhNsJr6I6PvfG8PJtdVkow21iUZHXI
	yRiPyRywp2e4oovwONBfYGT8Dcm1UU2DD0O4pjoWqLf2gxhjM4uPTDsjOG+OItsvqQ5miY9KZZm
	19I8zSY/uWps+pFxCqe57cHEOf39h8eG1nIkq8F+UHabo/PRNP5BnhPMi24bWz4eoXV4dgm0lTE
	JWb5brP5pB/xKdtpEBnwGblHQtWuI+0nPska9P7LnyWTa3loIownGMlaGckp6AVu51YCAV8MZLK
	piDe6+okmksZG+RkBSLvQZ/ixE/yXE7is7haePbc5YYF5CgQYSncRc5reDQP2PRHoPX0X2wWssQ
	O1yejwW8B
X-Received: by 2002:a05:620a:640b:b0:939:8856:d8d9 with SMTP id af79cd13be357-93a29a9276amr330927985a.41.1789390159914;
        Mon, 14 Sep 2026 05:49:19 -0700 (PDT)
X-Received: by 2002:a05:620a:640b:b0:939:8856:d8d9 with SMTP id af79cd13be357-93a29a9276amr330919185a.41.1789390159237;
        Mon, 14 Sep 2026 05:49:19 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:49:18 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:28 +0300
Subject: [PATCH v4 29/52] clk: qcom: gcc-sm8150: Tie the CX power domain to
 controller
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-29-9d5a606ada33@oss.qualcomm.com>
References: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
In-Reply-To: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=765;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=bSwOuS5iyvqMiUoi9APsbBdLW4Za4qn6mGoGPuU+9Dg=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+znW6Errrbb15ecOB1xlArvCoe8BkaBzB+1z
 MmFcQVD1zyJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfs5wAKCRAbX0TJAJUV
 Vg+KD/4+CaFLgblKT29mjV2uyuZemUa6Z0CTNXA4rI77KK829wvfItq9BQrhYnieXJ3Ib1df4+n
 uEQLSi//yKAEuH6CQwC8Pv3mga836106LUcPOvgDOBPa7uJHzNKWuQs/HlYv9Aau3WaxXeYtfil
 Sx1gznD0KByCaeGekSEW9bWfkDmE/FUprgnCoymBwnuzbuB5R4xjGuvQ0O1nXdxV4D1vZp0fAAJ
 tPHptQzhNjO5sGFfo+AlbsFpU/Sd9pnfZvbDDVkWP4Lw2q1L0R+II2Q/P13W+IB2pjKUYCofNpn
 q9cedxiRfiFoZOZmwFd+11PlsZEiS9klOaR74N7dgFP5qCB93ERoI9SqAz65d0AU1nFSFOE39Df
 miQ4cBn+YKQj9RczeSznOPLPg/PosYcIl6K4aeFmZRrB8gWn3aYo1NTh97FvtkEtcqfnSra0QM2
 oUuY3eR9XtJLdEIB2CQo3ESyLMDFjNJ4rOZih8ZzWZ9+tdlG9ezxkFapru57YYH6kkwnI5kwK4n
 9QFICKpCjYkklgGj/ZKxBQg8qlYleAjHCSl2KiwlROtm09KWBIH0g0+Cu5QNO2HfLw67dglzk6/
 5kMm3G4+xlP2KdIf+tQA39a3PKzaKsba1KbJc30dhk8l16Awj7M+k5t392CUjRa82E5/7/8+0Oq
 B/qZZYgb21alhfw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfX88mOiovVrPmR
 OwuMkTeg2jvovRu0wFyJ6nnW0kjt3GN/mMP0O0WhbTE2k1U0ubkTCvv1Dpe7YzpsOhEE8UgCY4o
 j516lH4n9hYVBqUG1gZx5eUcncA/IzM=
X-Proofpoint-GUID: OjB3HjHzKSV9QPQMNhg4KRld7oa5gNr7
X-Proofpoint-ORIG-GUID: OjB3HjHzKSV9QPQMNhg4KRld7oa5gNr7
X-Authority-Analysis: v=2.4 cv=BtAIUoX5 c=1 sm=1 tr=0 ts=6aa7ed51 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=j9QDv7RGPiaZsbg0A-cA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfX/YeqOipgn+1a
 y8uInv1AM3nw2/nz0lsQLoG6jUAxUYwpI6AvL5O0fKOCpZCrguBrkayIwWwZBw9G4KQpNQzcYXc
 C64suH1aYW+3eWMDvDGszX/4sDcK1ABzxIuc1xrBZ1NzQMb9mX8E4ybV7HNkdfCN6DPOqAYtxBs
 PcnwNkGRO1D/fZgLCs+z8Yc+ihgQRm8CeYly5UpUzOz5niBHSEBxI6qJB/UDZo/W6+azm44axej
 s5flAkwW7SIsGnotCOogfQuaEpOUrpyYVqCSC3Zd/uvWQWvGDvZh5HjFvbtGW5l9EKw8ygVBvii
 gFJitn0KVzosdFwYlc7m1xOU7OVHKl9k1KnxF1SFi5ZqQSnXQyfvOgXS3A1hbO/I2F3LlM1/8PN
 6fodIIylBkGT5gPPrXsWMNIRz6/VdCSMCsT8ukeRrb+qOE4Vd2v0bUweeGQEtX6UweML+m/DYP1
 146gmIeosecKt8ss71w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140183

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sm8150.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sm8150.c b/drivers/clk/qcom/gcc-sm8150.c
index a93d1f412a7b..1404996d33c3 100644
--- a/drivers/clk/qcom/gcc-sm8150.c
+++ b/drivers/clk/qcom/gcc-sm8150.c
@@ -3771,6 +3771,7 @@ static const struct qcom_cc_desc gcc_sm8150_desc = {
 	.num_resets = ARRAY_SIZE(gcc_sm8150_resets),
 	.gdscs = gcc_sm8150_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_sm8150_gdscs),
+	.use_rpm = true,
 };
 
 static const struct of_device_id gcc_sm8150_match_table[] = {

-- 
2.54.0

