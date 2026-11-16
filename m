Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.128.198.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794789644;
	b=1/szYW/SlYi6VKxEiyIUIxJoyMwI+FAD7FplDUVPlyL5ygMtdRo8ImJOAia2elNujaBA
	 Z508JcE8txwYz6si8jDSAHb6+LJmqgqgpoHiU8KS74wiFz2lK/n2iNf2CLWvCM8o7Yq0B
	 Ivolv1nRDaCyI0VXa9+5DmY4ielgPxFmQh5Z3NGiRnEjJDMDW+mnWsfqZAPhBp0P6JtbU
	 yNhIewZFju8I9qkjrKV88OIV+S8oyqJDUhAPGvUT76JiH+Q/jtP5hksu3dmNmb2Kurn60
	 hrQ4UX2EXdwT1DOXyGXSOt3umWMrVmYuM7UKyTkVCJ5KLiRaW7Tx4UCF0HHCK8Ay8+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794789644;
	h=DMARC-Filter:Received:Received:Received:From:To:CC:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-Originating-IP:X-ClientProxiedBy:X-DKIM-Results:
	 X-DNSRBL:X-SPAM-SOURCE-CHECK:X-MAIL;
	bh=whNMgs1wCgGpnJ/g10qabo68iz/frxBjrO4c1CzVz2w=;
	b=YbjnONuV3mWdtGH8xP5pQufazR2mhG2bWaGdZFOsJ5k6do6YhuXHNV4HbxwxCNMnB+x/
	 ASgLbDXRjsvxVCyiphmjMl9ouhRnrIiDLlNjoVMGl/audqJIaMrZ+kroY01AQy613epFE
	 73nV911qlKWGJ8E6qtZxiXMhYPcK07Q0hObEnYr9ehLmjldXehy9jx/uSdEljmX8vSrL1
	 /4Vyub2hx1sX32IcuGA8u7c+Rlj3Gl9j2p0yLBxx/JLjdKSBY12/K5a36BBudsEtNV0if
	 zzv3yZR5Ki3AEPQ6TehZrUizJKNXuh9yr+rM7wgHlFGX+sJ3aO9WEbMSxM1e/2Zshuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=andestech.com;
	spf=pass smtp.mailfrom=andestech.com;
	arc=none smtp.remote-ip=220.128.198.184
Received: from Atcsqr.andestech.com (atcsqr.andestech.com [220.128.198.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 531C0606A31F;
	Mon, 16 Nov 2026 00:40:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 531C0606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from mail.andestech.com (atcpcs55.andestech.com [10.0.1.155])
	by Atcsqr.andestech.com with ESMTPS id 6AG0dje8074721
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 16 Nov 2026 08:39:45 +0800 (+08)
	(envelope-from minachou@andestech.com)
Received: from ATCPCS34.andestech.com (10.0.1.134) by atcpcs55.andestech.com
 (10.0.1.155) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Mon, 16 Nov
 2026 08:39:45 +0800
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Nov
 2026 08:39:44 +0800
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
Subject: [PATCH v2 19/19] dt-bindings: riscv: add Andes A27L2 CPU compatible
Date: Mon, 16 Nov 2026 08:39:37 +0800
Message-ID: <20261116003937.1776888-1-minachou@andestech.com>
X-Mailer: git-send-email 2.34.1
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
X-MAIL:Atcsqr.andestech.com 6AG0dje8074721

Add the compatible string for the Andes A27L2 CPU core, which is used
in the Allwinner V821 sun300i SoC. The V821 devicetree will be submitted
separately by Allwinner.

Signed-off-by: Mina Hui-Min Chou <minachou@andestech.com>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index 0da219ae6769..fbe8f0625e76 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -46,6 +46,7 @@ properties:
           - enum:
               - amd,mbv32
               - amd,mbv64
+              - andestech,a27l2
               - andestech,ax45mp
               - canaan,k210
               - nuclei,ux900
-- 
2.34.1

