Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793357284;
	b=bGQsnLHAivulZqYJeadZXJOsJusKAfSoPXi41ww9UjDfrYrgI5OlYzNmdPtASAJBi3bM
	 WYSi9UJjWvROgVBZfMalU4/AtTUWhVCyt2+OrVkAHQwKd2tgyCTLxq8epOmuksi3zx+vS
	 xBaMt0rZbxAocbcx2iwbTDVwkQMzzbcp3/JR965812JJSLrcjwIySdXz/HZIWv/YzHZi+
	 Y9jL62zuF40A/Iqvwi7QyDQxj9s4ekgiFUmjjMKDRlbQffe1OaRPGmRbShLwHHKRukRAa
	 PTGL/DFgq6WWZqL+y2nCDoo9HP7vlcNSjNuv8xF5Xy0PctdBwAN0OHE/wkVSl5FX6uQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793357284;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=C57ru1ZgQyPfTj2Ltl+MtZ6bKGREeSrdFgZ8/zlIiCA=;
	b=SpOWWe4RRIe9tXvq5AFp+q4dIeUItkcLQ4jONkt7KS8fZdoXlo/PwmrKlXm5zPHo49n0
	 Rb2nCphJV5p6fo9dWTpVevgQYHl6LuUadmru589J5VEZuzVfvB69JsRTPQ90CjestOLsK
	 5uDH/y8x+j+KC07mqPuahnUTzbeNz92X08L5NtK6qjXKWjWZ6wTfzsPPPYEBTWDA6tml1
	 o2bQoxR5xlKIEJ3D8hrCuazHU6rHs34uRWJa1PGxUk6o5wdXHGOBGNvTYF3ilwpeiYQjT
	 rW/FPOPl0zKlygYERChrnqGM8Z4PI3PvUaAvNld4UjIR7j4MxnMtdAaDYRYD0JZ8PHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y+c0kfy6;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B9B606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:48:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05B9B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y+c0kfy6
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so5581055e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 03:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793357282; x=1793962082; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=C57ru1ZgQyPfTj2Ltl+MtZ6bKGREeSrdFgZ8/zlIiCA=;
        b=y+c0kfy6ChDLjC2R1iiJMnAjUiTid9A+fyPapn4dSVhOrxBpyPmg3QbZSwOHJEAbYN
         Q4HeyWLBCXC0p2ef9JYeIR5WCJ242CAZTHXEApeu5gmEJuqHgm0TtUKkz7iuTki2KO2O
         5pEsL8TdYvMxN3An7qHagEnvL9CvyKmbyTAvb3ZLpDV3wLtRwzNsBpjP6xq+Z7AgqRpX
         JRIJGIVhh7hrJTsJ7Uz01Lg2/RH2L5MGIjXpTckKFdSY/uYvKkyEPSoJksh8cx8V9DyZ
         m9TAdMJ+TaFjKP5kB2PX/HTzNM8J/A3FxZQFFcUzMPykDYK4AGbrCGfM/LEjUke0V1KP
         yx2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793357282; x=1793962082;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C57ru1ZgQyPfTj2Ltl+MtZ6bKGREeSrdFgZ8/zlIiCA=;
        b=TvHzyqXHfWq2NkNx1UXQmKeoRABGNXggR5gvBc0ZIt9RF+6t02RJhKpqIYt3eE9rqo
         YL9znhzlJkcoKfcPLcsEIGmJgftlSrkK3TS4OskqVGz5R3S0gc13UeilepBynOLadsOv
         IN27MskuYKro2w7gGRFTuMyTwQlbSLTl5PqIHgCcxYVtam0i0xFST0mN8/p9tctr49jd
         rD6IDL4ZgnxEm/poNqxxsogq7net4FsqAhhqSCLG3QuUFkYJO+eFh9tOSUb5Xf4wgH4P
         3dP5SBTTgH4BMxJnL8ue+NJPJrHpXWL0rAKg2gq5xHNqPk78QTcXECzU9NdpdrfVbvG/
         YtDg==
