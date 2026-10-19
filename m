Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 371C754836D
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792419184; cv=none; b=J8rzk700tPgtjRqNAg7QjjyOukayen+DvSh3hSVQPAkH11qtawglcy4cBhSo0RVfUBa05Fst+JtFAkF0VFuLk+RoAn1qN2M7+RgoEJojDOEVmSf9WKY8JcnT4hJF0cXU81HEjygumz36pfcz5xVKFJKIFIRWCCC/UBEHr8r6KkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792419184; c=relaxed/simple;
	bh=idgzPl5wpzUwvBNLavY2SQPwQH+NOq9RmLETDxd7+U0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UZPepAn9KImpXx/dNxL5kj7xFQKvqF33FnAzbPW6F1SueWPbCWJ+G29+/Bs8GR7AqPaR8krZ/3tGdRUwSJlcSmyrxLjAa+4YuW+2tdjOfsvvm8gMe2YJBrAxrZkqwKIUOSK9xZeOMwJZADOFsUsvWBv3j166vcCIH1/7pWHTlFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cxfSPaft; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d6MWdRzE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cxfSPaft";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d6MWdRzE"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JE0hNr2081797
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:13:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zbq8Yt2YxI31tHZSOwBFkW6HvTaHTI4mj1MProlJx80=; b=cxfSPaftt8SgLe9S
	bay6Yn4wW1iPbjHAt0ID4NRSkJu9lzyANTcFwb1Khapqkzhg6P0GJgT1n8KOhVaM
	GRS2+cRl/u4W6W6xG1vw9ok9bzhh+uCltcIabyRzi9UUPfS/l2dHgZKwYLFT6OHl
	u+pBJj1qSAQJXoB9iGiPo+B2pce/h8zpMRWi9IoNW2x23v3EmrzKF2Ndcft1DWCA
	9vqlZZv4Hkgx8nnHoYRsHY24F/dzx6Zzaa0gNaRd3YAz/DlCc+8WjKcah5+b/KNt
	andGAveDjg0xZM8C/7sQO2xqVBhJ45Q5ZKOaoUbbRrUcLjEk5TImxoNh4cfAkcMa
	pZkIRA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf4rhhqs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:13:02 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-939c30aa9a0so236357285a.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792419181; x=1793023981; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zbq8Yt2YxI31tHZSOwBFkW6HvTaHTI4mj1MProlJx80=;
        b=d6MWdRzEIwGL1tcSC8gpUQqNA84kf6rRMbdm4XvdMlMlwo+YYOBGs7vFbSgbrmgy6A
         GoGD8OYUVOJtZ9w+gld32pjrdL8BX06Wvbo/ATHOHH03Rthp1j1YuE8gkwtPEBaR0yRn
         lWOMW0btjCQKtB2VvLIDw/gZ1R9axefI0sRaP5q5XQgDldXgSLacQ32RqB+hjLJ0dTjs
         qSOI7i9zsWqy8Aze7dMRQKpdkWB3PexoReaLD7WO1Q1RlfVyEyAV2/gTtWSGKhzio50h
         RykWG7flOcbP7KnGTsqwnJXXIOaQMdpb7S3iVueU9JJ9QvvkMXvt07rWfyFJS+aHPVr3
         8vfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792419181; x=1793023981;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zbq8Yt2YxI31tHZSOwBFkW6HvTaHTI4mj1MProlJx80=;
        b=euOzM6i/57ID6/n4qyZoMryI+hruiN86+xdHC0NfOlY4F1Ei6KpAUk6rXN3HZYa2Us
         b5vpAe4KPMLA0rRHWV7nhM0dYK6rOQrC41/MPDO5bHDfiMaXR/9D6zwxA8sJYXLRwgah
         Z5qTo5LZzuBMveiMbBvl+KS1A9s5bpFXFFl0QG9RktdgodCIWGs2gn49bl9FXb/HFyMB
         hKkc1L1/P8Z9eTyld7p+VsZmCmiB3Q8uhr7/T1rXzekyWsZLYL88wd37plLJMl+O3AQy
         K9zDJMq6FESq48ch4ZKixbR4TycTIzL/nUCvHGmw6p6hYqH0TSTvT/LaDlPBRXnTwxwY
         BeBw==
