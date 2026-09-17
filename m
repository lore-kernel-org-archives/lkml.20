Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C16D299A82
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 06:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789626354; cv=none; b=uxY2N0t5ByZmpTx/5Szejd8mFgWPZ3TmbvLFSnYzvNJTw8S1BHe9/yvVlEYw4a09TABUIi3noEWguhFr/xtHuOpqEOq0STve8qiyou+13g8vPwgFiUh2ekcrVEQQgM7VVML7rit97uHRXO/7iGUTAi/h8GgWdMz8tXFKD3FbM5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789626354; c=relaxed/simple;
	bh=nCqjXs0qiz0F6e0kKhfQjdMGLU2hzlzq71MRbkYP0c8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bL0dT9k1ZQwHABRigZM/Ek5XZY64nHI57CD8c6u0pSLkLccgJuv21uf/qjqa4NDrVn/UnZGuYgKfig/xdWCu9PksRsnSDww5QUrFRVM7+Y2nvPDz0uvk0fOdLD7J3uJYdt1yP+TSMKVBv79gm8AWIu84/yPqGboXfXeCqWidV30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=GKXWeyCy; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="GKXWeyCy"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d1ca5b0d6so3317955e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 23:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789626350; x=1790231150; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LTzr2PS56pB9oIMjh38Rw2y10FQepTrU7TuGcerh19M=;
        b=GKXWeyCyHujb1/69o9GGd+D2MYLBtdFSk4rLVsWHMqSg+DRw/PCSF/g1eMje/TqzYS
         2m8TsTPxVJ0lwklbLJIQ5atMWZJnqAcDctK+0gMsYLbeCg0fCWHdWd1nz9O//cg8LHMM
         eB4ZIuZTDcfujKpuE+SKi0xEQFIA06bQZLrjPqrjxDNpW/UFhKhZyQZXueI1b+zNlhHD
         JQmd1dbpBlWKukPE7EesTIGooCkiup8TzsW8xujn6jmuDM9JV5XWzr1o+DPz4RZ4LMGm
         bhjlrmNEvQ8mHUhHZjUP84wSIsG2M5e1QlYEWUAZKsakBbZX++Pq32Gfq8NpG80GU/3T
         teZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789626350; x=1790231150;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LTzr2PS56pB9oIMjh38Rw2y10FQepTrU7TuGcerh19M=;
        b=tzf09LAqfZanpVbQwiBBmU58zMivibEendM2iXKe73KbvdZ4OVV5im42BVW5SZgiIq
         GJ2YL3PpzIf94u54fXNzGpIcNZT/gXzC5cNnPShxnsKJbrbvZKthX2ugmlsYZ+TmQhOS
         Od6VsK3mdPjoa6zgT0EZoHTyHph1JARO+DfVhYOnXLSxkDe6CgZbfo6/zPcW4j5gA2Xs
         a/hCgw+8aV4ToTnRrMpCnGtHtsN1uqLSLR+F82CC+Db9NS8cLSnXBYkacHbtpxUUMVJ1
         ArCJXNEv0XjYJN1xc667JqcCuFxwqD4wia5kT+Y7wc2198MbbxvKs6bYWvLfLUyyMcex
         dgOA==
X-Forwarded-Encrypted: i=1; AKwUvBwFfEqXphjfYkN0t2V73eOn4brdIxJV18SbsjFFuC4+WnhOiJcxzg9CC3HIQhit9/cDfoy2t2M8CYjCF/I=@vger.kernel.org
X-Gm-Message-State: AFuF++n67Adeeuxarsv7AtMt73BUz7U0xNlMwQ/B1CUs9o4vRfexYXzv
	cqDQWlycEMrKXUJe6HO1tBV4LC1BC44iypgXX3akngGBOFUIsLSa9FGkF588EmOnaCE=
