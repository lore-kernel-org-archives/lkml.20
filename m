Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.134.164.83
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793996454;
	b=37iJXLL4ciljSDjqelUQabJCV8nTp2P66GT7MAHdnhe+1fKuGJnBHUEA3lFFZAhxk0nD
	 JIwmBhhVqisMXHvQNeDLeY5MdPsXRFGQtuMiPd030+ukalOioiYZdMObEqlmo0hJ87wNG
	 QGV9p/ZmUism/yP4StRhNNykceRv1b5xctU5rfjmCXeR+z5/kI+a52/fLeI65MupDrTOl
	 wG6ViG2NtO7jcGm+C25HsUBnQCdRZq9K2jCI5CtrJ1YycUWDj3TgacU78FinAY+u9kzg1
	 9lMhpd2RbxB6vYD7Vi3CA+qIwXynIhiHlEjgWXd33h0fK7cKd2xwhNx0c3LbUM90M1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793996454;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Date:From:To:cc:Subject:In-Reply-To:Message-ID:
	 References:MIME-Version:Content-Type;
	bh=FuLO2AbDaNLP40FbdFwoqBB9qAnL5dvmzRmSujGMrw0=;
	b=x8X39B+i0po/xoZq5gjVScNhTYuu3EXnW+2UAxfQQjQxOthV2Rktm2U1Klmnzg/jrCkq
	 3HzprYFAvy518L4cEVrCmrcwm0LXbn749fiyMH3aaNZHF0yWwgb9e/SrgHUhgxUdOUSYj
	 IWx3/XvE7SMmHp52LXHCLLNKnBaS/f5gwoDNShDljDaU1TSUdBjAZuLz9I20D8R3QlXmD
	 hnx+tCKCPS0gnmBTH8xt2VGeZ+G/KsBQMlE64At+bnkjhpYfSM1fP/CoO22Y+xRGFkN3S
	 X9+UGVjm6fxm2XrLqfDWBrSJscrMdBbvsCCheII1yN4j78L35b0ON6kTH+DSzMb77vA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=inria.fr;
	spf=pass smtp.mailfrom=inria.fr;
	dkim=pass header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b=snnM6kzX;
	arc=none smtp.remote-ip=192.134.164.83
Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2953606A32C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 20:20:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2953606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b=snnM6kzX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=FuLO2AbDaNLP40FbdFwoqBB9qAnL5dvmzRmSujGMrw0=;
  b=snnM6kzXD5VBB735Ofmowa3Qzc62oaxYJC8wB+pagwMgkRxRckVh7MAI
   sLm/GBc0ghydvo2+JdwRQP0qbt2pQ9C+CgumBZfTxEL45GVJS1PyXavyD
   ylJRr60CgbczYGIijrnJt5AdlasGxUAv9lfU+j+UNO/wydHDKmwOgi90R
   Q=;
X-CSE-ConnectionGUID: EBw5dCsWQEG+G2Dz+OdjiQ==
X-CSE-MsgGUID: Mav8AZiNSsqwK+E6jVE/Vw==
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.27,199,1787004000"; 
   d="scan'208";a="304272733"
Received: from 88-188-149-159.subs.proxad.net (HELO hadrien.home) ([88.188.149.159])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 21:20:44 +0100
Date: Fri, 6 Nov 2026 21:20:44 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
To: Chad Aldreda <ca@modelmiser.com>
cc: Nicolas Palix <nicolas.palix@imag.fr>, cocci@inria.fr, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] coccinelle: api: add a checker for device nodes in devm_
 memory
In-Reply-To: <20261106193517.3267013-2-ca@modelmiser.com>
Message-ID: <5f30dd50-a764-8e8-8b27-5c26ad10a7dd@inria.fr>
References: <20261106193517.3267013-2-ca@modelmiser.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Fri, 6 Nov 2026, Chad Aldreda wrote:

> A struct cdev, struct miscdevice, struct video_device or struct
> v4l2_device embedded in memory from devm_kzalloc() and friends is freed
> when the driver unbinds, but a file that user space holds open on the
> node outlives the unbind. Its later file operations are a use-after-free
> when they use that memory, and for a cdev or video_device so is its
> close(), where the core touches the object and the v4l2_device the
> video_device points to.
>
> Add a script that reports such allocations: by two rules when the
> allocation, as an assignment or a declaration initializer, and a
> registration of it or of an address taken inside it are written directly
> in one function, and by a third, type-based rule when the struct is
> defined in the same .c file and the node is a direct member of it. A
> registration in a helper function on a struct defined in a header is not
> seen, so cx231xx is reported only through its v4l2_device.
>
> On 7.4-rc1 it reports 101 sites under drivers/, 50 of which are found
> only through a v4l2_device. Not all are actionable: some drivers cannot
> be unbound, and some miscdevice drivers never use the allocation after
> open(); the header lists the false-positive classes and the misses.
>
> Tested with spatch 1.1.1, with make coccicheck MODE=report and MODE=org,
> and on small test files for each allocation form, a struct in a header,
> a registration in a helper, a node in an array member, a registered
> pointer to separate memory, a v4l2_device, an embedded node that is
> never registered and a kzalloc() control.

