Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793029672;
	b=uNWbiiv2TNyIrd4FAYBPbANjUTq0me2PqSjx3566BaTsefhlWFA6Bs6eiJLvg40E5xdg
	 s1vGqK5Wsp8cDSl8/mYGUKr5a5JFwvCVxEuvXPAGj2bO2TTQW/+TxeCrb53St4aIbkFpX
	 RDDu/gTWkablXuCPZ1drGXGURyD/vAr/XHHSFqaUXqd4bLufjSNMTuj2GMYwxD7w0MqQF
	 glxuBkSf/bpUWnQ1PiNE5aeG+9Sq4NkLpsNpuSQmrTVzBgzLxH4nYjFB/rHWO7Y6B7AO6
	 HIT/iMtBA092IJxFol1jlZY2TwtBf6fFN5FFTm2XCcBM6vC8t9l0+ymL3ra1+L0a3dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793029672;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=35uD3sVJLZUeRHcPV8RyOPRby60btWRa2sdjDc5SOss=;
	b=OP+TueaglkHVGrRVfY5PSa9JAw4RVIyiYfGP2u5oK7ZtDzGEWIvQoiduSIRgOURhfGFH
	 N8PevpI89vJyNm+R6FHnof49pvX4vJTzTXy8dONni7GYNcWWrCyBltThkxppxd+P7gdA8
	 jdY7/lDIVFHAuvga2FgHxqDHAI+jhBOH/zSsKkbSWb82iFaMmCR6i3z+AynNNE20+ehsh
	 JTihxEy52WrRtb341QLKm5ikj+DSw3Rwt+VFoqZyZwe5splq/c0EkNRKmqYP3GrJRnbgu
	 O5th0PfrBae7OHMC3Djk/IHVWRso/fjffdnQpHBjHmtqmSGvX6PDMy2hr53NgrO/Zzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=byeEQHUb;
	arc=none smtp.remote-ip=209.85.219.42
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A97606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 15:47:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71A97606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=byeEQHUb
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-91bb5795792so37697026d6.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 08:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1793029670; x=1793634470; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=35uD3sVJLZUeRHcPV8RyOPRby60btWRa2sdjDc5SOss=;
        b=byeEQHUb9OieTIHdICY6bBwgtkoir/eSMZRVgp0AgET5gmLTzKoGnbdPTANdmvWh0x
         R/w21WuGyFo3i0Wn8ZRzJcbCzbVowwmFMUFcY9tthfzKWmDvvFE4vC3vDAj76ccxPUrU
         QjOeAPjy+HI3uU8nNAGddmdjUVXhMF60qe5SGvsHvO5fimwTxVuQAWTnT2bP6Ox7HGVE
         wgNWlkJrBQ4MJ7/3aSElBcfFX7WzqjY/OY8DdVFQaZd1ghqVk9n2w9EiCzNi0qQzg9IM
         /03JYdoZuMiqgGa9xspW9dHEXKBLJsycQp32/ZQuXaBq2pTeurr7DG3rO3sBJMu7JDXW
         wVPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793029670; x=1793634470;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=35uD3sVJLZUeRHcPV8RyOPRby60btWRa2sdjDc5SOss=;
        b=abtsRy/Gke/K3F0iLW6nYAo6ELHh0lImlwkLkInRdBVE24FCxz+lENbeTYIxvk5ZRI
         uqs8Ofc1+nmbjyW4bt/mVS9QVtsHhL7P6RR8GYk0TVV9dqb+PqdvIDEkQjLowJsYYe5y
         3n0KAckO8ZSiFvMqjwYqIR9+gMLdq9bXORKGHQsASD8euZQt8p7nF8W1JM0SebQOYp9v
         RC0/nhE8EUPWuHPetSDZYtH3qR+KRtUSNR0dGBOp7iULlqUP+RA3gQ2Z2S0fBU2dzS1t
         SZMopyN3keDoiuYOhbdW7lWO0bkENhIGcRDS8v3/dYVfEMXlZPPnBxtBV9E5hFGrdUcI
         cWyQ==
X-Forwarded-Encrypted: i=1; AKwUvBzl0InFZYHCIy6TRUbiYDyfd1BYbksAJ5UPmfMMz8LGK33V3WLBVMmwmUBzOJ2lcU0coaYyuOEYIplUZhU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKo2bd1jZD0kdrj+fsE7lVjL+LdtOUYyKXsaAf9qKN1lWjJyqC4
	6speZSdDFzyesw9B1HOzeV8NGxluK3zEGOIuTjXy19d4dcpswMeCV4pXxpSP0JXKCC0=
