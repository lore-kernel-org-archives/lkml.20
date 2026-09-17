Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41BA8340A47
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 02:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789610830; cv=none; b=EyNBaKBqzN2cfP42jNgBgYoEt3kmgOWxF49D4Av6d9Q6VOnRFHLmtKUg1ai97T+rpMpO2MArFMEtCfshAE+wIbwPEh8/sSlSadLTcGCQyLqqKnJff+bTncKdgAO3Q+3pcLdwluw5P3c9DsfM1wkSSHxItN5PtZQGMrNg5ftoL5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789610830; c=relaxed/simple;
	bh=2Au3LTyyde1NXe3pV1Jp5fFNXw8iKXKum8s4v/uClQA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gNBNN+PZZOWNKLnsGhfaedpeMbpCmPExbd085MavtD2bTi5y5QrCNy6yCGMxVVpTfl/4aemxp9KCCiZGdpDgtdC9zeaTsvqkN/LWDTR915txVWv/VjvwHOGFt1uysgVMJGAYwn0IHD9mx/kz7RweRsKzEnItd927pAcmj5lC73A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UXZ3VtlL; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UXZ3VtlL"
Received: by mail-pj2-f43.google.com with SMTP id d9443c01a7336-2d747ee1f38so3092945ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 19:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789610828; x=1790215628; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Veq/d5GG4sWMYx11wlD0mjBLYK1jExJiTNsjFaM3d/s=;
        b=UXZ3VtlLJOS138+mmuu6J+6Z85nJbd5TX9QWYrmjGIqAzvfcXAct7x8E+DkPFJiXf4
         tMNzNoHpPEanB4FVl/x/wW+UY9TCymCeU5+ycLxWc971wWm2MwC8VfFKVDGqMMPliCnm
         IIJWLF4m0Gnv2f3/D5iGwYEcxPjGXzYaarG4F9US+sf8U67IlncoQhCeS5W+w7XrXrv5
         XfOfMVSIxiSMNCVrAZieMshC0ygEwdZsGs6sRBOi/VuTyaZFf5nazv1iLg0Q9EfMiEpl
         rU/tDPwIK1wY5FKm/+2y1oUVjSBsZXOeUlGaFSYxcp16QGuAaSLfKeljG7uSVsznlfbU
         BSUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789610828; x=1790215628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Veq/d5GG4sWMYx11wlD0mjBLYK1jExJiTNsjFaM3d/s=;
        b=flFo9TWPfOMMTYAXoDXSdw5I1+5Azq/1ekCyH5102ayJ9wEmN+g422VI/D7uujWEeF
         cuugIBrWTB7q1uStx88QmdxrXddiCL2nCGR+WHO+Osvk98VcP9P3wFmdiRuUTc8l70u0
         gRExMHeNvZmXWfR6hpfP3e5KU7cCmj+CsXmsP1UDEKZgPZV5g3cyB02v0Rm54dRdCXuq
         KGbu3S0hK4ARTlGpcuLtgyzl/iUQZXB39QiAuN4eftO3eg3HKP9QzQPdPnhZstJdnDkg
         JhxYM/noHrneszhWZBkaQ/8Hm5qKyppSpA8XQxiBWS3PIy+ThGu+bEPmgK6xr/45LnHd
         6c/A==
X-Forwarded-Encrypted: i=1; AKwUvBz2Y+iAIP62KCd3COJRJfqwwX0gl9Y0HvOp1c9G9GTCKLqXHUytufhOSU4TtcKKM8er58l180q5rYuKqm8=@vger.kernel.org
X-Gm-Message-State: AFuF++n0j2aOct3NfgTbmmmiy1V91rJm0hvMKoKbkTc2tAtGQgeizHzb
	O+ZmLOWtQoEasxmDcEfzMFSFxFOWXSJ5osyzWP2PXgv67RoAmCxtfXVB
