Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED01F3B4EB3
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 16:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790355447; cv=none; b=up8yMvRSzl4eVF0tXN/xIsrtbvgZiKfNbdAADlRDMDtG7M4rUj6ytKyE1qBab+IqrpWqyR6KwGbuZgtkc70YsPzcTpq4epVeQNm+t9ch3CMPpEMvadkXhco7Ypg+FOvIVuCNqhtiQc7vgXoAznRducmNzgukREhG13H2ZhCmS6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790355447; c=relaxed/simple;
	bh=s4Bhqa/9o2Mg9C+InyGA1v5tFMHsLYRgIw+LAOI5JvI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iEdgovX0mw8ChQQf4hskRo9NWF5qnwUxDoh5yd17x4Ec19Cvq60NlmyOJSV3nXxloIdVF9hYyCLr4TZvIfhw8CxS2qIHqKTWmJEqyeiAcKuUhNQ8W6k34fk0DTvHGYyWB8T5C2nvNY/QalZQNTovK3tjV/BkpT+9JLvWl/0lPjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ea7QIUSz; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ea7QIUSz"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d822dso8347375e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790355436; x=1790960236; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M37SYtPCvo9ogl7cjsynA5M6S0SGzDYIDrhu9A1R+So=;
        b=Ea7QIUSzIl7t6yQ7/xrb2PT+8hFD1HCbJgCdVLIadBXhOky0gp2mxag8zup1n0UEHz
         XtKxv5duXknFquIA1FmfOQrE6tHoCTUbOSS+DjLk72oFwq6UbrMDf5qXiFs1/kz9UKsz
         Q8SHKLDsi7WoM08VT1Iu1HT2J+tVcN75G5fWFcu72IEIua6vf/8UZmJXiarETPUOLjDX
         L2K/N63UNhjuCOGjIG8g3/Pjpzfh0tIbyYfnAevG+J7k59cKnXxcjWGTWA7jlO8qCVNt
         iwu0LdP5gL8ve9MGz/M1RyN13j85F/3fZRp4eebmpz3McBPj42qazgyoQ7BNR27FihHg
         nkig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790355436; x=1790960236;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M37SYtPCvo9ogl7cjsynA5M6S0SGzDYIDrhu9A1R+So=;
        b=rUtg89SUYXB2zwiRHOwu1hTOJEHnpAdPJu3bDdsjcyThlfoQkwnAEC/vCBdjkFzV6w
         yrf1j6cwhlipb0qHYv3IVvqXek/4zWVK0uXUFr2FTRm2O5pYRkO3H3nq5N8FqXHJyrvd
         AnKjGuAscY5AyIycK9sxKK1K0U041HBGvYNR/UBgwWQnFUt6LyIdW+F6ky5sVWkDD7fK
         nrPagG0eARjZes3p+Z9VaNMGooKQZlPrp6e6MkxEkXJ5VZLU7ALIu6rl8n8uLq5rUBMe
         S/FwoRNZlqQ+ckxZ9WYEobYlittrqsy8PNtHCL+htB1We5svKeu0HlAOh+0hc0aKOupu
         HD1w==
X-Forwarded-Encrypted: i=1; AKwUvBzFzVDZRGXMj3AuWtXzFLdbtbdqxZSecejgwWy29XKwS0yActDGrKaP7xwrFoRqEuZSuAXSBZs6Z0qnlb0=@vger.kernel.org
X-Gm-Message-State: AFuF++l4kR3liL8fpwrjr80GrQNYpdJnUqWIq1R+1AT1B72bDrVJWVZ1
	0kw/U8cu5A69+iji+2WI4gj/kqnxWdKWR9mBVqTSWbiGEYfnMy3ooxnj
