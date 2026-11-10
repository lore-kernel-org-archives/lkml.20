Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794347773;
	b=X+wbfTb+0glSPJZ8Ak6izldvzC9Z3vNDvRC17yPUP/fHLV8Wt2bZUCRO8i3+rtbr5E8l
	 e3trEFPBHiLZBQ+v5A5deshZ9bFkGcQFXhomrcw2qtk6Huv4Elhg7tq5jfWLIW0przOnd
	 dy0KB2IP6tFVeSppS+D3Zb+dzO4W7QqMcfR3R6WtU6AFkjm+JrcpLtw51liSaq5MGSuQq
	 ccBbzUyv9cw7kChaiAMN8UIvH+AL8dFiNMh73g2SyX/xPEG6rlXiJhZSIY8diTdfm2lXK
	 mdqvLflfTl8Ug9R2+JxcUsPWOAwANSOfzovEYaVGiH1EkllkHwo/2qZNu/7Rc9XJxgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794347773;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=/bU06E1dTu7o82eVh0tv/62NUVUAMqK4tBifVC8vTig=;
	b=vLDP6DKRTflgSyP3D/liZSeRyvo3A88lwlT6/aq5G/6A+E/WHOPx+JafaTQ/Gju55x5d
	 CKhVSj68coHgJf89CpmHBR4jGHp126uHrK3DEhZ1vr5EO4PtEIxrp/R93A/K5bdvOzKnZ
	 hVdS2evCqcCJoyetgfiipruEliYhvL1ueYg0lY1e8z5QXyL/ElyTnQ+9B6U55jALB9HVB
	 BgGNes702/3szIuwoSywvvD5dIDkKwZ+utUhKUZSfr4y1VBDFYcEg75ruZXyMb74SK7Vc
	 1clEgenCxdssNXD3o3YkW1v1Wz5ZEFTuLKDCxzBZ2Rxf42EN0GiULzt4pqKR6l757nQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=DWcXkJqb;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2018E60A3832
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 21:56:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2018E60A3832
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=DWcXkJqb
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-492fcbfaa87so1701965f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:56:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794347771; x=1794952571; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/bU06E1dTu7o82eVh0tv/62NUVUAMqK4tBifVC8vTig=;
        b=DWcXkJqbm3K8cM976ZhorXirzn6bdoHa4W6a9inHajwlFeGbOmqv8AomKkLdn0Gf1f
         QEN5Im3zI5R/Pe6PHQ6klykji0/OMnBwNbZflky9yoPvC5DDLUf93JH0rGkYVxKLPfJD
         eCsqhnEsgRFCRXlRu9fLCVmgz/ZPP9H5oZ3fKmlXpQb20LZzxWf9JJ5O5WTWgdqF1b3z
         2Q5HmueV2yLlCMss2g16d42p/k/lzez4gwrje+Gw/pQgi8A+SfbVVzAzvcuoiUkoH6GA
         vvngjMVM/77PbFgspDpZGkrcDGprCy/HiblpIwxk6q+Z3XBDbSuVzVDW1/J56L1LyhMH
         fVDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794347771; x=1794952571;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/bU06E1dTu7o82eVh0tv/62NUVUAMqK4tBifVC8vTig=;
        b=YHdxheX6ceUCkC9vKsb6ImIRBes27CPYxETNTolREkt8f3XW0wnCJyxfNBBtXlyQXO
         FiHErf3WkiI/v4JtrXVNdwq7QtKQHJNgDDbeyTdBZNgD2P6BJ9TFnhmqM5rb3PLaW1Z7
         pCAQyWlZZB0yDTcf92+CRCFheHlQzzAfDCGFOfvcWSb3idg5zZm8QtacfFIp3FS4WVHJ
         umzU8cYrInHMgmwzv1wVOUnnOYt2n62cmIV30ZvNnolvjQh0oUVdw3ivsiJ5EwJSw9eZ
         M2utpRWD8XahJDMfVoCrUsQ5F4m2WEqtFDVZw9uy3ExrTQNLPJVCJw0Zl50ZujYFRNCo
         CoIg==
X-Forwarded-Encrypted: i=1; AL+hErGo/iE62psG+KpBN68OEf53LF1NoP1jRbIG5BxvQqBmlGNIVpFRokCf2wGWLD177DNtADuGsQ3L6iwD4yM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+z8mMtgpHZFFp+s+vCpz/eqtiFnX6sIB+0Cr8MEy4SCg83lun7
	kortnDVyFru4K7a2JF0P+sPxXGGNgp8tXDbuTAEWZdMHx/4jA7kzLUJuZ7uoUWWw8kg=
