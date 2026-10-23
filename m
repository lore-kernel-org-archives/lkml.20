Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792769355;
	b=QIzwBDtoHTvDUrU+4YInbrNKCJwRWrDr6vxgGWdGsDAA+wdbCCqxzXU4wwbXz/GMb7W+
	 shPkJICkg6Wpf8BQ1NTqXHJyUelTz2qdn5vdH8LN1XU2QHc0o/v6mstjlrIMzXuCmzCsd
	 avRk267bJsQnuLAwFYhJ8p84/ivBvXnZ/HFcp51k3c5T7Di6Lepp5TE/Yb6l/kyux+/hp
	 nYt6EPcV+TL4XpmSd267kjnEHdS4xYQ4oJw+VZ1u6ULjq6mFuqwgnznlHxsLog9SB4f/U
	 cB2KEZgcHWgKr9zMNO1cIbdXHhOZqBGq62i4EYpQT7Nj9C13hwJ4igzg4MylKGgYbbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792769355;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hHHcAQPfZahhxZFJn/s+xEtK12OIVnJxh2g2wSCkHj4=;
	b=XT4YLINacQC08Dwz+yZ1U0RTa4n/pHc5XE+167NhMF1vGJh9llsl1tUOUbZVKNajX6bZ
	 rF2QU5BZcN6aBIlMMlYqkE9hFbriRb0++m8L09H+0kNVnZQJGMw8xw9JeFGUph2v4xYhW
	 eChtWcWdxCPvkJBxYypfkQBd7hW+vc1FpECevdMnNsgoh2LaOzc6SiS4HpNRVWeNue+rR
	 XK30D1u83dcCi4jv3h8G3eFdisGc3MSupfIliEbsiP+acB0JeY8o3O7arNKdTwpaBrLN5
	 Cx+OhzGD6uLJeEIzPo0VYdzmom3VKK06a84ZGAwtCFDBb9czBcO2v7E28ciaY5tmjRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nAxuM+CW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fG0RXALB;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A297606A330
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:29:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A297606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nAxuM+CW;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fG0RXALB
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE6Pfs3000292
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:29:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=hHHcAQPfZah
	hxZFJn/s+xEtK12OIVnJxh2g2wSCkHj4=; b=nAxuM+CWplogxlLs11krXNiOTxf
	BVvteGg5rpja93tkYG/pKKrrkUGHe85qk96aYqJ4NIG1R93Klv+HOAiJO+PiBHnm
	/F3NhUM1T7BbFWPObD33876BB8D/TYuWXfa+l7BkjsILC+mECCzbDvJcwaHw7Uta
	PhS+SPP+7OzAUv7GJ4QWirKVlqajN9rTlzfbR7WLA3X2qodpcGyOaKr/wqphelGt
	k/N9U6PDfZdcm+GTBjStHhrABeoALmonOHdmHxI6mbcrRYabndXgMHZtMmG6ehy7
	o5OfmPzZ1u7/udqrKlJAk3H+XCheovndHw/O4nsCVdGVmGqAn+rycNaMFGw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hg7cn0pqn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:29:13 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f1e62510cso248662985a.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792769353; x=1793374153; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hHHcAQPfZahhxZFJn/s+xEtK12OIVnJxh2g2wSCkHj4=;
        b=fG0RXALBIS42dTsVcBOP+McjJHRxv0uXsfG837XPgl6A7cVM+kOUQX70JIv4OZDcmi
         7+kU+i4pJtmcv29hCHQbZgHJ5Wphgu6LVjqASdvHl9SrWpAO1nKTKxSj13tGZWuK4MXw
         SBZk2YIALp+Bnj6c5yMFos9QxCaTKVNH4DQNYaaajNM3WIQz4RCHdx+JEMfvJ7bQZWNh
         CyQyNxnN3si2VR2LqDJx2W/gRPCm2UefiCO692PdXsCNu10+XM/YVVYSxtRGzvXwlavn
         bHwekqhll1vm64ytpw77F29aas+pgaGcfffMfGtpykHPNvPjcPLYHDKdJfR3yQ3EWS+X
         3LFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792769353; x=1793374153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hHHcAQPfZahhxZFJn/s+xEtK12OIVnJxh2g2wSCkHj4=;
        b=gyfWkZzYF3TaIpnzOEAIEDcLkXc/oWK/YIAUAd0rg1dmuj18XQb8Z3WV6E+PNppAnU
         cqxX4cgUeln95h1Pu+7r5EPWmbaYJOF9Wa+h99BAnz9sRvytNZNqmlgYrPzRXJAFnhIv
         lJKG7F0nVG27tJerTbz1OF9u6/Oc8eQ8Jlkrjd8Bduc0Tnmg1lzOgulOsHNyUzL1R/kC
         00/ORiQNdoXXwIoxnU/9foU6ppXlBA4NnJQwftEuGHZ/MpjEBuQs8lOE5G29xEb+xUVY
         lGIRAB/h3eRrZ04/SzWO4cA3aumo22OG08+LzL6hKAS2aKQs1PHgY1r1vZe4ekUfnOW0
         t/hw==
