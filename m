Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793051106;
	b=d0yvQXICCxWtI8EUJ2R6mA5vIT6WyOKlUupIrzv5+bKup+RRBHliO6wSyw463ZBVocdh
	 KwBVtDn44eVfGQ9xGOoF2GD/UWSKgglQeTxUU4d7Bz4z2uNfJYwkcavaWrklxpJgGH9jr
	 2Ewj6B7OiosSbnBMT3byZgxG+EM8Qigm8Emi9jOxAgwIToOc8IbuW/UJn7VXlFlkf2Ows
	 WxELigXGWAkTiqWwyeZpEDHbzr9g0qmZ+pEjKWtHntykZedIUjBxys2HYzS5HDjY/KgUL
	 3Abl4Nf4mWYZ8lXgu5W4x1GrCxHYClUtAqyDI9rRA3yfCBk0FWImSAXIbPcfJnnQFxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793051106;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kNTRPGjk+JRlFS0l8T9G1tIUTUomkJSdQSP0R5ccDUE=;
	b=GIwz8X3xVdd+iQho4qGf/P75gLvMz65JouxBqPCtjUqeXMo2MKp4MHJISCMZYXQjTtge
	 BiZREAQe8G1umVhmqidFBH48bGoFeKhNK26yJ9wII+DuFDlAQswDRv/dSWrVS+C8UsmMw
	 dlrI/6EfIb8ynBfVPNrHjhF+8k2qHEK6wWLIymq9UfGqfGslCPyS9pB+weJCwvHc2HRFz
	 NRf4aUdd2emrvk+8HbvGZqnukEx8WQ1/gpC98NsXYotCn3hBpDyZvwghOtszGc2YejaU1
	 N93SZgiZ2lA2ax3ckp0Sd1ybTgEtBoytSPLq9xf8mXbXQke/DcCRMEFDbdUJoY8enxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=JbNZvUx3;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38616606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 21:45:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38616606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=JbNZvUx3
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3550c917fd3so5227509eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793051105; x=1793655905; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kNTRPGjk+JRlFS0l8T9G1tIUTUomkJSdQSP0R5ccDUE=;
        b=JbNZvUx33IFVpa/fHUpO0fFj60GvDrTkv2Lf0UHCYArCUiYDKzse/SwIFTwUg4xTJB
         kwTILExSh0hSwzeFIM/VIKL+P28Q2kpKNrretEhyLYIkfAPjiMOM0KAKlmCoA08nNeO8
         u9rR/JihRYzitUwBjRhsROadxot2/RXAyswoE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793051105; x=1793655905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kNTRPGjk+JRlFS0l8T9G1tIUTUomkJSdQSP0R5ccDUE=;
        b=SozpDqTGVFniG0WEi72o/4UgIu1SlsnRbudS5siKYTGyy0czlErVJuqhUpOrTAkVe2
         orQZ98h2WHHTcjVEg9rl7KwasvOKK1YObcfdb2xH56AE5Pakb7gqeTtM7LQz/7AJRg5A
         d/NETzwyStxt4kAv81YZ31bUPjBLsiT8JNvFrdb8yf2Hb/zVyEMDtZRV2/O3Q8epi9rQ
         0o4oFpVZmz3EdDwPLSURH30T0YMrajn4BNNRO64+aj1j6D7aoX5Aq/+0e9HqnF9cZPWG
         yT6ybTPMRmn5jWhlMCx5hyBSUwcxay+n+yslt4zjq1+y8LJXTpSRq0MwxX1w/96r+Eto
         Rt1Q==
X-Forwarded-Encrypted: i=1; AKwUvBwBM6vJOcswYrzCJj68ubnt6WX820OeETkUW3x51/xFNRwmYXzqwU+fhCExcsLbZ5vFoF3LcKmENKx2rSc=@vger.kernel.org
X-Gm-Message-State: AFq9FYInYwJTtRr17QU8Ep+bq5TC98JhZRQDAR/vmUX9IHNyKGBLLixX
	HLjUgyOG0pMMNmrgxJwtrK+83WuP07gxpfo+5KpQp1A7OxsQyBrA5MhZSc48dXHT3w==
