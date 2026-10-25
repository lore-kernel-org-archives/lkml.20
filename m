Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792951652;
	b=bOj8M2xW4ZiyfaXblSxS5eITwmdfrxiWhnnpP2Aq/vON4hOoZ6cA5IfRFFxo8fQE+7xY
	 aLyBIMt0lBPUpml+kAYkHXjtPKW0ox8eCF4cyFCgdcwEKcaSBQKADucAOY0sSbpCvN9DZ
	 PcjX0YmoLM5ERR+53wJduU0CorXGxPye4wAyC14L58oItXt4KmHlTMcZIlJBDkt91Hb9U
	 WbhSvvHZzgo8dcApscp+A0c5bXbPyQ1JZFkETQzde2fldRV4OW1efgIkwfrVamY5y3sll
	 jTiTK0ZLrvpwDWKeZcrE349A5T/+jOCy61emAItgKEUK35pFpPzWvEHVcoQKKX4cK5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792951652;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=m0Ydq/j/RR3Dd8rFJdmc4BDtehwDcl6LEDUrs2GefBw=;
	b=MN3afWGdVqwR8uKuRChTiCNHFdmNCQrALJdY11c9n4e5afozRv5IyOBsVW8gTowPkfvd
	 guQLcrWLYMF3EWdUByxIIxplsfeO+O1JvgUzG7OQbml5MeIOqw0PQrcS/UA/N4UhPw3/U
	 GLneYM6Ty/lN+mM2gkzdzPSuEVPdiQMKgpiwwzAgJ8stvWztyrVGHuLy45BQnmJGmlMfQ
	 07KMRM/KVAZQFmDOSGWdny1iwTPqE6XF+PWlV6mErorZzb3GVlsiM0yITlrmYjOQNr6sB
	 HOObknH7FHpLGcb8+jQvFoPRvin/sXkjPDIUjqm/Pl3KvwbjrdOQMAqN1eeVmRnjavw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YZENF7MF;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2733606A31B
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 18:07:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2733606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YZENF7MF
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48b042c0759so1319715f8f.2
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 11:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792951650; x=1793556450; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=m0Ydq/j/RR3Dd8rFJdmc4BDtehwDcl6LEDUrs2GefBw=;
        b=YZENF7MFYp2iASoQnSKb6fMHyB+Ur17NlSLHLfambPG1WyYcjpD7Nv1gFbyFyXNvwr
         v8Bx9cG9Q/Sd8CKko9Eog/h5tkw2ArY9XeHTdf4RQU7mNXIM2yH3XbFXIEkGWCzN9IKY
         39XLZlyvqdxYPyn8uelhW9L6qDNgS9xaLZ7SkaDe4iQ2XpceC8XTpYtXZ+0HxzMZsliV
         Xziow0M5YIOYiXni0OlGZqcOdftfvWlQmjwHc1s+LqOeMOaSlM25b5lVycgjdYSI5Ew8
         ZHFyW5ss5Wa4TBKWaNhhz/3Yp8lOZUGN/MOighU1+8XSv1urwvnUoGdI2/ZvwIOKiU/S
         PElw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792951650; x=1793556450;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m0Ydq/j/RR3Dd8rFJdmc4BDtehwDcl6LEDUrs2GefBw=;
        b=rT73ozCWcFuYyJtUsXCWlSYIFQFxFkz3DmnDk3Au2JYLbGrSPfOOciIH7KMFCo2FVa
         BQo1V/dHqBBl5hMnq5paWAtgMe2UCqYnymuv9MlWOd2qh8vMm56N1HY9C5+EsILbpddk
         KZK9lvliGnp6BkhgeR5qvVzjYrV+cyjCHYz1RgaK8qmz5v1P5Mew8rKBdmRlrJMVwk6i
         L6Y+BE0YomA40Kbpv6qO932bcjJhU7K1DirYo1nxiEnLMnboEzV8in3Hi3CWEtrIxHeN
         jfdUN4DI9lH0KEf6VAmDHGebi3Vr5TFXCayPN1tJv4tjCtRq1dkW+Am8MKTXhnX7UJou
         P79w==
X-Gm-Message-State: AFq9FYLe5sBR+5hkjbhAa2oAu6tW7fFpDpdiQceLWOleYrAm9+F4iUWY
	U5pLBrJ4hXnu7MJ4np/I7Xg6eJHhfB2dkz//FEVXZiz0+SeacJKhBOQgxyYF
