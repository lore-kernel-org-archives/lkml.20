Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E3A4E66B0
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554591; cv=none; b=TyUPk24Jjit2/DpkN55wHuQzCiC1cF2Sa+XN1yWVexNU+G0I20unSu3LNHxneHMk/Xx6lO5P6F7CqF3DfeSDmur3X/mH3oO+6/gJxmV0A4Iw2LwCoqRRPxVSNU9DYsCHD9eEijhvAtpfvkJxNhjOqJOWCEwHhCgT5qkYzxfAkXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554591; c=relaxed/simple;
	bh=9l1yH/TyKTh0nUOs+WYEyPBm3fUdzP6RQ05SEUY8blc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZzTGEXkilNY06oW1etw/dZp2td61gAE0fBRSdd/ItbaDnwR48wC2D2C6TZN6r1t5qgta4QlsKXIsg1gq4uFUC1Vu5yg+o7AM3PhYGS7UWfEAs5qtzjpUHSLQ4Wp/3iCEcH0hvLegdvtOrxGdmKqsHUXlXEgqOi/6Zp8GuOzhmxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=As8qx8wG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dDxiHwML; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="As8qx8wG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dDxiHwML"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G933qG2822936
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:29:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V8iVqh0BF8H+A5TE1wGLKJj3rQu75RTalRcZa+kjp0Y=; b=As8qx8wG8+S3Sb/3
	gPGLb5VJX2A4/Oj+P4fddEqQKyvh30zmEy6rmOrBsF0LbQVat96eIm3OLeohXxhf
	VpCoIReVHSCpx2TwrDFR1ihe97fDovm+Cs6loaEREXdMJ8VaqsmT0WIcA6PtNIbZ
	pOmum28gGREBxW82ivQLqnhZs3qm1UKixWxVPyv7JW8CZLgDadZ6eeI5u44qwXgB
	C4Dep6/hYRJCfgySnT3qdbf097D72V7JuQAqBaeP77jZl/Cs7nZ3wcLzwLSYo/Kq
	yEtGJIPfTx1ziTqDmgWxOoA2xqgLzY02svlS8GUKbGvWfk+G8azHp4BuRkCNrTt6
	4WHyFQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqfvfjb8c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:29:32 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-939f3426a7cso988629985a.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 03:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789554572; x=1790159372; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V8iVqh0BF8H+A5TE1wGLKJj3rQu75RTalRcZa+kjp0Y=;
        b=dDxiHwMLz6yXFpZ8UVPG6N2D37Sfyr/JpYyH+QfvREZMa8Nm6N7gw8dgqwro/If+Jk
         LgF+mMWVAOQE7Lipx1M5xPhIqC4COvMmpXuKNkTdaM3cecvj6MaLKzNwlt9EqbjX6Klg
         7Q5mMik8yOofQbIW1TuhA92O1PLyjC+B0lEu3k8P6lIqxmFWfkpDPX8uGNLliQxA+XhT
         k/pt5gAfDzAuUbV4qJ+d4cU6uWJNgzjYarA7xg10tfxEbYhnUkmTZLKfBq76aHpuHk3O
         QpBGXpNiVhm+3X8Erpsx0flf5CA7jPE8f+WJLxZSVTelKexCthmS8lnA+i0QEzyCkxHu
         t2VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789554572; x=1790159372;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V8iVqh0BF8H+A5TE1wGLKJj3rQu75RTalRcZa+kjp0Y=;
        b=LUIAITY2TEVEVM0xvmC2R9VzeQJRoLt0fWS8D8obyxJc8hgIftzwAZQ6vtZjrwfH1l
         9z3pebDiaJzx+iG8/OeLvf6W0xc5FvLubzC/qoZYPYNzr3YeAXJTpw9ra4ScAmV53y5D
         rTlEFWHAN+YZU7Ztd35reJ4/cjttML2Y65KAkcxrqPh1uu96kpL7Q2C41Ft4y7QAJDrl
         Odx5GOCx4dldy6tA4GGhEZ5VVjiwNh6aNqf+++woKBJy2hMAfXb1HSC6WkgEIpPwMfqm
         ohNmiT/TfD/dbK8VIaXE1BSjJxI3Bn6C4s91JFNAQdhzn5OGXlZ9dGZ7y5QXarZrJVEv
         iTkA==
