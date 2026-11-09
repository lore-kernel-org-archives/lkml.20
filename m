Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794238544;
	b=dJHi8/L0WtysUDV8oQ/YiecDLSTFlV5qsFUU2CW8edGFDSCIE9Z7gxKgqdaXqOrHkEuS
	 c4GEAdXHMlpocaTJK31ESTvk7TleQP6CXNRr2NGLrYg3aydz2cQXHDw/WThKLC0QmRsL4
	 KtMWAqDHDlAwolwVCX12lmB5MFEIhSutA6gzO8Duv01vfSg2598YiLm6NTLP2KCSiX9D+
	 69Vo9tEcjkc4dAxNPTqowwGcYx5fPb9sPY3hmKIQ3DffB2JQMfJMCwv+EVIc10WYpug7T
	 jzWMDXvyi/qRFsT+eQFA8XdivrrSwS0PDNp5NKv0hRZ1j7HyjFQgDNy28PRJt89NXtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794238544;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=P3xzo7yW0pYDJVlMOqXZkgFcbijFm65y9Cen5oaT9u8=;
	b=pJZlsyy/zUg7htfZM86WnjUUtyMrIqp+ivHDWWAGerAMirRGsk2IHvQ+jKMbH2HzWpYQ
	 Ztq3jyc1Kjnu34tsfvBiR875XabPPw6AUxVvA/ub9Wobc1EaSGh1lZO8z5yCiNkjsFu5q
	 hSEt7grS6o/fj8qa/8uJs8SUitXWIzPCDoOfRDWfpnrkWwgcvI6VZZKjVb5+zfL4zecWE
	 QqIfwhidUokitF35nIm/YO//Kbn4GTQ1X2ugtZvAJ2rt0F/MYaevYFbgbbynSNyGgsXGi
	 NbN8CmUVAI1pdswb52yNzxSPi0BdttBGM2+FJi9es1HC54wQmX38vtGb6VWQCxg9uPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b99PDpB8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF81606A31C;
	Mon,  9 Nov 2026 15:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b99PDpB8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 184171F0089F;
	Mon,  9 Nov 2026 15:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794238543;
	bh=P3xzo7yW0pYDJVlMOqXZkgFcbijFm65y9Cen5oaT9u8=;
	h=From:Date:Subject:To:Cc;
	b=b99PDpB8WLn8a3+xE9o2JhLhV5c/U6b/EzaZhieoe6mI3gQHBtClClisCFP2RLFRw
	 9m/p+7Pw/QCSdts9Au1r+ic9dFB2aTnO5XhVse0YSfq9UMdDi5fcbXEmeyGmZ78Svl
	 e6yXVsV4+47q+ef44p0aY8Jp8ezEMjRqSn5B9sz06Z61cbcQ2pr/1n5yxkNXlhfW1b
	 KpeqWCEkWPODkcKjL444S2aA97SrXkMzsJ8ii9vj0yG/ugsuZNHGAUt+wsxSNLSvcK
	 fWjtxCJzbPlnN0bTj6hACjJkOn/1J8sUMhNGY8ibAxWzho5UqJ/Prdjj/LBMK7qa59
	 usLgPLNsTKDgg==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Mon, 09 Nov 2026 16:35:37 +0100
Subject: [PATCH] soc: qcom: socinfo: Add missing PMIC identifiers
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
Message-Id: <20261109-topic-socinfo_pmics-v1-1-ecdb6cc6e40f@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQqDMBBA4avIrBswAf96lVKKHSc6gknIpFIQ7
 27U5bd4bwOhyCTwLDaItLKwdxn6UQBOvRtJ8ZANpjS11mWnkg+MSjyys/4TFkZR2GBfta3FbjC
 QyxDJ8v+6vt635fedCdO5gn0/AKXqQb13AAAA
X-Change-ID: 20261109-topic-socinfo_pmics-c7ca588fc9d2
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794238540; l=2228;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=byoiCnq4fMvj0a5ymi4DksNfLu5e0HjqT2asVyPHs8U=;
 b=G1k0zxWCTj1I0egF/AKdGEAcyXV5YvEPsosuzTo9LHPWDZkQPGP+F+UvHsDqDxE1N2BdHG8WD
 TqGiu2plQoXBWbHWx4Tx/vgZTiyt33qrhybDU/UtHEFWea/ZxRcaJAn
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Many indices within pmic_models[] were skipped. Fill out the ones I was
able to confirm and leave comments for values which to the best of my
knowledge are reserved.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/soc/qcom/socinfo.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 38efc5db7fa8..6ed8a4686e2b 100644
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
@@ -172,22 +179,40 @@ static const char *const pmic_models[] = {
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
+	[69] = "PM8550VS",
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

