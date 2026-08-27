Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C5130B53A
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 07:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787816966; cv=none; b=IexNVvWqaQMDBHYZfQ2BKO5Prbt9rB2k8tK6M+OYk+1kWgZWEb2O41/EQZSK1BHvxeHEafnrqkDBigjktL2xxry/tD5GGrbSoyYHhxL5FzXpOvyjYGvm+9fzQjU1jhQtUJrRYQPOD6MrXCfz2Bjet2gZvX+g4wagwOoGwFYzIXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787816966; c=relaxed/simple;
	bh=qwBbZfCO8qOBc+Dly96I8RJKbQghrsnVFsA4ezaS2bQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PrVT+i6ohFskJeBbk+CyHhBRUM0Vd8oambgQwc6N910h0thoNwWtnS7tLumX9cWeO8jxyaEJtWvbCvPMNXR/tWXRUr/2tEOkMdJ38rkTBcOp0fwodWTSHLJ9FpytjALyb1CkweubZxnRiZwfl4LU5POz/b7GBqhok9RoI41nftA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hzvJC8Nb; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hzvJC8Nb"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c169ae1cb26so152256366b.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 00:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787816963; x=1788421763; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:reply-to:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=i3S/MWtWQxmPsA3rkRg784EMwbcHhjCKBevLh/6T/ZE=;
        b=hzvJC8NbbLhmw5vlcAORehsH9mw6ST3yOY2aX5ggZTYgH9jQ1Tya5g849kDrcP3Ivb
         FZYHQjfYU3Mf8+ohxlGgfXEcw1MZX99XAE6XtEjBug17aFnXK0lFqW76bNSrktCO2RSb
         180Mvt89stNzg30jovJJNZttVoNkdTAjKQoopo20tK47JEV3U6z6cOb8sWA/rQA1JbNb
         lYEKs/TC3H8YI8m4g5rQHaG7GgpQLkjnMTvOjToyWJggNxmrwgsIqYD/hTl23E4WT1u0
         bRTFOVxXJh1t4NZX/58WVW4Rhbp6qsdm3LmSo/fXVYLnX66U6YgLKiX3bnuSVE8Sot6w
         Hm1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787816963; x=1788421763;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:reply-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=i3S/MWtWQxmPsA3rkRg784EMwbcHhjCKBevLh/6T/ZE=;
        b=XDak8vQ9IeIPD2270tbqkAX4OVw9/6iWPHsPg5P4vM4/VR/fPjqbTxz5BO8JQMM6OZ
         eRLcQ3XTuVKgE8xzXD4S+PFZ9Qbp+hlNenKkyRQYjpKcANFF7UY/HWd2nfBOO+lPN5gt
         ng+jx2s+Z2nQIPTS/TQZpDnYy3ffUfxFPbFYKDRcp611EyfHGiSh6MrnD3u545bc0eR5
         KkCFjwcOFyq7YZEnhW1KpmlQZQPJjY57vW1F9hDABtxWku9x5YffT7XVDZGi2pz8phWo
         ApPWMh8xzqMEfH23+8S2IpODvMRUNf6QRwBXME+4b5oVGwk4Vv/qhSK2zRrOzQ9LortT
         IuOA==
X-Forwarded-Encrypted: i=1; AHgh+Rqwm2kmVtqMMV3LkYKDOmwg10OVhNGqt3FVQ5l72GLhRjHC/k3tctCwJYe3AhMaEWAwlnW3Jk11U0+I0co=@vger.kernel.org
X-Gm-Message-State: AFuF++lHW00wVuA9F/dadLgJQvHf3byFb/TC9JdJfBrAoLFcZQmhnFi7
	Ug7GbhZktVdxBzQSLSF0R6GQJ/wyJESQkYX2f5lMe8ofVZX4BEsjMt4uj437nA==
X-Gm-Gg: AR+sD11FyfX+U8hmBvC+I428/o0IbN1NLs1PHx8JL/QPZvD2X7nstmPxsgaujM3rTet
	S4iPM1ulBsZRdGajvEPpZcr4qHoWFhxwHq7vZKtqu14v/+gw6/k2V3jXgWip67RpDUbBYbtV+b7
	0pmXDFMcSCD9IIR2k9Y0bVTV0xgkpiWs5cqzucgMisnfattWJMrbQdQNxsXkScoO6TcLiALwkGO
	hh8hRC+zX/qvdqReWaMP/iG30mlhDgXKlop/O5s/pa8SGg2ucX+L/sWa57ZyezLZF9hI8FWpz8b
	uTxlFPTTUdNrycsWVz4aTEZVRqEve1tCbP7nVl7e8LgWTzu6pqJpKu43orz1+ryztivqTp6A/m6
	yRU8fUSHl3nl9Ng1OOE6/WvElQBor2kl5Ps0/esQ1VV6JDlE8a1IdgbUecMqrJYO/S0wxbmW8xD
	7BGpfun7UW8db3DmgxZ/1nyzox3lG5b8SWLWynER6AWUdxtEzna5HjyCbd0sQ=
