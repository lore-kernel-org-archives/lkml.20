Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792451898;
	b=pOsEWlNLlHjMooEzKCHj5pHp5UrrAFQgAwmxGDKLvRfba1a8lUH0mSb0/YoUr4cgYeHa
	 Rim93qHI25oC26aQpQ9lSGG8+mutLPg6YaEp3yXp0Gk9gyYiDSo/Pda/NwhznpRRznc3R
	 Yt1hkS0c8pAVQsNE6YqF6EPdDuX8crk+tdhiQMBjBiprrUreW6fwDNYSoye66P4sf6b0J
	 d4PFWRrrHTbwTGIJ92Ym+BuCmAHXth4aA+a5YBGQG8Vs2CIgx2vYbq0Cia97CBgYd+tXm
	 KUa1JQ2F8NeBpPFemPcbn5J15vrEKdQogYgoufumqU2XnCCLENCag+49xOvfs6uReQQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792451898;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=xkEO/OSiRmfTcfnZn00ylSAwEOQz293NLx30J9yMRbI=;
	b=kk9UMupioxryr0WqwWhXG183muOl7mi9XHrYcyW4OGUd94pKI5KIV0LHo8/N8iBi7fk4
	 dBOELyyDuR8zTHJz9lRkii3EWci9SleNPD1U9KdgWIo9IY1tsst6PiaDCXtPNShZImqEF
	 7A2ueiqecuQWKU89Oi3QZ8sff6apd/+PCjvSNf+EFVDE/Oe2GSDDHHlOdFlA3d2moC4MP
	 cEP61tVqUKCNlE4mTLJPHpDzbVc+lxNiByc6j1TRDEAafJAjttsgA5wpi8GM8wG2RSXSh
	 Mle/SZvEomNTX5Gj3ZjY32dCunrSP+IN9+qMgu5IjkY+WgX2sLaHkr/KtmukIE8xDQw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=lXSTaDUM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.182
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A4F606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 23:18:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46A4F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=lXSTaDUM
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-5337fa12431so72311cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 16:18:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792451896; cv=none;
        d=google.com; s=arc-20260327;
        b=b3Be8C1+T6ZMkBVNpbG7r5yGlB8n07zWrObsyg4bLqRLJ7tHy1t5fFgp+qitwyXMvx
         AI83gk+nExm+cwjkvka8glB3ZC8Ub1RR3k+B8mGxOtQ5qZSfrbmzsOsjSOWg7PbUGoQh
         Bb1G9aY7Jy05H8xtGcX8aVLSlIoVwYvEf4spP7wAvi766wXI69jXZu83koMI05ryBcJ6
         JBDAKQGG6qBrKb6xqoOyA/1odnIMdi2zWx/W8EFqFQpLF0RAh9qPKPwOvxZbhgl+Sn6u
         zDtY8DcJa6pc3lbJjxisoulY2Q5jeETiWX8pX2T+Hgr73Z5PpGl7X/aJFCrzSk3aya99
         V73A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xkEO/OSiRmfTcfnZn00ylSAwEOQz293NLx30J9yMRbI=;
        fh=Y87TslK/TEeZYRTrjcNX+qvZvXr3F4Wt1zmD1xjxoL8=;
        b=T6JXb6GZinHWtJh3kulY7l4paUKAmt+JJ/nl4BlsZ+OVrASZ6lwXaZepfdcpkjyouo
         T++iNFkBxhJrsahvHpUCxp++sFf1k3fCxSEDGeZQHpPC+ZDkAJ4+dRYgQ4txu/YI+t58
         vqR7KCeZxhHI82ka8MagZbrtURanBD90AV1Ro3I+F7VY6x+zM+4P/ZoSpCVGwcdI1Eid
         I7EaVMNlkn+JWNdoOMgQ8Yvb04H0hL99S2y4SmptBD10rnioIN1aD1eJ24n0nEe9/PZM
         t70FO1bPQ2KaY3SEVDH5xxklp1qxtcyBpmS0a24/ReGNz513KZEVyOvHRx6BPDN9VG+Y
         JY0Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792451896; x=1793056696; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xkEO/OSiRmfTcfnZn00ylSAwEOQz293NLx30J9yMRbI=;
        b=lXSTaDUMPxunqT4NG8XOu+6a4OArT7pDWEU93VGCHzg1SUOAWgq/AmOkvPZ3aWJjoE
         cwCm+bFLjJNw+1X6WCGZIwHMMve1j0ZTHgmSFGSnYMVvRX/GQ7rp5vwQjsw9MouTPbUP
         NDOCW5Oeeu7hEi8H4+OHFU5jWndcCD90gzXO2MltTiz6vQE/tsZpX+P4mw9qBLVAy5d/
         A28hrIIKE0NAix8sx6oabnORuMi4RxV6km6Dz7iL4jW3qQzf6OGFfYrGi4vMmOhPiyi4
         WqTpk2bsF9gC5zLdti+hAQ0R4DqeA0U0Fk2lCMo7++axBH8mFnEvVRw8jO0qZpA1cKX3
         1wYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792451896; x=1793056696;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xkEO/OSiRmfTcfnZn00ylSAwEOQz293NLx30J9yMRbI=;
        b=wCUqCIfJOSYOm6WI39wFJbEBsuXXZIeyxAN+v7rln+J6jSS/P7W37tldfKWBmdOlll
         TuLQn5cQFuWEgrbeBEyKYPOAh9bqGIspU5bnwxWWIpTAGjRQ3kJesqOBrPR5P/1V+dmq
         heAKJ0AWpbFzwzUbRdDwsUpMLCTt40XUyyMbthh6SR5DFJtcHeNg9tRyYr51b8j0MS9Z
         9qhcI0jSHZZpF6bo3PnNQdnGIgwRTFcxAE875TNYYCuy5wuEgao5LxOVoz5VyaPxOlaC
         ZOnr8n3QB/NHfsj5L8MK4zAOo8QeWhqeu9qyXOqYeJqwUaiVDx9QSDlN32k329X4ny+v
         VeIw==
