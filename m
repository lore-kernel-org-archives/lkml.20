Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.128.198.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794554019;
	b=Py7DDAccWv9065XwNI7uPalfLuJq3i8/OHoYa9bGAqlRDhkKS9KkIaCTpuThS3hb2viJ
	 i/rkyAL8eMr/zpxjV7NvGR4h67PvaKqae35fttGwbIiCbMLKbyjhPiQ2zlywhFvEs4Rqd
	 EKrPKlyqTkxOkQFqXITbbxXw/bvlJvtR9hNBTopdgKZ3T+yXhgQP0PXvzn7UjNeIzelDP
	 ACfIoK4HfYpvGrLWJGTSeVyOh2mZBNWd427aMKv939PQ4PoBcuGaPf8dX6j4jjlgKs4DI
	 vlUReqFmM9VSjB+cEUREgmZtT7iTgyjvFL1gNQo+FKVOcqRmWuNa/P4O/QBzDeFH6mA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794554019;
	h=DMARC-Filter:Received:Received:Received:From:To:CC:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy:X-DKIM-Results:X-DNSRBL:X-SPAM-SOURCE-CHECK:X-MAIL;
	bh=d0FGnKP5MU00KgvFxCQ6ldQgSTkozZU+51d+ZgossLs=;
	b=j6B/cFPNlqijxUJ92oSPucw8Gfwih4GWgAFNk7H9/9lNDK8fZ2w5zr29vFvi5JF6uwzF
	 qLgN9WMg7A9waiEfHpUusQs9d1P4OIyQKjmktm34cYDr7y1FNFExPgnnq+4X77+i7UVWn
	 L/ueHECGIq8wWdDT5zMo1IM5Oxv4HVhvyYtoBvbSdmsUEAWZGIfblrWg8Fcxndb8BtQtm
	 gtTfSiCdLALju+us45Vszm7UNiEWhOeAdkENXu7+2MfUT7EKx9VOtcMhqJmh0s9dyk/Gh
	 bTgOl+FwPneWc1vLSfYFXMUYGUSWLK5sMy/JGPEtlKguw2qPySA2N57s6PgFEiMaVgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=andestech.com;
	spf=pass smtp.mailfrom=andestech.com;
	arc=none smtp.remote-ip=220.128.198.184
Received: from Atcsqr.andestech.com (atcsqr.andestech.com [220.128.198.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED23606A887;
	Fri, 13 Nov 2026 07:13:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7ED23606A887
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from mail.andestech.com (atcpcs55.andestech.com [10.0.1.155])
	by Atcsqr.andestech.com with ESMTPS id 6AD7CR5P059129
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 13 Nov 2026 15:12:29 +0800 (+08)
	(envelope-from minachou@andestech.com)
Received: from ATCPCS34.andestech.com (10.0.1.134) by atcpcs55.andestech.com
 (10.0.1.155) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Fri, 13 Nov
 2026 15:12:29 +0800
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Nov
 2026 15:12:29 +0800
From: Mina Hui-Min Chou <minachou@andestech.com>
To: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <alex@ghiti.fr>, <conor@kernel.org>, <jic23@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <geert+renesas@glider.be>, <magnus.damm@gmail.com>,
        <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <randolph@andestech.com>, <cyyang772@andestech.com>,
        <tim609@andestech.com>, <minachou@andestech.com>, <az70021@gmail.com>
Subject: [PATCH v2 13/19] dt-bindings: cache: rename andestech,ax45mp-cache to andestech,llcache
Date: Fri, 13 Nov 2026 15:11:37 +0800
Message-ID: <20261113071143.1446167-14-minachou@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261113071143.1446167-1-minachou@andestech.com>
References: <20261113071143.1446167-1-minachou@andestech.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs55.andestech.com; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:Atcsqr.andestech.com 6AD7CR5P059129

The binding now covers Andes last level caches beyond AX45MP and uses
andestech,llcache as the generic compatible. Rename the file to match
it.

Signed-off-by: Mina Hui-Min Chou <minachou@andestech.com>
---
 .../{andestech,ax45mp-cache.yaml => andestech,llcache.yaml}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename Documentation/devicetree/bindings/cache/{andestech,ax45mp-cache.yaml => andestech,llcache.yaml} (97%)

diff --git a/Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.yaml b/Documentation/devicetree/bindings/cache/andestech,llcache.yaml
similarity index 97%
rename from Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.yaml
rename to Documentation/devicetree/bindings/cache/andestech,llcache.yaml
index da9688cc95f7..f97038d39b0e 100644
--- a/Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.yaml
+++ b/Documentation/devicetree/bindings/cache/andestech,llcache.yaml
@@ -2,7 +2,7 @@
 # Copyright (C) 2023 Renesas Electronics Corp.
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/cache/andestech,ax45mp-cache.yaml#
+$id: http://devicetree.org/schemas/cache/andestech,llcache.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Andestech Last Level Cache Controller
-- 
2.34.1