X-Gm-Gg: AYBFou3aED5uOJCjnMvxuAEu46uGMHVtJ8rVk1WdwHnGtcqJHGrbICQ+/96KGrJT1+M
	jVw9Wa5uox7sFYtaZdY4Vfj74J7DuFqZk0Ujtn0BnQ+1mj3ANdJwjV41dLihN1GzpH8girSPkdK
	5GRV2+92DuXa3s8CKJsRTo4hkrwC1DrORRqqurCE5ecvSnz2f+N1qegGlrc49VCsCtmJT9nXcEj
	GQHTtHdcoovxh+HEjoNvu43eZvyWg2Jqe7fk/InWzfa+l7WGP87KNGyMuwzuOYQPxcdjT4Ck3HD
	U1I8DL09J3fjFVgOrtr5/HQmE6LxhRZI1/AmNTTL+Lph4+efCjhPgcP1f8wMdKJZiAuc3KI63th
	4yKr4Fi7hU1SUW/RSdGMj9I6s5YEMj1wrKQ9GbAJKbB5xiWDeB5GKe+nkVIfdPhpcz5dumOLxb9
	bLvRoWejDc7Jyo5NGxsMfgKSzrjEigffhMv8TmCBmNwEzWecmHc/NyXTOCKNafjVtZjNNRkyvyV
	jDH02UkV9LRX9q/Gdw2bhTr/25ZkNoWe8Uijt8=
X-Received: by 2002:a5d:5e0a:0:b0:48d:f957:bca4 with SMTP id ffacd0b85a97d-48e3eba18bamr7432826f8f.44.1792951650070;
        Sun, 25 Oct 2026 11:07:30 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3eb8f37csm9333778f8f.8.2026.10.25.11.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 11:07:29 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
X-Google-Original-From: Tristan Madani <tristan@talencesecurity.com>
To: linux-wireless@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	amitkumarjain0211@gmail.com,
	siva8118@gmail.com
Subject: [PATCH wireless] wifi: rsi: shut down roc_timer before freeing mac80211 hardware
Date: Sun, 25 Oct 2026 18:07:27 +0000
Message-ID: <20261025180728.3678113-1-tristan@talencesecurity.com>
X-Mailer: git-send-email 2.47.3
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

rsi_mac80211_detach() calls ieee80211_free_hw() which destroys the
ieee80211_hw structure, but the ROC timer can still fire and call
ieee80211_remain_on_channel_expired() with the freed hw pointer.

Add timer_shutdown_sync() in rsi_mac80211_detach() before
ieee80211_stop_queues() so the timer cannot fire after the hardware
structure is freed. Also add a belt-and-suspenders shutdown in
rsi_91x_deinit() for the probe-error paths that call deinit directly
without going through rsi_mac80211_detach(). timer_shutdown_sync()
prevents the callback from rearming the timer.

Fixes: df771911914a ("rsi: add support for p2p listen")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 drivers/net/wireless/rsi/rsi_91x_mac80211.c | 3 +++
 drivers/net/wireless/rsi/rsi_91x_main.c     | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/rsi/rsi_91x_mac80211.c b/drivers/net/wireless/rsi/rsi_91x_mac80211.c
index 3faf2235728be..90b0fb80d91f8 100644
--- a/drivers/net/wireless/rsi/rsi_91x_mac80211.c
+++ b/drivers/net/wireless/rsi/rsi_91x_mac80211.c
@@ -301,9 +301,12 @@ static void rsi_mac80211_cancel_hw_scan(struct ieee80211_hw *hw,
  */
 void rsi_mac80211_detach(struct rsi_hw *adapter)
 {
+	struct rsi_common *common = adapter->priv;
 	struct ieee80211_hw *hw = adapter->hw;
 	enum nl80211_band band;
 
+	timer_shutdown_sync(&common->roc_timer);
+
 	if (hw) {
 		ieee80211_stop_queues(hw);
 		ieee80211_unregister_hw(hw);
diff --git a/drivers/net/wireless/rsi/rsi_91x_main.c b/drivers/net/wireless/rsi/rsi_91x_main.c
index 2ce5147666208..e893bba868b72 100644
--- a/drivers/net/wireless/rsi/rsi_91x_main.c
+++ b/drivers/net/wireless/rsi/rsi_91x_main.c
@@ -419,7 +419,7 @@ void rsi_91x_deinit(struct rsi_hw *adapter)
 #endif
 
 	common->init_done = false;
-
+	timer_shutdown_sync(&common->roc_timer);
 	kfree(common);
 	kfree(adapter->rsi_dev);
 	kfree(adapter);
-- 
2.47.3