X-Forwarded-Encrypted: i=1; AKwUvBzd9Tbeo3WYTHS9OIyO5gG+lzj4XvawYufDGnmjfAWUwvnMMbroK/vnO5rRyW9vwJa2kZOD+udzDNZ44BI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLQwSHc6cJxe0uzRu+SsbzRiYnDyfIdh0yHly6JXII59nXOn3aP
	Sm6A5CzZ/Hz33KFtRKtqgxxYURX2fvq7ic6n8dAoXBMpMqqpovJe/mRjMkyCVTzW46Pr61DP3Aa
	HQ1mnIrHl9wN2lQhBjK/KQTOYnUVOHrorpN1ndrWhB7VQjZkTYne657EPB/V/VpA7TbQ=
X-Gm-Gg: AYBFou1GWoQOcePk2Vg0c0gg+YOc13rFKiYiOGCu1Fva3UYlxp25PimGzHDndp9kl8i
	eDcPndP++1OZpF07qTkqc4xxRagQdMm8INf82TaumU8/fNVfdbqgxe3q557vh75pD/fbV43vaqH
	ML74Kn2boFlaK9zQVCJlNk5kW4RIWp07/0uG9O6A6WOlTieM46ZwTYPDAGcY1v8sQ9/332FxUSk
	t4a60lpr3Us9Lem6Z7rOpB97xcqWE1JY63sVczkEKl7A0y+mLNNpZYf9CJ7IeBfqoGuxK6rg/1L
	oqqIU4B1VzElyRvgnGKhsD1mB3CifrgWNhpJsbKJnOAIGuO8All8cZTtxzI8k0Ha3ivq4mMCGEn
	bUPu6psP5Z57Ia8jBqzPV61/4
X-Received: by 2002:a05:620a:4403:b0:93f:6c76:215 with SMTP id af79cd13be357-93f6f7feee2mr456484385a.50.1792769352708;
        Fri, 23 Oct 2026 08:29:12 -0700 (PDT)
X-Received: by 2002:a05:620a:4403:b0:93f:6c76:215 with SMTP id af79cd13be357-93f6f7feee2mr456480285a.50.1792769352205;
        Fri, 23 Oct 2026 08:29:12 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a312fb9b90sm5546425e9.4.2026.10.23.08.29.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 08:29:10 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: atanas.filipov@oss.qualcomm.com,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] media: qcom: camss: sm8250: set the camera NoC AXI rate from the VFE
Date: Fri, 23 Oct 2026 18:28:57 +0300
Message-Id: <20261023152857.2859767-5-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261023152857.2859767-1-atanas.filipov@oss.qualcomm.com>
References: <20261023152857.2859767-1-atanas.filipov@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2MCBTYWx0ZWRfX2XTs9p1eNiM2
 5/JIcUO+GVBdbyofnvv6u/pjAPDjelS21l+TWpEJpHWnkkZ2tcPBUpgPSQzzD/3/BlSKL/AZyKl
 UMG7cVwOGF/YL2ht627oftxJ3OFt1VtcEjOeoynSg50KsF4OEHCtCH7JLVj3NphbtzzMj6hZ1dE
 AXzKLpEAqjgrLDiIxnMThncNAlcmzJ4v3NwKQs95JYdRvSlNRUD817MCi4Xspcek1n+ldtvTYvM
 PYDOAy+sYcAW2fkYpTxBghy59wT7Yx1X/gSZFHY25Z0M6I+ka6kaQ0GXht3n/0acmd7q5/3Rj5r
 mCmQrK05vWgq67afOiiWvX8YaWbJSG1HOjHPHTqTKkadUdOfqZlxkZ7vmqLQiOdDUEwphb7yzMc
 hNxqczZJkguWzJLIVi6pYTO4Lxn5TyKTtmufadK9b8bxKB4bAPCBWso6a5hoOpgAewGmqKl+PPn
 CQcSGe2kecb4qpcqWnQ==
