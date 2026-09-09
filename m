Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787943B059F
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 19:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788980771; cv=none; b=Okzx16NpvLyuYlRAqDQ+Wl2jwUtag31MrCEfjoZReOHUQfjXLNBL6igdEFNk84+ctoEQD0sKu6cPTa2jq9/I838+4uere0sZq39C0NV6q6oMxbU/F/omY2ImWIo2FpvDkzygPBvrjsw2oK2rvP5BVRa+RUy/DvSCtliibKpTIKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788980771; c=relaxed/simple;
	bh=iKTRUk516cNiw4XS2T81e0aBKFwxKzBoa/VpC0CxbDE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bAbcBMQa3pGNoskaFPNU7jKD5Om4TbYQZxCcYR9p7SlQukNLICip6yNNOq0LMaqSy053yK1WuK76eu6iH3jTNCJX7ElthU4tG2ZJp45qQCNYJdPLgYKpZeS3olkaMYSjADomEkjpF0QG4MLC5gan7zOluqbns2IvyH/fiLkom8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WtVFCx7u; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WtVFCx7u"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d8fb334e72so14366985ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 12:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788980769; x=1789585569; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HGCEQvvD0jHywo7chPYIDdNvmbbeQoFnsakggHQgXhE=;
        b=WtVFCx7uP1Mb0qVAdxtM+3JW2Swfg16wjrXy0DRAL5uTPzv6PcMkg64CNLWTMgmnYK
         EAfmHiXIA565z9cgD+RXxji9D30dNMv/L0+K+3u0G3e+GsKowWv+5psT30Yz29ixflmh
         ATdZK9L2Pj4dBfOhZAHnpcm9PR08f6Zg4ztVY/IrrSXYmjoOruN+yYgiXdLir8QyaZsP
         42wQuL/mE2rzYtIBQqG3ob+l4Zc023tvuK/Xd15gBl72ns9wyczAF7OWPsfAiTkVoJt5
         9eqqxN0bIZTbYv4cZGbjBbWe/C8J252ZUSf89lsaxX0MKuVqi8A3D9d221AityO6/hec
         DuRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788980769; x=1789585569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HGCEQvvD0jHywo7chPYIDdNvmbbeQoFnsakggHQgXhE=;
        b=VD6Ad9q9TKrsI1SqlIg+xfGKdfnk84mb+n6MkJSrwFm+elRXUK28+m0fjnMir7TCGN
         B0qzIo0MfNHoMh8XB0m0mWEAMy1qiCc9Jn7L5EHwcadNiLhhXiIbg1CAia5Sjtncl9Rx
         urKV/OJtKl2eH0KJ3h0SPf2XBJ4d5zx5CVb0DZbqWwgTX7vP96nADUXAvuBkEG/licC7
         IMcqpOWgJCZ0oqnZ7M4trlqPTUa6M26UmNvXGfovVNFzzvfVL0FYyAp1HdNPThkG9Wbn
         mA2s29mwZ2xzdlB/J7fw3D6eVYihGf5Dur1FAx5TKjgy46rv6DZU2PfZo/S2mHZidE/9
         NCog==
X-Forwarded-Encrypted: i=1; AKwUvBwm/clhrqaj5J6r5Et+/yQOgkSQbI7yauKr1azraMXW2DCoF3498BC+lvCrP84wjbyx2eq3Yu/zl/txNpU=@vger.kernel.org
X-Gm-Message-State: AFuF++l7v5ZK+CyQQ47Fm1N2Wo+zZwuYp/w41x1GauRd1vIWbTMiUhC0
	dcwabJxIvj37EEyu5kVTETBe8i1I+t/0C0fjJYKjNkfBsAWx5doZgnC2
