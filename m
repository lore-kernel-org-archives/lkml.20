Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793311603;
	b=wGDacsx+ciKcrQdg646DG0I2HqJfsrnbhI7q2qQKmdzLlLP4P7+Xv2LcfNAxOA37yogN
	 2ZYd/Pw9XkBVMfNeh5IqB3bNmbZ1oNuOm+OElVXgOEtqS9OzhNsFqtLC2KeVQEJRwFDH2
	 sF6oX7hqSJRuJPxDVGyM7Rg6+3ExGwOMY5Sb0UGtLT0S8SxUiIw0nNTqpOBpy7EylEbQX
	 kbn9PiUsih0vEYUHwW/jFk0YgRYTOR6Ndfll6IF1daGKexFYcGCciPkiTkWIDCEaPoMCt
	 fnTEO6Yzx9JKRnY0/mChWDh7Xn9nIQ4kzIdvUz/wQe4tn2261y49ADOWzQejrd4F7WA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793311603;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=AUotzmCqd9glGddS9PxvEgwMOpXMRn5H2iSsgciQMXU=;
	b=eCDxpadD1GylelvxvJGcggquUxIww0DBnD1wS6YsFqrrIywTvqh2QmfzJ86uZGfKA1bZ
	 X7JrgjtkiljwgyXIohW/HsmGkMVjkdZjtKIPPSQmLUpScdbZRirgKawJMnhs1f7zP9pFo
	 SjrRHlYUZmZ+o7/4GvKncOVw09iY5WK/SPB4bToBTtIZc7PpDL8bVDSU0cqAAkobnWhP0
	 EqFcNPIHm16deiLi9exSdXge6/HsDzXHwZfQD88FV0DcXjI/rMGlDZksaM0PbzY7F97Wm
	 Lqnrumtvb5pv8GSOreUiufevRwaqgxAmln6iWvLefvqaeP7KYC0ziQ/2eKVbR/vjtRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NnB0sgLD;
	arc=none smtp.remote-ip=209.85.167.52
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1475F606A33E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 22:06:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1475F606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NnB0sgLD
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5ba328513b9so140919e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793311601; x=1793916401; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AUotzmCqd9glGddS9PxvEgwMOpXMRn5H2iSsgciQMXU=;
        b=NnB0sgLDS2ZMBmgaEiUGFTcmHWOr7URX6Rw26uk5dFTM7J4ZYxVfLMPiJa9Dn9y2Cb
         OpbGWJpRFZfupU/+Fv3CufKcyImPGRXL9NRG6E+ayF9ODU/fsLXKDuyLu97dZsa5pUFJ
         92hc/PMIFUBoy307czLIlTTGden+l93KKWGWBvHphY/8OuXX21gfP05cLhUXjFio7bO2
         ifNRt2w8+c9To8yVaDcMq1l8SGbOyKgrnHtGqvIk5e0RUmeCw91iaZ07ZqLhtDPeUaAe
         DJB6SXZyMtP1/+RAuvUcZ4mqoj8YSFJxs5esfyq2XMMcdelq+aiAN/6hG5K+3upiLS7N
         a/xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793311601; x=1793916401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AUotzmCqd9glGddS9PxvEgwMOpXMRn5H2iSsgciQMXU=;
        b=YdrwoECWtYd8hL0BoL3OoHx2UxZrqb+oYZYr9cpqb2Cx8hEl+MQNp4YTn3kFL1J8fh
         eXSmAdHWhR+XtdlNDVvFuIZasmhDxAcWPoewqSw5VlMOSWLmur4D9p/BP6KKce0wQDeE
         /sfIkelUVmjHzpx3x+DF2qlekputSROmefjbk5Tj55HsH/eIFu6UDqBZ2hjgUYlFSrDw
         jnP4e9dqiKiIIvJJzfGxL4jx/edO87p/3ZfMYPNIQLruYyNR1yM27wi+e+k6IFNX1mGv
         L2h5JP5vMIWfJ1Fs4Q44O6Npn4Bt2cvWlzVuQGyhL5DQTuXDNvGYe2AsdIjdI+RYdmXo
         0Zow==
X-Forwarded-Encrypted: i=1; AKwUvBwJuC0sJygRuQBbta1oTudms20sjOEE04Ehzz8SSwiKlSQFS2YNGgBVMpjcptCwfiSgqU2PS6BvmddZA+c=@vger.kernel.org
X-Gm-Message-State: AFq9FYKg+lwENgG6udHKs5gkAuGWRy5JCCxhidfXKuOtQhKcCAsKBtkU
	PAUz8BGMfYGqXt/8+KbOGxHJhGPLRUFGmVvFuTSx8gXw4IpvgIH4stXp
