Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794347765;
	b=d2AqCIMppITOvOW848oNpdv7PpVTQRtqsljbmtMsR2ANNTlAjdOpMQLUMT+/vjwD0HZA
	 gMVT8a+1fbqYZPg49eTk506LtauoK8ApH0WyLRFn4KyJPwisHG6Yk68S1OZh6QnOgWyS0
	 jLGzh2Ba5QUL5IMvM5DqFv1ozAuZazUxIxtT2sCScGeFQyW6vi0Fmrsb19vPlQTjUrj/4
	 Hf8AUbxYcX0N5mpYEpRZxA6UaTqmfygkiLlUdgJQcYcunJrQmzMffsGjn1h/4jywcBluL
	 nWkd+8dHuWWNp+Ue5hV334Q4o+h6PRtFx0tpqRtj0FJ5BUzsjJYazFNFiW9KFYAdDTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794347765;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=rNrlcAZuLJeyRw/m2w/thfDaF1eAkic6L8d3Qp11YvQ=;
	b=bNiIX19bWasjnM5Ztg/j6sVU9p0h1XIU8p6qhr89rnGeUTkk8ZTu6jyCHBcfFVZnulFd
	 I3xEwMu0OxMKoS32n0nkN6k61hHtY0+NJTi6//02vPf1WfuFPsxIZqZIG8l/TRfcJ8wKx
	 5CZsSG25uSc3CM1MglvRHxDz0AMz7zjL4fh2sZdT2jvWzki9YSiF+ywSjh/t76C/FGTep
	 v77xvT5+gdw3AqqeqZGqLK4U/q24A/DIzd/lj9YO4FMYXpYmxZz0Q8uC7s2YaeDTEhmZ8
	 vB05Mum89rIrFGGkq6PXGgw7j/Ws5pU8H5O8EQT5ltesYMVLhdV5mldqr2CSO7zWqKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ibo98fUd;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6763260A380D
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 21:56:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6763260A380D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ibo98fUd
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49d05d51553so18148975e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:56:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794347764; x=1794952564; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rNrlcAZuLJeyRw/m2w/thfDaF1eAkic6L8d3Qp11YvQ=;
        b=ibo98fUdWo6BFSR9gUcLrM/ThChvIG2KUSTdRlBKI54DOdE62IzEU1qX9wOz3MR6a4
         68lkaAXCb3uF32GZUI80toW8rPbSQYN9S8AkGqbSioXdgV9yStyPoxpWyl3sjNFvbs5P
         BU0mN8XkZhMyvD4K/W0BCI2MVd3w+E/TGB9dn5oRw9Qg3sgM6okGclaLW+1YCHlNchBV
         FwFLincc9OZONJQC7EKTbaQI2tm0QfXCOv6uuLav5Sq6cGyLdyq2tds8ZE8or3xJ8pd3
         KdKJeRpn8970WjdnQnN9mFLROSZjmxhaIXujQmnvpYwlQmyvFGP9vVI8Vpv6UNAQVPNE
         ojKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794347764; x=1794952564;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rNrlcAZuLJeyRw/m2w/thfDaF1eAkic6L8d3Qp11YvQ=;
        b=hw2P4ABeB6VSp5KbIcQJgjcf4otNHz4IQmGVQWTMfw5WPys8eYkMbYFAtw0c4anGmz
         SlnD6OX2dVzTGFka1bg7/nhH71QO5yZ7E0zr16uLdBNgFL1GsDU17W/88TUJPsg6zzP2
         PwDNwOkB3ZnCNN4zal36r2kz70FOzQJg8DssrLjMmpFeTDHC+BM8Ls8f/g7gKgZa3EXZ
         kqNOqtm+DrZCZNI4/V2/kzml80BLLUiUK2VY1RyEYbZOsYNARg37r/lhETJww6TWZFF/
         Nm7gfnT4TfFxJgi1SdnSEH64gc5NsCKshfeVaMAxV6eaFb9fB4coaJowCgWTscfVxFyd
         qp6A==
X-Forwarded-Encrypted: i=1; AL+hErE0CcinsHuDZ1GiGuaecLxkTsNUvyBh3ul8byKr7Iy1dvIOUsyN4sM/0hoqwu6/XCNm/scrJGuS9ePUJj0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9nu1h0OhyPqIW5xBpN+AALx9BYpZfX9n68h+WORfegtm+oHbg9
	W/CFw4G9Pc8lRK5sYUzad9g1R5QZVzRivRP93hsJFAbqojRDdJC8zXPTiLdqAKL1dVQ=
