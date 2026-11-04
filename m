Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793831265;
	b=wM0Z36vs3RiMQsYtVutMcHt9tvc2YqcTdVLHxnf6DGRl+0ZOTs4DJQreZ5Wk9Iu3j81w
	 f4sStdg7DiEQdJ/XClCl1f6mfPDx5nIFON2IHkqp7T9e3jlpMyjSNFiqLMZNccTmlm17Q
	 nZ23HiECnRZKxiy0JshINyqRNWo0zx01vILIfqES1Un8VXi4ZbygrMVSznDvbPwf+WR8+
	 k8s5gCWAvU90geUE2goEZTn0cTd5MFI8xpyuv1IlbA2CdnhhQg3rtMoICKiQPMi40IVtD
	 FnDsl91qAoB9L9MMCaw7DPOGTGkLSgMHEerQlAJV0i8ClFSr7vtLkxK3njXgra2Wedg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793831265;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=TQAK8qbp+bqwH/yA/y8zCNOc+K4W78NBGe/TJCEFsJE=;
	b=EAX68XIzHi5DhhTNlLq9AspR/lkJTbzeRBGE1HEHeXFhLSIbcklJCtDgE/nvCbFwAUwA
	 5/oGdj/qzQLiflM7eDeDBhs8pgi8fYF5ennf6auI4nJn+ylp0N+qgLvNO4LUOb4M88ZNS
	 a8oW7E62YMo9l++dJnp6RMjYcMJKfNEMBThg07WboEznCa41KTFMEM7fz6AqeltXXZyxO
	 j+BKccpErK/oAcEgSc2ohUFVRaljBuUW4vtPE8k2lab9sLHch3HwCSQ4yqbT0ECGDq4BE
	 m6iyuCJtIXJhATXBayszMUVj/lwXWvn8A+d9Q1xsL2nyBv4r+0ubNVtEWcL+qVfLXRg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z7jFY1dM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9869C606A33E
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 22:27:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9869C606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z7jFY1dM
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b56221d361so1258562a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 14:27:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793831262; cv=none;
        d=google.com; s=arc-20260327;
        b=j3rd0Lj4oKduP0Us1SHuRkEUjupHxv0idN27XhDd9bEIwWD9LWMisJTYcGdutv/pAU
         mpoltwU+AsR2q3sblnCzW8UHDF6gkt64PJznfYZ0F8ieaut5Qh8JO6/Qhmmvf9nObKrI
         qLts8uCcep3B08NuTOVeK+S4lpEOcY1rN8g9I0kzpkOqHJaFviQYptYJsGYLkRLdlciF
         Rf4DsCciKucwh+9fgoa4irqULPDfaMOUHhnUbnnZHr1GPL2mFDJ0pDRSEjbmlnWoHnTa
         9X0OeUWxrFsqs3ejSSVbvqKDSA4jOwSYnOlB9VDPofNuco8fRmjMikPO2yN4hBuHgVeR
         TVFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TQAK8qbp+bqwH/yA/y8zCNOc+K4W78NBGe/TJCEFsJE=;
        fh=cbe+oZ5UsafynsYdpPT0wEmUpk+I1AT/6pN+8CO9Ra4=;
        b=WHxs+ftr2uFwUB3XTnj5UddgdkauwBkCo/IgEvaq2AZs5inDtK71fWcSpBYMOSFGOq
         xk0A8LHk7ASXHYotXDwry9mYH3+KnVuDg75y2z6lUI6LjYIlY4Rz7ewwNMwRVuWzoqr7
         7xscNN49oQHZK+WGt/mdoD74be7mTVGKTFe/jasjOl455+HppYr4ladUB8U/NT5ZLGrj
         q0YgfosIdeyh5OxmRWpkveIqP/eoW2xqHAwJ0/TBEt8XkBvw6wa6Zxn/pT+UGJVuUgSw
         D3h3joDBFj7raPR/Abk6UfnyqvQ6o6miZyMwPgTRYukNnlezISg15cAFWN+T3AqIfK2I
         mlgg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793831262; x=1794436062; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TQAK8qbp+bqwH/yA/y8zCNOc+K4W78NBGe/TJCEFsJE=;
        b=Z7jFY1dMUytIuSnGvfmRQhJvNM+YMaogwQ3qYtcCFmxsGzexP46W2pqzZE7uPEM8Mq
         f2yofWN6gBnRqvw9og+QisEgILBgcr+h+Rx8up8quaU1CiBJTYAB7bCubjt5iQ9/D5M3
         LqZqVdwpePd/HBq180Brbd1S9DYAwX8YZOZ2JVcAFNgvnppKI27JnlOunzT5DjlbsFuP
         80h8edc1iknyFkl0RTrSIucGRJT/uYkUtkYmOJhqFPD+6CjyXdzDqIemHL8XOm507MZS
         OE5Odg1n9nWapZfLPaIqhbVjCy5za/cLsfFqtZXmxmkp6IHAMyEJElpR4xKbAMyCNxn5
         lo4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793831262; x=1794436062;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TQAK8qbp+bqwH/yA/y8zCNOc+K4W78NBGe/TJCEFsJE=;
        b=0VcPqazl2sziI5+qAV1q/K8D5WGCXwRu1CTQjsv+kkhpQ+3eZ+lTLF6wT3aw2V/3K9
         CpSmDlm1Z5szwb0f1lsxieYEsU7sTVG5eH2Zgp5QBDZkzswfWTaLf+rqOfqWUv2RAsuZ
         dLtCj3FkU25a9jPjEPwkS49njcVtwWYGlyv4ZM55iyyEuoAE7llYEQbeCdA3pIRTBzzG
         pXXT3of+iGvZzvjni1KVUfNg+I3CBvu8ruG2vklDj1YMa1E64bfjG7Ifch/W7ta8TCRx
         Q/XVhVLmm9g4aP6UDOvEsKfpa6/QZOF/W+nBogXeS622Q84K4GCknqnCelEI5BBGBVA2
         oWTg==
