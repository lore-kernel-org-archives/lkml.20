Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=84.16.66.168
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793703519;
	b=PleVL3rpRyEkCLmDsRyRhOp6AqXbI5l0TWKxQ/VbdeNda38oy8VlfBWwhCN9qlBSr6za
	 cIjFKu5kVPuUQiyTxNB8jHkRh/0B0/ZY3gEJpbY+F78Q9CYV7sfHtdZ0CfABSGMx0RepU
	 WkW4MFZzsYxmAgBA15QR0mtmtdhVNYaQaNQUsVGdeBGO4Wd8Dkzl2za/amLPpR66/IfQG
	 W5/eRfcuEmQJzVAsxORwrQhPmmW6c7pMSlT2N4n7/7AjJFp9SHRH1AoC6Mh5Ez7cGlrzA
	 97O+q2BtBB9jjPhV25IRTd5J4EPXiOpACii6EV8wVOtznNJr7L4kKskVHS0FsWWm1Rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793703519;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Infomaniak-Routing;
	bh=ma2S+15aObxfKj9bOXcaN0Y4hp4kbhpHNV/D+sINngk=;
	b=U6oQjCWiZ/KyllMcT0IZPj1eKj+Z8uCJdzuwoxj+9bvRK8G3juN2+KO7wU01cLQ5+X05
	 6puhd3kRWuIOaxeHp675v92FDbJ6sbf+sd1UD7fNQNSykhbzm2ejoJjW/KPCXd41t+bdv
	 TXKH0y/IzKSOGR1SrcZS0v1gI+cZlCaS0pE2BdwBFYd9Zzw+/L98CiqM/zlqJBx6O6FL7
	 NsFqWxUIxlmrPfGd14u//aYQMgp/yb3eOWeVgcYgK9g/tbMuRBp61G8QYJZMVsTapN7Vo
	 faW256n6RPIKdlw31N9rhsXu2dw2F7bzR6VweGn1tFRVk8N4wgsNm87yKxhqnXs1jIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=daylightlinux.ch;
	spf=none smtp.mailfrom=daylightlinux.ch;
	arc=none smtp.remote-ip=84.16.66.168
Received: from smtp-42a8.mail.infomaniak.ch (smtp-42a8.mail.infomaniak.ch [84.16.66.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82247606C5B7
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 10:58:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82247606C5B7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daylightlinux.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=daylightlinux.ch
Received: from smtp-3-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:4:17::246b])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4jJltG5gdnz4k5;
	Tue,  3 Nov 2026 11:58:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=daylightlinux.ch;
	s=20261016; t=1793703510;
	bh=ma2S+15aObxfKj9bOXcaN0Y4hp4kbhpHNV/D+sINngk=;
	h=From:To:Cc:Subject:Date:From;
	b=SPEGuvtlsbS8LIna8WBPpipobMeb9e05lWJHGBMfGkznBveiZbvtC3mp+2PkRSOFf
	 8HcDwGbWGAqoIyqnZOvvLfOzi/lb04u12V7wZ7u+8M23BEEdlg9lAVHwCK9kXZGsGW
	 JpbqnOzloVAyYfhP3y7+cHHifasYaq1I/9iDBcUJ8HwCHwa5L/mcAX3h5eqMKhLefB
	 SJTUylaa47LjcgAs7Uv6chBlrmX0ggd5DtRBHnJSKPjwh72ZhwjQrPK2ZOtxGx+O65
	 SB0Ovd+lukS3fleEcEjoLQAQzERMtyQDJpGwdLzUet8el9pWU1Oq3niTVE6J4cHiYF
	 XTdw+cbV/0vlw==
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4jJltG01TqzKmL;
	Tue,  3 Nov 2026 11:58:29 +0100 (CET)
Received: from unknown by raspberrypi with local (Exim 4.96)
	(envelope-from <info@daylightlinux.ch>)
	id 1xOCDl-00EwGZ-1d;
	Tue, 03 Nov 2026 11:58:29 +0100
From: Hamdy Abou El Anein <info@daylightlinux.ch>
To: nathan@kernel.org
Cc: nsc@kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	hamdy.aea@protonmail.com
Subject: [PATCH] scripts: check-function-names: propagate nm failures
Date: Tue,  3 Nov 2026 11:58:29 +0100
Message-ID: <20261103105829.10511-1-info@daylightlinux.ch>
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

The symbol-name check pipes nm through awk and grep. If nm cannot read
an object file, its failure status is lost and the script reports
success without checking any symbols.

Capture nm output before filtering it and fail when nm fails. This
keeps the existing forbidden-name detection unchanged.

Tested with a malformed object (failure), a valid object (success),
and an object defining startup (failure).

Signed-off-by: Hamdy Abou El Anein <hamdy.aea@protonmail.com>
---
 scripts/check-function-names.sh | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/check-function-names.sh b/scripts/check-function-names.sh
index 94883e6..f07a0e1 100755
--- a/scripts/check-function-names.sh
+++ b/scripts/check-function-names.sh
@@ -13,7 +13,8 @@ if [ ! -f "$objfile" ]; then
 	exit 1
 fi
 
-bad_symbols=$(${NM:-nm} -p "$objfile" | awk '$2 ~ /^[TtWw]$/ {print $3}' |
+symbols=$(${NM:-nm} -p "$objfile") || exit 1
+bad_symbols=$(printf '%s\n' "$symbols" | awk '$2 ~ /^[TtWw]$/ {print $3}' |
 	      grep -E '^(startup|exit|split|unlikely|hot|unknown)(\.|$)')
 
 if [ -n "$bad_symbols" ]; then

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.0

