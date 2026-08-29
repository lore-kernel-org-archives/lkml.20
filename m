Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2521354AE3
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 05:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787981163; cv=none; b=QO7ZcOsjqjj/y9ESlwDvg2Pc9l5YhpNbyZvN6LdRcM9q1p8Y/RxT0YH1GWKoHsCTgh3nzfb1B3kiYVAxh0ZDv/xfZytAHTmgPiHlid0PxfDhWaIHSjs4fY0Z+5eSPBKu5+1vODvo4rL2PBGGVmSftoWC48IPvJQQ+PQ+W5dVKW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787981163; c=relaxed/simple;
	bh=tKa5j9i3U2hEA89fukkKnmWOEyATOeYt7RNjiBnkF8g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LDfc/ZDLbBJRDNBTebq6+Ygori8LdXPeOyuVCJxJLJ2en7nhzQGDwomrP41I9Xos6/YWWfeTaZ/onP7wZKNrYWYNpwsHLcJZktctXY+3c6Y8gMkkq7opxN9KkS6W+4DEQGVkzdCR/0t5BkC/7FzmwQs3mdoluCOxJrHDZBcniUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=TTNtrB52; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="TTNtrB52"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c1600d040e4so273478366b.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 22:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1787981157; x=1788585957; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6tbb1GitXTJrwSUFBP7Nmbmt66qKmDt6rqJljhVwKiU=;
        b=TTNtrB52lTweJtY0q4agXLa61PNApfdVadtD44EgkDczUakEXFtyNDxbHSFlSuJCrJ
         7N5R7olAB5CrVQa0pp1g7fvKTbGoahgvLFB8csMZ+den9ut5rreKVcAnvh5DJylWfaQp
         RDSP+5e5Qfl8+U0d79lHFUyqqVepVICaA5jHr48wt3Nfg/XhHC03roCaAmV8MNkns+7U
         jdY86BNc6xrbLcQ/Ojh1ydd3BAy9WRGd58/sVRlm2FuJq8LR13mHdpoceWjtF6/ayMNn
         5ePELdUBSwtk5UJfcSSW+KpzrJrdRBPMgb3NrUQ8MwJMKkRH7HfinjuoAakNx2Xs6EJl
         /V1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787981157; x=1788585957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6tbb1GitXTJrwSUFBP7Nmbmt66qKmDt6rqJljhVwKiU=;
        b=Yuz5BchaAqJRdhCO93QOqG7cRErTJZaRopZA1sfLQfgek3RqqUdhGtcgDAq1Mn68ac
         z1/11+7RzYX3TKqiaywsW6qazPE8p0sqgn47bZf5XW6+uYR/215fJ16rUsnBnEGHhAu6
         1iQwME8wbqXHoedIe4Ooxb3VuxNW9xgyssnMYBdzCNDyOdNRh6ziGJa/Wr8VOt9xkfQf
         /syWnib86FdKj9AK65GsQJNc7HcU8I3hXujIrt5FxUP2sEi2Qjm7g0Iq540zbJn4Y943
         RjzyOKGNCO3peKcWI4UXMCUNxXO5qAdETxeJe9KOjURId7hyWyOfYA7C8OuUw/ZESkKg
         bTFA==
X-Forwarded-Encrypted: i=1; AHgh+Ro0kHaX6ulEnaeUPECsbUm9VHxxqp0gr7xPaio73KgcAdLZw5aQQ1uFMjfNbc7YZUGEUzndaCHFfpJ27HI=@vger.kernel.org
X-Gm-Message-State: AFuF++nmCcLxsq8qdD+zIKKcMsT5WuImmORBSjJl/VHDBAERcUbnoETS
	h5KJfpAARb2JiwNLGTQfAz/8fICBZCHTORZ6qfIYyIE0iqafBtx03KYQHijRrrWGdiM=
X-Gm-Gg: AYBFou3tQD75psQYJkSrtW10iFRp2nhv2dORHXiog1N4ForcJm9YkUccgp0n7F/VF6M
	3Wq1zuYvF0oFxUM2nNNoSsxDFSa9Me3CY0KmT54IYL4noZLqe25Q3e0LNHgtZ4buZISstJY95D7
	f71RhD8PiVp5OsH3gECmPeii7aR/Bg/RWx4e1sScyyFMYOb9jzcHA6V31T8tQl0w8pJj8sr5ceS
	Ft0QsM0LdqKUscJuR/EhPznfT8Sj8PKqPaKMtEd3sb0o5FpPbfm5Y3e81puGv19WsykC3rffWzM
	F58jDX6MOMftsTD6QeflAXoKSKne2WqyZgG1oh6p5+AkN9yOPBVGsdw0Ilr5U2oxfZBNDWhRp2D
	DFQv6cMSMyvdZbxpARYuuL0TEQSGEzbgWjQ7Ffr0A/mP6oItxv28g8Fc7sO79m+3k2EjXPU7iZS
	qfIOP3tsDa4PmboqwXRNyy4kW7YNq9MOpPtxzrYXwKS8jvdOpBpbh4BQ==
X-Received: by 2002:a17:907:1b0a:b0:c24:6382:2648 with SMTP id a640c23a62f3a-c256dbefa05mr322975866b.5.1787981157019;
        Fri, 28 Aug 2026 22:25:57 -0700 (PDT)
Received: from remote-01 ([45.85.105.214])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255ee75a36sm163750666b.28.2026.08.28.22.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 22:25:56 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: netdev@vger.kernel.org
Cc: andrew@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aleksei Sviridkin <f@lex.la>
Subject: [RFC PATCH net-next 2/9] dt-bindings: net: ethernet-controller: add slow-to-probe
Date: Sat, 29 Aug 2026 05:25:39 +0000
Message-ID: <20260829052546.1152446-3-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260829052546.1152446-1-f@lex.la>
References: <20260829052546.1152446-1-f@lex.la>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A port can reference a PHY whose driver is not usable at connect
time because the PHY's firmware, or the module carrying its driver,
lives in a filesystem that is not mounted yet when the controller
probes. Today such a port is dropped at setup and stays unusable
for the whole uptime even though the PHY becomes fully functional
seconds later.

Add a boolean the port node can carry to declare this expected:
the connect keeps the port and attaches the PHY once it becomes
usable instead of failing.

The name and the schema home are an open question of this series:
the property is generic and read from the MAC/port node, so it
lands here rather than in a vendor binding, but a better-scoped
name may exist.

Assisted-by: LLM
Signed-off-by: Aleksei Sviridkin <f@lex.la>
---
 .../devicetree/bindings/net/ethernet-controller.yaml     | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/ethernet-controller.yaml b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
index 1bafd687dcb1..ca82672b6cb3 100644
--- a/Documentation/devicetree/bindings/net/ethernet-controller.yaml
+++ b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
@@ -113,6 +113,15 @@ properties:
     description:
       Specifies a reference to a node representing an IEEE 1588 PTP device.
 
+  slow-to-probe:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      The PHY referenced by phy-handle may not exist, or may not have a
+      usable driver, when this controller connects to it, because the
+      driver or firmware arrives later (for example from a filesystem
+      mounted after the controller probed). Instead of failing, keep
+      the port and connect the PHY once it becomes usable.
+
   rx-fifo-depth:
     $ref: /schemas/types.yaml#/definitions/uint32
     description:
-- 
2.53.0

