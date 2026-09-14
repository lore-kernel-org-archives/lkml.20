Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C505C483BDC
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390166; cv=none; b=Ne9lIq+bqr1yZXkeW4rhHvU/YHNMpc9OpskVTmNQu1VY883mJ72Q/Y3cSoNuyKlvgPJuvozapxDjqatoDGulGpX+0rxfrJudyH+mvUilRNyvOqaNXknqrZpAmlCQMqTc2vC3nFW8J1MhHumqvCJgUfXlp+pZQe6CX9vIWngbmPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390166; c=relaxed/simple;
	bh=wjUHiB/Fb0vvpnlD884yzywLf/3FV7pA3GwZbrdjsds=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jofTTeo5Arc44parxYh5vDTgYrnO6+4rIhDjAGoZs9XmNrGWKMx01ZhRLBsxQrmANIaeB93Is1/ZGRRrn/cF4avhRr/Si+KR3Hev2EOoVOZJLMAShC2H9z4sah/KKtTKh2My0g2bzFCOiZFjriIFvqTTB3Dl4V0YkoJEA2pBOjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gazYWWqM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZwOiNDYS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gazYWWqM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZwOiNDYS"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAmCGa377976
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:49:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hSosOcHkZaTwqa9u1d4bkCQ8v4iMfRbD9GCeLmqFfN4=; b=gazYWWqMB3jM7Cyg
	BgRDvVDWrRlB9Ctg3KjE9g3227lk5qnb9t+5LB33ZcAK6ySjsnin1kNDoJep4d7s
	mPR2VP0d6yHiP1etoqMu7dJjCrK2tEFh2k9K4NgUzy/8w2g9I/RV/bVL03w55/U+
	aT8CwMKXxiQR0aBS8lx3MqlJzJNDSUcoEMVnskRMkkMMaqFCoYYHhbd9TjQmV9Fa
	jRh2uObIRF4oduz9GQHphg2QRZx6OSGBMneF+1AU5+nCQKjPNC1xpDi5xTcShALz
	ADInA6L1br3N3NNsMmGooW4qyNdg5ltrxIAzyF+z5AYhag0DCTxx3CFXss6QGbyf
	8wpJAQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpecs8qfy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:49:23 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-785827e6073so638871137.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390163; x=1789994963; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hSosOcHkZaTwqa9u1d4bkCQ8v4iMfRbD9GCeLmqFfN4=;
        b=ZwOiNDYSpE7n2scVrLYOeBoGU4Vx51RtEcI/QyTUYOrfkGs7OPTulcWNFpi+4p25Gl
         9zNSIzo8FyfszsS+eoM5kYeENk2MmD+GwRdgLTL1ryAIfahgepkFgzLj8Z7/je1KG8OQ
         AL4FmvfC/iVKvLyJQ2rVRWmRE75ezA1K5TU5W8Mkz+HatOMIL3cEpGwh2wEMj1SOE5NF
         267rlqTBQVcg1qLcIfH4GTfDzaTtvtol4tDn+O5Hgl0FpB+Hf6b4p+tpfZel5F6VTuNt
         rl4eWruG23AekdsAmmOYYCaoZrk98cqp1HPfjfu7ZEojWzniEmi///UKYdpLLtsqAjZE
         SCIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390163; x=1789994963;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hSosOcHkZaTwqa9u1d4bkCQ8v4iMfRbD9GCeLmqFfN4=;
        b=AuZYZOor4whtX3SRpH/kr2PTAV3oOQxr67u0fMtSAF34aKom8B8gZg9e5IqH3v8ak9
         wnv/n5KpMnc0mLNDj9vVy3/JWxELdHBQwO90/mNUX3mCAZEeWicUEbUWjDGuBtwN8cUG
         V2e8KvtdrSZB4+q/N2bpI3x0tYdxB2zPh7pNcUxQ75hhvV0ZLEOquHWf6wtTy6P4XiAd
         RSBxSprhTchjd+nfnJ61hLik+q14Xh/4rbr8ntU9qpa3lfcljZ3ND+irJjYFhnKEqNfm
         dVXiL2xqZEj5DW8iM8W+nQ41H733jEPS7/bwLAwj5HE1HuZWsnTZ5enuhaEXPgXj211h
         OYMw==
X-Forwarded-Encrypted: i=1; AKwUvBwsZE+zrrFPpHIbDQ1KGaeKvIeBpzUW/2iJtSe5hqnkSO0fQRfKRZMoCfqohg4RAK9WFrxq+EV6okLPBXs=@vger.kernel.org
X-Gm-Message-State: AFuF++n0IO3Iz75rH0Ih0nN3tYm+6aeFViZg2/6VHnuN95SPqIG3dlIE
	wPWDhujAqK4yfdRDnHIDouyTFfbTxoFJy9bSStDUI86RsMQv/nek2BhY8WTGdPiHnlSRJpkRDzF
	szdTIg9a/NZnRu6QO5dDOl9yl1NbiRn5HYeiykcbYLirjBVhCFe4JT7aZRRC+YIOIb2w=
X-Gm-Gg: AYBFou1O5BlrsWjCxnLSX3wghODQkfG02f3GWTcPZPwdoxQ0eH8wxJ0Tib3a/c38xOk
	IPP3Y+KLZe2fH+9iRPo+bTzZ2r0MSlmizTNyegK4VLBNMwO0kP367n8CCBtse4Bv2EOJWwsYnq7
	Q+6Mipbe7XUdMxcIJlk8fbzKs34dAkygEOKROkJZ5z2TXsyGL5ta0UmdpbJ0Tt/kOIaSyhQvpxu
	dp+ZLFVqtWYeCL/XdYbqfvQzn2N7hJ3AUHZOQXOCau5S6LvrhGiAKiwtWdxO7nv9ahNUgz1yupE
	xLp/2Fb3WPsS7J6N5Qm4ID8S0NQzuPhfJvoehKU1Ll2Mj+wvXIdVtWf7dXF9x32XzdwU2lOB/BE
	utz34S+bO
