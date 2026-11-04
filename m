Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793810846;
	b=FTkjU7luS8QQMi3DVlppwinjWl6+RLOj/k65169q6R++WKyS8VIa4Ea5oYemMdh907ux
	 kzTioW78yCBpmKwcf60sJwt3Jxm6UUtrySOKC5ogoQ1h6KSjPkJzaOYFqKELW0wveWld3
	 Y4AbzqEPQ4HpnIdGT7VTw4J3zmtT0+7NXxgR+ZcLoEkGTrGuXR0BI3BT0OyxvGcTeMvmW
	 t2kL+ozIO44EqQYipvvjm9hf6zOL5NLFd0kgm2iEp2cQI8kFpnLDAg+KqHYj/wtAFX1i7
	 mUBQBKr/sUIU/KruJyzPQltkLrb/NBZPld+ldTDHyhbWkrdZcTBqWdFbONFGB65kwIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793810846;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=zMbG6vrMcWe5nACzqEmNc6Lg/tRkWbgNePdHtBr1o4c=;
	b=4ofQqYw0yN3/17m3yL84HdXgrrndex/F9iKw4r2Q8l4CzYlg5aiJGLTq2JL2IrEmYIjZ
	 L9lvWrBndh520IJzmYPmC06ep5fSX7y/fsHnH5MJ0HcXvwS7QQko1JDOXMSy7HdsTROP/
	 vGLdvJUkMuwXll2sWIvfHWeVewkG4cb3bUR9beI9+M6cC/+PGSTd+lMgAzLRckeoNA8vQ
	 rUgLs2XPdraheMLLNHAC6WEqig9WSJc2RpRCiRwsDEE+pSmNdao/24RaphAjGdysX+jui
	 OJ90pfvQfBSFXFZaqp4EE3Gp8EKxBSfLJHFfTOie54S2snyTJYpgqJ8SjB6Oe1WWhwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bq1wPuid;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 376AA606A337
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 16:47:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 376AA606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bq1wPuid
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1a8cc11ac42so1103547c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 08:47:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793810845; x=1794415645; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zMbG6vrMcWe5nACzqEmNc6Lg/tRkWbgNePdHtBr1o4c=;
        b=bq1wPuidKb+BpFTqMAhm7/EWX8A0CldFXYzvw7TglvuSehTtA+Wv6rhY2jEAUupSPz
         8Y+6bq9xZ4N22LC/k/nHIU2VRG4ER3x4QhYoQCxWfRAiy/vR3PtZmIv2kgsjUAd8cusj
         swjHaOz2WNvfkpFbGw4/4xxxjoXXGnGZKtQp2GV2xxKRCEg8C550O7PCCGoUHdi+MqYB
         c0M9ArvTTm8LLIkCdho+PEOq6aqF2A6sUoxxZAZUY1J3Vy0xYJ3rBZ93IVmMGnceJbb7
         U7A+9TZZIJmWG75sp5+9VXfLb/Ll2bWz5tr7EoZ4xU7nWPjOf3caHWdaZTOVz/74+p5I
         GrPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793810845; x=1794415645;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zMbG6vrMcWe5nACzqEmNc6Lg/tRkWbgNePdHtBr1o4c=;
        b=EgcoG2PG3iXynYGTPuxFjb3xdpw0AZg4GBkgI1vNcujDu7q59ZcoC+m1IQQ29UVfBl
         4LTUy1epk0gaO7OU17aMlPTTZqbNk8ZUeX52J4XktQHCOWUGhycl74Gll57YSqwAQsGT
         EyRWvwfsEHYsJRDNzZORE1bkPTDEcumFl4oEMTcKmtiOLfAoErEziKV5HtfqKUtsjAC1
         T+lZgRJFT42lovsO0LM2Fvu3iTMg+TIRj40TDIbvW+kaNedX0X2hLJdRbivq/fpIrxDN
         7KEBmGjsVB91zvZ5j1gFeDp0DP5FWkau/87v5Dh/K/YDwiN/MSHYxfsQrQIQSQajkN3a
         812Q==
