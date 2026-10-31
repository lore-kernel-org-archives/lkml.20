Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793468639;
	b=PxhCjvlk5IQCsW13NPqGmH0Ee6UTeN+Mvu1yzBirG/+GQkGrSBZVEyv4FNeyLYZ1o4Dm
	 faITzwSIGUIpA1qFBXJDiqE8f+9oyZZVTkMTali+d7bGLDQ0ncE6RVEhtoQWix+h42iKz
	 pAdcc+P9Cutz4jfncMy5N3RB6gMPJYYY1HWUQ9Q2paFL67fKPHbc4CFx7NiLPZwWNJZ2y
	 p2aMKRFpe6pcIbFGC1FUrpp4ZVi3xtKPDyVpzpwNI9BM9NvatN/zWZ+K9nEfYGZEsMyp2
	 JzVlZjL3Gf6xhgTEVI/hN3z6pWqhh3KdsDBT9eMUhwBwSyBiuq27SHobDhJzLLAn1UA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793468639;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=tpJVUHUX1SYqW8DDRmdRkjnrkQV4VZulE3lRBuXBmBU=;
	b=LzvcZ/CZzVhz+IJqQ4cCSyh09/WeyQuWysRRjE5Fu0HwkrOCa2yzd4LN/V08w7AKQp9p
	 VTJclMuu1DUvDVpN9pbi0mwTzzaAloS2kg74q/y/9abgacLTiSXG1ZgxtmHvuHMtbsPoy
	 VUw3gd+4zqOWq4ACfzJzzMPubClxhhdZxs7v5K/JzUuqYBH9iq2ZI8OEsUwyHGHaDpL8H
	 i1qX9DwRrAuVuzOrVWj0vkOfVnP8YLlebEuuM1wmC03C6L5iEbZwgRLfQtquhbGJkXebV
	 83iniH1ZGrNUnG6Ucnh8QDpUXX2kZn7tMW44PR0+P43CkSxhYo++euFuHGme+mvMoug==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zkObb6j7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D84606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 17:43:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58D84606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zkObb6j7
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c4cb6834eaaso179709866b.2
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 10:43:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793468637; cv=none;
        d=google.com; s=arc-20260327;
        b=Yc5yEdwRJObiwhAUDeMo5Vwmg9NFF6H8cEiGfj9u1v9bzmZsKAc8Nyc0k17lIdF8NQ
         qgJxTHqJKeGAK95ECl4Sf6o+mLPtQF4eoUqeD4FYqX3dl3LzKcOKfijDMMkd+klriib2
         LMXgbaU6OuZTKBmxbH9tdj1xaTU9X8MbkCvnB/mHWj3dXVSL4//OV4lmbwVNrvl8zKso
         eLnaEiwl2dw0AL2OJ40G4+ZSylxdW2Qp/v8sQ+KOVezL3jd07u0odXqoAUikiL10nIxZ
         6qDk0y4Z1RMg16FRG08HvNDW+H7po+2tvUpHygOb6+l4977gyjs+B9289uCgwaRCanU1
         YkPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tpJVUHUX1SYqW8DDRmdRkjnrkQV4VZulE3lRBuXBmBU=;
        fh=lIMbMOioo/2mrl8KM8voY1FT6dDRxBX2Hfo2OcE5ELg=;
        b=iT+lZhJOiooqoTr7MzgyYGbTj6ZMmxGoKLKezMqpLQzniyfGByvkbrBK1g62oZ1T4O
         YhOki4x+7y77zR7mAR3aqB8oSaRY/F3/jrAni1bLm4xhknHtmdz7LgxoxVoXI1tAY2Bu
         nUSG0+UFLoUdGLNhx2Wa+sRMvw9HBho5kyxaCd6k7mcR+lFaom7Fy8iiml581BURWilf
         WDDiXMKoQGk+HIkPg6tYKM4uggKB64I+GShv+DVyj3DYP0zNw4FLECc5DSH6jwceQt/O
         ofIG5OvMwr0USm+dXgGCXlo1qsaBfY3nRgds127DyLFnzVJgj7wFEGzrn/KJxbLUKtXH
         q8Ow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793468637; x=1794073437; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tpJVUHUX1SYqW8DDRmdRkjnrkQV4VZulE3lRBuXBmBU=;
        b=zkObb6j7GaY+zs4kYDsBylH03Lbm+TjWGxg5oHC8/wGzLFdeyY/4KaJkNow/kY9zgK
         +1Xfx/FP2H+HHF2KXtQvLut58F1lR8WNEwalHQNBqK+b0TE1PBoMlVzdhpxds/zE3iCu
         P/ZqxR6BSygto5QA27yF1DiXcD5fNHrlfqTQU5kLzzLx7HfGo5t7IuZ60iGvoshGkZya
         no5QtYpk6YxcoO7MaO6ljP0yNpedH3/miDfJIMPmBdDV9stCyHASNg3AbcN9jG1aDrCU
         3a9DmlsC6/MjCy/5UvUoijGX9r89PXYhsdVY/gJsHUw+Q2P0w+TPLul+KF/QgBQtlmuv
         o7yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793468637; x=1794073437;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tpJVUHUX1SYqW8DDRmdRkjnrkQV4VZulE3lRBuXBmBU=;
        b=UrsglLrjPTMakGmtozMCIPAivS+gDy+eWXRMql7v6bAN8rggOMLgAkVcJ8zG8snr7J
         9np9RYWwcn5l0FPAqLbYoK9BHtbqP/Sh3cv6+8YJGeYKWzPAzWF8vicIlMIoZiV7H7y5
         O3XFdcQl8xthgsQ0ltpG1YQzPHAsQEH7tvW4ww0reqJ8QdMpWUEKlPj9A7ridLII4ALz
         ceIkaxS06tdq6/dbHdx0XCJNoz+G2o+xG/Q9GsPkolnhVeGyPNcNJhZL4bkn9RuvwCto
         S3Y8WQanSNfBh82vGdlwcGWhCplVmmmXeaP0lTqjH27Z++L+340e4EDW4Wq61Irz2qwN
         w5vw==
