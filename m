Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 612FB492E41
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 14:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789048877; cv=pass; b=QPemrclorm52u2QYkRE3yuMSrp1Ux2LyOL0ZU8JliUZ9g5M5fTGsFnsKPv7AaXv8hko3J1oBxmHbT89hLVJF0BvMRVC3BpUK4p2UWwgMkWLdzEX74qRQcbkmY13JLuLPWvZm7sljNxVGRvHIYgr1SeqEeB237uJH9bP4pNqyAGo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789048877; c=relaxed/simple;
	bh=hb5xFz0VmtKNzhSaRYKfyhLkgWmyDgi4aahOrSlGDi8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p2lGCJ3WrdNmPk5cW3UaNdAsYl/QIxESL7PZ4One0D5dLMdwBCrpIqM/igWBzVQtcA7OTXKA933L4sFk+FCq1JaOloMQTptOWFnn63P08qiEfYRZm8xDbzt/qSWC0J9v7EMLzlgeGw05ALQ/3MK8Wlmii195T7NFfW07ipM7ZLY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yjn-systems.com; spf=none smtp.mailfrom=yjn-systems.com; dkim=pass (2048-bit key) header.d=yjn-systems.com header.i=@yjn-systems.com header.b=VbcIL5Gg; arc=pass smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yjn-systems.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=yjn-systems.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yjn-systems.com header.i=@yjn-systems.com header.b="VbcIL5Gg"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4859b45abadso643834f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 07:01:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789048873; cv=none;
        d=google.com; s=arc-20260327;
        b=J0CG7jCNck3TxsozC9gfAIn4woEs8dPdkrpbrUcr3kBh64noWy6yml3ad6eS343ylr
         jy0EFOBwB3n55nNRB2suuulpR6ketqFo1X12HYsuIhs1MLiVvr6CVI2LsGWdCVY/SCL/
         WwAY+k7XVPTwX5eAIEnFu3X31EW4JA4m4dp3xmxC/P9Ve/OCfA9IvPDtOcQeyMHxFmEa
         h90SpgesimcP+I3RrCHKxDrhwN2SXDon8nUUuOyItulEwA7wmLvoIIMf0XFT4uISlk1U
         E9OvPvImKXn2NNATNzowqSLgId1C1uZgPB0Cm1VCs4Xurwu/slnAHs9jmMvjaGkr1XHV
         e+LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bWyR+1Kihv9X2hNbcd3q6wgSosr6MGZiLnq8iGd24zM=;
        fh=m4qchIamXz3fca2sWNGB+iC+UlJHDvvIIUXj9BJCHb0=;
        b=CMA6IUjzDWVZSGNYITiGAzwv/GTFMCVMSnATxVGLH1OFwHwoCuB1MXXiIIssSTHG6S
         iz8e8qxJyrhcrQXT4I8U52cVFIvtQ1OkFaJo+hy9kGLY03nAxH6+/Ek1pdwps6yV6WrA
         9wiWsJhjARZAwKtFMo8+llqpcoIFHKT3+sKmTg5ysFj/Xr/bxZ/WmuDxABjgShlIpqkX
         BX6NTw1RaVZ/8cY79vW72smzMAheJY6ppmKSJxJTGn4TYy3i/o6Q96MNhvla5YwKR44s
         sko0qdOSuT0L/W4yu54dfDMyRL2IoogkpGG0j2qnsdFt01tT8Yb4RpNaDbbToLbAQ4tP
         PVtQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=yjn-systems.com; s=google; t=1789048873; x=1789653673; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bWyR+1Kihv9X2hNbcd3q6wgSosr6MGZiLnq8iGd24zM=;
        b=VbcIL5GgN/myPYxa25WZiFPrOyErnIZdu7zDeyk6K0W9DrfdBuCYKZykD51W5aI7i9
         LWI4DmgsP2EV5NMr2YgU6PXCzQ11qgCadw8e8MteiaWctt3zfPePTipf6ncYc7e0IfjZ
         NEg3AEv4x9JFjzJPd0r2LVPiBYMEVz+O0MBWEIs1sQMA70CWDok6LKpn5+FH81t41uW/
         K3h6fh+BwGVBAmXziji4jYhhD1nWNPeUiHhqGXZMqno/WI+Us9MHZykYmk/YHLcGjH5e
         4vO+qU7Xe7N9MgA5enbYd6QC7GhH/H9Ddfayb0Rx+j5ivfXOwY9i24YlZSuTA9osREhh
         iFCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789048873; x=1789653673;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bWyR+1Kihv9X2hNbcd3q6wgSosr6MGZiLnq8iGd24zM=;
        b=ZbsGW12EgeshtWnjhlbiRv+bgqLpG17QfsUCmvSunkS9o01nxsClvpkjdKLuY45McY
         Qng+Gj9ssnXu42AiGabRxz23tCdNzkXjDGfM3PiVJxwByTxMp5VBDwBHmWBUXDzdvY5a
         hXCHxkBEQUu69pWD8wUBvLUtTWuYXUp0PJrRiczdtlzKwYNg5YnjrVYtiFS9NjuQtPnT
         mJxpf/6MXk30KQ6IkhokG0sDpasbvit/8X11iQf/OkAYUk1rQcHjcU4QX55gqefMZwdO
         kigvFSF+9MTag26WE/eukri4yy9LGkewwSbyqAXmK5pilXMShsVoeUYhSbxZJTTM9lX4
         pidA==
