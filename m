Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794411911;
	b=sejIHUD4LPVTG0OIKiZreFSIz736Z531kTbYua8YmKmDHc3PkRT2dHkMFMPmjrdjXDPk
	 gjaLcRgJb7f1ICYzuJwvL4ndgOSyJ+aJBjkIW0hPKZDysFh1Ms8VcOji33TOGHDztTdB7
	 E1XEg77AiH0p24m2On7mPOrEtMDSzQ5AOwWRZt0rTPCcEqg58t4fTDUQPTu1zdljzak78
	 5paXP76eUitbEOKb8GyiPjtM0KOgbRvjRQRQsYgssDRNxyWvss4LZXr+C0yIOgVY8W5Os
	 YfiU4xOIi4uStJoYI+aixFrM8stjHhYLJZf/N10yOEzct6kAN7xCM1Fl3ytsqy7eDWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794411911;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YVhpQdien6ClW81XRhljqG17Ko+dXVxzUCRkvlPhS+s=;
	b=BGPRX7xUZocIg6wSHVoXi3OstrDHAg+74d1HSy6L2l3JmiWHGnvg8EeiajKH9OfOsTQk
	 nbGczZj1frpyDFYrWhOxnvA9xrxXKZYijH1Wi9tO+fuT6l6ft0s2Q7/luAKSRnygM73FX
	 I9OkCdr+j331qXl20LGF1x1NFBLJwG9WvTbOeGFEmQwpeSQzzAxn9Y0NAphkAj1+LERev
	 rn2ztEv+If4gub8hYnol2UkQni+XHJUWzJYlPA9wqlpLKKCJ0JKW7x1JvycqdrZQ2EVY5
	 GDTDXdIOnDZGBZr0yv4zaGXf7J+UsolOL7wR7RwDsPKfBWYVYy7M2/RWlEtlxtkebdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N7eQiWBs;
	arc=none smtp.remote-ip=209.85.222.181
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C46B606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 15:45:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C46B606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N7eQiWBs
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-93f22a8515eso266429385a.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:45:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794411910; x=1795016710; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YVhpQdien6ClW81XRhljqG17Ko+dXVxzUCRkvlPhS+s=;
        b=N7eQiWBsJoz1GfZmtmTsNRAJN0A0bODBk5+JYy/c6BAIKZtPkUFoZcR5hLaK99LX8k
         4cgCEbC96C8iztbsYDb5TaCLcBYM+qk5o1DOMTWUEwqJQ6cP9R5xjwcQwD3NbtHOGY+R
         iGFVbU8TTiAQSDckgLgYaudMbdpLrQuoKRHKXqZEdVoWC6Q1P3zZ6Xo8X4/dykwBirEA
         9ypnR8aucL2ziH0x27HJF2utvhazPfgE9y+sCxn//cwWah0NQGhuAUJ2L969gCy/iTGG
         vi0c/MzCQuFwyby+cIIz8Gg59mOaEVwG8R/KSSpknhkS0BN+Y+Bb9AL6mpcP329cScTc
         xXFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794411910; x=1795016710;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YVhpQdien6ClW81XRhljqG17Ko+dXVxzUCRkvlPhS+s=;
        b=g6gIbBvwKdjx0srJwI6yEryoFb0DjqmoljIYH++pqDkNsQkm9i3OVC9xDMktJoVZS9
         ym3OYX5Olrc6XpvqN7+Z+Rpf664LG2wjmhoxc+mN1/k4kjQIl8yXQH8mIHQPiNiTrHAn
         6S7rFV/fjimXjdpUsOGRPDmugOtspy1eEUpnC2+Yp0PHXkOwsARi+QzPFJkjUvBRz6JV
         O9on+KWpFQWrwJbIF3bXiZ9o2FARVN5wiLI5SdTcERvpauUz6XUvotJlbtUGqm3Gwjuo
         hREM+986K8cWASyqYO4NIC99R3t2aEPc4kfFz7BAXaft3UJQfAJej1c33CfhqGbf5xpd
         KGtg==
X-Forwarded-Encrypted: i=1; AL+hErEDWFnk75c4JWq7i1pVZ3+P0AGNilZvzS2ab1c/xRE3ttY6kSMw28ZvJYbPulu4yfOeDRua502veFUBlL0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9FS0E0UtSYCLwZ3KdcwPopm2P0AkA1kUy7Wu/sc8GhirOgAQ9+
	c9aVf3CB7evLL1jddPCLtSZiDFNXgVy7prbmjgBpXQ6MkhJG4xiHtgEl
