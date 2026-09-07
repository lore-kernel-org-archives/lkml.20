Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB723909A2
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 10:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788776888; cv=none; b=BVbiQfIjJ3vZGDo4oMwpI/4/CEB6ef3sETbu0GvfggUxpQaNledNf3JrABAk3LEnEzmo4FtaxZuRzP9+o0bLeYA0U/kzEsWE48v00gJFkHYC6L1EGwisGJKsWookdGaC0zoujqm9i+dSImmgtRBMYt0KiiOMo1tZGl1TPrCBaDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788776888; c=relaxed/simple;
	bh=wE0FAqphOt0/OrEtapZkV6hZqCZe/8Fjgb/ta4y8Me0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RSnfjCJ3uR0iJg9qZdr+Hhhu4cy4gI6IEsxb2uEt4RsTd26Y4PqPHQy9afo/0AUdBzdyGRE/PyC+9OSaAYEeqX9OcjpVOvYY3919wdhfO+7wTF/JwqOdwIsD7H0idi3nq309pS3/sv9z9QU1GkBX1X4GdWFC0gG6cVdqTsHsoMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=mcY5I/Uf; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Z5izyY1C; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="mcY5I/Uf";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Z5izyY1C"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id 64559EC00BC;
	Mon,  7 Sep 2026 06:28:05 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Mon, 07 Sep 2026 06:28:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1788776885; x=
	1788863285; bh=f59EBJC/4ov46ZCcEJDi2RPpWdMP2hCDD0qZyQ2pkiU=; b=m
	cY5I/UfwYFSeAQHuzewFLmqdpoFEUWE8AUwUXGpyIWk3U/X3jOecLARtpOHj+gSQ
	NjmfDNVWPu/oznccqL/+5Xh9hN4CIZF52ofRgi+/jNxZrCweIIR9bL2wO2anieT1
	vZh+WY6asXA9up7/4v1K7Qp91tmpg7Wp9UC0xHXiFGsJAsIsIumsq7e2C5t20xF6
	RdmHvJ1gwbdQ2aEepyn894x1TYolXxrzIjhTbCrEurH9RniO1MSQX4Ba29vaoqH3
	kmj9+Wnp1GoL1szROGPkUVHMfdHlv2SpmugHniWz1Zpxi0thtWQF3T9K4YwWFzqV
	5o9TyCSavp4zCpuQymPhw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1788776885; x=1788863285; bh=f59EBJC/4ov46ZCcEJDi2RPpWdMP2hCDD0q
	ZyQ2pkiU=; b=Z5izyY1C0skqDUJfbFnOn+ebPFhIIBFXExxRMGpZWzZfY4Ah5ss
	c8Vlcfymfnhds3zbdOU77p2m1SL9uFfG13kdYR/ccWDOzE9oHwJH35I3I/pacsWz
	SgHU2777P6nP+9JNoe8gs8QI3sF1osgFxf8d9cqWrVJARkiKO6y2K/dSJ9k1QUIs
	t5KEPCzVQfyMFypOaT48rlUmOkHr5hjcxhljb6lv6MNUC+A/Fo+n2EvP9HPfHS8E
	+O+QCu7VSDR7AK7thqactXV3IkEOjQx5aASS7ivMPcN/O821zzJy0UYL34EOkrAa
	hLRwfV9XwMu1XhExJ7265QZ/LMjCbtZmJjg==
X-ME-Sender: <xms:tJGeaoU68yoKoEKdNauhVIokwD-QzoIvT8BQpYex709Cnp5m2TuHRA>
    <xme:tJGeaqMjX2b_OmRAMpgjktF0t30Bq7KPQ8kXdBU4efxdWZOHoDxQiiM0T5Sb5Dm24
    1geywWZnjZVkkFsxvGvX3s5PJQMv0AVudIftIdMpz5qDoMKWbcQ7po>
