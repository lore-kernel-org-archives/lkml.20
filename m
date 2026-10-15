Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4504E50DE
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 11:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792062158; cv=none; b=ukhEOjLaRFH/4431DfChIl32SeNhVemHDseODtUEReWLuGkAgc4jkXcU9gzv2JKs7q4adq+6mJuv9nVYLyEePAsfhIlD0nDlds1ACRm5VNsYLAXIM6EaIdIB9io7e1+BmBcTc/5aZzyShUz+Y0Cj4Ay0K0KVfGN7Y0vy78DaN50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792062158; c=relaxed/simple;
	bh=PydZrvt86mLHkEgBvRO47u3zMGloSwDUhiZhopFMTMw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s+LKMhKXp8kpZ0zwlfv1rjjjGVlsvgkwnMUO10Cf2e9kTsE2m+T65jioSnVwzB4nrwy1FehtiqybDIGl1mV2/RCjSIj1Tg10umms5xV0SB7UIK43RgF9L6UtPIjUn+o8B8z5viwKsaxkp2A/cSrzrY2QzWWwee3Tn5qy9QczR8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fodO9+L4; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fodO9+L4"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5be3db57938so446275e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 04:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792062155; x=1792666955; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y+QorVKMJYnLkrPsErRwwCkJsDT8x7ezxaNNbTsRw5I=;
        b=fodO9+L4ZDBTEfxQ7fG3fDTw2X8W79kcUUWjHL13rGT1fjX00QfO6rH7CdLYIurne8
         bfLcr6sxHGKJInRAemP3Wj/pqAlRTLO45GU7WmvklrSZE90PagRl7OmbeF/6rSuHEk+R
         UATHTJ1WokDJtztfaX4anWlcO4MosbvKyDcdYB3DFVD/yHZoZDNzq9uJxwFTbiQNPWCo
         rW+kHEr0v1pk5WNfQTRFMQ1ZurMkoMZy2W4E6ks12wTrCrI3UGjc4u89kexVfsK165ZS
         QwYKZe1xnqef4PqJzuTwPLjN2Wt7J3zTBp9UcHexn5pfe+2uZLDDeBmLum68yfGsbpdK
         bgMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792062155; x=1792666955;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y+QorVKMJYnLkrPsErRwwCkJsDT8x7ezxaNNbTsRw5I=;
        b=uIHGdidC3LNDUN79R26wKmidNxVvemo5Qls0t8SE+ex3kx3y9htubr5yGUozKoPjAZ
         hxylOS1s1ck1RPjt5/w9ycyh7GZfXbfLtULV9jYQlbhfSCf3jbGIQrm8hO/NvLN51pvX
         ppR8r5TmyqsT4zjGutXncU8/5ihP33r57H1vMhMk2q8Aa36RvsMRSNjDmvGjOselxlN2
         iyxyHMRXwRIfkVkxdMmHlI0XbSqyk4+8t/gj6HG7lJqn0IOj2BWidwQ4LX4R1wUtD91J
         efDRkygm4wM6XboWgK4s+XaW5FJJVsk0D4yuBLjZY/kHpoOgiY6hU0T66AVXeyM7l4eN
         +Iag==
X-Forwarded-Encrypted: i=1; AKwUvBxs4IW42UQR8VNp8wCO8nKKImq+RCkH548VeGawvtcMfiO8i55bHuv7h7t74CFMpi6n/J2dzGe6mpCB8jc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJV5KJhBEw+AiCI8uLoqCjl6V9L7AeuvpRiqgW3KUri3B/ArRHq
	oiSbJDoH9CqzMGOlFASkjhNssFbH//w7vrWgeCaO3u9sZc8COxBgHWL+
