Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4091A2FA0C6
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 03:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789012108; cv=none; b=W0uZyFjjHZ6qVq4yyulvE/Bw3Pll4UxjRkGJSMvWCXlGUwZoOgyLkQfDXntJNnOgDcwk3KpJNAj4CtMl1EJ575IXzO/tilDu6medKQLnL0dUPKMGMtbzGr9wOO6GLT6qqt5OaK2+wdE/ewdKbJl3PQJJ8I0LqkvHNmRRq0y7xhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789012108; c=relaxed/simple;
	bh=rsFI+sdwDURBfYcTPzPK+SDtUqdP4949pxLEKIwiRnk=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=pt8O/r6z98hnT8Up128a+93Sg2qgBEZzNELhn2ZYaDgmldydEplOTQnTxSCATf+YjpDtbl06xZ0nLI3c2l91UTaCGDo9AN7Rxb0+HfwjZB4O0fk6L3SlYZob5wlIBe0PcY6Qmvgsfq5xqURItl+cUk8VPflJ8sPhHmHLJ1jJmcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wakel.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XqI7s4t3; arc=none smtp.client-ip=209.85.215.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wakel.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XqI7s4t3"
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc21bc2923fso7803690a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 20:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789012104; x=1789616904; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zzi//Qm9WAlH1nWPVbEFeyj5g7F/Gg5oP3YDkfmtrmw=;
        b=XqI7s4t3INGeluRl81D6LJ7LqJixma1+QVvIm9+U4VqoQE+JWklQSTTW6K+CCJWBNX
         nZ2TSW1O6aHr/fNTtYCZ9GlqSp2LGlkGVI+DN8fxHGUp5VSiHqTfSjr58hbB/kb3OjhD
         sVhqes8bc3J1WKoI8ppRjt11YWnKtQXow2HJ7fsayz4tbC7P9/oZFcMu7rjZMC/Si1lN
         PmWfIpxlYpxL78y4H5zqAH2/cQhZFoTUvLhm7fPKqRP2oOxr4075OTvd9uvjzOi2iHVg
         2NWF6jRgPxQPrRkPXPEryZo+wO/JIFB86tW10YkK+kQn+feMIGMtzAqVhJtViIFdNoUF
         qAJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789012104; x=1789616904;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zzi//Qm9WAlH1nWPVbEFeyj5g7F/Gg5oP3YDkfmtrmw=;
        b=h3ik0u3UGDafAbUBqJbhfmnNRsLGEYeqglC0YTkxBa5y6tVwRTAaMkMgDHUr67qCTw
         Tln6IfqND3gngyyFT6W/6T8nXWvnNsJNw3sZko+jkBU6DFW8q6cbi9ZsKPp6GQDlpZzH
         UFJcBBi+EYd0x6GBMkbt9GW0HeKhfdYnxe4pFJDpn9ZBvHhjj1cGGRfLcrr3OoTH27or
         VNZHMlkulp+ZedNieDG96nYgw9uEYklRXicy4krCtaBBp7/0QdmaDHmGFaU9Vp1Boq7U
         bbXoOm1cfxAAoC1VpwxolSP5O90EM7hb+gUlIk207yq73fpeW1UrXRScIzcsrdMPvGoX
         q+rg==
X-Forwarded-Encrypted: i=1; AKwUvBwxc9XEuxYPRdhWEP2BqE4AMM76IVz6HRSpvil/mQr9AqZr2LOU8FluCjdaZelUakU8JgLBZzISsH63N8U=@vger.kernel.org
X-Gm-Message-State: AFuF++nrdxEJkLUaKjQvIDGUxt/SfZoSJCjmMmOtxXApBizjGRWJpW+B
	52uCRrokdyTdQZLnUWZ2Ho2+bKde0O/bFMK3qKEZyWLppwkxVE6UaEQR7Vdz8QUetelmyEEy4iW
	Aww==
X-Received: from pgbo38.prod.google.com ([2002:a63:5a26:0:b0:cc1:e48a:53dd])
 (user=wakel job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:4311:b0:3c3:bbe6:95de
 with SMTP id adf61e73a8af0-3da39eacfc8mr52193525637.6.1789012104294; Wed, 09
 Sep 2026 20:48:24 -0700 (PDT)
Date: Thu, 10 Sep 2026 03:48:21 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.1003.g10538fe699-goog
Message-ID: <20260910034821.2935214-1-wakel@google.com>
Subject: [PATCH] selftests: rtc: Support harness test filtering and arguments
From: Wake Liu <wakel@google.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Shuah Khan <shuah@kernel.org>
Cc: linux-rtc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Wake Liu <wakel@google.com>
Content-Type: text/plain; charset="UTF-8"

rtctest implements its own main() function with a rigid switch (argc)
check that only accepts an optional single argument for the RTC device
node path. This prevents kselftest_harness standard arguments from
working properly:

1. Passing filter options like -t <name> or -T <name> triggers a usage
   error because argc is greater than 2.
2. Passing -l or -h causes rtctest to treat "-l" or "-h" as the device
   node path and fail with access() errors before ever reaching the
   harness argument checker.

Parse command line arguments with getopt() to pass all kselftest harness
options (such as -t, -T, -v, -V, -f, -F, -r, -d, -h, and -l) through to
test_harness_run(), while preserving the ability to specify an optional
RTC device node path as a non-option argument. Also ensure optind is
reset before invoking test_harness_run() so the harness can inspect the
options, and bypass device accessibility checks when help or test
listing is requested.

Signed-off-by: Wake Liu <wakel@google.com>
---
 tools/testing/selftests/rtc/rtctest.c | 44 +++++++++++++++++++++------
 1 file changed, 35 insertions(+), 9 deletions(-)

diff --git a/tools/testing/selftests/rtc/rtctest.c b/tools/testing/selftests/rtc/rtctest.c
index 8047d9879039..57dda87ba813 100644
--- a/tools/testing/selftests/rtc/rtctest.c
+++ b/tools/testing/selftests/rtc/rtctest.c
@@ -486,18 +486,44 @@ TEST_F_TIMEOUT(rtc, alarm_wkalm_set_minute, 65) {
 int main(int argc, char **argv)
 {
 	int ret = -1;
+	int opt, i;
+	int non_opt = 0;
+
+	while ((opt = getopt(argc, argv, "dhlF:f:V:v:t:T:r:")) != -1) {
+		switch (opt) {
+		case 'h':
+			fprintf(stderr,
+				"Usage: %s [-h|-l|-d] [-t|-T|-v|-V|-f|-F|-r name] [rtcdev]\n\n",
+				argv[0]);
+			optind = 1;
+			return test_harness_run(argc, argv);
+		case 'l':
+			optind = 1;
+			return test_harness_run(argc, argv);
+		case '?':
+			fprintf(stderr,
+				"Usage: %s [-h|-l|-d] [-t|-T|-v|-V|-f|-F|-r name] [rtcdev]\n",
+				argv[0]);
+			return KSFT_FAIL;
+		default:
+			break;
+		}
+	}
 
-	switch (argc) {
-	case 2:
-		rtc_file = argv[1];
-		/* FALLTHROUGH */
-	case 1:
-		break;
-	default:
-		fprintf(stderr, "usage: %s [rtcdev]\n", argv[0]);
-		return 1;
+	for (i = optind; i < argc; i++) {
+		if (non_opt == 0) {
+			rtc_file = argv[i];
+			non_opt++;
+		} else {
+			fprintf(stderr,
+				"Usage: %s [-h|-l|-d] [-t|-T|-v|-V|-f|-F|-r name] [rtcdev]\n",
+				argv[0]);
+			return KSFT_FAIL;
+		}
 	}
 
+	optind = 1;
+
 	/* Run the test if rtc_file is accessible */
 	if (access(rtc_file, R_OK) == 0)
 		ret = test_harness_run(argc, argv);
-- 
2.55.0.979.g7e5102b832-goog

