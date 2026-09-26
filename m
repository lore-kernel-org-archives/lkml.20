Received: from mail-dl2-f42.google.com (mail-dl2-f42.google.com [74.125.229.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C39154707A
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 00:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790382195; cv=none; b=oQBDk3fbr3JbKz1QJH64ZFgc7hO/t6AB2X6giVvwBy+SQP5kO5LQzvRZ8Q8T/nKoJBu0qlKh/53yTtRKNjJgEXHm6AxUXDxw5nNxW6DwVzs1NBHEwVjvyy5myk8L0S5ESgJc1o3087usqjarrjZ68uex2wRvnF//eXzxNwiev24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790382195; c=relaxed/simple;
	bh=YkLt3pwW8wTRXXoKWYw6RnJA8o+O9ilGAZICALlkytg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CKVZlEhEdpnNThyMSJcqZuZ8cbjZvDeRI+rI/186kTU9vMlpPATlYzpjnPdUdtJcN+OXp7CshiIrf9a84sT23h7E95cwAyCPSEwTZxmme+SbjpuGquKfhboIr/Av3yVAePVIJtZgoX6P1rT7RMJ+OLAFSndiWpueQDFPysI7yIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Dx74PtbJ; arc=none smtp.client-ip=74.125.229.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Dx74PtbJ"
Received: by mail-dl2-f42.google.com with SMTP id a92af1059eb24-144df39b6cfso1071724c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 17:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790382193; x=1790986993; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CqukwQkSLk0aj4isiu0ObgzItwxW1NrXrIMOeRiNUQs=;
        b=Dx74PtbJ6RcbfRdXs0ldelMSsBHcA7+qmRWaBMZIiUzqB+pGWB8Qw9iRmcC1Sw0CYR
         7G7rexzj8KbD3A4QdvnJnqP82Le1BWiKoecFaT+7eXifQKVY+B6GQe1dqMNUVJWGz4Cl
         LPdAFbyyqGaT1D/6BhroerVZUxq8FazFRS0+k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790382193; x=1790986993;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CqukwQkSLk0aj4isiu0ObgzItwxW1NrXrIMOeRiNUQs=;
        b=i6kSMbvCFzf/JXgnhiP95MDXhXYnfT8Xt7siQsiaGEzQVSI0C1kJVBu74NedUAWhX2
         hsyQEGYGhOrgQAAWWTyPL++opK/Q6pdyrPHdcrC5tVZYQJ9A4TrB7oDsJ+JTpMT++n0q
         DmJ912Or/ETE4Yz/LZjhU3zrcVqEsvGT/0vSyHiI1fcC4SlwFbxPP7+RlPBGMLRoWXdq
         8DlSxpVc5Us9Gdo3DI1J+93V2yjYQwXa+O4o0aVmT1HmfzJsEfDtpkUN4CYY0riz3psw
         MfWwlAKTGtAhyxHfmvZ8bJj6HmPen37vqO0kxdRHdfKtE0bdyInrXdKlhfCow8qDn6e/
         zeJA==
X-Gm-Message-State: AFuF++k9Dvr8tI3AdVnHWOiMDEhBCteiGUvVeYzdRbPyhsC34vTLoB7r
	cQ6poWR0Jj4rYRSMEwi/vJlI9ivMUwKeZcEjODo4PFLK92DVOVfo6jw+PWAcfzKT1w==
X-Gm-Gg: AYBFou233Oup9WclhP6qq0smCenNdtIPXaErSgkq6o+Ulon3VHYOhUtSJDDSN2LNKow
	33msEXzZC1HoqERSc9flnz+FwSP8h61dLq7eLLZjI/1kWYvV3Qi4WCapGiz0j5vF79WxY/nIQSZ
	LkJyjK7hRuAOn7ch/d7/XTSyKi3Zdtis2Mo8WQiBzS6AYba2T+FnxZpWDYclfEuO7tjlKs1YjKf
	qe1hX0on6fefOYnvirvX/yBzNInbRGBJy3dl5TYMZsr3HVU6yl3qjNB4DyGog1ur7EcQgpE4qYE
	UuYnIoZs5jp+ofLML4zCwsle0eS76UT3LgX9EL9TbVfmnVcnUA2mVbNgJmRzFxPgTurxuQ3q0wX
	gE5YiXN8aOl6wzP8LYhaGcCy+7xti5rmRwFUh7iW8H6/LQ17PhmkeYsXL5CHfDDpJE5EWTTd5HS
	D9X6QjoE7PymtPP9/S9dtXNabRdJk6qJ4kWLLzGNIdX0xJHfUfRNAcN9EO2/sgdFzODYsDKBhY9
	HFpqSwQyzZbfFbE1IAS0V+9t86bAdVtPVC5yQ==
X-Received: by 2002:a05:7022:d43:b0:143:26eb:18ea with SMTP id a92af1059eb24-146d00b7b89mr1524721c88.29.1790382193104;
        Fri, 25 Sep 2026 17:23:13 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:41fb:1648:4395:5cc4])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-145ad8e43d2sm9497733c88.12.2026.09.25.17.23.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 17:23:12 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: linux-wireless@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Francesco Dolcini <francesco@dolcini.it>,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH] wifi: mwifiex: Reattach interfaces on suspend failure
Date: Fri, 25 Sep 2026 17:22:18 -0700
Message-ID: <20260925172218.1.Ie4146d413a6be79caa11cf34e19b23f514ad3f5e@changeid>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If our .suspend() fails, we forget to unwind the early steps -- namely,
re-attaching our network interfaces. This commonly occurs if, for
example, we fail to program WoWLAN patterns to the device. Without this,
the interface won't work again.

Tested on a Rockchip RK3399 Gru/Kevin Chromebook, with Marvell 8997
PCIe WLAN.

Signed-off-by: Brian Norris <briannorris@chromium.org>
---
This bug has existed for a very long time. I couldn't pick an easy "Fixes"
target, so I didn't bother.

 drivers/net/wireless/marvell/mwifiex/cfg80211.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/wireless/marvell/mwifiex/cfg80211.c b/drivers/net/wireless/marvell/mwifiex/cfg80211.c
index d7f20ec0bb3e..2fc092635e10 100644
--- a/drivers/net/wireless/marvell/mwifiex/cfg80211.c
+++ b/drivers/net/wireless/marvell/mwifiex/cfg80211.c
@@ -3562,6 +3562,14 @@ static int mwifiex_cfg80211_suspend(struct wiphy *wiphy,
 		mwifiex_dbg(adapter, ERROR, "Failed to set HS params\n");
 
 done:
+	if (ret) {
+		for (i = 0; i < adapter->priv_num; i++) {
+			priv = adapter->priv[i];
+			if (priv->netdev)
+				netif_device_attach(priv->netdev);
+		}
+	}
+
 	sta_priv->scan_aborting = false;
 	return ret;
 }
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

