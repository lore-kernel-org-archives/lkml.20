Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793699650;
	b=49cqOcZm0Iwk5asS/+scEqARzXr15f24k+d+47bpHcDRATUHtJ8rqRqIjtpyx4eU3h+g
	 0dydRNUr0Kitq9vsEtJsCPWBAY43h8SmJs9NweBaAQY3Hp2hgM6hwiYKcjaQJi57apQcL
	 qkf0pRImp4e/TDtc09AkDBGNutFCuCCmts4khMUojQSz/YyjFJGKKWHBOUkXKBret8bMp
	 qWK/816aViTVM7tHS5nZ56kV96dJukjQClLXN0+GPsCQfLJpvF9SnIa+15QmYpir4ALAp
	 09iny11f4AG4teDdB8vkso9VxwuHu8SSvcRRCtgA9pa+sWaFeG0vIIRCUcYmxaXymgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699650;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=iH+5bLQSIskdkGMDhaMY+sY910o9sCp30GjpM4gNOE4=;
	b=ECHz//Cd15TLuqdAN0PwNIss08MW3ryFQD84nQesIssl51HG+bK2wjCDvcL7HVvr4Yuj
	 SkgFldYe5OphV+AkFySUAZ2NZL3erggTF9B+glCclIBKZa7rZMA070mgA/yewC6BI2VNN
	 CDplVxGXi4P8BADBe6TweZbykFvGuqQgPeq1FYXfRHyKwk+Wr/2U5mJsHN76EJ32w5PSx
	 bSL8Aho4TLT0ltzAPMZcVcuiNnTC3Bh1IFn0e2xEgZbw+Y1FQCGnXCw8F7TD5clWpT0Fz
	 iJOC8I5oJH1VcGpPYntIZlz9HT2v7C29ge7k1fmifw9uwrgaPcRnWDCQ7EDtK3EgVgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FhKm7Mlz;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF09E6083616
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 09:54:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF09E6083616
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FhKm7Mlz
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-15dd124bbe7so5590160c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 01:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793699649; x=1794304449; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iH+5bLQSIskdkGMDhaMY+sY910o9sCp30GjpM4gNOE4=;
        b=FhKm7Mlz7AFZvIyJnHmfrY4U0zO9EzSqdoKR5tSwgyt5HEQ25DFyOkHBBGTL1vDNn/
         mYMv6tZSM6s65ROAP3XNPnTz/d8mEDlFxrZ8jLyfRg4mt8Eh1IH7TCOxC7yCryCBnccG
         rfOyTpPMkftACnZnC6YS4HKQoRQ4p3LNZqCIV7xSXmjyUZCj6enzUV/YSfZHCU8bV8ha
         i9V/lzc8ARwmaOE9tqAoK+8TD31tfdQJuyN4JntA+5ga3oPFS/l529gcrlWwG9D69/mm
         aNIUdSmH/OzExouUGINcJn7bXFWWLnINjQQbdTwvEaQ57X1DQv7teaBer8ilmTwQ1iE6
         LfFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793699649; x=1794304449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iH+5bLQSIskdkGMDhaMY+sY910o9sCp30GjpM4gNOE4=;
        b=mNBhqVwHSXZt5dCJ6qThbSchNhH3APB1vAtpF2qPWh2YY/TUMdwcWQLA15+yo/6ZeT
         kANXx6xaUAFpMVZ8f3T+k+bsVi4oC/qKEVFZENmMTpLTN1/hp50Vm2+NB64xuVqYGqQn
         0BkQUC1M6AkPuTiAd/fZhTNhsu65s3upisJv/gXGeo93hG8SLh0waLURUXxMzHEgDfPp
         lZ8RN84/VtnRqp8Fm5QLTtd1DeT9OOcX7zAEVcNQu7kil3w0EhY2p4XtL614CZlkWj/o
         0FKBp4nAyH0BYJJkJ5ZludKxzwhACpJhICUDKDKhiBjzyz7bWpOyMACEyDYcwQW8Qkzd
         wicA==
X-Forwarded-Encrypted: i=1; AKwUvBwAZVt9vpFy4glKOR1i9ka3NattYiS9Zc9CivuWxs2GVfuyRIUwB2icHFLeEwMPKiWqWP9m+ee+FirICr8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+t60ep4jQ+LT3Y94ADVPRyOVt7P2Sw3wovmOn+aqiCIVtA6uWI
	tXSt/noJ+gwvHRYBS9X1RuvBfoWyShCigbmjn3Di2rd9cqQx9ie2gxk7
X-Gm-Gg: AYBFou0C6lXOITtVni3defnLbo0Z6SjXpOkbDVJ/ITMbiUtOTm4UW7wtdU+8xd+ZB+j
	DTYoUTw9V/mBh33/QKXfg/bU9i0CMDmS/G4zN0FvnLkPBP1g9ggc3AwaqBTXfcL8JdJ25RugnvO
	SgXq3wsDXP7RLq57PgpErrttsvUTnsUQTcpbuJ1rZIS3wOk05SIf/Ki2SiZ2Pp0p+yHkTeiDO7m
	yQdL842qeb2U12yqNa3DHEdx9YFURL0Vf5Lr5JyqTl0hZgxTNU5bMgIxmwD5FOXAcG812HcGQ8e
	90VeKxBhhQx1K54uVGj1c8F4Go//KCrAogJYYZU3HKvnZiA9JqV08xjFhYl1XF8zjUWTo5L0Cv5
	eaPOqD5/s35yWkW5j1bv7+dkrS5JQ1gbDg1dH0+bxVRydglmcm5NjBFYxSdJkMVbFeHu+rF2cjz
	QdmVhw6NaI1izCvluFgsBimYMv7rEdgDBxa9C6syTExfDloa1qNrPxyk7mqHG91sOFEBGorubmT
	qN8n/RSUCPeEB5EOcab42fRbPvWJPF/kTbtYbnONFZwMAY0G5HZVaOjxKSNYvUlxdbpNMxiX8VT
	uHy86PWulPIbwhFmHWgZG780Uro80z6wJ84igbNzOer8bV72nbjnQT+n67UY2H4X/eQr7o4/mCe
	HqSG8hW+U
X-Received: by 2002:a05:7022:ec85:b0:15a:2b63:a0cb with SMTP id a92af1059eb24-1ac59dd081cmr25711377c88.13.1793699648752;
        Tue, 03 Nov 2026 01:54:08 -0800 (PST)
Received: from acemagic-m1.tail4fb79.ts.net ([2401:7400:c804:b668:9e8b:5db3:accd:585c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1aed79b3dfcsm44178383c88.12.2026.11.03.01.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 01:54:08 -0800 (PST)
From: Ho Jie Feng <hjf3108@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>,
	linux-wireless@vger.kernel.org
Cc: Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH rtw-next 1/5] wifi: rtlwifi: rc: start no BA session for QoS null frames
Date: Tue,  3 Nov 2026 17:52:50 +0800
Message-ID: <20261103095256.949327-2-hjf3108@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261103095256.949327-1-hjf3108@gmail.com>
References: <20261103095256.949327-1-hjf3108@gmail.com>
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

Test results (2.4 GHz):
   before after
TX 7.0    6.1
RX 28.3   29.1

Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
 drivers/net/wireless/realtek/rtlwifi/rc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/realtek/rtlwifi/rc.c b/drivers/net/wireless/realtek/rtlwifi/rc.c
index dcfaa98198b612..f475f1b8a98272 100644
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