X-Forwarded-Encrypted: i=1; AKwUvBxeioPLJB9O910UjWET14phhUilHP1RsmguRCur6hJvyqR3tgWBAuI6MXbW22TSBaTLLLK4HjdnQbQR1Ek=@vger.kernel.org
X-Gm-Message-State: AFq9FYJR0rvCpc7t2mLsMLQpdJa4pcRfnI/v02ZRgTDpWn5wbNEjIumR
	1N4XkdWLgmwhvCdCRehjmoMatwPLfyaKiOcRbKKhKi4ph5cyTXDYZ7EL
X-Gm-Gg: AYBFou021XaYBaWRmVx9WeKVAnrMbGQQ733AYOa2+4rt3uatLhuLn95/Y5aYNWz6c60
	GW8Ds5IRXwlhbQZmgl2O9G5mtV8AOaUHPRNF0Y/r3p4okYlfjMAVrwgTent3rcfFXJx4VpUvb9V
	zB83xLXolbtAOA1IG3vWY3y8eUzjHLjx1cwR+yUyoNOeFLA/hHNIGtJJHe879R9zpBDaCx/R/s/
	mBg0ZceysC2WR3eEJuSAP/3Q5ajXp6WmNcxLDG2qLrEiTx8PlZSF8mw/ycKVmHlDQNf8++4GCsW
	bytKVkU7DylhFvMLR7hnhy7plmrckTkKOA9U1OTIEPVCXoKjGmZhq2xzoI+b+2Lay4vHqAUZrRK
	WIk73O7P47dzmoWgwUQ8P275IRCqAHHBT8/LhBQiSEdJqCgdUqI2fSGkCsyOlbW0dMgE25hMNpW
	Mkr3wtvrTzy2GQtVbcuIpwj4PNve1IxVzMox0OCpC5tEug5I5y+RQ4RZfV4KT6TIdkKNY32HulG
	GSfevIXgccoO+Qxwe//dZ/UO48Bo1Jx1ytQGvu9L9Z/TjPsYT7dKarhGsA78WywQMpfehd18QTW
	j9l+WhIMRYlsmS0ezaeleP3oAX2kPw1jwPiSh7lwDQHTv7cVpjYeEJQF0o9K
X-Received: by 2002:a05:600d:a:b0:4ac:aae6:6401 with SMTP id 5b1f17b1804b1-4acaae665d8mr12093245e9.12.1793357282256;
        Fri, 30 Oct 2026 03:48:02 -0700 (PDT)
Received: from fedora ([154.183.179.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71bae25dsm2240473f8f.59.2026.10.30.03.47.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 03:48:01 -0700 (PDT)
From: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nuno Sa <nuno.sa@analog.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>
Cc: David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux@analog.com,
	linux-kernel@vger.kernel.org,
	Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Subject: [PATCH v2 0/2] staging: iio: addac: adt7316: clean up header inclusions
Date: Fri, 30 Oct 2026 12:47:43 +0200
Message-ID: <20261030104745.16693-1-abdelnasserhussein11@gmail.com>
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

This series cleans up header inclusions in adt7316.c

The changes are split into two logical patches:
1. Drop proxy header <linux/kernel.h> and explicitly include
   <linux/bits.h> and <linux/kstrtox.h> per IWYU.
2. Explicitly include missing headers (<linux/err.h>, <linux/errno.h>,
   <linux/pm.h>, <linux/string.h>, and <linux/types.h>), drop unused
   headers, and sort the remaining headers alphabetically.

Note: <linux/device.h> is retained because the driver explicitly calls
dev_get_drvdata() and dev_set_drvdata().

v2:
 - Split the original patch into a 2-patch series.
 - Dropped proxy header <linux/kernel.h> and included <linux/bits.h>
   and <linux/kstrtox.h>.
 - Explicitly included missing headers for types, errors, and PM ops.
 - Retained <linux/device.h> for device drvdata functions.

Abdelnasser Hussein (2):
  staging: iio: addac: adt7316: replace kernel.h with bits.h and
    kstrtox.h
  staging: iio: addac: adt7316: explicitly include missing headers and
    sort

 drivers/staging/iio/addac/adt7316.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

-- 
2.56.0

