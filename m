Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794529968;
	b=W7RfppvGzgUaRNiLM5hXy8U1nIyjSKswdXBryA0gP99FC4kadnEqQJ0BPTTltpB0QWVu
	 arsXnAMXN5a0M+vzMjRvYmV5i564zUmFM6XXmEBCksl7K3wayx7vYSYzaHpuEUxScBCjQ
	 LDkQK6IlPd7IFe5TNkUqr/ybJG56vgqELzS1E/Nmhm0BM7QZu1e1zlKMhxRf+56/6ppun
	 tAp6VtjMrv23KLxHfHUBbdeR93IVKJWmr3A8OyCkCxo9nLNwS7GcyQhq5QjeM3DBn6zSr
	 KESXF6c1RoyasFGOQ26to5pS9a6zY9C6Y6I8Eg9PSFG6GWJRkoC5oST5/1fm9EW1Raw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794529968;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=au6wRe5V9xe+nBj4SXQtqBwfAHos0gKRmRourkWUPB0=;
	b=OeXIiPWjEAc/ZYjM9rtLONk8tC26Ved+38f+ikMKEh3/aSzy1ZJlBMS40+1T7yHuVNRQ
	 m3T76850ilyQv9eDlKC7/Flqn7LYkua6c29kRMKN4jYgqD/mZHl46nhWVDcVSsaRPUNFf
	 uJkZQkXd+/V1ZAXkScncYoYSJwd5z30JrWWBnbjeDhq2rxGBZ8/0xX1QLmr17sit0FcG4
	 yjEZwLPK7FQnhnuJA544QUjWaM5Jy4MhloIueH7eTrYIvkl140TaqYrVy/Xv8fNCHuqGk
	 aoHdCHxOzfBuYauVTCKKLEwwkAoq6QLzrW7avIoi8DpMfG03OExEcn5JKFjqNchpGPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lvkGxqMv;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E10960A383B
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:32:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E10960A383B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lvkGxqMv
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-491846221ffso309907f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:32:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794529966; x=1795134766; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=au6wRe5V9xe+nBj4SXQtqBwfAHos0gKRmRourkWUPB0=;
        b=lvkGxqMvQWMXc64vEm/jNDjeM0AM8DCieajGiUbu3tQbvfboeSE3huEeC5Hv/fbz+/
         IP09rQsngUi4srwf0Un8zbenKSg54mNjc8SM5lLmwrXzcNIHAbOxBX0whBaJhOFig/N+
         maL08dlo5PQx/GuUQ2LtedbHVXiBhJEgbi8xh/7cFJ5tAFL0iS9sJDqVgErE2WuGjRD2
         +4xcgn7XGFmJt4lTdKJDQKlS+FsLSdFS05LSmCx1JSjNeKj4RoeAyvz1qr54Qe7ERVDG
         WnwvnvRjwJ6TKr5Fe3GbEAcvtTjhS+sXN6GYo2r1L2NlnImngrG7T47XpzDFD5VzeKJf
         qOYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794529966; x=1795134766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=au6wRe5V9xe+nBj4SXQtqBwfAHos0gKRmRourkWUPB0=;
        b=Sh5AcB5vvBfrB5Wo+J4SV0kjTbo6AKQaScquT6htfNRBDxOAc16Uc532La/6jK2Cdv
         mLgrZO9PtoELYt7TKrGj8I0YwFzs8tuKUqXpUrMoPcsiWxT6ZwtTKc3LpIjytPLS0264
         7ERFarSq0vUv7QYEfF4+7fRkNeyyMa+gOExwyy77mPPZa2BK9wc+3yNJu1QmrKriE2w7
         92euMNYV3qWHrQtLwM8Fq/fxNRij99Pwh/wtANr+14r80il+w2Ttoli0JXUv/J6c0agi
         H6MQsZ2y3kLB0BR6R1PvPwG2KuZ98M89vBS4Qi84ZF4oBtuutbl/l9JBX4pEoLF0Lg7X
         gMGw==
