Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793383638;
	b=hJBeaKtbmHiJcb3S/frV2yEzIzoHfE9yzf7IepXu6TFCZuhF34qB6QTwjXsbVK/af4so
	 tbAii8eghhVVM8hT9iizfRiVYfBc4HYXLhFvODxLQTb5jKTbz//nfzDXABO+rOcmTSAMf
	 J5Qk3yV4KsCuZ937xdNbUgZbyX+eH6X5TgER8wgWD7AcZpGa3pWZTFKVHBuGCTHJqfYxK
	 bMUJH9eFjbywTN/4OnrbNP+T7Bt6bZDIncCnlHlBPhaeQgQoNdJCTzE4srHNEz1a4nxBO
	 lXTsclai/ghFzJYLUxa2q+wQnuU4us2LmyyqsNAP8TV2NNxoT8LVSVfowMEYMm/QfZA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793383638;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Yee/M/vhaQksyDRzfPy2oYsyP6s0T7Yq+RK3mjeMx4U=;
	b=JKXkcrZkhw3dOqDAA36P+byy0fDUf1GSkFMQiveZEc2AfMiEOBznE+UO/GxRz8Lbext0
	 8G99lLauPgGLDYI8axnkLLL+GySvsNhHEd5TfsSMN2jTxOtrt5ItJNixXPopFCm3627nM
	 7EBxOVNDsaB7XhCJgrfniWw+T499rIb2iwnAqAVFA5OdJ5YEP/oU4+BeLaIylXNXXvHrq
	 h6HvbinHDeUK5F0HYwAK8tf3JzfNLkwTUspHX3cnvzQgxQN9+1b8VqLJROgR2CHz866n5
	 CpBy9oO1A6WBPzrJhmTgDO/zl1c18H7mlF3hXB17Uiglt1xF2en8ESHFHq+IZLnfxUQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=MFZfb5uU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD1E606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 18:07:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFD1E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=MFZfb5uU
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-194d0c31715so539c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:07:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793383637; cv=none;
        d=google.com; s=arc-20260327;
        b=ixWTGLCmCKupyY3KqwnFQxdwnFbAk9H6L6dOFOIa9nSA3dCaQs3vy//Iab1v7HAeqO
         zL5PquOxFpGF7hNFQBBGbUkuCik3W2OVId+gWwHNOlqoq9QFI9cefr2EycmrjRD0EWdJ
         053l5Rp1unvgucMPNxKWqQWq9MBHkFp+39PtaJ6bZE5LovHAhB09IhqX4trh9DTDq8f/
         nNnCRLMcdi5Wbd8t0WiWxDzTY7Tvrnj3yd7P/XDOoEylHJPwt78PbPDhOt46cZzSgzuY
         E+ciu4oXF3t82HFf5VGsd97rKkkrs83DG4fkzRBvb3kylk5DZZHIsLwLyi+OHm/cTD6z
         KMaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Yee/M/vhaQksyDRzfPy2oYsyP6s0T7Yq+RK3mjeMx4U=;
        fh=6mOxTCx/S4Hax9i3Ky9lthWpYFNlcuksH8L4NtY/WHI=;
        b=eaod/PaV3RXcCBifSVn41xydf+GqplBhokGiFQ3InmJWp2YTjwgLOhED3SHHuJlDNk
         fqnu61x/itsPdCCSEny7vDuPplCTpfPsf5y97SR+aF+wjofoDX4SB9Ki5OPObLZyFSm4
         6gWUn8hBicYHhSysIky9bjziWl6dLjGtym1cKVdOvEQoinxDR/ET2tK+T0l5ZEZE0sJJ
         N0oFt5WPpfE/qRNvJkg5m2ZJErRt7UiVy9w2lxIqxm2xzhMLl3BrMvq1oG4X7Ru//WtE
         H97RIs7P89JjbZewXCIX0o/vIRdcl3sR4umtLM+tP1UNK0HymJzjPz3Fm2EHV5I+Cqsk
         SUiQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793383637; x=1793988437; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Yee/M/vhaQksyDRzfPy2oYsyP6s0T7Yq+RK3mjeMx4U=;
        b=MFZfb5uUpuPCKMoHiVswKA/CTet+ZjcCeKaMZc49/8un4YNIWAQ3A8wCFBFo8/0r4T
         I2MjO0Fwvj8mIfoKuXZ7VuNbagzXrJOww583+uv+LHGfuY2+WKUdxVTbuz9dupXYrEJB
         fX8UdXPueXf4LO3Y5pf7ZvQuU8o8f4oqpcrzWlIy2HDC45qTZmCVCRv99JmAwDpFPXnS
         ZzJadKqFJV/s3uC2+vE/lGmi3ByS56aw+1VBeshQ0cR9WrtRmtRBsM/ZtUZDGK98vudB
         p1QaHqobJLbTc2PCqLn+FVzHgDboERmc0JsL4Tvznxmla3Qw3QxCUTYkeJYsI7Owbfdm
         WChg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793383637; x=1793988437;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yee/M/vhaQksyDRzfPy2oYsyP6s0T7Yq+RK3mjeMx4U=;
        b=E9eZVYtwH/o+P7vTkMvIDSCElgmVtdVPu74TEnw2EEGkyZEexZ4wFyex3u1WhjiOP+
         0wS3tvRu7B+WRYsi8M1bXsLuwbQbQhi1c2woIGW4MaXsTqmXBXVIxJY3P144DDTIsxNc
         SlhGTeQH6Y6c69PZRX8yl5+XRJORS8ERQkoWkiwhyBWctL627kEKAbGbY/+kxaJiMDJk
         0cKNbNgxoyNjPI18sk41ORYrtwK/RUKx9c/J7d7Sex0S3aU10jLHzE2V4F6kFJJPWQ01
         ronqEEZwPqdKmCnuuyRpwrgSpOPnIHqVC7ScFavyusnZR4JZ4nDoalERLlHlZnSAY3iV
         yb6w==
