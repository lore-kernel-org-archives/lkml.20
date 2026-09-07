Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F61F47ECF7;
	Mon,  7 Sep 2026 17:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788801227; cv=none; b=YLlK2O1UKqAvC+qs2hG+41RNMJ5kkvSrqoKhsY25j3zQDJMYNuycyAQSTB9Xf3xVamMol9DytLiB/7DgK0oJdC4B2PjPyYnJ+6WkKZfTkGh80i1jUhln+81UyC4VWpvlcEBn3IDzq1LcITU3I4bIKV4bon90PsHewxEiEBZ+jjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788801227; c=relaxed/simple;
	bh=4/PuKiP/f6DKzhRogjBKJ4XF4KWNFhhnnEYbXkWQ+qI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J1hcVngFIB3EgzpN6frbQ5bA4J4tYg2lrMFDSGsBXZJ9CVw38hInohtepKjFauTJQ2R93VZCCuYRTeAUNNZsue0ZKyHWgI0LAHG35AqSJ3kCd6JM4EAVne+VltOM1f3OPZFEbuv14CreOsU7bGvDAaFlXC8Q8ZgTNaW9swRbxBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mvQ7KpIc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mvQ7KpIc"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1BA55C2BCFC;
	Mon,  7 Sep 2026 17:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788801227;
	bh=4/PuKiP/f6DKzhRogjBKJ4XF4KWNFhhnnEYbXkWQ+qI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=mvQ7KpIcIo1NL/j0O52tOZTzoot6Cp2/HGxK7Oz5Ua5t+rHl1isz2OjoP3SlrAj5a
	 eEVhEqRk5d0wks9/WljlE0/C/LAkEWLyjPqnJ253VB112dXfSe9XD6EP/9E1zXLOFl
	 xAvXLmyvaijMwxB/JhXvfCN2z6CgkVtuBja58WttKNct62tYWGGMoEKuoGGdsV0orI
	 /W5dcPOj0EzslnCW2fwjapywvChl9SJtW5Ok7nVmnAPaL2OlFEM+1m3es/ur9KzWX1
	 GA3ZesivN3ZZ0Tc2hXdSGrncfQDi3Zai7W5bOIZZh+nwFIDJAmaLfVimV57HseGOIk
	 B+ayPCHhLH1eQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE87FC79FA0;
	Mon,  7 Sep 2026 17:13:46 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Date: Mon, 07 Sep 2026 19:13:39 +0200
Subject: [PATCH v2 1/3] dt-bindings: vendor-prefixes: add Free Mobile
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-for-upstream-nbxv3-dts-v2-1-6b4afd36180b@free.fr>
References: <20260907-for-upstream-nbxv3-dts-v2-0-6b4afd36180b@free.fr>
In-Reply-To: <20260907-for-upstream-nbxv3-dts-v2-0-6b4afd36180b@free.fr>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Vincent Jardin <vjardin@free.fr>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788801225; l=855;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=GS6HXtqxwlBUlcOkCxh64ErhDBGMmoQtgCG1FanLSW4=;
 b=pZTrPdNKSAjqy369GEIvgRGDHKgqpAo5QEJdf9oK7rxagmgL1vFoiLjoIAGLGbVLJ7qjnLIY1
 WWbzt14169QDNjfuiqgA0rx+QuTx4SouVvlwVwoaw1acfVo+wH8hKZk
X-Developer-Key: i=vjardin@free.fr; a=ed25519;
 pk=hppgLeFpGpKOi7LNwGEZ4jOYofJCoGd4Jf1ltAabiLw=
X-Endpoint-Received: by B4 Relay for vjardin@free.fr/20260525 with
 auth_id=871
X-Original-From: Vincent Jardin <vjardin@free.fr>
Reply-To: vjardin@free.fr

From: Vincent Jardin <vjardin@free.fr>

Free Mobile is a French mobile network operator. Add its vendor
prefix, used by the Nodebox v3 CPU Module (freemobile,nbxv3).

Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba20029693734..e467da45cd7ac 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -626,6 +626,8 @@ patternProperties:
     description: Freebox SAS
   "^freecom,.*":
     description: Freecom Gmbh
+  "^freemobile,.*":
+    description: Free Mobile
   "^frida,.*":
     description: Shenzhen Frida LCD Co., Ltd.
   "^friendlyarm,.*":

-- 
2.43.0


