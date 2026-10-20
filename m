Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=84.16.66.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792506004;
	b=wtVa5eR4RX4cwTtQqycU4cwyBshM6PZFlDGJKmDGscl2VpE2vPdZ0oF6kQF1YFKQC9i3
	 dPXb557RT1vMW5yeRwqLaAULVh5Ig5N1+HBcnq1UYmYzL4Q45Vw5jONaQvctgEq1zTatw
	 gKxqga/WaODEXiXw+w0xTZOvcl0cYHsWcY4bLlVoQfB9UQ0Qcy9Ny2RvFIadpDFKmMKsR
	 SEn6qT8g9MgvI/UF1xT58/z4s38RrGFNgGe3dKgxVIgdh5wJacjInxu8j33vDD9YUlJEU
	 oyt2KswBAxDC/IEcauQhTF+7To9k//DrEOBLnRN7AvbFt2tiiZOx1JaVgJtJVsVCyDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792506004;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Infomaniak-Routing;
	bh=MmtTgqf0itXurfWR15iP0g1i4zaJ4RksSWrfdHa2AsY=;
	b=UC3RAcjeBFOacnPU+jaOjL8BNck3OBkh1JH/8OLEv3LVOGMMiLzSBUYU3c5zAQxyjvCe
	 TPEPcWWNcoy1wV9Rjo9NosTb82NtkL9mJuqqSXzDyJbG70PWjqZW38niWuJUVBNfmDFwu
	 qvuqyzPtxLDiuiRbIWv4MNNFAZJZy3RCgfHy170aBLpn7mDUINW5yIU5YZq9S3xGHv3TZ
	 LFYCtz1sOANKPaujvBfBzbGbkgJ+shOgMgcnnVy1VUs5s/1cg+BrJviWD1mnRlIz1UPZu
	 ho20DS0o6r2Ckrw5EduBzILnKZ+kVUcRfx6YUtIgu15dYD3R2cuH51ZAnP5P1lT9dqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=digikod.net;
	spf=pass smtp.mailfrom=digikod.net;
	dkim=pass header.d=digikod.net header.i=@digikod.net header.a=rsa-sha256 header.s=20191114 header.b=pm2MmCyU;
	arc=none smtp.remote-ip=84.16.66.174
Received: from smtp-42ae.mail.infomaniak.ch (smtp-42ae.mail.infomaniak.ch [84.16.66.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F7F7606AA07
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 14:20:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F7F7606AA07
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=digikod.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=digikod.net header.i=@digikod.net header.a=rsa-sha256 header.s=20191114 header.b=pm2MmCyU
Received: from smtp-4-0000.mail.infomaniak.ch (smtp-4-0000.mail.infomaniak.ch [10.7.10.107])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4j8F1D5QRwz12nT;
	Tue, 20 Oct 2026 16:20:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digikod.net;
	s=20191114; t=1792506000;
	bh=MmtTgqf0itXurfWR15iP0g1i4zaJ4RksSWrfdHa2AsY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pm2MmCyU8YXiPamKx0lObCB9pvTVIlEXncTSl5f23Ff2IQe8yAtHVrBWS0ez9x7TE
	 BinDUl/slMZxi7jYkDul31p9lT1xkGAAcQuhReVSO7TabHY0O351oNdroaYEDSLATX
	 nLwPRZuXF3GcX3QZ7AjiHHvDq+N5hC1ZGc9VjIxI=
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4j8F1D0BrLzLwb;
	Tue, 20 Oct 2026 16:19:59 +0200 (CEST)
Date: Tue, 20 Oct 2026 16:19:58 +0200
From: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
To: Mark Brown <broonie@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Paul Moore <paul@paul-moore.com>, 
	Christian Brauner <brauner@kernel.org>
Subject: Re: linux-next: manual merge of the landlock tree with the security
 tree
Message-ID: <20261020.oa9oezae6aX6@digikod.net>
References: <atdvaWI6T-HXhtix@sirena.co.uk>
 <20261020.eethaeluo6eK@digikod.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261020.eethaeluo6eK@digikod.net>
X-Infomaniak-Routing: alpha

On Tue, Oct 20, 2026 at 04:14:01PM +0200, Mickaël Salaün wrote:
> On Tue, Oct 20, 2026 at 02:40:57PM +0100, Mark Brown wrote:
> > Hi all,
> > 
> > Today's linux-next merge of the landlock tree got a conflict in:
> > 
> >   include/linux/ns/ns_common_types.h
> > 
> > between commit:
> > 
> >   436485132d236 ("Automated merge of 'lsm/dev' into 'stable-7.4'")
> 
> I cannot find this commit, is it a new one from linux-next?

Ok, it's a new commit from Paul, part of his pull request.  I guess I'll
re-create my merge commit...

> 
> I had to create a merge commit because the LSM next branch is too old,
> so I followed the previous merge resolution from linux-next, but it
> looks like today's merge commit is different than the previous ones.
> 
> > 
> > from the security tree and commit:
> > 
> >   0cbc5a0d65b05 ("Merge branch 'lsm/dev' into master")
> > 
> > from the landlock tree.
> > 
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
> > 
> > diff --combined include/linux/ns/ns_common_types.h
> > index 47a5cfe2326a3,fddc62be3b626..0000000000000
> > --- a/include/linux/ns/ns_common_types.h
> > +++ b/include/linux/ns/ns_common_types.h
> > @@@ -116,11 -116,11 +116,11 @@@ struct ns_common 
> >   	struct dentry *stashed;
> >   	const struct proc_ns_operations *ops;
> >   	unsigned int inum;
> >  -	struct ns_tree;
> >  -	struct rcu_head ns_rcu;
> >   #ifdef CONFIG_SECURITY
> >   	void *ns_security;
> >   #endif
> >  +	struct ns_tree;
> >  +	struct rcu_head ns_rcu;
> 
> The previous merge (from yesterday and before [1]) was moving the
> ns_security at the end of the struct but this new merge commit moves it
> before the ns_tree field.  Do you know why?
> 
> [1] b6926a7ca6e5 ("Merge branch 'next' of
> https://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/lsm.git")
> 
> >   };
> >   
> >   #define to_ns_common(__ns)                                    \
> 
> 
