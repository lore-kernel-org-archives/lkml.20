Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504AD4A2A46
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789476300; cv=none; b=op8fBcxpl63tYXBstHRhnxd8c9V/eoOWtCv0G5HdSFRhxyyfkYpPne+rq3ICsv8N+B1a+nU8gcfeA0PhJuKzW6coas0HVlNILTvoHZQeO0ZDF2Jnhs+qb/9fqQLZIKBO1Z9+20EIICLUzbNTp67jMlQCmBshZfuV9858vn95Hec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789476300; c=relaxed/simple;
	bh=977rc1EWISksdidwfBUtALBlv4loh7402R0pOF2uUq0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=GI/yziTXPAhgHBrTwKSqb8ilSwQLCUoJdWAoQVWp1jWXVgPDM+q6MJa3ffArRn8Z2qh1ygPtZAK9Wwnt56OMWLusVhSBbYrN7lz9TyJ41CY7eRwrDBC2TV94DSl0FwxvLdD96eH7N/2j5JSpkyD5/7n8KINoszw1BQYQ3g7jNyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TySGeKy+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hZ8zZbnY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TySGeKy+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hZ8zZbnY"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9gvMp2584514
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:44:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=BBB9G5hK0Apskt/iqfXGmW
	1kt8sDxofyVux5eGTzUqs=; b=TySGeKy+W0LWoQVLTmJNRNiPUJQ63oR15cNyKP
	dzrc+tUn6QpHntG0cpQYyrxcgdsCVDDWlK1mPLFSybx84KcXSQCKrAsSUpIlvhye
	yLvwAKWgIu4LfeyBshFgXOlaP68P4Y1va/lE9EUg2R1VKQvnHSILqTGH7ueCwRKL
	HRxfs3zqrkLFUPqUStN6oLElw3lFR6o10Nbg/ac319trcsV7F4OuZpj7MbDIIDpa
	TgRum6emtlb7LKcMgxeqGs0KWRdvRf3137Y5hotwHO7rCdKAOv4NtBfekDvv61IZ
	zfMv43KA7xNNFuYkgqhTTIHKfSvOrLOYweIacXCqKuHqP/XQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpx4sa1u2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:44:57 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-939a6937513so689949285a.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 05:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789476296; x=1790081096; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BBB9G5hK0Apskt/iqfXGmW1kt8sDxofyVux5eGTzUqs=;
        b=hZ8zZbnYaEnVYnVw/Lq8KYtFkX36OYtMH9DoVIuPyFky6lpc64Ti41Iy5zOjTlKa8F
         k1xCtdZJBw7iGzlFQypOhMt7/frVIBYhn3y30a3k/wSIFCovJSXWbt0cIrIzhlpwZ931
         tJaByLydJVIVY+BKcOUq8s6+fj9n0834o2Bi3FYA9irN0QO+vI0xrI5fynCuzDpDamvq
         oopY+mqSL4L9+mG/itQXYj1kHBAcvJSUHELc2Of2QCacfx2c2flbfiQ3hXCU8XMq48pz
         jSTeOcC6lFPsbdCtzo5cpB81KGAdI9z+80YSX/iCpGLHJ9702rZejcPeLyOfI4TpbYIu
         FS8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789476296; x=1790081096;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=BBB9G5hK0Apskt/iqfXGmW1kt8sDxofyVux5eGTzUqs=;
        b=koBwTY6VzPRYncNq07aJyo5a6X4BS3MbCbJq9R24GQnTPY6pgXATwGr58H9T/IiED8
         AUcXaif9pyoBbQe2aghPmHHpkut7U9v7UDszeU4Zu8fA27aDSIR+apMj82UR79C/yEsE
         9cmN1QmogsMLh6Ga5A5HxA0ouvr9KILnzKsGWvqz5DvtLMVCoEJ7Kd2AO/PnxuNwl9/d
         1SBpgIp4m0BV1ZR79HMtJGZ9i8wNaWdEEoehdpHBXueQ0pXUmAf2HPjiYDsXdZ+2uHDz
         Wz1T+Xa9Ug5wSKms2rZJ0g4aRmlnJM69X8XvaOYy53qqwmB6hrRCJh6/RP+IYBEw0MGs
         i8lQ==
X-Forwarded-Encrypted: i=1; AKwUvBy4KNwF4KW38jhsKw6cIf8Ov68Hx12hQI9k1cqRHBCHxBR4VOGzGDasV3nZO1VsPMv1nseSsGbQP6c887s=@vger.kernel.org
X-Gm-Message-State: AFuF++lSifMO3WFio5+fZXVA8APaOU1Dfz2zr0/ImcKoafc+TvMcUTPL
	lKnMSTGbPa7dtVKriQcwYxbO873jiQBwaxEkWZK+VGbUZCJGHS8Z0XF+mxbK4pLRZBrvz7JpHOD
	2gOl99/WjpXI/yOPBLk1sLvtSaTNaUQUZm/aQpd/grE7Gg/2q7Btno9VGvg5Qs+8FE54=
X-Gm-Gg: AYBFou1auVz+4c1wXG5EtpfPSBG6MmQ0+ResDGIx9ewUAkjxgl4v6+m+u713Jb7jtnt
	dWV76sf5CLQMO2GeqEot5dWyI0eUSzEy0sPZFfqtE63LXr8sK//NzT5kXGmVAxVJWaJqD9qwl1K
	+FHKbrmjHT3gljh0QD/44DACupN0k0dicljXvEh592/PiRkNerTScHr8Ktpcgj1mMyiYD8UKwnd
	yRvtRejrLL0P3vM907im3PEHAg/HjQqDhBEl4XIK9xrY5EA4tst0DA41hlhwCTIMVxabdNfuT0r
	keb02o/WEPfaqaJIz+vuf6/S3vkCHeTNVLuAVUhhCQEYiaUNexs4CRTjJmfXcGDDQ84V69Yzvpz
	Dm9Mkwe8=
X-Received: by 2002:a05:620a:43a1:b0:936:6c8a:f7aa with SMTP id af79cd13be357-93a297c964cmr979624185a.4.1789476295938;
        Tue, 15 Sep 2026 05:44:55 -0700 (PDT)
X-Received: by 2002:a05:620a:43a1:b0:936:6c8a:f7aa with SMTP id af79cd13be357-93a297c964cmr979614785a.4.1789476294993;
        Tue, 15 Sep 2026 05:44:54 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d284a7bsm144637485e9.3.2026.09.15.05.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 05:44:53 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 15:44:50 +0300