Thanks for this initiative.

Have you sent any patches based on the results?  I'm not an expert on the
problem being addressed, so it would be helpful to know that the semantic
patch has led to patches that have been accepted.

>
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Chad Aldreda <ca@modelmiser.com>
> ---
> The type rule uses --include-headers-for-types, which reports the same
> 101 sites on every run. With --include-headers it also sees structs
> defined in headers: run on one file at a time, that adds 22 sites on
> 7.4-rc1 (xilinx-vipp and ultrasoc-smb among them). Under --dir, as make
> coccicheck runs it, some are lost. spatch --include-headers --dir
> drivers/media/pci/intel/ipu6 reports nothing, even as a single process,
> while the same command on drivers/media/pci/intel/ipu6/ipu6-isys.c alone
> reports line 990. With six jobs the rest vary as well: five runs over
> drivers/ found 15 to 17 of the 22, a different set each time.
>
> So I kept the deterministic option. Is the --dir difference expected,
> and is there a better way to give the type rule header-defined structs?

The problem you have when you work on a subdirectory is that it doesn't
know where to find the header files.  It should work better with a -I
option.

>
>  .../coccinelle/api/devm_file_reachable.cocci  | 164 ++++++++++++++++++
>  1 file changed, 164 insertions(+)
>  create mode 100644 scripts/coccinelle/api/devm_file_reachable.cocci
>
> diff --git a/scripts/coccinelle/api/devm_file_reachable.cocci b/scripts/coccinelle/api/devm_file_reachable.cocci
> new file mode 100644
> index 0000000000..3847710798
> --- /dev/null
> +++ b/scripts/coccinelle/api/devm_file_reachable.cocci
> @@ -0,0 +1,164 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/// Find a struct cdev, struct miscdevice, struct video_device or struct
> +/// v4l2_device embedded in memory from the devm_ allocators.  The memory
> +/// is freed when the driver unbinds, but a file that is open on the node
> +/// outlives the unbind: for a cdev or a video_device the core touches the
> +/// object, and the v4l2_device the video_device points to, on every
> +/// close, and for a miscdevice the driver's file operations usually reach
> +/// it through file->private_data.  Allocate such state with kzalloc() and
> +/// free it on the last reference; see
> +/// Documentation/driver-api/driver-model/devres.rst.
> +///
> +/// The first rules need the allocation and a registration of it, or of an
> +/// address taken inside it, written directly in one function; an
> +/// allocation inside a condition or behind a cast or a wrapper function
> +/// is not seen by them. The type rule catches the rest, but with the
> +/// options below it sees only a struct defined in the .c file itself, not
> +/// in a header, and only a node that is a direct, non-array member of it,
> +/// not one nested in another member. So a registration in a helper
> +/// function, or through any alias of x such as vfd = &x->vdev, is missed
> +/// when the struct is in a header or the node is not such a member. Not
> +/// checked: a struct media_device in devm_ memory, which v4l2_release()
> +/// also reaches; a struct v4l2_subdev with a device node, whose close
> +/// reaches it; a static node whose file operations reach devm_ state
> +/// through a global or drvdata pointer; memory freed by devm_add_action()
> +/// rather than allocated by devm_k*(); a typedef'd struct; and a file or
> +/// function spatch cannot parse.
> +/// False positives: a driver that cannot be unbound (suppress_bind_attrs,
> +/// platform_driver_probe()) on a device that is never removed, a driver
> +/// whose remove() waits for the last close, a miscdevice driver whose file
> +/// operations do not use the allocation after open(), a registration of
> +/// an address that only uses the allocation to reach separate memory
> +/// (&x->ptr->misc, &table[x->idx]), a v4l2_device that no video_device
> +/// points to, and, for the type rule, a struct whose embedded node is not
> +/// registered from this allocation.  When an allocation has several
> +/// registrations, the report names the first one found.

Could you rewrite this in a much more concise format?  If you look at the
other semantic patches, you will see that they only have a line or two.
We don't need a description of what each rule does.


> +///
> +// Confidence: Moderate
> +// Options: --include-headers-for-types
> +
> +virtual org
> +virtual report
> +
> +@initialize:python@
> +@@
> +seen = set()
> +
> +@alloc depends on org || report exists@

Since you only support org and report, you don't really need depends on
org || report everywhere.

julia

