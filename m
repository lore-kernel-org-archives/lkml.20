Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E76A473C8B
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 14:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788533187; cv=none; b=U19vhwSocj8Qmjud/LavYfmw7S4dNtzDEbq2lJrCQUlDNnwpyj9SNlmaqftLPWxXbbGLuS/IQs9WoINsd19ro5uKfrVTd+dUbGZztxL0nHTr0NY2yx/2zxiJqb7yCVR0IQrlvwhx4PZrvlOTTG93Gu0YIVXoqpEZjYFUiRpEQQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788533187; c=relaxed/simple;
	bh=Yp8tYgPNpTXxsGy5+609I4e13nmE8B0dM7UajTEg3zg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O6AunFVCIkUTV7AmGLqeQvtaDGnSmMM6CE/OCGKCVQmQExLqiDhDD8mAzfVBWIM1PE04Yu6Wo1Errbxhk4ApjMi4RskbM0QgCm9QWE5kdmtd+8hnw0FJsEzEWUtjh/nc954xAzqTnjzgCQZtqQsOLEcdmLlp9fkDWXd40Q6dOt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SL6JFF9F; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SL6JFF9F"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49b8eeb3ff2so10109805e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 07:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788533184; x=1789137984; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vhyOjz0WA8Xf+6egkRqkIlMgMHYt6yHAudWT2EhHeng=;
        b=SL6JFF9FbCbhl7XSPM2iAz6g+px0se8rMnFhIZCKftFOr3N3ahyj678/VTUAuygI5/
         Wstq0g6y7TXHnvFm18XRtlww1SWc4kj02HtQypjf6WEkSdZvOvz4za8uO0MAcSbxAw8a
         5XODuleKOr7K7venGXbKhPFRwAm1n5pNyP1B9UlyexQ1p91gEbhOI3mohk/RbaXs6R9N
         kwwCk/FrkEpo3l9LSP8obDmQEEtCk4wS4OBhF+Xp8jStWFK8sRiw5PQ60kJbrcyU9SwS
         sHNNU4asUeFlVX0BxaGD8Lbk0cF9f4Z2pml11tUDjz8SfDDkuQiVZqrC5yWKL0jzCUAc
         MVvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788533184; x=1789137984;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vhyOjz0WA8Xf+6egkRqkIlMgMHYt6yHAudWT2EhHeng=;
        b=jmGVmq5zXJjENmJUboy+U5u6adRS8qAVSINIWxb9pmdL+vDDhj3SVy8/sPu/6SD6P6
         1O7Oaq6lGvuofmw03LO511I4AWmsZtvAz7SseJv7mz4jTrvWFDTLTOR2HTAFwPoOQJiv
         ppSQKb8zojBKbwCHAI+GkTJn0d7hNCxsNnxKUWzRkPtJ3lQvFx8oidNMfhA95qLMkH9K
         iBETvbF7B13gaAglTOdh6rs4QUbln+0lpeK4ah2C86mhwOaX2Q9hmCY949ePRqX5jlh/
         2ex6CTw6lYaHGJ096lBmxfdeSiK9rbiFlhg/rhF/NEn8rcYCHFFZFOywz0vhBiW6WCu3
         c73w==
X-Forwarded-Encrypted: i=1; AKwUvByRHIIc4gLGnYC78BS5u8P+mk25kiChWjxQftc2Px8E5p2vST6dJYQI93z4heDBhRIo4UKNuGa6VT4jz90=@vger.kernel.org
X-Gm-Message-State: AFuF++nL6khF978BGa2jHisUHLXH9dwex6Y54piWWqdJaFy0Q2E8ZZ2M
	S/2YfaiOEgaSOWxdga6cGidbl0R/Pkp4YGNos1DWVecYzTbm/bEE7E6q
X-Gm-Gg: AYBFou186StEQu/y4HcYBxEzrwyFQwx72SP6P0g/yYzANbCCkLeFEQed5RaNTe+weHt
	xLJkMe11h6EYfyL5cVEQpeIPLc+Gr8D89CVUmf+MmKJlmcUYbV5qMqTr7F7URv/saK89w3BdwLX
	MFjjqRw/5icj7OIF80M/Gtlg/boCmcN0CKg+rHckI+uF7WG5R97aMZCYy8/XBuZRjr4dctXiYmQ
	kyW5FvTjCLY1h9JGDq0Rh56M0M8hF/Lyr1i0VOQ4RFcjughN2ggVJR5sXIWilxhtjI4oMden6by
	qEA8kVXYeVfyO716KK2LU7ZsATqMJIxsdJcLMqMt0Kk2l+jDE0z+XDwB+7AiOUuBVLSCRprG+//
	DWI1wg99W+3htf1hg/8YLGefvUdnm/6vzG5AtBu+w3OjNY1Z7imiltDok31vp9Hiaq4gWSJscND
	wgVnkapNji4NUUfu0GWUMJdbf8L9NceMqfLHKGZYtVehPj57cKWKTXh04=
X-Received: by 2002:a05:600c:c48f:b0:497:fecd:5b00 with SMTP id 5b1f17b1804b1-49cf825d507mr65851075e9.9.1788533183474;
        Fri, 04 Sep 2026 07:46:23 -0700 (PDT)
Received: from foxbook (bfg95.neoplus.adsl.tpnet.pl. [83.28.44.95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cff81c9b5sm10582275e9.4.2026.09.04.07.46.22
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 04 Sep 2026 07:46:23 -0700 (PDT)
Date: Fri, 4 Sep 2026 16:46:16 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Wesley Cheng <wesley.cheng@oss.qualcomm.com>, Mathias Nyman
 <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org
Subject: Re: [PATCH 0/2] Add larger page size support for USB audio offload
 path
Message-ID: <20260904164616.12abbe13.michal.pecio@gmail.com>
In-Reply-To: <05117737-8793-4db9-9815-f617ac085d82@linux.intel.com>
References: <20260824-16k_offload_v1_b4-v1-0-49a6be60ca30@oss.qualcomm.com>
	<20260825094327.606072e9.michal.pecio@gmail.com>
	<25ebe180-a620-4170-92f7-fda6c55a4129@oss.qualcomm.com>
	<0bf654f3-51c5-4555-8cdd-dc9d25dd9f78@oss.qualcomm.com>
	<20260826122552.5761dea2.michal.pecio@gmail.com>
	<05117737-8793-4db9-9815-f617ac085d82@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 26 Aug 2026 14:44:42 +0300, Mathias Nyman wrote:
> On 8/26/26 13:25, Michal Pecio wrote:
> > The part about memory being "owned by the audio DSP" made me wonder
> > if it would be helpful to let offload drivers allocate their own
> > memory and then just dma_map() it for the xHC. No new rings would
> > be allocated for offloaded endpoints when they are enabled, we
> > would point Endpoint Context of the xHC to the sideband ring and
> > leave ep->ring as NULL.
> > 
> > Offload drivers would have full control over memory allocation -
> > size, number of segments (it seems that qc-usb-audio only uses one
> > out of two allocated by xhci-hcd), alignment, anything else.
> > 
> > It would become impossible to offload an endpoint which is already
> > enabled, but is this an issue for anyone?
> > 
> > NULL ep->ring will cause oopses/panics when somebody submits URBs to
> > offloaded endpoints, but I think it wouldn't be a problem otherwise.
> >   
> I have similar thoughts.
> 
> One idea would be to basically let sideband allocate the entire ring
> and set ep->new_ring early. This would tell xhci_endpoint_init() that
> a ring exists and a new one should not be allocated.

Actually, my suggestion was more radical: make the ring NULL for
offloaded endpoints. Driver core would only be concerned with copying
some dequeue pointer to the EP Context, which pointer would only have
meaning to the sideband client, the xHC, and maybe xhci-sideband.

This would be a new special case in xhci_endpoint_init(), but little
other core changes, I think. And yes, it makes sense that sideband
support shouldn't exclude using normal URBs, but they can't both work
at the same time. We can restore normal operation when SB is gone.

> xhci ring allocation would need some refactoring to create helpers
> for sideband to allocate and initialize all the other parts of the
> ring.

Helpers can be exported if clients need them. But it seems existing QC
driver has different idea about segment count (I think it uses one) and
hence it probably also writes its own link TRB and doesn't need ours.

Even segment size - does it need to be equal in QC DSP and xhci-hcd?
Today it is, but one or the other side might want to change it later.

It also seems that QC DSP expects the rings to appear at particular
IOVAs in particular order, so QC driver maps them one by one through
IOMMU. Alternatively, it could map one big block, divide it into rings
as the DSP desires and pass pointers to sideband_create_endpoint().
Looks like less work for the driver.

> This is something that VTIO (xhci spec section 4.25) would also need.
> There an endpoint can be handed over to a secondary DMA ID (second,
> new PCI BDF), that the normal xhci driver can be excluded from  with
> iommu.
> 
> VTIO use case is something like trusted VM accessing a secure usb
> storage device, preventing regular OS running the xhci driver in
> another VM from touching it.
> 
> The secure VM needs to allocate and map the ring to this secondary
> PCI BDF

If I understand correctly, that's something like Qubes OS archicture,
where untrusted VMs run drivers to contain any failures inside. Then it
seems we wouldn't want the xhci-hcd VM to have access to transfer rings
to prevent tampering with protected devices.

Hence, no allocation, no initialization. Only opaque pointers, again.

Regards,
Michal
