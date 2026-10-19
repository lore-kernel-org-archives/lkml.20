Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792432245;
	b=b4OOrzj9wqLomHEn5T50yWx1o4O8M7w4se3TDPoSanwIZR4psu9PBAkhZY+Yr1+MbCHF
	 g3StKcuTEJoNZlRsK2KbpFNkTA+GUDgvt7Kgn/xcjYNmORMHuNcolByCA7mYdl6/22U1N
	 QrraEPzmh5LNZBQZHQnDqZ3p0a/RhdwUFMjghd1w6WrRnTxoleOAVcVoIrR+sH/TSZZ3U
	 85PEppfGchTcdhSD7j8hoRlaDzTOrwHH96B/P+107Zdi2/U8pLAWPrc5Ipcr/5X5hLcsx
	 p2H3JEyW9mur2GUr+b6k7ULaGug9aFIOuKIy54ao127fGXNml4BFhu4YrVVlP1el0YQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792432245;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=yxr3yy5APwTjGC/8MQQ5vWLHB19nNrJrEZoaHSPj4Ms=;
	b=iy1UwIg9ahz0SobSFy5iqPgLbtFQVYaksaXAxSE/0yud6Z8iroVim+yIEs0PcMW2HaQG
	 Q5B5yo161KxrLvDKhSEnCrmDVpSy6HwFtfcGIqEpMc0LFeyw0jS93hUvdQwuGy+kpBPJK
	 Sqcj+gpCbGpaGk1wpdwgQqvFaSpsDSyD/qmXTcZNXnTu1uQgD3tZd+qv8QJ/Wr7EPY0we
	 1ZBJVVDOdV+yWiIcY/EwbRTLFMaO+rB8PQRE+ARS+2itKWRYUIIbsBCF+3H5V1fCd5X/1
	 FdnbvPfVQhWnBqO5dAxRjAYupJkOcNnkcyYt719nFcW6UWEEOrOTBh+U7CMRyE/aMLQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=UUEQHwGR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F2A606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 17:50:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7F2A606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=UUEQHwGR
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-14394530ec6so1306714c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:50:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792432244; cv=none;
        d=google.com; s=arc-20260327;
        b=Hc6P4xvtbDvz9CPe+nFXDGqpjLa2dQjDDIvT11X2MwNH7JvgV6BZ2nZ0cXC3KAKcNS
         dg1Gji+lFKP24CyiyCRleeaBygrlYbPFhMZ3ZnPDDpPjDxYAsbskkHlQejYZS8mmDVKJ
         sEmAvtRrIOQklwybosOd4FL3U3pgTGPpZ2zACgLMDVdvKRIrgsfSy4oyw6kmdHmCgFvC
         lFyeR2mpArZZMivWRx8TECbcKRyFPoobeFqLKRzh+JbOr8pAr7eAcs+DdUiNXw/dcRQb
         4KOzreOlPhHnSW+3O6YBdGACbkhzXc6AQJbgzT3OJyYgRN3D5VAZynJo/UpyPVYBc+7p
         Z84g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yxr3yy5APwTjGC/8MQQ5vWLHB19nNrJrEZoaHSPj4Ms=;
        fh=JzpYWGMrxW3mwDsOngTa9sjmw33koLURddyLu2tFxkA=;
        b=SwqD0+3W+/Fw6GzS6szo9fpSGxH6dYDmhKShxizFQ7pCq/cJjXmovEFq4W3bDPAwaV
         /OTndwvtJUPHugln1e4/Y2woIHslJV6qdmHCtxANbe2Xgsw4sz3RRpgt/7oPEdwpU4zm
         6z9HXT2/gqKyRDh6UXCIYCBKh7Yous7TSEZQRJHlWLQ7a4Oa/zjn7czyq+KsmOnq0CiN
         Bj//v5XbH0SKc/TSqAybUS3FS5uz1iitVAxG10eLN8dVym48n99aL9nnKj32DmJYdVak
         UxlrxfQ0h5BBPl0PwVwu1bm/IPQr26r3g32xhSxnrT0ZeBMK9oo4CEtphz4cL2DzjyTf
         CrJg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792432244; x=1793037044; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yxr3yy5APwTjGC/8MQQ5vWLHB19nNrJrEZoaHSPj4Ms=;
        b=UUEQHwGRh1o6+pisyuJZf3P9fduUvukVOX6CopUvQJ0bn1pVaj6lQMzmk2AtAW/5Dg
         cehvFJRh5oS3VAGYWb2H5hTBS39E79QWUWA2SGoGn/dofmWqwfMSHtNhOQgYg4pUfqz2
         vRRt5RGIyto3ALd03TopjtH8Tfw5yy/W3cazjXGt9GQGXQQKezVE2KLsDzAUL7Pq2yBM
         3GRSzCxiiqrAUiCBrBuHIhGLlIOuQ8Gfl4atd+eYfqLfLq5W5jnVE+1ZGrst6OjKOKSZ
         BDlFuuH6+icJwAtMaCj8r0O/Tf3upHWXgcaW1DbylRe2yLj3if8sOtsgdsZoplxhIF8B
         fBDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792432244; x=1793037044;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yxr3yy5APwTjGC/8MQQ5vWLHB19nNrJrEZoaHSPj4Ms=;
        b=F2zlig6cm4UHjK/rGUgITfPHwS9PTmS9KZa0tt29gSTa+EglGzGJGPPUZffdja0Zpq
         LZChUinaxDttLKton7NeiMPUaX6Mo6V1pBqco9J26AG2dpxxMwF5g8j4UynKBmRR6dtA
         Qs3JliMePcy9qe6VyQddL8XXyRAkCPSZF6ddHBbzgFOEA/Z8DDDRdaQF/RMq0orc9hgK
         XypJcuxlJdH0F6Azxm1idbX35/n44ymbWaAab2YYBahddBPUqsSHQxFmkxp28MrRrCQY
         iHcl407Dlp4dafLZ0T5XEf2sm/GkDRmQgNQI8sa3skV6+XTHTT9w0QPxzupcphfU2c6h
         ZGHA==
