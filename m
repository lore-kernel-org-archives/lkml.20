Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794053850;
	b=qQRqnZyf7XMWYDLrGPe3jmzuyqighrERzuLytldpO8J0MpPnMc3Z7FfrFyyEZJfJ6wmq
	 gyilgQttChmerPHS5mA+DPxw0ltAzOCTfct5Zy96DUJIRPbdBdCnhfLYtd8d6MjIhJqTP
	 lT7+Jt/fjPrIpFWzyT4UdJnjCbehnRLox4tM5oKtAzURUpOqCikkbg5snnU/VMHSYnCEP
	 JJ8tUoKGzJZ9BbGxkwbrfp1LEfvl3UzkLcN+cb3xroRjoO+HlgwFZpw8UFelAa3xd6NN6
	 m78DmvhpOSS6YDAO6qg4dw/6g+xiNNobfrjKvP4gbvnWiFXkgWB8xe68mJZf+Ed9mnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794053850;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cMAFThmdZJlbS1aX7SDEciw6V+3YUU4jS0RKfJ1+k+U=;
	b=0wS/nUQ3weK5o9qnpjM0Z/XEmPjxwbMY2QUPVCaspJOkrgSd8dGWcOr7sBLRQt9Czqeh
	 kcsxZkuCduKHpcyAuerTr0mochrc671Lku+6o05qe7rvbHfgVBYvYvYOVMhYG+yh3elmB
	 3taKprHj8dIZPXSctsIBjawbV1DuzCtzpJ1Ti4WFI/fSeyom2IoLLlHt2mFspb8v+qyHW
	 9OgHUgdb3jiIyGZi9VCAUrwAAzpJICEZEWUQrE9zKxjNOtfTL4H/n2U7zxlY51JiR/8e5
	 kD90/fvomIN+BZh28dMnvF/WoNXAlfoATCWig6PS+zXgAqUyE6bojsJseX36lT2OsAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bS0kT5Xj;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38477606A32E
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 12:17:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38477606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bS0kT5Xj
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e946155442so12233355ad.3
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 04:17:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794053850; x=1794658650; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cMAFThmdZJlbS1aX7SDEciw6V+3YUU4jS0RKfJ1+k+U=;
        b=bS0kT5Xj5JjrCGZYBPS5x4+6T2PSCUiR2KbMIx+sFh+Ys6XyeUpaNZJQfp9m/CSsAP
         DLGRp8q9wQJYRG28TX8s31KGRmtSpLisPGyyJeJh70BXzVbfx3bZbJuJ0xIjP90dd3zI
         tiaZUq6lLGmUhuzfdJ0Mn09ye+2/7vXC3AsjIGXKVpQFLK2RXxEhQ5UOc6HBl7BmNtGh
         egxPaSJwnzJ41mPMaCMLeguUSLgjLRUFjuUKefgRm/0gBqcphqfKpTB5Zh1Q+D/yRJLl
         7xqaM6mIV3GM8Sw7LZ7xN3E/RaVUHBK3QUe6Nhi5P445CYWdPDMZTbBLvPIfH5MwMCqk
         BVBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794053850; x=1794658650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cMAFThmdZJlbS1aX7SDEciw6V+3YUU4jS0RKfJ1+k+U=;
        b=20829VD5yjQtpj+humSJSVtOlqdgvDEOH5v7yL8yEYID4C8dirgjfegfiIs5xvAaRg
         Okw6t55ZaYk+mwsiSUTDiXx2r2vvqb3oXfKJy9YpwdztLv2qWSGG3UPGKf7bqqSrlQf1
         AGkQFgdOpWfCECm4aQ9To4ZrWxuPhUV7nd5z8nLNEWdG0dR1X8Qk11DV99Z2k3tnr60j
         lgNmOk8SpsnU5xuD+3OIQ0Lx3YaFNip0W+bKu2ZtJp+w4qyAqBh8VaWflSl0XPSKwm1w
         mPXLNcg9qORD3BK7gpPS7kEnEl5JFHHUImxo3FLWnGbuy0OGMuUdHCCjjBqbe7rL4SZg
         ukIw==
