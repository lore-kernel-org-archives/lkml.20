Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9203A7198
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 06:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788763435; cv=none; b=Z8qX+j2dEaTkr3U0LtqIozxRbbkezVJZqjuehTpyJrPZnxxLSs37i6APmPwtLF1gZR2epyCtXwCNuqZq+/bviMqcvPKgEnWmlpe4xezaOhdk/mgavlZUoQB7Xoe8jhpXHFV4SdPnAA8O7ud2pwbNq8/lompWc1qddp+F1Zm3OiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788763435; c=relaxed/simple;
	bh=YSOgfYZSp8SrbWiZSUofEBzDTvr3+SvBNc0tqAr8jTA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ao/58KHkKwQ2CToFkq+nrUzy0sBJDe0mVLZRcK3IuWfoZk0Z3BlJijMWr6OP2pU6z3YyRSGkJmicDI1YoBhpDRpcBfV82ZZRUUVrHX2c8CjoThss43YpoMrtYeKU+xEXgJyJcL4NCAIFoaVUIONyS4Xotp+wGhFNm8VE4hub5zQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OaUQXxa0; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OaUQXxa0"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cc328b43a56so2611202a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 23:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788763433; x=1789368233; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8CFZlOFvP6r7OTGSRxMmbvfbXTssOe5ta1IwHi1yqgQ=;
        b=OaUQXxa084JHSuiWVj2ZvhicYKuepXIcxzGM5hMiYUJ9EvoUJ3GETU7lBckenl/orf
         RL+FxwfSg2F1Fj2vARl8IFJDqu4xhZPpgHz9p+FrmvJn6DM+U+U4xDYyOU7X5PMJiP9u
         0wcTeWAwJK1yog4FxopuET5g4laryRb6LENvNqbgz+b2f3mIsGHGRKaYguvf4SvQqaFK
         lmVo9jM7LNXh7q+lutYSuFe4+fMFv8yfge2qERbxerxgYBFhyHqb4x8aA2aHDuxcm1oD
         dbKrDnveiMyrLYLL+CU5+hVLMxWZAP/xHse0tJ31dsY4I9xriObh+HbJma7EvBtXVytm
         seJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788763433; x=1789368233;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8CFZlOFvP6r7OTGSRxMmbvfbXTssOe5ta1IwHi1yqgQ=;
        b=gKbSP2J4XElikQJjs8RLkRTgBsHoB6VtNNGIOXWvMccdXK3Eh5nTKViDcUE252NSpf
         YJOn/rcOz0F3hA/ulBqSPynUyMWOyZuLEz4Onsuf08lMi5AV54oXOLSbu4CtMLwYDnzg
         QX6d1omJSR73azgQoyHiDPw5b0OCrRSylTVjjWUya5dnt4tmGNsImO/1Wf4zp2ysj9cC
         eoy8FPU0KMzatB+SplYWyEZ/JVvmkvgKkWF0ABFEElj1Hx5Pq+7tG55G3lneijEjDrf5
         cetSaSPB0a1Ew8Vfig1Hb6j0P1SKNwwyQINumPhpZGcApny5knZ12CEwypLZ6O1onyQC
         rP5w==
X-Forwarded-Encrypted: i=1; AKwUvBzFeJflD7Ix9a1XoIz6ALOlTKtvQ28KLSIhcoijB2oGyloY8qTdy5aL7Dd8hDdEMXR05OadRjieUHuNkos=@vger.kernel.org
X-Gm-Message-State: AFuF++n+DusrL+J1bjksYiUwxHSaNNLIX3Fi751iwSvb6sxUM0onEq5O
	hJGijtgzJR7pebl7SrWjFc3xyGpSTnzNoPLq1GapTO2guCVTrxOfTRye
X-Gm-Gg: AYBFou2g+OVL2cA2Jl6yKn4B7jsoGmRjJLgg1npQBXh2xymGyRX0wZqViFggd8uKJd3
	L48gYWDngMDRMIN3P9re+h6q07QNKrE6uUUFdZZc1OXTKueBEAXzpe5y52Ruvjwxq/ggU/jFjXx
	uHHr6yrQFnVWJsnTAiYltDW0HBIUzFuaSVJgpwPCT6/3jnw5u4AnK/LcjiRKjg7A+zb1DYbegQR
	U5LNrh64lELTk93cwoE1DkLCoI+dZUSdqLD7TmeKR2LMB+lGcrcStHXI6B7Pm92I0WE6bU2CmpB
	UKlHVsqq6hZ45jtyt4w4/1exlobo3q3CH9S6ctmdqZ1n06ubS4Ai+Rxd4HF/FrZiJW0zRIWFSDB
	+Cv9WK7/ppsiIKC5pdQESh7Px0P/XJ6/vD5kyAC3RtocmkzTycQg5CRIMEr0Q9IEUiP1o4vK+A9
	xzaYVfkgbcCVbnzWrvLBwU/rkyv5U6/O3rR1MROZb8qHB8CwXljaSscbeYXtV+SSZVk7xAs6Jwe
	1LZVOSKI48X0A==
X-Received: by 2002:a05:6a20:9e4e:b0:3d3:ae40:51e0 with SMTP id adf61e73a8af0-3da3a045196mr32280359637.20.1788763433116;
        Sun, 06 Sep 2026 23:43:53 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339af25062sm39367339eec.16.2026.09.06.23.43.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:43:52 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Alexander Aring <alex.aring@gmail.com>,
	Stefan Schmidt <stefan@datenfreihafen.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>
Cc: linux-wpan@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] net: fix typos in comments
Date: Mon,  7 Sep 2026 12:13:46 +0530
Message-ID: <20260907064346.3288-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/net/ieee802154/at86rf230.c | 2 +-
 net/mac802154/iface.c              | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ieee802154/at86rf230.c b/drivers/net/ieee802154/at86rf230.c
index 6156cf379916..f1adca942e3d 100644
--- a/drivers/net/ieee802154/at86rf230.c
+++ b/drivers/net/ieee802154/at86rf230.c
@@ -1370,7 +1370,7 @@ static int at86rf230_hw_init(struct at86rf230_local *lp, u8 xtal_trim)
 	 *	  but this is different on each board setup. You need to fine
 	 *	  tuning this value via CTRIM.
 	 * CTRIM = variable capacitor setting. Resolution is 0.3 pF range is
-	 *	   0 pF upto 4.5 pF.
+	 *	   0 pF up to 4.5 pF.
 	 *
 	 * Examples:
 	 * atben transceiver:
diff --git a/net/mac802154/iface.c b/net/mac802154/iface.c
index b823720630e7..ff6e99257bc8 100644
--- a/net/mac802154/iface.c
+++ b/net/mac802154/iface.c
@@ -521,7 +521,7 @@ static void ieee802154_if_setup(struct net_device *dev)
 
 	/* Let hard_header_len set to IEEE802154_MIN_HEADER_LEN. AF_PACKET
 	 * will not send frames without any payload, but ack frames
-	 * has no payload, so substract one that we can send a 3 bytes
+	 * has no payload, so subtract one that we can send a 3 bytes
 	 * frame. The xmit callback assumes at least a hard header where two
 	 * bytes fc and sequence field are set.
 	 */
-- 
2.48.1

