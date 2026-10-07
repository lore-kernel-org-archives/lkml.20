Received: from twmbx01.aspeedtech.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6509C3F3283;
	Wed,  7 Oct 2026 06:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791353639; cv=none; b=nK3ZTY/ei+3bo8JylGxBWgTybCj2W189a8HIXx63CIupH2gyH6y/lGtskiWhcmKcheS0Fb2DOEp/ywSrovBPUgp4i+o0d/RLJK3az3NCR8C7uAmDvFItvU/1uYEtS/M+/Py86bKZ25pPiguN1QckS5uJ8XYmHhAop4/rrsQXnqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791353639; c=relaxed/simple;
	bh=/rj5B9ojWffAdYkp2s4TIp84wfNqe/zSqKMEbEuHOX4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=q2SEhY+jtrZf+sVHESjEuBFB573Sff50gCIRZWBc8nEVmEid8UaMxC1GTihND/0hDelydf0uhyKi9G72afF47KxkMUCzyC33Oa5tqvJmeroD13qvB1/KBqCE97GJnIMYbtypnrBOQuQMAyTzhBZhUQpOZoGJWJZ2eZRDb+Or5iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 7 Oct
 2026 14:13:19 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Wed, 7 Oct 2026 14:13:19 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
Date: Wed, 7 Oct 2026 14:13:22 +0800
Subject: [PATCH v5 5/9] dt-bindings: edac: aspeed: Add AST2700 SDRAM EDAC
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261007-edac-v5-5-5c31fc5df4cf@aspeedtech.com>
References: <20261007-edac-v5-0-5c31fc5df4cf@aspeedtech.com>
In-Reply-To: <20261007-edac-v5-0-5c31fc5df4cf@aspeedtech.com>
To: Stefan Schaeckeler <sschaeck@cisco.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
	Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<linux-edac@vger.kernel.org>, Borislav Petkov <bp@suse.de>, Ryan Chen
	<ryan_chen@aspeedtech.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791353599; l=1457;
 i=ryan_chen@aspeedtech.com; s=20251126; h=from:subject:message-id;
 bh=/rj5B9ojWffAdYkp2s4TIp84wfNqe/zSqKMEbEuHOX4=;
 b=AJM+cel2UfX1IbXR5Cgq15LxeSm64dJolgbx2sj4/sWszDNr3o2TvIKR68wUXtHll2wIPknRF
 uXj2hsbIQXvBmwzULyLn87ioA40bB+HdFfeI61dkKTybXGkgpubgMgM
X-Developer-Key: i=ryan_chen@aspeedtech.com; a=ed25519;
 pk=Xe73xY6tcnkuRjjbVAB/oU30KdB3FvG4nuJuILj7ZVc=

Add the "aspeed,ast2700-sdram-edac" compatible and note DDR5 support.

Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/edac/aspeed,ast2400-sdram-edac.yaml         | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/edac/aspeed,ast2400-sdram-edac.yaml b/Documentation/devicetree/bindings/edac/aspeed,ast2400-sdram-edac.yaml
index 09735826d707..685b6815f293 100644
--- a/Documentation/devicetree/bindings/edac/aspeed,ast2400-sdram-edac.yaml
+++ b/Documentation/devicetree/bindings/edac/aspeed,ast2400-sdram-edac.yaml
@@ -10,8 +10,9 @@ maintainers:
   - Stefan Schaeckeler <sschaeck@cisco.com>
 
 description: >
-  The Aspeed BMC SoC supports DDR3 and DDR4 memory with and without ECC (error
-  correction check).
+  The Aspeed BMC SoCs support DDR memory with and without ECC (error
+  correction check): DDR3 and DDR4 on the AST2400, AST2500 and AST2600,
+  and DDR4 and DDR5 on the AST2700.
 
   The memory controller supports SECDED (single bit error correction, double bit
   error detection) and single bit error auto scrubbing by reserving 8 bits for
@@ -25,6 +26,7 @@ properties:
       - aspeed,ast2400-sdram-edac
       - aspeed,ast2500-sdram-edac
       - aspeed,ast2600-sdram-edac
+      - aspeed,ast2700-sdram-edac
 
   reg:
     maxItems: 1

-- 
2.34.1