X-Forwarded-Encrypted: i=1; AKwUvBz/aSPXO3mRRgnDsVmrFSSBXRwpeoznFITklrXS47rs4EXXGB0MPx/zyBTDd+TPkE7qX+PL2koro6QxwMw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIfeKQn7NuQDOrYg+LmodUOmgFcC/RE41ffGKoTvwz0uPgkz0QN
	OJkL3DrdV6TbNZt0P7Rrd8xuJJTYOyUYddSMqbtnbgjjYScvIb27Fuk58afNLTdkxrAnvV+Su+K
	ufbeaDjvBUsMrw0JU1G1VAdffmolkGhS02qVmRiak
X-Gm-Gg: AYBFou0eB8Hx9g0ZZlNPq02AnXdP9zGa7VocNGpPTJ+RybaGShmCbiOdeglMAMGv20z
	qfIfP7lUX3CRIJi1qcGUvlPNcmhFN7SZPydbSDmwYm9GdPitF68EFynA3tezCcu0Zo84JpzhdcI
	IQiz0g7dkY+Qa5pGojjNBAT3LvuO1rXM+/L1lW0GkETRfROypa3T/6kTIsM1eqTCWGUHSOPnBxu
	yHA1P7Y0BcnEdQkXtfAr4KOSAfiPTyfovEzzNiUFFakz0CU4a1CaTwKgpiWumNvnMKRhg1nrHL2
	ae6qiI+CujXEeyV2cBfM51sN2Ji0RgH0Z/+vHbVL7jBJgIXX4gDUhakYV7T0xKQNpzvMPyInjhd
	s1oI2hlil788/itO7WK/pHgSdyFSny+QnI4iK5TRkNhlv+IDx9zW8Yzxqkw==
X-Received: by 2002:a05:622a:418c:b0:52f:9ed4:8d76 with SMTP id
 d75a77b69052e-53688361cc0mr3730081cf.14.1792451895603; Mon, 19 Oct 2026
 16:18:15 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019164241.403644-1-bwicaksono@nvidia.com> <20261019164241.403644-5-bwicaksono@nvidia.com>
In-Reply-To: <20261019164241.403644-5-bwicaksono@nvidia.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 19 Oct 2026 16:18:02 -0700
X-Gm-Features: AclHuK-P4jTEpdJSRDgE-1GK0BbwVAkaLE7mt8LMQ_UZz4JJYrKoVTt4WXDObg8
Message-ID: <CAP-5=fWucvdYefDOL3Vn=O=YUPEXE+tngDDfPLv-T5i3WkCJVA@mail.gmail.com>
Subject: Re: [PATCH 4/6] perf jevents: Add support for NVIDIA Tegra410
 PCIE-TGT PMU aliasing
To: Besar Wicaksono <bwicaksono@nvidia.com>
Cc: acme@kernel.org, namhyung@kernel.org, linux-tegra@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, vsethi@nvidia.com, rwiley@nvidia.com, 
	skelley@nvidia.com, mochs@nvidia.com, rajjoshi@nvidia.com, treding@nvidia.com, 
	jonathanh@nvidia.com, john.garry@linux.dev, will@kernel.org, 
	james.clark@linaro.org, mike.leach@arm.com, leo.yan@linux.dev, 
	mark.rutland@arm.com, alexander.shishkin@linux.intel.com, jolsa@kernel.org, 
	adrian.hunter@intel.com, ctshao@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 9:45=E2=80=AFAM Besar Wicaksono <bwicaksono@nvidia.=
