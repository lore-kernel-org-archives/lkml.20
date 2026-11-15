Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794774029;
	b=ixPBdz9GheMafvfAc2LrHMwAidUVvQLdQqSyZUbsdXu5vlWztUXE9iUX5EMd/m2xK6ZG
	 VsRGsqKLmbns+UW04GSjcU0j7KHUw53CgYWY1jqD/aLAhm3CpBMKGeWnNrb63AarN8APW
	 dNu+iXIxqrwlZkwgPsWvd+P0FbzoXaF0/G9qDQEmjHoGEZphaAMFAmeq93ycKD1ULnq00
	 5zrlo+cEegiZTb2yFtqyzapVIfwADeh49ALzh4o3oIcyXVfGb9b2/rQSG14dBIZqYJ1V3
	 FGjIOt0scq5TYWKH0VP2/SlFxFgZRhUjfnhFjIKCfOtjoROR0m9l6xHNMItb+AQHv1Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794774029;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=BrOneWWkYW1msZTxiS6i/unWXAYHkcwWmjjLrFEjxDc=;
	b=rrpjMUiCRmENCNXP0xsosE6qsqL/PMRax4nV70pEVUC6rxzVOWGpgDh0AHPaZhtcC792
	 1RbjJYNFusedBRCv0XuouDOdACXqjoURViWIdeqzRWl1RPNl7EphX7y00DjKac3i3LwOG
	 +Xs8SqxpjSZ45JtJ4ZQzaJEGJun1sYUZcwBEj6/aoVMb21/DvIAXVjzp1hLLTOHM+UkUt
	 LQgewnBmg2j9fklawRYVZBlwUqHq6uRQWkdaoYQVGUrqFMEKA/m+JsafAK0Z2gLocasQi
	 KC9xJVWExFqHADuf0bk6N//Vh9CmNH+apJENctRQbC0IB7Njgx3jytj+kn2byiISzyQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P8AO9AMA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E59D606BB3E;
	Sun, 15 Nov 2026 20:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P8AO9AMA
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794774029;
	b=WX3hKIBEX47ytREEmiC3Y13GofNuJWgdIU3VnOOLagBAceEjbFRjuK7Fm5aZIaBqaUr2
	 lBC6kB4qpBx0sIuLUm2Y6GCNK6q8q7B+xRoK0ZV2JB1mJz/BmeVydnR1jTKqbuixJWJID
	 mEfXkoLk9ug/52delrxf2xlIMkLPpxEVyqmRUSDQI3WK9A8uIsCMK1V8n0AVFy78mkmpx
	 kis0LLvlF8jyeo0ZB+xv8X3asafc+YVBeUPoPvBBn/n3ULMrqsgxYGsfNuv1zsW4nrS2z
	 LOPdOESA5g0LNVbGAwemU8ZeyL4jEGQ8jHE8h3CRH0GKjbx5zPP6LdfEHMnxAJfp2pA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794774029;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=BrOneWWkYW1msZTxiS6i/unWXAYHkcwWmjjLrFEjxDc=;
	b=ygPfL0egVFjnrixeAzdGWLck1S5Apm/unHSlNPONBuXhbs1RwqbECjGs/gli1D1LLRlE
	 GZD0cfQ5pknhko1Ak4IbDbtxjAITlAtGDUJPG9o+LK7z+6+1L85xi37nM+N93Oj1/LvpI
	 fU+FSfMbJ/eTkyJBd+raNuKIOyJjvUD7Q8G+JRDjUXbqEXUhRJgaBUwXOdPKmFn6pDJ69
	 3yPVkVP3HWq1/GgwpjmSOO5gLn09pLBiA1U3S2X5Iu+f3MYAWe39dmGJSL1mOvoMqjr4A
	 1EesOJyT8000R56ziwvDDkHHJxwlK45kPKEVx/x9hIcsFt5uqezMtjq6m3nmAi2Plhw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D3EAE1F0280E;
	Sun, 15 Nov 2026 20:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794774029;
	bh=BrOneWWkYW1msZTxiS6i/unWXAYHkcwWmjjLrFEjxDc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=P8AO9AMAhLXpWAWXfva9XSa03cZYyiUGkT2PE2JMR+laagFLvRN3CSQR5EvIvT/UH
	 W8y0GUw4eCXRw8UYmdk1nJL4Zg3DOk1QUYEQ5Hrgz691AhjMh3KZGkBGzWraDVSsYp
	 aRmQu4Cgzf2YLWOI54xl+qMhzumUxUglO8rWtptNf6+E/0jGL9XQzNzy663qc3SYmF
	 hkuPKvuanzkrQuRsH/gxs5jxfgg4szG3VWoOAclRj/ryesCcuzdoE7yRVlC2DNg0qg
	 bgoEiEwkPkcKAQQJRY/3ipCI39yIxZ3ZmLhZgmB1iXx6PnfrKevx3iCIShZLs+oiPe
	 if3HLvfTi44Bw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 31C1F4A1E0;
	Sun, 15 Nov 2026 20:20:28 +0000 (UTC)
From: Venkat Yadlapati via B4 Relay <devnull+venkat.yadlapati.yahoo.com@kernel.org>
Date: Mon, 16 Nov 2026 01:50:28 +0530
Subject: [PATCH 1/2] ASoC: dt-bindings: qcom,sm8250: Add Motorola Signature
 sound card
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
Message-Id: <20261116-vantage-sndcard-v1-1-df69a8759833@yahoo.com>
References: <20261116-vantage-sndcard-v1-0-df69a8759833@yahoo.com>
In-Reply-To: <20261116-vantage-sndcard-v1-0-df69a8759833@yahoo.com>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Venkat Yadlapati <venkat.yadlapati@yahoo.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794774027; l=954;
 i=venkat.yadlapati@yahoo.com; s=20261023; h=from:subject:message-id;
 bh=nX9qTnZEW1eY4ue+aHl0y+aU2y03Je7/bL6nIWQuIPg=;
 b=krJygh5DLJPWif5c4HWThx0qoWh3j05sndx4UrP985vfoE3qbBsy6BWta2MAtuJgpERLrjTJJ
 oSUITQ3rwU1CO59kTw7NP+J9q7JFDFCsRYSxB6TYLKlTwS3frPSLzKF
X-Developer-Key: i=venkat.yadlapati@yahoo.com; a=ed25519;
 pk=e8KStCtEMvUP1Se/riB/KVnDAQFEVR2Dw2PcuA8/eME=
X-Endpoint-Received: by B4 Relay for venkat.yadlapati@yahoo.com/20261023
 with auth_id=1303
X-Original-From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
Reply-To: venkat.yadlapati@yahoo.com
Content-Transfer-Encoding: 7bit

From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>

Document the sound card of the Motorola Signature (vantage) phone,
which has its speaker and earpiece amplifiers on an MI2S interface.

An LLM was used to help write this commit message.

Signed-off-by: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index e2e3fc99e6d9..7adf0f5ce2f7 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -37,6 +37,7 @@ properties:
           - fairphone,fp4-sndcard
           - fairphone,fp5-sndcard
           - motorola,dubai-sndcard
+          - motorola,vantage-sndcard
           - qcom,apq8096-sndcard
           - qcom,glymur-sndcard
           - qcom,nord-sndcard

-- 
2.56.0


