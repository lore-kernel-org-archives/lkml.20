Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794371176;
	b=1ImnO7aULZC7PgtDyC+4rxRbYp2kteEQra61mquce6NqEMZVo7w7Zx8fE0E/xUO/5Acs
	 4N5S4VtMTNN2fmRjul+3Vt7YPs/dH7n95y4KTBaRVV/zlbBb8Mw8QGo7XyFedN0d0sRvt
	 U3ISJmNhLKNbSQbcMDvjVKnZFBdgkyqlBZNF6q0NKHbGc4junebog8yb1in0l8KEviuv0
	 ZHbjEys+QMrX4V9Lj48AOvyifu2CYr6NjsBcs0uZ/m93zkCteI3YvnAslOUQ2dzoPjqkn
	 soXx05s1i2bHY1xdML58Z1Xa69glRrzvImg9i1qoeyHjNc8OE53haxrJ5OYU4CqcXZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794371176;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=I6I/54UthYV8T8xR4jPHmrnswiva4SFUtpc+no+b2+M=;
	b=D+MhwxkHxFjSmGDaT/SMTyRNOGD8Mtv2KBvslDj7r2OX2m7pa+htT5nVGuSl0UlqwJHc
	 fX4uvQcCZxS8e47OaI0KbGqGrtghAUKKtcZRXff8XF8ya8MuGgJwE5T+uFfFymcsrWtXW
	 FKYy3jLmMtGhym9ZcZ7/6L43LHoIcKmQHKwSDLuLuB/fSrY3v4VaszAYhlyPGSNJOpLfw
	 8yrHC2DGNrP5ndfpVZ+v5IJNBIjJK/eP9jAv9+DIbfJpd2LpMXbn92Oisik1YiC6BEwsS
	 Q2kalbPMjc822Cn08hTQLy+xLrP647M1q6RdSpODXcBIXmRlwQB4v0xChiat0hMX0Gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="0W/AWA7y";
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D346060A263B
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 04:26:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D346060A263B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0W/AWA7y
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3b0d0b80fb9so1651166a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 20:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794371175; x=1794975975; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I6I/54UthYV8T8xR4jPHmrnswiva4SFUtpc+no+b2+M=;
        b=0W/AWA7yrwT6LK9/iTfj941WJe9SgZReyePM1vYoWCRaX+2tfCp/QkZ88qwuLBlISB
         4UfVnMVEL4DaWnVqjdmYKEcjQJfqY+MdOmRsI57Y01yUt08GU/liJPXpNg2fO7znHQEO
         gbyqxckm3RqFHlYfOc4K6ZV2ye/JpzhKmucEzbNSxXlmMKW72Th+gyH8P6IcdRV3OS3q
         /3wwiIKk1LXnmUW5m8s5htGOKQ5QV0NlzS35HceaLotv3Cxdh/vJBGDY11CrEBgMOTC0
         soM/mJ24ssuRU6R/atRqseDOGRNGiq+mJkVNk3APdqbQHJHBflt4hhYh7OplrpCZFC3X
         ayHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794371175; x=1794975975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I6I/54UthYV8T8xR4jPHmrnswiva4SFUtpc+no+b2+M=;
        b=QReo9IQXR0vWW42XW3DH1PemL7Lf/f4k7lWHMG3NsyE+Bi8KXNSzGGZN2CdMBC/NBH
         U1P74KtXB44VgJm5hVgS55kjZWEpKjgdEwt/voV5bPtNN1Vf+bKGmqaPNUtESjkSAIoz
         6uGMhbbqeCVR4XFF8Wc0hq9heOy4mJWg++zD5ZJ6ysPTuMScF+MQ7O3OydgxKoicqTBl
         Mn5YLjBmX7Ff4/uLoreGbZe/Gvn6pmb44AG7dqnEqxtVQSNqJlzn9UL8fEgac2BraKqC
         phiQR20nsVovUtmONVFFMAj4u6xk5kRcUddkt4hv6Cc3h8mhuZKUxSTPdYag0GhVliBo
         Rb/Q==
X-Forwarded-Encrypted: i=1; AL+hErEL6lS7P3ev5QeDi+n3uD/23E+AXoMB72tT20vKATXi02fzoC+1DJNx+MU2Lq0wh6AeDP+e2OulLioNkLk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+diMGDlv4wDXjD8y8F/yql4i9Lu6HJndPoE3wKSStP9LtUjCXT
	GZWc35mieGLytZnaoBI4EMMCiNyWaYjaUPsyVnMmtFbdC4TC+AwJDw1H
