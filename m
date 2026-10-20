Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792537982;
	b=ajUPQMRJhWq7lJuQTmhr6S8NS+iJBwDFQA0OnO0+dJz3up23TvvYGEqF3r9oDh5jT6Tz
	 LU7+JPg5S1S7DzAV6nq6eqXERKcSu9hrDCXUVU6n44sbnjpELDWkdhsT76qSlVRMnNPIc
	 oDFX5NC7RQCB/ChPkFOtP9ZrRv0PbqIZctrtfREQIJhKsiTv3q8vEi+afG/JNm+32Vv1m
	 tKhVYnymNmnIVO3nd0gkc8O5WN6pPZQonCAYOk7QiUq1SC0VX2mNxcBA7wTKLQGqGzzr+
	 lgMP6GczxWW2nJkk6U1hCSEXDSEHybL1cKpzcs8Mku5Z9VIZESQbJUeXv7Qdlc35jIA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792537982;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=dh/bnyT0JBbnLv1h/bnk9lroIsEMrvUJ0+PR9gCLBfQ=;
	b=PWxfWvGGQ7JqfQN1Um4NXk1z9vCMkOTyyYC4p+pzKEnMyzlZefKTJoYRhLcurXV4lgR8
	 64DYcEOHvUwlGRyMvQrHso967Odtsdb0fl3ZThwrDq9x7GTmxQldwkjsaekfhBswMjjZY
	 xqcebYFu7u3Z5NUHi38LwF43DeAkaRBhpCjCKhzEVfIzO9Ns0PZFGmngQ0mJ2/izKFufc
	 vVTqRUB9/UO/doUxCrGZNCQImIe/ZiQqWXoa6LpFrtb5rJg0iYE0IwQtcYe0DpHmrjt7v
	 KKM9Nxo0UMCVISf+kuP8LopNfXN2DS1tDETvqXlJ8BqKiGkOh/CN0SX9ae5sXMWoPIg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=nuxs8QOm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5246606A32F
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 23:13:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5246606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=nuxs8QOm
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-35829219da8so1542225eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 16:13:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792537981; cv=none;
        d=google.com; s=arc-20260327;
        b=KhUEfb3/Z+ZYLsxkDBXW3TrajHtEKRqn7Zn+WfmReQAFwwtMESCu6QrOQ+KkLJ85Pg
         G6Y9vdPEjWPi5No7Pgr7Q3HUh65uoFPMpB7YqgZNR4wAdObqrSfNMFgd+Dp/G4n0nu5A
         qN7YGUhCBbbhTqikDd1JiAFvpT668dv6J+F+lbAPJ2On3aNJzd0ePE19g6E8d3QIpTQ9
         j/yAEt2hdeIlC470b6m7o/7tDcit+LXl4G2+yaWuGloQvnc0wmZfq80s1nhK9G2S6KBf
         fNxHFL1UgO2fLw5qEg4ItvlWDOekjudUjKgBwepfzdyZG7pVpaqBe0MO4iDsPZEWLa5W
         tt0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dh/bnyT0JBbnLv1h/bnk9lroIsEMrvUJ0+PR9gCLBfQ=;
        fh=ixzyhutSPJqJUxz96dx0eKCo0OoEGuhjUudaMoC0MKk=;
        b=Qz+LOnAOydCZjeL+kccfYGNgtCtqkUNG9v+u3DTSetF16QtrHI2oEvG+o0ZoX9mxK+
         Abzsqpo6ZJHq1lKk3z3/ALj1vHIFZDB5lPteHKlXWyTgc1mAqMAvhfm3P7G5UJdI8ve/
         wkzwOPNioS+n3IXVmSZzSdTpbFG2ShDt+mxDqJREje1JWkwmYLBsk5kI+WlVawFBxvpK
         4KontGuUHzsR1MVY1P0s6QWJFl+c0gAcmXrQv1Z1RC95aaKt8aCdlvT310jkzVDNxf5d
         Ki0i4S3YWzdyrKcB6IrTODTuz2OYRWobNbg+zVFT9WJAlVTMf78trRxFaDUIHy/aBnGK
         KptA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792537981; x=1793142781; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dh/bnyT0JBbnLv1h/bnk9lroIsEMrvUJ0+PR9gCLBfQ=;
        b=nuxs8QOmReUEh7t0OlmOOhq7K15+VDqy7drqi8jkgIV/oe4HXWDYTV4pCOjalCN5MI
         FZm0sHfPVwq34qBL5JnLiYFfT4EE23mpQt93upGPnvILC0E990BOUxENCnEFiTEoVnXa
         oHbWq9BrUAEClrlyEpxouWSsvNfY6IN6ZRgHsANIcHrkRosEho6Zh1H9PuKW+/3aY0Ob
         qDfGZ8uuivEEs10xB50lecXfJ/zclWJFvS3JdKD7pITO9mSShT69qxF/Gd3GMNzKAEge
         NNE/iizphuAiOZVK5oj+Uv3kco0FmSHjMzlUB9Dgwx7SfAcKLvpabyI0rtgJNymA0OFH
         waVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792537981; x=1793142781;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dh/bnyT0JBbnLv1h/bnk9lroIsEMrvUJ0+PR9gCLBfQ=;
        b=sQ2t5qi9vIDHOVtnpx178QHwygWwF4Zz4xEFtBO2uzxutHdvYGIysVM7U1ipgLPZIn
         crn9z0XJHWMJ805pjf1YT1da+dYqRyRl0Q6t2HCQDiecKG17wdaI7Fw6ZmgUv7bQmJaE
         1qj/u6C3uvqtXQctnNH7drstnh70V8U5G+2niXzXds8RyvB+4pJjuxEfl7Vd4XBzKt7m
         rqai07qjWlBAr+OR4ymtOzvO8te2EXFObHp6BLcuVHjibUmDZJSRI2ku00CRRaVjz4Sr
         YKGRrCoEt0aEIs6gyUrE0eq0YXhO7CJMH4s/QNBTl1qYgut5GHuFCb6k6yg2Azrb6vAf
         QRjQ==
