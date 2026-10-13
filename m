Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEFC84F68CE
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 12:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791895764; cv=none; b=IioTBhtj/kMPtezn8qKlKxna9QhBDnKWkhT1ZcaXBKQML3kIBk6WB5STJUnoJgpYKgwkgj0uWoc0zbmFy/SbVevOTb/P3u1nceQMGm5NNcr0xu6/pyGmcfED9BGZz+/4vaDrSG2ChoX+LH0MGx44ihl0rwhdyvXr2a30KpQjZw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791895764; c=relaxed/simple;
	bh=b9uNQFPyon1Nkfa1BGZz4J1Q61BhK/8GrLO97o/igzo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pyI2RDy1uxkqzzfoHlwNE4nI/TwxedhH0VpxD6IvsoM8TYqhsnZUmhsZLg6J5jfe109UEMAFwyFDXQJST3+mhkeR72DPikHBkdr2/f/D9lRPVxHy8/YrfNZIJt0sRtRWH0VXZo5c9gva10B0n74R2pagIJTZ4OVYmYzk41bKcrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T7dBMLTI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TvSLtx44; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T7dBMLTI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TvSLtx44"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8xvXh790856
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 12:49:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vm4xU8oQLv8uyf2zachTCzY7k+RLBTFtPS938xas440=; b=T7dBMLTIw/HCaKVN
	VZtt8uI87P3lPKQNkq5XVh/gGu+wDkYcBuizznLQFdi5hKKstBptdC7OGAyqOZfO
	zBnZP1EHAlTWwjyR/l/x0LaKX5EBFmyaIB7f0Yw1mrK+QnCe371aI3pQYZGF2LFb
	C4g99h955aWL3atLI/M0fM5ZH5A7F+bL2FHkLdqWFA+TxkEJZoeykkF53rit8UFV
	T/LII2+I5MmUBS2a7v1T7WuC6Wh87D4oH3C37kEcQ2riPxNssDQilRNclBiEHNNT
	oO+ZuN6YZgFH5ySOre9J7gHtk0XzZXrcuN5Jl7w1awMUf3ntoxbGP+pBL9WFPXcD
	dpd27A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9hmjrwnc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 12:49:21 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93ca9b53afaso812371185a.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 05:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791895761; x=1792500561; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vm4xU8oQLv8uyf2zachTCzY7k+RLBTFtPS938xas440=;
        b=TvSLtx44uOYaUDZyYelqStwD5jxL7kWP1QRboe7lqSLCS+CuQwDnwyu9CUrRd8BS2A
         A1lMY7au8Qg+dI+RlhiF76IMvJnnpp0f/LcUxokhoAf1GVsaOupLK0obeumUXvS50gYf
         FCydkcViXa1B32QPuxyTdw5/UC9W/IXNuLXjIhU8gXxfr3WpOCIRoBGLRibL8UOGQ8WX
         9LjTSjH9iheAv65X1M2MkKUsTeP5fietsUsza2p7PHp8CJrSKGg0Nd5O55cGVYOby7BR
         Oz2UIzQrsz1oBsxBxn4ODn4MFuzVudIRzFQX67ogLL7FqJ3gX5OIJI2DfmExvBhP4Uz+
         w4Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791895761; x=1792500561;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vm4xU8oQLv8uyf2zachTCzY7k+RLBTFtPS938xas440=;
        b=iApvMHJBp8RuK9hBGN35NKv9+NB3kBJP6UJccNSeuwavyBRf8cQ6nU81fNXP12jhHL
         6nivk9NLkWB/cbjIPoxOUFBMOF8AqmT14S1t5uy0SJO38XbH3my+SFU1qWKdk4Wvv7C/
         y/PMZQKJF0gCva1aeiIwy/uyBAHgmJ4GNUKwHD5PCclJF3VjL7JR5z2U1GvFSayY6ODg
         kq3O+lu91A4Glr4vQ8tAfScNDywGQS4b9ZLpQvTQKK+Zox+bHCXOfsbogcfPVUC0ZOxm
         mDMrau9tnx36FEIKH59czNjBCBmIJmKM9cJbhNOFnAr4Z3Yfn99Lnzvxs7EU/GOxidYJ
         BmpQ==
X-Forwarded-Encrypted: i=1; AKwUvBxLNF/jAEapdGywYSpphdbZkdxGky4bp3Q/mH3+s6x+sJTbog0fzMB3+QVG2iEI/UC5g1u3GmwOyORXcqI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLhqhGe2EHU6aGWXSDQxKRWeGwxcYUlOY8wLTlU+feA9fEOoosP
	krVQaYMU8og+iv31kg9vAh/nRBLWPgpP88wJjN0QnAqA14nP1deWiSeXduSZpa8efba1CGGr0qs
	EeeBH5zEqwz8IYK2Wd3woMvH9QBhka43yiXcyvtnN7Lj8QjSkOba/mTBmXjIG0mF0feu2ml9mI8
	0=
