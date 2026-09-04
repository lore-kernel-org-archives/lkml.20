Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63AF03905E0
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 23:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788563966; cv=none; b=m5gYvOsrdGNKzicra2k/0ZDmZ64pI+zFLrifOIEj79qdvD0E+pq+1eCQx0im4aI4lAZXYhgaGZjm5NGHn2aEBTfNt9GylvAL02nqLeACLV54eWa8TnW59mjXQXkE9Xouz05xIFbFU7xFqLT6+BzAyNbS5jqbKXfEXKYnYZLD12w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788563966; c=relaxed/simple;
	bh=EMddTuz2If/O557kFaVn0pLqsbdE6FjylrqHOOTUqMc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ravsdOcwjyYM/OBPNlTTNlYJ4sOa7ji7iS7q2izD1h1/Cd/C7nABsdnH1iRK4W81JxQ87xrD3m5f/z2aMVlAi26QhQltoc830ANPC60i739qhVdEldGMiVOMhq0ZP1jXcfpqDK+ruZFA0PrzQGTC8EdLbuofG68esB1S7GccUBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=Hfn6sUTg; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="Hfn6sUTg"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-853c947bfefso1329798b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 16:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1788563965; x=1789168765; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PWMdt4xelSS3XutaBqfp0rye6ojxHME7341jO04CtRw=;
        b=Hfn6sUTgCRNlXmyVelGj++vNtqeD8ZwOFVwIydcVNrGM3bgsaKZLDXkynsjQrc9LX7
         O1N4wdCzNdGjdxq3LeyMInVNdJEB9g/on3fHnfMHBGqCp+hZmYD84EmX/gmMvacbdK8i
         PTRG+OlonkekZ6YgVzWYdRYSCxQ6OyyVr9bfPoUo71pK9EMBU1xCBPpNEaPobO7X+NeX
         2ke0pji9c5IIw7O0Dh/Zl8I23EMXU4sj2nu+dbOfxYexlFhrSN25kDorTD52XSdrhYdw
         GqZSjLDYR8Z/vSljIz5K5v9Kr/wiRLt3kg/RF+zkKQhh83Nor3sfRpKb6KH3BJ8Rch3M
         LHtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788563965; x=1789168765;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PWMdt4xelSS3XutaBqfp0rye6ojxHME7341jO04CtRw=;
        b=SH2f7f746ay82I+z52gJGOI0LodClVjlf7PuKEesYRb9hHuPnderSQxrgolUGZ0zWR
         4v+R16WNqFkmfG48FTt484ZTeDiXRDK5fGww5Qx/A5t6boXXZYeM7OGmBG4Exsl10XHg
         WI1Jb0dFBQ/mpIwoVcx1y1SfCvLFPvw/OMtwMtTwgJ9+W6oVdsZapaGN8PIizB12oRir
         KQ25B8Gof/adkuenCE9+m9YOLKq2ZsUTn571+o2+74JSXimBYxxgrQ0TQDyv6TPjcITj
         femS/Yvg3XNQCJik5AO8wiXx9GqMPKfQIY/ij9tQiCi5HProCzgL77lLUZ5sXm3Qp6mB
         Tkaw==
X-Forwarded-Encrypted: i=1; AKwUvBy5f3tVlH6vAM7ahEKK2eSfWx1aZtCEIqj+PtCC1y2Riu8c2Gn2lWzv+s/EwPJPmGWumZi0n3g8u6DXIKY=@vger.kernel.org
X-Gm-Message-State: AFuF++mjhmY/Ft+zyJQsZbbFhgreApBSgZi4x7s2QmVEBfyJVHnONrj5
	roL6nwZzJ90rb6pArpeR1M81X2x0fwvp5uZY/3u0LrMV1fCqX/MTjJ5fQy9sxy0eH4w=