> +expression x, e, e2;
> +identifier fn =~ "^devm_k[mzcr]";
> +position p, q;
> +@@
> +
> +x = fn@p(...);
> +... when != x = e
> +(
> +misc_register@q(\(x\|&<+... x ...+>\))
> +|
> +cdev_add@q(\(x\|&<+... x ...+>\), ...)
> +|
> +cdev_device_add@q(\(x\|&<+... x ...+>\), ...)
> +|
> +video_register_device@q(\(x\|&<+... x ...+>\), ...)
> +|
> +video_register_device_no_warn@q(\(x\|&<+... x ...+>\), ...)
> +|
> +__video_register_device@q(\(x\|&<+... x ...+>\), ...)
> +|
> +v4l2_device_register@q(e2, \(x\|&<+... x ...+>\))
> +)
> +
> +@allocdecl depends on org || report exists@
> +identifier x;
> +type T;
> +expression e, e2;
> +identifier fn =~ "^devm_k[mzcr]";
> +position p, q;
> +@@
> +
> +T *x = fn@p(...);
> +... when != x = e
> +(
> +misc_register@q(\(x\|&<+... x ...+>\))
> +|
> +cdev_add@q(\(x\|&<+... x ...+>\), ...)
> +|
> +cdev_device_add@q(\(x\|&<+... x ...+>\), ...)
> +|
> +video_register_device@q(\(x\|&<+... x ...+>\), ...)
> +|
> +video_register_device_no_warn@q(\(x\|&<+... x ...+>\), ...)
> +|
> +__video_register_device@q(\(x\|&<+... x ...+>\), ...)
> +|
> +v4l2_device_register@q(e2, \(x\|&<+... x ...+>\))
> +)
> +
> +@embeds depends on org || report@
> +identifier S, f;
> +type T = {struct cdev, struct miscdevice, struct video_device,
> +          struct v4l2_device};
> +@@
> +
> +struct S {
> +  ...
> +  T f;
> +  ...
> +};
> +
> +@bytype depends on org || report@
> +identifier embeds.S;
> +struct S *x;
> +identifier fn =~ "^devm_k[mzcr]";
> +position p;
> +@@
> +
> +x = fn@p(...)
> +
> +@script:python depends on org@
> +p << alloc.p;
> +q << alloc.q;
> +@@
> +if (p[0].file, p[0].line, p[0].column) not in seen:
> +    seen.add((p[0].file, p[0].line, p[0].column))
> +    coccilib.org.print_todo(p[0], "WARNING: devm_ memory registered at line %s as a device node or a v4l2_device; an open file outlives unbind" % q[0].line)
> +
> +@script:python depends on report@
> +p << alloc.p;
> +q << alloc.q;
> +@@
> +if (p[0].file, p[0].line, p[0].column) not in seen:
> +    seen.add((p[0].file, p[0].line, p[0].column))
> +    coccilib.report.print_report(p[0], "WARNING: devm_ memory registered at line %s as a device node or a v4l2_device; an open file outlives unbind" % q[0].line)
> +
> +@script:python depends on org@
> +p << allocdecl.p;
> +q << allocdecl.q;
> +@@
> +if (p[0].file, p[0].line, p[0].column) not in seen:
> +    seen.add((p[0].file, p[0].line, p[0].column))
> +    coccilib.org.print_todo(p[0], "WARNING: devm_ memory registered at line %s as a device node or a v4l2_device; an open file outlives unbind" % q[0].line)
> +
> +@script:python depends on report@
> +p << allocdecl.p;
> +q << allocdecl.q;
> +@@
> +if (p[0].file, p[0].line, p[0].column) not in seen:
> +    seen.add((p[0].file, p[0].line, p[0].column))
> +    coccilib.report.print_report(p[0], "WARNING: devm_ memory registered at line %s as a device node or a v4l2_device; an open file outlives unbind" % q[0].line)
> +
> +@script:python depends on org@
> +p << bytype.p;
> +S << embeds.S;
> +@@
> +if (p[0].file, p[0].line, p[0].column) not in seen:
> +    seen.add((p[0].file, p[0].line, p[0].column))
> +    coccilib.org.print_todo(p[0], "WARNING: devm_ allocation of struct %s, which embeds a cdev, miscdevice, video_device or v4l2_device" % S)
> +
> +@script:python depends on report@
> +p << bytype.p;
> +S << embeds.S;
> +@@
> +if (p[0].file, p[0].line, p[0].column) not in seen:
> +    seen.add((p[0].file, p[0].line, p[0].column))
> +    coccilib.report.print_report(p[0], "WARNING: devm_ allocation of struct %s, which embeds a cdev, miscdevice, video_device or v4l2_device" % S)
> --
> 2.43.0
>
>
>