Subject: [PATCH] Revert "interconnect: qcom: x1e80100: enable QoS
 configuration"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-icc-qcom-x1e80100-revert-qos-enabling-v1-1-cc4ba943bd9d@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAME9qWoC/yXNwQ6CMBCE4Vche3aTXQwEfRXjgdYR12grLRgSw
 rtb9fgd5p+VMpIh07FaKeFt2WIo0F1F/taHAWyXYqqlbuWgDZv3PPr45EXRiYpwmSFNPMbMCL1
 7WBgYjXQq2jq3B5XWK+Fqy+/ndP47z+4OP33jtG0fcz2O94kAAAA=
X-Change-ID: 20260915-icc-qcom-x1e80100-revert-qos-enabling-e5081016bb3e
To: Georgi Djakov <djakov@kernel.org>
Cc: Mostafa Saleh <smostafa@google.com>, Marc Zyngier <maz@kernel.org>,
        Thorsten Leemhuis <regressions@leemhuis.info>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=27754;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=977rc1EWISksdidwfBUtALBlv4loh7402R0pOF2uUq0=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqT3Eu1MzN2Oe53il8+AmBkn4nls8fGn+/AhVA
 sn8UJHmz8WJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqk9xAAKCRAbX0TJAJUV
 VprDD/0fXEAncqECytyorRfHnVFKW34I5a/p7mBWFSsIdDAQlBZaaPKXCZp/q4V3/5EYE+l/UWX
 8yYoYwNtT68Or/3EFLA6zFsAGzE03a5mQKHd2ZRCwMZEDJxXwRvRPQujGLXW3uG2RdeeR+WJqYl
 u1xzISgsCIKcbAJJtDCxQ7viO7sEXMzVVmvsuvdAIiEg+xq1/9wcW9hBoY30sXPH0ghRO7yp6P8
 2dqWcNhnIdBHR7aIHlXY1HAWA4l4NUCV0KczCyGOu2eA+nELYK/5orDwTXLkrJdh/MCCj1fxKcm
 7FN4TUDZvPp4BF6vZNoJvYPoLZSk9Z4xWi5/FA8GhDU04Uaqw7cia35zIQT+qZq3cJbIckjOVkV
 yhDLFOhgNz6dKm6V/2eT/zecXBAGlI/01PT/o97iQ7yzZGSPwR4ul6UYPEg36jIan8rFfBMsI7K
 4gQz51cOjEuOk7tUqP8xzvPam2b2LSqDMWqqIaIOnqrscza3qBIeKeEbplw1jlvd83UlCYg8PbH
 fISeRTQTwRyF44SDyJvHOrtejoJAFeJ1rVOS0F9XJcFEOfI5nUA66RVKYd0ADS9zi3i72UPS5mS
 1RyCVTM+7R/z/UXv0WCqT0A5HkquL5NqDOwrx3BPckaQEpZSsLynG+3Zbgbf5Iav3OpJRdnrT/o
 PKO4b4TwrCiuC0A==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE4NSBTYWx0ZWRfX20lqAEen+Fyr
 aT+nj71Wn5JeKIgVydH8J8w+TUVdi4fuMbkoK9bpG8mNj0dC7qKUW7XwJ6CTyRRL2IVf3FuYu3r
 P5RxHyoRDcNz+ReqFkenjV1UeF2+uB4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE4NSBTYWx0ZWRfX6kxg1G7sd8MC
 p+/Rdm9GW1r4lL654SfrMIA7gU/CGPFHYSRYhk3Q9Xf8UBvC7fldaTdY9VZC8hqYawn8R2nNCPC
 313aw4vKPa7A1h8NG+hiI5yfOxmRBq3XJ63/Gfg5WXPjOReeCvE0HA8YuJyw/dQY72447pUhhNW
 jJBqz7zWKPTHGnGfXC+/+E+j5qEIUXpL/8Dwi5jl1Qa/eOPsYvrklKIma3pWvEs7TSnrqqSpBe0
 E50wXh1xH8Bj/FMmuFH8qLTUR6znG4I2deVCjXmDkqNA1d2wQxMQHR8hSjxtWzNb1evjx5G9IX3
 9KIpn8UNfDzyVBlQymz8iVZsGjYSM2V1ebz0qEml8QG9i9Af9h99KYaLYYjtBj0zoU5CwMyxDEA
 pWPnay8qr8fXTX+PwbRQgqna9M+PAKw1Z7A4jISn4607HjtDLdNdswBEgsQHBrZzjj58OCQI6TK
 6OhLQZ1gottVqVnIXpQ==
X-Authority-Analysis: v=2.4 cv=HsDjiETS c=1 sm=1 tr=0 ts=6aa93dc9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=1XWaLZrsAAAA:8 a=EUspDBNiAAAA:8 a=Y0YJaGJQxN7WziX6K-UA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: mFVbi3QY9E-oHO8LjeJ-jlNNSLdNXaEx
X-Proofpoint-ORIG-GUID: mFVbi3QY9E-oHO8LjeJ-jlNNSLdNXaEx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150185

This reverts commit 5a8b2cc36e796d595c9d97eab23c2be22805cc1c.

Some Hamoa- and Purwa-based machines fail to boot after this change.
Attempts to resolve the issue have not been successful, so revert the
change for now.

Reported-by: Mostafa Saleh <smostafa@google.com>
Link: https://lore.kernel.org/all/apgeBNSiP01YfNcs@google.com/
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/interconnect/qcom/x1e80100.c | 485 -----------------------------------
 1 file changed, 485 deletions(-)

diff --git a/drivers/interconnect/qcom/x1e80100.c b/drivers/interconnect/qcom/x1e80100.c
index 8075e0ff2059..2ba2823c7860 100644
--- a/drivers/interconnect/qcom/x1e80100.c
+++ b/drivers/interconnect/qcom/x1e80100.c
@@ -173,13 +173,6 @@ static struct qcom_icc_node qhm_qspi = {
 	.name = "qhm_qspi",
 	.channels = 1,
 	.buswidth = 4,
-	.qosbox = &(const struct qcom_icc_qosbox) {
-		.num_ports = 1,
-		.port_offsets = { 0xb000 },
-		.prio = 2,
-		.urg_fwd = 0,
-		.prio_fwd_disable = 1,
-	},
 	.num_links = 1,
 	.link_nodes = { &qns_a1noc_snoc },
 };
@@ -188,13 +181,6 @@ static struct qcom_icc_node qhm_qup1 = {
 	.name = "qhm_qup1",
 	.channels = 1,
 	.buswidth = 4,
-	.qosbox = &(const struct qcom_icc_qosbox) {
-		.num_ports = 1,
-		.port_offsets = { 0xc000 },
-		.prio = 2,
-		.urg_fwd = 0,
-		.prio_fwd_disable = 1,
-	},
 	.num_links = 1,
 	.link_nodes = { &qns_a1noc_snoc },
 };
