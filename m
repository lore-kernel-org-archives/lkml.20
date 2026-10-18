Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB6F49EC4B;
	Sun, 18 Oct 2026 16:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792339689; cv=none; b=C7TIZmcqyBz/SsT7JKQBNs7K7OuhTE6N+pbw6DiA//L4sKEnwTYvCTZAy8T3eyts3ZbVRImFFRDFXzR+1R0xf9jRCETr1xrnBKSfQPVapAAkNHTELqHTtviBtxYjlhezZO7e8aYMBbHCITTuDgdBD2qBzYblQ4MGFeh+8MdDh4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792339689; c=relaxed/simple;
	bh=ifYBiHotvB/SbsZBlhXJh5UtnC7DTPDH8QJ0nCsgB5A=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qaNqq1soG7m1Www2ROXmfxopTKRnFw6uKU26tfNHEm7B6/yltkro0ssnQisv7xYpBuzFHYFT5k7rGHRHHDijfrwYkUgngSgtd8eXstf0z0ShxRnGBMcx96gvfbx6/SnpEVlZXmRviAS04iUF6KypfjYDeStI30WLus3gIm+0VAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=rgnQagsu; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="rgnQagsu"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 69IG6rQnA1115122, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1792339613; bh=BQB2rmCW29JvpU3qGm2v4c/LJ09qeYiDXYkMOh7dsnE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=rgnQagsu0GCxHWcE9rJgR1Nbbf6WnkqckNib8WKDFtaLHL9CMsXtri6SQYiEDoAZe
	 zL9VSiMiz5AkxhLTwD9yJoV7/3Z7MTdrm4lvV0I9p3sGnDdsgA/qSVJ132wxv9e8OL
	 mHRFV//X/4t1jSV1ZSVTqieQ/vcK5voJF41eR3FDZ1AqhxlE6ZeBknT1C9WW1MG/EL
	 ml8VDKsIuA6gaStAHDqVsyZUP5Ps050HZgFSiqnkebPPPlKu9jmTjPQ1P5kNWPNZ9I
	 jQa5eykDdlsmu4Bv9M/v9N3t07gYOpa2s+TXX8DhaRdbbnML5ftfLDKH9/28qNHP1/
	 /DM/DO2uZaDTg==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 69IG6rQnA1115122
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 19 Oct 2026 00:06:53 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 19 Oct 2026 00:06:54 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 19 Oct 2026 00:06:54 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Mon, 19 Oct 2026 00:06:54 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <tglx@kernel.org>, <radu@rendec.net>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <lee@kernel.org>,
	<afaerber@suse.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<mfd@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-realtek-soc@lists.infradead.org>, <james.tai@realtek.com>,
	<cy.huang@realtek.com>, <stanley_chang@realtek.com>,
	<eleanor.lin@realtek.com>
Subject: [PATCH v5 2/8] dt-bindings: mfd: realtek,rtd1xxx: Add new SoCs
Date: Mon, 19 Oct 2026 00:06:47 +0800
Message-ID: <20261018160653.3940371-3-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261018160653.3940371-1-eleanor.lin@realtek.com>
References: <20261018160653.3940371-1-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add compatible strings for Realtek RTD1619B, RTD1319D, RTD1325, and
RTD1625 syscon registers

Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
 .../devicetree/bindings/mfd/realtek,rtd1xxx.yaml         | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/realtek,rtd1xxx.yaml b/Documentation/devicetree/bindings/mfd/realtek,rtd1xxx.yaml
index b0342df0e32a..717e29c37b36 100644
--- a/Documentation/devicetree/bindings/mfd/realtek,rtd1xxx.yaml
+++ b/Documentation/devicetree/bindings/mfd/realtek,rtd1xxx.yaml
@@ -28,6 +28,10 @@ properties:
           - realtek,rtd1296-misc
           - realtek,rtd1296-sb2
           - realtek,rtd1296-scpu-wrapper
+          - realtek,rtd1319d-iso
+          - realtek,rtd1319d-misc
+          - realtek,rtd1325-iso
+          - realtek,rtd1325-misc
           - realtek,rtd1395-crt
           - realtek,rtd1395-iso
           - realtek,rtd1395-misc
@@ -38,6 +42,11 @@ properties:
           - realtek,rtd1619-misc
           - realtek,rtd1619-sb2
           - realtek,rtd1619-scpu-wrapper
+          - realtek,rtd1619b-iso
+          - realtek,rtd1619b-misc
+          - realtek,rtd1625-iso
+          - realtek,rtd1625-isom
+          - realtek,rtd1625-misc
       - const: syscon
       - const: simple-mfd
 
-- 
2.43.0