X-Gm-Gg: AYBFou1tI/lBm82WP/vJawG7ETElxBG06UZhsBQZBinKjhJAzcMHkNnHClNrKxFAP+U
	bKchVkuqc8vFIoxzrkfHWfeKTB3TUhdLo00HI7q/AmxJua3bld7GLu2r/8+9HmxaZXOX7AjGWCP
	59FebCzfX7KNjYun6oXQdRVS5eKO2bgTZWNA5VIZioj7XZUoDNz1EYRKsOi1jw83OObh7hRglIV
	8PgaNSY/lAPIHjy6ehA/hiFmLFwfF01YcvWxZElVToUDtf+/1pQyB42rk3o7n9jigBvMQgQJMqL
	+ZZB/9R96Rezlm5nJ6ygOzyfbFyOKJ+ihntZWsQYwyDhOk0wwkfdHORwgI3LLRxMvUBz16IzQQf
	+OzkInuHVQXd3bX/Kpx2nNEzVReD2wD9CEG9RmGMV77QWlQQV8UE/yA73CysVYlwFOj4T6pHA4m
	Aq4eg6LuzyeKYyqKEi2KtCyed9eKrB9/UYs7a6djMQyMCHS4zfrZUMNnIQlVk9Ok4O+u3CK9/La
	yrbza6acsvtdOwi3DAtMyTBIEu46omyIXgkYP0oS+Crhy7n8Yy2vgnShONd9ncCB/9eCF0f6aha
	Y1EA+lmmUR/5MUVYhnM0qY0jEUxw82q6xd/zOIN58dirXFxqinnCVXikqGnAL6IpTST17OfYdfy
	b7THiGDT8deXDVjWxOrK8ZwYiTq93hh4uQcbxZOPw7fIPVFCZGNFLeQhNfCQ0oYYI5XS36RPkzh
	L1KVjxaQJMJgIRcgkZdeyRjr0=
X-Received: by 2002:a17:90b:2710:b0:3b0:92b2:2e74 with SMTP id 98e67ed59e1d1-3b182fe0859mr1311724a91.62.1794371175217;
        Tue, 10 Nov 2026 20:26:15 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17db7df7csm2473927a91.11.2026.11.10.20.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 20:26:14 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless-next 3/7] wifi: brcmsmac: embed macstat_snapshot in brcms_core
Date: Tue, 10 Nov 2026 20:25:50 -0800
Message-ID: <20261111042554.232998-4-rosenp@gmail.com>
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

The MAC statistics snapshot is a fixed-size struct with the same
lifetime as struct brcms_core. Embed it directly instead of allocating
it separately, removing one kzalloc()/kfree() pair and its OOM error
path.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../wireless/broadcom/brcm80211/brcmsmac/debug.c    |  2 +-
 .../net/wireless/broadcom/brcm80211/brcmsmac/main.c | 13 ++-----------
 .../net/wireless/broadcom/brcm80211/brcmsmac/main.h |  2 +-
 3 files changed, 4 insertions(+), 13 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/debug.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/debug.c
index a1888ff02d08..711e994dd04d 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/debug.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/debug.c
@@ -98,7 +98,7 @@ static int brcms_debugfs_macstat_read(struct seq_file *s, void *data)
 	int i;
 
 	spin_lock_bh(&wl->lock);
-	stats = *(drvr->wlc->core->macstat_snapshot);
+	stats = drvr->wlc->core->macstat_snapshot;
 	spin_unlock_bh(&wl->lock);
 
 	seq_printf(s, "txallfrm: %d\n", stats.txallfrm);
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
index ed022fd2613e..d000e2a70870 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
@@ -423,8 +423,6 @@ static void brcms_c_detach_mfree(struct brcms_c_info *wlc)
 	kfree(wlc->default_bss);
 	kfree(wlc->protection);
 	kfree(wlc->stf);
-	if (wlc->corestate)
-		kfree(wlc->corestate->macstat_snapshot);
 	kfree(wlc->corestate);
 	kfree(wlc->hw);
 	if (wlc->beacon)
@@ -493,13 +491,6 @@ brcms_c_attach_malloc(uint unit, uint *err, uint devid)
 		goto fail;
 	}
 
-	wlc->corestate->macstat_snapshot = kzalloc_obj(*wlc->corestate->macstat_snapshot,
-						       GFP_ATOMIC);
-	if (wlc->corestate->macstat_snapshot == NULL) {
-		*err = 1027;
-		goto fail;
-	}
-
 	return wlc;
 
  fail:
@@ -2997,7 +2988,7 @@ static void brcms_c_statsupd(struct brcms_c_info *wlc)
 	if (!wlc->pub->up)
 		return;
 
-	macstats = wlc->core->macstat_snapshot;
+	macstats = &wlc->core->macstat_snapshot;
 
 #ifdef DEBUG
 	/* save last rx fifo 0 overflow count */
@@ -3054,7 +3045,7 @@ void brcms_c_reset(struct brcms_c_info *wlc)
 	brcms_c_statsupd(wlc);
 
 	/* reset our snapshot of macstat counters */
-	memset(wlc->core->macstat_snapshot, 0, sizeof(struct macstat));
+	memset(&wlc->core->macstat_snapshot, 0, sizeof(struct macstat));
 
 	brcms_b_reset(wlc->hw);
 }
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h
index 8af883e40876..0e6a5edc74c8 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h
@@ -240,7 +240,7 @@ struct brcms_core {
 	/* fifo */
 	uint *txavail[NFIFO];	/* # tx descriptors available */
 
-	struct macstat *macstat_snapshot;	/* mac hw prev read values */
+	struct macstat macstat_snapshot;	/* mac hw prev read values */
 };
 
 /*
-- 
2.56.0

