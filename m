Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2BAC3D1AAA
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788164540; cv=none; b=JhgJqIbpJzzB+6B/PJ2+EXEQtmRKQzCKc/H0mny/spscUCyz4+SNWdEvEDDPGvqyVTpi1phTSyvTy7zTsJv0km9WPE0pz1EQ7QTBgpRqp/ZswRw0CQPBgOXVHWmpQFXAeF0Vh/VqmzVqOjrMukfNhhGo69ANWWYIxkSbF7zftXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788164540; c=relaxed/simple;
	bh=zy5HflWMSJKpdEDAhcS6LMg6T9VvkVh36wf255mMT/E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Fd0SMNScHqSqt4IgVBzYyp97C3wvVwL+oYMwZ57T10p6yq/CVzfsrqMmlnC2FuXzgZ93H85Qf+u6y4FehIgukkHs9GfUuxIDW8aWW1cKR8CN3kRcHLEt6dri6Nxi25w4qNOJ8D3BTsGJL6t0g7Ec9hDIyuJqq6YiRRGfm/z0zoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xncDe4aM; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xncDe4aM"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48433f36a21so1046236f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 01:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788164537; x=1788769337; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kABR3d14T2hX24+Iq8Rghe1MFpuB/gfE4DOUA56gUPI=;
        b=xncDe4aMHgY7uTNvGwbih6VoyO4WDJKKUpeYiT4yrcaxInMAdhhGWK5VyZhKKWxz4T
         m1mU8gwpIhZlL2XH8EPKvAOvWkE7mr3toy8EceZcvSZ4MeR8K50dOmWgD/BHNyYzlg0c
         qmNnDpb+ep+o72HJyiM/+0oOuy98FODW8MLVxG5sOg/kk0d8+lNm3L5FNvTRhpD6av5H
         ykAtCmepIeWvXv9DbZXLY77i1Yfe4pyTvru6gfyVyAhiPQbdcrkT3SM3Sy8qCy7fbYQh
         DU/88xy27AGwodd3GZ02Pt4vrQivsNrEaQirm8pdMo1oRYdeBApI4FZfj/Oc17D7fLPU
         8GNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788164537; x=1788769337;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=kABR3d14T2hX24+Iq8Rghe1MFpuB/gfE4DOUA56gUPI=;
        b=Hz4CF69FIP++bYr4RqjR8Ua62JeWckQBII527f1uP0J/QzgdmmFqesATZGTXudC5B1
         VG9yQw1s6e1ZZypEFp13bOD91P5wOhK0QThSV4ShD67YO+ql7awTEiKNefa0/pbd62HQ
         x/yhFc4D8syKcXYzFhJuKdiyLQ8XR94iyJyxCvftySCo8ajM6I508YXoNMg3RunJ0IZC
         OZlqJeR6miTeE0HBbjAXasVQXZWNtWdRL4zo6Hrx/aQbzvFe9Ma6FejuSfNdYvmqEN7t
         CdWbngsuNMutISWxRVHEjOfKxyKiS44YtETHn4PBq04aU7q77mX1qLjv7A4lIhCKiohE
         8LCg==
X-Forwarded-Encrypted: i=1; AKwUvBzT4ms85oZ2e3IOLJJNrTgYLmu3YgNFBtIvn7pHGZhsrwLTImkm3PK0fUkiY4DEm4SkBbczXZuIMBgQUvA=@vger.kernel.org
X-Gm-Message-State: AFuF++kjd2RfTbiX6+/i0lsFqBJPqXSTqWXh8J4x2/X25t5AbxHl3C7w
	/NmFQFoh237wNbx9ADTWp+5k5eep+w3K1XUc20T0IuIMatw1IKOW4cqJn6r4IYH4GpU=
X-Gm-Gg: AYBFou03/E9a/UovE3nUDGh68HGhfCMOxyMXJh7pt1wijRxDWixrx+DCSzyCVJBp1iB
	G5P1LSox4OvkifgNvCSznEpeq4m5gR/VsqCAhIIlBlJvKQVF8mAjnDQ8cH5L7jog1TUo0RLp26W
	bne5RCXCEr9Hh7cJQg2QqroJrq5mpxHEWvAQHfLz1y494JSB5Vb49jaegBrDvRSKKTLM1t8sX+E
	UpprPC9sHMa+cZU7bM98BbIJqrGk1gUia1pneB1wqYkr8wDl5CzJzWdHuYpcKm10c0Tny0nmWMR
	CPxY18wqtX+PU+8oee2BuPZoiwuS0uQ1eupCZYCoB09LdV8ajeAQ783W8TB+kcZJxAJ4iPcTnAe
	EsY1PmZahzZvnK4lWpSVh1L4oFWMKfw1UBzBA4J2pILX+3FZd8VtM2VLHYkWiZFFZ6UNdvLpZGl
	QBSGlEzcwMZTERg+oG0aN56xiQVlsTy/RLqQyjoU1eIuLvMNK8fd5/s4XwkfgG2YFAlcLd06MVr
	I56Z5zopg==
X-Received: by 2002:a05:6000:481b:b0:484:3600:35a9 with SMTP id ffacd0b85a97d-4843978e680mr12223716f8f.3.1788164536876;
        Mon, 31 Aug 2026 01:22:16 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0e:1007:7be3:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48435b024fbsm12098269f8f.29.2026.08.31.01.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 01:22:16 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 31 Aug 2026 10:22:14 +0200
