Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793978196;
	b=betmRpaRcg07RfYRJUQMmR3sYqYc3gU0yKNpYb5qm26J2YDDIAcjFAuOYcNf8xjyCzta
	 xLn7+s0a3DHDZXVfsGfMwUvXOkUcWHc1+F9ZveJSgotsFXRhgNzJef+RUVBG/iUYrjKHv
	 hOyMIXBQ8Lq4CfbYBnVO1QMt9uX7g8i9yjdYciYIYxQqPxVrUI0a5HXjpBpftoHui0KIs
	 akPktG/RC6tq96HyJvhkUwO2Fi0BDk43TdG/K36X+T/M+FbNWiohGJlSBAphUuArlmU+Y
	 SkH4Qt3EDTjvXVvRCF1nPG2xymtc4FuheVG2Euex/1y+WZtfl1pnODTMLEp9b8iLPsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793978196;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=AZbalvr0RZKV2CHqgY8md5UEm/BcGTfETxormN4SzfQ=;
	b=AVYlV76KTuyno/hteeEjFmTyjLmhsZ/Bomnt/RN8mnVeeAqCKaml1tHd8ryGSwbTXTZH
	 uqa5xzg+AILBLDW5vZofDwF4BZ/vw/PYBmFeTI9WdwM4ABISNiHmLywi9LhhfkhiRkyjn
	 cLxpn+6oggkz7QLVKpyTkuQAaZ5teBBjIC3acGHbddO9qineDL/lTx5FAWEDmYrXdwDmY
	 +zCeHEKk4h0le84IWzLbpqUi6aJF9crGovDvV1dIEV4OgnI4rNs7+c4tgwMsj9Lhql01Y
	 AkwHtMb+IJUT6PqD5UxtxthNsCX4t0cUg+R9hiDu48wqap3ejiyB0kAvoDusKjIDD8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="VSAql/bl";
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CBB5606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 15:16:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CBB5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VSAql/bl
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-370a1bc464cso128003eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 07:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793978195; x=1794582995; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AZbalvr0RZKV2CHqgY8md5UEm/BcGTfETxormN4SzfQ=;
        b=VSAql/blJeBuuXf8oV/4c1oADv/6SuCiNGnvgI+jYuOKHyIGlQ15D7/sdKN9NYl7wx
         iWb3gjWga3J1E8G9FKpUYgRb6DlbuIVWTvdwzC26viaTrL5X/e1VaVMZq2hRKGYiTyKc
         AzJA2l7qjJn2Mc1QtlCTO4p1IKMjHrPtdGWx7FFh5JzaZLCJx1/6THJc8ZFaWaZqzM1S
         nKBjJKH7mCdHSKmW5xbNxlbH+Z5gd+UlcG3taSFzBLnJflkRpuoWZLJ/8kI2Le266Kh7
         ujLXoS/MNkIY/yhfstFBjlc1JV+W2xRm71elGo+uD2WSg/eUw/2g+fiok9jCC7qj1L8X
         l76Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793978195; x=1794582995;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AZbalvr0RZKV2CHqgY8md5UEm/BcGTfETxormN4SzfQ=;
        b=eSSKvrlRJO74W8uXboQ0/n+VzCSNN/yHGJiWPQj293+s+vm9YHSUZA3tvkKvm59PA7
         ywHe8VxWDFG+ocWUmOjBwoMcqpGtmSZkEnaPT8TrCTHYtZyGLs714XsLcsqMVDaudd07
         Fn7Ez2IUE1Tx6Vv0F91Exc2WLhdIrfD9vZODLXL8oL1HASDaQgmWos6FJzJ7+sfMYdDN
         TKntnOtxzOB9zMfCZqwMYZuQvZ7k73aZTQwtOxsz4kRKLfmEtXZGD9Szu7p5A7s8Hc4M
         GEKwqmZca/M4hDPRn/QrxYzE4lDL9yXNDtv/DsMkgE6he3FBWSdAtRygH0H/2YUCqmKk
         cz3Q==