X-Gm-Gg: AYBFou3xUrRi3D4TfgF4KD2znJHjoUrNXBJVuvW/i4mnCpUHZje7i/c7jH1k0tUdbCA
	6sTTs11rdkzoNyRv/j/rRR0VnVANmRtLLSd92RChtMYQ6KgnUpVRXpCB4yIZzSxR+/Kh02uRx6+
	Dx8Wd+Z9N7u3MkZWmxxuZ0jMiw/9cXSf9/B15SC0KMMsmP8R1tpRPdJ43ifY4sNlj4aH4SxDqKu
	w4/5tJEbe9U5AWAsGxB2cQt9L7nVySpkPMnEhTrBQmIVtF+7gzUHoCGERC0byvAv0xe0lcoEbDR
	IYDGN3rM9TYa1vjCOlGsxGc9M8ICNcpBdYGQ5yWXwMxgqNP8S74xsrV4PA3wKa92nstYwk1a8Kt
	waetdTzO4QcpclXVtV2mAVKjDE0YuQ675GIrzLDbdgOG2hqGWd6SGm1SA3gV4nbVo3IvL3PZOlU
	M3hWxIK/TaXtc1XZ4c/ljJHBpIVpFUkfMXZvvoQs+CS9NzH0/ZDnEPsacBUfa1uju9EZQs/Hklx
	hn4RCyPKVYayN87D32jDiJJKFcN5d1ay0OyX8YwBZO1fpdkj92Ou2c0cjM+YgtQK16bGh3Obz7z
	v++UTfGDzYm1tIFVQ5oVFjxTIKIZ1tlxnuoJEWFIAmrr63Nyb8uTZgizNhHJZJenRs0ZMyvUp3U
	maVjR1bVFvQVJ8RYgRF+XkLZ8GZrqTrh2abQLoWgNwx8Aa+fWuADw/1V9iEI=
X-Received: by 2002:a05:6512:b94:b0:5bf:cabe:23b5 with SMTP id 2adb3069b0e04-5bfd9595416mr56362e87.60.1793311601021;
        Thu, 29 Oct 2026 15:06:41 -0700 (PDT)
Received: from yantra.. (nekmmqtmquaao4qwdoc-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:6842:e549:8c95:f73c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfd9c507adsm9605e87.65.2026.10.29.15.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 15:06:40 -0700 (PDT)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Eddie James <eajames@linux.ibm.com>,
	Joel Stanley <joel@jms.id.au>,
	Jonathan Cameron <jic23@kernel.org>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Rupesh Majhi <zoone.rupert@gmail.com>
Cc: linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>,
	Paulius Zaleckas <paulius.zaleckas@gmail.com>
Subject: [PATCH 2/3] iio: pressure: dps310: reset the chip at probe
Date: Fri, 30 Oct 2026 00:06:34 +0200
Message-ID: <20261029220635.18816-3-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029220635.18816-1-zoone.rupert@gmail.com>
References: <20261029220635.18816-1-zoone.rupert@gmail.com>
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

The chip keeps its registers across a warm reboot, and probe changes
only the shift bits in CFG_REG. A reboot during a FIFO capture leaves
FIFO_EN set, so the ready bits never come and every raw read times
out. The timeout reset does not clear it either, since the CFG_REG
update that follows writes FIFO_EN back from the register cache.

Reset the chip first, as remove already does.

Fixes: 90f0d1016398 ("iio: pressure: dps310: read buffered samples from the hardware FIFO")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260921183132.233136-1-zoone.rupert%40gmail.com
Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
Cc: Paulius Zaleckas <paulius.zaleckas@gmail.com>

 drivers/iio/pressure/dps310.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/iio/pressure/dps310.c b/drivers/iio/pressure/dps310.c
index b6aa5dbe2bcd..29778f25bb33 100644
--- a/drivers/iio/pressure/dps310.c
+++ b/drivers/iio/pressure/dps310.c
@@ -1445,6 +1445,11 @@ static int dps310_probe(struct i2c_client *client)
 	if (rc)
 		return rc;
 
+	/* The chip keeps its state across a warm reboot */
+	rc = dps310_reset_wait(data);
+	if (rc)
+		return rc;
+
 	rc = dps310_startup(data);
 	if (rc)
 		return rc;
-- 
2.43.0

