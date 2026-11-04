Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793826491;
	b=CodkVj7l+EwpuyhMnmuV9KsEYSDDWSxOQv/9iwKK3v60p64aD5Rgg8OtWjgOV07nYm6N
	 V2tGJF5c5Unzuyf21IKPZJ7bI5OqrPBVAVDNbtfS/gHkfkqKmTAOcnBSG9LA2xeS4xPCy
	 YcgEr7OgnpN4GilyEMr+B8qz7Ia8zZHM9tbF/iNQTiHuS8obatAGAO+iNcwZQFwAnwZiK
	 S0+4yXMVEcWWmJjL90Eg+uVvwqRCovmmlPoiVFzuxVDQtVpQjxMyZEzFhTUz3lbu68PB3
	 VMlqLcP/ohF9rho198fKVH4d/2alayaI8e1E7eehSK8xRA9smxa5jNLcTD7Qheh37JQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793826491;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+Y8qWnA/XmAlfjtprcp6tcR5z0T7mWT+PwVA00bdqP8=;
	b=yuuyoD4Gfuv1FBnADR2GUYiCyx7To5jxsyP/1mPFJqrMlDv944Ygl3zrOakQCway2DaC
	 21hCONj0qFPYTNbi2p+QA0u8ifQUImXTSPnuusfpn5C2Ig1WsZLFZhFYJohiZJo/VLyu/
	 QXYoB1dcUOo5C3+IanFTkK9OS2qRXKiifLNJb/9es1s9g9VCnkU4Z+vLR1Rr4FeuSYgYd
	 p+SUlph/6tUO+rIX5k0KxRE85DogziBzkSh7sZcadRTzQtQE6yFLceHxyp78tJIaCeTr9
	 9+ZZ/3l+nRUIWtauQW958tBk5XbnVIvlPKJi6Ftg+QfuTIrC9zHBda+CjFaqydQekLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L4PPbsuB;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 292C76078C52
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 21:08:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 292C76078C52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L4PPbsuB
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a5036bbac7so7258915e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 13:08:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793826488; x=1794431288; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+Y8qWnA/XmAlfjtprcp6tcR5z0T7mWT+PwVA00bdqP8=;
        b=L4PPbsuBhCFjHCDiUwis6U/wTp2fygq7mcsIfB2m6uI0ZpTPDnY60ypdhmtXA+YU8s
         074fr5TN4B1vw21UPfA4n9Rdrc1JxcnFgVohyK7aL2sz25s1CsYueaQX3X8mVn2jm7VA
         dOVb3GHJReS6+e6+ZxXqPMYHF53NfgmG4eWoVjECXceRA1tiWui8epSLaeFH7k/rdED8
         vLK7libtZCsBta4r2es3E8DYxtzFiLSzA6gj7xac8L7z/1mXtjRlY6eIrCwsiUxwJzgv
         sDxtgprtdqIzlsR/sE5CLDc39jHUY/Ybj0uIg4pzlUrbhBqphKEumrZnOOmZGWt28eva
         qigg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793826488; x=1794431288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+Y8qWnA/XmAlfjtprcp6tcR5z0T7mWT+PwVA00bdqP8=;
        b=CuIWqFX56akWOqONOdcLGk5sa53MNCtEYqaJ/ai7n9PypoCREfjV3EvwbzDr5EjH+V
         1+WgztAALzXlEMGeBqjKS47kOH7APaj2slLy9X7eZppcd9f4MYXCkMyHUmM9bHRwHVjj
         kx1+Kl/QdNYiYspEusb1ADr/5Wb4HHma7a8FJ5LNptqA+GxFbU0a2lEy7JjFSFPNAwcA
         WB4beKE5ee8JceL++ZYHRqMdcftSrbIb1XWEedVw043uZ7ElTI1eS4NMnwF5TPWGTczK
         C1sjBjBfs/SS+T521hWV58ahHrbmmHYexZXUeGz+ghzr8FpMFrRzqatqFyziEw5Pmrm7
         98Bg==
