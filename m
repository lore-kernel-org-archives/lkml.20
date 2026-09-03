Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0561D4A5ED0
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 12:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788439022; cv=none; b=KBZcWSnK5w5tYkgMi0BA3EIN2ANJLFPuvPewPrQjrOvq3K1Ov+Cf4zJ0Ye5HT/bA8q8jr5/m2qtDEBKwdeH5DikgwmGxn1nZNAE1O4q3tt3VHX44GiA64QeXmMdT+9V5bcwWXu/xd5mYluUOgBNf/l/rugAf8ppvT5SHVZtalG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788439022; c=relaxed/simple;
	bh=2kqKYR1QUDhefQ9mtzEn4vrDPiegHctkgB7rCH0dTq8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=owuh9o7nAgP9s0tfClX9UB0435Tu3RuRCapwVL0OPEilN7YTM1DeGgZKX21zFqjfNwYXzIKtXrYzThgKjumO64KLJfjfwwYxXbNdGpyOSToKiIno9BKKAJ08rZ/ihP22H8JbnwrPfBmmbf7zdE8ex3dCjcNfu+UvWMyaWi91qqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=Bk2bCKt1; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="Bk2bCKt1"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so2204906f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 05:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1788439015; x=1789043815; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vCBxR++js24lbF6C7j/EAYfoUlbqxlXsgowc3cJHzVA=;
        b=Bk2bCKt1K3EamYdDQ0xWCH3FBDmcYz890ZevTPmvAAUD7yVqWEpuVE73qA/owJ51Fk
         1V3zeRVn+9U2DKFACDT7L518pvEIUxRtwaZZdRghwxYcEyEArNGYza3FKzJg02QWXN28
         Dwb/TlTrTB+dUByVX1YQ0Me4DJCtoSRSdffYDaOluA3EFG1iiKLGEOiFAExs+KnbY9/C
         aw98YDiXxV3zI8S3Zmv+i6VXxF8OOwXYN4zaj+ryhhyGTWmU7MHelwxkaBXFh9t5gSJ0
         zQ8W9418S1o7OAuWLgcM5xyhCf1tIqaMEBYVsEWijMIR+VG5/MsaAztr/i+2J7YIFKtZ
         n4LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788439015; x=1789043815;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vCBxR++js24lbF6C7j/EAYfoUlbqxlXsgowc3cJHzVA=;
        b=UJ6CJRLa4Q4hwfYBIj2muOWHC9ibLuX9Bo8SpG7Q1HGUkfR3mVlR/PbtvrrFDDtnnb
         ha7Awp0E83olWPU9Feir10GOm91rha1xENFfmokDIEE43+ZFKuhjhQlvZFjcgmrpXJhW
         m/nyKQMx2fRken88p2gqyYAmGaPeVBs1umINB1vkiXKebd3sJTjk5+WIIMv+QbSmcRw/
         mvS2WohRzkWm/wfYrxzWfX91SnowWduinFv6rNdmHtIsB/KpVX5zF48FIbHYZRznNdiU
         zYwfvBdY5mdlh3bHfpYXneFkYPFJgrpgz7dyKAhCFGdz06Ew7Z5NnuKFXMRWVt/KPSgP
         +v8g==
X-Forwarded-Encrypted: i=1; AKwUvBy07dHpxhOnZRM369QOK1cXEZ8aLXTnJzPCPucWrdtL7NaEiCDWyGO0lHz2qZJ2HpbDyAw+rvV96vYqsd8=@vger.kernel.org
X-Gm-Message-State: AFuF++kjvqWz2kT3kAXpByMxl9TQSLTzyMuXV9JQoVk0ExvUjaW8i//e
	7PKirO1t1+JOD9FuSRD00aqMErSyGibC8QxP4P7l1Iy3FPzGACs+0sPw5Bk6lsK0IZE=
X-Gm-Gg: AYBFou2HbVWWbAXIxld8F9aXwhf6V9fDQHhdWWd04MTOcgookuiqSOS1YHCRZdIuTOx
	GRK8BUh6O5nPD9bWRzI4sUqtyWNDY1f40ryyRhp6x42hdRXf7dehLny9oCrjmEdhbYPEhNN8zk8
	dMFaF8ioDv7bE/UiOigg7LF2+X/Hu4su5+c+BXHfVhGgCEV48OXM4K7XEsO7jlzDyGharLreWaQ
	4SM0he8LSI5fCSfWkjrR4UI94MXLmAq9fK/PjKoGi2w9bpnh0/KPIXoGtJ+JgGvIXvCAWbW4o3G
	wEPITKcuh8AgcJSFMusHmgvANX6jfojcXiFYCufhX7yECNdNeqWe+liAREc2Mi/Nbl+ej2goYpS
	zNAFTl6lGC0fFolLpzex7BWrIHN+Qxkwi2Q0ntX7q1jQymt+6522reAVbWxhh9Eg1TY4k3sdASF
	9zD1aOQSLlWPvfvTMawTpYoi1HF7XOOvukxIBDBTVGdwX7UUEUFg==
X-Received: by 2002:adf:e196:0:b0:482:e451:6810 with SMTP id ffacd0b85a97d-48488dee050mr25646457f8f.1.1788439015587;
        Thu, 03 Sep 2026 05:36:55 -0700 (PDT)
Received: from remote-01 ([84.17.55.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448ed2edfsm13223248f8f.23.2026.09.03.05.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 05:36:55 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: "Th\u00e9o Lebrun" <theo.lebrun@bootlin.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	Vineeth Karumanchi <vineeth.karumanchi@amd.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2 1/2] net: macb: zero the link settings taprio reads back
Date: Thu,  3 Sep 2026 12:36:51 +0000
Message-ID: <20260903123652.23900-2-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260903123652.23900-1-f@lex.la>
References: <20260903123652.23900-1-f@lex.la>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

macb_taprio_setup_replace() calls phylink_ethtool_ksettings_get() with
an uninitialised kset, and kset is not only an out-parameter. On a
fixed link, or an in-band link with no PHY, phylink writes speed and
duplex only if kset->base.rate_matching already reads RATE_MATCH_NONE,
a field it never writes itself; in PHY mode before the PHY is attached
it writes port and supported and nothing more. Either way the speed
read back afterwards can be stack garbage. The ethtool core zeroes the
structure on every path into the op, which is why its callers never
see this; taprio is the only in-kernel caller passing its own variable.

Fixes: 89934dbf169e ("net: macb: Add TAPRIO traffic scheduling support")
Assisted-by: LLM
Signed-off-by: Aleksei Sviridkin <f@lex.la>
---
v2: message rewritten, declaration in reverse xmas tree order (Théo
    Lebrun).

 drivers/net/ethernet/cadence/macb_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index 76ee4f506033..61838084989a 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -4295,9 +4295,9 @@ static int macb_taprio_setup_replace(struct net_device *netdev,
 	u64 total_on_time = 0, start_time_sec = 0, start_time = conf->base_time;
 	u32 configured_queues = 0, speed = 0, start_time_nsec;
 	struct macb_queue_enst_config *enst_queue;
-	struct tc_taprio_sched_entry *entry;
+	struct ethtool_link_ksettings kset = {};
 	struct macb *bp = netdev_priv(netdev);
-	struct ethtool_link_ksettings kset;
+	struct tc_taprio_sched_entry *entry;
 	struct macb_queue *queue;
 	u32 queue_mask;
 	u8 queue_id;
-- 
2.53.0

