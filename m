Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBDCA370AF8
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789047900; cv=none; b=CZgRSQR4iUoBaqA5aQY3QONwPoISY09CeAlJJmeHwJJ5mvSOAAKqg8m9mQbD3f5mvhU1JIe/0TrgZQiCrn4065OHgy9++8TBVn3chAzemLIuqYQI5fxUKeozAeazu9fCUU1ymldIxeKObYbtfqmptfl8H3xscv7VpbQzfgTUgzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789047900; c=relaxed/simple;
	bh=yAOObz/AIdHG3iOb3awsiHXTn6dDKiIIA+wFnQlCPQ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=pLUqkysTMdkbrINBV3K81FQD3AsF6mG2+hRm5SXzAo4igqsOnZ8PxBgowT6S0aKQqjaIx5EZ/zoKjZsRDlLUKBM69C84xScOkKof8LR8AB1pyY6iSqIdgLLlYtIIvtva/427E5LFzZQ+rmxSoLjSCuaAmatPChploqG5UJWiPPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EREN1Rkg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eV0xyuCk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EREN1Rkg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eV0xyuCk"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC7e6H1440466
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:44:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=90M3nGvrXqV3vmxIDcDiZO
	q9BlRQ3msmPWs/D61mUI8=; b=EREN1RkgKkNorGB3FJBq4Wkr+z43u25BBOQfVJ
	GWQ2gFygTpdTICFpj5M2woNPbwKG5GnQPGktOubY5BLCWg8KAGMl+2eowothnWtf
	mCpYoEwfDI5IZGmLfikatN/I4VLNb4eIHsftiqj/5ZSdVkZkTBclUsAeC5D4r/BR
	ijoz4HvcaU+1M1wQH+G/f1TKMo+bIqNujEt1OVyIptm3fORPxbcaNeELyMS6LAzE
	z7VYRIA7nnSb16igkMXJw2NuI5wg7E6Oh3paUeH25I9o705rglQKtMgNciNQH54k
	05DBq94sky9klOjYqoJPvQaj40BBEQbeOhauUL1W5hbmar2Q==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkqsvsham-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:44:57 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-66f78d2f2a0so13049693d50.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789047897; x=1789652697; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=90M3nGvrXqV3vmxIDcDiZOq9BlRQ3msmPWs/D61mUI8=;
        b=eV0xyuCkS+XIX1zcdAyQG/QuYf4vrjNhQGFU7l4uclWU9XKJ4JULI3Teht5FLG8EZS
         O7y/HQVNz54an5po2vwZVi2E289mW95uhm0jucwrbHLU8nJ6UlkHd+T2iNtUexJrPrGD
         AnsnwsP190SRUN/xvUgL15HL3Il4VXyBsR31y0Yd144oSgawr+wzBUXfjKzUVyoDmeSJ
         nyBjS4Vaapcsf0P6E0ikXQRwY1E/KdeekmZ48Y2egA6lCD3hDwN6ytUpO5k26tIlwWw6
         VzSsVQaBFG7BW27vhCruCuveB3oP/XaLEShguishbSQvQAHhrBSz7czZ5YKvjOu/26sB
         krNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789047897; x=1789652697;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=90M3nGvrXqV3vmxIDcDiZOq9BlRQ3msmPWs/D61mUI8=;
        b=SmrvwBcR6j5cXd1pTOG9EDEkBoJrX7Kt8eTlmv6aV/wduIrHZcy3HmWn4iWGaI0Aq5
         qHIZDYOqVOBnHr91BemApa9I3fiWlFGPoz1Y7Rhu9k3gudbgny1FVTDWE4lC9x2HNxNl
         J3OKoPcSb+qxCYa0rQkKB98bqLyy0/Hb3+zmv7va22xSH9VtWSWTc/gwv8LSVuV8p4Sh
         CBE6OQO+BWu+aPKhZB6OrXXEZUKTC8mIbx7rRZZaH74cMB+HeZI9/krtLdCo8nnpDU9o
         d9Hr7fxwYsB72hVZBjHCajhxx6pQvnYncFdgh8LczhvfrNXdbNOxZBbE7rbN3Ic5uZba
         D8ew==
