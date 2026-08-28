Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5DA345199C
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 13:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787922438; cv=none; b=hCl5tDjnTjN7OR3/+PCTxuf4SqQWQffohD5xrmqUVHwaow+Lx+wiE7h5b/aPD5lr9FgydYhJUkW9V/RMunStkUKGZoZQXslu7jjARV7NRgM5Lpt1XIuGExr2sxIbYHe/jzuriE91CYJ4t5ca2XdBqb/uxBS+vlQt8mcWsB3TdXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787922438; c=relaxed/simple;
	bh=FGXU9hCiXREruV/PI5jXJyYiXmjNo/cxlv1BBKCwWyI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ooJtxxJc8RnCfKIu5j/hjQaI3JOcqWobjoV7fy+rXZO70h34Xuy9lr/f0N/JHeJg0STJ7UvpOgxvMuAhtBVya5BP+cRTxn5FSJJL+kr+zCKAxehM+UjRDYhhHLPNIfaP8QvYLRiTPJeeH7aSHh0QdL/GVI5jK0SqwBvwpxXs8UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HRm7LaJJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HRm7LaJJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D408E1F00A3D;
	Fri, 28 Aug 2026 13:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787922435;
	bh=1YZkfUvCoyZHLzyn7ea4/HyPggA3fnupl8cIKNYULpk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HRm7LaJJEXTiDiGTKCZo5l2w5kN1TcYSeJ9E48rQNiz6LBaQNFB2bKP4AHBipiq8h
	 YVxk60l2Cn6/hAurga4ATD+2RfrWaG4ySotIPL7Qda9iFoOVBwRrySKhWI8pVMwDPW
	 lCDMccPUxYtiMTthIsnC6uiu4nk97j9lDetGFeNSCozb1O9uQ4k+wY1cGB85jY0D/9
	 HG/1aEtypMZePyyCdCDCBGjvrTFQevBEIc9mmBs0A7lESv4ehPD3de7jcMP8UmyqWS
	 CpNiIA0gRbnxwzBMFGltYkgXGmzpSvL10YP+gw9pKHpmgRulYhQx1YLoWpnGkiSuur
	 62G+Oi3GG3uow==
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.ams.internal (Postfix) with ESMTP id 8728C1980050;
	Fri, 28 Aug 2026 09:07:09 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Fri, 28 Aug 2026 09:07:12 -0400
X-ME-Sender: <xms:_IeRajK6RgmVJ46FUccIDzQvRWEdjch6S8dmzrIwx7mNvrjRLqG7zg>
    <xme:_IeRaj5d4x5Ci1XWPIS3TCKpiy900dh4rtEnSxl0BmtA2Hvig2tLEFQgvutnIBzvt
    q-3uKArInhGg4BUL7xC7LGPevdSWe3B556Hsl5I7aVUYZBSs3HQWTNv>
X-ME-Received: <xmr:_IeRarQx3u1kQ-ANzyD1p3Zn1y5BMkxZDV4rCBfD6g3cXh-AC77MPiRcsKQ>
X-ME-Proxy-Cause: dmFkZTG28vjlh/jrZIe0v56Xspzegu6WkfWJNqumN3G8EyZWPE+j12ot5ZQ3BXZTGKKstt
    ZACDkBdMBDCfrwUht/IM7FreRRPd/qVf2YDZto2H7EgwYkYS27XFH+pXmy/RPr+F+MDrsf
    L+M6NlBc7fDRfJh75IZbb7iLqdI3hKiB5ge75aGaLPYMy9mJJzFOP7p05J2IydJrP/bG4c
    REgPSHsV2nJfQa6/FnBSFrR3eMVRFHifx+Yr8b64twmyBRJDjYQw6NhC3aieIKvXOMWsy+
    TO3LcTQWOtP630Du3jcNhUsiowPO+C1L8ObqZY8hPhIDBpkKC3Uz1fq/qkSZgG4wHmyNiX
    /YsWahIsRswdahPS/RnCCuJqsB6QI9chbdBNs2y8P7C3T99TFvj81/pjghD3wPX4HK46da
    kIlJ4yxv2DsBYdzz88j+nU4qQ5fSYMcudHkWfwlJI6RaXwB8iYWuMY/GVCXuAA3ew9Hutn
    tRBjvnnwqr0KtyFuc1yF7Hmm+J4qAf+YYGCnYgSB9DQDByGDAiWz7yfrLAatv4oB3zv/vH
    FA+guGwkq2fcEAqa1rqntNvVw3v2Q4sz8ggF0bvtDruPLp2A8/9IEnu+HNxu4Q9dyll+ke
    hRhuzhqFAVi9qeaU79QXUHkzTljt91CieuIiTqkTwGV5JSGXglvecUZ+eKuw
X-ME-Proxy: <xmx:_YeRalA8l6VZYNUAL523U4zKBUeKGTVSBMqVhBRXp4dByHijVRZrQA>
    <xmx:_YeRaurwvuIXQV4TICc9DpTz0uopuoDCICelKcfyiSBlqbYvg0p68g>
    <xmx:_YeRav8TUHC98idjHudjlc7xIlQ1JOP7Od1yroJF3wU565HPgpM_5g>
    <xmx:_YeRavCLtUu7799PTwqr0lEzWreAQyfzE7VLVjdXIhhJFZxK-zf-Ng>
    <xmx:_YeRahHffYdExHOR8YLyQK-sgTeSh9Ne3OqfShBzHiGSV2BlMVVT6m_e>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 28 Aug 2026 09:07:08 -0400 (EDT)
Date: Fri, 28 Aug 2026 14:07:07 +0100
From: Kiryl Shutsemau <kas@kernel.org>
To: Lance Yang <lance.yang@linux.dev>
Cc: jthoughton@google.com, akpm@linux-foundation.org, david@kernel.org, 
	ljs@kernel.org, ziy@nvidia.com, baolin.wang@linux.alibaba.com, 
	liam@infradead.org, nico.pache@linux.dev, ryan.roberts@arm.com, dev.jain@arm.com, 
	baohua@kernel.org, usama.arif@linux.dev, shy828301@gmail.com, zokeefe@google.com, 
	hughd@google.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH] mm/khugepaged: Don't collapse uffd-minor-registered VMAs
Message-ID: <apGHG9LJtDpe2kdG@thinkstation>
References: <20260828005004.2870750-1-jthoughton@google.com>
 <20260828094703.11081-1-lance.yang@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260828094703.11081-1-lance.yang@linux.dev>

On Fri, Aug 28, 2026 at 05:47:03PM +0800, Lance Yang wrote:
> 
> On Fri, Aug 28, 2026 at 12:50:04AM +0000, James Houghton wrote:
> >Userfaultfd minor faults provides userspace with the ability to manually
> >install PTEs with UFFDIO_CONTINUE. Right now, khugepaged collapse can
> >map holes in the VMA when a naturally-aligned THP is present without
> >explicit action from userspace.
> >
> >This is a problem, as it bypasses userfaultfd minor faults that
> >userspace is expecting to handle.
> 
> One basic question first. Should MADV_COLLAPSE refuse to collapse a
> UFFD-minor-registered VMA, regardless of whether all PTEs are present?

I think the line is not between MADV_COLLAPSE vs khugepaged, it is if
vma->vm_mm is current->mm or not.

In other words, we might want to allow collapse if workload itself asks
for it, but not for khugepaged or *external* process_madvise(MADV_COLLAPSE).
is_khugepaged is not the right proxy.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
