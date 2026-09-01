Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3EDE4766A3
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 09:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788254785; cv=none; b=OpMDaQNHW3/2rtp6VheiCKfl3g18HQcAifZkA21b9KCi5YQ6VBBJWbPIK+s8TrSS8KVs/a/uWaE/fQjY7OXnxNXW0BM6EcnjDD6kOvRe1SJXaStBRSsaF1YVPWFFw920gHFXCxW8l+g63USI9Xj0suzxc9P2QfAWISgrzREXCTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788254785; c=relaxed/simple;
	bh=SL1wdM6vp1VIszL+xuNFr+53xhHZT8pJnJOiXD1KxBA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K2OfwQ0v1hdNgb0Pyd2MrOmLt76Zx3aGTZX0HlH2DM41mmvGEFuCJOxl95nhDnpdr/9AhYXiOhUECIzy3faF3m3oT65BiL7OS9jochqXKhBKA0I2m3PFeyW/n1xHqunN9GUVBAt2wD2CQTirYf4vHr2Y++ydZKoHS0hXLB/51U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wfjcv7CS; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wfjcv7CS"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-84e27035206so4416871b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 02:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788254783; x=1788859583; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RKT3VAzrTBQCbJUoz7WVF1Zm7cw9xcizV7Y1JN603Bc=;
        b=Wfjcv7CSNfV95EKHKsS0HtfoI+zeaZJr4NqeZhRIq8t5DodZDA34aWuKv1g/CvaqXA
         UTBkWeuke9tUs455N78MCxi644iUNsz0pmbXeikfRPqspJ7Niv3fY0BVy7fUHUl+gTMC
         1BWDK5/tcHUCh2GQN8VEpn5LxwFpMOOzMH0U03ussI2vdyQjQmcG/GaYjiHAhi6M8GlZ
         610bXsiBFRxIFPhmehCIr05ucpAmn6L7/6tikBIzG7kW6Cq3+StV57lu/lqxCgyz95qq
         oKEfuZEkwgaejnPvlbtr/prr1UyJTOn7A4y5oYMOwPiJFUonKG2h5MgYODQgJ6aXa7BQ
         SUNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788254783; x=1788859583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RKT3VAzrTBQCbJUoz7WVF1Zm7cw9xcizV7Y1JN603Bc=;
        b=BQpEIm98AzuID4d3/ntyKXelJPaQv1le7Vn2zFlJhVPhEpkW/Tv2Ra6mBPTcuUwYLC
         RC/uUz3iL2VysunLxknKuZsoP6r3K16NxuVgyq8/r6rr8TtX2GAGSKz0pij3150qaGpn
         vRbo15a128wY9c7sO1ot1bgjfDgA0kRZ8w1KRXGp8QyWmmv793P2MjnVFaqNgeFALko5
         aisfgxpmz0vLVekq90SaG3l4gUn+6fZoqQe7lly1cNYPCsBytLbJyWSwthy38plnDO7M
         S5dFapZBpDB5VzVvY7qno0RTa6aQIxfOnW/h1xa62S2cm41PjcrHLt4m9gN4YR/X0Udk
         7IqQ==
X-Forwarded-Encrypted: i=1; AHgh+Rofk79s/wyGlo/761EXrEGAMbJKsitYTF72uC/a7Tb5xUylRrZpIVoSJ0qfWiJeTzcTwwFWPfhaoKEqpIA=@vger.kernel.org
X-Gm-Message-State: AFuF++nEhn7Yaq7P0wARENdXTgmjiZGk+V3LHX2wRdjxi2gisxJNrhlL
	qm+uwD1pINylQAuTjgPhR6TL36wRvUutGS5Sq6fAqfviMiQxbNJLZm6q
X-Gm-Gg: AR+sD103wcc65noKxFg+Opf7f5GV58AceAi7Y+y5EM+C2v1tD2Gc0IjOjTLwEUR2flc
	rz0oPq3GaypaofRKch28wJNFzH0tLlnlvHLT99uyW8sWD94ZuDBi0zQpt364X/kqA6AlHPGGN+1
	oGX3GfL1D5ds/bBSk4YH4Cut99nGh3awUQSb4t/y8awBXyLenWqmecf7+fOSz45JOtwqUYvOIvk
	28WZXrsPqRxoaU58eElNytC/iZOmMZqz4p/c90BqDJiZ8fMFGtQ2kovF4kRyabdejVO9pLM8Jwy
	AF/vRnolrKZqVLtIqunnecPt5xJ6hJSPHhH8MeO+qb93QxWJJYI1N6txPNrhA4eH0k842PmZuOF
	U9/JAIV7WMLzaDQonKJLCmberSDNyJ7IdbFHuh+srwuN8M/m8EDnFrgF0dtKn5QDXhW7X+lqYfT
	FZI91icdqgVNUJAIg2rCYxNn1orfYGz5hEW3lKDEvoBJlYfiFiVl7stGBCiT4zIRVmVm2tTFuvt
	/+yXV8yAvC0
X-Received: by 2002:a05:6a20:6a26:b0:3d3:aec2:4dce with SMTP id adf61e73a8af0-3d7b0a5c828mr8639402637.26.1788254782938;
        Tue, 01 Sep 2026 02:26:22 -0700 (PDT)
Received: from localhost.localdomain ([157.51.207.128])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32b28ab0571sm30004560eec.4.2026.09.01.02.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 02:26:22 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: andersson@kernel.org,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	rafael@kernel.org,
	viresh.kumar@linaro.org,
	konradybcio@kernel.org,
	tglx@kernel.org,
	ulfh@kernel.org
Cc: radu@rendec.net,
	abel.vesa@oss.qualcomm.com,
	taniya.das@oss.qualcomm.com,
	danila@mainlining.org,
	davidwronek@gmail.com,
	mani@kernel.org,
	robimarko@gmail.com,
	linux@gurudas.dev,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v9 07/12] dt-bindings: power: qcom,rpmhpd: Document RPMh power domain for SM7250
Date: Tue,  1 Sep 2026 09:24:42 +0000
Message-ID: <20260901092447.3028-8-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901092447.3028-1-sreeshankar0910@gmail.com>
References: <20260901092447.3028-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the RPMh power domain for SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/power/qcom,rpmpd.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
index 0a45e1f55..e08441915 100644
--- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
+++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
@@ -63,6 +63,7 @@ properties:
           - qcom,sm6350-rpmhpd
           - qcom,sm6375-rpmpd
           - qcom,sm7150-rpmhpd
+          - qcom,sm7250-rpmhpd
           - qcom,sm8150-rpmhpd
           - qcom,sm8250-rpmhpd
           - qcom,sm8350-rpmhpd
-- 
2.43.0

