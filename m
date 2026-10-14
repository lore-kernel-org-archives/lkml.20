Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561F647607D
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 09:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791969429; cv=none; b=oTx1fjlfwUi6uNVLd9PGWBb/y8y8TmO1yIhE27J8wsYlHIgu+XPjkqbBW4eHxYV4kUpL9bbraOes4L9yGSNAmsGq3R2EybZNaQkM6X58SIK+8/TdoCcPfCgd7f0mr+BO5PvpANaEQAkceXkjd1JiKC3izcM/n5sqnMKOx09gz5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791969429; c=relaxed/simple;
	bh=oKJsVFLubvLsj5D35e53rnVR+8UYd1QDrDrjPrGaDLY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I2riFwmE1SD1sdldBBBaQbvD7WXUFnulGteUp8iw+jmnQ1EH9ZqBXJEhjWCGA6kbkcNndnE4XLhKFU1wap9Sl+OAWQzVe55olRUL5/Xeqg0N/rQt7ZjX0r9mtJd61E3ZOPVrUElINOCxPwOswKKUBarEkzgWABbD4afbjUyuBPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YKOSo4IU; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YKOSo4IU"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49d0da752ffso6286735e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 02:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791969426; x=1792574226; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jo2PRIALCUq4kxjl1uc95AJMEIZIxh5cvF+ejGasI4Q=;
        b=YKOSo4IU5JgAX2Bqfd3CM96RMVR3XBacvjCZY3O1iXBqXvwJz4o/m02SbAJTrzIFYY
         FVmuJ91aaX2I16rVnwYWVQsy/hGL8f5M+90MPd9tz3bcjkL78tZXgqT5X/XkfMkZq4g3
         PdHVudlmq9DjMBYcoKbgx+e2pb7IMP5xmC6j2DKZurLGN3ieLieRPXLBw2UzsUBLSFvI
         aHJdKUOasw/33EiTK/CNqI3zzCV2mYMUOnbqpz2vkxbmIXXz0MkunFD/kdiQ6K3IHQdM
         zKz0bwv1dgTaYNCkWLp+mCii5blpfPDzWsAbigJACe+VMqILVr0aP2Pca3uhP6yU5AZK
         palA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791969426; x=1792574226;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jo2PRIALCUq4kxjl1uc95AJMEIZIxh5cvF+ejGasI4Q=;
        b=gn7S4Appw3FqOJVkfdfV768sK2pnqcTwAK/OFDSk2clJ2n1zhxo8uKAcj47psExRmW
         ZPjC9eMDYhhehQMEBVp8tbyMoTAGT5AEFsc1mUWplV1U86ouf2CMKuN/PSKx1PJC6QIK
         UBC197grp6cPa5hxMYb4FcsALjIYrMDHiw3qEIWV89OXDi5B9Rl+dC9K3UJVOzS6w8r5
         zXgkVRSiHvyF4qMsD+V7RiFcJCwYG584xdpL8Qeon/rp+tMQL9TEfoYjXveG3+ZxsYgZ
         F1OU2xUNMXiFoqGNjEzy2itYZ1La4dJmNSQtEYZ6oibJRSbc1ppBfnedQylwEvzrRgqe
         1W+Q==
X-Forwarded-Encrypted: i=1; AKwUvBwUhU2DsEE8Vh5KZoH3a9M7LOd2E31kDGDTucj5i2jUo9Go0/kk33JZhMjzHnrqpoGafFbvkceBWjnHjcs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKt8JuIh/s+5nrmlKdifzrFBqjT4ZcvmtLD9st7GD8maeJBE0kr
	MijpfpXvzz0m63ApkGkyeHTwAZqTiU3tmd8iiv6zomOtV2EAlohDuYkkjIMjkqVJ
X-Gm-Gg: AYBFou10H7kVkb5fKUaAHnvHhyWES0U7o4YhsbdQ/86MVpEVMJAQjWmsTeYjzenQGup
	5OhadmLuT9749jbCx5Y8pQNYr8Gg22AREvpI5ozIrzK1V6PINv8phQ44A3AemoWuxUgTcWVE01h
	lk4w9vY5oStHbCAunAGsOFZTvOlVlDMyJhE/XEalG3GeFEQEvIR3NXu2No5CDOlMSeSt/k9SRyI
	E/IikcBoBPrV8Z/uT0ih7FJv7CvlAGn/tyNNjdzsKCo1ZlG3xg3WBdAVavsq8P2FSk7VYpruVZQ
	ZAbco5nLKQv1SfvAHyz21ZUczB8GkK/mJVYK+p9HAM6soA0wzc0/MecY7PC8Hd4iZ7zSlLT4dde
	JBkKyxQzG0/Q0R4S1henst/URAuAPFD6wr0tZeams1ueebdYHhKhlyf6i1/aMYzUnuyZfsIqoPH
	5Kn6EP5mKuAy4gk8ou4LhLiR5oD4eQ2i22OOtuS9ZyX3M99kl5s2DtFjBj99+jnpClfDUkVcnqA
	OWePo75Rg==
X-Received: by 2002:a05:600c:8716:b0:4a1:62b8:9aa1 with SMTP id 5b1f17b1804b1-4a18e44885dmr310815675e9.2.1791969426406;
        Wed, 14 Oct 2026 02:17:06 -0700 (PDT)
Received: from foxbook (bez186.neoplus.adsl.tpnet.pl. [83.28.37.186])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf214a1sm489997615e9.7.2026.10.14.02.17.05
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 14 Oct 2026 02:17:06 -0700 (PDT)
Date: Wed, 14 Oct 2026 11:17:01 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, Mathias Nyman
 <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org
Subject: Re: [PATCH v4 3/5] usb: xhci: sideband: allocate sideband ring
 segments from a dedicated pool
Message-ID: <20261014111701.4a63e9ca.michal.pecio@gmail.com>
In-Reply-To: <5cd85c1b-4bb7-4f30-930d-6c6451f09395@oss.qualcomm.com>
References: <20260909-16k_offload_v1_b4-v4-0-f24a86617597@oss.qualcomm.com>
	<20260909-16k_offload_v1_b4-v4-3-f24a86617597@oss.qualcomm.com>
	<68b34f04-f7e2-4468-8a18-ac97decb987d@linux.intel.com>
	<82e0b9c7-3b3f-4dce-a72e-64989b08ef98@oss.qualcomm.com>
	<20261013111110.423dd0ff.michal.pecio@gmail.com>
	<5cd85c1b-4bb7-4f30-930d-6c6451f09395@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 13 Oct 2026 15:53:39 -0700, Wesley Cheng wrote:
> I guess my intention was to see if we could leverage the existing
> memory operations within xHCI as much as we could.

This means xhci-hcd needs to be aware of all the client requirements. 
Today we are adding DMA pool to allocate segments on separate pages.
But people may want more - say a client wants different segment size,
it needs to adjust the DMA pool, but also to add another patch because
xhci-hcd would try to create Link TRB at 4KB offset. Or maybe a client
needs more segments. Client allocation gives this flexibility.

To me this is the main appeal - both sides can evolve independently,
without needing to update each other when something changes.

Maybe the sg_table stuff could be replaced with something simpler.
Clients still needs to tell xhci-hcd where the segments are so they
can be mapped, but it could be a few xhci_sideband_[un]map_segment()
calls instead of constructing a table. In principle, a client could
even grow the ring dynamically, without any patches to xhci-hcd.

> The only concern I would have with having the client own all the
> memory operations/allocations is that we would need to carefully
> maintain the transitional phases between offloaded and non-offloaded
> scenarios to be handled properly.  At least in the audio offload
> case, we're only offloading data to the DSP when audio is active,
> which can be for a short duration, and we have proper checks and
> locking already within the xHCI mem/core layers.

Not sure if ring ownership changes anything here?
What sort of existing checks and locking do you want to rely on?

> Since I did take a look at the other issue that probably reminded you
> of this, without getting on to a tangent subject, it really broke
> down to two scenarios:
> 1.  reset_resume during bus resume
> 2.  usb_device_reset for recovery
> 
> In both situations there are requirements that when those
> happen/trigger, technically, the bus should be completely idle.  For
> #1, since we're coming from a bus suspend transition, there should be
> no pending URBs in flight, so if reset_resume happened, xfer rings
> aren't being utilized.  For #2, there were some changes that weren't
> properly handling the pre and post reset callbacks, leading to
> problems in that situation.  I think that series showed us that there
> are corner cases where referencing vdev could potentially be
> unreliable.  I'm going to assume this has no relationship to the
> client driver owning memory, please correct me if I'm wrong. :)

Right, ring UAF and driver data UAF are separate issues and changing
ring ownership won't magically fix driver bugs. It seems impossible to
avoid xhci-sideband keeping references to vdevs, because endpoints must
be stopped on sideband removal. So these references need to be found
and invalidated in all cases when devices are freed "prematurely".

But does this need to go outside xhci-hcd (including xhci-sideband)?
Are those callbacks into the client necessary? It seems they wouldn't
be necessary if ring memory is client-owned.

Regards,
Michal
