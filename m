Received: from sender6-op-o15.zoho.com (sender6-op-o15.zoho.com [165.173.180.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 435414A1E01;
	Tue,  8 Sep 2026 16:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788885007; cv=pass; b=sLGJ0BJjFhFvOe+xCG4bb5ZdhXiQf6i11moHidJMBYoV8PkUT9Ood6x0AcF3g1VWavHHJnVzvpS0J8aJOMUgtM6JH3Di7Km8kppwUquTxtfW08Ev8cpWuH/QTtZoNIacN6QwQ2HLNVm4PccRaFlvYC4oRGtNMuJTs5Gmlo9+wjM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788885007; c=relaxed/simple;
	bh=NLcr87f2JQThparZC7f+83o97uk7/2T64hwhuqbiP2c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xv6nyFDTHO57WeanRDFNb9SHmZFf/bTbwuGkricGpK1uwNo+CKKL9vavtAsFAyABcw9Ssokhql7apDeBIU8n6xr+9DlNH+mWEicNb3ihvUHszU8Xxctji/eKPBcaTLG8Ci4vho33cZ2zbcb341tNzW4yCHthrLKpp6XUeWJQPDY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=T4QqIRZL; arc=pass smtp.client-ip=165.173.180.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="T4QqIRZL"
ARC-Seal: i=1; a=rsa-sha256; t=1788884983; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=A9ILT2xT2EgU35yTIjB9mboQAwF3ssLCR7HjRSdbyoRpYzJzZejXC4F2EIKmhm9344nXKJOmo8VSLQ5p2cOkKcvYjM0N8Hv6NjwSSldApCOI/gNJFOXqXH1fjON9cC5qWLTgN8KAoP/mFetKeFNOeZOhFHiYRyzlo/uOb3ck/2Y=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1788884983; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Wlcyi9R/T0YiHsT+iArPXhEOqRlQss3EnsJ+phzT+HQ=; 
	b=My6WwhTY8RYGkXbaGkfWcodZbldac1xOBak7M08DdAkppocr51CndZ2qVtpVQme1HsL7KUrNteEu8O4FJSxGrG/O7o8zOkUKnAn0vTZzWqX8cPV2mTp1hzvb0HTEslSvmem7xHHzse6MTmqkXegdDNux8NuCWXppZqncjkFoMtU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1788884983;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=Wlcyi9R/T0YiHsT+iArPXhEOqRlQss3EnsJ+phzT+HQ=;
	b=T4QqIRZL6MlX75+ZsvSv9VtorcaZXFWkangyGofVmbEWZ3vGH6TT/ovf2xP3T4O7
	IkO+gaQl4D+njiIaPT4BDIlTF/N/gFqDHlwMEQdcpGjmEi86G5uu81wP8l1ykLHxwGh
	1uHDH9wh6LDsmHNNjdI/el1STYXVJ5EBJauAygWM=
Received: by mx.zohomail.com with SMTPS id 1788884982005663.2234173377049;
	Tue, 8 Sep 2026 09:29:42 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Wed, 09 Sep 2026 00:28:46 +0800
Subject: [PATCH v2 3/6] dt-bindings: interrupt-controller:
 thead,c900-aclint-sswi: Add SpacemiT K3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-k3-aclint-v2-3-7931e5bc86ad@pigmoral.tech>
References: <20260909-k3-aclint-v2-0-7931e5bc86ad@pigmoral.tech>
In-Reply-To: <20260909-k3-aclint-v2-0-7931e5bc86ad@pigmoral.tech>
To: Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Inochi Amaoto <inochiama@outlook.com>, Radu Rendec <radu@rendec.net>, 
 Paul Walmsley <pjw@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
 Guodong Xu <docular.xu@gmail.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Junhui Liu <junhui.liu@pigmoral.tech>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1201;
 i=junhui.liu@pigmoral.tech; h=from:subject:message-id;
 bh=NLcr87f2JQThparZC7f+83o97uk7/2T64hwhuqbiP2c=;
 b=owGbwMvMwCWWvDb1VEXc8j+Mp9WSGLIWmJ/c9uzcDXHvA81rl09VeKvUvSzxfql1QsD+f2aJO
 4TjVrrEdpSyMIhxMciKKbJw+Yv/s9bh+XZEoPU+zBxWJpAhDFycAjARURGG//n375S+PZ37bG/C
 9PCnHaZPzvkGJlk3/9y/yeJtw/LL+74y/A/ofC5VZ58So2FzZPHNc+dUSliOvjv30OT9mlfyx+M
 W7mMHAA==
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=openpgp;
 fpr=15B30CC69C4BF0CC3C08F85A2A90CDC122DF37BF
X-ZohoMailClient: External

Add support for the SpacemiT K3 ACLINT SSWI, which provides
inter-processor interrupts in Supervisor mode without calling into
Machine-mode firmware.

Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 .../bindings/interrupt-controller/thead,c900-aclint-sswi.yaml        | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-sswi.yaml b/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-sswi.yaml
index d02c6886283a..0b34ed5b4639 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-sswi.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-sswi.yaml
@@ -24,12 +24,13 @@ description:
 properties:
   compatible:
     oneOf:
+      - enum:
+          - mips,p8700-aclint-sswi
+          - spacemit,k3-aclint-sswi
       - items:
           - enum:
               - sophgo,sg2044-aclint-sswi
           - const: thead,c900-aclint-sswi
-      - items:
-          - const: mips,p8700-aclint-sswi
       - items:
           - enum:
               - anlogic,dr1v90-aclint-sswi

-- 
2.55.0