X-Forwarded-Encrypted: i=1; AL+hErGOZi83Q4cLOn5TkAbHgQ/VxnHUFJI8EFA8bPBMrHJ3FS4115AFln34kjEonaobzbhE2rMFLUdVo4oqjgw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8S8yDwqWiaAiSSlq0X6o0mL6NsGEx4j4TUsE0ruj0m/sblsMTK
	vKKWTgpPK5R88Naspb8fkkNN5X8oG791ivkZ0e1sLZg/zwRiY/bJQfKH
X-Gm-Gg: AYBFou0l4bucIGHxrSBhA3OuMEg/crgttEeAt+ETeiXP1ZJ4SfASLRsg+FVo6tP9B2D
	e8A0upMLg6qvaAqxthkj0RwdE5XomFhNIbjkih2KqTDyTW2jjzxGFblahzeOjRw1cZRnMksVZ6l
	MsGaM8a8rsRZgpZmuKOrPDdjGLMzUbCgFH7HFphz+MrcTuCHOCXFaLaeATkNzp8LxSbYL109GE1
	0R1lKQ3gbzUmJxW3PRW7UZt63fNvgGM31pSCRcCK+Qt2BypBbRCXe1XcFKHYpDGcPWU+fzha6UL
	rYEEnLxWgDIsvAfyMWeP24f2PpD90MxuD1E8ju7zED3uMXYVzBFK6SSwWmL/vOtHh8DV+BAcFU0
	6KkyFS6YR+ueHqXOh3RZjJWtJkwP933MK68imInItzjqf0DMUc6H4uawmrVK01vJbje+fwoXXWi
	Q0Kx+5+vQVPgSdc6CAjjTb2KM1W92ZoJy/DEWLBVgcrXJG+gEkmG0v4p1KrrQLGD3mPLw4fvYYh
	9kfFz/rGoHtOKwbk7lUBMAMpcDI2qex4BnDIZUQoVf0s8cn1E1RPlv/dvllu0w9eVr1leB+U3do
	R9PdeVgVyz+Epx0bNu5ybNR1EiUGb1CLJgzGpMZakgYL0O7DYRZVvYwqglqhwLrJmQRNlyLXIoJ
	n0xN3397+tm/9oXAtzPhECSP5gN2INB9ifuVT6UKRcU7LwTtGrpKngsk=
X-Received: by 2002:a05:6000:4917:b0:48e:2114:8ab9 with SMTP id ffacd0b85a97d-49c71d47601mr2274012f8f.31.1794529965915;
        Thu, 12 Nov 2026 16:32:45 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (host-212-171-11-167.retail.telecomitalia.it. [212.171.11.167])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49c5f7828a4sm2029768f8f.23.2026.11.12.16.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:32:45 -0800 (PST)
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
Subject: [PATCH net-next v19 07/15] net: phylink: add capabilities helper and track modified advertising
Date: Fri, 13 Nov 2026 01:31:57 +0100
Message-ID: <20261113003217.197757-8-ansuelsmth@gmail.com>
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

In preparation for PCS release/late attach, it's needed to introduce an
helper to calculate the capabilities after a PCS is removed/added and it's
needed to track the advertising in link_config changed by the user compared
to the originally one calculated in phylink_create().

To archieve this, introduce a dedicated advertising in phylink struct and
update it when the new phylink_calculate_capabilities() is called.

phylink_calculate_capabilities() will then compare the advertising saved in
phylink instance with the one in link_config (that can be modified by the
user to disable modes), compose the modes that are user-disabled, calculate
the new supported modes and the new capabilities, update the full
advertising in phylink and restore the user-disabled modes.

phylink_create() is also updated to init the phylink advertising and
link_config advertising.

