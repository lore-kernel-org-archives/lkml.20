Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792430601;
	b=KcHHribdUFDczIDPDn6YisNEoqNSPjMuXr+z/s478ZHyS8BxmUKue1JKtu3qqKhXsCZ8
	 BH9/EFXmQXipGWdx28bobFWaBNhXtxyqrdXfloqVmOySq22S3TRAucS2SfuPjQiyZCDzQ
	 pysoNKQ68X3uRxqnMqPQTNKx1q0MQ5q5/rNM+pEx6BivYwrdrapvkCLtpWkkWq0i6QN2T
	 4/woABC27mUZnuL7rcLYRmdWZct+RkxHcn7btXTObkRHAajU4eqJMwtjygnBGrC0K0Nn3
	 FdEGRKZGL4iyF+euXDmQB8v5xY/Q2rcQIJLM8QFawpf7YCz7iEW1gWzUkFnwKRIGGeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792430601;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=cOvkQnhbq0+fnTGNKO70Y/TnLhjhtLA41wQn07DNzu0=;
	b=c4y0NPWeOsFrYJefpF04y8yj24jHpdfSfX7cG0dHDRwvji7fWHMROLYX11vPcPl9dhKI
	 ennRJRW5G3D2AYoI2LWOmK3jvuKvYqFxLcHAfHVlG5lr55E6SIFNCGSEIVXjpAVc+5lt6
	 7MbZAgrjmZ709J0bHme4tPP9bxMVImzlRmFeuex4EOi0+yfsC870q8xtbBqOugV/AWqIB
	 /STcNRwUaPL/3scgwHwOtG88KNvLO9848oYEa/Mwr1p72hjx5FRwgwWswz3MBk2J4mBiB
	 8EfLIL2CDjFnVESnv3mDBMCnGea1t6rW0IPwHJxiHKqV1f2BX06sn4/ZVAFCWqoBiXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=xrJ3CVQS;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E86606A325
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 17:23:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98E86606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=xrJ3CVQS
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49d05d51553so16578245e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792430599; x=1793035399; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cOvkQnhbq0+fnTGNKO70Y/TnLhjhtLA41wQn07DNzu0=;
        b=xrJ3CVQSp123OrHRWakMwwLvRCPyALMdPVipV2UsJjCIoUTLR7morKTAk17lhHp6EO
         2DxdvTVRdC82uO9JgWxqroq4NbW+Lr/wBuyhfv5KU57y/dEEzWhlNxzmjDrzjvjIv51B
         vSxuCjn2AAls+yb4o3ajXqIegrWuRn20NPUhRIicbAYAiRS0zPYgovPKPESfcfL3yZ6c
         9UCKBgbkt9AgWODOWQg6mxsqqWdDjXXWEu4XNlT8LsVlAgP9l9EX/dWOQpZ37AEnLljk
         pXkT3rG6kFwU7Z0lPT/rCBg8MrH3TCDULMJl2iVxXlxezLooCY7+wjcpOK53ATfstfAI
         XhGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792430599; x=1793035399;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cOvkQnhbq0+fnTGNKO70Y/TnLhjhtLA41wQn07DNzu0=;
        b=UrSvirJKBnG9KdsiAUcCUbK6m0Gzof5hH3Xa1n0w47zI6dzNfzaqsvFKR5/Du1QW0d
         XmlnhpJt9KIwsaYY9hPpELm6bBInb9RatZOtv99dshlPcZn6ftyc7CfxXeNttdsCdzCi
         bnVuj5FXHmYEu7ldG2NTl+ENa9bYtrNPMHc/GdA8ExSKAAMTiEq9JX0kT9/cMdKa/Mtn
         vsSyB1UnefCmqDQbPUUcJLGIi4vBK+ZUezDjWB17M/5KpVMvAXykcxlAJw/K9lOznPib
         sTrdjuPmjtnVoA2SzbQzTVOzRZa5B9BWQODCJzXHFDuY68kgibEikLo6EnqHjk5VGNu+
         pjAg==
X-Forwarded-Encrypted: i=1; AKwUvBxv4dRfC8YQ+dmBrPBjGyebW4S3CCm2J7dt1knc+uhaqMP9DwCeZizNFzEHv2t1QnDQ93yEPBp8lfrFX7c=@vger.kernel.org
X-Gm-Message-State: AFq9FYJriWqL7hVJVHxQCM5eVLkiITV5503xSMAPRmH5ARHowdrwGQlR
	1uR6ys90W4tCMWByIy4g8vsP4A3+/zqUwquYmg3o08RO35aHAKCIDVDXkDaJmjyzfSY=
