Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E23EE2FB0B2
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 08:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788251860; cv=none; b=nXKlRGj4kl3d/8GaSkjovFu8jWf729SHW1a3pZmEEkelOjP7INGDrWcwhVv45uL5yLBK0MjIFyRyTG+Pgus4BaRudPN8oggcDRxQPgFXzy22/F/mEHbaFU2Vsk8Q1VHJn3ENapukbjt20jymq23DtsVvonU2fvz5VLkWPB0ordI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788251860; c=relaxed/simple;
	bh=eE/mvm0OB70J2yo+Xo0qPYcbOHQi1c42icRdKv52Qyk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ff8y/KAhE34pLmz6neyB9Jmk8F3G6av1PfKC4YNw5ImQMxbazhq87yoZe+JgraVUkvsUVyXSlob+C7HLdnZqD3XkPouDqQXYPcB0JcioXT2U1fKWe2+zKEAAKJhoHnE7TuEzwrCohB8MQFxddH5YmPsWjO9TSem157bP+KWXtTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QW/8V97v; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QW/8V97v"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49b8eeb3ff2so33235585e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 01:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788251857; x=1788856657; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tLMiVP+WYQH9c6fmi64EU174ERw2OHDZTVkQEU4Pesg=;
        b=QW/8V97vWjhwXoG9XQOy+dTYmVWJy2fXZl2ocrpiMBGQ30DMYcWBIXCHMtKr1dlGjL
         rDlvvlnVWXpU7s1SZo2yRJccpRbCF4Ri6TU2VlqLD6gZfDp9R6Gv2cs3qCJKsosnCQat
         YyNFAPWfBtTde+k7AQTBITg7Jh8WICMHNbZXRJxDQ7Xy84/bMy2lRtCR+0R7DekrSt23
         zIWkMJUUACPvc2P9QCeJDwFGUmjPFTuDm/XJGiu4pxUxtF2p7FkQHnm7kYYbFgicquE3
         7PEBslmE3NXFq7SNqa5njYRgQtstmXHRn6FPFSRrby1o2qMylizXw4uoMfKLarOOIcfy
         VFBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788251857; x=1788856657;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tLMiVP+WYQH9c6fmi64EU174ERw2OHDZTVkQEU4Pesg=;
        b=Bs6HT01NieXXf4RgIhEJ7lzZbaFUigWrFa0zRMe2T4qFdTZy44JgYUUFdvosWzV4et
         AfT5cbSUsYZPVeqAH+4N673zggQ5zeGhitOBz6jLbXoXLvRQAvQn4U1EtvKCoAtHaVle
         qA+3RJiPF3gWIcDcaQNIt9OrgAkvRZiHSEHtYgIOjtLxx1voGHO699WhcgPqqSPSPW9Z
         EGFlyLndUpzoj4KpMZvpk4/K8ncbLogrJR4ozsofAX7PjEFP57COH6T8wgdAxFwKZ+R5
         MPP478VDeDgPqfjdxjLq32QtIqjHTW1SK0r5lOXWAFSOvBTxnETpszHasaqpVKsjxlW1
         D7Sg==
X-Forwarded-Encrypted: i=1; AHgh+RpSoLUNTO1Fqt8ayHqKkMGgGQBL16MDxPrT3rxvnvmUJ0pugWH5pfvogTr9eMX1A2jmfH/NjeoEDuBzaKo=@vger.kernel.org
X-Gm-Message-State: AFuF++k7Bu4ULydBpFkzcac7SrwToVSc+XC2FabdyU4feKEBF8t6xE2f
	GdkR1dSAqTE5uN7JiqGywqKKSOMnG7gwkOrCKQ8Ql6erp19nbBZjsh6j
X-Gm-Gg: AR+sD11+wFsBHVy4rNJkTgNGjKx6S+u3iignifQjKWAOj8KLrDg1Zu2bXQFmTErznvt
	10QD7dVg426PVTysEkM6zs3vo2bC4OzJPlcvCm257CEyD7x/rPK1o3XrZqMvmlarY3JSKtjYToE
	MgZ+nig2C3JlhFDXbBsq950F66kssKeYDqbqPfLeA3HavSJyEXKI7C/Gz7qiLPdbH6hdxIDydci
	RTptc7VGK3SeHtqRlET9oNuimeYq+OdsBzUNOUJoYp8BEydT+22G9gOBedEAFvTMGMAmCubwnPK
	ZMvhuOnI9QOHcahuUtwToPeWfjdaIQmack/QzpQU9B6bA61Qti547mk9PElEBElNL7dzSWR0/Y7
	9eMeNHy0Q7X0MwMGdkJOomUYb6HPbeCKGUEXO+IxCPlYcvO6ahTKFxOx5lkkZpibGX8qkWBT2Ht
	fja1UdprdJnCnSYm5xQJMRTMpi/UEywD5sAt+ohE4g8mXfrEVeZVsdTHwRDuYCOAyL51OVmTA+I
	rr+TB2QydtSQE30YAK3NczWfA==
X-Received: by 2002:a05:600c:4f88:b0:49c:c0d4:53d9 with SMTP id 5b1f17b1804b1-49cdc4546c9mr105399215e9.14.1788251857090;
        Tue, 01 Sep 2026 01:37:37 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce10153sm56391225e9.4.2026.09.01.01.37.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 01:37:36 -0700 (PDT)
Date: Tue, 1 Sep 2026 09:37:35 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: Eli Billauer <eli.billauer@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Brad Warrum <bwarrum@linux.ibm.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Michal Simek <michal.simek@amd.com>, Ritu
 Agarwal <rituagar@linux.ibm.com>, Andrew Morton
 <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, Matthew
 Wilcox <willy@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 2/4] char: xillybus: replace __get_free_pages() with
 kmalloc()
Message-ID: <20260901093735.3f5b2df2@pumpkin>
In-Reply-To: <apaF1HUtJnstuUN4@kernel.org>
References: <20260830-char-misc-v1-0-05e2ce44f291@kernel.org>
	<20260830-char-misc-v1-2-05e2ce44f291@kernel.org>
	<f6001085-9234-4025-ff34-6cc4a66c293a@outbound.gmail.com>
	<20260831123937.32255a49@pumpkin>
	<apaF1HUtJnstuUN4@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 1 Sep 2026 10:59:16 +0300
Mike Rapoport <rppt@kernel.org> wrote:

> On Mon, Aug 31, 2026 at 12:39:37PM +0100, David Laight wrote:
> > On Mon, 31 Aug 2026 12:13:08 +0200
> > Eli Billauer <eli.billauer@gmail.com> wrote:
> >   
> > > On 30/08/2026 9:47, Mike Rapoport (Microsoft) wrote:  
> > > > fifo_init() allocates the buffers backing the software FIFO and
> > > > endpoint_alloc() allocates the transfer buffers of a USB endpoint.
> > > > 
> > > > These buffers can be allocated with kmalloc() as there's nothing special
> > > > about them to go directly to the page allocator.    
> > > 
> > > Except that they are a bit large.
> > > 
> > > fifo_init() may be requested to allocate up to 256 MB of buffer memory. 
> > > This memory resource is split into an array of buffers (fifo->mem[i]), 
> > > each 64 kiB (or less, if there's trouble obtaining segments of this size).  
> >
> > Would it really make sense to allocate the four buffers separately?
> > And/or use vmalloc().  
> 
> My understanding is that the buffers don't need to be physically
> contiguous and vmalloc()ing the entire fifo->mem in one go should work.

What is the minimum size?
Remember PAGE_SIZE can be 64k.

David

> 
> Eli, what do you think?
>  
> > David  
> 

