Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794807288;
	b=rI9ofy5gZEIMx2EY+p0kSXmtuljzlq8/aK5sAdi28HJxZxweTqnmjeVGSmUAxqy2EznN
	 htJWFb5+Vg5SE4HgaY+Fd7nAEDqnYu7JU9WqAkrNXV16TgbJtm9Vt5uaJhnAKzYVJ0BpZ
	 nEXBAuOURsmgOKJkCw4G67mePS4puYz8u8xPdQqZ+yST0sW63AwYholESloCaV1fGXlmV
	 LgrJ0xtdgI1lt+p2v/FjNaCHvd1Ea9D1mbW33gbhr6bq2VEl5F6U/wiXVCyAwwSjYGtDg
	 VY8rElrAA2X7vqXKfTsS0SS5noABFs6aZ4hAyUOLRj1QhNM4xyxOBDpITCC1YCenGtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794807288;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=5rM15kA/3Ad56jxYSDQHLL64BhEdYv0msAd9naeCreY=;
	b=Y9XSC+s9Bor/KCtnoyiix+SxX9LN1ccaJQQPva/rWErqzE59UTNnGlX4J3czq4Q4wj7U
	 7IC1j9smSeSpLLJkkiBUXKp7lP8soPNrJqS+xWQ1NT5D/bjNLpIHpDSVN86T4YhSYgvn+
	 4+AKg9O3Tbyj3vB6dVsjVyTWKYBngREYo846ec+UXiAis0+RTzgjdOSjWIoAJu+pHKzQw
	 wG4EqPJbBQROwTE5hJSpKSJKdEk/lmCMM0XJAJcoL6bTCmrjNzjIdZep7+5U7DZ2ga6ix
	 usvc6VqrOz4o2vgTPfdoZUoLs02ld6eJdwoC6lrBRSJFIJcEGsQv01d3fsNh1MkkMSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n+2iokkR;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36551606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 05:34:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36551606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n+2iokkR
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1b3acec6677so4114584c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 21:34:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794807287; x=1795412087; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5rM15kA/3Ad56jxYSDQHLL64BhEdYv0msAd9naeCreY=;
        b=n+2iokkRZK+TEW9Uoe26sTwdl6Bu2lE99yd52n8ChO4uZf/u1bHjSHp9yfWrGO+EJv
         TyBoKf5NgbgZmI2rrUP37IdSsFFGvHtw2Il30IWRQMQ0THhAI889Np7KNzJziB0B8GSf
         dwUwgj8GGLSzqPEDC+lRKzbY+m0+IPxIou/SLQxGSMaONwaWCGWJznb/uDeYBS+DFFrU
         zIAT4/l/1rBUEMkQ1w7uHPVEdNhbMTGN2PeaaQ5ZJCTz6jI8TiALOncGRYpE0dDQgqTu
         xkMsBK1BKkC3f6hx+mqGYqDFRtZgXQBEiVJZLnnkFByT6qnL0bNKZ8FoUERnH/xFLJOC
         T2gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794807287; x=1795412087;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5rM15kA/3Ad56jxYSDQHLL64BhEdYv0msAd9naeCreY=;
        b=079PJTtMlLWdbxwLHpcIqZEwIXLBRJM/znRDaLPYUhyQRmVX6qKHX4PfZFy9a5Sj7s
         t3xMmC+HdQ6naCVvLKP/RBp54i1+8pXRfBhXKu8Mftr5IcU4wwmhL8BnCOshsUDECgl0
         5e3HeHjEj+t0DGvBan0r5m3Jm/Kw7V6Vy78B2lvKu4GS6detdGlnjhamkfHC8ZYXlNJR
         N+k9KdkJK53hlmIyuJa0tIaM+a9xQCN+fvwhj62kq4bUDIkFRH4YF4vL08IkwE7yIKKK
         FnI3BkUt/pNUgjBBe2NOVkKJBxPsE5NjBx9RYBKhCq1rzD2DPMpiFVw2yn17IdgFsslR
         PYpw==
X-Forwarded-Encrypted: i=1; AL+hErFTPCuGaN6BDCOHha+OznRPvyTst8iLGd9quQnmbaciTSQUg8pJR35A89lbPDhIJU5dP5Y36hNgLfq4Nyo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9dR8FN+y2TW0p77IKVIGj0taUnQ5a+lBAcnMiYDb8YjwF0VLGx
	be/LG5unAuzYFVmbIFbYuE6u0yThHh4rxJhii+fL4W9NiY0M6QmwHI9V