Subject: [PATCH v3] arm64: defconfig: enable the necessary drivers for the
 Ayaneo Pocket S2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-topic-sm8650-ayaneo-pocket-s2-defconfigs-v3-1-bd8ef3322632@linaro.org>
X-B4-Tracking: v=1; b=H4sIALU5lWoC/52OOw7CMBAFr4Jcs8h2vqbiHojCLOuwfOzIDhERy
 t1JoIESypGeZt5DJIpMSawXDxGp58TBT5AtFwKP1jcEfJhYaKlLWekautAyQrrWZSHBDtZTgDb
 gmTpIGg7kMHjHTYLKyaosTF6XTolJ10ZyfH+ltrs3p9v+RNjN/nlx5NSFOLy+9Gre/ZHtFUjID
 WUWFdbO5ZsLexvDKsRGzN1ef5gz9YNZgwKHuTRUGG0kfpnHcXwCgFqUPU0BAAA=
X-Change-ID: 20260728-topic-sm8650-ayaneo-pocket-s2-defconfigs-7f07659486f1
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1961;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=zy5HflWMSJKpdEDAhcS6LMg6T9VvkVh36wf255mMT/E=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqlTm3FFYFQlpBKjavnp28Ebf4fBNU8FaZ1HNpDJqn
 K7jLNIaJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCapU5twAKCRB33NvayMhJ0bwDEA
 CbHr4DskqKJW8GD0DR8UWpdnMYQc9PSFTbTOGqq2xy/NfhJAXamcWG+TKLr9aGSMmVVGaruo4G9BqW
 4+V5G3GqFQudmsRzLQPM/XHNP3XlhhsDl7kvqfQUx8qEbAX/yB1w9tcc0+TmTN/dFkgmE0e+J9RJuX
 244ApS1ohgDzkyb2JzZTdjyB2qTyBPXF61Fxua1U1sUtkbEsouR2fFS2A7xs/CoO1xblEFCCMvlFXT
 f3LVkldH0AN3E0aQgtMxxPn9W4YTaaIE7nfkQAjjX12Nfyo6IDCity2sAAH//MiYjKCzW+D/ntSpcS
 4OBxIpQKPwlM7m9lNAMkQniOFkyw09TZbrUn0+stdB92L2s61IWhiriTlyT+TCiojLkUskm8NuXpne
 GEv1CZPSL5ObyPI8ch0WZ0R0ujfTbk602ax6Us/MEVUqpgxb+eD55qPZmz4ScDrF27Pj1+1d9o+lSo
 QfFcz57gxBpOYuES7fxYdHyaQwRXmZlDBDh5EhlaDNJVCHTzmsHciu65z2ou7PAKHAEC/16oPMQqIe
 LzcbyUxLyyZVM6M+rY6gH3wbSCGybYK3CuoU81B8ccFX0insZcqGQPpavJjnxE0cNLETAniqwNHK1Z
 C11Et2aL2WPX8dJaOX+fJEenwCEZsfDxSqflsqZo7apgslRPeEcp+6tPgUHg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Enable the SGM3804 regulator, SY7758 backlight and Renesas 63419 panel
drivers as module since used by the display on the Qualcomm SM8650 based
Ayaneo Pocket S2 Gaming Console.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v3:
- Fix subject
- Get review tag
- Rebase on v7.3-rc1
- Link to v2: https://patch.msgid.link/20260731-topic-sm8650-ayaneo-pocket-s2-defconfigs-v2-1-fc409e59290c@linaro.org

Changes in v2:
- squashed into a single patch
- Link to v1: https://patch.msgid.link/20260728-topic-sm8650-ayaneo-pocket-s2-defconfigs-v1-0-49e3ac1c8ff4@linaro.org
---
 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 6ec8d3a69c98..87a6c50bdd14 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -895,6 +895,7 @@ CONFIG_REGULATOR_QCOM_USB_VBUS=m
 CONFIG_REGULATOR_RAA215300=y
 CONFIG_REGULATOR_RK808=y
 CONFIG_REGULATOR_S2MPS11=y
+CONFIG_REGULATOR_SGM3804=y
 CONFIG_REGULATOR_TPS65132=m
 CONFIG_REGULATOR_TPS65219=y
 CONFIG_REGULATOR_VCTRL=m
@@ -1026,6 +1027,7 @@ CONFIG_DRM_PANEL_NOVATEK_NT36672E=m
 CONFIG_DRM_PANEL_NOVATEK_NT37801=m
 CONFIG_DRM_PANEL_RAYDIUM_RM67191=m
 CONFIG_DRM_PANEL_RAYDIUM_RM692E5=m
+CONFIG_DRM_PANEL_RENESAS_R63419=m
 CONFIG_DRM_PANEL_SAMSUNG_ATNA33XC20=m
 CONFIG_DRM_PANEL_SITRONIX_ST7703=m
 CONFIG_DRM_PANEL_STARTEK_KD070FHFID015=m
@@ -1062,6 +1064,7 @@ CONFIG_DRM_ZYNQMP_DPSUB_AUDIO=y
 CONFIG_FB=y
 CONFIG_FB_EFI=y
 CONFIG_FB_MODE_HELPERS=y
+CONFIG_BACKLIGHT_SY7758=m
 CONFIG_BACKLIGHT_PWM=m
 CONFIG_BACKLIGHT_APPLE_DWI=m
 CONFIG_BACKLIGHT_QCOM_WLED=m

---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260728-topic-sm8650-ayaneo-pocket-s2-defconfigs-7f07659486f1

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>