X-Forwarded-Encrypted: i=1; AKwUvByC8rmSGsB0eS3S5jxNY/D56EcF9KMTYFrBiKsVBrKrplr7tVtxRqlllhk4fLzCS0w0td8ErhObOurU9zw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIcgZ81d8+1fLAt12zHKc8BYWSZ1YsRiujogviLXHnsXFEIIQPd
	lD6RYH7keUbdr/QpDCReJyCLx1V4M/b64UbmgMlIZM2KlXWJdrXs4lBtMX/ns44scFfOC9TmsPR
	4LuacX5mAlj3JT/JtSuN32Qx3RJ7sgDxfGvNV9Pbf
X-Gm-Gg: AYBFou0CMqK8FT2dg0be1a+J/bCPpOFhFt7cw7cDlp6d8NThBSTr+LtnNMhzmtcCgUK
	ViX6RJtuVWHdUxTx/LtAO2zfPYK5oZbhWsNds0YFdo6pUbpMPSOAj8LHlDrnXF/TgM2BGcfMZq4
	2Db7PyW5fkahcFkFHOy7pVl8hXNiQaTT/gjiUw6cWbYMBR2Oz+fE7D8OpVv3XiDhe42G25HT42Q
	pnAZz62V9HXeCH6Sh2mCeBp9qun3r3QM9RxgCoDVxBginkLRanrqlhAk9IiZyapqg+I4PlY52ED
	TsEKoONhV9+VaCTUy8KQN4WB2bgxp9OoTr8o15ilDEPUi0FHGpnbtV2xSHrn6xfQUOEBchHeDaB
	Za+szNE+9bw==
X-Received: by 2002:a05:7023:901:b0:138:30b1:4c00 with SMTP id
 a92af1059eb24-1850c40d8d0mr14069971c88.3.1792432242358; Mon, 19 Oct 2026
 10:50:42 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019164241.403644-1-bwicaksono@nvidia.com> <20261019164241.403644-4-bwicaksono@nvidia.com>
