Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793436510;
	b=3jiyL3OyijYb32NiB5cANwKqAmxJdf2OvJuDcZWKbiBw54LN+4BcoZv2xR13ernyWoJu
	 Kv5BR+zSZHgvraDpieY45OmMosRiXuapYVptqe91jkpplPBAnu6Z0I6fLW6gsExBEHDbj
	 u4OlyzopJZy6gXi6RkLXOgCHunEmV8LkXWR38UEoBz68ib1xRHRy1u17NGZKb88O82KqM
	 /3VL5XOphyDMUFOucBtbToWPnCjYioO8ADAu8eJAhv+IuwxYCbKRAaaVeqIEkf3JxQCGb
	 toghhmADs2Pivq9MCcT/3ud6hbkNKyZue34biYYZaGjA+yZ9qVSHemSsiA6LG3tSa5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793436510;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hDQTovz7Ix9maIgBq+C0wW/9n5tDPpyQGeZtV66dPdQ=;
	b=VBgLTzg6mqEHsKWFJILN8qHHJKPG/YAEpNTHVfUCoUdQVmxxsiG4KtiWGG3UcDv8GVpz
	 lsIobgzpFBHfHFoutvpUunZGH7M/DPUdHCaXo4t9Px02c5bQTwwEVK6POkLyPw8Dbfbn9
	 taQeUNIKvFT2yaPpg806Uh4np3Ewq1aZDk17oQ50ROZ3DuQ+3uTg6hJBS6rkJm50e3UBT
	 s8cf9Nqz+WaH911pEpGa/Ci/4ajks6gRJQ8zr6yLWI0VOiVBrkoAfDoID66jLgXVBcJoO
	 wI1ptafk6wBt/bfR7EDwaNVPZykxxWWujH6VNSHmQYUH0ZqU+lWTEWNxXJiJhyonHhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ixl3PA1s;
	arc=none smtp.remote-ip=74.125.229.137
Received: from mail-dl2-f9.google.com (mail-dl2-f9.google.com [74.125.229.137])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74DB5606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 08:48:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74DB5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ixl3PA1s
Received: by mail-dl2-f9.google.com with SMTP id a92af1059eb24-164f08a9e84so326488c88.1
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 01:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793436509; x=1794041309; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hDQTovz7Ix9maIgBq+C0wW/9n5tDPpyQGeZtV66dPdQ=;
        b=ixl3PA1s6PjhSIrWR5kPJ64QjE/agdh9UqNyOWV1ySem+79JIIUOLzNLONM0IY7UKK
         P3NvpMh9xEz/pj92JOmS5SseX1elNocUu0CyJZ//KzKbhetxal1SXx8pRgyhf9iFmJcZ
         7sPGpZ6AARFpNkl923pwYzd2tJxTKB6YwoiIZnwkh8o3AuXnHcYuO2MJJM/0KMT/UJHJ
         FNHCJ/lWRX148zz1wuYMPfRUROeS5EnTT/hPKR5HXYa9uQiZp2b1tmB8gBfmMpKca3Zi
         +ec+gE4INblNK3O1l/HjvqKCqaj6mTICqJZE+YY3cFDqJFghFHVEkqPhi3HafkcoYZAO
         mawA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793436509; x=1794041309;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hDQTovz7Ix9maIgBq+C0wW/9n5tDPpyQGeZtV66dPdQ=;
        b=bACale5MDmXE/DCqy9XSKNLVCP/VxFxB/yxtq11VbFIouLb4DPABHMQQyOT5CPOkpo
         DBHEWNH1sOdbXebBTjnpY3A1WZrIK/RHc5XCXydVHCvksKJWDlriRIwi9NDIOQ3eZe6d
         6nXW5pB8uv80g8OntjCF6C4wD3wP5Neao/JSLh4syrauVoPG+C3/HbZlTq5MAAu76lwi
         8SuCWimyPTGxcvoMJDvy6TwUtMQtvNyMdR2hHqfZyn7uBhrzV17L8Kucu0yeDuAgJeum
         rHlDyGmYyWkjNSoHqC11tntpKntn/k1dPwvqPFnEQZo8rhtxmNB0NCVkuiQfXoPRkOL1
         LeqA==