X-Forwarded-Encrypted: i=1; AKwUvByGf+LERRm23ktwQaXiH05k/o4DxxixaQAz3QemvJW/bKkCB+1qgpn+9f54TgWfF/XCiLcsmSlAxgtv3uU=@vger.kernel.org
X-Gm-Message-State: AFuF++nnOKJaLbcfLQpoWsH40s03iYQxliIDyuVb2nL76auGLE6q2yyu
	h39lg5+4Gis9ke739oUNB96ARY7wTf1NnYZ4dHXgvdJwcXWYsXC6civ7Fi+5dUPfxIJ7a8OeH2U
	AjImOR3qpu1Jp2FhJlFiy6aBH4tAuqitemjQabmwku2w=
X-Gm-Gg: AYBFou0Lu7qiYIPR6JUFHxuXjhlzy9vGVl5BC9dxuLio61B94kbMX7P+oI7DccCMonR
	105tvnXMD/n777eyK81eKWN9EOWP6utjaO7fdpDAHbZymk/cq80ed+V1J25gPvsxRLAl6ns0e3Q
	0RzT7YN2jRUsGaiLOBGn+KI0T12UfSa4+5LLw+fFX3rIactD8HdkXSGjfPA9wZbJlEQYUB2hlU9
	0hgFddg+5ec64cojDvwUycPFl6ZQ1T1Fp6n4D5RuyK0SVQckGp9u+5G8Sl0YhP4RhtW+ohzp1iI
	uL6BLxN7JWqcVrsBleAUn4RT2Up3DnLn5K+GLDXc8UTUqHKaCHiPZLK6a2vXCmInIr5ZSIiOAz/
	mkOJN4u7Wrnk=
X-Received: by 2002:a05:6000:25e3:b0:484:3732:c26e with SMTP id
 ffacd0b85a97d-4858708e659mr42564856f8f.3.1789048872953; Thu, 10 Sep 2026
 07:01:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260720191146.21473-1-yjn@yjn-systems.com> <4665e150-3ce3-4b63-949b-1f0210894e4b@app.fastmail.com>
In-Reply-To: <4665e150-3ce3-4b63-949b-1f0210894e4b@app.fastmail.com>
From: Jasper Niebuhr <yjn@yjn-systems.com>
Date: Thu, 10 Sep 2026 16:01:02 +0200
X-Gm-Features: AcwNN1WavkVlTRmngTXYqa35rrsO7WJLyp_-HcNZcOJGsPp7HW7qWNAvr5bGAgg
Message-ID: <CAMjCObu0oNTEKrBy+M1QCMfLPFKf+eKd8M7xJsWfECosZzzrbw@mail.gmail.com>
Subject: Re: [RFC v3 0/5] Bootpatch-SLR: Randomizing Linux Kernel Structure
 Layouts at Boot
