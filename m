Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794369935;
	b=JvUVEpU66MVVSI9veuiUl4nDrAhdjBzjgpjilstBUX1ZpBvn3K95CsKXD4sWq8eDLEeL
	 P9JLz7oq5WjBl8hw9mn7xGm5MubxttM6iOMdN70ujfTEI7XFRP684raf9VHchcdkSgDAT
	 SmSH2QYAv+hWqjrwi0uejWiVZNJVIEZkWQrSDL81umIbDaGHX+MjJmP9lW/0nCbe8ee6o
	 T7vUoXRP2Wxab8ZRx3S/5m53rcRZWZnMhI45IlLq6VoMKGyLZtQ8YnagxQi1eiEYu7UhM
	 F4J2Ld4vXMbH8ZhGGGlnXS4rOUnsEfkoS5EETSDDTM9QilYLW9KI5Gia7C2NG07YeVg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794369935;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ICXP/cmqLovC4R2HCOjMC4Wp+1KJ1RE5SJlC2SoQU1g=;
	b=ZImFXDADtAWloRKm36O0iOIAj/luGKUbIDJPdltwZ5LHEwohhodBjkbgM0s8+0D71cKM
	 wZ8FjGZYLl6U10KfecPuan8dtgY9WOmgJs9t8CfQrGx3rQHssXpI6J0zFDFCxPTHijsLH
	 wzcM43GaTNG3bKs8f86xsurCrK9MDJqnZnPvsSe+3qeMtM0xfxD768EYPLZDJwY3xadkm
	 19u6zeojMkzfDGLK5TcZdELCcFVBSdmDzKA7+AM1AddGxedW8TztEomCmAac/q2743NkX
	 cd2sPrQqBnT/5zvC4bvyKmPS546pl/FhMue5QmUfOhJmm+HGpDfxk6HL/+UooXBNyAw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aoHhZXoz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B8A5606A31C;
	Wed, 11 Nov 2026 04:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aoHhZXoz
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794369935;
	b=L1KdobfbJNvtHrJLdyEASqx6LsCVitcha0An4WpP4QAEg/M+7rJmQ9URbQNA/U5x/MaU
	 d7j6eto8i8aaJtQTPlMrzk/U145e/bZdAJYiWN0m5i9K1TSrbxN8QB6XmxOS3K1/VaJez
	 CFHO2fEos0FNyTJqw9U3/mKYODpKhS1qCBo55XNgK7rJUIxDkZeDaX2Gdjpq8mOMEWeb8
	 FAQT2s2lHdtSYTuZrbr4WVQpzL/FPcA4tN3EkcfRrE5n85m+cVKgJtxkBzMU1T0brSy6P
	 6+4/rU9OtDECbegd5nsbtG4zIvBZkfQRYtFmSURmWfHyAUAd0sfnfOREI0sLavmh7rw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794369935;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ICXP/cmqLovC4R2HCOjMC4Wp+1KJ1RE5SJlC2SoQU1g=;
	b=HC+d5rAZDhqmga+x9ldb09a3ce5Bd0BqdvuK1Y9yGzt2abEScwlZRfV85C9obcXEBXK7
	 oMYObB7sc6PSCY2zwcb5kzEVfafO9NJZx7P96PyGcNrZPSJ0bc3kZsFWlerL5TK4sNBdp
	 rOCmw9gpF9uc6p18mwGPi1m0iPXJkyHT7VH22a2/KX2sHEu5yRriR66fwB3Uq+aHsc8Xk
	 ZMZpO9apgZqPPA/kHfcRz1TeXbb63Mjq4XpcaYMKqQg6vIAV3SUPxXyVaW0/26YdMp5u+
	 OoASRdBvy86mYGxZ8EdtG1nDcjgvGtrTqVXKrKp6fgLcjM2FblVu9ITRNfXAIQTMujQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 99BBD1F0093C;
	Wed, 11 Nov 2026 04:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794369935;
	bh=ICXP/cmqLovC4R2HCOjMC4Wp+1KJ1RE5SJlC2SoQU1g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=aoHhZXozdoKTdl6vZ3Gl1usfdn43VKm++aZiaBE/I1UdqmUJjmxpg3/PaAd7ZOrVF
	 4nIbLtUsAgVjzrjC6QQSpipIvgzmPMjverH88bA4UPvRg9aSqCPjoBUqJcK6ZFScPf
	 xoHYq7u1ttVaAkedsGlgARtqPE+qj6Ai471XMzCgbdXzcc35e+CO5+EKWtcMCGrqoY
	 dvbJiKAm7sS47aTsWX+yXeJ4lAMkfdkHxYqCg5N02/bf4BxLHQL/oE3u0ADcxWEi3e
	 Oa9n9veuA2Vzsg6Znnze82yQgqZDcS6LwNpMaqK4ACvXHq3Q8Abq2XkuPrbjaSNfnz
	 yKMmIiAlL/A9g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 1D99F48D5D;
	Wed, 11 Nov 2026 04:05:34 +0000 (UTC)
From: Vishal Balasubramanian via B4 Relay <devnull+vishal.bala.nps.gmail.com@kernel.org>
Date: Wed, 11 Nov 2026 09:35:32 +0530
Subject: [PATCH 1/2] dt-bindings: arm: qcom: Add Samsung Galaxy Tab S7 FE
 LTE
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
Message-Id: <20261111-master-v1-1-07b4f06a9dd5@gmail.com>
References: <20261111-master-v1-0-07b4f06a9dd5@gmail.com>
In-Reply-To: <20261111-master-v1-0-07b4f06a9dd5@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Vishal Balasubramanian <vishal.bala.nps@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794369932; l=832;
 i=vishal.bala.nps@gmail.com; s=20261111; h=from:subject:message-id;
 bh=9F7my3xYNlAFa6L6qVff7o9I+F4ahR3qE81wL7FFgR8=;
 b=OKB2c6qC2SCWiX0QbLY4z8qZKZM/EVzelrhV8+f6qvymkSuNki3z7c+hJdkUTVS0B4yzhVGmn
 xG49wzVP0JPAkKC0o3StZ69ewcSbpimGJTc5wUTEAALu+gOYZz6QiOj
X-Developer-Key: i=vishal.bala.nps@gmail.com; a=ed25519;
 pk=GDcoc+SAK+BHD1Eq17X/BJa9U2HZkBW+dmxS8s1xMAY=
X-Endpoint-Received: by B4 Relay for vishal.bala.nps@gmail.com/20261111
 with auth_id=1486
X-Original-From: Vishal Balasubramanian <vishal.bala.nps@gmail.com>
Reply-To: vishal.bala.nps@gmail.com
Content-Transfer-Encoding: 7bit

From: Vishal Balasubramanian <vishal.bala.nps@gmail.com>

Document the compatible for the Samsung Galaxy Tab S7 FE LTE
(SM-T735, codename gts7xllite), a tablet based on the Qualcomm
SM7225 SoC.

Signed-off-by: Vishal Balasubramanian <vishal.bala.nps@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce1effdc95e9e97210bd9a63673f8ba4..abc3c0f53cc14b02d06b68aba3bfd8425ea4fb07 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1118,6 +1118,7 @@ properties:
       - items:
           - enum:
               - fairphone,fp4
+              - samsung,gts7xllite
           - const: qcom,sm7225
 
       - items:

-- 
2.47.3


