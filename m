Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792528735;
	b=PoSMdpHb0iZUi+vvn8NV7W8LQWOxX5/aA+9Xgprmja6swWd5FMoLfvCy3LbE1XxQs6Fo
	 RHn0OsW6/Bt/rC/TQfmwc//Xmi8wkXxzSb1NYBEYAHguzQYIQoX7wU00ypbclfUQY+0kb
	 gV7xXMOiVNZYZ+drVtItEbghr08aY6/JfgKZ6yeYNotC6TpEDwRgnUMHqhAgdH3DXjb6D
	 xYM5cvKJ+rNnUX5LiNdfoILqsfdYBUB/FbWDx+cHTxjRxuqy3f+btqgaq2pGWx8Pm0BFI
	 4c/PnJkMQ9HrX94H3myfxEpDtYXLv9XrX1zwuS1RSYT8eNhgFmRYaQ6LVMsSCSuTZQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792528735;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:CC:Subject:User-Agent:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Jj9W1Fne0Eiht74C80diOWke64Mz4zGkFNYLVP0fVM4=;
	b=5UCz0U+CH5f9pPGe1WU/XSNT0zfxuEMjo+CtPch61A1YpLusZK0xa0CqkGkVr+2R8Pw5
	 gAAKHh6wLs4FYIjRVal/yPaLdOOI/A65GCl75J5Hj1cb0rH1+obf2B86E9zSI7c8O/EuZ
	 0soMP5ZguoSjiFf7C20vE0AKNwNmPE0C8tLSth12UORP6ecjfJM4/k/Hpi5p3LrIOdS4z
	 6TRy/Hbf+sd+ApBEQ1+E073KdEjG+uY4nZ/3IzybRm06oBWcWMrbZ2Qr++65CIEHZabNT
	 rmur8TYndYad2NX6kQtkkYLr4RsxrQuwGY5jWDX3WfBk79fPtFgTZVwo9M5ZYuYwklQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jTBO8R2R;
	arc=none smtp.remote-ip=209.85.221.174
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F33ED606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 20:38:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F33ED606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jTBO8R2R
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5eadef147ffso741143e0c.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792528734; x=1793133534; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Jj9W1Fne0Eiht74C80diOWke64Mz4zGkFNYLVP0fVM4=;
        b=jTBO8R2RDGFldB5sTmqyvIMD7lIP4ciDhUAXegojI3fPn4+naP/jvyuk1AUOiUxOpc
         U6RsmckMC+p1qW1pSrLeSvNhQb5tUomZopc2/16tD5QSu0rlwuTS/gGEA0KPb59hywPA
         EizmoNKwQ1tDYD6zwtYymLyeijMj+EOkGmiGR/UFeX0a9k3HAK9wOJXNzoMlBrZUUQ6V
         TqePOZxYKOoLdz7OO5bkhibxzmXsNzBSX6j8tGg/HEl2BZv+UHGS51KNmrzRK8jEugEP
         xS1omLgaia3/NIswYLQBJelu6dBbW2j/4sQKZec8HlZgcVqvqLiK4Ry60X3YDFzSxwsx
         nTMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792528734; x=1793133534;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jj9W1Fne0Eiht74C80diOWke64Mz4zGkFNYLVP0fVM4=;
        b=Zd3DYBd6tFzvUSAbBD19wVaaCEIFWwZiQu/AXCrLYodhOlJzfurJTxOcDBKhOIRfMt
         sFwvuqQ14M2nFImncjlecDrK2XJdPS8uq2FdrPkXtzA5g0AwI6oXzI3DDJRg1/iIzeIB
         pWf9mfOWrxx4rbVGXINxHBYL7WXHHp0aA74ImfPfh6DBpRzUzTWrAV0ZalUWe16vrdbn
         mfZzhndYBW+tjuym1VH0RHMfqYwInFB/9jGbIw3Evuw9ZQbtKETz24hj19X6CEkJIc51
         vfIEVZ9tk5VqFqESaxvRv8u4/DNq6otH/L3cPbQTxgDRrSkpIZl+4h35JBaC6t/Mxiuf
         20Ug==
X-Forwarded-Encrypted: i=1; AKwUvBw+ltUsAOvD87duJo33C6xMkez9Za3NQsERT7VRMx2CGNpcnCBBTKhNb0Vm/IY5IQ66BkUfFXA+3kXWQlw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLMammGODIy36NbcxhGN3EcvevZuouZxv7MuG51b52ep79BCfFF
	CKq7lQC+CaqN/HZ/rCZ+AnAU9cIRAe+JMVLN0ZHMgBHlaWx71LXyrmu4