X-Gm-Gg: AYBFou3xZDK9CESoCBDsTuqaKwEf/8x8Dn5GmXcaXCEJz0fEpycl/tfiwhjZkFtx8t0
	jHL6kCRF1QtyXcB04SNeYEarKEvv7oyjeQTGluz8V9Sioga9IdZ72mff4EAgLRPxvXMp5WM3MDc
	hlBEC69CzsXWG2/3nZNTsQRuHel+jvamZMgWgpw49Y/po0yiRLY46FNEUOe40+NbafrlI+XU2hM
	4PqMoytxg7zb1hO6+QP4L9CycMyzPBIGtSIKlehZe7rhcxt6qNEusUlciNGoj4XDiF8oyVl5ZYO
	y30P7UWpqr4GIZw8+k4GPM6Y1burjSS1bOLSX1h1atLP9oxdmZNlajVGIVB5T0pDhnfhhey6s1t
	0Rt5Q2F4++L1WvC863Q0e0eMljeAFTVBzYSAPXSCpHpzWvK6oxCsx0dRMmKkZzlJ3T6VK5S9HaB
	oxj/SHbBGdfOQI3T/9xAPWb8lo67IUhKFWnc8YOM2S6+v1qdR9zBupaScPKkizE0yjgEyZYZor1
	pZXNc9Ell4LdzSibX2hH1Z/j90/dbep4A8FlNogtoa+muuBYMBt43l7I2BwVoLRtOBVm5q5I4j8
	gBbU//fOqVeXjRAxjtlaTkhcuGvwR9/28UI=
X-Received: by 2002:a05:600c:6096:b0:4af:79ee:f660 with SMTP id 5b1f17b1804b1-4ba093a9ef5mr6309465e9.31.1794347763914;
        Tue, 10 Nov 2026 13:56:03 -0800 (PST)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4ba0951bf2asm4967525e9.4.2026.11.10.13.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 13:56:02 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>
Subject: [PATCH v4 06/20] mfd: rt4831: Drop irrelevant __maybe_unused
Date: Tue, 10 Nov 2026 22:54:31 +0100
Message-ID:  <a87d5107217847874288e449d6deaceed75fb4c1.1794347059.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.56.0.rc1
In-Reply-To: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
References: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1006; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=9gNbvGYoAa+q3gGPdNzcQyQQ+ahD4wUVvnLMfUL00rM=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq85KnbfKH19dsaJgm3Q2fWsEOjjujGv9qotm9h uHzLrvMsIaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCavOSpwAKCRCPgPtYfRL+ TgrnB/9uf0GcQv03G9aE54U5xgrTkWSuRx/DGGy6n2RRbA0flhoUH580i8rzX8oAcCn1poArm/n XNe24MiCSmBI5G1zW3dseDAVjovrtJYZ1pwxxDpf1XASzz8dNHyyqQvW9Frt0IwjA7YjIyAUhoU 7ke1MumJ+dPMg4pP2tPcA1Fr7Q5FTZ77W3s0Ft+hFjL/DDHcXtI7q/kJ20b7R+9lHKYKYhftrIJ JMps4s5vYjZQ1qfb36nQdBl+ChwiIh6egKU+hf3ni0eUG/VtX11mlV6GvB6fW94gsQRP1YnutEG //2FMzZZBEgvo5q3Ll+22G6MYN/JuPOQtPgSNFt39fPmztil
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Since commit 5ab23c7923a1 ("modpost: Create modalias for builtin
modules") MODULE_DEVICE_TABLE() is enough to reference a device id array
even if the driver is built-in. So rt4831_of_match[] is always used and the
__maybe_unused marker serves no purpose and can be dropped.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/mfd/rt4831.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/rt4831.c b/drivers/mfd/rt4831.c
index 1ab8870e4ebf..2b3f84b81c65 100644
--- a/drivers/mfd/rt4831.c
+++ b/drivers/mfd/rt4831.c
@@ -98,7 +98,7 @@ static void rt4831_remove(struct i2c_client *client)
 		dev_warn(&client->dev, "Failed to disable outputs (%pe)\n", ERR_PTR(ret));
 }
 
-static const struct of_device_id __maybe_unused rt4831_of_match[] = {
+static const struct of_device_id rt4831_of_match[] = {
 	{ .compatible = "richtek,rt4831", },
 	{}
 };
-- 
2.56.0.rc1

