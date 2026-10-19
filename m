Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792421804;
	b=m02hKRCtsfRf3CbQaH1Qef7BqOwjY2luRkY4SqA/pUiU1j/QHt1Joocq1cyl8Npujio+
	 V17pPRJKjlfJ5NCoIKyOUZZQfbX/IktBGtu0wM0axNFqoNmr8eTUSDnvRFYHVR/ryKn1H
	 MeulESyWf+Sv3aozoo0XsYcSobChQb5OkzfP4k3/bImCOfp92O/VYCKBlkJ+05OHs7mY9
	 GqBjHfHBxWAgEF29cKxffk5z7kl3pyEBAKGc/uAS1MwFwWbHx4ycT6SEFlF9TbcHtvVyL
	 g9xIPA2R1NfmQlVBOrqcFkmQuh8W+mPkiEpK9en/WQzPVMwY+ozqvF91NYpZusW4PJw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792421804;
	h=Received:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=vJKWEXJHZfF0BggswatoUj5xyndbeG3MBJPDa8wHg/Y=;
	b=Y/51m4Qkb7jdBtGBtP7Kmoz/n67Ecy4EvbxK3D7j/X8oOK7YXKLHLBiSRKZY4JAIq5GS
	 M3GwUDFdmggPrLFDCIbQndLlzzCUmxfG9aKta2so+3b0JKwWVT3CdN1wLL3zxBjrYpGIT
	 C6dDLjD/9PKWpfH60m7qWwJcDKgMH9SSQxMjFgr9hMdmZPKIMLJd9gH1ZKPgRtd/pwGSA
	 sadn7iQNfeKNlBftyG5akwuay0yebbkd6gWT++gMgarInebJ2OdUWjxMXDk9NBjzD6K9T
	 Z7mFo2xuATkIzyb3P6bK0eGmNySCVuMUo0UxXB9s5ORst87YBs84Q18uDQoDnszCX2A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=L286vrqT;
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
Received: from aws-us-west-2-korg-listserv-1.web.codeaurora.org (ip-10-30-226-211.us-west-2.compute.internal [10.30.226.211])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96B6B60724B2
	for <linux-kernel.vger.kernel.org@localhost.mlmmj>; Mon, 19 Oct 2026 14:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=L286vrqT
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C183A0EB8
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792421804; cv=none; b=nps+kXukkT7+AGzkYM65n9/Osw9Cq1hFMoalipUvawfgNNVwHx2aKg443Ab1NMyheB6UtVqFHkOyJ60SQOigAMrY2TwvCipcOWyEfZ/mdJlNKfVq5P/SSLM2TBnPiW/EgC4ID+0yNFUuaFnxT0RTbMRkXc5Lgx1dNAh7NP2DjGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792421804; c=relaxed/simple;
	bh=u2tKfwJJB5e+aehW1DXNufVLzIp2GEmIlBWnRfLHRIo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DcPbHZ5evY1kR7vdX7nj3Fbu60T4sjlNJVdOWqli4+wKSvWMMJ0+7c8TejZKWCwLHTUbPjud502atyZgGzy23Nr/KRqVwuhc6EmV5r1NV39cYjyG8GKZ+eRlZa6iembCkFcKu92SStixCRvM7D3iWhsJD7g6txU13nlEl9TE9dA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L286vrqT; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49d05d51553so15352735e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792421801; x=1793026601; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vJKWEXJHZfF0BggswatoUj5xyndbeG3MBJPDa8wHg/Y=;
        b=L286vrqT8T6jLBeoez8OooEpdAjbQEiY+tq7E/WbKpPzFgIx/2BPvl1/dJQuaeUzjh
         J3f66zeCNjRzfjoo+QQmwZW7e26FAnK2Jofd3oMrHR1dh5Qvl7uh/bSpfoelIA4ck4Ll
         Cays0x8EFufCSWM4edqZY/XITfUtDhy46JUF0RxIZHrjbCXEftmxDw++foAYjXaOQp9w
         Vd+vTdCsHISJlyz4kDELZOm3djmYW7/6Oepo1SGlvCHOWJI7++hBUteJNXJHGa9PJbxi
         4kzBE5f8vES9sEC9dmyNwPVD1ai38DNWIC65XCh2yGyL/nVcORYQmX2m1v86Q+tlmM8K
         BvWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792421801; x=1793026601;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vJKWEXJHZfF0BggswatoUj5xyndbeG3MBJPDa8wHg/Y=;
        b=jkZUWr6IDYvdL4i5IByGE8j2hgpNWTZ4ZTAfbfAQ9uuUIdE/IBnPVKM0d5OkWnmnXL
         cutvLA7oREpc9CyOXWDb+9amnQ6CYJCX1WqZhajv9+5+s4qEGJTYgPw12+YrBvfTxGFM
         MLSqO16OakR0aBXDXRaBPa6iSZpf9GO5UXpwcZMnPwXtavqrfUWeQCAb+yM/Tb5eFS86
         DSSUncZohSkINMcFkFblX06s3TCIQU7FOsPIkXytEHYET4YGFnD1kEBE528/35XO6wLm
         PWEcPD4/ArA7QzPIP3fWXK8LN20rEchKu0v/m48A0PCKJmgYO0WB7EpnmfEZN3NNh3lM
         nE7Q==
