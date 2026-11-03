Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=84.16.66.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793724130;
	b=FyhRX21HDkqmWuRQquR3xmM6UtMcAZQ9wIi5ctNUBIfG3Sdes1EIzk5KrF8ZrT0T6IO7
	 JkCfBI0Xprrr68W3bTeWH20gXJc/KIUtdgJVZXc4EVOqg94TN2zAKW0mTv9eRqImFRO3c
	 8rp4TZbYLmzrPiGDIK1IgaRMk3Yn54ttIVFvXGWeWrmsPTu7UOQ6OwzW8ddZQ5xTx47yq
	 Q5hJWeAfJukbEALtY87edg8PcPT6c72sH9bAeASnaDVRKrJzjDimvdo4eZZujngTjhI0y
	 U4oI5MVVKNyt3AZZzm1Vc0tPJAqAUovgnneBQiC53yvm5EkNeFTBwjUosRlksaHDm0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793724130;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Infomaniak-Routing;
	bh=6PMjq7ex/yWI/NXHSYuD993yLEotdzOfMLRKmeshfQw=;
	b=GgdXKj5/qv5y2WqDMKocNZDqKU+0uGpeHzDXW+KREkrjQ0NdkkFmPpxeXR7+u9fjbq1d
	 1odj4d2Qu5wPQ3PP19w0B21dDebkHmU4cayCbTlp+yDX/ChWOI5XwQ20lF9iwej9/42Ut
	 ngwh0Q3nT6BiGfGeIq4oniirsE5jsL+MdWmAWiznJMu5uSUSb3rnAzPLnvRMqzMQnaxu2
	 61vQGwxIYMYH3Re/k4PbQahIdd0E2ZS81DsF8HswBXEKmZ0YOaEqBQp95cAIv+6nQXoeR
	 TjYp9Z08a5a0/Pyjv/Q3ZQAeD69PAUm+juHtEYsUHY7itSlMCfetzUIZiOD8o6kPfVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=daylightlinux.ch;
	spf=none smtp.mailfrom=daylightlinux.ch;
	arc=none smtp.remote-ip=84.16.66.173
Received: from smtp-42ad.mail.infomaniak.ch (smtp-42ad.mail.infomaniak.ch [84.16.66.173])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F66760A3826
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 16:42:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F66760A3826
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daylightlinux.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=daylightlinux.ch
Received: from smtp-3-0001.mail.infomaniak.ch (smtp-3-0001.mail.infomaniak.ch [10.4.36.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4jJvVl49JgzFWJ;
	Tue,  3 Nov 2026 17:42:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=daylightlinux.ch;
	s=20261016; t=1793724127;
	bh=6PMjq7ex/yWI/NXHSYuD993yLEotdzOfMLRKmeshfQw=;
	h=From:To:Cc:Subject:Date:From;
	b=T9+o+s5GupakP1vchsjALwOqSxZRCPPRF/Xm757letEtm9FOe5P5UUEribu/1lGPF
	 A4KXS/tGAsW3191xWmhzmMBZG0U5T4Z2K6v2aBA9VhViKxe794B7C6lp1Xy02LhKVN
	 /9pckTtsoqIw1RcJJaT0TceDJkDIhJdo/VEXJEEovYW+sS8unH8swNWzGbMeSvgfrD
	 fbqPXrp/ZBfqVuq5fMAvCZtTkQXHprKVD26FNxg8GuHW0cqNiu8gQwNN/viRX1CToR
	 PrNVlZAb2p4/YfoGqy/OIPLY2XCgn+sHbyXTtsopXT1A7Eql0UIisfon4B+tRGO8Yn
	 tEQfyb2e2P0IA==
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4jJvVk6yF0zqxS;
	Tue,  3 Nov 2026 17:42:06 +0100 (CET)
Received: from unknown by raspberrypi with local (Exim 4.96)
	(envelope-from <info@daylightlinux.ch>)
	id 1xOHaI-00FDe5-1k;
	Tue, 03 Nov 2026 17:42:06 +0100
From: Hamdy Abou El Anein <info@daylightlinux.ch>
To: sjg@chromium.org
Cc: hamdy.aea@protonmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] scripts: make_fit: propagate compressor failures
Date: Tue,  3 Nov 2026 17:42:06 +0100
Message-ID: <20261103164206.129723-1-info@daylightlinux.ch>
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
X-Infomaniak-Routing: alpha

From: Hamdy Abou El Anein <hamdy.aea@protonmail.com>

compress_data() ignores the compressor exit status and marks the
operation successful even if the tool wrote only partial output.
build_fit() can then place that truncated data into a FIT image.

Use check_call() so compressor failures abort image generation.
FileNotFoundError still allows trying the next supported executable.

Tested a compressor that writes partial output and exits with status
23: compression raises CalledProcessError and the CLI creates no FIT.
Also generated uncompressed and gzip FIT images with a real DTB and
ramdisk, and verified their payloads through libfdt and gzip.

AI assistance: ChatGPT/Codex identified the issue and prepared the
change, commit message and executable regression tests.

Fixes: 7a23b027ec17 ("arm64: boot: Support Flat Image Tree")
Signed-off-by: Hamdy Abou El Anein <hamdy.aea@protonmail.com>
---
 scripts/make_fit.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/make_fit.py b/scripts/make_fit.py
index 9bd35aa7211..1a63364388c 100755
--- a/scripts/make_fit.py
+++ b/scripts/make_fit.py
@@ -214,7 +214,7 @@ def compress_data(inf, compress):
                     if tool in ('zstd', 'xz'):
                         cmd.extend(['-T0'])  # Use all available cores
                     cmd.append('-c')
-                    subprocess.call(cmd, stdin=inf, stdout=outf)
+                    subprocess.check_call(cmd, stdin=inf, stdout=outf)
                     done = True
                     break
                 except FileNotFoundError:
