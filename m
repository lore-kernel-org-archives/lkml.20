Received: from pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.34.181.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B49368D66
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 07:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.34.181.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788420427; cv=none; b=Gdj1zhO83j/KjBeTNVgqkRztKWLtvjkxjmrjIytoT1J/VOPQNmUSFowjm0K1qaaQ5Nm3cprGMaWtTdyfB0JfS9H2gcSeOw7+TBAPdc0JFPUg0YRjjX0CBu3kMwd3W1Usz9GoLuROuJEzi9EHpeo0PFYx61sYy+w8qtpuFe49SSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788420427; c=relaxed/simple;
	bh=doWxkimnv0Ia9QFCILMLar83Tp+48Cy6j9Se48pZvhk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b2rX+auUbG4B3S3vYuwXJ5ykzNsLJNwXfYzlarqztMTlSfBPZgBnsXI3DL4BkRIipvQBJymEq8G1IsG81+7OHcHnxmwmYOA0Dp4xLTb62wApEdUNDWIQ21lcpE6HIBBPfyzH2m26ijT8kPvFN5yyvzylpxUPspJFnBTMpcrZ6wE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.co.uk; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=US63Mu34; arc=none smtp.client-ip=52.34.181.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="US63Mu34"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1788420426; x=1819956426;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XEDL0hSWB2zeGwWJtgzgRDFbNtGe7V0habGCOAlNjWw=;
  b=US63Mu34d/pYaaXm5d4LvYH9Q4zv7PIs2FPLB7rFPchDySWa1ZFnb/Kc
   jkHOxcecojJPDm267P6tsE7vBeRQMcO8y4FGoOpMls1kBnH9syWS9cCZ8
   a3xTmJL4EFLDQe/cVPrAa4uyjII4LoK97VXJga1JVsGytnIanEBq83k+H
   HoVw8Lq5iqyo62dCtQGip1aDNAHLgKNYMFhBS3FeYUQ0KBwlwjxg3kWBN
   eb47IQ6b8Tlrp+yYxAkAeS+mycxMJId2akbR1MXT8FupVyFc+YkOPDdic
   6pZAwdnojlqc9hbIfE4Q0TTnP//59FxJs9E3HBAfCaLZIsu6bNp43gNq+
   Q==;
X-CSE-ConnectionGUID: a9V3tmWSSHWMehpCtylDug==
X-CSE-MsgGUID: zLigg53MQCWK0KP82k5/Pg==
X-IronPort-AV: E=Sophos;i="6.25,258,1779148800"; 
   d="scan'208";a="27681160"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 07:27:04 +0000
Received: from EX19MTAUWA001.ant.amazon.com [205.251.233.236:14068]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.23.85:2525] with esmtp (Farcaster)
 id 31c43739-7d7e-4b18-a143-798b81c75300; Thu, 3 Sep 2026 07:27:03 +0000 (UTC)
X-Farcaster-Flow-ID: 31c43739-7d7e-4b18-a143-798b81c75300
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.218) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.45;
 Thu, 3 Sep 2026 07:27:03 +0000
Received: from b0f1d8753182.ant.amazon.com (10.106.83.23) by
 EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.46;
 Thu, 3 Sep 2026 07:26:57 +0000
From: Takahiro Itazuri <itazur@amazon.com>
To: Yosry Ahmed <yosry@kernel.org>, Sean Christopherson <seanjc@google.com>,
	Brendan Jackman <brendan.jackman@linux.dev>