To: Ard Biesheuvel <ardb@kernel.org>
Cc: linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Kees Cook <kees@kernel.org>, franzen@sec.in.tum.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 12:29=E2=80=AFPM Ard Biesheuvel <ardb@kernel.org> wr=
ote:
>
> Hello Jasper,
>
> This work looks very interesting, thanks for sticking with it.
> That said, I think the path to possible upstream inclusion is
> rather uncertain, given the intrusive nature of this work.

Hi Ard,
Thank you for your input!

While I expect a long way there, I envision a SPSLR that does not impose
any other compatibility constraints than RandStruct does. Just the same
layout-insensitivity that RandStruct has put to the test over the last deca=
de.
So I wouldn't call SPSLR more intrusive, just scarier :)

> On Mon, 20 Jul 2026, at 21:11, York Jasper Niebuhr wrote:
> > Hello,
> > this is the third RFC version of Bootpatch-SLR. The previous RFCs were
> > sent to linux-hardening; this version is also sent to LKML for broader
> > review. Compared to RFC v2, it uses a new GAS feature instead of a
> > dedicated assembler inside the compiler plugin. Additionally, it
> > introduces the Sanemaker validation framework. This version rebases
> > BPSLR onto Linux 7.2-rc3 and resolves the boot failures that prevented
> > earlier rebases.
> >
> > RFC v2:
> >     https://lists.openwall.net/linux-hardening/2026/06/20/5
> >
> > Changes since RFC v2:
> >   - Implemented GAS fieldlabel feature to label immediate instruction
> >     operand bytes.
> >   - Removed pinpoint instruction pin assembler. Metadata now links
> >     directly against fieldlabels emitted by GAS.
> >   - Implemented Sanemaker validation tool and integrated it into the
> >     kernel.
> >   - Rebased Bootpatch-SLR onto Linux 7.2-rc3.
> >   - Excluded some RCU fields of task_struct from randomization to
> >     prevent boot crashes on new version.
> >
> > Bootpatch-SLR enables per-instance structure layout randomization for
> > distribution kernels. While GCC's RandStruct pass randomizes layouts at
> > compile-time, every machine running the same kernel image receives the
> > same layout. Bootpatch-SLR applies comparable randomization during boot=
.
> >
>
> I take it this means that DWARF debug data and BTF typeinfo are no longer
> usable on such kernels? If so, how does that impact BPF?

Yes, both DWARF and BTF are currently unusable on these kernels. But I thin=
k
that this can be changed. For example, the SPSLR runtime could patch the BT=
F
BLOB in memory to reflect the new structure layouts. Adjusting DWARF debug
info to dynamic layouts should not even require runtime patching. Instead, =
the
DW_AT_data_member_location DIEs can be based on DWARF expressions
rather than constants. For example, give a static variable
"struct_S_field_x_offset"
that holds the runtime offset of a field:

    DW_AT_data_member_location:
        DW_OP_addr        struct_S_field_x_offset
        DW_OP_deref_size  4

should naturally yield valid debug info at runtime.

> > A full architectural overview and additional resources are available at=
:
> >
> >     https://spslr.yjn-systems.com
> >
> > At this stage, tooling is only available for x86_64. It is based on
> > Linux 7.2-rc3. Bootpatch-SLR currently randomizes most of the
> > task_struct. A few fields are exempt from randomization because of
> > current implementation details (see v2 cover letter).
> >
> > Bootpatch-SLR requires a custom toolchain based on GCC 16.1.0 and GAS
> > 2.46.1. GCC is extended to provide access to COMPONENT_REFs that are
> > usually folded inside the parser.
>
> How does this impact codegen and optimizations in particular? I suppose
> keeping individual field offsets patchable results in missed optimization
> opportunities? E.g., GCC may combine adjacent struct member accesses.
>
> It would be good to get some numbers in terms of code size increase in
> general, as well as I-cache efficiency on some representative benchmarks.

The following numbers are all based on defconfig (+CONFIG_SPSLR) with
task_struct and cred randomized.

Enabling SPSLR grows the vmlinux binary from 54.9MB to 63.9MB. Of this
9MB increase, almost everything (rounded to one digit after the comma,
literally also 9MB) is the metadata emitted by pinpoint. Before you get a h=
eart
attack now: 93% of that metadata is the string table containing the struct =
and
field names of the randomized targets, because that table is not deduplicat=
ed
between CUs. I should probably fix that :-) The remaining 7% will likely al=
so
become smaller soon, because the metadata format currently uses exclusively
64 bit fields for everything and I want to get rid of all the CU-local stuf=
f.