X-Forwarded-Encrypted: i=1; AKwUvBzbESPjkSzf+f5aD9W7eVAkpcgPfm5M7qmjUteIik7SdpDH/1mzxavJ+BjxxU7/r5Ity4EWCDsOf0Sh9Ys=@vger.kernel.org
X-Gm-Message-State: AFq9FYJlQN5+KAHjOeTODIPR3bMxBhksy61XdpKuXC9gIUakFtW43KFQ
	0vDo/eIFebajcOLtjRZq00JN+PduWwOpKIVNPUhxi3y1sRcIVkpHLoKel7k8eFneMCqp7hZbULM
	bpTGEyb/EJaLaHVSigCfUZB3nluUBCwkPZjrSgMQC
X-Gm-Gg: AYBFou3EYsCCzn13yhbOAZVJLpHfxmQFhinT07QA6N9iuHTe5tc7i3jZw+mIzKbX9Xz
	Wj5xf1JQqZbjmjPPOZCmNDM2vpi/ymlpuKLCa9EVZrHhoH8BHlB+PpgUMoVWOZjSFQg59mn2ZbA
	aDUIljV7gsiN2zEf8ByCnys+spRKa9NKG0YJT9KcXe0arHptvYB08WBiF+sSLuxE2YnfW2+6BtQ
	gffHEtambftxjNRfg1W75//T9yGexRARiM9zR6H1m+asiMBkbY0Tc74fcAilj15QsjSm0/kUMc/
	Rp3Msp+Tk4mTkQteKB0astlF1ocbXPDBDIfya/TmVZDVTtwPZF+rvsdIZDjYyw72o/7waFSjKFC
	AYRtnoz9QRRl4Ct5cxb/eta97rMkIrUAme70ugI5qlMUuDjciEK+7rvH50IewbJ2I6cqSIR0Svp
	xEWnr98It/ImOg
X-Received: by 2002:a05:701b:2044:20b0:183:840:1dad with SMTP id
 a92af1059eb24-18dbed50064mr4482643c88.14.1792537980138; Tue, 20 Oct 2026
 16:13:00 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019164241.403644-1-bwicaksono@nvidia.com>
 <20261019164241.403644-5-bwicaksono@nvidia.com> <CAP-5=fWucvdYefDOL3Vn=O=YUPEXE+tngDDfPLv-T5i3WkCJVA@mail.gmail.com>
 <SA1PR12MB67736E99ABA9C126A0E1981EA0672@SA1PR12MB6773.namprd12.prod.outlook.com>