X-Forwarded-Encrypted: i=1; AL+hErEXgPNEQvNRzaGfJgHqwzOUt/rKxag2OaK/p2UipDPBEK6fp9X3Q+S81LcCQbQpMb6ZCvGGQAI27TElOxo=@vger.kernel.org
X-Gm-Message-State: APuU4Z917smz94nZXTFyd4QMAY1RMMJbthjkra56hQ7UPH626mMxC79n
	Fa8KIoW90zPa6bF5RdWfA/Zf/6OruCNVXTxOjJSXudjdT3Sj9qBr+ioW
X-Gm-Gg: AYBFou2oQYFRvMKqFmxfAL7Y70mZs9zv3aQf/rxOm1gT6hs+WRKk3lDdh7Ndq3O3lXQ
	P/lOs0TGnpLOOs2QbHrF3JYmWSFjSZkTeB02/FIMBmvrtM9lc3dARn3NENtXS+ePQUh/NchH68h
	vQyXgK/ADmGbvCMF1VBfmRH+dFwtVCzu1Cl6fjW5EMMtPvLRdTaDbYYFiBZKtvsM7a6w6JpxE7D
	kA0GbJbhqt7rDTp3HGjAMdkBpWj5XXRonZvV6W2zqUYP9Kji/WPJMvwj8sqZNjkvtXdJHkUiYAH
	u54AvtWafxEDGf270OgSeGjr8YNnkp68WmxqMeluUGxHiDSi1BYJiev/GR4Sogsvd/N/NTHPrz9
	4g+DN2P8QJ/nUb83Iu3ITU20BdPfqhHDCojjzq+jqE7Lix9mVnJVpHTVBSqQA/lwji8yV4AoEpP
	i7sFWdAwpS9D61AROTyAQBc62ej0bsoyLswe738Kkk5/WYmf2j0A9F2dGc/hRjRTexTo19h9zHY
	GfqxXskcdJwwFhtkLPgfi7gyX49+LzqJ79J+7k63nz2GYeTtCN9kSbJPuPoCDfihJsdNsBIVPW3
	IHi8k5U2Byenp+9a1bgxLDRSXmpNvUkZrpTpMgfqEogeznClXLPPnnTW4/+V378MKnw99Uhcfwi
	mRCdBV0Q=
X-Received: by 2002:a05:7300:ea8d:b0:361:167c:2364 with SMTP id 5a478bee46e88-36f76814de3mr3562020eec.8.1793978195003;
        Fri, 06 Nov 2026 07:16:35 -0800 (PST)
Received: from Sobhana.localdomain ([157.51.221.122])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9ed126csm7581500eec.18.2026.11.06.07.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 07:16:34 -0800 (PST)
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Fri, 06 Nov 2026 15:15:39 +0000
Subject: [PATCH v14 4/8] dt-bindings: thermal: lmh: Document SM7250 LMh
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
Message-Id: <20261106-sm7250-v14-4-7d167e993f9c@gmail.com>
References: <20261106-sm7250-v14-0-7d167e993f9c@gmail.com>
In-Reply-To: <20261106-sm7250-v14-0-7d167e993f9c@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, 
 Sreeshankar K <sreeshankar0910@gmail.com>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 Robert Marko <robimarko@gmail.com>, Guru Das Srinagesh <linux@gurudas.dev>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793978147; l=791;
 i=sreeshankar0910@gmail.com; s=20261029; h=from:subject:message-id;
 bh=VBYR2sSJ7gPSfZ1zDIlxykyMXb9GohC2X09rRKZ3wIw=;
 b=tA+YO4IEziw/rxKUuLOEgg9oSmL+N5rlYkZXd62GE5c3l7KwaJP7/Ge3KIv/yGEwS6/bV7IKD
 UTf6B27Bw92BqD5ffzrs425wCTGWhznBDR5PUtFGQnRPV1dh25cvGBx
X-Developer-Key: i=sreeshankar0910@gmail.com; a=ed25519;
 pk=CGSHduvtn2hwLCNRXRc9s/fh6X8PH/zNdp08zC8hOuQ=

Document the LMh compatible for Qualcomm SM7250 SoC.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
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

