Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793055801;
	b=Fg2zafLRTxmXM8L/SQXfiH7aZ1ignNFgzwe8Vuh/YAYc+9g8rrzdpYy3bMM+iZyoYdrG
	 pdFjGRYFartmHvuPR8ql/Xsf80Fyd8hegcSqRrLK9+a+toePM967pma+lQcK96pJEyglc
	 FJjHfSMIs7ngMNan9ymUs2250Bf8O4J00ZPOnGSIFaW6uVnCzYmEUPcNkCnY25hTlbJ3+
	 PQNlpjyj6y1P1psrDu+FRn2Uad1rBnUoTd3RBg9hG74fWjfBwdrNMFFHDbx4j0+Yd1mS/
	 bMvspttGCOkFcP8Y3WP/aKKTtafHmrojC+5iJbhvMPxH9dtMPk1Le2A9cZQby6GJumw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793055801;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ROrFvPTcijTWL4ncTf3h11CzKJrW1vsRBxLVCozH5DM=;
	b=mQ7H7JnTS17kUtH3QLghK1rs+KN24Ofw6q9UdgmXzKS8QvYvzkJ4Iotqdqo5LctCZIqE
	 p9jYDldYEAXDlw0kh6REjEWbEXIXiA9JiOh01PrPmFMMucG9KyjyfjvnR1spZQ48asT2A
	 e/u5s6zy58PlfdYIagiLINyCS7NE5EvBeA0dkjjWRNpniJ8A+ECMhCe9L7enFTfqMrhvi
	 S18E9PByIl/OESRKXJWUoyIm7G8WOLrtLpWTjGxmE89B3ZdgFGYRKgDlVceO8rq9x8fgT
	 1joCecOUa03XU1QP2mH8wEjHZy/t5YW8OMvDqFwSdGurmg8ai/9ykliTRRY4CEneMng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nPNQXelK;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F868606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 23:03:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F868606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nPNQXelK
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so2296989a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 16:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793055800; x=1793660600; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ROrFvPTcijTWL4ncTf3h11CzKJrW1vsRBxLVCozH5DM=;
        b=nPNQXelKqNOBtSyemI1wReGuDPcsq/B0AKQg0lhL2zJF81S3LChrXxmg1AK+3CM+pU
         Dbwi33DENRCOpp+rTzh5HgGkGmTS0W0VSEA6COez6MqIAV+D+iZLGMeh5nZJ5qPCfDyJ
         cPtZiE2H+0t13rkUnVe71fdjOAxbXbd64LY/CueWJ94zK0yW+h952PWqbG8sxYtZXn9g
         DnjBdrP1ZDiLEpDQL6ZhcPtliUYmMzf4GHooGORBbXXMJ/AEQENrY1/P/cXQg+t1bBpI
         A0tOFeIYWoXCCfKRfyHaOrafZJUZdHz3tLvCBMOn3/pL4PGi3XygqutNDJL7sw9ipECo
         ktkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793055800; x=1793660600;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ROrFvPTcijTWL4ncTf3h11CzKJrW1vsRBxLVCozH5DM=;
        b=wj7WZpGpFC4qfk/0aeAhBKUgWfyf8khGNhe0tsX9F6GE9vARN5+wiCV3aNud4KvdLk
         rbyyzhLRHbX5vioMjvT/mQ1pdOZbaXasOhgMRa6dTTaXc8BwGfyubLzkTUhp3XFMRmV+
         Tw2+LR6YXrsWtCOfukZdpbxU7MQwfGvDQklvROzkyr+u80iCSPlvST5t7AaUfIRbxlvB
         C/zElR7BDIyPb0I8LKg1jjNEalEe71rjqTL/bWMZf+VEyRhzng19o7e4vx+4+wByUjuQ
         CQ5wE9KRVzDgldXcjX986YcwxEjtSJzLXbUq54OGPyaXkM4/FbnVpfCN/Umw1G4mEhTK
         NVkA==
