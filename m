Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.25
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793993736;
	b=xHX8stdl1qwtXQhpo6uPCcRak7TcMQRr9Is06v/eGGLcKsx3oG8rRUCsNUVrMui7Qiod
	 UHIzAXYOjS928/SjiL8LLb67oNCXkABJR/iKdEkpnBEE2MWeumtD2lK0B9i9iyP0fCZHO
	 /SUC7/ypoFJOYtZr1KkzSxVMFzHFo9PS4/PU2vDxv8zenPb4j03UmohQhox1k+j8Wf+Ye
	 84tikf9zdvq+YVv6sVqy4gm0dnuvJxM94469FPru1F/ozP6bWtAgT2IAb9EZnErZGj1Sm
	 CsOO18Xoi/rpddt8XLXqButbgH4ZMJmgadXpQnwElY8EUzwUwuP9e5PehJOw/Mp2xbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793993736;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=U+GMiC/0PnCN2U2/dRiS6xeO1SVteXmyJzYr93GAZi8=;
	b=ppK1a5jnPKzy79kM1JDF1Zi0OPzrOrRwJU5+RAMGn/DnpFSuSIdXvzpKdjUJkjA5ZjEH
	 +rg/1Yembb5YSELqWQ9L5Y7JTW7/qzTrhgkSd/dWSqQclvR22SxgxeB+4mfUhguCAAfKm
	 UlxKdqJnbsZHoGQ/w7HoM0XKJdIdPKZ6IR83iaahcEHD4ESDIV56Qm8imka4CIXai7gXb
	 XBo5lsCIHCauNwUowFI3d4g09q4CD5Uaf84mqvpC560KBr8Dljmt2qr/j1vg5pu62qvgS
	 Fi5K23POtMU0actPKSLYbU2mNVHTLLFQay4QSGhDstnPzAKwiLtaDidnbrBR4jc9VSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=modelmiser.com;
	spf=pass smtp.mailfrom=modelmiser.com;
	dkim=pass header.d=modelmiser.com header.i=@modelmiser.com header.a=rsa-sha256 header.s=protonmail header.b=PK0Xe4f4;
	arc=none smtp.remote-ip=79.135.106.25
