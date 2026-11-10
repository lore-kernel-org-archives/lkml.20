Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794297719;
	b=g5cfuL4/AuztVpRSlyfsjbiuZMKgLfauvZlw6MpUzM7W6+NuThyFaR0wmq12HYDuF4dk
	 UdIt4nS2KiNr/Or0D+OsZgZmhkk5dYaBqlR32gW5Kts34Jo/9mkf0Z5JyNQ9tGMky6Zya
	 byuX2k+96CQ/oP5/CsxGzuOWiQ+rsewjEi3RTJylvqWHOGbbGlZ3aUZgfEaXgh1r38Ihn
	 aZ040f8+Nn9NPEBJWGnJCwsr+b8jTsmEdsyNlWMYg4z8BjhP1pAOY6SXE1BO8kSRSv1YW
	 lWz3Qdgpb2juO3EJG0l9XVfQadMLDzJuDwyQrMQFh3Zx6h27f1mGHJvffJToKa3V3/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794297719;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Ge5RG0Etf1mIICPBU+Fr0TeBQ0djSo3YJCF0Cblf0n8=;
	b=fw0ninNofXF/Tw6JYNmsETy7cN5Y6BWYd7/La8+zOHwyclOLXDrS1wBtirhCTK+jUY6h
	 lBqQyfutbFVldFDt5z6XkEr9189ha8JvDibx9krvK4p44ugenXZLDerzIzm8z0qgZt8vS
	 dJVzInO8IrKLZW2lKkHAF4cDurDj+4v4ku+U/fv6s90FJKs6W7Js2G9GBEKw8BB5z5N8a
	 7uHPGLhIwD9Ep/+Jk9gz+W+gIbgxI4Xc5l1nwBtZVYX4nr2kndT4PtUyTeQ3TLPZGvTum
	 ws4zd3iMLep7DiScqVz+qAu1sNhO6n13WBo8G88kzDvVpEE1uAX2kiW3eiEsJ//j5Sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fFn30jJC;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30764606B120
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:01:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30764606B120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fFn30jJC
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3ae6b4c669fso1102896a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 00:01:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794297718; x=1794902518; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ge5RG0Etf1mIICPBU+Fr0TeBQ0djSo3YJCF0Cblf0n8=;
        b=fFn30jJClst/P782GhsvLX4XDdp0cPqaYlBTugmsLdnT/D1QxxuQBWONUrAJLuhR/e
         NHSEZsogPGggOYnFmHJADV9UYC0oc/rHS7x9pxpL+eLzTkB1mgym0DbroTAEXEzyX9f0
         JeyhBLqGRV1N3jO8XnhZhmEqAZDGdNJyKCkV3alSyFSSY7emZHSxRIJoSKsbaQzPRX6m
         Qeq0t2fnf/GZ51oVXb75JG2mI6cVVHOV1LEnneB+50vs0FgoY97t/JbVsFyvn3NSGOlE
         GBwLHn08fybxycKUPw+kF0t/4iORB2SxmT3C93N4aYdzZ3KalX9B6o/v9DFwGpH4VlGW
         eObw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794297718; x=1794902518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ge5RG0Etf1mIICPBU+Fr0TeBQ0djSo3YJCF0Cblf0n8=;
        b=CPIvtuB3lnV7RcN3oKOYfk7UNWm8VursVIZ/jka7YoNkN0p7tJF/zLUCKTfie/HHWD
         lU3r7qC0uwz1iOIovK9Zm8tiIo1v2PX9Ttvj8ivvISOnnsgn1XC3O82BvAVM5En9ryOK
         xhzBUXRspYozOIkT7AN1HtyhlGrCJ6SVZ83tXwzaDceUBmsBy1HnrqemYh8wrAqEY+Vz
         HjLKJNuCeKDB9E0DZibS2EA6typ9j0ghAmo1iTN2x3rht+O/Ne7ITL3gAe+jgzmq44uD
         Lv1sqglBSRqNAPGm8Yc5OA1S8UL9E7RN3f85sNIH6aepn6Kk3gyCTdL8QdkSR3Agj6nj
         M4XA==
