Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793875158;
	b=DtJnPx/3WbftxgCG9GnlbLUi7gGryfGNWayA8rNZwolaPcrAldMWHgsZQq+xUxdnS99b
	 kTUR1TXA47/9SfnA7MKIQpw0/6T2jKZnpNQINlhoNvgNPbH02oQZdr72UXOWvWXAlYhYW
	 gSOdlcztYMa+9xIlH7dFdI1h4q0qG2I8viakXAibNvcSujM3P9DvbwAzNNcty/NLHbQtN
	 Or6vusFfkVeJf9l9KOeAS1AC7jTyCIeYAem2BjyPE7fPQPDv05Pj168cfO4ZuI+rlUoup
	 Y9NrueYJH58vO6D4jQ3EjAbGo7wjc1/GpgTTZrbx9GrxyhFzy0yMpdQG1xpf0xpQa5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793875158;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lNM3+b6l7cj+vrA9YlqTwqxAWDbif1TufQothTfjcdI=;
	b=19PiflRuzkzXzESe5lcmXK/g9NRT3qH4ySN9e0q4DtYg85AWWQG6o5lvVCJ3WJP7LdIY
	 X9qYqTLYrZkjt6I+OBRxNiIKSLizxi8dFxPbpglE7pw8LDjVKo9e1LIUH1iravac+nBD/
	 i/MoDWwE/0UkO+VCn4YmHG4G7jvCascL8oNdLSaOyLnMXiuDtXC7e4iJoj4E6xgUn4Arx
	 ms5Yj4OsEn5fEutSNlhn6O/ObtjkBUnnt5YDwqI9oKc3XO8GLxJ9zFe59GoBpA+vKKE9O
	 4WttMjLSRGtYiVPsA+H1in7a/Ep0Lg1HsRMtlFqQRvVEfKrj/wsqbH9utK8Jt4n9ddg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pjCh0fq0;
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99EF1606A32C
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 10:39:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99EF1606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pjCh0fq0
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cc52c1b8286so287423a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 02:39:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793875157; x=1794479957; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lNM3+b6l7cj+vrA9YlqTwqxAWDbif1TufQothTfjcdI=;
        b=pjCh0fq0qx+RNgxteK0ZIrGAFkwaK45cQnfyhJnWe9tGbhkOh1qz4FAwd8ZB3Az4Wj
         GNum45Q/Z6wdUou/T+LuctSFESp5JmHqKQwpdqhOSOvmFBt1QU4PDhvZyapHupyEP74+
         /kH2qFPPlVrdL97cDxTh1BXqfJw2EgEv02fjjMT94KG+Bqke/ueUq0Cio+ohZgFlxe5n
         UcO6uvd8wyhS4tZMCQhCyi4uYcy8NQxSkJs+Jpg8g9aplG7nRzykcOFycZX9lqCfeXkp
         w3zbCh97UVSKQ/eOR0wnRX1ICDV6gnSsMXl1N8yO6qv5qXhvIKy2WwEeSupt5eNFlCWu
         p96w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793875157; x=1794479957;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lNM3+b6l7cj+vrA9YlqTwqxAWDbif1TufQothTfjcdI=;
        b=MwIEv7Vpw4w9f2NnXgAy4g2aocZQXIVUHBPrNFiwKJV2HT69lEZ4rlayDJGfYoIBAn
         5bz/ZAINmOjhm9pF84qpi3knYJdb4oak5DUj1UwJrqKOb4wFqhEqn9bFVDANzDv1yvlt
         wvhnRrwmAOSta6vu7037RbdbJSpck1+s7PW3pX54sgKO8/LvwIVT8+sQzR77mkP0ml+w
         /1e/axh9/wvpWdn31xW+pzcV5U9gJ2timCMOp53hpBVEdi77go5ldBYLKU0ZZExIp9Nr
         tKhe2GlzHRfmiaTkJtOifhXxpIEDTDGoGy1R681xFLOhTi6Sve0fRUDEg6dwU8OdBV7e
         tzrw==
X-Forwarded-Encrypted: i=1; AKwUvBwvyiJrJ4tPtiPjFbZg9xkdkBJSAVoi6l/8A+90b94E9jzLG7PTpXdaNLsGHflD0FVotIZ8hYo+T+svv6Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Ti/l6vGmypPnpgItKoMZWZO7HhncfLfUAUb5EO2nZUbhEZF/L
	tNcI7KnX5D6Xmd5cYw5IfjBTvm2WHD95eSezQmrByD0Z+LocyF1KvJ2B
