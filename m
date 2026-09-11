Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C53366816
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789139267; cv=none; b=Zn88h6/1StRJEg9UkqAFIH4v3LYZ5l/l+Xbz/gPJUufWMb0Zmk3i0aFFDYiAHiMZv1v+dHqpT17auQBfUxA4lddce+9BZo8USxW8ry/7xpM5++Ac1KXWmTpGHPqugISniN4L+NQlLMmGnTWYgUuGuTJot/pLnr43TcngZCw++6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789139267; c=relaxed/simple;
	bh=qHl4fIB+ROOU9Q+kP9t0rq1nguMV/c73PCnl9CjNhuw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qJQLqnPKryxChKpFF/3pxt10lY9PsvLLL7lhZdg2PK7biHyT6FQibEtwpOPnpMkg18z7tDTPFOSp/XJplSFOx0UcPmrmuWs/up3Ok8Kfka/3TwwnKji0vT8R8YRmhFzAswDupGFdmsFf8ifql+ZD0gwHI5kz3FdJbWX2PN0WKUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ei/sFMGK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ei/sFMGK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8BC81F000FF;
	Fri, 11 Sep 2026 15:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789139266;
	bh=kN5VDR9z03jd/obUeKnZsdviPLlwfqOhB0m2w3WOXPY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ei/sFMGKPP0Cqs0z+JFHPh/FDL7fYY6AgSPostXr7NEyO4ZOhoO4m9OhP2+4HUXHb
	 SnXtQOIa/eiFVCZ27chz5KV/etqOnVZESz4BkzG6FIVSy4mJVqRj0yVwVVV1NggGDq
	 OskdxKMBshv4Jqc5Vzj4r999BJDN0j9JMAQDmvQ0/C0AqX0TQIRS+mar/eH724ZEqu
	 IuM75HyM9Z5VuVPiJvzBxUpgAMmw32j2s/eLVDkSHN3cvYhtY9ij8QoYJdifWL+MR2
	 7ohe8XwpIbaPSmSc1uGsKkkoCZ8+MHJodiVdvPpAN8c0OO7GrjEzCM8eW01fbrozMx
	 osBIabDrqZ+NQ==
Date: Fri, 11 Sep 2026 09:07:44 -0600
From: Keith Busch <kbusch@kernel.org>
To: Andrew Stellman <astellman@stellman-greene.com>
Cc: Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>, linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] nvmet: derive the CRTO property from CAP, not CSTS
Message-ID: <aqQZQPs7KzBUVbgw@kbusch-mbp>
References: <20260910180056.81257-1-astellman@stellman-greene.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910180056.81257-1-astellman@stellman-greene.com>

On Thu, Sep 10, 2026 at 02:00:56PM -0400, Andrew Stellman wrote:
> nvmet_execute_prop_get() answers a Property Get of CRTO with
> NVME_CAP_TIMEOUT(ctrl->csts).  NVME_CAP_TIMEOUT() extracts bits 31:24,
> which is the TO field of CAP.  CSTS defines only bits 6:0 and nvmet
> writes only RDY, CFS and SHST into it, so the result is always 0.  The
> same controller sets CAP.TO to 15 in nvmet_init_cap().
> 
> NVMe Base Specification 2.4, Figure 36 (CAP), says that when CC.CRIME
> is '0' the TO field "shall be set to: a) the value in the Controller
> Ready With Media Timeout (CRTO.CRWMT) field; or b) FFh if the value in
> the CRTO.CRWMT field is greater than FFh."  nvmet reports 15 in CAP.TO
> and 0 in CRTO.CRWMT.
> 
> Take the value from ctrl->cap, where the timeout is actually stored.
> 
> The Linux host reads CRTO only when CAP.CRMS.CRWMS is set, which nvmet
> does not advertise, so Linux initiators have not seen the wrong value.
> A host that reads the property directly does, for example nvme-cli's
> get-property.  Advertising CRWMS is a separate change.
> 
> Tested on 7.3.0-rc1-qpb-cc-crto-base+ (unpatched) and
> 7.3.0-rc1-qpb-cc-crto+ (patched) in an arm64 QEMU guest with nvmet over
> NVMe/TCP to 127.0.0.1, reading the properties with nvme get-property.
> Before: CAP reads 0x8200f0003ff (TO = 15) and CRTO reads 0.  After: CAP
> is unchanged and CRTO reads 0xf, so CRWMT = 15 = CAP.TO.
> 
> The issue was found by Claude Opus 5 running Quality Playbook, an
> LLM-driven code review tool:
> https://github.com/andrewstellman/quality-playbook

This is a very long explanation for a simple protocol fix. Just say
something like "The NVME_CAP_TIMEOUT requires the value from the CAP
register, not CSTS." Short and to the point.
