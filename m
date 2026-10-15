Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09DC152CCD0
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 14:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792072845; cv=none; b=kq4ttC0Q7O5TViv0GQr3iST5ktmbAaunhQbkC7+85xZskWlDwvUcjqWu9H9viN8801tas36p5YN0KDFCpdItecayvL4RTzJ1NXAgcAGpWsgOwZtHs4iEWWzI/MDjT5q+3ybaEMg++X58UvFc2RC+pCH1feiLVfG6los0AvAn1YE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792072845; c=relaxed/simple;
	bh=0MyRWputcyymbn9GnSoejC1ng4GIi49RK59WG2Bqlzk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Tk3JWdWa3Fm4A2NM7DvrQgaTV34hYKJHeSyJny6bOu1yjMugS0G5boZ+fpn19vH9+UpTX6ojVyi4zr+Hr2PuYlOhc44T5kG3BBOWJqJlVLt7kNlabBAE7NNoShyUIuqIyoWsWg2h6JYoMhaIGbrwdL3pcwFrw2xXz084QhLws2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=f8XKBaa6; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="f8XKBaa6"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a021c809e3so50511825e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1792072842; x=1792677642; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IjZ5GoX8cufqsMSGcZxUhgcFDrYZWhJP2v9qR94LpCw=;
        b=f8XKBaa6erWWjd7T1gt59lM4Pvak0lGlgBsH5NA6T9HcU/NTZUqJ/bIM09UEr20z7m
         I00H5/P7g7QbhoeB4qzt9+w8LD9wrkrkRgIJMtU080IKPFbR2emDU5Y4ad+M0dntDHhB
         adu058dHzYUperHTyLjh2r4SdoJKhwGHjQbfiWqAA3GrZUXEOgN5p0s71H7dAUa+75YT
         hO50YoxPm1xyQ23Lo3GLCtAco1BNfzmmoVU7I58Jj7NY1YZBZpu+SXCNZDG85mH5UOJf
         3vL9mRtnV3lsKxeaCYzqvgmrxAWjgqjyQkdRWvjdsLS4Re/ICPUOlkbpPvie2cmvlVR6
         oBMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792072842; x=1792677642;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=IjZ5GoX8cufqsMSGcZxUhgcFDrYZWhJP2v9qR94LpCw=;
        b=VYGQjgI2jETgbowjQG+atglQ6U7VgfD9LZmVMdVitmjegZ2m+MOXOh4dFKnWEQoPGI
         7QTg2wot2XsmRq0/0QNx08AjI6a0VqjOmpT74lMRt4jOdMTDIdJZz8BYuyxzk0+9leXB
         D6cetdAgVHHE1aysm0xbWg4qsLdNnPaBK7Qzv2OIwwkxCDj80tosMCYIQlUXVIRPAwhY
         WU50Ta4yBztaPDiJlrPZY6XkuEYjiW361O3WOTs+/c7lIAOJKeMasUUer+96v1l2N6LB
         Z8t9YEdXivCks5T9ArejxQ3AZKmrjwM+WW7FdS/6IOAlbc7iMa5xCabPzkWLM+D/Y2Eg
         BdLQ==
X-Forwarded-Encrypted: i=1; AKwUvBx1W5tZf/uDn2NhDG9tT4UILDgrwEbqkU5N4493iFRy4iw/+qZraSoWKAd9oPy1tBEngZgEosWPwidit3E=@vger.kernel.org
X-Gm-Message-State: AFq9FYLEf6LpmJBhuftWNLU6LuMmrIecieV/OqWaEmqU3KbNpF+7X0G4
	AmbRuCyTk0LIrs9knX5vtxtQJI1RodN0WY7qO03U4YcOzjzUpzeORcXA2Y/MU0hyCBs=
