Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794466210;
	b=LW0Ai/R0amF4QYVAFTQpjupSP60VEVM55VEvjfAHu5cX6utLzsFMsdGBUQutVF9v1OYJ
	 95/7W7zCQjf7UNX3CkD3GKmnOEd1Jm0CW3K/09pVdexPU0x25GJmnp0q7PqfFT94wgQOC
	 LGDZGHl0igZ1hhmmB816n1JXYkjpqHcIidCW4rWewOn0M9GSS8bkjKyo5TiEXV/tuVFgW
	 TO1OQmDAa4pDOu4XwK3KrlHzf5LJk3srSuOwUgp/lmJM6A1mDLTcTc0t0G75oaLC69ebs
	 fKiOWMrK7vPxplkwLb1HR5wE1obbVPnKVRYWAF/gjZTACdPB3xqt79X9jnTD4ATpBvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794466210;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fSSCkqvwTZj1huGL8Zl26siSAmzWWRmX0EP+FjZ9eu0=;
	b=mPRr7Uan2Pr08VHKZUOLl9tBmeNOe1hCOnxshBTMXMAK3KJ0dM/Ns9NHlFA2fM0HWw6w
	 iO7gOODWIuN7wJ+uH8lIyA+qt68SRd2YZuSKiyhOzu4IDzGYlAAG7K4w9uOvmWISD+LIV
	 QdcNTsE9cDgMofnzRx2EHFuDwK0nQI+eAWR1n4ZANhoSoL2N261obleh0qdbsL/IPeKqD
	 JVL0QAc0DKlQToqNOC8vuwqGkNmxfOI/3wDgVkk11Kho3tIfjzdLOLTDq8eMw5YQfC6s7
	 RyjZIBdWnOie4QQWHQ9zyBROV121RevEnPPMrMAqtlmNyJudwTkCQA+GvRfNTiK0Cow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hh2o3mX6;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 530E060A5BE5
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:50:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 530E060A5BE5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hh2o3mX6
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso8352352eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 22:50:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794466209; x=1795071009; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fSSCkqvwTZj1huGL8Zl26siSAmzWWRmX0EP+FjZ9eu0=;
        b=Hh2o3mX6TwMjHtUDQjFKWWLY9ICG8OkBWi672/jXglxlWUU05O1/0gHpLXjBXZewdv
         AWSNmysG6Fa3+DAwAIRat8C4MYGAzHqrzgAGCrktfuO2ZoZaRrP97bGPgqXWsTkPxAwt
         zS9JbAuwskdP+RwY6qaQhXZBP60lWB0Ea3z+HPat35mrfiM1/T8A7wgjAakx+/Ux6s+T
         3RfFZeM3BhJHFCFhGNIKOOZ6ymglbgDOCgrqeKEob9AKKgchWcX+tCbQCZGAGMHVG3bn
         iC8UKZfAPE1zD4JdVV4sKcTbguTnRL/c7dg4eQgelrtbwdKmTkjdr7IoYF1vAZsXVSuj
         HPZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794466209; x=1795071009;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fSSCkqvwTZj1huGL8Zl26siSAmzWWRmX0EP+FjZ9eu0=;
        b=zDQJw0bhI/NEAXRejPxxRuAP4DmofCy1OZvnhq9/h4/oyJFapHvIEO/9IT5Zn2npjN
         DnUhk5F2KEK6Ab/0j97Li3honERtN1PQZ5+1cMbkRsyV0R2W+fwpCAPUUiSaLAdoK4VN
         Rb7iYQo9OgQTFxmeSA/P2dViRcO2S7Jdrf4mq06koTCOsjQoMzMOG1NW7LaRWZNuCY5p
         xUjZSOzmMAMCiQb0uHTn16n7lkMDvSIBP/oLXrkjBkRBX8fJmXu/eMiDpYhewey9TI2X
         K2brLiLV0VupFnU2bAB+tEOUYwn2z3BTq8ZU82uDpxorQA5bD5oUyqEBcufSUxDs1VOd
         CSTg==
X-Forwarded-Encrypted: i=1; AL+hErFofqRQIMeLCc4O28HT8gtvloy2pZpyjV3ijvi2u7c4UHqzVrynKOVZOM378hB/nd7uH/B1GMPiES7iimU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/B/vnG2LorTAeEq6kVh2J3kf/vhZFooPddfAZYP6pFpCuJgYSg
	xhGOW4huqBRODJyFodSfvpRvA6jy+4Wb96anWJ77xFYlX9jlgzpzWVvP
