Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.128.198.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794554053;
	b=UaYPZm3y7E9Ncv0mpT75xbwVg+F2r6g8mmHpHLHp45w+JCQx6gYCNKOCo7Ojy4agJcCb
	 nhG4woc089mye3PEnNVdRVPDDU3VcFWGEYgpZYPeFDIb74Elw7LLbkMeQ5IJ+8qd6InrR
	 VYqcS6iyhGkfv+4d8E5VVmDehzflF1jofq4NG7Eo/sF8CtsSBqGhBpgB//B/QpaviSUdF
	 x3QsU/qr5ICDcALataFekSMJnurzFxmVmkOXHAx2ZsiQa6V14TgkkcNfr/IqprwqkBRxi
	 fgk6XTElBv25jg++sPRIuyDgobCVnQjx396VIS5fPZu1Vd22XqHWxHAFfvtgfFoToHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794554053;
	h=DMARC-Filter:Received:Received:Received:From:To:CC:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy:X-DKIM-Results:X-DNSRBL:X-SPAM-SOURCE-CHECK:X-MAIL;
	bh=0WGiWn1clDeEyo1vjoAr8P3vco/knK3jqTXDMmRd69Q=;
	b=4O0Z+kletl1YDfZkfV1NjvGgpKe2TpPPdOxZDoc1M/fg9gE4XMhnyn88DGe5ULUVOhAf
	 PyyAHeH6+qdczBZoUGcGioGtfyhPJ59i0y64d+HgsCDwlBhQ1uT9/Ez/Le74OIqLO4OuZ
	 wE/6Wf9BgJuKcIc4dSrunHbAjzjAvfPS+p28DmR9JPy2Z6npdMSJQHfbNsIwz5qux0p5K
	 9t9GSHGuEnS/ky2WiUo/9yz0Q+FuDb5e2WOpynXUD/xa++OUg/kJMq9Sku8aQ9mkP4bAD
	 aQC4LGJqgJrlsrRYJ9jk7kGvISlJ6a4d7ki9xM3RY648k7G91celWVYPvU5zsdwPUsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=andestech.com;
	spf=pass smtp.mailfrom=andestech.com;
	arc=none smtp.remote-ip=220.128.198.184
Received: from Atcsqr.andestech.com (atcsqr.andestech.com [220.128.198.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C4560A2609;
	Fri, 13 Nov 2026 07:14:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01C4560A2609
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from mail.andestech.com (atcpcs55.andestech.com [10.0.1.155])
	by Atcsqr.andestech.com with ESMTPS id 6AD7CUZQ059152
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 13 Nov 2026 15:12:30 +0800 (+08)
	(envelope-from minachou@andestech.com)
Received: from ATCPCS34.andestech.com (10.0.1.134) by atcpcs55.andestech.com
 (10.0.1.155) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Fri, 13 Nov
 2026 15:12:30 +0800
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Nov
 2026 15:12:30 +0800
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
Subject: [PATCH v2 18/19] riscv: errata: andes: limit the IOCP workaround to RZ/Five
Date: Fri, 13 Nov 2026 15:11:42 +0800
Message-ID: <20261113071143.1446167-19-minachou@andestech.com>
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
X-MAIL:Atcsqr.andestech.com 6AD7CUZQ059152

The SBI-based IOCP check was added for Renesas RZ/Five (R9A07G043F),
the only upstream-supported SoC whose AX45MP has no IOCP. It matches
the AX45MP marchid and the mimpid of the RZ/Five core, but it is built
into every kernel with ERRATA_ANDES_CMO, so the SBI call is issued even
when the kernel does not support RZ/Five.

Move the match into soc_is_r9a07g043f() and make it also require
ARCH_R9A07G043. Kernels without RZ/Five support then skip the SBI call
and take the generic Andes cache errata path. No other upstream-
supported SoC uses this AX45MP mimpid, so their behavior does not
change.

While at it, rename ax45mp_iocp_sw_workaround() to
r9a07g043f_iocp_sw_workaround(), as the check is only used for RZ/Five.

Signed-off-by: Mina Hui-Min Chou <minachou@andestech.com>
---
 arch/riscv/errata/andes/errata.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/errata/andes/errata.c b/arch/riscv/errata/andes/errata.c
index 530d2df216e0..f2535a81b1e2 100644
--- a/arch/riscv/errata/andes/errata.c
+++ b/arch/riscv/errata/andes/errata.c
@@ -25,7 +25,7 @@
 
 #define ANDES_SBI_EXT_IOCP_SW_WORKAROUND	1
 
-static long ax45mp_iocp_sw_workaround(void)
+static long r9a07g043f_iocp_sw_workaround(void)
 {
 	struct sbiret ret;
 
@@ -39,6 +39,13 @@ static long ax45mp_iocp_sw_workaround(void)
 	return ret.error ? 0 : ret.value;
 }
 
+static bool soc_is_r9a07g043f(unsigned long arch_id, unsigned long impid)
+{
+	return IS_ENABLED(CONFIG_ARCH_R9A07G043) &&
+	       arch_id == ANDES_AX45MP_MARCHID &&
+	       impid == ANDES_AX45MP_MIMPID;
+}
+
 static void errata_probe_andes_cache(unsigned int stage, unsigned long arch_id, unsigned long impid)
 {
 	static bool done;
@@ -51,8 +58,8 @@ static void errata_probe_andes_cache(unsigned int stage, unsigned long arch_id,
 
 	done = true;
 
-	if (arch_id == ANDES_AX45MP_MARCHID && impid == ANDES_AX45MP_MIMPID) {
-		if (!ax45mp_iocp_sw_workaround())
+	if (soc_is_r9a07g043f(arch_id, impid)) {
+		if (!r9a07g043f_iocp_sw_workaround())
 			return;
 	} else if (riscv_isa_extension_available(NULL, ZICBOM)) {
 		return;
-- 
2.34.1

