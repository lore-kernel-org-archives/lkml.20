Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794243506;
	b=bL6Q2zfZ8b+74bpLv/SUaSYxJ0k7BcWJcKMTZ/rex53ujPlfqeyy0wPNcYmoupkeMDZU
	 Y0xbu5nYr67SoL6O48S7FyqEdLW/F+E5rTpSMSxYxOcPveo9hERO54iJV7AIdqyWp7h4t
	 Jys0sMptqJkzTkvIpLro8y2/JKblttOqPy4s1clcCXQVSrTU9E5Fu4mPmzgav3J3CHdFk
	 wE1EzlBWZ3LLrNMYbRv978YoJym1A5hgIX0/zJ4sAJgoIvCUh2r5HRfru8WVvRHiBz+if
	 6kMMaLuFmZtPZfH2vAusP+DhM6OgtDDcWmyZYhBXU0qCc6nsmQkISJd494OyIfI6STQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794243506;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=eSAwas4dJBF9jfHCYoC/64Xh0kqrlKU4nkHL6IJyrS0=;
	b=QOXwykwjEykskL6mUS5Bycj6UsOt2C3OwG6IOGLABALKpoIv7ba4vyUubkcJVUopIRtz
	 ptoow/Xu0U+cJ2PM7pbhuJy1SEKDFBWC54PAlVSIVZCi0SMFa0BFgHHN0JfHWlPE9/Irp
	 NbJloXrHF3LW/PisTjSFw5jgAzLwRF5IBO2qD8XlvU1RnN8qIMb3xfLfQoSR5GJqm8RES
	 w7gklQ5Fl8uov3jOCrVEvFu5n1ItXuFMfj+9iu1K+1oXy/ZuWYb78TjWuGT2ZPO26wh5V
	 04Ijg6omIv8H2pqtQ7FCpDoFQKe/QBvn7INXYm146+ZVDv611TSIpd2TUrUZ1U75C/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r3dp9N24;
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F555606A8BB
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 16:58:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F555606A8BB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r3dp9N24
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cd6acc50b8dso462784a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:58:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794243505; x=1794848305; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eSAwas4dJBF9jfHCYoC/64Xh0kqrlKU4nkHL6IJyrS0=;
        b=r3dp9N24PFEyp/UvhA3XPI704Kxlf70Ecf9UvwKfhF8hM4MiVRmKhFFRuBOqJQNqyD
         1tgkvRJPV2MarvKoD4DY/LHKP4ZqGcQyU4VoMxEOCp1yLlTYgst/xPvdhx92TKaHz8nV
         OS+8DL8VrmPzVL2mK8wIpYpZeAWWyTgieiOO28NHWUJUSSDqZDzHat6Qv8rwmlUKVW7A
         /Rz2la+v9KLGkRlOUviU8gv7bp3HlWwcxX/sP7N+yvgHk1q7bcsPZ5NY0dT1bqooBpZU
         bvZVte/dT8tD9a/MrpP1WbT8KNviJS26Zz2eJhHkAayjRGEyPuZSGRWV6DKH6hg7IRwO
         fvQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794243505; x=1794848305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eSAwas4dJBF9jfHCYoC/64Xh0kqrlKU4nkHL6IJyrS0=;
        b=ph7/TrQBbVby0zidTDDgZl0WMVqth/IXaoBDhVGOb3r4YVb5JD5id3q/TkosH/C6m1
         k4rT2lSttqqaduvWZdA3rZDTjW9/FOp/hEJJtcH5l/yshckqZLT1pXDPigE8vZ+yBQhb
         O9SGEvmQWQd1thH1ll1z+e2P9FgjKES8qpWG/Gt5nI4YJz17y2LcJU3kEJxwKKMSviz/
         9Gp5psTy4ps4qv6OiS//P+ElmhA9He4ByVW2nzdOqYX5R/o4xRMpJ8BX/l6gxJu9k922
         kxpwejUVTlS0XA52ARBHfyUJbSRoo2JpPSiYe4vA/hJ8mUXKnpiRgWLdsWBNxLHmthI+
         OzCA==
