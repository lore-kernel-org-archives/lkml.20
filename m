Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 217844C33C0
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 18:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792176013; cv=pass; b=NMZGpVfp3qgbWyEFS6BQ3tdSobbRwRhfUrrGT9cxrcoEplMUIrBu9xiPy5iR0M5NTxDP91ipRZ9U/GR7NPWKs8NZSM72gNSr73halcsBU4cU/3YcFILmofBvPzD18jWRVm4brN6aGxnpGosgzj5Yvvy2lcwn85bE8vnQXNAMYOE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792176013; c=relaxed/simple;
	bh=xsYeI4hR5bFvuqm0PSlnW0Z65GnHOzwL1uy/B9ZA4Pc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eyW5Mqucg+KQrSp+brll1e/BCQemyGf9wQ823XrhhxjsMrh85SUQKJS5Bq3DJWlKeJoRlS/FkDViutm2qUiizahPyqYPnUmVVCmzTEej2kby1ZigfFx0W0kjry6IjbH0WHCDntRglTxAaYAiPhLSJCHD2i00jjGjPeEFm4ZJNuY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=V2oJOivZ; arc=pass smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="V2oJOivZ"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-15354aa70e8so523037c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 11:40:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792176011; cv=none;
        d=google.com; s=arc-20260327;
        b=IzVX0dAYS0qKOhzyrQ9NnAL/NQoPGTwBqvMDkXxUlgyMSahQFwUp0uX+j5xncYN4V+
         snSCFsLMDdxr45HUF5O6XumiZ44sH52wh3Rjz0AeSejUoXE0ZQjBbt0hnWLeKRjK3JjL
         EWrbFuwXsMU6zNdjNuhnXHcN0U8te0oOhBgAnnE8camrCXoIF1e+1yO+BGlB80QL2LTB
         CWPIiY8xHqm0rSdNnaeFrnwOWIi4D0XFomfwoSwaimVoEKkohGmpn6a6AYoDXiakmLyR
         xruZwht8ItSB+OUvJKYHZT49BP6ilzN4XSoSm0zwQkGOij8MZtuLG7V3oFdtp35cjXYi
         3PzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hlEE7DVQkmo1bBGtV9WB4/uzh7DrzDs6MItzTSYiyfE=;
        fh=+FOTlVurbnfZoydo8qWbjMPkH67n5Ro3DdNElrGYhpE=;
        b=PD+D1DG6cBl8oUp7ZrKUn91AOezATAO7GT/S7w8JkeHKj5TsZmt6/bh60ru9Le3lST
         Ct4YZgzQuKB7zUMz7N2371nxkKl0N783oeRMm0w9kjevpfAnCeVYjF6xzPSvaVFNwEw+
         XVb6TBmhxVL2oWVShiad7laVVkA7yZM0y/ON8p5seN7FNEhLkTnMbFKq2zND4HNSsI3V
         NH6mN3FlLMEj71HJjT76NUjlXYkqajOnuViZDGXExRJ+YazijsgfFtMIVm8fQ+zwOiti
         mNxobQE1e/80zFp+JLDz8CKN2JIN9vcGEfdBAKlcu36fH8mOnNm9irChHEq/qh9Ac7F7
         WJDg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792176011; x=1792780811; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hlEE7DVQkmo1bBGtV9WB4/uzh7DrzDs6MItzTSYiyfE=;
        b=V2oJOivZvXPQsaQR2mPbLDaWl3n/gStv8sw6dJIITu5wPoS4wEVePaFysUgj2INkog
         hubKRfGP7qkq96nyjhOEsCMFiyioBfXXNInBSy3fnkz+ZRWfFLFu1BLDSjp9PJXpYv0P
         BcTiJ/pp4reAd7CFK3aM2y3LljL/IDCyy1VlZT4TH/lAi6xWWCWku8BuoKiJNUBALYp6
         mS9uKJXiPBJ+GWXAwvC7WqYqHT21xUFAQfllGn6npfeU6KkVJe1VHgbCunRTl+q3jzla
         DO3mQwT9FytshRuybrFa5anSMMrHelYbNXJj4eZkFSsRTy3WDRCvVzzhruk69NsKgYCv
         A8qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792176011; x=1792780811;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hlEE7DVQkmo1bBGtV9WB4/uzh7DrzDs6MItzTSYiyfE=;
        b=MqvVWe/h6KWhgs5QQMOEvQ2tNGZUG9sCxfFGRxytF3Zu7GVHpDaokhFogZ2T2G00np
         XqHJBqGvjaAvTpBYXBSGsYhhrTvPAYjSBcF9YrZ4XoDf1cJkW2vu1gWY+A/MXQysDd2E
         jkPPnQYu7OlCZcRBiebWdMqX7tTSbxLT9dBJ4pJCBB2x3aY8zws3kcY4pFz3CQHyJ7qv
         ewpnG1OhSZZ6J/iL8NqIop7qZc2KA5oMOZ1MJkie6X7MWGZq7pg573FtUbvvCMKidd9t
         ewYmOuj8jzmYWprI9RT45r2n6m/6koIOq/dwaXaIXLI4RjH5HlrB0YHa3oyS0+nn7Hn3
         NN0w==
