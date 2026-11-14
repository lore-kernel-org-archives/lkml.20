Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794653098;
	b=nZZoO0cj1mpXt4PN9nzjyHp9cL5j5K5ZKkys4utZ8n0fokSirZapQBD8OxgKJdPKCP1l
	 MWbtpmJDWV2N5DS7aBxfLX9iYpyz6JngRKaRrIJ/MX6XekeRynqf5uR/jS9DQXq6S3Ofe
	 NjH++XWdYBg5RFxYZQoYZhwwS9kC1Kx9rwko7yOBf6GzvsRVmtGh4DD3GofrRi83llhx7
	 b36y3CxTo0TNGO3WItTJiIkUy2VyGrFw4VYZZWKmF0ruPGv6fLobO96d9l+kK97d9IJRM
	 jGI5ZvUt3P2PBu4K0LEYxa6o0EUIkd39FAM/5N96Mo/oWO0RiKrjWQeyTBM8zAVLuFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794653098;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=geHgxObFWVvRZemosAYU/Jzp3fHhQwXYyeBLmeYyX4s=;
	b=r3UO+4rQTRwordhTyHc2UwAeAcjvBmEEuG2tZL3JiM+U6VqWwB+lvmIvlG07EENBjZ7w
	 A0IkRs6J3dTUOvc9jNDtU61/6jc17aUWeD9NZQf2EnEm9GcHiKT9Vin4aYDMDU7ZjbDKK
	 dEeqf20qNyqxcNmCHYShtcpI/XbjOXHavN6xVGhFSahj1MEsY4XX3KVWMtMZVywIumrWz
	 7BiSdy4jJXdAIegM2x2U8D0ZqJEmzB2Zt67dXwxnT6IUAmgwNS/MXxEOziOjIN4qp0QSq
	 7gyA9a8N1FYAlNVCDop3kGHK/ULPbhir2QfpfuBjenpylIX+2i4zQAn8TwfAI/s7V4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Pntf8LZb;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C97FD606CE0D
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 10:44:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C97FD606CE0D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Pntf8LZb
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so11622195e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 02:44:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794653096; x=1795257896; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=geHgxObFWVvRZemosAYU/Jzp3fHhQwXYyeBLmeYyX4s=;
        b=Pntf8LZbqHpOVNNd/h1jSZzUejSxbTz5brbrkG3Tq+qe6YNq1BxEBY9d8GUioE+sSg
         Xw3DmSOCiVbkQPhvxxQ0o9r03NqpkIcU6OIFqUSdd0Mv1xrCQCygv9CfMdX/LI8iwqao
         sYht5dHs8vHj72C87rB6RlPbiYRxfZhlOYxN5P7EZzppWGI4wI69FXXpKTdJOS2pS+Sj
         7M3mSjyPHH48IdKyUCU6l879Fv43QlS23+qH2nLdwyLRuOD2hxZQsBX7lM2mpONYB3en
         m0AiIXxCvT5mi5zLPcCy03cIxq77yaHPFmnS3PBu+plfy7NXAyyC00Y9Nwb3r9NOQUSA
         VqVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794653096; x=1795257896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=geHgxObFWVvRZemosAYU/Jzp3fHhQwXYyeBLmeYyX4s=;
        b=z/U6J1wCefCk4sziNR+QYc86sKLpjoUOHpV+U1Jy2tKawNt8Y4BtxK97khsLeRcaid
         Legcmk1qLa1aWx1xbmCBXHNdUqb4uYxbZhMxL4KNdYl7S9tH6J+m3lH+mKkyhu9np7JB
         CNbf1w8XPAw6qeehexUU6T8Qj9Ku3tjuooXcOh5mw+gfK38BYQEi+dY/olz0nOTFXn9G
         pjJ48aAywuO8MjWzhZum2glt5Fbe3qvJbEzu72yP7hI8lgEDxCTQz6xh6wBBkQLyHRu5
         l18UqYz27Jlu6N0d9RagJSX6GwA/XvopM1zWaxAHZTnUjujk1rXRZffAvIM/tQlXa2G+
         O43Q==
