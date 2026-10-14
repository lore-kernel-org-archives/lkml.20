Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35FD8548567
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 14:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791988356; cv=none; b=A+DcQLrs1OzU5jRnyFXP1LorbLNB1QTNDXi6f7R0VvP4e/V/EnXMC9lS58q+czS+XM4lT96hNygBNnZnXl/kGaUtbEVOyuqcF2DbtQ5fDyb5iMTvAWjjG63IzpR+p81Qko/dBzX3SrDNMuU6WfxWvgMrf7DQipWepvlSvsbQBP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791988356; c=relaxed/simple;
	bh=IrBBe6wvpDw+PWFsNwUGn4Qo/WOIBQJLb39g7kajDwI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B56OdMkKbdSYibI0dwr8GGKbzX2W0c0rhQPdedav+UN7SHr4yBA+lW76reozpv09XavErx1Q3X5B9AczbGE/UXSnQFNcLeangYWj7x6lNtc0d51bkqqkYl5+tkpC/wHhTU1YGDtJioNo+nPPKRB9WkUEh7yBg1ms6g2KKo9IIGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q8/lGz5g; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q8/lGz5g"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a1635f7c89so10766205e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 07:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791988353; x=1792593153; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xqLL0uNLKZj4KMkwSgRoeTHN6JTbSA0psPY/Eu+4Wi4=;
        b=q8/lGz5gKacVSwIOKdGuY3olis6dAOM4V/V9BYOEzr8dd0Wi00MQS34SPnO4PEQItQ
         62BHcM68dS8eLNZ+718cYQ7PBMavqnM002dkCym5tLNfsmP/INJTzxMP4xEcacA2ZYGr
         yR98zZA+NBE4/MEvG78v95nwbVhqKY3mel9in+/BoyFG5zY3RbiwrJdtkzYwKLuHG050
         VyovbLenh5fRXLxw/5nRS3/Nf0P7rlqLk5K7CLRa4ZvlURnNptodv+cxl2lPKQn0R/cI
         1ctDqAniePR4gKwHtRE91MF5YjidGPWfdaOzGoC/RcPuGgX7AIvZqr6y3PLanFYLL7JR
         Foww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791988353; x=1792593153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xqLL0uNLKZj4KMkwSgRoeTHN6JTbSA0psPY/Eu+4Wi4=;
        b=ZFOeD6U3qh0Gi4ZxdiijXJMpizZhwRek6fN7KHy4rw4bt3JzC5Bp/4h7cKtfF5BEAU
         pfLMFpm/1rgkPing5uWB8KtvPBMmelJi7Dl5QdteW6ynla5RsO6LltWYZ5QNn74NVe68
         AH0Qn6WODYdq5nCh0qzt1MkTfNclTvz1UsvZ6PpF1ZkfF6wsaPY+k9rD5anbvQV3UF1Y
         3pEJVdJP96KcY/0XUR/cGmwtlxnoFhCLsxa5HcjqEV4U9ThqGra0vnIELbmBzlqPoSAF
         OHkFCsQOxI0nPuH2qcsT78dYE6QCrzdSasyz0DPJzfs9pJ4+TRhT+K7mju6pk1cLbh+r
         0Pww==
X-Forwarded-Encrypted: i=1; AKwUvBxfsJtc5n/vA7TRCr/BcUY1ByAlF1qCscIW5GKLsxvQDyLXmPdKbfNlJiFQyQRoxNYEHJ4fo1N6ccSwCHI=@vger.kernel.org
X-Gm-Message-State: AFq9FYI97MrVzl6c0w5bHsU560OztDR7LmpEystWsA6aUHiAScbcrx2R
	UhvPchbOy4jNCsaXwetU91z6KxAEPB6/1E1t+1y1QBS1DpKpD1t2vgHl