In-Reply-To: <20261019164241.403644-4-bwicaksono@nvidia.com>
From: Chun-Tse Shao <ctshao@google.com>
Date: Mon, 19 Oct 2026 10:50:03 -0700
X-Gm-Features: AclHuK-k9em4UinzRLY1SwpkrF-Fn3v95lx1FapCdO9mAXeOsitZvqSqnBbEdcc
Message-ID: <CAJpZYjURztEO088Z4ms01UmxST+OYD5-t9u4ymGe-iig9jO_jg@mail.gmail.com>
Subject: Re: [PATCH 3/6] perf jevents: Add support for NVIDIA Tegra410 PCIE
 PMU aliasing
To: Besar Wicaksono <bwicaksono@nvidia.com>
Cc: acme@kernel.org, namhyung@kernel.org, irogers@google.com, 
	linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	vsethi@nvidia.com, rwiley@nvidia.com, skelley@nvidia.com, mochs@nvidia.com, 
	rajjoshi@nvidia.com, treding@nvidia.com, jonathanh@nvidia.com, 
	john.garry@linux.dev, will@kernel.org, james.clark@linaro.org, 
	mike.leach@arm.com, leo.yan@linux.dev, mark.rutland@arm.com, 
	alexander.shishkin@linux.intel.com, jolsa@kernel.org, adrian.hunter@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Besar,

Thanks for the series. I tested this on a 2-socket Tegra410. With
--metric-only, each PCIe metric shows up once per socket, with `nan`
("none" with -j) in the other socket's column, so -j has the same key
twice in each row. "counters" is also 0 for socket 1, because it comes
from the first event, which belongs to socket 0:

```
$ perf stat -a --per-socket -M pcie_avg_wr_bandwidth_to_all_dst -j
--metric-only -- sleep 1
{"socket" : "S268435456", "counters" : 6, "MB/s
pcie_avg_wr_bandwidth_to_all_dst" : "0.1", "MB/s
pcie_avg_wr_bandwidth_to_all_dst" : "none"}
{"socket" : "S285212672", "counters" : 0, "MB/s
pcie_avg_wr_bandwidth_to_all_dst" : "none", "MB/s
pcie_avg_wr_bandwidth_to_all_dst" : "0.9"}
```

As in [1], a single PMU per RC with cpumask `0,88`, or the socket last
in the PMU name, would fix this.

[1] https://lore.kernel.org/linux-perf-users/CAJpZYjWLRiyNbzoGpA-2KE0zHgQn2=
gc0V943WxJEr5K5aZtRYA@mail.gmail.com/

Thanks,
CT