X-Gm-Gg: AYBFou1NFkieL+JAsBlu49/RPp2itchuynS3gR6Ik1Yx1j7WZ7bSLAaau/o3A4vGGKS
	gauem5Vq4FkVWcDJMh4NQPYLnC/usf5AAblCDQ+thglY9M8nNMfaVbYdUt2Z65NC6VpfxW7P6/x
	0QEuDNLw0QN7SdfAEa1c+BWs1XcuQBpUNs8ZEcFqs6LmL8wCUJUvoHyaP6VNjUPhHecXAQRhHh1
	kecjUn4mlWPaXazPeaxVMQcTL9sNiseoJka7kqkr8CKYFdsMplpuIoAAqnipEpjq24cu3dHPjCB
	qpZBNSi45X2L9zbZR3x8U2bI57v7b9SChTKFaIbD9pVjtXae6szTLqZZKr3moZVSeBInkW5e0FV
	H3zbcVZxRBzes2tetzt9/mwgZED4n32ejdqviQhQmgs4Sp1I9Y1PLCvHRwNHVHPLiQPcnlXC595
	xdSRIhqsDftRrTfWCsXB0OhWEzaWhs8S54NmQOPCYcWmf2uWAb7S7dqYxAfuXbbAOwtKRgHNx5J
	2uZFIqMzA57PeYAlj1zOQ0Q0w==
X-Received: by 2002:a05:6102:2b85:b0:7c0:c6e3:3b88 with SMTP id ada2fe7eead31-7cc926fba03mr132043137.28.1792528733875;
        Tue, 20 Oct 2026 13:38:53 -0700 (PDT)
Received: from ehlo.thunderbird.net ([2804:2bf0:60e7:ae00:617a:6625:1f37:5d9f])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cc92428d7asm405406137.10.2026.10.20.13.38.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 13:38:53 -0700 (PDT)
Date: Tue, 20 Oct 2026 17:38:48 -0300
From: Arnaldo Melo <arnaldo.melo@gmail.com>
To: Ian Rogers <irogers@google.com>, Arnaldo Carvalho de Melo <acme@kernel.org>
CC: James Clark <james.clark@linaro.org>, Besar Wicaksono <bwicaksono@nvidia.com>,
 namhyung@kernel.org, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, vsethi@nvidia.com, rwiley@nvidia.com,
 skelley@nvidia.com, mochs@nvidia.com, rajjoshi@nvidia.com,
 treding@nvidia.com, jonathanh@nvidia.com, john.garry@linux.dev,
 will@kernel.org, mike.leach@arm.com, leo.yan@linux.dev, mark.rutland@arm.com,
 alexander.shishkin@linux.intel.com, jolsa@kernel.org,
 adrian.hunter@intel.com, ctshao@google.com
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_0/6=5D_perf_jevents=3A_Add_NVIDI?=
 =?US-ASCII?Q?A_Tegra410_uncore_PMU_events_and_metrics?=
User-Agent: Thunderbird for Android
In-Reply-To: <CAP-5=fXUMVJwtAp+8dA8V=hBD9q4x6J4YiUufwXAOXcAJoAKTg@mail.gmail.com>
References: <20261019164241.403644-1-bwicaksono@nvidia.com> <21f58af0-fa3f-41c5-ab03-216c60fbe2f1@linaro.org> <ate93zQFkfAecIv2@x2> <CAP-5=fXUMVJwtAp+8dA8V=hBD9q4x6J4YiUufwXAOXcAJoAKTg@mail.gmail.com>
Message-ID: <F2F3FF02-67B6-4EBF-BD4B-364C7CD28535@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On October 20, 2026 5:32:48 PM GMT-03:00, Ian Rogers <irogers@google=2Ecom=
> wrote:
>On Tue, Oct 20, 2026 at 12:15=E2=80=AFPM Arnaldo Carvalho de Melo
><acme@kernel=2Eorg> wrote:
>>
>> On Mon, Oct 19, 2026 at 06:23:16PM +0100, James Clark wrote:
>> > On 19/10/2026 17:42, Besar Wicaksono wrote:
>> > > Add event aliases and derived metrics for the NVIDIA Tegra410 uncor=
e
>> > > PMUs=2E
>>
>> > Reviewed-by: James Clark <james=2Eclark@linaro=2Eorg>
>>
>> Thanks, applied to perf-tools-next, for v7=2E4=2E
>
>Hi Arnaldo,
>
>can we not take these in v7=2E4 as there is unaddressed feedback:
>https://lore=2Ekernel=2Eorg/linux-perf-users/CAP-5=3DfWucvdYefDOL3Vn=3DO=
=3DYUPEXE+tngDDfPLv-T5i3WkCJVA@mail=2Egmail=2Ecom

Sure, will remove until the discussion comes to a conclusion=2E=20

- Arnaldo=20

>
>The specific problem is that the NVidia PMUs have adopted a convention
>not supported by the perf tool of 'pmu_name_<socket>_rc_<num>'=2E rc
>stands for root complex=2E What ends up happening is that aggregation is
>broken as the json is claiming that pmu_name is the PMU's name while
>the suffix perf_pmus code thinks pmu_name_<socket>_rc is the pmu name=2E
>They've wrangled support via the json by claiming these are sys
>events=2E
>
>We can either:
>1) support a new suffix convention of <num>_rc_<num>
>2) push back and ask the driver writers to name their PMU correctly as
>defined in the ABI:
>https://web=2Egit=2Ekernel=2Eorg/pub/scm/linux/kernel/git/torvalds/linux=
=2Egit/tree/Documentation/ABI/testing/sysfs-bus-event_source-devices
>
>If we do (1) then it would be nice if the support for that could be
>contained in this patch series=2E In any case these events don't belong
>in sys=2E
>
>Thanks,
>Ian
>
>> - Arnaldo

- Arnaldo 
