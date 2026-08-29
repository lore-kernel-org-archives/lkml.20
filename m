Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED592D0605;
	Sat, 29 Aug 2026 19:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788032142; cv=none; b=G/HZtdZELeIN4Qaocp1t99SEbEq4BkNrH3xBFpPAfIktl4nMCaITZKnWLWaWgyXxQcvQ7o98sG8c8Z9EoFT6xCy1x9BSEBBq8XJt6d7lGnppxBcgm3lISU7e9UD5pEtjQECWnMnp1g8Ztlgh+Eexh8pS/YVBlBI7gj5i9ApdFS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788032142; c=relaxed/simple;
	bh=gtD7QCZF9hwjGwmyNSwmPa2sxD1FgxJxDbkAvsTPfW0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t1A3PlbLlnn/MQ5TjBzxIoG7RHNHh78K67Leb4UlxdYUA4RrPK6Jkon/FILA40/9QGitX7kQtlxwosihBACRkwpjXexr4J1Uw31bI2xuv0bR/DM2uFQA//8bR6Sz/iEKstWm20ud6xY3Xi7i5VJcsUj0GY6bKRBC3VfUIuKovm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h7IL5fWY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h7IL5fWY"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 14576C2BCF7;
	Sat, 29 Aug 2026 19:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788032142;
	bh=gtD7QCZF9hwjGwmyNSwmPa2sxD1FgxJxDbkAvsTPfW0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=h7IL5fWY11zv9/21HXcXYdN8tlhuWNuls0F+5VnaGUJ0y7D0w7+RL3k6wGg1yNQ0k
	 jvAJZAuOQi8HPegp0FyT3Y9ztEvAN9H6p15NbKDFKzdi9gg6gQl5YpL+7aw/ozaDwO
	 QH+X01wg/F8/YgQnray2CmX0wP8wwnD0J1Jb0hx9WRQRH3GtsQ4jh6fq9VNhqUNU9V
	 JSVcL5Pz0l1QAy148rE4s1mzbEINyOBu9lj9WxSoL4Llb5CaeGOihKu/F4z/YfwrHg
	 JAKKPBytQ0sjtbo5ZR9c32jwtkKW3/9yUKzzg0TRMh7RnIBHJVpsCCqBuM42ajPv/W
	 XRVVRwasgjmSg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E90C6C61DCB;
	Sat, 29 Aug 2026 19:35:41 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Sat, 29 Aug 2026 14:35:32 -0500
Subject: [PATCH v3 2/4] dt-bindings: arm: qcom: Add Retroid Pocket QCS8550
 Devices
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260829-rp-qcs8550-v3-2-198d5b2fc475@gmail.com>
References: <20260829-rp-qcs8550-v3-0-198d5b2fc475@gmail.com>
In-Reply-To: <20260829-rp-qcs8550-v3-0-198d5b2fc475@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788032141; l=736;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=WxDgKnm+oG3VxyfqzoJMACArjvmJTRv82JY4e2Z0FgY=;
 b=uoSqbYV11lBtoFNaWI/Aar9LwUrUDPPZj5GqJi8lRh/sfvAAhcKt2Uf4IzJ+GDFG/GpzsIABL
 7e3DwUVkGvGBvJ4EJ7b/GNrHl8Th+1c7fIHhCWb41OHUUFoP6cBfz2w
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

From: Aaron Kling <webgeek1234@gmail.com>

Namely:
* Nova
* RP6

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 954be28203017..25d24c36c5e00 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1158,6 +1158,8 @@ properties:
               - ayntec,odin2mini
               - ayntec,odin2portal
               - ayntec,thor
+              - retroidpocket,nova
+              - retroidpocket,rp6
           - const: qcom,qcs8550
           - const: qcom,sm8550
 

-- 
2.54.0


