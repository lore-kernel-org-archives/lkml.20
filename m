Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794440638;
	b=HUfVKub/G5GpUobJKdnFUXPXRU678LIUSZMfEnV+wpLMZm2edpxFW3gYcZ2z+mBcGbOW
	 mZgHcc2q2TSA91uqhMF+0HEKpMw2gJtTUbpNP0DwXmJJl/XriJ8MrZBH6dXkYhMi61Exq
	 AM1Qx3fOjRUVQjaIcZajyaQQf00WQ8y6aHc6jgvsqR52oTREzEopT+Oq0WJ2u44Vrf9Yd
	 kDWm9iSdtStxGIfPaq84X3bb781wwy4dwVSXEvv6bidsDqu7utWx+ogvGd36Q3e68hpIl
	 pHGlyRRQdgd+U7G7KZ0/5645axgAYR0B4K/RhZPdWRonYIJfgCskPVgeXat/FjATvYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794440638;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sIRtnQY6OYL4CdVr5QBsATLuOwtuGGYXItFUdt59r9I=;
	b=1yChv4VKyBZbbU/RXjy4RwgSHO1jmVEK955eTAeviAwlqncZsLcpl9i8VqhUIhHShmxe
	 tkKGYuA+dO/zDNuAjwq/S2IRksPpPvjakf+13VwQ8/YnBp1c75zEozqJ400jbEOG2329o
	 Z+ruZ2TU+eBUV1r17RA37rXfr/XHjwndnEBRKEJGwYbWM5C0rQbahzPqt9C3AphjDzX9Q
	 6KoeA8YLQw7yZ07Hl14iQ8f4IWausVfzeGotAXQyBiVF65ZhVRjKMKPH1GfaWA36/P7Ez
	 YTrF2Zpg1c+4+sQnarFvoi9WM+5MeWRigD6o9gUDXfEU1jE/agYFSLXKGibYpLrpA5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wumiYdvE;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7958606A32E
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 23:43:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7958606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wumiYdvE
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3b08a162d4bso2099585a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 15:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794440637; x=1795045437; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sIRtnQY6OYL4CdVr5QBsATLuOwtuGGYXItFUdt59r9I=;
        b=wumiYdvExrs1or930LW68S8u5NK+ZxaYW2ViW8HsYtynyheiOzLAm3MNhASmB59rQ6
         ODpX6tH+Yle9ldStJWtqWnyIIHdbcrInNq8ySuanPjqp9YfyJ+DrXSYjNKdYj7LRZJ/8
         YdOUk0t/8hzOxJEA1RgEvO2kGh2W92zVe9FSjx/o7+LwSdmVcFgws/n4TzMbu3we132R
         m2RAn/p250s2RZIsa/G+9cJv2e9RBDKpTHy7l8QXacqydu0yvWYd2Z84HJLmx29vOhPs
         gfmbmNUZVZVXfB+gVkUsRB1DYpY6AxCEOtBvRuLEakwT9lQRyAe+JlhO6rW6QN7nJr/n
         P3Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794440637; x=1795045437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sIRtnQY6OYL4CdVr5QBsATLuOwtuGGYXItFUdt59r9I=;
        b=cdl5B0J3yxkprj7WnEJztQDnXW78zTem8JhiNzY0CW8uUAPbqGSuSxF2xonMq/E6zW
         YI7T56fXVCi+Q+Pual7+cCPJVrREhtKgbDjKFSJjy47bHEnuircGwtv0STZaXEKtyMSx
         hfjQqZm09qIWmwNJ6lBvhmPclBCMukdMRTnTWyJnzVqDz2hVx/9VHOeofodKHzj0BvM9
         iZNtXWNorJB2POt+kCY2RJgyWAc24GM4T1oCkYlSIxOFRPW4h8oGD/QE4WXrQDc/0HuX
         2FBlxFI3G+r+AgUT0RHPX8UQzBz2ZWW1qEmZcYdjd90CBSBSzQ1lsjQd+46Fy+kQmqpC
         MGBA==
