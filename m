Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792697384;
	b=YpzERzIxWwMwXmu/P+1wvQ/QJxu70suQNIVDkllBJmq3kLH0bgPD4xwn8DjcYWzOepVY
	 lwo2RHroBq5Q1hNVKf9LvMu3HPXv6WyyH9qVcJkFszZ8w9gKcj4wtPugmuVy/6VzVHv7b
	 iI+TDHUHPAXoQC0UMXxlzKpg20DMJFUm6Lv4JAo9LnA0hYvtnDy3DusaDOdaT+X3JIF7S
	 J9PBLXYADa/WaU5+Y+lBLYwbrZGJEZy5M5vOOTO1XOlpWOv1JjX05Hu3ykinkxr0xq3WI
	 lL0NlwrziuefBChSdAx2dG+FF65xt7KSE3Vppv5oy33s/EamwMSBTtK3MfIrP2UmPBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792697384;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vRcYocxYeE356P8NCRi5UEknFH50Sj9wm5l4dS4YqFk=;
	b=qtLAjckbo/xZoC5X6h5MDgTdfieG/V9yIxl093J7/B0PXe8gsG8OnnmajGn5O6tfQsom
	 7zDiTS9Z6CdUZFREA46JiTf8taLqiKCM8ku6d+3u9Fv9MOKts/xuwHNPNd7lCENi08AgZ
	 PHVXf966kHjwpH8TMdoKkoECc6zTkVW3g2B2Jn+2F4NXqRnBF+7Zsxzd493VE72WXVLyr
	 zYWizXG8yV7c3+3qgJFnNWsYhjagl88vP6FscRMyu/XbPNzgHDJ5PENsenMvbgrOizQkA
	 BexE0dZhb3AJ4cnUv8rnsqcWfU2wj4qG62FVYhZtqErA8ufuX/PKu3JXjF9ul3QTxLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eybf5O26;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 057DB60A260C
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 19:29:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 057DB60A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eybf5O26
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4956869750eso996425e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 12:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792697382; x=1793302182; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vRcYocxYeE356P8NCRi5UEknFH50Sj9wm5l4dS4YqFk=;
        b=eybf5O26/k0l3v1MO/HK/DnPVSLu3bmHgW5gD1yHGwSVJ/LgXOsE8JFRGK455xhJiy
         zb5eNfqAhNy5n4VD2sR2+IcYNQkanuCAn3jsv3eRGNHsc/IwV49fHhhEMZ6rJARvVus+
         3Sw8a+QKG0QE0Of08QVSb3mF6VWXl92LJmJsP5uDk/Vr4NWpkEaiz4pqY7q6Juw2Z+FH
         DKTPVAzxJ8wv4iLNo4tJXJ1kSjZEuKTEFd/Sjs9xU0VUbJehyfmQwMC7kYsp59r92uWa
         V/ZNI02wkVVCRFHW3mdpNVO87xsXIvFknnHFPw5jcRp1goLHEi1cL74QTWwCscVmehjY
         p3Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792697382; x=1793302182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vRcYocxYeE356P8NCRi5UEknFH50Sj9wm5l4dS4YqFk=;
        b=WWU2MRc1HAhSvYDLyB4y2YLM3rd+HQyH0AMk0NhuNaErpszBNSVKjKA/2Gc+9mc5g/
         coBIrv4eePxEe3Ruf63iX4GUJriv3ZOxTBZ6JiEAn2zszCZpnxDkJv/OH6Zkt6OvBwMy
         E47OSHBeVOVb9lgUpQrdMVpqhN2fX8jVy+9rwKVgpiorce4lSRZHfsN+M5snUe1sKITZ
         yW3E0HESIdRlzYG2KMjuT/1aQQTiFlTEPGWKdQlxR4XmUmDT5GV2mFiE4RW+WvdgL18r
         CeKbLYc6iaX2VY5GztLV2ZUMSzqNhRJu3xKIUnSA/QLz4O0xcOp9LMMR3Tub7NE+to8q
         EAuQ==
X-Forwarded-Encrypted: i=1; AKwUvBzdeBWDCXgQpIgxHpdTxJxioiZmYjHlPA50VUnqmltP8v+Z8cM9D+ya4dL1DVWCJFR0e9Rxd+YjeF4IJPM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKSUAT7wWSOmIIgioKFL2Jrwv6SiQrkhsCAq4Rlz9hTEg8R+VIp
	P14nsjtAyUq/gK4dImLV++L3pxPUHM5f7m4N711NxEt2LqWGam/g2E6Pt8ZIWHcl