X-Forwarded-Encrypted: i=1; AKwUvBwNgCeF6wSXRg4n0KF5uFjFYpjTq0L2Q/78mwDT9yTLZb71eedq8yxQnYj5/tcB2QIt5Qr6ecaQtZ1isFI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8LYjo2EIJKXi7pDaEnIgj9/ZQpkJE2B+ehKddq/QRMCe4C0HL+
	exX/uNhvv24LrEMMAMn8K0FwFTBlH1EHBicxiWc8DzCus7sjX18rOqz5
X-Gm-Gg: AYBFou31VxTEz9R2rG9dl/FTPvmhlvusg/ftvzl40knj8S9GsxvMYcBGV8BHGt0hw+L
	mQreX1p2DBdnhGbxA8PCTbQwVKKTszAAEbY/aNgPgzv1hx6CtAZv5gW2+SNmfJyG8Ure4yRLly6
	L/HDW/UEwDtf6huld6G41HsHGgIoDCdkRO/rarww9qYS+PgRzP2Wsis68JcobNTNPk2zKrXwGTm
	F8906biaTFfy1HuaZ/o8FIuQM2a9bnqTXwjzaM6rmVdxLlJ2hb+6gYTMp339x7EqetBVndsv7A/
	//83YRMM9XXh+Wrq04RYkC/iW3Pw9ilhc3/+Amt72oMF1+9KJGX3MCcoIDLEpdxqhbusq+Pp7Jj
	Nt9imelAOKVQI2Tmf0MrOGOa2qE7b4X10Q1N00CqVG3E74JOsOqKa/oGK8jrylcgj2BxoipXnER
	v6WmREX55CZamaabHdvxxAEspVbZoMyFSuOeyaPw+bAvipzSiP6T/5kUE0nZmK/XoOqCURASGHJ
	B76XAp+5gKcMi7O0sz09Y9agOqhS9ue3Uz5Cdj+9t1SqOuNOTCZTNv4Nk40b/rUDxgyxSd3IGlA
	ai0n0T5H0xv/lpLfEgFpuhcO8M9IScD2RkTIPnqvzy92h5IG72X7enMFpn8SCKGiHiO5cu3lSA=
	=
X-Received: by 2002:a05:600c:470d:b0:4a2:191f:7cb8 with SMTP id 5b1f17b1804b1-4ac1899378bmr367364305e9.17.1793826488399;
        Wed, 04 Nov 2026 13:08:08 -0800 (PST)
Received: from VivoBook-ASUS-X712UA-M712UA.lan ([2a00:f44:c23:788d:6769:d03c:c916:2aca])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56e2ae73csm11998855e9.1.2026.11.04.13.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 13:08:07 -0800 (PST)
From: Stanislaw Pal <kuncy7@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Yongzhao Chen <yongzhao.derek@gmail.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 3/4] net: dsa: qca8k: check the length of MIB autocast frames
Date: Wed,  4 Nov 2026 22:07:56 +0100
Message-ID: <20261104210757.467964-4-kuncy7@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104210757.467964-1-kuncy7@gmail.com>
References: <20261104210757.467964-1-kuncy7@gmail.com>
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

An LLM assistant (Claude, claude-fable-5-1) helped write the change
and this description; I reviewed both and built them with W=1 on
arm64.

Fixes: 5c957c7ca78c ("net: dsa: qca8k: add support for mib autocast in Ethernet packet")
Signed-off-by: Stanislaw Pal <kuncy7@gmail.com>
---
 drivers/net/dsa/qca/qca8k-8xxx.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/net/dsa/qca/qca8k-8xxx.c b/drivers/net/dsa/qca/qca8k-8xxx.c
index 86b20bbc43..bc77dd45b6 100644
--- a/drivers/net/dsa/qca/qca8k-8xxx.c
+++ b/drivers/net/dsa/qca/qca8k-8xxx.c
@@ -1669,6 +1669,7 @@ static void qca8k_mib_autocast_handler(struct dsa_switch *ds, struct sk_buff *sk
 	struct qca8k_priv *priv = ds->priv;
 	const struct qca8k_mib_desc *mib;
 	struct mib_ethhdr *mib_ethhdr;
+	unsigned int len = 0;
 	__le32 *data2;
 	u8 port;
 	int i;
@@ -1691,6 +1692,16 @@ static void qca8k_mib_autocast_handler(struct dsa_switch *ds, struct sk_buff *sk
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