On Mon, Oct 19, 2026 at 9:45=E2=80=AFAM Besar Wicaksono <bwicaksono@nvidia.=
com> wrote:
>
> Add alias support for NVIDIA Tegra410 PCIE PMU events and metrics.
>
> Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
> ---
>  .../arm64/nvidia/t410/sys/uncore-pcie.json    | 247 ++++++++++++++++++
>  1 file changed, 247 insertions(+)
>  create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/sys/unco=
re-pcie.json
>
> diff --git a/tools/perf/pmu-events/arch/arm64/nvidia/t410/sys/uncore-pcie=
.json b/tools/perf/pmu-events/arch/arm64/nvidia/t410/sys/uncore-pcie.json
> new file mode 100644
> index 000000000000..37c3eac305e5
> --- /dev/null
> +++ b/tools/perf/pmu-events/arch/arm64/nvidia/t410/sys/uncore-pcie.json
> @@ -0,0 +1,247 @@
> +[
> +    {
> +        "EventCode": "0x100000000",
> +        "EventName": "PCIE_CYCLES",
> +        "BriefDescription": "Counts cycles at the PCIe interface to the =
Tegra SoC data fabric.",
> +        "PublicDescription": "Counts cycles at the PCIe interface to the=
 Tegra SoC data fabric.",
> +        "Compat": "1030136b",
> +        "Unit": "nvidia_pcie_pmu_,rc_"
> +    },
> +    {
> +        "EventCode": "0x2",
> +        "EventName": "PCIE_RD_REQ",
> +        "BriefDescription": "Counts read requests from PCIe devices unde=
r this PCIe root complex to memory or another PCIe device.",
> +        "PublicDescription": "Counts read requests from PCIe devices und=
er this PCIe root complex to memory or another PCIe device, where the targe=
t responds with data. Request size can be from 1 to 256 bytes. Filters: src=
_rp_mask selects the requesting root ports. Alternatively, src_bdf with src=
_bdf_en selects one requesting device (BDF); it cannot be combined with src=
_rp_mask and applies to all counters of this PMU. Destination filters selec=
t the memory type of the request address: dst_loc_cmem local CMEM, dst_loc_=
gmem local GMEM, dst_loc_pcie_p2p local PCIe peer addresses, dst_loc_pcie_c=
xl local CXL memory, dst_rem remote memory. This is the address's home type=
, not where the data currently resides; local or remote is determined by th=
e home socket of the address. An unset source filter counts all root ports;=
 an unset destination filter counts all destinations.",
> +        "Compat": "1030136b",
> +        "Unit": "nvidia_pcie_pmu_,rc_"
> +    },
> +    {
> +        "EventCode": "0x3",
> +        "EventName": "PCIE_WR_REQ",
> +        "BriefDescription": "Counts write requests from PCIe devices und=
er this PCIe root complex to memory or another PCIe device.",
> +        "PublicDescription": "Counts write requests from PCIe devices un=
der this PCIe root complex to memory or another PCIe device, where the PCIe=
 device sends data. Request size can be from 1 to 256 bytes. Filters: src_r=
p_mask selects the requesting root ports. Alternatively, src_bdf with src_b=
df_en selects one requesting device (BDF); it cannot be combined with src_r=
p_mask and applies to all counters of this PMU. Destination filters select =
the memory type of the request address: dst_loc_cmem local CMEM, dst_loc_gm=
em local GMEM, dst_loc_pcie_p2p local PCIe peer addresses, dst_loc_pcie_cxl=
 local CXL memory, dst_rem remote memory. This is the address's home type, =
not where the data currently resides; local or remote is determined by the =
home socket of the address. An unset source filter counts all root ports; a=
n unset destination filter counts all destinations.",
> +        "Compat": "1030136b",
> +        "Unit": "nvidia_pcie_pmu_,rc_"
> +    },
> +    {
> +        "EventCode": "0x0",
> +        "EventName": "PCIE_RD_BYTES",
> +        "BriefDescription": "Counts bytes transferred by the read reques=
ts counted by PCIE_RD_REQ.",
> +        "PublicDescription": "Counts bytes transferred by the read reque=
sts counted by PCIE_RD_REQ. Source and destination filters work as describe=
d for PCIE_RD_REQ.",
> +        "Compat": "1030136b",
> +        "Unit": "nvidia_pcie_pmu_,rc_"
> +    },
> +    {
> +        "EventCode": "0x1",
> +        "EventName": "PCIE_WR_BYTES",
> +        "BriefDescription": "Counts bytes transferred by the write reque=
sts counted by PCIE_WR_REQ.",
> +        "PublicDescription": "Counts bytes transferred by the write requ=
ests counted by PCIE_WR_REQ. Source and destination filters work as describ=
ed for PCIE_WR_REQ.",
> +        "Compat": "1030136b",
> +        "Unit": "nvidia_pcie_pmu_,rc_"
> +    },
> +    {
> +        "EventCode": "0x4",
> +        "EventName": "PCIE_RD_CUM_OUTS",
> +        "BriefDescription": "Accumulates the outstanding read requests c=
ounted by PCIE_RD_REQ each cycle at the PCIe interface.",
> +        "PublicDescription": "Accumulates the outstanding read requests =
counted by PCIE_RD_REQ each cycle at the PCIe interface. Pair the two under=
 the same filters for the average read latency. Source and destination filt=
ers work as described for PCIE_RD_REQ.",
> +        "Compat": "1030136b",
> +        "Unit": "nvidia_pcie_pmu_,rc_"
> +    },
> +    {
> +        "MetricName": "pcie_freq",
> +        "MetricGroup": "PCIE_Frequency;PCIE_Read_Latency",
> +        "MetricConstraint": "NO_GROUP_EVENTS",
> +        "MetricExpr": "(PCIE_CYCLES / aggr_nr(PCIE_CYCLES)) / 1e9 / dura=
tion_time",
> +        "ScaleUnit": "1GHz",
> +        "BriefDescription": "Frequency of the cycles at the PCIe interfa=
ce to the Tegra SoC data fabric.",
> +        "PublicDescription": "Average frequency of the cycles at the PCI=
e interface to the Tegra SoC data fabric over the measurement interval.",
> +        "Compat": "1030136b",
> +        "Unit": "nvidia_pcie_pmu_,rc_"
> +    },
> +    {
> +        "MetricName": "pcie_avg_rd_bandwidth_to_all_dst",
> +        "MetricGroup": "PCIE_Bandwidth;PCIE_To_All_Destinations",
> +        "MetricExpr": "PCIE_RD_BYTES@dst_loc_cmem=3D1,dst_loc_gmem=3D1,d=
st_loc_pcie_p2p=3D1,dst_loc_pcie_cxl=3D1,dst_rem=3D1@ / 1e6 / duration_time=
",
> +        "ScaleUnit": "1MB/s",
> +        "BriefDescription": "Average read bandwidth from PCIe devices un=
der this PCIe root complex to all destinations.",
> +        "PublicDescription": "Average read bandwidth of requests from al=
l PCIe devices under this PCIe root complex to all destinations: local CMEM=
, local GMEM, local PCIe peer addresses, local CXL memory and remote memory=
.",
> +        "Compat": "1030136b",
> +        "Unit": "nvidia_pcie_pmu_,rc_"
> +    },
> +    {
> +        "MetricName": "pcie_avg_wr_bandwidth_to_all_dst",
> +        "MetricGroup": "PCIE_Bandwidth;PCIE_To_All_Destinations",
> +        "MetricExpr": "PCIE_WR_BYTES@dst_loc_cmem=3D1,dst_loc_gmem=3D1,d=
st_loc_pcie_p2p=3D1,dst_loc_pcie_cxl=3D1,dst_rem=3D1@ / 1e6 / duration_time=
",
> +        "ScaleUnit": "1MB/s",
> +        "BriefDescription": "Average write bandwidth from PCIe devices u=
nder this PCIe root complex to all destinations.",
> +        "PublicDescription": "Average write bandwidth of requests from a=
ll PCIe devices under this PCIe root complex to all destinations: local CME=
M, local GMEM, local PCIe peer addresses, local CXL memory and remote memor=
y.",
> +        "Compat": "1030136b",
> +        "Unit": "nvidia_pcie_pmu_,rc_"
> +    },
> +    {
> +        "MetricName": "pcie_avg_rd_latency_to_all_dst",
> +        "MetricGroup": "PCIE_Read_Latency;PCIE_To_All_Destinations",
> +        "MetricConstraint": "NO_GROUP_EVENTS",
> +        "MetricExpr": "(PCIE_RD_CUM_OUTS@dst_loc_cmem=3D1,dst_loc_gmem=
=3D1,dst_loc_pcie_p2p=3D1,dst_loc_pcie_cxl=3D1,dst_rem=3D1@ / PCIE_RD_REQ@d=
st_loc_cmem=3D1,dst_loc_gmem=3D1,dst_loc_pcie_p2p=3D1,dst_loc_pcie_cxl=3D1,=
dst_rem=3D1@) / pcie_freq",
> +        "ScaleUnit": "1ns/request",
> +        "BriefDescription": "Average read latency from PCIe devices unde=
r this PCIe root complex to all destinations.",
> +        "PublicDescription": "Average latency of read requests from all =
PCIe devices under this PCIe root complex to all destinations: local CMEM, =
local GMEM, local PCIe peer addresses, local CXL memory and remote memory."=
,
> +        "Compat": "1030136b",
> +        "Unit": "nvidia_pcie_pmu_,rc_"
> +    },
> +    {
> +        "MetricName": "pcie_avg_rd_bandwidth_to_local_cmem",
> +        "MetricGroup": "PCIE_Bandwidth;PCIE_Read;PCIE_To_Local_CMEM",
> +        "MetricExpr": "PCIE_RD_BYTES@dst_loc_cmem=3D1@ / 1e6 / duration_=
time",
> +        "ScaleUnit": "1MB/s",
> +        "BriefDescription": "Average read bandwidth from PCIe devices un=
der this PCIe root complex to local CMEM.",
> +        "PublicDescription": "Average read bandwidth of requests from al=
l PCIe devices under this PCIe root complex to local CMEM.",
> +        "Compat": "1030136b",
> +        "Unit": "nvidia_pcie_pmu_,rc_"
> +    },
> +    {
> +        "MetricName": "pcie_avg_wr_bandwidth_to_local_cmem",
> +        "MetricGroup": "PCIE_Bandwidth;PCIE_Write;PCIE_To_Local_CMEM",
> +        "MetricExpr": "PCIE_WR_BYTES@dst_loc_cmem=3D1@ / 1e6 / duration_=
time",
> +        "ScaleUnit": "1MB/s",
> +        "BriefDescription": "Average write bandwidth from PCIe devices u=
nder this PCIe root complex to local CMEM.",
> +        "PublicDescription": "Average write bandwidth of requests from a=
ll PCIe devices under this PCIe root complex to local CMEM.",
> +        "Compat": "1030136b",
> +        "Unit": "nvidia_pcie_pmu_,rc_"
> +    },
> +    {
> +        "MetricName": "pcie_avg_rd_latency_to_local_cmem",
> +        "MetricGroup": "PCIE_Read_Latency;PCIE_Read;PCIE_To_Local_CMEM",
> +        "MetricConstraint": "NO_GROUP_EVENTS",
> +        "MetricExpr": "(PCIE_RD_CUM_OUTS@dst_loc_cmem=3D1@ / PCIE_RD_REQ=
@dst_loc_cmem=3D1@) / pcie_freq",
> +        "ScaleUnit": "1ns/request",
> +        "BriefDescription": "Average read latency from PCIe devices unde=
r this PCIe root complex to local CMEM.",
> +        "PublicDescription": "Average latency of read requests from all =
PCIe devices under this PCIe root complex to local CMEM.",
> +        "Compat": "1030136b",
> +        "Unit": "nvidia_pcie_pmu_,rc_"
> +    },
> +    {
> +        "MetricName": "pcie_avg_rd_bandwidth_to_local_gmem",
> +        "MetricGroup": "PCIE_Bandwidth;PCIE_Read;PCIE_To_Local_GMEM",
> +        "MetricExpr": "PCIE_RD_BYTES@dst_loc_gmem=3D1@ / 1e6 / duration_=
time",
> +        "ScaleUnit": "1MB/s",
> +        "BriefDescription": "Average read bandwidth from PCIe devices un=
der this PCIe root complex to local GMEM.",
> +        "PublicDescription": "Average read bandwidth of requests from al=
l PCIe devices under this PCIe root complex to local GMEM.",
> +        "Compat": "1030136b",
> +        "Unit": "nvidia_pcie_pmu_,rc_"
> +    },
> +    {
> +        "MetricName": "pcie_avg_wr_bandwidth_to_local_gmem",
> +        "MetricGroup": "PCIE_Bandwidth;PCIE_Write;PCIE_To_Local_GMEM",
> +        "MetricExpr": "PCIE_WR_BYTES@dst_loc_gmem=3D1@ / 1e6 / duration_=
time",
> +        "ScaleUnit": "1MB/s",
> +        "BriefDescription": "Average write bandwidth from PCIe devices u=
nder this PCIe root complex to local GMEM.",
> +        "PublicDescription": "Average write bandwidth of requests from a=
ll PCIe devices under this PCIe root complex to local GMEM.",
> +        "Compat": "1030136b",
> +        "Unit": "nvidia_pcie_pmu_,rc_"
> +    },
> +    {
> +        "MetricName": "pcie_avg_rd_latency_to_local_gmem",
> +        "MetricGroup": "PCIE_Read_Latency;PCIE_Read;PCIE_To_Local_GMEM",
> +        "MetricConstraint": "NO_GROUP_EVENTS",
> +        "MetricExpr": "(PCIE_RD_CUM_OUTS@dst_loc_gmem=3D1@ / PCIE_RD_REQ=
@dst_loc_gmem=3D1@) / pcie_freq",
> +        "ScaleUnit": "1ns/request",
> +        "BriefDescription": "Average read latency from PCIe devices unde=
r this PCIe root complex to local GMEM.",
> +        "PublicDescription": "Average latency of read requests from all =
PCIe devices under this PCIe root complex to local GMEM.",
> +        "Compat": "1030136b",
> +        "Unit": "nvidia_pcie_pmu_,rc_"
> +    },
> +    {
> +        "MetricName": "pcie_avg_rd_bandwidth_to_local_cxlmem",
> +        "MetricGroup": "PCIE_Bandwidth;PCIE_Read;PCIE_To_Local_CXLMEM",
> +        "MetricExpr": "PCIE_RD_BYTES@dst_loc_pcie_cxl=3D1@ / 1e6 / durat=
ion_time",
> +        "ScaleUnit": "1MB/s",
> +        "BriefDescription": "Average read bandwidth from PCIe devices un=
der this PCIe root complex to local CXL memory.",
> +        "PublicDescription": "Average read bandwidth of requests from al=
l PCIe devices under this PCIe root complex to local CXL memory.",
> +        "Compat": "1030136b",
> +        "Unit": "nvidia_pcie_pmu_,rc_"
> +    },
> +    {
> +        "MetricName": "pcie_avg_wr_bandwidth_to_local_cxlmem",
> +        "MetricGroup": "PCIE_Bandwidth;PCIE_Write;PCIE_To_Local_CXLMEM",
> +        "MetricExpr": "PCIE_WR_BYTES@dst_loc_pcie_cxl=3D1@ / 1e6 / durat=
ion_time",
> +        "ScaleUnit": "1MB/s",
> +        "BriefDescription": "Average write bandwidth from PCIe devices u=
nder this PCIe root complex to local CXL memory.",
> +        "PublicDescription": "Average write bandwidth of requests from a=
ll PCIe devices under this PCIe root complex to local CXL memory.",
> +        "Compat": "1030136b",
> +        "Unit": "nvidia_pcie_pmu_,rc_"
> +    },
> +    {
> +        "MetricName": "pcie_avg_rd_latency_to_local_cxlmem",
> +        "MetricGroup": "PCIE_Read_Latency;PCIE_Read;PCIE_To_Local_CXLMEM=
",
> +        "MetricConstraint": "NO_GROUP_EVENTS",
> +        "MetricExpr": "(PCIE_RD_CUM_OUTS@dst_loc_pcie_cxl=3D1@ / PCIE_RD=
_REQ@dst_loc_pcie_cxl=3D1@) / pcie_freq",
> +        "ScaleUnit": "1ns/request",
> +        "BriefDescription": "Average read latency from PCIe devices unde=
r this PCIe root complex to local CXL memory.",
> +        "PublicDescription": "Average latency of read requests from all =
PCIe devices under this PCIe root complex to local CXL memory.",
> +        "Compat": "1030136b",
> +        "Unit": "nvidia_pcie_pmu_,rc_"
> +    },
> +    {
> +        "MetricName": "pcie_avg_rd_bandwidth_to_remote_mem",
> +        "MetricGroup": "PCIE_Bandwidth;PCIE_Read;PCIE_To_Remote_Memory",
> +        "MetricExpr": "PCIE_RD_BYTES@dst_rem=3D1@ / 1e6 / duration_time"=
,
> +        "ScaleUnit": "1MB/s",
> +        "BriefDescription": "Average read bandwidth from PCIe devices un=
der this PCIe root complex to remote memory.",
> +        "PublicDescription": "Average read bandwidth of requests from al=
l PCIe devices under this PCIe root complex to remote memory.",
> +        "Compat": "1030136b",
> +        "Unit": "nvidia_pcie_pmu_,rc_"
> +    },
> +    {
> +        "MetricName": "pcie_avg_wr_bandwidth_to_remote_mem",
> +        "MetricGroup": "PCIE_Bandwidth;PCIE_Write;PCIE_To_Remote_Memory"=
,
> +        "MetricExpr": "PCIE_WR_BYTES@dst_rem=3D1@ / 1e6 / duration_time"=
,
> +        "ScaleUnit": "1MB/s",
> +        "BriefDescription": "Average write bandwidth from PCIe devices u=
nder this PCIe root complex to remote memory.",
> +        "PublicDescription": "Average write bandwidth of requests from a=
ll PCIe devices under this PCIe root complex to remote memory.",
> +        "Compat": "1030136b",
> +        "Unit": "nvidia_pcie_pmu_,rc_"
> +    },
> +    {
> +        "MetricName": "pcie_avg_rd_latency_to_remote_mem",
> +        "MetricGroup": "PCIE_Read_Latency;PCIE_Read;PCIE_To_Remote_Memor=
y",
> +        "MetricConstraint": "NO_GROUP_EVENTS",
> +        "MetricExpr": "(PCIE_RD_CUM_OUTS@dst_rem=3D1@ / PCIE_RD_REQ@dst_=
rem=3D1@) / pcie_freq",
> +        "ScaleUnit": "1ns/request",
> +        "BriefDescription": "Average read latency from PCIe devices unde=
r this PCIe root complex to remote memory.",
> +        "PublicDescription": "Average latency of read requests from all =
PCIe devices under this PCIe root complex to remote memory.",
> +        "Compat": "1030136b",
> +        "Unit": "nvidia_pcie_pmu_,rc_"
> +    },
> +    {
> +        "MetricName": "pcie_avg_rd_bandwidth_to_local_pcie_peer",
> +        "MetricGroup": "PCIE_Bandwidth;PCIE_Read;PCIE_To_Local_PCIE_Peer=
",
> +        "MetricExpr": "PCIE_RD_BYTES@dst_loc_pcie_p2p=3D1@ / 1e6 / durat=
ion_time",
> +        "ScaleUnit": "1MB/s",
> +        "BriefDescription": "Average read bandwidth from PCIe devices un=
der this PCIe root complex to local PCIe peer addresses.",
> +        "PublicDescription": "Average read bandwidth of requests from al=
l PCIe devices under this PCIe root complex to local PCIe peer addresses.",
> +        "Compat": "1030136b",
> +        "Unit": "nvidia_pcie_pmu_,rc_"
> +    },
> +    {
> +        "MetricName": "pcie_avg_wr_bandwidth_to_local_pcie_peer",
> +        "MetricGroup": "PCIE_Bandwidth;PCIE_Write;PCIE_To_Local_PCIE_Pee=
r",
> +        "MetricExpr": "PCIE_WR_BYTES@dst_loc_pcie_p2p=3D1@ / 1e6 / durat=
ion_time",
> +        "ScaleUnit": "1MB/s",
> +        "BriefDescription": "Average write bandwidth from PCIe devices u=
nder this PCIe root complex to local PCIe peer addresses.",
> +        "PublicDescription": "Average write bandwidth of requests from a=
ll PCIe devices under this PCIe root complex to local PCIe peer addresses."=
,
> +        "Compat": "1030136b",
> +        "Unit": "nvidia_pcie_pmu_,rc_"
> +    },
> +    {
> +        "MetricName": "pcie_avg_rd_latency_to_local_pcie_peer",
> +        "MetricGroup": "PCIE_Read_Latency;PCIE_Read;PCIE_To_Local_PCIE_P=
eer",
> +        "MetricConstraint": "NO_GROUP_EVENTS",
> +        "MetricExpr": "(PCIE_RD_CUM_OUTS@dst_loc_pcie_p2p=3D1@ / PCIE_RD=
_REQ@dst_loc_pcie_p2p=3D1@) / pcie_freq",
> +        "ScaleUnit": "1ns/request",
> +        "BriefDescription": "Average read latency from PCIe devices unde=
r this PCIe root complex to local PCIe peer addresses.",
> +        "PublicDescription": "Average latency of read requests from all =
PCIe devices under this PCIe root complex to local PCIe peer addresses.",
> +        "Compat": "1030136b",
> +        "Unit": "nvidia_pcie_pmu_,rc_"
> +    }
> +]
> --
> 2.43.0
>
