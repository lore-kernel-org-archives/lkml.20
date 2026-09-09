Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E972E5328C2
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 11:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788952700; cv=none; b=VBt3JLRdbfrP2wG4x9jqyaN6W4oAq3uBVEIJEhXquOGVBnK8W3C20QFBJ/LaLxCiG5/O+d0UWWeba3swoStPnvsBHBpbNcXHLbgLUmL2MxbeoWCPz7GrA8voJ3ExRQBPgxC74o9nVVYJ2Y83Ygqdqi5EG5SmZl3o0JLXmtq51ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788952700; c=relaxed/simple;
	bh=zOEjwSnsDLGfG/pdeBNOVWeruweXwfJsxl7v7zv3/yY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bGaZEdxF1TbTs8ysAPhWDCOP+u6fUnAEevPW4aN/KG7Vzmvn2M2pIuVeZ1XzgSCaMwXAkJfqLkBH3YMhkW59tbnL/wWd29T5HWgDJPmf4dY2Le2/qXfgRp2YRAKbxczF1osGfSzdJLOY+U817houG3Nn2k5/xWGauc/txdCrWhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FYEQtAN5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FYEQtAN5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B58591F00A3A;
	Wed,  9 Sep 2026 11:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788952691;
	bh=zOEjwSnsDLGfG/pdeBNOVWeruweXwfJsxl7v7zv3/yY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FYEQtAN5KmjTi1SPWjCLNXNqio0wiGEDLX4TLQjBVpZfHG7P1KfnyXuYvshcFpa1S
	 B88U316k4f8BizNr3hFSBOxDd8cJZr6XPwT9l9/0v3VCoc4OHM6bNxB42X0HwTPkTX
	 Z0JhFCO2OTJ653bQH13UfQn9EEIXrjHMqV3g+ZwMLnG3vNsnOwSI2RhmpSi7bayd80
	 0Aj3rIGzOj7DqyKVvq9owikr+ZgBTi6Uglul2byZHt29aUPqYs5DAjbzfO1ULdk4nW
	 BW+Z1xwRgM+Be/vH8ixBWG1Dp0FaNGtcrS+ixLXtXwzbMyOK0sBQn39/QlaVyFovYw
	 XmfmFxwOK8ycw==
Date: Wed, 9 Sep 2026 12:18:03 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: David Laight <david.laight.linux@gmail.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, 
	"Vlastimil Babka (SUSE)" <vbabka@kernel.org>, Nimrod Oren <noren@nvidia.com>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
	Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Brendan Jackman <brendan.jackman@linux.dev>, 
	Hugh Dickins <hughd@google.com>, Nirmoy Das <nirmoyd@nvidia.com>, 
	Dragos Tatulea <dtatulea@nvidia.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] mm: remove min_free_kbytes adjustment for THP
Message-ID: <aqFAOLrybtyo6dd1@gremlin>
References: <20260901190123.3511535-1-noren@nvidia.com>
 <d202dcc3-d7d7-4e98-a9a5-3137cfbfd041@kernel.org>
 <DL9XL8T6UG93.1T1NSJMI8PISK@nvidia.com>
 <aqBiVp405v2srvSa@cmpxchg.org>
 <aqEUdmYnnQQRC8yl@gremlin>
 <20260909113836.6cbe8d17@pumpkin>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909113836.6cbe8d17@pumpkin>

On Wed, Sep 09, 2026 at 11:38:36AM +0100, David Laight wrote:
> On Wed, 9 Sep 2026 09:11:04 +0100
> "Lorenzo Stoakes (ARM)" <ljs@kernel.org> wrote:
>
> > On Tue, Sep 08, 2026 at 03:30:30PM -0400, Johannes Weiner wrote:
> > > On Tue, Sep 08, 2026 at 08:24:38AM -0400, Zi Yan wrote:
> > > > On Tue Sep 8, 2026 at 7:54 AM EDT, Vlastimil Babka (SUSE) wrote:
> > > > > Given neither of the patchset versions achieved universal acceptance, could
> > > > > we try just disabling all the automatic (re)calculations of min_free_kbytes
> > > > > the first moment the sysctl gets adjusted from userspace?
> > > >
> > > > Sounds good to me. Johannes, WDYT?
> > >
> > > +1 That sounds good to me as well.
> >
> > Me also! :>)
>
> You might want some method of restoring the default behaviour.
> Maybe setting to 0 can be used (if that is just silly).

I suppose the concern would be an embedded user for some reason enabling
CONFIG_TRANSPARENT_HUGEPAGE and then defaulting to THP ->madvise and getting the
bigger reserves before somehow disabling it after boot.

But I'm not sure if this is something we really need to worry about?

>
> David
>
> >
> > --
> > Cheers, Lorenzo
> >
>

--
Cheers, Lorenzo
