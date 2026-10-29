Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793271521;
	b=Ad66+j6ePOfZf7ObvExVpYUR6KFUdHm1p6R9X6Vi607rYTcKkrvNa/3nldoEFVxmDRSp
	 RLmN5GH5VHJMc2MvPTHPqaHHWfeW0GC1GPDraN95nytE9jxjYHvERqMch5PDVv/lndXwb
	 2d+iUBXcXKBHy9TESwqQcghZ3qLaCghgG5+2EhyJMFs8GorspLM+k6+LU388ckRq5S6/O
	 eG3fiX8iy7zbUUylZAZmE1ZSuxn+jqZLOY7r+ofM7xMaNmSGSeFP+EAqryBKhwsK+eLmR
	 zh9ydbKWrtszXPTNdLaOwU73i4pET/Q3czmnq8Ltc83z7APLLVjjEDpv7VDnNPK3XvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793271521;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=X5o773++mwT3uSLU37zneVS9LeC6D/lK4D8zIjP2uQA=;
	b=0COqATjKtWEOsoUjXSzQwKKVjTu6CRmxAKVQgCSffGAzU6W2JYNNL0x0pVYfyd98CTaF
	 7/WF2fAkN2nkXMXRZBjWLT3q7pCDFvZwfDUl4L/dziSJr2A7Jv5+sR0d87lXZHdRoUHyV
	 t5pGTFkw69vEOFsQoCB56Ax3cY9aS7TGE/AUYItDKtfg0AuKYDKT85wcZ/Pe5QNXbIgwx
	 ajZv46+YZcS8qtkhFIGgDsuD09jDvRPWBv/QMYeXcwbCoOZgtbc2WwSDB0cX8oMM0Uvfk
	 lKU3HlcNPsGZr6KxTtwn/9O+hZzhgrlN7Fnj9A9UNbch46tg2Jz4UG1+64YNCSiZXng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LGEug0Dv;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C44BE606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:58:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C44BE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LGEug0Dv
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so21676935e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 03:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793271519; x=1793876319; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X5o773++mwT3uSLU37zneVS9LeC6D/lK4D8zIjP2uQA=;
        b=LGEug0DvNTNZbzIRFCEUyVniWRLhjIJYjRAWKhDEseAJQbvri1chu8PGnyhfD9WvOP
         gd1KWKJb4a0VNQ3pFUSu8m6ELFeIZG41IxGq3H71c4DW2fgfO1zuBw9XW29J2fNw7RjG
         piXrjzAgZMKMrvwv3Zz9e+xwsacnPCdKsPVQAWYWcTpAIBOl2jx8EgwZEVchBmgyIByf
         pWNs9GF4rmPmei2FBAoCu9tsocnCfMghx/Q02g0Q2XfFgZOyYhNBK3qWz+hXnkBjseeU
         qdky55nJu7eLIYXrbGz7KncYeI+Bgp4eykN/ofqr/3VIhnv4Ux6/SXgWPDcuHYFjKkjK
         HZgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793271519; x=1793876319;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X5o773++mwT3uSLU37zneVS9LeC6D/lK4D8zIjP2uQA=;
        b=ZFuBjE2xQg/hSZFK+l0B3iodIuF3No9k3iJ6eKli5vc5vB2TU/7LHKHIiCD0/p7BvJ
         +s94RKZuWqdNnVCaMDeUPAWn4o4PC+M+rqWeO5MJFVElK2qfFwXbqpQaJeaQO3crfM92
         dUL80ZvHgsTJ+ZtWh4kz9eBuRCtVb9fOIwzi3c0Vz47Hz2X++jXeUPuf6a5sHa2ImSJk
         X9hMxvrTZEwhSKvhqjTLPmory7KIFwCcs9ajsgQ2CpIWDfDgmqa4FTzCo8OfJr9TvIc5
         lAK2N1PETJd/SLSECw9dR+I+NgcXC0CFbRhmgixNujeS7FO4Iw2J/qkELo3HrH9zenzM
         fTtw==
X-Forwarded-Encrypted: i=1; AKwUvBwm83rRThhfaysOmukdwBYCGdWAWsHahDtg3ID6h2nsJJuG/GYvP3X12b98h1pI16vLbobjZR02EWzdOu4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJKOOsyUJ1N2d0FZnsnkFkV/ito57z88U+lHMGXFTMhV8i2vrO9
	2AXNbZVQ0HQd0cqcIynHG7MrQayEwj9Ahx4/mEZvClYY2UF6ixvkW77X
