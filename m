Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794297721;
	b=E/ZclnuE1hKTtyrMszy6x6NBJwLqMSdC8bIZxrZGZNaTwNrxiJOSlu5VMoTHiqOVhhzJ
	 q4wJyj/BROsaor1viR0L5QYNCzm6h/w2d68G/TNSv06jPmsU6yWDGdqzYeKQIrKJAwWf/
	 45F9guMRGKrK7NW8NMK+NC3gnPGhDRqijQLXIP2wwTb76EV9zJ2Zgvc8pla8/j1SYH4G8
	 yJuNHv9dgnmjgvhRndHdVYALnmJ3pkX2uawiFHyH+4Lem7au69cT+s1u5OYYSc6Bo6pAr
	 ytRONYQo7Rb4sVjjhu6g075C1CbIqlnygGb0MwhUi+GKWxRJeorDePRgbI87PboAW8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794297721;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OiJbUJ5l0jctc+MHq3ejBCQI9uvcTD4H/eKMo81Oa1o=;
	b=5BRUw7qoMG0fVaHVvfT6y55lbEOlTeC9c5ltySwQomRSktYkm0Pxd+5nz1psxIDJwS59
	 orbODL1PYlpo63lTDOpVrKxLVYgVhmMjyyhUcvEYHQtEXxUu0rblVxAC3Y5Ghf7mjzDjN
	 pf2AHVG57FwDj6SoGHnpTpMv3mybPG6J3lenJ6i19EpQfqP97VltQafUY6le8nSFqojtB
	 fItl93hZ64EpJiN2g9Hesry2He9wQF7ow7MFVvQXJJMhndCCPrlLInp6WuuPYh0CtUXHe
	 nNJ5RMFVLpPHewTu1NqNpoyuNFSc9BR7gMVxPpIYDk5T9Iwhem6Ix264fy4cC9Oa6QA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="jA3K4nR/";
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999EF606CF41
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:02:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 999EF606CF41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jA3K4nR/
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3b0e0e65adbso875735a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 00:02:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794297721; x=1794902521; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OiJbUJ5l0jctc+MHq3ejBCQI9uvcTD4H/eKMo81Oa1o=;
        b=jA3K4nR/08GXzFRGQ1PrEgbALaXclN05Tavtme60Zya1HnVAGd7ehwPLwZAIb9Y4Nv
         inrpY4nrmk8xGqWyJ7Yc3s7L/auX/ODa11jhdXhYThHI2ZAZdr7+iIKGttFMG9pjomO8
         zYLuAVazU7qJAY4NQ6R5Rkfh6PrhJDBhZTExce6pgWZpxyTvOucDkLVqbwTICrCfsCfc
         eQR4T2LHT7BFBcaQEopc1Jctt1e50jSue6AqHIFloA6b21Y6w2wu+uYav1FH/QIuBLVR
         Zfny7eIlvrDPd0nDKAznBrG3a7rHJHk2lfGTV8zXBM4ODN/2vNk/MsTOkreE3B5PJbNu
         E6yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794297721; x=1794902521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OiJbUJ5l0jctc+MHq3ejBCQI9uvcTD4H/eKMo81Oa1o=;
        b=DVnntWKRHVpb3fNlFpa6jqul3wTPsM4EkqSqjDF7L5PTsxDe6O1Jl9u9h54E8YNZA/
         fLCDedRJDb1iNoun7sc7j3u3tBQaHijY3ohIrTELLuXvDON385rbhEA2VQw8qWxWRAYb
         j0z57ektcJHnLSmF2Muu1jQQ1QTFejJ7yl4H504tZWCgFfL0nqF7c+vwIOnoWs73/GK+
         N/K1DtAYGFiAm3oOTRJRBr0WoCVkeRm+E9Qhcy0sROYsWwY/njR4tw4gS1WwBo8ts4aY
         LV9Nr8UzkuQeKDnWeZZorDUepmtJPZX2uZlPE6Yo79+tfi1W1FK8enO7m3UmWIPUX05s
         tbQw==