@@ -203,13 +189,6 @@ static struct qcom_icc_node xm_sdc4 = {
 	.name = "xm_sdc4",
 	.channels = 1,
 	.buswidth = 8,
-	.qosbox = &(const struct qcom_icc_qosbox) {
-		.num_ports = 1,
-		.port_offsets = { 0xd000 },
-		.prio = 2,
-		.urg_fwd = 0,
-		.prio_fwd_disable = 1,
-	},
 	.num_links = 1,
 	.link_nodes = { &qns_a1noc_snoc },
 };
@@ -218,13 +197,6 @@ static struct qcom_icc_node xm_ufs_mem = {
 	.name = "xm_ufs_mem",
 	.channels = 1,
 	.buswidth = 16,
-	.qosbox = &(const struct qcom_icc_qosbox) {
-		.num_ports = 1,
-		.port_offsets = { 0xe000 },
-		.prio = 2,
-		.urg_fwd = 0,
-		.prio_fwd_disable = 1,
-	},
 	.num_links = 1,
 	.link_nodes = { &qns_a1noc_snoc },
 };
@@ -233,13 +205,6 @@ static struct qcom_icc_node qhm_qup0 = {
 	.name = "qhm_qup0",
 	.channels = 1,
 	.buswidth = 4,
-	.qosbox = &(const struct qcom_icc_qosbox) {
-		.num_ports = 1,
-		.port_offsets = { 0x16000 },
-		.prio = 2,
-		.urg_fwd = 0,
-		.prio_fwd_disable = 1,
-	},
 	.num_links = 1,
 	.link_nodes = { &qns_a2noc_snoc },
 };
@@ -248,13 +213,6 @@ static struct qcom_icc_node qhm_qup2 = {
 	.name = "qhm_qup2",
 	.channels = 1,
 	.buswidth = 4,
-	.qosbox = &(const struct qcom_icc_qosbox) {
-		.num_ports = 1,
-		.port_offsets = { 0x11000 },
-		.prio = 2,
-		.urg_fwd = 0,
-		.prio_fwd_disable = 1,
-	},
 	.num_links = 1,
 	.link_nodes = { &qns_a2noc_snoc },
 };
@@ -263,13 +221,6 @@ static struct qcom_icc_node qxm_crypto = {
 	.name = "qxm_crypto",
 	.channels = 1,
 	.buswidth = 8,
-	.qosbox = &(const struct qcom_icc_qosbox) {
-		.num_ports = 1,
-		.port_offsets = { 0x12000 },
-		.prio = 2,
-		.urg_fwd = 0,
-		.prio_fwd_disable = 1,
-	},
 	.num_links = 1,
 	.link_nodes = { &qns_a2noc_snoc },
 };
@@ -286,13 +237,6 @@ static struct qcom_icc_node xm_qdss_etr_0 = {
 	.name = "xm_qdss_etr_0",
 	.channels = 1,
 	.buswidth = 8,
-	.qosbox = &(const struct qcom_icc_qosbox) {
-		.num_ports = 1,
-		.port_offsets = { 0x13000 },
-		.prio = 2,
-		.urg_fwd = 0,
-		.prio_fwd_disable = 1,
-	},
 	.num_links = 1,
 	.link_nodes = { &qns_a2noc_snoc },
 };
@@ -301,13 +245,6 @@ static struct qcom_icc_node xm_qdss_etr_1 = {
 	.name = "xm_qdss_etr_1",
 	.channels = 1,
 	.buswidth = 8,
-	.qosbox = &(const struct qcom_icc_qosbox) {
-		.num_ports = 1,
-		.port_offsets = { 0x14000 },
-		.prio = 2,
-		.urg_fwd = 0,
-		.prio_fwd_disable = 1,
-	},
 	.num_links = 1,
 	.link_nodes = { &qns_a2noc_snoc },
 };
@@ -316,13 +253,6 @@ static struct qcom_icc_node xm_sdc2 = {
 	.name = "xm_sdc2",
 	.channels = 1,
 	.buswidth = 8,
-	.qosbox = &(const struct qcom_icc_qosbox) {
-		.num_ports = 1,
-		.port_offsets = { 0x15000 },
-		.prio = 2,
-		.urg_fwd = 0,
-		.prio_fwd_disable = 1,
-	},
 	.num_links = 1,
 	.link_nodes = { &qns_a2noc_snoc },
 };
@@ -407,13 +337,6 @@ static struct qcom_icc_node alm_gpu_tcu = {
 	.name = "alm_gpu_tcu",
 	.channels = 1,
 	.buswidth = 8,
-	.qosbox = &(const struct qcom_icc_qosbox) {
-		.num_ports = 1,
-		.port_offsets = { 0x271000 },
-		.prio = 1,
-		.urg_fwd = 0,
-		.prio_fwd_disable = 1,
-	},
 	.num_links = 2,
 	.link_nodes = { &qns_gem_noc_cnoc, &qns_llcc },
 };
@@ -422,13 +345,6 @@ static struct qcom_icc_node alm_pcie_tcu = {
 	.name = "alm_pcie_tcu",
 	.channels = 1,
 	.buswidth = 8,
-	.qosbox = &(const struct qcom_icc_qosbox) {
-		.num_ports = 1,
-		.port_offsets = { 0x27d000 },
-		.prio = 3,
-		.urg_fwd = 0,
-		.prio_fwd_disable = 1,
-	},
 	.num_links = 2,
 	.link_nodes = { &qns_gem_noc_cnoc, &qns_llcc },
 };
@@ -437,13 +353,6 @@ static struct qcom_icc_node alm_sys_tcu = {
 	.name = "alm_sys_tcu",
 	.channels = 1,
 	.buswidth = 8,
-	.qosbox = &(const struct qcom_icc_qosbox) {
-		.num_ports = 1,
-		.port_offsets = { 0x273000 },
-		.prio = 6,
-		.urg_fwd = 0,
-		.prio_fwd_disable = 1,
-	},
 	.num_links = 2,
 	.link_nodes = { &qns_gem_noc_cnoc, &qns_llcc },
 };
@@ -461,13 +370,6 @@ static struct qcom_icc_node qnm_gpu = {
 	.name = "qnm_gpu",
 	.channels = 4,
 	.buswidth = 32,
-	.qosbox = &(const struct qcom_icc_qosbox) {
-		.num_ports = 4,
-		.port_offsets = { 0x51000, 0x58000, 0xd1000, 0xd8000 },
-		.prio = 0,
-		.urg_fwd = 0,
-		.prio_fwd_disable = 1,
-	},
 	.num_links = 2,
 	.link_nodes = { &qns_gem_noc_cnoc, &qns_llcc },
 };
