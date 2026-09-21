Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3774B47ACE8;
	Mon, 21 Sep 2026 09:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789982922; cv=none; b=NYYLsMABQkq/aafFLmV40e2fg19NGis2UO2Hak2Iq+0d3kMpqADvAVNQvAq3LdUhd12aVpu7aauwO4p6D6XrEPyEJ+X85BIrkQ9+HpVUEGiQs0vl6y/BfLo/NehaemTwxPgXKkql95ZzndafSfBHIS8UZWMnwpaJXVuUXsJyVxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789982922; c=relaxed/simple;
	bh=WDiSemZsJ50s6EXB/td3PK//lOSnPI/PVW4FXDy588c=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=UuZdrgC6ZWh1Nxw5DdUTW8f76b6nRSH+jod4VHV/r74ppKyetVQJ3+LMa/OulLiUw8oQr9QhShnGFsGRK8PtCd4sYQeJLvyXX7W7jWEk3opSzpB1CV2NTlYlXMsnhyh9TPnK5vidlEUT5/6xTDXwsDKLkIZMkBKqYs2nWyjNnlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=RrzFQUP6; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=EB2Gq7/J; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="RrzFQUP6";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="EB2Gq7/J"
Date: Mon, 21 Sep 2026 09:28:37 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789982919;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nNRv2BttbvpNGCkrpp6okifHgZITLuTAZBM51gk6gsA=;
	b=RrzFQUP67QJs0UfN9Y4pcOfu6hEBm485SekJLRJzuF5fOEwmrWKYV2nmuHYxjWMeXn4AOB
	243RLTtqA+mYbTsM766scsszmYraTjasUb/5HnCgzuneT9hABl7xQdBSN2Zyxd7ATjgCDB
	uoEduRV9iFC7a9TOmFkkskncY2V3+2v/8eDwK9+zSUvJm7HW3ShDQwxa2+KeUOKHUAE79O
	d9wK2CJzGBvAmMXW7C6z8AWHVGgj6ZjtwoiXqdvYqUYdQvYzpcwWX+ye8iiY4qEuw+P/mk
	Jq1+962StP+VFfnTg4CA46OOvXdQv6M9f7PDAMn0KMF1K5bUgwAI+7SDYGDFhQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789982919;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nNRv2BttbvpNGCkrpp6okifHgZITLuTAZBM51gk6gsA=;
	b=EB2Gq7/J/pp1370g9sNLGLkhzz9IJMwTyIml8OPSJM9mLyG+zEiqn8KuVB8ZDN5GMU4n0X
	mrMhuUZyZ6Pgp+Cg==
From: "tip-bot2 for Joe Lawrence" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: objtool/core] objtool: Forward toolchain variables to the klp
 test runner
Cc: Joe Lawrence <joe.lawrence@redhat.com>, Song Liu <song@kernel.org>,
 Josh Poimboeuf <jpoimboe@kernel.org>, Ingo Molnar <mingo@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260916184351.2720310-12-song@kernel.org>
References: <20260916184351.2720310-12-song@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178998291793.2819794.15724146594494879512.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the objtool/core branch of tip:

Commit-ID:     913bf39ff461bc65cfc4e1e05c3d738ffc6ffc75
Gitweb:        https://git.kernel.org/tip/913bf39ff461bc65cfc4e1e05c3d738ffc6=
ffc75
Author:        Joe Lawrence <joe.lawrence@redhat.com>
AuthorDate:    Wed, 16 Sep 2026 11:43:04 -07:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Mon, 21 Sep 2026 11:01:56 +02:00

objtool: Forward toolchain variables to the klp test runner

The tests target already passes ARCH and CROSS_COMPILE into
run-tests.sh.  lib.sh uses those to pick a default compiler and
binutils:

  CC=3D${CC:-${CROSS_COMPILE}gcc}
  LD=3D${LD:-${CROSS_COMPILE}ld}
  READELF=3D${READELF:-${CROSS_COMPILE}readelf}
  OBJCOPY=3D${OBJCOPY:-${CROSS_COMPILE}objcopy}