X-Proofpoint-GUID: u2pvg4vikqZnV2zoMkobxUSUb3CKjd9d
X-Authority-Analysis: v=2.4 cv=a9mlZkSF c=1 sm=1 tr=0 ts=6adb7d49 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=FiRPRoyJa4ALD98OXUAA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: u2pvg4vikqZnV2zoMkobxUSUb3CKjd9d
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2MCBTYWx0ZWRfX3Dmmr7hC1se5
 1NCBahgGT2OEpLnDaEn4qerS216FHvgYmPRHLkOU7NmZqyzERfY8XKb6kTUWNxuKYGyv9g4p3Z5
 RBwtnd+6NNoxSIgnu7REJzG1dqZN4cI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230060

The SM8250 VFE resources list both the camera NoC AXI RCG,
camnoc_axi_src, and its camnoc_axi branch. The camnoc_axi_src levels
are never applied, since vfe_match_clock_names() does not match that
name, and they list 480 MHz, which the RCG does not support. The
camnoc_axi branch has no rates, so the camera NoC runs from XO and two
concurrent streams stall.

Drop camnoc_axi_src, as the camnoc_axi branch keeps it enabled through
its parent, and list the 300 and 400 MHz camera NoC AXI rates for the
camnoc_axi branch, whose rate the VFE sets through the parent. The four
VFEs share its source through a clock domain, so it runs at the highest
rate requested by the running VFEs.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 28 ++++++++++-------------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index db5212b14d5a..71abd01a4286 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -2120,13 +2120,12 @@ static const struct camss_subdev_resources vfe_res_8250[] = {
 	/* VFE0 */
 	{
 		.regulators = {},
-		.clock = { "camnoc_axi_src", "slow_ahb_src", "cpas_ahb",
+		.clock = { "slow_ahb_src", "cpas_ahb",
 			   "camnoc_axi", "vfe0_ahb", "vfe0_areg", "vfe0",
 			   "vfe0_axi", "cam_hf_axi" },
-		.clock_rate = { { 19200000, 300000000, 400000000, 480000000 },
-				{ 19200000, 80000000 },
+		.clock_rate = { { 19200000, 80000000 },
 				{ 19200000 },
-				{ 0 },
+				{ 300000000, 400000000 },
 				{ 0 },
 				{ 100000000, 200000000, 300000000, 400000000 },
 				{ 350000000, 475000000, 576000000, 720000000 },
@@ -2146,13 +2145,12 @@ static const struct camss_subdev_resources vfe_res_8250[] = {
 	/* VFE1 */
 	{
 		.regulators = {},
-		.clock = { "camnoc_axi_src", "slow_ahb_src", "cpas_ahb",
+		.clock = { "slow_ahb_src", "cpas_ahb",
 			   "camnoc_axi", "vfe1_ahb", "vfe1_areg", "vfe1",
 			   "vfe1_axi", "cam_hf_axi" },
-		.clock_rate = { { 19200000, 300000000, 400000000, 480000000 },
-				{ 19200000, 80000000 },
+		.clock_rate = { { 19200000, 80000000 },
 				{ 19200000 },
-				{ 0 },
+				{ 300000000, 400000000 },
 				{ 0 },
 				{ 100000000, 200000000, 300000000, 400000000 },
 				{ 350000000, 475000000, 576000000, 720000000 },
@@ -2172,13 +2170,12 @@ static const struct camss_subdev_resources vfe_res_8250[] = {
 	/* VFE2 (lite) */
 	{
 		.regulators = {},
-		.clock = { "camnoc_axi_src", "slow_ahb_src", "cpas_ahb",
+		.clock = { "slow_ahb_src", "cpas_ahb",
 			   "camnoc_axi", "vfe_lite_ahb", "vfe_lite_axi",
 			   "vfe_lite", "cam_hf_axi" },
-		.clock_rate = { { 19200000, 300000000, 400000000, 480000000 },
-				{ 19200000, 80000000 },
+		.clock_rate = { { 19200000, 80000000 },
 				{ 19200000 },
-				{ 0 },
+				{ 300000000, 400000000 },
 				{ 0 },
 				{ 0 },
 				{ 400000000, 480000000 },
@@ -2196,13 +2193,12 @@ static const struct camss_subdev_resources vfe_res_8250[] = {
 	/* VFE3 (lite) */
 	{
 		.regulators = {},
-		.clock = { "camnoc_axi_src", "slow_ahb_src", "cpas_ahb",
+		.clock = { "slow_ahb_src", "cpas_ahb",
 			   "camnoc_axi", "vfe_lite_ahb", "vfe_lite_axi",
 			   "vfe_lite", "cam_hf_axi" },
-		.clock_rate = { { 19200000, 300000000, 400000000, 480000000 },
-				{ 19200000, 80000000 },
+		.clock_rate = { { 19200000, 80000000 },
 				{ 19200000 },
-				{ 0 },
+				{ 300000000, 400000000 },
 				{ 0 },
 				{ 0 },
 				{ 400000000, 480000000 },
-- 
2.34.1

