Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794333380;
	b=lVc8C6SBdadAOyO08ADMR9GBCHl0FLksloQk8M/DOglxPP035duq34xyRVKV/17vnILO
	 rU6cTunacdaP6yJIk/IrC+urqrB97kDTcTQiQH3Hn+ijvsMvFvwuEMJ9Q/PWURjq3/Ftx
	 LwCYlVMFSPBJWjJ6Zs3QXDzPRQ6kE/hlloBzhJQs0qROO6KEqfPyW+YegUHIuKGQ92oyU
	 abjj9nRdICXmAeuKpGDP1o7h+CKwgkY4uaSK92cejWp4g2t4CCvyBf3U6yKWu/CV0eGK+
	 /pE/HOWIaHnuhq3VO0a4kWS0HAxn+aKiZpmjlsQFbwXHnoEHqXXLHQZGBbwjgsomGvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794333380;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=pMm1+EQQovWR5YqKZWrJrY9fn+qMfjdL+fLalt4okXQ=;
	b=naXPwscuPyB1+9OP8piwkGeR/ZsVL8Sd11xmH4o1k1nyJhSOXUIeFS7nIVr11XYTaPnO
	 TpsU45HjT5dwUBfk4an2SJSsLkSrsiT/xzzfuZt+wX4FGgLEyHsseq2pRwBVP6bT8Trsi
	 9V18Mj2Ph5s/FXHzMS5eSHf7IrI8h2AZNc4f9V9xneS2YpFCWKxPeODb3JNErolDsprIQ
	 eo5oMrhbWA5Xz0/QcPMR9wqI7AA/uuoQU896/zl2MWNHhz/Ms8KvjmPhfVf1BdpnptHoe
	 6GmYXX2RjnV51i6bOAkANSSkZNE/qUed0tq02nbBpKrcbmZtTN9tB7dUMUf3lG+EAYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=modelmiser.com;
	spf=pass smtp.mailfrom=modelmiser.com;
	dkim=pass header.d=modelmiser.com header.i=@modelmiser.com header.a=rsa-sha256 header.s=protonmail header.b=JNzlhz2W;
	arc=none smtp.remote-ip=185.70.43.17