com> wrote:
>
> Add alias support for NVIDIA Tegra410 PCIE-TGT PMU events and metrics.
>
> Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
> ---
>  .../nvidia/t410/sys/uncore-pcie_tgt.json      | 93 +++++++++++++++++++
>  1 file changed, 93 insertions(+)
>  create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/sys/unco=
re-pcie_tgt.json
>
> diff --git a/tools/perf/pmu-events/arch/arm64/nvidia/t410/sys/uncore-pcie=
_tgt.json b/tools/perf/pmu-events/arch/arm64/nvidia/t410/sys/uncore-pcie_tg=
t.json
> new file mode 100644
> index 000000000000..74786fc3d578
> --- /dev/null
> +++ b/tools/perf/pmu-events/arch/arm64/nvidia/t410/sys/uncore-pcie_tgt.js=
on
> @@ -0,0 +1,93 @@
> +[
> +    {
> +        "EventCode": "0x4",
> +        "EventName": "PCIE_TGT_CYCLES",
> +        "BriefDescription": "Counts cycles at the PCIe interface to the =
Tegra SoC data fabric.",
> +        "PublicDescription": "Counts cycles at the PCIe interface to the=
 Tegra SoC data fabric.",
> +        "Compat": "1070036b",
> +        "Unit": "nvidia_pcie_tgt_pmu_,rc_"

It looks like the PMU names are broken because of the _rc_ in their names:
https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/drivers/perf/arm_cspmu/nvidia_cspmu.c#n901
```
   .name_pattern =3D "nvidia_pcie_pmu_%u_rc_%u",
```
The convention is for either a numeric (preferable) or hexadecimal suffix:
https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/Documentation/ABI/testing/sysfs-bus-event_source-devices
Extra information about the PMU belongs in a caps file.

By definition nothing can work with wildcard matching using the
existing PMU name, so please rename it. If a new suffix convention is
necessary then  you should update the ABI and perf tool suffix
matching logic like pmu_name_len_no_suffix:
https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/tools/perf/util/pmus.c#n65

Thanks,
Ian Rogers

>
> +    },
> +    {
> +        "EventCode": "0x2",
> +        "EventName": "PCIE_TGT_RD_REQ",
> +        "BriefDescription": "Counts read requests from any source to PCI=
e BAR or CXL HDM ranges under this PCIe root complex.",
> +        "PublicDescription": "Counts read requests from any source to PC=
Ie BAR or CXL HDM ranges under this PCIe root complex, where the target res=
ponds with data. Request size can be from 1 to 256 bytes. Filters: dst_rp_m=
ask selects PCIe BAR traffic to root ports (bit n =3D root port n). dst_add=
r_en with dst_addr_base and dst_addr_mask selects PCIe BAR or CXL HDM addre=
sses that equal the base in the mask's set bits. If both dst_rp_mask and th=
e address filter are set, a request matching either is counted. With no fil=
ter, PCIe BAR traffic to all root ports is counted.",
> +        "Compat": "1070036b",
> +        "Unit": "nvidia_pcie_tgt_pmu_,rc_"
> +    },
> +    {
> +        "EventCode": "0x3",
> +        "EventName": "PCIE_TGT_WR_REQ",
> +        "BriefDescription": "Counts write requests from any source to PC=
Ie BAR or CXL HDM ranges under this PCIe root complex.",
> +        "PublicDescription": "Counts write requests from any source to P=
CIe BAR or CXL HDM ranges under this PCIe root complex, where the source se=
nds data. Request size can be from 1 to 256 bytes. Filters: dst_rp_mask sel=
ects PCIe BAR traffic to root ports (bit n =3D root port n). dst_addr_en wi=
th dst_addr_base and dst_addr_mask selects PCIe BAR or CXL HDM addresses th=
at equal the base in the mask's set bits. If both dst_rp_mask and the addre=
ss filter are set, a request matching either is counted. With no filter, PC=
Ie BAR traffic to all root ports is counted.",
> +        "Compat": "1070036b",
> +        "Unit": "nvidia_pcie_tgt_pmu_,rc_"
> +    },
> +    {
> +        "EventCode": "0x0",
> +        "EventName": "PCIE_TGT_RD_BYTES",
> +        "BriefDescription": "Counts bytes transferred by the read reques=
ts counted by PCIE_TGT_RD_REQ.",
> +        "PublicDescription": "Counts bytes transferred by the read reque=
sts counted by PCIE_TGT_RD_REQ. Destination filters work as described for P=
CIE_TGT_RD_REQ.",
> +        "Compat": "1070036b",
> +        "Unit": "nvidia_pcie_tgt_pmu_,rc_"
> +    },
> +    {
> +        "EventCode": "0x1",
> +        "EventName": "PCIE_TGT_WR_BYTES",
> +        "BriefDescription": "Counts bytes transferred by the write reque=
sts counted by PCIE_TGT_WR_REQ.",
> +        "PublicDescription": "Counts bytes transferred by the write requ=
ests counted by PCIE_TGT_WR_REQ. Destination filters work as described for =
PCIE_TGT_WR_REQ.",
> +        "Compat": "1070036b",
> +        "Unit": "nvidia_pcie_tgt_pmu_,rc_"
> +    },
> +    {
> +        "MetricName": "pcie_tgt_freq",
> +        "MetricGroup": "PCIE_TGT_Frequency",
> +        "MetricConstraint": "NO_GROUP_EVENTS",
> +        "MetricExpr": "(PCIE_TGT_CYCLES / aggr_nr(PCIE_TGT_CYCLES)) / 1e=
9 / duration_time",
> +        "ScaleUnit": "1GHz",
> +        "BriefDescription": "Frequency of the cycles at the PCIe interfa=
ce to the Tegra SoC data fabric.",
> +        "PublicDescription": "Average frequency of the cycles at the PCI=
e interface to the Tegra SoC data fabric over the measurement interval.",
> +        "Compat": "1070036b",
> +        "Unit": "nvidia_pcie_tgt_pmu_,rc_"
> +    },
> +    {
> +        "MetricName": "pcie_tgt_avg_rd_bandwidth_to_all_dst",
> +        "MetricGroup": "PCIE_TGT_Bandwidth;PCIE_TGT_BW_PCIE_BAR_CXL_HDM"=
,
> +        "MetricExpr": "PCIE_TGT_RD_BYTES@dst_addr_en=3D1,dst_addr_base=
=3D0,dst_addr_mask=3D0@ / 1e6 / duration_time",
> +        "ScaleUnit": "1MB/s",
> +        "BriefDescription": "Average read bandwidth to all PCIe BAR and =
CXL HDM ranges under this PCIe root complex.",
> +        "PublicDescription": "Average read bandwidth of requests from an=
y source to all PCIe BAR and CXL HDM ranges under this PCIe root complex.",
> +        "Compat": "1070036b",
> +        "Unit": "nvidia_pcie_tgt_pmu_,rc_"
> +    },
> +    {
> +        "MetricName": "pcie_tgt_avg_wr_bandwidth_to_all_dst",
> +        "MetricGroup": "PCIE_TGT_Bandwidth;PCIE_TGT_BW_PCIE_BAR_CXL_HDM"=
,
> +        "MetricExpr": "PCIE_TGT_WR_BYTES@dst_addr_en=3D1,dst_addr_base=
=3D0,dst_addr_mask=3D0@ / 1e6 / duration_time",
> +        "ScaleUnit": "1MB/s",
> +        "BriefDescription": "Average write bandwidth to all PCIe BAR and=
 CXL HDM ranges under this PCIe root complex.",
> +        "PublicDescription": "Average write bandwidth of requests from a=
ny source to all PCIe BAR and CXL HDM ranges under this PCIe root complex."=
,
> +        "Compat": "1070036b",
> +        "Unit": "nvidia_pcie_tgt_pmu_,rc_"
> +    },
> +    {
> +        "MetricName": "pcie_tgt_avg_rd_bandwidth_to_pcie_bar",
> +        "MetricGroup": "PCIE_TGT_Bandwidth;PCIE_TGT_BW_PCIE_BAR",
> +        "MetricExpr": "PCIE_TGT_RD_BYTES / 1e6 / duration_time",
> +        "ScaleUnit": "1MB/s",
> +        "BriefDescription": "Average read bandwidth of PCIe BAR traffic =
to all root ports under this PCIe root complex.",
> +        "PublicDescription": "Average read bandwidth of PCIe BAR traffic=
 from any source to all root ports under this PCIe root complex.",
> +        "Compat": "1070036b",
> +        "Unit": "nvidia_pcie_tgt_pmu_,rc_"
> +    },
> +    {
> +        "MetricName": "pcie_tgt_avg_wr_bandwidth_to_pcie_bar",
> +        "MetricGroup": "PCIE_TGT_Bandwidth;PCIE_TGT_BW_PCIE_BAR",
> +        "MetricExpr": "PCIE_TGT_WR_BYTES / 1e6 / duration_time",
> +        "ScaleUnit": "1MB/s",
> +        "BriefDescription": "Average write bandwidth of PCIe BAR traffic=
 to all root ports under this PCIe root complex.",
> +        "PublicDescription": "Average write bandwidth of PCIe BAR traffi=
c from any source to all root ports under this PCIe root complex.",
> +        "Compat": "1070036b",
> +        "Unit": "nvidia_pcie_tgt_pmu_,rc_"
> +    }
> +]
> --
> 2.43.0
>
