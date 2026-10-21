Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.152
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792573886;
	b=X7I4lP4Xmu/Zokq3+wgBW9Rw7/lDl9hNchJ3pU9LMkzKoAWuVks4YwB0W5+016tpcYE8
	 I3ReYb8Cwrvw+XS8cGcyxaCkpI9rz/iTVl7Xi4QZEZyLc88ecKTCcPhOv6Q1IkKi5dyxH
	 tjlYDeVzXFSmo9N5aBOUPwuwsfaiiKo03TWt7NH+nnYKoAFOWw97LHfQYgHn6lYH917cN
	 RJkplPPGTpzTmAnlRSHccA90OzEJ0RW8EeBf8y9KvPLE6dOPAQtzE00kJay0k/fo9spXA
	 JrzwidSyoABTsw0jGXC0pk/Fh9b+nzMJAzQ7EECm2yUGpN3oaZVqh1I+GsvODEHXi/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792573886;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=yPQ/niTPbDxR3MpsEpcgUMSUJ1Etb5QeryWpn+3WjQk=;
	b=WyFvJQoH8gHLpNnoAun4tYgAcEs9cZjpdluoNUZYFxu7/wbJnluOQ9LCtYrzSQodOiQh
	 i/egZ3CgP5FKGkhV8p+dRykQq4u64NuL+J07kp8i44kf9woSH0+0+ZT3+tDVRZOE/Zk/Q
	 B+S4BTmDy/BExmftNirb1y0XIDfzEwHPs3OApkSgMzmq4v2Nkyx2MiL+p+0H7m5IoDhPK
	 8r8BYHmN1wAc7eOyi1hGmB1F1LYpvZYcBWX2x+cxBfleeBar90ooJN9Cz6alqAXvoe0We
	 h8Dz5QytgnEI8kvP+95eQdvwxcBNdlC5g1lhGm2Fl8G42RpnG4WRsZePEjUT2tsZzxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=shutemov.name;
	spf=pass smtp.mailfrom=shutemov.name;
	dkim=pass header.d=shutemov.name header.i=@shutemov.name header.a=rsa-sha256 header.s=fm3 header.b=dMlx8BfQ;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=gh24kUPn;
	arc=none smtp.remote-ip=202.12.124.152
Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D1D606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:11:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62D1D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=shutemov.name header.i=@shutemov.name header.a=rsa-sha256 header.s=fm3 header.b=dMlx8BfQ;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=gh24kUPn
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 9F8E97A006D
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 05:11:25 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Wed, 21 Oct 2026 05:11:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1792573884; x=
	1792660284; bh=yPQ/niTPbDxR3MpsEpcgUMSUJ1Etb5QeryWpn+3WjQk=; b=d
	Mlx8BfQTxvyHTYu9IheLpNGX9rpuU57Dikae29m49ckW/QcQePqDSuh2EMmUjtHM
	7C8rIfQVSaxULH3wdOoJj6XevbFABktAXH6eD9yltF4wKQlOZ++QRRr2fxlLMxXO
	Ypi73jf/3Sxz826j7WRtXKXIJ+iuSCzALcnBaxTRtAUOy6256H2r3JkrFlzvIZIH
	/BkLOSNGxSjj9OLH1BHT3LqnCpcGSQJX5vNPCkAX1tB6vYGuZtIhaoiHnw+kEM05
	g3M+LfceC8CiU6SBt9kfQ3EDIj/6KABllufnau+NHEWXYqwU5kCOGqg3ZBuudifN
	UwOZd3bpdpKRiqlSOkZRA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1792573884; x=1792660284; bh=yPQ/niTPbDxR3MpsEpcgUMSUJ1Etb5QeryW
	pn+3WjQk=; b=gh24kUPnvU1GovUH1tV+S2Ptv6FXc0gdxtxV+4E06BVgB6maaL2
	zw76y9L/XPCsGGcm7BvC9007fWA0b7DTg+8SbWckK1DZrEihyLqnVTteHWP/OLgf
	yqlhS3RNmXNGMLg/y6ofpNi/NC5cnSnuYyRgc1WZpXkeH0wZA5OwgFNcNSMFEGIr
	RT4VdmTnIOQmgIoGAEX8MiGgoMqwrUYgZMRo87UCRMAMJlGlfFqbveL65KON1tcQ
	+KaFVGEndXGU3PzeeJhxOoUiVpviuY2FK65c9RW0zu/yYPtcVCXr5HxGMkvnAd/p
	rfXFzjxCe+axgA4itVP4zeVwdrsgaih4A0w==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=shutemov.name a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792573884; d=shutemov.name;
	mf=PGtpcmlsbEBzaHV0ZW1vdi5uYW1lPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm3:rsa-sha256:Uk9+djvV9HuVyjoLo/ikt2WkRj/uftPHB7paQ5hcD7OyO8I
	gyoeDlkfjIXCaly9CyGxAhbVhrk1f6fdBV3pgLaQbCysbUdJwJGxCVjW/dHYJJWo
	Ex8DUF+F5UMuKyXIZ1jSdF8h+2uKACRBrr131RpbZdzx+OwLCowEuurrYSr3IdoK
	C8e+7yjIHyEEgtR/QW9pStTDTTe4fCIzt1H5SSuPxvtl2NW9gJktGHVWRNeTTrRF
	nc2n9Ls4eRPPrTdIqjojx/cRyQCcn9K5hSTw1Em0bj/XIq3prqvBDUHa+dKFV6BC
	ON+zNQiaQbOvy2aEfbq1p3nj1efa3gmK/8J6i/Q==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:Tc7ukHXWIvlZRrWSU2hLvegzEyJAUHfRT7hdKA32tuc=:H7eIvvta5zlDfEdK+OCeQCYCS9ry3TLuaH/l3ceYpYg=;
