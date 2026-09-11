Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F289C4A99CC
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 18:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789150062; cv=none; b=Y744BMFYv2vSNO/8ovBELsBQhqHnF+hm2Un7Hch74GG8P+gT/P3+1cTC99DOaQVapa6ogKm5OYnf0pQQjqhu8VKxibkA1qy0OcHLUtPnH5VrNH6xkP/pvXokwysy6zDrtIFn7B5NWjG/qYivKiZdrGyl0Kcgg3Z3abz/HicyqXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789150062; c=relaxed/simple;
	bh=/K5I1l+PxMb6ZvkU3JIwQfwoQeRN3gokPRAeMBzhkhQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=GiBL6h8msMs9RwVtH6p4VNwNAOmU+y73vz+TzUmDFKIplzw3TYBKyCduUrFDEcGfOB5X2xuUfrnGmP4/FvCpXuqHmTvVRMNTDe2Gwfi3w3D4ael2spmayqWfGWdwxP/qKl3ymkEMl//i1aSUhZOk2O+gvLgTeyamS6Kzst6ORxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=okGWbp7g; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="okGWbp7g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD4D11F000FF;
	Fri, 11 Sep 2026 18:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789150054;
	bh=UChGTTKXear8gQd2Dj9H+VICAHM0s5K1F+6xOkJhwk8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=okGWbp7gf4AeBkG9/1Ay3g134R1cA7gjJeSJln7cqv1+wr822XQAFp7ViyNSs/fEy
	 z7zj8wp3HAgD3z32sFxFD8ENpA/QsUoDi9IeetJuRhIJjdJ1dPbP3c2BqKBLL6JFrv
	 ZR1uZdclFtaZwkCNcFg+RtgSjSwltBsGB3p4JNqI9cjQ/l2YggHMqpjWlrDdmgyHbE
	 f7YYyYyao8MceMxbecrRVMxzoBexwY7gsB6gWoUXbnbZXtWn7LMuheBUflTFoQHW71
	 PMQS9WRNx6sj5ZymzSoBsPVKT5HKAPP7qX+WVkBk4bs7s8JFJtHyuOf+fiTviwYY3a
	 H6b8m5iaN6e/w==
Date: Fri, 11 Sep 2026 12:07:31 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>
cc: Anup Patel <anup@brainfault.org>, LKML <linux-kernel@vger.kernel.org>, 
    linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
    Radu Rendec <radu@rendec.net>, Marc Zyngier <maz@kernel.org>, 
    Paul Walmsley <pjw@kernel.org>, samuel.holland@sifive.com
Subject: Re: Interrupt chip driver maintainence
In-Reply-To: <87ecf74c8r.ffs@fw13>
Message-ID: <295ecaaa-fca0-05c2-ddaf-ad3a2985776d@kernel.org>
References: <871pb9841j.ffs@fw13> <CAAhSdy1=Z-VjEhGsGOJ15QptCSZP_6zG1NF=B972KwzEJhFbFg@mail.gmail.com> <87ecf74c8r.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1429182635-1789150055=:1495113"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1429182635-1789150055=:1495113
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

+ Samuel

Hi Thomas,

Sorry for the delay; I've been on vacation this week.

On Sat, 5 Sep 2026, Thomas Gleixner wrote:

> On Sat, Sep 05 2026 at 16:37, Anup Patel wrote:
> > On Fri, Sep 4, 2026 at 8:19 PM Thomas Gleixner <tglx@kernel.org> wrote:
> >> I'm still going to pick up obvious and simple bug fixes, but for
> >> anything which requires deep knowledge on the underlying hardware, I'm
> >> going to just mark them obsolete when they molded in my inbox unreviewed
> >> by the people who understand it for six weeks.
>
[ ... ]
> 
> I don't know what's wrong with SiFive but they really need to get their
> act together. Paul?

The approach you described above is fine.  Please feel free to ignore 
anything beyond bug fixes that doesn't have an appropriate ack, at least 
until we figure out how to broaden the pool of maintainers for those 
drivers.

For what it's worth, several other companies also adopted SiFive PLIC-like 
interrupt controllers, and reuse those drivers.  It would be great if 
kernel folks from those other companies can step in and help maintain the 
underlying code.


thanks,

- Paul
--8323329-1429182635-1789150055=:1495113--
