Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794529978;
	b=cSQXmgJ8dk2ZqEXF1a5eMwL5wOhAcMlpC6DtNP1rc+O9hFk1FwYQ3Jv7lRgBImXlu5+w
	 vAXMKTeHShQ2GD31wsHyXz6DDKihMwwKYiaNTTGSYbUWJh9em/qRezmqwLka7bkkMfZYE
	 nzqSOQhjRovXzbieCWZ/+2h3Wr2fwZvcAiVJry31kP4nO7zeofgVAnTChk16XxPSWiNF+
	 BT8v75D7YENy3mVwe9llBrXMsaTHJXwhpo7aHrpDXTgtXMH+wyBEOkNCQye+vq5WgLbOp
	 4Mc4iUzr/HrVBVBDQqdZPw2rtp1BJUvjLMwMgHDc+TJIdIA9xaCGwXO2xsqijVQWtJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794529978;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=geHgxObFWVvRZemosAYU/Jzp3fHhQwXYyeBLmeYyX4s=;
	b=aCWxzxT+DJXhGuyQuKDc485vY59vv9ZYOn8rw91VTQP5VxgvH52QdTqq7i99j/ZHJGTm
	 gWIgiv4V/CqNOdY/KaPl1eRi5bVkoM5tgMymr1V6NL3V7XbeZ4GsbnF45qLzRG251trOp
	 WYLRhuFM/yGhQE7ASvL5nKUVuB6A7kVq8dc+T5Ka5SM4hdnqRWiy11JZ3FoVvqhH8Q5yH
	 6YmTW7jhGhcdEQCwe/P+j66sLZb4vHy1A8Ki7aCQ/VGUCK+a4TLXgfnPEZeiCxsP8K1oi
	 a4zT4FxfB3uc2F9IL1lAkoFcUxvYy9WO+GmIF6UidFlLXit0v2qWyHNQVvIBc/mWufg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GrTJnggR;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E7C4606C25C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:32:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E7C4606C25C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GrTJnggR
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-498f5fa5103so133106f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:32:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794529977; x=1795134777; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=geHgxObFWVvRZemosAYU/Jzp3fHhQwXYyeBLmeYyX4s=;
        b=GrTJnggR5/Vra+g9toBGqmFb+8V9HqTPftyxf4x9DTK+FuD6Qtd6EUde4hy4Axt6wq
         oSAQkU7S9Mk333uC3P/wUgGlh+CTntjRG6HBeKq29sCE9p3cL7T0PvHTv1ZS9LXdTdbP
         t3YiBXe8uNPTyaq56cXLNGx6leql0y367hx22hpGcW+Ndh9oAlWOMFXWE+y8tFXAiIp0
         9V5Q0vryh4eqgzk/KkNYMpyeYgnjl+XQ8v+KouXkc6VLI5DIVA7iuWJQlbegO2kSAcVM
         rfMGlolkLOVr0m7vIlQuOOcakfrER+PsoKPowEkf2VbxRjNuCui2JnwPOhXqHkvdaYk+
         vlkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794529977; x=1795134777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=geHgxObFWVvRZemosAYU/Jzp3fHhQwXYyeBLmeYyX4s=;
        b=cuhplmyWT9i5TskxQHF2rDrxMKJ+onaJnn+E2+F6V4nY/rDfy/Idc14eKzp+KrQOfa
         ZkO7r1A9CGoultUwfikg8BOICIA4ZjI4CDoO//ALFZQKFgATOZuhVYlvD8Jb7TvD8wCT
         WJAv6MGQO/Hc7NifVvlCPGx1syGjMDTOIDznHj+NWOOhesAzGI2TzV8DJEwyndYRMJSW
         GgXminlMP80N1sXEhHZBkivJIuQRxUS2ctStKl7fXl8CxMA3yXkcGJ/bmFstMEXVQ7tu
         X4U7nNLLY6BBKO1UIiLjAk3NYI2it7IQXeI0YuFv3boRDuFZhD7sInepk6z8A07e+ZOA
         H+LA==
X-Forwarded-Encrypted: i=1; AL+hErGhc3oTXmRfIUYSbSNSVZp0+WFSi5SAldEJK4I+2tHcpztPAqf9zrkn5lHEd8Ljt1fk2eLsojyKv9WOdlY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/FeTzVSVhWO+3g0/PcbMJ7R2rQRfLO8xtPT3s0aWAlN6t6HaDH
	jzTDJaKvIvvK7e4VIBgy1mLefaNFUVnZ637CQ28IJIeccVc11WwlSl3y
X-Gm-Gg: AYBFou0PnpDP2fcwzI+TSWtSSCqzwkqF0aSDrWJcpQxDtxPd8JW+vhNEO7ALTE50M7Z
	/BX1OZm6arUWISFl5jNlnTMa45dhu1FdeWvYgXhBofv5dhPeLU3Ww3phLCHPDZEOlpQ5WV+Tr7o
	iWZ8JCVcJ+T7CzomeyIhqznIMdajnYZQCFg5Iyizo8wkgZjhMbnzWWHxkggEl7mHXq+OoZrOJ+y
	2WSKjyzWXShM79xoyJZ6QToGeLqdhuxUDQfvINs0zXU8/HKIYx9qaBq9unPDNMAnJvCe1xMB5CI
	yK1kP5OmplAP83P07uGAih99McnkPboMzFo1Ko1TydB0oU27Xyg6J50Hbj6Yx8IuvW6GMPa2CY6
	UHfolNYpJUM7OGqp0XSou0GxUvLkubTh6MeKqJ5Cy81cl0GLt9tlUkOoiqOVnmh0/VK1o6psGxf
	swiGyW+e7Yz5aOIAMTQk+2NdJWGZImt6oNs3NleUHgbsgeCBxsber2fPcRCijawgTxhHM0aZ+Ct
	tFx2mIynbz06CSeQhCecraL66NFqLxlUNVIcavF46wu4eIC+pjS6NB2McNbqykaQvdW2s+IxENw
	Laq8Ko2uK4xyJvfq7zkUtVAybT9tmJT1LRI24jaaivQkce0pgZGqVdALevLGuy/oiklXdXCHnwj
	cP7d6wKmR32HBvDmBQe8NctVbL6/IFM08wdqcxfdIdl7pbR3iPnnsUA==
X-Received: by 2002:a05:6000:490a:b0:487:1662:cf4c with SMTP id ffacd0b85a97d-49c6dc01394mr2183917f8f.7.1794529976835;
        Thu, 12 Nov 2026 16:32:56 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (host-212-171-11-167.retail.telecomitalia.it. [212.171.11.167])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49c5f7828a4sm2029768f8f.23.2026.11.12.16.32.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:32:56 -0800 (PST)
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
Subject: [PATCH net-next v19 11/15] MAINTAINERS: add myself as PCS subsystem maintainer
Date: Fri, 13 Nov 2026 01:32:01 +0100
Message-ID: <20261113003217.197757-12-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261113003217.197757-1-ansuelsmth@gmail.com>
References: <20261113003217.197757-1-ansuelsmth@gmail.com>
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

