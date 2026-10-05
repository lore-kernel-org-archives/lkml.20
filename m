Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59C44CE672;
	Mon,  5 Oct 2026 15:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791215072; cv=none; b=s7d55Sa/iK29v3VPxBtPsrJj3jm4qg/VpvmlOXSxu/fj3Ioli+IinxJOcl+Mbn7C+AS1AFu5By7ey/pBLACgn1eIPiCoOvUqikcNXwZbWOPcatHAnXLfnfQYiMwEGPf7n5qVdb/OvYGoFreeN0u5eDi99RyegA6/oUJ6rSEkwuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791215072; c=relaxed/simple;
	bh=kRpMkyAYTEXeFEHV3MU1+hE5BPdtmdFeex/mQA1VVn8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kVLT32iE0iTmJPATzhebwJjE6xkz1Jq4YtP981YJ5R3dRYZi8DZhXPAuKxGM2Z2JMgjzdZsYop+jyBzjAqqJwkUzD66VqfZkBvuefj/NPfdqz+mo/2wB8q17e4AdQ4oJALYWwqMWlTsRiB6PPxflt1+8jVlpxg9OjI54/DlD9Ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EVnpLqp0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EVnpLqp0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 034EC1F000FF;
	Mon,  5 Oct 2026 15:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791215070;
	bh=mTORbDJVqeinsGFiaCY9ee6z/kWfWSZ1rLTYTDZgJ4c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=EVnpLqp0hL1aPHEY897uAAAvgoI1yNkL+yz7TobSQeCaML2OAazz61c2YB7IaNlab
	 PyX5HfnAWvGXEUjqMHZUg/T8hBZntbHjh1xaQutMd1kAKalOZev7K38ayvlXaSh4Io
	 8rk8HatncEngdAHoHdFTjrvBtk8ByRXsYFYyOHmVbFlhuGe6aRaQ05EQw9Su27auKn
	 lT24bD1jmVbbUTNY0UbByg4NBLhCNyryn344HUlAiwxGheukSbnNFHcEVpugnpq1vN
	 SbmjxONDXYQuFOyDTpqr0sPusUjo5Qo0OpykUDLgqqGLlRVMIgRVr3g7OZLs35jOYj
	 gWUEXMAqz/NRg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] dt-bindings: i3c: Add Synaptics sl2610 i3c
Date: Mon,  5 Oct 2026 23:24:25 +0800
Message-ID: <20261005152425.25319-4-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261005152425.25319-1-jszhang@kernel.org>
References: <20261005152425.25319-1-jszhang@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the compatible for the Synaptics SL2610 SoC I3C controller, which
is compatible with the Synopsys DesignWare I3C.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
index 6da7d90caa3e..6806a22114f9 100644
--- a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
+++ b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
@@ -27,7 +27,9 @@ properties:
     oneOf:
       - const: snps,dw-i3c-master-1.00a
       - items:
-          - const: altr,agilex5-dw-i3c-master
+          - enum:
+              - altr,agilex5-dw-i3c-master
+              - syna,sl2610-i3c
           - const: snps,dw-i3c-master-1.00a
 
   reg:
-- 
2.53.0

