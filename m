Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C7C50B436
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 11:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790680290; cv=none; b=dhYY25tbXF1Kjv4t6dxsFKM4zXc7gb0SQOfpdWjS7+HOgddzhz8fYUqQ38nCLNMGUfcm3RxTbamoKkDAp8FWTUk0VUIQoRP8JHNh/A+xqdAgERCyVxwGANf9fXYmIUJu0c10/uXh8fruugbr0scogVxV6rblonDw8B3XvB//iv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790680290; c=relaxed/simple;
	bh=KEiVGhYQdQfRn3X8jn6XdoGeXBd8Iq2qGCH7rdCKCJ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=hRHmwjuYlrNHkvTWzkgdlO8JycscH3C67I6OGuA7mDfJIS8sfctdZATJAMNxxRzocWDleeMKLaSTZ5ZmXft0rhYnadoSg2a3yaK4J80IKcHgE/X2RDOMY9m3PPyGfFtyyorjGzZlckCrZl8yD0SIot3HZ6SRQf6ak6nTn/NV7U4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U3pBn5Ss; arc=none smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U3pBn5Ss"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6a8038a9f10so5542258a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 04:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790680286; x=1791285086; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TWtr6adc3PGKcncqIhG1cTNuAhzWmYNX5CaLElVM8WA=;
        b=U3pBn5SspIWv9k4MpdRu4QjGL4vDzOI+2eZRqGiirXgNE3y1lsmeW0OH+VTGCAdduI
         IoIfFQk3PmzjCpl2bbqb+UPXqgA78iWO6sayxeESzKIq1lSD+dcJ4VVrJqxXFVuYkMaH
         4v0mCDgzBrR05yu45z6bsaeHVVJBgy3P/nhUHV3JQ90z3APOtL3VNlPE+igS2+UQl6id
         MJu5l53QTBbsgjF9T0yCK3ZDne1O2sQA4pCiWP+QmPRQ1koRD/Qooz61jj7VkTS8KRff
         fcB/n1oZHme7tduiPrMA4rIPjLOFJCiPPKxB0Nski2MLb1fpRHB+WVIZWVtGM2B5qNPc
         5/Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790680286; x=1791285086;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=TWtr6adc3PGKcncqIhG1cTNuAhzWmYNX5CaLElVM8WA=;
        b=XHbkSH6xN2gW2HFqIEAUCxMxynEtMIMsHuQzqJnlC/fjI6RKc2oJkrfrrboJ8j432t
         m1/Rgc1jFveFHAouwckeTO8Eb0IcpyWOnNHRMF2wg0aXt3wlhxaJOJHmcIaoBQP7coX8
         EdrrYErhLiez/k/J91I5kGZ6/LXMFledUKA7TKGEru/dh0T9cJAlGHa9Qq7RMVXPlpP9
         uwBdoTesldM+PNYhIrhn2EzR63g8p9Jfv1MPXdPvhnnOTnRI2SY02bXdGI8m9/aaWNht
         mrgVR1R/nCF6NgXPyybraHTgrUL+Q5AFiFaLw3OF8w44qUcLMD1zSIxLc8CGO/eK7bav
         WvbQ==
X-Forwarded-Encrypted: i=1; AKwUvBwXAVryi1X46cQ3eWK+5HRJOabl7suO6Lde889uuwqbzbdnJSQ5kkNPCd+75K8JpKdDscQ80/fyF+/FDIE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJb3tfEr0A2rHH5gD6UxbTyErTtxje+0YhIhuB8F7H72t3p+hoo
	B5OVViO9xsWye4j6KubrJlqHxRikIiXqQQ5eeCklKZgRwHXIMHijBkEvggJqBqUG0U0=
X-Gm-Gg: AYBFou1YrcSNEZw8hjdLH7CXTwukFq2MNnUf2SmClsS2YiNTEWuR1DyzDXxGsBaJBj+
	C0giK0pLSGGLJ3ev7qw1AVdlOfYy8n70949h0QlkJKWvlWvXbp/zF0bWw7yr67an0eEC7+z8ngw
	6MZFeWzvtbmTWeumAK06NSdfZN+dNDfanN5gTtIwWj7X2raD2y6em/fdtcBa5jExSbQgWEd9/J+
	a+v9aAWt4mnu4DlDVgaOpChKopCrMmbBwIMWRLB1weCAwu5r6uAoTMzt2JjFyC0biiFscD264aN
	EpbHla9Q+GCtyW0/t7bxu1pSVbzEGldGsHIzbzlRrYapOHSM/y4JoKcjo0IKTo56VwUudtU+ZOi
	snQL8l9zZi7qhqGHFlcuO+vHgMWa1FJj7TLsHhFDaaaVZ0/CCUQAs7sbRRaN0IH0vhQ002i8GK9
	ILnwVIkBAd14R2CFj17t6q/aiD7FV1XyTomTxzBcddPpZAEgR7dJKf10WzZZElFnetxITwQT9DG
	TvyxCvGZOL0N77CYadSdf02JdGXd/Ojq6yX/jkezfcnl2I0MoIyOWHgsatfIU/9kA==
