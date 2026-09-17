Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB264AAC72
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 19:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789674801; cv=none; b=Wg1sO0KffOjPDsc+pPzJHc4z0NjIngEjAlSmKY4qK+OXzgXp8GVkxXPHk2EVTAgI6V8Bex5EHM25xgsMI0HR46sSKcNeSc2LALySdBG7FvNJG0dGYHRgvvSqUHHxvpo+DlNweMA+QtcvkvWRe8EKxfgUJZY/ilj4iBM9HNIhfxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789674801; c=relaxed/simple;
	bh=2pT1vVhIA9dOAdtSzKkR5lCWOD+5pETJvHxl4DhSfqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WxIR4pL89jA2x+LO/CheDtoOuII2E0JXJ7JE1CaxutJaEaXA5P6LTL40h1SPh8TMEGmmRmYQozY6MQb8m3MCKqVSnamVLJ78QJMf4vy9VaobdmuZ1yX3N5nU2eRrvdHwQZZ1MHSiYuKYmQGRHlQV9GsLMOXY1K3F3wPOy8z30WI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F9ciFUqs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F9ciFUqs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7B3A1F000FF;
	Thu, 17 Sep 2026 19:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789674799;
	bh=/bB1zlv4QaH8z0SQSRals0luwjzNLh9auRznOToW/aY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=F9ciFUqs6yvARJwh1q1NVSH260DNVgqwTys+21WMhSZUgeoN1SIZVT1wsT+hx+MYS
	 /cV9cA7fZX7rTDcwdJP32zhtjmJd4a7GVTIfHNcW0lupQKjheg3R6zgVOujyVI2+/p
	 +WmjNeNTmkvS+ePJdDwP80RkXDDDYCFO012RJAy+kPQd6GZ73KiScgOGep1bSAU1wf
	 HSKqA9YkKAqPMzvUyQ1h4jN35JPaNzL4+ecuKTJPgzltQJ2RMXHAI3JTj4e5TewuAr
	 e1Btl4XCdz1WSn11PlxTnBIBmEIA5AkdROX/K9jEP/TD+4gcwPQZSayJkUHw2JCp6G
	 N2+2t+GT3Sviw==
Date: Thu, 17 Sep 2026 13:53:16 -0600
From: Keith Busch <kbusch@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>, Arnd Bergmann <arnd@arndb.de>,
	Nilay Shroff <nilay@linux.ibm.com>, Hannes Reinecke <hare@suse.de>,
	Maurizio Lombardi <mlombard@redhat.com>,
	John Garry <john.g.garry@oracle.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Eric Biggers <ebiggers@kernel.org>, linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] nvme: work around all -Wformat-security warnings
Message-ID: <aqxFLAyJPD4D1EVC@kbusch-mbp>
References: <20260917061459.1486026-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260917061459.1486026-1-arnd@kernel.org>

On Thu, Sep 17, 2026 at 08:04:03AM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The sysfs code passes two string variables into sysfs_emit(), which is safe
> in this instance but causes the compiler to warn when -Wformat-security
> is enabled:
> 
> host/sysfs.c: In function `cntrltype_show´:
> host/sysfs.c:682:9: error: format not a string literal and no format arguments [-Werror=format-security]
>    682 |         return sysfs_emit(buf, type[ctrl->cntrltype]);
> 
> Print these using a "%s" format like all other instances in the same file.

Thanks, applied to nvme-7.3.
