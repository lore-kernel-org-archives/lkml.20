Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D3F377ED7;
	Sat, 19 Sep 2026 19:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789847059; cv=none; b=TGIYJP2wH5iVnmNTedvuRDcuZS5UqZjmzGMDw/0C80PiEWoza0iCRB7IBh7WTW9SZs96DHntM29foV0/iKsb6fHUSrgTcAs6OPBXDS3flW+GE4Ti1u6evK3pawc2qJgyYhrkw5ZXln+TuHuI6G1VQz4JK371MdxPpaKl9cD7abk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789847059; c=relaxed/simple;
	bh=m3esp8qIvL5KMF6ISMGW/BY5E1YSXXPNADpk4JRXN+0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=li25g2JdK8IOCYr1clqSeem6Gk1BsgpD7IWoN1+ggF1kaWf3sAPNW/L5f0Bm70gJDvGBNDpEcMnYrnMbBs8d0BydaX05bi1xns7lHZpbO5uOw7bgyRATcxgg3O7PFX5z69WoGB8TMvdTDw4/spswSBxTfWvSekn+paaEsav7x+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RrVBsGYg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RrVBsGYg"
Received: by smtp.kernel.org (Postfix) with ESMTPS id ADA25C2BCF6;
	Sat, 19 Sep 2026 19:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789847058;
	bh=m3esp8qIvL5KMF6ISMGW/BY5E1YSXXPNADpk4JRXN+0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=RrVBsGYgzEYeUqMBtWU08Rkh3WOBSDqeNE7qeMj6zAE+3CSWjyYTjQVSpsZDoU5Nn
	 GXbPuGQmURw8EepAhH4mKjZgJKnuOM/8lGVGf4vyb6/D4nYzgIk/QW+f1e5pBYYEvj
	 MfUL4OAPkX9yCSXrAM3UrUAdugBFft7SYxnSX6jGXyY6j5RZsiE2XXLs5+TpAKAHno
	 O8+0kQLFI4wcBt//KM8Otb/DksfHHfxZlRaH2xCMDtef80P/oRVkL6/v2yxHIYpPZx
	 TdvUVfPgFkUmEyW1Sloy89w/chPVp62UTCTtAGc1aQjjj1R3GxjUsMVEgenTEo/TuA
	 e+h40nWyFBAng==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E1F4C982D8;
	Sat, 19 Sep 2026 19:44:18 +0000 (UTC)
From: Nicolo Giuliani via B4 Relay <devnull+nicolo.giuliani6.studio.unibo.it@kernel.org>
Date: Sat, 19 Sep 2026 21:44:17 +0200
Subject: [PATCH 1/3] dt-bindings: vendor-prefixes: Add Sophos
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260919-send-dt-v1-1-365615a74ef3@studio.unibo.it>
References: <20260919-send-dt-v1-0-365615a74ef3@studio.unibo.it>
In-Reply-To: <20260919-send-dt-v1-0-365615a74ef3@studio.unibo.it>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Nicolo Giuliani <nicolo.giuliani6@studio.unibo.it>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789847056; l=951;
 i=nicolo.giuliani6@studio.unibo.it; s=20260919; h=from:subject:message-id;
 bh=P6WprlGl9p4BGd2SEJ2f0lzIH3aESc5ZjrcnEQEX7U0=;
 b=uaqsp1Pmm4v68ng2YFLr+O9LDI/RnSSD6CvL/r7i9mabCCNOJmeMskDvDFa1iQNgW6v7CMk3z
 qwdh+uzq7AxC9YAM2nXxq7W8Q7a+guR8MqJPilI099nTHadhidS95GR
X-Developer-Key: i=nicolo.giuliani6@studio.unibo.it; a=ed25519;
 pk=D652ecdT01GkA1eoFWNFNX85xIg5ZnFwUWyjfestgQw=
X-Endpoint-Received: by B4 Relay for
 nicolo.giuliani6@studio.unibo.it/20260919 with auth_id=1040
X-Original-From: Nicolo Giuliani <nicolo.giuliani6@studio.unibo.it>
Reply-To: nicolo.giuliani6@studio.unibo.it

From: Nicolo Giuliani <nicolo.giuliani6@studio.unibo.it>

Add the "sophos" vendor prefix for Sophos Ltd., a vendor of network
security appliances. It is used by the compatible string of the XGS 87/107
firewalls, documented in a following patch.

Assisted-by: LLM
Signed-off-by: Nicolo Giuliani <nicolo.giuliani6@studio.unibo.it>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba20029693..3dd9d9b8ab 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1595,6 +1595,8 @@ patternProperties:
     description: Sony Corporation
   "^sophgo,.*":
     description: Sophgo Technology Inc.
+  "^sophos,.*":
+    description: Sophos Ltd.
   "^sourceparts,.*":
     description: Source Parts Inc.
   "^spacemit,.*":

-- 
2.48.1


