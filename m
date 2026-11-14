Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=51.159.59.229
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794682862;
	b=CSbY4o3PKPJbsDmDbSmXeVYSmUYjaaNhNG0uzTf7QFG+tUXTFhe8IQ8nQk0Klmj3SZKG
	 LYDmSVHisCuwO5uQqPOPxaVY+JhoN4ePlPkKiXpN/4skVbAXzWLh4aYLWSb7+QjA7ou6t
	 66J3g1tGjEIm5Uio2rCJ/0t/g3zNds6A7yS5Hsr/UGB74Uz6ccHSswVhnI+e2IHl4oMMU
	 DQFGhr0zi2tF2CA4w5OqA9pfgs3shoAIsTPBZitsUYm1qS72OdAcQ+EyUY7SkhE1yOSol
	 UiFo156zmAC4bKW9TlPgSOw+y/yyuUJB99lDWPbAo3Ngp+bTPNmPAtccr1A9xY1I4dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794682862;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=c18JGNzOhB1PzPYNsnyLPyd49MDAaAHmqGrgcMmZwRo=;
	b=IuAYzyukkQAxmWbBylZrhw53HAEf6w2spe1EspQDb275GTERlmGFviU/9+UkyeZKsJC4
	 KZ9iqsKJxs6seF4TFDTH6tVdnS7zhndREeMyaEWQGFxSlyjnl2Ws0Ry2emTt5ONMAM8EU
	 Jk66WiA6lSTo60TQMqLgAWUznEFbolHZ+UcFaDWbG9a3PiWR5noif/AgMOQB565qfVmbt
	 ZBD7ZIzJ0/YB1+/1XAx3ITEz0h1wHMJ9T1dKQJkoy/T0XH2P0AlGAzrlDzulDpi3MJIGG
	 4OnbRYa9ktkVXHjNtQulena2S9hAyPq6+rO0NMMJU4yx7NmYwbSc/sZKYGNE4XzuRJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=1wt.eu;
	spf=pass smtp.mailfrom=1wt.eu;
	dkim=pass header.d=1wt.eu header.i=@1wt.eu header.a=rsa-sha256 header.s=mail header.b=TbGprxzs;
	arc=none smtp.remote-ip=51.159.59.229
Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5126C60A2622;
	Sat, 14 Nov 2026 19:01:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5126C60A2622
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.a=rsa-sha256 header.s=mail header.b=TbGprxzs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1794682837; bh=c18JGNzOhB1PzPYNsnyLPyd49MDAaAHmqGrgcMmZwRo=;
	h=From:Message-ID:From;
	b=TbGprxzsPYXn7CnhSpEPI0c81hFTzxFaaV3rvLYVFBatuqR+f8jX5S41xaSgBgRUW
	 zh/U+OfLPB3siJbeFvpZ4E4R3yMBBjEEVii1mznOdQr+CKzL+g1yQ7/z2iqr5tAWPD
	 8swxfWecSbkojYDig5S3hToFvPHHoCIFPWpbhXO8=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id B1CC1C0966;
	Sat, 14 Nov 2026 20:00:37 +0100 (CET)
From: Willy Tarreau <w@1wt.eu>
To: Jonathan Corbet <corbet@lwn.net>
Cc: skhan@linuxfoundation.org, Randy Dunlap <rdunlap@infradead.org>,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        gregkh@linuxfoundation.org, Johan Hovold <johan@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>
Subject: [PATCH v2 10/14] docs: security-bugs: add a section for maintainers receiving reports
Date: Sat, 14 Nov 2026 20:00:10 +0100
Message-ID: <20261114190014.17826-11-w@1wt.eu>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261114190014.17826-1-w@1wt.eu>
References: <20261114190014.17826-1-w@1wt.eu>
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

Now that reports are expected to be more commonly sent directly to
maintainers, some of them will receive security reports for the first
time and may not know what to do with them, or worry about having to
deal with them alone.

Let's add a short section reminding them that they are not alone, and
that they are welcome to ask the security team for help at any time.

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Johan Hovold <johan@kernel.org>
Signed-off-by: Willy Tarreau <w@1wt.eu>
---
 Documentation/process/security-bugs.rst | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/Documentation/process/security-bugs.rst b/Documentation/process/security-bugs.rst
index 992c8d8d9b1c1..791a78964a9d3 100644
--- a/Documentation/process/security-bugs.rst
+++ b/Documentation/process/security-bugs.rst
@@ -5,7 +5,8 @@ Security bugs
 
 Linux kernel developers take security very seriously.  As such, we'd
 like to know when a security bug is found so that it can be fixed and
-disclosed as quickly as possible.
+disclosed as quickly as possible. If you are a maintainer and received
+a report, there is a section dedicated to you below.
 
 What qualifies as a security bug
 --------------------------------
@@ -403,6 +404,24 @@ do not ask for proper receipt before this delay. This will not make your report
 be processed faster, will add extra load on maintainers and all you risk is
 your future messages being ignored.
 
+For maintainers receiving a report
+----------------------------------
+
+If you maintain some code in the kernel and received a security report, don't
+panic, you're not alone! The wording of AI-generated reports these days tends
+to sound scary, but just stick to technical facts and proceed like you would
+with any other bug report. Feel free to share the report with other maintainers
+who you think can help you, telling them upfront that the report is private.
+Many other reports are being handled by other maintainers at any instant, do
+not start to worry that the security of the whole kernel suddenly depends on
+your ability to provide a quick fix. Do not let reporters dictate conditions
+that are not compatible with what this document describes. If you have any
+question or doubt, be it about the validity of the report, its impact, the
+process to follow, difficult interactions with a reporter, or even if you've
+mistakenly leaked part of the report to a public list (yes, this happens), just
+ask the security team for help, for example by replying to the report with the
+security team in Cc:, or by forwarding it to them if you're seeking advice.
+
 Disclosure and embargoed information
 ------------------------------------
 
-- 
2.52.0