X-Forwarded-Encrypted: i=1; AKwUvBzS024oUVIQkkbrXaub2exDvdm8htfknegIq3SC5q+V4h21Q4qNKNtEVrvlUVOeMfwuU2NNoPk0QQL7vEQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIMV5wo0/Fefepgrd6LfnQDkUQAY23EFZwk8+wHrcwtTFwhtcLd
	CB6TuK1oY8ADuuF4trTpZvqhk0San1DaF+f/G3cRiy5bPnf6sF1kWDjB
X-Gm-Gg: AYBFou24kjDj6UgFPWIzr0/Fwas39CbPrgoH/YA3F3QdXmzqenLEbjhDpnvBRxzDFxk
	fNinPwhPE+Sq/rXTG4kLZNV+rD6N//QyNyhHVM+9XKYuUrWpKbLx7pPrngX/n9b1jMO58x70IIW
	iecHFUv2mFsosSQn2OmU0xbNKdjgoCWf8naKOJFLV2br8BUeSKNW9i2LuwEMtNMkxwU6Abb1pys
	dLdKEcCMdXtKEgZ6AKq+nfcaQ3MBegxttDHYzOjHtfLekvdOqVlz4aoFcsTq1mJBuXbOKTZkgYX
	djI8y5w7YqsBirQkQABe6HQIw0Z/rZz3NDWqh2avElT0iE4SxGqXQMOhIrt0ZH014gdKzT1eEtH
	TONNDqWN8L/Nl7ckPoLMn6zVFVojAO1i8NUEiN9/tBJjlq/502wI1xt2VdVPHYB8UslSEyUCQ2Q
	VWdDCNDsaeVRkt/Y5V91B6OTVhlbFpid5YisqdPrlA3bBrvh58iCnUCLwcrKVgeWe9vdk=
X-Received: by 2002:a05:600c:548c:b0:49f:dc71:e609 with SMTP id 5b1f17b1804b1-4a1d7610f2dmr171252085e9.20.1792421800470;
        Mon, 19 Oct 2026 07:56:40 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4c4fc4sm20913100f8f.15.2026.10.19.07.56.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 07:56:36 -0700 (PDT)
Date: Mon, 19 Oct 2026 17:56:26 +0300
From: Dan Carpenter <error27@gmail.com>
To: SJ Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-mm@kvack.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] tools/vm: rename tools/vm to tools/mm
Message-ID: <atYvmj4ZKlOfphJ2@stanley.mountain>
References: <atYOvqkdVSgjXZVM@stanley.mountain>
 <20261019135355.87175-1-sj@kernel.org>
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
In-Reply-To: <20261019135355.87175-1-sj@kernel.org>