X-Forwarded-Encrypted: i=1; AL+hErF9iLjs5ceAopqTFlv88q+4gm4368Hhzm897DlF94DrAv5N7BdUJnikzfnroilT1vtMKUDV2vOuU6EBLKE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+FabCqw/zpbld1M9KMxrq/ucrCG/Ydj7pYJlvWieXn37oFULaw
	txbKWUmDgT82KNTSevXFreHVEVp82UsEnOwYD91ps2qW/90m0AOgJDgb
X-Gm-Gg: AYBFou1dvmNdAoxddLp+jkZOuhl5c9TlxKXwyTOQ2u+ZDE0pXCSh73Jw6j+u5o1nv2E
	uaqPF5ZoYuMu4c39Sa3zq16dmWnrsN/1c2nIjadJ+GuYnKIbY9XV4mUDnketyZbN8Xm20mRsVmd
	ZLz2rNVQ4qI1tySYveDkMrDNCV89+K6/oqfyhE9ogMzoHiHVZAa3MfHWOZMd9Q8RV5vT/cJJdMS
	CSDuPYIVfSEzOU9NI96ywT1+U3r6np9pTNRp1POaExHh7FSey5pUfTjo1fo5oE28ZCHKKjkRcC4
	QDTzjCHaQEm6pZ1Ne4pmDUgoVrRwm5lGWuptow8YJ8FaldXEdVDkL1jEybW3stnIlOXkdENdDAO
	NbUnLNmtxHz6SR47kAiMPoj/eefsGo/tB6sEaD9fH9er5BaK7Rm0V5N9vBIlSt2oNTTvRER9J5K
	Hdmn0CuWwKJcEucUeXhVcdYccfnGS9KHrFFOucOIrHIutWjiyFH+0uczZZw3G8P72UVmH4/xGEJ
	cUGNB5JlyHYqZfab6+ehNIZ7aBe4Vfcr1GzT5H7e8wAytBhLYUf+Ei2rAGwzZHsvwEyqywHLUaO
	XQ+LcXAx45Pf+lMqwLWQSwNkmIJhp4pE61rRFS6rYYMPk8GB5dyycw==
X-Received: by 2002:a17:903:2290:b0:2ed:1f17:65ad with SMTP id d9443c01a7336-2ed41c400c8mr56317455ad.60.1794053849543;
        Sat, 07 Nov 2026 04:17:29 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:76a0:28::1d2:30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed47d5f35asm12773555ad.49.2026.11.07.04.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 04:17:28 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v4 5/8] net: dsa: motorcomm: Isolate all ports during chip setup
Date: Sat,  7 Nov 2026 20:16:26 +0800
Message-ID: <20261107121631.1040612-6-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261107121631.1040612-1-mmyangfl@gmail.com>
References: <20261107121631.1040612-1-mmyangfl@gmail.com>
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

Chip setup only blocks unknown unicast and unknown multicast frames,
leaving known multicast and broadcast open, though known multicast
cannot appear while the FDB is still empty.

Isolate every port right after the hardware reset, in preparation for
the isolation refactoring. Note that this only minimizes the window: a
reset always brings the hardware back to a dumb switch, so traffic can
leak before and during it.

Signed-off-by: David Yang <mmyangfl@gmail.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 drivers/net/dsa/motorcomm/chip.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/net/dsa/motorcomm/chip.c b/drivers/net/dsa/motorcomm/chip.c
index 8ab499611fbf..32701f9e687f 100644
--- a/drivers/net/dsa/motorcomm/chip.c
+++ b/drivers/net/dsa/motorcomm/chip.c
@@ -2227,6 +2227,7 @@ static int yt921x_chip_reset(struct yt921x_priv *priv)
 {
 	struct device *dev = yt921x_priv_to_device(priv);
 	u16 eth_p_tag;
+	u32 ctrl;
 	u32 val;
 	int res;
 
@@ -2264,6 +2265,17 @@ static int yt921x_chip_reset(struct yt921x_priv *priv)
 		return -EINVAL;
 	}
 
+	/* Block all traffic as soon as we reset the hardware since it now acts
+	 * as a dumb switch.
+	 */
+	for (int port = 0; port < YT921X_PORT_NUM; port++) {
+		ctrl = ~(u32)0;
+		res = yt921x_reg_write(priv, YT921X_PORTn_ISOLATION(port),
+				       ctrl);
+		if (res)
+			return res;
+	}
+
 	return 0;
 }
 
-- 
2.53.0

