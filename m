Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793042289;
	b=LaQKk1JlhTzZmGFEHj/z8+PMFS2eeQFQh8b54HD2ciz3BSVPJ8mQgAkahKp3MSu5opAG
	 fJdcp95ntwg/9IjME7Yrl2J7Z3UK2/ABlG3YH5yFMxcyDzlhc+5udXUK0w4QCe3sNvBPw
	 3nJiqBitMSXMPJx11FzSsuxCbK3SVn6qUkQ2VjxsNCQPaLIPMR+YCWY7+NIc8QcJP3oag
	 VfsaFOCP12Ugxp/LJSGI4HpAVAEab93h3+CCG5aBI1Vkoblpw1wTGxXfSxoBNz5y0+7BB
	 o3Rko0Jg0BbElnOXGyOt2sI/vNeQgbgDAZRmcmDNNPJks3zFP1jvUbg6tAN8wzVvn5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793042289;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=MA5/QmONgwci+C4pVkhkGywYbmpIkNjdx6wsVgaOess=;
	b=u5c9XiwJIWRzNYW5iHde8F93rtbyrP2qU1TgrVaiJgmf2nW0WxqGUwOyZq4aKQ9NL6fy
	 2xAC8nyQEoo8uekEUpmK9o4/Z04P8fPq0PZEhcz1pIvI1aHlAxmsSalaSDwm1NDCgNOAU
	 IEWaBHF6jtnEa2+U5+BPqRDzbbX9OcJvB263y5+I8Nd7TUiAGc8C8aWoRQmYzFsL3JwmG
	 AuTc936k7HJUZ9yg9e445n6oaNG6Qtuea62gN325uEoo4LbCErE87YyEnXvu46ufL45F9
	 BctiJyWei62mfqkq1cDdtHb4xwbzHLm+FzmmzEjiViIK7PT15t7qOMuNHoxqhpAIDQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Gxvak8Yy;
	arc=none smtp.remote-ip=209.85.216.98
Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34270606A329
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 19:18:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34270606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Gxvak8Yy
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3ac78f4c10bso1606588a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:18:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793042288; x=1793647088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MA5/QmONgwci+C4pVkhkGywYbmpIkNjdx6wsVgaOess=;
        b=PYUdJB6Wfg5vDDsI3QhegrozcF8aJpPiRjS+8x5ZZMSRylN6I6VTJ5TbRZCSUWM5CY
         2uy0TvJXmCI3g6rYzIxWHeQT4UVetBX4TYLn0vs812eG0UmmFt/z7NOUcJH7guaOxwnZ
         IUrWZ8qTFNosx36p6tdKQ12omJ5rIca86d9V1YithhPFdpapjcLVO6g3+TKl/i85DRIZ
         NdfyFFwLtZ3lYsLsHDIFnYBVgkz2uVfC8tScgs+CBYsxZdMz73Ar0ppzGu1lE1PO67hp
         o0QBa5FcNJPHgVHVvPpzgHpE8InQSVya61U2RVjm20TeU2UsS9OdXp1jcqUMncYcDT5y
         8z4Q==
X-Gm-Message-State: AFq9FYJdHH2G2njLWufFZQY0zJubnFgfdT3mU4vKwhSKtFQLKd4dJpEz
	oJUCoxoBKmTTkpr3jYt1nC/GhiQKZHpt7AT7p1fKs7JFn9lb6CboKtKMpvtFDHozc1nlEunrDmr
	IS8etiQT9u8aTrJ6aTJNQncy90PdOnhwhA4+P268+x+liJH4CoiY9QHn42PGMDJyN23nn7mEVqN
	G2u00aMkJPF1o/wnGwB8B70REMgkH0ct/pvAg6tuezPV1UAeb6xqUmQJ+Wdt0f5h1h09+Z+As6q
	xQ5yif1gp4DqVgWL25B8KKS
