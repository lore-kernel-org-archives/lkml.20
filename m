Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794242161;
	b=TE7Fbqai1YPvIuOYlL9KRpXxnf2RfJyIyVQLvY/ToEs5sR45hNuHQkx6+MSim377NQhD
	 ujsVZGYPxRQwbohVeRnFxo4qayAjoePmQ24guQszKJ+sKeN9OVjvAuiBM+OFEgIMRzF85
	 rVfwqhYi7BkCm9bcr8ZqZ+ddJRnV95qu80ml6J4P1jm3Qoy0CZBczMDjk+lqbm+A9KwYc
	 I3AoXnwd33losMk7hOrlgtqu6h+NUnCRXTSJlZ3eB2MrXUJfl+Ud+piE6WuOD9vZCbFmo
	 YxFYLSNz0yFSr6Xxx0Y5vjz0Fwdp3wYWMqjeafPCN+dYSkwyYbrYaT9RNohhsjnLsMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794242161;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=p0Ws7ygKY8Vi+DeyhlAGMxrUOJTmSXqSaf5xFSFj0QA=;
	b=z4PSauLKSVbSN22UmWFB7VshKIw9+WbykC90RsnElehtpteMf3P0OTBO9JDTDxPkNFAx
	 AneBac5m3F8QVYjhwmo1yBdphv++ZHLsZrejU0JdpojQLu1yvbbkFtfh0qzFtbb5trLRS
	 UbX621mZgQWsuzptYnn8WeG6bWFh0PLu2ZeedbvL9r7g2Xj7A6EfWYoYf93ONgQeABnNp
	 Ko37H0T+4f9qhgJpMpl+YzJ5LgYqPIh9MKLZklfJwZBgU1kgcaVcWpbHkGf79fHA73cIq
	 NKKO5g+lNgnqXTDyu5wkYEnzf81Fum55r5qOaSjl9b3ARBy0Kj3p7jTLbxz/a31dIKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Xbk/w0/T";
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B035606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 16:36:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B035606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xbk/w0/T
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso1669016eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794242160; x=1794846960; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p0Ws7ygKY8Vi+DeyhlAGMxrUOJTmSXqSaf5xFSFj0QA=;
        b=Xbk/w0/TfVH4/UU2zpWwpxr9jQgez0pNvC/PnpIFSJ3eDHqcLKc+tVpsEdD7wq1768
         mrQP9tdiXn79uZ3nMPLCTA7oP/7ZUdG7iH0l+dmu1HxoweIZvNzQpEc32oUf3D+IkizT
         t3gad/cu6rOOqxnSdLM8dgDmKnnd4G4C38y73NKGDVFzw8AIvBu225d23QidxR6rfWLA
         nIET2u/CO9Ysxwfuyt1RvyiPnQuSEASQZIen2DeW07gpJjE4PuRib8HYWTIi5ajqjDSB
         V5gOxk21Ajt3x7soOx3ZaD63Mt+DvDSBD6nkzsjD1pJTS0jMzz9spMs1x3fEfkbTAWuP
         9JDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794242160; x=1794846960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p0Ws7ygKY8Vi+DeyhlAGMxrUOJTmSXqSaf5xFSFj0QA=;
        b=i0Yjrgew8WFY5nEjDAdUoGcxQWVnasDw/zqn/G0W4J88xEowEHMpImB7nh9pyvB8zn
         7rPV6lp0AOJEhtywfBzulyXM3ThB+4VQFhAs4zHGj1Ihh+Gaos5Ms9hna5H12rKK2stv
         JWrlIpR99+Xiq66SyKmkxWsXqNp9VQy9vCRgKblkCzzjdcZZ7YSo6CFH3Eb+3mnSwgHu
         9WZw48kLIDZv7V+zkF22lk2ds4CdtREI3dV3c+BcYGpykO09rzTyoPb6WjI6ydhgTK4v
         IAzjNoj31uU+VmD0OWFxsjXdpyMygNmrXMSPabDxK35RCr2vB0bngNoBrOw3QEfXL58p
         37vw==
X-Gm-Message-State: APuU4Z9IuNhB99jbLEiXl8aWY0gbCChnL9iH/LGQPaEMsqqXKTq7gQFt
	3EEHNS8XOh32G+Bodsxy2wamsSriSWOMqCzUnWXu/NCv+r5NxZuUew3Y
