Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794819607;
	b=W8p0Nfe/mB2lnA9StoJWCzuPlr9jN7titMIaIo30YbexA3c3RSgedWeGLQMmvofcfiTZ
	 xUsMXtpdYBGvWq3rVuJcIOE+NhFLgbIAqVElqwKF+Qsz6qIFVpldl4DnUkVCkDnGao7LQ
	 n7lRQDT5NdT6SVmvTolfA+rMlSjOZ9FKCsDvGwnL+dIstAraMsMdkAqnGLnTZl2xwydFe
	 /RUGqB3erzRw7MRwBm0gPM1Rpgu4f+CHs7nCEOH21z47j7Q/hRhK0AfXeFNKtAMzCnWcL
	 xhGyO5ZdhXZJoysIt4aEns7XdWVVdDIttA17M7Z6Q/aYJN19BHpNgsgq9QJghkoEczg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794819607;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=muvZdkuFtn0hfXPNvFEMPR8KK69nJzaQNXj8cS0B7Og=;
	b=lu4UBrPU+uMWN72ZwK7oNAicldA9KELvadqSw4NQoF5ohcnG5sQWOArEQRm64i/3OzqE
	 X9o8XVfPgW9S0pdWnMGdEr6ySd4cHHg+P9/172pGAaAs8P52j8kd7EV/xQzbEKBeZ9s6U
	 jRRiMH9t6D0ALOe3wrF5qTJDT0LyE7DYWkcM2WnivZSLoPt5QwGqgSeVt1RzoXyy9KfM9
	 e+Qd0v6RUrVSQ4FN7nv8Qd2VSpOSQV+D/nQzOPd9JjQUAj3HQkk9aAvJq1CJcyVqYhf1d
	 iAO/zn56lvix3zn496sY3eiYdoUh9IvSUrQjoiTU+v/oCRZFj3tXR/bYUuSSspaBoXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ntpUZCCb;
	arc=none smtp.remote-ip=209.85.160.51
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB19606A888
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:00:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EB19606A888
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ntpUZCCb
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-451a49abd8aso3433512fac.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 01:00:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794819606; x=1795424406; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=muvZdkuFtn0hfXPNvFEMPR8KK69nJzaQNXj8cS0B7Og=;
        b=ntpUZCCbXm2wFhbFbXhsgDTYNZw2HUGWwUUSI1oSVaNaS9so3zTtXeSudQXXoe+UBf
         Gfiusd+Co2+kmkuAsIQnUcjr1kF7T6FsXcXTbOWDCfK2fy6p59B2mnYdGl8b1f6W2aGu
         nH+Dd4hUUABrz9JMx9W8SVvgirD5x5KLgWo8ACb/I5IgI6ClVp2y09eIODbmF6qwqS7R
         1HNijtv7tuMN32q6NnPYe68MyuYAagEaTQD0UD9cpEeSiuA9vLSA+4h5i9rYaqbOImsQ
         z94qxCJb3F4FZzrEhETMsravLSPaxpVXOV7eiIHRVSx6TsJPtaco9zPon1VrBL7ROL5c
         FSJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794819606; x=1795424406;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=muvZdkuFtn0hfXPNvFEMPR8KK69nJzaQNXj8cS0B7Og=;
        b=nbNRHUCfBedpCHQqZD/Q3RvNt7+e86WCuQ+lK5lQCdKY/gd3uHUW78bNNHA+8quEOJ
         iqCC+QpwZJH6VMKaGH3PCap+tFbSr0JfUgto/QdP16NcMAGPHz0vp5yNWw+Lg+SmhS5R
         YXCBwWO2BfaG8H7QmwLXK9MG2wNn7HhcDwtdjKsMAnzWam/iTE1dahJyAET1eMjenTme
         dHKSBjXq0rGQ4lXkX2qJUgghtzp20JpGXb/YfLzP5JjWm6UgbERdj5opqb4fvnyUu5Mn
         Vaqt8mbZcgOC+XSO6CMJXtRTaZpeTQOBvc5n3EC78XDW/GyeGLsq+oJgbUv94t3lmhiI
         pIfw==