X-Forwarded-Encrypted: i=1; AL+hErFxYXUCB9/W41+ILUNZHwwyk9ENU6XZUVS2x2nY/g2/mF3pchlrjzHJFsjgLJmfuKyRpJcb1hLWYoeKF6A=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ztDzbEGYMK2JZJJfZVYVytgs2XcVVITNgcPG54eA64zBTHwh6
	ye7kSw1M5k6HcPt1CJlbgjpEavduqtk2/Q0QGHObSEiBEC0lTB4S6zx1
X-Gm-Gg: AYBFou0Aquj9Bse7awRToW9Nifp7DEobN/4WgpqM6auFR8giA4fvVc/SCYkStILGtWQ
	8t9fEVPM+nOsGJ5sT/2WmNLEMbV3xmibBI4S+/dY0DB56tF4QRLAUpXholChz9k+lEiGfoyfvRr
	ZO1t6RFL5mDcEgWyF7XrVvD72gvepGayTo+4FAhpxivYJu77wvFTkHoXSwprZ3lX4T6PlWyIveU
	xZdSNfoFyEHOH1yg+GV3xOCbf2vF/bsSXT9pcQ9UYZ0iHyXEaH96t84OBdCldtr0aJJYHXHNK59
	1yHN8wN+9zFt4rs/Qyzc0OCNzTtvxOfJ9tnBoHTP9jvoW4bz+8iFKkzvYFUltz03/7JRRAtnZVh
	I1g6Dpz+9oh9xzHLa8k1tfg5+n1zoh8+cn9WQzMYSaAlDVJUK0BeJ1akFSAE3G4ZtlZTMe6P/IO
	W7KG6f0KaJPlyqbkt5Wj1FfGluuMS1NpXE/SUZa7ywiS1ZKDIUcMDDfDMrZTTyrxoryr7DWz/Lt
	BU0L436WOawSRLQ+hLRZp0SVukcATGFaDaa1JSHDulUAiNsdsq75JmZTNOcACpP6oLUm/d+cz3Q
	lvRelI+AD8Gq+oSrS14nuJNulQ9bL7vikD+893ygPHaOIEqIvDv127R8zsER0FaGEgHb7/+Cnx4
	gUw8egGy8t3DC6Vv85KUrMMxCveyR0g==
X-Received: by 2002:a17:90b:314a:b0:3ac:8741:e2e8 with SMTP id 98e67ed59e1d1-3b166aeeff6mr2040479a91.8.1794297720830;
        Tue, 10 Nov 2026 00:02:00 -0800 (PST)
Received: from acemagic-m1.tail4fb79.ts.net ([2401:7400:c804:b668:b87c:eff1:b55f:23de])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1678ceda0sm2906627a91.5.2026.11.10.00.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 00:02:00 -0800 (PST)
From: Ho Jie Feng <hjf3108@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>,
	linux-wireless@vger.kernel.org
Cc: Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH rtw-next v2 2/5] wifi: rtlwifi: rtl8192d: report no signal for frames without PHY status
Date: Tue, 10 Nov 2026 16:01:38 +0800
Message-ID: <20261110080143.1362021-3-hjf3108@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110080143.1362021-1-hjf3108@gmail.com>
References: <20261110080143.1362021-1-hjf3108@gmail.com>
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

Only the first frame of an A-MPDU comes with the PHY status.
This makes mac80211 report the correct value when queried from iw.

Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
 drivers/net/wireless/realtek/rtlwifi/rtl8192d/trx_common.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8192d/trx_common.c b/drivers/net/wireless/realtek/rtlwifi/rtl8192d/trx_common.c
index 9f9a344920..58f7ad4027 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8192d/trx_common.c
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8192d/trx_common.c
@@ -425,6 +425,8 @@ bool rtl92d_rx_query_desc(struct ieee80211_hw *hw, struct rtl_stats *stats,
 						     stats->rx_bufshift);
 		_rtl92d_translate_rx_signal_stuff(hw, skb, stats, pdesc,
 						  p_drvinfo);
+	} else {
+		rx_status->flag |= RX_FLAG_NO_SIGNAL_VAL;
 	}
 	/*rx_status->qual = stats->signal; */
 	rx_status->signal = stats->recvsignalpower + 10;
-- 
2.53.0