X-Forwarded-Encrypted: i=1; AKwUvBxH++KO1unT5ayInpXhsz9pOZ/m+Ikx4KFnEXmEuqhArq4kSjxr6BXE17hr96kWpYENfyFuptu6oP7XHsE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKPAaHpxirW7w8oareYRxxg52jK5lSVRDAlE1cdMtsBqC1bCOj8
	sw9HuDJsoi6xECeM/4dqpb5a3uYb1iyWB0M52baV0+hrj1EF5hwqjgS+Ruu1tIEf8KU5j48LXIK
	3OCz1goa0jTkC+akjY3VBPZRyH2JiM58=
X-Gm-Gg: AYBFou0eFbtLWhj1W36mq+lKAPlYox66B8kfxcQ58MwGRZbUVw7qNWuBb01vy94q7w5
	l5JZQJP3VDZN71LKbRX0V3tp4rCCN8qX/tCbqg3l7Kzo67atR8pHAz+4LhOm0wPZ5TZsN610DvC
	hvah1u6q3jxFIV7WyutZtnWd1x0gUMIo9vIr/N4zcIxI81Akh8yvd9imsOty/+3TiRgly9hZeJ+
	fRubMvxCqcbIeQM/xFhCbH6Ag2Yi3NH5HYMk6nmRAF4X5h5C0sZP6JAPUEYZoVWAzJ7/lWW6Jdy
	/zWxeygjBcRV1lDo3oDQQeZGjOfQjLWpxtvUQYEXda77ZWOPkBq3Ia2Dvzo6oROSkbtWH+Cn4t1
	qxACKHkNr+8UYNQiFeH19dj6oZoRDijM4RlUnpJauK1Fp+GHV30H5OhumY+s0lhZJaxGRdmvKjm
	DjoqQf79+bSQThLkZeYdEZm54=
X-Received: by 2002:a17:907:1b29:b0:c41:26b8:c49d with SMTP id
 a640c23a62f3a-c4ca7ab18d6mr482885966b.38.1793468636616; Sat, 31 Oct 2026
 10:43:56 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030-perf-alpha-profileme-v2-0-9ce2f0b0e622@gmail.com> <20261030-perf-alpha-profileme-v2-2-9ce2f0b0e622@gmail.com>
