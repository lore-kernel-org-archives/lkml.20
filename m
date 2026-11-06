Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793957456;
	b=DVeiDf8QJO11vKz/duTmi8zStB0cBIGexjv0YimCou6kZWag12HG+GJTjlCKgS6zotHa
	 X0dUXMW8N1f/qCQSVmLKFaTjeRFqXU//tIS6Nge9UOkbfbu9Eq3xW1+41amJ6XV8HXz3z
	 CPBa8IGXxSQx+mnV8i6ky8SvSydaPEbnnZLN73ZICzFbG+sG4NyN0awblH/ronGolRJle
	 rFJOrLWXmqnRLCgqDSflLXkuWEcANet0a243p/YjC6qpQEugNgV4+eoQRgcGBPFNaCmNv
	 zaR9Twt/DnmFXZC94ngTARRGjivXDFskT0TxRUCzc0fWuz7+Ne4QY5IqUue+NO/1ubg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793957456;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=SHm0AteFxuKOwxOjlVILodPtETBXP7hD3plfwEFTqSQ=;
	b=QnQMqCXsNSCJ2RPNymbd4iTu0om5mBGW9qxq6rwkK72AFv0DolAFzJn3shacjAy1xrTX
	 3brxVjdTQVWXfwQ7WpZ+TyQJDTlOiyF7BzfTE72h/XaLEsV4PgdniZhaBYboOICHavH21
	 pNvBW2D2bvTjF0ilHPahKFevrI2dUD39HMdGS/0zaH0J6QFr0itBv4hl+lOmq7j3U2jWR
	 Ajy6tUIMjwFWsHX8nrbniTTFzPiIig7ENh9vWREU+RphWDXvpKYLdDKO3ETwxc56xPmbd
	 HzGqx471koza5MHrwdo4CvQjPQpxyoduDj/h5rxsJ8WI/5WJIt4KFBTV7U9MMuMHb9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=S2GzPxSj;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF12606A329;
	Fri,  6 Nov 2026 09:30:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CF12606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=S2GzPxSj
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 582A41A0DA6;
	Fri,  6 Nov 2026 09:30:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1CC8B5FFBC;
	Fri,  6 Nov 2026 09:30:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D258E1032927D;
	Fri,  6 Nov 2026 10:30:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793957444; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=SHm0AteFxuKOwxOjlVILodPtETBXP7hD3plfwEFTqSQ=;
	b=S2GzPxSjpvUeXv9HhBo+yI8ELQmXQ1gLJRsLtHsc1gB4qMc2Cg/yer5MpNZINHYd6b9zmX
	nq7LBhAvb2FeUUyUMweM3e69TEuOPH+PSjpqKP8iIBmmnTWtgmZWBLTQKaegy8Dvv3N+rl
	I09tiujlzMrDJcp/I3frt3C8KJ7QmCnR1ULbnEnsF+SgF3g8BFvNWwSifnCe01AGTUaUky
	hMAbU4DWJDyh6+CW5OHyxCAFIocJqTi6rSrx9SnrlMScKXNji3+G8d3dnG6Ha78Gt4fZs6
	iDReX4aecjwx6eI576V4QcUYA9YgMNZ2qUDDnd4ILBtpiIRIgPODLAdE08gwUw==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Fri, 06 Nov 2026 10:29:58 +0100
Subject: [PATCH 01/25] dt-bindings: vendor-prefixes: add Metanoia
 Communications
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261106-mt2824-v1-1-86087eaf5af4@bootlin.com>
References: <20261106-mt2824-v1-0-86087eaf5af4@bootlin.com>
In-Reply-To: <20261106-mt2824-v1-0-86087eaf5af4@bootlin.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jun Chang <jun.chang@metanoia-comm.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Sebastian Reichel <sre@kernel.org>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Jonathan Cameron <jic23@kernel.org>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Ben Zong-You Xie <ben717@andestech.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
 Jisheng Zhang <jszhang@kernel.org>, CL Wang <cl634@andestech.com>, 
 Mark Brown <broonie@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Adrian Hunter <adrian.hunter@intel.com>, 
 Minas Harutyunyan <hminas@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Randolph_Sheng-Kai_Lin=28=E6=9E=97=E8=81=96=E5=87=B1=29?= <randolph@andestech.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org, 
 linux-phy@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 linux-mmc@vger.kernel.org, linux-spi@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

Add the vendor prefix for Metanoia Communications Inc., a fabless
semiconductor company specializing in wireline and 5G radio access
networking chips.

Link: https://metanoia-comm.com/about-us/company-overview/

Originally-by: Jun Chang <jun.chang@metanoia-comm.com>
Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 5471a06f93f1..085749fb8a72 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1087,6 +1087,8 @@ patternProperties:
     description: Cisco Meraki, LLC
   "^merrii,.*":
     description: Merrii Technology Co., Ltd.
+  "^metanoia,.*":
+    description: Metanoia Communications Inc.
   "^methode,.*":
     description: Methode Electronics, Inc.
   "^micrel,.*":

-- 
2.56.0

