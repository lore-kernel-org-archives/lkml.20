Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA4054489A
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 22:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790115119; cv=none; b=hwtPyXCZK03g2C65oqOpHY+ZpIl1Q3tYmykrVRlHMe2dzfxp8LqABYr1TDuKT/F3qobMj334Jx5wcFTQB1kqVpaplXA41oN3xE3KroQPqERkCjVzfRYjL1I9g/RL6BGbYDwnXlFkjQ/RdiFq4h6CQGP95TFFdFSKZYC3VfsplPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790115119; c=relaxed/simple;
	bh=D4fSP+2I7GV0JaAbRIzIFwfvzVtsM7z1Zzkl1nD9slA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BlAhUqmd7EP+9r3zSkULyfM1w/ztcFup1k7dzeggtN+V9deJh4HNTdJvEaXQrEV8d5DkOyipgTX+Vb5LGzZ32I8bbI60nFrQ8CL5GErGyJZ2QsSyaGwrzzMB9Hg2iD9JpcrmjWQG8wcfm2WopiF9QIe2kcYOJnaKBuOqljQUj28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dDoFKJhh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fA5SnZnn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dDoFKJhh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fA5SnZnn"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI7EXa1509371
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 22:11:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=WxXkdQ30yeX
	+tTvtNyi8jA17VuX8zmbTuee7qWRRWmI=; b=dDoFKJhhMi1PktsvbOXiMfvxStq
	LSpXoivaPOMrjsPwKNwQ1IsPPPFzwwFHXjbG7TFeYC2ozkL1tRIW4yYFqPwDjxIS
	HE9uqZ1Fa24o67a4dnEZcVpIlHxoKWLkKClGgmJrfMZK1h8MxbXdpvAT306wmv/4
	389ufXH9PFfUhP4adnjY78tjA/8HYKoQTPl4/B/Y0GQ7Re2expExUaG2EU9F64y9
	CaisERXqJSNoETLAggpXdDO517wFxgISIHxKbG1M0WPUj79eBlI2jGuMgdjHlSa8
	wzq/Brv0u0ALMWlEAxR3bG9buG9BAdD6Jx7gnqZBFQQuFxQ9alsPKKgJDwQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux7xsb69-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 22:11:46 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-78580a6b2fbso215478137.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 15:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790115106; x=1790719906; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WxXkdQ30yeX+tTvtNyi8jA17VuX8zmbTuee7qWRRWmI=;
        b=fA5SnZnn0/tCzDG6WLdIY0/UoK3EgeJ6ONqksrH1pepVtNV0wS7ic+eaUNU+JFFG2z
         tq3GgUkMRjfza8oazdOaIR3J+XfWqwhOHMobx7B88RqM+EiHmQcneu3eOuAn/P2Ouepc
         PMfqMk6TTMpbBxV7MuIRuLM4cW/yIf1u4zOt3F4VgEz+JDLD6Uhgb+D7lZCnqeZIB9JU
         LIha/qJuAr6mkESK9NCDx/SQrzAQiAyZ5DA9TeVq79lS7KBkszxYvCPcc39v44oYkprO
         fjuaTgI9OXXvacGju3XdKoUXD3oGE4FvqtHpZt+kBhHkUpsYoNcYkn5qR0zDSRrTtvzS
         CBhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790115106; x=1790719906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WxXkdQ30yeX+tTvtNyi8jA17VuX8zmbTuee7qWRRWmI=;
        b=hxvQGXoN+Gwo+t16knpR6ZrerJIs7Ea1RoLrGHa9VvnlV1HMOnAH6rbKXuurDBK+Mo
         DmIp0poIZra2mYIz+3h/t/mE37l2BA3O/FGt87zF5N46ut7kGNeAmiX8Lc8EArR4fctu
         2hhEmpv24Qpfo/aBAc8+wf0CDet6E9IxClFUD5bkYqMuhdKISj8jspsOT4WNXOUwZiIC
         mF5+AzGEHgaEDkWZJtE7CT2VzEDXe8DqGFsh6b9l6I/RehZ7mllNv28NJhu12OqO91ib
         Ej4TfOGkqDV8bWJFbpW+I/23sz19Vi5zNsNS3j0g1U7tFeEu0hMxtUn7hEljqmICm3Li
         5oLw==
X-Forwarded-Encrypted: i=1; AKwUvBwI5nd08A2fCMad/dVq5N+sgUx0BAGYkk0bDYFFxF2yZQ+2Cqe+Rr0e5rcsaoo7ct/6AK66CASWsWQ2Npk=@vger.kernel.org
X-Gm-Message-State: AFuF++l60pXx+ydqpUwtRuvkaht9gx1WKIAJtGIGItRVAm+HS/Qj4UNY
	FYNXrUGkd+o13+XebSf3S9FWn8ydKTYi6auDx77UDVpSV96NVK/FF1/z0arWPGzjk6sDpUCtSwt
	XMO+8zba1Yug7Tm7T84mT9I6qIQGFC4BOLyWxGW+1FHCJg8DhwHD9kHT5Eg62lTshXww=