Those defaults only apply when the variables reach the shell that sources
lib.sh.  The recipe passed OBJTOOL, ARCH and CROSS_COMPILE explicitly, but
not CC or the binutils.  Makefile-assigned values (e.g. from LLVM=3D1) are
not visible in the recipe environment unless forwarded:

  $ LLVM=3D1 make -C tools/objtool tests
  ...
  # preflight
  #   compiler  gcc (GCC) ...

Pass CC, LD, READELF and OBJCOPY the same way as ARCH and CROSS_COMPILE,
so fixtures are built and inspected with the toolchain make selected:

  $ LLVM=3D1 make -C tools/objtool tests
  ...
  # preflight
  #   compiler  clang version 21.1.8 ...

Signed-off-by: Joe Lawrence <joe.lawrence@redhat.com>
Signed-off-by: Song Liu <song@kernel.org>
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Assisted-by: Claude:claude-opus-5
Link: https://patch.msgid.link/20260916184351.2720310-12-song@kernel.org
---
 tools/objtool/Documentation/klp-test-design.txt | 12 +++++++++++-
 tools/objtool/Makefile                          |  9 +++++++++
 2 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/tools/objtool/Documentation/klp-test-design.txt b/tools/objtool/=
Documentation/klp-test-design.txt
index 67d20bf..2082c27 100644
--- a/tools/objtool/Documentation/klp-test-design.txt
+++ b/tools/objtool/Documentation/klp-test-design.txt
@@ -243,7 +243,17 @@ setting a cross compiler cannot produce one the host is =
unable to run.  ARCH
 selects both the objtool target and the directory of tests to run.
=20
 clang needs telling, since it defaults to the host triple however it is
-invoked.  The fixtures include no kernel headers, so no sysroot is needed:
+invoked.  LLVM=3D1 with CROSS_COMPILE does that for you -- the --target=3D it
+derives is forwarded to the tests -- and the fixtures include no kernel
+headers, so no sysroot is needed:
+
+::
+
+    ARCH=3Dx86_64 CROSS_COMPILE=3Dx86_64-linux-gnu- LLVM=3D1 \
+            make -C tools/objtool tests
+
+Naming the compiler by hand works too, and is what to reach for when the
+target triple is not the one CROSS_COMPILE implies:
=20
 ::
=20
diff --git a/tools/objtool/Makefile b/tools/objtool/Makefile
index d3db966..db99c47 100644
--- a/tools/objtool/Makefile
+++ b/tools/objtool/Makefile
@@ -153,8 +153,17 @@ clean: $(LIBSUBCMD)-clean
 mrproper: clean
 	$(call QUIET_CLEAN, objtool) $(RM) $(OBJTOOL)
=20
+# The kernel's own Makefile sets OBJCOPY, to llvm-objcopy under LLVM and to
+# $(CROSS_COMPILE)objcopy otherwise; tools/scripts/Makefile.include names on=
ly
+# LLVM_OBJCOPY and leaves OBJCOPY unset.  Forwarding it unset would hand the
+# tests an empty string, and they would fall back to GNU objcopy even when
+# asked for an LLVM toolchain.
+OBJCOPY ?=3D $(if $(LLVM),$(LLVM_OBJCOPY),$(CROSS_COMPILE)objcopy)
+
 tests: $(OBJTOOL)
 	$(Q)OBJTOOL=3D$(abspath $(OBJTOOL)) ARCH=3D$(ARCH) CROSS_COMPILE=3D$(CROSS_=
COMPILE) \
+		CC=3D'$(CC) $(CLANG_CROSS_FLAGS)' LD=3D'$(LD)' \
+		READELF=3D'$(READELF)' OBJCOPY=3D'$(OBJCOPY)' \
 		KEEP=3D$(KEEP) $(srctree)/tools/objtool/tests/run-tests.sh
=20
 FORCE:
