Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A8337F322;
	Thu, 24 Sep 2026 14:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790258496; cv=none; b=Fqb+NPJyLLhBweMIw1MHG+ulDTEc14RmgckOQUzRrngmv9VdAuoEz6p7ff/V8z1qPPbSfgvoUXPaUA1XF9uAD8mLEMG+eB/V1nG7zlQzM6dmtstybXJ2/JitxXiDQwJ9/cmaJ/JTNw/U2Q4BqQtfJo67M2t2bBes5cte16qqEvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790258496; c=relaxed/simple;
	bh=rGsboR1NAldd5bx6/+4ouc+QR6HkIvOETiMf7nk5qeg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=figkTT4COWIO+NjpnsGVJr5SM5cIFi2gCMoV8w07gd8ETENjvNv0kyA3iumlUspt+i+c57TU2tw1B4Dk1qQ0a9hr/sb9WFoSo7+NspzsmwuagYJS1IujDH0Kki39haSm1L7QsfM7vMNa6j4c2aswknFy4JnPbV45pvkWXx5J21Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D0dbgQv2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D0dbgQv2"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E1F4FC4AF11;
	Thu, 24 Sep 2026 14:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790258496;
	bh=rGsboR1NAldd5bx6/+4ouc+QR6HkIvOETiMf7nk5qeg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=D0dbgQv2fmdSYOIJ5W0C7DKoOWvEYLHMFuNmhQcuTkHCD+1+kmyRYdSJsvTyoy1dR
	 cEFRhbrvi/fVhpesV6I65YDVA3HDsZ9n9hxgZfTY9AqNVL7RIwX5z/o3Tefkqx1HBc
	 MUxHt6u6cJOPwEO0kW6w4DYfjJbTOPFOb8a+Em7W9yJcyxl0B/r8WFgWV1JiVDvXtx
	 oapGpsyoeBbUw/D5XuYdhx88PAAfVfpuzIidJnJiGHSuR3I11Wsekr//Cpdpkc+7pm
	 M9QDkRHWVMPpR1xzb9HCOjeK5eN9Va8PR5rXHbB/7zUL/G2xbnwyoqx2uhSU/q34vu
	 VvgRsK6cYzQaQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEC26C98322;
	Thu, 24 Sep 2026 14:01:35 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 24 Sep 2026 16:01:32 +0200
Subject: [PATCH v2 04/11] drm/panel: s6e3ha8: Introduce AMB577PX01 panel
 compatible
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-crosshatch-panel-v2-4-08d5c7bf72fc@ixit.cz>
References: <20260924-crosshatch-panel-v2-0-08d5c7bf72fc@ixit.cz>
In-Reply-To: <20260924-crosshatch-panel-v2-0-08d5c7bf72fc@ixit.cz>
To: Dzmitry Sankouski <dsankouski@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Petr Vorel <petr.vorel@gmail.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1427; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=I8au9RHlXJp0sQXsphkjbyxxUnhlBLGtjFxIrmaazt0=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqtS09Aj+5xy06Bf/ZdEsKwwYMBKVtqAAr7raY4
 nhNkZ++z5aJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCarUtPQAKCRBgAj/E00kg
 ck99D/9e5+IE8uB8z3x+xQs5FrYOzurX9IZsv1qZOtlKE4cVukeXZ0rjtTsGLaUPgAjTfTj9802
 4f8RwZevpFtnZ4emf5+G6YJAGuSSMb7yqnzI/PtMoQ1fi98ppDp05CEtEE5v4fS5mpHxbhV7R0z
 +idByYtgNXSGxS7vl5JZNZvEmdvl1MzfAsPkt1BriLFryGHn0Cv1j5x+xTWibTsxc02sNlipa74
 FnhD07JXH6cSomAXxHHr0YlNTLNgXTCSL2sfaE+RszyekaV4fuX2crU7vpB44cOQURSkqnMh3F+
 te23YneQoeA/8ZqPoga38qAmkRztFdwcdwjQ9aPz0bcX0AGt5hIhlDBz6uYOxRI/C1Xd8glRZOI
 lpuouukszROvnGHNP2CJ1stuLyFlw/67I2SYIqYLSUrT5g9tdn2F+cf3FEnJYLbAKVYXUiACgBV
 sGW4NYVjwsp//GqDVTZZEqNl46lCECLOGq0rRQvgx68wqQPAau+nOMOOLryc3nY5GVkOKIJhODT
 t5USd5XlqvvVZG+wwpj0p10dBmxKkjKN5HQSq4//mhXS/hQkKQxcJqJo1Z34S1hSgnbvew7jWbA
 DiSSEPCexL37VPKq18niYFPpUBQKcDZDtfaiOl0VNd0GRPhVjxWVzhclvs9tg4IGvAmI1AWi9nV
 bj7ABNci0h14xww==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

S6E3HA8 is the DDIC, while the panel used on the Samsung Galaxy S9 is
the Samsung AMB577PX01. Match on the new panel compatible, and keep
the deprecated DDIC-only one working for existing devicetrees.

Assisted-by: LLM
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c b/drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c
index 835121b322f4a..a0015ac0e2782 100644
--- a/drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c
+++ b/drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c
@@ -296,17 +296,18 @@ static int s6e3ha8_amb577px01_wqhd_probe(struct mipi_dsi_device *dsi)
 		dev_err(dev, "Failed to attach to DSI host: %d\n", ret);
 		return ret;
 	}
 
 	return 0;
 }
 
 static const struct of_device_id s6e3ha8_amb577px01_wqhd_of_match[] = {
-	{ .compatible = "samsung,s6e3ha8" },
+	{ .compatible = "samsung,s6e3ha8" }, /* deprecated */
+	{ .compatible = "samsung,s6e3ha8-amb577px01" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, s6e3ha8_amb577px01_wqhd_of_match);
 
 static struct mipi_dsi_driver s6e3ha8_amb577px01_wqhd_driver = {
 	.probe = s6e3ha8_amb577px01_wqhd_probe,
 	.driver = {
 		.name = "panel-s6e3ha8",

-- 
2.55.0


