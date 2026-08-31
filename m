Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBCB144C678
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 14:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788186649; cv=none; b=Ia4esZuD6WOpWBJ1TM7E7V12n+yWyavxihIdBZaPkhtuuIA4fc19BNw6bZgxTkEtJSad8gzWhT6JdnYhdD3rxPiBrivaI3qswLoL2GOhy4uByQLEzzfZlIkt897dPlF4ZcSDoIjKKVpZCFJm4yqn31VMWD92Gct4Zd4x33Ym/Zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788186649; c=relaxed/simple;
	bh=u3dgwxIw+0DmelYeYTKjtyYkNOzEMEXvs0AujSPDSFI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cTs8mHDZOCZpfGiFk7jl7/RFwJGT6i3rKRen85JmtTTLb6mDNFXDDAxqnE3aAjyZtctUbxvzmG/vzF4PxKhLeR3lUwL1MIuVG+kR+Df8+1a0EJuLmtpb7M4sC7Y74iADSPPsts7qcdbvlXlaO2EcHw6SBuZXt3E7DGHuCxTT/Bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=ack07PSA; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="ack07PSA"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-52fbb20c30eso35692211cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1788186647; x=1788791447; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fxM2GgazObY4pny7CjicJsoYJzAciykbqLiuPBKukrM=;
        b=ack07PSA6cyT0+9KaocQoUzn8v9nzOs74NFCUwGvt9C3wAykR19h2NZayTngob5dhO
         jpYJnY8jlAbsU3qRvZe/aK4iQEA04cjvlMvYradenxGsFs710aJdxehTJeWj9ZmS5+y4
         Mx+MvUCeKa932hM1i/DoO0tYcCtj9OVHnPeuLlXnxuHs6Q1NHPPuR4CHRH5Tyev6LJ2x
         OMKhl/e+e0hXVhBfJF+NaV0ltmIVBj6F/MtJqIGXzGLpzxjzbh8IAvmWjODAoRqloTak
         9k8NgSyCa8A6iTVf1RlCoByP9uiKBbhEEQqP5vg3YRQAlb2WHgJ1ok08wjHe9yD/lD/D
         AGOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788186647; x=1788791447;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fxM2GgazObY4pny7CjicJsoYJzAciykbqLiuPBKukrM=;
        b=hoK7Ch4x1Y3JjL5qO7sSxw1Y1ZE+X58BTIkl/78nJzPwTN0kT2a+pkfAODXkNZDbKt
         WmbIlHCg15UUNNJgvw85Aod5pqXvHdiH7bNix7T48efuDbZjuDodPuVSNW9Wkfa5tTBe
         2MbfycAu9SQBLO5mKZwUUJh5Sa95WQJwuxv9j9laxh7JbH9x0zLd0db0REzNKLMmYsyB
         GclGL1t7rH1z6Z18cV1HlnHPSOsKnkTXgaGfqritGPGxtfsQ5J6UCu2cbVJb0IrqLdIg
         SuCbyed+R5s+b2kZ9pXly+dE8eEny4V4anN+ZFWgYPHTn/XJGHrfaHX7bWCZrXGsSFui
         kL6g==
X-Forwarded-Encrypted: i=1; AHgh+Rq2KrUv77QRA8KuVAvWiE9ie/3h298EzGHq9Gsgr+vX4Fwp0BNdEsjCdN2ILT/ZI4VckL2pjPCVinyYIY8=@vger.kernel.org
X-Gm-Message-State: AFuF++meiXtO5NOOIkxFazJhIktbopBkRptyhdDTJZgVeRFe1zLB2eQ2
	ZRlGtyi4DTIrMikWEbpe5ySdmDqQ7EmfhXMHXeqe9h+aQwZx23z+VSrnZfavJTnNSgewwIVJD6O
	X720=
X-Gm-Gg: AR+sD11SOotZGKGmRQkuV1yjYJAFQe5saQ7KiPafZZVRXYoVupdTFKuXZiYqzy5nhp4
	3hdRoG5jlZFW4WAzZSbrgl1l4SylPhWP6wfWD5KIqP/bIT/s7JfM7hoWcwsouOmE7Aheyp2nZ0L
	chOvT0IVEHnGMiSbj2DdJ1DzcGQXFmzWHbqXOuayq1rwW5x7RVoLsmb1C+Ok/fPH311eFNkFDuz
	dJY/z8e1ksyCp8dS8GWhrwqzJB2z+P7Vp/vS3okjd2XsFz14X+KNEHLqVhjK2vM5VXiESaCjoO6
	Vo6NfdDr/f+e80kvcYBFWP1jHDMLOMpeCbFQRMF8lBfSel0ns5raTyEylpic+CoC+iXmsVbTyB3
	KFQRkaJ9MLWYm7o+ZHafqjpGqnXhRrY2tFLUV6446qfa1bj+cxoQLi0zxAamqztq4y6giAR+NHj
	soPIiNp9CTyBqY0EYUOScEZR1tm3cdqimSgE0g3pmPb13fl0iJRpqXKwNwh1NVQj3Fs4M/i01wo
	fX0wczh9eE/QHYGzQ==
X-Received: by 2002:a05:622a:2598:b0:51c:1532:ae93 with SMTP id d75a77b69052e-53021cb99c7mr18496681cf.26.1788186646408;
        Mon, 31 Aug 2026 07:30:46 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90ce4515130sm85355856d6.39.2026.08.31.07.30.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 07:30:45 -0700 (PDT)
Date: Mon, 31 Aug 2026 10:30:43 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Oliver Neukum <oneukum@suse.com>
Cc: "Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Chas Williams <3chas3@gmail.com>,
	Duncan Sands <duncan.sands@free.fr>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	accessrunner-general@lists.sourceforge.net,
	linux-atm-general@lists.sourceforge.net,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-usb@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH 1/4] USB: usbfs: replace __get_free_page() with kmalloc()
Message-ID: <8cbe558e-7f53-4ce4-be8e-52fdba9105d4@rowland.harvard.edu>
References: <20260830-usb-v1-0-aa349c302246@kernel.org>
 <20260830-usb-v1-1-aa349c302246@kernel.org>
 <ea165ff8-cda2-4fed-9354-1d14ac2d87ca@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ea165ff8-cda2-4fed-9354-1d14ac2d87ca@suse.com>

On Mon, Aug 31, 2026 at 03:27:07PM +0200, Oliver Neukum wrote:
> On 30.08.26 10:10, Mike Rapoport (Microsoft) wrote:
> > do_proc_control() allocates a temporary buffer for the data stage of a
> > control transfer issued from userspace.
> > 
> > This buffer can be allocated with kmalloc() as there's nothing special
> > about it to go directly to the page allocator.
> 
> You are breaking the calculation. A page has a size of exactly
> PAGE_SIZE. A kmalloced object of PAGE_SIZE is larger. That is
> a bad idea.

By "the calculation", are you referring to the 
usbfs_increase_memory_usage() call in do_proc_control()?

The overhead in kmalloc allocations doesn't really matter for this 
purpose -- it can be considered a rounding error.  Besides, we don't 
know how big the overhead is, so we can't account for it.  You can see 
that in the same call, we don't try to account for the overhead involved 
in usb_alloc_urb() or kmalloc_obj() either.

I'd say there's nothing wrong with this patch.

Alan Stern
