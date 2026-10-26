Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792991955;
	b=3EBbKqN6Z/Md4KPgsoQaT6y2eSz4pdD/qkVRHwujRpv5+zkg888qg9I965AXgvgYHxKm
	 cQs7XsFoAJ4irJvybmVpAXX0FWxTunR8ylpGEwjRodDjPXrBeyxOMl+Qp8i1DsGzrCgZ6
	 opC5ZgF2l49DTLp68PC9yql3t/dx/dZeA8I94JPUc0S2HPu2pRC4DA6N9ObnRCNxucPIL
	 et9yfKGcYAAwRmbfwiAVD2IUv0+s54KGrSygIkdcgkcHNSAu+uFYHnjpmIR9T2oDTHhvZ
	 DfmKzMi8pxNsITcaNJqNO8oN85YngZOrKjPlzlQ54Q1EEMVsufAnu4k1vZnES4DfXfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792991955;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=GR1SJvSKmvxCr2BjcQJzd+vqvhW2VA+xloz7HS/XgAs=;
	b=vCGqcldVJWw9ibVsBHsFv6beX+7vvsJgXWL/LGZw52gYm7MkznMPb+cvdcpvMMkl+8js
	 Otp+dTmRdDpGtwxRLNvpZVXwLThlnyr6Cpn+Q++cyK3N1z2qsuRWiZn/VGPmtS+INCB4t
	 mCcMHHlU7RRy5IuCYwAKKY+zI0rXBKNASC62aHo+9XtrvHW7yEKUKKQjQ9AYJXXrImmI/
	 o0Y2sguYpsXDn6kqbgU4OwvaHlHk/RybjYjgMLd3oIJM8waAEWXl86S+40PEdhgNNuTuP
	 WrJ+8orwmVmnmJXa2UH2uD+ELbO6NIY86bnzvD7lk8Ta3zTv2NoMEk7m+fmtiaWbmmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kl88xs12;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC16606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 05:19:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFC16606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kl88xs12
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48df0fa43c5so1546856f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 22:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792991953; x=1793596753; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GR1SJvSKmvxCr2BjcQJzd+vqvhW2VA+xloz7HS/XgAs=;
        b=kl88xs12a4DUn4RWwpvSIEj9DqMyCBJuuTbiJsXrpo4LqeUWra3r6jxSNY77+hi+pH
         FC7WgVXm2uLm3iBRhJYyIztvONqSdTTJ7O0nMHc/Oab19AZGZi8jW0P/1oXKTNU6AfGW
         wBHqmmajV9PNZsB4tOogGUqXSL7ZO3LpqtXCxU1MR2muPjhBotIEwv26VVMIPj0MZJWz
         Kq8x110PyZj99fCIozOeXbuKCze4BMv6srieDTYZcdG8VLegA1Yo+/59OWaP56c/stFp
         fuXfOmqyySum8NxvFQiO1BQxREmRmqex/OA1a3NAnjmiZ/OyeZ0RZHNf4MFzVGVVHBr1
         uMIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792991953; x=1793596753;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GR1SJvSKmvxCr2BjcQJzd+vqvhW2VA+xloz7HS/XgAs=;
        b=sHaxHwcSX2g/oi5ldP5FyewAaFQ+QQ2DV1MW7uOLpm5clNmqDJZzqCDKBmMfZXaKzB
         tLkPqk34ymcPOMJJp/LdCdPNhVbE79UoT+A1PM2YdNwrTpgSdB5l0fUzaeUeLKV6v77m
         tWpOENYKg7P3/BV3mKuZ/fURMoWPuPnA0sScvewK5efB3hkeHpReB8W09rp3jph5HVJH
         vG6l63iNDzX6rjpYV/xZ04hn8yz5nc6elgwcQPTH7mMFK0EMWc0F5yjy4lGqKkI7iity
         TUyocrPcxRVYIJfrF1mYUZXOavx4wcyHwFV5cRE87hyt87qEihkrXvCJcE95Z4luObBH
         bV2w==
X-Forwarded-Encrypted: i=1; AKwUvBz9sHmnbmXRrKeuD+4JMao5B/6tybelA3GV+cHcAmXTN5Dyh789dIJhe8q+YzA7qjVgZYbpRuTP74U9/J8=@vger.kernel.org
X-Gm-Message-State: AFq9FYK9TPhQSZTuKlz1A6LLZzg9zvaaitD5nit2KHHxJBosjYEJMrzP
	ZBtOuqRZR8cs/ZtR8Di6cgvDJWa0wjxAk+fQU3MpO4GG4L9RkJYHPHom