X-Gm-Gg: AYBFou343NCQxDkuRPLK1QAWzzC6u8ulIqYei0zU6H6SSf/9ldRZh1FvRlYLfLOVIPo
	prl8FjnKX1OE+QsKncjC0alwfJ1TU4cpt9iRvmbqCy9oxt9pm9/d7Baj5Mtzq6NpOFTTuyRUImm
	iQGTOiorBqtXJdxeWJiRnOaxcQSGHUQINPdT1bM185Net5hCPm283szEVxYXGSFmA6wqj12wO8p
	+1/R6J7M9hDJszdQJwRbbBx1lDKfZrsuzR7nfPwfdBnGK4RbmKrlfFrZE/Qra5Q2tf0AAVcoUD7
	OCfcqz9JLZwNbnjsLr8ZcEIjeQd+g40Gjea8UznMUwFWNxfuRKl/ayztbR+8z7dN3hqMBJqrhhD
	G1a8BqBmH9CaYgObZNXHFt5N9TRSIL2pMBqlH/9LoZp3eE23Y3maSlUn5vjcUxnXGPDWw9Kxdfp
	84GYREeBOYkrV4h+gXgH+j6qkcm/hkxTFxSAUGA7Um5a9bsFdoLRx9SrNccbjIMAvOhV5+QaKi6
	ZhsTFclwXxUQzFspWUD7NvSl4XKULtQM4eCHtLu8T+K5TRaipN8iuq77UdoWR0uAkdI2S78sVka
	vatH6Vlish7mBnwBhzwN+wXhq3nFsiuv3zcoZcs78HnRZ4T+ACtLPZY3Uhzda5FYdHHImfWGWOz
	Pjcz51q2LO0jFywzNmfbp
X-Received: by 2002:a05:620a:1a02:b0:945:f275:76fb with SMTP id af79cd13be357-947b002ccbbmr439213085a.42.1794411909629;
        Wed, 11 Nov 2026 07:45:09 -0800 (PST)
Received: from linux.. ([8.34.174.240])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e7f2edesm510783885a.40.2026.11.11.07.45.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 07:45:08 -0800 (PST)
From: Changyul Lee <lcy8047@gmail.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Changyul Lee <lcy8047@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] usb: typec: Check the alternate mode ID allocation
Date: Wed, 11 Nov 2026 10:45:03 -0500
Message-ID: <20261111154503.3621477-1-lcy8047@gmail.com>
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

typec_register_altmode() stores the return value of altmode_id_get()
in an unsigned int without checking it. When ida_alloc() fails, the
error code becomes the ID, and the alternate mode is registered under
a name such as "port0-partner.4294967284". A second failure on the same
partner then fails with a duplicate name:

  [    0.423055] sysfs: cannot create duplicate filename '/devices/platform/altfail/typec/port0/port0-partner/port0-partner.4294967284'

Return the error when the ID allocation fails.

Fixes: 8a37d87d72f0 ("usb: typec: Bus type for alternate modes")
Cc: stable@vger.kernel.org
Signed-off-by: Changyul Lee <lcy8047@gmail.com>
---
Changes in v2:
- Add Cc: stable@vger.kernel.org

v1: https://lore.kernel.org/all/20261111041446.3072716-1-lcy8047@gmail.com/

Found with a static analysis tool we are developing.

Reproduced in QEMU (x86_64) with a test module that registers a port,
a partner and 63 partner alternate modes, and then two more with
failslab (task-filter) making ida_alloc() fail with -ENOMEM. Without
this patch, the first of the two is registered as
"port0-partner.4294967284" and the second fails with -EEXIST and the
error above. With it, both return -ENOMEM. Same result in three runs
each.

 drivers/usb/typec/class.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 54c7810b563b..29fb13ca9f28 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -641,11 +641,14 @@ typec_register_altmode(struct device *parent,
 		       const struct typec_altmode_desc *desc,
 		       const struct device_type *type)
 {
-	unsigned int id = altmode_id_get(parent);
+	int id = altmode_id_get(parent);
 	bool is_port = is_typec_port(parent);
 	struct altmode *alt;
 	int ret;
 
+	if (id < 0)
+		return ERR_PTR(id);
+
 	alt = kzalloc_obj(*alt);
 	if (!alt) {
 		altmode_id_remove(parent, id);

base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.43.0

