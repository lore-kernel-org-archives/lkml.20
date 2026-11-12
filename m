Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794466208;
	b=eVHNyV7Dh7jpvHPUj58YpWtTIBf6Do6gouO5HKOmGKLeDC1TFS0q+l7xdVjk3lIgzQLC
	 QArN5vQzlNFqx6ZarD5qsWy+YdmoZH/Vfjyp94AVYg75DGhyLbesSUmtW5AzkcyKdISdM
	 7kfNKJ+YRAXz02HCOA/ffNBUDwn+SjycY06tZu2JsnCs9gwIsVjgCjnh96wPLMw/Yz56t
	 5inNGF8OWO5F0IECqp/2hYkhWk8+EkxwRiNgdmo17O/uY6PN31IGEJv+6NADQLLQRSE/5
	 0M0yhj/Slze5t8AO3w00Rs5qIuX2aWSAySXCn4Y9t6D87Tu1Mg4CZQ7+zUtghgs+GAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794466208;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=b9b3tYu+beF9g/ZwB2Rnwljh+myz1+aTj2HUWSMtgl8=;
	b=CIwsqLAk6L92plqPvz5OoxZQxTIsOOuk8CqwQNYBbzmnVcB3TtlrmjSMUNpxfIBSsKQZ
	 izJHFfiGCtsmGXPs1CdmHiaq7R5ckHW9x6FJf3NLfX2O5ysYwndTaAY3TkQWyqTdXwMcd
	 EmWxX4FPOAtyfgwym1GkWMngC18CmWHUHN7zGn9nWS+0bLlLuBTdDsSG0SmR25G22TgCp
	 tL/jDDSVSSVW3u+whp/NYEwJPihzJ+k3Zb0ZkOyAqNYl37pETyw8GH4zPrHmvajuQwGQt
	 6LohDsAnJgQr7tivs9nuh42EQqt2Iv+hwNnkZcjyM9XnstoI15Jg6K/tK5jJinx2HQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SgwHHH6R;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A4DF60A5BC6
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:50:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A4DF60A5BC6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SgwHHH6R
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3282db206d3so4569267eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 22:50:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794466208; x=1795071008; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b9b3tYu+beF9g/ZwB2Rnwljh+myz1+aTj2HUWSMtgl8=;
        b=SgwHHH6RYgrx0noh7brEbqdSa5d/fDZSvuAXPUJIHRvvV+j5ClLWPhI0JL0ULpv1Jv
         0VarGnytt4sarhu13itTjd07vwTPjpCspNi0HnqRtbz0JOr1hsR5/pqXwZ99FGDmHwf5
         rmXmfBFmDRXwXUulQFjmmGOoVNY4eCZWv7BEZY/TQljtwS0ZbX9oRn1K8paxFkVFijTL
         UWp2djiJnUa/JPioAkfE1nwfnGD7qgu5Zq2eg4sTrAgjdmNCzVDOLk0F5K1zws0QDhyi
         yTP6i+386VzhoW2oOnCMhyXn289l21H6fqZEgiRThTIv0Ailz81BvhaWtoT7yH1wXOEZ
         +pQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794466208; x=1795071008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b9b3tYu+beF9g/ZwB2Rnwljh+myz1+aTj2HUWSMtgl8=;
        b=2dvNVKzc6WDVKcXRyaO4L8ktqfiCs90idRyCzjbaR6N2oMN+SPN3ukPwaVZPFZjVNQ
         Lexmo12oHUA4LIXBKfoB+GewOMwV6F2uM5A95PlbQfbYfRlLJ1g8TqTbSJycZRObMSCg
         pJ3CQg36H9T6PWsmhjKR3Sz9pxBO7+lByy+2lo3TffJiGj0dJ/HSM8jT3RNU4Ieun/M+
         HZ6nSrHLYnunEltWt07JEDd4YQdAAkw6gpySXm7NBVT94g7uDstsVwxK/M2sBhYVgC+d
         mGMG/H19+CMt93aZUH5GPnySb66VE1fBBry8g0/DGxJ9grxBQnBszR6BOR4h502WN1qK
         3wug==