X-Forwarded-Encrypted: i=1; AKwUvByuyjYLmZdzwKcaqnsi+q+vNv6i6RmQfYIxDKsBaUbJO0rJF9oWJEAb6qy+Mx4JO78m7lSHzSOdHvP/UMQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kwwZcssVP1FFARW2/RzyVH8HdCmlu8zRN9zI+resFgJhEkig2L
	EUvqGKwurUSVQVGqPFIwjtzKk34xILs3uq94q2xJdi9rlFXPmA+ZwPhPbf+bCtgWn7zjyJhli/o
	Tl+DY1e4MIn8wq9MSFkHenCf9XPUi39lrSdbJTphQS/r7VEMJ9NARt/g9HNrPgJImbdXGZ5PMae
	Y=
X-Gm-Gg: AYBFou3u0VhJyfU9FeaXy5hL8PaDHlYryJbJ5FYsVE1v+f2osxb5fMm7cQ/o6yW7Akq
	jI84LQJobMdm8igSZ1KnrdxlVS8JeOj707u0c5GXM4gZeLt6NcDtntyiN0KOwbizB3/xWwcLpQg
	CsdCTkXJbXDF9J5odIKNmONmrlnHwhWLHJyI7mY11OMl2O5NnvuJPD9okj4Rf3RC90yMcy6Ms2V
	fYMiBqDqt5Daeu9HVij8tYW1rY0Od0CqM9v+p4U/B8kkSUpWJ1ppI67c9zYgZUwxhyIwGSgm2H1
	/Y15KRan1oifT7RZRkeHCO2h4IbTbKCQO8UkLYj3ywWgQ0CyB6JzF4Qa1BCyhLuDjEkBK7Kbpwj
	eLvA0NRDCDs2Z9A0iJtXXbP1liOWlcHg=
X-Received: by 2002:a05:690e:118d:b0:66e:5e37:2ff2 with SMTP id 956f58d0204a3-66fb5924e4fmr13912992d50.4.1789047896989;
        Thu, 10 Sep 2026 06:44:56 -0700 (PDT)
X-Received: by 2002:a05:690e:118d:b0:66e:5e37:2ff2 with SMTP id 956f58d0204a3-66fb5924e4fmr13912962d50.4.1789047896525;
        Thu, 10 Sep 2026 06:44:56 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-910406b0f51sm169931016d6.42.2026.09.10.06.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:44:56 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 19:14:47 +0530
Subject: [PATCH] clk: qcom: smd-rpm: Skip proxy votes on clocks for QCM2290
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-clk-smd-rpm-skip-proxy-v1-1-1cb5694a99d9@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFC0omoC/0WNUW7DIBAFr2Lx3ZWAADa+ShRFsCwNdR1TcKJEU
 e5e4lTq56xm3zxYpZKosrF7sELXVNNybiA+OoYnd/4kSKExk1wabrkF/J6gzgFKnqFOKUMuy+0
 OfS+1VpZcrwJrz7lQTLdteH94c734L8L1tfZnFPq5tOL61v6DY7flei7AK6inNBV3xHLP63Lcp
 EoQZTBB+8iV1+PVvBa9a3dc5jmtY4dmcHaQg9ABkbQyinY+SrcTDq2KWiiDXKFjh+fzF8BDKN0
 GAQAA
X-Change-ID: 20260909-clk-smd-rpm-skip-proxy-7725549ea74d
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>, Georgi Djakov <djakov@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Stephen Boyd <sboyd@codeaurora.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=DdOCOftW c=1 sm=1 tr=0 ts=6aa2b459 cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=LEU6kbCW_qzPNiS7DL4A:9 a=QEXdDO2ut3YA:10
 a=nd2WpGr1bMy9NW-iytEl:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE2NSBTYWx0ZWRfX4lJ+N0cWAGO5
 +3bKboP8LCTGxbMk4h0R1qS8uQlz/fcQvNbTQT5HwL7LVK7aoaRbtBCThP2fKO3CZJCQ6EkhFI8
 repJ5DOVM//dJFgq/7F1haCvtC3f5jsX5wLQ59II4nVWBKkyle13G1vzPfAL8Hl0tKiojadCQL1
 x2oDhevZosVtoTZi3DXRq6Qge70kP3IH4zNlfE7N+eMbcKucxZ5JiQD1hsfabGuuB0ijvfai7Ah
 Y+v367uVVVS/v1MqhzCPxWiK8eGDUTVZIjhiX/CBzN3nbXk/DbqiFltHqyiAHAJV1zYLAyHuIqZ
 ruCdnQIBDUBAgS/MY0LRzCxMbMeLmKEKfQo7is2bQJRSBsFtRW7nBKAaJpPs8ZKQB646Xduqzvl
 O8BG3ka5j0ak6pA/AuCX/ghU4aGCvEF/WK7WBrXbBRnrecONriu3kPWZIVWcHaisjFgpO/PIaxE
 ZGxVswJHmHUp8SsmcBw==