X-Received: by 2002:a05:6102:d88:b0:79b:163b:d5a6 with SMTP id ada2fe7eead31-79b57ea2c98mr1201230137.5.1789390162504;
        Mon, 14 Sep 2026 05:49:22 -0700 (PDT)
X-Received: by 2002:a05:6102:d88:b0:79b:163b:d5a6 with SMTP id ada2fe7eead31-79b57ea2c98mr1201195137.5.1789390161958;
        Mon, 14 Sep 2026 05:49:21 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:49:20 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:29 +0300
Subject: [PATCH v4 30/52] clk: qcom: gcc-sm8250: Tie the CX power domain to
 controller
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-30-9d5a606ada33@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=893;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=wjUHiB/Fb0vvpnlD884yzywLf/3FV7pA3GwZbrdjsds=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+zoQML6Rd0z8rn0uEZfd9jYuz1DNhT+R+iEW
 ACrFhiU8TOJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfs6AAKCRAbX0TJAJUV
 VqDBEADHU2OIiSSk7Gbv12nKDJb71Vws6gFi9nZtC1MSbBkju8az2AYVACfLb9SZ4/hVBjESicE
 2vYNabV2Jopjx6VSK8oLkzJ8tybK81CEGhqWPM7U4quUU/lh/u0x9fn3h32XgflYlsiZjo7z6c2
 S/8yI97BqOXrP5LJXVPSN2DhZwpnmXf4TyAKHJb/wr4SYMV6yLaXbGFO35BWXYmRndK07BFYs6J
 SIMIP0oNKi9ojAtbjARxHGybQoEJ14vyCqOSAxENfIeMg6xgwiTxF/LMK+Qbd5DBI8XJGJ6BixO
 jFUEn8cvSW0WM4n0AFWHp//ixN2enNY7h/dF9qcEifWcx5LVztbzWn/VhhtP4y8MkqgmThiGXjr
 0w7t3PJz/RAgfZx15QfZ23SIuCTvc42i1l7tK3/ec6yJ2D5PE6Ux7kvBz8Nl4sMbte7Ef3boOjI
 v+G1gIBAk+GPQVePmQzNI3J2a0m0r71YxDwh24nMb/IP0duBalsbZfUllHR5sPNvm8gLXz3q9P7
 vWCZSQWOansnb9hqkaE1FvAMjvkFCsclWvD9ImpUBf9M2+kSIuMcFgGN50IBjCWHLy6Hjl9Kf/1
 G5UVRo+R+BX1M7vvvZElCUEheYT7E/ffH9nmTOSZ0g7ZRTakjgaaNENUWhmxQJu6TFrSFI4AKJ/
 LD3ZTg+ipp4pCXg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfX+yz0ePEniv8K
 cifwgz0dTLZYiCYEQbM5EVdOyQJ1SNh+ZLuRigG8Cygkzy/+EfEGJd71kce3MCxQ9A94HGOr+JU
 ZE2ZeSUWb0UTgwtjmtKYAScoul0hu48=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfX9a7PQ76Lif5b
 iEBmdiVc39b1u5dqLuteHprxvq4oll6E4xLNkcpu5J6aqpBtoo1fApqdu6x+5r8jE6Vm1YKWUAF
 H9+CElLSs5w4601QL/wJjg7Y8HFk8QWq00UvBUiHoeMmi78ZlEcT6GTLBlqhpr4llD5tt6mHxks
 WdpSyF9xYiHIBrEKMRizPxMNFlRkj01nrFD8zM2bJr0TQNtOtoO+g8Y43h86yUvc0QClYpMEvT5
 gMew96ydh844ljCrfF9mV5gK9cfjLNO40yor+9cBknSRMLsOJLCO+/hnBQhRR4ne1CIdDq2EZYN
 TSPwXevQ8x+o/HJjDsOWVg8BTRBcUhTlHtNNLi4ZhvbdQ0uQ680PyoSOUK1dwqZSGA7zGlxoX55
 bmONNoE3ibMkHqkloHlE2JyvHtyzlf14psOWn8XihkT5EmGfbEBae5YL+I/ov8LN4SuASnHaV4K
 ka8EljXGcORFGc7Hx/w==
X-Proofpoint-GUID: grjq8qJFTjAkUEbAg9-N87wyeWp_2H5L
X-Authority-Analysis: v=2.4 cv=b/cncdGx c=1 sm=1 tr=0 ts=6aa7ed53 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=ESHVkgNwe3RMy11JppAA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: grjq8qJFTjAkUEbAg9-N87wyeWp_2H5L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140183

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sm8250.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sm8250.c b/drivers/clk/qcom/gcc-sm8250.c
index 1c59d70e0f96..44f6e197433e 100644
--- a/drivers/clk/qcom/gcc-sm8250.c
+++ b/drivers/clk/qcom/gcc-sm8250.c
@@ -3619,6 +3619,7 @@ static const struct qcom_cc_desc gcc_sm8250_desc = {
 	.num_resets = ARRAY_SIZE(gcc_sm8250_resets),
 	.gdscs = gcc_sm8250_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_sm8250_gdscs),
+	.use_rpm = true,
 };
 
 static const struct of_device_id gcc_sm8250_match_table[] = {

-- 
2.54.0