X-Received: by 2002:a17:907:9447:b0:c1c:4c72:e6df with SMTP id a640c23a62f3a-c2535b81008mr338811666b.0.1787816962340;
        Thu, 27 Aug 2026 00:49:22 -0700 (PDT)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a9ef996sm824805966b.62.2026.08.27.00.49.21
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Aug 2026 00:49:21 -0700 (PDT)
Date: Thu, 27 Aug 2026 07:49:21 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: Wei Yang <richard.weiyang@gmail.com>, akpm@linux-foundation.org,
	david@kernel.org, ljs@kernel.org, liam@infradead.org,
	rppt@kernel.org, surenb@google.com, mhocko@suse.com,
	brendan.jackman@linux.dev, hannes@cmpxchg.org, ziy@nvidia.com,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	Baokun Li <libaokun1@huawei.com>
Subject: Re: [PATCH] mm: remove out-dated document of __GFP_NOFAIL
Message-ID: <20260827074921.mracnqv2m2cugasb@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <20260827030548.16631-1-richard.weiyang@gmail.com>
 <cbc344a4-77b7-4282-9bdd-004822642ab5@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cbc344a4-77b7-4282-9bdd-004822642ab5@kernel.org>
User-Agent: NeoMutt/20170113 (1.7.2)

On Thu, Aug 27, 2026 at 09:35:26AM +0200, Vlastimil Babka (SUSE) wrote:
>On 8/27/26 5:05 AM, Wei Yang wrote:
>> Commit ee040cbd6e48 ("mm/page_alloc: don't warn about large allocations
>> with __GFP_NOFAIL") remove a warning on allocating large folio with
>> __GFP_NOFAIL, which is adjusted by commit 903edea6c53f ("mm: warn about
>> illegal __GFP_NOFAIL usage in a more appropriate location and manner").
>
>"which is adjusted by commit" sounds as 903edea6c53f came later than
>ee040cbd6e48, but it's the opposite. Maybe say "which was placed there"?
>

Got it.

>> While in that commit, it also documented this behavior which is
>> out-dated now.
>> 
>> Adjust the document to align to current code, and adjust the comment
>> while at it.
>> 
>> Signed-off-by: Wei Yang <richard.weiyang@gmail.com>
>> Cc: Baokun Li <libaokun1@huawei.com>
>> ---
>>  include/linux/gfp_types.h | 2 --
>>  mm/page_alloc.c           | 2 +-
>>  2 files changed, 1 insertion(+), 3 deletions(-)
>> 
>> diff --git a/include/linux/gfp_types.h b/include/linux/gfp_types.h
>> index 190191411009..24fde8eb73df 100644
>> --- a/include/linux/gfp_types.h
>> +++ b/include/linux/gfp_types.h
>> @@ -243,8 +243,6 @@ enum {
>>   * used only when there is no reasonable failure policy) but it is
>>   * definitely preferable to use the flag rather than opencode endless
>>   * loop around allocator.
>> - * Allocating pages from the buddy with __GFP_NOFAIL and order > 1 is
>> - * not supported. Please consider using kvmalloc() instead.
>
>I'm not sure if we want to simply remove the lines, or rather say it's
>discouraged (instead of not supported) and still suggest kvmalloc() if
>possible.
>

Reasonable.

As mentioned in [1], kvmalloc() maybe not suitable for some cases, I would
suggest below change.

 * Allocating pages from the buddy with __GFP_NOFAIL and order > 1 is
 * discouraged. Please consider using kvmalloc() instead if possible.

Or, you prefer only s/supported/discouraged/ ?

[1]: https://lore.kernel.org/all/aQTHMI3t5mNXp0M1@casper.infradead.org

>>   */
>>  #define __GFP_IO	((__force gfp_t)___GFP_IO)
>>  #define __GFP_FS	((__force gfp_t)___GFP_FS)
>> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
>> index ab385bc252cc..146f7e0a9462 100644
>> --- a/mm/page_alloc.c
>> +++ b/mm/page_alloc.c
>> @@ -4804,7 +4804,7 @@ __alloc_pages_slowpath(gfp_t gfp_mask, unsigned int order,
>>  
>>  	if (unlikely(nofail)) {
>>  		/*
>> -		 * Also we don't support __GFP_NOFAIL without __GFP_DIRECT_RECLAIM,
>> +		 * We don't support __GFP_NOFAIL without __GFP_DIRECT_RECLAIM,
>>  		 * otherwise, we may result in lockup.
>>  		 */
>>  		WARN_ON_ONCE(!can_direct_reclaim);

-- 
Wei Yang
Help you, Help me
