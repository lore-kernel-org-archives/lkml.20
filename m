Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793809233;
	b=EP0U7HxLTBjLrbAnBVYRnoNvVrC8amCzJJiQfAf12STcYKkM8chW7hq9QvqJtpkVBOCo
	 Z5L/2ADU6j0vI20FSwn6PI7bcs6iHZ9tYLn0rwz41AcErEMf1vr7PygV+vUJNpCFhiX8Y
	 U8NaXtkfFpO6sAPp7L7z9Pxt8R6Zmdfq3TF9XMalvNzfjXNxBYTbTaVCwQkck0a987BDt
	 1ncKM7A8hYppdO9QoPouoO1fUgFuJlD3XKETscVZQ2y5atce/szTvU+8PbwYjKDu10TzO
	 bz8IOqn9bKBKVK5GMhOkURs+U9JjZdNEYROgNBGTeCaaLZrmB5Tg69brz5eWzfmKO7g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793809233;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=7WX/ZTMITs0q76Ht6EmOOVK989Ar1uU+fZznXiAFQ00=;
	b=fk3T6tmV0jq6UnRaDclGHWYG5mAa5M5bXfpbRPcwA50R70O1unY9eN1AvYtwWojTegbC
	 XdyPWXaVjwRTvr6JBTJvFAqmMYipyZCj2Pe+f+2+qvLW+TiyddeVtfsqmQqk+WF1WxG/s
	 pjJ+Off6hNxPqOnQ6j0H/yu4N/+VxMc3zVz3NXHJ4DsRVYfxtFcuh2Ez+VsELj8d1vs7/
	 /INtJJ5iXBmZZ9ViPnlLdafZuGEhYae7+MA1vQK76Qb4NkJoTB7uTkNMJUt0/gFZXB6K5
	 +sL6DgRQ8zoJYWqLZBFYFNzla7zxx9elh0Pnz622I9ijg9AaB3HoekCRXVpnigHBb9w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="e7CwDu/v";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.172
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFCAB606A33D
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 16:20:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFCAB606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=e7CwDu/v
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-533202fe429so338701cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 08:20:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793809232; cv=none;
        d=google.com; s=arc-20260327;
        b=q67OAlCxYopoJQmwewpz/gVQvtf7To7BoUOUOXyTrbWcRFDtoXakRMu2e6cBgu7pBH
         YGOjnZBoho0pqZIUYgOW/e03i/GntNGm+/WkAecDWa+x2I83V716SUpbC76VwNXZ2qyV
         qo5iGP1x8LexgDTYBJp8HC8JNhmOdzsdXaTPXmfcEp9VMAUHZeQq80BbE85yGnmC8kW5
         dGxtmgcMFbB5xm+T//0bv7CGG4kbU+YG4tj4eau/0aIihzzF9jjV4NDSjtjTpKI4RBF6
         Mwt9UMfH1h0aFNCq0yC4juO9pMxe4uFXFpcMCVggGFNx4VioqWiJ7xuI01YnN/SfRHX3
         lT6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7WX/ZTMITs0q76Ht6EmOOVK989Ar1uU+fZznXiAFQ00=;
        fh=/OMS584PiSdUM1sUInyEbpjZhpjD25nUOMoE1j9osAA=;
        b=pGMlQeGNg47BSwLyNTq42zRfxbpBEbiZJNAMm2mK1OldkeaJ8VMVJoez+FwC7ArZW/
         OhtOT+ANlULxSY47sgFeZ6G0LaK9tkZDCAxXuiQ00OtoHqMUB+pPm5Hos6+/2H4ZgQ2z
         FGk+oMbRAA65cEqAMQGRKCZlQjQCPxJpXrfwBNyWAFVUjrdH3IbN8igRIk5g3vPe+Zw7
         PoUCOPcbtR2XolH7jPALpxFUatKKL22Y/mmOH7nrmPwnzzZVHgdYe/xkbIZR6Ae6FCmK
         7zhze0v2lJu0HNgMuU2e5jwzuGgVAaM9VVioZbQ9ZFo5pQPyqUuxLtrR+Wn4nAi6OPHL
         QQUg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793809232; x=1794414032; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7WX/ZTMITs0q76Ht6EmOOVK989Ar1uU+fZznXiAFQ00=;
        b=e7CwDu/vxnexZuo4KfJhPCtRyWpfG4HA0qSLqj+dx6M9IOdxQTm/gBei/ZyfXmq/tY
         P3MSh9PYrzkGTLNUGfeAhvMJ48cwsMtPhpMNJbHeeVj1mW9CQXZ5nMm75rYZGkOVbG3k
         rFNTr2VlmNYDn/QUmG26sYZcxpZv36ky85ZtR1vsgYmamTbuT99dkuYTfms7KontHtol
         tezQM6c6DOiouuc7Ebec+4sCb42oFqyMr5n5XDWfnRzA8OB+lUGytMxXw1jIxctA7xux
         OKtvTcZV765Kwpj2pfdySCuyVlXj0n9CPKwUySlhGEsxzWP2LfN4uZcLgzZ/XyNTaa/H
         wgOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793809232; x=1794414032;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7WX/ZTMITs0q76Ht6EmOOVK989Ar1uU+fZznXiAFQ00=;
        b=Az8WS7HeGIC2x5Jwi27JrcAJ/Atuwo1Wr8GkrttVGtEjFjo61xC4iVHgiflDD2i1pI
         R3l46rp/DOAiLY3knPDrVpSMcnOcQkML75AibKF15rgZB74lbFEyFFuAoxO1mT80rJg9
         YbMi4zWFwj+cvjTqQal3MABam69ES4kfmCqQnuW2Zw6I2g2ptV/ihYargMyyY4VpkNAJ
         0ToTwEX6842B9RhT7anY5ZsQavR6sM/erc4YkiRQZEOKZTV4WPwxR7Z6ofpHjchmD674
         7S0lRxKKmJkSYfJ7m9WFR6sMQnbrf3BbOfVxPyHgoHmkVMzzbi/ST3anaWs+4LndwQo6
         683A==