X-Forwarded-Encrypted: i=1; AL+hErFfGPsoTtsab1xz8tOSeMDb2yUK40ApSHQlyUhvXpD1q/RzLiu8nq1grPPO+5ogUxPmYNkd2pfqeGHRIkk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8fxKaALULt+ILo40Oh9WXiv25Qddgoj9Nz2/yrWk1de4EwtW+G
	FMr8x/qhVT3njDZowZMTaCrZWUwzWeWXq0qC5gMbsaNCM2+zMhQxtaN2
X-Gm-Gg: AYBFou1Kqicz3SyTPho3CZQ7eHjBGx4+ZbHV6txYV0nCCoh4JqbADOJiCQQk1dedk6G
	kqgKPT9XP3FxEUuykAAwbTNinMV0BldG1hH65n9WSob6BPqNww0BPfMqwBMam5tNlC+T411YUL+
	tuts4KE5Lq4GczVPVGpLF/oUdFnDrrF85B7PY7/NAMmC0C21UtV0TUnJcGO5SIAmPmEGh8WyZtC
	SpkSrX/nUT993tAXmyInqbL+Fn0//5DLYZ9tQYhP5B2jDnH6b+FeSMDO1qEL5ID+9X+HUVgaA30
	SQHKggfc8dD1PjLG7nIlZ2g4ww+Vz/xQ+aAOLEdg9BgNfV6ZzP6n3tVuVWbP0lKvzz6sFV4fWlD
	6WYNmrLToSyoqn18m6R1wWilIabWXsMhzJYEBry+ObEgOsYalW/DwDcZq+bVdBYcVKVG9Eeasya
	77CtWcaWy2BKd3W2vzZik/T+wh6u/BsI6AswXyFhyl3FeNXE9lJmvCer7tF/yLJX8vsSHLwlrt6
	nul0cd5CHaCvTSKdzTIK0E2JgCDhg/vuo86nnXO8AAqZGgzKiwHtbA9yXF84P2i9+8ohGnRFYPS
	ny4FqX9os+vfIWdxwbo2PaWeeo3o61wbdpAlphQTa9YM2q+5KvbACaAWILfHPqzO8W8hzfgsHJV
	duGWgUxw3
X-Received: by 2002:a17:90b:548c:b0:3b0:a1c6:95ae with SMTP id 98e67ed59e1d1-3b1679e96e8mr1157275a91.31.1794297718399;
        Tue, 10 Nov 2026 00:01:58 -0800 (PST)
Received: from acemagic-m1.tail4fb79.ts.net ([2401:7400:c804:b668:b87c:eff1:b55f:23de])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1678ceda0sm2906627a91.5.2026.11.10.00.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 00:01:58 -0800 (PST)
From: Ho Jie Feng <hjf3108@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>,
	linux-wireless@vger.kernel.org
Cc: Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH rtw-next v2 1/5] wifi: rtlwifi: rc: start no BA session for QoS null frames
Date: Tue, 10 Nov 2026 16:01:37 +0800
Message-ID: <20261110080143.1362021-2-hjf3108@gmail.com>
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

Only start BA sessions for frames that carry data.

Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
 drivers/net/wireless/realtek/rtlwifi/rc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/realtek/rtlwifi/rc.c b/drivers/net/wireless/realtek/rtlwifi/rc.c
index dcfaa98198..f475f1b8a9 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rc.c
+++ b/drivers/net/wireless/realtek/rtlwifi/rc.c
@@ -216,7 +216,7 @@ static void rtl_tx_status(void *ppriv,
 	__le16 fc = rtl_get_fc(skb);
 	struct rtl_sta_info *sta_entry;
 
-	if (!priv_sta || !ieee80211_is_data(fc))
+	if (!priv_sta || !ieee80211_is_data_present(fc))
 		return;
 
 	if (rtl_is_special_data(mac->hw, skb, true, true))
-- 
2.53.0

