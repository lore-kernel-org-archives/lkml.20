Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792572106;
	b=PnZCjGJVdgRzj5cVDIDZCBZFFi7xmMCPbpSm8liu40AYqEGtG1CmSSpvr0lLvvwUmapX
	 W3DooKpAIDb6ESNb2mlo5ds+A0i9IRTjtpENgZL1rvo2lm3r61yHSD1dmBfGAZYPTbWR6
	 XGcmTvqjTUd8FkzVmkaQZl/unmFFwhqbs6ajMsxZuUhrw1esAaVpbSWXXZUF9l/g7Mish
	 43u4MD8IJ69mNLyq3pN7vO0qnQIwNTGSkBl+vptlT2+abuDuKOfwr0aP+avxzMTpXkvjF
	 YRwklRTBo8riNANGtuxJAPLnlqx3GL0i5L3e+1SJNM7IycvHJV9FNpZBakc5GpYaHOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792572106;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=mhvHAR1r3DTdK8zstlCq+gb6cF/PwLZEqLaE2Ma6sPo=;
	b=V07mWa0br7WtG9fAm7QD5Km4ObIOHBeKPBQSeydv1wDc7DemtD6LvR/JF7J0uei7AgtP
	 E39lh/msgNWHCWofnNxOvvrjxbddsr4QOazz4tZM8e+QCwL0vtVq6z1aajz+oWb/nXDjp
	 l6NUAvZcebxkbh7Dwm1GIB8niQ96bdBdu1ESEQzdebPEGX6qndF5UKjpG8K8AjSLCMFXk
	 l0SHOr4o4pwrHSuCPBQTVJDZ3VZ0LKtB8lUylwR1gesJpG5WcBFEMmCI0L1g9MydsEt9r
	 l+xlsX2Hc1mtNUu4XPJg0jeSuvFOWsMFzZeBqaT7kNHuOa8XJQDD6J6lIR2FFG8GXDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B27606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:41:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53B27606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-54d6281f6dbso502549b6e.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 01:41:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792572105; x=1793176905;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mhvHAR1r3DTdK8zstlCq+gb6cF/PwLZEqLaE2Ma6sPo=;
        b=XLmXw9+vL7HUrmZ66H6QfRqhn8/ysXICsWsD2tolBNDiDD/qtub5w9IT/ldv6rXmVS
         JJYTiVyj1uqF+ws/DVzK9A8Ok9OXoYfWgbEo0Oey1xxaMzCZ4XcrkA5kBQa3lN75j2e6
         Lnmeytha6tcs4yXRggdu3INM952AORkNp1HLPlnQ6US9sREd88fcqarsMtfH/8qnuE1h
         jLF8CkVQ6hiUP7UvpWPZiYg5/4DpdGgBkc0uYvutdCgkb9uGjvajroWs9ALrJj+/1pPk
         ExDHBz8hmRTX2bno/8OWcNS+J3chCVunYeCzHvdVomGoqTn2dteZG5shWk+shcG6fHaS
         2DlA==
X-Gm-Message-State: AFq9FYLgXVyO58jx546i9/gKW/wpKGAalF7Um2jMnBhBCNRcqM+McwvC
	OLphsMpEy1Ot2Hq2oE5ukwJ27geWAPhzdjYT4TMjPsEgnFPQckzgOgSNzhbq3a+DDzYt/6fcd4s
	RoFP3LyZzIKRrmshfP9KVCItKAwErdszQUTRjwcIjk+C9uiDxZvxog1C9ifg=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:2220:b0:4f6:11e2:439a with SMTP id
 5614622812f47-5535057f44bmr731837b6e.7.1792572105158; Wed, 21 Oct 2026
 01:41:45 -0700 (PDT)
Date: Wed, 21 Oct 2026 01:41:45 -0700
In-Reply-To: <6abfe679.b50370da.302ea9.000d.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ad87ac9.e74039fe.1cb511.0001.GAE@google.com>
Subject: Forwarded: Re: [syzbot] [wireless?] KASAN: slab-use-after-free Read
 in tasklet_action_common
From: syzbot <syzbot+e91dc13b1b37759b3d9f@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: Re: [syzbot] [wireless?] KASAN: slab-use-after-free Read in tasklet_action_common
Author: toke@toke.dk

#syz test

diff --git i/drivers/net/wireless/ath/ath9k/wmi.c w/drivers/net/wireless/ath/ath9k/wmi.c
index 4a08babb6d9d..a7cdb6b29cdc 100644
--- i/drivers/net/wireless/ath/ath9k/wmi.c
+++ w/drivers/net/wireless/ath/ath9k/wmi.c
@@ -111,20 +111,6 @@ struct wmi *ath9k_init_wmi(struct ath9k_htc_priv *priv)
 	return wmi;
 }
 
-void ath9k_stop_wmi(struct ath9k_htc_priv *priv)
-{
-	struct wmi *wmi = priv->wmi;
-
-	mutex_lock(&wmi->op_mutex);
-	wmi->stopped = true;
-	mutex_unlock(&wmi->op_mutex);
-}
-
-void ath9k_destroy_wmi(struct ath9k_htc_priv *priv)
-{
-	kfree(priv->wmi);
-}
-
 void ath9k_wmi_event_drain(struct ath9k_htc_priv *priv)
 {
 	unsigned long flags;
@@ -135,6 +121,22 @@ void ath9k_wmi_event_drain(struct ath9k_htc_priv *priv)
 	spin_unlock_irqrestore(&priv->wmi->wmi_lock, flags);
 }
 
+void ath9k_stop_wmi(struct ath9k_htc_priv *priv)
+{
+	struct wmi *wmi = priv->wmi;
+
+	mutex_lock(&wmi->op_mutex);
+	wmi->stopped = true;
+	mutex_unlock(&wmi->op_mutex);
+
+	ath9k_wmi_event_drain(priv);
+}
+
+void ath9k_destroy_wmi(struct ath9k_htc_priv *priv)
+{
+	kfree(priv->wmi);
+}
+
 void ath9k_wmi_event_tasklet(struct tasklet_struct *t)
 {
 	struct wmi *wmi = from_tasklet(wmi, t, wmi_event_tasklet);
@@ -148,7 +150,8 @@ void ath9k_wmi_event_tasklet(struct tasklet_struct *t)
 
 	/* Check if ath9k_init_device() completed. */
 	if (!smp_load_acquire(&priv->initialized)) {
-		tasklet_schedule(t);
+		if (!READ_ONCE(wmi->stopped))
+			tasklet_schedule(t);
 		return;
 	}
 