X-Gm-Gg: AYBFou2gA9M2LVxswGY/G5C7Qu8vlbOCfVczj1cNnTaA9ueJRI6nXqkUhTr4VxmMFuq
	uYmaiqEzkiomUJdQNnawCqXm07eKC189fMLDApVw2xIZy3Z5h+Cav+qN0Ez2/1Gib1M3VmXcKI2
	ofUvJ6d2tDK8NRIJoMu3bYVfTt7u0aqA1mIaI3YObtL8b/7Ufjtaz24OAgq+aD1zpgFll73XY3j
	vSEmyn9OgsSGbHFvFh2sSIGleHS7LOYJ8P8mqkg3cbx9CcVvGClHX8jFsGXNozXI4wtOp5o3dqX
	lw+P61XHPq8L/uvrDrtObwUqgnHq5O4kZ/g31gxQNmYLUBfnJcYR18UwiVnPWEwmT0oGNQXwYhU
	ZvWYoQK+gPpvS9OWfUBmRjLAFx7Yw6azLhMmj7ED2VE/TEAufL9VOwvLB+ERmismkkyFCX2px/T
	KO7H3MYU+1qeFkdApN5N5TEGcCWD+eUDBXkeuifOoJmNFsWmblhU5Bq95K1DH11u0OLKD7tfFAn
	xCZDEumxT3Q8OwpONwfSAUh
X-Received: by 2002:a17:902:ebcd:b0:2db:3729:22de with SMTP id d9443c01a7336-2db8d3cd0bbmr104342425ad.0.1788980768818;
        Wed, 09 Sep 2026 12:06:08 -0700 (PDT)
Received: from d.home.yangfl.dn42 ([2a09:bac1:76a0:d30::4d0:7b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dcffa9827dsm13988515ad.66.2026.09.09.12.06.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 12:06:08 -0700 (PDT)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 3/7] net: dsa: motorcomm: Fix port control/status register bit field names
Date: Thu, 10 Sep 2026 03:05:31 +0800
Message-ID: <20260909190541.466476-4-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260909190541.466476-1-mmyangfl@gmail.com>
References: <20260909190541.466476-1-mmyangfl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Review and fix the incorrectness in the bit field names. No behavior
changed.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/dsa/motorcomm/chip.c | 3 ++-
 drivers/net/dsa/motorcomm/chip.h | 7 ++++---
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/net/dsa/motorcomm/chip.c b/drivers/net/dsa/motorcomm/chip.c
index 946949a3aba8..53d0a85e9310 100644
--- a/drivers/net/dsa/motorcomm/chip.c
+++ b/drivers/net/dsa/motorcomm/chip.c
@@ -3747,7 +3747,8 @@ static int yt921x_port_down(struct yt921x_priv *priv, int port)
 	u32 mask;
 	int res;
 
-	mask = YT921X_PORT_LINK | YT921X_PORT_RX_MAC_EN | YT921X_PORT_TX_MAC_EN;
+	mask = YT921X_PORT_CTRL_LINK_AN | YT921X_PORT_RX_MAC_EN |
+	       YT921X_PORT_TX_MAC_EN;
 	res = yt921x_reg_clear_bits(priv, YT921X_PORTn_CTRL(port), mask);
 	if (res)
 		return res;
diff --git a/drivers/net/dsa/motorcomm/chip.h b/drivers/net/dsa/motorcomm/chip.h
index 6f0123d219e0..e87daf8c650b 100644
--- a/drivers/net/dsa/motorcomm/chip.h
+++ b/drivers/net/dsa/motorcomm/chip.h
@@ -94,11 +94,12 @@
 #define   YT921X_SERDES_SPEED_1000			YT921X_SERDES_SPEED(2)
 #define   YT921X_SERDES_SPEED_10000			YT921X_SERDES_SPEED(3)
 #define   YT921X_SERDES_SPEED_2500			YT921X_SERDES_SPEED(4)
-#define YT921X_PORTn_CTRL(port)		(0x80100 + 4 * (port))
+#define YT921X_PORTn_CTRL(port)		(0x80100 + 4 * (port))  /* Bit 7-0 shared with PORT_STATUS */
 #define  YT921X_PORT_CTRL_PAUSE_AN		BIT(10)
+#define  YT921X_PORT_CTRL_LINK_AN		BIT(9)
+#define  YT921X_PORT_CTRL_HALF_PAUSE		BIT(8)  /* Half-duplex back pressure mode */
 #define YT921X_PORTn_STATUS(port)	(0x80200 + 4 * (port))
-#define  YT921X_PORT_LINK			BIT(9)  /* CTRL: auto negotiation */
-#define  YT921X_PORT_HALF_PAUSE			BIT(8)  /* Half-duplex back pressure mode */
+#define  YT921X_PORT_LINK			BIT(8)
 #define  YT921X_PORT_DUPLEX_FULL		BIT(7)
 #define  YT921X_PORT_RX_PAUSE			BIT(6)
 #define  YT921X_PORT_TX_PAUSE			BIT(5)
-- 
2.53.0

