Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6CCC47F3B5;
	Fri,  2 Oct 2026 17:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790961313; cv=none; b=GeLrOSqPVamxMg6LWWyKvZ08fj5xg4P6NBbkOEeoqHVlAg1KYClSWpivsGTmrgjPHC637QaErJkYBa7RrqujKGwB2Np/DMAKejUKX25ft5cWX99ebsAylu1gLTxJXgJ28MOvwnsyHGBRC96NHT/3sIP1C9n600YbcOulqUW3dJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790961313; c=relaxed/simple;
	bh=iobRN+K5wRBlMHtDKMCLc31ofXdSq97nC5LHjyuxmmA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hWT7UxHlL01BcpNGy75uWUZgRyk5rdHOT+Lqgwb8r49IefGsvgxvVSx55qQFXwtRLkOEtlFpRhLf/7N0fTyMugej1j7faPv+zUkNhqcvCX7xLYSwVfas0gYg4uKgOA4HFmTuT21gkhbPfgudU88x+aL7k8UH2fbzh12V4xXT0xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MQ0wN87P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MQ0wN87P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1754A1F000FF;
	Fri,  2 Oct 2026 17:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790961304;
	bh=WQPluei+NWGBB68zDDNHLmlcK6K1wc2kGH8Ruob1/Hg=;
	h=From:To:Cc:Subject:Date;
	b=MQ0wN87P8qcXU/Y14LujlCXQDVE5PNQBuAdVG2LeIA8QCR2QOphYZPkXjmUcrjO/3
	 xAUR2fxvGHFV79qp97MYNv40DvXR1rP4i3JRpVCOtOWb1XR18uX3Orp2ThtY3xe6Sb
	 W8t/sPIPf/G7qtiDnrJ8wxhT6g2xlFX40D4YXIvRvjTduhbJlLYT6RPULWfNYqCpRJ
	 3dE5SDOD0Jj5q/7CIXrTtXP/MKSgLo9aJbp0225ac0c56dwYXjUlNT9CSGoG5u8ToL
	 GYQJSL3KNCU8zmRAqvgc+cNQV9EOzDqRphiUqoH1kr+FcO7dnEuF8LCqZd5rFMVd1R
	 3+HqRQ702EnFg==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH] regulator: dt-bindings: Drop obsolete MAX8925 .txt binding
Date: Fri,  2 Oct 2026 12:14:54 -0500
Message-ID: <20261002171455.2719968-1-robh@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The mfd/maxim,max8925.yaml schema describes the regulators for this
device. Remove the obsolete text binding.

Assisted-by: LLM
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/regulator/max8925-regulator.txt  | 40 -------------------
 1 file changed, 40 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/regulator/max8925-regulator.txt

diff --git a/Documentation/devicetree/bindings/regulator/max8925-regulator.txt b/Documentation/devicetree/bindings/regulator/max8925-regulator.txt
deleted file mode 100644
index 0057695aae8f..000000000000
--- a/Documentation/devicetree/bindings/regulator/max8925-regulator.txt
+++ /dev/null
@@ -1,40 +0,0 @@
-Max8925 Voltage regulators
-
-Required nodes:
--nodes:
-  - SDV1 for SDV SDV1
-  - SDV2 for SDV SDV2
-  - SDV3 for SDV SDV3
-  - LDO1 for LDO LDO1
-  - LDO2 for LDO LDO2
-  - LDO3 for LDO LDO3
-  - LDO4 for LDO LDO4
-  - LDO5 for LDO LDO5
-  - LDO6 for LDO LDO6
-  - LDO7 for LDO LDO7
-  - LDO8 for LDO LDO8
-  - LDO9 for LDO LDO9
-  - LDO10 for LDO LDO10
-  - LDO11 for LDO LDO11
-  - LDO12 for LDO LDO12
-  - LDO13 for LDO LDO13
-  - LDO14 for LDO LDO14
-  - LDO15 for LDO LDO15
-  - LDO16 for LDO LDO16
-  - LDO17 for LDO LDO17
-  - LDO18 for LDO LDO18
-  - LDO19 for LDO LDO19
-  - LDO20 for LDO LDO20
-
-Optional properties:
-- Any optional property defined in bindings/regulator/regulator.txt
-
-Example:
-
-	SDV1 {
-		regulator-min-microvolt = <637500>;
-		regulator-max-microvolt = <1425000>;
-		regulator-boot-on;
-		regulator-always-on;
-	};
-
-- 
2.53.0

