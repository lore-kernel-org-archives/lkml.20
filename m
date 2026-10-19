Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F9BC549FC6
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792419189; cv=none; b=KI3UG9vEDyVxskN0AfJ6JCU17f3VXcnufyedLOAjJVfHjueEVj95h3MaVgX3lBlvI+KHtrlTaPQUILq5ytdqOh3T71v6NSZRUVZl1I+kA+6blzh2Ccdu7nEfuAkhQ7f4g0BqN9RgV5tHQGGz3ZPkhox/rUpgAisrpjj/uMAZINw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792419189; c=relaxed/simple;
	bh=3gVcQIhT09fAcsB3qvXmG7D9J+DdakkPSOpDrLcVQlE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JUTCR7moGCcTphLiOfuDfRBA9sLprNqG1RKaPQ4mEb8fUG52pOMVQfxZC7AUHOA3ry+frZchsiW1zibVR57AJdVLxzHOyVHGdFqGA1X3p6lHcDPvUeWApv6c4By+EIzUYpJhxYaWeh3jw+9trrVdQaH4mzi/dvWzblIZcNb1v5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KHBFcMl4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TDRj9vPc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KHBFcMl4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TDRj9vPc"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JE0inX1904125
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:13:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pLtHWfBddkgoG/nvomtFn3Iv3tjkCP7pSk+Fov92pXE=; b=KHBFcMl4f7cFUoS9
	BxWkXtLGmDNZmRoy0tKLFeBVP794yBB6dMSogITijzhCD94AiNEnii9sBdN3ydw1
	QI8iNUKj1pautX5yBr421pjCMBy1fZHE6UMaxNsYz71A7R1GnAVZ6ELq+TIqFH9T
	ES68O0A5ArPGJE8DsEzjhphdDmmsb/pASqATT4ZvL0TUGHGwRelnzItnwFJJRIhA
	LFlDQZIaezE+KdTT1FJ19taAMDBK/QuGFMg6kSk/X915LmNKbtcE1ZsR0H/9CTQj
	HEESTqg8Y770R/8Fa0CYaKvaiBqJ23Yr/+b1ADiOY9lFrFswT6Pnep0h8r2VYrKZ
	2pEtnQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf5c9j37-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:13:07 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e82060977so430529285a.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792419186; x=1793023986; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pLtHWfBddkgoG/nvomtFn3Iv3tjkCP7pSk+Fov92pXE=;
        b=TDRj9vPcjFuwtjUz7eLd2t0qyXQ2mQDYgT7u79G0T8dfzHa7Da2rJ/zE1jNUYu5wrx
         KxuJ9xWMwVplB+A5EaC7r/5wUd59F5ikWnMQ8xoUAXbC+EiYiF+ML60FRr06P6+C582H
         RIUUK8HnQyop2bHQP1PyaekfhSczGbSbPutSE9wv/bWkKTlnVaZtvaJDpe47JvOCTrDH
         QzZp6SlXf5zDYw1pst74iklWdviosKfAQ6sgpyZaqBsHAAuYgR3s0NR7pWqeojzdl75M
         V32TpjByESfPe59ogfr09y9UGQwaTPZedw5DDVU2dGyzG5IjLvGbLeHFra8rEF4k5VNg
         6b0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792419186; x=1793023986;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pLtHWfBddkgoG/nvomtFn3Iv3tjkCP7pSk+Fov92pXE=;
        b=EnRzCq+xvUvmnmf4oskbMxhVIPzsDzouV8CBUgSd+mSZFJowJIhpzfLzK/2oyca2cQ
         I7d8KLCvX1tH62QnYvh39xWkQMwUXzpKtEHxrsRr2aN6fIAZTN6AHO7fv1jlwGUUfthe
         7By+IUAfB8OJ5XoMJ2En/whwTP0QuXDTTQo+N+1TKngoCBX4w73zc4SRB9yGs687qHS5
         p20ziF1G70NqcV7dUp8WStbzy/Fi+F0Os1lqVpf/fk+XhYniO+6QCV4IRsX4DcuWtydN
         VviVBAUuSvGgxczOa7JuCM3IHZX350m/KTg+NEuLINn8ggnDhlpzpnOCLiKJ7OgMF/nR
         iAJw==