X-Forwarded-Encrypted: i=1; AKwUvBzZB7jpmNNpwEHoa8aQb5Bzx3twSUnvGkr9ZNC3uQvRPf68UB/LurQwzLuzmNs/EDh/A0vaDXdZEGQvYyM=@vger.kernel.org
X-Gm-Message-State: AFuF++lZaIonfclW9K517Jr0TFskmj29PX4uPqFSU0uqWD2+oJLsNE69
	lZntHcCTdJlRS3XEpPIsEXelAXwjs3jswzxePEmS4+GkVEZYIdIQN5LbppmZFGZ0tXHBJnSgZ0/
	HyrJ2y3cFesCxVEmsa/L9EKNaqQdGfBw0udCi8siapixO4Slz5r1mftBswE5wVWN+nr8=
X-Gm-Gg: AYBFou1GkklXQ/tF/lJt+SVhNHuiGfdyO+Ds8OiZNgufZPP/YLKcxBfXFoIq3KwKXWp
	38Qlt1Nofc27ae6uJX1eyfMSDbvD0ATOV4vQzxO7IenGzK3VwJ6PbBRljt6YxqkylyArGEOT9uH
	QbUcGk6d9yKvPUnx7jyRm9mK8aWLGuXoENA8NIe95pFOhJ2O5vMO6smlITB5Mdj/4ZVaF+I07Di
	nwrY5zaIqSIN80oZgZWqxd5lj9oVAuZaxZj5rvG21x/km+1glk45UqnAr2t0s+oz2a0jw0guGd7
	GlO2pxrAgUpdaAdwhjoypKmLf0z2c9tXMp25UOPNozPIgZLaQAvR+fwUPJtYIOwbh4ZYdZYZJNI
	xOa5atsI=
X-Received: by 2002:a05:620a:2809:b0:915:a953:4b9c with SMTP id af79cd13be357-93bb76e380cmr318183185a.3.1789554572042;
        Wed, 16 Sep 2026 03:29:32 -0700 (PDT)
X-Received: by 2002:a05:620a:2809:b0:915:a953:4b9c with SMTP id af79cd13be357-93bb76e380cmr318179385a.3.1789554571547;
        Wed, 16 Sep 2026 03:29:31 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83dbb0c1sm71633805e9.14.2026.09.16.03.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:29:30 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 13:28:24 +0300
Subject: [PATCH 08/48] clk: qcom: dispcc-sm6115: Use common probe handling
 for always-on clocks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-8-25a24e50f82a@oss.qualcomm.com>
