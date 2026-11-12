Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794489297;
	b=f2t+JCl2TRsSso9dIJM/owHMLgxIgR6YM34UdBmoL9YUNDROa3Gntio0wLq8yleqJjJB
	 2AdwSEulmR9Zch5uRmw06fWUZKEsUB7l+QqTPfw98fUF4kqnrJXuSEg3TmHHCPBYTWdnd
	 SS9p3dgMCaBhP9nS2kfuxPej1P2gKBcrg5i2ail0lfSgOwzec+R/gWAZlFfYStGb24XLh
	 7dcqQD5F3QiZquX4B016z+mUZ3eGMOx9PpJJrtVSO/QERKWPURfc8NQ/BPGe18VrSpLhV
	 jjEypcBJAcdiXjK8CeS8jzh86MhMKKNXoBgKXAstfTchw4jul+djUY0jSNZ8qNHQffQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794489297;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=l3qR4fbwmcH1ch8aJsFgigRVRt4HxyD2/C6Feim+5RI=;
	b=hXFFhprN1JjZEqwW7xg98XrcTJeZmRpYft7LwfbieUbW+m4ECXvchSjkz7Tl6mVaeWX6
	 6tszzs2vTduBy385DLaq1UVGcdI/Uv23u0GYCy2kXA9bCqG3/EnWwjANG9hJokNwYaWo3
	 OoowT6aOR6c/d1gMVwOgG8QaH4gtbYAv6zMRgGbk/JqpzB0ZVO79HFWng3y76gLGmD7bm
	 YYqEywkJbl94hW5hh/1UBgGOx96pYiOiMpOvjv98gpHSp4J2U/wmO3do/w2XXzub2I1P/
	 k78g2cAcgFS6TQILe5qNHYOekubFpQaTMcH79h411EnJlXRZ8OcdLS1pgiwHsaDrA7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oxpD6u9r;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B77C606A8B0
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:14:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B77C606A8B0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oxpD6u9r
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so50378075e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 05:14:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794489295; x=1795094095; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l3qR4fbwmcH1ch8aJsFgigRVRt4HxyD2/C6Feim+5RI=;
        b=oxpD6u9r1PIdjZiJXIwCdj4PZnoYigiueu0k1eB5tnXI8EhoUmY4pXfe51EtUAnFNj
         atmBKHNaEUrIjdL1kRTPepktv7bBpma5C5deNxi4g2TsrIPAdNKmAlXoDtioWGXB0PgK
         2E1QvvSKa2hqf9WsTEGC5R67UqyA1LP9QBg2KuJB8dkz1iMPK+wu4UE/QJi2uGycL0Op
         xLuSWuEbyQTxgeVoaSZ5gONzsPAgpWozuxYaEpwoavwH7bTwqXSGZqhJF9lUrhFHXuSm
         n9i0ro0Wi1SD8hAUOgGu/9uBJB4LnRWGrEIrJP1QPNmlI3MYTmpMMDbu1W15eYAntCV/
         eLQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794489295; x=1795094095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l3qR4fbwmcH1ch8aJsFgigRVRt4HxyD2/C6Feim+5RI=;
        b=Ym2VjQ9ON5TILqp0YrmRVQ48g8t+5yY6TuBwGvTg4UCKDjXQaY8IZEyoQLPAN05IHt
         091mkmgmhPoq759gX5wDdojjSb8QuIZQNRbOn5jZFIdSrRmGjaC20r4u6Vb0dnM4+3PC
         8RIfvomgAaCUO/VKCN5dNqFn9HD0vAUEv8wsRY0Mr7LDRFsWtWcIUl5fU2NxRESIkDTo
         enn32qwBh2B5I4nr90g7OX9D7MRnIJ4QlIfYl6XZFNepWXZbRuYUiludwMi0LFrHw2Pj
         YvufmRuYezWMnRBMVyNfEnwN19fSI3qsJJR5jsS/WjjgVYQ1bCrFq1kyzLQ6LvurINJm
         9NfQ==
X-Forwarded-Encrypted: i=1; AL+hErE5bN5km7760WV239OMOBCuhUGxD3cUsohYA4UWXiK6uoHAdNH2M+De5HI+WKWLAIgKgOklSX+zRJDE1so=@vger.kernel.org
X-Gm-Message-State: APuU4Z+gfbEISIBAgcmfrBmkjW8ppD7lHTta4IQ9msaOtmvDMkQHBspr
	MXxdEDrvJOvpIZFeFTlCR1CD71d4TPHef1h8MhgczNbbUjRo+qe5nu7G