X-Forwarded-Encrypted: i=1; AKwUvBwJctcXxVv6fgdOxfvM0fvuaYgeDVOi1CFpTQ+uYVFmBeubZQLFj9FY/GBPFscTVatNcyU9xKNa5D9rBFU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJR3xnKLDZkZBIv5StpR3fSJAW05h170kpTX5N1ofOPwU1CE2kG
	QjpY7qho5Zd1emIYlzNODPNv1ucuvct73FKMXy0EVz4CTV+vtsJc7yv9bX5MP8ORCQTHSciffXD
	8xyZZtd5hIU07VS9/OeJnVFxA/zAfZUhlF4uzVxBC
X-Gm-Gg: AYBFou1KWhpgUn/dwDdAnsiKu55wkIdBKFM1CnmQdRJAJkva5goYiyjkyGaQ2ndBe6s
	sZXGDTjPuNWMHtPf4fU7fPCSr51g89ZfefkmsYXvaxc7ON57+2Lkr3BgZGnoPbl5ZXglXG6nEfA
	poYso2HugE7fHiSw0ORxMEKEbBw5zY77ChtGJkjFNeZqLwVWVh8vfdv2dmnDqrNxdVA697Nxxv5
	bnKljPMdkiEDoc+Evjo4+ydXLO865x5FUMHg/aESfxZdFgWo/lewmfiD1jrsf484djbOt4thvau
	xK8bDNIEIMroSOh1TR7PA4ktC0KcnVUHiTZ2b7Wm+/dLeLwi24rtN73WQ+CXOQ0P+ZSChXoK3Xh
	0qxWD0KEam6cJMMpNupa5bOH6pFmCZorO5kU=
X-Received: by 2002:a05:7022:f68c:b0:149:49c:22b with SMTP id
 a92af1059eb24-1850c8da7f7mr1196016c88.1.1792176009241; Fri, 16 Oct 2026
 11:40:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928175127.1032535-1-ctshao@google.com> <20260928175127.1032535-3-ctshao@google.com>
 <SA1PR12MB6773C9DE93757D6B73C1E9B3A09E2@SA1PR12MB6773.namprd12.prod.outlook.com>
In-Reply-To: <SA1PR12MB6773C9DE93757D6B73C1E9B3A09E2@SA1PR12MB6773.namprd12.prod.outlook.com>
From: Chun-Tse Shao <ctshao@google.com>
Date: Fri, 16 Oct 2026 11:39:32 -0700
X-Gm-Features: AclHuK8Cpf5D1lvwH4p5xYmhynUiIV6Rjo0lLCe4H-T2quohCaweLeh1uTj4GVc
Message-ID: <CAJpZYjWLRiyNbzoGpA-2KE0zHgQn2gc0V943WxJEr5K5aZtRYA@mail.gmail.com>
Subject: Re: [PATCH 2/2] perf jevents: Add NVIDIA Tegra410 uncore PCIe metrics
To: Besar Wicaksono <bwicaksono@nvidia.com>
Cc: "acme@kernel.org" <acme@kernel.org>, "namhyung@kernel.org" <namhyung@kernel.org>, 
	"irogers@google.com" <irogers@google.com>, "peterz@infradead.org" <peterz@infradead.org>, 
	"mingo@redhat.com" <mingo@redhat.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, 
	"alexander.shishkin@linux.intel.com" <alexander.shishkin@linux.intel.com>, "jolsa@kernel.org" <jolsa@kernel.org>, 
	"adrian.hunter@intel.com" <adrian.hunter@intel.com>, "james.clark@linaro.org" <james.clark@linaro.org>, 
	"linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Matt Ochs <mochs@nvidia.com>, 
	Sean Kelley <skelley@nvidia.com>, Rich Wiley <rwiley@nvidia.com>, Vikram Sethi <vsethi@nvidia.com>, 
	Raj Joshi <rajjoshi@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 2:08=E2=80=AFPM Besar Wicaksono <bwicaksono@nvidia.=