X-Gm-Gg: AYBFou1jj9tKwcucTSpHiARUtcMP48iUYRdgoWfB9fY3NYXE4eUR6IE7rIeM5JaH/D/
	9cjNzbTfbqTh0tG2CPz5NumEQEIHwoqrvvOXGlbOQF+PwsvhGWgCvxVJ1xplVRNL+TZ3DKOKTGj
	5IpYmEd9NtSnEqubWfQGM3ebVhTf4w8kLTNSZ/hdGRDH06qz0+OqDbSdBMcVRvnuMI5J/kVo2Go
	AUlu2gfrXj1+MwoIRtKTRH6FiQPHBZ2f7DlfJyLeWXlumYZAwyr2dMK1PuzjCYKwFy9BEi28w/z
	qG5r8IaaR51+IQlL2pHhuLX7E2X00dFLsxBzjPIPB1qW5FV5fFYTbcDt5v0iDSORglOU+forRIr
	qzUayLVAxgiSrw8g6d/FbKqNu3cn5QSZdcb5U0KIi4Pk5n9UcP6ZeaBJzqxzgy/TyBvB5PLkqZi
	+76kHhIQ2QL2yoOEcHG9yDY5HgpoE4OBGrVN4Oof5Gw/aydsNjHsXHfr1iN7BR1CaPPyvbY0nrH
	JEs8uzLmIlqPkpvySYrtWA4WuJcrGpBTFlLjxBkK+QrzJIdFbqSrtngr67duXzA4/m/JtoUc9FK
	MQ==
X-Received: by 2002:a05:600c:8b32:b0:4a2:397:73e9 with SMTP id 5b1f17b1804b1-4a211ed726emr662605e9.18.1792697382440;
        Thu, 22 Oct 2026 12:29:42 -0700 (PDT)
Received: from VivoBook-ASUS-X712UA-M712UA.lan ([2a00:f44:c12:cf67:2010:42d8:74da:e279])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2101cedcesm20269405e9.0.2026.10.22.12.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 12:29:41 -0700 (PDT)
From: Stanislaw Pal <kuncy7@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net 3/3] net: dsa: qca8k: check the length of MIB autocast frames
Date: Thu, 22 Oct 2026 21:29:33 +0200
Message-ID: <20261022192933.384898-4-kuncy7@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261022192933.384898-1-kuncy7@gmail.com>
References: <20261022192933.384898-1-kuncy7@gmail.com>
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

qca_tag_rcv() makes only the 2 byte tag linear before it hands a MIB
frame to qca8k_mib_autocast_handler(). The handler then reads the
counters that follow the Ethernet header, up to 164 bytes on QCA833x,
straight from skb->data, without checking the frame length. A short or
non-linear frame makes it read past the packet data.

Pull the counters into the linear area before reading them. A frame
that is too short is left uncounted, so the request times out and
the caller reads the counters from the registers instead.

Fixes: 5c957c7ca78c ("net: dsa: qca8k: add support for mib autocast in Ethernet packet")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Stanislaw Pal <kuncy7@gmail.com>
---
 drivers/net/dsa/qca/qca8k-8xxx.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/net/dsa/qca/qca8k-8xxx.c b/drivers/net/dsa/qca/qca8k-8xxx.c
index 56796df14..e5d858230 100644
--- a/drivers/net/dsa/qca/qca8k-8xxx.c
+++ b/drivers/net/dsa/qca/qca8k-8xxx.c
@@ -1656,6 +1656,7 @@ static void qca8k_mib_autocast_handler(struct dsa_switch *ds, struct sk_buff *sk
 	struct qca8k_priv *priv = ds->priv;
 	const struct qca8k_mib_desc *mib;
 	struct mib_ethhdr *mib_ethhdr;
+	unsigned int len = 0;
 	__le32 *data2;
 	u8 port;
 	int i;
@@ -1676,6 +1677,16 @@ static void qca8k_mib_autocast_handler(struct dsa_switch *ds, struct sk_buff *sk
 	if (port != mib_eth_data->req_port)
 		goto exit;
 
+	/* Past the first 3, the counters follow the header. Leave a short
+	 * frame uncounted, so that the request times out and the caller
+	 * reads the registers instead.
+	 */
+	for (i = 3; i < priv->info->mib_count; i++)
+		len += ar8327_mib[i].size * sizeof(u32);
+	if (!pskb_may_pull(skb, len))
+		goto unlock;
+
+	mib_ethhdr = (struct mib_ethhdr *)skb_mac_header(skb);
 	data2 = (__le32 *)skb->data;
 
 	for (i = 0; i < priv->info->mib_count; i++) {
-- 
2.43.0