X-ME-Received: <xmr:tJGeajwwAxT4V_izDNGfW5MaQWjScU3SeMhZ01oJQyQ5ajJQP_soJQOdT4w>
X-ME-Proxy-Cause: dmFkZTEajUuK27hQfEZdWhLtkuQZ3pAPRpnx/tbUwrc/v9QlT7g/7Gy66eqONUzN+j0KBI
    l9/1HIG3BYS2JhiizAePa8ggrFALJu6WrIq5DugLEZ9a7i9lU6Kcy4CsTHxBKoJHFgVZtg
    EoJWTuvYf8HjIhz+N5A9ZZVcXSMS39pLs0Z+g+gnz4US2YclD1wx2uEzQd25YzHXGVhmkH
    1Z/lkmjVpPq44tqalmrZoouDSgm7HOL47Iw2w8Qen0V0rRjW95Xn+RtTBdFs1xc+q7hZPg
    PbWznKtKwvBgZZzoz/0Nn7E7Ph6ChFZkxWNQ7tTQ0sC9kxSKpIFubwJAqwhcS7cSQT+rP7
    ZsvtxuqnS2jfe4UAfb4iqVGGXIAQOV2RKkydq+mrzLybVQMeYKEIFHHnK5FbFzu1O7vDr7
    OFDILwOpljnp2cc0K8Cp1GyfjtVTwUWsz0edZAXiRr6AOjHVEEygfNrHq4DcJYfAu6Ms2N
    H4d5G5GfjQGebOoh6Io3B9H4EFlxevLH5OrQIqRZjD1sCByP77ekxKA74pEbNrWLhQhND5
    cH0rjs+I5KQT7Ue0GQCRGIHm5hTYSfgWf7dWfF3JCIlKsqw0meMCjnLDVKzQnnjR/s7veI
    5rwIRyyh98hRpgiOmvsczZH5JC1Ij6mAm+VfSBKE0Tdv/9pJZoKuexWMkUFw
X-ME-Proxy: <xmx:tJGeavg9KbQZkPJPU2BVND8jY_ugtwEzD8E6HxozUhK3-lXN7-t0_w>
    <xmx:tJGeaqTqw_2psIBP3Yjtji3iJzooW-NGeMx_zgi_j0sRtdpEHVztXQ>
    <xmx:tJGeasPA-XuufJD9MhXSGFAkTn3ew630p-QOCOTZWU_wJs2uih16Vg>
    <xmx:tJGeavGPKAUScomINHIH-7FyDsSbFs0jSHNC38I1Q96FYHf14Ezkuw>
    <xmx:tZGeat52CSqtoFjqX435ryj37GF0Yj6NJHFpPpruDQj2B3-FA-KFMUC4>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Sep 2026 06:28:04 -0400 (EDT)
Date: Mon, 7 Sep 2026 11:28:03 +0100
From: Kiryl Shutsemau <kirill@shutemov.name>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com, 
	Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	"Liam R . Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>
Subject: Re: [PATCH 00/12] mm/collapse: separate a collapse from its callers
Message-ID: <ap6RNHS_ve88ijLo@thinkstation>
References: <cover.1788533997.git.kas@kernel.org>
 <20260905172342.72be31534af21871f8b13f47@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260905172342.72be31534af21871f8b13f47@linux-foundation.org>

On Sat, Sep 05, 2026 at 05:23:42PM -0700, Andrew Morton wrote:
> > Behaviour
> > =========
> > 
> > Nothing here changes what gets collapsed.  Three things a reader should
> > not have to find in the diff:
> > 
> >  - Patch 5: khugepaged fills its policy once per scan pass, so the
> >    max_ptes_* limits and the defrag setting behind the allocation mask are
> >    sampled once per pass rather than once per table.  A table scanned early
> >    in a pass and one scanned late are then judged alike, where before a
> >    knob written mid-pass split them.
> > 
> >  - Patch 8: mm_khugepaged_scan_pmd fires before mm_collapse_huge_page
> >    rather than after it, the scan having returned before the collapse
> >    runs.  Its status field already reads SCAN_SUCCEED for an accepted
> >    table, so nothing changes there; what the collapse then made of the
> >    table is mm_collapse_huge_page's to report, per order.
> > 
> >  - Patch 10: which orders a table is scanned for is sampled once per VMA
> >    rather than once per table.  It cannot widen what a collapse does --
> >    the order is tested again under the lock the collapse retakes.
> 
> So is *any* functional change expected with this series?

No.

The three items here are so nobody has to find them in the diff, and
calling them behaviour changes is a stretch: a sysfs knob written
mid-pass takes effect on the next pass instead of the next table, and a
tracepoint fires a few lines earlier with the same arguments.


> I'm reluctant to merge an unreviewed v1, but this comes close!  I'll
> sit on it for a week or less, see what people say.  Please poke me
> if/when you think it's good for mm-new.

Zi and Baolin have already provided enough feedback to justify v2.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