X-Forwarded-Encrypted: i=1; AL+hErEAhqpTJnaJX/5l6b80Nx8dCr+A0yfsAcw9MO/mIxSFP9dW8OSSFh7ohB8JHBjeyHHsJK0HPqNC2YMUbKk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+KIF0wgMpf/QUSrr9xDR89jTH9QAwtmqlovZqJY+7Qc/D82kqn
	VOh5aTOM8/Kt21r3nCkOtvL9hmWwienh8KAJQJt9hSYAPGcmYXBF6/P6
X-Gm-Gg: AYBFou3zz2x7CEUCoom4i5dVeneeWwgSYgAadCm7Nen3aiBGpvnN27SXSjAXBmU9fHH
	BxMSaZXzkCXtj7zNFAsKodAQM8YWjyBvbYhRzNNxPAwJO03b4h6qKcexBoFMUaWSN3DKtarqGoS
	FurGUU5PAc3V84f6HXKvBTu44kMKLJzv8nISnZVqoX+yMHhruH19ebqX28Rg30kuQAi5gS2kGZg
	KhduywouMaJIk50psSbDq2Qk/bkmqZidDkFOU4QFu39M4gmQQOhNyCSjYubxzacyNwsE4x1rNfW
	j17WhiwfNJe4tmdVfFahqE9Hyc5zwFep271umJpbng3lDu/80VI3TEa2MLLFH/9H+opRI4nDhFg
	y08rD6dsq8SUeNzZVZ0TLGSIGPuwR9M1YOHWtE6bxAzygo33/kolgmUB2h88lkmsKhSdaTGavbn
	DC9vS1t8IJurwSkHR1x6nJlC2/MSNQHGzyXlc3BrqIBO2gJuLYc4f7jilUMxnsgaQUXrgVdp2Vs
	fW5fqj1+dYWlYKhhW9WcMOEpJL0GdUStNP06m0T0ff3Z5bJ9I0X2M2SUgrWI/DSd9bgeCkET23C
	CRuOgpTFOGE5JTmjhOel0ICR0NvXNZQh8zXzJpcFe+L+waQkO/daWpPtafzunYlQFf8RteLw9Qs
	+IJ6WHDbGs3J9B06a8JxW938irhg/W9/U+ow9xm5EuDcujpkoFlLuiGHOeNCDpm2+f6cCwzZ5IC
	E6J4K6cnWeTQpkoRaE5pgPeh43C25YY3l3rchW8Zo+tkgG1yKoqapveIM3QvFDIFCXlDZEMwKX
X-Received: by 2002:a05:6808:4f60:b0:572:d0fb:ae61 with SMTP id 5614622812f47-572d10afddemr4314071b6e.49.1794819605661;
        Mon, 16 Nov 2026 01:00:05 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5750329397bsm719177b6e.6.2026.11.16.01.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 01:00:05 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 16 Nov 2026 01:59:58 -0700
Subject: [PATCH net-next v6 2/3] ethtool: include errored frames in PHY
 receive byte counts
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-submit-acx00-phy-stats-v1-v6-2-8feef8e76cd5@gmail.com>
References: <20261116-submit-acx00-phy-stats-v1-v6-0-8feef8e76cd5@gmail.com>
In-Reply-To: <20261116-submit-acx00-phy-stats-v1-v6-0-8feef8e76cd5@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev

Some PHYs count bytes in all received frames, including frames with
errors. A successful-byte count cannot be derived by subtracting a frame
error count because the lengths of damaged frames are not available
separately.

No in-tree PHY driver currently reports rx_bytes. Define this existing
counter to include bytes in frames with errors so drivers can report
their hardware byte count through it. The counter describes reception at
the PHY, independently of MAC or host filtering.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 include/linux/ethtool.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/ethtool.h b/include/linux/ethtool.h
index c3a41fbd5426..9c3f079d9573 100644
--- a/include/linux/ethtool.h
+++ b/include/linux/ethtool.h
@@ -481,7 +481,7 @@ struct ethtool_eth_phy_stats {
 /**
  * struct ethtool_phy_stats - PHY-level statistics counters
  * @rx_packets: Total successfully received frames
- * @rx_bytes: Total successfully received bytes
+ * @rx_bytes: Total received bytes
  * @rx_errors: Total received frames with errors (e.g., CRC errors)
  * @tx_packets: Total successfully transmitted frames
  * @tx_bytes: Total successfully transmitted bytes

-- 
2.53.0

