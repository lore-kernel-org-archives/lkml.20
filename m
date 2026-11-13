Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.128.198.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794554005;
	b=lyTNPb9KqQLEhrz5ZIPYAhUa+bK/hg/EUGNRuecX9uPzf3Vc+X2LGdKk6hhQNRwLgSQj
	 ds5mnFMt1WZQJDXiYm7IqwhlfyWu4t9fnaG1UagVS4jRwyYOP3OSwnkIAM1G4tn7wrC0H
	 xtl652NYyERewodF8LMjw9OeC0JO42GfDi/i7SVf5sR6F40u3Z1kH94R3iDNVtO/yq+CC
	 pbVWnhcy49mNQ2pjEsj09I8XnxeQ3/a9Fa0MV1A5zW/uRj32hiEyGYAbV5v0cMB9Eq/2k
	 QF0hqPNOXxxrbuBhvwFEeFLV/ghxwXhxuEZAsbYc2gVlJFkpMJFKMWHchlXzqPsFI0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794554005;
	h=DMARC-Filter:Received:Received:Received:From:To:CC:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy:X-DKIM-Results:X-DNSRBL:X-SPAM-SOURCE-CHECK:X-MAIL;
	bh=h4onCBb7kCFTyzEP04tsB3PagOs4XqU+TJRRt5SKbno=;
	b=xqa6MJodFJhe/VtOPJBpB7dRVFrSz1V9oOsine3ChvzapWq4AFgMeb5lCTcIBid/QdI0
	 LdfSsVt2ClghsWGeL2BJDmqEqUKnO1dqbULoqLMByAxi/KGs5iB50IiWjftq7GDdTZKUu
	 UoKoftIXuNUQseMRDBe2vsqZvM3+eMU+QUoOZkP2BTXeDU+qguGcy9pRgKdLmyU8SOWlp
	 LXPbzWiVYC585UMLUxq7vOZspua5AjG1i0OxGz5903x5oXrAx5UoQ2VhWo8V5JqEBkTVT
	 nvgJDDVYJ4g2FMM3jkHpxyaxSZWDse4g7DN+I38gMKGTsAaucxX9kCU63xAIGbsmWwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=andestech.com;
	spf=pass smtp.mailfrom=andestech.com;
	arc=none smtp.remote-ip=220.128.198.184
Received: from Atcsqr.andestech.com (atcsqr.andestech.com [220.128.198.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96DE606A323;
	Fri, 13 Nov 2026 07:13:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E96DE606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from mail.andestech.com (atcpcs53.andestech.com [10.0.1.153])
	by Atcsqr.andestech.com with ESMTPS id 6AD7CSaM059146
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 13 Nov 2026 15:12:28 +0800 (+08)
	(envelope-from minachou@andestech.com)
Received: from ATCPCS34.andestech.com (10.0.1.134) by atcpcs53.andestech.com
 (10.0.1.153) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Fri, 13 Nov
 2026 15:12:28 +0800
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Nov
 2026 15:12:28 +0800
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
Subject: [PATCH v2 06/19] cache: ax45mp_cache: rename ax45mp_cache.c to andes_llcache.c
Date: Fri, 13 Nov 2026 15:11:30 +0800
Message-ID: <20261113071143.1446167-7-minachou@andestech.com>
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
X-DKIM-Results: atcpcs53.andestech.com; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:Atcsqr.andestech.com 6AD7CSaM059146

Rename to reflect the generic Andes naming. No functional change.

Signed-off-by: Mina Hui-Min Chou <minachou@andestech.com>
---
 drivers/cache/Makefile                            | 2 +-
 drivers/cache/{ax45mp_cache.c => andes_llcache.c} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename drivers/cache/{ax45mp_cache.c => andes_llcache.c} (100%)

diff --git a/drivers/cache/Makefile b/drivers/cache/Makefile
index 290aa238b2e2..7c342111ea51 100644
--- a/drivers/cache/Makefile
+++ b/drivers/cache/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 
-obj-$(CONFIG_ANDES_LLCACHE)		+= ax45mp_cache.o
+obj-$(CONFIG_ANDES_LLCACHE)		+= andes_llcache.o
 obj-$(CONFIG_SIFIVE_CCACHE)		+= sifive_ccache.o
 obj-$(CONFIG_STARFIVE_STARLINK_CACHE)	+= starfive_starlink_cache.o
 
diff --git a/drivers/cache/ax45mp_cache.c b/drivers/cache/andes_llcache.c
similarity index 100%
rename from drivers/cache/ax45mp_cache.c
rename to drivers/cache/andes_llcache.c
-- 
2.34.1