X-Gm-Gg: AYBFou3NSp3Gz4emueufeU1VMGiovumfERSEFAq9z6BVOQjKtTB4Jo5xcgapngqADlS
	ETzGsC1mDwjZxvSwZ/40PHOHAMOtkYI8k2g0EAEjkfLvCoyHJAT+75m6sEJYVfE1vTfKbdmhBbv
	i6JnhkpDz3F7Wba7AqTfBlWVPk8s2fxOlYF5NL7ssD5bmapUnWBya+KeSwGg9c5CLlXScNJWwGS
	p/Vmsyy31XdxXvFTuHKFaoEs2yf/IqID0TIWh9RkSJrMNAuQuLWz7KjjHJlJvJwpNkPEPZwjSmh
	tN2kqUsHXHa7yWl3xtiWv/6s71Lb70x49TN+G+s3m6A5vjq6nV9gGrt5kD26ZHPUY58RRQAtKzJ
	Htyv3AG7bxvQRGgGQW0BUr0aVIIRFBXOZJsuZUnI2nsz7BcW5yx3/+/nIF1DekA0iZMbO8o9KUB
	OMz39K1JirnWdk5hsQEB9uD2oOWGvxj6dPNmYSvnzZo0bpBMqQEgfA02dm+z34m9bVHhnTgeHab
	I8apiTx2urTNSGgHyK9M+KZy12L8d8Ib/197M1obcZ40a5XCpLuHIj113T17rZLJsnXyqKHuPwr
	TScOBPw6CeyNSzdwKBrclKF+sF+sO6cmjzglB/4u6vrQmVOuNSRj2QlFVTRaq5wwOdNvQa54b1s
	dWSatLfQ3NbHuWGql
X-Received: by 2002:a05:600c:4f54:b0:49c:fa21:1c89 with SMTP id 5b1f17b1804b1-49fe7bd0003mr110164735e9.30.1790355435863;
        Fri, 25 Sep 2026 09:57:15 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-2a02-3100-adc6-9c01-89ae-b145-8960-cf19.310.pool.telefonica.de. [2a02:3100:adc6:9c01:89ae:b145:8960:cf19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a36189bsm8020363f8f.21.2026.09.25.09.57.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 25 Sep 2026 09:57:15 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: John Stultz <jstultz@google.com>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Miroslav Lichvar <mlichvar@redhat.com>,
	Deepa Dinamani <deepa.kernel@gmail.com>,
	Cassio Neri <cassio.neri@gmail.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	David Laight <david.laight.linux@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] time: Prevent time64_to_tm() day truncation on 32-bit
Date: Fri, 25 Sep 2026 18:57:01 +0200
Message-Id: <20260925165702.51677-2-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260925165702.51677-1-kmehltretter@gmail.com>
References: <20260925165702.51677-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

time64_to_tm() accepts a 64-bit seconds value, but stores the quotient in
long. On a 32-bit kernel the day count therefore wraps when it reaches
2^31, even though the corresponding year remains representable in
struct tm.

This is reachable when formatting externally supplied timestamps. For
example, NILFS recovery copies the little-endian 64-bit ss_create field
from an on-disk segment summary into time64_t. Its sysfs attributes then
print that value with %ptTs, whose formatter calls time64_to_tm(). A
corrupted image can consequently produce an architecture-dependent printed
date.

Keep the day quotient in s64 while leaving the seconds-within-day remainder
as long. Use div_s64_rem() for the weekday calculation so 32-bit builds do
not require compiler runtime division helpers.

Fixes: e6c2682a1da3 ("time: Add time64_to_tm()")
Assisted-by: LLM
Reviewed-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 kernel/time/timeconv.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/kernel/time/timeconv.c b/kernel/time/timeconv.c
index 59b922c826e7..f1cb61e0b114 100644
--- a/kernel/time/timeconv.c
+++ b/kernel/time/timeconv.c
@@ -49,7 +49,8 @@ void time64_to_tm(time64_t totalsecs, int offset, struct tm *result)
 	u32 u32tmp, day_of_century, year_of_century, day_of_year, month, day;
 	u64 u64tmp, udays, century, year;
 	bool is_Jan_or_Feb, is_leap_year;
-	long days, rem;
+	long rem;
+	s64 days;
 	int remainder;
 
 	days = div_s64_rem(totalsecs, SECS_PER_DAY, &remainder);
@@ -70,7 +71,8 @@ void time64_to_tm(time64_t totalsecs, int offset, struct tm *result)
 	result->tm_sec = rem % 60;
 
 	/* January 1, 1970 was a Thursday. */
-	result->tm_wday = (4 + days) % 7;
+	div_s64_rem(days + 4, 7, &remainder);
+	result->tm_wday = remainder;
 	if (result->tm_wday < 0)
 		result->tm_wday += 7;
 
-- 
2.39.5 (Apple Git-154)