X-Gm-Gg: AYBFou3uXQKsfauV9hbyDPYOyO+R+Len+FMIxmMOSF3yUT5FTy8mweA7M8pWrzSqEtf
	xs7U6FYeIn4aEVUJwDcYuD//mAsxZaIOKajUiE3fAMxMKIDy8hmaAFaiaFGfS6iK+lQHUNyYzFG
	hL4JZdWnvS0QZPriuiC8V7BNKOb8KX3PcomAD2DEZFBFH6aHSPtsGWt3Y2GHrxpB1ZSqK3QpDs8
	ivinoUoN7nMY14cnJlHudP0vAl8qytGQUBqY47HWpG15T5UfiHmnFLzdBBan/VICfBNGaR2qaVo
	MCxR13EUEly6pPiZE4uTWK6LxxBue3G6mkCM/wDT0qcqm5ZvgQ5dGzR2HZNgNRVKu6uivt3Y+I6
	UXY0P2OUEPTtK8wKMB1XJWhjFgQr1krwMwChUX8g6uUpIt5x5D7bvFPlljSIrGJJd8PmArQEUvr
	KMiLdeBxKsb3hxAkHS4KaH1VGze+fTJVAwolAF3gSxcOMraTEJ5Z2b7ETIJyxRBgbbEMB3PGB2T
	8P9lQr7oPjCFdI7PFfi/mo6SPbZaOrNFy4MT6/9so+mru1n0rMZGLFN7X/bvrBNcgTlRnTrL49X
	BU/HncOj7RiPp0FEbZ3GZAyNcO45sF3vSWygp6OGi6XiZof+OVlVKNk995PRS+PQZviB2qkick1
	rkGFmK1grbp0kTFqtkW9QVFuBuUKVqY0DKvMDgo7zV+os38LCtxb+tKiGeYtB0xfyDxQ0C8ppYw
	==
X-Received: by 2002:a05:600c:3e8f:b0:4b2:2ec5:8a2b with SMTP id 5b1f17b1804b1-4ba0936c927mr96232865e9.10.1794489294531;
        Thu, 12 Nov 2026 05:14:54 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (host-212-171-11-167.retail.telecomitalia.it. [212.171.11.167])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4ba0951fe22sm146453225e9.3.2026.11.12.05.14.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 05:14:54 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Russell King <linux@armlinux.org.uk>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH net-next 2/2] net: phy: fix trivial whitespace/format issue
Date: Thu, 12 Nov 2026 14:13:57 +0100
Message-ID: <20261112131358.106442-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261112131358.106442-1-ansuelsmth@gmail.com>
References: <20261112131358.106442-1-ansuelsmth@gmail.com>
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

Running checkpatch on phylink code, points out some trivial issue with
whitespace instead of tab, if-else condition with a return in the if
condition and manually printing the function name instead of using
__func__.

Fix all of these trivial issue to mute checkpatch warning.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phylink.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index bf1962e572f8..e7734e45376c 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -3151,7 +3151,7 @@ int phylink_ethtool_ksettings_get(struct phylink *pl,
 EXPORT_SYMBOL_GPL(phylink_ethtool_ksettings_get);
 
 static bool phylink_validate_pcs_inband_autoneg(struct phylink *pl,
-					        phy_interface_t interface,
+						phy_interface_t interface,
 						unsigned long *adv)
 {
 	unsigned int inband = phylink_inband_caps(pl, interface);
@@ -4080,12 +4080,12 @@ static int phylink_sfp_module_start(void *upstream)
 	if (pl->phydev) {
 		phy_start(pl->phydev);
 		return 0;
-	} else {
-		ret = phylink_add_sfp_mod_port(pl);
-		if (ret)
-			return ret;
 	}
 
+	ret = phylink_add_sfp_mod_port(pl);
+	if (ret)
+		return ret;
+
 	/* If the module may have a PHY but we didn't detect one we
 	 * need to configure the MAC here.
 	 */
@@ -4207,6 +4207,7 @@ void phylink_resolve_c73(struct phylink_link_state *state)
 
 	for (i = 0; i < ARRAY_SIZE(phylink_c73_priority_resolution); i++) {
 		int bit = phylink_c73_priority_resolution[i].bit;
+
 		if (linkmode_test_bit(bit, state->advertising) &&
 		    linkmode_test_bit(bit, state->lp_advertising))
 			break;
@@ -4635,7 +4636,8 @@ void phylink_replay_link_end(struct phylink *pl)
 
 	if (WARN(!test_bit(PHYLINK_DISABLE_REPLAY,
 			   &pl->phylink_disable_state),
-		 "phylink_replay_link_end() called without a prior phylink_replay_link_begin()\n"))
+		 "%s called without a prior phylink_replay_link_begin()\n",
+		 __func__))
 		return;
 
 	pl->force_major_config = true;
-- 
2.55.0

