Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80903476049;
	Mon, 21 Sep 2026 09:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789982900; cv=none; b=eU1tH2XNiX90lpAjFKT+1GBJnycloZ53PJeurHj9gR+uZPkv9YOAVMQFmnnEQQ5owUcj6daUn00vQC0avn+1nh9uK/oTKL9HfZseROrG8N+6Boj/p0HjHeZfqLzuyWtLlBDnwzmK6iyFhY4t4v6ImgAEHyMzRunDjpZWrpFWKhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789982900; c=relaxed/simple;
	bh=ue5181vVYngBz0AUV5JhA2yquOsFkapJPwKnGJxbxUw=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=uJkJkRJoxnII3dQkah0YQFCUyVgPrwrH/LllIEKUCeESDeDRBrBDY6y/GOmEziykHNkLP+2lasVVecw9VlrdwzmZH2mFqRnbX/SM7RAzq07JvakfXDcwYEYCQB4jHQewCtKlc1mqk7TfwG/6L59CgntbF0VvBxmEpbuc1aKqG0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=3CFzOJ4k; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=yeUH6DTr; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="3CFzOJ4k";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="yeUH6DTr"
Date: Mon, 21 Sep 2026 09:28:15 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789982896;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rtsNIonVFr2Yr08lq0k+lNvPYAkXCWIqGxi+05Kk6uU=;
	b=3CFzOJ4kfDwNxDwkAGmJLdwoTT8YB6Iaf1hNCRqmjwZB4eGKq+K09l1rVFO5zFebhgjYuu
	OIcaHa82F3V2Tz57XA/3ROJMeDYy+omUxeiNraDbj2WPXT7jWqhUfZQ9UGThCDooUfucny
	WGbKmhqqB6u4FhwYPpD+AB3rTQ5qR3Eh3r7KK00NBWIFQtmg7VydFzyTQsMDUf8GYMmXZV
	qMh9VfNAXuLFxBRECibzey41mozpeSZrppKSjpCcwip3RrdzWpThRHWI68USMgqyVLGEuK
	1zUC4KJjoYqKydUiBPs7yPCMfOHdP3WP1mKCRmGrdvqJLBy7KOmFtlnVyOfUgw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789982896;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rtsNIonVFr2Yr08lq0k+lNvPYAkXCWIqGxi+05Kk6uU=;
	b=yeUH6DTr6jblzokUo+UitwIFQZbaZzBmXUdS1aJvP9EkrvN3m8I1GFCL5SiEf8uHoxRO7W
	L86xuxF7zPGlNbAw==
From: "tip-bot2 for Puranjay Mohan" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: objtool/core] objtool/klp: Add test for unchecksummed input
Cc: Puranjay Mohan <puranjay@kernel.org>, Song Liu <song@kernel.org>,
 Josh Poimboeuf <jpoimboe@kernel.org>, Ingo Molnar <mingo@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260916184351.2720310-27-song@kernel.org>
References: <20260916184351.2720310-27-song@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178998289528.2819794.3624277690566745601.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the objtool/core branch of tip:

Commit-ID:     1ecf11530c16252dca835c9bc9133f73f5225ee4
Gitweb:        https://git.kernel.org/tip/1ecf11530c16252dca835c9bc9133f73f52=
25ee4
Author:        Puranjay Mohan <puranjay@kernel.org>
AuthorDate:    Wed, 16 Sep 2026 11:43:19 -07:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Mon, 21 Sep 2026 11:05:41 +02:00

objtool/klp: Add test for unchecksummed input

klp diff decides what changed by comparing the per-function checksums klp
checksum records in .discard.sym_checksum.  Handed an object which was
never checksummed it has to say so; silently concluding that nothing
changed would be the worst available answer.

Signed-off-by: Puranjay Mohan <puranjay@kernel.org>
Signed-off-by: Song Liu <song@kernel.org>
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Assisted-by: Claude:claude-opus-5
Link: https://patch.msgid.link/20260916184351.2720310-27-song@kernel.org
---
 tools/objtool/tests/generic/test-missing-checksum.sh | 18 +++++++++++-
 1 file changed, 18 insertions(+)
 create mode 100755 tools/objtool/tests/generic/test-missing-checksum.sh

diff --git a/tools/objtool/tests/generic/test-missing-checksum.sh b/tools/obj=
tool/tests/generic/test-missing-checksum.sh
new file mode 100755
index 0000000..89a05b1
--- /dev/null
+++ b/tools/objtool/tests/generic/test-missing-checksum.sh
@@ -0,0 +1,18 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# Without .discard.sym_checksum there is nothing to compare; concluding that
+# nothing changed would be worse than failing.
+
+. "$(dirname "$0")/../lib.sh"
+
+setup
+build_pair basic.c
+
+( cd "$workdir" && "$OBJTOOL" klp diff orig.o patched.o out.o ) \
+	> "$workdir/diff.log" 2>&1 && fail "klp diff accepted an unchecksummed obje=
ct"
+
+grep -q 'sym_checksum' "$workdir/diff.log" ||
+	fail "expected a complaint about the checksum section, got: $(tail -1 "$wor=
kdir/diff.log")"
+
+pass "unchecksummed input rejected"
