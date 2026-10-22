Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792711068;
	b=UB2tY+rhCqthPg2K/P4qCuuzbHdw2Q2cesSaILYp6/I9cq0aPYjz1WJ9wWlYLbK3XdR2
	 ehtHLYNvr4lO1UOUPxAek3GfKVhOVEN+eSHGzdMps7G5BtRdFXFwIPGvJ1YGiasOjuAOS
	 tvl4F8qP3iiqaUOE3N68jXo+1rXFniLky/2s89YnEMtBnRjiIUEWROlNnJLcDhjkMdMn9
	 sqxtqJPPGco4gkYCr1SBl5wEPROz78gANxXqQ5fa3DPNF9UwHCWD8CLsALCtzy9w2DPFo
	 EcHb/kUuIVgq69PjXcJ247KX7jrtvLajwuvX22efSXiCsFHr0kUXfV0PozAGElexkYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792711068;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=kfBz61fRoC7Z3igoEcq37wqZzMC4s5u9se9kNfpr59s=;
	b=hsjyaMwCrPUtc4f2gicxBhqCDgxYqP1O+7WyLsefmL1lkX8BX77eJZ1SqpF8IGfytFG2
	 9aFhfHiLTas3sEpV1oKANAyX8zR1/5gqNACtdxutD9MkKlI93Za7SVFErbsH83tHoRmJB
	 fQa8J8GFaVnvXThmpENrdjzeVLJKUcdTvrppFjc23jI6UQbmNb6V9oCWhEuAbjjuwYjNd
	 98rCXgGiKR8Cb8enfdASOblC1AJyRTjPaAYc0XXuMo9ZRlMyQG17bKqpxS/yyzzNapkal
	 oNuPMbPTtDr5QUDKqeX28CAv3kAQr1XxPIbQouHKQE2khVuaD9XcXR3EpfCGhrbaDQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jF43IVuv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD0A606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 23:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jF43IVuv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 049CB1F01825;
	Thu, 22 Oct 2026 23:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792711067;
	bh=kfBz61fRoC7Z3igoEcq37wqZzMC4s5u9se9kNfpr59s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jF43IVuv3l2UaN3yECjR5/T1XZRVtCqftTMnOpa+ZAbEThBgi1h0boIRWF8iz+4gC
	 2BLgIy6rmgUgpsu2nN+7Ctja4dG88mb6mVEVRiaKNEutxChrByYB8FMb5ac9WmUgS1
	 JmhbfSwKTBoZJ8iZIWfh2QMsRluYA55yD5htKA2p5qHQF3VJ4UyezzgIQXZ58GNHYe
	 FSurGAzW03U5QcIdZiYOm9K3YhwgVwVUF4HQS86S9dTDlStpP/FQnof5fWRz8BmAbs
	 jEuqfzyT9k5m/FUBYfxdYEqHLM6xLOKnmiYXTAJ2sk5fHGuwqvItRbPl+WjsMzwDzO
	 1h8I3vU0EwQ0A==
Date: Thu, 22 Oct 2026 17:17:45 -0600
From: Keith Busch <kbusch@kernel.org>
To: Erwan Velu <erwanaliasr1@gmail.com>
Cc: Erwan Velu <e.velu@criteo.com>, linux-nvme@lists.infradead.org,
	axboe@kernel.dk, hch@lst.de, sagi@grimberg.me,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] nvme: honor the volatile write cache enable state
Message-ID: <atqZmctbU0siYmVX@kbusch-mbp>
References: <20261016141208.2641974-1-e.velu@criteo.com>
 <atJXYHJa4jkUWJmP@kbusch-mbp>
 <CAL2Jzuz1qFwLSA=iivp5qLCTL6-4rvKmvFzJbOQzjPu6j_7Y2A@mail.gmail.com>
 <atJeazM_rJ0uj3vt@kbusch-mbp>
 <CAL2Jzux8v6zCxfcdd=MY5n0zQMVSa-_8Lki9z-fz7bFShNf7vw@mail.gmail.com>
 <atJk_2FmzjUZYO_Z@kbusch-mbp>
 <f665dc3e-fc5c-4352-8e41-a46b7ae97946@criteo.com>
 <CAL2JzuwuZp0gg1D7wSn7cdgpnhotnuLP6YpPd-SrdVyqhkeiJw@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL2JzuwuZp0gg1D7wSn7cdgpnhotnuLP6YpPd-SrdVyqhkeiJw@mail.gmail.com>

On Thu, Oct 22, 2026 at 03:27:50PM +0200, Erwan Velu wrote:
> Le sam. 17 oct. 2026 à 06:25, Erwan Velu <e.velu@criteo.com> a écrit :
> >
> > [...]
> > > Unfortunately, no: there are contradicting statements here.
> [...]
> > If you think it makes the commit message clearer, I can send a v2 with
> > these numbers, the kernel anitly, and the driver level Flush latency above.
> 
> Hey Keith,
> WDYT of these explanations and additional details?
> Hope that's better and could be considered for inclusion in the next
> releases, maybe as a backport to the stable ones as incorrect
> detection of the volatile's cache status can lead to severe
> performance impact on this type of drive.

I just wanted to see if there was any difference in the controller's
Flush behavior when the volatile cache was enabled vs disabled, and this
looks like it's the same either way. The Flush should have been a no-op
to the device with WCE cleared, so something seems off here.

I'm wondering if the device is actually really respecting WCE set to 0
now. That might be tricky to prove, but it wouldn't be the first time a
device lied  about durability. Not saying that's happening here, but the
behavior you're reporting is suspicious: 15usec writes are not
physically possible with TLC NAND (your model says BiCS TLC) without a
cache, and your controller says your cache is volatile.

Anyway, the principle of what you're proposing looks fine to me from a
spec standpoint. I'll get this queued up if I don't see any other review
feedback or concerns that it's going to corrupt something...
