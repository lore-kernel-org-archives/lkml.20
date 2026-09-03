Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60516363C79
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 03:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788405415; cv=none; b=rPzE1ZHlKQJTAodU6BLa5+T6/kAJSmMDlDLx7HnOeR1KIwJCH/MwC+VA0U86Kz1wIIGey2NsbVxNKD0FRlvVGgkorrWiilyGt1Ur2Lv4NBVL1aT5gFLlH0OSHs/u85if+1DFvJi4Rnthnn0AXoGh4OGP5Ry6b6DphqpQ+3pPPBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788405415; c=relaxed/simple;
	bh=xHQ6XQWtm/uQmDG4gnrnsHK8rLnojO9qFxm1iB1QW4g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ss7BZTR16T8kFH+AO6wdq5IsNkzsJqi5QaSYcRMAAJDrXAr5BuXPTuqytlX9jfy83FArPswbEIk/KCGiOEyY1k9riKR6jzbOmp5qqhXcVyOqsb4FJe+QB38FmV1ZFNBzDIm6pbw5ClFrLYIu90/dAEREMnHlcHVjKeRKSuv8jE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h5zf3ncp; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h5zf3ncp"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-ca7c1176317so1526797a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 20:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788405414; x=1789010214; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pYMml2DkNP7Frma2GJ2kCIB8Z1oMp3mA1sKgO2NFFEc=;
        b=h5zf3ncpfJZ2T9izzIeNFmDIU0Z1evwgJQPZfngcXhef3vFj3pax6eFM9tddTiQdtU
         CW54hWybVPn/fixhI70e3tOZM1j6V9p7lueKhj/K55OmjcLdnnHjYC47fIHZrzydLLgl
         VPkq6Y1ipJJqlMz8K2bHIVSeWX0cNjouLlGJuNKBA+jByHOND5c1jI8VptWSqEar6H8N
         zNoufZqHW16f/m8FfzcHc2IFZfOExn33eL75R0THRFl/3V7YNvbvPxdMnVo1rxJzWM3D
         g9wCjsr0RnxrXsVe2Wark6lJWxLbfdDMa4w2AO81wmwAA2/zm1p38tefnDra8BfL7pSC
         yydw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788405414; x=1789010214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pYMml2DkNP7Frma2GJ2kCIB8Z1oMp3mA1sKgO2NFFEc=;
        b=e33Ouj611IKmJW1sNGJ27N5i7CLgPG/cfHPgFsi9ws+6v+QJhuBXcu8DOLvZtPz6LP
         mWvGuv+fGjH8wUaPMWyiUBfTuYDLpREjyI5i4LKZjV+sM+zZLskft4GcDc03JOQJ625R
         2dGpUCv0nnvuc6nt/Jw8xcywPco6VOEP5i1zF/3cHZ1QJNTuZfEkppmSe01muaOvg+WR
         ps7yidvkZe6z/pA6cdV6EVv/5Z8tmaKGrAk0QlL1IYpXFrbpuN30kNOIf57kyjBD4g/3
         oB33xs1DpXDB1mo0x/1qcHGrDoZABQfY2d4grwfnoLCEVELX32DPmPh+WscyJhkMf9dM
         dRQw==
X-Forwarded-Encrypted: i=1; AKwUvBwvccaa7TxtxWw36TuTv3x8Iyia/7fNZe+sWiSLrBvvUuboJ/wSMt55PAQfzR2DUw0wDOr8x883eDvt70U=@vger.kernel.org
X-Gm-Message-State: AFuF++nTo+h0idbBJh1/WuRhR/FsydUwJwMHg2xDJZMaLnGKj4caOWLc
	X4Ite+2qWs5/iHOWs8eugoJQctuEDzrGfK/nxKcN6y1x9PuIrdYMNaNg
X-Gm-Gg: AYBFou0uMCFq2a797JtRSji+BwoxyIXkgy80QoNbc6HQFNYvmYEbXzt6o2ESvPMVVz+
	j7csPEyXAdH6MDREahEafxhcbQpQBJ4Cbife9J2p/BSo7VEuqfNd5egymCfU/NqzeaVhthej5SP
	eiz7bTbHHeFI4+LMmcm2EEYknA7R349bOlXobVb+07Vl0X9DzRoEMFaE/uk44zFyEXkOPqwM8Cx
	2x/imTU2ypjYA0uCWZx0xFFBDUtGgmuX3MWKFeVIVkflEBSF5CwuGVKo+U2c41Zi/Dw2OzsBL2l
	1YWOV1YcDiwuRwJHo439qg0nnJxOHzAtWc+iP/yM4wF5booLJqrHlihIH54z9bLQY4IAUauyu1T
	c7jThjq3u82d2I3jYqFF32WqdKLUQNqOFBnzSxUwe9ct3ee9aDK63A6hs0jHA4jbImW1AglJ91W
	WMI/0uTaBL8VZS0Jh/U1GDZcYIi6X9Nqc2WIcM7U3c/PH1yz3+XSNFfb6ulnhKUCNf4I0vnhAik
	zT/Do5p6AeoIzRO2tINv/PM6A==
X-Received: by 2002:a17:90b:3949:b0:398:9c00:29ee with SMTP id 98e67ed59e1d1-39aee208a63mr15162321a91.22.1788405413647;
        Wed, 02 Sep 2026 20:16:53 -0700 (PDT)
Received: from d.home.yangfl.dn42 ([2a09:bac5:661d:3050::4d0:16])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08c397b1sm2244114a91.8.2026.09.02.20.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 20:16:53 -0700 (PDT)
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
Subject: [PATCH net-next v12 1/5] net: dsa: yt921x: Check lock status with lockdep_assert_held_once()
Date: Thu,  3 Sep 2026 11:16:22 +0800
Message-ID: <20260903031630.356840-2-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260903031630.356840-1-mmyangfl@gmail.com>
References: <20260903031630.356840-1-mmyangfl@gmail.com>
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

Signed-off-by: David Yang <mmyangfl@gmail.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
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