In-Reply-To: <SA1PR12MB67736E99ABA9C126A0E1981EA0672@SA1PR12MB6773.namprd12.prod.outlook.com>
From: Chun-Tse Shao <ctshao@google.com>
Date: Tue, 20 Oct 2026 16:12:23 -0700
X-Gm-Features: AclHuK_aNU9kdVSWftIMnRxZ_SwJiwDfg6lcnasTAbePSdlmJHCQQpEbZ_yaUCY
Message-ID: <CAJpZYjVxpQNCjvhK3mmaOiiG8sgJr4EdUwNCn+gVLH=F6Xh0Kg@mail.gmail.com>
Subject: Re: [PATCH 4/6] perf jevents: Add support for NVIDIA Tegra410
 PCIE-TGT PMU aliasing
To: Besar Wicaksono <bwicaksono@nvidia.com>
Cc: Ian Rogers <irogers@google.com>, "acme@kernel.org" <acme@kernel.org>, 
	"namhyung@kernel.org" <namhyung@kernel.org>, 
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Vikram Sethi <vsethi@nvidia.com>, 
	Rich Wiley <rwiley@nvidia.com>, Sean Kelley <skelley@nvidia.com>, Matt Ochs <mochs@nvidia.com>, 
	Raj Joshi <rajjoshi@nvidia.com>, Thierry Reding <treding@nvidia.com>, 
	Jon Hunter <jonathanh@nvidia.com>, "john.garry@linux.dev" <john.garry@linux.dev>, 
	"will@kernel.org" <will@kernel.org>, "james.clark@linaro.org" <james.clark@linaro.org>, 
	"mike.leach@arm.com" <mike.leach@arm.com>, "leo.yan@linux.dev" <leo.yan@linux.dev>, 
	"mark.rutland@arm.com" <mark.rutland@arm.com>, 
	"alexander.shishkin@linux.intel.com" <alexander.shishkin@linux.intel.com>, "jolsa@kernel.org" <jolsa@kernel.org>, 
	"adrian.hunter@intel.com" <adrian.hunter@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 3:01=E2=80=AFPM Besar Wicaksono <bwicaksono@nvidia.=