X-Forwarded-Encrypted: i=1; AKwUvBwrAsrTaPdsp7DpCKxx/Pa+6BXLhWq/u0BWGgzuHqPcIcd2XR6nvqdAKHTE+XV87vglNxT7VvbAAzBqUcU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/+bYjeaJr5/k7b9VRlpS6dLVMOys9foaYwUkYRSGIet9xEJ3PP
	WYHgfdph3wZHkVrU98pPJnYQD1NwjL7J/D2JTfjRvP6Ud1a2smo1Hj/gMssfHG33FL+cSlxv/C9
	C0xwk6i3nfQED+66EMfAKH84G3rsU7CjA8JH7Os/agg==
X-Gm-Gg: AYBFou3MmJmiRNQgEDU6drRw9dU1Qjf0e/+v/Jip8E09xVH5pkXilkSz9bhZ36kxtRr
	EbYRl3NfscETghA0K09Axh5T4QF77WBxOSU38Dk630+wAqj6JFsiKOpsJxtcg/MnXINeD3KyAuO
	Y5faCGSx6MeCRh2jnC60eSzTw2YV98o8oWk/dYMFm0xt0Rf1oeE/Qdix9BcGDTf3EAlJLLaPr5d
	WTo+3kJ4EBEPSKyt7Dxt+aCnQIBCTpLJjixEkkSnRANGDutgzWP3m3InOXekKCxBZ6bo4UH+Fqc
	+bXvXuzE40RsXroOh3PECcu+GVoW3ufQlr1lh7aerNoTctvE6PNfahebiEn95JmxNANWcHBt8xj
	3iJcE1RQ1B8OC9JQFgg42CN19lGuXYqrZKICIJpWbOQixK+8uD1XEcMrJRsmEYMVFK2ddPZhDtW
	5QYPoqmNwKLGB4zJISKAr6AaM=
