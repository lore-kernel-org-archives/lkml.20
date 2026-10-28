Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793197429;
	b=TacoeSSVhbCc9WLqw+nlm1wCqakbawCvXBQMpTaXSSbdLr1I1DeATBzmsQCQgc9E2ww3
	 HcBqKAetcjtNysqaG3YzIX1hCE9A5J7cgbLqGgiiv9167I+1y1Cfg+7YbimUG5/eBnFnd
	 bebYLhn6iowWyUjMCOfhj4Eg9L2M7sKMBcQZwr0lIlCvqUsXtKxp1621c7WthqBHrstYr
	 u7NOahtyIxbOaGNJSxmBiER7xkIy7hWuPcouGOB8P0ftNOdbPUm/JFVeFfRkjQzgs2Q8n
	 p4NLxFemtP1DYcOQfKCnM7Sb5824Q7JB/HTWWTf4gTs1DdDlgFSy7oOqP5DQLdG6hmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793197429;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=72nI0VUnworKyC9ySo63hS603nPN0FBwzBwYMgTAKTw=;
	b=0rBx1J0uMyjPwTG7b0BR1F9iBBxuvBWL6S+Kzlrzd5DWmrWqreEFGTjalPpEtU9hMOCV
	 6KJ+hdnyx5ls7BsHBICeLagha3pUiAVYaPQjFLwsMelIt31TanXSyUQNNF2xyyadkJBUY
	 DELFh8ImHESHZs2xZyaZcrdJfuTGFgEH1oY3nKNaoYIEy2BSEH2o5sLl/iskdhJrQiH/4
	 C4gxVYqjzlrWWIhbkwonCaEpVywjhbOwfCTSWlig6JU8SFZQF8M5O0joskckxTwX5UxvR
	 Qb8SEWHMKG0lwfOWxICGONCIk1DXaiePkrk8nXAHEzu1UoQoDnSmPALWYc5DCFr3RNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e4kYrUet;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DAEF606A322
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:23:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DAEF606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e4kYrUet
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2e987b4a710so10348115ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793197429; x=1793802229; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=72nI0VUnworKyC9ySo63hS603nPN0FBwzBwYMgTAKTw=;
        b=e4kYrUetrjcEDDR0lWWg6jQYYYTRRReJDHjeRw01rBebuY3A4xmk/eMjhcqxiANfGg
         gr6tertjrTZLpJiUsQ9y/dIeOtMNk3YCXOQj+eSi0wrGBgJ0Mhr0SbX6gL7a8/4Nanno
         KmEBWupsixusUoZRps1ELLBKHTheeaVo+hbjt4G5eBAxt10pMDMd/9wFL99bQeqXHQCz
         nVDvPExBnLqjF5/DHcS1KXZwfyA0TwA8RdMtyjOnHaPRrh4UVeyAu0OWQxt6vW5FpmBG
         9C6JlC+yIx5i7u8r4ezh+oSEJ/MhTX4ue3EGfTWMOQOmasCp+Q1MvgUmVM/yEwDrZAFO
         b6KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793197429; x=1793802229;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=72nI0VUnworKyC9ySo63hS603nPN0FBwzBwYMgTAKTw=;
        b=WE2NMdo/dFK91CF9wXxyf9NC/JFntcDklt/ccNmFYqU/yiTb36lsRP1CiS8duLdEtR
         E/+M7qjJR8cJlqOMOQXAyTg2jJLD38QtzoQzbrmXSMDts65Ph+j+MlU3mQHekv0VZGQM
         Qrk4YI1WhSgxVFhk52GW7fF0+z2VuG1DNTu2X7f1EE9cfFufLfYjPtqR+/soxyzDj3z0
         MeuSTJ29AgQZrLr50DDb8vR6XXNZU5l55WBX0l0ArFnxSQIJarAqOK3KxRuRQNF+04C+
         maR8bK7v/4q7pG2olXwD/VtRMcvHqDfvlrxFklWtKQzICtRyWEm24wfIQ9D3G2XmCro4
         qKlA==
X-Forwarded-Encrypted: i=1; AKwUvByd/sSdolm9QWrYuH9reV6Nis+Gq6/gQpDZZusZ+e0SiVSrRnfmaz98OJiHy5tuQEAg6Feqy9e5ENy6l1Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYIgtZhu7isSW2dD25/d1BZhec5xslmAO6gS3eetXQ1rwOdH5BUH
	qSn7l/RA+Mut4uCRbmfVE47z/Yvyw/FPyZQxsyt4KRUnRhocwQYd+ZDY
