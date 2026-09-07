Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D6039185C
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 06:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788761677; cv=none; b=FAOwFxIPQEpT2DR9ZEoOQkTGryGFHXtrVYeUBx8npEMv1LTShUj51LRYw9S8TkdJs82zLJ6Vnrun7PMbgLQjZUmiqgtg6aQPgbNw7PrSPJPQcMJ0Amu8NIQ8V+yebv0huTz0c8ZIu4vQ77lNc5V2GH/NbS+nMpmrZNby0LBiXps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788761677; c=relaxed/simple;
	bh=63d3EFe70af6cIHQJQbIo4z0No8L62ks0NNHSrUyVGI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H1j2rDOaaEchP9Xi24+Y4XQ3xGhg4sSBL/dq1KRBY0MGsBagsY1h84TRTuKWsh0IZhvu+Bqp1hcO+5UcIj+U4vgBOZZRfvyF1eh9ti/JDHzDoyT99MzijS36vrEQxulcR+3Ou0Oq3dVT/M9ca+bftd4xfE7KCf447mnGF8WhzOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nHe9kOnc; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nHe9kOnc"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2d715f4a587so45736745ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 23:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788761666; x=1789366466; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3qi9DqL8zkpOd+OvESCrZGBtHA/Pj08CoKDMwtF+4/o=;
        b=nHe9kOncZ2vhKfaxPDqpyu3adcvQGo/tA/NkPR726VTOAYg1bN+g3DqmtqLs9FS0Ga
         Gt8HRs1EXD5UXnyDMvFVtpjhsEqMUnXHA+OXdcRRIZJgW19zIu67bHNW8NaozbHxC9wM
         xZkTdc7IGPcgtVWgOHprdm54vMld/etqesivBHH5pfqJkOKb5JJWTQa1tdGaZTdaWO08
         9HC1h9X35msnG/yi8x2Af0GGWtGG9ttip5HkOlghlT9kk+W56RNdnvCUt7eq3hj17Ovw
         CH4mWW630hJ5cn66aMx358zDMfhs2uMN9qTX41CxwIu5wyunZ0ueBcN41B/+bvX5lbqL
         t2gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788761666; x=1789366466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3qi9DqL8zkpOd+OvESCrZGBtHA/Pj08CoKDMwtF+4/o=;
        b=Z5Eqo1DFn8A+AsHdbvtAdM3dJLiUIJqWlGgKL+qP82bMGQI3AHlRxlL3M95zLVpXry
         fEInIOC1DF2ubWAMqNRgRselgB7Wqpw22HTy1ST3263bT7eGbOSSIZhuH3NruahvFuki
         1frUxBJ/jeav3e1HfGsbqqNvEPLnLHC8C2N3OaVhKpi+jO466ppag2xqTvMZJ56/LUly
         oLo/NO+nqMXxYYiJJ8ziTQRUy3MhHQsla6DtGjULPfbg2v0HZ7lKxhxuL1m+zbqgSfi4
         gl6QyHZ5uUdzi+izFu0x82IJTblANgnL3dZ1ZzFWWxXF/UEzadPX9axH3edV5DMy9Spi
         uttw==
X-Forwarded-Encrypted: i=1; AKwUvBwzkzdPNwcCw9HaKMNjiGYNhNb+zkhBq4TMWkNKmQ1QqIhZ1INmdAEQdqx+4c9c9Ohqa0vZHEXVtjI+jtM=@vger.kernel.org
X-Gm-Message-State: AFuF++nliof0A+qUDRneL7O8VgFExEGmpuSigfKa00lyRMTIwZYclthy
	50uq9+znIy+H3ZVxvi4+TEsoG+ZSZ/N/3OVtmVO6iQd7eRaKCpPoN9kaPQGaBOUn4Mw=
X-Gm-Gg: AYBFou1oONk42/0HSyYLuIzDff9LuJTdKlDmOMOC87OwRzHce320W90ePbVBgIsRAI6
	xUxLgf6lxHvatRJyMuf/E1knc8RTmu/KV9J1B2wx7Iapj5xBCp3Z5AKGLvVDcJMjfrB6CY1K+2l
	hhuioJAC3Od6Oqdyctrn2E6jxtstNIbFBywHuEynGFRlC4vUrSw4hhkOU14Y+Dgo8IdDIMd8Pct
	t4bbhYPvq7caSB75aAJsktiMi3jTqnNfx3Rrj/lYreso3NbsKKmNYX29mczXAHqVAa7nkhf/4X5
	9JVnMMHGAVKhqnBCeClCPKnCzYY3pi4X1KbUkwHhWuOnUMolk7uUNcNj2vR5N7sHZpV0UtGLWFg
	q1QMBGkei4XN0kjRcxNf64g3QzcqMnbEdunWdVumGQZsh4gR1p/xy9NFt+NKlVXRTNFGhld4eC7
	i8t40+T2UP2P19V7yTVcnZu8LUdjPxcEyKGrDOst6eYOmvDpochdWuP/AwfQeYEd1AxecTeY1RJ
	/Vuk/rcg8g4hlO5boWnqu/F
X-Received: by 2002:a17:90b:1d4f:b0:398:9be5:b417 with SMTP id 98e67ed59e1d1-39b26221eb1mr31137813a91.18.1788761666128;
        Sun, 06 Sep 2026 23:14:26 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14340a69666sm4651595c88.9.2026.09.06.23.14.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:14:25 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] net: fix repeated word 'used' in comment
Date: Mon,  7 Sep 2026 11:44:17 +0530
Message-ID: <20260907061417.33729-3-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260907061417.33729-1-hemanth.selam@gmail.com>
References: <20260907061417.33729-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop the second 'used', reported by checkpatch.pl as a possible repeated
word.  Only touches a comment, no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 include/net/mac80211.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/net/mac80211.h b/include/net/mac80211.h
index 9d1fac6e8082..33eb8b8675ce 100644
--- a/include/net/mac80211.h
+++ b/include/net/mac80211.h
@@ -257,7 +257,7 @@ struct ieee80211_chan_req {
  * @min_def: the minimum channel definition currently required.
  * @ap: the channel definition the AP actually is operating as,
  *	for use with (wider bandwidth) OFDMA
- * @radio_idx: index of the wiphy radio used used for this channel
+ * @radio_idx: index of the wiphy radio used for this channel
  * @rx_chains_static: The number of RX chains that must always be
  *	active on the channel to receive MIMO transmissions
  * @rx_chains_dynamic: The number of RX chains that must be enabled
-- 
2.48.1