X-Forwarded-Encrypted: i=1; AKwUvBzrCjFszTvNj3gus7rd0Fy78QDsQhikcnxajb4Zws619NNNf1d4+4mvWFXwWzCc7FFBT43LTMFj/Posmik=@vger.kernel.org
X-Gm-Message-State: APuU4Z+gRdfBZ0F4pLsFvCkL+uSePhKLzc7jWpFSq0pcltSsR1sqmJD8
	SkFrH/CIEvvqQM/B6VKlA+UgT/b820061cr7VQcg4SvliyHsUzVQ/KDc
X-Gm-Gg: AYBFou26ZrapPaIzMk8+S2bM/lItERtxTYB7x18lhPW/bFjomvIqYSOQ+MDwdDFRJwQ
	aE3uVrYMZ2OKwC4145hHAkxwoa+M6uxV9L27wHCe7xcpBctNICbiTazID2tN/PRJfu9WGNpAoDT
	xoZAUMKGQysoAa4JHUaA1JKVMCgLPwgmFWYi8OV7dzTkSWmWWIk0+s3mn5qgsQlprcui2iYNebe
	jFbGY+PTRkiQh9OYhfQgI/2Ax8hd19l3ZxORioecAYawJBQkznSMlkXtEobhrkKwCgg4HPYbE9N
	RkOr2onLixPAL7p9puSvByIAY9hiN919eAxm4BQMFMktFNVK/ioU/j9oZYI1U4tzyg+61/e+SLG
	KvXWYjbpTfv7ZqdNQ2stkbFBgijfLEMinSteuSY54XOHd2+FKKdqfLlFhWk84ECBODrWNN63XR6
	qnWWPJ2ODmSrWe/p+Yv/pULz2k6957H8fw5CQeAcjx+EOvx4WkPdsDgL6Av8oz9DCMTQBKaRvs1
	SOFpPqlIRGKUX/Rg3rrXU1Gv0b5mFX8ZvC2u3mjuyYdeNeGhFxdLKGD05cS+7M4AbqwEuNSqaGI
	0g1Jt6X7Lu9t7/s6nBwvrvAiHrOYPjYrrU56RSdN2d7973NbK2ntxDi5n1iHYOh9RnUXUGVgpxZ
	U0b+k6Y8=
X-Received: by 2002:a05:7023:90b:b0:14c:8461:b3ef with SMTP id a92af1059eb24-1ac5e6f5132mr31506193c88.24.1793810845290;
        Wed, 04 Nov 2026 08:47:25 -0800 (PST)
Received: from Sobhana.localdomain ([157.51.207.207])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c57430sm10839666c88.18.2026.11.04.08.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:47:24 -0800 (PST)
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Wed, 04 Nov 2026 16:46:36 +0000
Subject: [PATCH v13 4/8] dt-bindings: thermal: lmh: Document SM7250 LMh
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
Message-Id: <20261104-master-v13-4-355b65c6f764@gmail.com>
References: <20261104-master-v13-0-355b65c6f764@gmail.com>
In-Reply-To: <20261104-master-v13-0-355b65c6f764@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793810796; l=744;
 i=sreeshankar0910@gmail.com; s=20261029; h=from:subject:message-id;
 bh=J3JLI+Blhkxqdoc8xLtRIhgDC8KARWHgIPjkApYQ3sY=;
 b=kBVXuJVpl65Jqkx4GULbJr59C4L4KJhdnwRlb2jZNK7mV/HoJ5fAdvNJsr2e5rCRPli2NX6K3
 QcEZXucPf4MDzauU/SeHXl/IE+5KsUbsPsBPFVOGpVI3IJdTX0hYBET
X-Developer-Key: i=sreeshankar0910@gmail.com; a=ed25519;
 pk=CGSHduvtn2hwLCNRXRc9s/fh6X8PH/zNdp08zC8hOuQ=

Document the LMh compatible for Qualcomm SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 Documentation/devicetree/bindings/thermal/qcom-lmh.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml b/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml
index ce72347e2..e1d5cb871 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml
@@ -21,6 +21,7 @@ properties:
       - enum:
           - qcom,sc8180x-lmh
           - qcom,sdm845-lmh
+          - qcom,sm7250-lmh
           - qcom,sm8150-lmh
       - items:
           - const: qcom,sdm670-lmh

-- 
2.43.0