References: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
In-Reply-To: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1674;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=9l1yH/TyKTh0nUOs+WYEyPBm3fUdzP6RQ05SEUY8blc=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqm9S6BRQIIkNxjkcRFfOiKoohORO+HWCy340Z
 uuKMPWV1WmJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqpvUgAKCRAbX0TJAJUV
 VkDHD/9Z93CpqY6+tb/srAdImnb6HGdyc7Mmd3tZeHaweH1AJ4fTOVwDX5NA7FrotdT/mTHpCe7
 ZNNvPmkJW4T927L75GM4ShNmQV1CNEPaf8TxHRzj/h8UVrjAYA0DnE7W5GOuLU+ygqUZJkesB4V
 LFAHv+VqCWnEN93XFYIjJUQOiJMkF8YcqRmUa8j+Xx9pdXDdem6K1WARcIpl8utMIkHdykUAF9v
 u/rjpl/TAGW0KJ6c2vz54+onrdC92z9O5SFDPaHf74jhQnr7ncd9l7CEIv1OrK2YHqxn7Kj+PxE
 q1PFdnjtC82iOVd72clvFwZnt3bGKAd7J2jB/yEvN6UUzS7jlmcac9JUmADz2hJdzHsHg6huT3T
 1SSUVj/mcCG/YNHFdHUTp7x07vxEQxAG/Bm5yqJmqT+hCbssn080rnL7impqM2jOC9rlEU5reb8
 /MBOT3ECrmTdNNW1xlPdfBUxpnlKZ5VjjwSV3uadhhBJve3npcMCJzj4b3e7ntR98gQzT7kELka
 GkuH5hPrEBy+RSVxi/V/I95fsUJEY0/xEFgE2Nfgs3026HMGMaWWvwniTXmxTIb100uCyZ8hUd3
 JsizQ5CQ8GaheRudJpq+gdkYfC3fp2QCDyR8+t+V88hlA5tQCceOYW7m8zBP5/y3adxer2DWuZp
 whrpvzGU/Lx6tpg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=JYkpPkKV c=1 sm=1 tr=0 ts=6aaa6f8c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=zyovT9EyBzSEY6lazxoA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX4IuDalVTt5sN
 fZf5Oy+hlPW9/5dZZG5+qBK8/PCAX0Cqy5ZAB1E20jrh7RE8TCkbFyXKrc6/zSLDD2U/ZmXLLdp
 ogpKitBCdY8pwnqQPcljewIMEQoYWuxaPChYcZg9nHSnLkDrX0O41XD+gm9bsdGEZhsZmegp9N2
 FT03VHohP/pHnkabEf2pd7AYwi9F0DFpe/j4/HcGUejDsFoNKBEq8VQLUvkS7VqaZ9kAC/+KS4u
 UKkhvFZ+Ruca9giI99+s2lFuA4XIIvR/yyM0yIoKvN5Xirc+dpwVFFgpgFTVdg1dqUqkTZHefui
 9+/nmJ8ISQ9oA8xVd/vFbSnCAf1voD6im23GFOfQ9Bh9RvDXiiZPIIoJzpSVa5BZ4Jd6fMT8ZVb
 d9kHVpJPqk18cRaUXQECfvVc6HU6uNgz72x+wnkDo8EO00pgiEJ9ETBWbLcfUeePC/JRL906/5V
 1Ng/b7Okplgfwx5qcVQ==
X-Proofpoint-GUID: _AMkqd6KqN_MDRsMUaExXig5bMEkAEQW
X-Proofpoint-ORIG-GUID: _AMkqd6KqN_MDRsMUaExXig5bMEkAEQW
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX+WizQ49Q/UzS
 CDKJA/K6rVy2P1WzPYD0RUVt18Q7gbVCxZcyJ2ZFctrtMgTNstz5iHumVAH/63vXF91NFPbh8Ds
 JcX8GOvzVGLZCvkMfO2GdB3ETt9plxE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609160137

Describe the always-on branches in a critical_cbcrs array and reference
it through qcom_cc_driver_data. Let qcom_cc_really_probe() enable these
branches instead of programming them directly in the driver's probe.

Assisted-by: LLM
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/dispcc-sm6115.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sm6115.c b/drivers/clk/qcom/dispcc-sm6115.c
index 9a7b8ad646ed..f6f5edf07f03 100644
--- a/drivers/clk/qcom/dispcc-sm6115.c
+++ b/drivers/clk/qcom/dispcc-sm6115.c
@@ -561,7 +561,17 @@ static const struct regmap_config disp_cc_sm6115_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 disp_cc_sm6115_critical_cbcrs[] = {
+	0x604c, /* DISP_CC_XO_CLK */
+};
+
+static const struct qcom_cc_driver_data disp_cc_sm6115_driver_data = {
+	.clk_cbcrs = disp_cc_sm6115_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(disp_cc_sm6115_critical_cbcrs),
+};
+
 static const struct qcom_cc_desc disp_cc_sm6115_desc = {
+	.driver_data = &disp_cc_sm6115_driver_data,
 	.config = &disp_cc_sm6115_regmap_config,
 	.clks = disp_cc_sm6115_clocks,
 	.num_clks = ARRAY_SIZE(disp_cc_sm6115_clocks),
@@ -588,9 +598,6 @@ static int disp_cc_sm6115_probe(struct platform_device *pdev)
 
 	clk_alpha_pll_configure(&disp_cc_pll0, regmap, &disp_cc_pll0_config);
 
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0x604c); /* DISP_CC_XO_CLK */
-
 	ret = qcom_cc_really_probe(&pdev->dev, &disp_cc_sm6115_desc, regmap);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to register DISP CC clocks\n");

-- 
2.54.0

