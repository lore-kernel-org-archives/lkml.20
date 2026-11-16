Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=5.135.140.105
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794854060;
	b=bOgb+MCNPfpY2d2DmSBS8tFMPqAP4xHNvPSyQgfT8h2PLJw4o4cSzhjQsSH9UprbXjA9
	 nhzy5wo3ovcCktWq0Moq4w1VWfm/aVuefVEDXNIxcHM0ITqsfayUXwAwZVVoM+2CXgr9G
	 Okfo5mk/G4eyaSpQovRedV15tt7apec038bv3MqcFmhM54B64ZCk8UDdE2m3LxmH4hPNY
	 U36Ba7kiKZbsl8iIWluuiA7DegmA/g4Ig9G5XY5NV0xxUENGWzBY2gUcoE3XCNzXjoOLK
	 YZMBOzznbMoScL12ybyhHd6Kr/KMI7+PzDoE2++oA98DVA0Q/y6QuzvwvvlkRRCj07w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794854060;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-Id:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=gRltEsjFj+deDZeaqgk4Ea0K4n+h3Q/K1mgxwQTMG90=;
	b=Ez05SvUU5vCO6jMt2KUgCq9gVy4+xfq9oGXElQ5BL9Jxy8GmSx9tVpNDBRUMLI7/4CIP
	 SiCIISm5YwwBelyl6wpyt1t1/pfe6rPmr3YgL+kVgIle9MxWwmgyEtZ7QOvWOOCcNYviG
	 v6TPVxxyj53P2JpcOfCewP5TN2F1HFhmeexm1D27AME5PW3H6NB4kwfwvWZ1Nk6D8ObDG
	 QlbcI2y675400rx8S8AwVBOyG2ZOprRczBrqhJe7vaqbMnImJqU85v7OscXa/F92RxMTt
	 iyBcFy+Hl4G8KQvdTaKZNC0uW6qjlP2jgpoKkZp/zaAGXqKO9DU9R7XtXn491f+OkJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cjdns.fr;
	spf=pass smtp.mailfrom=cjdns.fr;
	dkim=pass header.d=cjdns.fr header.i=@cjdns.fr header.a=rsa-sha256 header.s=dkim header.b="obYXVyO/";
	arc=none smtp.remote-ip=5.135.140.105
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E7C606A31C;
	Mon, 16 Nov 2026 18:34:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9E7C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.a=rsa-sha256 header.s=dkim header.b=obYXVyO/
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B7D284F9114;
	Mon, 16 Nov 2026 19:34:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1794854057; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=gRltEsjFj+deDZeaqgk4Ea0K4n+h3Q/K1mgxwQTMG90=;
	b=obYXVyO/8BkSxaBTo/9oT+KyY7+h8rVy6koDbi1siR0aAq/ma4INy4YEgmc3kDWScWiDA6
	4lQaAGk5w3RyIAaFhSIr3Vwo2hIN4YoMaFbfgdiDHYuXBKl/A1aGanJkHioFTyaroiVyP7
	sE6aJ/dpzvm1yLLHiadO0SuENEfSXM7QwLYop4DpVEPQbKBf70BGxki7AOI5nt/zFcEZrk
	Lp6MHV6ilaAajD4AhtkJd/Gdx2PmlotWTdwoXHGzhzksrNyyZTEb49lwEvg3sWLIiWN4JL
	I6nx3WhmB8BCv6BANukg7lwB06ssJH3F+yZ+BNwpKzfOD/dFEPWUoHGHtLUYBg==
From: Caleb James DeLisle <cjd@cjdns.fr>
To: netdev@vger.kernel.org
Cc: andrew@lunn.ch,
	olteanv@gmail.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	chester.a.unal@arinc9.com,
	daniel@makrotopia.org,
	linux@armlinux.org.uk,
	arinc.unal@arinc9.com,
	Landen.Chao@mediatek.com,
	dqfext@gmail.com,
	sean.wang@mediatek.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	naseefkm@gmail.com,
	b.larsson@gmx.com,
	Caleb James DeLisle <cjd@cjdns.fr>
Subject: [net-next v5 2/7] dt-bindings: net: dsa: mediatek,mt7530: describe 'passthrough' hierarchy
Date: Mon, 16 Nov 2026 18:33:27 +0000
Message-Id: <20261116183332.168858-3-cjd@cjdns.fr>
In-Reply-To: <20261116183332.168858-1-cjd@cjdns.fr>
References: <20261116183332.168858-1-cjd@cjdns.fr>
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
X-Last-TLS-Session-Version: TLSv1.3

Due to hardware limitations, full switch hierarchies are not supported
with DSA based on the mt7530 DSA tag, however it does support a simplified
hierarchy in which one or more switches act as passthrough conduits with
only one CPU port and one DSA port active. Document this capability.

Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
---
 .../devicetree/bindings/net/dsa/mediatek,mt7530.yaml        | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
index 90b3582b7619..590eb39d6b93 100644
--- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
@@ -73,6 +73,12 @@ description: |
 
       Check out example 7.
 
+  The MT7530 and MT7531 switches offer limited support for switch hierarchies,
+  particularly in the case where one or more switches have only one upstream
+  and one downstream port, and can act as blind pass-throughs to a fully
+  featured switch downstream. When using this configuration, the fully featured
+  switch must have a DSA index of zero.
+
 properties:
   compatible:
     oneOf:
-- 
2.39.5