X-Gm-Gg: AYBFou2trrSTv5So3IlhAc6echXr0vQF0aA2uU/OqSRuzuSVM24SN7PmtQMoY9HzgWU
	/L11yuTFYropE5kYN6enWnBgANUoSX1ijbbZNspYC4wyxJG0LQpraBpk4F2O/QxwUocms4p+TID
	PKmSj2CMBGGzQ1No8bF2cL651yX/JLLWnMAJLPLeGQybxVeJIC+bCILF+1YYFnQjAwwv+hQPNKe
	LVKtUjx2cuyov9pJDdLDLZqBupZG4pv+Anc8Z2ruhHu4bN2qH3ZLLP2HsvMRpuA9wWCvrvGClW+
	Qc869M/kYICb047Kt4wMdUxzVEisEIANQxVGDr085mZPo6wO6Nn7jMkyERvpgXULAgisI4DTn3c
	AkQiLAajRVyBP8rvjc5rPhbGJlFTmkX6s/LYNi4unwwg6HW2lenDe3BcU0BGZYu7gk0NzIr6hFm
	FSTcy3vqkuOtQmPU6vHB+Bylu4nhLk/HQlRMfxHRhyhO0kJvlAwqOBUN0PMeWDf3akRQ/BsZjjr
	cLg/QXDhRFk8Wm1/FXTsgPdR+CNJBF6uZNvg0mxcSd4H0yhS/SyNTOcdtJkgbtss/PulmCv57Z3
	my3MtAzHLIhyl9V6Xf4=
X-Received: by 2002:a05:7301:2295:b0:361:1dd6:531b with SMTP id 5a478bee46e88-369e84943damr11389869eec.26.1793051105135;
        Mon, 26 Oct 2026 14:45:05 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:79c5:9cd3:db14:7468])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-36a03bea5d4sm8375063eec.6.2026.10.26.14.45.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 14:45:04 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Peter Griffin <peter.griffin@linaro.org>,
	devicetree@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	linux-samsung-soc@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Radu Rendec <radu@rendec.net>,
	linux-arm-kernel@lists.infradead.org,
	Mariano Marciello <mmarciello@google.com>,
	Douglas Anderson <dianders@chromium.org>,
	linux-clk@vger.kernel.org,
	=?UTF-8?q?Jakub=20G=C5=82owacki?= <jglow@google.com>,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH 1/9] arm64: dts: google: Add Laguna CPM mailbox array
Date: Mon, 26 Oct 2026 14:43:39 -0700
Message-ID: <20261026144346.1.Iaf8214205f496225013f482f6e0035e89ac624f2@changeid>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
In-Reply-To: <20261026214359.3122870-1-briannorris@chromium.org>
References: <20261026214359.3122870-1-briannorris@chromium.org>
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

These are the request and response channels used for communicating with
the Central Power Manager (CPM) found on the Google Tensor SoC known as
Laguna.

Signed-off-by: Brian Norris <briannorris@chromium.org>
---
Based on WIP bindings from:

  https://lore.kernel.org/all/20261023165211.v2.3.Ia186a29119b4b5c409815b755e0c2c3965b0495f@changeid/
  [PATCH v2 3/4] dt-bindings: mailbox: goog-mba: Add goog-mba mailbox bindings

which is part of this series:

  https://lore.kernel.org/all/20261023235408.3063350-1-dianders@chromium.org/
  [PATCH v2 0/4] mailbox: Improve the mbox core then introduce the goog-mba driver

The binding is still under review, but I include this anyway to help
prove out a working solution. This patch should not be accepted until
the binding is settled.

 arch/arm64/boot/dts/google/lga.dtsi | 30 +++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/google/lga.dtsi b/arch/arm64/boot/dts/google/lga.dtsi
index 3e670e524c4c..6ceb9ea6a100 100644
--- a/arch/arm64/boot/dts/google/lga.dtsi
+++ b/arch/arm64/boot/dts/google/lga.dtsi
@@ -365,6 +365,36 @@ soc: soc@0 {
 		#address-cells = <2>;
 		#size-cells = <2>;
 
+		cpm_ap_ns_mba: mailbox-array@5240000 {
+			compatible = "google,lga-mailbox-array";
+			reg = <0x0 0x05240000 0x0 0x00010000>,
+			      <0x0 0x05250000 0x0 0x00010000>;
+			ranges = <0x0 0x0 0x05260000 0x00020000>;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			cpm_ap_ns_req_mba: mailbox@0 {
+				reg = <0x00000 0x1000>;
+				interrupts = <GIC_SPI 250 IRQ_TYPE_LEVEL_HIGH 0>;
+
+				#mbox-cells = <0>;
+
+				google,tx-payload-words = <4>;
+				google,mba-queue-mode;
+			};
+
+			cpm_ap_ns_resp_mba: mailbox@1000 {
+				reg = <0x01000 0x1000>;
+				interrupts = <GIC_SPI 251 IRQ_TYPE_LEVEL_HIGH 0>;
+
+				#mbox-cells = <0>;
+
+				google,rx-payload-words = <4>;
+				google,mba-queue-mode;
+			};
+		};
+
 		gic: interrupt-controller@5880000 {
 			compatible = "arm,gic-v3";
 			reg = <0x0 0x05880000 0x0 0x10000>,
-- 
2.56.0.307.g5fe7bd680c-goog