X-Received: by 2002:a05:6402:3787:b0:6b5:74dd:37f3 with SMTP id
 4fb4d7f45d1cf-6b574dd39aamr1147352a12.38.1793831261972; Wed, 04 Nov 2026
 14:27:41 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-perf-alpha-profileme-v4-0-1771ea02950e@gmail.com> <20261104-perf-alpha-profileme-v4-2-1771ea02950e@gmail.com>
In-Reply-To: <20261104-perf-alpha-profileme-v4-2-1771ea02950e@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 4 Nov 2026 23:27:30 +0100
X-Gm-Features: AclHuK-E3YidK4R7qpjEd0-aTfWoNyIvFLSGqk_JEj3O4YMcEfJ5h8s_oOS4dx0
Message-ID: <CA+=Fv5TbocBsz9Esu-ZcEmNkRGBxkQ+enjLUZeqy485JM4Om+g@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] perf python: Add alpha-profileme.py
To: Matt Turner <mattst88@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Wed, Nov 4, 2026 at 7:54=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
>
> perf report shows where Alpha ProfileMe samples land but cannot
> aggregate the raw status attached to them.
>
> Add a standalone script, using the perf Python module, that summarizes
> it by symbol or, with --pc, by instruction, in the style of DCPI: the
> fraction of samples killed on a wrong path, not retired, mispredicted,
> taken or stalled, the mean PCTR1 window count, and trap counts by type.
> Mispredict and trap types are only counted when I_STAT[TRP] is set
> and the instruction was not killed before it was mapped, since they are
> stale otherwise. Redirect traps are counted by their
> PALcode entry offset in PMPC.
>
> Raw data is only read from cpu PMU events, as a tracepoint's payload can
> pass for ProfileMe status. Rows are kept apart by PCTR_CTL[SL1], as a
> mean over two things PCTR1 can count means nothing.
>
> On an EV7, sampling a loop whose branch tests random data reports that
> branch mispredicted in 21% of its samples, and 0% with sorted data.
>
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  tools/perf/python/alpha-profileme.py | 178 +++++++++++++++++++++++++++++=
++++++
>  1 file changed, 178 insertions(+)
>
> diff --git a/tools/perf/python/alpha-profileme.py b/tools/perf/python/alp=
ha-profileme.py
> new file mode 100755
> index 000000000000..da374d206187
> --- /dev/null
> +++ b/tools/perf/python/alpha-profileme.py
> @@ -0,0 +1,178 @@
> +#!/usr/bin/env python3
> +# SPDX-License-Identifier: GPL-2.0
> +"""Summarize Alpha ProfileMe samples.
> +
> +Aggregates the ProfileMe status that the Alpha cpu PMU attaches to each
> +sample as PERF_SAMPLE_RAW data, by symbol or, with --pc, by instruction.
> +
> +Record with raw data, e.g.:
> +  perf record -R -e cpu/instructions,profileme/ -- ./workload
> +A precise event such as instructions:p samples only retired instructions=
,
> +so its killed% and invalid% columns read 0.
> +  alpha-profileme.py [-i perf.data] [--pc] [--top N]
> +
> +Columns:
> +  samples   ProfileMe samples attributed to the row
> +  killed%   profiled instruction killed before it was mapped (PM_KILLED_=
BM)
> +  invalid%  instruction did not trap and did not retire valid (VAL clear=
)
> +  mispr%    conditional branch mispredicted (TRP and MIS)
> +  taken%    TAK set; only meaningful for rows that are conditional branc=
hes
> +  stall%    instruction stalled between fetch and map (PM_STALLED)
> +  pctr1     mean PCTR1 count during the window; what it counts depends o=
n
> +            the event: inum retire delay for cycles:p, window cycles for
> +            instructions:p, Bcache misses for bcache-misses:p and Mbox
> +            replay traps for cpu/mbox-replay/p
> +  traps     trap counts by type, only for samples with TRP set
> +
> +TRP, and MIS and the trap type with it, are stale for a killed instructi=
on,
> +so mispr%, invalid% and traps ignore them there.
> +
> +Samples from events that set PCTR1 to count different things are printed
> +in separate tables, as their means cannot be compared.
> +"""
> +from __future__ import annotations
> +
> +import argparse
> +from collections import defaultdict
> +import struct
> +import sys
> +from typing import Optional
> +import perf
> +
> +TRAP_TYPES =3D {
> +    0: "replay", 2: "dtb2-3l", 3: "dtb2-4l", 4: "fen", 5: "unalign",
> +    6: "dtb1", 7: "dfault", 8: "opcdec", 10: "mchk", 12: "arith",
> +    14: "mt_fpcr", 15: "reset",
> +}
> +REDIRECTS =3D {0x481: "iacv", 0x581: "itbmiss", 0x681: "intr"}
> +PCTR1_NAMES =3D ("cycles", "retire delay", "bcache misses", "mbox replay=
s")
> +SAMPLE =3D struct.Struct("<IQQQ")
> +
> +
> +class Row:
> +    """ProfileMe status totals for one symbol or instruction."""
> +    def __init__(self) -> None:
> +        self.samples =3D 0
> +        self.killed =3D 0
> +        self.invalid =3D 0
> +        self.mispredict =3D 0
> +        self.taken =3D 0
> +        self.stalled =3D 0
> +        self.pctr1 =3D 0
> +        self.traps: dict[str, int] =3D defaultdict(int)
> +
> +
> +def pct(n: int, d: int) -> float:
> +    """Return n as a percentage of d."""
> +    return 100.0 * n / d if d else 0.0
> +
> +
> +class ProfileMe:
> +    """Aggregates ProfileMe raw sample data."""
> +    def __init__(self, by_pc: bool, top: int) -> None:
> +        self.by_pc =3D by_pc
> +        self.top =3D top
> +        # Keyed by PCTR_CTL[SL1], which sets what PCTR1 counts.
> +        self.tables: dict[int, dict[str, Row]] =3D defaultdict(lambda: d=
efaultdict(Row))
> +        self.skipped =3D 0
> +        self.session: Optional[perf.session] =3D None
> +
> +    def process_event(self, sample: perf.sample_event) -> None:
> +        """Add one sample's ProfileMe status to its row."""
> +        raw =3D sample.raw_buf
> +        # Raw data from another PMU or a tracepoint is not ProfileMe sta=
tus.
> +        if (sample.evsel.type not in (perf.TYPE_HARDWARE, perf.TYPE_RAW)=
 or
> +                not raw or len(raw) < SAMPLE.size):
> +            self.skipped +=3D 1
> +            return
> +        version, pmpc, i_stat, ctl =3D SAMPLE.unpack_from(raw)
> +        if version < 1:
> +            self.skipped +=3D 1
> +            return
> +
> +        symbol =3D sample.symbol or "[unknown]"
> +        if self.by_pc:
> +            if pmpc & 1:
> +                key =3D f"PAL+{pmpc & 0x7fff:#x}"
> +            else:
> +                key =3D f"{pmpc & ~3:#018x} {symbol}"
> +        else:
> +            key =3D f"{sample.dso or '[unknown]'} {symbol}"
> +
> +        r =3D self.tables[(ctl >> 2) & 3][key]
> +        r.samples +=3D 1
> +        killed =3D (ctl >> 26) & 1
> +        trp =3D (i_stat >> 39) & 1 and not killed
> +        if killed:
> +            r.killed +=3D 1
> +        if not trp and not (ctl >> 1) & 1:
> +            r.invalid +=3D 1
> +        if ctl & 1:
> +            r.taken +=3D 1
> +        if (ctl >> 27) & 1:
> +            r.stalled +=3D 1
> +        r.pctr1 +=3D (ctl >> 6) & 0xfffff
> +
> +        redirect =3D REDIRECTS.get(pmpc & 0x7fff) if pmpc & 1 else None
> +        if redirect:
> +            r.traps[redirect] +=3D 1
> +        elif trp:
> +            if (i_stat >> 40) & 1:
> +                r.mispredict +=3D 1
> +            else:
> +                tt =3D (i_stat >> 34) & 0xf
> +                r.traps[TRAP_TYPES.get(tt, "other")] +=3D 1
> +
> +    def print_totals(self) -> None:
> +        """Print the busiest rows of each table."""
> +        total =3D sum(r.samples for rows in self.tables.values() for r i=
n rows.values())
> +        print(f"{total} ProfileMe samples, {self.skipped} without Profil=
eMe data")
> +        for sl1, rows in sorted(self.tables.items()):
> +            print(f"\npctr1 counts {PCTR1_NAMES[sl1]}:")
> +            self.print_table(rows)
> +
> +    def print_table(self, rows: dict[str, Row]) -> None:
> +        """Print the busiest rows of one table."""
> +        print(f"{'samples':>8} {'killed%':>7} {'invalid%':>8} {'mispr%':=
>6} "
> +              f"{'taken%':>7} {'stall%':>6} {'pctr1':>7}  {'location':<4=
0} traps")
> +        ordered =3D sorted(rows.items(), key=3Dlambda kv: kv[1].samples,=
 reverse=3DTrue)
> +        for key, r in ordered[:self.top]:
> +            traps =3D " ".join(f"{k}=3D{v}" for k, v in
> +                             sorted(r.traps.items(), key=3Dlambda kv: -k=
v[1]))
> +            print(f"{r.samples:8d} {pct(r.killed, r.samples):7.1f} "
> +                  f"{pct(r.invalid, r.samples):8.1f} "
> +                  f"{pct(r.mispredict, r.samples):6.1f} "
> +                  f"{pct(r.taken, r.samples):7.1f} "
> +                  f"{pct(r.stalled, r.samples):6.1f} "
> +                  f"{r.pctr1 / r.samples:7.1f}  {key:<40} {traps}")
> +
> +    def run(self, input_file: str) -> None:
> +        """Run the session."""
> +        self.session =3D perf.session(perf.data(input_file), sample=3Dse=
lf.process_event)
> +        try:
> +            self.session.process_events()
> +        finally:
> +            # Break the reference cycle between perf.session and self.pr=
ocess_event
> +            # because perf.session lacks cyclic GC support (tp_traverse)=
.
> +            self.session =3D None
> +        self.print_totals()
> +
> +
> +def main() -> None:
> +    """Main function."""
> +    parser =3D argparse.ArgumentParser(description=3D"Summarize Alpha Pr=
ofileMe samples")
> +    parser.add_argument("-i", "--input", default=3D"perf.data", help=3D"=
Input file")
> +    parser.add_argument("--pc", action=3D"store_true", help=3D"aggregate=
 by instruction")
> +    parser.add_argument("--top", type=3Dint, default=3D30, help=3D"rows =
to print")
> +    args =3D parser.parse_args()
> +
> +    analyzer =3D ProfileMe(args.pc, args.top)
> +    try:
> +        analyzer.run(args.input)
> +    except IOError as e:
> +        print(e, file=3Dsys.stderr)
> +        sys.exit(1)
> +
> +
> +if __name__ =3D=3D "__main__":
> +    main()
>
> --
> 2.55.0
>

I checked alpha-profileme.py against the raw fields in recordings from
my ES40. In the v6 recordings, 644 samples had both PM_KILLED_BM and
TRP set, including 10 with MIS set. The script correctly ignored those
stale bits when counting traps and mispredictions.

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>