On Mon, Oct 19, 2026 at 06:53:54AM -0700, SJ Park wrote:
> Hello Dan,
> 
> On Mon, 19 Oct 2026 15:36:14 +0300 Dan Carpenter <error27@gmail.com> wrote:
> 
> > On Tue, Jan 03, 2023 at 06:07:52PM +0000, SeongJae Park wrote:
> > > Rename tools/vm to tools/mm for being more consistent with the code and
> > > documentation directories, and won't be confused with virtual machines.
> > > 
> > > Signed-off-by: SeongJae Park <sj@kernel.org>
> > > ---
> > >  Documentation/admin-guide/mm/idle_page_tracking.rst | 2 +-
> > >  Documentation/admin-guide/mm/pagemap.rst            | 4 ++--
> > >  Documentation/mm/page_owner.rst                     | 2 +-
> > >  Documentation/mm/slub.rst                           | 2 +-
> > >  Documentation/translations/zh_CN/mm/page_owner.rst  | 2 +-
> > >  MAINTAINERS                                         | 2 +-
> > >  mm/Kconfig.debug                                    | 2 +-
> > >  mm/memory-failure.c                                 | 2 +-
> > >  tools/{vm => mm}/.gitignore                         | 0
> > >  tools/{vm => mm}/Makefile                           | 0
> > >  tools/{vm => mm}/page-types.c                       | 0
> > >  tools/{vm => mm}/page_owner_sort.c                  | 0
> > >  tools/{vm => mm}/slabinfo-gnuplot.sh                | 0
> > >  tools/{vm => mm}/slabinfo.c                         | 0
> > >  14 files changed, 9 insertions(+), 9 deletions(-)
> > >  rename tools/{vm => mm}/.gitignore (100%)
> > >  rename tools/{vm => mm}/Makefile (100%)
> > >  rename tools/{vm => mm}/page-types.c (100%)
> > >  rename tools/{vm => mm}/page_owner_sort.c (100%)
> > >  rename tools/{vm => mm}/slabinfo-gnuplot.sh (100%)
> > >  rename tools/{vm => mm}/slabinfo.c (100%)
> > 
> > Is there a reason we left the tools/vm directory even though
> > it's empy?  Is it for backwards compatability or something?
> 
> No, I think this patch didn't leave tools/vm/.  I cannot see that on my tree:
> 
>     $ git log -1 799fb82aa132fa3a3886b7872997a5a84e820062
>     commit 799fb82aa132fa3a3886b7872997a5a84e820062 (HEAD)
>     Author: SeongJae Park <sj@kernel.org>
>     Date:   Tue Jan 3 18:07:52 2023 +0000
>     
>         tools/vm: rename tools/vm to tools/mm
>     
>         Rename tools/vm to tools/mm for being more consistent with the code and
>         documentation directories, and won't be confused with virtual machines.
>     
>         Link: https://lkml.kernel.org/r/20230103180754.129637-4-sj@kernel.org
>         Signed-off-by: SeongJae Park <sj@kernel.org>
>         Cc: Jonathan Corbet <corbet@lwn.net>
>         Cc: Shuah Khan <shuah@kernel.org>
>         Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
>     $ git show 799fb82aa132fa3a3886b7872997a5a84e820062:tools/vm
>     fatal: path 'tools/vm' does not exist in '799fb82aa132fa3a3886b7872997a5a84e820062'
> 
> If your local tree has some git-untracked hidden files under tools/vm/
> directory, the directory might not be removed.  That could made you think this
> patch left the directory?

Ah, yeah, you're right.

What happened was ChatGPT told me to type:

	make -C tools/testing/selftests/ TARGETS="vm" run_tests

That command is outdated since it's supposed to be mm instead of vm but
it creates an empty vm directory...  PEBKAC on me.

regards,
dan carpenter

