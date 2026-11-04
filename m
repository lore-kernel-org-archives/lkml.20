Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793764147;
	b=grJeRbFNcumwE/dOC3yP3O+tCepUoklOI3ADmX6QJ/Fm4T9OKTmwOMOKWg3toiwX1PUg
	 l7NBdvL8tkNjxIxSoE4sxxGxSnoV7p+HgQWT7EKOwWlu4f+j4dpOYSklM6Kck5ZVGHWGN
	 VxQVtO8IcUFmsH21zwH4bA5RH9wxyydWr42r3IDtr5OGF5Ga/fytZ9tnlRu6+NyIa1ije
	 yzN2998D3788dvZfyu9t6FRxYPbvHDFTdHFR9SsnaBbboe6YEb/+LS/Q01EnE5Drj0jG9
	 WT9CHXKDu1lq4Lj36xj9EkqL4dJX0icxzPQ74mZQcwyu6WGNdXkGZXIOqZcBroKUZ7g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793764147;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=cKWjRS9Xq/l8hl3060rXc9wXNrOk8HsfCBzOk8+AuV4=;
	b=RG7KHraZjyGwmVp/Qrib5+RZNIajF2ervPGe3DfwoFIWoWkhKqf2I3ddKj2CrIa5U6iX
	 OaRNROObsmzAsBKp3c+FP3zo38EX6ccmrMF7+zw3CBMg/DCIsPr9tlXXIkVJk/cBN00UG
	 82Hsjxew2HuU4MfpR/4fDjm1dZpBLFrulyenZUwOaukJWr1JQXksu9P2mQgjGM25l3lD8
	 Ycntxw82r/yTu7n0nJ0mILd05tAhID1ZCg02a7RWr1yqSDtqO6MA+Qn0Y92Ms2vRvi8W/
	 HiUYu0wVDkDn705HFT2lCzPO5RXS5DjUvKWODzbukO6sx9WuYfNBPHMGa8uN6QRRUlg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="Zff7lCr/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.179
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 285ED606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 03:49:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 285ED606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Zff7lCr/
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-535f598d126so98261cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 19:49:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793764145; cv=none;
        d=google.com; s=arc-20260327;
        b=X7hCulwTXoETVrNBnbIpbJlBqkhsRd79KGs+HGWNgKqB6h3kUvVLQz/Z2tCxiAHlJD
         q93JGMqXOCxKp6EsOA5YaFn9HM2v05vCWF1YOPi5mCT14qiU1lC1fMYTpQcvjaoB+2IZ
         Tc4hZkkFznP73NMRUIk3E00JgAYvpC0koW4RaYT1gi8YvwNNWjOlMzVio8ABAOE4bPNo
         68e1pWLVwdHOg0r8IqeBImYdE3h6ofcJi5zvWhDLOJRwGRosvBNx2PZz79wyVUMZ7M9D
         m7n59xhUSXNdx1/JkQ0102npsyIzbCceYgkjJpEJ5RLJ+ynkbXnetMvZYmSEVrs5JwRP
         CDow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cKWjRS9Xq/l8hl3060rXc9wXNrOk8HsfCBzOk8+AuV4=;
        fh=64xsrzjdfMLHylkCQVNnZfEWmWb5/lmZV9AccF56cmM=;
        b=kSSiL/pvUGP8igjqRywZVHQgZUFkxeg2ypTpzsSyZBh5m0zJgGF9LD9URXm88ZS6F6
         dCmDzbVAwrxEAXF9mPkzfuCOa5E+vEsZPWCE3BjIfudcgBp7vppDWTptws4pcrs3mfyW
         /S4znJXlXG3+geP/fSX5QL8Sc612KpWhmw7opgTRN+qmHmM5pPXDAkk+LKO0VXo4uzQy
         DPnT5EKC0eteLlhWdIBU5VoYpeWSqDj/iXXE9vL0MgKnP3cpzzjX7d0PbmLVL/gzuSrg
         z50nreVNjqQyhPMq0h4XuuNiXoqR3VIGt1hCPyiY4CzdiPqxHkX9EXjVbKo8vdLp70Xz
         tyEg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793764145; x=1794368945; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cKWjRS9Xq/l8hl3060rXc9wXNrOk8HsfCBzOk8+AuV4=;
        b=Zff7lCr/RYzDOMb26mR07xi/YgRsLCknrcp7xuB7uYbEei3iXUJHgJAMS5sDc9s/p3
         e5VGpX9uTqFK3Wdv5gDPAQxvyroQYQfHwlWZlPA58bsPYLpTlyfBcRF4WalCLlkbFevK
         VSjvYCAMvny47vCLyYeWEr0vylVwhyEkDw0z5B8YPPpXD1zmHK9kWfoVCm+6uPTiWp4W
         2jN/qeIPx4hx78uKvP0NOTWfQepDmHq1Pln6bOhyt7nqhnVPCkbcsmrYHjX93TUtWnIh
         RcY3+kfHuG2RPAAWQ7dhhfhgP6QZ4/o2h/vMA3mI4hrEvYdwmBXODg8YOv8Ybn8qgR37
         8TSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793764145; x=1794368945;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cKWjRS9Xq/l8hl3060rXc9wXNrOk8HsfCBzOk8+AuV4=;
        b=h2LryaOPJDxMlBlp7vpzjrVZsyou1TuNzT/EP0v1oKtRf9j4fgrWkgvTu29oIe4IM4
         MflU2Pj7GokbHVXtcoR3Ede4bcX6EY+ilyN9/rvyhK4hwaSRa9L0L3psNWuDXp+HVb82
         58s0L/SzRpsj4k931xTrG6oV1RFiL/VphpwzIubxxX8LTvrAvgMnfZWlXhO+VwOlVBhB
         XPYP4ivfuqagVTPGXFGIhAxF9x/7Poko3W1+Ck0Hlw15ydsB8nx0/RMUzbPzxfU/9IVB
         RuBJgWMYi0NOOUH6Vr9cYR30wtmKNl8Q5wvueuxtS94Sq03qyHlqoHqoSdzjXs6bN/bN
         ZlHw==
