Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793822203;
	b=f5sZp1tKu5uYwFV2pFOnbXs/bvVTop+ZllYCA2JvzzzB3ib9D5yNJsCVvBdyAFTxG49V
	 TNlAZ1YrQwsWxJvQ9+6nHcuBXJnP4cejFXeCNtojPMvZ3EyrSfKqJYGGA3YFlZoOSvN8V
	 U58QW8PcabbFswACvzJO9VwrjF4pm1QGzLbCkRJ3H+5nFADD4ByGRvCZM6ugCzbBoedeG
	 LtAK/q6zkv2h1CNP/ofi/JqryMDoofSn7Jimu2KVi33Ie1jOfRa3L6sLI6UJsm6SqJ58p
	 elgY2LujeKQeHC6navSRDQVjCIo7MCLFd7e91wkucp1gxT0G1Cd2GGaFuuV08BI9okw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793822203;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zR7X7uE7v/00IVsZHFoE++N3oXIHliCA4DwI/o747n8=;
	b=f1wyc0Rg4nkFm2NxuFlP9wIvlVWSQHSzy/CnK6th7hH34WRVVTvryocCNdWihge3ssag
	 0TutbTENVXFCYgjq45UGosAcXPvl9KEMGC6yOqtO1lQhcVU/5F9YvZIkXtyUdnH/mRbmP
	 6puFmEXNcXxeoPhW52almX+Ospj3MTfyrp+nsrTUMfT12vQd1s2z/M8ZZj6+POnvohGMg
	 OO8UBzCCk6fFqa9gs/HA8KJN8uSEl/6JiLIodTl67vL8z+PyuGU+SoIGolSiCwWF7NEPx
	 64LLYqu6MRD1M5t0ZOlb12MqTIqqhVONh6x6/8BCTdtnUhWlGgyNZsWtykJuxrTMhVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=is.s.u-tokyo.ac.jp;
	spf=pass smtp.mailfrom=g.ecc.u-tokyo.ac.jp;
	dkim=pass header.d=is.s.u-tokyo.ac.jp header.i=@is.s.u-tokyo.ac.jp header.a=rsa-sha256 header.s=google header.b=EJyYJZ3F;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64808609C062
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 19:56:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64808609C062
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=g.ecc.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=is.s.u-tokyo.ac.jp header.i=@is.s.u-tokyo.ac.jp header.a=rsa-sha256 header.s=google header.b=EJyYJZ3F
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3550c917fd3so1627462eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 11:56:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=is.s.u-tokyo.ac.jp; s=google; t=1793822196; x=1794426996; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zR7X7uE7v/00IVsZHFoE++N3oXIHliCA4DwI/o747n8=;
        b=EJyYJZ3F9bdEpJPsWZ1wOgAovQVI8RhP6tOVyDAbvbsEE7x+2DxJELYyLCbGXVsL9+
         fwezr07zwokQMgCBVmHdQIB008dsErvaHtRXGzLBKNlFsRV/29If/S5taAQeohdCORYO
         epvtV+A0sNnWIBK2qALa1ySzZgX1RPfQyAdwSelGlO7KxQzu1X23+8iFYmUJZhVaR03b
         bdp27EQnquqqdb25C4hHt/IRMkogBJOzu4gYQ2BlAuhfFzHf5ZjzFAUeBxGznIMGpbbs
         fzbXhaMIZ/PGcGOV0ULoeVWUePBfHM8cdTSSpMZI/mLqEaPFWRBlITAXV4Wqw1jLL+n5
         DiPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793822196; x=1794426996;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zR7X7uE7v/00IVsZHFoE++N3oXIHliCA4DwI/o747n8=;
        b=Yj7SZcN+J5eryM8pyCYW5rmghy1jNW5FbDOqg4lwBCeISTzFLlWMWPQKdjRKVb8kiZ
         nN3uWsLURMEZVICWYL/HeRiGF06YuPUCyo0Yv+yVuSiGXbBft/Gx8+mMRZ/uIL21CBv3
         qzd8IONDTG56MZmgTETfQAK9VXse81brlo4Eod2singDouxenBRF7MirJaQRET3xjeJB
         5vNB27cfS4ZHV06SfZ+I5PMiU7mg1hAgzNiBsFwiAf1bVvDX/NCqTA5H/6PyEj4WS7rY
         PS4oAsUdpzSybAi6U/XzgMoIlVUyVh9L3qXwEJbssk54JqKK27ojyNuWfAOg+zKWo95D
         PfSg==
X-Forwarded-Encrypted: i=1; AKwUvBwaoO09K4oba+WFZas6MJtpnQ9SaW9FsWPEYib5T1QpzQOfnthqDKnYXn8kQjkMrJJUEMC3yxauANn0WbI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Uk3hOAh1fi9hL4qVydnH1Lt1EVAby5tsmGWWxrncsakMUN4WC
	BrX5rjjEVwREzGVtDZn6Rwq6qoI57Sw1p7XARSrbXMxHSFr0WXwC/in3xt/ZJNNO1DAzZWytXLi
	3s2rORQ==
