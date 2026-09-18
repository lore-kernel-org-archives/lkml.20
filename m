Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF70230D401;
	Fri, 18 Sep 2026 10:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789726576; cv=none; b=elwcAjV/S7pD2ROUmkrkbtcgGW41u5HuVNO/pUMygdfdeyAse/k5HetkwxXyag6cEPmUYCu3wueeTwR+y5okr/6hlk6IXdpJUhP9SY82x9VXZ7Mz7lXOCp9AKL4GX+auJlAsb8uejUwiPs68L39Qov0qnrqHk6tSPifmSHTNSDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789726576; c=relaxed/simple;
	bh=gsavXhdqQ1q/S5wDX++fYaY/FvvSnYXgRZLgckAXmCM=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=ShPm0cQ3lDqh01Urexv+GJ6zPG9NKw+tJYmblVteBpBTO8ZajBS+teMlZrjxwdH2wTOchEENPLpQStvt6THSjdsMGjRYwwC+YCGZEpJDw1vKg8LsQ7uo46KzJxCe+/sR6A1feoTj5RwBzIRB9eGFszIwsqN643gwjo8B6pMDcP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=TTwJ7kaX; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=WPROFD7a; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="TTwJ7kaX";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="WPROFD7a"
Date: Fri, 18 Sep 2026 10:16:07 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789726569;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eHjnBqq4m9e4UdATKOVHWwCvneOE8CWlQcgKAi7kkTg=;
	b=TTwJ7kaXLe8Jf2pdVg6MV5pti23xRqMmL73jIXO0d6bhX7BBYb0w2V/WfyboRcVSs6U3KI
	KaFslGhvYGgd5W+NYwXM/p6l6pv7naenxZ49bUJ5BKbYR3V7ED/QQ0iIq1eGPl6PbD+rGR
	gALkSFDXXIr0x3MTJoQ6tiXIQzusu5B6DOVfixHptH4mxuVWNycDtcuDKQEHHGkIOc4Ggh
	7QVCWXq7wrUm7UZly99UqGZa6LBMdwvZC/i2ULQHWNJbeb/IDjHkey4ggrSOTfGlUQifGG
	ZJcWziTpQbL1L8/WI1rAa0J3QL6Z5MOu9ALTOQGTN59KOhjjREiaj9RgPvgU1A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789726569;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eHjnBqq4m9e4UdATKOVHWwCvneOE8CWlQcgKAi7kkTg=;
	b=WPROFD7aHG3zaSHP4QgRdHwEp0KRuzz6WhxQFthwShDpCD6aqrOdE3jIfIQk5xRcqHrrgD
	1zN9sHYKRCc6qMAw==
From: "tip-bot2 for Song Liu" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: objtool/core] objtool/klp: Run the klp tests under set -u
Cc: Song Liu <song@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260916184351.2720310-9-song@kernel.org>
References: <20260916184351.2720310-9-song@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178972656768.1720534.15249776615424372549.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the objtool/core branch of tip:

Commit-ID:     3c961933f3462eab9c7e34e5978de837cc86f59a
Gitweb:        https://git.kernel.org/tip/3c961933f3462eab9c7e34e5978de837cc8=
6f59a
Author:        Song Liu <song@kernel.org>
AuthorDate:    Wed, 16 Sep 2026 11:43:01 -07:00
Committer:     Josh Poimboeuf <jpoimboe@kernel.org>
CommitterDate: Wed, 16 Sep 2026 17:13:26 -07:00

objtool/klp: Run the klp tests under set -u

Most of these assertions end in a grep, and an empty pattern matches
anything.  So a mistyped variable name in a test does not fail: it expands
to nothing, the grep succeeds, and the test reports a pass having checked
nothing.  assert_section "$sectoin_nmae" becomes a search for two adjacent
spaces, which readelf's column padding satisfies on every line.

Refuse unset variables.  lib.sh guards the few genuinely optional
expansions it has with ${x:-}.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Song Liu <song@kernel.org>
Link: https://patch.msgid.link/20260916184351.2720310-9-song@kernel.org
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 tools/objtool/tests/lib.sh | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/objtool/tests/lib.sh b/tools/objtool/tests/lib.sh
index 82e6b0d..294b99c 100644
--- a/tools/objtool/tests/lib.sh
+++ b/tools/objtool/tests/lib.sh
@@ -8,6 +8,8 @@
 # codegen varies between compilers and golden files would report churn inste=
ad
 # of regressions.
=20
+set -u
+
 TESTS_DIR=3D"$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
=20
 # Tests live in generic/ or in an architecture directory beside it, and each