linkmode_xor() is added in addition to other logic operation to parse the
user-disabled advertised modes.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phylink.c | 28 +++++++++++++++++++++++++---
 include/linux/linkmode.h  |  6 ++++++
 2 files changed, 31 insertions(+), 3 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 918aa95e5a64..9f9715403215 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -61,6 +61,7 @@ struct phylink {
 	u8 link_port;			/* The current non-phy ethtool port */
 	__ETHTOOL_DECLARE_LINK_MODE_MASK(supported);
 	__ETHTOOL_DECLARE_LINK_MODE_MASK(supported_lpi);
+	__ETHTOOL_DECLARE_LINK_MODE_MASK(advertising);
 
 	/* The link configuration settings */
 	struct phylink_link_state link_config;
@@ -715,6 +716,27 @@ static int phylink_validate(struct phylink *pl, unsigned long *supported,
 	return ret;
 }
 
+static void phylink_calculate_capabilities(struct phylink *pl)
+{
+	__ETHTOOL_DECLARE_LINK_MODE_MASK(disabled_advertising);
+
+	/* Get user-disabled advertising modes */
+	linkmode_xor(disabled_advertising, pl->advertising,
+		     pl->link_config.advertising);
+
+	/* Calculate the full supported advertisement */
+	linkmode_fill(pl->supported);
+	linkmode_copy(pl->link_config.advertising, pl->supported);
+	phylink_validate(pl, pl->supported, &pl->link_config);
+
+	/* Save the newly calculated full advertisement */
+	linkmode_copy(pl->advertising, pl->link_config.advertising);
+
+	/* Keep user-disabled modes out of the active advertisement. */
+	linkmode_andnot(pl->link_config.advertising,
+			pl->link_config.advertising, disabled_advertising);
+}
+
 static void phylink_fill_fixedlink_supported(unsigned long *supported)
 {
 	linkmode_set_bit(ETHTOOL_LINK_MODE_Pause_BIT, supported);
@@ -2250,6 +2272,8 @@ struct phylink *phylink_create(struct phylink_config *config,
 	pl->link_config.pause = MLO_PAUSE_AN;
 	pl->link_config.speed = SPEED_UNKNOWN;
 	pl->link_config.duplex = DUPLEX_UNKNOWN;
+	linkmode_fill(pl->advertising);
+	linkmode_fill(pl->link_config.advertising);
 	pl->pcs_state = PCS_STATE_DOWN;
 	pl->mac_ops = mac_ops;
 	__set_bit(PHYLINK_DISABLE_STOPPED, &pl->phylink_disable_state);
@@ -2273,9 +2297,7 @@ struct phylink *phylink_create(struct phylink_config *config,
 				 pl->supported_interfaces,
 				 pcs->supported_interfaces);
 
-	linkmode_fill(pl->supported);
-	linkmode_copy(pl->link_config.advertising, pl->supported);
-	phylink_validate(pl, pl->supported, &pl->link_config);
+	phylink_calculate_capabilities(pl);
 
 	ret = phylink_parse_mode(pl, fwnode);
 	if (ret < 0)
diff --git a/include/linux/linkmode.h b/include/linux/linkmode.h
index 3b9de09871f6..a8290d021994 100644
--- a/include/linux/linkmode.h
+++ b/include/linux/linkmode.h
@@ -32,6 +32,12 @@ static inline void linkmode_or(unsigned long *dst, const unsigned long *a,
 	bitmap_or(dst, a, b, __ETHTOOL_LINK_MODE_MASK_NBITS);
 }
 
+static inline void linkmode_xor(unsigned long *dst, const unsigned long *a,
+				const unsigned long *b)
+{
+	bitmap_xor(dst, a, b, __ETHTOOL_LINK_MODE_MASK_NBITS);
+}
+
 static inline bool linkmode_empty(const unsigned long *src)
 {
 	return bitmap_empty(src, __ETHTOOL_LINK_MODE_MASK_NBITS);
-- 
2.55.0