X-Gm-Gg: AYBFou38lXahRNUzYzITveIqa563ThKcWWU4IZ35cuJVyrRuYHqiL2bBLLEigsEqFhX
	qkF0bJ4IQ6/bpA9OMARgGuirc9yTRs3mzhyPgqtkHT5o4bpIvcmVDSXTKFOf77xJcNA0P04jk9j
	xWDC0HfG0XEDYYY7W+wwNoXE2dSQMlrONf8jHHaIA7q+OyDSFfYBmFT4bhnBsnH025qkafZwXSD
	lYzIYIe/WIwna80zGiqGPb+z0c4wtyoEh/tX4vGi6Sx/sDCVSP2V/a6fXl8huWvRSKt5S7Rld+8
	RT03ZP1FT7fmQK2Bo/rUKk4ox0yHHQHURx6Q4asOTEqGxKK/qsGkGrAIJbboSFLpNoNp9KRoCuC
	WbLhZ43lV
X-Received: by 2002:a05:620a:2988:b0:93e:b9a3:f47c with SMTP id af79cd13be357-93ebd246acfmr2003996585a.34.1791895760710;
        Tue, 13 Oct 2026 05:49:20 -0700 (PDT)
X-Received: by 2002:a05:620a:2988:b0:93e:b9a3:f47c with SMTP id af79cd13be357-93ebd246acfmr2003992985a.34.1791895759940;
        Tue, 13 Oct 2026 05:49:19 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.215])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ab6361sm4351081f8f.32.2026.10.13.05.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 05:49:19 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 15:48:40 +0300
Subject: [PATCH 2/4] pmdomain: core: Prepare boot performance floors before
 system suspend
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-genpd-boot-performance-floor-v1-2-a765dc83e6d7@oss.qualcomm.com>
References: <20261013-genpd-boot-performance-floor-v1-0-a765dc83e6d7@oss.qualcomm.com>
In-Reply-To: <20261013-genpd-boot-performance-floor-v1-0-a765dc83e6d7@oss.qualcomm.com>
To: Ulf Hansson <ulfh@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3217;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=b9uNQFPyon1Nkfa1BGZz4J1Q61BhK/8GrLO97o/igzo=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqzijGYxlUUuri/lNeG7eC/U7HgteZ4uDhrl0te
 KyIguX1OrCJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCas4oxgAKCRAbX0TJAJUV
 VuL1EACCj73YIsYWqF5lOjal7V7poRQGz6bx0fHmejZtmqzGxpJStVURQYNRVRbUIriEUYze8my
 fbEntYfKbXbSIzR3qfqn7vpvTyrscR/CrpZLM6M+rgpmmoP8HTDYkMBuFpEl/UumTI3lg/d+Rgc
 Z0R6WllxSO4baSVwPBh2IIY9DnbEGLmp1qrW7dw08pAqsdu+N33I6tEDQ28clQAv0NHc98lQTSJ
 AhkzGoCXMItZrwUmdbiKoUnS9fMWK29GPbQowaudcWpXfj18MbP78Cq0wwj7qfkLsxfHicc+Zhl
 gDKYfASivyBn/0DVJw2IFCB/WLUosS8ssN/9pJPb0SmU087N0+R/prvpxzacGIOKCqEm3GoLypO
 ajKBIxMhiZrXBA9+yBQvOj8O8+6du+6WXjTNGLyMzC/ynsILaBDIwTfepi6TAUIYNO6bn00U5sx
 KXsxpZL4j7CAsAwG4xSd4kyadUh595fzRbXOxvwVWsRZPTurDqYz4clqekv2O2SnU+jb8SLgzkN
 6mI86vh27mBW63J+gGby6P0R64taFn96PicM5d1SfJTvTj7bq0zbpNp0TPaHOPJEeFCLry1O790
 UuRYDCn04UGqJRLFCVhqYZVlphVlfReYPiO/lQ382zVRhM194SWk6sY2gvWb+1ZkfQhHh//NOiY
 D/cZ6I2xWHQl/dA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA1MCBTYWx0ZWRfX19EDYANZNSp1
 7KSDeRcqWnF72JVv+QByOPtxCpLNpA4XpyY6ADhew0epP+6Daol+/OlbiQcQ8d0E6aY5MApHsIf
 xkxeMGINDIHrqwpcTG9PeFO83Zw/c90=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA1MCBTYWx0ZWRfXxUsSlYIzOzIn
 NDJxa4kyDma9qa8X3IewA7Ya4myV0cs/uVxuAwLZv13DSAWOdIv1pAN4JU3TSwA58JFQs16iqBQ
 WwahsD8wKEEYtW0yjmZXtLMHhxVPygiC7LNqCuD+CV027D0uJTYfmQOu2nKJX+B3wuC2hsKKF74
 GOk8seCIMVLVIBnKVQWvfsi2MqMXKm2No+7cV1MSXQs/Ay8IKaTdRy2CsBvVPznOGjMjhH03+hN
 dXrhGUf2Coif+AiNqj+bvUmX4avGXuyceOpnoNtBGkBUu0OyCO+Oeq/6gclJgQBRI2QAxz+U3Fi
 m2P3+MZ0RDs3bI++vXwb2GVHo3mrjddJWrh5gBP4XU9tc0h+vucnIzGkqxzJi7nuuPI1ruihBMO
 uZUgQGWjXPj8jSy0HqYffHS3CMYG3npCTUg0QIihHA8HYFjLChO0GiDVaLP7mHaEAltPgCazHw4
 vB5o2AYO8cmV4kxu8FQ==
