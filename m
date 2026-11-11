Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794371180;
	b=PpEGhjK0urUsPzJwFbUy2so9jVKj2ido9EGfRSCaiI0qIhtmZvJ11dYGa1hlJc//yl2W
	 ct8y39oraRgUmLcuLApXpSuZWVEPsKSPjXCmD9yZhHNH6uooEyZEHQjE8RXoEQjE/DSgY
	 4ktk/Q/Tbcr1AzLS4ym/DFyowYRWkMYHlvBxdrV1egXway0odp16VJR1REN1/j3Tz3Ucg
	 6gEJP6L1KfrQ/wP9GuyUYL/7B2h7x0x4cqB56WBhJA3NXPBVzOGjVvHcm8T1qHhBXzjqh
	 ZO4XyzysB+aDMdcAftrniwyMNXJqseiQYfhsbS+rW1UjjVg5SFoviBmaEconO6jOYKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794371180;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Tmzfpg6A1lWSLXkefdS+xUfOhUACBkOM2E4iCYYamNw=;
	b=0OKv6+SJM4K/wyhPFhoHYr0Si8cCIm/UVfQ611IVdyCHnhQQ0UoKZB7WOcqkuwNwaR2K
	 yHmUtIBkEHJf6FG7qe9w0cYtDj5tMKoxFOE4Ya0pi1HhHSSpOsrfgfNE3tVS8QJh9DIdR
	 FJtuXRxf29cAHhx6IzGaXv94/ZxtSEed52TUT5lhOUfRdIwGs/HUbhXL+TnT6LPxm+8FC
	 SvnD+YbrDtT7j50DPqGuI82DhZVVdEQrWUnele7VIoz0LBNKRLKWFoPY6Pn3I1D7oukY1
	 oyKQOGnZMd6m70WRPs0xxVdQcq/R00GDFWs4bMPL9SfS498HILvQ30dG4cFM2Dxb6XQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SQ2Wnibv;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90CBC60A383A
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 04:26:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90CBC60A383A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SQ2Wnibv
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3b08cf16decso1812602a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 20:26:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794371179; x=1794975979; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tmzfpg6A1lWSLXkefdS+xUfOhUACBkOM2E4iCYYamNw=;
        b=SQ2WnibvnR6k9rn6ywG7p/z+QIyMVtY0crToDcKT9cLsIHHzdA9w2wIzcLlg79Uwll
         hVwa99umDpmZ9fsK3GSKbkHOAB++9YiQQ83M07FoCA5tIQI7rbae7eDNeLzttB4cf6rH
         2YwVdwGjTIegMBw/3U9Z1zSKxifPSn0H1or2sCa3BuOEOBTTdzto6QTFKZ3TzUn8jLJ/
         VzvKQGEjHgXzB+LmcvxFqV37sIBiSguiT2cZKkhcvYVH+HvRPPSMWeZJ3z15zmruWwq1
         tgidEV6LobWJqWvdJYWOZiULPvZb3LtulLFi6XeQNv2IQCRRvebvIoycAmBY9A+uUZ3/
         Helg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794371179; x=1794975979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tmzfpg6A1lWSLXkefdS+xUfOhUACBkOM2E4iCYYamNw=;
        b=qQfrTCKponMdrDLHES/7RxhCi3wbaJ0w8p5MtnJHYv2iBY98QKxlervbCtuyJJwFqM
         RjPBiKLDywScvAU3j8OEdkxyqBJIguh5urL3JzPA4iKkcCCqBG17hOGRNmlNzPsHzWYs
         sM/L+glZdQfia86TpzsVmeL5VxlCkbGJoICpr6mTgGQElmGnllVhOzQ+cwN6TBBal6N5
         eUWatZIVASfPbuY5sILIt/7LetvYZjI7CYnyLrfVRyAWahzNNDn8yV0D+TLzVLh7sFj5
         VXjiyuz307HK47RQsUSbvUMaktdqIDAGcYHEg/Q5X4NT9S1OxW11Epx5KFOr6Xc08iHh
         68Ew==
X-Forwarded-Encrypted: i=1; AL+hErHMc2ZkAl3tWfSsA5VcSYJhJhBD6NhDrGBKVlUyTTvznhXSohuLBJBXl3kr1pfGvY/LI62YtHTEvsmbAGM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9e4fyJrwYYi0KmNhs8hDqmVCI2SwkmYld8aBi7EYKIOtiGolDe
	9EGa5YPbyKoxN+Bgj/mk3DshWK6siSxRBZOCWBl2ngl/NYKqplLbzxdt