Received: from mail-4317.protonmail.ch (mail-4317.protonmail.ch [185.70.43.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ADEB606A20F
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:56:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8ADEB606A20F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=modelmiser.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=modelmiser.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=modelmiser.com header.i=@modelmiser.com header.a=rsa-sha256 header.s=protonmail header.b=JNzlhz2W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=modelmiser.com;
	s=protonmail; t=1794333377; x=1794592577;
	bh=pMm1+EQQovWR5YqKZWrJrY9fn+qMfjdL+fLalt4okXQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=JNzlhz2WxvdE/A2wtA9pt2dd/9kqoXVKUEUg6/sGM+foT/orsV9RgcCAoHvt0Sf+u
	 ekF0DwsvvKWm9zr+Rx9tvYWooxVgm+7skfPEV+AdNzZPGe0W2i0SZMzfzDnw9aQjdM
	 8Vmmq5r4po7bzvmSLj2I9y7LhJ58Q1o6XQKC9roQitk/uWNtIiypl58TXw5UmmqHqa
	 tQjnZlO8O+ealsFpa0qWvaSzrwiWYaqD4dh0RYfxZi25hNgp9x/MbQfLQpb/uCJZa4
	 DrTI8b6wCdZjkbuRrsL62C7c3Xt6+BfzatLPNPWI+GQ6BO08NZMcIz9ouQEh/QKsvm
	 N+JxQRT7hystQ==
Date: Tue, 10 Nov 2026 17:56:12 +0000
To: Julia Lawall <Julia.Lawall@inria.fr>, Nicolas Palix <nicolas.palix@imag.fr>
From: Chad Aldreda <ca@modelmiser.com>
Cc: cocci@inria.fr, linux-kernel@vger.kernel.org
Subject: [PATCH v2] coccinelle: api: add a checker for device nodes in devm memory
Message-ID: <20261110175607.1617450-2-ca@modelmiser.com>
In-Reply-To: <20261106193517.3267013-2-ca@modelmiser.com>
References: <20261106193517.3267013-2-ca@modelmiser.com>
Feedback-ID: 232753253:user:proton
X-Pm-Message-ID: 7328148d371cae6b74cc8b5197c3167d78f810c7
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

A struct cdev, miscdevice, video_device or v4l2_device embedded in
memory from devm_kzalloc() and friends is freed when the driver unbinds
(Documentation/driver-api/driver-model/devres.rst), but a file that user
space holds open on the node outlives the unbind. Its later file
operations use the freed memory, and for two kinds of node so does the
core on close(). For a cdev, __fput() calls cdev_put() on it after the
driver's release(). For a video_device, v4l2_release() reads it and the
v4l2_device it points to, then drops a reference on it; at the last
reference v4l2_device_release() follows it to the v4l2_device again.
For a miscdevice, nothing on close() touches the miscdevice except the
driver's release().

Report such allocations in two ways: when the allocation and a
registration whose argument uses it (x, &x->f, ...) are in one function;
and by type, when the allocated struct embeds the node directly and is
defined in the .c file or in a header it includes with #include "..."
(spatch's default). A node registered through a pointer copied out of
the allocation first is found only by the type rule; one nested in
another member or in an array only by the first rule.

With Coccinelle 1.3.3, on 7.4-rc1 it reports 124 sites under drivers/,
47 of them only through a v4l2_device. Known false positives: drivers
that cannot be unbound while a file is open short of removing the
device, such as open-dice (platform_driver_probe() sets
suppress_bind_attrs, and the open file pins the module); nodes no file
can be opened on, such as the miscdevice in dw-xdata-pcie, which has no
file_operations, or a v4l2_device that no device node points to; for the
type rule, an allocation whose node is never registered; and a
registration of memory only reached through the allocation, such as
misc_register(x->ptr). Coccinelle 1.1.1 found 116 and 115 of the 124 in
two runs, and nothing else: it loses some structs defined in headers
when run with --dir, and cannot parse one probe function.

Fixes sent for sites it reports:

  misc: nsm: https://lore.kernel.org/r/20261107114433.3789830-2-ca@modelmis=
er.com
  ptp: vmclock: https://lore.kernel.org/r/20261107150344.3946529-2-ca@model=
miser.com
  platform/chrome: cros_hps_i2c: https://lore.kernel.org/r/20261110123230.1=
251547-2-ca@modelmiser.com
  platform/x86: dell-smo8800: https://lore.kernel.org/r/20261107204950.8895=
2-2-ca@modelmiser.com
  ACPI: pfr_update: https://lore.kernel.org/r/20261108233900.4043941-4-ca@m=
odelmiser.com
  ACPI: pfr_telemetry: https://lore.kernel.org/r/20261110144436.1529000-2-c=
a@modelmiser.com

The script supports the context, org and report modes. It has no patch
mode: the fix is a lifetime change (a kref, or a reference held by the
open file) that differs per driver.

The script and this message were written with an AI assistant (Claude)
and checked by hand. The six sites with fixes linked above were
reproduced in QEMU under KASAN before each fix was sent; the other sites
were not tested.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Chad Aldreda <ca@modelmiser.com>
---
v2, for Julia Lawall's points:
- Accepted fixes: links in the message; their status is at the end of
  this note.
- -I: two things lost ipu6 line 990 for us, and -I fixes neither.
  Coccinelle 1.1.1 misses it with --dir, with or without -I; and v1's
  Options line (--include-headers-for-types), which make coccicheck
  applies and a bare spatch run ignores, makes 1.3.3 miss it too. v2
  drops that line; with 1.3.3 (git 11b93adb6), spatch --dir drivers and
  make coccicheck M=3Ddrivers, which passes -I, give the same 124 sites,
  990 among them.
- Header cut to two lines, and depends on org || report dropped.

v2, for Markus Elfring's points: the two allocation rules are one rule
with a disjunction (x is now an identifier, so x->f =3D devm_k*() is
reported by the type rule); the argument pattern is <+... x ...+>;
context mode added; one report helper; f-strings; "devm" without the
underscore; the close() paths per node type are in the message. With the
same Coccinelle and options, the report over drivers/ is the same line
for line before and after these changes.

Counts are for Coccinelle 1.3.3; v1's used 1.1.1. The 47 replaces v1's
50, which was measured with v1's script, 1.1.1 and the old Options line.

v1: https://lore.kernel.org/r/20261106193517.3267013-2-ca@modelmiser.com

On your question about accepted fixes: Rafael Wysocki applied the
pfr_update fix to linux-pm (bleeding-edge) for 7.5, as dacb7cef6f32.
The cros_hps_i2c fix is at v2 after Tzung-Bi Shih's review, and
pfr_telemetry at v2 after Rafael asked me to address an automated
review of it; nsm, vmclock and dell-smo8800 have had no reply yet.

 .../coccinelle/api/devm_file_reachable.cocci  | 114 ++++++++++++++++++
 1 file changed, 114 insertions(+)
 create mode 100644 scripts/coccinelle/api/devm_file_reachable.cocci

diff --git a/scripts/coccinelle/api/devm_file_reachable.cocci b/scripts/coc=
cinelle/api/devm_file_reachable.cocci
new file mode 100644
index 0000000000..09d139eb6d
--- /dev/null
+++ b/scripts/coccinelle/api/devm_file_reachable.cocci
@@ -0,0 +1,114 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/// Find a cdev, miscdevice, video_device or v4l2_device in devm memory,
+/// which a file still open after unbind can use.
+///
+// Confidence: Moderate
+// Comments: Drivers that cannot be unbound while a file is open, and node=
s
+// without file operations, are false positives.
+
+virtual context
+virtual org
+virtual report
+
+@initialize:python@
+@@
+seen =3D set()
+
+def warn(print_fn, p, msg):
+    key =3D (p.file, p.line, p.column)
+    if key not in seen:
+        seen.add(key)
+        print_fn(p, f"WARNING: {msg}")
+
+@alloc exists@
+identifier x;
+type T;
+expression e, e2;
+identifier fn =3D~ "^devm_k[mzcr]";
+position p, q;
+@@
+
+(
+x =3D fn@p(...);
+|
+T *x =3D fn@p(...);
+)
+... when !=3D x =3D e
+(
+misc_register@q(<+... x ...+>)
+|
+video_register_device@q(<+... x ...+>, ...)
+|
+v4l2_device_register@q(e2, <+... x ...+>)
+|
+cdev_device_add@q(<+... x ...+>, ...)
+|
+cdev_add@q(<+... x ...+>, ...)
+|
+__video_register_device@q(<+... x ...+>, ...)
+|
+video_register_device_no_warn@q(<+... x ...+>, ...)
+)
+
+@embeds@
+identifier S, f;
+type T =3D {struct cdev, struct miscdevice, struct video_device,
+          struct v4l2_device};
+@@
+
+struct S {
+  ...
+  T f;
+  ...
+};
+
+@bytype@
+identifier embeds.S;
+struct S *x;
+identifier fn =3D~ "^devm_k[mzcr]";
+position p;
+@@
+
+x =3D fn@p(...)
+
+@depends on context@
+identifier alloc.fn;
+position alloc.p;
+@@
+
+* fn@p(...)
+
+@depends on context@
+identifier bytype.fn;
+position bytype.p;
+@@
+
+* fn@p(...)
+
+@script:python depends on org@
+p << alloc.p;
+q << alloc.q;
+@@
+warn(coccilib.org.print_todo, p[0],
+     f"devm memory registered at line {q[0].line} as a device node or a v4=
l2_device")
+
+@script:python depends on report@
+p << alloc.p;
+q << alloc.q;
+@@
+warn(coccilib.report.print_report, p[0],
+     f"devm memory registered at line {q[0].line} as a device node or a v4=
l2_device")
+
+@script:python depends on org@
+p << bytype.p;
+S << embeds.S;
+@@
+warn(coccilib.org.print_todo, p[0],
+     f"devm allocation of struct {S}, which embeds a device node or a v4l2=
_device")
+
+@script:python depends on report@
+p << bytype.p;
+S << embeds.S;
+@@
+warn(coccilib.report.print_report, p[0],
+     f"devm allocation of struct {S}, which embeds a device node or a v4l2=
_device")
--=20
2.43.0


