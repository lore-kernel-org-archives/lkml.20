Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793812165;
	b=1U309PrscPzVpDDkRou/elfRqep56/XyGNyRMtG70/D9/Po4IbzYYjXSCq39OBimy4aO
	 FGrbM1E6MhjxcTlLms5NjNRDSQbMqX8erHjdNFQobKeBL26yU4elbTt5qVEz+rmJ7FF5Y
	 lQjScQFZx2pI5r3KFBU1/bZaaS1MnouVah4nU3qXFUkmoCQu7B7nLPhYVCw6noCj3ltZN
	 f3dVS2asB4pobXPrIbh6LGnzTI4ZM82ueeR6sl1i7+Tmkf33IrehjxDVG3SvdFsSSTTtk
	 FeqV4ZcnqC0y6PlDBjTFgqt+5l928RsLLH/e4IWKlklO0RJ4P6fgEuKAsiyUvjTogvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793812165;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer;
	bh=rKSitA4GhO3iXo6/sM1DqbwM0oZP8831TgqTTx7U8Yw=;
	b=h81zJ07Xly9zPS0Ve90eRHqfoDEZnf2rIVNPvuMo/2uFvAIHEWGFksFoXsrZA/zEik4W
	 wzi7lltvEGUJ2QJSqyjniWpTrQooY9DdEAyOHwQX7pkjInRt6XLrccq2k/qaSZd4fJb+Q
	 Tv/rTpslYI51xMrUYCyxz5e2ZDmKZ8AOuQ+iSTVYF+DyK89J9Ct2krHFEvDvZKtrh3sSB
	 gf9NQuLw57a9hniPEtctENyblz+EU6juq0Jabkf7Nv19COxzuhGJGfv5QLzMyBPgzbWYC
	 cUMPGKjlHyWtaCROPD8PlkFhlXICVG8ie+/VCwgyv7Cjy0RkEW1Us/SDnNjTtgE/Esg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZO+bMQM2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D949606A32D
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 17:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZO+bMQM2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B9DF1F000C1;
	Wed,  4 Nov 2026 17:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793812164;
	bh=rKSitA4GhO3iXo6/sM1DqbwM0oZP8831TgqTTx7U8Yw=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=ZO+bMQM2HPlq92f7QNDpBuxeZ+BfI0Cg9C4IcKYdsvwAtqDeicKjU0j+Ex7z2Ug2h
	 iAcK43Oug7C/9Yhilc8KJ6DqyN0QyOdXsYtzGLcUyj4e9vkx2b/rsY1gr6+ksOMcx7
	 R2ije2b9dYDCOqNznuUrfA0mjC5b0j5tjyS2Gg3D+DFZKV3ToMsR9Jo36cIJ/j3Vn0
	 y3OAx6kwWKkr3as4pmXDWQTz+E6TfSb3Zu7/Um8YRfxPPXR0sQgQgnZDBiqzZwlSVX
	 AIbFqs9vx5gIwa2J4XAesfziIs2wiZPh6lNYEmv2NcW20tLhNcdqYtNcp0BLbyJELh
	 zBZ8xrMULVd8Q==
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2] mm/memfd_luo: don't use memfd_pin_folios()
From: Mike Rapoport <rppt@kernel.org>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>, 
 Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org
In-Reply-To: <20261103172251.2348370-1-pratyush@kernel.org>
References: <20261103172251.2348370-1-pratyush@kernel.org>
Date: Wed, 04 Nov 2026 19:09:19 +0200
Message-Id: <179381215936.28814.9050829645096838793.b4-review@b4>
X-Mailer: b4 0.16.1-dev

> memfd_luo takes a snapshot of the folios in the file's mapping. To make
> sure the snapshot does not go out of sync, it pins the folios in the
> file via memfd_pin_folios(). The pinning also migrates the folios out of
> MIGRATE_MOVABLE to make sure doesn't land in KHO boot memory or in a CMA
> region.
> 
> memfd_pin_folios() does not lock the folios. So it can race with
> shmem_writeout(). A folio returned by memfd_pin_folios() might already
> be in swap cache. This happens to work but is fragile. memfd_luo looks
> at folio flags and index on a folio that isn't in the memfd's page
> cache.
> 
> In addition, memfd_pin_folios() needs the caller to allocate an array of
> folios. memfd_luo does not really need that since it will vmalloc
> folios_ser and store the information there anyway. The folios array is
> unnecessary overhead.
> 
> Finally, memfd_pin_folios() fills in holes in the memfd. This makes
> preserving sparse memfds very expensive in both compute and memory.
> While this patch doesn't yet stop filling in the holes, it sets up the
> infrastructure to make it simpler.
> 
> Fix all this by walking the page cache directly using shmem_get_folio()
> with SGP_CACHE. This returns a locked folio with an elevated refcount.
> memfd_luo holds that reference until the memfd is unpreserved. This
> blocks compaction, migration, etc.
> 
> There is still a need to migrate folios out of MIGRATE_MOVABLE page
> blocks. This is because those might be CMA or KHO scratch. memfd_luo
> will hold a longterm reference to the folios so it will block migration
> in that pageblock. Introduce memfd_luo_migrate_folio() to do this.
> 
> Also factor out folio unpreservation logic into memfd_luo_put_folios()
> and use it from memfd_luo_unpreserve_folios() and from error paths in
> memfd_luo_preserve_folios().
> 
> Since shmem_get_folio() always returns uptodate folios, drop the folio
> zeroing logic.
> 
> This change also improves preservation performance, shown in the table
> below.
> 
> |------------------+----------+------------+-------|
> | memfd            | baseline | this patch | delta |
> |------------------+----------+------------+-------|
> | 4K pages, 32 GiB | 748 ms   | 600 ms     |  -20% |
> | THP, 4 GiB       | 0.59 ms  | 0.59 ms    |    0% |
> | THP, 16 GiB      | 2.99 ms  | 2.61 ms    |  -13% |
> | THP, 32 GiB      | 4.83 ms  | 5.21 ms    |   +8% |
> | sparse, 32 GiB   | 8695 ms  | 7269 ms    |  -16% |
> |------------------+----------+------------+-------|
> 
> Acked-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> Signed-off-by: Pratyush Yadav (Google) <pratyush@kernel.org>

With a few nits below

Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> +/*
> + * Move a folio out of ZONE_MOVABLE or CMA, so it can be held until the next

"held until next kernel" - here and below - I feel that something is off
here, but can't pinpoint what exactly.

> + * kernel. Called with a reference on the unlocked folio, which is always
> + * dropped. The caller must look up the folio again afterwards.

I'm having hard time parsing "called with a reference" sentence :)

> +/*
> + * Look up the folio at @index, allocating it if needed, and make sure it can be
> + * held until the next kernel. Folios that are not longterm pinnable are migrated
> + * out first, retrying a few times if someone else has them isolated.
> + *
> + * On success, returns 0 with *@foliop locked and holding a reference.
> + */
> +static int memfd_luo_get_folio(struct inode *inode, pgoff_t index,
> +			       struct folio **foliop)
> +{
> +	int err, busy_retries = 0;
> +	struct folio *folio;
> +
> +	for (;;) {

Won't
	for (retry = 0; retry < MEMFD_LUO_MIGRATE_RETRIES; retry++) {

look better and the body simpler?

> +		err = shmem_get_folio(inode, index, 0, &folio, SGP_CACHE);
> +		if (err)
> +			return err;
> +
> +		if (likely(folio_is_longterm_pinnable(folio)))
> +			break;
> +
> +		folio_unlock(folio);
> +		err = memfd_luo_migrate_folio(folio);
> +		/* Someone else might have it isolated, retry a bit. */
> +		if (err == -EBUSY && ++busy_retries < MEMFD_LUO_MIGRATE_RETRIES)
> +			continue;
> +		if (err)
> +			return err;
> +	}
> +
> +	*foliop = folio;
> +	return 0;
> +}

.

-- 
Sincerely yours,
Mike.

