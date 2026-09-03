Received: from pdx-out-008.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-008.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.42.203.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787044B53F1
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 14:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.42.203.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788445564; cv=none; b=cvW8Gg/lKuFtzddvMjYvgl97xArXsjMIgWnlh9gCSHIBQBAZI0BWnC4zbJGrg2LZQ34+djcLZeLvR2ImTg3LzNUxQzYZJSEjATL2VBPNLJapYhfnxom9iMhCbke6v1sNccIrwO9Ne60UhEbUIFRBU/Tt4UdflryDyR15UMezG6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788445564; c=relaxed/simple;
	bh=6eMMxN4253jmYyW8/yZiXUi1dvjY1m86L11q+LiDRRo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ba0vZPv0qJhISKFHMHRXkRgQpsy4C03hUmuxvAwdSHqKwGs6gqSzuvUrM6T07Iq30f7qJoaABQB32+DIL8bTDrL0UfWX47YY/20W7jAC9vQHTgVa5WDRovlw2Y2QZECEr2Bxva0NfHJO+sckp5sIE0dXybWhrij2w7JbKhogbSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.co.uk; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=ICtgOfXe; arc=none smtp.client-ip=52.42.203.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="ICtgOfXe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1788445556; x=1819981556;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6eMMxN4253jmYyW8/yZiXUi1dvjY1m86L11q+LiDRRo=;
  b=ICtgOfXezHIJ7LFeudNMny2V5s21R0MlX17BjoupyjOz0Akf13LQw/Cn
   mxAOmmo7js1B8IDCJ9ttvPQ/poXkNKPKQcKW7an3SMUERoVyS1OErB4Jd
   AaHuFwXOCAjpLXTHpi1jNh9amHc5qEOTtqmxOjv3gRZUqfRd7fFvPl+XQ
   hjU/dMhAs3d3w260bfwfRX0uvtjWEaIgiIWjKMwgp6s75CIAH7WMzgtoK
   1UdkYerQDJqK2H47TNszdtYefDBNQgMk4gZCKv6V/gFoZQK9nD3uDNO2m
   EvLXbcQf6SPtdx3VGiDJNZwrn3awXLhBAfZ3uSQdCyZNQEqpoxNRxVNos
   w==;
X-CSE-ConnectionGUID: 4VTVDDtfTNOIGEJOl9hYlQ==
X-CSE-MsgGUID: QucrdA79S6KqegrJUpnJ2A==
X-IronPort-AV: E=Sophos;i="6.25,260,1779148800"; 
   d="scan'208";a="27759244"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-008.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 14:25:50 +0000
Received: from EX19MTAUWC002.ant.amazon.com [205.251.233.51:12884]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.52.134:2525] with esmtp (Farcaster)
 id 7b7cb4ee-0ded-43ad-a581-5ab47fc893db; Thu, 3 Sep 2026 14:25:50 +0000 (UTC)
X-Farcaster-Flow-ID: 7b7cb4ee-0ded-43ad-a581-5ab47fc893db
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.45;
 Thu, 3 Sep 2026 14:25:49 +0000
Received: from b0f1d8753182.ant.amazon.com (10.106.82.11) by
 EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.46;
 Thu, 3 Sep 2026 14:25:44 +0000
From: Takahiro Itazuri <itazur@amazon.com>
To: Yosry Ahmed <yosry@kernel.org>
CC: Sean Christopherson <seanjc@google.com>, Brendan Jackman
	<brendan.jackman@linux.dev>, Borislav Petkov <bp@alien8.de>, Dave Hansen
	<dave.hansen@linux.intel.com>, Peter Zijlstra <peterz@infradead.org>, "Andrew
 Morton" <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, Wei Xu
	<weixugc@google.com>, Johannes Weiner <hannes@cmpxchg.org>, Zi Yan
	<ziy@nvidia.com>, Lorenzo Stoakes <ljs@kernel.org>, <linux-mm@kvack.org>,
	<linux-kernel@vger.kernel.org>, <x86@kernel.org>, Sumit Garg
	<sumit.garg@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
	<rientjes@google.com>, Roy Patrick <patrick.roy@linux.dev>, Andy Lutomirski
	<luto@kernel.org>, David Kaplan <david.kaplan@amd.com>, Thomas Gleixner
	<tglx@kernel.org>, Patrick Bellasi <derkling@google.com>, Reiji Watanabe
	<reijiw@google.com>, Nikita Kalyazin <nikita.kalyazin@linux.dev>, "Ackerley
 Tng" <ackerleytng@google.com>, Takahiro Itazuri <zulinx86@gmail.com>,
	<cc-open-source@amazon.com>
Subject: Re: [PATCH v3 03/26] mm: introduce AS_NO_DIRECT_MAP
Date: Thu, 3 Sep 2026 15:25:30 +0100
Message-ID: <20260903142529.19709-2-itazur@amazon.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <CAO9r8zMxdg2BTFguwcRQn8n-2CPaEJJfg+T8dWcgO2eV4uNaHQ@mail.gmail.com>
References: <CAO9r8zMxdg2BTFguwcRQn8n-2CPaEJJfg+T8dWcgO2eV4uNaHQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: EX19D032UWA004.ant.amazon.com (10.13.139.56) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

On Thu, 3 Sep 2026 07:06:02 -0700, Yosry Ahmed <yosry@kernel.org> wrote:
> I am currently working on a new version of the ALLOC_UNMAPPED series,
> I am hoping to send something out soon.

Thanks for letting me know!

> Perhaps wait until I send the new version, then we can discuss if we
> want to split it based on how the feedback looks like. Does this work
> for you?

Yes, that works for me. Thank you for moving this forward!
