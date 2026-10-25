Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792963143;
	b=rh2n/KL4yB8JaX5A8IqrqoneGgPUMEudpay6TKMgocvYgwmuM3Md7/K9z01z/IPrD9ID
	 6IynXXNKmGExPie0R4bqtoNO7Ygzd9i5tXfr6F4Va/zb3GglqQZptwaFziqzVKuM4ECAL
	 41EbtVGfYlIjguPO819gKF1mR9McIWmIs7+StzFiJhG/0FtM3oVa+Rsreao31FXEkmAq8
	 rHn8TuGn2eXKOdYJIQtMb00jkCVch8ZcydZiq0PC6kWMR2XWtfxaIqMjAb1nYkhJMZukU
	 KzR02ihpl58OPzH68rz2rsX/D9nOYAivvrJTArchg1C1d0MkzwXkY+zQOPzT37Qv5yQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792963143;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=FXGhUdMYFe84Q2exJIrjjzOzKvQUZFwJp2fh0+1LvJE=;
	b=5U3vZBAOTRX9/eug7G2hVsBtXNMkMCsnJLby7h1AkK8ullFdC1Xqs1BH6JBqI/EEjH7Q
	 NH4VqRJ3JttkfZw+cF9REwhAGETL2PbuRjmMVG2YGP8irOo6q6rMg1pRLg8Fmjxj73SIg
	 kEkKp/ckC+zwaas+tuppoUGTWxopzG7iVtZPACFtj8XSutsBPy1/DgJ45a9diO/XjrT5K
	 XOoqJ19Z5cl0h4F6X+VsxeDkJqGc6GW14wCNCAmC9BTWK07vpClxrQczLHdeTHOhr1Dwk
	 ci5v2KxRNgLfdfvksHRu/2UJEvnd9s2rH+1jPHzAkUhTQOiiftliIjlXh7XtIM+vfTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qWvS9mht;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3087606A31D
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 21:19:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3087606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qWvS9mht
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so8200455e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 14:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792963141; x=1793567941; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FXGhUdMYFe84Q2exJIrjjzOzKvQUZFwJp2fh0+1LvJE=;
        b=qWvS9mhtmyvByJDIHURYFkr/5eqn7i7qDZO2PVNtr0S9vOYi2ETj1lu6AY5XwBDA+5
         o0qgEhlJtFSMQGxXaH/Pe4i40Y02+d+26euInPYWFKl2BMV1zwyjD6tN6q/Z8wy4AEZD
         aw1JLpK94Yu6U4N24cH4l+o8kAAtZAZjAeAAXWzbjxNyy2J2Z5mp9UHyyVT6e/Nk1EmQ
         pzRTvRmtjguPq8FCdDvMPX5ljOcyq78kjH8QysSH5v/yhNjm4qD8KhbnV45/jmwD3X6q
         zUNJNJdFA3BYNaRPdm2zUWgq0ECjb5TxMZ4bQK8MN9rRCBVjf4pYXkCBHP8WhTtq8lLJ
         D49g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792963141; x=1793567941;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FXGhUdMYFe84Q2exJIrjjzOzKvQUZFwJp2fh0+1LvJE=;
        b=Zauq8fMDs3l+9TlVQAxLLyomD4aTeCnlQ+oD+YFcmZpiSDFlIP2itSwW4t9EFJkthV
         bkcdrIZQpjs8af1G9f168gKvDZ0Z0x6j7TkLWVW0Kc9k6F7YOGjIplH9OwckUN6ylNEL
         VkwiZHmBXc+vhlwsr9YZ+AoZq5boFWg3ZTLRBgG35Qti0ucrEMj+loiT85zhAyeDRiC6
         2gemZ/2VFwowGsHI0dx1MLwfXwIny8MwCpCxk9JWogFH011f3y/Vv3oT/d+NQIlBNKx0
         mWPfsjxe/DCKGz8rsRBhgNfA3M0YkBeTxuoLJTDnKka0hfOuHkguq9Bz2wWeTzWk7d4h
         3cag==
X-Forwarded-Encrypted: i=1; AKwUvByvfVm6HOMlIFricYj2eK6aMzOsxB3Z0rnRaatnWhp+K2FMxIOh7URehhv0SoOGdzJ5+piKbbzkAbzBD8Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYK+SSvZVAG+Ze0VRk5bIBXnigkP4dCqv4KJFjmV3rn2JyqTUNOo
	Q9LmgXM0JSmtCwAkVhHqVmcay9GH2ABNo5hR7u2PScre6Nvgf8Bi4mNB
