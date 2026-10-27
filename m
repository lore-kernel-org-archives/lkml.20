Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793134367;
	b=Pby3hQ1DFtyZ9tp9X2wimTGRyjjDHkKTXmr6wIzJzK2BoAeALlKIpV130JPrNeHf1TcJ
	 Shdc1KBLvBrudye+3y/FMY4T+teG8WDuJulQ7YBhEdxrbRlAQmv9L2cFjJCu1A/mFKDNm
	 3kwO66lB7G6QMaWtWvWvyjLJn41f/5VPm6jfZHrP6UfVeplnHuu42EP2Qf3YghbVQeKeG
	 QvjWD/P7gOAVKh99oe2drOophsxSm9UtZfhP6h6MvOTl/5n9buur+fGQ2F6VJlcg5p60M
	 3o/opbMeFbmLPcqvmbk4kLYvDeIqdXHWzGOfJJ37fCQUXB3OEUx9I3HwNjrqq1pQWEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793134367;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ypEzL1gFHlTg5t/NkvImMIT1oSedLsVHIjJyUl+/edo=;
	b=yWNLdOnIjYoc4soXmUDckU+echZW17p5YYq+GSO0mczxx0DHnsVlcZOdHfARRM0Afm+H
	 LvjOpK/+Er01ZJbeo6WKVQqBm6nyDf1g8dkXuFG4WirPBoNnfDBheXMBYKqpUND7dfYMX
	 mlW7D9mFD9Nn0GixKVpJJAHNyGEMjvxGz2Nhl8J5Jaex6rwPJjZHNSRQoarLKCMQj8vjc
	 rd0Fcboq8FhsiK29S6kLFjDKGMBxNLy1mSHQufnrgoFCa946a/DG82/TE9ZQFHM4fG2sk
	 Mfn1KjzyVOeRxAr+qG1BqQEq6HibIyQdxwfFr/s1BiFXVGkEkvI1btqp3ARtoz2cPiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HlSdKImz;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A32F1606A325
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 20:52:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A32F1606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HlSdKImz
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3ae2b7e1e17so188088a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 13:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793134366; x=1793739166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ypEzL1gFHlTg5t/NkvImMIT1oSedLsVHIjJyUl+/edo=;
        b=HlSdKImzgk2WYlBDUrX54M9HeRYTZ1bWEqP3eecZml5jDi+o3r/1CVeSCrqOsN73cX
         uljc8zWNVW4z6CdvOkNgflBltbJ+Cj7ZZFWeoC1dl0U6pUat3okGPtO/K4CtLxHv78MT
         hCI05ESMJDIuZPaUx0FGRDs5ikhkt6rSUR0DsRVLwQgivSQGa02wzeoOxw/qQ3m8PFCf
         KrMkCNZscnGz3+4208YcWJ6ga63Fa30abhgnzrAaSXkPtzew3pROSDwpR0bk62jTEVZS
         JtvVNBeSGjF2xFiRKVU58Foa5xhJS8atjbLcaX229j3AQVrDeWLYYDSXC6RhjARsgE0D
         0t+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793134366; x=1793739166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ypEzL1gFHlTg5t/NkvImMIT1oSedLsVHIjJyUl+/edo=;
        b=sZg4mw6fX4uwx90if/ui1hCDCuFXHD8XzqIqdtuzqisZ39LJ0AMuTKiRvkhw+oz/xI
         tbKjmpdPlOKOgPAlZWZvNcefb1JD7Qv4A7V/lgfiF3ZbKKqNjnU0B9wjjZsPStrPQyrD
         KKhH9r2mH/olOkeZAWzdl/tc/T015/RJO8Xvzkp1jkK8X6LS4L+qerESu3oTmo+Dstnn
         YehaPv8qScwajEV2BnEru8aBdhcTxqxlg/0L4gQ42yDgZRRtpbk3GRMugZsh7nCHvIsP
         Z1HM+m1sZF4EeR4y4h3u4s8n+cCzDW+WPmu1IrEoJbM4oytgE7EivpmdtN0epPrzCEY+
         yz+A==
X-Forwarded-Encrypted: i=1; AKwUvBw+cRA9j7SCg7KGYWwe2DpAwIK5uU49vhNHQ8Gf852fuZGdYLgXs6vhXfdaSsRyknOylseUBRDsDZCVe6U=@vger.kernel.org
X-Gm-Message-State: AFq9FYLmiQ87sBr1WbRrMN333zV1Cunofg4Teek3LtLgJDC0oQRpy78e
	EosonRYaba4/8/b5h6Rq1/2dQ+pdBzOVq+exqjJ5U6KO82EdvT4MSokp
X-Gm-Gg: AYBFou0z8M/JA4GO9QX6rLc/4qK5gSnd5mE7Wy0W4F6NUielNH6dS9iFGwine8ouk/s
	WmjU0bU6xSwb/+Qz7Nqg5UkmRxUJFvsC5Rdbn3LpknTUS7FOzLmfKyVb/Xw4md9VhvPQBkHhFqE
	bkc6nGsJSwDKNgz+6Zuj5rMClRXjAmFw6AjbSc0STlWCxPrMz40lybwzBP+0s6qTAElyLJdA5+7
	IXnjGEzhK5N/cs0O3thy41hZSfpMm4LtDkEPTINKFEC3TViSP6ZurovjDlogFj/E+ndcIGC9pri
	atwUZFaR+eMq8uM7njmUP5lJcEqvRjA5yRLvpk92y7KjyorDxjRzPQ16N746H9aKQW1mcCo5gkp
	DhDw8LMhFjSw2aFaphpzx3R0NdTXGrbmHtMH/hdGq5agtd16VXjLVs9v2E+ITOw5lP3hUk0TA3w
	qYde4g7zpZ3NxgwhvO7Xo/wrb9uYS4V3ly++Ej3EClL+iv/lj/F6t7FZA4pT6difNwaan18Ohxy
	CJSZaTb7A+e5sARlsLIDGyFq2Y/JGsljsaaW6QVwJxcZik1Q6jKTupvjfkgVRlzKLAGhd8XjknV
	K7OUaaGkO6/MjhxB78EmnI4BcdRHkHK5xfj9IME6lsR9CJexDYmudg==
X-Received: by 2002:a17:90b:2543:b0:39d:84af:a0b3 with SMTP id 98e67ed59e1d1-3ae581b5095mr169710a91.18.1793134366005;
        Tue, 27 Oct 2026 13:52:46 -0700 (PDT)
Received: from debian.lan ([121.101.131.247])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae57bc67bbsm372192a91.3.2026.10.27.13.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 13:52:45 -0700 (PDT)
From: Amir Hanip <killdeath104@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Amir Hanip <killdeath104@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: arm: qcom: Document Xiaomi Poco M3
Date: Wed, 28 Oct 2026 03:51:45 +0700
Message-ID: <20261027205146.16384-2-killdeath104@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027205146.16384-1-killdeath104@gmail.com>
References: <20261027205146.16384-1-killdeath104@gmail.com>
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

Add compatible for Xiaomi Poco M3 codename citrus, which is
based on Snapdragon 662 (SM6115) SoC.

Signed-off-by: Amir Hanip <killdeath104@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557c..8d2e4f0e3 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1068,6 +1068,7 @@ properties:
       - items:
           - enum:
               - fxtec,pro1x
+              - xiaomi,citrus
               - xiaomi,lemon
           - const: qcom,sm6115
 
-- 
2.47.3

