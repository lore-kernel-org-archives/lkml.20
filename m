Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D55471435
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390131; cv=none; b=sI3YDWuMEh6thR8oY/EDQIjpF7mBv38Mqrl8hrHKCZl0IL/rWu5u7vOUcwS9ezr2Z6ghDCLuE6UzPJG/nkesgOCSlUL4KeX6QshbxKc5dm/+x+YlOias6cNRAr2XXJMnfVlgNHuH2giFtKsNzVpJS2riuLC1U/ExVK+alCdMxjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390131; c=relaxed/simple;
	bh=lBuQmicCx9kKDfiCB86KRK+iqsUsG3386wxixg0Ytlk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FtQHUHVwAkUubaJx417S4QX0qav60/QZipAUBe8GwF+Vhx1XaeJEHcVvgPlcuKdpKOGHrNsf5tbVkYx85F/o/UK/OHWKXgIASVRv8qjsJ127tO3JWZYnG7GPpvMhSk6ELFL+m7Dt7lXgS11GB0ep3sRDMVHt2WTzFd+l5Y6b2Ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HqAIwdcR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PbYS8k03; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HqAIwdcR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PbYS8k03"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAmMwK4032520
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:48:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xKi+gG2ggjAEODXLSMXJOgqgEydpvayKgshc1XUf2Kk=; b=HqAIwdcRCIq7NdbX
	O5frMG4Po4RjqrAIrzUgP6Jp6XNf0osb2To3SDD3oCRSgMpoSWG2ejh//dM4jmAt
	hab5Ne1bsTpnnTmPR7Y/zXwfKU1laGqWQ5Y0yzZ61+9Dn9023uei876YxmS49C0u
	Ikg/1pNcfHzn2ohhWTe3ZQqs+8sPPeoX009XreHls7dkjczlB3nlCrXaqOyYzu21
	UiXIHTYNZzP6Yv0Qv2gi+1bRgKMLzs3+6v0xHXK357dmk7YdnPopqAtXNCAqSI2N
	FslxsebHrf37Eumfeab9F1Cn3J9CvkpTu53/vmDkhlBd8Do1gqJgLdlescTBbKNy
	hkdJOQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpeuq8knt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:48:49 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-939f1847fb9so356390885a.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390128; x=1789994928; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xKi+gG2ggjAEODXLSMXJOgqgEydpvayKgshc1XUf2Kk=;
        b=PbYS8k03fA3c1p8oWK5jPkJRQyAnWrr8cht7pzSd7n3IOrjEjisCMb/Po7jVNwTm0u
         oHAmKZd1XI6huABNQyll4FbPXS9HwpaxgSHPinaIwrVcwS4Vsd4Dg1w0B40FBeNstcZN
         DZ3DRiJbZoNNyfMNu/Tptx6oerK6fVQFyUvzSYMVevPxl3BP4oNG+U3sBlZGEMr6IKQ+
         zr0puv2HXNwKVEvsbpLNEeN/8mcbSRsi+NGDkcXmpT1iXWcAtcAXngo1V3QRuKjwAF93
         0+w5Q8EpY1XHs9WyjlYE2H77ZBP+DSfnNnRu3UCCFtpyf+gtbyQydS6g8s4yGC0YnJhZ
         05TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390128; x=1789994928;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xKi+gG2ggjAEODXLSMXJOgqgEydpvayKgshc1XUf2Kk=;
        b=c11CbwyYT+mc0BpOG72l9FlaU2VeHE7UvRRDQxjz81glf4WAQcET0ZdbgGn5EM0mS4
         z7He8sVZai6i2r4BJLI1iXcEECzxkB0PjkES59RqGvFwDRvA/aprcByXXQL4kSeuPdhi
         NAp1DpEpi3LD5eoY+0OkrA+ZDJVklq4r4d7aU3B7hWdM0KT1WtQWszN1Dw4iQfCBACPX
         4lR4aWsFE6yVy253SredoiluncnAaFP605UcvUlaQF7SzXLcjAMBld7teDDggr4KRVil
         d33MPNYykRTvoG/C8+iwOSCZ81NoLwQSxVd8CIPa4NURE0RLOp3zzQURY+/ZbelDdnsy
         LS9A==
X-Forwarded-Encrypted: i=1; AKwUvBzsSHv+sUU5mF1uM6GrRkOUpV/0cdVMsK+/N0wSs0kQ5PASVjHpsFyLbHO+kRo9bAwbX7UjyRokQ+MxeGQ=@vger.kernel.org
X-Gm-Message-State: AFuF++melVGtxImvGjV6GZrYfeyyMEtQpQFMQqGolhyXN1lRBCA/gZmX
	Yj80o8Sf4W+2+5jepworo9bKqBR/5xaUkp2260Sl6BFnJa7BwmJJoIDYq6e3a75jP6XSOoV9aUF
	vdLxIB+/PvCyACTDu42Z0ZzZudxsjPUYuH9Ct55Tl4him+gRuv9T4orLpA1VEivEb0LY=
X-Gm-Gg: AYBFou1Gjx1V22UVBVHN9ditg7lmeeiX3G8Dxcl7UIkgxtlMPHhCkpP0xMaxDoWP67W
	fOsSTNKMPchQun/lmWw3oKG10kMDJFlrxtdTo5V/qskVRHdfowJcwxZPJwc2vAOXIi/T6T+Btez
	j/KDkopbvDRW1cchmgE+uIgARaSc/8zra/O5vC9nA9VcI3BwUzNX/Enk+pcXpxBVuuetJQd3xyE
	bl/SQYckZRP+vgx9ePNOoY78cPCrxJRx8U+2wzWFec7KiCaQdt8c0ZiXgpqZW2MuyfWX9I9Oz6i
	rFSiYjIZVSX9TpdQNotzMK4nTETc1DiQJdM86s/w0IZUnCEwglZ54rw1EQnrGKQ5f7tbxHMBl3K
	PNOuPR7FJ