X-Forwarded-Encrypted: i=1; AKwUvBwJsobcrcSkTbAVT2S3XS02jQcRmzwqoFhph09zVCM3rgvUJi3F4o8AOy8zVnNtBVxvGafb2utf/GV3Aws=@vger.kernel.org
X-Gm-Message-State: APuU4Z/czgwZKQxY9KTGor3w1wIRiI452iaAQrNrZ4bIvhlv3znhA1he
	5Y10xv+F4eWVqVMWBcv64WJhtAD6aqp8VGZE1lVbRVbHnRtMewe0ERrVcUNs2XAZYRELHTYHMjW
	ThcY1y9cn2iHgbZ6jM9EOPwqvMtAMfxYj5/HAQMHR
X-Gm-Gg: AYBFou0xoGRB61Vakq0c/qQbQc3XhAWi4jB0GB/L6vZLDvfcs3MYu5QhGk85lVaBZrK
	Ft9A4Ab+WTOa8NniRh+KvNA9YgGiWOCctjlbqnSrTGJMTELAHYs88MOzHZnzcgog56iG8EiH5Kg
	QGCAGP/ERSvsCMw6tqaOOlUPCjALuIkm2nG0c7uvT2tt+FWlyCsQnC9TpM22lZLJpnl+I64YhUJ
	S53dvA+xVnnioZqbiV+dlP4bOxpJcm3VOhJ2PMT8dPldAzZhn8K6ub3UBw2l+EPOew7raEdnZWw
	mh9gXDyAfMv9UZiBOsNhDRL8wD8gtrUJNxtdAdVKLrQ9gfqawq9FVrTWW+rRAdjLjnFYaIxc9K4
	RBrfWS9YSoK152RN8+vgfFq+z8azFPvBKtpzgEaw6CeqOq9e0ZqTa+yNGPhB9Bznx1JVRS0OWyJ
	QWmxh8gOTfNFU=
X-Received: by 2002:a05:622a:5a17:b0:533:9731:f0f1 with SMTP id
 d75a77b69052e-54b828def6bmr16257461cf.10.1793809230476; Wed, 04 Nov 2026
 08:20:30 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104160716.2910873-1-bwicaksono@nvidia.com> <20261104160716.2910873-6-bwicaksono@nvidia.com>
In-Reply-To: <20261104160716.2910873-6-bwicaksono@nvidia.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 4 Nov 2026 08:20:17 -0800
X-Gm-Features: AclHuK8kmY9Y5i9GpPnoLDbH8n_OPilb4d8Fhx3j9bcjOJ8O94IiJtK0q4nuoTg
Message-ID: <CAP-5=fUP4ivJpDySjk5Np5VM=Q3xaSL4ONkZZLumQn=OH_hucA@mail.gmail.com>
Subject: Re: [PATCH v3 5/7] perf jevents: Add support for NVIDIA Tegra410 C2C
 PMU aliasing
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