X-Received: by 2002:a05:6402:4397:b0:6ac:b9b5:8e7c with SMTP id 4fb4d7f45d1cf-6acb9b59461mr557372a12.17.1790680286107;
        Tue, 29 Sep 2026 04:11:26 -0700 (PDT)
Received: from petegriffin.c.googlers.com (116.118.90.34.bc.googleusercontent.com. [34.90.118.116])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6acb90128dbsm649822a12.17.2026.09.29.04.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 04:11:25 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 29 Sep 2026 11:11:15 +0000
Subject: [PATCH] arm64: dts: google: lga: fixup #size-cells DT warning
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-pixel10-initial-dts-fixup-v1-1-b304868cc3e8@linaro.org>
X-B4-Tracking: v=1; b=H4sIANKcu2oC/x2MXQqAIBAGrxL73IIK/dhVooewrT4IE60IorsnP
 Q7DzENJIiRRVzwU5ULC7jPosiC3jn4RxpSZjDK1ssZywC2bVgyPA+PG05F4xn0Gbp3RrraVbip
 LuQ9Rsvjf/fC+H6pf6gJrAAAA
X-Change-ID: 20260929-pixel10-initial-dts-fixup-8c21c6951759
To: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Douglas Anderson <dianders@chromium.org>, 
 Brian Norris <briannorris@chromium.org>
Cc: Juan Yescas <jyescas@google.com>, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel-team@android.com, 
 Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1156;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=KEiVGhYQdQfRn3X8jn6XdoGeXBd8Iq2qGCH7rdCKCJ0=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBqu5zdB2swPvizsJ6BwiImUCPJc0ljDuz/23IXi
 Gsthh01Oe+JAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaruc3QAKCRDO6LjWAjRy
 ujJrD/9Pgov8/wNrVTV/T450WYQnznFxZ7t3U/eIFtkO8mjOB2z0mQJqTQk8OJF0b22MXyIxw4V
 5O/KgpvKIb6Jz0JGkyBt9mSCOGuljmbrB+/NcDSw6UTTEeldOdDA95jm31fj1L/vkc1i/J6UKTg
 pBuObkDbyRl1CknQGWEwSsBiaTmoXFRFGcKAOdQqqr55oJuIgoPHI+tGqxdeC04qjPM1hGYF17B
 VnJeo+GbfpCWGbHOBsKN0LMMDSkqrSGjjZv93Nh5ylszEonUkdeJak1T2GffLSR2wBw0xKlyt5M
 cTXqdf76JPeuPzAEpW73KZQr+6LwcaJfCf8wLXIMaq8iip+23SWF4MPf35WlYdElte0yJqgiowl
 qW2EHX/iEl6p8Cg7TVkFTGAiGUlcxLLYio73OLnalbUoWQVDskgL1ja94BXuGAbZLWcfdW9kKmJ
 gzUcGYeG/BZwiBhI1NG73HG33Cc6Ch3l2RfWTbtNyMykIFo/pQGVwYIkuNvJbM56PYwbMqHo48X
 yD2eGTjZjXu7VWHsEqckxgCXxplgUPhvTbKj6ge1wFfTczYMYt8portbVfBcosxpI61rdE+casw
 8MF7vKogggeb3OQqPnyTcvVQVVofqCWhKEwqDF8OTZP/JEupbx3RnhqOn9734mYb7tD85ZFmH68
 MJPhsQ/02yvQqKQ==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

Fix newly introduced DT warnings:
Warning (avoid_unnecessary_addr_size): /soc@0/interrupt-controller@5880000:
unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or
child "reg" or "ranges" property

Fixes: 80f23487d554c7 ("arm64: dts: google: Add initial dts for frankel/blazer/mustang")
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 arch/arm64/boot/dts/google/lga.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/google/lga.dtsi b/arch/arm64/boot/dts/google/lga.dtsi
index 26a14b3a1b190a..919ee6619d9ee8 100644
--- a/arch/arm64/boot/dts/google/lga.dtsi
+++ b/arch/arm64/boot/dts/google/lga.dtsi
@@ -370,8 +370,7 @@ gic: interrupt-controller@5880000 {
 			reg = <0x0 0x05880000 0x0 0x10000>,
 			      <0x0 0x05900000 0x0 0x200000>;
 
-			#address-cells = <2>;
-			#size-cells = <2>;
+			#address-cells = <0>;
 
 			#interrupt-cells = <4>;
 			interrupt-controller;

---
base-commit: b736258e80ca4c2c465cd4ec6d2bbf780e99ef55
change-id: 20260929-pixel10-initial-dts-fixup-8c21c6951759

Best regards,
-- 
Peter Griffin <peter.griffin@linaro.org>

