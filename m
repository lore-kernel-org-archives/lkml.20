Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792449750;
	b=tF9KgMkwxnXiDQD9qHqo9eTKxGp+oorQHOeKoujy6Np+2/3MgMYIk5cqfgYXGgcPf2OG
	 V4dt9DirWDGgS3HdlIJ55nfaCsq8CEltPr2BV/2nBrS8Zd4GXv/70+K3ixsGkKUbru6zS
	 unzCxb+5FdkoinUP0iKUWqQPVQ4LmXCzHUxJaG2ufK1uTJtYjWdUOQHqGwpUl8BtqDmhG
	 UA7TfiwhbMk3ORFSfa63Yw0mwq7FYuJXNPQ+G/8zxrnl1EsHfyliSUeRScLxSPUi4fU7/
	 7K5FbPPN6dbkVQYULkpo4WgqxkNN5Bot10eMLdhg5W4e7uwm6GfRmeFJPe+xV2YV+0g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792449750;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=TLrmBgRAwOW0mUHNBf1ByblFHvpKFtK23BGn4OBtp80=;
	b=yhVjYrdiZ+gVomfDf5r/z72ZjFsocVR6AUI8Ui1Sh2llloi0+5hT8VlMCC9uDu61UH9J
	 cQYmjjDZOnf0ppv+bbfU+6R5Ib2plb+PnzrWBRLMWpGwuGkZmDzLDJxjtXPOgtMGVsa0R
	 eFAgJomCiXFxiZE+kPk6SOhuuOYQQ2oRlrPJth6kZvgJFpFMgNjgur4H5+qcs3vwfzAU1
	 2H9b5Lmo6H10VxCRj/Cy82minJkBBA72zcV/LhXn9U3bUkc/SMrU3ZhH1lZlJuJ34irce
	 UMLTPZtTTd2USrtG9xPw4GG54xpAR0a+EyR8TD7F9tmA3Yv75OsdzgxfF//ZyNcOAPQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AeiKV6nB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02261606A319;
	Mon, 19 Oct 2026 22:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AeiKV6nB
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792449749;
	b=vWxoX7K/aZuCWU7EI/I/TEpZxiIph7iH/kR+y8Q2F2s7wfSCeT0d4AgJaTQhwOfLHiuX
	 uCn5XXLt85oygasgGAJqhIP70hdQD1pBj3qEHFu6XPfSdPVdCVOfOHvHJiZiMMGLn4LrE
	 qpggn5uYFUnBnmSoKyW5t2aCsKrKrIYfHKiTGgO9iFCYFWaPosoCgsPBO0FZHSF2eN3F1
	 FJeeZQiB7d915lAeTDPyIkdL251PZpt2j0gjjncJ3MyXizLQrNx0mj51JVk++XQxtLm1p
	 dc7FZmaJ9TNHK4GafikreBfw+KVeJTdLg48hQF5lFvNt4DvGJF47h9NoatVROM/+hHg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792449749;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=TLrmBgRAwOW0mUHNBf1ByblFHvpKFtK23BGn4OBtp80=;
	b=LuV02eaDIFAwugREXlrzdiBhH5YEcpH5HJ3D4LUNcCLJ63hvPMK+mA7IYhQ/x9OXbaTu
	 8bgo7IaTbCTitFGQ55ySnUkU2d2/rxXXh9eyVg3Eu7HLn+t57u8LWq8r00EDj39tIjU0N
	 Mv+60cxLnu+9Pvj/1A/Jh8lERq2efQdqWFNHwW3NEWfUfBYID+MH68Y/5W6hKhS3nR6MR
	 pNAurEoMSSurV+RfKZd3lSlM1gPpMGouC0lNTBmPYeewd3jLJTO2rNFstGlTvsxNkoTRU
	 dw4cbGMkZSLmUqsTrCRWTlffpj82occ19JKpHmvtInXl85Rv9x5Z1QRZOwfYJXKqf7Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EA25B1F000C5;
	Mon, 19 Oct 2026 22:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792449749;
	bh=TLrmBgRAwOW0mUHNBf1ByblFHvpKFtK23BGn4OBtp80=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=AeiKV6nBlJsPberHC0BdFKiU5tG5Y6z1G+8OykPeJR95e6B8e6Izc5/kJfti8+nIu
	 XOvz9Jx1Be/0kZqm3uzhSeXKyPiR/joPmWZeWryvPAvbfB2ipq6OCBGmW2sqiljXSN
	 QzsARkefSeOUhmnRSvfQqOVXNKdOu3F/vKQRfmYrZJooAlq/Mns04yM2BrLwk9zh9/
	 mCdc4N+YdRpiiS7fF+EzN/p1DjuiR4okTnsaqpVt6wQICIVFKGTMcfXFXY5gPQAMvR
	 xe8PMVarJjPu+sJJvfxulAIZut0uGCw5/GcZTtmYVq6rQ7CHD9nMzSBkpKJpfoqcED
	 RXc/EWJAkxmSA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 5230840672;
	Mon, 19 Oct 2026 22:42:28 +0000 (UTC)
From: Nizat Mikayilli via B4 Relay <devnull+nacht.dxdmail.cc@kernel.org>
Date: Tue, 20 Oct 2026 00:42:09 +0200
Subject: [PATCH v3 1/2] dt-bindings: arm: qcom: Add Samsung Galaxy Tab S9
 Wi-Fi
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
Message-Id: <20261020-gts9wifi-dts-v3-1-afd06fb2d9f9@dxdmail.cc>
References: <20261020-gts9wifi-dts-v3-0-afd06fb2d9f9@dxdmail.cc>
In-Reply-To: <20261020-gts9wifi-dts-v3-0-afd06fb2d9f9@dxdmail.cc>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Nizat Mikayilli <nacht@dxdmail.cc>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792449747; l=868;
 i=nacht@dxdmail.cc; s=20261004; h=from:subject:message-id;
 bh=sR0cnCpdpiTlMKTOwU1tkGMcO6qB707MJF9oZ3BW5c0=;
 b=ipjhObC3/ajONJXHIUQWos0btqPdA9Sa/3KwuzgZyp9CAbMZ0/a3euAs4NfEFulO5MGav2zOx
 XDJ71oqwV6HCISDKtq1RTziwfgeObvNLFzVeMQmCUgpnq9SwVZbqBPM
X-Developer-Key: i=nacht@dxdmail.cc; a=ed25519;
 pk=Kay3P3pOJq5klUD+0/I8QX8JGOh0CeQXEwRVv7CMm4k=
X-Endpoint-Received: by B4 Relay for nacht@dxdmail.cc/20261004 with
 auth_id=1111
X-Original-From: Nizat Mikayilli <nacht@dxdmail.cc>
Reply-To: nacht@dxdmail.cc
Content-Transfer-Encoding: 7bit

From: Nizat Mikayilli <nacht@dxdmail.cc>

Document the Samsung Galaxy Tab S9 Wi-Fi (SM-X710), a tablet based on
the SM8550 SoC.

Assisted-by: LLM
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Nizat Mikayilli <nacht@dxdmail.cc>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce1e..5e560f523d32 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1173,6 +1173,7 @@ properties:
               - qcom,sm8550-hdk
               - qcom,sm8550-mtp
               - qcom,sm8550-qrd
+              - samsung,gts9wifi
               - samsung,q5q
               - sony,pdx234
           - const: qcom,sm8550

-- 
2.56.0


