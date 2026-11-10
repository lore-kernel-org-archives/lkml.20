Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794297505;
	b=LYGGrldRhbxta6wHYChr0MXsyM3YXFxmSALGDsDlO1vtcchPQ1mJ8iLKxnxP2kssTMB4
	 wX1MC013rb4kP9evR/UuO4G8KxYqkpHRNClxDMOgtDREfHO6E59lfwi3vb6G+gm1QlpDP
	 ZMVvXfUEfBlvjmj31V0vrsAdAISCfFMJ7M5l/qwOPpWzd4uJiBU0CUMFX2PJiZqWaQBtR
	 bcVqBYW2SpSXub8DBkjtrcrewvOmmPJQlcaXp6GgI3iM7YhEQqs4/cB5X1NyaEFDGR3F9
	 ZPlm/tWAfpMCs+XgMyOK4BhP2pe36Miurym5kHaTnJWWLFfy8IV1oG1ho5R570UGwOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794297505;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=8SzBYWlrvwPCCHwu07tXjnrpYf5pl0jf1joi1XFugQ4=;
	b=UZKi63RUcKkK5Oo8wbrRJd/6RH/E2s/4GHQnwo2mFJkPsp95fb4IlPx552Th3AStUeIL
	 t1bXpwtDoOwenOAmv/0FT7Q84KuryHwx78muRi8aG2q4JeIyQqBVx/MaTCZqBmTDJvhBX
	 g9Hl02qte2GsWHtTzviruGPHBzYxPsM/enyEg7mlY/czFpI5gE9lCqyJULz3iKEzOiyzB
	 w4W/k6BiuD07q8W7Yq1wSTO4u7SUfh/EvhXYxDtFF/D74aufydAQX5wAcYjb5vLRuP3By
	 DY8xcst42KdMmFkVa/OFJya2GZk5cOyzsvzT1Yj6lZGseNEOdxTflrLTo2sYJkLnNVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IJxMwXS+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8FA606A31C;
	Tue, 10 Nov 2026 07:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IJxMwXS+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1AEE1F0089F;
	Tue, 10 Nov 2026 07:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794297504;
	bh=8SzBYWlrvwPCCHwu07tXjnrpYf5pl0jf1joi1XFugQ4=;
	h=From:Date:Subject:To:Cc;
	b=IJxMwXS+Dt2bD2Czn6v3NdODkQ4R/YYkMPVrNOmvl5KL5xx2fSor9v9sAekXnrb/c
	 k9XhL0QafsULb9NUOMCL2tQBzxhmcLiSr3WAD8rhOBvlATbpMbHXTCnq0sBZ4g6HTv
	 x4wKSGTjjl0e8R+IwN1KaMbA2+JCBaYYdBvIFZ4bqZTC16/muA7FkApqCJSyDcOcnH
	 PAcwhqaGJJ+MPIAsEuy9VgvMC2UW5mrNu23fyYZPIGpFMe5iUbzbfZyTVjE16ortka
	 3ZUrz9/AIaE3qzx2Dm0zZZQtbBQggGV8rtcQO4B8Af2Zjv4ExlQDry79euzSfyAJ2x
	 xyhmbwvQNvtWg==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Tue, 10 Nov 2026 08:58:17 +0100
Subject: [PATCH v2] soc: qcom: socinfo: Add missing PMIC identifiers
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-topic-socinfo_pmics-v2-1-14811aa728c2@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NwQ6CMBBEf4X0bAltFMET/2GIgWUra4TFLhAN4
 d8tePcyyUtm5i1K0BOKukSL8jiTEPcB7CFS0Fb9HTU1gZVNbGpMkuuRBwItDNQ7vg0dgWg4Q3X
 KMgd5Y1VYDh4dvffXa/ljmeoHwrhdbY2WZGT/2bWz2Xr/DbPRRiM0dQqQ4jFxBYvEr6l6AnddH
 EKV67p+AWtrLNnPAAAA
X-Change-ID: 20261109-topic-socinfo_pmics-c7ca588fc9d2
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794297502; l=2565;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=MRA3pZrfDPUVroevO92pCHHZ6IS849mzcF4oIC6Rne4=;
 b=uhFuY/0Swh8C3zwK/tirYV/AgxBtaa5Dart1bC2jGlNj49UKv+I/y1eVNpetagUjiBC5afbZK
 EzGu10DB6+fD8AQFjhlo5DkUmkoFMyYgga0Z0RL10h2ubsxRGMMPfB3
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Many indices within pmic_models[] were skipped. Fill out the ones I was
able to confirm and leave comments for values which to the best of my
knowledge are reserved.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Changes in v2:
- Remove duplicate entry for PM8550VS
- Link to v1: https://patch.msgid.link/20261109-topic-socinfo_pmics-v1-1-ecdb6cc6e40f@oss.qualcomm.com

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/soc/qcom/socinfo.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 38efc5db7fa8..563f0e3750bb 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -154,15 +154,22 @@ static const char *const pmic_models[] = {
 	[25] = "PM8917/PM8937",
 	[26] = "PM660L",
 	[27] = "PM660",
+	[28] = "SMB1355",
+	/* 29 is unknown/reserved */
 	[30] = "PM8150",
 	[31] = "PM8150L",
 	[32] = "PM8150B",
 	[33] = "PMK8002",
+	[34] = "PMX24",
+	[35] = "SMB1390",
 	[36] = "PM8009",
 	[37] = "PMI632",
 	[38] = "PM8150C",
+	[39] = "PM8150A",
 	[40] = "PM6150",
 	[41] = "SMB2351",
+	[42] = "PMX55",
+	/* 43 is unknown/reserved */
 	[44] = "PM8008",
 	[45] = "PM6125",
 	[46] = "PM7250B",
@@ -172,22 +179,39 @@ static const char *const pmic_models[] = {
 	[50] = "PM8350B",
 	[51] = "PMR735A",
 	[52] = "PMR735B",
+	[53] = "SMB1398",
 	[54] = "PM6350",
 	[55] = "PM4125",
+	[56] = "PMX60",
+	[57] = "SMB1394",
 	[58] = "PM8450",
+	[59] = "PMX65",
+	[60] = "PM7325B",
+	/* 61 is unknown/reserved */
+	[62] = "PM1010H",
+	[63] = "PM7325",
+	/* 64 is unknown/reserved */
 	[65] = "PM8010",
+	/* 66 is unknown/reserved */
+	[67] = "PMG1110",
+	/* 68 is unknown/reserved */
 	[69] = "PM8550VS",
 	[70] = "PM8550VE",
 	[71] = "PM8550B",
 	[72] = "PMR735D",
 	[73] = "PM8550",
 	[74] = "PMK8550",
+	/* 75 is unknown/reserved */
 	[76] = "PM7550BA",
+	/* 77 is unknown/reserved */
 	[78] = "PMM8650AU",
 	[79] = "PMM8650AU_PSAIL",
 	[80] = "PM7550",
+	[81] = "PMX75",
 	[82] = "PMC8380",
 	[83] = "SMB2360",
+	/* 84 is unknown/reserved */
+	[85] = "PMX35",
 	[86] = "PM8750B",
 	[87] = "PMD8028",
 	[88] = "PMC1020H",

---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
change-id: 20261109-topic-socinfo_pmics-c7ca588fc9d2

Best regards,
--  
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

