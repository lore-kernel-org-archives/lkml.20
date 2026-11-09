Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794250024;
	b=KVq8Ovs2+B39bSEso2vepgeYyrW9qzNdUBQoriko+2eTYQs80t/jyt0Pf2syPaKED3hI
	 I1oQZ5+XzXfsYuinVvcfXvoEt6cV9T+AkFmBD9bLVyPvqXs0jNFpIGnklo0qQdNex/kLH
	 ANK52Z8jvP9Qsi9omW+DgnuP48x73oELwqYlVa+6S4QTEOmNPLFZMfTjCa/D1llOWNm0J
	 ShGXaAxNHl3TVzuZBqYaYv/N1It7tV+jqyEGPqFV/I89tTKeDTNqeFYd6jYpZiLhdgZo9
	 O/k8BLHKDZQ0F73lD/10e0w7OxQcZcrjCYL8ZmqTLr1xh65oQ8qcCPCua+gLXxppslw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794250024;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rCrvw5LpzEZ9/PFYR2h5t7QUY2o6lTYln5faL5j979s=;
	b=kF7+7JTnNvDhuNK9F7go9XX5OMSN2eq3P+8KVFciS9mvVXGQ46MN8fjX+0u0wqun98rI
	 z1Hum/LUo9O0DZtRR4f14xUyWnKdWx3D00tdXPLAFwRjwaTm9upbtzXi7CI40vZPjlyxz
	 di5YBgll0C+TxCyxXpz5nbD2Njl8b8EIQzc4G6nrptUaNxtykwFdxsmmT4rhPZar58KKi
	 3CCczVboImwHagkShK3DD0kk0U4JL7zz6Nxl4Y2NLcp64ETybCM8aexMt+dEeJ/Wbi/jX
	 TD93YaIrnJc/VAfmqC+EvvzVSu0/B3mKwcEr5Qwl2q0hd8D5VRomCK2XhZA0Rz1egFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bD90Y4LG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683B0606A325;
	Mon,  9 Nov 2026 18:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bD90Y4LG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01F521F0089F;
	Mon,  9 Nov 2026 18:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794250024;
	bh=rCrvw5LpzEZ9/PFYR2h5t7QUY2o6lTYln5faL5j979s=;
	h=From:To:Cc:Subject:Date;
	b=bD90Y4LGJaHi9ULBCK00n1aUuQocG2nZYY9yaZdBh5RUnvHrYk5UxOySj83Gj+EqP
	 jU7hVKoMwey+loTmFox3qUaVB+oZu9m+H/FMktV7IGoCNC83wez96Jp/5j8T7UxGLK
	 gLqUArTfXgSiczLBvmmIbHIEvYhTP7YsEP9kM8ikQaKma367R0IFcvwpXeDP1rQw8B
	 y89WwlafNLkK0d7gOQUX3NBJshJ9eFTZFuHzRw34vNpEctZrNDbzjJWzyda8Rh70A7
	 OZUxN7Xh9aJ3Y+xxx6q24M+dLL1T9R+c7MeDG48DTBYpUQEatRlyoa9j5yNFqIUzKq
	 X+TBXuqBebS9Q==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Lee Jones <lee@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: mfd: max77620: Add gpio-hog nodes
Date: Mon,  9 Nov 2026 12:46:53 -0600
Message-ID: <20261109184654.462128-1-robh@kernel.org>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some Maxim max77620 users define gpio-hog nodes, so add support for them in
the schema.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/mfd/maxim,max77620.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/maxim,max77620.yaml b/Documentation/devicetree/bindings/mfd/maxim,max77620.yaml
index ac063c2bab73..99014b792a74 100644
--- a/Documentation/devicetree/bindings/mfd/maxim,max77620.yaml
+++ b/Documentation/devicetree/bindings/mfd/maxim,max77620.yaml
@@ -165,6 +165,13 @@ properties:
   regulators:
     $ref: /schemas/regulator/maxim,max77620-regulator.yaml
 
+patternProperties:
+  "^(.+-hog(-[0-9]+)?)$":
+    type: object
+
+    required:
+      - gpio-hog
+
 allOf:
   - if:
       properties:
-- 
2.53.0

