Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB56A48D885;
	Mon, 21 Sep 2026 09:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789982887; cv=none; b=RJ6mFYTDWCMx4EA+eBPzKkA2lq4pFDumeJQ3J6Bt+89aiUGNiGOMxZonlyF5KGRXbtxozoyZI94JGCwAXrCsZCAbDAEjkRdsOiPa6wFgSEc1aQcdY5bZloY5bSc8Ug7tXfKB/248MhV7PdFy2eHSVRFNh+k3iepz73eAaH9MPQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789982887; c=relaxed/simple;
	bh=DynKbCdvClcgLe2y3uXDPxdNTMJpKQkjSqQ0IymI6Fs=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=Y8GZbdMLayIj+M84jvCCkw0MchBXVqfUV07FyiUj/1TnBACLZEBwcfOs1MCQR1zVv8XfD1UqAynqYaRQLA8GOcDy9fs7o+ChIxSQE+0I6yMUZ/xFhSoAmisV9ZvdrGaLKQ9eTGgTCb7SEwCxM/Ph4XGisNtH0wLZC++HpKu3nFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=cj3HUa8p; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=q5KPUfvG; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="cj3HUa8p";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="q5KPUfvG"
Date: Mon, 21 Sep 2026 09:28:02 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789982883;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zCVcK0HhVvVoDUQb8PqR5Sz7xJpZxGra2kJP8Q/YPvQ=;
	b=cj3HUa8pq7adV5a4CMUFr/7JLegdHQZW+i2UTyX5+EXYiSc/uavfijAENWWm4EVNZ8cRhn
	8Wiz9sLeysxSmwNTyu8HuPu7+suvwBRhit2UihCFIGUvCNWH93y9Ee821ymHfOcv4COFVL
	vz+jWQfvoPeNfmU1eZJKDLZntWtmPOF4NrH19ZsiSDw/uLuyaSK+ZnlKuXq1f7AIIEWNaj
	KBo2jSzZlp6B3IlNYqQyDtaE7vd2t6fZDCi70pwAOT+Zt0SrpUaaZNWXlOmwnnGXrEd4U+
	D1NmXUzmZXYBR0mV6z++em952FvYq5zeydwa1t6IFlNi85HebZqthFSrb4XtMA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789982883;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zCVcK0HhVvVoDUQb8PqR5Sz7xJpZxGra2kJP8Q/YPvQ=;
	b=q5KPUfvGpD07ST1Z9VSW6wk9zSZzREXqf7CQyW8WfoBp5V7mVXl38nkHRBAc6lWsJA/XDw
	itG/GjQXdlT0thDg==
From: "tip-bot2 for Song Liu" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: objtool/core] objtool/klp: Add test for recorded checksum values
Cc: Song Liu <song@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260916184351.2720310-36-song@kernel.org>
References: <20260916184351.2720310-36-song@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178998288206.2819794.7109623004058263194.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the objtool/core branch of tip:

Commit-ID:     a5f001a475d157184c038f8dcab1e7690f501eab
Gitweb:        https://git.kernel.org/tip/a5f001a475d157184c038f8dcab1e7690f5=
01eab
Author:        Song Liu <song@kernel.org>
AuthorDate:    Wed, 16 Sep 2026 11:43:28 -07:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Mon, 21 Sep 2026 11:12:06 +02:00

objtool/klp: Add test for recorded checksum values

Whether klp diff treats a function as changed is decided by its checksum,
and until now nothing looked at one.  A test asserting only that the right
functions were cloned cannot tell a correct checksum from one that happens
to differ.

Asserts both directions -- the changed function's checksum moves, the
untouched one's does not -- and that checksumming identical input twice
gives the same answer, since otherwise every rebuild reports spurious
changes.

Assisted-by: Claude:claude-opus-4
Based-on-test-by: Joe Lawrence <joe.lawrence@redhat.com>
Assisted-by: Claude:claude-opus-5
Signed-off-by: Song Liu <song@kernel.org>
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Link: https://patch.msgid.link/20260916184351.2720310-36-song@kernel.org
---
 tools/objtool/tests/generic/test-checksum-value.sh | 37 +++++++++++++-
 1 file changed, 37 insertions(+)
 create mode 100755 tools/objtool/tests/generic/test-checksum-value.sh

diff --git a/tools/objtool/tests/generic/test-checksum-value.sh b/tools/objto=
ol/tests/generic/test-checksum-value.sh
new file mode 100755
index 0000000..feae6a1
--- /dev/null
+++ b/tools/objtool/tests/generic/test-checksum-value.sh
@@ -0,0 +1,37 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# The per-function checksums klp checksum records are what klp diff uses to
+# decide which functions changed.  A checksum covering too little misses a r=
eal
+# change and the patch silently omits the function; one covering too much, or
+# unstable across identical input, clones functions nobody patched and drags
+# their dependencies in with them.
+#
+# test-basic covers which functions got cloned, which is downstream of this =
and
+# passes for either kind of wrong checksum as long as the two errors do not
+# happen to cancel.  This checks the checksums themselves.
+
+. "$(dirname "$0")/../lib.sh"
+
+setup
+build_pair basic.c
+
+assert_input_symbol changed
+assert_input_symbol untouched
+
+run_checksum
+
+# The edited function's checksum has to move, the untouched one's must not.
+assert_checksum_differs changed
+assert_checksum_matches untouched
+
+# And it has to be a function of the code, not of the build: checksumming the
+# same input twice has to give the same answer, or every rebuild reports
+# spurious changes.
+first=3D"$(checksum_of orig.o changed)"
+build_pair basic.c
+run_checksum
+[ "$(checksum_of orig.o changed)" =3D "$first" ] ||
+	fail "checksum for 'changed' differs between builds of identical source"
+
+pass "checksums track the changed function and are stable across rebuilds"
