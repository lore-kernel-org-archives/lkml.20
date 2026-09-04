Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9004517BC3
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 18:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788548149; cv=none; b=JYvD+Frdatc4s8nNpapUdtKUfrSTMxQqqOmOhDBhuFiGS6tHok9dRp+4qsSOyjNZvoDhM6bMqWXAsO1iGejdugfLGdurdbmHaBbJtpJbPMxEs07GObQvcaWJK1sDp8UEsq57KJMmwUaMng//JyX4l/sTwg/5UWH1m6/CdzaZEGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788548149; c=relaxed/simple;
	bh=0NORGIkug1vpAvzWXIzBHkSvbxPib6PIHpFRP5Q7Op0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TlvoQvBN3TNIjGtOOgBhHupGP3O4ogGzvndQnzLvKZknKz/ThXOoWZ/js11yNTme/KXWi7cNyrapgBR7N/+Fx5otxPJ5PpoNpP1QLdEUSt3jWUl/Fw9AuohzhDIt7F4sPmEHiNvrrivZ4XggSg6s1SG+YuFbZXHyPsdDMkmD2t4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=kyzONtvo; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="kyzONtvo"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49b0d78a801so13136615e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 11:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1788548146; x=1789152946; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=770Nkcotd4mXRhWdRLFuBCumpZlPw+psjVw7wcTW4Fg=;
        b=kyzONtvohE/icR0rf2joY+yH7xsM2DrOWvSliBbQFPg4ouzaO8qGCL9/ws3c0Yoocf
         wn3SMAG08vIgtoQzi58Pnnx1pxmw7KA5dal/jfaRL3+euwh8KqAqa7rUgeFP0FX7S3ih
         e+m+VTWoXbWgvgpwPrTg4L1DA1bOw4P3ey+j7u45H0CrgSSMFZG/Q6DD1QyhWAkiJHCU
         EIgd7Hr2wSPfi6TPLDztLOhQ9ytiyHkzjp/DMN46qQs3+11Bo9xWEHCbcAQ0BId8e+3t
         0s8JzBfAvx7knC8BztjEKLgxsK0N3x4QNd8Bjs18tI0d0x8e+EsBE+SBkrEnnTgRPTMP
         ckxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788548146; x=1789152946;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=770Nkcotd4mXRhWdRLFuBCumpZlPw+psjVw7wcTW4Fg=;
        b=ANeYnID9JM3RQLnNtueEd59N6rWAF8RhbgDHg9l1LzNZnt5J42Wd1WvxwInVysz+t4
         peBY22urOhKH3w0yDEhcGc9hobOH90kc4+nk5lTwRy+S3V2pU1M7bXKZVpGec8Z0LB6P
         jRE+51t48HdxdTR/r2KgyOkWsNegaBchQUlV5/8ERVjtV3TPqmMBMfiBnt4OcAbuqnth
         FpG0aY7PhP/7EwlL7SpL4QzejvZujk9H7LUZQi1D6leaJRwe9FiQUU17nh4HHRPRg6qW
         FlpHomMhM0wMWyWPyo4Gu/TcAinPzWuRdzFlBdxpNILGlxqs6TCOuYBvIahlKKEj77c6
         gaGA==
X-Forwarded-Encrypted: i=1; AKwUvBwWszesAfJnJe0MwCstRHWbd2+EZith4S+LTjmXWo+f7voLlH1huG82wMrI6i4lmQeRJmLAEbM/rin9Kp4=@vger.kernel.org
X-Gm-Message-State: AFuF++lH3HoJ8uOOwHrSRVjACNN4CEdaGV0Wsj8lNo2jer5tFu0KrarL
	jFgh/eJdtvqJ/H98Iw+gOalRaYKT62LrUGz87L55DFH5lD1PRrwSM6qfPHqOEZraUvI=
X-Gm-Gg: AYBFou0CV6f/szLt90EFl4CmFnyJJxh3dpftX4p77e8mmkc+bg4hYIssPnI6D1u837m
	IdRMVinHhl4lHE1tTnzd5meiuT6itLtoMSVpGilEsCKjo1pXy9G34r06W/t51Y4t+580mgEct3o
	HPYqv9eUZcqGPWG2kjs89YHa4IPhv2iGgXoUeR6Xx2pyLlffhRZtRzSIdoJcAPtkS7LCfo5zKyG
	HnYa4+pQ1+4Q3WAWbVr7qdaMd4tRN9Af1sJXT5VkhcQlaJAiIqzGeQhQhowv45D37Ureykd74Qc
	9hhBOnzWXjA/UfC5/seXK9Ieht1OdEBtN5f9FA0Z23LawM+l0CMs8XYWXN9SFPgB8+feEZiQonB
	FMEweUyONF99eddQ3PZ/ybQ6rMf/aS9AazB1lCFXRYWWmwgh4p0HY7nR3aSqsj9756GL3Pq3L3X
	rileFrR6sGT66gp7OLnCVzpr+bn5/wTDUJ7Vdf0js=
X-Received: by 2002:a05:600c:19cf:b0:499:726a:a017 with SMTP id 5b1f17b1804b1-49cf7fe601bmr74931135e9.1.1788548145720;
        Fri, 04 Sep 2026 11:55:45 -0700 (PDT)
Received: from remote-01 ([84.17.55.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cfd3f815bsm40176455e9.4.2026.09.04.11.55.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 11:55:45 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Vladimir Oltean <vladimir.oltean@nxp.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] net: phylink: initialise link_state before a forced major config
Date: Fri,  4 Sep 2026 18:55:40 +0000
Message-ID: <20260904185540.2844261-1-f@lex.la>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

phylink_resolve() leaves link_state on the stack unpopulated on its
disable and link-failed branches, which set only link_state.link.
phylink_apply_manual_flow() then reads the struct's advertising on
every mode but MLO_AN_FIXED, and has done so since long before
force_major_config existed.

force_major_config turns that into a write to the hardware. It is the
only trigger for the major-config block that does not require
mac_config, so phylink_major_config() programs the MAC for whatever
the stack held, a zeroed interface is PHY_INTERFACE_MODE_NA, and the
write-back stores it in pl->link_config.interface.

phylink_replay_link_end() is the only in-tree setter, and
sja1105_static_config_reload() calls it for every port that has a
phylink instance, regardless of admin state. On a stopped port
phylink_run_resolve() no-ops, so the flag outlives the call. The next
resolve consumes it whatever branch it takes; an unpopulated branch is
where that does damage.

Found while developing a series that attaches a late PHY from a
delayed work item and sets this flag there, so the PHY attached after
its port was already up. The link stayed down until the port was
cycled 29 minutes later. With this patch on the same board the same
attach programs the MAC for 2500base-x rather than unknown, and the
PHY's interrupt fires without a port bounce where it had stayed at
zero throughout the failure.

Fixes: 96969b132bf1 ("net: phylink: introduce helpers for replaying link callbacks")
Assisted-by: LLM
Signed-off-by: Aleksei Sviridkin <f@lex.la>
---
 drivers/net/phy/phylink.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 3ec3bb439109..a1458da8111b 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -1630,8 +1630,10 @@ static void phylink_resolve(struct work_struct *w)
 
 	if (pl->phylink_disable_state) {
 		pl->link_failed = false;
+		link_state = pl->link_config;
 		link_state.link = false;
 	} else if (pl->link_failed) {
+		link_state = pl->link_config;
 		link_state.link = false;
 		retrigger = true;
 	} else if (pl->act_link_an_mode == MLO_AN_FIXED) {

base-commit: 641d03105cc0d2437e32fdeec164f91a4ccef6c4
-- 
2.53.0

