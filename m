Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F90F2D592D
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 19:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788809426; cv=pass; b=QF9pkhhSWwocdP5l/PKs2n7NBMkziN66tP8vl8QfjHWTY4d+e1IsnGJQbakMrjoj7hJhSTzR1y5nBk1AdfsI7goIbCJeMIAUPxgmtFbkCL4z+u3KFUGpllLkAg8GvXeevx2qboLFmnJSvB6kGVlQVOVXoX1J7wK9xH2LnDxng2g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788809426; c=relaxed/simple;
	bh=bCLn/45T3z43a5UbSQNp0M6jCxXCgt8SSW1UfiJlaX4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=jPr7mi7jtW1XSbdTN6WymwmQ6XT5MIvGfCCFuTj34J2rjbRTO1ah1wnJmdlRmKkhwKDONaAnGaxFJHTGTHcWBujkA8//35n0884RVXJwMdvOR5Icq9r1LERoOM33b4deC0NB6oyMhWehCO2QZvSjJw22teuRbR2G1WT3CeU3plM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s6LmAs3D; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s6LmAs3D"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6a374bea882so5590916a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 12:30:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788809422; cv=none;
        d=google.com; s=arc-20260327;
        b=MLBLzNiaikW3f3HMc3K8Xyhp5gCoPOpNvCm7u7A7jvckP1W3k6ZYzQ0jcZCcYUbLRE
         pGGYwMuydeCI6nJLNJwAhdG+ov+plyfnSDt3mYTaZGyKIkLc/QMvqglT9C861tfHWFl3
         Tiw23Ao+Y/pHkJbQwneDcJ1EBSJE37x9lejE70Rg93yEc6HGTJDPjACmLXXFv4JaANlQ
         J1tfuTaZkkdqxVoI6NAA6NQZv89Hk6AJ2Yl43SuTVTaB8zgQckUqrnDkV6R37T3u8Z54
         et9KuVU+A0dVh9hVtlGmGsnq40zSx9sTWc/2NRuzUwAwvSFO4imyk8GUSzAP9xr1+IhY
         wYAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :dkim-signature;
        bh=bCLn/45T3z43a5UbSQNp0M6jCxXCgt8SSW1UfiJlaX4=;
        fh=V9AeBafJgTW96HdC48wsxGAfd7Fe9P2uAL8tLCjpUN4=;
        b=jNNIvsBQKwuG87WvUgGZSurEjs2ayM/VSAZOTonCxoV73aNq38/VApJzWwCK4snVXq
         bpv5EXCfLZDCagZSoGGK/e5wWLTUqwGdb3ihhr2Yam6QzWC7gLhtlFKy2g754IiMVGol
         iFT72O4BkEz/WzlYDwp1Fpqvz6nJZzMkn2JXfuRg4RJjlY+14FUZBu5zf7wQxb663G7G
         fPIJvwC/fTvbzxNMvmBh/YIcfHoT8zoPqjlEkY+Dv5Hamta4VpYzXokpYS/20i1cKI5T
         k3+EJ06b4camJcAGjAJXURdTJQLsldG9w/Oa3XjolXDkBPbbH/eNQOmiZ9ZG3pZCl8bF
         i2rw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788809422; x=1789414222; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:reply-to:mime-version
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bCLn/45T3z43a5UbSQNp0M6jCxXCgt8SSW1UfiJlaX4=;
        b=s6LmAs3Drtn1K0pQMRVYmuE3yTCiM9iz7m3tbKodhBSNINXjKD3rN0ghwwXDVErBu0
         MKf3kSf5CZBYqPw+ozMTycR1kytVYpkTV3Bf3WlxEhNxvoQB2osMzWd5hZu0THDrNOAt
         UNwPoBTjK7T3qjEQFIG/NeY2SVuvwTzm7r3TAz7YX+UgEq4aHQnvFU5jzyASSPCN5kV+
         YYxKuRfCm02FDQSzcoK3BZ51bS2/a+q5pbdEcTkqUtuWGweDMKf4oTWkjBznFVKBBbua
         u135I86bpn/Azo8c2mV7KQePx8Sqr8t6HSsqz7y96w6OOoeVroXx4gc2SJitBwmhc6zo
         h00w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788809422; x=1789414222;
        h=content-type:to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bCLn/45T3z43a5UbSQNp0M6jCxXCgt8SSW1UfiJlaX4=;
        b=B3TZ0HbbMun4BfF9uZpl2SbRzF4OBcPAAq18nwWMWWlf1PZV2X6mTgr0y2nyvzCWaT
         jkBijaGGRDtmNOVui6J+7R2TwrBpksbGfIDnJJqrVAj5PqJvDaj3zjRWy+pxwqt586kg
         LfGWjuThsML12ikzbIJbp425dv14jFDNuQE/JNB+dEeUWjCbQ4IBqvM8VOXqYyaCoIbr
         ald39WKoOL3uWrcxkuy1biD1IIKgUMBQO1KhiR3svvAEoVyc9Gl3shjuVOXRtr6HDHqh
         tjGRYL3bwuX19KpaeyNrNdRvVPrPzxL1nruZUkQBLLxuG2ygPfpYLKLjRdH7jmhGiWZ0
         GX/Q==