X-Gm-Gg: AYBFou3OGLx4iErGgj/UuVvcqP3LD+98HsBNPE2sGDn43eYw0QOoW0hX5PhxkgaR2Ah
	AOXx1rq8W5ocvx5rL9TtGX1heJWUxza56T4ZoOS+ef0oC5FH8wirtyXW7JG+kR5mnvePVMw0PKz
	g6k1rp3Rv7IYUFvEoVo+8q/Pflj/9sQGCiInTdj4fS0lRJ+qHPc+ESDBvHz9kiyhpxUQU6I6cQh
	L4IPhY3/p1sjAy3DcfbvZWGgebqOUfcnx8qjz4U6/1OLdhfqZRSu53cLKhPfQrC2V17Tu8kqN/7
	ij/CHcvYl+i11pDO6Fqe38QPMqS80myGGrZgUTj5psugpAXd7rhYts3Kx7Wj97o8Re4Ct5eJ8Am
	VyUHe0OToccM8jh04mn+HxmHiEtoIfw2ImLDQlmfWSBzPLjLsDtwVMoV9QIIMwjwEEG3qCMWuzh
	mDwb9uRf4hia9Vc7jE9CBoYJAo9Vk24vJXJPN0+HOOYnMqvCggD+kgXQ/OfKoGaM9Xl9hMzuaI1
	g/3ocUVuPBiF/8cLD6bOWCXVGa8E0WMcyAI5hZv4AMFGtd4KUoiyxsZJpEuToLQIHkfbW2bOuT9
	0IA8GtjX5jQApH1EKp8xLWcaTe21ljDxX7ZNiPOqnqPNiizrnCxN7LaZi6fBIKBNAKZnmHUyav2
	Ml1PzFol2FvHLWfpE
X-Received: by 2002:a05:7300:f54b:b0:36c:a42d:9bc9 with SMTP id 5a478bee46e88-37685c7a866mr4653158eec.25.1794466209304;
        Wed, 11 Nov 2026 22:50:09 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:182d:659:ffce:39a4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfadsm27190961eec.19.2026.11.11.22.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 22:50:08 -0800 (PST)
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
Subject: [PATCH 4/5] Input: ads7846 - remove unused code
Date: Wed, 11 Nov 2026 22:49:56 -0800
Message-ID: <20261112064957.1796975-5-dmitry.torokhov@gmail.com>
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

Remove the pwrdown_cmd member from struct ads7846_packet, unused since
commit 6965eece2a89 ("Input: ads7846 - convert to one message").

Also remove the unused REF_OFF macro definition and drop the CS_CHANGE()
macro along with its sole call in ads7846_read12_ser(), since the
request structure is allocated with kzalloc_obj() and cs_change is
already zero.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/ads7846.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/input/touchscreen/ads7846.c b/drivers/input/touchscreen/ads7846.c
index 6352117cd898..4a5a141bb4a6 100644
--- a/drivers/input/touchscreen/ads7846.c
+++ b/drivers/input/touchscreen/ads7846.c
@@ -84,8 +84,6 @@ struct ads7846_packet {
 	struct ads7846_buf *rx;
 	struct ads7846_buf *tx;
 
-	struct ads7846_buf pwrdown_cmd;
-
 	bool ignore;
 	u16 x, y, z1, z2;
 };
@@ -145,13 +143,6 @@ enum ads7846_filter {
 	ADS7846_FILTER_IGNORE,
 };
 
-/* leave chip selected when we're done, for quicker re-select? */
-#if	0
-#define	CS_CHANGE(xfer)	((xfer).cs_change = 1)
-#else
-#define	CS_CHANGE(xfer)	((xfer).cs_change = 0)
-#endif
-
 /*--------------------------------------------------------------------------*/
 
 /* The ADS7846 has touchscreen and other sensors.
@@ -195,7 +186,6 @@ enum ads7846_filter {
 	| ADS_12_BIT | ADS_SER)
 
 #define	REF_ON	(READ_12BIT_DFR(x, 1, 1))
-#define	REF_OFF	(READ_12BIT_DFR(y, 0, 0))
 
 /* Order commands in the most optimal way to reduce Vref switching and
  * settling time:
@@ -400,7 +390,6 @@ static int ads7846_read12_ser(struct device *dev, unsigned command)
 
 	req->xfer[7].rx_buf = &req->scratch;
 	req->xfer[7].len = 2;
-	CS_CHANGE(req->xfer[7]);
 	spi_message_add_tail(&req->xfer[7], &req->msg);
 
 	scoped_guard(mutex, &ts->lock) {
-- 
2.56.0.567.gdb80ae8cd5-goog

