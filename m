Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5ED43B14A5
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 07:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789110266; cv=none; b=ZbPhCJcJXOSoF+bQj1TkMkmwpHY3AGbXE5OGrjDeGyr/Og9KUe0qwGZJ45wteoStyY/18u6ysesS1gZQkq0/kXcM9RBhP1kKBcnYrjiuNr5pjthe/nWww/VdIgPOLcCF0JChULPMZL9LncKmDT90BgVSHICknOHWgZOUV/AbvJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789110266; c=relaxed/simple;
	bh=fm/g9CJFQX8QW6SK6YilLm0SHEquTeI6Hq80kwbEfwI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=CWvIRaj46ovkenLp/5OahizJDMli9idHyGYJgG7PtLow2oiQbs0Ktextvmvj77nMdHxFn90WcMEZaW2xJnIhAAuY98hvqY6dIM2LPOr7zI6GkkuPn1tYYQBox2tb2PGYNebpD6XoRMdRiJiTnr+gEME5DOMqbQ3L2LrKOAzrr7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--morbo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QwJmB1pj; arc=none smtp.client-ip=209.85.210.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--morbo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QwJmB1pj"
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-869c40637faso628096b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 00:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789110252; x=1789715052; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=q15pDPXWwHD21xyeCsqnIN6CD+fe6kHmFEwudOZDaaw=;
        b=QwJmB1pjHFhKmGll/90ssgmI9fYS46XiFoPPGYFLPwuOvXakG0LZu/Ohy0g32jwfbs
         RSyodyv8LJt5wjQMHeV0jPJ92ihRvwCILsxaepqrZRsmS14hmJPqMNQ/iWssAPTHCoe6
         KGgUy2itEO8h8RBr1wfjs+YaITXUXDzX7NDq1zObsSjI1xRfsLOXflcxMQ/mlmE7NatK
         NU7ohyGNdEVVNz041N/EOpmBzVyzlftIsIFAjepMoCqWEjOR7DskVIWW37pzbGje68Cu
         8MBlMibpjbLlVR6EfN/6M/b9yrpwtf5Flml4MFr4D3ShlWhZhynPrF0F9k7tfQ1FpGRj
         Qb0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789110252; x=1789715052;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q15pDPXWwHD21xyeCsqnIN6CD+fe6kHmFEwudOZDaaw=;
        b=c2awBGtFtvxzb63HdFkiksIWRFWAHWOeJiFz9ggkfsguVkNXn3sPzKGNLwTt6wIccR
         nQ2p7QNGBq+KcZaXck4690Q5gGk72E0ir+x9QCSJjFZaAsk2Ea/R6Lr5Ay+OOGcJBWJb
         RWvd/xKUP7+i037nG9WcmpXgJraj1W5vhgfHNeXVL1xPsZnSSxOBQNQDvTOrg9Vpk//w
         dPPn1YWB+IL91qZZKcFlhKcpP4LWw2HtUAdC1aZNlC+TVsHK8ItiQZPspEvklwAQGTKi
         1mlXC3mrgjX+evke6S4Ud68GbENunXwLXQDWDEc0bxrAGZiby2VjNVz+5I36msQqVsPw
         v1ZQ==
X-Gm-Message-State: AFuF++nMrNxnHimMiVdjZheUgnWfiC/A7W7JromnMK6xayG/87zokgnL
	2HriyY1RGN1R8GdPZ1zXorARSh13E7ZZ1KEiTDGNm+8lauk3tEQmXqhSoKmfdlai+WJ1Iil6VGs
	Vc1QuVIZZ6R5goA55avVFT25oSC6PtKolcPs9FmjwnlMf5QGsbe7AZJImZ2KJRxO2NxhkebU9x9
	lV/pujwpdKIGcPyVmSadIjBzqVkGM8qBZW8W9nXg==
