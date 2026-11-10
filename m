Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794332654;
	b=bBkajsBJajJD3jmWlkzepnMdgWjk4i0aiOO8y2BhVLMfDAkRfbDghMUY+fpxoj3cTOYd
	 ik27RoK3St9iV3pva5eSz8/T7nwppG/Blm5u27sHxhNmwK3dbi5Svg2GpYtFroAZY3uLt
	 0uhj6XKc9alqXyPpPsqmPrKrOUmbkfFtAYCq48Imr++4FoGA6TJyIwTdL1r2jTNrilt3r
	 dOABs1UFe7CDq/1qG4qD6+eto/1aIfgcvBBFFs7u0BI1Wepokx07yIhFvTxfY8KBog+08
	 qr3NB2/807T9AgLno8KITqGjULepwtaJu6x8/48CVuTmeNMtVoM98Q8BGmeU71M2UdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794332654;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=Fulrg35l8yGwvpvq8cPY9YnUHn/OJvxhodbRy0q5+gI=;
	b=XLT3OJM+LfcnUQKhznd/3clKYj66m3N2Ug0rV1ql9SG6QJcGj2vkh7EdRisGKE4wph8u
	 QJAuzL4JeA6Gx//ecz346rd6jizOX6xHeo65qOb2ZHtsMtMh6tb2Wf/oVQD5+paEa+lln
	 qEqXk5eMnCvS4iPJwxiUAleoM+cry5XfcKMLmolWxmpfCV84bPv0pugiAFO1H1Gh38bn2
	 UfBfsAGj4vtdHbFP4pT+yv9j0JYh3fxg1eN9fdbF/2O4XUysbi+Wfigd3DYnkyTpluY2v
	 PhflvxPUM938Vkb2hS5kXnS/jio0d4ave8Os7eQv8Zz+zThL55n740bnEX/hQg/BuMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DIrrzKib;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E5F2606A320
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DIrrzKib
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B35D1F0089F;
	Tue, 10 Nov 2026 17:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794332654;
	bh=Fulrg35l8yGwvpvq8cPY9YnUHn/OJvxhodbRy0q5+gI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=DIrrzKibIe7LMcyHZ/CBt/f3kkB050KIX7QvR3SdZ/cydQJymBTzfBKZobEaAU9FS
	 AQPpwd69AgUgqddeKluymH1MgZworh5C2kzPXb6ipLMj/S8C8n11LY31oO8mmXtFk8
	 mh9nvu5cYFu2ZpOei+19puwSA8Lg7RWpYU/MqCIGxMwgs/XYzlxP5SYfd5ULfBsH0p
	 ctMi4gIX0c6ZTJPwKz/6fT4a9RnBFgdnOz0HtRmxlhqxOJwyPgWMmUf9I+6B4RF2o5
	 7R/d3E4EMW1XJeNCFKrx0V8ozF9R+YgZkiLrad7/FCRWMAbMLWn8ioq+EhBII0BH5n
	 oZ5+J1fIzQxHA==
From: Pratyush Yadav <pratyush@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Mike Rapoport <rppt@kernel.org>,
  Andrew Morton <akpm@linux-foundation.org>,  Samiullah Khawaja
 <skhawaja@google.com>,  kexec@lists.infradead.org,
  linux-kernel@vger.kernel.org,  linux-mm@kvack.org
