Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3017B38A701
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 23:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788997768; cv=none; b=Tq+bR4oTxNsoUqkPGvmntFDddWDK4Jw8IVmr7mO8FXG4++YLMLoroP9jQMaC84DaXtjyPWmQvtN16XcavJq/BZw9ZGm+EHyxSFGjKltDus8YmEK8ZVh3mV9lh+bLBlK+h3zesaRFXm9MYZ0mL89LBOChI4gM5QZuxXyCWpxaMWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788997768; c=relaxed/simple;
	bh=b3B8qTwazD/WqjAEKg6c/DeHJmjZWB1dq6RUMXStfec=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OYpA6Uwoc7j+dpo2PPwCQvjKYwUqtZprT8FqnK9/0rv3KIDCZ4wGjow+8y0dlKhC8mn9QuO+iqSwSN/VQFGyy02/f7X2mR6I4Wg9vA/LWKsW/cN0yLFtcnboWDz7mX5Nnr0pc7m3XB/43sNnJiIhn8x3hLYgij5WEDM+A6wAxLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=boHUNPqi; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="boHUNPqi"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cbedf433a99so6000673a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 16:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788997766; x=1789602566; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mBdqkn+MZjqTmKgHL9Xc2cmRqSPJ6h7jxkX6xeYpsAs=;
        b=boHUNPqiavlH/DZ+kb+TP++WKWlZi1DFWNgbuSDgzgE2FXtx/CPJ1qttEJby61v6XE
         8+5DvJckSkq22YQkGYE+cQWDrrw4G18USCcrjYxHuNqfZYPEiPOksmGGWSOvDrWrphn+
         5LdtmHMoTXfIVX2Hx3+F4xn8scMLQ7PZMFRJHu8VvlYODJ/W6/W0/hb+wAn2ddOyPgzw
         vZvOBRDtbL4BWtgQxXF854AIDOM1TlV0i+MpnuVabIibdeFeigh92h0ZdL6dk1a6Hs4M
         TZxYJZfs7mZTeqpXY1o0GZrnpWA+Xw2nAnbjPt539MGsIJBWhUD03olqmgswwEe3RDih
         c/DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788997766; x=1789602566;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mBdqkn+MZjqTmKgHL9Xc2cmRqSPJ6h7jxkX6xeYpsAs=;
        b=Dt7VPTf5kRYyXspRfkvjAW7WAAeIUgsNmWhAXBRi0R7tzzgFfbmX8XYyNDINzjDk9p
         V1mt51SBBHA2tXf+Bb+Tjy8PFEDE07uRADOmeEGbK7PDUlXwyxUvaBpXeYeFH3F5yEUB
         5R7c4hkvJSz+4QBq7vObp3IyqzgErXFbSJgP1lP72NT2rifhxgGHdMssQcZXFX9EexhL
         dLmWE/sbzQmInlOhsSLj/6/yUscxDrkiFbsYMsEyokOvvqOGZv8wh5oivdJH4QSjSVbE
         VQ7uWUmVpOoRbQQHjLr8QEs7UPxBnTGrz9CnzV/aKgm5q+u0WxtmYUvwGsJ++xzv727+
         ey8g==
X-Forwarded-Encrypted: i=1; AKwUvBzc19GBkoBvARTQa1b+TsB+zdwVRCQ6kUgjQ85KLqvYTNaOQ6RGRA/wELi/f0XgXxxOvMeX+l16MaTveoE=@vger.kernel.org
X-Gm-Message-State: AFuF++neummihv/JIlJoJPmnlazSrDuPVbU3QWh0GiBXS5VBHnMzi0Wn
	hkS3Ua12jMUxMjOhb7OPgPIWD9uNv81IWyuTJhe9wYcwjswGULyrCXDlXhPQNg==
X-Gm-Gg: AYBFou1HsYmecLeKQHcj/te8YYqAhBZ+PlnumiAsZIqNGSXi+oAmCy6/IdU8UTcuQGa
	iPuN8X6NF2k5CkdWb5MxvnhwbdCcYOimKz7YPOXHmozK5Q0B+91LsR5a1wwWRroIVr44wXbd6w7
	NoNe6MU4rdjLWHBcLwdNXsX2ngtx+8GbfRf+78BEnWw0F7BfUF1KtZv+avy3VvWJ9PhoQPg9OEk
	0Om7x3NB9cJpkHMYo1/dZNIfzS/hqArUB9qIJxe7talrZWd12mIPCPJa/59kiswb0xtyFmiaAqx
	9J2vhDhhvdvi4IxQ5XB77NNYdfiQJsaUDcjbe/D92Ppe3lLsfIRq5OPiTFdR7jVcyStkQZUKWaU
	fx6PeFMIYmhjbHY8BWe6GdkbnK7txCWOFVVyHmtgVYoXWK+oVRY08rScgkiUGT7YAHMvRArAQex
	CKpTVh9VArEiHleUDQ85+i5hu7cwEktZCBjtLsETtADrXEPyt0JfV5DcIN94MA/bNDd5HjTG0wU
	OOy84KhRMCyNk7MuuT465YUpjy8GZDIdMpQ/FO8jsZ1nqPPhUz/9vrgBqsLFBJyoNjM//MhixMh
	vRSjCEUumXB5IujgVn7qUs9CDPTMepEqg9RwqyQl2ZbvvcgW
X-Received: by 2002:a17:90a:c106:b0:398:e1f4:bda1 with SMTP id 98e67ed59e1d1-39b2624cf3fmr58816699a91.21.1788997766466;
        Wed, 09 Sep 2026 16:49:26 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d7e3f5f1esm581449a91.1.2026.09.09.16.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 16:49:25 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Stefan Roese <sr@denx.de>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] dmaengine: mv_xor: return descriptor to free pool on io_win failure
Date: Wed,  9 Sep 2026 16:49:24 -0700
Message-ID: <20260909234924.103418-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When mv_xor_prep_dma_xor() allocates a descriptor slot and then
mv_xor_add_io_win() fails in the source-address loop, the slot
stays on the allocated list and is never reclaimed, leaking a
descriptor resource.

Return the slot to the free pool under the channel lock before
returning NULL on failure.

Fixes: 77ff7a706f01 ("mv_xor: Add support for IO (PCIe) src/dst areas")
Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/mv_xor.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/mv_xor.c b/drivers/dma/mv_xor.c
index 25ed61f1b089..dd4f150d5fb1 100644
--- a/drivers/dma/mv_xor.c
+++ b/drivers/dma/mv_xor.c
@@ -583,8 +583,13 @@ mv_xor_prep_dma_xor(struct dma_chan *chan, dma_addr_t dest, dma_addr_t *src,
 		while (src_cnt--) {
 			/* Check if a new window needs to get added for 'src' */
 			ret = mv_xor_add_io_win(mv_chan, src[src_cnt]);
-			if (ret)
+			if (ret) {
+				spin_lock_bh(&mv_chan->lock);
+				list_move_tail(&sw_desc->node,
+					       &mv_chan->free_slots);
+				spin_unlock_bh(&mv_chan->lock);
 				return NULL;
+			}
 			mv_desc_set_src_addr(sw_desc, src_cnt, src[src_cnt]);
 		}
 	}
-- 
2.55.0

