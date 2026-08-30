Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19CC302753
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 22:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788130784; cv=none; b=s+U0zIlr4VF5CPmgAB008ZaGKojG67CMWRbJmJ6EsZHq4mrDKRzZSTDebakZ+ZfJH3LCpZEoajnY31rnDxYejU2gYHayPJ8tZ9OjBkpbVK4ndwCgJKHQyk10IO588tqWk58cTPOvF9JXfr2yCX+BgHGpmB1xr0CS3E11tT+R5js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788130784; c=relaxed/simple;
	bh=LtGuYaEAqNAgsHFgjqOyT9TRGzPBKAfYhGR1SQ9jubw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cfh3GT+KbeIlBrkuwYGKdQinQxRj3B3PlM24wHe93YvVol+fkuinxTtQADcdIjExPk3WapjBYgal+Ie9sLMAhkv8RlVNZCiaxjIt2ju5UCJuXOwqpIUcgRKGXwqZFwqbsl627wd8J+/pVfrhwXFmxZMzsOy2P4dgxQhor7d0YgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=MLV2IBOD; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="MLV2IBOD"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cc1ceadbd16so2958077a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 15:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1788130782; x=1788735582; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Kdi3DSPc/O+C8A9e2zv3rCFIPzltKhrlzZn7ufqHIaM=;
        b=MLV2IBODpvM1LigdlK+0aRwXS+5YHk8KSRzXKmOhTH9rhfNo7K06zqBxQeVnfLLpDQ
         38uPBYvBz6IyIe6Oz4vYwj8CdePS+SgSsraa5Jq/EqPKjcbw+P4V9dt9R6wE+/Wzvc4U
         6/aPO0LMD7JUNnUF9XnyZQ0J3M+LoYDzhKQnhumKG+xr5646vyvF94cz4uFwHSXtuF6z
         SgjueH9nJ1VZzAGEKsO3cDYuwuX2osdQlau3/DhvL4AALB0bDNSUxGqKjh2hSU5ygsfb
         Izax8FYChBekmLYk9EBB+jLroTkHKqt8Hs7Sg2S9KvohOXJtdsGdTYV3IXHB7L8Ux/5y
         S4wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788130782; x=1788735582;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kdi3DSPc/O+C8A9e2zv3rCFIPzltKhrlzZn7ufqHIaM=;
        b=d9g2Whh8Sb/bZuLQAW2YKHpMR/OdQWRuhGik2oUxP69CJSwZfixSDZ4fgInItISQ7N
         oSJQow+BLiJmvogMj2nxbTHSAj43fUZo88ONiqAnbH/0CuVPn+qAmRMiCDSO506PKykX
         bLdafmYm6S04GfeOH8XWezcNJI1oCSHPxdNpEcS3qrCqiSh4HUIP6H5kDg8pwSgFphBI
         Jx/3bQsdT5KslPvYXrpgxfLSJjthWV49oGZzliAZ4+OiP5qTs98N4nZq3mXvZInj11SC
         3KY3Jj8k74+8W6wF4EqoP5K9wfu412ARz4ZfmlaQ2U4zC5Qp/ySTQSjhV0XtF/ADon43
         gguA==
X-Forwarded-Encrypted: i=1; AHgh+RpGtO4rxMTs0qON02ZlX8LL54LfblP0s+iUACtBbpYNZo1hwWpVREhE79rUiE/R/NNvUyYXNlzJbRXi/EM=@vger.kernel.org
X-Gm-Message-State: AFuF++nej8DBMstZvB4scy6eeAhQQh1ZE/dkd9eTHf9LbLDTYzX2Nu/W
	Ixh17GKisEQPqBTerXa/3k4dnj7c5zu7aANwBAHz1IGCKZMGOhW8s/gNWycP0MN4Ae5FA8p9W+4
	vXcvn
X-Gm-Gg: AR+sD10mWHHtW9cHLh0jNaO1gfKS/oUhhQ1nbHloUDxDyFzgqx6v0NVdVdqKRHPMvjK
	LOk3HpaF8RsQyrXHPMiTyJ9XYSpXTlZMQ6zWCvbgXQSQjIMz8tfaG224wFqrbUedR6lBNiXZqry
	zntlsiwE1el4DJnv4YUMMGXRcu80Yl1WxboDjfustXcqmLWsHIdt1osN3S+qlJdr5vreaqG3diS
	wvmSIKgkwZ1QZ8F7BZPIVjQqjgdWFnIs7TjqJo0PH6Tqd/pa489JmC5tVrmh0S/MibMk7gYnh5C
	BuRqnERLi7P6NEviw2awRoMOMht4/0GaJhs3hAUaQx6QfdoGqMFDz6ZtIgrSJ7XbiEcqZAxFKpS
	qJ+fsvexQwp2404tdZFKJljFoowx0rFLieL3XKGeB1l5nUNRC/6wWpxv2DEychHFhGfBP8fK4L6
	dyFKzCFBZ7Vatf5RL03OkKDeDqtW0wexelSVAoWmnRlEfNKu7R15Xxx5Ep/e/fDIeGTX+F
X-Received: by 2002:a05:6a20:748b:b0:3d1:3c2:85b6 with SMTP id adf61e73a8af0-3d266570c5dmr31298068637.5.1788130782138;
        Sun, 30 Aug 2026 15:59:42 -0700 (PDT)
Received: from medusa.lab.kspace.sh ([2607:fb90:9c20:7a99::791d])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-3286f7be440sm28921366eec.7.2026.08.30.15.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 15:59:41 -0700 (PDT)
Date: Sun, 30 Aug 2026 15:59:39 -0700
From: Mohamed Khalfella <mkhalfella@purestorage.com>
To: Sagi Grimberg <sagi@grimberg.me>
Cc: Surabhi Gogte <sgogte@purestorage.com>, Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
	randyj@purestorage.com, adailey@purestorage.com
Subject: Re: [PATCH v2 2/2] nvme-tcp: parallelize I/O queue allocation and
 startup
Message-ID: <20260830225939.GC1842415-mkhalfella@purestorage.com>
References: <20260824225648.316962-1-sgogte@purestorage.com>
 <20260824225648.316962-3-sgogte@purestorage.com>
 <c98fe50c-172a-4e53-a30c-5416c40cb23f@grimberg.me>
 <20260830222558.GB1842415-mkhalfella@purestorage.com>
 <4f2d2b60-56f9-4ae3-b38f-bba9754011df@grimberg.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4f2d2b60-56f9-4ae3-b38f-bba9754011df@grimberg.me>

On Mon 2026-08-31 01:44:32 +0300, Sagi Grimberg wrote:
> 
> 
> On 31/08/2026 1:25, Mohamed Khalfella wrote:
> > On Mon 2026-08-31 01:00:52 +0300, Sagi Grimberg wrote:
> >>
> >> On 25/08/2026 1:56, Surabhi Gogte wrote:
> >>> -	ret = sock_create_kern(current->nsproxy->net_ns,
> >>> +	ret = sock_create_kern(&init_net,
> >> I don't think we can just change this...
> > Why we can not change it? Today the error recovery code running in
> > worker thread will be using init_net anyway, no?
> See commit: 1be52169c3488ef98582ed553ab35cefa3978817

Thanks for the pointer. I was not aware of that. What about error
recovery case? I _think_ it will be using init_net, no?

Also, Will the change to sock_create_kern(&init_net) break the fix in
commit 1be52169c348 ("nvme-tcp: fix selinux denied when calling
sock_sendmsg")?