X-Gm-Gg: AYBFou17KUbndY1AdETDgeJfCTfEwym1JyCmafx+MzZi44ya3VNAPkxSAArw97AxOlB
	7N3uYyO2otGpfJcoeRJo/mjy26kDmcIXN1SO1Aa6DBsf9YMkDiFzMwM+rUhhnJ/k0nVrj/NPB5O
	L/PIJbWbT1b/xlCRB9JUYX6gMCh7FsF4sfEWiFopE1rteooDvxi7MlxxJbytTTv9xOPSP5in2rS
	Cxfk8E+zr0Fkw4Z6sJCJkFN6OPDmq+qdP5X1VlTBPTGTvyqDPIm3FpFs+mtuTYRXjL+lPmr8QMF
	qTWWpPPJFHaMPacqcx71Gqpdov1Ytj3hG+QMrTnSr0rSleuB7nUfPUCNk6HcqDb4M81olSuKesA
	5NIPh01kBqB/NjyZlpuNcyrQn2wXka0khcKyXNDelKxNSeVqr2LPGNYHpWO9mJsQW9iM2nEi2Zb
	a15F6ICKCP8nnpZdO5yoSqLdIGoMQt9A4hXRjnhZ6d1/I=
X-Received: by 2002:a17:90b:4cd1:b0:3a8:1943:cb7a with SMTP id 98e67ed59e1d1-3adead44808mr5929221a91.18.1793042288537;
        Mon, 26 Oct 2026 12:18:08 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae40784dfasm317733a91.3.2026.10.26.12.18.08
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Oct 2026 12:18:08 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91b4bf686ceso65367416d6.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793042287; x=1793647087; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MA5/QmONgwci+C4pVkhkGywYbmpIkNjdx6wsVgaOess=;
        b=Gxvak8Yyx5pIICvm7yrCD9e43FZdm2i6wKYuAyzHsTZaz/opfCV15pPrDJqqvzIxb3
         EGLVGpYTnSBrlufLuRjbNW8fmqp9BQHcdjv3C/QvZC68ggXNAA4R+XZk+SMK1JsppO3r
         miqZV+cXpcnFBukKpJEb3JcMicF2khkPWBKYg=
X-Received: by 2002:ad4:5f48:0:b0:91c:6983:8012 with SMTP id 6a1803df08f44-91c69839846mr35565026d6.4.1793042287197;
        Mon, 26 Oct 2026 12:18:07 -0700 (PDT)
X-Received: by 2002:ad4:5f48:0:b0:91c:6983:8012 with SMTP id 6a1803df08f44-91c69839846mr35564286d6.4.1793042286610;
        Mon, 26 Oct 2026 12:18:06 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c62063dacsm33430996d6.37.2026.10.26.12.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 12:18:05 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>,
	linux-ide@vger.kernel.org (open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM IPROC ARM ARCHITECTURE),
	linux-phy@lists.infradead.org (open list:GENERIC PHY FRAMEWORK)
Subject: [PATCH v3 2/6] dt-bindings: ata: sata-brcm: Describe the NSP IDM registers
Date: Mon, 26 Oct 2026 12:16:14 -0700
Message-ID: <20261026191618.3178830-3-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261026191618.3178830-1-florian.fainelli@broadcom.com>
References: <20261026191618.3178830-1-florian.fainelli@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Northstar Plus uses the SATA IDM block to enable the interface clock and
deassert the core reset before accessing the controller registers.

Allow an optional third register region named "idm" for the NSP
controller. Keep other compatibles limited to their existing two
register regions and allow older NSP descriptions without the IDM.

Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 .../bindings/ata/brcm,sata-brcm.yaml          | 20 ++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/ata/brcm,sata-brcm.yaml b/Documentation/devicetree/bindings/ata/brcm,sata-brcm.yaml
index fe7f091e744f..98529784b1fa 100644
--- a/Documentation/devicetree/bindings/ata/brcm,sata-brcm.yaml
+++ b/Documentation/devicetree/bindings/ata/brcm,sata-brcm.yaml
@@ -15,6 +15,21 @@ maintainers:
 
 allOf:
   - $ref: ahci-common.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: brcm,bcm-nsp-ahci
+    then:
+      properties:
+        reg:
+          description: AHCI, top control and optional IDM register regions
+    else:
+      properties:
+        reg:
+          maxItems: 2
+        reg-names:
+          maxItems: 2
 
 properties:
   compatible:
@@ -30,12 +45,15 @@ properties:
           - const: brcm,bcm-nsp-ahci
 
   reg:
-    maxItems: 2
+    minItems: 2
+    maxItems: 3
 
   reg-names:
+    minItems: 2
     items:
       - const: ahci
       - const: top-ctrl
+      - const: idm
 
   interrupts:
     maxItems: 1
-- 
2.53.0