Regarding code size specifically: the combined size of .text and
.init.text grows
by about 0.2% when enabling SPSLR. For a total of 10487 instructions pins,
the code grows by 42798 bytes that are not attributed to one of the new sou=
rce
files in kernel/spslr. That constitutes an average 4.08 bytes per instructi=
on
patch site, which makes a lot of sense given that the vast majority of
patch sites
turn:

    48 89 ab 34 12 00 00   movq %rbp, 0x1234(%rbx)

with a total of 7 bytes into:

    48 c7 c0 34 12 00 00    mov $0x1234, %rax
    48 89 2c 03             movq %rbp, (%rbx,%rax)

with a total of 11 bytes. The remaining 0.08 bytes are then caused by chain=
s
of multiple offsets that have to be added, or by the instrumentation of
displacements that used to fit into a single byte but get 4 byte patch-site=
s
anyways.

To measure the impact of this code size increase on l1i cache efficiency,
I ran lmbench's lat_proc fork in a minimal busybox userspace in qemu, all
pinned to the same CPU core, based on 3 different kernel states:

- baseline kernel without CONFIG_SPSLR set
- kernel with CONFIG_SPSLR set, but "nospslr" set on boot
- kernel with CONFIG_SPSLR set, and SPSLR actually applied on boot

The second one served mainly to avoid falsification of the results by the
different effects that CONFIG_RANDSTRUCT_PERFORMANCE aims to
avoid.

Across all 3 experiments, the run-to-run noise within each setup greatly
exceeded the discrepancy between the setups. That applies to lmbench's
raw latency results, as well as perf's statistics for cycles, instructions,=
 l1i
cache misses, and the ratio between them. I came to the conclusion that
syscalls like fork simply do too much besides accessing some structs for
the dedicated patch sites to make a real difference. On the other hand, I
think that some kind of synthetic micro benchmark can not be reasonably
used to measure l1i cache efficiency, because its entire code just ends
up in the cache when it first runs and then remains there.

The really neat thing is: patch-sites do not need to stay in their own
instructions.
I designed the fieldlabel mechanism to allow something like:

    movq %rbp, fieldlabel(0x1234, .Lspslr_ipin_42, .Lspslr_ipin_width_42)(%=
rbx)

So there is nothing preventing the patch-sites from being inside the actual
memory operands. And if we are talking about access chains, the addition
of multiple offsets can be done at patch-time. The result can then also go
directly into the memory access operand. If everything goes according to
my plan, v4 will offer a significantly better foundation to build something=
 like
this on.

> > The custom GAS provides the new
> > fieldlabel feature used to annotate encoded instruction patch sites.
> >
> > An example for the fieldlabel feature is:
> >
> >     movq $fieldlabel(8, .Lspslr_ipin_42, .Lspslr_ipin_width_42), %0
> >
> > This causes the custom GAS to put the .Lspslr_ipin_42 label directly
> > onto the bytes encoding the immediate value 8. It additionally defines
> > the .Lspslr_ipin_width_42 label to be the size of the immediate field.
> > The metadata emitted by the Pinpoint plugin directly references these
> > symbols to specify exact patch-site locations.
> >
>
> Does the fieldlabel feature have any other uses? Or is this only for
> SPSLR. Could these changes be extended to DWARF metadata generation too?

I am not aware of any debug info or other users that would benefit from kno=
wing
where immediates or displacements are inside instructions.

> For example, it might be useful to be able to capture the SPSLR seed
> (assuming there is one), and feed it into a host tool that can generate
> a matching vmlinux.elf that you can load into the debugger.

At the moment, SPSLR does not have a seed. Though I suppose that would be
nice to have for reproducibility anyways. I will keep this in mind and impl=
ement
some way to extract a seed and perhaps a boot argument to set it, when I fi=
nd
the time.

If the DWARF approach mentioned above turns out to not suffice, it
would probably
also be possible to use the seed to generate corresponding debug info.

I hope I was able to answer your questions to a satisfactory extent!

- Jasper