X-Gm-Message-State: AFuF++nYIfVUZ9BZbiFLIc/REOXa5zmm0ayXFkDj6FzTyM5yZUF7XrRQ
	ULIcYUxFhV2g6OHw2sBa3HmRDPz7TCwcoMUlchugQSj7WKEW8VtKjNMAn270D3e25OG9wKMSwBo
	/5Iw9bnqI2/457h4wpiUbQ9fnwLE+N41Jnw==
X-Gm-Gg: AYBFou2rPLx5PsRGyRol6QQjh8HaHgAYioamoyaHKnSpfpDz0lTMWjIGDDOZBM1UStX
	f4wdbm/igShZrh+QygC3nWVPsRq8vqP+2mmdij36ft2Wy0y0sbViLgosSpzYuo3HjYFG4CIAC+1
	adsOPGO9asCr9LIs85ypMFnQIs6X6jn0x03fOsPIEGyIyRudiJpIUzj1grcrJowpDlT/x3h/DpR
	nmymSpZ/VF7EzuG5MbTwLIXq5ZuFBd9tKVrUHOzKS2vhxS9rHW656dSQQqj5sQ6FyZeU3B7VYna
	+Um8NIPG3+A2aw9aPCqJrqN9VdV/JBaHXSZCUNvO5PO7yCywaAssVSHObXblYPXRUlcs09Y2Q5e
	Kug==
X-Received: by 2002:a05:6402:1f07:b0:698:c13e:179a with SMTP id
 4fb4d7f45d1cf-6a7e8d98839mr16467058a12.10.1788809422133; Mon, 07 Sep 2026
 12:30:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Reply-To: ludloff@gmail.com
From: Christian Ludloff <ludloff@gmail.com>
Date: Mon, 7 Sep 2026 12:30:10 -0700
X-Gm-Features: AcwNN1UBP1PN-t36PufZ4YxxpukFNI922HaA2afUg71K2bWdRgFvv8nz4NHx1gE
Message-ID: <CAKSQd8WX6xH7=njcGZNNFe8m1xbyhCpX-10cZDw+saWJayWQYA@mail.gmail.com>
Subject: x86 evolution for segmentation and paging
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

If x86 segmentation and paging do not concern you,
then you can stop reading.

Get a nice cup of tea or coffee. This isn't short.

----------------------- 8< -----------------------

I have been asked to document the x86 behavior for
a PM64-only PML5-only implementation with FRED and
APX that has been used at scale for >1 year.

Background
----------

After more than two decades of x86-64, Legacy Mode
and Compatibility Mode fulfilled their purpose; it
is time to drop the ballast which they pose.

Five years ago Intel published the first FRED spec
and the dust for it settled in late 2023 and early
2024; Intel just shipped their first products with
FRED, and AMD is expected to follow soon. The FRED
cleanup for flexible return and event delivery was
a crucial milestone in the evolution of x86.

Three years ago Intel published the first APX spec
and the first x86S spec. For the APX spec the dust
settled in late 2024 and early 2025; Intel and AMD
are expected to finally ship their products in the
not too distant future. On the other hand, for the
x86S spec, Intel gave up in mid 2024. Which turned
out to be premature. Someone else continued.

Segmentation Extinction
-----------------------

Poof! It's gone! No more selectors or descriptors.

No more ES/CS/SS/DS/FS/GS segment registers and no
more GDTR/IDTR/LDTR/TR table registers. Of course,
no more GDT/IDT/LDT/TSS then, and no more #TS/#NP.

Gone are MOVs from/to segment registers, and PUSH/
POP for FS/GS, and LSS/LFS/LGS. And gone are loads
LGDT/LIDT/LLDT/LTR plus stores SGDT/SIDT/SLDT/STR.

More remnants disappear: LAR/LSL and VERR/VERW and
RETF Iw, RETF, IRET, or CALL/JMP Mp. That's right!
The combo of FRED and x86S laid a nice foundation.

In terms of the stack frames only FRED's survives.
Without a CS.sel or SS.sel, but the rest is there.

Poof! Legacy Mode? Gone! Compatibility Mode? Gone!

Welcome to the great new PM64-only world, at last!

Segmentation Evolution
----------------------

But wait! Aren't FS and GS rather useful features?

Why of course! So... they evolve! The MSRs for FS/
GS base and the {RD,WR}{FS,GS}BASE instructions do
remain. The existing kernel GS base MSR gets a new
sibling: a kernel FS base MSR, at C000_00FFh. (Not
in use today. Conveniently sits before FS/GS/kGS.)

Wait! What? Both kFS and kGS? Why? How? Well, some
scenarios actually benefit from having two pointer
registers instead of only one. And if segmentation
is gone, then FS and GS become simple entries in a
typical register file; think 3-input adder, or use
of a 2nd uop. Mmh, alright... but... what if I...?

Use both? Well, how about flexibility? In the form
of a simple set of config bits in a FSGS_CTRL MSR?
First, 2x2 bits for controlling whether FS/GS gets
swapped by FRED delivery of an event-in-PL3 and by
a FRED return using ERETU back to PL3. (By default
GS gets swapped but FS does not.) Second, a set of
2x2 bits for controlling how FS/GS apply in super-
visor mode and in user mode. (By default, the last
FS or GS wins; other choices are "first one wins",
"both get applied", and "both get ignored".) Done!

Done? Well, one more cleanup item. A segmentation-
free world means that LKGS, just added at the same
time as FRED, disappears again: the need to load a
base address together with segment attributes just
doesn't exist anymore. (That said, legacy x86 CPUs
could add kFS and the FSGS_CTRL MSR, in which case
they would add LKFS at opcode F3h,0Fh,00h,/6 right
next to LKGS at opcode F2h,0Fh,00h,/6. Your call.)

Welcome to the great new PM64-only world of FS/GS!

Paging
------

Hah! Compared to that segmentation extinction act,
paging is really simple. Legacy 2/3/4 level paging
disappears. Poof! It's gone! All that remains then
is 5 level paging, aka PML5. Oh, and yes, finally,
not only with 4 KiB, 2 MiB, 1 GiB pages (at PML1E,
PML2E, PML3E) but also the previously missing ones
i.e. 512 GiB "half tera" or 256 TiB "quarter peta"
pages (at PML4E and PML5E). It's cleaner that way.

That's it for paging? Well, pretty much. But... of
course... there is one more thing. It's small, but
can come in quite handy: PG=0 a.k.a. auto identity
mapping. That is, the core stays in PM64-only, but
instead of page table walks, you automatically get
identity mapped pages (VA=PA). Now, we do not want
to go back there... but sure... think Real Mode to
get the idea. (And just like in classic x86 chips,
an implementation may decide to auto fill or to do
a TLB bypass altogether. The outcome is the same.)

That's it?
----------

Yes. For segmentation and paging, that's it.

Of course there are other areas of x86 cleanup. In
particular, SMM goes away. The decades old "warts"
of interrupt suppression and #DB suppression do go
away. And x86S did put the fixed MTRRs on the "x86
chopping block" too: the 1st MiB isn't so special!

And then there are two more bastions of complexity
that got tackled: machine checks + virtualization.
For those think along the lines of "x86 is nothing
but a guest running on a native non-x86 host -- so
move them where they belong: from x86 to host...".

But... those are topics for some other time.

Recommendations
---------------

Prepare for a great new PM64-only PML5-only world.

Migrate your complexity to x86 software emulation.

Reject x86 cargo cult. And put away the duct tape.

Closure
-------

I have updated https://sandpile.org/ with details.

Look for those orange EXTINCT and EVOLVED markers.

If you have technical followup questions, ping me.

References
----------

[msg 1] 2025-10-14 "x86 opcode/CPUID/MSR allocations"
https://lore.kernel.org/lkml/CAKSQd8WQDfSax83Fyja0Y_aF-jq+7qfOpDo3GU5bz-8wEVUA1A@mail.gmail.com/

[msg 2] 2026-07-27 "x86 AMX/ACE with >8 tiles"
https://lore.kernel.org/lkml/CAKSQd8WxM75DeZvovYXkt2c60ftHeEW_gpf0qTxaLF8i8kjm=w@mail.gmail.com/

[msg 3] 2026-08-28 "x86 WBINVD prefix allocations"
https://lore.kernel.org/lkml/CAKSQd8VBR87Y_VWDZtB+KmHJJg8SYTWu8qY=ZQUFYmNt6TTJMQ@mail.gmail.com/

[FRED] 2025-06-25 "FRED spec" revision 009 -- migrated to SDM revision
090 on 2026-02-05
https://cdrdv2.intel.com/v1/dl/getContent/819481

[APX] 2026-08-25 "APX arch spec" revision 009
https://cdrdv2.intel.com/v1/dl/getContent/784266

[x86S] 2024-06-25 "x86S arch spec" revision 002
https://web.archive.org/web/20241002150150/https://cdrdv2-public.intel.com/776648/x86s-eas-external-1.2.pdf

[SDM] 2026-06-19 "Software Developer's Manual" revision 092
https://cdrdv2.intel.com/v1/dl/getContent/671200

[APM] 2026-07-29 "Architecture Programmer's Manual" revision 3.10
https://docs.amd.com/search/all?query=40332

----------------------- 8< -----------------------

--
C.
