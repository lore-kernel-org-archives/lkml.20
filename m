Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792533897;
	b=ztRv2QJpRCP8EtipNqzWQa3XHnCe7k5rx3hGYBHBuyOsSvYMG8TmlVgMsXTsL5pmK5zz
	 OsnebKTlvaPcOryUO/x28rsYNdoFuRA8i6J1enK4ptThpdPc+9Jgxcj3kh54QMGxNPkIs
	 pSxdBqWNQCiqb/+v4bb6CCPyUtP1xnuWfJ71AfgF4hFOWG5lVWqi5tK84BFlt9iGvY2T+
	 kSJCdvMQb2g/jMPewQaw9g91ZZUGqc4/S4tfW6SFV9gOVegocKsCbFQ3EPZUU+TBsfi8J
	 r+GibzR8fKjHSS/X7QgDzmMQn4W9ucE9AtcJkmILtZU260izHSnE8aoJzpncFKVdKjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792533897;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=g2Bv95uNs9wnwCFMBpMwBUA6CnTr1QvlE7eTvmlNDHY=;
	b=RzLNrhyC08/QWO2zvoX2TasAYN6hPn6ywGbyGRxL4uk5S61OejOO7jxxbieVpzjvWidP
	 QX6iVhinx8/97JZmgze9Dfx64Iy9EWH2pHO5AgAkK11qM+MGqoygmKiQFr3J5U/s7M52s
	 A5NGNff+i5G6Fg2bTMJX2rhi6obq+jUMCuB7IYSJH1lITqzBR7Y9CsUalBlP3+ebCNMqy
	 ut/OpYksgyo9MYW1hOsxyr/uykn3b6A+fBUT7Bs5B4ePOs1uBgSyo4qjisNxEsopGe5aa
	 hW5Gg4l/vl4/kCMKvpU3q/ClSjGkW7WCF9hZQj8FADqZWWwd4lJHjs7j4ddtGcD9oaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Y7wBBVab;
	arc=none smtp.remote-ip=74.125.229.7