X-Forwarded-Encrypted: i=1; AKwUvBxOW5THABx54e4FMUh+5MS5aw/6facXgjuVWpnuBU4Su5+Hw4em2yxX3vQAD38Lmzd/I7PzdENTWsvy/9Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYJXc1rwQ1DAC9jisPbqPbGCcNCF6q9i2MoVd1wo+ROlUj5E1mI9
	/hvftFmkDyNN3U+GMN98q1VNkn/O3UKUILRe4kSsRdmghnSAmxncg50S6gR4q+fbLb0n7QbyZEp
	EIVO4utJQ0gPD1yHeRpLn0++vYoG0WnEiNPrVrXnO8NTTK3erdOUNackupD/grNf76Hfq3Sa4iQ
	c=
X-Gm-Gg: AYBFou2iihg64y4l8JvNO48Vwe1cQBqp5rYF5WJYsthoaP9qZSSm6OonUnF7B+y6CGu
	HhnPmMX3UoaJCkUpBJ0b3T8fY6TeW+JfNYh9My9deTSLgTothvTt3rE7qdZwuAhb/WOXVrQtJx9
	ZW+o9vXMiTlseZ4bmTghkaKUDHTednxXbWx2eeatr0qgi2U7VC/RZxoq/zq35ho1CTJGuQuS8D6
	+WR7UwrkXJ9OVzzXSrxggkPpTJmP/Ah59rytsd8eS6etZ5uCyCLdhY9GD6cUQAx1SkAijAkcK2x
	PczyW9UyJh/c5W8+41o00sU6gI5fpl7zVw5yCazkVSC2dbdvVm40OdoXh83ShI0H2qQtW3lEaMF
	FeSwuDivF2701c1IGAFJu12oMqqvzF2DzBsUiSfZVVY8A/EAbzWkmC/ItpkLladXgk/KEqu0EP0
	crphTyCCXMH/Uo
X-Received: by 2002:a05:620a:460d:b0:93e:c12d:4ec7 with SMTP id af79cd13be357-93f17fa8fb2mr1720514585a.39.1792419186307;
        Mon, 19 Oct 2026 07:13:06 -0700 (PDT)
X-Received: by 2002:a05:620a:460d:b0:93e:c12d:4ec7 with SMTP id af79cd13be357-93f17fa8fb2mr1720508385a.39.1792419185746;
        Mon, 19 Oct 2026 07:13:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be4a42ade9sm2015922e87.14.2026.10.19.07.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 07:13:04 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 17:12:43 +0300
Subject: [PATCH 5/8] interconnect: qcom: icc-rpm: Allow negative QoS offset
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-msm8998-icc-v1-5-c2da3934b6c8@oss.qualcomm.com>
References: <20261019-msm8998-icc-v1-0-c2da3934b6c8@oss.qualcomm.com>
In-Reply-To: <20261019-msm8998-icc-v1-0-c2da3934b6c8@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Del Regno <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Andy Gross <agross@codeaurora.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Shawn Guo <shawn.guo@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1186;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=XSbkD7GLqfFQ2B2fONaDMwmW6xs8qbX3ulO+uOQaQr4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq1iVhKnS4AJFRDwy17A6pAvMXYDnZzmi3C6BkM
 8sqtDTmEo+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatYlYQAKCRCLPIo+Aiko
 1XnkB/9f1Rqwz8t4IHAKtVkX5DcGOAk6xoWWZmjEuz1r4Ecuw46rnqUk1SepHbxQEjpQK7I8AoA
 T81JZqF3JwImaGgXzblPaQJOpCe9tUCjuc4qNEhVVVuCxQ5rtww/eVy8HVLyi4GrENUwMAqtHUe
 Fn5a4kzy/cTIH+X7vCkiKvniFcO9C/MHfsQ7AeTGaDYWhnIqe/v5zA+F6eIifQdhRBMUGPNnBaW
 5pJ1S8iP8dDFLxwR6yuLPFi2ywunLDx+VMZ582ZRpPI6/8KvEDJJfJjX2FlqOyX0q6IXQYkdA7O
 Spq3IawpKRpyB0vmS40Y/DqjdKtZ2LGmWexLBKdJUbbFLO1g
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1NiBTYWx0ZWRfXw2KQ/T+Zr4eo
 stwK2cz8Kq1J8M09IDwxg+X7eTIrqwMeriCjOYkmTs68CI/ipEsF4H17ro3mLVG6nH3yC4pvnvV
 HYdtQ3ubvEl0rdz/EyqjfRdTYkpStwk=
X-Proofpoint-ORIG-GUID: X6V9fawS4szNUxiXWDMNmMCxAehoi3F_
X-Proofpoint-GUID: X6V9fawS4szNUxiXWDMNmMCxAehoi3F_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1NiBTYWx0ZWRfX/djP6/FHaTSk
 Asy116UiBwQEhtf69F6VmkPFSwD55hLsXPMc6SNGx4PEj1PAKf1iDEyR6DjOW3bR6E4puBmT5fu
 Q708uAraI8gJpPWMaVIqZZi08HCVsA4FQsmIAXuNCYODBsoI0alpRaoU8thwcV0RQJevTmnTc92
 zDZXN4aDobxixnIm/ac6J4LHz39+zS4FmWM8wJvcNne4l8nw2M06BOtmONoRmeOxHhd+N/wjyLM
 jgCmOZm0R53m0SAYa3mJI/yGQSIO6IrRpN2/fOtOWQcs0JkEi5UmudCPj3GpV28vyEtVaZAhnsK
 tFT/bjJA+vcIO5ELdp1zZd3jby8NzLrhvJLsR5C27c+j4ZFZ3o+MPDN+unZRKXh5m3pcBIPPi8I
 H9OVJWYrelhpuL6ExyYiECCj5vBPE2A7QkmybmC+NcvJ0ua5aMY4QIXw3SDWkeh5cgPzMwP/SUJ
 pPbpphgfYMT0zjOU5xA==
X-Authority-Analysis: v=2.4 cv=K6O3jCWI c=1 sm=1 tr=0 ts=6ad62573 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=JPbahn2frZG3SgLLlgUA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190056

From: Konrad Dybcio <konrad.dybcio@linaro.org>

In some very very very very unfortunate cases, the correct offset of
the QoS registers will be.. negative. One such case is MSM8998, where
The DDR BWMON occupies what-would-be-the-BIMC-base which we usually
take into account with the register calculation, making the actual
BIMC node start at what-would-be-the-BIMC-base+0x300.

In order to keep the calculation code sane, the simplest - however
ugly it may be - solution is to allow the offset to be negative.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/interconnect/qcom/icc-rpm.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/interconnect/qcom/icc-rpm.h b/drivers/interconnect/qcom/icc-rpm.h
index d2c5f45eeedf..d0ffc042e926 100644
--- a/drivers/interconnect/qcom/icc-rpm.h
+++ b/drivers/interconnect/qcom/icc-rpm.h
@@ -57,7 +57,7 @@ struct qcom_icc_provider {
 	struct icc_provider provider;
 	enum qcom_icc_type type;
 	struct regmap *regmap;
-	unsigned int qos_offset;
+	int qos_offset;
 	u16 ab_coeff;
 	u16 ib_coeff;
 	u32 bus_clk_rate[QCOM_SMD_RPM_STATE_NUM];

-- 
2.47.3

