Received: from pdx-out-006.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-006.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.26.1.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD8841F37F;
	Thu, 24 Sep 2026 06:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.26.1.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790231006; cv=none; b=A9R7Wcwo0hGAtS/CS/HNFE9AFvQoOQ8Cwr1mg3IPVppnRXAyvk5tf+uji9nHFeg4GTNI7UyPSKNhwJN1kPqcGuZ9r6w8RqNOo/xib/oOlhdpr08Uu8WUu9G0AtMmkg4YbUkkg4/zptWtftLRJSUBQ2mK2tEYcIjLEL0omn5n9Ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790231006; c=relaxed/simple;
	bh=Vbd2HkyO8tOZPWdFtbCdK7O3MqaAXyXCtFqkYB9CDSM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kvQSKnO7u2C+mj0bf9ZAI3xq4ihQ5VcrIDqqzJrF2Ygu8YrAx6SVPeDq20ehbk8shH2v4SUyklRqgg3ucReMpIogp7OtHdLTlXGv5Y/XvkbVia+QaYpEYr1iEXtSRA0F18S+ZwUKy/qsFHhUfpwcVqk5Zu8ipEE3Rf3qlQ2jDqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=r26sdJsO; arc=none smtp.client-ip=52.26.1.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="r26sdJsO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1790231004; x=1821767004;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DPBxGyTRZOk82ZYflurssEH5pk5DgVV6nmcNNgd5oQI=;
  b=r26sdJsO6zy2R4hfLqo+rcqwmW+nw3ORPjC5JRNmEzYvWS2y94+PFvhi
   YUDVxBeG6gG1+6398q9V9TFXCZFX5CbI7HkFprJIz+cWc2ksS6blkaUZR
   v9gxqoRpdGyeewxrhHpJD5PfZWmgayt2XfOnNiM+33uCvjtkrNsBaLFDQ
   XYhH1wmOsVnfj89ep2rP2xVL/h+sYBrKMDdn4iqwwjvkuHaDfHmBHEUmJ
   LDH/Yq0PqOkGH+3xToYb77b5OVt4hxhxbo3X+Ai+XaWExneEIzRuGUmm8
   eOau4PdmXSPngxi0zjskRppewl047l+A4MmH8R8XpCkmrutxqFw7xJbrE
   g==;
X-CSE-ConnectionGUID: QDX6ZsCmSeSKW9XotzmH1Q==
X-CSE-MsgGUID: msdFnLTgRye/7NwOX6o4MQ==
X-IronPort-AV: E=Sophos;i="6.27,120,1787011200"; 
   d="scan'208";a="29545326"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-006.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 06:23:22 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.48:12482]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.16.27:2525] with esmtp (Farcaster)
 id 6f2dda81-29a5-441b-be7d-f3dda2cdf46a; Thu, 24 Sep 2026 06:23:22 +0000 (UTC)
X-Farcaster-Flow-ID: 6f2dda81-29a5-441b-be7d-f3dda2cdf46a
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Thu, 24 Sep 2026 06:23:21 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49; Thu, 24 Sep 2026
 06:23:20 +0000
From: Eliav Farber <farbere@amazon.com>
To: Thomas Gleixner <tglx@kernel.org>, Talel Shenhar <talel@amazon.com>
CC: Radu Rendec <radu@rendec.net>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Eliav
 Farber" <farbere@amazon.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 3/6] dt-bindings: interrupt-controller: amazon,al-fic: add error/fatal groups
Date: Thu, 24 Sep 2026 06:23:08 +0000
Message-ID: <20260924062311.37308-4-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260924062311.37308-1-farbere@amazon.com>
References: <20260924062311.37308-1-farbere@amazon.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D040UWB002.ant.amazon.com (10.13.138.89) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

FIC v2 and later expose two additional interrupt groups alongside the
legacy group - an error group and a fatal group - each described by its
own node and matched by a distinct compatible string. Turn the single
compatible into an enum covering all three:

  amazon,al-fic         - legacy group
  amazon,al-fic-error   - error group
  amazon,al-fic-fatal   - fatal group

Signed-off-by: Eliav Farber <farbere@amazon.com>
---
 .../bindings/interrupt-controller/amazon,al-fic.yaml         | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/amazon,al-fic.yaml b/Documentation/devicetree/bindings/interrupt-controller/amazon,al-fic.yaml
index 26bc05dee0bc..f43039901bd3 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/amazon,al-fic.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/amazon,al-fic.yaml
@@ -11,7 +11,10 @@ maintainers:
 
 properties:
   compatible:
-    const: amazon,al-fic
+    enum:
+      - amazon,al-fic
+      - amazon,al-fic-error
+      - amazon,al-fic-fatal
 
   reg:
     maxItems: 1
-- 
2.47.3

