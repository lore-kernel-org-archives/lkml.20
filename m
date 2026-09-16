Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF6A34B8288
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 16:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789577028; cv=none; b=kX82UOj9EnAeW7XyfK/SOtthZLJkwN8q6bqQlxCjrwx6xt0AfnwdPxBXzDLVndBH0hbMJUycRTmUMcGN5p6OBOvnDTWrNkVz/GBprz5G3blqeJHaT5QLm21Jve/1h/8DLrMC6vvf97v1UVIDnZTCd2PHe8D2odnMmBbHI0siZz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789577028; c=relaxed/simple;
	bh=t2Rh5HicDYfUhDshXxIV+ToBVIxCOdkpflXNAhRUTLk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Tn4zs0hVL1i/JzHFQy7zKvK+WSvrJVRWESqiNdK52O/GKvMDC8X+dlLh6bRsor42+crUR+yRttOFwn1oiMOgG9sZ6UNO0nFVVcY6pfuSjK+OI7efl+L7/WG2+N5IY3imlkcctoMXoRJCz6wyKLofk1viOMQXXoCNeB1e1Enu8wA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cnNC+Fwn; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cnNC+Fwn"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc4c3304784so945992a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789577012; x=1790181812; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NmX2iathH1BothbInV/Ke+WVEC5Ed3SbwmWKrISd/bc=;
        b=cnNC+FwnmKWQBGu3rsYm6gCf2VEbURC9FHJPg/dKZoE327N9gZbHwRK16MaxFr2roz
         uYIYkHlb4n/ocvvhmAkPoqX2U3CIEEdhExk4uBsRsPNA55S2dDp6xoQTEuMWLdB3bTup
         D1RghBbs77ROPmYu1iNL6AqKwsr/Gni+vVSnXTej2Np4LxrULqbP8iJeei0ZS91vcdRU
         NgczjKaeYjJJGsGHuSCYESKZNPORhil6gVMMVRBFEr85z/WXJPbca5S1TebpcrgfBDyn
         zEQZT99qIHJZVsL7qMJitCc8b91EivrMUF2cJE0iLrYveV524CvOY/Ll4uaCjYb8lhse
         LxQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789577012; x=1790181812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NmX2iathH1BothbInV/Ke+WVEC5Ed3SbwmWKrISd/bc=;
        b=AiZSUJsO65LDgD52v0Crm2mFjJRZJxtTu+C9XaSN4ttM9daKLA7wmWjRcBnhpcomg1
         4gA0YW73oGl/ZWEj8evXN/r3T/BmOYaxkh8sxvsy5DS+CW+vecsD4PcQ+HuZCbDryfZ/
         xJNt8XgszqEi7dyr26GYN92N0vnrlMEQvhPmPtRFmfy96rpXwr8yCjQNMsmkBnFnWX8u
         TyBRLjwUIF3AU0CdBECOiQ2sqey4mAbF1KUfBijJ4yqrOsZsSh59AeMSgWnMAASu0xrp
         VIFnvcPNr2VJsNJIknlIj2Kw4N+eb9D9Nh7ePjxg+mqkCfLrgtE9s+0oiW5LZdd0V3cx
         k5EQ==
X-Forwarded-Encrypted: i=1; AKwUvByujrqrgvbr+g4ENj0kJ5gcZjMSvt1TvOpmqyRiox7LDMFT37GtklUe3bqLF17KGCKKgNUTbGWlu5OWIDE=@vger.kernel.org
X-Gm-Message-State: AFuF++nAqQM57fx/xcOtu0Xf+0yABKJUbOtLdPNCJjihJn326XztPP9G
	6nc17cL02vnNihgs8cPsHPsfLcQ4vycqc4Jv4Suzfh3S7VUYI1fXsm7M
X-Gm-Gg: AYBFou2t0mcCRTiZLwDv6tCPzVW6zCfeAnwSZO6P5vTKZNO73NHNXfTlqONuUcI4sZf
	1mmISzxt2MnXp04FXrcQtF6h/xUqTU7ZjM49EGVJtiSZ7rryudhBgAVg+K/YHYPhOGZ5aII1oQg
	sVlCU+vuYhS2UTLgkLtr1ExGwRauvP8IWL75boe2T2KgXUxF4+rCAdKaZ+ZDPk1aG+eMDgav/dj
	12+Mexm9JP3uftOS/3lRdAvzaN8Dk44XpeXW2oeVLfis72yh8Zgn0JzDUKthrhhpS18+duszBN4
	cFP1nTY9/0DHh/xHpHV+RfFQofHiUnZhtvqlNRzv36v6gwfkq9w8emyDECdp66swbxokpfHmcVC
	3pM9PJ79jVbdm5quyGsgaK7Yb3lQtY7nEJl3MuzDmXWe7ANgasbhoZIgwwc2K/fejTG7Vukv2L1
	bw0aLaobwiMOYv9Trr0cf6Ga6Ii7Fh0i+wfKvy9l1fi6NrXA3IcOIr2yDrebuA2SKKqAO+eQxJt
	S1E+2I/MJwFh+jJExQAHcYZaA8=
