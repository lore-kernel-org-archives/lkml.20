Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB544E50D5
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 12:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791981316; cv=none; b=HrMKVjqBOkvQVgI+k1BIusDEH91426H+GxSTiklijSiruJY9y24D7Oz7EmKNgIc3t3/F39hLJK6BoTFmn4hN2Ky7iXDA9zHA5u54X0so9uJkjzbEVg0W0Nd/nn/Xkfbd4LEecvnXH8VRGwVM55VYrUUNmSZRdPpiHEIxKsyNw0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791981316; c=relaxed/simple;
	bh=JID+5g3N2NzMm5veKoBPvH2ibg+eIuVR2toHlHU5Pb4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=km3nXdJ6ppzx6+fXHRVzpoy70zARpLUtE+35jK1CVCSGMUljVTutGxUxqfoyMWNDBF4ACBb2zpNlJkSov4DzGUsUeNv72dmaaUjWVvW5PpH4vHzl3tqW5H1YQQMzX9ZNfprveY16PUCuIl/MltsaQhoUaBg9OZTvsQ2ih+72HxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=cUBpl6wn; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="cUBpl6wn"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-91bb5795792so2200076d6.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 05:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1791981312; x=1792586112; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QmQpU9PI8un7KuCGa3rKdlGVWqm4zvZIc3vocEo9k9Q=;
        b=cUBpl6wnmz0vitD8q+khvWzYLa+T9q1Nw88RWxGVwIl8bWmDCPTX8p3OccB+U+21J5
         YAfFXCaE7q4Z5WX7GC7/rJYRXoWWBfXjhaa6WIn8c+0O4RsAN5QjoYVQ8KqKKIszunMN
         3MYE6HaGGoon1IA+FXJDV45pAnX+g6Kfegm15lpDQxGV8nigGIuZ2B6n4whp7jt5xXCN
         DvPPtSdaYdi7C2JBkf0yjgaJxLkg21ahkDXX9QJZNz6JeT4V1XCGku/nrJ6kXG+LeyHj
         x2mTch2RKGEMJcWpr/nrSzL66emPTsklWtjx+4MhUmLce8B+uoDcv9CN2P1lY89MT91E
         PTCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791981312; x=1792586112;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QmQpU9PI8un7KuCGa3rKdlGVWqm4zvZIc3vocEo9k9Q=;
        b=sHw6GXe3NQGzxoKPRmKT7UPI2zE3JsIxQw7s/TPRjegtNibT6UiuJLfpS1NPR3r84n
         SPacYczu/TOAVG42TBD7vunudwrH6JSAoUf00t56mfYzoxz6w1yncztcpvB+7+APbaQy
         0EBCWPZdTdhP+HyogAtJxYaaKz0s2wPCRu+S3+rk5ut3beYbcf3wlXS31VrlAEKmGziF
         VJ3REzTW6T5pvCKgDwYqBFh48Z3A9HGt3ibBxf0SlUmkuguCym3w/DX84w5X1H4ux4/d
         T2PYu9m19VFxfAEPoc2pWioV3MHZIARb5tNbrl6qXo/C0dM9FNmuU+zAMeDq58Q9U0IO
         bSTg==
X-Forwarded-Encrypted: i=1; AKwUvBwY3ctqP83OXF+6318joWdlqUtd4FVg+uAZHPPlw/6FQmERya2rYAtfOWDbxyWQkm+0IfyYmWGcxtAEdA8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIGyoCRcs/RXBW441Xu3DMBzizIJXYDwAnmzjIs4+de47rt+Y7G
	y0ndSUDiI7gF7XoKlQoltw3PgLKPTJhdtF3/OVy6GPA7KZwFTn1ErKE+Jtxh62YyaqM=