X-Gm-Gg: AYBFou1FPHUX21BnueZ4wrOc7zS8zF2w0KAybdG5H+tWuGcqnuKnRnOy1B1dHu2D1IC
	KwWOGyAK1v3khQLkN9YquzMCs8c/km8jigHv0SnopBwHRomDncWWPrrT6hj7BfZbipOw15yVSPX
	UDbcKieuGSv4DrFayeIHiPmePl3hXIJhutXflF/3mx6pRUiR5Agby4pU6HANQZCgruv/GQPBAqq
	n2K6SEmkKjHyn9Ts0MYHR56J/1qq9U5DRim/XFTV7Yc0QXJLQXwGgtIAuc4SSSwjnP6YRY1eQ8o
	eJ3wrMFbwRXjc6Rg24cRXYo3SCL3+IQK1wdozSBgg8ujRePoJ18m92wvl1So1+PYnvD47h1tgg4
	3beJD28WgT1smpHwfQe2/VLqJtyk6zcVhLQF8i24IzdqssJBrvSvLChJrls/IyUTR2Rbs7ovMrE
	NZwZChAUfVY+vnDY0jFbzBpS4RPfdVLWlQz2CyfTRsWujM0cbx3tXMIbvf88HNVcXa+aV1old8v
	i8=
X-Received: by 2002:a05:600d:4447:20b0:4a1:d483:559b with SMTP id 5b1f17b1804b1-4a1d7612bbdmr129179715e9.24.1792430598956;
        Mon, 19 Oct 2026 10:23:18 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d838dd6sm184529f8f.58.2026.10.19.10.23.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 10:23:18 -0700 (PDT)
Message-ID: <21f58af0-fa3f-41c5-ab03-216c60fbe2f1@linaro.org>
Date: Mon, 19 Oct 2026 18:23:16 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] perf jevents: Add NVIDIA Tegra410 uncore PMU events
 and metrics
To: Besar Wicaksono <bwicaksono@nvidia.com>, acme@kernel.org,
 namhyung@kernel.org, irogers@google.com
Cc: linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 vsethi@nvidia.com, rwiley@nvidia.com, skelley@nvidia.com, mochs@nvidia.com,
 rajjoshi@nvidia.com, treding@nvidia.com, jonathanh@nvidia.com,
 john.garry@linux.dev, will@kernel.org, mike.leach@arm.com,
 leo.yan@linux.dev, mark.rutland@arm.com, alexander.shishkin@linux.intel.com,
 jolsa@kernel.org, adrian.hunter@intel.com, ctshao@google.com
References: <20261019164241.403644-1-bwicaksono@nvidia.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261019164241.403644-1-bwicaksono@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 19/10/2026 17:42, Besar Wicaksono wrote:
> Add event aliases and derived metrics for the NVIDIA Tegra410 uncore
> PMUs.
> 
> The series covers the UCF, PCIe, PCIe target, CPU memory latency, and
> chip-to-chip interconnect PMUs. It provides symbolic names for the raw
> event encodings and metrics for bandwidth, frequency, and average read
> latency.
> 
> Patch 1 fixes a jevents ordering problem found with this layout: the
> uncore events live in arch/arm64/nvidia/t410/sys/, next to the T410 core
> events, and without the fix jevents puts the core tlb.json (which sorts
> after "sys") into the sys table, so its events are lost from perf list
> and perf stat.
> 
> Besar Wicaksono (6):
>    perf jevents: Process model files before sys subdirectories
>    perf jevents: Add support for NVIDIA Tegra410 UCF PMU aliasing
>    perf jevents: Add support for NVIDIA Tegra410 PCIE PMU aliasing
>    perf jevents: Add support for NVIDIA Tegra410 PCIE-TGT PMU aliasing
>    perf jevents: Add support for NVIDIA Tegra410 CPU Memory Latency PMU
>      aliasing
>    perf jevents: Add support for NVIDIA Tegra410 C2C PMU aliasing
> 
>   .../arm64/nvidia/t410/sys/uncore-cpu_mem.json |  48 ++
>   .../arm64/nvidia/t410/sys/uncore-nvclink.json |  75 ++
>   .../arm64/nvidia/t410/sys/uncore-nvdlink.json |  48 ++
>   .../nvidia/t410/sys/uncore-nvlink_c2c.json    | 129 ++++
>   .../arm64/nvidia/t410/sys/uncore-pcie.json    | 247 +++++++
>   .../nvidia/t410/sys/uncore-pcie_tgt.json      |  93 +++
>   .../arm64/nvidia/t410/sys/uncore-ucf.json     | 693 ++++++++++++++++++
>   tools/perf/pmu-events/jevents.py              |   4 +-
>   8 files changed, 1336 insertions(+), 1 deletion(-)
>   create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/sys/uncore-cpu_mem.json
>   create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/sys/uncore-nvclink.json
>   create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/sys/uncore-nvdlink.json
>   create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/sys/uncore-nvlink_c2c.json
>   create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/sys/uncore-pcie.json
>   create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/sys/uncore-pcie_tgt.json
>   create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/sys/uncore-ucf.json
> 

Reviewed-by: James Clark <james.clark@linaro.org>