Received: from mail-10625.protonmail.ch (mail-10625.protonmail.ch [79.135.106.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DAEE606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 19:35:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DAEE606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=modelmiser.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=modelmiser.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=modelmiser.com header.i=@modelmiser.com header.a=rsa-sha256 header.s=protonmail header.b=PK0Xe4f4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=modelmiser.com;
	s=protonmail; t=1793993732; x=1794252932;
	bh=U+GMiC/0PnCN2U2/dRiS6xeO1SVteXmyJzYr93GAZi8=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=PK0Xe4f41YIyYmcBrpJuqGIPbqfhx0CPawsWcZFWMhW7DyKXBcEOAHIFBT4Je4xuh
	 JCuIxOcOAmSLu4Y+QhxhbDAdpRXbAQZn0YuB4mCyzoxqprlf3a0obHHi36pIAlTu1a
	 oWSMnKPrL4hA/227ROw+iSQuvtzgMDPPtPIBvJRGM45iFaEq41o1oYBGtCmDH5bn6l
	 tkIaWtRpL1mptKBGbXC5xuJUfA8h12iF0vzTM5DAXxNqZlNMLuuFVlzuDUHraPP5eU
	 s3dc4KfhYINIZ/8I/hxjKrCBlqQr/VDp22Vi9hX2iSHEJUbx7uSc+votMRc6LZfXsx
	 VKG+gwYcBKXjQ==
Date: Fri, 06 Nov 2026 19:35:25 +0000
To: Julia Lawall <Julia.Lawall@inria.fr>, Nicolas Palix <nicolas.palix@imag.fr>
From: Chad Aldreda <ca@modelmiser.com>
Cc: cocci@inria.fr, linux-kernel@vger.kernel.org
Subject: [PATCH] coccinelle: api: add a checker for device nodes in devm_ memory
Message-ID: <20261106193517.3267013-2-ca@modelmiser.com>
Feedback-ID: 232753253:user:proton
X-Pm-Message-ID: 0919c766be63babccd11c4cbbbda29866fc3fbaa
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

A struct cdev, struct miscdevice, struct video_device or struct
v4l2_device embedded in memory from devm_kzalloc() and friends is freed
when the driver unbinds, but a file that user space holds open on the
node outlives the unbind. Its later file operations are a use-after-free
when they use that memory, and for a cdev or video_device so is its
close(), where the core touches the object and the v4l2_device the
video_device points to.

Add a script that reports such allocations: by two rules when the
allocation, as an assignment or a declaration initializer, and a
registration of it or of an address taken inside it are written directly
in one function, and by a third, type-based rule when the struct is
defined in the same .c file and the node is a direct member of it. A
registration in a helper function on a struct defined in a header is not
seen, so cx231xx is reported only through its v4l2_device.

On 7.4-rc1 it reports 101 sites under drivers/, 50 of which are found
only through a v4l2_device. Not all are actionable: some drivers cannot
be unbound, and some miscdevice drivers never use the allocation after
open(); the header lists the false-positive classes and the misses.

Tested with spatch 1.1.1, with make coccicheck MODE=3Dreport and MODE=3Dorg=
,
and on small test files for each allocation form, a struct in a header,
a registration in a helper, a node in an array member, a registered
pointer to separate memory, a v4l2_device, an embedded node that is
never registered and a kzalloc() control.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Chad Aldreda <ca@modelmiser.com>
---
The type rule uses --include-headers-for-types, which reports the same
101 sites on every run. With --include-headers it also sees structs
defined in headers: run on one file at a time, that adds 22 sites on
7.4-rc1 (xilinx-vipp and ultrasoc-smb among them). Under --dir, as make
coccicheck runs it, some are lost. spatch --include-headers --dir
drivers/media/pci/intel/ipu6 reports nothing, even as a single process,
while the same command on drivers/media/pci/intel/ipu6/ipu6-isys.c alone
reports line 990. With six jobs the rest vary as well: five runs over
drivers/ found 15 to 17 of the 22, a different set each time.

So I kept the deterministic option. Is the --dir difference expected,
and is there a better way to give the type rule header-defined structs?

 .../coccinelle/api/devm_file_reachable.cocci  | 164 ++++++++++++++++++
 1 file changed, 164 insertions(+)
 create mode 100644 scripts/coccinelle/api/devm_file_reachable.cocci

diff --git a/scripts/coccinelle/api/devm_file_reachable.cocci b/scripts/coc=
cinelle/api/devm_file_reachable.cocci
new file mode 100644
index 0000000000..3847710798
--- /dev/null
+++ b/scripts/coccinelle/api/devm_file_reachable.cocci
@@ -0,0 +1,164 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/// Find a struct cdev, struct miscdevice, struct video_device or struct
+/// v4l2_device embedded in memory from the devm_ allocators.  The memory
+/// is freed when the driver unbinds, but a file that is open on the node
+/// outlives the unbind: for a cdev or a video_device the core touches the
+/// object, and the v4l2_device the video_device points to, on every
+/// close, and for a miscdevice the driver's file operations usually reach
+/// it through file->private_data.  Allocate such state with kzalloc() and
+/// free it on the last reference; see
+/// Documentation/driver-api/driver-model/devres.rst.
+///
+/// The first rules need the allocation and a registration of it, or of an
+/// address taken inside it, written directly in one function; an
+/// allocation inside a condition or behind a cast or a wrapper function
+/// is not seen by them. The type rule catches the rest, but with the
+/// options below it sees only a struct defined in the .c file itself, not
+/// in a header, and only a node that is a direct, non-array member of it,
+/// not one nested in another member. So a registration in a helper
+/// function, or through any alias of x such as vfd =3D &x->vdev, is misse=
d
+/// when the struct is in a header or the node is not such a member. Not
+/// checked: a struct media_device in devm_ memory, which v4l2_release()
+/// also reaches; a struct v4l2_subdev with a device node, whose close
+/// reaches it; a static node whose file operations reach devm_ state
+/// through a global or drvdata pointer; memory freed by devm_add_action()
+/// rather than allocated by devm_k*(); a typedef'd struct; and a file or
+/// function spatch cannot parse.
+/// False positives: a driver that cannot be unbound (suppress_bind_attrs,
+/// platform_driver_probe()) on a device that is never removed, a driver
+/// whose remove() waits for the last close, a miscdevice driver whose fil=
e
+/// operations do not use the allocation after open(), a registration of
+/// an address that only uses the allocation to reach separate memory
+/// (&x->ptr->misc, &table[x->idx]), a v4l2_device that no video_device
+/// points to, and, for the type rule, a struct whose embedded node is not
+/// registered from this allocation.  When an allocation has several
+/// registrations, the report names the first one found.
+///
+// Confidence: Moderate
+// Options: --include-headers-for-types
+
+virtual org
+virtual report
+
+@initialize:python@
+@@
+seen =3D set()
+
+@alloc depends on org || report exists@
+expression x, e, e2;
+identifier fn =3D~ "^devm_k[mzcr]";
+position p, q;
+@@
+
+x =3D fn@p(...);
+... when !=3D x =3D e
+(
+misc_register@q(\(x\|&<+... x ...+>\))
+|
+cdev_add@q(\(x\|&<+... x ...+>\), ...)
+|
+cdev_device_add@q(\(x\|&<+... x ...+>\), ...)
+|
+video_register_device@q(\(x\|&<+... x ...+>\), ...)
+|
+video_register_device_no_warn@q(\(x\|&<+... x ...+>\), ...)
+|
+__video_register_device@q(\(x\|&<+... x ...+>\), ...)
+|
+v4l2_device_register@q(e2, \(x\|&<+... x ...+>\))
+)
+
+@allocdecl depends on org || report exists@
+identifier x;
+type T;
+expression e, e2;
+identifier fn =3D~ "^devm_k[mzcr]";
+position p, q;
+@@
+
+T *x =3D fn@p(...);
+... when !=3D x =3D e
+(
+misc_register@q(\(x\|&<+... x ...+>\))
+|
+cdev_add@q(\(x\|&<+... x ...+>\), ...)
+|
+cdev_device_add@q(\(x\|&<+... x ...+>\), ...)
+|
+video_register_device@q(\(x\|&<+... x ...+>\), ...)
+|
+video_register_device_no_warn@q(\(x\|&<+... x ...+>\), ...)
+|
+__video_register_device@q(\(x\|&<+... x ...+>\), ...)
+|
+v4l2_device_register@q(e2, \(x\|&<+... x ...+>\))
+)
+
+@embeds depends on org || report@
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
+@bytype depends on org || report@
+identifier embeds.S;
+struct S *x;
+identifier fn =3D~ "^devm_k[mzcr]";
+position p;
+@@
+
+x =3D fn@p(...)
+
+@script:python depends on org@
+p << alloc.p;
+q << alloc.q;
+@@
+if (p[0].file, p[0].line, p[0].column) not in seen:
+    seen.add((p[0].file, p[0].line, p[0].column))
+    coccilib.org.print_todo(p[0], "WARNING: devm_ memory registered at lin=
e %s as a device node or a v4l2_device; an open file outlives unbind" % q[0=
].line)
+
+@script:python depends on report@
+p << alloc.p;
+q << alloc.q;
+@@
+if (p[0].file, p[0].line, p[0].column) not in seen:
+    seen.add((p[0].file, p[0].line, p[0].column))
+    coccilib.report.print_report(p[0], "WARNING: devm_ memory registered a=
t line %s as a device node or a v4l2_device; an open file outlives unbind" =
% q[0].line)
+
+@script:python depends on org@
+p << allocdecl.p;
+q << allocdecl.q;
+@@
+if (p[0].file, p[0].line, p[0].column) not in seen:
+    seen.add((p[0].file, p[0].line, p[0].column))
+    coccilib.org.print_todo(p[0], "WARNING: devm_ memory registered at lin=
e %s as a device node or a v4l2_device; an open file outlives unbind" % q[0=
].line)
+
+@script:python depends on report@
+p << allocdecl.p;
+q << allocdecl.q;
+@@
+if (p[0].file, p[0].line, p[0].column) not in seen:
+    seen.add((p[0].file, p[0].line, p[0].column))
+    coccilib.report.print_report(p[0], "WARNING: devm_ memory registered a=
t line %s as a device node or a v4l2_device; an open file outlives unbind" =
% q[0].line)
+
+@script:python depends on org@
+p << bytype.p;
+S << embeds.S;
+@@
+if (p[0].file, p[0].line, p[0].column) not in seen:
+    seen.add((p[0].file, p[0].line, p[0].column))
+    coccilib.org.print_todo(p[0], "WARNING: devm_ allocation of struct %s,=
 which embeds a cdev, miscdevice, video_device or v4l2_device" % S)
+
+@script:python depends on report@
+p << bytype.p;
+S << embeds.S;
+@@
+if (p[0].file, p[0].line, p[0].column) not in seen:
+    seen.add((p[0].file, p[0].line, p[0].column))
+    coccilib.report.print_report(p[0], "WARNING: devm_ allocation of struc=
t %s, which embeds a cdev, miscdevice, video_device or v4l2_device" % S)
--=20
2.43.0


