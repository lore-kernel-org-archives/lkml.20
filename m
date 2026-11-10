Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794332290;
	b=K4Eo7P/qd7yUzeZHVtJXC9un8pup3apv+1CvNkuKLLJkElKxnAHg8PbO3BfUlggwLKLl
	 9NExCibL/Cq7ExWOTDgSkenyId3Gsw0R+VQyzeKqNUiyYyG1+MSNagtWTiSq/GflVYknM
	 jDws4Fhu2MgSoe82KCb5Cyr1iInoZQE43+dlLoe3mL6ZHT5NwNo51pF1eEzv9HE4iSA0Y
	 0IKf14cOtZzqRMLD+TJjZIXdH8edG8/SPRQ3vzSa5L+ahGi8eXXJNvfruAXLD22nN7WZj
	 IpvKimY1Ak6RQjFbKowfCFmgPOSVGjYtWD/3swx7NlAazVZK6PZ+TzArVQLwaSXxi1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794332290;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=6/eB+/CH5yaEpI1uhM4dFjSsW0sUvRV8va2xHbNL6Kg=;
	b=3l8hSTatutrYrg3mW3j0eLHSt8CRlJY93OMgfC1NypIzZLPKbEQ4bh0i7RMUS+oyOCeY
	 uof/Z1ixT0IrLhVxTgZNATGBPTOEmemkTlKryqPoJ1Mhbt2J4Gj1JCNC6vb2IybgTc+CC
	 Ek3K4EDSo1zaxjD6GEMIC0tV/C60tRii9T1BnxAYaHKEC2XvbW30RiyGoNZr2IYjXYIx1
	 qBcGY7PFMxgLf84lyiB52a7U/4KzzdGUN5CQIoUWCwsRiG/u5FmLvmqHakTzeTQ0NMgIR
	 dv6zAMyU7iaY34sn30s8mjf988zber+YuTUubGRv3NdKewkyhfmZejJ2FN/4KnUBzuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WDEC3wKQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65E9606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WDEC3wKQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 392F71F0089F;
	Tue, 10 Nov 2026 17:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794332289;
	bh=6/eB+/CH5yaEpI1uhM4dFjSsW0sUvRV8va2xHbNL6Kg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=WDEC3wKQyX0hwMUN7w0VPurSY8Nvo/ERaH/+f4RahK/VRm8DW4X2gwlvhh7KTVPcD
	 M1BCzIkLVMIL9ZJYaGK3hVB9BiyTYIK8mAg88QneuGhyvFPARVRjC6tIdUJJ8BPvBH
	 txO0v2O2BXqcz5yMfuH0485bf+bmK8ZDLA4Z+ynQioxlG/HCoIBIpUfLW1Nr9AKDC+
	 PzWNOAj5G3lN37XjPQeNeEtRlMi8Oc9OwVJT0CsDSxxdAIrbUy+//RaNdNL+a6YfzG
	 EEUQ1wiGUUPMeoXetkDh3OZ/8xOdTkUCqOpfLg9RMsOYCt2JFmSKHxZKJ8EOM6H9Sv
	 Q1oK4bFpBW/TQ==
From: Pratyush Yadav <pratyush@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Pasha Tatashin
 <pasha.tatashin@soleen.com>,  Andrew Morton <akpm@linux-foundation.org>,
  kexec@lists.infradead.org,  linux-kernel@vger.kernel.org,
  linux-mm@kvack.org