X-Forwarded-Encrypted: i=1; AKwUvBx26UB0qTw8UYD7o9oyS8RlOrMlLjOdP5BCAQGtWxhXWe25iPWRbiVp2c78ZIhdHRL0Zb6gAHEjdxqUqoQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKCOwiRrm6l7d1tH++N1utcFkKTG4BM5e/g9RY4ax9OiqH1HYJL
	lsQlzXL4iNwrAg2W88YWsrgFzemok+UqJCBXRuy60bWKOdCFh5hBDmw+
X-Gm-Gg: AYBFou1sl30RmR/nygWQg/B1/8rxxYQOyg9NxRusaMjvqEUfjTj5aTiyCDActEFzLFE
	980CwzCMFBCqnL36WZrRj6+LAaQfHuwaIFJH4w+mS/68uwgRlgo2r6QoTCSS+gp2lckgEDcd7vb
	2fHpN2vKC8mfChvT4WOz1FMxTaebyQqxpO8MmZNTeX9YqaM4bjAhoIqHjd3ieSalCkRUGkaYS2R
	8PtEDF4bSxyJQA4d3UHxKbp5Ong+snVXZIdLHqTIYZSO3JHqJCUpLGaYzichUF+tkBuFv7CyzgL
	cXwoEdghc22P0T3hGIlkUEzL1BxayVjl1l00Jx+MigLkqUkGBbYlYtrCLFIAWe1b68ZowiNdGYZ
	mFeP6nz8DR8H8Qqk2zR/bJAEs+oBUHftAxFANB9tOngwcaXwV/KvcVBvwbg7Mn0deWZTTc7+D/q
	ziyFKxe5kXsT80L0Sw6O7+OkYisegJQsKJQxTp75McjkkllX9uXtNcl21JN59DxHhgrcELJyPS2
	8fRbjmh8IXY7ow+rghlqqkKVTJgqK3ODnaeVbdMKVHhHSJaYf9UqluNtqT12hTMzwJwp93LxuOn
	m1g4qYzVd7SyDGL0vp8gVmTCJugU8ItqVozTOljemb1bJOepFLiNdtPbfcTEoZxKkyN4sd8b
X-Received: by 2002:a05:7022:4392:b0:1a4:c892:b14f with SMTP id a92af1059eb24-1ac5de53bc8mr10454378c88.29.1793436509417;
        Sat, 31 Oct 2026 01:48:29 -0700 (PDT)
Received: from 49152.tail67c8a6.ts.net ([170.62.100.241])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac194b5437sm15684575c88.13.2026.10.31.01.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 01:48:29 -0700 (PDT)
From: Kenzema <ken3009le@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kenzema <ken3009le@gmail.com>
Subject: [PATCH] staging: greybus: light: use sysfs_emit() instead of sprintf()
Date: Sat, 31 Oct 2026 15:48:13 +0700
Message-ID: <20261031084813.214366-1-ken3009le@gmail.com>
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

According to Documentation/filesystems/sysfs.rst, the show() callback
should use sysfs_emit() instead of sprintf() or snprintf().
Convert fade_*_show() and color_show() to use sysfs_emit() for safer
buffer handling and consistency with other greybus drivers.

Signed-off-by: Kenzema <ken3009le@gmail.com>
---
 drivers/staging/greybus/light.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/light.c b/drivers/staging/greybus/light.c
index cab02b5da..2689f9a75 100644
--- a/drivers/staging/greybus/light.c
+++ b/drivers/staging/greybus/light.c
@@ -173,7 +173,7 @@ static ssize_t fade_##__dir##_show(struct device *dev,			\
 	struct led_classdev *cdev = dev_get_drvdata(dev);		\
 	struct gb_channel *channel = get_channel_from_cdev(cdev);	\
 									\
-	return sprintf(buf, "%u\n", channel->fade_##__dir);		\
+	return sysfs_emit(buf, "%u\n", channel->fade_##__dir);		\
 }									\
 									\
 static ssize_t fade_##__dir##_store(struct device *dev,			\
@@ -220,7 +220,7 @@ static ssize_t color_show(struct device *dev, struct device_attribute *attr,
 	struct led_classdev *cdev = dev_get_drvdata(dev);
 	struct gb_channel *channel = get_channel_from_cdev(cdev);
 
-	return sprintf(buf, "0x%08x\n", channel->color);
+	return sysfs_emit(buf, "0x%08x\n", channel->color);
 }
 
 static ssize_t color_store(struct device *dev, struct device_attribute *attr,
-- 
2.43.0

