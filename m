Received: from tabos.org (krueger-it.net [145.239.1.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 445A5332638;
	Sat, 29 Aug 2026 05:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=145.239.1.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787981704; cv=none; b=Toq3HYAq1aJI0iz7aP/I4vX2H1BLO8gqrNE21rGv++4Q21sSFqx3NtOySaKT76XelFsN1Ei8GbJjH3ZmXVTZAe3LjX/OW/kPEf5kpbyjmEgCzgJga6WGKWog11RFyI+oVw+wtt0kiHTMgBomXgwi4p+PHYK/YTqp2NaYcQCaOlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787981704; c=relaxed/simple;
	bh=zCLjvGvetlBbzOO0xTJrZQPRX26/wnzb2xc+NwCgPAo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gR+d3Ov4+oNIX6QPOvcAFbjSom9UGbvXsHYPIegobvh8Kh8N9g6/IT6jMeMkhXzLwQDM6ziB7BypN1hAi7zOR+wzhUzloZeKH1kR4Ilr9lkiBKje+N7ulC+lbvvdjPBZKloYUu0Z+Imdq00MdYQWjESzDFf+LcsT/TNThRlLrC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tabos.org; spf=pass smtp.mailfrom=tabos.org; dkim=pass (2048-bit key) header.d=tabos.org header.i=@tabos.org header.b=ppoU3wuG; arc=none smtp.client-ip=145.239.1.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tabos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tabos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tabos.org header.i=@tabos.org header.b="ppoU3wuG"
Received: from c0d1ngstat1on.fritz.box (unknown [94.31.74.100])
	by dserver.krueger-it.net (Postfix) with ESMTPA id 6F58C62E0A1D;
	Sat, 29 Aug 2026 07:25:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tabos.org;
	s=default; t=1787981123;
	bh=q9D7t75NUmUdrFlHiaH96KoysStqk8e7mq5Lf5iF0x4=; h=From:To:Subject;
	b=ppoU3wuGiuw0CBQiWHp1t9+Iw1y5b28kXnZ2zSZlPamo6vVEgmkomEOBUEBBJax/W
	 fa26HpzonkocY9cM3ZczrNLkwAchuoBkxWZ/zEgdoBN82tE6+GUxk3tAevKQjfYNKl
	 WRbs1lq7aiDlrbSUlIXAfX0K2Sv6mN6EGCIjs7LBwtnSvvjdPPOMsd/d0ZY8ZyaZia
	 uYc7I9d6pju92Jthx8Ikc9MWBOZ8PFaBzA0Ee5pOB365a23BHvk1827gudAy8hLi9v
	 kHfUoc+SG2AhFO/F7Uw56eoBiOJdUN1hcup4MznDza4PlpUVbiOBXTVtoYwJ5hLF9/
	 iosyte1yu1/bA==
Authentication-Results: dserver.krueger-it.net;
	spf=pass (sender IP is 94.31.74.100) smtp.mailfrom=jan.brummer@tabos.org smtp.helo=c0d1ngstat1on.fritz.box
Received-SPF: pass (dserver.krueger-it.net: connection is authenticated)
From: Jan-Michael Brummer <jan.brummer@tabos.org>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	tian.shu.qiu@intel.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jan-Michael Brummer <jan.brummer@tabos.org>
Subject: [PATCH] media: dt-bindings: ak7375: Add AK7377
Date: Sat, 29 Aug 2026 07:25:12 +0200
Message-ID: <20260829052514.18178-2-jan.brummer@tabos.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260829052514.18178-1-jan.brummer@tabos.org>
References: <20260829052514.18178-1-jan.brummer@tabos.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The AK7377 is register compatible with the AK7375 and is driven by the
same driver.

Signed-off-by: Jan-Michael Brummer <jan.brummer@tabos.org>
---
 .../devicetree/bindings/media/i2c/asahi-kasei,ak7375.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/asahi-kasei,ak7375.yaml b/Documentation/devicetree/bindings/media/i2c/asahi-kasei,ak7375.yaml
index fe312cc..c040757 100644
--- a/Documentation/devicetree/bindings/media/i2c/asahi-kasei,ak7375.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/asahi-kasei,ak7375.yaml
@@ -18,6 +18,7 @@ properties:
     enum:
       - asahi-kasei,ak7345
       - asahi-kasei,ak7375
+      - asahi-kasei,ak7377
 
   reg:
     maxItems: 1