In-Reply-To: <20261030-perf-alpha-profileme-v2-2-9ce2f0b0e622@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sat, 31 Oct 2026 18:43:45 +0100
X-Gm-Features: AclHuK9-36YoAe-AfeSjFGej2qPPk6oLiKJcu13eVoK7K6LnJ7aqvhCmb6_DCyg
Message-ID: <CA+=Fv5Qa4HnADkCey1XA_JbV5vsABzZCZ+kS-OJHjFDH2mQv_Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] perf python: Add alpha-profileme.py
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

The script decoded single-event recordings from all four ProfileMe
modes on my ES40. I found two issues with mixed input.

On Fri, Oct 30, 2026 at 5:09=E2=80=AFAM Matt Turner <mattst88@gmail.com> wr=
ote:
>
> perf report shows where Alpha ProfileMe samples land but cannot
> aggregate the raw status attached to them.
>
> Add a standalone script, using the perf Python module, that summarizes
> it by symbol or, with --pc, by instruction, in the style of DCPI: the
> fraction of samples killed on a wrong path, not retired, mispredicted,
> taken or stalled, the mean PCTR1 window count, and trap counts by type.
> Mispredict and trap types are only counted when I_STAT[TRP] is set,
> since they are stale otherwise. Redirect traps are counted by their
> PALcode entry offset in PMPC.
>
> On an EV7, sampling a loop whose branch tests random data reports that
> branch mispredicted in 21% of its samples, and 0% with sorted data.
>
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  tools/perf/python/alpha-profileme.py | 162 +++++++++++++++++++++++++++++=
++++++
>  1 file changed, 162 insertions(+)
>
> diff --git a/tools/perf/python/alpha-profileme.py b/tools/perf/python/alp=
ha-profileme.py
> new file mode 100755
> index 000000000000..19572431aeac
> --- /dev/null
> +++ b/tools/perf/python/alpha-profileme.py
> @@ -0,0 +1,162 @@
> +#!/usr/bin/env python3
> +# SPDX-License-Identifier: GPL-2.0
> +"""Summarize Alpha ProfileMe samples.
> +
> +Aggregates the ProfileMe status that the Alpha cpu PMU attaches to each
> +sample as PERF_SAMPLE_RAW data, by symbol or, with --pc, by instruction.
> +
> +Record with raw data, e.g.:
> +  perf record -R -e instructions:p -- ./workload
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
> +        self.rows: dict[str, Row] =3D defaultdict(Row)
> +        self.skipped =3D 0
> +        self.session: Optional[perf.session] =3D None
> +
> +    def process_event(self, sample: perf.sample_event) -> None:
> +        """Add one sample's ProfileMe status to its row."""
> +        raw =3D sample.raw_buf
> +        if not raw or len(raw) < SAMPLE.size:
> +            self.skipped +=3D 1
> +            return
> +        version, pmpc, i_stat, ctl =3D SAMPLE.unpack_from(raw)
> +        if version < 1:

An unrelated tracepoint payload can pass the length and version
checks and show up in the ProfileMe totals. Could we check the
originating event before decoding its raw data?

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
> +        r =3D self.rows[key]
> +        r.samples +=3D 1
> +        trp =3D (i_stat >> 39) & 1
> +        if (ctl >> 26) & 1:
> +            r.killed +=3D 1
> +        if not trp and not (ctl >> 1) & 1:
> +            r.invalid +=3D 1
> +        if ctl & 1:
> +            r.taken +=3D 1
> +        if (ctl >> 27) & 1:
> +            r.stalled +=3D 1
> +        r.pctr1 +=3D (ctl >> 6) & 0xfffff
> +

With two samples at the same location, one with SL1=3D0 and a count
of 10 and another with SL1=3D1 and a count of 100, the script reports
a mean of 55. PCTR1 measures different things in those modes. Could
we group by event or selector and label what PCTR1 counts?

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
> +        """Print the busiest rows."""
> +        total =3D sum(r.samples for r in self.rows.values())
> +        print(f"{total} ProfileMe samples, {self.skipped} without Profil=
eMe data")
> +        if not total:
> +            return
> +        print(f"{'samples':>8} {'killed%':>7} {'invalid%':>8} {'mispr%':=
>6} "
> +              f"{'taken%':>7} {'stall%':>6} {'pctr1':>7}  {'location':<4=
0} traps")
> +        ordered =3D sorted(self.rows.items(), key=3Dlambda kv: kv[1].sam=
ples,
> +                         reverse=3DTrue)
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
>

Thanks

Magnus
