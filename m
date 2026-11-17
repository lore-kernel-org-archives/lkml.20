Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919232;
	b=tNK2PEAhM4OshlOh+oKzd8zJ9mDYbUnAFWT6UfABKPOFwS0I3K4BiEkHa/jEUi5Wj4+f
	 HZbnSrgLEoF/gp/kqUN5t2khAyfn/BLzAcswhji3m2yByUQeJjXFnFZ0OdDvoXpuqD90q
	 xeABGzqY+MY6AFb5S7yVHDky/R2O1QNAQz/d40OY5ndrpyYy+Y1vDMoY43Use0tsMFkHT
	 CCIvpmdXqhgW2qAvwLTRqcy67teusQQ1PtYQH96dDT9tenaQRGGouAhdIj5DlJCtG9HRf
	 efMd0xJeB3C/c5K/yVhhcG50CF8UBlhEXdSdZuGmrhfDAErm01uGYC7S8lTMfoQJQ5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919232;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=T78nEvmP8RTyHYN9q4ooPSC+f+0+Xl/WE0BGeWSTHkM=;
	b=5CqWHKsNSbwtaaEoYqefoIMv6JdYOMpx2IHD2GVn+3GwUCnsSiQNroslwFZ7okjOFsv4
	 DgeXqxmVYARrn8GLP2sI/s/o5RCyT0SwddW+cMGkT3etP6P/d9EoERwHn1SPbATFoIW48
	 jSezAe5xy7IdM8OqD3lpFppNa7GCU503Fghyawt8A8kFQZNJ+mEdvtS7Ynz/Z2qY9C6Ek
	 VaSeCl5OtWZoLTe+DhP5WmQsqGoy6o+d0zMCVVT0e5awFlrIj2VAW4W2smXCQEzqm5PM3
	 qOqdW1PqMc0zGt+2JYm/JAanrEL2JLdwST4Ty8GPMYFx5/5fLiSqIcQQYZXWWkWx4cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mcxx8hub;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 284A760A2623
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 12:40:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 284A760A2623
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mcxx8hub
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so35628015e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 04:40:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794919231; x=1795524031; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=T78nEvmP8RTyHYN9q4ooPSC+f+0+Xl/WE0BGeWSTHkM=;
        b=Mcxx8hubRiGTRxjKYFnIkSuk8Qjz/YepIITSFGaoBDnrueKoUwvb8bdQqSsWdDqO3h
         BYpDduC83/yUmYurELWKjjcNFuGygXph2KnOvlDVfsBYn1M3MY9XvMwrK9t0VODnpKFD
         XDW8keofNMMQTFt7ouJLEpcVUo/Dekwl1zqziqcTClZx7PQfmee5tqf6qT/FYkes8AkR
         l9U4HJTr1EhobnWrmYO3tR3sX1/DUDOn4GQFU0iywt+BSGJHutOaPMFVu4lwRCJeSSnE
         OkurMitNrpvSdhNi0YbJzKCgPeRB7OcsWb2WHPrQxoZdJc2NM6T8aLWi879t8sFhFl/M
         Sx4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794919231; x=1795524031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=T78nEvmP8RTyHYN9q4ooPSC+f+0+Xl/WE0BGeWSTHkM=;
        b=CVsr9Mx/Yho4Gfzqozou2GafGkVdyKkaMhWVbX/4VwKTOlTCyt4ENqZMym5EUPL0Hb
         tZVak/DotNW1yLjMdOKGATYJDgXIhtzkDaBqJ+ZjC0QIvIMqd1F+hRJRqC6cA9FwsJLN
         KsC4Lflo7vAyuiwkerceVq3wYOm71dma9+Rfjz/jdr87sqmETGHGGoP1LxwkiqXIPefu
         +zrTfy2zt6/TIvAzGtSN+JDpLBdFFZ9YcjkVB4nB0RvCqByUMIqynzKLTIoGMYA1Q6Js
         Rwj9he37VShwD08sxxCkb+WwLTrgg8WOIUpaqtvJ6cTl2QtIUjRwNPe88o/ez1x8RQCD
         fPeA==
X-Forwarded-Encrypted: i=1; AL+hErGJsZ9RsLtVjNMc2yXZ88cFn+qBJMsHVoFLVG7dU7fOUc3+30tVjtsPxL4pgXOR2tkHAPvFC6A45LARHRI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+xMjHYM5L5XSi5UjypCbL8fiSUk4O5sksi1tPGxjr52zJIxHBI
	HlYsmbYTSS7Qcip1c2FlZ1hqOlFLKWBxtpwaDvGhU251Y8Py4akzFmYD
X-Gm-Gg: AYBFou0Kl6RCvSF7AI2pI33iwPzvYNkBqgAJYT9Yhr4bptBpthorCd+ms6fJtj88EiM
	I5z/IJ2IxsgXTQJWASj/3QeK8RBX+KoV8sNjHZ3PPyu2P4n97HM14pPK1r3dMs+zU45zsT+FUba
	gzGVOHy49PmiHpRX3wCVvJhmLXeV5AwG6BU1zs0gvymMfS2OJcXdFeooc0Pb9qJcgSw2bUqSRBX
	kWzyHfH7sma8EFAyMghULCHqakPO0dsuuQED5SAdr8HYAwGF5odt+nUjXhZJfZZcMEmg/7sGsdq
	jTkT+xBH2g4k7Zov7GZ0904r6Wozac5OzpFY5PRbkWR7+MgNxZVZ2QlUhBm3Ta27F4R9hbxaQny
	e2+fZovX0iynPfTStfqrFFtS/qOEjdSlxde7miHcjn/1CsI+6Z4bm18fDdHC4arkWgzRSBLWVYk
	+aTjAiI+ldDBkkISWuTcBRBEVSQ1LUaOQxibPVSZiJt2hzwrWzSV5INOGB8j9PRV7YAaQyTw+u4
	67LioXrdHknPm32/vrJgbkVPoys8uqa6B8kYIROJDjALR5Kv8BJph7ZN0AbOceMnOeGby7fRiMQ
	lU/EzCtINfd+hz49VeVCJDN80Ds74LPHxraUfd7jkCO+fWMO9wXbXUYTc7AAv/j/hRcAQFST30/
	8BSbZZ0wAbcSua67E26ahgqlT29U5dns6NA==
X-Received: by 2002:a05:600c:c4a2:b0:4bb:7581:2bb9 with SMTP id 5b1f17b1804b1-4bb75812c05mr102919215e9.22.1794919230626;
        Tue, 17 Nov 2026 04:40:30 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb78386902sm73367065e9.1.2026.11.17.04.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:40:30 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
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
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v22 11/15] MAINTAINERS: add myself as PCS subsystem maintainer
Date: Tue, 17 Nov 2026 13:39:51 +0100
Message-ID: <20261117123956.11981-12-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261117123956.11981-1-ansuelsmth@gmail.com>
References: <20261117123956.11981-1-ansuelsmth@gmail.com>
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
index 32e218c0fe68..ccd2d04c5a07 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10034,6 +10034,15 @@ F:	include/uapi/linux/if_bridge.h
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

