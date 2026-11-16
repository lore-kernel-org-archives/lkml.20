Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794842832;
	b=vEQv8efmiiG25rFG09EPUwkCYu7MddWJJpN6ZnoVltMY+jRMUMa38PSkjE/K2enK1RRN
	 EyGSUN1C1al/ycahlP5OOAEO3xqFWBvOI80BH+OlGIxgD/7pNEDFxOEcqqGnOsBaqEt+S
	 bDgRHhbnb3yvzhjh7GlnFC263Hk9aLBMP6SAf6VC+QVekoY/S30py86orAOgJUaJO9TvZ
	 hl5xkY5u5sUf9mqvPQLYSHZe1ZvnkVFR13rnd5RexHdaiJJ1H4pcK9CxsjO7FZcP/+O2s
	 ZN95BdV8B3M+Ucj4t+QgJ4MvLfU+0Y8p8kP+FpTCv8nh+EArWET+Qkn8R3hr6oD2TUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794842832;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=upQeaziCAp0s4MI1ooCF98Esj09UZt1W17ULeweJf7s=;
	b=pSvQE2fH/RpHlK8Zw4lDcQDGdQI7Rjp7ySNAeSSsH7iz/5zLGNYqoNWYOy78d0toiDoo
	 R/dGD8+yUVNTVUgVcm4qE/8VFxAvNInZiWEI9I2mMxHFeM/+EacYPdsN8Jt1m3Nglw2xN
	 N5LGiPzkunBi4bJlE0j3rFs82hEaPoNpbc6ul/0SPW5Dc8zGHORl47EmOVd+2jMSgsxhl
	 lXKSGF9LCbW5BPG1CWcuUiGHReLT66wtZopkoPXCAsEG8MGjaWke5AVi9jCCiSYdxVNAQ
	 EfGxP9oYnBmt6/tehNpmMzK6CSSmjTJaRRDXf/qZT3bHG4Kw45vM9xlrkDLBtBSVtIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iDVtXHZd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9117C606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iDVtXHZd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3DAA1F000C5;
	Mon, 16 Nov 2026 15:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794842832;
	bh=upQeaziCAp0s4MI1ooCF98Esj09UZt1W17ULeweJf7s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=iDVtXHZd3KFWd+PePqI5m3ksMYq2Ip2nzvIZCcXiHgLN+WyUxRnE9/q7AUHvuLjp1
	 J/qMSEJJMZD2w3rETtxoaxmT6/AyHRT2OX4tLc+WW14/OFxFHkUsKF5V0YLLXfuPab
	 g9Pr3oRKBVQhIb9okU7FDIZhxqd0r8xq2SARQuaQDCLFzfVwOeST5AG3ezeG+HXor/
	 8sD55VUCq1P938fItCtDJot9h5YEr7ixBSg9akAXV5UxgwQkulpfdXjZDFeREIOXbC
	 49XA/TiY8veuAci/EuK0XrLA8wWUpZRCGFqxF0vj2fpYkmBgZI03DPR6e5aOykZTQC
	 epkhjpM0bh/0Q==
Message-ID: <6c573cf8-4c33-46e0-9309-1d645ee827df@kernel.org>
Date: Mon, 16 Nov 2026 16:27:07 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] mm/ksm: add initialization helpers for
 scan_get_next_rmap_item()
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, "Xu Xin (vivo)"
 <xu.xin@linux.dev>
Cc: chengming.zhou@linux.dev, linux-kernel@vger.kernel.org, linux-mm@kvack.org
References: <20261116014434.310003-1-xu.xin@linux.dev>
 <20261116014655.310486-1-xu.xin@linux.dev> <avsOr-03NtFVG-6a@gremlin>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <avsOr-03NtFVG-6a@gremlin>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


>> +static struct ksm_mm_slot *scan_get_first_mm(void)
>> +{
>> +	struct ksm_mm_slot *mm_slot = &ksm_mm_head;
>> +	struct mm_slot *slot;
>> +
>> +	scoped_guard(spinlock, &ksm_mmlist_lock) {
>> +		slot = list_entry(mm_slot->slot.mm_node.next,
>> +				  struct mm_slot, mm_node);
>> +		mm_slot = mm_slot_entry(slot, struct ksm_mm_slot, slot);
>> +		ksm_scan.mm_slot = mm_slot;
>> +	}
>> +
>> +	/*
>> +	 * Although we tested list_empty() above, a racing __ksm_exit
> 
> I think you need to update this comment to reflect the fact that you moved the
> list_empty() check :)

Yeah, with both things

Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>

Xu, can you send a v4 that I can pick up?

-- 
Cheers,

David