X-Gm-Gg: AYBFou2PITWeUDk2SDQcWTSY9xzb58tbxhEaAtmCtMWXCsmkIR3wojSDxI+nRivwHOK
	ierjG89C6ZqgHw9mf/8NXlFp8GeAk+Hc3dv0mVV9oDJE9bQF6nmklqa5rzWwwQ3UxMsuZbIT4Kc
	c0KjiEXUg/y4LbprPxwv1LmpE9rx1s0xXIbhx/eDsK9NVwnTOiQTs44DsHjgGlHEHTQxPV7MVYP
	lD1DgsakE4FF5Ps9V2nsQWjg98PSjCu9ACm9FoBWMPAF3Degn5SWtqWJoMEhTF5rjbUoXuwwLDL
	33St96RDAVC2PKCA/9b4pVH/RjzisL41TCUpqWI6BjIqgP027Ow97UnwZ3NMAOH8JP8UlkqMeMd
	enWqENqLCUQ6pxNiR/TvYSIhAK56beFRpTP3QskYUEeDq2Y5O4xZvVkspow4/9PWDZIsW6cViHL
	mQbLd1C2PWoSxwt/Js1XspHc4bXNq1O96Oj/vM3J4fkdui8gFttAxylNLpBy2/H7+77AIi8JPyc
	GkwXCbspzTBLBh9AqXkCpF3jCElRj++aqpcjKgfGxTpM+Y6KQjTZfBwQ48D3s7hGC3mH/uc5RKn
	o2CM1njzh0kmLXLFvxWy2nuFr8jwjZIdFl7dRQ==
X-Received: by 2002:a05:7301:152e:b0:366:83dd:4713 with SMTP id 5a478bee46e88-36a4249ba39mr22383337eec.30.1793822196328;
        Wed, 04 Nov 2026 11:56:36 -0800 (PST)
Received: from wang0.localdomain ([133.11.33.33])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38f53a6sm8941712eec.15.2026.11.04.11.56.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 11:56:35 -0800 (PST)
From: Lianjie Wang <lian@is.s.u-tokyo.ac.jp>
To: "Enrico Weigelt, metux IT consult" <info@metux.net>,
	Viresh Kumar <vireshk@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Lianjie Wang <lian@is.s.u-tokyo.ac.jp>,
	linux-gpio@vger.kernel.org,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Takahiro Shinagawa <shina@is.s.u-tokyo.ac.jp>,
	stable@vger.kernel.org
Subject: [PATCH 1/2] gpio: virtio: bound the line names block by its configured size
Date: Thu,  5 Nov 2026 04:56:31 +0900
Message-ID: <20261104195632.1702765-1-lian@is.s.u-tokyo.ac.jp>
X-Mailer: git-send-email 2.56.0
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

virtio_gpio_get_names() walks the line names that the device returns in
a block of gpio_names_size bytes, which the driver ends with a NUL, and
checks each name only after stepping past it. If the block holds fewer
than ngpio names, the walk reaches the end of the block after the last
name, and the next iteration starts strlen() at the byte after the
allocation. With a block that holds one name for four lines, KASAN
reports:

  BUG: KASAN: slab-out-of-bounds in strlen+0x57/0x70
  Read of size 1 at addr ffff8880026687c0 by task swapper/0/1
  Call Trace:
   strlen+0x57/0x70
   virtio_gpio_probe+0xcb4/0xfc0
   virtio_dev_probe+0xa7a/0xc50
  Allocated by task 1:
   devm_kmalloc+0x6e/0x280
   virtio_gpio_probe+0xc06/0xfc0
  The buggy address is located 0 bytes to the right of
   allocated 64-byte region [ffff888002668780, ffff8880026687c0)

Check that a name starts inside the block before reading it.

This patch is assisted by Claude Opus 5.5.

Fixes: 3a29355a22c0 ("gpio: Add virtio-gpio driver")
Cc: stable@vger.kernel.org
Signed-off-by: Lianjie Wang <lian@is.s.u-tokyo.ac.jp>
---
 drivers/gpio/gpio-virtio.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-virtio.c b/drivers/gpio/gpio-virtio.c
index ed6e0e90fa8aa..32326d91f33d6 100644
--- a/drivers/gpio/gpio-virtio.c
+++ b/drivers/gpio/gpio-virtio.c
@@ -520,13 +520,13 @@ static const char **virtio_gpio_get_names(struct virtio_gpio *vgpio,
 	gpio_names[gpio_names_size - 1] = '\0';
 
 	for (i = 0, str = gpio_names; i < ngpio; i++) {
-		names[i] = str;
-		str += strlen(str) + 1; /* zero-length strings are allowed */
-
-		if (str > gpio_names + gpio_names_size) {
+		if (str >= gpio_names + gpio_names_size) {
 			dev_err(dev, "gpio_names block is too short (%d)\n", i);
 			return NULL;
 		}
+
+		names[i] = str;
+		str += strlen(str) + 1; /* zero-length strings are allowed */
 	}
 
 	return names;

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.0

