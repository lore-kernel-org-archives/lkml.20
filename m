Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B563F3298;
	Tue, 22 Sep 2026 21:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790112156; cv=none; b=CvQoO+XIeTB6eICSdJjNy6XHNy/8jGmdYT907WrNorxYoTk69dzz/pothqSQhDybpGwg+12nNVNzw9SGb8XsXEGXtvZ1mAPPXrYVWB2ma6d7PA5kbzYaIHOnk18ejS9jNNowx8jz90odGD5umw4jhyuH2tnLLPy45CJ1uWREMMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790112156; c=relaxed/simple;
	bh=SI+8Q1fJaeTnHruvhf48C0lJFAZ57r4JHdbIhUtlIMU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e+QJ8/T8uLGcFQOk57ukAD6JV/Fe7RrrPHTdZOhuJbAwBRA+ql8DaOUmASQmhcLGS3eAyGu4Xr7d6tlS9MWGl7s0vo2N69CqMWhNzaXURhgvipVG9xm/TmJQftq6zWR0gsUEmBrzQt6TnqxIQ8EPycL013xyhg/pBwWfRu26ges=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UIXmCKgC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UIXmCKgC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E4441F000FF;
	Tue, 22 Sep 2026 21:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790112116;
	bh=10f5zfiWAeu+j9qHql55PlzP0+JGh0SpmurGiLNXR9g=;
	h=From:To:Cc:Subject:Date;
	b=UIXmCKgCYQrghKZZB0iD8l7pl1p92dIaScfrsWWWmy3ck19dUO2gzGgttfU11Hqyi
	 BEL+nD8mi1Yy1/AZY60FEWV0CFNYtEi10MMMrYfdSyfe931mQyRZr0gvmCZa+LHN6a
	 SlYXL02uL/n/NcxyETnRM9tj3i/1L8xa0hmKs39W5dkz3EsCFWTKy8XnukqERgeZmF
	 o0pGFxSbH+ceUgw7xLFiUBjfrkZxfHWYOMU3upZMqv0AsDNgsbhYwI620heFrPFVmv
	 zoWiFVstz9RFc2DyLQqbK3Um6deBC6kZpEleYSLArK9PKPXFui1tyFRtcPiN239Ey4
	 /GAZQfCgmsutg==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH] regulator: dt-bindings: Add MAX20024 sd4
Date: Tue, 22 Sep 2026 16:21:39 -0500
Message-ID: <20260922212140.1118832-1-robh@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allow the MAX20024 extra sd4 regulator and its in-sd4 supply in the
MAX77620 regulator schema. The other DCDC and LDO names remain
unchanged.

Assisted-by: LLM
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/regulator/maxim,max77620-regulator.yaml | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/maxim,max77620-regulator.yaml b/Documentation/devicetree/bindings/regulator/maxim,max77620-regulator.yaml
index 7118c34961ba..0f2901cab8af 100644
--- a/Documentation/devicetree/bindings/regulator/maxim,max77620-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/maxim,max77620-regulator.yaml
@@ -10,17 +10,17 @@ maintainers:
   - Svyatoslav Ryhel <clamor95@gmail.com>
 
 description:
-  Device has multiple DCDC(sd[0-3]) and LDOs(ldo[0-8]). The input supply
-  of these regulators are defined under parent device node. Details of
-  regulator properties are defined as child node under sub-node "regulators"
-  which is child node of device node.
+  Device has multiple DCDC (sd[0-3], plus sd4 on MAX20024) and LDOs
+  (ldo[0-8]). The input supply of these regulators are defined under parent
+  device node. Details of regulator properties are defined as child node under
+  sub-node "regulators" which is child node of device node.
 
 patternProperties:
-  "^in-(sd[0-3]|ldo(0-1|2|3-5|4-6|7-8))-supply$":
+  "^in-(sd[0-4]|ldo(0-1|2|3-5|4-6|7-8))-supply$":
     $ref: /schemas/types.yaml#/definitions/phandle
     description: Input supply for DCDC or LDO
 
-  "^(sd[0-3]|ldo[0-8])$":
+  "^(sd[0-4]|ldo[0-8])$":
     type: object
     $ref: /schemas/regulator/regulator.yaml#
     unevaluatedProperties: false
-- 
2.53.0