X-Forwarded-Encrypted: i=1; AKwUvBxWYpW2WaImzyQ4D0WmzfBlfyo4AIrihH/A0m9BK4C5NN/XFxx/2KjdAHPtw2yEh05DSvX6/6udCNOdGxc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJaqZ0lImPsTdh3JbqsZgRx28BCKu4wiwvciGUk6X6VcYEVOiyk
	atxYujVaVFlT8RKgQllk7/GWvCGj5LY7Lm1/edNtAafd+86IX+WbQv2fNL0jfcSBCZ/zGz0gaHR
	7se7MSnA2IHOk0cF7t6uwfIOC7Q5bwE08skdCm0K7
X-Gm-Gg: AYBFou2WJWI3NfMKV+VTCpYi8/ZYg/r54Bkx43YqqmgnMmz+vzzFC6rpuJbhhpaYh7h
	GQed+P5qlORynNaAk1dEkSKyW4i4++ZXN+fjw//29wvrboDQsK+bssParkvrGuhrZlcXNyRNQ1E
	RAZe4QmuS4S4KJqE8+t6MV3X0ouTlG9GE9Ke8ivf29E0V5ugg/APwgi3Jg1mkQhk0iJOaZDlUB2
	SmB+XqR11nk9LrcZ5vkRDxjaEL46r2xfY67VZegQIAMTSx6y4f17Z4ncUZitx2JRFDZAe9Fuz0z
	ZcMYq1GU/TzHhY149uzAvTKY09zwAu7s3xtbyytSqLy/L2U4tIX7vzf2bmn47IRrhYdjnKkuQ8C
	rulZGRJLiZ93+KwYBFd22ho6IVu7Sxj5+d6wcfPVljoh8uDnFzOAGR7QzRsXG2gEUagQEGgNJzu
	dhOjW7UPGGluMiaQ==
X-Received: by 2002:a05:701b:418f:10b0:162:1b69:fe06 with SMTP id
 a92af1059eb24-1a99bfb8c44mr948799c88.14.1793383635496; Fri, 30 Oct 2026
 11:07:15 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030174816.1544471-1-bwicaksono@nvidia.com>
In-Reply-To: <20261030174816.1544471-1-bwicaksono@nvidia.com>
From: Ian Rogers <irogers@google.com>
Date: Fri, 30 Oct 2026 11:07:03 -0700
X-Gm-Features: AclHuK_KkDFZvz94Iv9OiENJydeV5pIlSlXsWtxJeGMUrrlYUp2oAVSujcV7xFQ
Message-ID: <CAP-5=fUEmNrREh-ipxYMiStr5xCakGDBZW8OmAj1rhACs8qaZw@mail.gmail.com>
Subject: Re: [PATCH v2 0/9] perf: Add NVIDIA Tegra410 uncore PMU events and metrics
To: Besar Wicaksono <bwicaksono@nvidia.com>
Cc: acme@kernel.org, namhyung@kernel.org, ctshao@google.com, 
	linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	vsethi@nvidia.com, rwiley@nvidia.com, skelley@nvidia.com, mochs@nvidia.com, 
	rajjoshi@nvidia.com, treding@nvidia.com, jonathanh@nvidia.com, 
	john.garry@linux.dev, will@kernel.org, james.clark@linaro.org, 
	mike.leach@arm.com, leo.yan@linux.dev, mark.rutland@arm.com, 
	alexander.shishkin@linux.intel.com, jolsa@kernel.org, adrian.hunter@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2026 at 10:49=E2=80=AFAM Besar Wicaksono <bwicaksono@nvidia=