Received: from mail-dy2-f7.google.com (mail-dy2-f7.google.com [74.125.229.7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9BD5606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 22:04:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9BD5606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Y7wBBVab
Received: by mail-dy2-f7.google.com with SMTP id 5a478bee46e88-36758ba1f01so11990eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 15:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792533896; x=1793138696; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=g2Bv95uNs9wnwCFMBpMwBUA6CnTr1QvlE7eTvmlNDHY=;
        b=Y7wBBVabwOLKHpv+CX0LKO3BiKmnTqBr5oc4314z6/tDH1eDzK98NzssIhJ5fIAhZa
         /IJAvcJp9CjdBSiXKp3XDUTjosFrPSU3O8Gx1Wf7v0v/T/puZ16185tszBh9KXvZ/O/v
         hTcDYBOasVTMOGp7yso782Tu34nGLZHFnhKp5+W0Qy6lREVEDvsg/P9DuY0Qv9VYNVDL
         ImucOr6UkL1kSwGce0VE+mQ3ja2xT9z21fKUwalPtVl8CO4ZCPJpsgyPCXYl9ch+Y1Vs
         0KVxncqqLRGc7BGgb0gHGcvaRZwZsNeaRBeUfoM/wM1KDHGMKyrZS22nVOkmWK85FD0d
         dvyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792533896; x=1793138696;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g2Bv95uNs9wnwCFMBpMwBUA6CnTr1QvlE7eTvmlNDHY=;
        b=jHoAIQbLjWNXZ5QWaHyuH0vrBOFS2YshsroPaqPV0xwvguTjrp53ycx/j06RrjYygv
         2W9x2v7jQ9JGutGPKBh+8AET9SMPwaZbHFecvxW2EAWZAa2oZr/3pkA0C/UE08+sM6ao
         umM1CXNCumm2rZCzHPOqJ4Yxy1DgzuehGxltSd9mVkgOsn9Mo6BtYMIcW/vrhZEmEWj9
         EgAQLA1tblc1Kzj+3OXR4ChlTUHozrqlS5ogIkDOp7IwKwlaGTYwYsCcPHYJh9juECQa
         gXR2MfeaBKEGTTTiAx9OTjP2SpU54FiFLj2t1ar7Hg6uYdTHEFr/WvHTirfKek07f0p0
         rUGg==
X-Forwarded-Encrypted: i=1; AKwUvBx7NKebnSNGWAgyvSUcMaw/gBmHjfBtcJTGmVLh4YFJA2u27GqQu5b/PmVZnhza451yKwELFNa6Wkbx978=@vger.kernel.org
X-Gm-Message-State: AFq9FYLFWoMxa2EZFIJxi6jvDpiK+YxwTtRjqeQgBc7iEbfrHXPUSS4a
	3xSCHlo1afTX1BgjORxCcLpK/xCZLlVrVgUWp+PU4fa8mjEJyAbOn+kf
X-Gm-Gg: AYBFou09GSgr0EsSljmxuTFJYCF2+cKSAmum2qCwT6zQD1zVkidWmgRJr544HAjVuM8
	2SkBP6XC6V7lIWjp5Sm054vlmXczPB2fwdjHeshjrg8/xiZspBcgb1CFS3APzjv4xq1Y+a5sn6Z
	F67lvn+hTb1lnwJka07XwrVAbV9hs3Aad6BDQDTshQVNp30298xWzZwKBAfX41Abap5I3joOpi0
	JbFKO273IQwVJizSyqA58FyPXEqMWjRE0Bm23kZc2aev2NOjJUTw81ipxA2yKQoytcpbUdhieZt
	T8aoZtkNigbp5PifvDlW/U79/q41fS1R9KPCyH3U5cFg2PtnKFbo8GC+k+Kb8xTWCOEWXJb98xO
	D9hFr2W1I5okmJPn8ZAnIx8716SPEEILTgn/J+vyip10/waD0nwqZnOh+vIxYpLOPcamGVfBIYO
	tWK26OFRf+C4th/HoVZ7/OHAKE2laqOcRwujdBHkuh6+Ym69TlIi/1lUJ6cpcvsVUjo5IuueRBd
	SyGfu1dkkIv4bJIbAlGyYFm9Q==
X-Received: by 2002:a05:693c:88cc:20b0:361:6884:78b1 with SMTP id 5a478bee46e88-3674e55505amr774159eec.28.1792533895522;
        Tue, 20 Oct 2026 15:04:55 -0700 (PDT)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3674206d1f1sm1363240eec.28.2026.10.20.15.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 15:04:55 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: pmladek@suse.com,
	rostedt@goodmis.org
Cc: andriy.shevchenko@linux.intel.com,
	linux@rasmusvillemoes.dk,
	senozhatsky@chromium.org,
	akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH] lib/vsprintf: Preserve the sign of seconds in %ptSp
Date: Tue, 20 Oct 2026 22:02:43 +0000
Message-ID: <20261020220243.67919-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
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

The documentation defines %ptSp as equivalent to %lld.%09ld, but
timespec64_str() formats tv_sec with default_dec_spec, which does not
have SIGN set. Negative seconds are therefore printed as unsigned
values: {-1, 0} produces "18446744073709551615.000000000" instead of
"-1.000000000".

Negative values can arise from time differences, for example in
fnic_get_stats_data() after the realtime clock steps backwards.

Use signed decimal formatting for the seconds and add printf KUnit
coverage for zero, negative seconds and the signed limits.

Fixes: bccd5937447f ("lib/vsprintf: Add specifier for printing struct timespec64")
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
Tested with GCC 13.3.0 and W=1. The ARM64 printf KUnit suite, booted
in QEMU 10.2.1 with HVF, reports 27 pass / 1 fail before the fix and
28 pass / 0 fail afterwards. A 32-bit x86 build of lib/vsprintf.o and
lib/tests/printf_kunit.o also passes without warnings.

 lib/tests/printf_kunit.c | 15 +++++++++++++++
 lib/vsprintf.c           |  9 ++++++---
 2 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/lib/tests/printf_kunit.c b/lib/tests/printf_kunit.c
index eccf041ebd56..3bd5115c2eab 100644
--- a/lib/tests/printf_kunit.c
+++ b/lib/tests/printf_kunit.c
@@ -572,6 +572,21 @@ time_and_date(struct kunit *kunittest)
 
 	test("2019-01-04T15:32:23.011235813", "%ptS", &ts);
 	test("1546615943.011235813", "%ptSp", &ts);
+
+	ts.tv_sec = 0;
+	ts.tv_nsec = 0;
+	test("0.000000000", "%ptSp", &ts);
+
+	ts.tv_sec = -1;
+	test("-1.000000000", "%ptSp", &ts);
+	test("1969-12-31T23:59:59.000000000", "%ptS", &ts);
+	ts.tv_nsec = 999999999;
+	test("-1.999999999", "%ptSp", &ts);
+
+	ts.tv_sec = S64_MIN;
+	test("-9223372036854775808.999999999", "%ptSp", &ts);
+	ts.tv_sec = S64_MAX;
+	test("9223372036854775807.999999999", "%ptSp", &ts);
 }
 
 static void
diff --git a/lib/vsprintf.c b/lib/vsprintf.c
index 1d95ab9314bf..7c1964e7822e 100644
--- a/lib/vsprintf.c
+++ b/lib/vsprintf.c
@@ -1997,10 +1997,13 @@ char *timespec64_str(char *buf, char *end, const struct timespec64 *ts,
 		.flags = ZEROPAD,
 	};
 
-	if (fmt[2] == 'p')
-		buf = number(buf, end, ts->tv_sec, default_dec_spec);
-	else
+	if (fmt[2] == 'p') {
+		spec = default_dec_spec;
+		spec.flags |= SIGN;
+		buf = number(buf, end, ts->tv_sec, spec);
+	} else {
 		buf = time64_str(buf, end, ts->tv_sec, spec, fmt);
+	}
 	if (buf < end)
 		*buf = '.';
 	buf++;
-- 
2.43.0