X-Gm-Gg: AYBFou3eGCXE+E3O5rOLJTHdNDbp9Qa1pEDcPmWV+D5z4wSZbQVGrWTngcbABzMrUzv
	OymGMzBxDOx4MjeLZCPAXQ/sUyQf41vy7jED24vgFsqU3vlL8WTgtTRnJJRqoenABMv8xq9F4wn
	Ps8Rph3yAkaQCGU9m7jjhIKrzDAtlGi65ksGe1jJGMIXWj8XVo8ZWJXMZU8+WvmlDFLXNKbAOz0
	S8zMUdVQ8yB2WA8A2DXJ4PjwzASjdBphmZgi1C0HZQedBSjB76cPVl4uEMZhHByuAFVG9p8sQfv
	ODaCfdjJM/yVmtO3qFqssLlhQQJLYPe2+dv2TZSGvWLJKo60ZdbLvVlZp6UOhJiv68z5WE+JkFF
	S1A9sxukNqsLkBVPH3CbUVkXrMfIi/RlL7/Aq7G9yGL6tLyBvt6ZjxSYseE3Uh0i4GyL5x8t1wU
	aMXl0kmfGJzu5qUR1dhbqI3gIryOpaIx//34YFYFdlEsJ5LhjMUhfekZhDmCr7aP8Lu87ZIqqs/
	AdKpqDJSKsZd/Md9GHng3rCBO6cVhmGl+89nfAZF4Ne4GemEDWsyw7qiKYXrktcEeAcMFhxwJeX
	ck3V7r4YRV8M5sYiV8nlU/PpRRLB2X+sJnXA1FiaJtZSb3p0uHHIW/6bd4RMdrPDcH7Nag8RMlB
	6QQxy/1PisA6F20YKFzydOZP41PuNL87PgUCOp41gCiwhacDyGWWwGGtLTxjf3Ep8JnYHeuC7xa
	7hUg==
X-Received: by 2002:a17:90b:4e8e:b0:3ae:8106:6074 with SMTP id 98e67ed59e1d1-3b182f66064mr1241539a91.16.1794371178951;
        Tue, 10 Nov 2026 20:26:18 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17db7df7csm2473927a91.11.2026.11.10.20.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 20:26:18 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless-next 6/7] wifi: brcmsmac: embed brcms_core in brcms_c_info
Date: Tue, 10 Nov 2026 20:25:53 -0800
Message-ID: <20261111042554.232998-7-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111042554.232998-1-rosenp@gmail.com>
References: <20261111042554.232998-1-rosenp@gmail.com>
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

There is only one struct brcms_core and it has the same lifetime as
struct brcms_c_info. Embed it directly instead of allocating it
separately, removing one kzalloc()/kfree() pair and its OOM error path.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c | 9 +--------
 drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h | 2 +-
 2 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
index bd1880e3738f..8c3048082fbb 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
@@ -421,7 +421,6 @@ static void brcms_c_detach_mfree(struct brcms_c_info *wlc)
 	kfree(wlc->bsscfg);
 	kfree(wlc->pub);
 	kfree(wlc->stf);
-	kfree(wlc->corestate);
 	kfree(wlc->hw);
 	if (wlc->beacon)
 		dev_kfree_skb_any(wlc->beacon);
@@ -471,12 +470,6 @@ brcms_c_attach_malloc(uint unit, uint *err, uint devid)
 		goto fail;
 	}
 
-	wlc->corestate = kzalloc_obj(*wlc->corestate, GFP_ATOMIC);
-	if (wlc->corestate == NULL) {
-		*err = 1026;
-		goto fail;
-	}
-
 	return wlc;
 
  fail:
@@ -7808,7 +7801,7 @@ brcms_c_attach(struct brcms_info *wl, struct bcma_device *core, uint unit,
 	pub = wlc->pub;
 
 	wlc->band = &wlc->bandstate[0];
-	wlc->core = wlc->corestate;
+	wlc->core = &wlc->corestate;
 	wlc->wl = wl;
 	pub->unit = unit;
 	pub->_piomode = piomode;
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h
index 266fe7825042..72720b9f9b35 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h
@@ -470,7 +470,7 @@ struct brcms_c_info {
 	/* multiband */
 	struct brcms_core *core;
 	struct brcms_band *band;
-	struct brcms_core *corestate;
+	struct brcms_core corestate;
 	struct brcms_band bandstate[MAXBANDS];
 
 	/* packet queue */
-- 
2.56.0

