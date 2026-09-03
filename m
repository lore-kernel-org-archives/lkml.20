Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC98C4F4753
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 17:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788454891; cv=none; b=RSkwCn/9x9QnNqB7DPXc8sSEeElWMntLTcPXDjlx30+Cs+xDPL0oGG/mQkbQ6ZLK2cbODDvAPsn7dD5vXV0GVCcm2WMTpurTuPzyXZccZMZWer/mtHbCa0cw8ZIwbNTII197Em963+hd1lU2fU2oNQBM2AHyqNH4WddU0A7x4Co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788454891; c=relaxed/simple;
	bh=HQ9aH5rvRwQkOUzglPJfIazfP/5jmGrBk6DlWkYkdVc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K08n2dtDG55DfbG/WdQUubeXyaxH6W1hI7cPL2qYrp4+hzYm/bUxO03P9TCad8InfSGOlYhOw8fWC9KjXAUzNKAsr9TNzdjL/LDehMlLL1MSQGKwDY15ur5svHhEuL7e2KBLmKIhIGXO0S9TALfzV0/qgBtDJhU7Es+ycZO7N5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PaDumkaj; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PaDumkaj"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5b4ac3ba821so2611083e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 10:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788454887; x=1789059687; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OZyw8m6+styphgut7aMHW2Tb5x1l46viCOdrvdrROu0=;
        b=PaDumkajGG/h6sWzOvDh29HTmdAQSuAB9NgnvSPDzy4ebnjuhPIBFMwlpd2s92vTOL
         pjEx5zThQ0lrJiMQU9CCiOyYPvvrl/lZdmAtB2NQ5yNWN3rBRLJXOFGkFMezyOfBHUhi
         sLYMPX1Sk8P3Rkq23uhibyUUXkzMZE1WuB8ZSFz6Bc2adcv8GXZHziIgq+Evd3aRecgc
         LsU9JDmNav/e6W4D/XZI1LFtqzSQ5ZCnwhGRgAza+/6IBdvqQTDooex/OghpEOXpwRnV
         5y5esMaMzWgIEO4uztvy8w10Dn7X7QGcfBiPGG32EOlF5c1gyP3aC+Y48M57bTSbeSS/
         gPVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788454887; x=1789059687;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OZyw8m6+styphgut7aMHW2Tb5x1l46viCOdrvdrROu0=;
        b=gQM0llJ2+NUS3/BJEHoC8eQKDoQMWvyehkuv5ZiPxbyROsh7aOcQhEUwlyebpZ8vLV
         69kIGaauLhSepFeD32RGyFbEN+TPmtGfB70kkq40tqoa26wPWUiRhsrX88h+2rRXq+78
         lyV55Trhxq5/yZGSvaBtJykiNfmIqHE8n9KkBFCdR81dTs6xXHIQH2sJV7v5CajoIFND
         1zJH3jZxx8g7rjthKd2B0AAH9d8dpPQ9nlJ2BPeo7fUU8Iq3Y8BTe3iJrpXQ98+Gdeze
         Y6JHgCRcXTKC7hhIhLqSMUxAUa7jgNg6bDddX8gUHCy5NHOgoHju+DZzNMeq+dI5KveE
         UIkg==
X-Gm-Message-State: AFuF++kVJcSOYvTMVduVXt05vV/DHsRrUdeWipb5XhFj/1K3GHgPbs63
	utxHg89CRENFvSNvQTLAo0kUabDlqQ5qojssX3acgSoGOKs/Io4XSXF9w3L+
X-Gm-Gg: AYBFou0BDoKSIXhB5h57GizbB0HxD3Xt6ouaOrYOyrUOMLUkl35XDCGwR2hHJazJhOp
	rYnwzcGzLOky+/mvT/lM5WP+UvVeBtNgh8XAW0rY5DkJaIcX4Qx2ZKJ4P8i+2JPsg3W9YsUaq7H
	i0jB6C7zxFWk9YxDJxUIIdPJcIq7sZSTABbCxYRUWX/6tbZ2aOlyinEwrfuxStfon8UaaPwS5ZF
	Su9OFVW8XTA+cMkLM6UOSax2wryNpf/4wXb9czZeJJIccT0bYYHnkyDmhGACwADh+7iPq4tQadk
	TF2pnRNLNK4IQYw+EXGpVSXEpDqp2szDeUzaDFBabQYjIAkFXiDfBbljJHTx2hzcTtL5jwA0hSC
	fs02xBANzQdEhp9p0Qj/J3jtnayzNgGPV1hYZlWcKimOReiYo0TYHhmQkEtHIQse6l09OCMvw3w
	x/2iMHVEhadSaY1OdPQ+m3IjYetgNIZvMN+a0YreWjBHqNBwK3oGbhxaWujqE4H/fyNZVG+swRE
	H15ArQq1x6JYa3dU4/NBjdPYWzIOPJjLv2nmrHKKbz/zB1Anyf4cAe8TrcLs9PL10Xuf2kv883O
	BJiFHeo2UNOvZc0=