.com> wrote:
>
> Add event aliases and derived metrics for the NVIDIA Tegra410 uncore
> PMUs, and fix perf's aggregation of PMU instances that are numbered in
> more than one parts in their name.
>
> The series covers the UCF, PCIe, PCIe target, CPU memory latency, and
> chip-to-chip interconnect PMUs. It provides symbolic names for the raw
> event encodings and metrics for bandwidth, frequency, and average read
> latency.
>
> The PCIe and PCIe target PMUs are named nvidia_pcie_pmu_<socket>_rc_<rc>
> and nvidia_pcie_tgt_pmu_<socket>_rc_<rc>. Their json Unit uses the
> existing comma-separated form ("nvidia_pcie_pmu_,rc_"), but perf only
> merged instances that differ in the trailing number, so these events and
> metrics gave one result per socket and were reported incorrectly (e.g.
> with --metric-only), as discussed in v1. Patches 6-9 fix this:
>
> - Patch 6 adds a check of the cpumasks of all merged PMU instances to the
>   zero-count skip in perf stat, so a socket that counts nothing shows 0
>   instead of having its row hidden.
> - Patch 7 merges PMU instances that match the same comma-separated json
>   Unit. This also applies to the HiSilicon hisi_sccl PMUs, which use the
>   same json form; not tested on HiSilicon hardware.
> - Patch 8 labels a merged uncore counter after all of its PMUs, e.g.
>   nvidia_pcie_pmu_*_rc_*/cycles/ or nvidia_ucf_pmu/cycles/, instead of
>   after the first instance, such as nvidia_pcie_pmu_0_rc_0/cycles/.
>   Output with --no-aggr is unchanged.
> - Patch 9 describes these PMU names in the ABI document.
>
> Changes in v2:
> - Move the uncore JSON out of the sys directory and remove the
>   "Compat" fields. Thanks to Ian Rogers for the feedback.
> - Drop "perf jevents: Process model files before sys subdirectories",
>   which this series no longer needs.
> - Add UCF SLC and memory bandwidth metrics from all sources to local
>   CMEM (read, write and read+write) and from local sources to local
>   CMEM and to remote memory, PCIe bandwidth metrics to local
>   destinations, and read+write bandwidth metrics for UCF SLC, UCF
>   memory and PCIe. Thanks to Chun-Tse Shao for the suggestion.
> - Add patches 6-9 to fix the PCIe instance aggregation. Thanks to Ian
>   Rogers and Chun-Tse Shao for the pointers.
>
> v1: https://lore.kernel.org/all/20261019164241.403644-1-bwicaksono@nvidia=
.com/

Why don't we look to fix code in drivers/perf? This series introduces
PMU instances, overloads the meaning of aliases, and a bunch of other
silly complexity due to poor reviews and maintenance of drivers/perf -
specifically by not pointing out the ABI issues. Isn't this a
straightforward, whoops we did a bad suffix and here's the patch to
rename our PMU in the driver? Throwing more complexity at the problem
doesn't feel like the right fix.

Thanks,
Ian

> Besar Wicaksono (9):
>   perf jevents: Add support for NVIDIA Tegra410 UCF PMU aliasing
>   perf jevents: Add support for NVIDIA Tegra410 PCIE PMU aliasing
>   perf jevents: Add support for NVIDIA Tegra410 PCIE-TGT PMU aliasing
>   perf jevents: Add support for NVIDIA Tegra410 CPU Memory Latency PMU
>     aliasing
>   perf jevents: Add support for NVIDIA Tegra410 C2C PMU aliasing
>   perf stat: Check merged PMU instance's cpumasks when skipping zero
>     counts
>   perf pmu: Merge PMU instances that match the same comma-separated json
>     Unit
>   perf evsel: Name a merged uncore counter after all of its PMUs
>   perf Documentation: Describe PMU names numbered in more than one place
>
>  .../testing/sysfs-bus-event_source-devices    |  14 +
>  .../arm64/nvidia/t410/uncore-cpu_mem.json     |  43 +
>  .../arm64/nvidia/t410/uncore-nvclink.json     |  67 ++
>  .../arm64/nvidia/t410/uncore-nvdlink.json     |  43 +
>  .../arm64/nvidia/t410/uncore-nvlink_c2c.json  | 115 +++
>  .../arch/arm64/nvidia/t410/uncore-pcie.json   | 249 ++++++
>  .../arm64/nvidia/t410/uncore-pcie_tgt.json    |  83 ++
>  .../arch/arm64/nvidia/t410/uncore-ucf.json    | 764 ++++++++++++++++++
>  tools/perf/tests/pmu.c                        | 134 +++
>  tools/perf/util/evlist.c                      |   2 +-
>  tools/perf/util/evsel.c                       |  83 +-
>  tools/perf/util/evsel.h                       |   2 +-
>  tools/perf/util/parse-events.c                |   2 +-
>  tools/perf/util/pmu.c                         |  65 ++
>  tools/perf/util/pmu.h                         |   9 +
>  tools/perf/util/pmus.c                        |  47 ++
>  tools/perf/util/pmus.h                        |   1 +
>  tools/perf/util/stat-display.c                |  20 +
>  18 files changed, 1737 insertions(+), 6 deletions(-)
>  create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/uncore-c=
pu_mem.json
>  create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/uncore-n=
vclink.json
>  create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/uncore-n=
vdlink.json
>  create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/uncore-n=
vlink_c2c.json
>  create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/uncore-p=
cie.json
>  create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/uncore-p=
cie_tgt.json
>  create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/uncore-u=
cf.json
>
> --
> 2.43.0
>
