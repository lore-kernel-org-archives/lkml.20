Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 682F5442FDA
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 10:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788344872; cv=none; b=QGuMlPVald2L4jq+mPd0o2BnfrtxXelTcKm7SnonkWOdnPK9g6DXOlsMnkh9P3ZmpC97KBK53JgWyRgxEqD9bED7nHdGOqGVfwqqeMTLx516j8YtRvXwz49wB5VCtAmFAY4Yn/SFJlqSpMCyls++2hyTXNGUNLuy+QmBIUMZZmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788344872; c=relaxed/simple;
	bh=xuLoMANp1xnrZI1pGPG8MryIFoR+3xJGqxuPNqDtKaU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mAWY8xhAc1kgqQKEozloBTKHK8/EnXtnPEqox8B+va5DDSGQlHDpVSAMP1LOKZlZ8kUq+pL8CCpuIMgLRXKBXH9hQFYztgh1M6tdqVcnnmIPsFVxlFxPiJHMSpqhzLTOlsKgIZmOn85biZs2uKlujWhhzRKDLCQf0qetB1DmQh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gxrxxMiq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gxrxxMiq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 244A51F00A3D;
	Wed,  2 Sep 2026 10:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788344870;
	bh=4yCXEtMbZWf41CPhhN+cCLVvyaPkES51f+1dJDg0tIg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gxrxxMiqXHG8N+4yKerHwBB/pvp37MgeQ92XNt95yPGnaobrGGz46ksvWkPW2DLi7
	 JVw0ibJxWDoinw6JtAfFib2MJsPthELI4EPvAQUKpEXTC6AsPpSCneAqe35vkL9Fm+
	 oDU2w8BOHWqqdf6CBoIie+QXlSuBOc1cShS7fHnbbJy8I3KoEsvyGFE/QTpyqq8RZk
	 BSqOOd4ngpoIcOWpwyzpiTIqlH35RhWXyHvyrlkYD/ooebmkyD0qnJDPaHk/Wr3/sK
	 Jzr/zxEibvBrKFg1IIj4GCQ4ly6sFOKpb0muaLRpqYvk12XoOGP91tsZIiDdnj1pf6
	 f4LxdrDTOAJBQ==
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfauth.ams.internal (Postfix) with ESMTP id 914911980059;
	Wed,  2 Sep 2026 06:27:44 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Wed, 02 Sep 2026 06:27:47 -0400
X-ME-Sender: <xms:IPqXage4KrJbErzdbwvgCEGiSFp8li7OfCo3m2a1K9hR4o3Zp7eA1w>
    <xme:IPqXaklvHL40Z8-6jIuQmKUHV0BiVBe8U-y0ju3t9aiOLwR3pyWpbgsauZbgd0vWm
    RLvIMhK54LOi_MsZZMXbOf1uJzY-sFatYT7ppI5vcvUrejJcGXGzhsV-g>
X-ME-Received: <xmr:IPqXasFSxzaGD4AvAJEdG0rgaQLGuswn0uETU682P4TKInmYm6QubOPKm6Q>
X-ME-Proxy-Cause: dmFkZTE0RVQvOarTCWlrgtMFcY4g+ghLUV5agAcTe10FZuLW7XPlGE4qzbdXSL9ojwVExl
    s3MhKzqrOpq+fsQp4m96k5OEOv92yI9u2cuHCBmZKj7bkqBMUCNP5lLOmEQBwdow0uaEIT
    76+/U2gmiWeVlVsju3SI8TFoEL5ILBspKcSCXfXEDfiW00iu1Zjm3huIPyUxAV/n0Wq7P+
    zmwosbm36xpLKPnkqTXYzZGzTnRxQh/NH5eMlfEWL2aRt98x9DbRRgkHLWXH299/xp9wYw
    qLt9x634AldHJAJH+UHhFAWUvBb17VO9KmArtvcPcRePPRkFj51h/spo059p7H3HTWlsWF
    Ngj2TcZq0L8u135ZyFq5+kuJMMOJC7j/27l74E/BIvE3Sr3VzP1FtPIZ4Q65SISHrFzGZP
    eLpTcVxRDW7ILUxYu1SrevDqByaWieTsIJe10FOkcAS5X/FxeTb6aCVtQQBlQiANCroOWA
    81XwwoGLvzPOkcD/bBNl4/gEJIiiEN5lwLt8V6fJhzgNkXiEEQ8zQI/ntYHKANVcj+Dre4
    WP92rJfsZ4JgnME7kEZNHxqIXcghGK8iWrI6dMl/XenZAdlXyvANZ64Mvwnc1rig6JoLjb
    HJ2kByDjZhWqJ0oenkLPJb00cKNHb5aw3zAvoGOU3SsGe+Fq8xw4CVWBGIeQ