On Wed, Nov 4, 2026 at 8:08=E2=80=AFAM Besar Wicaksono <bwicaksono@nvidia.c=
om> wrote:
>
> Add alias support for NVIDIA Tegra410 C2C PMU events.

What does alias mean in this case? That there are json and sysfs
events? I don't see support being added, only additional events.

Thanks,
Ian

> Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
> ---
>  .../arm64/nvidia/t410/uncore-nvclink.json     |  67 ++++++++++
>  .../arm64/nvidia/t410/uncore-nvdlink.json     |  43 +++++++
>  .../arm64/nvidia/t410/uncore-nvlink_c2c.json  | 115 ++++++++++++++++++
>  3 files changed, 225 insertions(+)
>  create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/uncore-n=
vclink.json
>  create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/uncore-n=
vdlink.json
>  create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/uncore-n=
vlink_c2c.json
>
> diff --git a/tools/perf/pmu-events/arch/arm64/nvidia/t410/uncore-nvclink.=
json b/tools/perf/pmu-events/arch/arm64/nvidia/t410/uncore-nvclink.json
> new file mode 100644
> index 000000000000..1e7f8115ff9c
> --- /dev/null
> +++ b/tools/perf/pmu-events/arch/arm64/nvidia/t410/uncore-nvclink.json
> @@ -0,0 +1,67 @@
> +[
> +    {
> +        "EventCode": "0x0",
> +        "EventName": "NVCLINK_CYCLES",
> +        "BriefDescription": "Counts NV-CLink interface clock cycles.",
> +        "PublicDescription": "Counts NV-CLink interface clock cycles. Al=
l NV-CLink instances share this clock, so the count is read from the first =
instance.",
> +        "Unit": "nvidia_nvclink_pmu_"
> +    },
> +    {
> +        "EventCode": "0x1",
> +        "EventName": "NVCLINK_IN_RD_CUM_OUTS",
> +        "BriefDescription": "Accumulates the outstanding incoming read r=
equests counted by NVCLINK_IN_RD_REQ each NV-CLink interface cycle.",
> +        "PublicDescription": "Accumulates the outstanding incoming read =
requests counted by NVCLINK_IN_RD_REQ each NV-CLink interface cycle. Pair t=
he two for the average read latency.",
> +        "Unit": "nvidia_nvclink_pmu_"
> +    },
> +    {
> +        "EventCode": "0x2",
> +        "EventName": "NVCLINK_IN_RD_REQ",
> +        "BriefDescription": "Counts incoming read requests from the remo=
te Tegra SoC at the NV-CLink interface.",
> +        "PublicDescription": "Counts incoming read requests from the rem=
ote Tegra SoC at the NV-CLink interface, where local memory or a local devi=
ce responds with data. Request size can be from 1 to 256 bytes. The count i=
s summed over all NV-CLink instances.",
> +        "Unit": "nvidia_nvclink_pmu_"
> +    },
> +    {
> +        "EventCode": "0x5",
> +        "EventName": "NVCLINK_OUT_RD_CUM_OUTS",
> +        "BriefDescription": "Accumulates the outstanding outgoing read r=
equests counted by NVCLINK_OUT_RD_REQ each NV-CLink interface cycle.",
> +        "PublicDescription": "Accumulates the outstanding outgoing read =
requests counted by NVCLINK_OUT_RD_REQ each NV-CLink interface cycle. Pair =
the two for the average read latency.",
> +        "Unit": "nvidia_nvclink_pmu_"
> +    },
> +    {
> +        "EventCode": "0x6",
> +        "EventName": "NVCLINK_OUT_RD_REQ",
> +        "BriefDescription": "Counts outgoing read requests from the loca=
l Tegra SoC to the remote Tegra SoC at the NV-CLink interface.",
> +        "PublicDescription": "Counts outgoing read requests from the loc=
al Tegra SoC to the remote Tegra SoC at the NV-CLink interface, where memor=
y on the remote Tegra SoC responds with data. Request size can be from 1 to=
 256 bytes. The count is summed over all NV-CLink instances.",
> +        "Unit": "nvidia_nvclink_pmu_"
> +    },
> +    {
> +        "MetricName": "nvclink_freq",
> +        "MetricGroup": "NVCLINK_Frequency;NVCLINK_Latency;NVCLINK_Read_L=
atency",
> +        "MetricConstraint": "NO_GROUP_EVENTS",
> +        "MetricExpr": "(NVCLINK_CYCLES / aggr_nr(NVCLINK_CYCLES)) / 1e9 =
/ duration_time",
> +        "ScaleUnit": "1GHz",
> +        "BriefDescription": "NV-CLink interface clock frequency.",
> +        "PublicDescription": "Average NV-CLink interface clock frequency=
 over the measurement interval.",
> +        "Unit": "nvidia_nvclink_pmu_"
> +    },
> +    {
> +        "MetricName": "nvclink_in_avg_rd_latency",
> +        "MetricGroup": "NVCLINK_Latency;NVCLINK_Read_Latency;NVCLINK_Inc=
oming",
> +        "MetricConstraint": "NO_GROUP_EVENTS",
> +        "MetricExpr": "(NVCLINK_IN_RD_CUM_OUTS / NVCLINK_IN_RD_REQ) / nv=
clink_freq",
> +        "ScaleUnit": "1ns/request",
> +        "BriefDescription": "Average latency of incoming read requests f=
rom the remote Tegra SoC at the NV-CLink interface.",
> +        "PublicDescription": "Average latency of the incoming read reque=
sts counted by NVCLINK_IN_RD_REQ, measured at the NV-CLink interface.",
> +        "Unit": "nvidia_nvclink_pmu_"
> +    },
> +    {
> +        "MetricName": "nvclink_out_avg_rd_latency",
> +        "MetricGroup": "NVCLINK_Latency;NVCLINK_Read_Latency;NVCLINK_Out=
going",
> +        "MetricConstraint": "NO_GROUP_EVENTS",
> +        "MetricExpr": "(NVCLINK_OUT_RD_CUM_OUTS / NVCLINK_OUT_RD_REQ) / =
nvclink_freq",
> +        "ScaleUnit": "1ns/request",
> +        "BriefDescription": "Average latency of outgoing read requests s=
ent by the local Tegra SoC to the remote Tegra SoC at the NV-CLink interfac=
e.",
> +        "PublicDescription": "Average latency of the outgoing read reque=
sts counted by NVCLINK_OUT_RD_REQ, measured at the NV-CLink interface.",
> +        "Unit": "nvidia_nvclink_pmu_"
> +    }
> +]
> diff --git a/tools/perf/pmu-events/arch/arm64/nvidia/t410/uncore-nvdlink.=
json b/tools/perf/pmu-events/arch/arm64/nvidia/t410/uncore-nvdlink.json
> new file mode 100644
> index 000000000000..7777add3741d
> --- /dev/null
> +++ b/tools/perf/pmu-events/arch/arm64/nvidia/t410/uncore-nvdlink.json
> @@ -0,0 +1,43 @@
> +[
> +    {
> +        "EventCode": "0x0",
> +        "EventName": "NVDLINK_CYCLES",
> +        "BriefDescription": "Counts NV-DLink interface clock cycles.",
> +        "PublicDescription": "Counts NV-DLink interface clock cycles. Al=
l NV-DLink instances share this clock, so the count is read from the first =
instance.",
> +        "Unit": "nvidia_nvdlink_pmu_"
> +    },
> +    {
> +        "EventCode": "0x1",
> +        "EventName": "NVDLINK_IN_RD_CUM_OUTS",
> +        "BriefDescription": "Accumulates the outstanding read requests c=
ounted by NVDLINK_IN_RD_REQ each NV-DLink interface cycle.",
> +        "PublicDescription": "Accumulates the outstanding read requests =
counted by NVDLINK_IN_RD_REQ each NV-DLink interface cycle. Pair the two fo=
r the average read latency.",
> +        "Unit": "nvidia_nvdlink_pmu_"
> +    },
> +    {
> +        "EventCode": "0x2",
> +        "EventName": "NVDLINK_IN_RD_REQ",
> +        "BriefDescription": "Counts read requests to local CXL memory at=
 the NV-DLink interface.",
> +        "PublicDescription": "Counts read requests to local CXL memory a=
t the NV-DLink interface, from all requesters, local and remote. Request si=
ze can be from 1 to 256 bytes. The count is summed over all NV-DLink instan=
ces.",
> +        "Unit": "nvidia_nvdlink_pmu_"
> +    },
> +    {
> +        "MetricName": "nvdlink_freq",
> +        "MetricGroup": "NVDLINK_Frequency;NVDLINK_Latency;NVDLINK_Read_L=
atency",
> +        "MetricConstraint": "NO_GROUP_EVENTS",
> +        "MetricExpr": "(NVDLINK_CYCLES / aggr_nr(NVDLINK_CYCLES)) / 1e9 =
/ duration_time",
> +        "ScaleUnit": "1GHz",
> +        "BriefDescription": "NV-DLink interface clock frequency.",
> +        "PublicDescription": "Average NV-DLink interface clock frequency=
 over the measurement interval.",
> +        "Unit": "nvidia_nvdlink_pmu_"
> +    },
> +    {
> +        "MetricName": "nvdlink_in_avg_rd_latency",
> +        "MetricGroup": "NVDLINK_Latency;NVDLINK_Read_Latency",
> +        "MetricConstraint": "NO_GROUP_EVENTS",
> +        "MetricExpr": "(NVDLINK_IN_RD_CUM_OUTS / NVDLINK_IN_RD_REQ) / nv=
dlink_freq",
> +        "ScaleUnit": "1ns/request",
> +        "BriefDescription": "Average latency of read requests to local C=
XL memory at the NV-DLink interface.",
> +        "PublicDescription": "Average latency of the read requests count=
ed by NVDLINK_IN_RD_REQ, measured at the NV-DLink interface.",
> +        "Unit": "nvidia_nvdlink_pmu_"
> +    }
> +]
> diff --git a/tools/perf/pmu-events/arch/arm64/nvidia/t410/uncore-nvlink_c=
2c.json b/tools/perf/pmu-events/arch/arm64/nvidia/t410/uncore-nvlink_c2c.js=
on
> new file mode 100644
> index 000000000000..48a64caaba61
> --- /dev/null
> +++ b/tools/perf/pmu-events/arch/arm64/nvidia/t410/uncore-nvlink_c2c.json
> @@ -0,0 +1,115 @@
> +[
> +    {
> +        "EventCode": "0x0",
> +        "EventName": "NVLINK_C2C_CYCLES",
> +        "BriefDescription": "Counts NVLink-C2C interface clock cycles.",
> +        "PublicDescription": "Counts NVLink-C2C interface clock cycles. =
All NVLink-C2C instances share this clock, so the count is read from the fi=
rst instance.",
> +        "Unit": "nvidia_nvlink_c2c_pmu_"
> +    },
> +    {
> +        "EventCode": "0x1",
> +        "EventName": "NVLINK_C2C_IN_RD_CUM_OUTS",
> +        "BriefDescription": "Accumulates the outstanding incoming read r=
equests counted by NVLINK_C2C_IN_RD_REQ each NVLink-C2C interface cycle.",
> +        "PublicDescription": "Accumulates the outstanding incoming read =
requests counted by NVLINK_C2C_IN_RD_REQ each NVLink-C2C interface cycle. P=
air the two for the average read latency. The gpu_mask filter works as desc=
ribed for NVLINK_C2C_IN_RD_REQ.",
> +        "Unit": "nvidia_nvlink_c2c_pmu_"
> +    },
> +    {
> +        "EventCode": "0x2",
> +        "EventName": "NVLINK_C2C_IN_RD_REQ",
> +        "BriefDescription": "Counts incoming read requests from connecte=
d GPUs or a remote Tegra SoC at the NVLink-C2C interface.",
> +        "PublicDescription": "Counts incoming read requests sent by conn=
ected GPUs or a remote Tegra SoC to the local Tegra SoC at the NVLink-C2C i=
nterface, where the local Tegra SoC responds with data. Request size can be=
 from 1 to 256 bytes. The count is summed over all NVLink-C2C instances. Fi=
lters: the gpu_mask filter selects GPUs by index, one bit per GPU. This fil=
ter is available only when GPUs are connected. An unset gpu_mask counts all=
 GPUs.",
> +        "Unit": "nvidia_nvlink_c2c_pmu_"
> +    },
> +    {
> +        "EventCode": "0x3",
> +        "EventName": "NVLINK_C2C_IN_WR_CUM_OUTS",
> +        "BriefDescription": "Accumulates the outstanding incoming write =
requests counted by NVLINK_C2C_IN_WR_REQ each NVLink-C2C interface cycle.",
> +        "PublicDescription": "Accumulates the outstanding incoming write=
 requests counted by NVLINK_C2C_IN_WR_REQ each NVLink-C2C interface cycle. =
Available only when GPUs are connected. Pair the two for the average write =
latency. The gpu_mask filter works as described for NVLINK_C2C_IN_WR_REQ.",
> +        "Unit": "nvidia_nvlink_c2c_pmu_"
> +    },
> +    {
> +        "EventCode": "0x4",
> +        "EventName": "NVLINK_C2C_IN_WR_REQ",
> +        "BriefDescription": "Counts incoming write requests from connect=
ed GPUs to the local Tegra SoC at the NVLink-C2C interface.",
> +        "PublicDescription": "Counts incoming write requests sent by con=
nected GPUs to the local Tegra SoC at the NVLink-C2C interface, where the G=
PU sends the data. Request size can be from 1 to 256 bytes. Available only =
when GPUs are connected. The count is summed over all NVLink-C2C instances.=
 Filters: the gpu_mask filter selects GPUs by index, one bit per GPU. An un=
set gpu_mask counts all GPUs.",
> +        "Unit": "nvidia_nvlink_c2c_pmu_"
> +    },
> +    {
> +        "EventCode": "0x5",
> +        "EventName": "NVLINK_C2C_OUT_RD_CUM_OUTS",
> +        "BriefDescription": "Accumulates the outstanding outgoing read r=
equests counted by NVLINK_C2C_OUT_RD_REQ each NVLink-C2C interface cycle.",
> +        "PublicDescription": "Accumulates the outstanding outgoing read =
requests counted by NVLINK_C2C_OUT_RD_REQ each NVLink-C2C interface cycle. =
Pair the two for the average read latency. The gpu_mask filter works as des=
cribed for NVLINK_C2C_OUT_RD_REQ.",
> +        "Unit": "nvidia_nvlink_c2c_pmu_"
> +    },
> +    {
> +        "EventCode": "0x6",
> +        "EventName": "NVLINK_C2C_OUT_RD_REQ",
> +        "BriefDescription": "Counts outgoing read requests to connected =
GPUs or a remote Tegra SoC at the NVLink-C2C interface.",
> +        "PublicDescription": "Counts outgoing read requests from all req=
uesters to connected GPUs or a remote Tegra SoC at the NVLink-C2C interface=
, where the GPU or remote Tegra SoC responds with data. Request size can be=
 from 1 to 256 bytes. The count is summed over all NVLink-C2C instances. Fi=
lters: the gpu_mask filter selects GPUs by index, one bit per GPU. This fil=
ter is available only when GPUs are connected. An unset gpu_mask counts all=
 GPUs.",
> +        "Unit": "nvidia_nvlink_c2c_pmu_"
> +    },
> +    {
> +        "EventCode": "0x7",
> +        "EventName": "NVLINK_C2C_OUT_WR_CUM_OUTS",
> +        "BriefDescription": "Accumulates the outstanding outgoing write =
requests counted by NVLINK_C2C_OUT_WR_REQ each NVLink-C2C interface cycle."=
,
> +        "PublicDescription": "Accumulates the outstanding outgoing write=
 requests counted by NVLINK_C2C_OUT_WR_REQ each NVLink-C2C interface cycle.=
 Available only when GPUs are connected. Pair the two for the average write=
 latency. The gpu_mask filter works as described for NVLINK_C2C_OUT_WR_REQ.=
",
> +        "Unit": "nvidia_nvlink_c2c_pmu_"
> +    },
> +    {
> +        "EventCode": "0x8",
> +        "EventName": "NVLINK_C2C_OUT_WR_REQ",
> +        "BriefDescription": "Counts outgoing write requests to connected=
 GPUs at the NVLink-C2C interface.",
> +        "PublicDescription": "Counts outgoing write requests from all re=
questers to connected GPUs at the NVLink-C2C interface, where the requester=
 sends the data. Request size can be from 1 to 256 bytes. Available only wh=
en GPUs are connected. The count is summed over all NVLink-C2C instances. F=
ilters: the gpu_mask filter selects GPUs by index, one bit per GPU. An unse=
t gpu_mask counts all GPUs.",
> +        "Unit": "nvidia_nvlink_c2c_pmu_"
> +    },
> +    {
> +        "MetricName": "nvlink_c2c_freq",
> +        "MetricGroup": "NVLINK_C2C_Frequency;NVLINK_C2C_Latency;NVLINK_C=
2C_Read_Latency;NVLINK_C2C_Write_Latency",
> +        "MetricConstraint": "NO_GROUP_EVENTS",
> +        "MetricExpr": "(NVLINK_C2C_CYCLES / aggr_nr(NVLINK_C2C_CYCLES)) =
/ 1e9 / duration_time",
> +        "ScaleUnit": "1GHz",
> +        "BriefDescription": "NVLink-C2C interface clock frequency.",
> +        "PublicDescription": "Average NVLink-C2C interface clock frequen=
cy over the measurement interval.",
> +        "Unit": "nvidia_nvlink_c2c_pmu_"
> +    },
> +    {
> +        "MetricName": "nvlink_c2c_in_avg_rd_latency",
> +        "MetricGroup": "NVLINK_C2C_Latency;NVLINK_C2C_Read_Latency;NVLIN=
K_C2C_Incoming",
> +        "MetricConstraint": "NO_GROUP_EVENTS",
> +        "MetricExpr": "(NVLINK_C2C_IN_RD_CUM_OUTS / NVLINK_C2C_IN_RD_REQ=
) / nvlink_c2c_freq",
> +        "ScaleUnit": "1ns/request",
> +        "BriefDescription": "Average latency of incoming read requests a=
t the NVLink-C2C interface.",
> +        "PublicDescription": "Average latency of the incoming read reque=
sts counted by NVLINK_C2C_IN_RD_REQ, measured at the NVLink-C2C interface."=
,
> +        "Unit": "nvidia_nvlink_c2c_pmu_"
> +    },
> +    {
> +        "MetricName": "nvlink_c2c_in_avg_wr_latency",
> +        "MetricGroup": "NVLINK_C2C_Latency;NVLINK_C2C_Write_Latency;NVLI=
NK_C2C_Incoming",
> +        "MetricConstraint": "NO_GROUP_EVENTS",
> +        "MetricExpr": "(NVLINK_C2C_IN_WR_CUM_OUTS / NVLINK_C2C_IN_WR_REQ=
) / nvlink_c2c_freq",
> +        "ScaleUnit": "1ns/request",
> +        "BriefDescription": "Average latency of incoming write requests =
from connected GPUs at the NVLink-C2C interface.",
> +        "PublicDescription": "Average latency of the incoming write requ=
ests counted by NVLINK_C2C_IN_WR_REQ, measured at the NVLink-C2C interface.=
 Available only when GPUs are connected.",