com> wrote:
>
>
>
> > -----Original Message-----
> > From: Ian Rogers <irogers@google.com>
> > Sent: Monday, October 19, 2026 11:18 PM
> > To: Besar Wicaksono <bwicaksono@nvidia.com>
> > Cc: acme@kernel.org; namhyung@kernel.org; linux-tegra@vger.kernel.org;
> > linux-arm-kernel@lists.infradead.org; linux-perf-users@vger.kernel.org;
> > linux-kernel@vger.kernel.org; Vikram Sethi <vsethi@nvidia.com>; Rich Wi=
ley
> > <rwiley@nvidia.com>; Sean Kelley <skelley@nvidia.com>; Matt Ochs
> > <mochs@nvidia.com>; Raj Joshi <rajjoshi@nvidia.com>; Thierry Reding
> > <treding@nvidia.com>; Jon Hunter <jonathanh@nvidia.com>;
> > john.garry@linux.dev; will@kernel.org; james.clark@linaro.org;
> > mike.leach@arm.com; leo.yan@linux.dev; mark.rutland@arm.com;
> > alexander.shishkin@linux.intel.com; jolsa@kernel.org;
> > adrian.hunter@intel.com; ctshao@google.com
> > Subject: Re: [PATCH 4/6] perf jevents: Add support for NVIDIA Tegra410
> > PCIE-TGT PMU aliasing
> >
> > External email: Use caution opening links or attachments
> >
> >
> > On Mon, Oct 19, 2026 at 9:45=E2=80=AFAM Besar Wicaksono
> > <bwicaksono@nvidia.com> wrote:
> > >
> > > Add alias support for NVIDIA Tegra410 PCIE-TGT PMU events and metrics=
.
> > >
> > > Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
> > > ---
> > >  .../nvidia/t410/sys/uncore-pcie_tgt.json      | 93 +++++++++++++++++=
++
> > >  1 file changed, 93 insertions(+)
> > >  create mode 100644 tools/perf/pmu-
> > events/arch/arm64/nvidia/t410/sys/uncore-pcie_tgt.json
> > >
> > > diff --git a/tools/perf/pmu-events/arch/arm64/nvidia/t410/sys/uncore-
> > pcie_tgt.json b/tools/perf/pmu-
> > events/arch/arm64/nvidia/t410/sys/uncore-pcie_tgt.json
> > > new file mode 100644
> > > index 000000000000..74786fc3d578
> > > --- /dev/null
> > > +++ b/tools/perf/pmu-events/arch/arm64/nvidia/t410/sys/uncore-
> > pcie_tgt.json
> > > @@ -0,0 +1,93 @@
> > > +[
> > > +    {
> > > +        "EventCode": "0x4",
> > > +        "EventName": "PCIE_TGT_CYCLES",
> > > +        "BriefDescription": "Counts cycles at the PCIe interface to =
the Tegra
> > SoC data fabric.",
> > > +        "PublicDescription": "Counts cycles at the PCIe interface to=
 the Tegra
> > SoC data fabric.",
> > > +        "Compat": "1070036b",
> > > +        "Unit": "nvidia_pcie_tgt_pmu_,rc_"
> >
> > It looks like the PMU names are broken because of the _rc_ in their nam=
es:
> > https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/=
tree
> > /drivers/perf/arm_cspmu/nvidia_cspmu.c#n901
> > ```
> >    .name_pattern =3D "nvidia_pcie_pmu_%u_rc_%u",
> > ```
> > The convention is for either a numeric (preferable) or hexadecimal suff=
ix:
> > https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/=
tree
> > /Documentation/ABI/testing/sysfs-bus-event_source-devices
> > Extra information about the PMU belongs in a caps file.
> >
>
> Hi Ian,
>
> Thanks for the pointers.
>
> My interpretation is the ABI document doesn=E2=80=99t prevent driver from=
 naming
> the PMU with multiple numbering format. Other PMUs already did this,
> e.g. HiSilicon hisi_sccl<sccl>_ddrc<n>, Arm NI arm_ni_<ni>_cd_<cd> and
> Qualcomm l3cache_<x>_<y>.

Hi Besar,

The ABI only defines a single _<num> suffix, and that is all perf
supports. perf treats `nvidia_pcie_pmu_0_rc_*` and
`nvidia_pcie_pmu_1_rc_*` as two different PMUs, which is the root
cause of the reporting issues you listed. The hisi_sccl, arm_ni and
Qualcomm PMUs have the same problem.

We can always add a new naming format to the ABI and perf, but each
new format makes PMU name handling harder to maintain.

A PMU per rc, for example, `nvidia_pcie_pmu_<rc>` with one cpu per
socket in its `cpumask` (like Intel uncore_imc_<n>), works with perf
as is.

Thanks,
CT

>
> > By definition nothing can work with wildcard matching using the
> > existing PMU name, so please rename it. If a new suffix convention is
> > necessary then  you should update the ABI and perf tool suffix
> > matching logic like pmu_name_len_no_suffix:
> > https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/=
tree
> > /tools/perf/util/pmus.c#n65
> >
>
> The JSON "Unit" attribute takes a comma-separated form:
> "nvidia_pcie_pmu_,rc_", like HiSilicon's "hisi_sccl,ddrc", which
> perf_pmu__match_wildcard_uncore() matches against "socketX_pmunameY"
> names. The issues seem to be on the reporting side. The counting looks ok=
.
> I guess JSON "Unit" matching logic is not applied everywhere in perf.
>
> For example below is the counting from my 2-socket machine.
>
> Test workload: read 4 GiB from an NVMe on socket 0 RC 0 and 8 GiB from an=
 NVMe
> on socket 1 RC 0, in parallel (dd ... of=3D/dev/null iflag=3Ddirect).
>
> Counting is correct with the wildcards:
>
> $ perf stat -a -e 'nvidia_pcie_pmu_0_rc*/PCIE_WR_BYTES/,nvidia_pcie_pmu_1=
_rc*/PCIE_WR_BYTES/' -- <workload>
>      4,362,223,228      nvidia_pcie_pmu_0_rc*/PCIE_WR_BYTES/
>      8,623,751,168      nvidia_pcie_pmu_1_rc*/PCIE_WR_BYTES/
>
> $ perf stat -a --per-socket -e 'nvidia_pcie_pmu_*_rc_0/PCIE_WR_BYTES/' --=
 <workload>
> S268435456    1      4,362,207,232      nvidia_pcie_pmu_0_rc_0/nvidia_pci=
e_pmu_*_rc_0,PCIE_WR_BYTES/
> S285212672    1      8,724,414,784      nvidia_pcie_pmu_1_rc_0/nvidia_pci=
e_pmu_*_rc_0,PCIE_WR_BYTES/
>
> The reporting is where it goes wrong:
>
> 1) RC 0 of all sockets is not merged into one line, and the wildcard
>      ends up in the event name:
>
> $ perf stat -a -e 'nvidia_pcie_pmu_*_rc_0/PCIE_WR_BYTES/' -- <workload>
>      4,311,875,584      nvidia_pcie_pmu_0_rc_0/nvidia_pcie_pmu_*_rc_0,PCI=
E_WR_BYTES/
>      8,623,751,168      nvidia_pcie_pmu_1_rc_0/nvidia_pcie_pmu_*_rc_0,PCI=
E_WR_BYTES/
>
> 2) The json event is split per socket, and each line is labelled with
>       RC 0 although it is the sum of all RCs of that socket:
>
> $ perf stat -a -e PCIE_WR_BYTES -- <workload>
>      4,311,880,848      nvidia_pcie_pmu_0_rc_0/PCIE_WR_BYTES/
>      8,724,414,784      nvidia_pcie_pmu_1_rc_0/PCIE_WR_BYTES/
>
> 3) The metric is computed per socket, instead of total. With --metric-onl=
y both values
>      end up under one header, and the reader can't tell which socket is
>      which:
>
> $ perf stat -a -M pcie_avg_wr_bandwidth_to_all_dst --metric-only -- <work=
load>
>  MB/s  pcie_avg_wr_bandwidth_to_all_dst
>                                 3113.5                                622=
7.0
>
> 4) With --per-socket, each row shows both copies: the other socket's
>    copy prints nan, and socket 1's counters is 0 instead of 6:
>
> $ perf stat -a --per-socket -M pcie_avg_wr_bandwidth_to_all_dst --metric-=
only -- <workload>
>        MB/s  pcie_avg_wr_bandwidth_to_all_dst
> S268435456    6                                 3127.5                   =
                nan
