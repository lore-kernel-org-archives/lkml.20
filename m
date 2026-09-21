Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF9E47F3B1;
	Mon, 21 Sep 2026 23:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790033187; cv=none; b=mm+NzUQiAMY7Sgo2sypzobVHkE3AeG40xnoFx4D5C9mfad0rkBZBy5Un3HFMjLu6z2JjRyhgIZb1i4yLJVephegQ+Fwxnt2wIw2nTwyOvRpTOUjADL+JuKR8rtOE3AiIgH8tcYxOS9ef6ej9opFJVpP7fTaqRnJp1HTv0S03yWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790033187; c=relaxed/simple;
	bh=H5rdSGcFaJYoGMYc7E9MtJ8OgtV0debLmob9M82ZW04=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tGS4fPwbkhI5uIvEYgfhNja6G3o6aWWf2lh2p/v3rWdUEuuYSyZYXO7F+/O6MJWUeYf88CXiL2o7JKTsZtB6FsP6yzpWPnBxsNRqgp2TI/lvkMzgnYWCc49Se0ejrTjIORmHO2DDKnNLEdZxzy1jxfWUH5mPQKWgGS2tGhWN4ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HhM5wpxk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HhM5wpxk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A73DC1F000FF;
	Mon, 21 Sep 2026 23:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790033181;
	bh=5e4igy8Yg6g+2jgRPbWk0CuyslNekc1cN6eSy20Zj2Y=;
	h=From:To:Cc:Subject:Date;
	b=HhM5wpxkvdgi3g4qrkNNgc0Ci0aIva31czsXlEfB/hVq+4jC7zaAFsO1xKaj2T42j
	 kLXJyoVeMzLWQivSYxtwB7ym0JKKYho/a324hpHTBlmfp9+HhwmdOaWYuhj9SMRWNF
	 sRhjoVxKD1sFvj4tJ7VEPTDio8qvBBJY4RSavTsEAoD9J/kpMHpusran0bdqEnaDyk
	 v83ZJiA57yJ9w3ARh1CoZe8LNeBSpu3PaGefOMVBDcymVpwPZI36FFZ+hm4CiOCjw+
	 8OA7k3ubtGBhVAhXfcFpX78V7KhmpuAYq6j4RVv9YIuSxpZmTNxi10bNP3h74E0cCl
	 LmxqvcCp67W8A==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Peter Rosin <peda@lysator.liu.se>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: mux: reg-mux: Allow zero-cell controls
Date: Mon, 21 Sep 2026 18:26:16 -0500
Message-ID: <20260921232617.3130745-1-robh@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some reg-mux users reference a controller without an argument cell
when there is only one mux control exposed by the provider.

Permit #mux-control-cells to be either 0 or 1 so the converted schema
matches both existing provider styles.

Assisted-by: LLM
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/mux/reg-mux.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mux/reg-mux.yaml b/Documentation/devicetree/bindings/mux/reg-mux.yaml
index dc4be092fc2f..c8de11a90d90 100644
--- a/Documentation/devicetree/bindings/mux/reg-mux.yaml
+++ b/Documentation/devicetree/bindings/mux/reg-mux.yaml
@@ -22,7 +22,7 @@ properties:
   reg: true
 
   '#mux-control-cells':
-    const: 1
+    enum: [ 0, 1 ]
 
   mux-reg-masks:
     $ref: /schemas/types.yaml#/definitions/uint32-matrix
-- 
2.53.0

