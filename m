Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792931049;
	b=O60n6I/t0NJPyagCUTdbQMgJLulYXgMCrBl69kgzWCrtBlAZEzzTrvwA43eTA9VkDizR
	 1eL2ZdOE2NL7FY2UjjdqWohUcJ/ltfOzo/CbITr+TWs3yuDBp2/0F/JUR+csfAvOd8p8C
	 4RNezA+KMjnIZce2zWJhG5N8lqAVRFWWmUMAr0NImOci7v0lWqBLRpkNQW9sOSR8Djd50
	 FAETsVBnnN1D+aWvJaASMdC6roOYQEbMdA7N7VLY0fVWPT1/CpE5Jl3eJ4AwCl3fE72jw
	 aKcAY/GB0tondvA5xShrPPys8uApO5gIljGTAedSxeCoJ8d2hz10acVIAybHw3x2sBw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792931049;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=asQFsxgQNnggINI+MiaVE3YX0MoEnfTw/ot13XBv/9c=;
	b=wq43PZ4GtvKn1LYCQt83EjjcQiMAalFyeqTCxI/tWL+LWBga/VSwEIGfZVdY+IEgoNBF
	 /TVhpIH7+u6Kv5ukDrfqbBaNDYVmm82szOx3juaEY/tfioqWMKsVUth16H3gvHckSze5C
	 QSfdUljK/1RMIuH/v3RRmvW91GZWYqC2i2R0+nAACBahztD+ki2dwz8CWzhpCdu+f7L4C
	 0oXTC5H1QRj6XNC98vmI6O2fUwLmyqqJnKD5DtaJX49PqQZcGEpAS2E2sM8MqcOsRZS2J
	 KVBOhNBrOfjEK6AXI574132Fw0h5jhmIaQZOOAgXDzqjxLuhCLiYI2kMmz9AXT/szVw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zigx51Ka;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540D7606A320;
	Sun, 25 Oct 2026 12:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zigx51Ka
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792931049;
	b=YJ0cCYY2CRIYmIiBPOAeDYgj5R1idBiHkQtAaklDfON3pKhGXk7liYERVsz26FcY0x6D
	 EI+/80Ot9/Uu6uqMGmcMZq/ye46Hgxt8aWS8DwD8aPZSdEXYj1CCWnEx2dsAOjKtJRSzx
	 24RJbJCeKKlIb4EwGKajeiNH2ruC37z71BjLWb268OtUJmMeuMtnK1TysQfBW3UuZcUba
	 VUtvLamAK8uD+1Kg+9OiEh4T4G/L0LUGyBPwa2qAMYaF+5N8UQom9NsdBLOprmCNBOSPM
	 e6ABWMDQ6aqMrbaEFdIGDXeoMHNe1CI82v4CJwiESBcQ7NhgScQ92T8e6SFfJQQCAdQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792931049;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=asQFsxgQNnggINI+MiaVE3YX0MoEnfTw/ot13XBv/9c=;
	b=xm/3Qz5IeSkVuWxBuTrTpIJFJegNXXP5bPcv8D/G9xm/OmGltHfp6e2+kDr3snrxG8yB
	 OFI4v6wyFRC6WpOhrn1QF5yEPypDZFRseVWdTov2d4fV8f5nnJAsgnb6f6lIiWD5PmFco
	 WSpa8dNwnhoe9Txc5QPEU41drOFLdwzfeEuBYWQt7SGQhjvIF0rzbBdvDMSMdGlz3Kb8a
	 h7dNYWMOhRui31zB+7lpCr2SBMdUfPOQiUJVTxL/5zGYC09pQ3Ehlqc39Th8y67aoHRwJ
	 QDmo2xWb5q9J4aKo8LbTR4W0ep0AORfTH+1qLojV5438hx1QMTjmbSkG9rHWmmbwFaA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B25B51F031E0;
	Sun, 25 Oct 2026 12:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792931049;
	bh=asQFsxgQNnggINI+MiaVE3YX0MoEnfTw/ot13XBv/9c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Zigx51KagLFmPw8emFNm85cuhgb0CYeCTmKMsng1CqsvxTYTcuRCkpF1DF8i5bKl+
	 t9MDaEyPc7ePNI5QuJaHCHPGDL3Q9rYoy8k8NPqrem6hqt/Yo9foMnB33FIcAfEdgn
	 8wobU2s4x9MAUhv7A2VWLIMrmOF5aIvihGKu/FvleM0DHdtk8x5MD6U5mQwH0LSG1L
	 SnBUFLWBRJdd53qOwUdJJfLFbRNhuY/aBXhu/Qk6lU9/lmydQEFdlrCSYcjvr2+bCQ
	 vrcD6G141g76DlVKO/wrnPukHvzVcwHeMl5jM7FJ9b/V1evxIEKC6DO0K1Ryz8NZAE
	 gXjJaCG/Q/hhg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 19C3E449F3;
	Sun, 25 Oct 2026 12:24:07 +0000 (UTC)
From: Xincheng Ji via B4 Relay <devnull+jixincheng.ultrarisc.com@kernel.org>
Date: Sun, 25 Oct 2026 20:24:01 +0800
Subject: [PATCH v7 1/7] dt-bindings: vendor-prefixes: Add shenrongda
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
Message-Id: <20261025-ultrarisc-dts-v7-1-621eca2b8790@ultrarisc.com>
References: <20261025-ultrarisc-dts-v7-0-621eca2b8790@ultrarisc.com>
In-Reply-To: <20261025-ultrarisc-dts-v7-0-621eca2b8790@ultrarisc.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Andrew Lunn <andrew@lunn.ch>, 
 Jia Wang <wangjia@ultrarisc.com>, Xincheng Ji <jixincheng@ultrarisc.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792931045; l=887;
 i=jixincheng@ultrarisc.com; s=20260922; h=from:subject:message-id;
 bh=e/Kow+cCHmWBpSOP+t1oxwgy4BH4snNIyYRmuufij+E=;
 b=JfIG7FI5XtXsK04W54Xyqv71zKVhvwocdqFPmXuo6n1CP9XtNs48tgAW68sXuIZPh/TJ62b8/
 RKpFkYQAz4RC7tEU8UMitKITLzTvBG3g6j8breWPhXVIuaK58OG+J+t
X-Developer-Key: i=jixincheng@ultrarisc.com; a=ed25519;
 pk=n848dcS5D6g0vLad/rjp4Gf/1eedTe1a3pYUrkt2260=
X-Endpoint-Received: by B4 Relay for jixincheng@ultrarisc.com/20260922 with
 auth_id=1046
X-Original-From: Xincheng Ji <jixincheng@ultrarisc.com>
Reply-To: jixincheng@ultrarisc.com

From: Jia Wang <wangjia@ultrarisc.com>

Add Shenzhen Rongda Computer Co., Ltd. to the vendor prefixes.

Link: http://www.shenrongda.com/
Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba2002969373..e100f3993e57 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1507,6 +1507,8 @@ patternProperties:
     description: SGX Sensortech
   "^sharp,.*":
     description: Sharp Corporation
+  "^shenrongda,.*":
+    description: Shenzhen Rongda Computer Co., Ltd.
   "^shift,.*":
     description: SHIFT GmbH
   "^shimafuji,.*":

-- 
2.34.1


