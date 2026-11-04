Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=83.166.143.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793793842;
	b=nglgJ8ItPuMbfhrBggx0ngH3Mt5wavSwM6C7c4JkEB8O2dIrroI6+VdbPlU2izvyqh2E
	 XFl92BMIcYHHUc/3tbakBLa7geXHRQcWJZaJEtdejCiHgSKuvPXKP6eY/Gavs2Jabd8Yc
	 GejFxztWnFL+vNSr19PIVAvJJJQNHr03yUHWla13BTOybhIAGMF2HmIPJ7lybhrdN32Wo
	 LmYGqB9XKO4hJasT1wzskgrZo91HZU5TlX/dD9Yafl4z5FJvEm5/IFIxapSm+Qu5SaCS6
	 FcQt4V5abA2dgLkaDazSKLeExoGTGRq0jcZgXpyuI/6iShkVSDsiVqd0Lz4p8dClK5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793793842;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Infomaniak-Routing;
	bh=fmf8afflJW1L1HVT54sgKsVpizIVeO/TZCGyORgi5+A=;
	b=0hgGTHFr2Fp25VGDIDwu13Xj+hJSLxOR+bofROO9vcrMfPDUzQ6oiQyqOqdV67zU9qjC
	 GyFjRl6X+S4kvqInGV32IXVRjTHxh5Abzv9dMDwft1/nX943ekNNkK9Q+kJanJU5jtKNj
	 iujpOUsfOxtcxwGLFiZxG1bhMZZSRjZnUb7AUkDJbmP4KMnV8EzqMER2f0aQWqA/lpJjV
	 Nm4mGoiE3tTreYsvmihuM/uBkLvPZdGkO5IJTu3SRIm/AtjAYf8E3eqRioIUOQaENuQj6
	 vSsbyZ9SPyqmI87r0qIa5VKywiraQg5TIaPs8uCP5V2s2T/lPmZmjW70Gq2BdQQY0Hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=daylightlinux.ch;
	spf=none smtp.mailfrom=daylightlinux.ch;
	arc=none smtp.remote-ip=83.166.143.175
Received: from smtp-8faf.mail.infomaniak.ch (smtp-8faf.mail.infomaniak.ch [83.166.143.175])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8800606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 12:04:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8800606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daylightlinux.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=daylightlinux.ch
Received: from smtp-3-0001.mail.infomaniak.ch (smtp-3-0001.mail.infomaniak.ch [10.4.36.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4jKPHM2hrmzFVk;
	Wed,  4 Nov 2026 13:03:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=daylightlinux.ch;
	s=20261016; t=1793793839;
	bh=fmf8afflJW1L1HVT54sgKsVpizIVeO/TZCGyORgi5+A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OVSJ7NKfU1vCU2sv1SIi1DguzWwsIVad3RHq8qYHK2Nh0IOkm3xYDWgx+U29esCtX
	 aYTMT5KUXet13ZC+Olryvi9Olm5WPr5yo8QroEqziO5j6wmnSwYnwXCfPVMXVradi3
	 p710fPVzQS0tmfaDuK8UgyPS2J0UhHCzJc8CV5BTbd18kS6rALeU8nDSvvsmlQBGE0
	 LVJ5bDdLq80WWv5MQqIjiedhzTkjsyJx6hBfF+RueP/theKvT3iyEHk/6AdT48Ory3
	 WWmL+IlxMW/xvtDl9klnL9irrK9n4eIRssDwvrd1B1KYAfWXevscL08S50o/HDeUl3
	 q0uwjtXGUR0rQ==
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4jKPHL1HQYzk2j;
	Wed,  4 Nov 2026 13:03:58 +0100 (CET)
Received: from unknown by raspberrypi with local (Exim 4.96)
	(envelope-from <info@daylightlinux.ch>)
	id 1xOZif-00Gsem-2S;
	Wed, 04 Nov 2026 13:03:57 +0100
From: Hamdy Abou El Anein <info@daylightlinux.ch>
To: nathan@kernel.org
Cc: nsc@kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	hamdy.aea@protonmail.com
Subject: [PATCH v2] scripts: check-function-names: propagate nm failures
Date: Wed,  4 Nov 2026 13:03:57 +0100
Message-ID: <20261104120357.7007-1-info@daylightlinux.ch>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103105829.10511-1-info@daylightlinux.ch>
References: <20261103105829.10511-1-info@daylightlinux.ch>
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
shell variable during the serial kernel link.

Tested with a malformed object (failure), a valid object (success), an
object defining startup (failure), and a synthetic large nm stream
(success).

AI assistance: ChatGPT/Codex identified the issue and prepared the
change, commit message and executable regression tests.

Signed-off-by: Hamdy Abou El Anein <hamdy.aea@protonmail.com>
---
 scripts/check-function-names.sh | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/check-function-names.sh b/scripts/check-function-names.sh
index 94883e690627..f07a0e1cf339 100755
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
-- 
2.56.0