X-Forwarded-Encrypted: i=1; AKwUvBz3+qnnDsC2Lnj3uovObAubAAGCXAgz577iR+RnXMfmg/XMXqWYQccEtJ9M2U7G5mJkmEHppZXiDMloSE8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/GKn55NVjjMfQbAtuV0P3bhtUmbgfrFsOv1iUWmgAVI6oYMnu8
	wCudFmavvkaXWdL73CqZ+xk7AeWClK3Dm/yidPjp94QG9KaC4gTUVtsW1kh337b5LbpKCpiganR
	mUXk3JVDMAiM4z7NrTuBqdvFtxr2UmKR8pNNHc3Yu
X-Gm-Gg: AYBFou0QrNguGiJjVArbeGm5WVlVIscJJcTmTORR6CUtCPwLdvOqKC5Gns3ILC1DJBR
	vbPKVoaO+84CQWII+GuMc0trDCvQZETy+q+6UiPjTeJY24Z0RjiLNbwmOfo2GfFOI8cqmPbRzN0
	S6tE/kIhwJdKEUWH5et8dN7ixPF8pR12mDTK9kJyyNe2RZyIyYhu5UirR2vEbvz5O39K50CCc8B
	21jvt4tyi1bWIIWmDamJnH/egrCUu0qWAhqGpJVTdORCY0CiqnTFhrVkLUZKoqrKjDsGzWgjvAi
	hAdjyBZuaXHT3NZFXzoyecCKb5NT273dyAg1Y1BWIL9+6hvkuuXvjqi3VXJaL7fy1Rq2D3ZYEii
	usgrn/auZAK9VGL0vsxxCeBoUu/PQQZpm99omCg==