> +        "Unit": "nvidia_nvlink_c2c_pmu_"
> +    },
> +    {
> +        "MetricName": "nvlink_c2c_out_avg_rd_latency",
> +        "MetricGroup": "NVLINK_C2C_Latency;NVLINK_C2C_Read_Latency;NVLIN=
K_C2C_Outgoing",
> +        "MetricConstraint": "NO_GROUP_EVENTS",
> +        "MetricExpr": "(NVLINK_C2C_OUT_RD_CUM_OUTS / NVLINK_C2C_OUT_RD_R=
EQ) / nvlink_c2c_freq",
> +        "ScaleUnit": "1ns/request",
> +        "BriefDescription": "Average latency of outgoing read requests a=
t the NVLink-C2C interface.",
> +        "PublicDescription": "Average latency of the outgoing read reque=
sts counted by NVLINK_C2C_OUT_RD_REQ, measured at the NVLink-C2C interface.=
",
> +        "Unit": "nvidia_nvlink_c2c_pmu_"
> +    },
> +    {
> +        "MetricName": "nvlink_c2c_out_avg_wr_latency",
> +        "MetricGroup": "NVLINK_C2C_Latency;NVLINK_C2C_Write_Latency;NVLI=
NK_C2C_Outgoing",
> +        "MetricConstraint": "NO_GROUP_EVENTS",
> +        "MetricExpr": "(NVLINK_C2C_OUT_WR_CUM_OUTS / NVLINK_C2C_OUT_WR_R=
EQ) / nvlink_c2c_freq",
> +        "ScaleUnit": "1ns/request",
> +        "BriefDescription": "Average latency of outgoing write requests =
to connected GPUs at the NVLink-C2C interface.",
> +        "PublicDescription": "Average latency of the outgoing write requ=
ests counted by NVLINK_C2C_OUT_WR_REQ, measured at the NVLink-C2C interface=
. Available only when GPUs are connected.",
> +        "Unit": "nvidia_nvlink_c2c_pmu_"
> +    }
> +]
> --
> 2.43.0
>