X-Gm-Gg: AYBFou3dJC0qNltm8R4lk1lzfbjH9xYg2sjNZ6uAYq/vgJ9X0/mcXlrMd9i+qH6yu3J
	shi82qEBJ/LXK4HG1A+EVTBvCXeN0MlEPkD4IBpxsBw0lC72K43LOebtLRkjDHCDaQzr8nb9d7U
	voEO9Wfokr/MPINNW9L76SjEemlfWZg0D7Khigsn1uUa4WrOF983bHTUOpwSAS3NswY4fWm5UxV
	+uG6qWB6W7aChRuNlBpv2Gi2d0j80Y8R0os49ew8QuztvuZ0w3cwMhOCFX0dZv7hB6AthjMZ8Hb
	WAfG3JiOeDFsnODtyUL5FY6R4nuMGmOfcCMUh27s6rDZe5an0BvGiLVeYgsmRfPikJOGX1bTr43
	sx0TM6PlxiPABkmbZvLdkyGKe5XaA3qRbXFxHrI3vnbPpFYdNO4rKuacZxJtCZJY/ufQIZzY/yl
	xdOBn+aH4hZfzOPZwSYX0WED5+9/CK84Og9MXtOLTAlm/Kzyl8ZFVEA34kUSrnEnKvLccQyt/AJ
	dYBa+0wLlOiao9CAtdSiKMnz+JTV/Xz18hjg9KOm5M9L8Ej7bcBSgJUV9yx0jWKB4nHdwK2Ulz7
	lugUSTonG+vAqo5NKBoh6rsU2QrSY3d26VXNnX+/IEyXYaeoJcJYm6WHvyph1yxjVP+d
X-Received: by 2002:a17:903:946:b0:2e9:4f49:111c with SMTP id d9443c01a7336-2eae3fb7b62mr36528165ad.27.1793197428606;
        Wed, 28 Oct 2026 07:23:48 -0700 (PDT)
Received: from KRHW1CJW23.bytedance.net ([139.177.225.227])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6b79ff3sm23590505ad.17.2026.10.28.07.23.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 07:23:48 -0700 (PDT)
From: Zhao Li <enderaoelyther@gmail.com>
To: Stanislaw Gruszka <stf_xl@wp.pl>
Cc: Wey-Yi Guy <wey-yi.w.guy@intel.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] wifi: iwlegacy: unregister the LED if 3945 hardware registration fails
Date: Wed, 28 Oct 2026 22:23:28 +0800
Message-ID: <20261028142328.18560-1-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.56.0
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

If ieee80211_register_hw() fails during 3945 setup, later LED callbacks
can access hardware and driver state that probe has already freed.

il3945_setup_mac() registers the LED before the mac80211 hardware, but
its registration error path does not call il_leds_exit(). The analogous
4965 failure releases the driver and reaches its existing remove cleanup.

Unregister the 3945 LED before unwinding a failed hardware registration.

LLM assistance was used to find the bug and review.

Fixes: 5ed540aecc2a ("iwlwifi: use mac80211 throughput trigger")
Cc: stable@vger.kernel.org
Signed-off-by: Zhao Li <enderaoelyther@gmail.com>
---
Validation: A W=1 module build with MODPOST passed. Not
reproduced; 3945 hardware was unavailable.
Sparse C=2 passed. Targeted Smatch introduced no new diagnostics.

 drivers/net/wireless/intel/iwlegacy/3945-mac.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/intel/iwlegacy/3945-mac.c b/drivers/net/wireless/intel/iwlegacy/3945-mac.c
index f7ca182d1494..5e11f0597255 100644
--- a/drivers/net/wireless/intel/iwlegacy/3945-mac.c
+++ b/drivers/net/wireless/intel/iwlegacy/3945-mac.c
@@ -3529,6 +3529,7 @@ il3945_setup_mac(struct il_priv *il)
 	ret = ieee80211_register_hw(il->hw);
 	if (ret) {
 		IL_ERR("Failed to register hw (error %d)\n", ret);
+		il_leds_exit(il);
 		return ret;
 	}
 	il->mac80211_registered = 1;

base-commit: 25e73f1d6868c759c8eb56cad4e411692c5341b4
-- 
2.56.0

