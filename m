Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792500183;
	b=Hpci79a/SIIfqMQaV1Q0LUWLuU/hLY5XPODQfhhuFvRATYxvJ54cZq+PeWDGjVbJWwLM
	 FnGe8CAYrFgcs8pKNSlchJ9pVxJT0SUBPV2e0NG9RPWTHsjAHSzNlylqqLVw42hJlD7Wt
	 9B/aoTfRPEfuKR3i4z7Va8r8z+eZ1PsBIgnohFSNTUKTJKrUuj2oqU53vgoamhiv36w1w
	 C09ytwhKIrGkdWlExc99JXk2I12ZAhSwRn70Nv/I7Vm9m4HxqEBgfUiQ1AdiJYMUJEyK1
	 X9DtsrrWB0IKpqj6f3H0dLm2jNUXFUqpMc3p3PKnQiUVZC269wEfoxMggtmw/3YFpBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792500183;
	h=Received:DKIM-Signature:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=udI091H83CINTVVqHps+7tslfaXMMpI2KZ5OIsr9xW8=;
	b=RFYs4ZLbeK8RFkXep2UAdfUE6nupz7pYq2OzR67mz3KFTv/VBCy5l0QbAaYP554UzndZ
	 3qCiqDWOsWdyQlBhlEP+I/uJnWTNY1CArbMQEFSi8s6zZkPJ51cZp6ukZRMzHhtxFYHQb
	 S7ebfUYhD5sG9A0wFDBTvOiZW2o7Cl0cCkYo7lbNvJHxGW8MOsZ5DgOry1s5e26sIJSPO
	 FB/kw3tHxuhlHV22ZDbDWx6rVUNqEQbmAZAliK6pstIJyfyDBZQGcI29mwwQNoV+CTTBp
	 8l9/6uxh24w7hh8OR8dC/GQNP7kfsyEiPtk7OWKehOMs+g/hvJR96Z5uIqqSSeBtH4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b9u96azI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBAC8606A319;
	Tue, 20 Oct 2026 12:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b9u96azI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA16A1F000C4;
	Tue, 20 Oct 2026 12:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792500182;
	bh=udI091H83CINTVVqHps+7tslfaXMMpI2KZ5OIsr9xW8=;
	h=From:Subject:Date:To:Cc;
	b=b9u96azI+ShGeJ1K183pg+OFTQ0/dSfj+NPZwY1yzuLOgdrmSWNBFpzy8ChgKUi9O
	 ntE1NF/YGUCPs8JmY3kjMf/yPLlxPo+GYGeuUS5gEPwnAJg4eGHzKj5d73ym26m11C
	 jXEB3cg7DfUkgDk4GUmq/C+F0ZU4u2w6mYCsdpCZ6fDXzBUtVoTWMRYTCkXr7l132S
	 W2TWY/jk6cPPddlmSOCtQ+52RdUlLp0m2ghlE8exkIRZdFtRQHQ7/EbUoKkRq9LAGa
	 KPOEzE2IVdQH0f4hVKhHLvoLnJnJQ8r87zpIvMRpCRWyw4o4WOsIzwVW08PDaHa+Ei
	 V49WjEeqZRBkQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH 0/7] Straighten out CPU votes
Date: Tue, 20 Oct 2026 14:42:04 +0200
Message-Id: <20261020-topic-icc_defines_ao-v1-0-cae8d22649ac@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBCF4avIrBtIIgbsVUqROE7acZGEjJaCe
 HejLj8e799AqDAJPJsNCv1YOMUK82gAvz5+SPFUDVZbZ7TVakmZUTHiMFHgSDL4pLrgeje6loz
 1UK+51O1/ZV/v27KOM+FytmDfD5t5Luh4AAAA
X-Change-ID: 20261020-topic-icc_defines_ao-5f696b63e12a
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
 Thara Gopinath <thara.gopinath@linaro.org>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792500178; l=1369;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=T92+H6SFr8U4Lqrc0RbKJGTe1Gwg/l40j3Waqw1TS3o=;
 b=GVf4wtjOzpmeOlyTHwYD7InBnK59lX9OXThpqNU9d4DL1HKUg5oDumF7pkYnk1kqIjfRmBFot
 jW2PHVsbFrWC86WQoyEPnrHHvlLpTezHfyBSxgptonLlbaieQJxphu+
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Make the votes only count when the CPUs are online and use the existing
dt-bindings #defines where they weren't being used.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Konrad Dybcio (7):
      arm64: dts: qcom: kodiak: Use ICC tag defines
      arm64: dts: qcom: sc7180: Use ICC tag defines
      arm64: dts: qcom: sc8180x: Use ICC tag defines
      arm64: dts: qcom: sdm670: Use ICC tag defines
      arm64: dts: qcom: sdm845: Use ICC tag defines
      arm64: dts: qcom: sm8150: Set active-only tags for CPU interconnects
      arm64: dts: qcom: sm8250: Set active-only tags for CPU interconnects

 arch/arm64/boot/dts/qcom/kodiak.dtsi  | 24 ++++++++++++++++--------
 arch/arm64/boot/dts/qcom/sc7180.dtsi  | 24 ++++++++++++++++--------
 arch/arm64/boot/dts/qcom/sc8180x.dtsi | 24 ++++++++++++++++--------
 arch/arm64/boot/dts/qcom/sdm670.dtsi  | 25 +++++++++++++++++--------
 arch/arm64/boot/dts/qcom/sdm845.dtsi  | 24 ++++++++++++++++--------
 arch/arm64/boot/dts/qcom/sm8150.dtsi  | 25 +++++++++++++++++--------
 arch/arm64/boot/dts/qcom/sm8250.dtsi  | 25 +++++++++++++++++--------
 7 files changed, 115 insertions(+), 56 deletions(-)
---
base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
change-id: 20261020-topic-icc_defines_ao-5f696b63e12a

Best regards,
--  
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