X-Gm-Gg: AYBFou2Vxr2MLNXrVj+xMBMQg0nLCO9VulrvWGWbSvJ6igEBiSp7JrNiPORWv2TjkLP
	aWEgkR6bEeYfCLde6b8wKQobMVdX3tFwzzur2sUtfLH/kq9mwXO+N2m+VatjwVhkc7OUigCrVBr
	/a1jNDH7DZWmUkn3z3NKd9Zpvk8WqquJ/HD9rMHAJzL2xJwhxEapZxMulflfkLqzdcU6EG+CwUa
	xXEcqHe9gA+M79MHu6Q2aFwd/1DnkVv3JWm/CFhjsvk/1JxCrsIWqn5fkai4gHRHpndMn9eOsO+
	yr+srHVThceWeDT8FLlb3NhFP+ftzytuJKycKCdpB6FmIc8WxFnSog/vSy3bF+uNPylEXS2qUx2
	i6d8wtjjb9yrzoN95wbW0nC4dX15A5aPuRpOkHxkrTrwVcCG42Xef0vUJL6XoeBqxKlSkcEolrC
	5V8T8kt8v1htmRPeF2uwQKwLt3SeK/q5llU1lsvOC5eq/A8eBe0QCJuQzS0Rb7+OVXmM/WD1vbT
	McR93tf3z0LdesMcg8qQ0CexSU9toW9WG4q83sz
X-Received: by 2002:a17:90a:28f:b0:39e:2530:2102 with SMTP id 98e67ed59e1d1-39e253026d9mr9151823a91.11.1789610828473;
        Wed, 16 Sep 2026 19:07:08 -0700 (PDT)
Received: from localhost.localdomain (vmi2317699.contaboserver.net. [85.239.239.237])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e39b0399bsm383108a91.2.2026.09.16.19.07.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 16 Sep 2026 19:07:08 -0700 (PDT)
From: Lian Wang <lianux.mm@gmail.com>
To: SJ Park <sj@kernel.org>
Cc: Ravi Jonnalagadda <ravis.opensrc@gmail.com>,
	akinobu.mita@gmail.com,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	akpm@linux-foundation.org,
	corbet@lwn.net,
	bijan311@gmail.com,
	ajayjoshi@micron.com,
	honggyu.kim@sk.com,
	yunjeong.mun@sk.com,
	rientjes@google.com,
	weixugc@google.com,
	jic23@kernel.org,
	gourry@gourry.net,
	Kunwu Chan <kunwu.chan@linux.dev>
Subject: Re: DAMON reporting more hot memory on huge pages (was: "Re: [RFC PATCH v2 0/9] mm/damon: hardware-sampled access reports")
Date: Thu, 17 Sep 2026 10:06:37 +0800
Message-ID: <20260917020653.46010-1-lianux.mm@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260917004533.89744-1-sj@kernel.org>
References: <20260916051150.107931-1-sj@kernel.org> <20260917004533.89744-1-sj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi SJ,

Thank you for thinking further about this and for suggesting the damon_prep
direction.  Let me first clarify the real-world use case and correct one
expectation that I created in my previous mail.

SXF develops a hyperconverged infrastructure platform.  The workloads running
in the guests are customer workloads, and their types, memory sizes and access
distributions are not controlled by us.  Oracle is the workload in the case
that exposed the problem, but we cannot define one Oracle access distribution
as representative of the platform or provide one generally applicable
workload-specific THP performance number.

The platform has two requirements:

  1. Host THP is enabled by default.  Large mappings generally provide useful
     translation and virtualization benefits, so disabling THP merely to make
     monitoring easier is not an acceptable general solution.

  2. We also need an estimate of each VM's active memory as an input to later
     memory-tiering configuration.  If a small number of distributed 4 KiB
     accesses makes many 2 MiB mappings appear fully active, the hot-tier
     requirement can be substantially overestimated.  VM sizes vary, so the
     absolute error can become large on a large VM when accesses are spread
     over many huge mappings.

