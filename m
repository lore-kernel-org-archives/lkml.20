Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5DB734FF79
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 03:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788492166; cv=none; b=EuvkXGucFkpRTsLdcWjOfaghQqzgh1wEp7LjfDadlFC5UK2jD2QFe0l5T2oauVkZIUzzyRjkfQzTfi0gY1dwrnhVmNSK95g8Xs8VjB3ymZ4UowiMg0mdeBHixMWVhnNSburwBdufiyiYYZ2XYMG2K8h+tPrQdScUweLcrm/82lA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788492166; c=relaxed/simple;
	bh=xAnnuWqQtgDyeN0opuz30ckVVoqKGx3EP3TJnW0wHpk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=r9n+kxGkiyYGhFQNmH3tryxKqxGOMdLuvmHs924c5PxadlZ1X3/oxc5wpbB7nTgIbA5xBKjy4VquKVK63/QJbeH59NGJpR8/bku/3At49iv1S+IQJwJdPPOCr90uX+U2ynu/xwY+ImIMb+Bf6d/Ii/nKy/MqPaGw2s4+VwdbI4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KNxSiwS/; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KNxSiwS/"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c259e5c22ffso77691666b.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 20:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788492163; x=1789096963; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KZjIQ7XCtqfjPDRpf5O9WXCsBWXCpd1IuhE7l1q+Uvo=;
        b=KNxSiwS/vkYWuUQLphNXjwQojWicbmdW5liI9kkoxCEPL7kfWLc1Vyjn2EoUe7aBiK
         qpxNibQXXl2/qz/GtQlnNzdVTevb94M4iAtGwYCRCukStyLAl/NuDB+AAJ+m8f2uVaTD
         8SRYg4k3vNYzP4y/FYqH/XynP+EPzL5fRe8UBq8kQ1MVqxSDFHhg2mO3nGGdEWRoQBZ3
         Yd/XQJ+x4Xs98eX+0xeDhB2eYUg/exEd11es1aH1qj1r97JA0Xmktc4V+cKgai4sJ8Qj
         /AuhOpWNVLk3JO/oDvqI2NzBAwtYfEHDV1d4Q7bReZVmfDNTDA1qloacsQpNB8o8fKq5
         DCNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788492163; x=1789096963;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KZjIQ7XCtqfjPDRpf5O9WXCsBWXCpd1IuhE7l1q+Uvo=;
        b=BpjcTwNim0zEE0m2kwAUXo75t8fK7MWBlWXU1tFptkIuMu4waZyJdJoQV0KNNz7zhg
         ZcBdZl3zK6rla4gMYHZCuyAay/CvV0HWO1m/Hrldbb+TviNNDOxIQJo5FOIiZRhTmLKm
         NHgdrOf4scoyOF30kynKPcBU7S6RtBJfucWk3d+/TZsc6QgUp0vjv3ESqRlf0JRvng3m
         n7HzrkaM9wjoqyX+NmDaXcNBCfCisyJ2l5Q2ZyK3DGmATOhKlQl5el5NsclZfGcgt1LE
         Zkuf3tcvpc3AaMh9B05dyTfApF1HEHCibE62BvliKCPI8S2zzdqhp9qAYYKfxQ4mD06A
         tqOA==
X-Gm-Message-State: AFuF++l7dpNj4kyHS2ok+f50lvgcBncPx6tQyO18z11MYbClRZqNA+HY
	cUoGRzGmue6LnGDovO9IGzXgXyfNeQr5hi9q0rCZQHiluFfIC4Pro5Q=