X-Forwarded-Encrypted: i=1; AL+hErGw88fMV2VLRpmFbyTwTgKNOfd5Le9SqmMWIWXE8VakNmiC4G8uVmKz6IREDu6A2fGgiDr20VR2hwQ7/dc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8/pQLLU9xwRKKwu/qkVN7TYQNLFTdIOf8BhSjcmBxwVWeHmt0T
	2qLbjAaSJV891jX716roBHF5SGuF1Rlc97U2FHKtfpomG+/i2TQD+A+N
X-Gm-Gg: AYBFou1nK0wzEHCJYQgnioLPkfVaB6Rp+yPyNLez9661kfANslIM7zzU8rn6crs7Kpw
	AJG3fn8wFtwGHS8P13tRytdGrwVnofp5zuBufitTt5DvbXgleplZq6HFhKoKW7p8c6b6ii6S4Va
	IA3sQYWLvsK5FlfqbZWPbMqVkpouDkonhFndJ9UanUTDEOPHe1eSAZAADTYnTk4g5Ro+z9B+DVQ
	e9s3Vb9JW+WwD15jraHoz6vpXpOqJSd61thTWZMgeOJcPxxk//AIM+hMM8X26VQFFnykrdtBXK4
	LW8tJ9dtXOjgswA5beYxkCznoxkTps9RqBcJrxOtL8nCq10MQGW8cRR4x1Wk7pVlPeJ1bSNKVqp
	Xw3PgE6XLQtsvitAht9lmvEq8llWrakM/EIpwoL37myjYxhs+p+BmrMPgVGdhwygO7U74QYDt3x
	Gtqg64qC2qjxTrlFZuWyn1c54QBs+bibRn1dbYLd6LJKji8icrRBdIfJqhdFmFZ8fzfu38JWWDw
	3zZnGShiwQIOjofxnD7DsxflzuLb1gdewT9Jjii9kOEXJ4e9LRrw4XY+Yk9nT7aGGp34bXptq8a
	xQH/fB1SBylawdRSKaer1lMPG1kBL8f+Nd8ixnszQsQkgAsB9G9qvlPw/fAcpLmFONDFo9CtfO+
	lMfs+4PoY79nVQk9O
X-Received: by 2002:a05:693c:68c7:b0:374:e25e:a533 with SMTP id 5a478bee46e88-376864688a8mr4910852eec.35.1794466207572;
        Wed, 11 Nov 2026 22:50:07 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:182d:659:ffce:39a4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfadsm27190961eec.19.2026.11.11.22.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 22:50:06 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Arnd Bergmann <arnd@arndb.de>
Cc: Mark Brown <broonie@kernel.org>,
	"H . Nikolaus Schaller" <hns@goldelico.com>,
	Kris Bahnsen <kris@embeddedTS.com>,
	Mark Featherston <mark@embeddedTS.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	linux-input@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] Input: ads7846 - remove unneeded memory barriers
Date: Wed, 11 Nov 2026 22:49:55 -0800
Message-ID: <20261112064957.1796975-4-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
In-Reply-To: <20261112064957.1796975-1-dmitry.torokhov@gmail.com>
References: <20261112064957.1796975-1-dmitry.torokhov@gmail.com>
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

The driver invokes mb() after setting the stopped flag in ads7846_stop()
and ads7846_restart(). These mandatory barriers lack pairing barriers on
the reader side and are unnecessary.

The wait queue operations wake_up() and wait_event_timeout(), along
with disable_irq() and enable_irq(), already provide the required
synchronization and memory ordering when stopping and restarting the
device polling. Remove the redundant barriers.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/ads7846.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/input/touchscreen/ads7846.c b/drivers/input/touchscreen/ads7846.c
index f1827684c902..6352117cd898 100644
--- a/drivers/input/touchscreen/ads7846.c
+++ b/drivers/input/touchscreen/ads7846.c
@@ -235,7 +235,6 @@ static void ads7846_stop(struct ads7846 *ts)
 	if (!ts->disabled && !ts->suspended) {
 		/* Signal IRQ thread to stop polling and disable the handler. */
 		ts->stopped = true;
-		mb();
 		wake_up(&ts->wait);
 		disable_irq(ts->spi->irq);
 	}
@@ -251,7 +250,6 @@ static void ads7846_restart(struct ads7846 *ts)
 
 		/* Tell IRQ thread that it may poll the device. */
 		ts->stopped = false;
-		mb();
 		enable_irq(ts->spi->irq);
 	}
 }
-- 
2.56.0.567.gdb80ae8cd5-goog