X-Gm-Gg: AYBFou1uu/9rcFkByBv/FgWZJ3VCQtqpcqADrnhcIMYhtEng0j5lkUguHHhcgT0MVQ7
	iCSrwOYWQcdUq2BMLV0I3VweRZkCjONfT+PTwMu3RETILldeqddZjakHGdPC2DR8efROBNPO0os
	5ejDWuNLzSxSc7JojzAgq1jQrrUBKLdasin2pg/RtTOQ7cHq9D9pE3gxXJIZzh9i8869n4UUNET
	R9AUb7w9xB2d3VOJvSdceRMj+UwDIg/Z5HGoZgeHFAcoWsWd47OxQaJ2PMvSufGDY+iFRkeZP3w
	/YGbXJGuq2mrvVfslernr9IPuAs5GBIJ8FbkT2IZc034mboID1XdXI4DRpEH/cx2RR/LUiI8jgT
	lQpfCKwZSITHLhsYZBKHPh8m4oCpGhhIekvqZQhGIsxmaNbPYn6boBxupmPN4XYtnK5Mv3JW9ds
	uEl3hJZMXooyyGUv+WBd23gvUEMvgglvdg+E6gdpbWaxMjuU9zNuQA3/HL1D/yr0/cZcO6PIbHH
	GWQvBvCDEzzDoB9mBCZU2fj724FnJY/DB8zJSb247Nu1/nH3c5y3YMXh2oZlTE/I6C6TrnMZDtD
	9Udql6wzRYJYgiJonIq4H/jShDAnVN7CPDw1
X-Received: by 2002:a05:620a:4515:b0:93e:48fc:aa85 with SMTP id af79cd13be357-940ef9571aamr1034017685a.43.1793029670123;
        Mon, 26 Oct 2026 08:47:50 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-940f066731esm719609385a.9.2026.10.26.08.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 08:47:48 -0700 (PDT)
Date: Mon, 26 Oct 2026 11:47:46 -0400
From: Gregory Price <gourry@gourry.net>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com, 
	akpm@linux-foundation.org, ziy@nvidia.com, joshua.hahnjy@gmail.com, rakie.kim@sk.com, 
	ying.huang@linux.alibaba.com, honggyu.kim@sk.com, stable@vger.kernel.org
Subject: Re: [PATCH] mm/mempolicy: recompute automatic interleave weights on
 memory hotplug
Message-ID: <at91WFlW96PH-a8A@gourry-fedora-PF4VCD3F>
References: <20261024170415.4121901-1-gourry@gourry.net>
 <e3a1ae72-9370-4c3c-8935-6a410a74377b@kernel.org>
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
In-Reply-To: <e3a1ae72-9370-4c3c-8935-6a410a74377b@kernel.org>

On Mon, Oct 26, 2026 at 12:19:21PM +0100, David Hildenbrand (Arm) wrote:
> > +/* Recompute the weights from node_bw_table, unless they were set manually */
> > +static int wi_state_refresh(void)
> > +{
> > +	struct weighted_interleave_state *new_wi_state, *old_wi_state;
> > +	int i;
> > +
> > +	new_wi_state = kmalloc_flex(*new_wi_state, iw_table, nr_node_ids);
> > +	if (!new_wi_state)
> > +		return -ENOMEM;
> > +	new_wi_state->mode_auto = true;
> > +	for (i = 0; i < nr_node_ids; i++)
> > +		new_wi_state->iw_table[i] = 1;
> > +
> > +	mutex_lock(&wi_state_lock);
> > +	old_wi_state = rcu_dereference_protected(wi_state,
> > +					lockdep_is_held(&wi_state_lock));
> > +	/* NULL wi_state assumes auto=true */
> > +	if (!node_bw_table || (old_wi_state && !old_wi_state->mode_auto)) {
> 
> 
> I was confused about the node_bw_table check at first. Maybe
> 
> /*
>  * We can get hotplug events before any BW data was recorded.
>  * ...
>  */
> 

I went back and forth on whether to do the mutex in or outside this
function, but ultimately decided inside is just better structurally.

But yes, this comment seems warranted in this case.

> > +	/*
> > +	 * HMAT and CXL report a node's bandwidth only when it first gains
> > +	 * memory, so recompute the weights whenever N_MEMORY changes.
> > +	 */
> > +	wi_state_refresh();
> 
> If the function fails, should we at least pr_warn_once() ?
>

The only failure state is -ENOMEM, wasn't sure that was worth warning
on.  I actually debated whether to just make this a void function.

I don't have a strong feeling here, but happy to add a warn if you
prefer it.

~Gregory
