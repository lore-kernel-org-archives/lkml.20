Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBBD5496D20
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 21:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790890444; cv=none; b=gC1swUWxsCWK7nFhm5rBgjfcW4IOI3OoYrfTk0MakbxX+zeHUpV6V0sTjK2ndZryefcSYl2QK64MjyQ1IeQ3v2vMphD/BG7c4cIpD80FjDYFRIyJ+Icf9wREU1of+9eCjmR0dp4IRBFkORltyOd4q4WapbgE5+GNzqvzKv0ciRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790890444; c=relaxed/simple;
	bh=nT9hMrtZRR/2siI80QtehZ8BnMD1l4DAL83J/BAbUcM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bhaDgSA4h/B2E3o0rJIDUgtd+/Y8kwXYKXmobuKI0lBswAxgrPZ4+id2Rno6XLRVVVKA5QL6E5WDOM4JUfTCb4+5eYuHlLh1BnoZxgPxau6/QYzDmpqb8yHHikfcW2w6TpgGHIdsSa/zcqz7N7P5onoubRzvPTlVduYkO2b02DQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tlM3Lxtc; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tlM3Lxtc"
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4cbf700ddccso6996565b6e.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 14:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790890439; x=1791495239; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nT9hMrtZRR/2siI80QtehZ8BnMD1l4DAL83J/BAbUcM=;
        b=tlM3Lxtc3WbIZgWz/Xm+xUadbSBplTug2uUjQgOHf8LqtVeSfHnfzdKEY3MKHG3hIB
         pGbXeenqxFZMyOIOw5fLqnl4Vc8TXJx+iLR2zhaY3T74vpojbMBPtA+AxIqDsgZeTi1X
         NHyiSKlysIlTdFyhK8gXAEcGZTg7EPVyQVoYO563WrhvWt1chumYtIMU4q3h5188AFOn
         8bRz11fSTBgxH7CrBAdROTRTlyIKahNT2RP+bZO6PiBfoY4EVVqI+KrSDNp7Rcfkn70l
         sdS4UhbqD28R022nca9PFW3THNTgpMqV8e0fnQrSnc+2YHt5drIXwrer7xEAJnUNz/1i
         DWVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790890439; x=1791495239;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nT9hMrtZRR/2siI80QtehZ8BnMD1l4DAL83J/BAbUcM=;
        b=YkgIejqn0W+6xjgg1Y00RqDi2/4P8OZM6ReKKNhol9oKWG9Oa9JoPPiUWzG/sMpJT0
         t+eI8rFK+TPgiDtkucMV1xHaQl8Mvux/di2xH/76iPHlYGA1teeewZvW7Gd87a2YSJmH
         bNb1h/Sbx12PtHTAk8zHnf13fbFF3iR4tozTnxqziAXtcuxc16wX5hWKrQRc8JdSF1t6
         KtH9i8y76BEQ536ND4S9wHn5P6DNTNnEz8EtjhAxKza9z51A6J4WjXyJzrxhuO9xj49b
         0Xt8L7WrptZy2IZ0EiPG3rsueXxEyY2jBi0gPD+jye39c+gWFFEaI0/P/rGwXlzONWPq
         yK1w==
X-Forwarded-Encrypted: i=1; AKwUvByOCy2rZygajbtwIgC52OmIMZIWqvfjruyFT905+cy5RmbJTrv71DAjH19j5hACIpeznzsaq9H33dcte/Q=@vger.kernel.org
X-Gm-Message-State: AFuF++nxb5sWzP5LdJzx8//Uv2Zug5FFrAdry2PTbUu0Zrgr4ubRolZW
	M1qqDhCVQRMjgg7FdDWwI92rhfTPlRGryr+4BoxpR4Snwu817OQ0OqHM8hPWtIU/ohAP+938Dga
	oRBw5AWn123ZjZ45tc5+XoEcpxw==
X-Received: from ioben34.prod.google.com ([2002:a05:6602:3f62:b0:9af:289c:476c])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:bc1:b0:4c3:2e7:55bb with SMTP id 5614622812f47-4f52a57e776mr435364b6e.38.1790890438606;
 Thu, 01 Oct 2026 14:33:58 -0700 (PDT)
Date: Thu,  1 Oct 2026 21:33:56 +0000
In-Reply-To: <5750151d-cb99-4f9d-b469-12a7b7796985@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260924172928.2110956-1-coltonlewis@google.com> <5750151d-cb99-4f9d-b469-12a7b7796985@linaro.org>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261001213357.2088894-2-coltonlewis@google.com>
Subject: Re: [PATCH v9 00/22] ARM64 PMU Partitioning
From: Colton Lewis <coltonlewis@google.com>
To: James Clark <james.clark@linaro.org>
Cc: Colton Lewis <coltonlewis@google.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Fuad Tabba <fuad.tabba@linux.dev>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Zide Chen <zide.chen@intel.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, Mingwei Zhang <mizhang@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Russell King <linux@armlinux.org.uk>, Shuah Khan <shuah@kernel.org>, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi James,

On Wed, Sep 30, 2026 at 04:26:23PM +0100, James Clark wrote:
> On 24/09/2026 18:29, Colton Lewis wrote:
> > This series creates a new PMU scheme on ARM, a partitioned PMU that
> > allows reserving a subset of counters for more direct guest access,
> > significantly reducing overhead. More details, including performance
> > benchmarks, can be read in the v1 cover letter linked below.
> >
> > There is no longer a kernel command line parameter
> > (`arm_pmuv3.reserved_host_counters`); PMU partitioning is now completely
> > controlled via the KVM API using `KVM_ARM_VCPU_PMU_V3_ENABLE_PARTITION`
> > and `KVM_ARM_VCPU_PMU_V3_SET_NR_COUNTERS` vCPU device attributes. When
>
> As far as I know there isn't a straightforward way to get the number of hw
> counters from userspace. You have to either parse dmesg or attempt to open
> incrementally more counters in a group until it fails.
>
> This makes doing things like "use all counters for guest" or "reserve two
> for the host" difficult. Maybe it's time to add a file to the PMU that
> userspace can use query this.

Inside a VMM, userspace can query the default PMCR_EL0.N via
KVM_GET_ONE_REG(SYS_PMCR_EL0) after KVM_ARM_VCPU_INIT (or
KVM_ARM_VCPU_PMU_V3_SET_PMU) and before calling
KVM_ARM_VCPU_PMU_V3_SET_NR_COUNTERS, since KVM initializes
nr_pmu_counters to the PMU's max_counters (which is how
vpmu_counter_access discovers the limit).

For users and management tools outside the VMM (e.g. choosing N to pass
on the QEMU command line), I agree it's awkward that
/sys/bus/event_source/devices/<pmu>/caps/ exposes slots and bus_width
but not the number of counters. I will add a patch to expose a caps
attribute for the number of counters in drivers/perf/arm_pmuv3.c.

Thanks,
Colton
