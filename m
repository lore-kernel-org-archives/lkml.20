Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A7BE4E36C9;
	Fri, 18 Sep 2026 10:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789726541; cv=none; b=CDyaHdym554lnnVdjLD62TxuKu4JGDsRXLEfFPOpeuzUqg5N6JX4/wRBssl+l7SaIv25PqkiHbzLJH175121jYqWSDkGjcwCZgIk8r3vTFTTmNrPATT8ITOzcU+C0Js3zi98xhYWFJkN9LF78Kz14a7e35Nf98C50vAE8/id81s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789726541; c=relaxed/simple;
	bh=Uu7oNKDgmeM72vk05h2W5ZuRdBGbrAkmgBhBVDVmoAM=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=gTSy0SAjIVwOaQgk+HqhBBdfK2Ad+YKr5n5dUinKf8aysQCFYUFzraDOshZvCCuskQ78QSuoH/lCTOIowGwSrxelyUgiMSEdjHWBRDPwqlD5Dm6t+FDM++Gy9a11UrXDcW+b/C41NNaifSylqkMJINQofkMJ9KJFsGfRhIztkU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=nv9v9u8i; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=5OVLbla4; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="nv9v9u8i";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="5OVLbla4"
Date: Fri, 18 Sep 2026 10:15:34 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789726536;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hF23Pr1+Bm3O5pCIIlGxmgJ9hUtIeSutZ9DUuA7cEDk=;
	b=nv9v9u8iIQvqsDtqedOvC56MJh80mkT3+PoaJPF8zynR3QZNdSD2RAWEb/Q0/GLROENafA
	AFhCNgzZcpcfQeuvi2RDl2RvoMQxo8dwgWxtwtDADOUpEGC/PrFyKKk7SIwg995qlx1qet
	/4B1//u7mXEt4OcExOXwlkvHrm6DvDWrwHGpM6zOhjkSSK5z1Diw5rNPhj6PKbfWs1RlC/
	OE2WxiYMN45oCmjQv6EtTP3r9cg4A9VSkZRoTs0DkGYae5MWwWd3AN8YPPqj7N4RsQauG9
	6V/wYi2AzAuaS2j4IPL73gJH4KY9ulXrYvLCoAG9bONOaZTrMJCE6/3eT+RtDQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789726536;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hF23Pr1+Bm3O5pCIIlGxmgJ9hUtIeSutZ9DUuA7cEDk=;
	b=5OVLbla4egb+KA2Xw+EvEaD+L6Vgrz2yBhRmhLFTlyglnH5+FCWPz0ZeM9n2voRDicGY+h
	89ZI6bwdpqe75MBQ==
From: "tip-bot2 for Song Liu" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: objtool/core] objtool/klp: Add test for Module.symvers path
 normalization
Cc: Song Liu <song@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260916184351.2720310-31-song@kernel.org>
References: <20260916184351.2720310-31-song@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178972653487.1720534.1130609943140169328.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the objtool/core branch of tip:

Commit-ID:     3a3a268e01187f836e070caeef7f7671e8cad6bf
Gitweb:        https://git.kernel.org/tip/3a3a268e01187f836e070caeef7f7671e8c=
ad6bf
Author:        Song Liu <song@kernel.org>
AuthorDate:    Wed, 16 Sep 2026 11:43:23 -07:00
Committer:     Josh Poimboeuf <jpoimboe@kernel.org>
CommitterDate: Wed, 16 Sep 2026 17:13:28 -07:00

objtool/klp: Add test for Module.symvers path normalization

Module.symvers names an export's owner by build path, and the kernel knows
modules by their runtime name.  Without normalizing one to the other, an
export owned by a module is not recognised as owned by anything, and a
reference that should become a klp relocation stays an ordinary one.

This tests the behavior of commit 8668bf91e050 ("objtool/klp: Normalize
Module.symvers paths to module names").

Assisted-by: Claude:claude-opus-4
Based-on-test-by: Joe Lawrence <joe.lawrence@redhat.com>
Assisted-by: Claude:claude-opus-5
Signed-off-by: Song Liu <song@kernel.org>
Link: https://patch.msgid.link/20260916184351.2720310-31-song@kernel.org
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 tools/objtool/tests/generic/test-modname-normalize.sh | 26 ++++++++++-
 1 file changed, 26 insertions(+)
 create mode 100755 tools/objtool/tests/generic/test-modname-normalize.sh

diff --git a/tools/objtool/tests/generic/test-modname-normalize.sh b/tools/ob=
jtool/tests/generic/test-modname-normalize.sh
new file mode 100755
index 0000000..a8059bd
--- /dev/null
+++ b/tools/objtool/tests/generic/test-modname-normalize.sh
@@ -0,0 +1,26 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# Module.symvers records the build-tree path of the object that exports a
+# symbol, not the name the module has at runtime: "arch/x86/kvm/kvm-intel",
+# where the kernel knows the module as "kvm_intel".
+#
+# The klp symbol name embeds the owning object, and livepatch matches it
+# against loaded modules by name.  Left unnormalized it names a module that
+# does not exist, and the relocation is never resolved -- at load time, with=
 no
+# build-time complaint.
+
+. "$(dirname "$0")/../lib.sh"
+
+setup
+build_module_pair cross_module.c klp_testmod
+
+# A path with directory components, a dash, and no extension.
+export_syms
+add_exports "arch/x86/kvm/kvm-intel" other_mod_func
+run_diff
+
+# Directories stripped, dash to underscore.
+assert_klp_sym other_mod_func kvm_intel
+
+pass "Module.symvers paths normalized to runtime module names"
