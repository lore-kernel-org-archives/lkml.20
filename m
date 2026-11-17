Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794903870;
	b=bjSqJm0Pd4kpERKEiHgd5JVP0Dyj2mGa/3xvxGy58K8yzAJZXtWxIGspaR833mjDcywE
	 K9xy97rm4ssDCJ8sdFvY+uiiM8dHSCaDp0/rMKxCSpqbkjO/aJyZKnRZCMvLFYDzZzPg/
	 SpQ8HFAYLSCQfm5e3W5TNvoAv6Rn2UuLM8a30YVXkA24A8XBy2RsMp7TzO6axjKEQvIQH
	 bWCFXSUkDSBGfc75V/OX2eH9eLISEJ5LdtD/1VBtstPmqeaKE2aQE6BCSZ7FRfyGTFOYe
	 n++y2d29Ukn3vQ9SAAsZS653qe5csyIDL/EygrJam4/qWjqVIfROwGx1SjQX9UNLIhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794903870;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=xw3xnb7M3ni/K395S76W5M9HsZ1EBFx8fzPBd64UQdY=;
	b=nSsnRcATw6vdyzoz2zxUVqbsWauqrC3/Cvv9uCbsF7DCNv3hFfLJKVK5fmpwBGiPN8M6
	 EMKnxfR0vinUhNAjXHgaY0DALY/n01diYd3QCqZ5NtB7bHAilap9YsC7KOp7j2V+H6s1E
	 duM5mdAUgI8P3QUiW3XPdrhsJlKvpLT7uICKohfBAevCLiM3yiDlIevOBvx/E/qIQhBp/
	 lJIqbj6u7ypYmG/NlMjSjP8qeaPDXMaXZZhQ78e/kdhIFulW6gn8iSaySFnbgL/nKKhk7
	 u5ehwYvMeAhnZzfCutq9Gvx+SeRQ8oklpnhyamEy5uROmvtZibEdjIh8UJdWtx9Cl6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=SHbfSFnd;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 054C0606A8AE
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:24:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 054C0606A8AE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=SHbfSFnd
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c5067a2411bso661248866b.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 00:24:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1794903868; x=1795508668; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xw3xnb7M3ni/K395S76W5M9HsZ1EBFx8fzPBd64UQdY=;
        b=SHbfSFndESk1yY8b/OsbMm/euo3XP110OsJVHrsLsdYSpOY39tPL6ns+z+sdP0oJFk
         khgUnzyP3YKajHvNhpszCJiaRzKRtMHkVX8NHWr2m6xdTSFCkJU4ClvYmgNS47iMqn4G
         MHFIuQFpZCo4vBGjxab09RtA+7HfZ2oVkncRvzSkTZ6cfeuB7KTtE4BuPY3EDJRdjcQy
         rShqUqiojPjqHm1NaYlFFxn4ErPnsIL6rn0ToRgLYlEY44TbdaQYdlDTMUIDSsEtNCTE
         K//0K3ZfoWwvtEJJmfmTtkf3aQ0EqnWbrYdeUoEqBUPRYmpIiWaE/5EELg2nOLU5GFEt
         jkew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794903868; x=1795508668;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xw3xnb7M3ni/K395S76W5M9HsZ1EBFx8fzPBd64UQdY=;
        b=WHYph5c+I1Nq50xuUAbCOhSsmuU5IUTcbz2jRqCTzOM9F/+cPpLUvmwaEeP9FaDtiC
         SRrqMVdvu1Pe/qZ69hSvHAheo+LrhdlDDFlBlsOFZkGLruU1jrnif99VJx+Ps0uqLKqF
         3/Ux+45IAMKbWU7Ah6hXKUyvvFSP/+uKDwlpoFgI6Qv/BpQGD3CYW9Y4P12ixO5FEwsw
         BzqPgCacLR2zYnRmZPCognWMCasBMLcYQDtB2MVzDbL84iNnwHL/aUd2OkmDP2URwlew
         McTLj7wa6P0LNhZSwsKr1OKrv4zVrohcJOUu7NSJ4HeNCohDwSCSbFtypDkFeRT59OAn
         hW1A==
X-Forwarded-Encrypted: i=1; AL+hErHRW4S1frOU+izKJOKxXzgUNF5ur0mkS4/twfZsLsOchdWqL6MZHBju00YQIgCaTmcuMsEnc8NEzLi7QLA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+t7H4+Sb7af7N2MspKKDywFAvVkUNI1HsZ3uRS0mUK/1UQaF9M
	qfnXLX+wpw1qqA5AM+Gbary2ubvEtYvX5nOEFjlPQStrqzz9VAVCuvhs/BW+4edIT1s=
X-Gm-Gg: AYBFou0apjHaoHnNgbi8j+F0drQns+IZsD0YbxLU4bWdqHFQ3elG3ad5qENyRqk1n8e
	rB7ap2yCQphQGg0Z+uK6U01D1gBYWoBQrlcsWf2hZsWMvuxxffNW9OVT1YoK7n5jT1IJaUfCxmc
	7xU8HF8CB0CIlskgGL4q2XZKek0LqtEJLbACmhfmDOEg0JJ7FYhHb/CWwB6HCTafKU3EivtWFi9
	r41MwLm+UOwCSM6H3h9WOhSF7BG5snHWeicp5kdkC7PDnC4J1RP4pj/Z4tHzVwdf8E0sfDPv+Ng
	sXoB5BlYGxzFsMrqvggIzdEnJ1v+Ow2Jwfd4Fqsa+GSdkhoe5yfknPbDLaNTNhF4b7wlDoE3VoJ
	nhjPltKR0TPJc00I3YG1Ff86WdIaQff18ZE//ZXD5e1/LmyIKZeAO0KKwfV7ZfLRNUVwGoNz4jr
	J+d0fZMlc47f5Wvhr69xALfE2uizWmla+Zz1QUNma/0t1sO+27BbdQLwkp7rWFTxF+xV7b0J9uX
	hKFqg3pCr376YaI9knyn+F6SbEf252p1bxYqKrdHc5MuAeNdCck+PG05ZPe0f71sVYFJsn5WsbE
	WVGO9IpZ/HvDMybb3Q3D1D8BwqNwhnuSe1n3H7A7k1Vjwwf24g0E6iV5vcAM+zb00y+NV05y+ch
	zqiCOBV8TeHKjZaieomtgUjwExmlbgznQM8An3gM+mBDl7xwl
X-Received: by 2002:a17:906:7315:b0:c42:fc8b:6c7a with SMTP id a640c23a62f3a-c5096550449mr1132986666b.41.1794903868527;
        Tue, 17 Nov 2026 00:24:28 -0800 (PST)
Received: from [192.168.101.179] (2001-1c04-0504-7401-4b2e-1820-6d24-b264.cable.dynamic.v6.ziggo.nl. [2001:1c04:504:7401:4b2e:1820:6d24:b264])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c23611casm5616953a12.9.2026.11.17.00.24.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:24:28 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Tue, 17 Nov 2026 09:23:14 +0100
Subject: [PATCH v4 4/5] arm64: dts: qcom: pm7250b: Define battery
 temperature ADC channels
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
Message-Id: <20261117-bat-temp-adc-v4-4-14d5d309ebfa@fairphone.com>
References: <20261117-bat-temp-adc-v4-0-14d5d309ebfa@fairphone.com>
In-Reply-To: <20261117-bat-temp-adc-v4-0-14d5d309ebfa@fairphone.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 Jens Reidel <adrian@mainlining.org>, 
 Casey Connolly <casey.connolly@linaro.org>, Val Packett <val@packett.cool>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794903862; l=1412;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=b7mnu5CgjN796/wKAPryTmfFj9uk8BxPsgl2XchGimQ=;
 b=IEavwQRoBZ9J/7BaFptQKLVBcbOzlROC3o7elEG/KJxaOX+vWhvHEkOrTZSwFs3fttmOJJc3Q
 PHcebENwoAHAURwSzKsaLbonycN9YknjNtC/PDT1eB5SmaSrhF3UTW2
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add the definition for these ADC channels to the PM7250B definition.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/pm7250b.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm7250b.dtsi b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
index 43cab07126c5..91e83587adf2 100644
--- a/arch/arm64/boot/dts/qcom/pm7250b.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
@@ -155,6 +155,22 @@ channel@1e {
 				label = "chg_mid";
 			};
 
+			channel@2a {
+				reg = <ADC5_BAT_THERM_30K_PU>;
+				qcom,hw-settle-time = <200>;
+				qcom,pre-scaling = <1 1>;
+				qcom,ratiometric;
+				label = "bat_therm_30k";
+			};
+
+			channel@4a {
+				reg = <ADC5_BAT_THERM_100K_PU>;
+				qcom,hw-settle-time = <200>;
+				qcom,pre-scaling = <1 1>;
+				qcom,ratiometric;
+				label = "bat_therm_100k";
+			};
+
 			channel@4b {
 				reg = <ADC5_BAT_ID_100K_PU>;
 				qcom,hw-settle-time = <200>;
@@ -163,6 +179,14 @@ channel@4b {
 				label = "bat_id";
 			};
 
+			channel@6a {
+				reg = <ADC5_BAT_THERM_400K_PU>;
+				qcom,hw-settle-time = <200>;
+				qcom,pre-scaling = <1 1>;
+				qcom,ratiometric;
+				label = "bat_therm_400k";
+			};
+
 			channel@83 {
 				reg = <ADC5_VPH_PWR>;
 				qcom,pre-scaling = <1 3>;

-- 
2.56.1