The reported setup is a KVM/QEMU VM whose large guest-RAM allocation is backed
by a shared tmpfs file.  Oracle runs in the guest, host THP is enabled, and
host DAMON vaddr monitoring targets the QEMU process.  The field observation
is that, for the same business memory-use case, the measured hot proportion is
much higher with THP.  The guest-side tmpfs 4 KiB/2 MiB writer is a controlled
diagnostic for isolating this mechanism, not a model of the complete Oracle
access distribution.

The DAMON setup is:

  operations=vaddr
  monitoring_attrs/nr_regions/min=500
  monitoring_attrs/nr_regions/max=2000
  monitoring_attrs/intervals/sample_us=500000
  monitoring_attrs/intervals/aggr_us=20000000
  monitoring_attrs/intervals/update_us=60000000
  schemes/nr_schemes=1
  schemes/0/action=stat
  schemes/0/access_pattern/age/min=0
  schemes/0/access_pattern/age/max=18446744073709551615
  schemes/0/access_pattern/nr_accesses/min=1
  schemes/0/access_pattern/nr_accesses/max=18446744073709551615
  schemes/0/access_pattern/sz/min=0
  schemes/0/access_pattern/sz/max=18446744073709551615

The hot proportion is derived from the bytes selected by this stat-only scheme
(at least one observed access in a 20-second aggregation window) relative to
the monitored QEMU scope.  It is used for later configuration, not as a
request for DAMOS to split or migrate memory.

As shared in my previous mail, our controlled PC and server runs reproduced a
large THP-off/on observation gap.  The exact-address capture also showed a
512-times difference in unique 4 KiB spatial coverage while the two aggregate
DAMON hot proportions remained nearly identical.  The conclusion is that the
current coarse observation can substantially inflate active-memory estimates,
and configuration-only tuning cannot reconstruct the missing within-PMD
spatial information.

> I still want to better understand the real world use case before digging into
> the specific solution.  But, I was thinking perf event based monitoring might
> not feasible for the case.

We agree that perf-event feasibility should be established rather than
assumed.  We will test the address space reported while a KVM vCPU is running,
per-VM attribution, coverage and loss before relying on that path.  If you had
a specific feasibility concern in mind, please let us know so that we can
include it in the test.

> That is, we can request DAMON to do some preparation action for the data
> attribute sampling, using damon_prep.  At the moment, set_pgidle prep action is
> supported.  Maybe we could add a new prep action, say, split_pmd?  Then, the
> following sampling memory access check probe (would be a kind of "allow
> pidle_unset" probe filter) will be able to show the access on exactly the pte
> accessed bit, not the pmd accessed bit.
>
> Breaking pmd would cause the overhead, but it would be capped by the
> max_nr_regions.  So the user could at least consider about the tradeoff.  I
> think this is simpler and more intuitive than DAMOS-based pmd breaking, at
> least.

This placement makes sense to us.  A split_pmd preparation for access sampling
is clearer than exposing PMD breaking as a DAMOS action.  We understand it as
refining the mapping used for observation, without splitting the underlying
huge folio, and then letting the following probe observe PTE accessed bits.

We will follow this idea and validate it.  In particular, we will measure the
active-memory result and mapping cost, check whether max_nr_regions also bounds
the cumulative number of mappings that remain PTE-mapped over time, and verify
whether splitting the host process PMD is sufficient in the QEMU case or KVM's
large secondary mapping remains the limiting layer.  We will compare it with
the perf-event path, stat-only first, without proposing a user-visible DAMOS
split action or physical folio split.

Please rest assured that we see this as a long-term technical discussion and
collaboration, not an attempt to rush one mechanism into the tree.  We will
continue sharing both positive and negative results.  I also plan to present
the scenario, evidence and tradeoffs in more detail at LPC.  Please feel free
to share any concerns or ideas at any time; we are happy to keep iterating on
them together.

This topic has now become broader than Ravi's hardware-sampled report series.
If you think it would keep the discussions clearer, I can start a separate
thread focused on huge-page observation and the damon_prep approach, while
keeping perf-event implementation and testing comments on Ravi's thread.

Please let me know whether this clarifies the intended use and whether our
reading of the split_pmd damon_prep proposal matches what you had in mind.

Thanks,
Lian
