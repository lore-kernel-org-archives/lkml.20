Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.128.198.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794554050;
	b=k8jv5szc3U/Mk5fBOjTkYj/EGf2qHTJSZ2kBCgqKxJINuxo2nidC+5aiBrpc0SjIC8GR
	 xILQJzWvlVEGYuGjPIa6K01acw3404aug5YcuQ02t1GYqSB+SN4JnQR0Ai8v5ng7h0hyN
	 ftl3HBAAEG/jLBS897hg4wpdH6l4LILe/MTcTPZRePz82hjXI+G6PAwsQ/KM5bvVekT9X
	 FmR1pmjiWMdCsRE+FuOTj77NrMXw5u5N46dry1FXR9Qg8OI/F3zOOLWVktabrOuI9NuyN
	 D1CPyNC9umruW8uREIb1SK2VwSjG5KUCGX0dlFLeZ0gylR9e30uXPAE9aA9P3vJWDjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794554050;
	h=DMARC-Filter:Received:Received:Received:From:To:CC:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy:X-DKIM-Results:X-DNSRBL:X-SPAM-SOURCE-CHECK:X-MAIL;
	bh=Rd674VG7vU4AymhieKIv4CiDG6Cia8Dd41xAqDE8Nyc=;
	b=erqGSCCmyhn3Q2QA89IcexkHbDpBiQZkgluX86wECD7no7L3htjRcdVXqJbozBsB+uic
	 db7N1RY6KtPRxFPnNM4GjPv32rHeDRSDUpwCMJRut8+qECUKj8ZJIsIp972w/JLRbT0fH
	 eSsJEGHephSTSFzgeob61WsLFHZuHFIRsWJ5oW0NdjeZXojXo0VRDHZFw7kPMCquDfluX
	 WJf7BLVLdZnEtzGikcC/uCXmW2GvuwxpwZAu3fB8TesA3xzccugFjgoulikqdG4EpeEwD
	 OAhtEz9BbVIHkrXHbofhSBNzEx2U1psmneQZfveBNwmgKYKQNstpMUfkcSTJGsrSDug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=andestech.com;
	spf=pass smtp.mailfrom=andestech.com;
	arc=none smtp.remote-ip=220.128.198.184
Received: from Atcsqr.andestech.com (atcsqr.andestech.com [220.128.198.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E28DC606EE2D;
	Fri, 13 Nov 2026 07:14:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E28DC606EE2D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from mail.andestech.com (atcpcs53.andestech.com [10.0.1.153])
	by Atcsqr.andestech.com with ESMTPS id 6AD7CU7G059150
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 13 Nov 2026 15:12:30 +0800 (+08)
	(envelope-from minachou@andestech.com)
Received: from ATCPCS34.andestech.com (10.0.1.134) by atcpcs53.andestech.com
 (10.0.1.153) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Fri, 13 Nov
 2026 15:12:30 +0800
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
Subject: [PATCH v2 16/19] riscv: errata: andes: allow ERRATA_ANDES_CMO on all Andes SoCs
Date: Fri, 13 Nov 2026 15:11:40 +0800
Message-ID: <20261113071143.1446167-17-minachou@andestech.com>
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
X-MAIL:Atcsqr.andestech.com 6AD7CU7G059150

ERRATA_ANDES_CMO depends on ARCH_R9A07G043, so it can only be enabled
for the Renesas RZ/Five, although other Andes SoCs such as those built
on the A27L2 need it too. Drop the dependency, and select
ANDES_LLCACHE and CACHEMAINT_FOR_DMA so that the errata always comes
with its cache driver, which ARCH_R9A07G043 used to guarantee.

As ERRATA_ANDES_CMO is default y, it is now also enabled in the generic
riscv defconfig. The errata only acts on Andes cores at boot, so other
platforms are not affected.

RZ/Five still gets uncached memory for coherent DMA allocations from the
DMA_GLOBAL_POOL that ARCH_R9A07G043 selects. This patch only covers
cache maintenance for streaming DMA; how other platforms provide uncached
memory stays platform specific.

Signed-off-by: Mina Hui-Min Chou <minachou@andestech.com>
---
 arch/riscv/Kconfig.errata | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig.errata b/arch/riscv/Kconfig.errata
index 4f77b3c6d7fd..3c43e065aa01 100644
--- a/arch/riscv/Kconfig.errata
+++ b/arch/riscv/Kconfig.errata
@@ -12,7 +12,9 @@ config ERRATA_ANDES
 
 config ERRATA_ANDES_CMO
 	bool "Apply Andes cache management errata"
-	depends on ERRATA_ANDES && ARCH_R9A07G043
+	depends on ERRATA_ANDES
+	select ANDES_LLCACHE
+	select CACHEMAINT_FOR_DMA
 	select RISCV_DMA_NONCOHERENT
 	default y
 	help
-- 
2.34.1

