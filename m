Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EDA23DD86C
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 14:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789567370; cv=none; b=prbiMKrQDTzaa0SGfPLSzQnYUhqLNBWs5zKxIjiNvUjkKp1J6mA8j9SyS4dRQw2YDdGwaa+/H2+cyU5QPFozYOEfsolqeZuvr8uMgVGiC2zLHcXfGziYK6tC+M3nlpY+avPo3NYRSoFo2DfGhPMxTljmqiEsFsVDnzz3vwz+xXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789567370; c=relaxed/simple;
	bh=lk414wfpQrq5vp8DsPm/BTXmLqK0llvlOvGO27hPcTM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QzRwWu6aY8E7Eo0zv6QVzDY/ycW7aRIkOTy5vRr/RQNj3RgvvTsGuRWrb4ljAkd8jN7BXEGTjVDZ6Rveyn14Yf5H+4hYrjCfGNhCrBKNjyEDNcDDfIuqzY/vMXTyQgrsf9PHq9pJLHrbOMVtjo3XLkj3l01qJm//grPU31oWVWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=D20xEvqI; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="D20xEvqI"
Received: by mail-qk2-f13.google.com with SMTP id af79cd13be357-93a0299c787so75294385a.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 07:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1789567368; x=1790172168; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QK04b22kulIc7bZXmZ0HJttAO0Z2ragkIvYz0XNFgzE=;
        b=D20xEvqIVoJEZfOuPpxfpBrh7OTkvZge2Xf+D6xaIhbZlibxC0E5elhiqMmvLhE0qE
         XgIJqyeMiL+BqQd5xnr26QgzFf00zc2dopCPXw7F+52dzRCohYDgGDrDKs3hv81LMBNb
         e2FJQYP+RAVxXWq8cqzD+mb8drq1isPAKltxToGYrIj5xmqF7+DZ8wUDElozbx4+qWMB
         FWMUMBR9Q2g1pK+09cUyiNtOe8anyw1nAva4Tgem4ThyrXpzmAkq9r0rnm6a1Kj6a/Qj
         +wOkvhKA/qPvaIE+6x3GktGmXQ9bCSJLuf4KBF0eGs0m46hEA2shaMoUe7Pdyc/39+e+
         6X8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789567368; x=1790172168;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QK04b22kulIc7bZXmZ0HJttAO0Z2ragkIvYz0XNFgzE=;
        b=C7ImXmLss2v/+6cCOzch4pBTCkZPi/zF5Dw4+eC2uV3pWSU6KMQsfW35QDdvbn/e4S
         g6GxQH/EBxX4875EVzFjQg1Ujl5m7c93kIdPcIkQAbv6Uinv8lXDrM1Mb3t89LE971sf
         LG01esua86sXonZf6rONQ0F+wkGToesAVyDkNLqRz4bKErtozlKz4zwcqP14l/cEOiei
         Oy1w8YAEQp2xvb7CTpVuRru4rOJ3JuDw02XxLeiiQxfrsNjiv4LwMZUK5jI+V+zTo0KR
         VuUrMjPXFjF1GFUQbqEkkSDBHHg6Nd0UFmv3IkhNeznkJg7mB+vYLIWsR3O9CGbKRnK2
         b9nQ==
X-Forwarded-Encrypted: i=1; AKwUvByZDkRDrw19ZEDxsfyo6zkhqHKKkI46M9kuFrPvp+4RkbuA58U6EBKXT64/+jXvu1h+GRANnD0OyTinBUs=@vger.kernel.org
X-Gm-Message-State: AFuF++lntQabxNVrpEvmJ8Ove+tRnW5Bw4KyyvoU5YHaEdmjSBcICOeM
	zqNuflmgLphtF/BhGQrcf1QgQqOiKxJ9N6i2xXNLSRvoTfVlEvprhWYf/s5rEzrWANk=
