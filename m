Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794426035;
	b=zQeq8FjxddE2feLRcNoyYU65DuMxuAQobygdgEcCXc/TDpxAge+BS2pY26oogJd1qBMR
	 MN5BGeJs/rQBS+ZU9upNPyKwrLiCE9RL3pe2ZuK6E32MzVAXEZ34uyGjJyAajrLEisw67
	 aVafcKLbLCudQvFj+gqsJ35mcZ3j6WlXuYrq6o6kjHiWtWKFaf9QZtDaBASjftqQKIjdZ
	 byDa4z6lYHi0dHzHeONh4OpMf2fbFKUJsm3uBHMF7C/r+p75iryAhIlkrWGdrxwNMvh+C
	 js+H9r5rZdALKYZWZERAY/OVy0vtkpibvzDypi9ngy7sIBxpyzM3sd+pDZZ6ntB3omQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794426035;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=VmfA6XHX6bSxK5Q5qFwsI30WcMErOR0nd0Fwd8626tc=;
	b=JtOAzkzsGzWzZR+NR6L2k8yHc0PQV4tDkwDMT/15db5juYCAYfYL6ipV8/CnSQe3jGYj
	 ThzBBHnWsFRScsp7iCZ1Nw7+yjqPwQWZzjlJ/lJtB0RpakNdn0RseEwIBJCRKAhwmnmcg
	 nq8hC9wT5/XQ5OIvAtrMWo1g/Tp0yXOr7yUO28XldKmnHOHad3W5zW3qvJSdP8jCijPQb
	 xB7YIrkmItIcvSuqw3XKgkGYBtEhXfiCnqYia6BxrB5lyUOFCZU67XbmciKSQM7lLbL3d
	 zQlfO1RLzmh4chHWcniwygkjQifm0LZHu/sJVDpMLagnNA5iBGsNUp/GPCnHzt0JyIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GUIQdnWS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C72560A5BCB;
	Wed, 11 Nov 2026 19:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GUIQdnWS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 530BF1F01558;
	Wed, 11 Nov 2026 19:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794426034;
	bh=VmfA6XHX6bSxK5Q5qFwsI30WcMErOR0nd0Fwd8626tc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=GUIQdnWSWONQnFCCMBQC/+gjoa9RmHbkwxa+fYVzMu04dS+y1uLISCDXt1tSlkBPI
	 859YCjtqdybRWfbXz9sw5Fk0afk+6OEyCY2QFEm80jKZG+7ZHn6ntLgpplRIVJCXzY
	 werZVQq2UNLZ+t2bVJ+QDtkYI+SmrcHbgvsbnPIDFTqgS/D93BMP7oVSsuzyUHatM6
	 MWp2bwESNY6EZu0/spE7txLkY7bt266Myst5fxwyotcSnjOXy+PWw+jxGroEsH8bxk
	 c37g6+nQgnXOjcduGrG+JxhDZ+qHOhQD9ijxSPlR2be4wMs6IsP80R69EaXJWoWat4
	 aO5x86eGdIGlQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Wed, 11 Nov 2026 13:40:16 -0600
Subject: [PATCH 06/12] arm64: dts: hisilicon: hi3798cv200: pinctrl node
 fixes
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
Message-Id: <20261111-dtbs-hisi-v1-6-6c9f5f80716c@kernel.org>
References: <20261111-dtbs-hisi-v1-0-6c9f5f80716c@kernel.org>
In-Reply-To: <20261111-dtbs-hisi-v1-0-6c9f5f80716c@kernel.org>
To: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guodong Xu <guodong.xu@linux.dev>, 
 Wei Xu <xuwei5@hisilicon.com>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16-dev

Rename the Poplar pinconf node to pinctrl and correct the gpio9
gpio-ranges tuple.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi b/arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi
index e5010c9d4c39..6d4bd1dec6fe 100644
--- a/arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi
@@ -214,7 +214,7 @@ combphy1: phy@858 {
 			};
 		};
 
-		pmx0: pinconf@8a21000 {
+		pmx0: pinctrl@8a21000 {
 			compatible = "pinconf-single";
 			reg = <0x8a21000 0x180>;
 			pinctrl-single,register-width = <32>;
@@ -510,7 +510,7 @@ gpio9: gpio@8b29000 {
 			#gpio-cells = <2>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
-			gpio-ranges = <&pmx0 0 64 7 &pmx0 71 1>;
+			gpio-ranges = <&pmx0 0 64 7 &pmx0 7 71 1>;
 			clocks = <&crg HISTB_APB_CLK>;
 			clock-names = "apb_pclk";
 			status = "disabled";

-- 
2.53.0

