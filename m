Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5841033DED9
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 16:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789401648; cv=pass; b=Fvj8/jJOwy0pkptR7lmdyoCyxtmqiXt8W63OB7VLKL0WsHmXNq62c2IEExStxD+isoeYEDj2YK92xhz+V3piDzwYnidYDW1xUVeRqfqhqXljjdwlQQSOjJJH1zt+jbv303fKlz+d0ttVK9vGJPA337VtTyCVY7oA4FrijeCSyYY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789401648; c=relaxed/simple;
	bh=AUHhF/E2fQxhW/g6jyemlRTJNX6eDQwBBKIp7y9MRJ0=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BmWnD4wRRyOHWc6OQZWrsD9cTQ9RK4jQsWkDjWbPaLTCFrcRtXoKQxdYoqdry8YZy/aRtu71+kEpxxT67tk75ADUQZ+hLJWZNRQuorzQRCwx5olUe6i6qnpIy8SvCXdygU74CXn/PW0H3e7m/ksIH1C84NzMwjMJSzmRN9sCQkA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dIHey0xC; arc=pass smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dIHey0xC"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-836c4474028so29484727b3.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:00:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789401645; cv=none;
        d=google.com; s=arc-20260327;
        b=Isr3dGfOwWSI+HeL1WoXJcIS45xVPnwgUMtaR/XBSd8QN4wwrjN8eYWyBU6IsaGE9k
         mBHKEeJqsZUZKSbegzYXqrSgmr/YxYYghgUAdOy2zLq7dlKTzMtfj/UR/FVn2si3Zt3A
         XlLEtVPejSxGvprG7nC8oXJXnNQ1nCjwrMxn1ycqJHEoP06y04aXJMtvo0m+Vli1PHg7
         rUhdxQHmjNc5jWUV2QOs633bfrhK2nvdREljcAjvefLFbQ+Wxa85h4DlrECQbYAPtt1K
         rqIk2OC8UMIpYNhVdfQ6MEoebWt4a5/l07pclKORmvmN1ZyPR1zeMbdh51sAs/W36r08
         ac3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=vnhKlSBSQOh8ZFl8Jf+/YlwJHlkv+MXRYwatR7ezOHY=;
        fh=hQ7gHYGersZaj6o4JQbMSrcuZQlekV4rdJBD+KhU5Ck=;
        b=XUeJoy9i7s2iqSyeya1t3r68c+P3zQRTSuo1M0hVAIgpBU+3hS1X1j7Vd+AZ0Cvulr
         SgXK3uDaU1x25jmPqk2H+IqPx1UbxVLaFqMI/77tntWOGaM1cR4UmJ5FGfjCvQvz91QZ
         X7g/0Ev4ck6j2/Bj8CWj0/bKHNyPnsc8l1SFJnk9uWBkEYDdCTZzV3qZTodrYu80UF/H
         diurJIFzT5hARI29OBfcW48rTbE4YnYlhDMZF40v3mIukDtf7D48+DG55DkBcsBADrwo
         xht1qdcvHPCG6WfMW5SdoRYoDVPOcKQNUAM8nkP87UpG8TkfBlTpmMp4Iqoa8dzQAsnx
         DyyA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789401645; x=1790006445; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vnhKlSBSQOh8ZFl8Jf+/YlwJHlkv+MXRYwatR7ezOHY=;
        b=dIHey0xCG9zCD3Fud294ousPBx1CBm69N2UfmH9aQOT5X1fUX1LBLCMZVv9eBNwv9T
         f3PR33NmX3XkjmSK2xtWfsjSn7eKCTbJYZ70h3v+N4hVGauDZ27t39w5h2QfPOjK8Z6l
         WzFIbyH6iVBUJACXdL5RcTI4TplrDEIoS4JIaXKB9+uHdJUGqUxjzLaE8PfqL3543jXg
         EJEatK+38VLzpY5yGUmGH7+yVmJff9/WnIpm6K1mmD2h7YsusMq2j6umCEnJFAoA0v/j
         4hHVt/LQhf9yHXc1FyPsDUCZ2CY5ktNxRsUOP8TjvO/X0C+vV7jHDLSMW2Hz8spEY+lR
         AHBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789401645; x=1790006445;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vnhKlSBSQOh8ZFl8Jf+/YlwJHlkv+MXRYwatR7ezOHY=;
        b=tKCc6ps6GhCtI5wAP5ysTtxaZ0ZjEeOcbsG2d0k/eJBdEiRzYYQavFiYdDLB8IptGW
         wx5C2Moim7R0JOfUUltTR1q6SNYgeOBrsWafnc7DPxpHP+C8pRkXTtd5wgFaE46CW4Ro
         Qh7S6RS7cK3p9zB8cvSbtaef9oRWSnZFt3ffxCROnkuAt5oTuQDTKy3+FGvjz1hsLWCG
         b//NbfG+AUbnyvtflKrRFEO+uXa+k2fZYkofY8MD/RdXF7z1+wXMcBqpuYGeRVuwtZq7
         QzKMO9TO8Hv5yTy6F3dLwNGnGsqxQbbRfv+qNLbZoJU1Ve7O4WSLMVOGqOtgv51w9LlQ
         kJhg==
X-Forwarded-Encrypted: i=1; AKwUvByup2BJ4L/EvOeM9ZxeQXBA+Jj52ISNlfzenxAVWKEvPaZZtRaQcPAg1N1c4obEB2NuRmdvFT6btpS/mUw=@vger.kernel.org
X-Gm-Message-State: AFuF++nYZEMSUfq9dK8uqg2j5koht/VOqZunty+KOqVO2oE6Hc/zBlOU
	Mr+5HC1WBTfaKgNeDTqgNR5179L5B7/Jo/de01iGyifnI6/q+osVuoGENjP83L3lmJQGkiW5klA
	NA9De6n4kvwn/tyTl+1LXZ4rRdF0RoLyo7qZboN2A