X-ME-Sender: <xms:vIHYaoLbq_vOjgG9MuUSzn3yM4G2ekjnPNuMzYWS7ZtL-gN11qRNvQ>
    <xme:vIHYatWJu9f2RPtUTXU3uKC44LD0SGVW997fLTuHyLtE64Gyv2NK5IdAlo0Y6pKvN
    EN4kDys8mzrKVdpl7938CWaOBWvUVE79PBp0zFqFv7NTMmviN4JYWpq>
X-ME-Received: <xmr:vIHYasGVdT5fjyoao5x102sz3KBM8YRx-ZZNmK5cIU52ledDpR81GEU13KY>
X-ME-Proxy-Cause: dmFkZTF6nJZYKXks1Bk+zdjRqyvRREPlE6EyeftPs8J54NlJxNXTwVEDnsb75ebaKWGUdi
    yUtaHEP1racnVl7qcL6IwppZun5muFsHcwTa9EhOdbeauVKGZOt786yRL7MjUpWkMNv4dA
    6Br5zwahEqFGtKUqX+JUQPHeZOfiRQoBUWrAa/gjj5NNgI7tFOp/RtqPTRdWBWk3CV/QaA
    n2jQBMWOr2wnnrTGRDDarS9m4P+kEs70/B3YxHkZ7rf1PVO2Ky+h8YrKzFe5ML9uYmoooG
    Nj0W2ce69tdivcvcB4O/nqVDGRRb9MZAgvDioWBvUcDn7TDOYH3VRAfJ3m3/hHfsQx/kfz
    0mMyqaXT6so9/lg5Yeuu+FdnwEUp3OX516ep7NrAZVy/F8WcCWHu3C2Eq3HXrwNzu+2TKZ
    GM2aSLqF128X1QD5dUSPP55ts6wBWtnX8VNlu27EiPRiyyrSTly/0/oteQnA24x3AQa3km
    EeVm6BApj3uwneRPvJ4UNRjqZ3nJzvbaaiu4RgBJKvvLZcqUV7bP+p1VE3/DOUHfJO0flS
    zr+b97AnW9ox2FCtrN51tQV7JjwlX2F1nnRqCTCtSalSPsS5S92jio1vNV8G78x3k+fbiI
    TRnQO6iePNvYg12YgOdRlwbeL7eeqw3jnOp9N9rYqUaE9atwboRXysIv8Wiw
X-ME-Proxy: <xmx:vIHYak5opkajdHLvaXR5msfr_8VBsIgR2EyyzZvp5o_WTZr7dzA37g>
    <xmx:vIHYaqcQ9ES_l2enZo1jQ2uIU6eV5yTuYuZbCQ3vSSJ9fDyO5RKBWA>
    <xmx:vIHYagmhtQ-FjFkYyX5xknAQo47VkwX9i73nYd9ZX-M7Dpt9AtCvCQ>
    <xmx:vIHYav83C2SKVO84e-QGQQfogkRDLA6tK4OtOGqryy23jhIJ4OWHOQ>
    <xmx:vIHYar3OOgd-nJUs5WF9i_OXsUxBB3bUtDqgnW_axXkcqwbdk_vVo_qR>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 21 Oct 2026 05:11:23 -0400 (EDT)
Date: Wed, 21 Oct 2026 10:11:23 +0100
From: Kiryl Shutsemau <kirill@shutemov.name>
To: shaos <shawnq1@163.com>
Cc: akpm@linux-foundation.org, Mike Rapoport <rppt@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Peter Xu <peterx@redhat.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [BUG] mm: userfaultfd RWP drops a populated shmem PMD
Message-ID: <atiAML2RPQlCEhbB@thinkstation>
References: <20261020110759.960089-1-shawnq1@163.com>
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
In-Reply-To: <20261020110759.960089-1-shawnq1@163.com>

On Tue, Oct 20, 2026 at 11:07:59AM +0000, shaos wrote:
> Hello,
> 
> UFFDIO_RWPROTECT_MODE_RWP can return success for a present shmem THP
> mapping while dropping the PMD mapping instead of leaving the
> populated page resident and write-protected. The next read refaults
> the page and completes without a UFFD_PAGEFAULT_FLAG_RWP event.

RWP only traps accesses to present PTEs. Arming a PMD-mapped shmem THP
splits the PMD, and splitting a file PMD unmaps it, so nothing is left
to protect. Populating the page table would not help: the PTEs are
empty and there is no RWP marker to put in them.

I think the right way to deal with it is for userspace to register the
range with UFFDIO_REGISTER_MODE_MINOR as well, and count the MINOR fault
that follows as an access.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