X-Gm-Gg: AYBFou2qsQHm34MH9lVQIZ5udHFL9LL0fX/MFYFd4re2SkMC3lqvAlBHOxfdcVA55wl
	UjYQF7D4GNZgMTf8ZEjkR+aDvGBXlIFKHdOvKCBDA46EjGTNDpfOItfB3IQK+aJT2WtJ60hFTow
	t6F9nm+pEHjTaM8a+Q2A3TIsTQTnXmMOTdRexBfCaQkPe4RuuQhRr71N0hf1tMs1RGDqi+HL7cZ
	FpH6GDnZsZctmvPnHHFp2MgoOZbakGPPqJQrzOFXevr7FUF3Lc6wrRyPrOBvj9Mn/oOpluzsUZr
	mvTQM1FnOlXvLATnJJ8iD1FSYkgh6pCzw8oeXcEo41JpkYsXsNgm+cYH18Kv+j1lyoZIlqCIw01
	EMuitXtCReolev71BiqbACWZgyaEN+vOgoTnSAftU8n7fi1MIrfFFTzESljn9E59+jK95bnhsTU
	ALsHNu3LHV1q4uIvdmCJPQw2tc6kspwr2szfNeDgImIX4bdLaltU2psW7uaKr7844MBYcBi+GD5
	MFCnwKpuUZSwNzOFQHVx0aIjnC74N3FsX0xPa/vBRnzvO2St0gTryP+
X-Received: by 2002:a05:620a:d95:b0:93e:e376:9b1d with SMTP id af79cd13be357-93ee376b37cmr1452850885a.9.1791981312473;
        Wed, 14 Oct 2026 05:35:12 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93ef502608bsm483806485a.25.2026.10.14.05.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 05:35:12 -0700 (PDT)
Date: Wed, 14 Oct 2026 08:35:09 -0400
From: Gregory Price <gourry@gourry.net>
To: Yafang Shao <laoar.shao@gmail.com>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, 
	eddyz87@gmail.com, memxor@gmail.com, mingo@redhat.com, peterz@infradead.org, 
	juri.lelli@redhat.com, vincent.guittot@linaro.org, akpm@linux-foundation.org, 
	david@kernel.org, tj@kernel.org, hannes@cmpxchg.org, mkoutny@suse.com, 
	shakeel.butt@linux.dev, roman.gushchin@linux.dev, yu.c.chen@intel.com, 
	zhao1.liu@intel.com, bpf@vger.kernel.org, linux-mm@kvack.org, cgroups@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 0/3] BPF-based per-cgroup NUMA balancing mode
 selection
Message-ID: <as92ra-Ko2c7OdRS@gourry-fedora-PF4VCD3F>
References: <20261012120438.52849-1-laoar.shao@gmail.com>
 <as5RFhW1Ch8ta5nZ@gourry-fedora-PF4VCD3F>
 <CALOAHbCOTSOPTzoSqKoBJZ56o0pfW_dGQ7ZM_e1jT9N16z3VPQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALOAHbCOTSOPTzoSqKoBJZ56o0pfW_dGQ7ZM_e1jT9N16z3VPQ@mail.gmail.com>

On Wed, Oct 14, 2026 at 11:08:40AM +0800, Yafang Shao wrote:
> >
> > I also concur with Tejun that ops seems like overkill for this feature,
> > this seems like something that can already be managed.
> 
> Tejun also suggested starting with a smaller kfunc rather than the
> heavyweight struct_ops, in a separate mailing list thread. I agree
> that this would be a good starting point.
> 
> >
> > For example, why not add a new numa balancing mode bit that says
> > "enabled but only for explicitly opted in tasks" and then ignore the
> > global default mempolicy, e.g.:
> >
> >   if (numab_mode & NUMA_BALANCING_OPT_IN &&
> >       mpol != default &&
> >       mpol.flags & MPOL_F_NUMA_BALANCING)
> >       /* do balancing */
> 
> Another option would be to add a cgroup::numab_mode field (without
> exposing a cgroupfs interface file for now) to implement per-cgroup
> numab mode. I will think it over, considering both your suggestion and
> Tejun's.
> 

I don't have a strong feeling either way, if Tejun thinks a kfunc is
acceptable here then that's probably preferable to any new UAPI changes
until the value is proven.

Thank you for the consideration,
~Gregory