X-Received: by 2002:a05:620a:44c7:b0:936:e18d:763d with SMTP id af79cd13be357-93a2970994cmr396054385a.8.1789390127919;
        Mon, 14 Sep 2026 05:48:47 -0700 (PDT)
X-Received: by 2002:a05:620a:44c7:b0:936:e18d:763d with SMTP id af79cd13be357-93a2970994cmr396049285a.8.1789390127389;
        Mon, 14 Sep 2026 05:48:47 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.48.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:48:46 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:16 +0300
Subject: [PATCH v4 17/52] clk: qcom: gcc-qcs615: Tie the CX power domain to
 controller
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-17-9d5a606ada33@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=826;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=lBuQmicCx9kKDfiCB86KRK+iqsUsG3386wxixg0Ytlk=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+zcjEQn41t+3qll1xyYfMehJeeGGkSjblD3Q
 9qOrDr8aCOJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfs3AAKCRAbX0TJAJUV
 VgkFD/9TB+JcaDNWggqvjgt/8nFyIp4S0LIg9yfyt/oDiI5AJr9q8KOE8IAcwMHVc8Uzb6egOnB
 jl/WCozPm2iT7eaqWOjN3Q6CH6247evWOo4aSkalzOA87r5DwEc2MYD8bhKuRV902p0yg/BB9Vz
 4GCibZf5l8C/zIy2Q7h/vtOtMaaYehzC3TQssdLxcpuuE6si2DJdAE13jRmKetGC5/37CzMmAww
 bc+TzuOh6vpeUZE/5/9NacLng1t4/T1Xxicc8epVjXYeexofT9afvbu0AGzQSiYuhQF+rqfkukT
 QxxPBds/eLKqdTUbwnGUhE24yTTWqErhYMMNTcyKJNif+WsZyBZc9xb2fhIPDRk3hcqc0NLr179
 unuW5UdKDHHtQ7ruj+zx26s7/39m6j7TOQ+PEw9fLXhgURFG+r4hgOlqJWfFbA76ALp1e5wguAf
 UsBhhE1cVQK3MTcgxWABj4ZgdnHO6KHtGCQqMGEb/kRYSY1YojxsZXii8a8xWkMkOZzyc/nr7K8
 Kd0OKFuPl2pKeT0hrpAl3M6aPNKGV4h+r5vgQgVIFknugB8t7CqXdzmI1ig0p+wZAxndPGgEdrR
 WLZBMkU3Z8KCoyLPdk/3nJVL8HtIss9uspruQUhzWGfho5ADsyWw7HgHwU6GukKw5Iy1XgAQ+M2
 oJXqgyTZ+1bXyiA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MiBTYWx0ZWRfX6LmeHyIgx7hc
 JEyhDz4tMABn4g1hllJIU5Bx+PVF27bnn0bbMNMF21VQpVX8e2FMZ335vDeE9nCxF/MghLKblZ6
 hdd3dHtIZc/q5vvZd5H8GexwclzdS7J2SrU87rtC0IjbrwwMKD8X2Y31s14zO6fl9/9aO0NdpKu
 8MQmvth+VF2zNN0Uv8lD7ZvlpyQjXaRw7G9nXP+pDS1yZSsR3nOZwkc4qciQCkD5OFw6Osdj5Ce
 Ug0pvj3f+VgfWdDrlWl+SoupJv7bEd/067unbBuHgkJPE8CVivcUU6sNpYtJzHHhRJBxmzW4P65
 cHy4/WY3y+WCCT1nlXhylHTfpsCWmTA7JDu0r9hh804rIv18Qk2zgvlbm4waGD9IXuykS5pqZHc
 nhf9Z2DzPfj8xmCHmylN3DUWi3mQo22WkdIMOp6UVYIAHk/DtaOZ7kgSbPKV6RK8txF5QM5DK6N
 /s9RzEgW1mciflRjfoA==
X-Authority-Analysis: v=2.4 cv=TrFzFzXh c=1 sm=1 tr=0 ts=6aa7ed31 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=ESHVkgNwe3RMy11JppAA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: O0r2lgTBKSEWk19zbWasVO7KBzOPwDhp
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MiBTYWx0ZWRfX7Pznc9BYG3kI
 zTKvUPvEMMFdJlPjCOfdeYQYbiBG6d/SO61S5f+/z6+NnV9tjBPgG9b9ALVBki0FUPBU8Faao5q
 T/xEUGxq910MIOEN4yufqVUNe3JjVt8=
X-Proofpoint-GUID: O0r2lgTBKSEWk19zbWasVO7KBzOPwDhp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140182

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-qcs615.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-qcs615.c b/drivers/clk/qcom/gcc-qcs615.c
index 57f8c80c6f32..914a49573811 100644
--- a/drivers/clk/qcom/gcc-qcs615.c
+++ b/drivers/clk/qcom/gcc-qcs615.c
@@ -2968,6 +2968,7 @@ static const struct qcom_cc_desc gcc_qcs615_desc = {
 	.num_resets = ARRAY_SIZE(gcc_qcs615_resets),
 	.gdscs = gcc_qcs615_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_qcs615_gdscs),
+	.use_rpm = true,
 };
 
 static const struct of_device_id gcc_qcs615_match_table[] = {

-- 
2.54.0

