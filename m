Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD4A425872
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 19:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788548595; cv=none; b=tjg9m7hCbozSqt0ao4ucqfxxXC96HgdO+4dX3U8krnaslGM7aVTzS8arrEa3Tm6OTCycxqvRE0i1P0p7/NNexgJmudZkA/2AEBWuJUwTNb57ciUZEHvemw26y/Ihak9sORb8LQemW8m0VpgN1lmXe1lnzbIrL9z7ylrBBtIXpXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788548595; c=relaxed/simple;
	bh=UNJv9lvrdAaMKo4znGMIdBsuP3iVdeueDxYAlJd0x+M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aTZanVojjlZo56Pv3rWtbjj9e95k+ZZBb9q77oe/cTDMYmkA9gtjW95lXXZBBhrmqFzuW7/viuOvFDqI45t2a41OC8cl0ARXqXK1yS/wwpszN3jNYIX3dz6wdH4AgUwCzo82wE/VKGzM1UZO10GtMtm51nY/qS5zKpaNuK/DnNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=I1/+rlfY; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="I1/+rlfY"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49ccfbe062eso11997555e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 12:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1788548589; x=1789153389; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tu1Vd9Fy3KvBC8Ugis84GLswT2AxZGxIE45TX7gUkfY=;
        b=I1/+rlfYqhrOBqqk+5AUuj4SRBYZ8fZTB9H/xYRafSXUTtlOcA2pF0CU1oUsscUZ3q
         kLMO2op20yg+jNd2Ak4R7fA06woK3Fnkjv7AWYIdBJZiN7vNbOzlgK8qEffbixiuPuKd
         pxxN/2D2ZsNiziPlgy2MzfojhcFX+P/dEcTje556APW9swPeMOaGKKSeKLSSi3fYzWID
         91Y0IPBwI1t1FaO5RPrKFEb24qX7wQk9qMpuryrkSyLZ3HtNTVMzIl64hKDOb5T1KMGK
         veTexRm4EkTSPoFD4jkwOojjT88zcepaBE63QfShn6PszNKhWUaCBx6AuNSgh9UTYf6c
         Nk+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788548589; x=1789153389;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tu1Vd9Fy3KvBC8Ugis84GLswT2AxZGxIE45TX7gUkfY=;
        b=pUX8fMIQD0HjbD6b+hQcEX9/dE88wozL5D8WI2aWzUZJUnK8vjM6M6P9hU2VGuXJDX
         QTFtgnsgleNdRDgfGJMDMEJmNr6U92LLqDU3qY9IOjCO8y1L704DT+UAQxB9mcKoWTPP
         hLpYuF7vBcEbqmh6nJc5ZSLqKdLFrGOsK6KqyueKdihejnCAOGOVQj/XAyJYfk7n/OOS
         AO91EG2zSL68Rsp+FhSpQ++3kF5nK4ZRfDqcUje3W6OXO2yc0kWhzKWOvK/Xu8am02nw
         TMW2h4tOJy79Gg678jpk4+Dx83PaE9XteTtqhw+cohreUPDbHfPCh9JhWqVuQ58i2QjG
         kHEQ==
X-Forwarded-Encrypted: i=1; AKwUvBxVge3MWRx1FlgOvgTYWHtIWDANlpdXUPGe3WKSidVPuubnEVmAxsW6t/yp6HO00TkHPJqXDNMuvb3LMCE=@vger.kernel.org
X-Gm-Message-State: AFuF++m+Rrm2W2bDrlI3ZakVYlR2vTyMwwZWxC4/Nk9JrW8+jVcO8fTu
	ql+b/pS7+Ou8sA8OcQVY2uceAL+k2pUDQqkaInHHdXcnNTvi8p5ByxuTpoTQydqV8lg=
X-Gm-Gg: AYBFou2G37RHAZnoeR7DhVZyR9VxlqjxIHwcOBG8E8EWXgb5q1Isd9Pr6czIgsxiA9b
	ofs63jl7dIceSYrdnJyXEtwMrHXYm2dJ8rbYsQReXobBfedkdfk0VBtUdDjJzdvOWaiXhVFWS7x
	XVMF9JKiP1oHyKUVEi3LyXZuWz35Lbi32QgY9zbc/TbU1UxDh+O73kFkvEyibbzGGbbrVuXImvZ
	1/UyM/a7clln9k7Az18KdUIxHUTTUt6c/70Im+WYnv4ENLWbE1Nq0DJN9u5yqOec9eMNdA0leFB
	Gpsl4uWwL6pZw5vTC9zsWXev+bfvt9XB7/BRSO6zFzw80eAbd/gHu3ssHy3Z6rUXjFPCY6tLJ2q
	qA96hb6OowTeHDG2WhWvZfRgNR0KWZw2pYmvGiE0d//JgpVW9irMP455Ht5KZmGiHuaRXvNmf+f
	yKDGiCY+fdkjzoSWZzi/KBoXsTluqZWD9PtC4OmOo=
X-Received: by 2002:a7b:cc91:0:b0:49c:ff9f:f6b6 with SMTP id 5b1f17b1804b1-49cffa00196mr22006655e9.6.1788548589176;
        Fri, 04 Sep 2026 12:03:09 -0700 (PDT)
Received: from remote-01 ([84.17.55.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee60d8a6sm172195485e9.10.2026.09.04.12.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 12:03:08 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: Andrew Lunn <andrew@lunn.ch>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Eric Woudstra <ericwouds@gmail.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH net-next v2 02/10] dt-bindings: net: ethernet-controller: add phy-needs-host-firmware
Date: Fri,  4 Sep 2026 19:02:56 +0000
Message-ID: <3d0ecd9c0bcc28fbbce6f7df2b6995f2e8c78431.1788548229.git.f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1788548229.git.f@lex.la>
References: <cover.1788548229.git.f@lex.la>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A port can reference a PHY that cannot be identified or driven when
the controller connects to it, because the firmware the chip needs is
not in hand yet. Such a port is dropped at setup and stays unusable for
the whole uptime, even though the PHY works seconds later.

The flag declares that the PHY behind phy-handle is expected to become
usable only after this controller has probed. A consumer that sees it
keeps the port and connects the PHY once its driver binds, instead of
failing the connect. The prefix names the entity, like the other
properties here that name what they describe rather than the
controller; a PCS needing firmware would get pcs-needs-host-firmware
by the same rule.

It sits on the controller here because that is where the waiting
happens.

Assisted-by: LLM
Signed-off-by: Aleksei Sviridkin <f@lex.la>
---
 .../devicetree/bindings/net/ethernet-controller.yaml       | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/ethernet-controller.yaml b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
index 1bafd687dcb1..ce4a7a6f605f 100644
--- a/Documentation/devicetree/bindings/net/ethernet-controller.yaml
+++ b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
@@ -108,6 +108,13 @@ properties:
     $ref: "#/properties/phy-handle"
     deprecated: true
 
+  phy-needs-host-firmware:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      The PHY referenced by phy-handle runs firmware that the host must
+      load before the PHY can be driven, and so is not usable for as
+      long as that has not happened.
+
   ptp-timer:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:
-- 
2.53.0