com> wrote:
>
> Hi Chun-Tse,
>
> I tested this on 2-sockets Tegra410 and found some issues.
> 1. With --per-socket or -A, every lpm_pcie_* metric is only reported for
>    socket 0, so socket 1's PCIe traffic never shows up. Example output:
>
> perf stat -a -A -M lpm_pcie_rc1_bw -- sleep 1
>
>  Performance counter stats for 'system wide':
>
> CPU0               15,204      nvidia_pcie_pmu_0_rc_1/wr_bytes/ #      0.=
0 MB/s  lpm_pcie_wr_bw_1
> CPU0                                                                    #=
     33.8 MB/s  lpm_pcie_bw_1
> CPU0           33,910,952      nvidia_pcie_pmu_0_rc_1/rd_bytes/ #     33.=
8 MB/s  lpm_pcie_rd_bw_1
> CPU88                   0      nvidia_pcie_pmu_1_rc_1/wr_bytes/
> CPU88                   0      nvidia_pcie_pmu_1_rc_1/rd_bytes/
> CPU0        1,002,286,615      tool/duration_time/
> CPU0                    0      nvidia_pcie_pmu_0_rc_1/wr_bytes,dst_rem=3D=
0x1/ #      0.0 MB/s  lpm_pcie_rem_wr_bw_1
> CPU88                   0      nvidia_pcie_pmu_1_rc_1/wr_bytes,dst_rem=3D=
0x1/
> CPU0        1,002,275,059      tool/duration_time/
> CPU0                    0      nvidia_pcie_pmu_0_rc_1/rd_bytes,dst_rem=3D=
0x1/ #      0.0 MB/s  lpm_pcie_rem_rd_bw_1
> CPU88                   0      nvidia_pcie_pmu_1_rc_1/rd_bytes,dst_rem=3D=
0x1/
> <snip>
>
> Note CPU88 (socket 1_ has no lpm_pcie_* values.
>
> 2. In the default mode, lpm_pcie_*_<i> adds RC i of socket 0 and RC i of
>    socket 1. These are separate root complexes with different devices,
>    so the "Root Complex i" value can combine traffic from two unrelated
>    links.
>    Could the metrics follow the hardware hierarchy instead, starting at
>    the socket and drilling down to the RC, with the same destination
>    split at each level?
>     - per socket, all RCs (nvidia_pcie_pmu_<s>_rc):
>         lpm_pcie_s<s>_{bw,rd_bw,wr_bw}
>         lpm_pcie_s<s>_{loc,rem}_{rd,wr}_bw
>     - per socket and RC (nvidia_pcie_pmu_<s>_rc_<i>):
>         lpm_pcie_s<s>_{bw,rd_bw,wr_bw}_<i>
>         lpm_pcie_s<s>_{loc,rem}_{rd,wr}_bw_<i>
>       grouped as lpm_pcie_s<s>_rc<i>_bw.

Thanks for testing and for the suggestion. I think both problems come
from how perf expects a PMU to expose its cpumask. Ideally perf wants
a single PMU for both sockets, with one CPU per socket in its cpumask,
e.g.:

```
/sys/bus/event_source/devices/nvidia_pcie_rc_0/cpumask: 0,88
```

We can work around the one-PMU-per-socket layout in the metrics, but
would a single PMU per RC be a viable plan for you to implement?

Thanks,
CT

>
> Thanks,
> Besar
>
> > -----Original Message-----
> > From: Chun-Tse Shao <ctshao@google.com>
> > Sent: Monday, September 28, 2026 5:51 PM
> > To: acme@kernel.org; namhyung@kernel.org; irogers@google.com
> > Cc: peterz@infradead.org; mingo@redhat.com; mark.rutland@arm.com;
> > alexander.shishkin@linux.intel.com; jolsa@kernel.org;
> > adrian.hunter@intel.com; james.clark@linaro.org; Besar Wicaksono
> > <bwicaksono@nvidia.com>; linux-perf-users@vger.kernel.org; linux-
> > kernel@vger.kernel.org; Chun-Tse Shao <ctshao@google.com>
> > Subject: [PATCH 2/2] perf jevents: Add NVIDIA Tegra410 uncore PCIe
> > metrics
> >
> > External email: Use caution opening links or attachments
> >
> >
> > Add PCIe bandwidth metrics for the NVIDIA Tegra410 SoC. The formulas
> > follow Documentation/admin-guide/perf/nvidia-tegra410-pmu.rst:
> >
> >   AVG_RD_BANDWIDTH_IN_GBPS =3D RD_BYTES / ELAPSED_TIME_IN_NS
> >   AVG_WR_BANDWIDTH_IN_GBPS =3D WR_BYTES / ELAPSED_TIME_IN_NS
> >
> > There is one PCIE PMU per socket and PCIe Root Complex (RC), named
> > nvidia_pcie_pmu_<socket-id>_rc_<pcie-rc-id>, with RCs 0 to 5 in each
> > socket. The metrics sum the rd_bytes/wr_bytes events of both sockets:
> >
> >   lpm_pcie_bw, lpm_pcie_rd_bw, lpm_pcie_wr_bw: all RCs.
> >   lpm_pcie_bw_<rc>, lpm_pcie_rd_bw_<rc>, lpm_pcie_wr_bw_<rc>: one RC.
> >   lpm_pcie_loc_rd_bw_<rc>, lpm_pcie_loc_wr_bw_<rc>: one RC to local
> >     CMEM, GMEM, PCIe peer and CXL memory.
> >   lpm_pcie_rem_rd_bw_<rc>, lpm_pcie_rem_wr_bw_<rc>: one RC to remote
> >     memory.
> >
> > The per RC metrics are in the lpm_pcie_rc<rc>_bw metric groups.
> >
> > A socket's event counts as 0 if its PMU isn't present (has_event() is
> > 0), e.g. on a single socket system, or if it isn't counted in the
> > aggregation (source_count() is 0), e.g. the other socket's event with
> > --per-socket. Otherwise the metric fails to parse or is nan.
> >
> > Signed-off-by: Chun-Tse Shao <ctshao@google.com>
> > Assisted-by: Gemini:gemini-3.1-pro-preview
> > ---
> >  tools/perf/pmu-events/arm64_metrics.py | 68
> > ++++++++++++++++++++++++--
> >  1 file changed, 64 insertions(+), 4 deletions(-)
> >
> > diff --git a/tools/perf/pmu-events/arm64_metrics.py b/tools/perf/pmu-
> > events/arm64_metrics.py
> > index b0d0651fec12..1ca3d8ddb4b7 100755
> > --- a/tools/perf/pmu-events/arm64_metrics.py
> > +++ b/tools/perf/pmu-events/arm64_metrics.py
> > @@ -2,9 +2,10 @@
> >  # SPDX-License-Identifier: (LGPL-2.1 OR BSD-2-Clause)
> >  import argparse
> >  import os
> > -from typing import Optional
> > -from metric import (aggr_nr, d_ratio, Event, JsonEncodeMetric,
> > -                    JsonEncodeMetricGroupDescriptions, LoadEvents, Met=
ric,
> > MetricGroup)
> > +from typing import List, Optional, Union
> > +from metric import (aggr_nr, d_ratio, has_event, source_count, Event,
> > Expression,
> > +                    JsonEncodeMetric, JsonEncodeMetricGroupDescription=
s,
> > LoadEvents, Metric,
> > +                    MetricGroup, Select)
> >  from common_metrics import Cycles
> >
> >  # Global command line arguments.
> > @@ -67,7 +68,66 @@ def NvidiaT410Uncore() -> Optional[MetricGroup]:
> >                     rd_cum_outs - rd_cum_outs, "1ns"),
> >          ], description=3D"NVIDIA Tegra410 DDR latency")
> >
> > -    return MetricGroup("lpm_uncore", [DdrBw(), DdrLat()],
> > +    def PcieBw() -> MetricGroup:
> > +        # PCIE PMU, one per socket and PCIe Root Complex (RC):
> > +        # AVG_{RD,WR}_BANDWIDTH =3D {RD,WR}_BYTES / ELAPSED_TIME
> > +        loc_dst =3D
> > "dst_loc_cmem=3D0x1,dst_loc_gmem=3D0x1,dst_loc_pcie_p2p=3D0x1,dst_loc_p=
ci
> > e_cxl=3D0x1"
> > +        rem_dst =3D "dst_rem=3D0x1"
> > +
> > +        def SocketSum(rc: str, event: str) -> Expression:
> > +            # Sum the event over both sockets. A PMU counts as 0 if it=
 isn't
> > +            # present (has_event() is 0) or isn't counted in the aggre=
gation,
> > +            # e.g. the other socket with --per-socket (source_count() =
is 0).
> > +            def Count(e: Event) -> Expression:
> > +                return Select(Select(e, source_count(e), 0), has_event=
(e), 0)
> > +
> > +            return (Count(Event(f"nvidia_pcie_pmu_0_{rc}/{event}/")) +
> > +                    Count(Event(f"nvidia_pcie_pmu_1_{rc}/{event}/")))
> > +
> > +        # nvidia_pcie_pmu_<socket-id>_rc matches the PMUs of all RCs i=
n the
> > socket.
> > +        rd =3D SocketSum("rc", "rd_bytes")
> > +        wr =3D SocketSum("rc", "wr_bytes")
> > +        metrics: List[Union[Metric, MetricGroup]] =3D [
> > +            Metric("lpm_pcie_bw", "Total PCIe bandwidth across all Roo=
t
> > Complexes",
> > +                   d_ratio(rd + wr, interval_sec), mb_per_sec),
> > +            Metric("lpm_pcie_rd_bw", "Total PCIe read bandwidth across=
 all
> > Root Complexes",
> > +                   d_ratio(rd, interval_sec), mb_per_sec),
> > +            Metric("lpm_pcie_wr_bw", "Total PCIe write bandwidth acros=
s all
> > Root Complexes",
> > +                   d_ratio(wr, interval_sec), mb_per_sec),
> > +        ]
> > +        for i in range(6):
> > +            rc =3D f"rc_{i}"
> > +            rc_rd =3D SocketSum(rc, "rd_bytes")
> > +            rc_wr =3D SocketSum(rc, "wr_bytes")
> > +            loc_rd =3D SocketSum(rc, f"rd_bytes,{loc_dst}")
> > +            loc_wr =3D SocketSum(rc, f"wr_bytes,{loc_dst}")
> > +            rem_rd =3D SocketSum(rc, f"rd_bytes,{rem_dst}")
> > +            rem_wr =3D SocketSum(rc, f"wr_bytes,{rem_dst}")
> > +            metrics.append(MetricGroup(f"lpm_pcie_rc{i}_bw", [
> > +                Metric(f"lpm_pcie_bw_{i}", f"PCIe total bandwidth on R=
oot
> > Complex {i}",
> > +                       d_ratio(rc_rd + rc_wr, interval_sec), mb_per_se=
c),
> > +                Metric(f"lpm_pcie_rd_bw_{i}", f"PCIe read bandwidth on=
 Root
> > Complex {i}",
> > +                       d_ratio(rc_rd, interval_sec), mb_per_sec),
> > +                Metric(f"lpm_pcie_wr_bw_{i}", f"PCIe write bandwidth o=
n Root
> > Complex {i}",
> > +                       d_ratio(rc_wr, interval_sec), mb_per_sec),
> > +                Metric(f"lpm_pcie_loc_rd_bw_{i}",
> > +                       f"PCIe local read bandwidth on Root Complex {i}=
",
> > +                       d_ratio(loc_rd, interval_sec), mb_per_sec),
> > +                Metric(f"lpm_pcie_loc_wr_bw_{i}",
> > +                       f"PCIe local write bandwidth on Root Complex {i=
}",
> > +                       d_ratio(loc_wr, interval_sec), mb_per_sec),
> > +                Metric(f"lpm_pcie_rem_rd_bw_{i}",
> > +                       f"PCIe remote read bandwidth on Root Complex {i=
}",
> > +                       d_ratio(rem_rd, interval_sec), mb_per_sec),
> > +                Metric(f"lpm_pcie_rem_wr_bw_{i}",
> > +                       f"PCIe remote write bandwidth on Root Complex {=
i}",
> > +                       d_ratio(rem_wr, interval_sec), mb_per_sec),
> > +            ], description=3Df"PCIe bandwidth on Root Complex {i}"))
> > +
> > +        return MetricGroup("lpm_pcie_bw", metrics,
> > +                           description=3D"NVIDIA Tegra410 PCIe Root Co=
mplex
> > bandwidth")
> > +
> > +    return MetricGroup("lpm_uncore", [DdrBw(), DdrLat(), PcieBw()],
> >                         description=3D"NVIDIA Tegra410 uncore metrics")
> >
> >
> > --
> > 2.56.0.rc1.315.gc6ed9934b7-goog
>