X-Gm-Gg: AYBFou0ipXiMrhnDHWdmLoUVuQMWBgiuvINN5RB1bx5d+qELOZaotDOEXKMCYLSv0oD
	H/f/LrYZElBcyS1QMGoZ4zuSd4TI5EG750oL3fnmq2ODHVbFCu6N0PvrRYrOQ6T2dREQD8pMv89
	eunQUjWP0Hv5kgR/3Mt6i6qzGxDNw1SEp29w0n8knJoqGim8vGbQrzvm9lrJgxUocYa4jC75sWN
	B8zIFt+qXHACs9vRKYFJ+wHHC7p4ujezS4mYza1Dx2Znl+5OcMxY8BHjd5mlpNv/upl8pRvkuRd
	FpyuolFachTqbsPhEEFMNUVQNqi2ZeEAnDiezuu7AbJddHAeHp7JTe1Ja3mwll4YECS+WE3dowQ
	8AZpmYQacEYxhmS3bPuC05wIByUxN7XN/WYa3a3PaGJv8TWT9sfiTi6q2i+IEeBms0lSdZ88WZ8
	avZb+ariZJQmp8svUJMKcaNLuB3mUs5QpKmtF5w+RRVyE34obxW6PHb7By8UPuSM/MW0iTc8wHc
	2t/uxjh7zgl151xrz8Fk8K3NoCjSitpcFw71yBGL+hrri5f+D/+CmlGp9Kj5w==
X-Received: by 2002:a05:6512:4404:b0:5b8:999f:718b with SMTP id 2adb3069b0e04-5bcea0c31b7mr4505668e87.12.1792062154506;
        Thu, 15 Oct 2026 04:02:34 -0700 (PDT)
Received: from [192.168.1.135] (81-229-40-193-no2450.tbcn.telia.com. [81.229.40.193])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be3739b5d1sm905465e87.22.2026.10.15.04.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 04:02:33 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Thu, 15 Oct 2026 13:01:49 +0200
Subject: [PATCH v13 2/8] i2c: mux: add idle_state property to i2c_mux_core
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-i2c-mux-v13-2-778a12cfe93b@gmail.com>
References: <20261015-i2c-mux-v13-0-778a12cfe93b@gmail.com>
In-Reply-To: <20261015-i2c-mux-v13-0-778a12cfe93b@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>, 
 Bartosz Golaszewski <brgl@kernel.org>, Peter Rosin <peda@lysator.liu.se>, 
 Peter Rosin <peda@lysator.liu.se>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3427;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=PydZrvt86mLHkEgBvRO47u3zMGloSwDUhiZhopFMTMw=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBq0LKoIcY9A9AvCh5SSkNgUH2sA6MzgWGCpMpJD
 E06xQD8236JAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCatCyqAAKCRCIgE5vWV1S
 MlhuD/sHP9hzPuDbWoiGI5oiApoeF7AO5OTE+Ih2rYrBbQSQTnM3aUCaCY9EoRwpHw7s4NxTcDc
 Ng8jOu840EZ6aLEei9FlV0T3ibI65xxQ8FDrACZzOc8t26wIT3Pp3I3B/kEhhJ7IjedJxnxwJ2M
 XMdcJtmJuY4LkuGyYg6qs+2jtObGtKHZyjS+948NTUXXOhur05lfDw0ItuT/ipgsDLS3ARS636k
 jUIl9DL4dAZcBVQAySS4dqZNiEhzHZ4oQwKrnebhnggOEcqHM/kZPiT0ixJzBIDDlHDifHnHVw0
 v4AwNrmX5hHJsL9EXKyRssYut5636uyoCORAavn1lfBJTul8ldre6RrzJe8Xim8tn2TUENm7pxx
 IhC0pTYYS5+5lVc5NWAhh1Em7v8Tbcyi1DTdD6buIF/uet2V2I/DFyyfeVbnD6O+7lmBLfsqKSn
 b6ZSzblNKKNWlDav3tFH7nGNOufo89epKLFWQbPPLrUIOV1XPCez9vUNeRvsphkJ1H3bfBQE62B
 /+HzmxudhAkV6ydctNGhcm+ZI6aHHhnLmjuSO2OWCVifk7Kz03kLSFDiGXKUX9TVTLumWGRQ2dp
 9L5yX6Gim8QwZx91chiubHWKYZh78CkloOtBj8b/082kwHMZo0Bf0h8fsVdnuygz/XmESsx4TE0
 LHaiyT3mh9pvkgQ==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127

Muxes treat their channels differently when idle.
Let the mux core have this information to make it available for
internal use.

Possible idle states are:
 - I2C_MUX_IDLE_AS_IS: Leave channels as is when idle
 - I2C_MUX_IDLE_DISCONNECT: Disconnect channel (set HiZ when idle)
 - I2C_MUX_IDLE_UNKNOWN: Unknown idle state
 - <n>: Enable channel n (starting from 0) when idle"