X-Gm-Gg: AYBFou13EL4eRzy1HREI/ZcxuODrDW1MYh10ycktil76SCFWpwmumO+xrOUI6TjvCgE
	FaLqQOVMHvw13B/2SFi0M76XnQyEwc9yhwQBC+ZabRFTbqdEz6NZyuLmbVjYDHRa1DnpIcJ5zPF
	vtYaGHDDbFljcY2G5HYB5YD+DmUY4j3c+BG+yoyGuydcdYeBFY3pnybvUb7dxGLrMLp665PtSE0
	5LJsdnXDFwWL0ZOIkgByJNUrpIWkXibw1b1pb/vfXWolu99Gn4PacZ0OW0MHlvwAGLTnJS9YG9q
	I4T0tAdPS+mPdrAJPk6J+WlD5VuJQN/0+W8E649GNfC+UkgGETXNK6JQwRBw6Ltcz1oVGkB+6z9
	Tit0FhieTG9wFHANigxcgSSnr8YEyhnEufqPnloslSWi8jTqE89Il8v78nj7CPnj+g6KHE5Knyo
	RTberBQwzktGOH7TrbzxVYlg+oZAbDTEFA1XkaEGaXKxNa5Hc+1vIsHbWbidIkzoSqR9IMDvtO1
	iB+XJcYnVEk61d+yrPN7uX20dTrsvEj9Dn6omLg7B4oEbfRXOPo6WZYl+4ps+sslw==
X-Received: by 2002:a05:600c:1553:b0:49f:e8bf:8f9b with SMTP id 5b1f17b1804b1-4a18e443ea6mr372999995e9.4.1792072842052;
        Thu, 15 Oct 2026 07:00:42 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bdbace19sm76448915e9.14.2026.10.15.07.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 07:00:40 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Thu, 15 Oct 2026 18:00:34 +0400
Subject: [PATCH] i2c: rk3x: Disable the controller between transfers
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-i2c-rk3x-disable-v1-1-81625845c175@flipper.net>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQqDQAxA4atI1gac+Fd6FXHhzESNFlsmWgTx7
 p3q8lu8d4ByEFZ4JgcE/orKe4kwaQJu7JaBUXw0UEaVyUyJQg7DnO/oRTv7YqSiqskXff6wFmL
 2CdzLfi2b9rZudmK3/j9wnj+BZc+7dAAAAA==
X-Change-ID: 20261015-i2c-rk3x-disable-24672d4f38bb
To: Heiko Stuebner <heiko@sntech.de>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1742; i=alchark@flipper.net;
 h=from:subject:message-id; bh=0MyRWputcyymbn9GnSoejC1ng4GIi49RK59WG2Bqlzk=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWRduNO+qsfyNUfr68zvNveOzHwVd8p2lcn3aw61j1/Y8
 P3OOni0uGMiC4MYF4OlmCLL3G9LbKca8c3a5eHxFWYOKxPIEGmRBgYgYGHgy03MKzXSMdIz1TbU
 MzTSMdYxYuDiFICpnv6c4Z9NTaSB50vO9RNM1/QdezxLxeSf3LuLjHGVEc/Pv9r+Ysp9hv9BjC6
 +si9XhKxUS/wW/eCUm9xE//td62X/t2byne+fx84BAA==
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

The driver leaves the controller enabled once a transfer completes, and
an enabled controller keeps tracking the bus. If the lines collapse under
it while idle, as happens when a target's supply is switched off while
its bus pull-ups stay powered, its state machine wedges driving SDA low.
Every later transfer then times out, since the timeout path only requests
a STOP and never disables the controller, and the stuck state even
survives a kexec.

Clear the enable bit once each transfer is done, successful or not, so
that the controller does not watch an idle bus and starts every transfer
from a clean state.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 drivers/i2c/busses/i2c-rk3x.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/i2c/busses/i2c-rk3x.c b/drivers/i2c/busses/i2c-rk3x.c
index fcede9f6ed54..dbf1ed30fda6 100644
--- a/drivers/i2c/busses/i2c-rk3x.c
+++ b/drivers/i2c/busses/i2c-rk3x.c
@@ -1125,6 +1125,16 @@ static int rk3x_i2c_xfer_common(struct i2c_adapter *adap,
 		}
 	}
 
+	/*
+	 * Do not leave the controller enabled between transfers. It keeps
+	 * tracking the bus while enabled, and if the lines collapse under it,
+	 * e.g. as an unpowered target clamps them, its state machine wedges
+	 * driving SDA low until it is disabled. This also gets it out of
+	 * whatever state it was stuck in when a transfer timed out.
+	 */
+	val = i2c_readl(i2c, REG_CON) & REG_CON_TUNING_MASK;
+	i2c_writel(i2c, val, REG_CON);
+
 	clk_disable(i2c->pclk);
 	clk_disable(i2c->clk);
 

---
base-commit: d419d682257d813f6cb7a28e42b35d0edf4ad038
change-id: 20261015-i2c-rk3x-disable-24672d4f38bb

Best regards,
--  
Alexey Charkov <alchark@flipper.net>