X-Proofpoint-ORIG-GUID: _zwzMjIQYLCCRUeeKFFc3hpypdzeKEyC
X-Authority-Analysis: v=2.4 cv=O5+sLx9W c=1 sm=1 tr=0 ts=6ace28d1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Rt3kCFFBWhWisHNmluDamg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=u51hWZNLl4U8JzI3j34A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: _zwzMjIQYLCCRUeeKFFc3hpypdzeKEyC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130050

A system suspend can occur before a provider has received sync_state().
If a domain has not been used through runtime PM, its boot performance
floor may not have been applied when genpd_sync_power_on() enables it
during resume-noirq.

Prepare boot performance floors from genpd_prepare(), where performance
callbacks may sleep. Walk the parent hierarchy even when the device's
own domain has no boot floor: a parent without direct consumers would
otherwise miss preparation entirely. Take parent locks in the existing
child-to-parent order and propagate preparation failures to the PM core.

Also retain boot power protection in genpd_sync_power_off() for domains
with a boot performance floor. This prevents the system-sleep path from
withdrawing their power vote while boot protection remains active.

Keep performance programming out of resume-noirq. Domains with their
floor already satisfied do not need another performance update, and
no floor is imposed after sync_state() releases boot protection.

Assisted-by: LLM
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/pmdomain/core.c | 35 ++++++++++++++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index 6f2b406ce049..4ff55175d899 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -1538,7 +1538,9 @@ static void genpd_sync_power_off(struct generic_pm_domain *genpd, bool use_lock,
 {
 	struct gpd_link *link;
 
-	if (!genpd_status_on_unlocked(genpd) || genpd_is_always_on(genpd))
+	if (!genpd_status_on_unlocked(genpd) || genpd_is_always_on(genpd) ||
+	    (genpd_is_power_unknown(genpd) && genpd->stay_on &&
+	     genpd->boot_performance_state))
 		return;
 
 	if (genpd->suspended_count != genpd->device_count
@@ -1623,6 +1625,31 @@ static void genpd_sync_power_on(struct generic_pm_domain *genpd, bool use_lock,
 	genpd->status = GENPD_STATE_ON;
 }
 
+/* Called with the domain lock held, before entering noirq. */
+static int genpd_prepare_boot_performance(struct generic_pm_domain *genpd,
+					 unsigned int depth)
+{
+	struct gpd_link *link;
+	int ret;
+
+	/* Parents may need a boot floor even when this domain does not. */
+	list_for_each_entry(link, &genpd->child_links, child_node) {
+		struct generic_pm_domain *parent = link->parent;
+
+		genpd_lock_nested(parent, depth + 1);
+		ret = genpd_prepare_boot_performance(parent, depth + 1);
+		genpd_unlock(parent);
+		if (ret)
+			return ret;
+	}
+
+	if (genpd_needs_boot_performance_state(genpd))
+		return _genpd_set_performance_state(genpd,
+						   genpd->performance_state, depth);
+
+	return 0;
+}
+
 /**
  * genpd_prepare - Start power transition of a device in a PM domain.
  * @dev: Device to start the transition of.
@@ -1644,6 +1671,12 @@ static int genpd_prepare(struct device *dev)
 		return -EINVAL;
 
 	genpd_lock(genpd);
+	/* Performance callbacks may sleep; prepare the hierarchy before noirq. */
+	ret = genpd_prepare_boot_performance(genpd, 0);
+	if (ret) {
+		genpd_unlock(genpd);
+		return ret;
+	}
 	genpd->prepared_count++;
 	genpd_unlock(genpd);
 

-- 
2.54.0