X-Gm-Gg: AYBFou1yJd90+wqLH81popTprQ6HE3QrY58Vb2x+x77UqvIcuOl2h0iDOgsW9+xMOBH
	nBQbD6Nh2fgrVZTFQwTcXoxgcBdy5jULh5gfJ/enMKDQdzf+8w1WixMsCjTdFkiuJlk1h8A96FS
	V6c6FInMezb84ziZKpAkCjK37ZOCTTBVPaZYAPDrUsPN24k1nsYCG6R/0ikPz6gbbQmOss155Dv
	+uVqGXJGegogPtqnkOA7Lca1PvJOeDEXWLZ0Ru+z+NWtKcNeJXBngO+vSkICO9Ay2ES676QEGhp
	7MizcJOFl4SFN0f6dm6zCPZrpPvWT4m4JPXexV+IHI4WZ9KqqhJ5es8A2qx9Esa41y9/fmLXkzU
	vdecQ/ARhr+Yq6jtNMnOkI9xdSrmCi+ICL6PHYfgvzNKHYIbEbjVejb0VinyqCWZR+8GiqFF3Bl
	evalePT657iSjzSzbXNruldQhI1v/q4ljQjVJ0GoJjK7dtAeMPC3t3cvcwjFtDSdaw2q4Y7+wZy
	4GUfRImBA2tF0gGA8t2lnAqnp4UpJPFj6xa7CoLcG6awZFn515lnt88cwpDJ9vuTe6Sf6oR1ogR
	m58+OquPzlBTYVRavkzeU8UK6ye3dg0qPTiVbFqEz2Ce+uu5rJkDwo3wCIA/oIOF+Q==
X-Received: by 2002:a05:600c:b8a:b0:4a2:b89:b02 with SMTP id 5b1f17b1804b1-4a96667c848mr107992545e9.10.1793271519118;
        Thu, 29 Oct 2026 03:58:39 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a966a56abesm77103115e9.0.2026.10.29.03.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 03:58:38 -0700 (PDT)
Date: Thu, 29 Oct 2026 10:58:37 +0000
From: David Laight <david.laight.linux@gmail.com>
To: wen.yang@linux.dev
Cc: Joel Granados <joel.granados@kernel.org>, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 00/39] sysctl: replace overloaded extra pointers
 with typed bounds and context
Message-ID: <20261029105837.2f8bee67@pumpkin>
In-Reply-To: <cover.1793204511.git.wen.yang@linux.dev>
References: <cover.1793204511.git.wen.yang@linux.dev>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
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
Content-Transfer-Encoding: 7bit

On Thu, 29 Oct 2026 00:34:39 +0800
wen.yang@linux.dev wrote:

> From: Wen Yang <wen.yang@linux.dev>
> 
> struct ctl_table describes an entry with data, maxlen and, until this
> series, two untyped misc pointers in extra1 and extra2. Those two pointers
> have accumulated at least seven unrelated jobs: a fixed bound, a bound read
> through a pointer on every call, an object or namespace pointer, a small
> integer cookie encoded into the pointer, a lock signal, NULL standing for
> "no bound", and a value the core itself casts to unsigned int while
> validating a u8 range. Nothing in the entry says which job applies, so
> readers infer it from the handler, and the core gets it wrong where it
> treats extra1 as an unsigned int.
> 
> The numeric half of this change is the direction Eric Biederman asked for:
> 
>   You can still save a lot more by turning .extra1 and .extra2
>   into longs instead of keeping them as pointers and needing
>   constants to be pointed at somewhere.
> 
>   [...] I don't see any reason why you want shared
>   constants for such a handful of things.  Especially when
>   it has proven to be error prone in the past.
> 
> min/max are plain unsigned long members, so the comparisons are ordinary
> C and cannot be confused with a pointer. The shared const arrays that only
> existed to give those pointers an address (sysctl_vals and
> sysctl_long_vals) are removed as well.
> 
> The tree already records this direction. fs/proc/proc_sysctl.c documents
> extra1/extra2 as "extra pointers usable by the proc handler routines" and
> carries:
> 
>   XXX: we should eventually modify these to use long min / max [0]
>   [0] https://lkml.kernel.org/87zgpte9o4.fsf@email.froward.int.ebiederm.org
> 
> This series completes that TODO and removes the comment.
> 
> priv is this series' addition: the same pair of fields also hides handler
> context, which a numeric bound cannot express, and keeping it out of data
> is what removes the restore-before-delegate pattern.
> 
> The overloading is also a memory-safety hazard. The obvious alternative --
> keep handler context in data and restore the value pointer in each handler
> -- needs an original_data field in nine addrconf and two devinet handlers;
> one missed restore turns a user-supplied integer into a write over a kernel
> pointer. nf_log reaches the same problem from the other side: it replaces
> data with a local buffer inside a single handler, so data means two things
> within one function. This revision removes that temptation instead of
> managing it.
> 
> The core is not exempt. sysctl_check_table_array() reads
> *(unsigned int *)table->extra1 to validate a u8 range. That is only correct
> while every u8 entry happens to point extra1/extra2 at an int or unsigned
> int; a long bound, a context pointer or an encoded integer would be read as
> four bytes of the wrong object. No such entry exists today, so this is a
> latent class rather than a live bug, but the invariant is untyped and
> unchecked, and nf_log already encodes an integer into extra1.
> 
> The refactor is the first five patches; they define the replacement
> contract and prove it covers every entry shape the tree uses today.
> 
>   1. min/max hold numeric bounds by value, and priv holds handler context.
>      The range converters read min/max whenever extra1 and extra2 are
>      clear and keep reading the pointers while they are set, so existing
>      callers keep working while they migrate and no parallel handler API or
>      renamed symbol is introduced. Signed handlers read the bounds as
>      signed longs, an absent endpoint is the type limit rather than NULL so
>      zero stays a real bound, and a run-time range is refreshed before
>      every call. Registration rejects priv on a standard handler.
> 
>   2. The debug test module is converted to numeric bounds as the first
>      user.
> 
>   3. KUnit coverage for numeric bounds and the handlers that consume them:
>      full type ranges, one-sided and zero bounds, entries without backing
>      storage, explicit handlers for arrays and members, and rejection of
>      writes that would partially commit.
> 
>   4. KUnit coverage for run-time ranges across the scalar widths and
>      jiffies, run-time bound pointers, sibling bounds, typed context, owner
>      derivation, bool, registration lifecycles, and simulated per-net
>      duplication.
> 
>   5. KUnit coverage for priv: a standard handler must ignore it,
>      registration must reject it with a standard handler, and
>      re-registration must keep both the value pointer and the context. The
>      same patch moves the debug module's dynamic-value entry to the
>      data/priv shape.
> 
> On the CTLTBL_ENTRY_* constructors: I kept the naming and argument order you
> suggested while reworking the series. As it turned out, no production table
> needed them -- the converted entries read naturally as designated
> initializers -- so I have not introduced them as a public API in this
> version; the KUnit file keeps an equivalent constructor privately, so the
> tests stay readable. I still think the public version is worth doing, and I
> would be happy to send it as a follow-up once there are real users, so the
> API and its callers can be reviewed together.
> 
> Everything after patch 5 is migration and adds no new contract. Patches
> 6-32 convert the remaining users and derive owners from their backing
> storage. Patches 33-38 move handler context onto priv, one subsystem per
> patch; each of those files is touched exactly once and goes straight from
> the old pointer field to priv, with no intermediate data-as-context step.
> Patch 39 removes the extra pointers and the compatibility read.
> 
> The parport conversion illustrates a concrete problem with the overloaded
> fields. In the base tree, registration overwrites the spintime minimum
> pointer in vars[0].extra1 with a port pointer. The range handler can then
> check a write against data from struct parport instead of the intended
> minimum. Moving the port context to priv and using numeric bounds also
> corrects this existing bug. A separate fix can address it independently;
> this RFC does not depend on that fix.
> 
> Entries that used a *_minmax handler with neither extra pointer relied on
> NULL meaning "no bound". They now state their type limits explicitly to
> preserve that behaviour when the pointer path disappears. These include
> aio-max-nr, acpi_video_flags and nmi_wd_lpm_factor.
> 
> Owners that can still be recovered from data are deliberately left alone:
> ipvs, neighbour, the fragment reassembly handlers, vsock, mptcp, rds and
> smc keep using container_of() on their backing storage. priv is only for
> entries where no such derivation exists. Mixed placement in data and priv
> was considered and rejected because it recreates the guessing problem this
> series removes.
> 
> Relative to the base tree, the final state removes all 841 extra1/extra2
> assignments across 123 files, removes the shared sysctl_vals and
> sysctl_long_vals arrays (21 references), and states bounds at each entry
> (~574 new min/max initializers) instead of pointing at constants. The
> sysctl ABI is unchanged; the parport spintime minimum is corrected as
> described above.
> 
> The cost is 8 bytes per ctl_table entry on 64-bit (56 -> 64) and 4 bytes on
> 32-bit, because priv is appended; the range read path gains no indirection
> and the migrated entries no longer dereference a bound pointer.

Can you remove the little-used 'priv' parameter by making the extra
information just follow the table entry (nested structure) and have
the relevant functions use container_of() to get the outer structure
and extra values?

David