X-Forwarded-Encrypted: i=1; AL+hErEWmnFlHI0S2xwtBaTSa2+f/W1/EitNwQ+qxPjGzU25zZtXQY8zpzWQYvxjIrafjMJJvoBOOuwHd7gkPxM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8FuY7IkIbpqbL36DZDIpvRMY/Nt6rZRjyHQlGJJjih85K4NYv6
	GaKID7xAh4eI5qAd42pIcAbGH+nMRfMEXRyzquLmUWM+Vy/sQon5XoBc
X-Gm-Gg: AYBFou11TMzrMuSFq+AYlv6CggXx7mTWGx2kxjn3EdgId2X5m8W3/r5YcLcyD5hDdmo
	7q1SqGigPyHsA8oUmQtOeXcgSB791oxCa4G3zIMNJWRUamCRaHbJJIVut3MPC0FVXeTdL9Qx5CM
	tp2ihtJfufvQZ546O1YRQCtMpIiUo4Pj/7xXvPwY7FTVeEAguJ1MR0ri1W/MkTP2w48r3bxCFBB
	INIpL7Y5ayMQpMELkmieVDABqyfZmghopGpeAe+/iC0R+wuPrvT5WHaTIkixfYhx57N876Bd0qM
	38RihPeL7ymR8Gyx3dawcR+1HnVG1dHcMHxeOQF4H3UlxOecgYrwpl4gJl4mlS8odTAlMYpRrj8
	pE0zgbPUrl9UMbRDgeCR2JeFCLv/h8GQ6Ed3b5YTc8HOWVXKE8Yyl7j831B3Z+PgjbeTfPy3dcs
	wVRDxNZGTZJWf0MxCM2gcGy4Ksda3XUr0/86dZkCxUMwKayzfljEsmXOakaeKpKMoMjGWz/trAW
	vDDFs74kPEIncnMQTLWN3x9NAVtjD+3X9915cc8B3PyaNTM5DDWZRCzKLksDiQitqOMOe/qJtkc
	/Nzz+znokGXz+ElGYdhSz0EF5QUD2t6zV6ks42nTaoaHCb5k6IEN7VMT0R2o8cW1j59uO/qS7a8
	IqWYU
X-Received: by 2002:a17:90b:2d86:b0:3b1:2237:3c93 with SMTP id 98e67ed59e1d1-3b166c93125mr212316a91.18.1794243505322;
        Mon, 09 Nov 2026 08:58:25 -0800 (PST)
Received: from debian.ari ([152.56.156.124])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16779cf05sm138766a91.3.2026.11.09.08.58.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 08:58:24 -0800 (PST)
From: Archit Anant <architanant5@gmail.com>
To: jic23@kernel.org
Cc: dlechner@baylibre.com,
	andy@kernel.org,
	nuno.sa@analog.com,
	u.kleine-koenig@baylibre.com,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	joshua.crofts1@gmail.com,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [PATCH v6 07/11] iio: adc: ti-ads1015: drop unneeded < 0 error checks
Date: Mon,  9 Nov 2026 22:28:01 +0530
Message-Id: <20261109165805.31160-2-architanant5@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261109165805.31160-1-architanant5@gmail.com>
References: <20261109165805.31160-1-architanant5@gmail.com>
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

The devm_iio_triggered_buffer_setup() function returns 0 on
success and a negative error code on failure.

Use a simple boolean check instead of explicitly checking
for a negative return value.

Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Archit Anant <architanant5@gmail.com>
---
 drivers/iio/adc/ti-ads1015.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/adc/ti-ads1015.c b/drivers/iio/adc/ti-ads1015.c
index 2e6bf45871340..1924c1b2abeea 100644
--- a/drivers/iio/adc/ti-ads1015.c
+++ b/drivers/iio/adc/ti-ads1015.c
@@ -1012,7 +1012,7 @@ static int ads1015_probe(struct i2c_client *client)
 	ret = devm_iio_triggered_buffer_setup(dev, indio_dev, NULL,
 					      ads1015_trigger_handler,
 					      &ads1015_buffer_setup_ops);
-	if (ret < 0)
+	if (ret)
 		return dev_err_probe(dev, ret,
 				     "iio triggered buffer setup failed\n");
 
-- 
2.39.5

