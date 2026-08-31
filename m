Received: from mail.hallyn.com (mail.hallyn.com [178.63.66.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C81469842
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.63.66.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788189132; cv=none; b=M5v93f9s211bDUPoGXNAi8FRZphcXTkytFVLW5LhUPdyJoqjE069X6TRYlZWkujhO1SRfhUCpISlXoPVfzLQpEuUL+B+Ik1YdKXkoHpHlCzkp3bdsvjnWN6b1yETC+XSU/LhiFMQZpS/FYa0DY1tXTp9wPGGfE4lTS4RaqqfHjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788189132; c=relaxed/simple;
	bh=UOxF4uAecyxu6YdNqVw87fetpz4t1OqvC2ZMi1NSM+E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m2RlJKDUqMxq0fOFrCkw8ALjrQ5A9B7ypEbJWQEEFAVSqKxrynuZ83zOZWqAoR90gYgE6bvoETPzAtfwaVBSnQIb3QzmTRDZkmdyNCQqj7AXa/EF2Wtu/LwCWnIYS7hmBfKcR923OiIMuU3JsDvtErNadf9VIEnmB7kKaDbq53w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hallyn.com; spf=unknown smtp.mailfrom=hallyn.com; dkim=pass (2048-bit key) header.d=hallyn.com header.i=@hallyn.com header.b=vbNU5+A4; arc=none smtp.client-ip=178.63.66.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hallyn.com
Authentication-Results: smtp.subspace.kernel.org; spf=tempfail smtp.mailfrom=hallyn.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hallyn.com header.i=@hallyn.com header.b="vbNU5+A4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=hallyn.com; s=mail;
	t=1788188697; bh=UOxF4uAecyxu6YdNqVw87fetpz4t1OqvC2ZMi1NSM+E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vbNU5+A4LzCjEozEb+k3EJR/dMl0IB9f3O60kHwpKvv9n6SXnnOQo1FaGgQazV1C1
	 amfZPEbDC4VPJoK7mXx5JNmf+RzrPLQVTEbuPw2RkZ4vPxtxLI4xPDIVSE/fgwxH/z
	 wfJcunpmJxoO7tvZvldM/CRK4+6ukh7yvsU7OFTMj8It4sG/6nSExns7q+NEhe1vtQ
	 pGviGyh7skfLenPaIDZsH5L4AjTECIhcVasNkBXpW108H0q+iBypG6Xjv+3qKg5n6Y
	 7Xqyyge2nxCxPCXIInCye1zISn1YQ9FfK+XIFL70t/r7xAbhC4ncQTyQhOBVyjba2b
	 5lmxVsH5ukEdA==
Received: by mail.hallyn.com (Postfix, from userid 1001)
	id 89F63494; Mon, 31 Aug 2026 10:04:57 -0500 (CDT)
Date: Mon, 31 Aug 2026 10:04:57 -0500
From: "Serge E. Hallyn" <serge@hallyn.com>
To: Yazen Ghannam <yazen.ghannam@amd.com>
Cc: "Serge Hallyn (AMD)" <sergeh@kernel.org>, x86@kernel.org,
	linux-kernel@vger.kernel.org, mario.limonciello@amd.com
Subject: Re: [PATCH] x86/amd_node: Fix PCI device reference counting in
 amd_smn_init()
Message-ID: <apWYGS4fd/FsCDGN@hallyn.com>
References: <20260824175003.335196-1-yazen.ghannam@amd.com>
 <ao0TIKRXBMTzRXOC@shallyn-amd>
 <20260825135206.GB1500179@yaz-khff2.amd.com>
 <20260825143538.GC1500179@yaz-khff2.amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260825143538.GC1500179@yaz-khff2.amd.com>

On Tue, Aug 25, 2026 at 10:35:38AM -0400, Yazen Ghannam wrote:
> On Tue, Aug 25, 2026 at 09:52:06AM -0400, Yazen Ghannam wrote:
> > On Mon, Aug 24, 2026 at 10:59:28PM -0500, Serge Hallyn (AMD) wrote:
> > > On Mon, Aug 24, 2026 at 12:50:03PM -0500, Yazen Ghannam wrote:
> > > > The local "root" pointer is a temporary variable used during the device
> > > > search. Therefore, refcount related to the search iterators should be
> > > > cleaned up after the search is complete.
> > > > 
> > > > Use the __free() cleanup macro to ensure the refcount is decremented
> > > > when the temporary pointer goes out of scope.
> > > > 
> > > > Additionally, increment the refcount when caching a root pointer. This
> > > > ensures the in-use refcount is separate from the temporary search
> > > > refcounting.
> > > > 
> > > > Fixes: 0a4b61d9c2e4 ("x86/amd_node: Fix AMD root device caching")
> > > > Reported-by: Sashiko <sashiko-bot@kernel.org>
> > > > Closes: https://sashiko.dev/#/patchset/20260806160159.230453-1-jason.andryuk%40amd.com
> > > > Assisted-by: Claude-Code:claude-opus-5
> > > > Signed-off-by: Yazen Ghannam <yazen.ghannam@amd.com>
> > > > ---
> > > >  arch/x86/kernel/amd_node.c | 5 ++---
> > > >  1 file changed, 2 insertions(+), 3 deletions(-)
> > > > 
> > > > diff --git a/arch/x86/kernel/amd_node.c b/arch/x86/kernel/amd_node.c
> > > > index 0be01725a2a4..312adf73313b 100644
> > > > --- a/arch/x86/kernel/amd_node.c
> > > > +++ b/arch/x86/kernel/amd_node.c
> > > > @@ -247,7 +247,7 @@ __setup("amd_smn_debugfs_enable", amd_smn_enable_dfs);
> > > >  static int __init amd_smn_init(void)
> > > >  {
> > > >  	u16 count, num_roots, roots_per_node, node, num_nodes;
> > > > -	struct pci_dev *root;
> > > > +	struct pci_dev *root __free(pci_dev_put) = NULL;
> > > >  
> > > >  	if (!cpu_feature_enabled(X86_FEATURE_ZEN))
> > > >  		return 0;
> > > > @@ -258,7 +258,6 @@ static int __init amd_smn_init(void)
> > > >  		return 0;
> > > >  
> > > >  	num_roots = 0;
> > > > -	root = NULL;
> > > >  	while ((root = get_next_root(root))) {
> > > >  		pci_dbg(root, "Reserving PCI config space\n");
> > > >  
> > > 
> > > Will this leak the ref taken on the last get_next_root(root) in the
> > > first loop?  You might need a pci_dev_put(root) before the root = NULL
> > > above the second loop.  Or I could be wrong.
> > > 
> > 
> > Yes, I think you're right. Good catch.
> > 
> > I'll send another revision with your suggestion.
> > 
> 
> Actually, this isn't an issue. An exhaustive search ends with a NULL
> pointer. The PCI search helpers would have done the 'put' on the last
> device.
> 
> This also means that the second 'root = NULL' is redundant. I'll remove
> it in the next revision.
> 
> Please let me know what you think.

Sorry for the late reply.  I think you're right.  Thanks!

-serge