X-Gm-Gg: AYBFou00nqs0xZ5NABu0OB0uul4PPTey+NrkmE/dSHeYmwNVxJ9VDyfHu55YyDmDXbf
	pyGYWAv00pNTGmpPxRlf7NDydUDB+PdPsddRSAiiU7euxhKfAqgZv0ZoTAJZ4uGf3KSaV7/WErw
	chsTpc8e3N2noP1Vdyvz2NzLtq8LNmau86wGvAbvSkHBvW6ihPsjFxuvy4USZRWozrBOM5FcT66
	sh6V6Eda0QcW8L7nTJax253OrAwwOSDeYdWB7FrTT9irb4mpWzaNSfhbVCuPEBPhmFPtxqjLUIK
	7/ErPKEt2ghSXvMMUZV+ivx3aFflg3cI6HSFAIf5gCCvMImr8N8OWRTNuuJjt7DwH4XdvNFQDE3
	asFxOXJqtui+ARNSFlVO90QdQctFsIBLIrRwvPBu7PtFUhuf1LoQacYXGCGfUhKdLTbYDaS32tj
	zlrcFg0BviMuB5rJwnMa/ucIZ+ZyODrjXTCb2/j9ATDtp65D35rHrOJm1SL9gZTFIFGtHKX58R0
	0Qi+b3m3Mkr9SFxs/JfVEVe6hTGTQTMHnoP7kFILR1R5VMX09G403g=
X-Received: by 2002:a05:620a:2704:b0:937:19d3:3fda with SMTP id af79cd13be357-93bb785c5b6mr477815485a.28.1789567368038;
        Wed, 16 Sep 2026 07:02:48 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93b780cfa78sm218545285a.2.2026.09.16.07.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 07:02:47 -0700 (PDT)
Date: Wed, 16 Sep 2026 10:02:45 -0400
From: Gregory Price <gourry@gourry.net>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com, 
	akpm@linux-foundation.org, liam@infradead.org, david@kernel.org, vbabka@kernel.org, 
	jannh@google.com, wangjiexun@tinylab.org, sashiko-bot <sashiko-bot@kernel.org>, 
	stable@vger.kernel.org
Subject: Re: [PATCH] mm/madvise: reclaim isolated folios if PTE restart fails
Message-ID: <aqqgeOtYBcRdVqmI@gourry-fedora-PF4VCD3F>
References: <20260912110832.3203902-1-gourry@gourry.net>
 <aqloB0zm3RjJ47m1@gremlin>
 <aqlzzwLOVT79Ti_7@gourry-fedora-PF4VCD3F>
 <aqqTtW3vjfzH8bcY@gremlin>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqqTtW3vjfzH8bcY@gremlin>

On Wed, Sep 16, 2026 at 02:18:36PM +0100, Lorenzo Stoakes (ARM) wrote:
> >
> > relevant meme: https://i.imgur.com/W0N40BK.png
> 
> Content not viewable in my region :'( seems I do not have a loicense for
> that!
> 

google "reading other people's code meme" and find the comic with 

// this is bridge

:]

> >
> > No argument here. This function in particular is really horrendous.
> >
> > I think i'm now 4 or 5 stacks deep on the "Thanks for fixing a bug, but
> > while reviewing your fix sashiko found yet another CVE-worthy bug".
> 
> Yeah, I WISH it wouldn't do that.
> 
> I mean it's helpful to some degree and it finds real stuff.
> 
> But it's _where_ it does that and the workload++ aspect of it.
>

In some senses - yes it's annoying.

In other senses, it's saved me a lot of pain debugging my new work, and
I'm willing to do some cleanup on the way to new functionality.

Someone's gotta be the janitor I guess.

> > I suppose reasonable to say the goto is worse.
> 
> Yeah I know it's all a bit much of a muchness, and obviously my suggestion
> _duplicates code_ which is also not wonderful.
> 
> But the control flow in the function I think is a bigger issue.
>
...
> > I'll spin a v2.
> 
> Thanks!
>

Given i already started rewriting and validating the entire garbage
pile (see other response), mind if i just leave this as-is?  This gets
completely replaced anyway and i'd rather not have to go backward at
this point.

~Gregory