X-Received: by 2002:a05:6a20:3d8b:b0:3da:b761:80c0 with SMTP id adf61e73a8af0-3dd5f5c7a4amr10074959637.14.1789577011577;
        Wed, 16 Sep 2026 09:43:31 -0700 (PDT)
Received: from d.home.yangfl.dn42 ([2a09:bac5:661a:1232::1d0:c5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50acc757csm1902278a12.32.2026.09.16.09.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 09:43:31 -0700 (PDT)
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
Subject: [PATCH net-next v2 1/8] net: dsa: motorcomm: Remove YT921X_PORT_MASK_* macros
Date: Thu, 17 Sep 2026 00:43:01 +0800
Message-ID: <20260916164310.3168269-2-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260916164310.3168269-1-mmyangfl@gmail.com>
References: <20260916164310.3168269-1-mmyangfl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove YT921X_PORT_MASK_* macros since they are only thin wrappers
around BIT() and GENMASK() and are not used in other places (plain BIT()
and GENMASK() are used there). No functional change.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/dsa/motorcomm/chip.c | 31 +++++++++++++------------------
 1 file changed, 13 insertions(+), 18 deletions(-)

diff --git a/drivers/net/dsa/motorcomm/chip.c b/drivers/net/dsa/motorcomm/chip.c
index d663af010f43..5acd7d27ff40 100644
--- a/drivers/net/dsa/motorcomm/chip.c
+++ b/drivers/net/dsa/motorcomm/chip.c
@@ -108,46 +108,41 @@ struct yt921x_info {
 	u16 external_mask;
 };
 
-#define YT921X_PORT_MASK_INTn(port)	BIT(port)
-#define YT921X_PORT_MASK_INT0_n(n)	GENMASK((n) - 1, 0)
-#define YT921X_PORT_MASK_EXT0		BIT(8)
-#define YT921X_PORT_MASK_EXT1		BIT(9)
-
 static const struct yt921x_info yt921x_infos[] = {
 	{
 		"YT9215SC", YT9215_MAJOR, 1, 0,
-		YT921X_PORT_MASK_INT0_n(5),
-		YT921X_PORT_MASK_EXT0 | YT921X_PORT_MASK_EXT1,
+		GENMASK(4, 0),
+		BIT(8) | BIT(9),
 	},
 	{
 		"YT9215S", YT9215_MAJOR, 2, 0,
-		YT921X_PORT_MASK_INT0_n(5),
-		YT921X_PORT_MASK_EXT0 | YT921X_PORT_MASK_EXT1,
+		GENMASK(4, 0),
+		BIT(8) | BIT(9),
 	},
 	{
 		"YT9215RB", YT9215_MAJOR, 3, 0,
-		YT921X_PORT_MASK_INT0_n(5),
-		YT921X_PORT_MASK_EXT0 | YT921X_PORT_MASK_EXT1,
+		GENMASK(4, 0),
+		BIT(8) | BIT(9),
 	},
 	{
 		"YT9214NB", YT9215_MAJOR, 3, 2,
-		YT921X_PORT_MASK_INTn(1) | YT921X_PORT_MASK_INTn(3),
-		YT921X_PORT_MASK_EXT0 | YT921X_PORT_MASK_EXT1,
+		BIT(1) | BIT(3),
+		BIT(8) | BIT(9),
 	},
 	{
 		"YT9213NB", YT9215_MAJOR, 3, 3,
-		YT921X_PORT_MASK_INTn(1) | YT921X_PORT_MASK_INTn(3),
-		YT921X_PORT_MASK_EXT1,
+		BIT(1) | BIT(3),
+		BIT(9),
 	},
 	{
 		"YT9218N", YT9218_MAJOR, 0, 0,
-		YT921X_PORT_MASK_INT0_n(8),
+		GENMASK(7, 0),
 		0,
 	},
 	{
 		"YT9218MB", YT9218_MAJOR, 1, 0,
-		YT921X_PORT_MASK_INT0_n(8),
-		YT921X_PORT_MASK_EXT0 | YT921X_PORT_MASK_EXT1,
+		GENMASK(7, 0),
+		BIT(8) | BIT(9),
 	},
 	{}
 };
-- 
2.53.0