X-Forwarded-Encrypted: i=1; AKwUvByeu+kG/AwaGsxzwEBAdY2IAfFrYJQvvtFH15KuP+hwPsiamdm+9Xs3nJxqAdQebPvSRLOpM28aP254zQ4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJXTasOfqLWmRYvVoGAD/MtSrhSeWw/WuSIrWy0TGiyUvH4nN/m
	Dxp9Sh3AfvI6p0LdQhpIesUdRH+aGosRQIKg7b+j7uAQdna3Ck5fF2Oody58Ay/tJwbayoH9tYp
	Ud4P1WpaCs84XzP27bjYjCNx5X5Ixu9YH1ZSGVIMPtJubw9L7bqjf0rS/TUcR7MRGLnWBJkE1AH
	U=
X-Gm-Gg: AYBFou3ibs/N2UAfkux1+hUBV+Z39hmsn1rm4qYqFMmGcE/V49XrWDg8yTDWNWW0zcq
	9RNClzy4SjFwxDpcLoUzqLpBzAu1qYTcdFxRqTmdeUbhi1/4ds21X+sLuEqunarCoP1aOOSCmPH
	VqUopPjl6iBzLpSPxTScJeo/Rx1B3PXtTEuS8Bp6Bvtg+VDbiJpyRx09BWRYz9ChFy7DQwgEQQr
	yoHGBSz2JHT8bEAt6TmufUtIxoHtYzW4yotWbO4gmHVsrh3h2mZVgqKVFuTDXrDoH4YlkfM1LBt
	/SO4tJQsD9LlZOabTX8r13gz1QqI5imZTje5BFkt2/3HIaXcekLlaIbXIuAZ0sOX5mnTG4o9IHa
	CygJsEawLBF7ZT8z8V6JJCPkN70FiPwyq1W6Jds7Qa5mGAhj88X5O/S3GIdOeyfZO0eHLaah+V6
	4NcsJKkwQXM7Nr
X-Received: by 2002:a05:620a:4613:b0:93e:e2ec:3bf with SMTP id af79cd13be357-93f29defe1cmr1269005685a.78.1792419181509;
        Mon, 19 Oct 2026 07:13:01 -0700 (PDT)
X-Received: by 2002:a05:620a:4613:b0:93e:e2ec:3bf with SMTP id af79cd13be357-93f29defe1cmr1268997485a.78.1792419180910;
        Mon, 19 Oct 2026 07:13:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be4a42ade9sm2015922e87.14.2026.10.19.07.12.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 07:12:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 17:12:41 +0300
Subject: [PATCH 3/8] interconnect: qcom: icc-rpm: depopulate SMD RPM child
 NoCs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-msm8998-icc-v1-3-c2da3934b6c8@oss.qualcomm.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2002;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=XyLHnw2UNIaQ9sIQUUT8rlJwQ+6O6M0CyqTbcK0TVek=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq1iVgcZDBtlR5klLPSH5gCveEoco0B6gqZNePP
 pFRKcqC28KJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatYlYAAKCRCLPIo+Aiko
 1S5jB/41wVjIHEVlUkP6+bYQMrw+IcgvdbmTt23QhLcGxBOdQQ7YDSg4i0UvU1l/wXkn+yGg8nW
 9KD2Eeb3r1vIphr20XJKZPjfkKTbDdet/pwZG3NL8B+Y4wMevQlu2F3MeyIQ1avFVJsXpjCMHoT
 TmtA85jGL1En/Y/DyPI34WIV87BZD9ncPj5qkmZYrAV/0pweUYTCAqmgRiQoSrA6oj5T4pzQr3n
 BLZhv8nDG7SJZtlham2yqJ5+gLJjrR97MV6QzPqn5+OWxiVckR6jNBv4Ti+8O8NYcNFLfPb4m0k
 cWKXl0qvxvy7Tibz5oR8FFlHOKTZH31BZ7ooP78a2jSjPvFY
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: R3fhAs51IkmaJvH6EPv6Fb1oTnibhYuw
X-Proofpoint-GUID: R3fhAs51IkmaJvH6EPv6Fb1oTnibhYuw
X-Authority-Analysis: v=2.4 cv=H7NOUOYi c=1 sm=1 tr=0 ts=6ad6256e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=2lEEjgNiNA8PrC-_0tcA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1NiBTYWx0ZWRfX9MpSkt0izH5T
 bxHokTobezYjs6M4vlMQwnDCV7oPED6KpTt6cGaCwFydQPBAM73fUruG7uE+AfHVpAzBdbt0mTg
 vy4BYsFbAnN7l6fcQrDnhwbG/x6RrrSY/1u7Xw5QISqyO5Nn39cPohjNhF0yLN43Lbes0e7VAar
 mUQW5meEx2x1Snw7Zs2R6FHLK4tXfNRirZnrkNCKGG8YKYBOzaTmmi5uIDxeQYKvIdIhjlwxChG
 WykDRKLlR+0U9ZZOF6HbGbgNYkp2wqPFu/AipVF0wieoQhazGUEl8Pyu3Uh1XEwCU0CUMGkX4Tp
 CSxqGMICgEy8MyGZ0ehvGZRitT0ZSTlKmQrMnaYS4TJmqrwpuE98YV0P9Q//3Q5V1/+fu69fdZq
 iTQ4rBwgywCmQnR5FtC0i66Gaq8fjy4fPIJa63XwUeZVi6P66Mlo96IOcpaaLUQfCCK/WtYMN+k
 3eyRPo977vuczweJ77A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1NiBTYWx0ZWRfX07Nn78/G+4xr
 mxsw6xhIrJGmIlK/p0YsFL1zmtXjTm9q1qsl/+VS7ahzmK/EwWh7bRihy/KazzrwcoaIEqG/xJt
 R7k4I0Y1yOsgq04vfO+Lw4cQfOpKlSY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190056

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

qnoc_probe() creates the child NoC devices (the QCM2290 and SM6115
virtual NoCs, the MSM8939 SNoC MM and the MSM8998 MMSS AHB NoC) with
of_platform_populate(), but nothing ever removes them. Unbinding the
parent NoC therefore leaves the children bound, although they live in
the parent's register space and use the parent's regmap, which devres
frees together with the parent. Binding the parent again does not
recreate them either, as their DT nodes are still marked as populated,
so they keep running with the state of the previous parent instance.

Populate the children with devm_of_platform_populate() and depopulate
them at the start of qnoc_remove(), so that they go away before the
provider they depend on. Leaving it to devres alone would only remove
them after qnoc_remove() has already torn the parent provider down.

Fixes: e39bf2972c6e ("interconnect: icc-rpm: Support child NoC device probe")
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/interconnect/qcom/icc-rpm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/interconnect/qcom/icc-rpm.c b/drivers/interconnect/qcom/icc-rpm.c
index 6f325789a96e..ddc7df31ed33 100644
--- a/drivers/interconnect/qcom/icc-rpm.c
+++ b/drivers/interconnect/qcom/icc-rpm.c
@@ -677,7 +677,7 @@ int qnoc_probe(struct platform_device *pdev)
 
 	/* Populate child NoC devices if any */
 	if (of_get_child_count(dev->of_node) > 0) {
-		ret = of_platform_populate(dev->of_node, NULL, NULL, dev);
+		ret = devm_of_platform_populate(dev);
 		if (ret)
 			goto err_deregister_provider;
 	}
@@ -699,6 +699,7 @@ void qnoc_remove(struct platform_device *pdev)
 {
 	struct qcom_icc_provider *qp = platform_get_drvdata(pdev);
 
+	devm_of_platform_depopulate(&pdev->dev);
 	icc_provider_deregister(&qp->provider);
 	icc_nodes_remove(&qp->provider);
 	clk_disable_unprepare(qp->bus_clk);

-- 
2.47.3

