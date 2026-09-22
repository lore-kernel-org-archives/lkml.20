Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A8A5496D24;
	Tue, 22 Sep 2026 18:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790101895; cv=none; b=OY17ALlUTCpdpr1B2dPsTrxJXj1Udg2qsDExhSN8LkCcibsB6pbUPjEMdY/Y0GnLI5ZEjLOP/4cqTkkAnJXRvNa1P7VNOUl5Zh9VhgErmqTZOnq2dpEsJSoYXGaMqtDDYwNnCyP3ZyR2rBVBtT1DpiUSf4dJNGbXFz2CCfGWod4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790101895; c=relaxed/simple;
	bh=6DPjPcgSorqvai2hDpzGkLYSHgBnZMVomlIiBuBc/+s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MJOlI4O9DqvwcWgH4+Urgxx1gR187U5fnZsarpgQR6rz62LSOBlq0GzFfZ6QDopXvEVuSr0D0ilB+l8rymJwaGE42WYdbHIMcAgHcE84mNCCVX5UYCaV5ROFV+dbjSY8LWpkJLXWbGp42Rml3XQMlopOp7gkWwy/rp76s2QOZsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GNmBqeJ+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GNmBqeJ+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5812E1F000FF;
	Tue, 22 Sep 2026 18:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790101893;
	bh=k8W+6mElJh/P8AQkKZq6DoPCZQlLpTZjw+Lep4HvOiI=;
	h=From:To:Cc:Subject:Date;
	b=GNmBqeJ+XJk5Ykj8VyskprYSl8NLIGxO3xAZstRBG5XJ94MqGROmTSTO9VGH7dN0C
	 b5QRtWDLOSbPli28OlRhTp/NFUDWhA9NnhIrrZkzsEzqFRe9jFRqX5Ck/xvywUlkD8
	 wxB+WabsF7qqSbeTqOJdrjl8XEMHq7F4VUDWbEcVBEDHYlz8CUmp9PL26WbRjFJBGA
	 ur+4BlPQG0jT87N0/xtY38kaJ2S0jAtXqUCsTqeiaKjJ1K1rgRi5rMq4UE1j4uPW0p
	 hZFSoNAkRVHm89adrR4un0867LfCriqWdXkI/RLv0PgmeB77pB9HZK3ywHNHEHm+Cd
	 5NKcQnC0ws1aw==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	John Stultz <john.stultz@linaro.org>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: dt-bindings: hi6210-i2s: Allow graph ports
Date: Tue, 22 Sep 2026 13:31:28 -0500
Message-ID: <20260922183128.289564-1-robh@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HiKey DTS uses the HI6210 I2S controller with an audio graph ports
node for the ADV7533 connection. Add the audio graph ports node so the
converted schema matches the existing platform description.

Assisted-by: LLM
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/sound/hisilicon,hi6210-i2s.yaml       | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/hisilicon,hi6210-i2s.yaml b/Documentation/devicetree/bindings/sound/hisilicon,hi6210-i2s.yaml
index 5171f984630b..b12698264724 100644
--- a/Documentation/devicetree/bindings/sound/hisilicon,hi6210-i2s.yaml
+++ b/Documentation/devicetree/bindings/sound/hisilicon,hi6210-i2s.yaml
@@ -48,6 +48,10 @@ properties:
       The dai cell indexes reference the following interfaces:
         0: S2 interface
 
+  ports:
+    $ref: audio-graph-port.yaml#/definitions/ports
+    unevaluatedProperties: false
+
 required:
   - compatible
   - reg
-- 
2.53.0