X-Proofpoint-ORIG-GUID: AO96XovqfvbSCV2fhU5udY3gOIoxCd4K
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE2NSBTYWx0ZWRfX72aVarjKGT0B
 TVIRBd/NAvSqCrDk3okv6IMEUs/jY6vQq/ryTB75BkxYJjuwqsk2Vb5ck9ORlmEUF5ytMGAw/MO
 oDzEdlujWe02hX5EjVM0I5SrH9j5L0g=
X-Proofpoint-GUID: AO96XovqfvbSCV2fhU5udY3gOIoxCd4K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 malwarescore=0 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100165

clk_smd_rpm_handoff() votes both active and sleep RPM resource states for
every clock, keeping them non-zero until a consumer takes over. If there
is no consumer, those clocks will remain active in the idle scenario as
well, and the sleep vote is never cleared, blocking XO shutdown.

Introduce the skip_clks_handoff flag to handle this on QCM2290 clocks,
keeping other targets unaffected.

Fixes: 00f64b58874e ("clk: qcom: Add support for SMD-RPM Clocks")
Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
This patch is dependent on [1], as crypto driver earlier was surviving on
the proxy votes on Qualcomm Shikra SoC and dropping the proxy votes will
impact the bootup. Now patch series [1] takes care of the resource
voting from the crypto driver side.

[1] https://lore.kernel.org/linux-arm-msm/20260907-b4-shikra_crypto_changse-v6-0-0676f61894b3@oss.qualcomm.com/
---
 drivers/clk/qcom/clk-smd-rpm.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index 487d715ed5d2..b78c8cc730b5 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -183,6 +183,7 @@ struct rpm_smd_clk_desc {
 	const struct clk_smd_rpm ** const icc_clks;
 	size_t num_icc_clks;
 	bool scaling_before_handover;
+	bool skip_clks_handoff;
 };
 
 static DEFINE_MUTEX(rpm_smd_clk_lock);
@@ -1280,7 +1281,8 @@ static const struct rpm_smd_clk_desc rpm_clk_qcm2290 = {
 	.clks = qcm2290_clks,
 	.num_clks = ARRAY_SIZE(qcm2290_clks),
 	.icc_clks = qcm2290_icc_clks,
-	.num_icc_clks = ARRAY_SIZE(qcm2290_icc_clks)
+	.num_icc_clks = ARRAY_SIZE(qcm2290_icc_clks),
+	.skip_clks_handoff = true,
 };
 
 static const struct of_device_id rpm_smd_clk_match_table[] = {
@@ -1358,13 +1360,15 @@ static int rpm_smd_clk_probe(struct platform_device *pdev)
 			goto err;
 	}
 
-	for (i = 0; i < num_clks; i++) {
-		if (!rpm_smd_clks[i])
-			continue;
+	if (!desc->skip_clks_handoff) {
+		for (i = 0; i < num_clks; i++) {
+			if (!rpm_smd_clks[i])
+				continue;
 
-		ret = clk_smd_rpm_handoff(rpm_smd_clks[i]);
-		if (ret)
-			goto err;
+			ret = clk_smd_rpm_handoff(rpm_smd_clks[i]);
+			if (ret)
+				goto err;
+		}
 	}
 
 	for (i = 0; i < desc->num_icc_clks; i++) {

---
base-commit: c68a982815dcce5464e3bf2a31ac94f5146c04ca
change-id: 20260909-clk-smd-rpm-skip-proxy-7725549ea74d
prerequisite-change-id: 20260701-b4-shikra_crypto_changse-f2d6d5bf04b5:v6
prerequisite-patch-id: e24447d3ab70f48b099251c3d6c1307e0aee9d2c
prerequisite-patch-id: 64e9302a1de7a654ffa65af12daff3866531a00c

Best regards,
--  
Imran Shaik <imran.shaik@oss.qualcomm.com>

