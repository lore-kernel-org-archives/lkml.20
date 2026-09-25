Received: from mx1.secunet.com (mx1.secunet.com [62.96.220.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE1E2488747;
	Fri, 25 Sep 2026 09:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.96.220.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790329546; cv=none; b=mb/TLLs2LYXcdhhK8Rg9rTRHC//6pOE2dZnoKPpy8ST3Th92stxAEQEF3Qt9YwvDryZ/UFaYZDTIJG7crNYkw1pV87jZHwM2CpturAnpW88vVx4Q5jSvI4U8K5p5iefduYj9ORODi4xvfw3YJ1GQrjxqublzcVeoJLmxVRnM3j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790329546; c=relaxed/simple;
	bh=Gk3KEwoNdVkNLaUQGfjUzepkRcJDtZDob8GBGRUuPZM=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fr1SK8aFpkS4+X6vA5vNbioFVLLV4ZcWlpWo0YfGBpq059QUwx90Ida/RWTIcretNQHk9/vRUNEBjqo9uvxB6HF9xFfFr2Y6hXrQK2YDX1LoI50VUk98kCFPztU61H0DPlAvJGPeqUQVlFVYgHzMfKBWVL1GSkKwOlIPwMADxiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=secunet.com; spf=pass smtp.mailfrom=secunet.com; dkim=pass (2048-bit key) header.d=secunet.com header.i=@secunet.com header.b=kP0EylWx; arc=none smtp.client-ip=62.96.220.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=secunet.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=secunet.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=secunet.com header.i=@secunet.com header.b="kP0EylWx"
Received: from localhost (localhost [127.0.0.1])
	by mx1.secunet.com (Postfix) with ESMTP id 7B5BE20868;
	Fri, 25 Sep 2026 11:45:40 +0200 (CEST)
X-Virus-Scanned: by secunet
Received: from mx1.secunet.com ([127.0.0.1])
 by localhost (mx1.secunet.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SLOs8AkC4HnL; Fri, 25 Sep 2026 11:45:39 +0200 (CEST)
Received: from EXCH-01.secunet.de (rl1.secunet.de [10.32.0.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.secunet.com (Postfix) with ESMTPS id 67A1920826;
	Fri, 25 Sep 2026 11:45:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.secunet.com 67A1920826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=secunet.com;
	s=202301; t=1790329539;
	bh=+zsID+YNLVMpvn/Y4C+0Iw1icYUKhvsDBV6TthUIFJE=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:From;
	b=kP0EylWxVhfHY51mlkbKMt1Gq4y8AIwGGaF+hFno2mEVDs5t9oyHJ2hT5VMli59XH
	 HVUA6M93AcZ5CquPVzO6s5vYCRqXK+s6InBRkrSF7KJLWgv4bgT3sG1PLcuEbvY5oj
	 ZA9acH1DIQ6y2kdmyhwAq8AV4blmkB8EnUB7TZ8+8l8iZFTnG2MJGZNJ9+zRBH9ieA
	 cxH88oLxNwUiA6/t3obKOd7kc7F63meSvnTYutx81AKdopq7Jz43hK5yRMy/c8u9A4
	 xXhmnm1D8jwAXQ9Hzy6GlHr8h6EKM7xB//A0KJwPY74SPlT43M8F9kV1whsB0SNxnR
	 rrJcZmtcQFcsw==
Received: from secunet.com (10.182.7.193) by EXCH-01.secunet.de (10.32.0.171)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 25 Sep
 2026 11:45:38 +0200
Received: (nullmailer pid 2310753 invoked by uid 1000);
	Fri, 25 Sep 2026 09:45:37 -0000
Date: Fri, 25 Sep 2026 11:45:37 +0200
From: Steffen Klassert <steffen.klassert@secunet.com>
To: Pedro Falcato <pfalcato@suse.de>
CC: <cve@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-cve-announce@vger.kernel.org>, Greg Kroah-Hartman <gregkh@kernel.org>
Subject: Re: CVE-2026-93105: esp: do not unref managed frag pages in
 esp_ssg_unref()
Message-ID: <arZCwVzLNkdLwqIj@secunet.com>
References: <2026091746-CVE-2026-93105-78df@gregkh>
 <arY-pm8tfEzTjEI5@pedro-suse.tail5790ac.ts.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <arY-pm8tfEzTjEI5@pedro-suse.tail5790ac.ts.net>
X-ClientProxiedBy: EXCH-03.secunet.de (10.32.0.183) To EXCH-01.secunet.de
 (10.32.0.171)

On Fri, Sep 25, 2026 at 10:30:02AM +0100, Pedro Falcato wrote:
> On Thu, Sep 17, 2026 at 05:16:22PM +0100, Greg Kroah-Hartman wrote:
> > From: Greg Kroah-Hartman <gregkh@kernel.org>
> > 
> > Description
> > ===========
> > 
> > In the Linux kernel, the following vulnerability has been resolved:
> > 
> > esp: do not unref managed frag pages in esp_ssg_unref()
> > 
> > esp_ssg_unref() releases the page references held on the source
> > scatterlist after the AEAD operation completes.  It calls
> > skb_page_unref() on every frag page for an out-of-place transform
> > (req->src != req->dst), and in the error path of esp_output_tail()
> > (already_unref == true) on the request's own scatterlist.
> > 
> > This is wrong when the skb carries managed frags
> > (SKBFL_MANAGED_FRAG_REFS).  Managed frags are owned by a zerocopy ubuf
> > and the skb does not hold a per-frag page reference; io_uring SEND_ZC
> > with a registered buffer attaches the bvec pages this way via
> > io_sg_from_iter().  The rest of the stack honours this invariant:
> > skb_release_data() skips the per-frag unref when SKBFL_MANAGED_FRAG_REFS
> > is set, and skb_zcopy_managed() is the guard used at the other unref
> > sites.
> > 
> > esp_ssg_unref() is missing that guard, so for a managed-frag skb it
> > drops a page reference the skb never acquired.  This can underflow the
> > page reference count and free a page that is still in use.
> > 
> > Guard the function with skb_zcopy_managed() so both unref paths are
> > skipped for managed-frag skbs, matching skb_release_data().
> > 
> > The Linux kernel CVE team has assigned CVE-2026-93105 to this issue.
> > 
> > 
> > Affected and fixed versions
> > ===========================
> > 
> > 	Issue introduced in 4.11 with commit cac2661c53f35cbe651bef9b07026a5a05ab8ce0 and fixed in 7.2.6 with commit 26b6b14c7a0368e317a1e9fb5144ebe6f8d495cf
> > 	Issue introduced in 4.11 with commit cac2661c53f35cbe651bef9b07026a5a05ab8ce0 and fixed in 7.3-rc1 with commit 21697720ff43b8dfa25b8e8d9ca7f56f4597fc80
> > 
> > Please see https://www.kernel.org for a full list of currently supported
> > kernel versions by the kernel community.
> > 
> > Unaffected versions might change over time as fixes are backported to
> > older supported kernel versions.  The official CVE entry at
> > 	https://cve.org/CVERecord/?id=CVE-2026-93105
> > will be updated if fixes are backported, please check that for the most
> > up to date information about this issue.
> > 
> 
> I think this CVE needs to be rejected.
> 
> commit 0fda52de8bbd4ca9a852c8a7ef6536cf82bd71fd
> Author: Steffen Klassert <steffen.klassert@secunet.com>
> Date:   Mon Aug 17 07:17:58 2026 +0200
> 
>     Revert "esp: do not unref managed frag pages in esp_ssg_unref()"
>     
>     This reverts commit 21697720ff43b8dfa25b8e8d9ca7f56f4597fc80.
>     
>     The patch does not fix the issue completely, so revert for
>     now and wait for an updated version.
>     
>     Signed-off-by: Steffen Klassert <steffen.klassert@secunet.com>

This is now fixed by:

commit f89416eb3db151170a6f3c6dfc5239d26cdce4d2
Author: Maher Azzouzi <maherazz04@gmail.com>
Date:   Mon Aug 17 14:37:52 2026 +0100

    esp: downgrade zerocopy managed frags before mutating skb frags

    On the out-of-place output path (esp->inplace == false) ESP rewrites the
    skb frag array: esp_output_head() appends a trailer frag and
    esp_output_tail() replaces the frags with a destination page, both
    referenced with get_page().

    When the skb carries zerocopy managed frags (SKBFL_MANAGED_FRAG_REFS) the
    payload frags are owned by the ubuf and must not be referenced or
    unreferenced individually, but ESP mutates the frag array without ever
    downgrading the skb.  This breaks the managed-frag invariant two ways:

      - esp_ssg_unref() walks the source scatterlist and drops a page
        reference for every frag, including the ubuf-owned payload frags,
        pushing their refcount below the GUP pin bias while the pages are
        still pinned, i.e. a use-after-free of the zerocopy pages;

      - esp_output_tail() installs its destination page as frag 0 with
        get_page() but leaves SKBFL_MANAGED_FRAG_REFS set, so
        skb_release_data() takes the skip_unref branch and never drops that
        reference, leaking the x->xfrag page at packet rate.

    Fix this the way every other frag-mutating site does (__ip_append_data(),
    __ip6_append_data(), tcp_sendmsg_locked()) and call
    skb_zcopy_downgrade_managed() before ESP touches the frag array: it takes
    a real reference on each existing frag and clears SKBFL_MANAGED_FRAG_REFS,
    so the per-frag unref in esp_ssg_unref() and the frag release in
    skb_release_data() are both balanced and no mixed-ownership frag array is
    left behind.

    Fixes: 753f1ca4e1e5 ("net: introduce managed frags infrastructure")
    Signed-off-by: Maher Azzouzi <maherazz04@gmail.com>
    Signed-off-by: Steffen Klassert <steffen.klassert@secunet.com>