CC: Brendan Jackman <jackmanb@google.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, Peter Zijlstra
	<peterz@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, "David
 Hildenbrand" <david@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, "Mike
 Rapoport" <rppt@kernel.org>, Wei Xu <weixugc@google.com>, Johannes Weiner
	<hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, Lorenzo Stoakes
	<ljs@kernel.org>, <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
	<x86@kernel.org>, Sumit Garg <sumit.garg@oss.qualcomm.com>, Will Deacon
	<will@kernel.org>, <rientjes@google.com>, Roy Patrick
	<patrick.roy@linux.dev>, Andy Lutomirski <luto@kernel.org>, David Kaplan
	<david.kaplan@amd.com>, Thomas Gleixner <tglx@kernel.org>, Patrick Bellasi
	<derkling@google.com>, Reiji Watanabe <reijiw@google.com>, Nikita Kalyazin
	<nikita.kalyazin@linux.dev>, Ackerley Tng <ackerleytng@google.com>, "Takahiro
 Itazuri" <zulinx86@gmail.com>, <cc-open-source@amazon.com>
Subject: Re: [PATCH v3 03/26] mm: introduce AS_NO_DIRECT_MAP
Date: Thu, 3 Sep 2026 08:26:26 +0100
Message-ID: <20260903072625.62694-2-itazur@amazon.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <CAO9r8zNJ3mSRf5YyRQYYW-eM2eiFvQMXW4Rh0cT=31jsKZpuSQ@mail.gmail.com>
References: <CAO9r8zNJ3mSRf5YyRQYYW-eM2eiFvQMXW4Rh0cT=31jsKZpuSQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: EX19D032UWB004.ant.amazon.com (10.13.139.136) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

Some of you on the KVM side already know this, but for those on the MM
side who may not, I am taking over the guest_memfd direct-map removal
series.  I have finally caught up with this thread, and I sincerely
apologize for joining so late; other commitments kept me from catching
up sooner.

On Fri, 7 Aug 2026 15:48:24 -0700, Yosry Ahmed <yosry@kernel.org> wrote:
> > I'm not ok punting on that, i.e. whatever we come up with needs to land=
 alongside
> > AS_NO_DIRECT_MAP, or at least before guest_memfd tries to use AS_NO_DIR=
ECT_MAP.
>
> Yup, I meant the latter.
>
> > The only way KVM can use AS_NO_DIRECT_MAP without GUP is with a massive=
 list of
> > caveats and addendums on things the VMM and guest can't do.  I'm not ok=
 merging
> > guest_memfd support for AS_NO_DIRECT_MAP with such a list.
>
> This series is not adding the support in guest_memfd, just adding the
> generic AS_NO_DIRECT_MAP and using it for secretmem. Followup work is
> needed to plumb it for guest_memfd anyway, and I am proposing that we
> also punt the GUP story to that (when we have an actual user).

My reading of the discussion is that the generic AS_NO_DIRECT_MAP support
can land with GUP rejecting such mappings, provided that a generic GUP-like
access mechanism is in place before guest_memfd starts using
AS_NO_DIRECT_MAP.

As far as I know, Brendan is no longer at Google.  I do not know whether
he plans to continue the ALLOC_UNMAPPED / mermap work, or whether someone
else at Google has taken it over.  If that work is not already underway,
I would like to respin the AS_NO_DIRECT_MAP introduction and secretmem
adoption as a standalone MM series, separate from ALLOC_UNMAPPED and
mermap.  The AS_NO_DIRECT_MAP changes originated in the guest_memfd
direct-map removal series, and splitting the MM and KVM parts was already
requested during review.

The proposed MM series would include:

  - the folio direct-map helpers;
  - the AS_NO_DIRECT_MAP flag and filemap lifecycle;
  - the current GUP and build-ID rejections, while keeping the mlock
    check specific to secretmem; and
  - the secretmem conversion.

I would leave ALLOC_UNMAPPED, freetypes, mermap, the allocator fast path,
and the KVM / guest_memfd integration out of that series.  This would not
change the requirement discussed by Sean and Yosry above: the GUP-like
access problem would still need to be resolved before enabling
AS_NO_DIRECT_MAP for guest_memfd.

Please let me know if this work is already being continued; if not, does
the standalone MM series described above sound reasonable?

Thanks,
Takahiro