X-Gm-Gg: AYBFou35cr2HyxeEpfAqU/inHXHA0lY8sY6Mf44VdPW+rGrc7u4v1kVp8OVWU+AaD1W
	cxyf3F+c+DgHclZ5LQqyu0RwuegYJRaOLMzR+c1Wo4sTisA1R0eb4jVNmfP9UDRQf3ucf8J2vgk
	UAw+XvKw0Jnj3pW2SDsQ7buRmXBAMnXwVIFzwFq/ov0dl38sgAtEXQ/VnhZjdHZEB4tSNjO4mcd
	eji+CjRqYNRvxjbO07xFwJ7TRDb429AtjbuE4V2G+UfFLsvZzVB/86q4OBTvAck7TalnyRsosYp
	wRGdukJcjLRpEPMEjAn1b/skLYPjiQ5ufKQvp2gBoAc/FXTU8OPHyOJ4MFtRD+lynUh+bFYH5PS
	Gk6JeeCW6fhctq3vVm4tyNMJATBqcXRhlIAdXjvuoIqIUao4J4Yd4jCIN6liaAlV7Vh9jFuuD6p
	24LrHAhM3uJ/w4iszXh0z9P3fFmjuX9b2Qmzz2WgQC3rCer7k/+2BnAQe8hBiDN86XyYcACwNqn
	jSi94HxbJQODNvZjlNFwxuFkTcHxFjKv0xaBan0U5hQ/E5akhbwHBxFcgNh6MAsXEpLBy/VLIwF
	/s6x+0WzPWfJCkKk9RmTcLsi2OuLcBOZCl+YEycb
X-Received: by 2002:a05:600c:34c8:b0:4a1:d675:b031 with SMTP id 5b1f17b1804b1-4a35ac99ba8mr99928915e9.6.1792963140806;
        Sun, 25 Oct 2026 14:19:00 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3932sm13228574f8f.18.2026.10.25.14.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 14:19:00 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Ariana Lazar <ariana.lazar@microchip.com>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Joshua Crofts <joshua.crofts1@gmail.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] iio: dac: mcp47feb02: reject out-of-range raw values
Date: Sun, 25 Oct 2026 21:18:56 +0000
Message-ID: <20261025211856.256491-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.55.0
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

mcp47feb02_write_raw() writes the user supplied raw value to the DAC
register without checking it against the chip resolution. The parts
are 8, 10 or 12 bit, and the bits above the resolution are not
implemented, so writing 300 to out_voltage0_raw on an 8-bit part sets
the output to code 44 instead of failing, and -1 is written as 0xffff.

The out-of-range value is also cached in dac_data, so it is written
back on resume and stored to EEPROM by store_eeprom.

Return -EINVAL for values outside [0, 2^resolution - 1].

Fixes: bf394cc80369 ("iio: dac: adding support for Microchip MCP47FEB02")
Cc: stable@vger.kernel.org
Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>
Signed-off-by: David Carlier <devnexen@gmail.com>
---
Found by LLM-assisted code inspection, reviewed and verified by hand.
Build tested with W=1 (=m and =y) only; no hardware was available for
runtime testing.

v2:
- Use GENMASK() for the upper bound so it is safe up to 32 bits (Andy)
- Drop the Assisted-by tag, removed from the docs in 1e035297ffda (Joshua)
- Move the testing note below the --- (Joshua)

v1: https://lore.kernel.org/all/20261024214423.865635-1-devnexen@gmail.com/
---
 drivers/iio/dac/mcp47feb02-core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/iio/dac/mcp47feb02-core.c b/drivers/iio/dac/mcp47feb02-core.c
index 88bffbab0854..b5a2ac4a2e67 100644
--- a/drivers/iio/dac/mcp47feb02-core.c
+++ b/drivers/iio/dac/mcp47feb02-core.c
@@ -696,6 +696,9 @@ static int mcp47feb02_write_raw(struct iio_dev *indio_dev, struct iio_chan_spec
 
 	switch (mask) {
 	case IIO_CHAN_INFO_RAW:
+		if (val < 0 || val > GENMASK(data->chip_features->resolution - 1, 0))
+			return -EINVAL;
+
 		ret = regmap_write(data->regmap, REG_ADDR(ch->address), val);
 		if (ret)
 			return ret;
-- 
2.55.0

