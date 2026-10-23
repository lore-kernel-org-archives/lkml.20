Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792778315;
	b=ZgJiYDg/Hh7Bmi9L3KEoBKnkJZvkbOyxYnUcMHoIrS+YtEBBwjC3V1LdngMTG6yuUGkQ
	 16xJhtBYaDz/sqa9o1R8nQrhXPKGPL/i7howK/eQFQt4JFWy/x+66j/ihQejx8Jc8YU0y
	 ZYRUiTIIEx8bvtp84faxJr7V5H/RkG//8y7fj06gGtCsj+FJkiVJxDWXj6dTptNaLBiEe
	 iJd0swucedHWtg/a8OIa0FjAqPZR/nyNbIquJWnp1BOUNnLoGDA0RLYGDEGqLS7CtXNhV
	 H65KXt5XDEzXR2CABhK54VipC1KZhARSD2pQBeGYxkqpWODBf0cA987HgC7/H/xaPeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792778315;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Subject:
	 From:To:Cc:Date:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=1Dyo+5P9jqyyV0erlVw7mVKkjTRbY/LB2EHolQl7fOM=;
	b=mCarrp1/xvyX8HA5qDrRSxGoOyO8cSandlK9LTSBTK/9HrllvHd7PAfwF56dUP+jgghm
	 ENlliCszTIUX2kCjpBg/oUsFUq1tO5ypVDUiQT20wi0JpGBP52BkvYfvNWilzupDRDx/H
	 iTvZ1tPW/TaAUIwNdHj69rTfPEWHyVHsgsUUBoudPK3Wr4ca1LviQErDLelFPaZuotS1U
	 1cqBgQ5AVXjXufLvpK4H+pIcYwA2sUK9ZLcPoB9UKg5XceDmX59lNZQhFpGH+uqU+iZ0E
	 nduyyaKKA1W1DBDdtKQcUbrUJ3aFKRi2ct5p25NNRlVFYJgaYUJAszRf3K969bTv8yA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CghmvfDI;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29EF0606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:58:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29EF0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CghmvfDI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792778315; x=1824314315;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=3ZrsNEX2uX6PaXIi7xcmX121TOH6INDYHDj9zh11wrA=;
  b=CghmvfDISpYx7cTUq8WwzLdTcTu6UIiDSPLp8K3niTnDVZmUYRthv3J3
   vkEknsXVFFxht8qDGzBt3bAI8JuUUSoqZPAYEnVltPEsTvWVZbL9Ehxyf
   +cOt+WeZP3ZyJc6AVjLxJiYOCjaqqLkKK8OpBnEOktlaJsoSX/b4BG28/
   zAuQzoACQ2hqeQPPMMulZed7+Ud1F8yEm/Rz1GZx9edmC+djMJDf3G0Za
   R9CojkTe3NxydVoaNZ4SieaVAn66XukuP1Ou4FkYPuOuc3X9ExVgoGMiK
   D8ckKZaGPD63T4Gsn3dqagSRswCwzA4BtdZnCnguantJ0WeiCd58uj+xC
   Q==;
X-CSE-ConnectionGUID: NfwUlntGTAm0N3DDxk26NA==
X-CSE-MsgGUID: ty+lUcCEQH65niydkxY7rA==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1571365"
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="1571365"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 10:58:34 -0700
X-CSE-ConnectionGUID: RWnG4AmLRcmQZ90DhOOfQw==
X-CSE-MsgGUID: 3hMl4LsxSsCknPcPjIg2mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="3700573"
Received: from schen9-mobl4.amr.corp.intel.com (HELO [10.125.108.32]) ([10.125.108.32])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 10:58:17 -0700
Message-ID: <4a71f654cdc03973f309754a2f61810b4547a471.camel@linux.intel.com>
Subject: Re: [PATCH v2 0/4] powerpc/topology: Introduce llc_override kernel
 parameter
From: Tim Chen <tim.c.chen@linux.intel.com>
To: Shrikanth Hegde <sshegde@linux.ibm.com>, maddy@linux.ibm.com, 
	linuxppc-dev@lists.ozlabs.org, peterz@infradead.org
Cc: christophe.leroy@csgroup.eu, linux-kernel@vger.kernel.org, 
	ritesh.list@gmail.com, kprateek.nayak@amd.com, yu.c.chen@intel.com, 
	vineethr@linux.ibm.com, vincent.guittot@linaro.org, srikar@linux.ibm.com, 
	npiggin@gmail.com, mpe@ellerman.id.au
Date: Fri, 23 Oct 2026 10:58:16 -0700
In-Reply-To: <20261023131646.2907938-1-sshegde@linux.ibm.com>
References: <20261023131646.2907938-1-sshegde@linux.ibm.com>
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

On Fri, 2026-10-23 at 18:46 +0530, Shrikanth Hegde wrote:
> Provide an option for users to enable cache aware scheduling on powerpc
> via a command line parameter.
>=20
> More details of the problem and context is in cover-letter of v1.
> v1: https://lore.kernel.org/all/20261012102037.2477378-1-sshegde@linux.ib=
m.com/
>=20
> v1->v2:
> - Move to kernel parameters from debugfs. This helps to keep
>   llc_id consistent which doesn't change across sched domain
>   rebuilds. (Tim Chen)
> - Update arch_llc_mask to reflect the override (Tim Chen)
> - Limit only to mc, pkg (Srikar Dronamraju)
>=20
> Notes:
>=20
> - A selftest for the functional validation of cache aware scheduling
>   is a good idea as we discussed in v1. It is a significant change on
>   its own and likely takes time. I am thinking it might be good idea to
>   revisit selftests for scheduler in general. (We have very few).
>   Maybe worth a discussion in coming OSPM.=20
>=20
> - I am on parental leave. This version is pretty much what I had last wee=
k
>   and I haven't gotten any chance to update since. just sending it out.
>   Sorry if I have missed to address any comments.
>   Please expect delays in my response.

Thanks for sending this while on leave, and congratulations!

The updated approach with boot parameters looks good to me.
Some minor points:

1. llc_bytes. As Chen Yu noted, get_effective_llc_bytes() returns 0
   on powerpc because the generic cacheinfo is not populated. With
   NUMA balancing on and the default llc_aggr_tolerance, any process
   with a footprint then fails exceed_llc_capacity(), so cache aware
   scheduling still does not engage.=20

2. Bisection. Patch 2 moves SD_SHARE_LLC to MC/PKG, but
   arch_llc_mask() only follows in patch 3, so a kernel at patch 2
   booted with llc_override=3Dmc has sd_llc at MC with per-L2 llc ids,
   causing mismatch. It may be better to squash 2 and 3.

3. llc_override is only written at boot. Making it
  =20
        static int llc_override __ro_after_init;

   and then you don't have to worry about READ_ONCE and WRITE_ONCE
   to it as Chen Yu pointed out.

Tim

>=20
> Shrikanth Hegde (4):
>   powerpc/topology: Introduce llc_override kernel parameter
>   powerpc/topology: Update mc/pkg flags based on llc_override
>   powerpc/topology: update arch_llc_mask based llc_override
>   Documentation/powerpc: Add details about llc_override
>=20
>  .../admin-guide/kernel-parameters.txt         | 15 ++++
>  arch/powerpc/include/asm/topology.h           |  8 +--
>  arch/powerpc/kernel/smp.c                     | 69 +++++++++++++++++--
>  3 files changed, 81 insertions(+), 11 deletions(-)