X-ME-Proxy: <xmx:IPqXagcFjpYnvYrDK9BXR-p7DIMTpR9qNbx2e0ce7PCwWh13CJAFcw>
    <xmx:IPqXaliySbyJqk84XJOxAu8st28BmZlNd18wsIvem2Ob6Rrjiz62uQ>
    <xmx:IPqXatXtTRGExWE-w2UAq82OtVBomezN89sgRrlY5GvUOaPIOS_ivQ>
    <xmx:IPqXapJLb2Z5cA0YcOaVmPvWnbTybMBwKrMNL7nd1BjIPti3x9OvXQ>
    <xmx:IPqXagqjrxZesAiLhFkhEnRe1FpoqPbMHYhSazBROA_HNYKFmxXGVnu8>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 2 Sep 2026 06:27:43 -0400 (EDT)
Date: Wed, 2 Sep 2026 11:27:42 +0100
From: Kiryl Shutsemau <kas@kernel.org>
To: James Houghton <jthoughton@google.com>
Cc: Lance Yang <lance.yang@linux.dev>, 
	Andrew Morton <akpm@linux-foundation.org>, david@kernel.org, ljs@kernel.org, ziy@nvidia.com, 
	baolin.wang@linux.alibaba.com, liam@infradead.org, nico.pache@linux.dev, ryan.roberts@arm.com, 
	dev.jain@arm.com, baohua@kernel.org, usama.arif@linux.dev, shy828301@gmail.com, 
	zokeefe@google.com, hughd@google.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] mm/khugepaged: Don't collapse uffd-minor-registered VMAs
Message-ID: <apf5xBqj5560JlMD@thinkstation>
References: <20260828094703.11081-1-lance.yang@linux.dev>
 <20260829052606.49470-1-lance.yang@linux.dev>
 <CADrL8HW3=n8VqW+7YSb2kyhkHidNKGy32+2s7A0OfF+oYoAifg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADrL8HW3=n8VqW+7YSb2kyhkHidNKGy32+2s7A0OfF+oYoAifg@mail.gmail.com>

On Mon, Aug 31, 2026 at 09:51:33AM -0700, James Houghton wrote:
> On Fri, Aug 28, 2026 at 10:26 PM Lance Yang <lance.yang@linux.dev> wrote:
> > >On Fri, Aug 28, 2026 at 12:50:04AM +0000, James Houghton wrote:
> > >>If userspace implements post-copy live migration using userfaultfd minor
> > >>faults, this situation is currently possible:
> > >>1. The VMA for guest memory is userfaultfd-minor-registered and nothing
> > >>   is mapped in the page tables.
> > >>2. A stale copy of a page is present in a naturally-aligned THP (from
> > >>   pre-copy live migration).
> > >>3. khugepaged collapses the mapping of the THP, installs a PMD.
> >
> > Ouch ... I missed this earlier. The problem is real, but this commit
> > message describes the wrong trigger.
> >
> > Background khugepaged calls try_collapse_pte_mapped_thp() with
> > install_pmd=false, so it cannot install the PMD or trigger this
> > sequence. MADV_COLLAPSE passes install_pmd=true and installs the PMD.
> >
> > So the problem described here can only be triggered by MADV_COLLAPSE,
> > whether it comes through madvise() or process_madvise(), no?
> 
> Oh yeah, you're right. In our downstream version, `install_pmd` is set
> to true for the khugepaged collapse path; I missed that it was false
> upstream. Sorry about that. :(
> 
> So we can definitely remove cc:stable, there is no bug here.
> 
> WRT the semantics of process_madvise(MADV_COLLAPSE) and normal
> madvise(MADV_COLLAPSE), I think it makes sense to always disallow
> collapsing of UFFD-minor VMAs, whether MADV_COLLAPSE comes from our
> own process or another. UFFD-minor faults are intended to be resolved
> only with UFFDIO_CONTINUE, and until someone asks for it, I don't
> really see a need to make MADV_COLLAPSE actually work to resolve minor
> faults. I don't think userspace can *rely* on MADV_COLLAPSE resolving
> minor faults either.

It is safer to go with stricter policy: reject always. We can always
relax it later if there is a use-case and reasoning about the interface
is solid. We don't have it yet.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