X-Forwarded-Encrypted: i=1; AL+hErFcCCKzOjdWUWHgt2d1HXyzPjB/J5l2CTVxif7oJrrnA+UwJQjNDM+wIiVkEtFFZI6vvVMrFw3gIQolBso=@vger.kernel.org
X-Gm-Message-State: APuU4Z+vXb7ye3kwaXbCW5WNyrwGmxKjluCQpMt84Wp0+aeL6kuJk7Mt
	SJk/0b35wJB1LsVbmMLnsjwVrdOikUMsT1PsJDLvEp/aXtMRnFIPgeIf
X-Gm-Gg: AYBFou3iRelu8UpCjvxv7AE33wwIVcgEZPdV/0MXVAlH54jpObx0NR90tJSxAuDPkJQ
	JpX+nD5LeaYaMoAN49pqrYhHG38IOnpLAQ5PdXFxdtKWRoYuQ/ZeiPA7GPt4xQEQBNP9ULzGGu8
	/iMBe9wvKstke/Vj8LGu+E7w6WZMU/Sol5twB5hNVT3Fr3z2ZlaXPwFyZhPZp+eS5Xr30o1iDvr
	bWgXpLmMHs3LON7/CBjHBqoZfZFyX9izxVfIN3VBtwpEhULmQwftUWi9bJWqnOLqogKNmrqVEHN
	csRf2Vkyjb/wnfvaI2FjpZ8qtUdtDG2qO3todKBPY+FTJm6KTONJXCVfEQv/zOQHv0G/VjpmhWb
	MafdcGeJwaNzPmC/oqPQGNq7mFGtaJI+RlEql08nTOfGmDdboCHSkt/nGTx0CnaP7Wvv3Xs36pG
	xR1Ix8ZIqf1EV+wsqqkpCVOHoo6Z7WhypYp+7OSDYUfnXkHE1ydkqPe1UvtaiGKvhTWQRjf6r7I
	nO5mGv79L/znRCTkjRRyJgWtlYcGKVMTmn8UIhlBlPr/2bQpti1XdRu1lUxrPRAaV862L9qK+bb
	Khn0JETODr6WZ8a4JioSK8+IXqrqb9A7YnzfMjqhES7xpHadJdhnw6mWy9nPfBCXQrz99oRXu0G
	Odf1nNgscOZxfQLVdQ9PqTdzhFR5H2ZMzvg==
X-Received: by 2002:a05:600c:4e8e:b0:4a3:59c9:a743 with SMTP id 5b1f17b1804b1-4bb55a8faffmr109717835e9.27.1794653096148;
        Sat, 14 Nov 2026 02:44:56 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb56719391sm52858285e9.1.2026.11.14.02.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 02:44:55 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v20 11/15] MAINTAINERS: add myself as PCS subsystem maintainer
Date: Sat, 14 Nov 2026 11:43:50 +0100
Message-ID: <20261114104426.235620-12-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261114104426.235620-1-ansuelsmth@gmail.com>
References: <20261114104426.235620-1-ansuelsmth@gmail.com>
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

List all the files of the Ethernet PCS subsystem and add myself as
maintainer.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 893b0670a7b6..44c116f6cfd8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10033,6 +10033,15 @@ F:	include/uapi/linux/if_bridge.h
 F:	include/linux/netfilter_bridge/
 F:	net/bridge/
 
+ETHERNET PCS SUBSYSTEM
+M:	Christian Marangi <ansuelsmth@gmail.com>
+L:	netdev@vger.kernel.org
+S:	Maintained
+F:	Documentation/networking/pcs.rst
+F:	drivers/net/pcs/pcs.c
+F:	include/linux/pcs/pcs-provider.h
+F:	include/linux/pcs/pcs.h
+
 ETHERNET PHY LIBRARY
 M:	Andrew Lunn <andrew@lunn.ch>
 M:	Heiner Kallweit <hkallweit1@gmail.com>
-- 
2.55.0