X-Forwarded-Encrypted: i=1; AKwUvBy9JyIiLN1pr4LJiT13aA8y8iqUE45fcOoEU0D4curiDhX+TlPd2OzsGvVI+jPO0bBU981LVl4bM7IRa+c=@vger.kernel.org
X-Gm-Message-State: AFq9FYIVhKoJVXJA4iw2nO970GcsLKStgOiuXpT82kyBmx22o85VhMZ1
	aEuKeqtWWte5+7EqphGVa/OjEAsnpCzVy2P9+TsfQn7Dpg1kAaI+L7JV
X-Gm-Gg: AYBFou3W9C67clizi52mwKBDoELsqDEVbE0FSbFHw7IMbU6RYpYS2akt7mW9Zotottn
	bUxwk0us5HOCbsapgJAHE7mJRSKBofugQR20Nj3stKgczqDMWb33VFII7exwFe09Mk7+BjzDGc4
	BKAruFYl3jT45q2ViA7IxXKETC11BYCCe4oEeLNHihXETsH/G0NVX4pyuy7rxjwhbaWhd/n+6AM
	wgoNgftfMdatglzpMZM4qizlvcRu5DgOBJQ7Ib8UOc9NlsfR64qHYEG0K/56dU2aPW3nHCgqXwA
	oMjHHGzBMFRU7Ctx1bFgWwV+O4oCM6eij/DhWnE6X4no4Hc4g7dm9q08So5fGih+b7kIH95Jz5L
	YqKN0QMPZfbmh87hWFyLDdwMte6a2qZwsyw6Qrqte7SDJTnq3TaJ+t3t2a43WX9WoUHrJhAslho
	TSaUB5XaC+tVZb13NfR9am+kKPCAuKGgZ7/Q+OrFPGBM0DR/NsanNgxpr6PQumFgb30vyLAfIFU
	Rl4bGeotbv0ygWNK1Gos7uV+I/WQYSbCdcv2HK7kh5LjPTqAZpBAUq+juEDABlP0WkZJBMNG5KY
	k9vHxDk=
X-Received: by 2002:a17:90b:50cb:b0:3ac:9706:772c with SMTP id 98e67ed59e1d1-3adeae83414mr6652606a91.60.1793055799777;
        Mon, 26 Oct 2026 16:03:19 -0700 (PDT)
Received: from d.home.yangfl.dn42 ([2a09:bac5:6212:1232::1d0:de])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae40427782sm1100471a91.4.2026.10.26.16.03.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 16:03:19 -0700 (PDT)
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
Subject: [PATCH net v3] net: dsa: motorcomm: Isolate all ports during chip setup
Date: Tue, 27 Oct 2026 07:02:57 +0800
Message-ID: <20261026230300.1108190-1-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
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

The chip setup only blocked unknown unicast and unknown multicast
frames, known multicast and broadcast were left open (though the former
cannot appear while the FDB is still empty). Broadcast frames received
on a port may flood out of the other ports before port_setup() runs.

Close the window by fully isolating every port right after the hardware
reset.

Fixes: 186623f4aa72 ("net: dsa: yt921x: Add support for Motorcomm YT921x")
Signed-off-by: David Yang <mmyangfl@gmail.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
v3:
 - typo
v2: https://lore.kernel.org/r/20261025144834.2810828-1-mmyangfl@gmail.com
 - reword and reduce code changes
v1: https://lore.kernel.org/r/20261024144023.1010237-1-mmyangfl@gmail.com
 drivers/net/dsa/motorcomm/chip.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/net/dsa/motorcomm/chip.c b/drivers/net/dsa/motorcomm/chip.c
index d4fc20c52a58..f71160eefe48 100644
--- a/drivers/net/dsa/motorcomm/chip.c
+++ b/drivers/net/dsa/motorcomm/chip.c
@@ -2221,6 +2221,7 @@ static int yt921x_chip_reset(struct yt921x_priv *priv)
 {
 	struct device *dev = yt921x_priv_to_device(priv);
 	u16 eth_p_tag;
+	u32 ctrl;
 	u32 val;
 	int res;
 
@@ -2258,6 +2259,17 @@ static int yt921x_chip_reset(struct yt921x_priv *priv)
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

