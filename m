Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10D2051EDE0;
	Tue, 22 Sep 2026 21:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790112110; cv=none; b=dtBmZt8He6DG4qHxz+O+1PTNF2oocZSJilCzb9ki6141uHzDKw1BrycGl3k3gFfIAfdW+x036lyYD0EAtvNDZB/lDpDAyIB6hMLYQk7o9i8RY+HUOUAirTNpF6a/EOL3Jzrms3Sr4hXg9B+i6v0YArV6ecOWEY29uNURFcXV2p8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790112110; c=relaxed/simple;
	bh=lOMseSHWIsudkCCb79ow5JV7GEZEvs7VqkveSuaOwcg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XliojcGz++a7EaMk1BhPVUdAbh9NtfWijg2udKpD4/ezMLKyJIJt1C8fTiUXhbT1j+CloAsOUF8yfYQiU3oYXkZBIsf4QEgfc+CvbTZBHgmJEn3Rx9k5CLjyU5iaSRWInWL1VDi1hukafLkzXhHmCZIwm5yPFUkrUktOD5bvEFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lpbR9rdH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lpbR9rdH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BB801F000FF;
	Tue, 22 Sep 2026 21:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790112092;
	bh=aRj2Pfut3w4gPlraMQFDMz6M4M2ctzv1ixckYhyIY2Y=;
	h=From:To:Cc:Subject:Date;
	b=lpbR9rdHU/K1iDh/Uok82Dr0KnU5HiLjeEfmMuZcZPtLPFOtLu+EKT60NoTfBd4aB
	 pDN8R/4qL9B1mjQMkrw1zHIjoqixCBMRpy+8WgvhSDBDuqAj6VUwlqdVQQPfGqRoX1
	 ENgHSbLXED6wwsy1oNX8zdbiG3DHy8c7I5ZVSnKIrt1sY7tlTgpr93cvBRii4+Tdj/
	 y2RrwKd7yNpYPpWDjk4J8sWGeXCdN+VUmPbB/JrlHNfHsoede8VT6moYHGIILO3t4J
	 yrAnjdaShOA/N+tJwIM1pU8vOvKeuUukeV2NjZunrKp9TWbNSNDkJDImvsN18IxvC2
	 tmiWpbSAHDD8g==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shenghao Ding <shenghao-ding@ti.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: dt-bindings: Fix TAS2563 address constraints
Date: Tue, 22 Sep 2026 16:21:21 -0500
Message-ID: <20260922212122.1116270-1-robh@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Apply the TAS2781 register range only when the compatible is exactly
ti,tas2781. This avoids applying the TAS2781 single-address rule to
TAS2563 nodes with 0x4c-0x4f addresses.

Assisted-by: LLM
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/sound/ti,tas2781.yaml | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/ti,tas2781.yaml b/Documentation/devicetree/bindings/sound/ti,tas2781.yaml
index aa5a317b5a36..50c7792b24f8 100644
--- a/Documentation/devicetree/bindings/sound/ti,tas2781.yaml
+++ b/Documentation/devicetree/bindings/sound/ti,tas2781.yaml
@@ -219,9 +219,7 @@ allOf:
   - if:
       properties:
         compatible:
-          contains:
-            enum:
-              - ti,tas2781
+          const: ti,tas2781
     then:
       properties:
         reg:
-- 
2.53.0

