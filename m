Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792700749;
	b=oNXcZku/+KlBQ8qVldo4a3vPNX6kMHXmholVRBdN/CzrydWbHnOreyivxp2FVpBS/1DO
	 kyMxAqtJfYnBvNnaE1sYqN2hEJQmATYngQbk7liapqw8w0sMCbQRIalYV4f5s6zgphZrk
	 Nd7KQQnGvdmDehF1hFbyh7uNAps8LP21pTZ08m2g3uzlGmPwO08gPnnGQyAmxnWyKtZ7R
	 xsarKFcd2Xvfqtp4UMPn/pycdtV7cUuhbDqBmzv3ltOCYkK/w+8EEEM1DaFCUuqQaVkI0
	 gQWesc0zNuHalmJAwQYPQPuA0BSaRwm2FkzP2ldwrOpwKZJoXwrrQox/5OhhxxOxNMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792700749;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Subject:
	 From:To:Cc:Date:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=38nCIBC94WdQiZ/zspgbUPpmIOd8dxsp5BuTd9fAGW8=;
	b=AxRWWHxkDVdbot+rx3v2vAhBGfbsoAgxRNDekxbG7sQ1muDZI2dHmLyEThLipW9SJzU7
	 /YBr9bDmbTdmn6O0x9VLaKQQR4zOnwUcHHCSVr5BsyfX5lrwaOACGtR0uYTazqar5k6QI
	 emlLcui9ngKYCR+9JkJWExCMa5pMxcsKW/6xvM2eK0QTAh+I8TmbiBdHhK4MwG8LTCwVW
	 7o1yX9BJ9VDU10ccOdzlY8sj7Hl91Tn5OXOJ6/LtybYwb+0C8ASH9UKeWQVoI/edh7H5r
	 Esf0eLcaWao2/8vfgI0E3h/icWEB7+1zvDXUcp/SEUV3rPqjbAyzE0NwruCwAC740Lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cAG0hr98;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52BE3606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 20:25:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52BE3606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cAG0hr98
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792700749; x=1824236749;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=38nCIBC94WdQiZ/zspgbUPpmIOd8dxsp5BuTd9fAGW8=;
  b=cAG0hr98zZp8NQChpIgUnBavna7petBzh62fbJM83U+3rL2+C5fAqkfJ
   rVpSs27K39G5faRXGksQ1Mnyq6b1TAAk76avZ8zv5+l4PabLZv8t053k3
   8zrIM+LIcx2erQLqu+yDlQZWYec2S4GygceEuTU0QggT1HrRY3RBgGYTf
   5HYaC3gNjtrGUkcmwMpSuF0vLguYcAh1MmwiIuzDgDz4ZmQtkKgx71KMw
   XkoKnZYK1R6lPq1auDeR3zowIRn5xEPI8kod2SnLh/RDogLa0UsyIrTdz
   vNRnzcmYVX1Q9RmuQWjQdnBLGiJOcOIgJg6TsXFP3KeW7uWWBciq3iDPJ
   g==;
X-CSE-ConnectionGUID: twvwVYmlTgGuRqzX6Wv7sQ==
X-CSE-MsgGUID: vwk9LgEbSg2xx/q8jD66mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1554273"
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="1554273"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2026 13:25:48 -0700
X-CSE-ConnectionGUID: oLNQg+srTRuGdrX9vzB12g==
X-CSE-MsgGUID: wI6IEDXrQym2v7dlORp+wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="3549516"
Received: from unknown (HELO [10.241.242.209]) ([10.241.242.209])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2026 13:25:47 -0700
Message-ID: <6d8ff4593cc93c0033c6537eeac281085726c220.camel@linux.intel.com>
Subject: Re: [RFC PATCH 0/6] sched/fair: Introduce the SMT_BUDDY_ASSIST
 feature
From: Tim Chen <tim.c.chen@linux.intel.com>
To: Li kunyu <likunyu@open-hieco.net>, mingo@redhat.com,
 peterz@infradead.org, 	juri.lelli@redhat.com, vincent.guittot@linaro.org,
 dietmar.eggemann@arm.com, 	rostedt@goodmis.org, bsegall@google.com,
 mgorman@suse.de, vschneid@redhat.com, 	kprateek.nayak@amd.com
Cc: linux-kernel@vger.kernel.org
Date: Thu, 22 Oct 2026 13:25:46 -0700
In-Reply-To: <20261020083746.37068-1-likunyu@open-hieco.net>
References: <20261020083746.37068-1-likunyu@open-hieco.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.1 (3.58.1-1.fc43) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Tue, 2026-10-20 at 16:37 +0800, Li kunyu wrote:
> [Background]
>=20
> In high-performance computing (HPC) and cloud computing scenarios,
> maximizing overall compute throughput and sustaining peak CPU capacity
> remain critical optimization goals. Within the scheduling domain, the
> primary optimization focuses include:
>=20
> 1. Timely responsiveness for task wakeup and execution startup.
>=20
> 2. Fast and balanced distribution of CPU utilization across cores.
>=20
> 3. Preferring task migration within shared-cache domains (e.g., L3)
> before burst workloads arrive, so as to reduce cross-die or
> cross-node overhead.
>=20
> During development, the following issues were encountered. The above
> approach ultimately yielded measurable performance improvements.
>=20
>=20
> [Problem]
>=20
> It was found that on servers equipped with the Hygon 7447v CPU (Model 7,
> 384 logical cores), migrating tasks across LLC scheduling domains during
> load balancing caused significant performance degradation:
>=20
> 1. A low L3 cache hitting rate (due to factors such as non-shared L3
> caches).
>=20
> 2. The traversal overhead of higher-level scheduling domains (e.g.,
> cross-NUMA scheduling domains).
>=20
> Similar issues were also observed on CPUs from other vendors during
> testing, though the degree of memory bandwidth increase and other
> latency effects varied. Consequently, a series of patches was developed
> to address and improve these issues.
>=20
>=20
> [Solution]
>=20
> This RFC patch series introduces the SMT_BUDDY_ASSIST scheduling
> feature. The main work is as follows:
>=20
> 1. Push CFS tasks to SMT sibling CPUs during periodic load balancing.
>=20
> 2. Skip SMT-domain balancing after a successful push and avoid pulling
> the pushed task back.
>=20
> 3. Restrict newidle balancing so it does not pull from higher-level
> scheduling domains.

Kunyu,

Have you tried to set relax_domain_level=3D in boot parameter to
prevent new idle balance across NUMA nodes?

grep . /sys/kernel/debug/sched/domains/cpu0/domain*/{name,level,flags}

to find the right level for NUMA and also if the SD_BALANCE_NEWIDLE
is turned off for NUMA after you set relax_domain_level.

Wonder how much this will improve things for you.

Thanks.

Tim=20