Default value is set to I2C_MUX_IDLE_UNKNOWN.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 drivers/i2c/i2c-mux.c   |  1 +
 include/linux/i2c-mux.h | 57 +++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 58 insertions(+)

diff --git a/drivers/i2c/i2c-mux.c b/drivers/i2c/i2c-mux.c
index 53428098ddc7..94cc019b222f 100644
--- a/drivers/i2c/i2c-mux.c
+++ b/drivers/i2c/i2c-mux.c
@@ -248,6 +248,7 @@ struct i2c_mux_core *i2c_mux_alloc(struct i2c_adapter *parent,
 	muxc->select = select;
 	muxc->deselect = deselect;
 	muxc->max_adapters = max_adapters;
+	muxc->idle_state = I2C_MUX_IDLE_UNKNOWN;
 
 	return muxc;
 }
diff --git a/include/linux/i2c-mux.h b/include/linux/i2c-mux.h
index 1784ac7afb11..17690f4f0dbe 100644
--- a/include/linux/i2c-mux.h
+++ b/include/linux/i2c-mux.h
@@ -14,6 +14,11 @@
 #ifdef __KERNEL__
 
 #include <linux/bitops.h>
+#include <linux/i2c.h>
+
+#define I2C_MUX_IDLE_AS_IS      (-1)
+#define I2C_MUX_IDLE_DISCONNECT (-2)
+#define I2C_MUX_IDLE_UNKNOWN	(-3)
 
 struct i2c_mux_core {
 	struct i2c_adapter *parent;
@@ -22,6 +27,18 @@ struct i2c_mux_core {
 	unsigned int arbitrator:1;
 	unsigned int gate:1;
 
+	/*
+	 * The mux state used by the driver when idle.
+	 * Possible idle states are:
+	 *  - I2C_MUX_IDLE_AS_IS: Leave channels as is when idle
+	 *  - I2C_MUX_IDLE_DISCONNECT: Disconnect channel (set HiZ when idle)
+	 *  - I2C_MUX_IDLE_UNKNOWN: Unknown idle state
+	 *  - <n>: Enable channel n (starting from 0) when idle"
+	 *
+	 * Default value is set to I2C_MUX_IDLE_UNKNOWN.
+	 */
+	int idle_state;
+
 	void *priv;
 
 	int (*select)(struct i2c_mux_core *, u32 chan_id);
@@ -38,6 +55,46 @@ struct i2c_mux_core *i2c_mux_alloc(struct i2c_adapter *parent,
 				   int (*select)(struct i2c_mux_core *, u32),
 				   int (*deselect)(struct i2c_mux_core *, u32));
 
+static inline int i2c_mux_set_idle_state(struct i2c_mux_core *muxc, int state)
+{
+	switch (state) {
+	case I2C_MUX_IDLE_AS_IS:
+	case I2C_MUX_IDLE_UNKNOWN:
+		for (int i = 0; i < muxc->num_adapters; i++) {
+			/*
+			 * idle_state is incompatible with channels that have a
+			 * different clock frequency than the parent adapter.
+			 */
+			if (muxc->adapter[i]->clock_Hz != muxc->parent->clock_Hz)
+				return -EINVAL;
+		}
+		break;
+
+	case I2C_MUX_IDLE_DISCONNECT:
+		break;
+
+	default:
+		if (state < 0 || state >= muxc->num_adapters)
+			return -EINVAL;
+
+		/*
+		 * idle_state cannot select a channel with a different clock
+		 * frequency than the parent adapter.
+		 */
+		if (muxc->adapter[state]->clock_Hz != muxc->parent->clock_Hz)
+			return -EINVAL;
+		break;
+	}
+
+	muxc->idle_state = state;
+	return 0;
+}
+
+static inline int i2c_mux_idle_state(struct i2c_mux_core *muxc)
+{
+	return muxc->idle_state;
+}
+
 /* flags for i2c_mux_alloc */
 #define I2C_MUX_LOCKED     BIT(0)
 #define I2C_MUX_ARBITRATOR BIT(1)

-- 
2.55.0