X-Received: by 2002:a05:622a:2298:b0:546:92f2:7830 with SMTP id
 d75a77b69052e-54b61e27b15mr3087041cf.6.1793764144251; Tue, 03 Nov 2026
 19:49:04 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030202710.3863806-1-irogers@google.com> <20261030202710.3863806-4-irogers@google.com>
 <25216bda-7e36-4bad-ba7c-1984dbb9dfda@kernel.org>
In-Reply-To: <25216bda-7e36-4bad-ba7c-1984dbb9dfda@kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Tue, 3 Nov 2026 19:48:52 -0800
X-Gm-Features: AclHuK8jUTP0fZRLAUdhb4V7KjnS7XAslg-dpWxyxMmrVUFMhhemkzjXApXA5fA
Message-ID: <CAP-5=fXKeqy75_1p9TgrqOgw_Eh8h=U5FB40PQbZhwxczV-CrQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 3/3] bpftool: Prefer zlib-rs over zlib when available
To: Quentin Monnet <qmo@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	linux-perf-users@vger.kernel.org, bpf@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 8:20=E2=80=AFAM Quentin Monnet <qmo@kernel.org> wrot=
e:
>
> Hi Ian, thanks for the v2,
>
>
> 2026-10-30 13:27 UTC-0700 ~ Ian Rogers <irogers@google.com>
> > Add zlib-rs and zlib to FEATURE_TESTS and FEATURE_DISPLAY in
> > tools/bpf/bpftool/Makefile and use feature_rust_lib to configure
> > ZLIB_CFLAGS and ZLIB_LIBS when zlib-rs is detected (unless disabled wit=
h
> > NO_ZLIB_RS=3D1), falling back to -lz.
> >
> > Decompression of kernel configuration (/proc/config.gz) and compressed
> > ELF/BTF sections (via libbpf, libelf, and libbfd) processes data that
>
>
> Is there any mechanism in place that prevents libbpf, libelf, and libbfd
> to link to different versions of zlib (zlib vs zlib-rs, I mean)? I
> imagine you could have bpftool linking against zlib-rs, but the libs
> installed on the system linking against zlib? Also I think the static
> build with the LLVM disassembler [0] passes -lz -lzstd in LIBS and I'm
> not sure how it would combine with the change, I need to take a closer lo=
ok.

Thanks for raising both of these!

1. On preventing libbpf, libelf, and libbfd from using different zlib
   implementations: in libelf.so, libdw.so, and libbfd.so, the zlib symbol
   references (inflate, inflateInit_, inflateReset, inflateEnd, etc.) are
   unversioned. If we link libz_rs.a with:

     -Wl,--whole-archive $(LIBZ_RS_OUTPUT)libz_rs.a
-Wl,--no-whole-archive -Wl,--export-dynamic

   in Makefile.rust (perf already passes -export-dynamic via python-config,
   so adding --whole-archive is actually important for perf too so it
   exports the full zlib ABI rather than only the objects referenced at
   static link time), then ELF symbol interposition binds all zlib calls
   from libelf.so and libbfd.so directly to zlib-rs in the executable:

     $ LD_BIND_NOW=3D1 LD_DEBUG=3Dbindings ./bpftool version 2>&1 | grep in=
flate
     binding file /lib/x86_64-linux-gnu/libelf.so.1 [0] to ./bpftool
[0]: normal symbol `inflate'
     binding file /lib/x86_64-linux-gnu/libelf.so.1 [0] to ./bpftool
[0]: normal symbol `inflateEnd'
     binding file /lib/x86_64-linux-gnu/libelf.so.1 [0] to ./bpftool
[0]: normal symbol `inflateInit_'
     binding file /lib/x86_64-linux-gnu/libelf.so.1 [0] to ./bpftool
[0]: normal symbol `inflateReset'

   That ensures libbpf, libelf, and libbfd all use the same zlib-rs
   implementation at runtime, and means all compressed ELF/BTF/debug
   section decompression in libelf and libbfd also gets the memory-safety
   and performance benefits of zlib-rs even when linking against distro
   shared libraries.