@@ -476,13 +378,6 @@ static struct qcom_icc_node qnm_lpass = {
 	.name = "qnm_lpass",
 	.channels = 1,
 	.buswidth = 16,
-	.qosbox = &(const struct qcom_icc_qosbox) {
-		.num_ports = 1,
-		.port_offsets = { 0x275000 },
-		.prio = 0,
-		.urg_fwd = 1,
-		.prio_fwd_disable = 0,
-	},
 	.num_links = 3,
 	.link_nodes = { &qns_gem_noc_cnoc, &qns_llcc,
 			&qns_pcie },
@@ -492,13 +387,6 @@ static struct qcom_icc_node qnm_mnoc_hf = {
 	.name = "qnm_mnoc_hf",
 	.channels = 2,
 	.buswidth = 32,
-	.qosbox = &(const struct qcom_icc_qosbox) {
-		.num_ports = 2,
-		.port_offsets = { 0x53000, 0xd3000 },
-		.prio = 0,
-		.urg_fwd = 1,
-		.prio_fwd_disable = 0,
-	},
 	.num_links = 2,
 	.link_nodes = { &qns_gem_noc_cnoc, &qns_llcc },
 };
@@ -507,13 +395,6 @@ static struct qcom_icc_node qnm_mnoc_sf = {
 	.name = "qnm_mnoc_sf",
 	.channels = 2,
 	.buswidth = 32,
-	.qosbox = &(const struct qcom_icc_qosbox) {
-		.num_ports = 2,
-		.port_offsets = { 0x55000, 0xd5000 },
-		.prio = 0,
-		.urg_fwd = 1,
-		.prio_fwd_disable = 0,
-	},
 	.num_links = 2,
 	.link_nodes = { &qns_gem_noc_cnoc, &qns_llcc },
 };
@@ -522,13 +403,6 @@ static struct qcom_icc_node qnm_nsp_noc = {
 	.name = "qnm_nsp_noc",
 	.channels = 2,
 	.buswidth = 32,
-	.qosbox = &(const struct qcom_icc_qosbox) {
-		.num_ports = 2,
-		.port_offsets = { 0x57000, 0xd7000 },
-		.prio = 0,
-		.urg_fwd = 0,
-		.prio_fwd_disable = 1,
-	},
 	.num_links = 3,
 	.link_nodes = { &qns_gem_noc_cnoc, &qns_llcc,
 			&qns_pcie },
@@ -538,13 +412,6 @@ static struct qcom_icc_node qnm_pcie = {
 	.name = "qnm_pcie",
 	.channels = 1,
 	.buswidth = 64,
-	.qosbox = &(const struct qcom_icc_qosbox) {
-		.num_ports = 1,
-		.port_offsets = { 0x277000 },
-		.prio = 0,
-		.urg_fwd = 1,
-		.prio_fwd_disable = 0,
-	},
 	.num_links = 2,
 	.link_nodes = { &qns_gem_noc_cnoc, &qns_llcc },
 };
@@ -553,13 +420,6 @@ static struct qcom_icc_node qnm_snoc_sf = {
 	.name = "qnm_snoc_sf",
 	.channels = 1,
 	.buswidth = 64,
-	.qosbox = &(const struct qcom_icc_qosbox) {
-		.num_ports = 1,
-		.port_offsets = { 0x27b000 },
-		.prio = 2,
-		.urg_fwd = 1,
-		.prio_fwd_disable = 0,
-	},
 	.num_links = 3,
 	.link_nodes = { &qns_gem_noc_cnoc, &qns_llcc,
 			&qns_pcie },
@@ -569,13 +429,6 @@ static struct qcom_icc_node xm_gic = {
 	.name = "xm_gic",
 	.channels = 1,
 	.buswidth = 8,
-	.qosbox = &(const struct qcom_icc_qosbox) {
-		.num_ports = 1,
-		.port_offsets = { 0x27f000 },
-		.prio = 2,
-		.urg_fwd = 0,
-		.prio_fwd_disable = 1,
-	},
 	.num_links = 1,
 	.link_nodes = { &qns_llcc },
 };
@@ -616,13 +469,6 @@ static struct qcom_icc_node qnm_av1_enc = {
 	.name = "qnm_av1_enc",
 	.channels = 1,
 	.buswidth = 32,
-	.qosbox = &(const struct qcom_icc_qosbox) {
-		.num_ports = 1,
-		.port_offsets = { 0x2f000 },
-		.prio = 4,
-		.urg_fwd = 0,
-		.prio_fwd_disable = 1,
-	},
 	.num_links = 1,
 	.link_nodes = { &qns_mem_noc_sf },
 };
@@ -631,13 +477,6 @@ static struct qcom_icc_node qnm_camnoc_hf = {
 	.name = "qnm_camnoc_hf",
 	.channels = 2,
 	.buswidth = 32,
-	.qosbox = &(const struct qcom_icc_qosbox) {
-		.num_ports = 2,
-		.port_offsets = { 0x28000, 0x29000 },
-		.prio = 0,
-		.urg_fwd = 1,
-		.prio_fwd_disable = 0,
-	},
 	.num_links = 1,
 	.link_nodes = { &qns_mem_noc_hf },
 };
@@ -646,13 +485,6 @@ static struct qcom_icc_node qnm_camnoc_icp = {
 	.name = "qnm_camnoc_icp",
 	.channels = 1,
 	.buswidth = 8,
-	.qosbox = &(const struct qcom_icc_qosbox) {
-		.num_ports = 1,
-		.port_offsets = { 0x2a000 },
-		.prio = 4,
-		.urg_fwd = 0,
-		.prio_fwd_disable = 1,
-	},
 	.num_links = 1,
 	.link_nodes = { &qns_mem_noc_sf },
 };
@@ -661,13 +493,6 @@ static struct qcom_icc_node qnm_camnoc_sf = {
 	.name = "qnm_camnoc_sf",
 	.channels = 2,
 	.buswidth = 32,
-	.qosbox = &(const struct qcom_icc_qosbox) {
-		.num_ports = 2,
-		.port_offsets = { 0x2b000, 0x2c000 },
-		.prio = 0,
-		.urg_fwd = 1,
-		.prio_fwd_disable = 0,
-	},
 	.num_links = 1,
 	.link_nodes = { &qns_mem_noc_sf },
 };
@@ -676,13 +501,6 @@ static struct qcom_icc_node qnm_eva = {
 	.name = "qnm_eva",
 	.channels = 1,
 	.buswidth = 32,
-	.qosbox = &(const struct qcom_icc_qosbox) {
-		.num_ports = 1,
-		.port_offsets = { 0x33000 },
-		.prio = 0,
-		.urg_fwd = 1,
-		.prio_fwd_disable = 0,
-	},
 	.num_links = 1,
 	.link_nodes = { &qns_mem_noc_sf },
 };
@@ -691,13 +509,6 @@ static struct qcom_icc_node qnm_mdp = {
 	.name = "qnm_mdp",
 	.channels = 2,
 	.buswidth = 32,
-	.qosbox = &(const struct qcom_icc_qosbox) {
-		.num_ports = 2,
-		.port_offsets = { 0x2d000, 0x2e000 },
-		.prio = 0,
-		.urg_fwd = 1,
-		.prio_fwd_disable = 0,
-	},
 	.num_links = 1,
 	.link_nodes = { &qns_mem_noc_hf },
 };
@@ -706,13 +517,6 @@ static struct qcom_icc_node qnm_video = {
 	.name = "qnm_video",
 	.channels = 2,
 	.buswidth = 32,
-	.qosbox = &(const struct qcom_icc_qosbox) {
-		.num_ports = 2,
-		.port_offsets = { 0x30000, 0x31000 },
-		.prio = 0,
-		.urg_fwd = 1,
-		.prio_fwd_disable = 0,
-	},
 	.num_links = 1,
 	.link_nodes = { &qns_mem_noc_sf },
 };
@@ -721,13 +525,6 @@ static struct qcom_icc_node qnm_video_cv_cpu = {
 	.name = "qnm_video_cv_cpu",
 	.channels = 1,
 	.buswidth = 8,
-	.qosbox = &(const struct qcom_icc_qosbox) {
-		.num_ports = 1,
-		.port_offsets = { 0x32000 },
-		.prio = 4,
-		.urg_fwd = 0,
-		.prio_fwd_disable = 1,
-	},
 	.num_links = 1,
 	.link_nodes = { &qns_mem_noc_sf },
 };
@@ -736,13 +533,6 @@ static struct qcom_icc_node qnm_video_v_cpu = {
 	.name = "qnm_video_v_cpu",
 	.channels = 1,
 	.buswidth = 8,
-	.qosbox = &(const struct qcom_icc_qosbox) {
-		.num_ports = 1,
-		.port_offsets = { 0x34000 },
-		.prio = 4,
-		.urg_fwd = 0,
-		.prio_fwd_disable = 1,
-	},
 	.num_links = 1,
 	.link_nodes = { &qns_mem_noc_sf },
 };
@@ -783,13 +573,6 @@ static struct qcom_icc_node xm_pcie_3 = {
 	.name = "xm_pcie_3",
 	.channels = 1,
 	.buswidth = 64,
-	.qosbox = &(const struct qcom_icc_qosbox) {
-		.num_ports = 1,
-		.port_offsets = { 0x7000 },
-		.prio = 2,
-		.urg_fwd = 0,
-		.prio_fwd_disable = 1,
-	},
 	.num_links = 1,
 	.link_nodes = { &qns_pcie_north_gem_noc },
 };
@@ -798,13 +581,6 @@ static struct qcom_icc_node xm_pcie_4 = {
 	.name = "xm_pcie_4",
 	.channels = 1,
 	.buswidth = 8,
-	.qosbox = &(const struct qcom_icc_qosbox) {
-		.num_ports = 1,
-		.port_offsets = { 0x8000 },
-		.prio = 2,
-		.urg_fwd = 0,
-		.prio_fwd_disable = 1,
-	},
 	.num_links = 1,
 	.link_nodes = { &qns_pcie_north_gem_noc },
 };
@@ -813,13 +589,6 @@ static struct qcom_icc_node xm_pcie_5 = {
 	.name = "xm_pcie_5",
 	.channels = 1,
 	.buswidth = 8,
-	.qosbox = &(const struct qcom_icc_qosbox) {
-		.num_ports = 1,
-		.port_offsets = { 0x9000 },
-		.prio = 3,
-		.urg_fwd = 0,
-		.prio_fwd_disable = 1,
-	},
 	.num_links = 1,
 	.link_nodes = { &qns_pcie_north_gem_noc },
 };
@@ -828,13 +597,6 @@ static struct qcom_icc_node xm_pcie_0 = {
 	.name = "xm_pcie_0",
 	.channels = 1,
 	.buswidth = 16,
-	.qosbox = &(const struct qcom_icc_qosbox) {
-		.num_ports = 1,
-		.port_offsets = { 0x9000 },
-		.prio = 2,
-		.urg_fwd = 0,
-		.prio_fwd_disable = 1,
-	},
 	.num_links = 1,
 	.link_nodes = { &qns_pcie_south_gem_noc },
 };
@@ -843,13 +605,6 @@ static struct qcom_icc_node xm_pcie_1 = {
 	.name = "xm_pcie_1",
 	.channels = 1,
 	.buswidth = 16,
-	.qosbox = &(const struct qcom_icc_qosbox) {
-		.num_ports = 1,
-		.port_offsets = { 0xa000 },
-		.prio = 2,
-		.urg_fwd = 0,
-		.prio_fwd_disable = 1,
-	},
 	.num_links = 1,
 	.link_nodes = { &qns_pcie_south_gem_noc },
 };
@@ -858,13 +613,6 @@ static struct qcom_icc_node xm_pcie_2 = {
 	.name = "xm_pcie_2",
 	.channels = 1,
 	.buswidth = 16,
-	.qosbox = &(const struct qcom_icc_qosbox) {
-		.num_ports = 1,
-		.port_offsets = { 0xb000 },
-		.prio = 2,
-		.urg_fwd = 0,
-		.prio_fwd_disable = 1,
-	},
 	.num_links = 1,
 	.link_nodes = { &qns_pcie_south_gem_noc },
 };
@@ -873,13 +621,6 @@ static struct qcom_icc_node xm_pcie_6a = {
 	.name = "xm_pcie_6a",
 	.channels = 1,
 	.buswidth = 32,
-	.qosbox = &(const struct qcom_icc_qosbox) {
-		.num_ports = 1,
-		.port_offsets = { 0xc000 },
-		.prio = 2,
-		.urg_fwd = 0,
-		.prio_fwd_disable = 1,
-	},
 	.num_links = 1,
 	.link_nodes = { &qns_pcie_south_gem_noc },
 };
@@ -888,13 +629,6 @@ static struct qcom_icc_node xm_pcie_6b = {
 	.name = "xm_pcie_6b",
 	.channels = 1,
 	.buswidth = 16,
-	.qosbox = &(const struct qcom_icc_qosbox) {
-		.num_ports = 1,
-		.port_offsets = { 0xd000 },
-		.prio = 2,
-		.urg_fwd = 0,
-		.prio_fwd_disable = 1,
-	},
 	.num_links = 1,
 	.link_nodes = { &qns_pcie_south_gem_noc },
 };
@@ -919,13 +653,6 @@ static struct qcom_icc_node qnm_gic = {
 	.name = "qnm_gic",
 	.channels = 1,
 	.buswidth = 8,
-	.qosbox = &(const struct qcom_icc_qosbox) {
-		.num_ports = 1,
-		.port_offsets = { 0x1c000 },
-		.prio = 2,
-		.urg_fwd = 0,
-		.prio_fwd_disable = 1,
-	},
 	.num_links = 1,
 	.link_nodes = { &qns_gemnoc_sf },
 };
@@ -958,13 +685,6 @@ static struct qcom_icc_node xm_usb2_0 = {
 	.name = "xm_usb2_0",
 	.channels = 1,
 	.buswidth = 8,
-	.qosbox = &(const struct qcom_icc_qosbox) {
-		.num_ports = 1,
-		.port_offsets = { 0x6000 },
-		.prio = 2,
-		.urg_fwd = 0,
-		.prio_fwd_disable = 1,
-	},
 	.num_links = 1,
 	.link_nodes = { &qns_aggre_usb_north_snoc },
 };
@@ -973,13 +693,6 @@ static struct qcom_icc_node xm_usb3_mp = {
 	.name = "xm_usb3_mp",
 	.channels = 1,
 	.buswidth = 16,
-	.qosbox = &(const struct qcom_icc_qosbox) {
-		.num_ports = 1,
-		.port_offsets = { 0x7000 },
-		.prio = 2,
-		.urg_fwd = 0,
-		.prio_fwd_disable = 1,
-	},
 	.num_links = 1,
 	.link_nodes = { &qns_aggre_usb_north_snoc },
 };
@@ -988,13 +701,6 @@ static struct qcom_icc_node xm_usb3_0 = {
 	.name = "xm_usb3_0",
 	.channels = 1,
 	.buswidth = 8,
-	.qosbox = &(const struct qcom_icc_qosbox) {
-		.num_ports = 1,
-		.port_offsets = { 0xa000 },
-		.prio = 2,
-		.urg_fwd = 0,
-		.prio_fwd_disable = 1,
-	},
 	.num_links = 1,
 	.link_nodes = { &qns_aggre_usb_south_snoc },
 };
@@ -1003,13 +709,6 @@ static struct qcom_icc_node xm_usb3_1 = {
 	.name = "xm_usb3_1",
 	.channels = 1,
 	.buswidth = 8,
-	.qosbox = &(const struct qcom_icc_qosbox) {
-		.num_ports = 1,
-		.port_offsets = { 0xb000 },
-		.prio = 2,
-		.urg_fwd = 0,
-		.prio_fwd_disable = 1,
-	},
 	.num_links = 1,
 	.link_nodes = { &qns_aggre_usb_south_snoc },
 };
@@ -1018,13 +717,6 @@ static struct qcom_icc_node xm_usb3_2 = {
 	.name = "xm_usb3_2",
 	.channels = 1,
 	.buswidth = 8,
-	.qosbox = &(const struct qcom_icc_qosbox) {
-		.num_ports = 1,
-		.port_offsets = { 0xc000 },
-		.prio = 2,
-		.urg_fwd = 0,
-		.prio_fwd_disable = 1,
-	},
 	.num_links = 1,
 	.link_nodes = { &qns_aggre_usb_south_snoc },
 };
@@ -1033,13 +725,6 @@ static struct qcom_icc_node xm_usb4_0 = {
 	.name = "xm_usb4_0",
 	.channels = 1,
 	.buswidth = 16,
-	.qosbox = &(const struct qcom_icc_qosbox) {
-		.num_ports = 1,
-		.port_offsets = { 0xd000 },
-		.prio = 2,
-		.urg_fwd = 0,
-		.prio_fwd_disable = 1,
-	},
 	.num_links = 1,
 	.link_nodes = { &qns_aggre_usb_south_snoc },
 };
@@ -1048,13 +733,6 @@ static struct qcom_icc_node xm_usb4_1 = {
 	.name = "xm_usb4_1",
 	.channels = 1,
 	.buswidth = 16,
-	.qosbox = &(const struct qcom_icc_qosbox) {
-		.num_ports = 1,
-		.port_offsets = { 0xe000 },
-		.prio = 2,
-		.urg_fwd = 0,
-		.prio_fwd_disable = 1,
-	},
 	.num_links = 1,
 	.link_nodes = { &qns_aggre_usb_south_snoc },
 };
@@ -1063,13 +741,6 @@ static struct qcom_icc_node xm_usb4_2 = {
 	.name = "xm_usb4_2",
 	.channels = 1,
 	.buswidth = 16,
-	.qosbox = &(const struct qcom_icc_qosbox) {
-		.num_ports = 1,
-		.port_offsets = { 0xf000 },
-		.prio = 2,
-		.urg_fwd = 0,
-		.prio_fwd_disable = 1,
-	},
 	.num_links = 1,
 	.link_nodes = { &qns_aggre_usb_south_snoc },
 };
@@ -1795,21 +1466,11 @@ static struct qcom_icc_node * const aggre1_noc_nodes[] = {
 	[SLAVE_A1NOC_SNOC] = &qns_a1noc_snoc,
 };
 
-static const struct regmap_config x1e80100_aggre1_noc_regmap_config = {
-	.reg_bits = 32,
-	.reg_stride = 4,
-	.val_bits = 32,
-	.max_register = 0x14400,
-	.fast_io = true,
-};
-
 static const struct qcom_icc_desc x1e80100_aggre1_noc = {
-	.config = &x1e80100_aggre1_noc_regmap_config,
 	.nodes = aggre1_noc_nodes,
 	.num_nodes = ARRAY_SIZE(aggre1_noc_nodes),
 	.bcms = aggre1_noc_bcms,
 	.num_bcms = ARRAY_SIZE(aggre1_noc_bcms),
-	.qos_requires_clocks = true,
 };
 
 static struct qcom_icc_bcm * const aggre2_noc_bcms[] = {
@@ -1827,16 +1488,7 @@ static struct qcom_icc_node * const aggre2_noc_nodes[] = {
 	[SLAVE_A2NOC_SNOC] = &qns_a2noc_snoc,
 };
 
-static const struct regmap_config x1e80100_aggre2_noc_regmap_config = {
-	.reg_bits = 32,
-	.reg_stride = 4,
-	.val_bits = 32,
-	.max_register = 0x1c400,
-	.fast_io = true,
-};
-
 static const struct qcom_icc_desc x1e80100_aggre2_noc = {
-	.config = &x1e80100_aggre2_noc_regmap_config,
 	.nodes = aggre2_noc_nodes,
 	.num_nodes = ARRAY_SIZE(aggre2_noc_nodes),
 	.bcms = aggre2_noc_bcms,
@@ -1921,16 +1573,7 @@ static struct qcom_icc_node * const cnoc_cfg_nodes[] = {
 	[SLAVE_TCU] = &xs_sys_tcu_cfg,
 };
 
-static const struct regmap_config x1e80100_cnoc_cfg_regmap_config = {
-	.reg_bits = 32,
-	.reg_stride = 4,
-	.val_bits = 32,
-	.max_register = 0x6600,
-	.fast_io = true,
-};
-
 static const struct qcom_icc_desc x1e80100_cnoc_cfg = {
-	.config = &x1e80100_cnoc_cfg_regmap_config,
 	.nodes = cnoc_cfg_nodes,
 	.num_nodes = ARRAY_SIZE(cnoc_cfg_nodes),
 	.bcms = cnoc_cfg_bcms,
@@ -1960,16 +1603,7 @@ static struct qcom_icc_node * const cnoc_main_nodes[] = {
 	[SLAVE_PCIE_6B] = &xs_pcie_6b,
 };
 
-static const struct regmap_config x1e80100_cnoc_main_regmap_config = {
-	.reg_bits = 32,
-	.reg_stride = 4,
-	.val_bits = 32,
-	.max_register = 0x14400,
-	.fast_io = true,
-};
-
 static const struct qcom_icc_desc x1e80100_cnoc_main = {
-	.config = &x1e80100_cnoc_main_regmap_config,
 	.nodes = cnoc_main_nodes,
 	.num_nodes = ARRAY_SIZE(cnoc_main_nodes),
 	.bcms = cnoc_main_bcms,
@@ -1999,16 +1633,7 @@ static struct qcom_icc_node * const gem_noc_nodes[] = {
 	[SLAVE_MEM_NOC_PCIE_SNOC] = &qns_pcie,
 };
 
-static const struct regmap_config x1e80100_gem_noc_regmap_config = {
-	.reg_bits = 32,
-	.reg_stride = 4,
-	.val_bits = 32,
-	.max_register = 0x311200,
-	.fast_io = true,
-};
-
 static const struct qcom_icc_desc x1e80100_gem_noc = {
-	.config = &x1e80100_gem_noc_regmap_config,
 	.nodes = gem_noc_nodes,
 	.num_nodes = ARRAY_SIZE(gem_noc_nodes),
 	.bcms = gem_noc_bcms,
@@ -2023,16 +1648,7 @@ static struct qcom_icc_node * const lpass_ag_noc_nodes[] = {
 	[SLAVE_LPASS_GEM_NOC] = &qns_lpass_ag_noc_gemnoc,
 };
 
-static const struct regmap_config x1e80100_lpass_ag_noc_regmap_config = {
-	.reg_bits = 32,
-	.reg_stride = 4,
-	.val_bits = 32,
-	.max_register = 0xe080,
-	.fast_io = true,
-};
-
 static const struct qcom_icc_desc x1e80100_lpass_ag_noc = {
-	.config = &x1e80100_lpass_ag_noc_regmap_config,
 	.nodes = lpass_ag_noc_nodes,
 	.num_nodes = ARRAY_SIZE(lpass_ag_noc_nodes),
 	.bcms = lpass_ag_noc_bcms,
@@ -2048,16 +1664,7 @@ static struct qcom_icc_node * const lpass_lpiaon_noc_nodes[] = {
 	[SLAVE_LPIAON_NOC_LPASS_AG_NOC] = &qns_lpass_aggnoc,
 };
 
-static const struct regmap_config x1e80100_lpass_lpiaon_noc_regmap_config = {
-	.reg_bits = 32,
-	.reg_stride = 4,
-	.val_bits = 32,
-	.max_register = 0x19080,
-	.fast_io = true,
-};
-
 static const struct qcom_icc_desc x1e80100_lpass_lpiaon_noc = {
-	.config = &x1e80100_lpass_lpiaon_noc_regmap_config,
 	.nodes = lpass_lpiaon_noc_nodes,
 	.num_nodes = ARRAY_SIZE(lpass_lpiaon_noc_nodes),
 	.bcms = lpass_lpiaon_noc_bcms,
@@ -2072,16 +1679,7 @@ static struct qcom_icc_node * const lpass_lpicx_noc_nodes[] = {
 	[SLAVE_LPICX_NOC_LPIAON_NOC] = &qns_lpi_aon_noc,
 };
 
-static const struct regmap_config x1e80100_lpass_lpicx_noc_regmap_config = {
-	.reg_bits = 32,
-	.reg_stride = 4,
-	.val_bits = 32,
-	.max_register = 0x3a200,
-	.fast_io = true,
-};
-
 static const struct qcom_icc_desc x1e80100_lpass_lpicx_noc = {
-	.config = &x1e80100_lpass_lpicx_noc_regmap_config,
 	.nodes = lpass_lpicx_noc_nodes,
 	.num_nodes = ARRAY_SIZE(lpass_lpicx_noc_nodes),
 	.bcms = lpass_lpicx_noc_bcms,
@@ -2126,16 +1724,7 @@ static struct qcom_icc_node * const mmss_noc_nodes[] = {
 	[SLAVE_SERVICE_MNOC] = &srvc_mnoc,
 };
 
-static const struct regmap_config x1e80100_mmss_noc_regmap_config = {
-	.reg_bits = 32,
-	.reg_stride = 4,
-	.val_bits = 32,
-	.max_register = 0x5b800,
-	.fast_io = true,
-};
-
 static const struct qcom_icc_desc x1e80100_mmss_noc = {
-	.config = &x1e80100_mmss_noc_regmap_config,
 	.nodes = mmss_noc_nodes,
 	.num_nodes = ARRAY_SIZE(mmss_noc_nodes),
 	.bcms = mmss_noc_bcms,
@@ -2151,16 +1740,7 @@ static struct qcom_icc_node * const nsp_noc_nodes[] = {
 	[SLAVE_CDSP_MEM_NOC] = &qns_nsp_gemnoc,
 };
 
-static const struct regmap_config x1e80100_nsp_noc_regmap_config = {
-	.reg_bits = 32,
-	.reg_stride = 4,
-	.val_bits = 32,
-	.max_register = 0xe080,
-	.fast_io = true,
-};
-
 static const struct qcom_icc_desc x1e80100_nsp_noc = {
-	.config = &x1e80100_nsp_noc_regmap_config,
 	.nodes = nsp_noc_nodes,
 	.num_nodes = ARRAY_SIZE(nsp_noc_nodes),
 	.bcms = nsp_noc_bcms,
@@ -2177,16 +1757,7 @@ static struct qcom_icc_node * const pcie_center_anoc_nodes[] = {
 	[SLAVE_ANOC_PCIE_GEM_NOC] = &qns_pcie_mem_noc,
 };
 
-static const struct regmap_config x1e80100_pcie_center_anoc_regmap_config = {
-	.reg_bits = 32,
-	.reg_stride = 4,
-	.val_bits = 32,
-	.max_register = 0x7000,
-	.fast_io = true,
-};
-
 static const struct qcom_icc_desc x1e80100_pcie_center_anoc = {
-	.config = &x1e80100_pcie_center_anoc_regmap_config,
 	.nodes = pcie_center_anoc_nodes,
 	.num_nodes = ARRAY_SIZE(pcie_center_anoc_nodes),
 	.bcms = pcie_center_anoc_bcms,
@@ -2203,16 +1774,7 @@ static struct qcom_icc_node * const pcie_north_anoc_nodes[] = {
 	[SLAVE_PCIE_NORTH] = &qns_pcie_north_gem_noc,
 };
 
-static const struct regmap_config x1e80100_pcie_north_anoc_regmap_config = {
-	.reg_bits = 32,
-	.reg_stride = 4,
-	.val_bits = 32,
-	.max_register = 0x9080,
-	.fast_io = true,
-};
-
 static const struct qcom_icc_desc x1e80100_pcie_north_anoc = {
-	.config = &x1e80100_pcie_north_anoc_regmap_config,
 	.nodes = pcie_north_anoc_nodes,
 	.num_nodes = ARRAY_SIZE(pcie_north_anoc_nodes),
 	.bcms = pcie_north_anoc_bcms,
@@ -2231,16 +1793,7 @@ static struct qcom_icc_node * const pcie_south_anoc_nodes[] = {
 	[SLAVE_PCIE_SOUTH] = &qns_pcie_south_gem_noc,
 };
 
-static const struct regmap_config x1e80100_pcie_south_anoc_regmap_config = {
-	.reg_bits = 32,
-	.reg_stride = 4,
-	.val_bits = 32,
-	.max_register = 0xd080,
-	.fast_io = true,
-};
-
 static const struct qcom_icc_desc x1e80100_pcie_south_anoc = {
-	.config = &x1e80100_pcie_south_anoc_regmap_config,
 	.nodes = pcie_south_anoc_nodes,
 	.num_nodes = ARRAY_SIZE(pcie_south_anoc_nodes),
 	.bcms = pcie_south_anoc_bcms,
@@ -2262,16 +1815,7 @@ static struct qcom_icc_node * const system_noc_nodes[] = {
 	[SLAVE_SNOC_GEM_NOC_SF] = &qns_gemnoc_sf,
 };
 
-static const struct regmap_config x1e80100_system_noc_regmap_config = {
-	.reg_bits = 32,
-	.reg_stride = 4,
-	.val_bits = 32,
-	.max_register = 0x1c080,
-	.fast_io = true,
-};
-
 static const struct qcom_icc_desc x1e80100_system_noc = {
-	.config = &x1e80100_system_noc_regmap_config,
 	.nodes = system_noc_nodes,
 	.num_nodes = ARRAY_SIZE(system_noc_nodes),
 	.bcms = system_noc_bcms,
@@ -2287,16 +1831,7 @@ static struct qcom_icc_node * const usb_center_anoc_nodes[] = {
 	[SLAVE_USB_NOC_SNOC] = &qns_aggre_usb_snoc,
 };
 
-static const struct regmap_config x1e80100_usb_center_anoc_regmap_config = {
-	.reg_bits = 32,
-	.reg_stride = 4,
-	.val_bits = 32,
-	.max_register = 0x8800,
-	.fast_io = true,
-};
-
 static const struct qcom_icc_desc x1e80100_usb_center_anoc = {
-	.config = &x1e80100_usb_center_anoc_regmap_config,
 	.nodes = usb_center_anoc_nodes,
 	.num_nodes = ARRAY_SIZE(usb_center_anoc_nodes),
 	.bcms = usb_center_anoc_bcms,
@@ -2312,21 +1847,11 @@ static struct qcom_icc_node * const usb_north_anoc_nodes[] = {
 	[SLAVE_AGGRE_USB_NORTH] = &qns_aggre_usb_north_snoc,
 };
 
-static const struct regmap_config x1e80100_usb_north_anoc_regmap_config = {
-	.reg_bits = 32,
-	.reg_stride = 4,
-	.val_bits = 32,
-	.max_register = 0x7080,
-	.fast_io = true,
-};
-
 static const struct qcom_icc_desc x1e80100_usb_north_anoc = {
-	.config = &x1e80100_usb_north_anoc_regmap_config,
 	.nodes = usb_north_anoc_nodes,
 	.num_nodes = ARRAY_SIZE(usb_north_anoc_nodes),
 	.bcms = usb_north_anoc_bcms,
 	.num_bcms = ARRAY_SIZE(usb_north_anoc_bcms),
-	.qos_requires_clocks = true,
 };
 
 static struct qcom_icc_bcm * const usb_south_anoc_bcms[] = {
@@ -2342,21 +1867,11 @@ static struct qcom_icc_node * const usb_south_anoc_nodes[] = {
 	[SLAVE_AGGRE_USB_SOUTH] = &qns_aggre_usb_south_snoc,
 };
 
-static const struct regmap_config x1e80100_usb_south_anoc_regmap_config = {
-	.reg_bits = 32,
-	.reg_stride = 4,
-	.val_bits = 32,
-	.max_register = 0xf080,
-	.fast_io = true,
-};
-
 static const struct qcom_icc_desc x1e80100_usb_south_anoc = {
-	.config = &x1e80100_usb_south_anoc_regmap_config,
 	.nodes = usb_south_anoc_nodes,
 	.num_nodes = ARRAY_SIZE(usb_south_anoc_nodes),
 	.bcms = usb_south_anoc_bcms,
 	.num_bcms = ARRAY_SIZE(usb_south_anoc_bcms),
-	.qos_requires_clocks = true,
 };
 
 static const struct of_device_id qnoc_of_match[] = {

---
base-commit: 1a1de54f7369cd2b5bac0f265910e60ad3a6b4c3
change-id: 20260915-icc-qcom-x1e80100-revert-qos-enabling-e5081016bb3e

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