X-Gm-Gg: AYBFou2qCh5fZr25qwB4DXl3kzFw0dMKI6tLR4qdmctLInPJ5irC+yeAcl+APb5I4dT
	+jv1lIpJ6NCyOXbixnb/krvBgVyH6a6y0GIkctuYiSU4ch3VWkwABRuNk911JlYea6X1zPtRIFb
	q0tuV+1p3vR8ikqwmp/L+c6R+SwjLVcowaWkzFq2eFsGRFjrsF3zMwO7l7VMXKQifxp0hNbS36M
	RyfphhXYcLVVJZXG3gbS+g9ny78J4cPqA3HoqtAihV+oHNaCliAHpBo8GrQS0rAJC3r83BNBB2J
	vei48GvKD+PXy0mPpMME9PPmTrr4mrtpkhwkx8pAKYItvq+rdTgHHX8sXaAOXYi+hmQvhSqu6ix
	aRjXOmZXrxn5EQ+fq6HmYwPw8tgRjMT/ZNojocdkvwH5io4VsvvCW9kgnE1lQ09w01O1uSI0V6k
	Lo3/CRRv1ZGXPn4OLXLjVZCxp3S8VrHsSWTb11nlbYUYlvd6NLlQy3G/fkGpFf/jji6z9xrQz4l
	zejZFfO5PEZiEg=
X-Received: by 2002:a05:600c:4e48:b0:49e:663c:c67e with SMTP id 5b1f17b1804b1-49ebe991792mr68477175e9.25.1789626350235;
        Wed, 16 Sep 2026 23:25:50 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49e847eab65sm77377045e9.2.2026.09.16.23.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 23:25:48 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Dominik Brodowski <linux@dominikbrodowski.net>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] docs: pcmcia: Update location of PCMCIA_DEV_ID_MATCH_* constants
Date: Thu, 17 Sep 2026 08:25:36 +0200
Message-ID: <20260917062537.112663-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1177; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=nCqjXs0qiz0F6e0kKhfQjdMGLU2hzlzq71MRbkYP0c8=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqq4fh2cLfpgpwwkKf4XZu9s6qS//Z74mDcLmfs lPxQlOE58yJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaquH4QAKCRCPgPtYfRL+ TpjNB/9w2qCDlGYD6j5cMcOO6TOQGEPcSMXsSgvDpcc/LC6I8FzLRb2Jt6QwFvM2pO1WfhL9F+G ccftR9lpwyVf72/OQ7EOlkxC4+o421byU+7ubps5ooqgCyMZuQU1dox9TXVJGTUIL8rcfpkMNYc G2aPg3TiA7DXuNXNNy1tLGruMh8WxSbl2iKMOMULOnCNzZR+iFeZ0T7iwoIh2MzyV7ryA1WXyay NfAYg9aZNYl1MgTNA5HfnHgKwMcx4DwhCWB8GzpX/4hcdDo+X5QNWU5lFYViF5BKhqxtZhNJZLR fpiXVZP3feAkzo0THqapQSF3EaT+JbgP+fvO6ahh33DDNsh+
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Recently <linux/mod_devicetable.h> was split into per-bus headers in
commit ad428f5811bd ("mod_devicetable.h: Split into per subsystem
headers"). Update the pcmcia documentation to refer to the new location
of the mentioned #defines.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 Documentation/pcmcia/driver.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/pcmcia/driver.rst b/Documentation/pcmcia/driver.rst
index 5c4fe84d51c1..b91e5c14cb87 100644
--- a/Documentation/pcmcia/driver.rst
+++ b/Documentation/pcmcia/driver.rst
@@ -15,7 +15,7 @@ runtime as shown below::
 All fields are passed in as hexadecimal values (no leading 0x).
 The meaning is described in the PCMCIA specification, the match_flags is
 a bitwise or-ed combination from PCMCIA_DEV_ID_MATCH_* constants
-defined in include/linux/mod_devicetable.h.
+defined in include/linux/device-id/pcmcia.h.
 
 Once added, the driver probe routine will be invoked for any unclaimed
 PCMCIA device listed in its (newly updated) pcmcia_device_id list.

base-commit: e6e35979777d646fe3c7c94dca7dd32fb25d45f4
-- 
2.55.0.11.g153666a7d9bb