2. On the static build with LLVM disassembler: `llvm-config --system-libs`
   emits `-lz`. Since `LIBS` in bpftool (and `EXTLIBS` in perf) already
   includes `$(ZLIB_LIBS)`, we should wrap `--system-libs` with
   `$(filter-out -lz,$(shell $(LLVM_CONFIG) --system-libs ...))` so static
   LLVM builds don't pull in `-lz` alongside `$(ZLIB_LIBS)`.

> > benefits from a memory-safe implementation. Preferring zlib-rs over C
> > zlib provides memory safety and improved decompression performance whil=
e
> > keeping bpftool aligned with tools/perf (including sharing libz_rs.a
> > when building bootstrap bpftool for perf BPF skeletons).
> >
> > Signed-off-by: Ian Rogers <irogers@google.com>
>
> Recalling our discussion from v1:
>
> >> Hi Ian, bpftool doesn't make an intensive use of zlib (mostly, it's a
> >> requirement from other dependencies; we may also use it to unzip the
> >> kernel config on the host if necessary for probing BPF features on the
> >> system, but only on some distributions). So I'm struggling to understa=
nd
> >> the motivation for your proposal, what do we gain by switching to
> >> zlib-rs when available? I understand this implementation is in Rust, b=
ut
> >> I'm not sure the added complexity and feature probing in the build
> >> system is worth it.
> >
> > Hi Quentin,
> >
> > At my workplace, we are transitioning from zlib to zlib-rs for both
> > security and performance reasons. I'd like to keep upstream tools
> > aligned but they don't have to be, it just seems nice. I agree zlib is
> > of a lower priority to users than, say, zstd. For attackers, like with
> > brotli, it is probably an area of interest. Knowing the implementation
> > is memory safe is at least something in favor of zlib-rs. I sent this
> > series out as an RFC because I obviously have no way to mandate what
> > upstream should or shouldn't be doing. There are things that can make
> > life a little nicer and easier, and this patch series, for me, is one
> > of them.
> I understand you're transitioning to zlib-rs, but the current patch is
> not a full transition, in the sense that it doesn't replace zlib with
> zlib-rs but allows any of the two options; and I don't see support for
> the standard zlib being removed from bpftool anytime soon, which means
> that in practice, we've got to maintain compatibility with the two
> versions going forward. Others may want to chime in, but I'm still not
> convinced this is worth the burden.

Because zlib-rs (via libz-rs-sys) implements the exact C zlib ABI and
headers, there is no C code difference to maintain between the two=E2=80=94=
only
the Makefile selection of ZLIB_CFLAGS and ZLIB_LIBS via feature_rust_lib.
With the symbol interposition above, bpftool (and perf) get memory-safe
zlib decompression across libbpf, libelf, libbfd, and libLLVM whenever
zlib-rs is installed at build time, while still building everywhere else
with C zlib.

> You also mention zstd, do you plan to add support for a zstd alternative
> as well in perf and bpftool in the future?

No current plans for zstd. Unlike zlib-rs (where libz-rs-sys provides a
complete, drop-in C ABI for both compression and decompression and is
already packaged in Debian/Ubuntu/Fedora), I don't think there is an
equivalent drop-in Rust replacement for the full libzstd C ABI yet
(ruzstd is currently focused on decoding, and the zstd crate wraps C
libzstd).

> (By the way, if you allow me a short digression, you had a patch related
> to the zstd probing for perf and bpftool [0] and I don't see in the
> tree, do you know if it was ever merged?)

Thanks for the reminder! That series wasn't merged yet=E2=80=94both you (on
patch 3/4) and Peter Zijlstra (on patch 4/4) gave Acked-by on v2, and I
think it fell through the cracks waiting to be picked up into
perf-tools-next. I'll send out a rebased v3 with your and Peter's Acks
collected.

Thanks,
Ian

> Best regards,
> Quentin
>
>
> [0]
> https://github.com/libbpf/bpftool/blob/main/.github/workflows/static-buil=
d.yaml
> [1] https://lore.kernel.org/all/20260909204122.1993010-4-irogers@google.c=
om/
