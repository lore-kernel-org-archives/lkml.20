Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4142E3C1D66
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 04:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788151753; cv=none; b=p8gAoQSt8g0H3kTQBTr0qw/eFC1MazRqkxK+qELG6+2PlkgVdlbgF4f6krqO41TUSCnrTZNDzcDLL43csN5c8hKpZdU15ZSoVroGAv7J4veUiSYv3lQXF35/YTdtU110p3v7qNK00nK4Ii6f56HlNPldLb+ANfNEfLOKrtgg/WA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788151753; c=relaxed/simple;
	bh=kNo6YdY+tnvG2KdzifeNUva3yG8J1Asl4yyX1fMA87g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rGgRTXBCtnmeKV7E0AxPEAMVPTvHOJqkDE0hWJ7QiC7n5iF5ITHa3nDDZ2RzuUUaX7WzBluPCekmfm+HkXOlGAV0B4Eye02HqaZTFVZfOWUVu40XslHHjxIveiLGw8wblDkX7UsYaW8hm2DwOnqjhhatFKA3QuknxYXLflvTpsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cDlovnGN; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cDlovnGN"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3966791a6eeso3646287a91.3
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 21:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788151752; x=1788756552; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bq8iQGfvzt1d+4SYb4LSAR03b7kK3VKsffzTguj8T24=;
        b=cDlovnGN1woY+8zxnTgMNAKSkCK5gnD1q4lwD12BBxTwvvMwafiAeV+q3CfJEi6VUY
         SmOUJ7MrtnA9R2NAD0D0biZ/bLtriI1dInyQgfdQ8m+hMfhlVW3/wN4u3h3P0026WvFO
         t2sdp7rJhSv7nLa/H+rP7WeuZaQBnVdtC0sa9MJxVjxnabvPIXE6IU3o+3R6GZ2oQqk5
         JEMW/ZMGGorJU4PAf8F+rc91NA3xaO42QGs8u/RFSfQYjeiHTBCe3L+z4ARO1NJLUAOg
         kyBQKRbSrOsTTUpeMcc4+l6UDgqyqjHMyTV5Z5+1EUE21ND+tXaOWO5AV845nFb+fN1r
         yGug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788151752; x=1788756552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bq8iQGfvzt1d+4SYb4LSAR03b7kK3VKsffzTguj8T24=;
        b=gUGF/Ot2YFNHH4RMBEdOkR2CPWLRX9MSK6AGxHdD5/4ecw2151seblNr8M0jtX9Fj7
         3tqFWVNJCRJKYiWYLZSndB83fo23q1dNgrTCOZguhBw6CW51s8GOU5bN2XU5qgNeN2dk
         n0duUUVlTNEFclKWyOSkXHbAJhUXp9D3ADvf6cJOuMzkMQVzsYRfVvnrtH0MWpa6IAiT
         f9kwUNQkckGT7MY6kfbbLFRvHtE9dKOLafjtaKlFG4r7L8sAUDRhGwr1nSzqGXWvI+cp
         tBCX5vOr21JvVOfMsSx5j5AyIbamesrB7xDxnGImI5ebWRYrsUveXagaQ6/402RxrvbX
         U7QQ==
X-Forwarded-Encrypted: i=1; AKwUvBymvxJiELQLwYbtnu4mzESbTkdS2NCG2GMN6kXAGKen7hlz+egIm9cpkKXTGmuZeSwlJo0ZRMg2XlU+z5M=@vger.kernel.org
X-Gm-Message-State: AFuF++ntwSRVhauIPbaU2WeXLcIK+WPAiHjtx1AMjmDcmBnuZp23vOJN
	wrN37/+XdEV6VQM7FexCQiuT3qiuCI7PdnKJIRHD7Rgt+l9c18Ul8IRE
X-Gm-Gg: AYBFou3JpNBYJty6U7aJ3FLFUVloEZwQ3szGif2mdL4i82MogFUwYyMCx/6GqsED1bD
	jGpkQaex4V6kf3aCqpnGYEz0Sf/nhrzTOXIcu84kFKFQc8LLtqvtBdgm0OjObl//+arJiQD9wqu
	xYvXN6pAecnuHU/qiFY7C0ryNUwe+Cd0ywM1SNR/rZ3fm5uzl+FxbjGgNUyt3ZUuOr+PFpX0wOL
	Sjh03BvdoccQwp5bZu8MHzZbgbMX9pVTJPq8RM1CQ1P5HUFqH9GZcigrvkVpefOVlRt0JgNIeHa
	KuYiBtUZ+DsTwBwRZSCv3TVk5odpC5AnZh6fSgV18duNz6B0O9l5bkec9hs01BkPhLKXqgV8Zde
	tBPZj0tK6taXfvbWhAm1SodOIvaDz6WMp9iY+DorrMeScY/8GKm65h8wXGXY1l7oEq4M0mX6+xl
	gNdGKU0pcA+en0oZFwA+xyzoHadfDmvW7vrwNn5GgwGp+sEv7dA2dwRkN2t2/1IXjVTJ9CuheGH
	kcLBEtu34vakw==
X-Received: by 2002:a17:90b:17cd:b0:398:bc52:825b with SMTP id 98e67ed59e1d1-398bc52849emr14859186a91.21.1788151751644;
        Sun, 30 Aug 2026 21:49:11 -0700 (PDT)
Received: from d.home.yangfl.dn42 ([2a09:bac1:76a0:d30::4cf:2e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b0fd5c34sm19345763a91.8.2026.08.30.21.49.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 21:49:11 -0700 (PDT)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v11 1/5] net: dsa: yt921x: Check lock status with lockdep_assert_held_once()
Date: Mon, 31 Aug 2026 12:38:54 +0800
Message-ID: <20260831044818.4103477-2-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831044818.4103477-1-mmyangfl@gmail.com>
References: <20260831044818.4103477-1-mmyangfl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mutex_is_locked() was used to check the lock status. While it should not
be triggered unless a bug is introduced, it does not warn on lock being
held by another thread. Fix it with lockdep helpers.

Fixes: 186623f4aa72 ("net: dsa: yt921x: Add support for Motorcomm YT921x")
Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/dsa/yt921x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/dsa/yt921x.c b/drivers/net/dsa/yt921x.c
index 159b16606f6c..44fcdd47ffb5 100644
--- a/drivers/net/dsa/yt921x.c
+++ b/drivers/net/dsa/yt921x.c
@@ -198,14 +198,14 @@ static u32 ethaddr_lo2_to_u32(const unsigned char *addr)
 
 static int yt921x_reg_read(struct yt921x_priv *priv, u32 reg, u32 *valp)
 {
-	WARN_ON(!mutex_is_locked(&priv->reg_lock));
+	lockdep_assert_held_once(&priv->reg_lock);
 
 	return priv->reg_ops->read(priv->reg_ctx, reg, valp);
 }
 
 static int yt921x_reg_write(struct yt921x_priv *priv, u32 reg, u32 val)
 {
-	WARN_ON(!mutex_is_locked(&priv->reg_lock));
+	lockdep_assert_held_once(&priv->reg_lock);
 
 	return priv->reg_ops->write(priv->reg_ctx, reg, val);
 }
-- 
2.53.0