X-Gm-Gg: AYBFou36/JSmKNzuRzDdlMkMo+EpCYliYRT7LQkHcD0cJnrFFm4yR4ymCEdXDP3/FLY
	O+zWBNyVjaGhn8Hrt+SxMNOpnjV81q+kqEt3OZpwdPL93VvxQQZxN7PSJROM0cOPkbl0Bj8wCfO
	5m5OKpQCuN7dfz+ySF7c8oopYuA2T0QLZD3yAULpAm+S+UeDu7AISGmZDHHye1ns2zQ/Pr0DojB
	D2kduhHu25m5UhI41hbV011wUcQeIpxO0DCjTeA/J83ecADR58oQfGxbe4ts5hHlZ9/iZ/qmUyv
	cmh76re5Q3SF4qRbLcI1poupW/eunC6oPgX/YLizXqP0TTXZg4WXxMvYZDtfjYUJbAeOzil/b6c
	VmAMOEYOEuFCy1H7sp6RSd3cuo1QbEVK49KUrgpBtxE3E+eYnGBfNjMXXqlTeY4e/cubV3zRlHQ
	X1O4PmgoiOUoTh8vne9kQR16chjcTGXu49ezmoSpKYWmH1h92INFuXLgDD3htYgR2ru1GRZ1IxH
	5aQEU9yn2K7PSx3ZWqY6CharegTQ1tWGv3dAZB0D1xaQy/yL2/pWCesTm+aUfNpWNOQxx+bsEIs
	UWLzxFq0HWeXRkKoI1qG48MSL3zlc0+hwA==
X-Received: by 2002:a05:6000:2992:20b0:48c:7f94:8755 with SMTP id ffacd0b85a97d-48e3ed3b79fmr6670550f8f.20.1792991953028;
        Sun, 25 Oct 2026 22:19:13 -0700 (PDT)
Received: from fedora ([131.123.42.30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3eb8f387sm13667258f8f.4.2026.10.25.22.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 22:19:12 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: jorge.lopez2@hp.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: andriy.shevchenko@linux.intel.com,
	linux@weissschuh.net,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	meatuni001@gmail.com
Subject: [PATCH v8] platform/x86: hp-bioscfg: fix heap OOB in hp_enforce_single_line_input()
Date: Mon, 26 Oct 2026 10:17:40 +0500
Message-ID: <20261026051740.88791-1-meatuni001@gmail.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The input is copied with kstrdup(), which stops at the first NUL, but
the full write size is passed to hp_enforce_single_line_input(). With
an embedded NUL the helper reads, and can write one byte, past the
copy. Use strnchrnul() so the scan stops at the first NUL, and return
-EINVAL for a NUL or newline before the last byte.

Tested on HP EliteBook 840 G2 (Fedora 44, Linux 7.2.8): writing "A\0"
followed by 4093 bytes of "B" to current_password 100 times returns
-EINVAL every time, without reading into the heap.

Fixes: a34fc329b189 ("platform/x86: hp-bioscfg: bioscfg")
Cc: stable@vger.kernel.org
Suggested-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
Changes in v8:
 - Restore the comments dropped in v7 (Andy)

Changes in v7:
 - Use strnchrnul() instead of a separate NUL check (Andy)
 - Drop the trailing comments

Changes in v6:
 - Return -EINVAL on embedded NUL instead of limiting the scan (Ilpo)

Changes in v5:
 - Limit the scan to the string instead of copying the input past its
   first NUL (Ilpo)

v7: https://lore.kernel.org/all/20261024172641.19424-1-meatuni001@gmail.com/
v6: https://lore.kernel.org/all/20261016025352.230535-1-meatuni001@gmail.com/
v5: https://lore.kernel.org/all/20261007134711.473857-1-meatuni001@gmail.com/

 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
index 876fc35d035b..435639e19c59 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
@@ -162,11 +162,11 @@ int hp_enforce_single_line_input(char *buf, size_t count)
 {
 	char *p;
 
-	p = memchr(buf, '\n', count);
+	p = strnchrnul(buf, count, '\n');
 
 	if (p == buf + count - 1)
 		*p = '\0'; /* strip trailing newline */
-	else if (p)
+	else if (p < buf + count - 1)
 		return -EINVAL;  /* enforce single line input */
 
 	return 0;

base-commit: 8667bd30fd033295b3038ce374c551d1059538ba
-- 
2.56.0