X-Gm-Gg: AYBFou2dLsfQuiX1ppyXfUxMZ88/rFW/PWNHHTvj5pkyH21u5rePu1X2Mjnap1Pvleu
	kNOHHngBcyKb5OuTzc0Nz2xps40oJeHufSEw7RwLkQQvWk+fGtjsb7RrQfYjq/y38AJozLe3cEY
	DMREi5qByHdB8d8atWsv2oqIR7o9Th3OBqBh8f1NMo3+P5dhxl6LAbcHUWfS52hXQlRAnMkAgZT
	5W4s29CRKHcE2FUqfmqgmTVS8PMZGTMAPh+Y18fzKdiVQBez1GPYRCKoLewGqigmu+cYs80ixfy
	GoJ2c8zau73AiNl8y3cg8QtX4aigNJ0OTI7dYutph5eAq+vMYZMMIP7hnZxXayq2e3j/HLBF+tK
	ihrGnr11/2dpzTaRGT/wGVe9KsoYslu3y31hJhlKwQ8psegycuqogPKNsRd+sJmx5W4H62P1Q6O
	Epzuw/CP3llmXB8dG2GsmXewF17yky41bcwIr6AHBLCeXQsM1r/NX7MUa8wjyh0G24VQAq/+emO
	62aQBl41Lnx6wPJAssyeDC73R39SCSr1SgEZwwOaOKtwFk0HFjgQ3Yirlp9gAYLJw8K9AKL1GIh
	ak0M5+8GdT3vlO8bJSLnyYzfuYBmOKrZbh4mnZ6Xvc+9Qnb5eeYnS8SUcOIOgRyNvW35zfUGjVE
	=
X-Received: by 2002:a05:600c:8106:b0:4a0:c02:938c with SMTP id 5b1f17b1804b1-4a18e4d683dmr311693125e9.25.1791988353360;
        Wed, 14 Oct 2026 07:32:33 -0700 (PDT)
Received: from zitrone ([2a02:810d:a1:6000:62d3:e68c:3175:a538])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd068126sm3411345e9.11.2026.10.14.07.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 07:32:32 -0700 (PDT)
From: Andreas Wendleder <gonsolo@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Johannes Berg <johannes@sipsolutions.net>,
	b43-dev@lists.infradead.org,
	Michael Buesch <m@bues.ch>,
	Alessio Ferri <alessio.ferri@mythread.it>,
	kvalo@kernel.org,
	julian.calaby@gmail.com,
	jpeisach@ubuntu.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless-next 1/2] wifi: b43: reprogram the MAC filter after an interface restart
Date: Wed, 14 Oct 2026 16:32:24 +0200
Message-ID: <20261014143225.82149-2-gonsolo@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261014143225.82149-1-gonsolo@gmail.com>
References: <20261014143225.82149-1-gonsolo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

b43_op_start() clears wl->filter_flags, but mac80211 computes @changed
for b43_op_configure_filter() against the flags it cached from the
previous run. After a down/up it can report no change, so
b43_adjust_opmode() is not called and MACCTL keeps the cleared filter.

Compare the requested flags with what the hardware was programmed with
and add the difference to @changed.

Signed-off-by: Andreas Wendleder <gonsolo@gmail.com>
---
 drivers/net/wireless/broadcom/b43/main.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/wireless/broadcom/b43/main.c b/drivers/net/wireless/broadcom/b43/main.c
index 8f4aff3..57a5935 100644
--- a/drivers/net/wireless/broadcom/b43/main.c
+++ b/drivers/net/wireless/broadcom/b43/main.c
@@ -4318,6 +4318,14 @@ static void b43_op_configure_filter(struct ieee80211_hw *hw,
 		   FIF_OTHER_BSS |
 		   FIF_BCN_PRBRESP_PROMISC;
 
+	/*
+	 * b43_op_start() zeroes wl->filter_flags, but mac80211 computes
+	 * @changed against its own cached flags, so after an interface
+	 * restart it reports no change and MACCTL kept the zeroed filter.
+	 * Compare against what the hardware was actually programmed with.
+	 */
+	if (wl->filter_flags != *fflags)
+		changed |= wl->filter_flags ^ *fflags;
 	wl->filter_flags = *fflags;
 
 	if (changed && b43_status(dev) >= B43_STAT_INITIALIZED)