X-Received: by 2002:a05:6512:3d20:b0:5b5:e53e:5710 with SMTP id 2adb3069b0e04-5b60831e808mr4109616e87.2.1788454886335;
        Thu, 03 Sep 2026 10:01:26 -0700 (PDT)
Received: from nn ([2001:1ab8:1003:0:5454:f357:ba89:4e22])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b61669b215sm5563e87.11.2026.09.03.10.01.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 10:01:24 -0700 (PDT)
Sender: N B <gen.benner@gmail.com>
From: =?UTF-8?q?Nerijus=20Bend=C5=BEi=C5=ABnas?= <nerijus.bendziunas@gmail.com>
To: =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
	linux-wireless@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] wifi: ath9k_htc: derive the PHY error filter bits from software state
Date: Thu,  3 Sep 2026 20:00:49 +0300
Message-ID: <20260903170050.1089917-2-nerijus.bendziunas@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260903170050.1089917-1-nerijus.bendziunas@gmail.com>
References: <20260903170050.1089917-1-nerijus.bendziunas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

ath9k_htc_calcrxfilter() reads AR_RX_FILTER back from the device to keep
the PHY error bits the spectral trigger may have set. On USB that read is
a WMI round trip, and when it times out ath9k_regread() returns -1, so
the recalculated filter turns PHY error forwarding on with no scan
running and the device streams every PHY error frame at the host until
the next recalculation. The driver already knows whether a scan is
active, so set the two bits from spec_priv instead, the way ath9k
derives its filter from software state. This drops one round trip from
every filter recalculation, and the bits now go away when the scan is
disabled rather than lingering until the next reset.

Signed-off-by: Nerijus Bendžiūnas <nerijus.bendziunas@gmail.com>
---
 drivers/net/wireless/ath/ath9k/htc_drv_txrx.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath9k/htc_drv_txrx.c b/drivers/net/wireless/ath/ath9k/htc_drv_txrx.c
index bed7ea2425a0..299064a7fa49 100644
--- a/drivers/net/wireless/ath/ath9k/htc_drv_txrx.c
+++ b/drivers/net/wireless/ath/ath9k/htc_drv_txrx.c
@@ -868,14 +868,14 @@ int ath9k_htc_cabq_setup(struct ath9k_htc_priv *priv)
  */
 u32 ath9k_htc_calcrxfilter(struct ath9k_htc_priv *priv)
 {
-#define	RX_FILTER_PRESERVE (ATH9K_RX_FILTER_PHYERR | ATH9K_RX_FILTER_PHYRADAR)
-
 	struct ath_hw *ah = priv->ah;
 	u32 rfilt;
 
-	rfilt = (ath9k_hw_getrxfilter(ah) & RX_FILTER_PRESERVE)
-		| ATH9K_RX_FILTER_UCAST | ATH9K_RX_FILTER_BCAST
-		| ATH9K_RX_FILTER_MCAST;
+	rfilt = ATH9K_RX_FILTER_UCAST | ATH9K_RX_FILTER_BCAST |
+		ATH9K_RX_FILTER_MCAST;
+
+	if (priv->spec_priv.spectral_mode != SPECTRAL_DISABLED)
+		rfilt |= ATH9K_RX_FILTER_PHYRADAR | ATH9K_RX_FILTER_PHYERR;
 
 	if (priv->rxfilter & FIF_PROBE_REQ)
 		rfilt |= ATH9K_RX_FILTER_PROBEREQ;
@@ -906,8 +906,6 @@ u32 ath9k_htc_calcrxfilter(struct ath9k_htc_priv *priv)
 		rfilt |= ATH9K_RX_FILTER_MCAST_BCAST_ALL;
 
 	return rfilt;
-
-#undef RX_FILTER_PRESERVE
 }
 
 /*
-- 
2.55.0