X-Gm-Gg: AYBFou26y0YTdz9R0Q0E1RN/oZComtOHgHyKdgKE/FhpVskQo5aeTh2Uihrbpn5wkMN
	dekOXs1MjzgQG3b8hYq8cA99/EpAqBQbLhD44anOgSeuf+K9DeMZdkclJV0G8dWwPuPdJAfcZhq
	zqwpcTaiQxKIm5YZ8r3CXA/NQAR+yjrVjMgOn+R3CelNrVL47s2PFnj5vcuhMYQTsTP+FW5MTsL
	/Ie+11QUCWPFtbdeRycVX/oB41NUkAx8X6uOvjgQVrfguQO5EiaCC0ddWR2kebnO2l2NIJlb55F
	7DwFV+dAbxnDtTfXh/cdn9XUkN5qRT8CUDqFjEc1l19KhJM0cNmcTeTY9G8IxfGQYP7kZTNZnGc
	qJVfqy62/iwRThVpzLNiVKJRSUu+iUJPNmnGCMU1j+E5vbBZLc7+vTx+9UTg0E/2GX4jDPKAOF+
	ElorbP7m69KZnHLvkVovuLkiN8+qeYzTvPw9t84IdGSgtxn1ITcjG7yw6nH10ps3Ui++x13Aqzs
	XXiOXjlk/VJ8qkPWvGFGpfKDuQMeHYdZJC8rRo+NqbdwFqNWhfm4PrsTGOGLj9g1MkY5XJirY5n
	OBt6JmiatqWVQzGOH4trahHSmUhthzvQaigkpI1rUyGLHTvDJg==
X-Received: by 2002:a05:693c:88d0:10b0:369:535f:4d12 with SMTP id 5a478bee46e88-37252b4c316mr7879817eec.3.1794242160097;
        Mon, 09 Nov 2026 08:36:00 -0800 (PST)
Received: from localhost.localdomain ([103.170.54.70])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3726561851esm14655931eec.4.2026.11.09.08.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 08:35:59 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: sreekuttan2156239@gmail.com
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	tiwai@suse.de
Subject: [PATCH v5] ALSA: control: Fix parsing of numeric fields
Date: Mon,  9 Nov 2026 16:35:31 +0000
Message-ID: <20261109163531.2639-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261108124832.3058-1-sreekuttan2156239@gmail.com>
References: <20261108124832.3058-1-sreekuttan2156239@gmail.com>
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

parse_uint() passes the remaining input string to kstrtoull().

When the input contains comma-separated fields, the string
contains both the numeric value and the following fields.

For example, with:

device=1,subdevice=0,name=Master

kstrtoull() receives "1,subdevice=0,name=Master" and fails
to parse the numeric value.

Stop parsing at the next comma and pass only the numeric
field to kstrtouint().

Make all parse_*() functions return the end of the current
substring, leaving delimiter handling to set_led_id().
Temporarily terminate the numeric substring in parse_uint()
before calling kstrtouint().

This allows numeric fields to be parsed correctly in
comma-separated input.

Fixes: a135dfb5de15 ("ALSA: led control - add sysfs kcontrol LED marking layer")
Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
v5:
 - Advance past the closing quote in the quoted-string
   branch of parse_string().
 - Ensure parse_string() returns the end of the current
   substring for both quoted and unquoted strings.
v4:
 - Make parse_*() functions consistently return the end of
   the current substring.
 - Let set_led_id() handle comma advancement.
 - Use kstrtouint() after temporarily terminating the
   numeric substring.
v3:
 - No code changes. Retain the v2 implementation after
   comparing the alternative approaches.
v2:
 - Add the Fixes trailer.

 sound/core/control_led.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/sound/core/control_led.c b/sound/core/control_led.c
index 501387287ae6..1aadacfbd3c4 100644
--- a/sound/core/control_led.c
+++ b/sound/core/control_led.c
@@ -447,22 +447,23 @@ static const struct attribute_group *snd_ctl_led_dev_attr_groups[] = {
 	NULL,
 };
 
+/* return the end of substring pointing to either comma or NUL */
 static char *find_eos(char *s)
 {
 	while (*s && *s != ',')
 		s++;
-	if (*s)
-		s++;
 	return s;
 }
 
 static char *parse_uint(char *s, unsigned int *val)
 {
-	unsigned long long res;
-	if (kstrtoull(s, 10, &res))
-		res = 0;
-	*val = res;
-	return find_eos(s);
+	char *end = find_eos(s);
+	char delimiter = *end;
+	*end = '\0';
+	if (kstrtouint(s, 10, val))
+		*val = 0;
+	*end = delimiter;
+	return end;
 }
 
 static char *parse_string(char *s, char *val, size_t val_size)
@@ -477,6 +478,8 @@ static char *parse_string(char *s, char *val, size_t val_size)
 			}
 			s++;
 		}
+		if (*s)
+			s++;
 	} else {
 		while (*s && *s != ',') {
 			if (val_size > 1) {
@@ -487,8 +490,6 @@ static char *parse_string(char *s, char *val, size_t val_size)
 		}
 	}
 	*val = '\0';
-	if (*s)
-		s++;
 	return s;
 }
 
-- 
2.55.0