X-Gm-Gg: AYBFou1AXN87O5dU+NJ7X4Jx52+NtD0rXG5Jcf85Y6jYodxF82J7wT3OqdlMQLp+GJ9
	fr/S2RW7ujdv2uo640uxNOmH7h8njaCraslVquhCHIZ7jpd7F+j9rVY7NWxEmN7bK+NQkGvzUF0
	cPc/kzhTTQ5GxzEk0vWdtPyi0bKoOQzG0d/q8K4mWYtzocf4UJQWFYxXTNBXtI+iS0iRk22OXCb
	y9PvmxGJgoelv9l9dRf//mOodPz81/TkdSwm/7TB6eJFaoYYEQElB8fw9iDmKq6fo97CXg1JMqn
	rUh77vRGRzfA1fQgELhO8C/PyVWfL/b5NDb1zV0DaJ7LysGud8IyBOuvnro8eDMZ9UIWsAaSshn
	T2ck/QeOz5qKTgdH3bha1FPTKm9Kl8xc4DnCzjCMBDQpNjHF7WdU4R7KgZNwtk8GBTyY5rbwSyK
	RvmmzlBWy9tRw1DJ/3mXctwi+ftC0CWlLE3MDqkv2dCZ001jCNKAte3FFI7J12vinjGJrEJD+0/
	vNuusCbHH/TxgN8terJPvO1cpdhmLsScLWR2WiYbUp0TUN9VMDwLmHno+mAV9MalwsY6zZ7S8Pg
	eLig7tlRP9Qx1uKQqXvgWKAC3RTmsli03g==
X-Received: by 2002:a5d:64ed:0:b0:48e:6f76:dea2 with SMTP id ffacd0b85a97d-499c69cb701mr366245f8f.38.1794347771565;
        Tue, 10 Nov 2026 13:56:11 -0800 (PST)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-49835858f26sm7338595f8f.18.2026.11.10.13.56.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 13:56:10 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	mfd@lists.linux.dev,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Linus Walleij <linusw@kernel.org>
Subject: [PATCH v4 09/20] mfd: Drop unused assignment of platform_device_id driver data
Date: Tue, 10 Nov 2026 22:54:34 +0100
Message-ID:  <9bf8e674ac935547639dc6f89fc0aab5ac826db9.1794347059.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1410; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=2UUtn/8z9q5Vil/qWmXv1wRJuUXUGptLBomjMZQsNCo=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq85K0kB+I64ERD0hCsZyM86WO9lk/0iKPumZ0d RCE1dtnaRSJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCavOStAAKCRCPgPtYfRL+ TsofCAC0U2NJpKBqUl4okY4yooT3RlrkPcLeu3peOyFH4ZcFWAIRXbvvYK1Rm8+rb2RqhkOd8A1 sc0aSu4sqf/Uwz35Y7wKCOWUS7OFm3VoUfj77VKhXpSUf0LOXB9IZN0tf4CLIZunj4gS8e0YU/Y 736EXRz5MHk6g+CxnOLM/4N1iIVK31WRGBx2V2XY41wue/5cWWHY/TSL7lyU0Q9y1YPbKnd3kz4 yuJYdJAnaJtqydkGzFGZmtJeTHZauzOGUevEieD/vdxCKTlYsIBIfOqgOTr+AWvxgcAcQw+pNue UyErdr8iUXRmfPkuz0yG6yHCdwBgMmipkoax9/lKTDAr76TH
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The drivers explicitly set the .driver_data member of struct
platform_device_id to zero without relying on that value. Drop these
unused assignments

This patch doesn't modify the compiled arrays, only their representation
in source form benefits.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/mfd/cros_ec_dev.c | 2 +-
 drivers/mfd/mt6397-core.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/cros_ec_dev.c b/drivers/mfd/cros_ec_dev.c
index 529a23b804f7..96aac158fd8b 100644
--- a/drivers/mfd/cros_ec_dev.c
+++ b/drivers/mfd/cros_ec_dev.c
@@ -379,7 +379,7 @@ static void ec_device_remove(struct platform_device *pdev)
 }
 
 static const struct platform_device_id cros_ec_id[] = {
-	{ DRV_NAME, 0 },
+	{ DRV_NAME },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(platform, cros_ec_id);
diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
index 5d5f816492aa..e74936ac206f 100644
--- a/drivers/mfd/mt6397-core.c
+++ b/drivers/mfd/mt6397-core.c
@@ -435,7 +435,7 @@ static const struct of_device_id mt6397_of_match[] = {
 MODULE_DEVICE_TABLE(of, mt6397_of_match);
 
 static const struct platform_device_id mt6397_id[] = {
-	{ "mt6397", 0 },
+	{ "mt6397" },
 	{ },
 };
 MODULE_DEVICE_TABLE(platform, mt6397_id);
-- 
2.56.0.rc1