Subject: Re: [PATCH 2/2] mm/memfd_luo: keep memfd frozen until finish
In-Reply-To: <179373810485.663454.3013535045194073890.b4-review@b4> (Pasha
	Tatashin's message of "Tue, 03 Nov 2026 15:35:04 -0500")
References: <20261103181916.2462825-1-pratyush@kernel.org>
	<20261103181916.2462825-3-pratyush@kernel.org>
	<179373810485.663454.3013535045194073890.b4-review@b4>
Date: Tue, 10 Nov 2026 18:44:11 +0100
Message-ID: <2vxzo6bwh990.fsf@kernel.org>
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

On Tue, Nov 03 2026, Pasha Tatashin wrote:

>> After a memfd is retrieved, it immediately goes back into "normal"
>> operation. The file comes back unfrozen, and its pages can migrate, it
>> can be truncated, and so on. If the memfd is depended on by something,
>> like iommufd, that can open a window for folios to move around before
>> the consumer can re-establish its references.
>> 
>> Finish is the conceptual point when a retrieved file can start to behave
>> as "normal". So take an extra reference on the folios and freeze the
>> memfd on retrieve until finish.
>> 
>> Suggested-by: Pasha Tatashin <pasha.tatashin@soleen.com>
>> Signed-off-by: Pratyush Yadav (Google) <pratyush@kernel.org>
>> Link: https://patch.msgid.link/20261103181916.2462825-3-pratyush@kernel.org
>>
>> diff --git a/mm/memfd_luo.c b/mm/memfd_luo.c
>> index 6b68220275eb..5abb9c0956af 100644
>> --- a/mm/memfd_luo.c
>> +++ b/mm/memfd_luo.c
>> @@ -55,6 +55,14 @@
>>   *   Only seals known to this LUO version (see ``MEMFD_LUO_ALL_SEALS``) may
>>   *   be present; preservation fails with ``-EOPNOTSUPP`` otherwise.
>>   *
>> + * Restrictions
>> + * ============
>> + *
>> + * While a memfd is preserved, and after it is retrieved until the session is
>> + * finished, its size can't be changed and holes can't be punched in it.
>> + * Operations that would do so (``ftruncate()``, ``fallocate()``, writes past
>> + * the end of the file) fail.
>> + *
>>   * Non-Preserved Properties
>>   * ========================
>>   *
>> @@ -383,33 +391,56 @@ static void memfd_luo_discard_folios(const struct memfd_luo_folio_ser *folios_se
>>  	}
>>  }
>>  
>> +/* Drop the references retrieve() holds on the folios added to the file. */
>> +static void
>> +memfd_luo_put_retrieved_folios(const struct memfd_luo_folio_ser *folios_ser,
>> +			       u64 nr_folios)
>> +{
>> +	for (u64 i = 0; i < nr_folios; i++) {
>> +		const struct memfd_luo_folio_ser *pfolio = &folios_ser[i];
>> +
>> +		if (pfolio->pfn)
>> +			folio_put(pfn_folio(pfolio->pfn));
>> +	}
>> +}
>> +
>>  static void memfd_luo_finish(struct liveupdate_file_op_args *args)
>>  {
>>  	struct memfd_luo_folio_ser *folios_ser;
>>  	struct memfd_luo_ser *ser;
>>  
>> -	/*
>> -	 * If retrieve was successful, nothing to do. If it failed, retrieve()
>> -	 * already cleaned up everything it could. So nothing to do there
>> -	 * either. Only need to clean up when retrieve was not called.
>> -	 */
>> -	if (args->retrieve_status)
>> +	/* If retrieve failed, it already cleaned up everything it could. */
>> +	if (args->retrieve_status < 0)
>>  		return;
>>  
>>  	ser = phys_to_virt(args->serialized_data);
>>  	if (!ser)
>>  		return;
>>  
>> -	if (ser->nr_folios) {
>> -		folios_ser = kho_restore_vmalloc(&ser->folios);
>> -		if (!folios_ser)
>> -			goto out;
>> +	if (args->retrieve_status > 0) {
>> +		/*
>> +		 * Retrieve was successful, release the folios and unfreeze the
>> +		 * file so it can be used normally.
>> +		 */
>> +		struct inode *inode = file_inode(args->file);
>> +
>> +		folios_ser = args->private_data;
>> +
>> +		inode_lock(inode);
>> +		memfd_luo_put_retrieved_folios(folios_ser, ser->nr_folios);
>> +		shmem_freeze(inode, false);
>> +		inode_unlock(inode);
>>  
>> -		memfd_luo_discard_folios(folios_ser, ser->nr_folios);
>>  		vfree(folios_ser);
>> +	} else if (args->retrieve_status == 0 && ser->nr_folios) {
>> +		/* Retrieve was not called, discard the preserved folios. */
>> +		folios_ser = kho_restore_vmalloc(&ser->folios);
>> +		if (folios_ser) {
>> +			memfd_luo_discard_folios(folios_ser, ser->nr_folios);
>> +			vfree(folios_ser);
>> +		}
>
> Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com> 
>
> Side note (pre-existing, not an issue with this patch):
>
> Initially, I wondered whether we should disallow auto-finishing an 
> unretrieved memfd, in case a preserved device still had this memory 
> mapped for DMA. However, if we reach this point, can_finish() has 
> already passed for every other FD in this session, which means any 
> possibly dependent FDs (e.g. iommufd/vfio) have already determined that 
> this FD was not needed to be retrieved for their states.

I think that is still a problem in a different path.
memfd_luo_retrieve_folios() frees all the folios on error. I think it
should hold them until finish(), which would give IOMMU or other
dependents a chance to block the finish.

But yeah, that would be a separate patch.

-- 
Regards,
Pratyush Yadav