X-Gm-Gg: AYBFou1xFlYmr4AjxkOQATbpbvdeAENz/KrhJybI8itlDP3Qj2z6HQOExlgBGsF9In2
	0m5+J0OqfzQv9XUCkbgXKR/vmHtprvhoj+F+7NAqEJCkK6iFg5OkczJl2iPTScFKJQAoJP3uwm6
	/1XWwupP0DeA03K5xou/DalBMqVBEe3qOC7jvmmtS5znJZAJjhf/QvpvCi0RVDA1ZKyD07UiUQy
	TrEs/y3DlIN3+P1NezZaw4eanvOTcTsfH8NVhuGRvMYAAud/z5yP7wd5HVeQvaixzMYK0SqkjUZ
	shRevPjbLmaycsLiGYmvp9WXxpJ24NgGFfFrQBHOxK9ptNS4R45jgxRYASeGzlyp/WinN+P8yJQ
	HJNo22b1YdR/WmvUKv+wFW3qgXIjiPW1oZQTtJfXxevdv9BNoUVYBuZiWytpdfZBCorKwbzkCHf
	hfYWCaD/nnl9wXwRG0Kq1Ltip7uB6Bl5sPMtyMoZECK3roJ4eEHlaUH0+/G/tO0SFay+Q=
X-Received: by 2002:a05:6a21:7117:b0:3bf:8a0e:dd99 with SMTP id adf61e73a8af0-3da215aacc4mr17994990637.17.1788563964413;
        Fri, 04 Sep 2026 16:19:24 -0700 (PDT)
Received: from medusa.lab.kspace.sh ([2607:fb90:9c20:7a99::791d])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-333c9db92b1sm8818568eec.9.2026.09.04.16.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 16:19:23 -0700 (PDT)
Date: Fri, 4 Sep 2026 16:19:22 -0700
From: Mohamed Khalfella <mkhalfella@purestorage.com>
To: Hannes Reinecke <hare@suse.de>
Cc: Justin Tee <justin.tee@broadcom.com>,
	Naresh Gottumukkala <nareshgottumukkala83@gmail.com>,
	Paul Ely <paul.ely@broadcom.com>,
	Chaitanya Kulkarni <kch@nvidia.com>, Christoph Hellwig <hch@lst.de>,
	Jens Axboe <axboe@kernel.dk>, Keith Busch <kbusch@kernel.org>,
	Sagi Grimberg <sagi@grimberg.me>,
	James Smart <jsmart833426@gmail.com>,
	Randy Jennings <randyj@purestorage.com>,
	Dhaval Giani <dgiani@purestorage.com>,
	Aaron Dailey <adailey@purestorage.com>,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 12/16] nvme-fc: Refactor IO error recovery
Message-ID: <20260904231922.GF5552-mkhalfella@purestorage.com>
References: <20260712022437.3743117-1-mkhalfella@purestorage.com>
 <20260712022437.3743117-13-mkhalfella@purestorage.com>
 <da754227-87f9-44b1-926b-9b3b6ead6e19@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <da754227-87f9-44b1-926b-9b3b6ead6e19@suse.de>

On Mon 2026-07-13 09:29:44 +0200, Hannes Reinecke wrote:
> On 7/12/26 4:23 AM, Mohamed Khalfella wrote:
> > Added new nvme_fc_start_ioerr_recovery() to trigger error recovery
> > instead of directly queueing ctrl->ioerr_work. nvme_fc_error_recovery()
> > now called only from ctrl->ioerr_work has been updated to not depend on
> > nvme_reset_ctrl() to handle error recovery. nvme_fc_error_recovery()
> > effectively resets the controller and attempts reconnection if needed.
> > This makes nvme-fc ioerr handling similar to other fabric transports.
> > 
> > Update nvme_fc_timeout() to not abort timed out IOs. IOs aborted from
> > nvme_fc_timeout() are not accounted for in ctrl->iocnt and this causes
> > nvme_fc_delete_association() not to wait for them. Instead of aborting
> > IOs nvme_fc_timeout() calls nvme_fc_start_ioerr_recovery() to start IO
> > error recovery. Since error recovery runs in ctrl->ioerr_work this
> > change fixes the issue reported in the link below.
> > 
> > Link: https://lore.kernel.org/all/20250529214928.2112990-1-mkhalfella@purestorage.com/
> > Signed-off-by: Mohamed Khalfella <mkhalfella@purestorage.com>
> > ---
> >   drivers/nvme/host/fc.c | 119 +++++++++++++++++++++++------------------
> >   1 file changed, 66 insertions(+), 53 deletions(-)
> > 
> This is hard to read. Please split it several parst, one with
> open-coding nvme_reset_work(), one with adding 
> nvme_fc_start_ioerr_recovery((), and another one with the rest.
> If that makes sense to you...

Okay, I will take a look and see if I can do that.

> 
> Cheers,
> 
> Hannes
> -- 
> Dr. Hannes Reinecke                  Kernel Storage Architect
> hare@suse.de                                +49 911 74053 688
> SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
> HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich
