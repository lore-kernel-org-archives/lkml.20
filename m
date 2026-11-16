Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794861220;
	b=hzk8ocHA/KQtk30r8DcgWSEeBxGlew+AaFhdag1k5W4pPSw273EO2v4eTatZvMWGI2dc
	 AxO4DcOP1IT5r4fo9q4bkQS5onkg73Q5e0IX8WEYx6lpt6RmgHqvOr06Yy7/Rv0UTChUj
	 5NFIPkkMatIr5y77f6vWvrJ96Rj9qiicNSY6BRP527d1EDqjDoNBObvNjehgF+b7iuqVf
	 NGvI98Rb+UNA9+tYjHtn4EXKGK/FV8hffKBWh5NZaRdLzRxzCXkXFnk3+r8Z3n3IXxNCh
	 cIuTl3i32Zq7sDJyoj6gebtauBy1T4vJ3NHdrar/MJpiT1x2a7M7iVbItW3O0MgL7Ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794861220;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=FRUBObM4vFL1TGf3o6s1ZDBsKZdTJ/3jimI0MzXw8Fk=;
	b=SKSW0NDEkz4LIoX04CXsjQiKnPVIJtx41/HwXFYZqVt0cOrAGyjw3YSNMJy9I7KfXo8V
	 sQ6oekXFJvdJjDRapM0C72AfvR4tj+KVJP9mvJIJpzlCOWIg4TfhPOCeJOgdL3lgnNRkf
	 Af15Jjmdt62h4mLuqmRINI5TXnDMba45fh1ELVU0X1lat6VlDT/ZO8O5cdkS03azPsyvC
	 xsexATEB6tuIX/IIv4QI3/s8q938fJop3Tu2aP4PQLmxVl9vFgpktFWCjXU/4deIrals+
	 KWCthZ4c0ZPp5ORPNFzYndbdLvwyQOyzwpW1VF9CFC6NtBCxdOUt+b6ut0o0FS/FgBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=W8qlgedU;
	arc=none smtp.remote-ip=209.85.222.181
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28697606A33D
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 20:33:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28697606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=W8qlgedU
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-945e6d9ceeaso409931185a.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:33:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794861219; x=1795466019; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FRUBObM4vFL1TGf3o6s1ZDBsKZdTJ/3jimI0MzXw8Fk=;
        b=W8qlgedUXT2a/t6lhLP87IFTcy14JLKYa/mLodRolDlr9xZZQGxtW5Noy7E031dblU
         MZyTiD0CS6csrzNdM/y/kT9cZThOJzBfJnBjyuudT36134JK9rL5Y+cJlR9PkLw6In16
         I1GQFmpXC+GQjLACTJo0WVW99izKDBVRyEpioO38WVT6BB7yoB56iiO/mZo9HLJwUqYy
         WRepiT2m5sdFzS0WIaIky8pQ9PM9gsPwA3F1oZ8AlieRWNRm9qrQr3NdwmjMdkz0t3US
         NP5znb8aU6kvol1hpUX4T2gg8E0YcF+imIMZKWdgwp2eC1/JJZ5bvYf6eHZddNlll3GG
         nyWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794861219; x=1795466019;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FRUBObM4vFL1TGf3o6s1ZDBsKZdTJ/3jimI0MzXw8Fk=;
        b=AqeEGHM9iJzsFXM2IrQYFKqb/y7sJIBwHBZxO30d5zirtjzROWFWhdWKKXahy83OJg
         XkaUkqQQXP/4iA6jNnFut51zzy/j6jAMgrUESnN7KiuSTB98MojuZmpbTiIXA3RLXUT5
         iv9KKlrgt6Ai5XEt4FzAMiFXudDfKKF6v16GMY9hpx5U2hSYeNYZaeQBxcMkQOLjYL7x
         Ifo8Pvgurx2DAjl0VJbPnMTxmJOggvgs7QxBUSgXZhzKZrB2d6YtIWS3ZWC3gVdKXWqP
         n0TnfPYR8YIWGjoMhSKqgWG83/OVHR5Dyw+t46qgPF1YKv6VbTBVey1ljyLPftnhacIV
         qT+A==
X-Forwarded-Encrypted: i=1; AL+hErGSpadQm6bYQEDO/cJu+dJQbDO9Sgw7doTMR8tZK0PF9T8uFECLfRU7OqiocjfinaOKN9RMY4H+TW5Rscg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9RkEaLC9IOADTJ2Jlqio8dUdkUoEPuC9zBQaclQIyigS5SQfNb
	9uqnIXkEEq61RI4WURJTrx96CnYROLOknf35tI/SQGG1wb3gUjmcThmNOlpghij2YnQ=
X-Gm-Gg: AYBFou2vvrUYPMhW4MjIJOMNPwyvmkUXyOA+GWZKHudhPfrzrJvHCgd3NsIB7nCEzRI
	UQ9TWERQz9UTUBzIuKGuZ8jnPwIo80irNwqe1fWBz9mcmjHcM+s+6k8VKB9lv2wjTupeSnQVXCi
	X3D9DwtvW64nLyGX3x4tohrNIfLveVGBjjQzQyeJJ/nHxZrLHNVuWLLEM1AGuoYlfjK9O7WHxX+
	/qNlcv4epSt2H6Fo5c0kii5GAtOmBZh6VTD/2OLlNnkH0bHwnm1RZiOrYV0ZUAVm5kxbq9UCklX
	79h38IMS5nmuDflP05OcLC08FMbgVuECO7qfrjyo5zWFWzjjACcgGH0wz9N7n6D3cbiovUPORXs
	f8YwxfAtOxZvL4QIBUcLQ/0uNqTSz+doc7iIp2yHrC9RyXOsCQakWyEImSmpa8aKrn7QULmv2tT
	lBn3nXm+fSHXzQUDtA41PkoJUUpJRLWHt0uOSiCnZdaB2jmSRH+AJToUk43WRQ58z2joITU8uhY
	J2ZowWELT0VjBLDIfUuOCi50p79pTquR83s2Ccn1T6Gf25CBgPy3T5aKUdRljJx+nlxWOgNY6nx
	kTOe6Q==
X-Received: by 2002:a05:620a:46a6:b0:949:733e:ddd8 with SMTP id af79cd13be357-949733ee766mr1034555085a.54.1794861219140;
        Mon, 16 Nov 2026 12:33:39 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c804f9esm930800685a.11.2026.11.16.12.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 12:33:38 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xT3OT-0000000ARJs-2rZa;
	Mon, 16 Nov 2026 16:33:37 -0400
Date: Mon, 16 Nov 2026 16:33:37 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Tao Cui <cui.tao@linux.dev>
Cc: akpm@linux-foundation.org, dgilbert@interlog.com, mkp@kernel.org,
	loberman@redhat.com, jmeneghi@redhat.com, kraxel@redhat.com,
	vivek.kasireddy@intel.com, mst@redhat.com, jasowangio@gmail.com,
	eperezma@redhat.com, stefanha@redhat.com, sgarzare@redhat.com,
	rostedt@goodmis.org, vdonnefort@google.com, mhiramat@kernel.org,
	kevin.tian@intel.com, axboe@kernel.dk, linux-mm@kvack.org,
	James.Bottomley@hansenpartnership.com, sumit.semwal@linaro.org,
	christian.koenig@amd.com, phasta@kernel.org, joro@8bytes.org,
	will@kernel.org, linux-scsi@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org, kvm@vger.kernel.org,
	virtualization@lists.linux.dev, linux-trace-kernel@vger.kernel.org,
	iommu@lists.linux.dev, io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org, bobbyeshleman@meta.com,
	mathieu.desnoyers@efficios.com, robin.murphy@arm.com,
	mason@kernel.org, aesteve@redhat.com, tjmercier@google.com,
	harry@kernel.org, vbabka@suse.cz, cuitao@kylinos.cn
Subject: Re: [PATCH 5/7] iommufd: account the hw_queue page array to memcg
Message-ID: <20261116203337.GA2481588@ziepe.ca>
References: <20261106131829.3228926-1-cui.tao@linux.dev>
 <20261106131829.3228926-6-cui.tao@linux.dev>
 <20261116195213.GF2452510@ziepe.ca>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261116195213.GF2452510@ziepe.ca>

On Mon, Nov 16, 2026 at 03:52:13PM -0400, Jason Gunthorpe wrote:
> On Fri, Nov 06, 2026 at 09:18:27PM +0800, Tao Cui wrote:
> > From: Tao Cui <cuitao@kylinos.cn>
> > 
> > IOMMUFD_CMD_HW_QUEUE_ALLOC pins up to max_npages pages just to check
> > that a user supplied queue region is physically contiguous, and the
> > page array for that check is plain GFP_KERNEL.  The size comes from
> > cmd->length, a u64 that is only overflow checked, and the array is
> > freed again as soon as the contiguity check fails, so the allocation
> > can be repeated concurrently: a 1GB region costs about 2MB of
> > uncharged memory per attempt.
> > 
> > Every other iommufd allocation that scales with user input is already
> > charged, and the pinned pages charge the mapper at map time.  Charge
> > this array like the rest.
> > 
> > Signed-off-by: Tao Cui <cuitao@kylinos.cn>
> > ---
> >  drivers/iommu/iommufd/viommu.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

I'll just apply it, thanks

Jason
