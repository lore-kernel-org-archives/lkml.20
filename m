Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33DF49A3DD;
	Mon, 21 Sep 2026 09:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789982927; cv=none; b=upACEnIQ1dUJB9BMo+v/zznpicInPL23jWNzVyBoNboSNl0Hz3ONJh9Ffp9ygewtZzds20lTBab5v4b5ubu0KQ6Uk/ORQJ5F7kRXBq691kQrtBi1hhBwuK+Nk5M0K4GMKVEP5Lo2Odj8s/nVROZRteS7sHURGYdY3fO5PCLZbDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789982927; c=relaxed/simple;
	bh=3rzFC4bkT/9WTovpRCkemDfAFb0J8SHyA64CqOkHHdw=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=oKkpesiS6tT6J+HOnvq5YFPTD9nrIznq5nyTdKiDWlScX5IbnUeDBH4R4r5+4D/eq7CRl1EWUx/FnCQKqKbTOcQg1yeC7p7j4CtqqifCikNS/xScrF54GbYgyrAr1nXHklXykYAXmQOtnG+/SXovnMrzQOcWa67a0aWvWBZO2sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=yLNmjuKm; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=bgvq+i1u; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="yLNmjuKm";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="bgvq+i1u"
Date: Mon, 21 Sep 2026 09:28:42 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789982924;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DHoCWVd1fzUVOeHEULAi6jo2qWoKKV+2hQctrws+OSk=;
	b=yLNmjuKm8AzDuvcqG5dIfhzv/QcaqMpFP5eVn+BclomBGSbDcGPwd1DhrLfNE2DFDGy4D2
	Y8Omew+um07Dq1OGWy6wsvd4DNcKrp4yxYUVyvQ9VTkmQ3xh/Qn/mEc6J6rbpiqb8bJd2G
	ZpivYYZrJ+jjLxP7Ac18VA8FmkzyZuFgBt8bqgb05sZKIdmxljGGe0e+1FnMQ5MDSEtnmU
	v9krd3yax2uKkPdHr6Uh9E9l63cTF4nvVwceF45nKFnAtQA7Yrbz8bHSZw5knh+q/G25Xp
	fz7Nayf4Fz4KeSAYGD20srBwwgJ1fMMkX9ivtC/3/Win37y9mKD3UhCyCqHWCQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789982924;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DHoCWVd1fzUVOeHEULAi6jo2qWoKKV+2hQctrws+OSk=;
	b=bgvq+i1uaBBylPgNkRRBitWBrVp5uZW3KopiHkKkkN7ysZaEjUHKDN3IC8eHV3aaCAZjtR
	YqKJeU/8XOLygICg==
From: "tip-bot2 for Song Liu" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: objtool/core] objtool/klp: Run the klp tests under set -u
Cc: Song Liu <song@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260916184351.2720310-9-song@kernel.org>
References: <20260916184351.2720310-9-song@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178998292254.2819794.7618046728162096116.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the objtool/core branch of tip:

Commit-ID:     48dafeead17e96ee5a63816580a0b92732ea32f6
Gitweb:        https://git.kernel.org/tip/48dafeead17e96ee5a63816580a0b92732e=
a32f6
Author:        Song Liu <song@kernel.org>
AuthorDate:    Wed, 16 Sep 2026 11:43:01 -07:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Mon, 21 Sep 2026 11:01:22 +02:00

objtool/klp: Run the klp tests under set -u

Most of these assertions end in a grep, and an empty pattern matches
anything.  So a mistyped variable name in a test does not fail: it expands
to nothing, the grep succeeds, and the test reports a pass having checked
nothing.  assert_section "$sectoin_nmae" becomes a search for two adjacent
spaces, which readelf's column padding satisfies on every line.

Refuse unset variables.  lib.sh guards the few genuinely optional
expansions it has with ${x:-}.

Signed-off-by: Song Liu <song@kernel.org>
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Assisted-by: Claude:claude-opus-5
Link: https://patch.msgid.link/20260916184351.2720310-9-song@kernel.org
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