X-Gm-Gg: AYBFou1GAN0zqBErAE/CGDM3YLq6qzjmq1k41nQDhzHNkCFn0GGCUsnfJrHpz5/0k17
	3THt75qe+AJbFEPnSH4nWeAoXwPgYMl/CrPYgL5T3xdf0JeJX1yIPJEkiXjtJg82xD4U05qIZwC
	NUDHzR1toXjWN7H6+2k8yrlWiFCbc23PbduRFXQCXco4rcM2pkcD1VBx4u4Wed6W3Wk/r5fn4Qu
	TslKRCj/r9T/NSaBXxE1DLZAHLhf5MaijJ9gzuIRY/b+bg7xZXWPQpDl0VXce9nqH8Tgzr+VgiZ
	GCfefGgUC6ogY1AEIRoOMBirOTK58mROSgIoEWRvJ1QPFntN+okOnwQ2LK1BEdVZT94V0LqoF/0
	6RetetDQDRIUd7vTncAhrVDNiJ0UozP7dd9StLONth0o3hDbPP5w4brVALpqi2nP/8AabGnoZZ9
	eFVot5GHrkvkNaIRN6Ub8lY6X2ZDP4OQ6zOdHSxZ86HON6kfPRoH6/FTGnedXdK53jJ2pz1W6vn
	/BmCWr9R/4L7TCMADJz+hu/hA/C7IBijeg/J0zQaOKvovHeRXe+KjxlQiLCu+H3ZcwMdaphUg3e
	NB1T
X-Received: by 2002:a17:907:6ea7:b0:c21:382e:9a38 with SMTP id a640c23a62f3a-c260c7b0cc2mr141603066b.2.1788492162630;
        Thu, 03 Sep 2026 20:22:42 -0700 (PDT)
Received: from nn ([2001:1ab8:1003:0:5454:f357:ba89:4e22])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d5bd68esm44943966b.57.2026.09.03.20.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 20:22:42 -0700 (PDT)
Sender: N B <gen.benner@gmail.com>
From: =?UTF-8?q?Nerijus=20Bend=C5=BEi=C5=ABnas?= <nerijus.bendziunas@gmail.com>
To: Johannes Berg <johannes@sipsolutions.net>,
	linux-wireless@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v2] wifi: mac80211: don't reconfigure when the last emulated chanctx is removed
Date: Fri,  4 Sep 2026 06:22:35 +0300
Message-ID: <20260904032235.355479-1-nerijus.bendziunas@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

ieee80211_emulate_remove_chanctx() calls _ieee80211_hw_conf_chan() after
the last channel context has been removed. With no context left,
ieee80211_calc_hw_conf_chan() falls back to the default channel, so the
driver is switched to a channel nobody asked for, and the next context
switches it again.

A monitor interface retunes by removing its context and adding a new
one, so every retune costs the driver two channel changes. Nothing is
transmitting or receiving without a context, and the new context sets
the channel, so the extra reconfiguration is unnecessary. Keep clearing
radar_enabled so the next configuration starts clean.

Measured on an AR9271 (ath9k_htc), where a channel change is a full chip
reset over USB, hopping across the 13 channels in 2.4 GHz, 1000 hops:

                  drv_config calls   median hop   p95 hop
  before                     2006      123.5 ms    183 ms
  after                      1006       92.0 ms    105 ms

Delivery of injected frames to a second card was 99.1% before and 98.3%
after (3863 and 3835 of 3900).

Assisted-by: Claude:claude-fable-5-1
Signed-off-by: Nerijus Bendžiūnas <nerijus.bendziunas@gmail.com>
---
Changes in v2:
- Add the Assisted-by tag.
- Rewrite the commit message and shorten the in-code comment. No change
  to the code.

 net/mac80211/main.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/net/mac80211/main.c b/net/mac80211/main.c
index a59837b9f480..643d59e878c9 100644
--- a/net/mac80211/main.c
+++ b/net/mac80211/main.c
@@ -289,9 +289,12 @@ void ieee80211_emulate_remove_chanctx(struct ieee80211_hw *hw,
 {
 	struct ieee80211_local *local = hw_to_local(hw);
 
+	/*
+	 * No context is left, so there is nothing to configure; the next
+	 * context sets the channel. Reconfiguring here would switch the
+	 * driver to the default channel only to switch it again.
+	 */
 	local->hw.conf.radar_enabled = false;
-
-	_ieee80211_hw_conf_chan(local, NULL);
 }
 EXPORT_SYMBOL(ieee80211_emulate_remove_chanctx);
 

base-commit: ca800a9302764c445de0da0e84d2252400a770ee
-- 
2.55.0