X-Forwarded-Encrypted: i=1; AL+hErFYOzEEdvk6ORJxxN1tQRJuciusO15xu6mCY6b+u8RN9ku+GS7BuFAxwm7CkNGJbkgkdj8lpPXfr5f8kDY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/WOyGOvdfrDVnYYI2GmXG9pHAWWp5t6RX5WPYXTUh/aXbXLBLB
	pW7vhXc+7BWv7RLojFrVYRxRaW4TXJ526QwX1XxuchvQfS4Q4/CIdIs1
X-Gm-Gg: AYBFou0KFQ+yDk5a03x8dENj8WJU50PgP2FI8hABz2B5kejCu0mUcgwJc9ZppLSvelb
	z7Are7+kKAd/suH408Mb5M6lvgwpLewpRt4udObTnaAUzhBMiNQFUVBsWbGsKpBZTLQsuxTggi4
	ES8qtVkz/VL7fevcrJvdx9Gmjchwz8Rx7vzlCilTxTjoke9vZVA358kznttSiMOeb71C0sMjct7
	04h8fP2+qLLaKh24KY+KriwXexW/LttchKpQmjxrv7OjNGgh43XARU53luZe5CQ0oSXsPWDWqwW
	vGM3QohijOQy+uDmunNVu+H8aJELaf+1N5vuZ6914cMSQjcVslVXZzm9sEwJfaLXXFX87c84DKz
	DnfZFygzqjol35M7WvVI2BOdJiuauwszFTUOTzChJEeE/d8dn9MazzT/5dX+HXLUfoT8GLbHDUT
	7KOAp6DxY4SYLx6aO0YbhIjGzuaUL0mj/gMdWpzKefpUwZ+o57No/u+knhaCXqE7K0+ypW7m/Bp
	2g8Jg2q2m4DT0o7GA5NIM5o4aA4ZUmo6Vi+OVHJo7KrUWQXRxKrguAkENpHIo8m1B7IO1MmeAHw
	z9pZrDfLUK1PpHCb1Wes5+v6TLOTg3hBLYhuSblMLKY7Q1emJ5Qf6A==
X-Received: by 2002:a17:90a:c2ce:b0:3ae:5572:c4d1 with SMTP id 98e67ed59e1d1-3b182fdb069mr3832423a91.62.1794440636866;
        Wed, 11 Nov 2026 15:43:56 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:76a0:28::1d2:6e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c74bf3sm1328794a91.10.2026.11.11.15.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 15:43:56 -0800 (PST)
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
Subject: [PATCH net 1/3] net: dsa: motorcomm: Do not inherit ports from dynamic FDB entries
Date: Thu, 12 Nov 2026 07:41:04 +0800
Message-ID: <20261111234110.1449602-2-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111234110.1449602-1-mmyangfl@gmail.com>
References: <20261111234110.1449602-1-mmyangfl@gmail.com>
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

When adding an fdb/mdb entry whose (address, VID) key already exists in
hardware, the existing egress ports were silently merged into the new
static entry. Ports learned by hardware are untracked by DSA and can
never be deleted. Replace the port mask instead of merging when the
existing entry is not static.

Fixes: 186623f4aa72 ("net: dsa: yt921x: Add support for Motorcomm YT921x")
Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/dsa/motorcomm/chip.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/dsa/motorcomm/chip.c b/drivers/net/dsa/motorcomm/chip.c
index 33e5fc127244..150c51f1aa35 100644
--- a/drivers/net/dsa/motorcomm/chip.c
+++ b/drivers/net/dsa/motorcomm/chip.c
@@ -799,7 +799,10 @@ yt921x_fdb_join(struct yt921x_priv *priv, const unsigned char *addr, u16 vid,
 
 	ctrl1 = val1 & ~YT921X_FDB_IO1_STATUS_M;
 	ctrl1 |= YT921X_FDB_IO1_STATUS_STATIC;
-	ctrl2 = val2 | YT921X_FDB_IO2_EGR_PORTS(ports_mask);
+	ctrl2 = val2;
+	if (ctrl1 != val1)
+		ctrl2 &= ~YT921X_FDB_IO2_EGR_PORTS_M;
+	ctrl2 |= YT921X_FDB_IO2_EGR_PORTS(ports_mask);
 	if (ctrl1 == val1 && ctrl2 == val2)
 		return 0;
 
-- 
2.53.0