X-Gm-Gg: AYBFou2xjLTvuc7TA3EPTErpwyjqZH5zAQZtwynbUreS//nuOQewbc1jM+u1yoG9oEv
	Yhf/Y+Ic4Sf424+/MAmCd1BhYUnXGLfw54Nt8wQDVNyurWqbE6z5wbp999FtQVuH5AN7E/k+L1E
	v771uERuRJjz0TdGuZP0kvdfSMHfa1EjgSpF9BKPH464fvF+UYjosYJHVunOgeBU+rRtlwbTiDV
	izpxNNNqtlLukqXJvI24fpZNkx7adDrfflEDeUSVHDJjjCnUcRL7IhWuVyA9m1WvpQMRcqEhtx1
	MX+Y7AMCIUQosr6K0pZTkvyW8JB5vej422XsJe6+J/S1/9LfrnxHmXShyfpkM9WPadFJB+z4p2x
	mbUIc8zpB+naBEJlUa5eD
X-Received: by 2002:a05:690c:7483:b0:85b:946f:129e with SMTP id
 00721157ae682-88d21832f4cmr13001707b3.33.1789401644112; Mon, 14 Sep 2026
 09:00:44 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 14 Sep 2026 09:00:43 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 14 Sep 2026 09:00:43 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260911143726.3689114-1-joshua.hahnjy@gmail.com>
References: <20260911143726.3689114-1-joshua.hahnjy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 14 Sep 2026 09:00:43 -0700
X-Gm-Features: AcwNN1VDnqeI0nANt9JGLFAAqZR4p_p34VigeOi4yaGir0FMb_J4_8lM3yPMIDM
Message-ID: <CAEvNRgHsJKS5gszvJRpoJ2YHn3A3n_V4F_zgpFQMPdVcRvKffQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] mm: hugetlb: Fix out_put_pages subpool reserve calculation
To: Joshua Hahn <joshua.hahnjy@gmail.com>, 
	Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Dongliang Mu <dzm91@hust.edu.cn>, Hongxiang Lou <louhongxiang@huawei.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Jonathan Corbet <corbet@lwn.net>, 
	"Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, Miaohe Lin <linmiaohe@huawei.com>, 
	Michal Hocko <mhocko@kernel.org>, Mike Rapoport <rppt@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Nhat Pham <nphamcs@gmail.com>, Oscar Salvador <osalvador@suse.de>, Peter Xu <peterx@redhat.com>, 
	Randy Dunlap <rdunlap@infradead.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Shuah Khan <skhan@linuxfoundation.org>, 
	Suren Baghdasaryan <surenb@google.com>, Usama Arif <usama.arif@linux.dev>, 
	Vlastimil Babka <vbabka@kernel.org>, Wupeng Ma <mawupeng1@huawei.com>, 
	Yanteng Si <si.yanteng@linux.dev>, fvdl@google.com, jthoughton@google.com, 
	rientjes@google.com, vannapurve@google.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Joshua Hahn <joshua.hahnjy@gmail.com> writes:

>
> [...snip...]
>
>> @@ -6821,26 +6823,21 @@ long hugetlb_reserve_pages(struct inode *inode,
>>  	}
>>  	return chg;
>>
>> -out_put_pages:
>> -	spool_resv = chg - gbl_reserve;
>> -	if (spool_resv) {
>> -		/* put sub pool's reservation back, chg - gbl_reserve */
>> -		gbl_resv = hugepage_subpool_put_pages(spool, spool_resv);
>> -		/*
>> -		 * subpool's reserved pages can not be put back due to race,
>> -		 * return to hstate.
>> -		 */
>> -		hugetlb_acct_memory(h, -gbl_resv);
>> -	}
>> -	/* Restore used_hpages for pages that failed global reservation */
>> -	if (gbl_reserve && spool) {
>> -		unsigned long flags;
>> + out_put_pages:
>
> I'm not sure if this section warrants these two comment blocks anymore.
> The logic is quite straightforward now that we don't have to worry about
> managing the global / subpool reservations separately and rather just
> simply do the subtraction to account the memory.
>
>> +	/*
>> +	 * Return all that was requested from the subpool, let subpool
>> +	 * tell us the new number of reservations that need to be
>> +	 * returned to the global pool.
>> +	 */

I think this could be removed if you think it's obvious enough.

>> +	gbl_resv_put = hugepage_subpool_put_pages(spool, chg);
>> +	/*
>> +	 * There may be a difference between the number of
>> +	 * reservations to consume and the number to restore now if
>> +	 * there are multiple threads interacting with the subpool -
>> +	 * restore the difference.
>> +	 */

However, this other thing about threads racing needs to be emphasized
imo. Both subpool and hstate tracking are global. I believe pretty much
anything that updates global state based on local variables only in 1
thread is going to mess up the global state.

>> +	hugetlb_acct_memory(h, gbl_resv_get - gbl_resv_put);
>>
>> -		spin_lock_irqsave(&spool->lock, flags);
>> -		if (spool->max_hpages != -1)
>> -			spool->used_hpages -= gbl_reserve;
>> -		unlock_or_release_subpool(spool, flags);
>> -	}
>>  out_uncharge_cgroup:
>>  	hugetlb_cgroup_uncharge_cgroup_rsvd(hstate_index(h),
>>  					    chg * pages_per_huge_page(h), h_cg);
>>
>> --
>> 2.55.0.1007.g17ff1f9808-goog