X-Received: from pgbbx40.prod.google.com ([2002:a05:6a02:528:b0:cc4:aa48:7b7e])
 (user=morbo job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:1611:b0:3d7:eb3e:1c58
 with SMTP id adf61e73a8af0-3daed1c1684mr5671856637.8.1789110251982; Fri, 11
 Sep 2026 00:04:11 -0700 (PDT)
Date: Fri, 11 Sep 2026 07:03:39 +0000
In-Reply-To: <20260911070346.801948-1-morbo@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260911070346.801948-1-morbo@google.com>
X-Mailer: git-send-email 2.55.0.1032.g73a4cd73de-goog
Message-ID: <20260911070346.801948-2-morbo@google.com>
Subject: [PATCH 1/7] kasan: Add .kunitconfig for KUnit tests
From: Bill Wendling <morbo@google.com>
To: linux-kernel@vger.kernel.org
Cc: Bill Wendling <morbo@google.com>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	"=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>, "=?UTF-8?q?G=C3=BCnther=20Noack?=" <gnoack@google.com>, kasan-dev@googlegroups.com, 
	linux-mm@kvack.org, linux-security-module@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Add a .kunitconfig file for the KASAN test suite so that it can easily
be run via kunit.py:

    ./tools/testing/kunit/kunit.py run --arch=3Dx86_64 --kunitconfig mm/kas=
an

CONFIG_KASAN_KUNIT_TEST depends on TRACEPOINTS, which is an invisible
Kconfig symbol without a prompt. CONFIG_FTRACE alone only unlocks the
tracer submenu and does not select TRACEPOINTS by itself, so also
enable CONFIG_SCHED_TRACER=3Dy, which selects GENERIC_TRACER -> TRACING
-> TRACEPOINTS. This follows the same pattern used by
security/landlock/.kunitconfig. Verified with:

    make KCONFIG_ALLCONFIG=3Dmm/kasan/.kunitconfig allnoconfig

that CONFIG_TRACEPOINTS=3Dy and CONFIG_KASAN_KUNIT_TEST=3Dy both resolve.

In addition, set CONFIG_LOG_BUF_SHIFT=3D20 to prevent printk buffer
overflows on serial consoles when running under QEMU, as KASAN generates
extensive reports across its test cases.

Assisted-by: Claude:claude-sonnet-5
Signed-off-by: Bill Wendling <morbo@google.com>
---
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>
Cc: Alexander Potapenko <glider@google.com>
Cc: Andrey Konovalov <andreyknvl@gmail.com>
Cc: Dmitry Vyukov <dvyukov@google.com>
Cc: Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: "Micka=C3=ABl Sala=C3=BCn" <mic@digikod.net>
Cc: "G=C3=BCnther Noack" <gnoack@google.com>
Cc: linux-kernel@vger.kernel.org
Cc: kasan-dev@googlegroups.com
Cc: linux-mm@kvack.org
Cc: linux-security-module@vger.kernel.org
---
 mm/kasan/.kunitconfig | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 mm/kasan/.kunitconfig

diff --git a/mm/kasan/.kunitconfig b/mm/kasan/.kunitconfig
new file mode 100644
index 000000000000..58a7448fa352
--- /dev/null
+++ b/mm/kasan/.kunitconfig
@@ -0,0 +1,15 @@
+CONFIG_KUNIT=3Dy
+CONFIG_KASAN=3Dy
+CONFIG_KASAN_KUNIT_TEST=3Dy
+
+# Additional dependencies.
+# CONFIG_KASAN_KUNIT_TEST depends on TRACEPOINTS, an invisible Kconfig
+# symbol with no prompt. CONFIG_FTRACE alone only unlocks the tracer
+# submenu; CONFIG_SCHED_TRACER is needed to actually select
+# GENERIC_TRACER -> TRACING -> TRACEPOINTS.
+CONFIG_FTRACE=3Dy
+CONFIG_SCHED_TRACER=3Dy
+
+# Prevent printk buffer overflows on serial consoles when running under
+# QEMU, since KASAN generates extensive reports across its test cases.
+CONFIG_LOG_BUF_SHIFT=3D20
--=20
2.47.3