Subject: Re: [PATCH v2] mm/memfd_luo: don't use memfd_pin_folios()
In-Reply-To: <179381215936.28814.9050829645096838793.b4-review@b4> (Mike
	Rapoport's message of "Wed, 04 Nov 2026 19:09:19 +0200")
References: <20261103172251.2348370-1-pratyush@kernel.org>
	<179381215936.28814.9050829645096838793.b4-review@b4>
Date: Tue, 10 Nov 2026 18:38:06 +0100
Message-ID: <2vxzse18h9j5.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Nov 04 2026, Mike Rapoport wrote:

>> memfd_luo takes a snapshot of the folios in the file's mapping. To make
>> sure the snapshot does not go out of sync, it pins the folios in the
>> file via memfd_pin_folios(). The pinning also migrates the folios out of
>> MIGRATE_MOVABLE to make sure doesn't land in KHO boot memory or in a CMA
>> region.
>> 
>> memfd_pin_folios() does not lock the folios. So it can race with
>> shmem_writeout(). A folio returned by memfd_pin_folios() might already
>> be in swap cache. This happens to work but is fragile. memfd_luo looks
>> at folio flags and index on a folio that isn't in the memfd's page
>> cache.
>> 
>> In addition, memfd_pin_folios() needs the caller to allocate an array of
>> folios. memfd_luo does not really need that since it will vmalloc
>> folios_ser and store the information there anyway. The folios array is
>> unnecessary overhead.
>> 
>> Finally, memfd_pin_folios() fills in holes in the memfd. This makes
>> preserving sparse memfds very expensive in both compute and memory.
>> While this patch doesn't yet stop filling in the holes, it sets up the
>> infrastructure to make it simpler.
>> 
>> Fix all this by walking the page cache directly using shmem_get_folio()
>> with SGP_CACHE. This returns a locked folio with an elevated refcount.
>> memfd_luo holds that reference until the memfd is unpreserved. This
>> blocks compaction, migration, etc.
>> 
>> There is still a need to migrate folios out of MIGRATE_MOVABLE page
>> blocks. This is because those might be CMA or KHO scratch. memfd_luo
>> will hold a longterm reference to the folios so it will block migration
>> in that pageblock. Introduce memfd_luo_migrate_folio() to do this.
>> 
>> Also factor out folio unpreservation logic into memfd_luo_put_folios()
>> and use it from memfd_luo_unpreserve_folios() and from error paths in
>> memfd_luo_preserve_folios().
>> 
>> Since shmem_get_folio() always returns uptodate folios, drop the folio
>> zeroing logic.
>> 
>> This change also improves preservation performance, shown in the table
>> below.
>> 
>> |------------------+----------+------------+-------|
>> | memfd            | baseline | this patch | delta |
>> |------------------+----------+------------+-------|
>> | 4K pages, 32 GiB | 748 ms   | 600 ms     |  -20% |
>> | THP, 4 GiB       | 0.59 ms  | 0.59 ms    |    0% |
>> | THP, 16 GiB      | 2.99 ms  | 2.61 ms    |  -13% |
>> | THP, 32 GiB      | 4.83 ms  | 5.21 ms    |   +8% |
>> | sparse, 32 GiB   | 8695 ms  | 7269 ms    |  -16% |
>> |------------------+----------+------------+-------|
>> 
>> Acked-by: Pasha Tatashin <pasha.tatashin@soleen.com>
>> Signed-off-by: Pratyush Yadav (Google) <pratyush@kernel.org>
>
> With a few nits below
>
> Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

Thanks!

>
>> +/*
>> + * Move a folio out of ZONE_MOVABLE or CMA, so it can be held until the next
>
> "held until next kernel" - here and below - I feel that something is off
> here, but can't pinpoint what exactly.

Hmm, perhaps this:

    Preservation holds a longterm reference on the folio. This would
    block migration in ZONE_MOVABLE or CMA. Move it out.

?

>
>> + * kernel. Called with a reference on the unlocked folio, which is always
>> + * dropped. The caller must look up the folio again afterwards.
>
> I'm having hard time parsing "called with a reference" sentence :)

What about this:

     Must be called with folio unlocked. Drops the reference to folio.
     The caller must look it up again.

?

>
>> +/*
>> + * Look up the folio at @index, allocating it if needed, and make sure it can be
>> + * held until the next kernel. Folios that are not longterm pinnable are migrated
>> + * out first, retrying a few times if someone else has them isolated.
>> + *
>> + * On success, returns 0 with *@foliop locked and holding a reference.
>> + */
>> +static int memfd_luo_get_folio(struct inode *inode, pgoff_t index,
>> +			       struct folio **foliop)
>> +{
>> +	int err, busy_retries = 0;
>> +	struct folio *folio;
>> +
>> +	for (;;) {
>
> Won't
> 	for (retry = 0; retry < MEMFD_LUO_MIGRATE_RETRIES; retry++) {
>
> look better and the body simpler?

Right, good idea.

>
>> +		err = shmem_get_folio(inode, index, 0, &folio, SGP_CACHE);
>> +		if (err)
>> +			return err;
>> +
>> +		if (likely(folio_is_longterm_pinnable(folio)))
>> +			break;
>> +
>> +		folio_unlock(folio);
>> +		err = memfd_luo_migrate_folio(folio);
>> +		/* Someone else might have it isolated, retry a bit. */
>> +		if (err == -EBUSY && ++busy_retries < MEMFD_LUO_MIGRATE_RETRIES)
>> +			continue;
>> +		if (err)
>> +			return err;
>> +	}
>> +
>> +	*foliop = folio;
>> +	return 0;
>> +}
>
> .

-- 
Regards,
Pratyush Yadav