> S285212672    0                                    nan                   =
             6182.8
>
> $ perf stat -a --per-socket -j -M pcie_avg_wr_bandwidth_to_all_dst --metr=
ic-only -- <workload>
> {"socket" : "S268435456", "counters" : 6, "MB/s  pcie_avg_wr_bandwidth_to=
_all_dst" : "3087.8", "MB/s  pcie_avg_wr_bandwidth_to_all_dst" : "none"}
> {"socket" : "S285212672", "counters" : 0, "MB/s  pcie_avg_wr_bandwidth_to=
_all_dst" : "none", "MB/s  pcie_avg_wr_bandwidth_to_all_dst" : "6247.8"}
>
> All of these, I think, come from perf treating nvidia_pcie_pmu_0_rc_* and
> nvidia_pcie_pmu_1_rc_* as two different PMUs instead of one PMU, i.e
> nvidia_pcie_pmu.
>
> I will investigate further and see if I can come up with a perf patch to =
fix this.
>
> Regards,
> Besar
>
> > Thanks,
> > Ian Rogers
> >
>

On Tue, Oct 20, 2026 at 3:01=E2=80=AFPM Besar Wicaksono <bwicaksono@nvidia.=
com> wrote:
>
>
>
> > -----Original Message-----
> > From: Ian Rogers <irogers@google.com>
> > Sent: Monday, October 19, 2026 11:18 PM
> > To: Besar Wicaksono <bwicaksono@nvidia.com>
> > Cc: acme@kernel.org; namhyung@kernel.org; linux-tegra@vger.kernel.org;
> > linux-arm-kernel@lists.infradead.org; linux-perf-users@vger.kernel.org;
> > linux-kernel@vger.kernel.org; Vikram Sethi <vsethi@nvidia.com>; Rich Wi=
ley
> > <rwiley@nvidia.com>; Sean Kelley <skelley@nvidia.com>; Matt Ochs
> > <mochs@nvidia.com>; Raj Joshi <rajjoshi@nvidia.com>; Thierry Reding
> > <treding@nvidia.com>; Jon Hunter <jonathanh@nvidia.com>;
> > john.garry@linux.dev; will@kernel.org; james.clark@linaro.org;
> > mike.leach@arm.com; leo.yan@linux.dev; mark.rutland@arm.com;
> > alexander.shishkin@linux.intel.com; jolsa@kernel.org;
> > adrian.hunter@intel.com; ctshao@google.com
> > Subject: Re: [PATCH 4/6] perf jevents: Add support for NVIDIA Tegra410
> > PCIE-TGT PMU aliasing
> >
> > External email: Use caution opening links or attachments
> >
> >
> > On Mon, Oct 19, 2026 at 9:45=E2=80=AFAM Besar Wicaksono
> > <bwicaksono@nvidia.com> wrote:
> > >
> > > Add alias support for NVIDIA Tegra410 PCIE-TGT PMU events and metrics=
.
> > >
> > > Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
> > > ---
> > >  .../nvidia/t410/sys/uncore-pcie_tgt.json      | 93 +++++++++++++++++=
++
> > >  1 file changed, 93 insertions(+)
> > >  create mode 100644 tools/perf/pmu-
> > events/arch/arm64/nvidia/t410/sys/uncore-pcie_tgt.json
> > >
> > > diff --git a/tools/perf/pmu-events/arch/arm64/nvidia/t410/sys/uncore-
> > pcie_tgt.json b/tools/perf/pmu-
> > events/arch/arm64/nvidia/t410/sys/uncore-pcie_tgt.json
> > > new file mode 100644
> > > index 000000000000..74786fc3d578
> > > --- /dev/null
> > > +++ b/tools/perf/pmu-events/arch/arm64/nvidia/t410/sys/uncore-
> > pcie_tgt.json
> > > @@ -0,0 +1,93 @@
> > > +[
> > > +    {
> > > +        "EventCode": "0x4",
> > > +        "EventName": "PCIE_TGT_CYCLES",
> > > +        "BriefDescription": "Counts cycles at the PCIe interface to =
the Tegra
> > SoC data fabric.",
> > > +        "PublicDescription": "Counts cycles at the PCIe interface to=
 the Tegra
> > SoC data fabric.",
> > > +        "Compat": "1070036b",
> > > +        "Unit": "nvidia_pcie_tgt_pmu_,rc_"
> >
> > It looks like the PMU names are broken because of the _rc_ in their nam=
es:
> > https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/=
tree
> > /drivers/perf/arm_cspmu/nvidia_cspmu.c#n901
> > ```
> >    .name_pattern =3D "nvidia_pcie_pmu_%u_rc_%u",
> > ```
> > The convention is for either a numeric (preferable) or hexadecimal suff=
ix:
> > https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/=
tree
> > /Documentation/ABI/testing/sysfs-bus-event_source-devices
> > Extra information about the PMU belongs in a caps file.
> >
>
> Hi Ian,
>
> Thanks for the pointers.
>
> My interpretation is the ABI document doesn=E2=80=99t prevent driver from=
 naming
> the PMU with multiple numbering format. Other PMUs already did this,
> e.g. HiSilicon hisi_sccl<sccl>_ddrc<n>, Arm NI arm_ni_<ni>_cd_<cd> and
> Qualcomm l3cache_<x>_<y>.
>
> > By definition nothing can work with wildcard matching using the
> > existing PMU name, so please rename it. If a new suffix convention is
> > necessary then  you should update the ABI and perf tool suffix
> > matching logic like pmu_name_len_no_suffix:
> > https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/=
tree
> > /tools/perf/util/pmus.c#n65
> >
>
> The JSON "Unit" attribute takes a comma-separated form:
> "nvidia_pcie_pmu_,rc_", like HiSilicon's "hisi_sccl,ddrc", which
> perf_pmu__match_wildcard_uncore() matches against "socketX_pmunameY"
> names. The issues seem to be on the reporting side. The counting looks ok=
.
> I guess JSON "Unit" matching logic is not applied everywhere in perf.
>
> For example below is the counting from my 2-socket machine.
>
> Test workload: read 4 GiB from an NVMe on socket 0 RC 0 and 8 GiB from an=
 NVMe
> on socket 1 RC 0, in parallel (dd ... of=3D/dev/null iflag=3Ddirect).
>
> Counting is correct with the wildcards:
>
> $ perf stat -a -e 'nvidia_pcie_pmu_0_rc*/PCIE_WR_BYTES/,nvidia_pcie_pmu_1=
_rc*/PCIE_WR_BYTES/' -- <workload>
>      4,362,223,228      nvidia_pcie_pmu_0_rc*/PCIE_WR_BYTES/
>      8,623,751,168      nvidia_pcie_pmu_1_rc*/PCIE_WR_BYTES/
>
> $ perf stat -a --per-socket -e 'nvidia_pcie_pmu_*_rc_0/PCIE_WR_BYTES/' --=
 <workload>
> S268435456    1      4,362,207,232      nvidia_pcie_pmu_0_rc_0/nvidia_pci=
e_pmu_*_rc_0,PCIE_WR_BYTES/
> S285212672    1      8,724,414,784      nvidia_pcie_pmu_1_rc_0/nvidia_pci=
e_pmu_*_rc_0,PCIE_WR_BYTES/
>
> The reporting is where it goes wrong:
>
> 1) RC 0 of all sockets is not merged into one line, and the wildcard
>      ends up in the event name:
>
> $ perf stat -a -e 'nvidia_pcie_pmu_*_rc_0/PCIE_WR_BYTES/' -- <workload>
>      4,311,875,584      nvidia_pcie_pmu_0_rc_0/nvidia_pcie_pmu_*_rc_0,PCI=
E_WR_BYTES/
>      8,623,751,168      nvidia_pcie_pmu_1_rc_0/nvidia_pcie_pmu_*_rc_0,PCI=
E_WR_BYTES/
>
> 2) The json event is split per socket, and each line is labelled with
>       RC 0 although it is the sum of all RCs of that socket:
>
> $ perf stat -a -e PCIE_WR_BYTES -- <workload>
>      4,311,880,848      nvidia_pcie_pmu_0_rc_0/PCIE_WR_BYTES/
>      8,724,414,784      nvidia_pcie_pmu_1_rc_0/PCIE_WR_BYTES/
>
> 3) The metric is computed per socket, instead of total. With --metric-onl=
y both values
>      end up under one header, and the reader can't tell which socket is
>      which:
>
> $ perf stat -a -M pcie_avg_wr_bandwidth_to_all_dst --metric-only -- <work=
load>
>  MB/s  pcie_avg_wr_bandwidth_to_all_dst
>                                 3113.5                                622=
7.0
>
> 4) With --per-socket, each row shows both copies: the other socket's
>    copy prints nan, and socket 1's counters is 0 instead of 6:
>
> $ perf stat -a --per-socket -M pcie_avg_wr_bandwidth_to_all_dst --metric-=
only -- <workload>
>        MB/s  pcie_avg_wr_bandwidth_to_all_dst
> S268435456    6                                 3127.5                   =
                nan
> S285212672    0                                    nan                   =
             6182.8
>
> $ perf stat -a --per-socket -j -M pcie_avg_wr_bandwidth_to_all_dst --metr=
ic-only -- <workload>
> {"socket" : "S268435456", "counters" : 6, "MB/s  pcie_avg_wr_bandwidth_to=
_all_dst" : "3087.8", "MB/s  pcie_avg_wr_bandwidth_to_all_dst" : "none"}
> {"socket" : "S285212672", "counters" : 0, "MB/s  pcie_avg_wr_bandwidth_to=
_all_dst" : "none", "MB/s  pcie_avg_wr_bandwidth_to_all_dst" : "6247.8"}
>
> All of these, I think, come from perf treating nvidia_pcie_pmu_0_rc_* and
> nvidia_pcie_pmu_1_rc_* as two different PMUs instead of one PMU, i.e
> nvidia_pcie_pmu.
>
> I will investigate further and see if I can come up with a perf patch to =
fix this.
>
> Regards,
> Besar
>
> > Thanks,
> > Ian Rogers
> >
>