X-Gm-Gg: AYBFou0DPLtI59evI8MvWa8jl1NV/ookgbMtGKw1OXuZRN04RMo+k2yF8FKc+JrBxAA
	eCXA2zUUbHASnvWCoULmm63iV1D7zBz9IO+NluwmtrAWeJ7D0H4XsFXjUHauh7w4tKjGpw4rSZ+
	6Zr3Z7SryOSMX7oXaAJGZKMzjKKP1MiLdhBjKmd4LOL2sT8VUXEHNUQ/tucZTfXqUz6yho2HnfE
	wTPKm462kPGMRJZ0n375wIJtVHJdMk9bN3wpnnLR0qbqfv6R/MrsCEc2jdufQyECd7ezhI+o99u
	JOR2b9BtFJjKhg9bIBJNp7YPvG5cadKIpsGBz/v27+W83c7PSQBntrDLNljxe300QCeJwvmOCm9
	GHz1T51E6RSy0JIgJmuTHohWJhdWeUF4TCXmfFqp47XINIHR+7dlVH+j/CrBbkd1t5uES4a1qgb
	PVhm+/NK1zm6DIbcDeOUSc3Gy46lKAxhtVVuC8U0FtvjWE4CTpoCevkWvwHQM4MqcqW9PqIv63Y
	v6SGDaSqclQVxeXUE+1U2aM6wWr031luy+M2UBCWCq4IKn+PuGJnGKnuZNa6D2Bw4lpIcEQ8xhe
	vQpThnRA2ckso+7QnYM9Q2n5BFbGmZbzGl9h63PBdY0XmZVLE53Er0IIG6jv9WEyy+RccGpOZNA
	23Vq6vg==
X-Received: by 2002:a05:701a:8148:20b0:143:8860:afa1 with SMTP id a92af1059eb24-1b50316df64mr9955968c88.46.1794807287090;
        Sun, 15 Nov 2026 21:34:47 -0800 (PST)
Received: from Sobhana.localdomain ([157.51.206.8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm33463380c88.5.2026.11.15.21.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 21:34:46 -0800 (PST)
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Mon, 16 Nov 2026 05:33:49 +0000
Subject: [PATCH v15 5/8] thermal/qcom/lmh: Add support for Qualcomm SM7250
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
Message-Id: <20261116-sm7250-v15-5-6acbb232fef8@gmail.com>
References: <20261116-sm7250-v15-0-6acbb232fef8@gmail.com>
In-Reply-To: <20261116-sm7250-v15-0-6acbb232fef8@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 Robert Marko <robimarko@gmail.com>, Guru Das Srinagesh <linux@gurudas.dev>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Sreeshankar K <sreeshankar0910@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794807229; l=1844;
 i=sreeshankar0910@gmail.com; s=20261029; h=from:subject:message-id;
 bh=0aHr8uXlv4TK4AaeOqsI9fktXurd8KpAEVij0MwE3+4=;
 b=oyZWGR5pSPPZX77WXX7hnPsAue8+y2mhe7hy1SG9KxFMmCj1J3kYO2QrQMMnapinDlETzfF4o
 2MdgrgZPGK5Alfe5SOZj3BGrFM1mZYVwWDCY4CWaT3pkEyqJeLR3wgt
X-Developer-Key: i=sreeshankar0910@gmail.com; a=ed25519;
 pk=CGSHduvtn2hwLCNRXRc9s/fh6X8PH/zNdp08zC8hOuQ=

Qualcomm SM7250 features an asymmetric 6+2 core topology where the
Silver cluster consists of CPU 0 to CPU 5 and the Gold/Prime cluster
starts at logical CPU 6.

Add the SoC match data defining the CPU-to-node mapping (CPU 0 to
LMH_CLUSTER0_NODE_ID, and CPU 6 to LMH_CLUSTER1_NODE_ID), and register
the "qcom,sm7250-lmh" compatible string so both LMh cluster instances
can probe and register their respective DCVSh interrupt domains.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 drivers/thermal/qcom/lmh.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/thermal/qcom/lmh.c b/drivers/thermal/qcom/lmh.c
index 9d66d75d8..cfb498f69 100644
--- a/drivers/thermal/qcom/lmh.c
+++ b/drivers/thermal/qcom/lmh.c
@@ -110,12 +110,22 @@ static const struct lmh_soc_map sdm845_map[] = {
 	{ .cpu_id = 4, .node_id = LMH_CLUSTER1_NODE_ID },
 };
 
+static const struct lmh_soc_map sm7250_map[] = {
+	{ .cpu_id = 0, .node_id = LMH_CLUSTER0_NODE_ID },
+	{ .cpu_id = 6, .node_id = LMH_CLUSTER1_NODE_ID },
+};
+
 static const struct lmh_soc_data sdm845_data = {
 	.map = sdm845_map,
 	.num_nodes = ARRAY_SIZE(sdm845_map),
 	.flags = LMH_ENABLE_ALGOS,
 };
 
+static const struct lmh_soc_data sm7250_data = {
+	.map = sm7250_map,
+	.num_nodes = ARRAY_SIZE(sm7250_map),
+};
+
 static const struct lmh_soc_data sm8150_data = {
 	.map = sdm845_map,
 	.num_nodes = ARRAY_SIZE(sdm845_map),
@@ -266,6 +276,7 @@ static int lmh_probe(struct platform_device *pdev)
 static const struct of_device_id lmh_table[] = {
 	{ .compatible = "qcom,sc8180x-lmh", .data = &sm8150_data },
 	{ .compatible = "qcom,sdm845-lmh", .data = &sdm845_data },
+	{ .compatible = "qcom,sm7250-lmh", .data = &sm7250_data },
 	{ .compatible = "qcom,sm8150-lmh", .data = &sm8150_data },
 	{}
 };

-- 
2.43.0

