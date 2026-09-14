Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 600D53BB672
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 19:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789415464; cv=none; b=i8Y52EU6b/Is43MlMIX6i2qWBO0v8iGgOS1bHQ3UqkNY4Aq67vnJAac3HYj784XkMf7HGHoM5cqGM3YsTipyGxSL9GZFAbNhbXuwQNFteNnV0WGhCpq8h/5aq+nP2mljd2xW/zdJhfEDogDyA5mHm0IefHVuuljvkTfhXGoF/lQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789415464; c=relaxed/simple;
	bh=irt0qFCPBSpaYcnTIGEq6LV7PgztY0KytY+RYyzwmU8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TsXE5e88O+S4P8z27myxCSPgLjarAPltdn/82hIbMpJFc2XenMd1YbsGv+9+xkEZszLrRNN3ChWvFHQGU4WmbR1zfQ7JYPTo4NYHlpRWzL8A9zndO32e3K+EmV7fXX22e2gqqagmoLBIZOgfJWMBGkUYpGiQqNhpkkWBuU/1Xuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j9sjO+i/; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j9sjO+i/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789415463; x=1820951463;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=irt0qFCPBSpaYcnTIGEq6LV7PgztY0KytY+RYyzwmU8=;
  b=j9sjO+i/ZTKPoCocEhU9pDc4vf19+3BOcm6WwFZ+wW8WQs4ssTS1/2JJ
   1Pckb/oe4v7cUMGOqRetmXd4aYkg35I5yPFAmozzOVLJbnzOohEEMT4z5
   CzLlTbMI3bZBiokL7MkpYwg68RaeViUoW6sj7sD1IZn+zVKpeBBnsMOe0
   tiJSm+KRqJqdjSaKq+Ia5E9d5pWgepppIGeA1+OwRFEPovEaBPqT3V9zg
   bM9rW4+8wl4+tJecvTktz3RD0IkIuOLQ6+OJrzTXz+h/G1seMuPNwOikf
   P7p+ONSkj5GOARDyzqEIQBp77opkAMDN02Z2c3qvuyEBPKjafiD+aX9u7
   w==;
X-CSE-ConnectionGUID: At7kMs4QSjumLi/4gtYvfA==
X-CSE-MsgGUID: pjgquxKmSumvV/mK2RojlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="115309843"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="115309843"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 12:51:01 -0700
X-CSE-ConnectionGUID: 1W+PFGqZQJmS6p5ByrzHjQ==
X-CSE-MsgGUID: U9l2BGAvRW69MVfpbu9Q2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="955091"
Received: from unknown (HELO [10.241.243.185]) ([10.241.243.185])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 12:51:01 -0700
Message-ID: <670e5ffe0964f075ed96e2104d3b25bb4ece5143.camel@linux.intel.com>
Subject: Re: [PATCH] sched/fair: avoid creating misfits during cache-aware
 balancing
From: Tim Chen <tim.c.chen@linux.intel.com>
To: KobaK <kobak@nvidia.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, K
 Prateek Nayak <kprateek.nayak@amd.com>, Vincent Guittot
 <vincent.guittot@linaro.org>, Chen Yu	 <yu.c.chen@intel.com>, Ricardo Neri
 <ricardo.neri@intel.com>, Len Brown	 <len.brown@intel.com>, Aubrey Li
 <aubrey.li@intel.com>, 	linux-kernel@vger.kernel.org, Ricardo Neri	
 <ricardo.neri-calderon@linux.intel.com>
Date: Mon, 14 Sep 2026 12:51:00 -0700
In-Reply-To: <20260914025949.1348528-1-kobak@nvidia.com>
References: <20260825174112.2580942-1-tim.c.chen@linux.intel.com>
	 <20260914025949.1348528-1-kobak@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.1 (3.58.1-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2026-09-14 at 10:59 +0800, KobaK wrote:
> Hi Tim,
>=20
> Thanks for the cache-aware load-balancing misfit patch. The tradeoff
> you describe (LLC locality vs capacity loss) is clear.
>=20
> I have been trying to understand how this showed up in testing. The
> cover explains the failure mode, but I did not find a note on the
> observation method.
>=20
> Would you mind sharing how you tested and observed it? In particular:
> which hybrid generation, what workload, and whether you used
> schedstat lb_imbalance_misfit or another signal.
>=20
> Thanks,
> Koba

Kobak,

My colleague Ricardo was doing tests on the Nova Lake CPU which has
LP-E cores on one LLC domain and the E-cores/P-cores on
other LLC domain. He pinned a process with
threads on the LP-E cores and then unpin it.

His expectation was that the process should move to
the more capable cores but that did
not happen because cache aware scheduling took precedent.
So the patch was meant to fix this behavior.
This can be seen easily with mpstat.

Cc Ricardo here and he can provide more details if you
are interested.

Tim

