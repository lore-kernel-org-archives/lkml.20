Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.157.188.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793724133;
	b=meuOemJTyIYJhZkmrokBpD0aKVCDafxo7eYljJF9BxEIzWCbuWIk34zf3VsThoePYFkQ
	 0BlLP2kPRFBSGt0u/MWG+iRbgIkHFnsFSsZxB0UTbxX9dd5ZyUNN2hl61Y1PBoy4ekOJ2
	 rkKr6QbKMQXWl6XMYAQ8f2E98LhVJ18kDn9rejePR6zH4wjFJ9O3P8K7jySBjkJC1scze
	 Fr8FuRdbX87hZTutK9usGVk2k/9LS5S2gB9o2bJN0gnkZ21dL748z3CmKhfU+/Cybv2p2
	 YJqXL/ej72AIOXc/M1laLD3aHjP4wpXfhm3VkxKacnnl/NLH3TvQSuqP5zIXHI84YVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793724133;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Infomaniak-Routing;
	bh=OM/+seVdQTeJtIrR4gWB149USL6Fk7GjIGvV0iKLldo=;
	b=GVB7rIic/ehxy6UROHkNcquYrT/ApNBHNQGeCQ2HhuvuvLV34FyV5YdE4ABwBMKBX/HW
	 IVZ4Z30yf3IpgBBKJL73qvBdRmgHA4xnuYTifrUdIsbkK1ZsabqLhffi0thEO7HQKQXIb
	 NZ4lg7zfrJWNvNUvHVDj+Fc81Wy06Of1c1RCCB067YIiec7mLCNqHcxPYeANckDkJhK6s
	 lBVDWDJxpdR3HEJ2eZ1oF+XAXDC4sSUMfFGcfhd9uvDpkPgchDOJTIMSkq146gNrr7a6v
	 lWLGS6kiwiifaOGd5vm12oaiEwKuTfBPkwsVD6WB7hnGQizCP358AwHK5+MtqBYn+Vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=daylightlinux.ch;
	spf=none smtp.mailfrom=daylightlinux.ch;
	arc=none smtp.remote-ip=45.157.188.12
Received: from smtp-bc0c.mail.infomaniak.ch (smtp-bc0c.mail.infomaniak.ch [45.157.188.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A01B60A5BDE
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 16:42:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A01B60A5BDE
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daylightlinux.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=daylightlinux.ch
Received: from smtp-4-0001.mail.infomaniak.ch (smtp-4-0001.mail.infomaniak.ch [10.7.10.108])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4jJvVh6T1Fzjdw;
	Tue,  3 Nov 2026 17:42:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=daylightlinux.ch;
	s=20261016; t=1793724124;
	bh=OM/+seVdQTeJtIrR4gWB149USL6Fk7GjIGvV0iKLldo=;
	h=From:To:Cc:Subject:Date:From;
	b=ExhEKtaoqEE6N9aqlNyUvx39oaBvulgIQVaRfcHlp8AyYWw6p20rhcQ90Wr0TvWNz
	 rgYJZ3l6r7KB0JDF11LL/gKjv6LbJKmKq/aiHEDt428NGAzyel9hQvBWUWibfqHrNv
	 jnvk3/U9ZV6f6vKO5G2Hc3karYX/3mrmWyuhYlBrft27r5YGLh1h9EX2ztlmJGIaEh
	 gqUARjU0FzUrsQDVc4NDEPXkKT7B7Fg7O0QUSaBG/rXe9ucISJw6HB7cw7q50vVnSt
	 aVna6VtnE6a7kInhDSTKI3B+/ILAtdmU5b2WE7oqh+jU0A363zbtQfgDHbwW/YAnmq
	 O+5BVkfgjZzUA==
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4jJvVh2WqtzyLf;
	Tue,  3 Nov 2026 17:42:04 +0100 (CET)
Received: from unknown by raspberrypi with local (Exim 4.96)
	(envelope-from <info@daylightlinux.ch>)
	id 1xOHaF-00FDcF-38;
	Tue, 03 Nov 2026 17:42:03 +0100
From: Hamdy Abou El Anein <info@daylightlinux.ch>
To: sashal@kernel.org
Cc: hamdy.aea@protonmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH] scripts: decode_stacktrace: preserve input while reading lines
Date: Tue,  3 Nov 2026 17:42:03 +0100
Message-ID: <20261103164203.129660-1-info@daylightlinux.ch>
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

Plain read strips leading and trailing whitespace and interprets
backslashes before the decoder sees a line. It also drops a final line
without a newline. This loses log text and defeats the alignment
preservation in handle_line().

Read with an empty IFS and -r, and process a nonempty final fragment.

Tested passthrough text with indentation, backslashes and trailing
spaces, plus a real debug-enabled object and stack entries terminated
by LF, CRLF or EOF. All three stack entries decode with their original
indentation.

AI assistance: ChatGPT/Codex identified the issue and prepared the
change, commit message and executable regression tests.

Fixes: dbd1abb20971 ("decode_stacktrace: make stack dump output useful again")
Signed-off-by: Hamdy Abou El Anein <hamdy.aea@protonmail.com>
---
 scripts/decode_stacktrace.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/decode_stacktrace.sh b/scripts/decode_stacktrace.sh
index 39d60d477bf..8b06810d463 100755
--- a/scripts/decode_stacktrace.sh
+++ b/scripts/decode_stacktrace.sh
@@ -346,7 +346,7 @@ handle_line() {
 	echo "${spaces[$last]}${symbol}${module:+ ${module}}${info_str:+ ${info_str}}"
 }
 
-while read line; do
+while IFS= read -r line || [[ -n $line ]]; do
 	# Strip unexpected carriage return at end of line
 	line=${line%$'\r'}
 
