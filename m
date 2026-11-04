Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=83.166.143.168
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793794062;
	b=B5M2e9WXWyTHdwL8sgva19vhmc6nSQ3NxRLA5/8zja0fih+zbq/h+gyUsz5fN5NdtxKo
	 Y8e/aZfiVCML+6yj2K2fyNibpzlY5mbEq70Wjp8dq+saHbRmKs1MUoByMUhv2CDKzV0vo
	 gfEPZW14ey79SER3VRGSh5Ee6P07+0rt+9fNfViSqAhrYeSh9Xy2NJtBbcXSuCLe61z2o
	 tsmHfBm4BP9+0n3l5EvwDaCAl/BRVKjil+Q8HoMH4tiZrocsweW1MuX6zjk5JMp+WqjMB
	 HWWKfBepWvCkGfojHDaYFS7wdbXu9IvSsxJtyJmBwZ2739abeJA2nDAgU1jfKPHmNqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793794062;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Infomaniak-Routing;
	bh=2XuYXPihSJV5rInteSJnmLXHY6vbrjdvlanCtAK/q74=;
	b=Np0KMK2SwOy0qBKaoryNqUzYD5s40DRaMpWsElwxAWHHH37rEqcgrhLHRj6eC2QAn3/1
	 AR8Bgs/FPM0bSPS8plVtAZ2qVU0U2O/ho/Av+Kxew2xhx8OtsA/EWEaolQCEmlH9EvJkf
	 gfKLtgvyczYXQ+aLuaqdr0/0nrLOK3VaOd5MBqcJpSLe24I0OGAxvJBIbH+Z6yB8zVwx6
	 HaKbjv/AG+ZEja+6IWDaSp2byyU7cftdq08ZJzgTMhJZm6j+h1aKucww5asBTCsjO34C1
	 HrnSv2K071NL/NSd4hPX8Eu3U9IsOu7YSOWxG5ZPa6LQIRG5L34C3c8ucmWY6oQ5CWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=daylightlinux.ch;
	spf=none smtp.mailfrom=daylightlinux.ch;
	arc=none smtp.remote-ip=83.166.143.168
Received: from smtp-8fa8.mail.infomaniak.ch (smtp-8fa8.mail.infomaniak.ch [83.166.143.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B1E0606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 12:07:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B1E0606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daylightlinux.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=daylightlinux.ch
Received: from smtp-4-0001.mail.infomaniak.ch (unknown [IPv6:2001:1600:7:10::a6c])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4jKPMV4ZHFzmZr;
	Wed,  4 Nov 2026 13:07:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=daylightlinux.ch;
	s=20261016; t=1793794054;
	bh=2XuYXPihSJV5rInteSJnmLXHY6vbrjdvlanCtAK/q74=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kOuLkqa0hsBlLwehXMM6WhiaIHvfRQIiJ68LnpudJSEsxydwWKYrHXdn7Kzkglc2A
	 q7khi1FxsppcWNxASytHh4OH7Tz2KIFgYyKVYDouCsDo22vmVcPuq+DKeeM73fuyqC
	 ryQDeDBqs5B0hLI4M9A0Y4/aNh9uVjbdMPN4mNc8TZg5SiyrcXwocqp0yjR3yBS6HS
	 MIiDUm5wZX4hwrACE1/+mag2wmH+cYFvW/U0JlJtrNGSwuWEXrTChwmge9OXuLasGx
	 9L6V1DN/6oMgfbUB3SotoaX4F/PYvJ2amCvoyKMKhRivnucbdxpGSGQImQTBYcdFWp
	 kx2fI333AqMmA==
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4jKPMV0GZ5zsrr;
	Wed,  4 Nov 2026 13:07:34 +0100 (CET)
Received: from unknown by raspberrypi with local (Exim 4.96)
	(envelope-from <info@daylightlinux.ch>)
	id 1xOZm9-00GsqB-23;
	Wed, 04 Nov 2026 13:07:33 +0100
From: Hamdy Abou El Anein <info@daylightlinux.ch>
To: nathan@kernel.org
Cc: nsc@kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	hamdy.aea@protonmail.com
Subject: [PATCH v3] scripts: check-function-names: propagate nm failures
Date: Wed,  4 Nov 2026 13:07:33 +0100
Message-ID: <20261104120733.7633-1-info@daylightlinux.ch>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104120357.7007-1-info@daylightlinux.ch>
References: <20261104120357.7007-1-info@daylightlinux.ch>
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

The symbol-name check pipes nm through awk and grep. If nm cannot read
an object file, its failure status is lost and the script reports
success without checking any symbols.

Keep nm output streaming while carrying its exit status through the
filter. This avoids buffering the full vmlinux.o symbol table in a
shell variable during the serial kernel link, as the v2 did.

Tested with a malformed object (failure), a valid object (success), an
object defining startup (failure), and a synthetic large nm stream
(success).

AI assistance: ChatGPT/Codex identified the issue and prepared the
change, commit message and executable regression tests.

Signed-off-by: Hamdy Abou El Anein <hamdy.aea@protonmail.com>
---
 scripts/check-function-names.sh | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/scripts/check-function-names.sh b/scripts/check-function-names.sh
index 94883e690627..b25e630cc594 100755
--- a/scripts/check-function-names.sh
+++ b/scripts/check-function-names.sh
@@ -13,9 +13,28 @@ if [ ! -f "$objfile" ]; then
 	exit 1
 fi
 
-bad_symbols=$(${NM:-nm} -p "$objfile" | awk '$2 ~ /^[TtWw]$/ {print $3}' |
-	      grep -E '^(startup|exit|split|unlikely|hot|unknown)(\.|$)')
-
+# Keep nm output streaming while preserving its exit status.
+bad_symbols=$(
+	{
+		${NM:-nm} -p "$objfile"
+		nm_status=$?
+		printf '\n#nm_status %s\n' "$nm_status"
+	} |
+	awk '
+		$1 == "#nm_status" {
+			if ($2 != 0)
+				nm_failed = 1
+			next
+		}
+		$2 ~ /^[TtWw]$/ && $3 ~ /^(startup|exit|split|unlikely|hot|unknown)(\.|$)/ {
+			print $3
+		}
+		END {
+			if (nm_failed)
+				exit 1
+		}
+	'
+) || exit 1
 if [ -n "$bad_symbols" ]; then
 	echo "$bad_symbols" | while read -r sym; do
 		echo "$objfile: error: $sym() function name creates ambiguity with -ffunction-sections" >&2
-- 
2.56.0

