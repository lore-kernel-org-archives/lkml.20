Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792491534;
	b=t9HJAOYmi0owt/QKDMrHztXiyjwEsjywtBNfkwI5P+yb4LQnb/CnqtOUTnpsQypUS9S/
	 u55v62gpuQqNTNQTtms2teHlQXSz/fLz0gizjvJQJdD+WfTXCTRdr53NWxb1H2D0bPMM+
	 8/hll2YUFEl3Cta0N2/mvcqOib9XthBFQ2sYW7d9N6j1gqtpxbzmU06S3dmHqmNDlM/5u
	 +TPz16ybyI7Mbndn15HxTbJFsIo4sv2x4z7KIQ8rvlVNLCIaxBZNJxprpMPjwnVEAkg7D
	 XjA1otocImyFh4zQAzOcLl6qoMN8Zxv5GHJj98ZRrVTRl9DBYh8iu/nDMlXD7gzsrCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792491534;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sp+fVpNyhFhuAR4dBtfI2xyizMOxfhym5j/l32YJ/u8=;
	b=aGIz9Trijwq0sLiiKwnKL6lkki6EyzGTibLCEzUe0lddrUV1/TC5J0uRPpkZPKAohu6S
	 sYkDBl8EYimyXvvd192JobPOIBEABq9icwlNmH56cO8lFCFtIUEnItqiYK7mBD+GzEg6Y
	 7jr9z4nfEDeZBOYqqqsLFLM2Km1ZsmoBjiR5BAWx7PiCXryxubldZo1qDhHQsdOlLrHuc
	 q58sgNuvyZ3LDWFtotssOE+xdvSXjT5UTjKWlRZ2sqtK5iLdl+ulGaeSlvEgi1TqCIoCJ
	 4GsSO6Z6JtlExZhJDlE22AOGMOtUvZVSs27OWagFh5vv0CjnYXLDkbcLNF+c/1W0H8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JFBN4KRF;
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83FB60A2636
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 10:18:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E83FB60A2636
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JFBN4KRF
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cd62c570b5dso1652283a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 03:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792491533; x=1793096333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sp+fVpNyhFhuAR4dBtfI2xyizMOxfhym5j/l32YJ/u8=;
        b=JFBN4KRFAZ43sCeTjeCE1szadaKAUH8DaeSNJoSbW350D3FK6xZe0sGxcfgSBPZl+s
         8ZnKpscdxT5pg7lvsIl3t8JOgV0lzwX4IhdgYSSuYYKRjNgn+mtFG8SOvIs96W9pYXFC
         xp5/OVn+QhS9Y4RJkRwE2rt/K2WhZ0HCX+zqBL9VjRmUuvCsxIIsG2daC5mogziqzbH6
         ikP9Iig7ySjDmD79GiglVWN9sOHXKVf8QOb/MwkX7/2Tha+8xpWwhWtjyhI06HK5TsHn
         qE238JBOFQPecUsoZDLo+E7cGUp1qxmEkOlYAFZkk7Z3t1m1cKenlpLLY3yZG4deec4l
         6pCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792491533; x=1793096333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sp+fVpNyhFhuAR4dBtfI2xyizMOxfhym5j/l32YJ/u8=;
        b=wtfmt0ooZI3AitjpOZlELRmXq6Dzv7fW7RIF41J8AZMHkdhuGpDVmS9ooEV/fuBLIY
         FNnGqv3FlKlFDZzjJeo/XmGgKxQELd1ancHJJ351MY7hsYIWGeDlskQZVa+FUc6cKv7U
         IcSEABLzR0BsuYEB5G46V1H9u1LboBJhNZJPnf1jRxcus3uSfzwVKV9gVd0UbjLdXoQo
         l+InD4JgT4wOONZsStbBAzsi19RHSw3DF0pd5eUcvfJhlkq1+Fe1vbKMofNjZuGvgZZp
         cuI5wa/Ee+hlGI+mF5sTClboxn8YLgNQI9bQFVko7llkgCEf7yjkOoivnpAjqmLAstYv
         e17g==
X-Forwarded-Encrypted: i=1; AKwUvBw40CpCVKHGijswxXa2YdXReu/rhN+l+JCjj+zQrD7oZbz2EmxmLJPur3TxvpBPb5h+ZO13lkrlB2qFUKo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLpGeEsLZCKIy9BQIyu239Qbi6ldSoqa2F2iV7OK4dkVd0Ve1L/
	li47b+6gfDurZLN1RUWD8v64Fe2PG/O3TQGBDeIPc7NkoACHHA5MgtuP
X-Gm-Gg: AYBFou1hppUA8iW43dLrFkZtVcVKGdxBKpfuTtdEL5bbAGLz2SLcAb1fC+ZT5LEuu0R
	yEXb71v2tWgVZqDlQ5oMJKmw3kBDccZtwMUUUy5CCCvDJkYS2bGMjjUR/jVj5smHU+ckAELD//z
	RP2n8Nl0RfrJecJvEMx7qvPvp09uFYkqFvE7hIZwRrqCBi7mcbfKmYqOMCytFoAad+v+3dvTZ5e
	Wd2yxDuYUNeLeXExecr5LuXeZByvVi9coW2rQD9BVEn5DXZgSQw4pdnIhTcznORc5nqjtroNYtc
	qAOqm/JqudifVaO1ZGO2imnNl3MHq94I3zzvHPHJOT+GUW6PVcn72JNLvKcOAJhEFTcTmSelP5V
	vtXt4KwXdt4YkJN+nTiey0OFBsjpDKXfWfBXT+0XQ1spUg0sVPa59SD7gXyxO6+Sqh4JTJR0Hb3
	ux4poD2ll2Dj5UbsCqVV04aXfw3Vq/MrXGANJJalwmH1Cy3M5/BxNmIfJf4G3IKTfqgUI1WBVp5
	HEbT0wRA0TOZujL4qlr0J/8C7JGAYN9vP4xtNwTZ/b5rP5wCyH5Ijf9L+Sl3SDRTS09D0qy+3OC
	Bc1Y20QCMT0jJr6CEhFOD+Tgxzn08IsRSNioiJLGlnSYOSWFKXsweirYFRyNy8gVPjg=
X-Received: by 2002:a17:90b:28c7:b0:3ac:945c:7f69 with SMTP id 98e67ed59e1d1-3acef15c97cmr8904570a91.66.1792491533262;
        Tue, 20 Oct 2026 03:18:53 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad6100ba34sm2873904a91.16.2026.10.20.03.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 03:18:52 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: Ivan Orlov <ivan.orlov0322@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Shuah Khan <shuah@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH 2/2] selftests: ALSA: pcmtest: Make room for the longest fill pattern
Date: Tue, 20 Oct 2026 19:18:37 +0900
Message-ID: <7cbbcef84d2c14a2f0ec0ad2ba55c6ba0a15a8d8.1792390197.git.sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1792390197.git.sammiee5311@gmail.com>
References: <cover.1792390197.git.sammiee5311@gmail.com>
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

The driver accepts fill patterns of up to 4096 bytes, as pcmtest.rst
documents. The test reads each pattern into a 1024-byte buffer, using
the length the driver reports. So a pattern longer than 1024 bytes
overflows the buffer into the next pattern and past the array.

Size the buffer to the driver's maximum.

Fixes: 10b98a4db11a ("selftests: ALSA: Add test for the 'pcmtest' driver")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 tools/testing/selftests/alsa/test-pcmtest-driver.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/alsa/test-pcmtest-driver.c b/tools/testing/selftests/alsa/test-pcmtest-driver.c
index 5bba17434a6b..e025a7bac26b 100644
--- a/tools/testing/selftests/alsa/test-pcmtest-driver.c
+++ b/tools/testing/selftests/alsa/test-pcmtest-driver.c
@@ -10,9 +10,11 @@
 #include "kselftest_harness.h"
 
 #define CH_NUM 4
+/* The driver accepts patterns of up to 4096 bytes */
+#define MAX_PATTERN_LEN 4096
 
 struct pattern_buf {
-	char buf[1024];
+	char buf[MAX_PATTERN_LEN];
 	int len;
 };
 
-- 
2.43.0

