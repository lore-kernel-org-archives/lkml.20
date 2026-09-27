Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A29F1917CD
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 15:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790521956; cv=none; b=da1//IjpIFaVnkfRWT2Bu892SuUEMdioE+8v/4si6iYTWJulp5qUZ71x4u/eireqs2S7hQOAtwKQBZdmlGT0g54KlYwEhK/XOaKyRln0vERvaA+SYh2sV6pAEU2+k8NnNcR/weoSIQaZCIUW0IIjvAnRuB+aWzHzpwvXi71nLrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790521956; c=relaxed/simple;
	bh=dplioYOzQkTgB7OtXIdIJ8d7kiQ1EMlzvR3wJI4xDb0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XRdXvemRYTXRKIz/llbGM+kpLU7M1RGiVO32b9Fe02bvAUc+J+GUE2w1KBSDSXEOcHoFtP2EMzKE/wZo7rWkyB0aAiUa6CNe8FJhvUG88kdI/vq4MUEazh6Ose6b0TzSom2pcr0xHamRNu25mTYKgQdmSojiRpv12eU6O1+AHbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fq2LIlwO; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fq2LIlwO"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e8185e037so11907585e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 08:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790521953; x=1791126753; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JVRS8IDqRClJGzLh+AyZKtdvQwPlkBwHKoeRoTOl5Sw=;
        b=fq2LIlwOjgj++P1mVuzsLl/m+qWW6vOoShRUgRxdUoJafrJUkmUkKqpIKU7YRi0JJ3
         Bc+Po1+cypX6jFZ21GL+eo0rHC3t7SXQcbPgEzyKWPtpOO7e7rFZBvbVxFW2cA8FWDuf
         Sp8u+3/2DWCNvjjsC2M6CsYx9mbC1qwmAIx5KHDgV1qXXREEnPbc4gjhLwNh9Bs5vwrn
         lTgtsxlCgGrq8z9Al+j30r2fJDbdfx1zkzOb4+PwADuJfzvoOVwpzgati/dsBwbAiF/n
         6/aiVSXo5J1exqbnwy6my8lqb5VSuagOza9AODD8E4T58bMy7GCs/J5J+w+lZRk016iy
         578A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790521953; x=1791126753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JVRS8IDqRClJGzLh+AyZKtdvQwPlkBwHKoeRoTOl5Sw=;
        b=ulf/OzVmHcFHgTN0hreKQcxtv4ABKIrilLiFI0ucUqkl0w4mhXryRVjlOLh3ik6d/j
         IRdFbjdq7IwlAZU7rgJ8reWF7PCJfnLNSyU/vR3VTTx50IPTirhHvGpbtoshb0rBOsRX
         kjevPiTBISl3XlfXXa51pieT1Wkfi3nAlWbeDTOvGLvIL5lID8yOuUXd/DNgXeLyP7Oa
         vmMnRO2ImV8Fkmpq/k2rBxA3aeAv0/QrzitG7uyCjH9gvGo4rkUKMYXS79NfX+guvIf4
         eAlJ029yCECOJK9LIRDnMrtVCCqHmTJqF4m2u5tNLYi79mCtDkIxCQL1VJDzpJJvJd3X
         dvig==
X-Forwarded-Encrypted: i=1; AKwUvBxpdFm9npfO/BF+VvOmF3KClEtSmSOIXu4+lMMwheaFeFS8T/blXdJgptR/TeQ2TZELEOlvuJNRGPRCQlc=@vger.kernel.org
X-Gm-Message-State: AFuF++lcsLczq61MG5cB6b3mO+G5zJV9kfUuZspB1ip1GGI8UjdB8PY2
	okM5SOwFgQFFLL0RjuLCmNY9SFWjKKSw+vH6rH9GMW9cV9NF9bn9LGbO
X-Gm-Gg: AYBFou1yGkFXKXBQNbFkFLPFZceWVlB/ysBqONmb64PF2a6k+7jaAFIyFJORbzxoxDZ
	fV6s/8qjYTv4QlEHc7n5hAfBLD7RZ/dEodG3eDqahK/WIDY4xWa/pztyM8NTzRsamJm/PphL3ef
	jEL3HNie6siPsMu/VzeUk7Rcpx6XAvt4XML6dl8xPRFzL7dJi9ltRAQAFi3HNyvm/FGaGUiH1Jw
	5x9IMfvmT9YQGhNlW9r607iX213XQ+RP9LhXDFkTAlA4c3sbek7DYAeycTbd4wVnGPXFmkvQ5P6
	fBzSLqEvGBe8hw56CYHxHrhFI+cT98sRics76Rz1sF893l6a3vdGTzrQ32rlg/j2Xr+MLl8bGSg
	ys/h1RFDhGKhP1jO95cVnryPwK2TEq+6jx5PrWR2OQ3uSUDWp/zxnrDin70funtmz0plB4tMamN
	Q/N8QuRkIEtJUDBy4KvExdkKgTf33i+eFZnRmQEitSucXu65+a5Srj5XGu9RkpJjc/UZxaKaDlW
	luqdSwuAybiYslqJi8sd0gaWGl19ojk
X-Received: by 2002:a05:600c:609a:b0:49c:dca2:ac47 with SMTP id 5b1f17b1804b1-49ff06b2db4mr139499825e9.2.1790521952673;
        Sun, 27 Sep 2026 08:12:32 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a746c57sm19764208f8f.35.2026.09.27.08.12.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 08:12:31 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Ulf Hansson <ulfh@kernel.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 08/11] dt-bindings: mmc: sun4i-a10-mmc: add Allwinner B288
Date: Sun, 27 Sep 2026 16:10:13 +0100
Message-ID: <20260927151016.186493-9-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260927151016.186493-1-pmazzini@gmail.com>
References: <20260927151016.186493-1-pmazzini@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the MMC and eMMC compatibles.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 .../devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml        | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml b/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml
index 9e9610bb1eda..c2ec7151dccf 100644
--- a/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml
+++ b/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml
@@ -32,10 +32,12 @@ properties:
       - items:
           - enum:
               - allwinner,sun8i-a83t-mmc
+              - allwinner,sun8i-b288-mmc
               - allwinner,suniv-f1c100s-mmc
           - const: allwinner,sun7i-a20-mmc
       - items:
           - enum:
+              - allwinner,sun8i-b288-emmc
               - allwinner,sun8i-r40-emmc
               - allwinner,sun50i-h5-emmc
               - allwinner,sun50i-h6-emmc
-- 
2.53.0

