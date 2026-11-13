Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.128.198.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794554012;
	b=FNdNZSGFd4QCG4neMXUCsVMFJZxwa1XyCmgX+Cm3unpkHT+EwuOuXfcSR+xeGS/Sk9Oh
	 CqWPS77ih11mqM/Tk44lBdnQoHOKxu++ESt9nY8CJIzIonBn7o8Gz4jq+PS/UerwAkCuD
	 eoNfMypyjIQHghj7D0JMO2BdHKRWRXdXcilCvW7ZWr862gZ/gkekeVh/DFDsPXvV8IxKp
	 A4h+R35ozMDn0M8QY1zIXrqEVs0/WjROKVp1EfOomDEu6YW8WJLMhvC47Y2tFDbicho10
	 7L8va5mQOtBCuehhWjpuo/gai6Z8m0HdMMIhuo4feZ11m9RQsKt9nDmU0wl3q8MX3dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794554012;
	h=DMARC-Filter:Received:Received:Received:From:To:CC:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy:X-DKIM-Results:X-DNSRBL:X-SPAM-SOURCE-CHECK:X-MAIL;
	bh=z6gjw1oSZ6klxEuE0p7NNzRy6LyzpuNwDFB9p0DiYE8=;
	b=3HAY8C7Z1cx1vFNOg24G2KjuVtnB0z61CPtLv7joqoSbR6SlIZCDK27ckgvX7g0PcKYI
	 tI87HthqSZIJ3xlFLoNvO+9qCB+GYjBX3ICX8vWlBHKqP8A30cqv+XUrXYRVtwUyjcnPU
	 fg0GFy6hTkTiHUycd5xR4YHwryz3UtftBlikk1DG7IQCgb3fSQSv8WiYqdVon/xheFl4P
	 4zYfJDq8t0tHHZyjxLGJep3KZpbRLfOThsb0Zufon59G6Y8lns6rOcs2P2Y7Ez0PL3e0A
	 MLIsg/xmZoKw1F8yGcIJEb7jtKLi+glYiDEZar5X/V6UJCarzAd0XxRXR6XA6o1elng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=andestech.com;
	spf=pass smtp.mailfrom=andestech.com;
	arc=none smtp.remote-ip=220.128.198.184
Received: from Atcsqr.andestech.com (atcsqr.andestech.com [220.128.198.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678B5606A333;
	Fri, 13 Nov 2026 07:13:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 678B5606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from mail.andestech.com (atcpcs55.andestech.com [10.0.1.155])
	by Atcsqr.andestech.com with ESMTPS id 6AD7CR5M059129
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 13 Nov 2026 15:12:29 +0800 (+08)
	(envelope-from minachou@andestech.com)
Received: from ATCPCS34.andestech.com (10.0.1.134) by atcpcs55.andestech.com
 (10.0.1.155) with Microsoft SMTP Server (version=TLS1_2,
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
Subject: [PATCH v2 08/19] cache: andes_llcache: use u32 and fix the cache-line-size error message
Date: Fri, 13 Nov 2026 15:11:32 +0800
Message-ID: <20261113071143.1446167-9-minachou@andestech.com>
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
X-MAIL:Atcsqr.andestech.com 6AD7CR5M059129

andes_cpu_llc_get_cctl_status() returns uint32_t, while the rest of the
driver uses u32. Use u32 there as well.

When the cache-line-size property cannot be read, the error message
says the driver defaults to 64 bytes, but the driver returns the error
and does not register its cache ops. Drop the misleading part of the
message.

No functional change intended.

Signed-off-by: Mina Hui-Min Chou <minachou@andestech.com>
---
 drivers/cache/andes_llcache.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/cache/andes_llcache.c b/drivers/cache/andes_llcache.c
index 3c271e1e49bf..0aea1389f291 100644
--- a/drivers/cache/andes_llcache.c
+++ b/drivers/cache/andes_llcache.c
@@ -54,7 +54,7 @@ struct andes_priv {
 static struct andes_priv andes_priv;
 
 /* LLC operations */
-static inline uint32_t andes_cpu_llc_get_cctl_status(void)
+static inline u32 andes_cpu_llc_get_cctl_status(void)
 {
 	return readl(andes_priv.llc_base + ANDES_LLC_REG_CCTL_STATUS_OFFSET_C0);
 }
@@ -145,7 +145,7 @@ static int andes_get_llc_line_size(struct device_node *np)
 
 	ret = of_property_read_u32(np, "cache-line-size", &andes_priv.andes_cache_line_size);
 	if (ret) {
-		pr_err("Failed to get cache-line-size, defaulting to 64 bytes\n");
+		pr_err("Failed to get cache-line-size\n");
 		return ret;
 	}
 
-- 
2.34.1

