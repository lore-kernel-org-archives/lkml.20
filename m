Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8623F660E;
	Wed,  2 Sep 2026 21:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788382829; cv=none; b=nACz/1s93N9Z9r4ZD21WRba2WclkaClT5mYG9t0wH+W2EonX/0uwkJR563E2H1ve7OeWWXyjgSVATrO/A8qtwuPjhDXKBNOwPALbEU9JBU5VbrzmUL/TTeUBqtrElOWHwqmjfhPF/S4rpNcWbbpiSh2pihmeEzQ8b7rKRIxNohs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788382829; c=relaxed/simple;
	bh=YnMQxYiXpo31SFWbCEX2N3lbv1qIwo4+GDT1GMWI9ek=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=boHmXFUZDj10oIsHeDVoTORVeTT3srzlnF0fXWgbVTh3xCC1j0ia/ETT6wPtWU5ThkMw1QAmkRkeB2hWq1W9OV/S9/VL1xTrgT5H9lf/t1sqqXIGSmIwqXmF3yVSw7ZE6TFg36y/Dz8i4H96p90JwOIbSHlUSt41wdb2yXKujYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=zxscDIct; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="zxscDIct"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B45861F000E9;
	Wed,  2 Sep 2026 21:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1788382823;
	bh=MsJNSqXRRoS8pcHXK2AyLpw0JNoWD/ml5B83WXJiI3s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=zxscDIct0jKlbkEv6RlL8ZXVT1bNyk0CMrnPckNefK1Y61izBtLk1IOm4TeSnJKfn
	 2XZNGhmhIJ6gaaUWCkw6BMFbEbNji3xBrOt8WfMlrkgE/jowDAGXli7dE5wDli7j9r
	 rPOBCtjJc+Rcopg7Pg+iPcJQa3uy/TbM4w6f4+/k=
Date: Wed, 2 Sep 2026 14:00:23 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: Mike Rapoport <rppt@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Lorenzo Stoakes <ljs@kernel.org>
Subject: Re: linux-next: manual merge of the mm-nonmm-unstable tree with the
 mm,mm-fixes tree
Message-Id: <20260902140023.1ad32ff3c2147b99b49b28c0@linux-foundation.org>
In-Reply-To: <b76cab9b-8e50-4d84-8b93-8d1161542689@sirena.org.uk>
References: <apf4WaZ8D0P6W-FX@sirena.org.uk>
	<apgRMUMN6DVFmJ8u@kernel.org>
	<b76cab9b-8e50-4d84-8b93-8d1161542689@sirena.org.uk>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 2 Sep 2026 13:13:47 +0100 Mark Brown <broonie@kernel.org> wrote:

> On Wed, Sep 02, 2026 at 03:06:09PM +0300, Mike Rapoport wrote:
> > On Wed, Sep 02, 2026 at 11:20:09AM +0100, Mark Brown wrote:
> 
> > > between commits:
> 
> > >   0d171c47f2be6 ("mm/secretmem: properly account locked pages")
> 
> > > from the mm,mm-fixes tree and commit:
> 
> > >   d2c5e077cbeaf ("mm/secretmem: properly account locked pages")
> 
> > > from the mm-nonmm-unstable tree.
> 
> > Thanks, Mark!
> 
> There's some more duplicated commits here BTW.

I'm not sure what's going on here.

Yesterday I rebuilt/rebased mm-hotfixes-stable because stupidhead had
gone and put a merge commit in there (this triggers Linus).  Rebuilt
all branches based on that.  Then at some point (when?) this was all
moved into mm-next.

So shudder.  Hopefully it'll all sort itself out tomorrow.