X-Gm-Gg: AYBFou28Hef7XzcImvyT5VZzllG1VKkgppqj/IQ7YFs44A5PLByyPpacRLAO8j0x6ao
	knz8YrxXqRbPdQe2dYKSQzizmSAgZA/tnDX2qJcp+ASdmQrkQpFrkWho93vchPId50oEQ3+9shE
	SytYAZmF7Wp3PP2n2rTHd0LVM3r1BqydGxUl6nviKFLb1kixAb4a2lx4A+ljQrugczm+C5ptALl
	hWkbcGvG6lD9lpv3AUYyvU+aygeHasRI2ni1M4LdKd92pnscnSZ/tmMiMyCTsre7RG17VojLSsi
	KTX/zv6i83ppAz7kwdcJ9jxEKn3CsIMO06hVchdFZe++dfzKhES9sGLGY8XftCoXKkwtAGwb14P
	aKPcj/pENEB36UJllD2Alnp384vps9wcZCEZpYOGQnb9LYK4R2233tFsJD9kMCOI/
X-Received: by 2002:a05:6102:4410:b0:7a6:b18e:6d5a with SMTP id ada2fe7eead31-7ac1cca4288mr948346137.17.1790115105821;
        Tue, 22 Sep 2026 15:11:45 -0700 (PDT)
X-Received: by 2002:a05:6102:4410:b0:7a6:b18e:6d5a with SMTP id ada2fe7eead31-7ac1cca4288mr948323137.17.1790115105365;
        Tue, 22 Sep 2026 15:11:45 -0700 (PDT)
Received: from debian (cust-west-par-46-193-35-178.cust.wifirst.net. [46.193.35.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-488688856f0sm1400270f8f.30.2026.09.22.15.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 15:11:44 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, sboyd@kernel.org
Cc: dmitry.baryshkov@oss.qualcomm.com, alexey.klimov@linaro.org,
        r.mereu@arduino.cc, srini@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v3 1/5] clk: qcom: fix SM6115 lpasscc register offset
Date: Tue, 22 Sep 2026 23:11:23 +0100
Message-ID: <3a4e8d1115a46c45cb34193b6ceeb02891fdf716.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>
References: <cover.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: PfNoZu7RMJWERldqmrLHOALDrPehh0au
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDMwMSBTYWx0ZWRfX4ZU0l0WrD/zl
 cFdy0aetKLUgSlzEekrB909DRs2ZGsw/WJZ7ORXRjRfztgL5jhDJqmwU85v8d84ONKBxHgiDbq/
 tPCMxoafMMHZQrnB6p+tE3O4LC0JsJAsyPiwW2pcPDACUkITWlZ2dZs6cG2ffMX8iuYpJc8sU5e
 zKTXA9/f0gjh1naSvPPouTEsitqXPvKbyEbnsbjRUrhbikVYyzfG0tB7drCVPU+7oC/TDZ5cEst
 xfq39/EibIuZNH976LhuDfKJrEArykRHipLAbl/zuGhj4lMDjGBeH1f0I9kQNc4RAc9wFt/vb/+
 lHXLlLt8lMGKACEV+voWqQ3hTwKefLESUEr+Opv2g96N7InKANmGugIxCrnMhgb3L6nQtZOQEJn
 21RAaK+DNz3ceX+ta2xmjyHAjOyObJMPJPB105X6Eusn13UTkqhEH5CxAdJf+8ujikIs2CVm1Pc
 Q7MDbrfiBNIRw8aUm/w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDMwMSBTYWx0ZWRfX3OHW0rEtLpVi
 /Q8AyYSG7+VnfVdEjBZD+M+HufiG/ru0AWVSF4vIyV48B15nhKWBaS0qwQRXg2yc4WrSDT1DmI9
 1ac6J7FZ6Rdl3EhCg5L+XYmO4WRWKTI=
X-Authority-Analysis: v=2.4 cv=QsDLTlyd c=1 sm=1 tr=0 ts=6ab2fd22 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=Hji71o54RgNgZYqDgtlrhw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=g3NoBr1hRuMCkkBryE4A:9 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: PfNoZu7RMJWERldqmrLHOALDrPehh0au
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 phishscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220301

For some reason we ended with incorrect register offset for soundwire tx
controller reset and the regmap register max was also incorrect it was
0x1000 instead of 0x12000 which is full register range for this IP.

This was somehow compenseated in DT reg property which got it working so
far.

Fix this by correcting the actual offset and max registers as per SoC
documentation.

Fixes: b076b995e225 ("clk: qcom: Add SM6115 LPASSCC")
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 drivers/clk/qcom/lpasscc-sm6115.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/lpasscc-sm6115.c b/drivers/clk/qcom/lpasscc-sm6115.c
index 226dc02fc42d..fcc1512d4a99 100644
--- a/drivers/clk/qcom/lpasscc-sm6115.c
+++ b/drivers/clk/qcom/lpasscc-sm6115.c
@@ -34,7 +34,7 @@ static const struct qcom_cc_desc lpass_audiocc_sm6115_reset_desc = {
 };
 
 static const struct qcom_reset_map lpasscc_sm6115_resets[] = {
-	[LPASS_SWR_TX_CONFIG_CGCR] = { .reg = 0x100, .bit = 1, .udelay = 500 },
+	[LPASS_SWR_TX_CONFIG_CGCR] = { .reg = 0xc100, .bit = 1, .udelay = 500 },
 };
 
 static struct regmap_config lpasscc_sm6115_regmap_config = {
@@ -42,7 +42,7 @@ static struct regmap_config lpasscc_sm6115_regmap_config = {
 	.reg_stride = 4,
 	.val_bits = 32,
 	.name = "lpass-tcsr",
-	.max_register = 0x1000,
+	.max_register = 0x12000,
 };
 
 static const struct qcom_cc_desc lpasscc_sm6115_reset_desc = {
-- 
2.53.0