X-Gm-Gg: AYBFou25lIo0LJtbA2gYQ/sdITQcu8MFwHVaXNL2Vcsftc9Tv6RrfmvXr+LvN6sZ5XU
	kFz2vkA2ftPDm7Wu4GykrgJw/bUgkGtV5LbBShqB/5hiUuxSW+c/1w6iydtENNrN1xgfmkkK8lG
	Bb+8Y+wzSrf7fpcBFyhSHtxdC6U0je/9LaRb/iO2fpxP9fQF+IW00BYQn57kCurgXfUiyno/K1E
	9PpWKxozLm3E44Tl0i7Y9KaMXv3TjgzFzybqhzhnrD48VZ1rMlhESHAq3Dg0jmh6vvztojXm3I9
	DeRYRSZPx1XP5RH+ESIvrYJuo1qN1+S9o53aT2q5MTwcSs8VSiIWoqFDTiQS5ac4SY0qm81SEJs
	0dbJ6arhGGl00bZilnESvdrh3BemSgI+p0TufIAd4cPf5vwtjAhPC0EmSfPdGT3Qspb8W8fk9hv
	yyZoOPfMF+7HnEYXMgi4puyLSrQQRkBd1e2lT2Utc4roN0lOyLQjRAcMQWROwbVEyAaZiDzaiUs
	jHz3w9QYnBQsT+DiBeQRn4FoGJyYD0w+e9rzr8lOmkICjIcnc+6DkVB1XAuMJnH9yPQYD3bHG+d
	y0xSKPkvJSH88O0eERkzwboRydVYvqWe541RMC6HVgtb0tqvs/eRQHjbMiifdse/6tXyXA==
X-Received: by 2002:a17:90b:5590:b0:3ac:9098:f602 with SMTP id 98e67ed59e1d1-3b0afbedfe6mr1784736a91.6.1793875156797;
        Thu, 05 Nov 2026 02:39:16 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb4694a0e0sm2150791a12.20.2026.11.05.02.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:39:16 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: David Heidelberg <david@ixit.cz>
Cc: oe-linux-nfc@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH] nfc: pn533: validate response length before parsing DEP ATR_RES
Date: Thu,  5 Nov 2026 19:39:03 +0900
Message-ID: <20261105103903.1440114-1-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Hyunjung Ko <hj351016@gmail.com>

pn533_poll_dep_complete() and pn533_in_dep_link_up_complete() cast
resp->data to a struct pn533_cmd_jump_dep_response and read its fixed
17-byte header (status, tg, nfcid3t[10], didt, bst, brt, to, ppt)
without first checking that resp->len covers that header.

On a short or truncated response the handlers read bytes beyond the
received frame:

  - rsp->status is dereferenced with no minimum-length check;
  - for a success status, memcpy(nfc_target.nfcid1, rsp->nfcid3t, 10)
    copies 10 bytes from offset 2, so for resp->len < 12 it reads past
    the valid response data. Those bytes are then handed to userspace
    via nfc_targets_found() (netlink), which can disclose stale buffer
    contents.

target_gt_len = resp->len - 17 additionally underflows (it is u8) when
resp->len < 17. That path is mitigated downstream --
nfc_set_remote_general_bytes() -> nfc_llcp_set_remote_gb() rejects the
resulting out-of-range length -- so the subtraction does not by itself
over-read rsp->gt[]; the fixed-field reads above are unguarded
regardless.

A valid ATR_RES always carries the full 17-byte fixed header (the
general bytes, if present, start at offset 17), so reject any response
shorter than sizeof(*rsp) before parsing it. pn533_rf_complete()-style
handlers in this file already length-check resp->len before use (e.g.
the ATR_REQ_GB_OFFSET check in pn533_init_target_complete()).

Found by code review; not reproduced.

Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
 drivers/nfc/pn533/pn533.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/nfc/pn533/pn533.c b/drivers/nfc/pn533/pn533.c
--- a/drivers/nfc/pn533/pn533.c
+++ b/drivers/nfc/pn533/pn533.c
@@ -1309,7 +1309,12 @@ static int pn533_poll_dep_complete(struct pn533 *dev, void *arg,
 	memset(&nfc_target, 0, sizeof(struct nfc_target));

 	rsp = (struct pn533_cmd_jump_dep_response *)resp->data;

+	if (resp->len < sizeof(*rsp)) {
+		rc = -EINVAL;
+		goto error;
+	}
+
 	rc = rsp->status & PN533_CMD_RET_MASK;
 	if (rc != PN533_CMD_RET_SUCCESS) {
 		/* Not target found, turn radio off */
@@ -1929,7 +1929,12 @@ static int pn533_in_dep_link_up_complete(struct pn533 *dev, void *arg,
 	}

 	rsp = (struct pn533_cmd_jump_dep_response *)resp->data;

+	if (resp->len < sizeof(*rsp)) {
+		rc = -EINVAL;
+		goto error;
+	}
+
 	rc = rsp->status & PN533_CMD_RET_MASK;
 	if (rc != PN533_CMD_RET_SUCCESS) {
 		nfc_err(dev->dev,
