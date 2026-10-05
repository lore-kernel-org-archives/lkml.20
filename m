Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0634CE662;
	Mon,  5 Oct 2026 15:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791215194; cv=none; b=hWSsQRfLe4PhfwK9HMg3SIBiwreK96YEMXdkcNWUUq1Kb23sMpD7rqqzLPl2YBcMP3FrW/vUF3YsW/5BIId8tf0BO3qbXKap5WlIqbq1cypliBrvU5eUQqizeZadFl3Ukw+6mCgeNA8127FefsATof3oBK0T+vDsoUmnA8Gf+vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791215194; c=relaxed/simple;
	bh=bGV9G5R9nD7ctEQpV6vOP/mp7Lb1PLwb7kYkqhYvd+4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hdJvUv+9x/GOG9mhkcQuccjmbWjRLoNURb9heBa4/gEaGOPmOZKPa1NdvCHusel6t03spPGnZ+IWHhCOwacuLkCsZzl/3eUpLLZExSj3JcNFbh0xr5Y204aPhvc4SQFR70Uap6cH0BtN376gtwz8eCM1u8+wTfis1ocTgZsoero=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EXN4d3b4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EXN4d3b4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 612B81F000FF;
	Mon,  5 Oct 2026 15:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791215191;
	bh=1qkoG8gaRxWjMKP3BwD8ZZCwUx2j/gcyqpyeskyFuyM=;
	h=From:To:Cc:Subject:Date;
	b=EXN4d3b4n3G51phf9RGNCVniJ2aRmq1t+T1Lv3qy4bXrgboajwczSxqJTrmCkoUyi
	 fNCxoiaPEQSkwmlG36EUzG20w5ngsmojJXv1DenXMPmWedL9sXedVI9kyt60L52kp8
	 eQKEl2W7/QRc79fWfTGHupyRBaXhbLSzpmCyPCrUQJ6i6psAY6I8rJ6wBtCufyVKPy
	 3xwm0zP0MD16aWAn7h0dJVYIYVDsHNBnEnOcpTBlpbc8TC6kByj0Ns5BfE6Zafzwv3
	 p1rWpGAFkymc2B1qisX2SEArGFYjRMNzq1TAfHIt5e+BtG6kMgV4bcmAlCEyqWj4Ps
	 rFnpx+0XA1JJg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2] regulator: dt-bindings: sy8827n: support standard properties
Date: Mon,  5 Oct 2026 23:26:33 +0800
Message-ID: <20261005152633.25339-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Support standard properties regulator.yaml, such as
regulator-active-discharge', 'regulator-always-on',
'regulator-boot-on', 'regulator-max-microvolt',
'regulator-min-microvolt', 'regulator-name' and on.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---

This is one of the "arm64: add Synaptics SL261X SoCs and RDK boards"
series, I want to send it as a separate patch.

since v1:
 - collect Acked-by tag
 - send as a separate patch

 .../devicetree/bindings/regulator/silergy,sy8827n.yaml       | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/regulator/silergy,sy8827n.yaml b/Documentation/devicetree/bindings/regulator/silergy,sy8827n.yaml
index b222adabc7b4..0baf93ca67ca 100644
--- a/Documentation/devicetree/bindings/regulator/silergy,sy8827n.yaml
+++ b/Documentation/devicetree/bindings/regulator/silergy,sy8827n.yaml
@@ -31,7 +31,10 @@ required:
   - compatible
   - reg
 
-additionalProperties: false
+allOf:
+  - $ref: regulator.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.53.0

