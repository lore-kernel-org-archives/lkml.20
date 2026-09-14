Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3132339EF14
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 06:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789365766; cv=none; b=FHuqwkvvSWFcQvk+30J/a6sIJcmu0S6s3V8afNTdi9KSSXXVe43GVOHxHkZnS5VR4sByXsj4Trvsfx29Cuh8dn98sAq7FgN2dN1xUEP+KNvbPXRziO53YF44F8A1So7zFs4W0sP+wmLNaGTTRUmo9OorEKPZY30Ncq52XXEyjZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789365766; c=relaxed/simple;
	bh=vfn7oQvpJgZPAKzryCw5hpXtzMja2nZlamVrv+FLhn4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ebKTqCVeWH+uZRYFh/+E/cvureqNUoKADMIX1c9zhBE4Yel02BoR/2WQH4SeyH2QUfDu2kdbhkbLHAt3zBmIaSAky20qJcmH0KjhOSrhxqPmufM5+Y6WAmHNcd0BiI+zELQIZfwXqOXlHeTwua/jBkeNxzW1pONoMNSvUNFE8NE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bTpWR15P; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=RGIPOyZq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bTpWR15P";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="RGIPOyZq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789365762;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jR3AopfYN87ksUtB3meqTk9HxnnS1LzTmbbTTCKyMFM=;
	b=bTpWR15PmjERwGX1kwfkPrXh0t0DobS/kZG138rf5AtwlhyHwdr974jvy2wAWimQW+jb3D
	Fu67zVCs1eihSNgkGKG6Me8IoxRH0iwesdmlrBJvhDJck/q7gCc7lfIJJ0RQebYFZvo1qq
	XPTY2SgEFxAanDuH0rTwa+cYI1EgxWY=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-92-L_J2uin5OneHSgAl6S5ddw-1; Mon, 14 Sep 2026 02:02:41 -0400
X-MC-Unique: L_J2uin5OneHSgAl6S5ddw-1
X-Mimecast-MFC-AGG-ID: L_J2uin5OneHSgAl6S5ddw_1789365760
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6bc8f608979so2069146eaf.3
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 23:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789365760; x=1789970560; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jR3AopfYN87ksUtB3meqTk9HxnnS1LzTmbbTTCKyMFM=;
        b=RGIPOyZqctd64GJQlIm23DBGttj0aHt0/O/cxvANKOgbsBBpZ4YQJD5pX0t6ev1TOr
         do33dsj3b+mrSfD7TVNvenfuebuhHNBri7dlKiLcAGNS59DVstL/TwWpj8g6q1PZ7zza
         AH2DdafwOkjar6pNEqarmKBPxmfBeIjvXFpKuChZY6LbsEwxyogQnPP8LiMr5B73ysdc
         vN9TcLnGrVAfQl7nJtEjmM3Uqf0TRTYia7RrRP8kDoYAJcibAAP+oTgYnDrh3NfDjwUZ
         Yn97eELXp1lOwXKvJZCHrvz86RSqc7Pj7io41KS6ikdE6qzwoQu350cl45ToVxkYmCQy
         ktxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789365760; x=1789970560;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jR3AopfYN87ksUtB3meqTk9HxnnS1LzTmbbTTCKyMFM=;
        b=WecBT+06V22f1uQAXRk+QGoLcHtTPQIZznSZKsLWMNb790KJYVLFe4rBkGD5A6APR7
         GoGO+8G5vB56v/tvYyOTW5eELZ+3gLIEaWhSTi+/GaPJ4J7+8diHpZ/M2FrdIwxQF4Ea
         50Mg5YAyIxDJajgsBWupHK6bROao894JPEEWyCG1mfKizxOgn5Q7QqwOsiOC3wf55BZx
         k9C2yDoMVRKI6y0Qw2U5sx4rPlCYTwAJSUBvgfVtZVhYLAsdJVwmX3+d1eFIAKgPfKv4
         ZyRMQKf1BF8Rqu8okk876xTr0pYd3uGizEYXCGhoc14t+m8zJVHp+sVU2geiTj3Mry3C
         3Rvg==
X-Forwarded-Encrypted: i=1; AKwUvBwfQkD6iiQEJUkLubC6qv3nKT1GHcCHuCkEZ8mam25g/owEE6g+919xC2nw1v0qcfKCucsY2LYnTfQh69M=@vger.kernel.org
X-Gm-Message-State: AFuF++l3UIupxqyarOI1icyHjvj11ECi+aDoxfKWCn6TKAttM8HlmFmY
	kM94kt18RUqrNVJomCFgsS8BxGgVLUq4Io6V2rk0zSZnLbLT028gwR+hG71nkVNQZygN75rDSUU
	kgspJRwPMt04yPaDcz2ZxzL76hJeH5tB4cVs4UrALAjinttn60eKYn9Grc30HhYLJHg==
X-Gm-Gg: AYBFou2+Nsvo2qox3nA6LBIB0O6TOkMeS74YFKbqOgfF1jzeHV8oDMGA0gAiR96uoQs
	wLWJrw7irlEgs6hcCujNVAPzVgfJ0Kvb+ybo6EBs0B7w3P4Vx1sFfFo2QZ3jvJ0WgY3qOrnScBV
	Sw/UBy7PmB2Baxs/2apa9HxPtVMbx0bilVKV9h+rGA4ttIC24XviQ1ZIBGGRLGAztRGpHjQ+cIY
	rtSQby8+y+EpcobU7PBMd8m38Y47Psvadc/5nu/QBOcgfYwOmib7h8LY2iwcOaF5X6GqPlO7KL0
	+DPMQj58vvFWiYWw2r8cwYHuCwXkiPAD7fwa/lNRWbLgs3/QcA6Xr+MWzfVsfQw/XpOsV70LL9Q
	QvhjIFTyPEKxooztfnUCDqCs+ZLvkOTa2at4wZJuLlw==
X-Received: by 2002:a05:6820:2008:b0:6be:8d11:a077 with SMTP id 006d021491bc7-6c542d2884bmr578893eaf.67.1789365760272;
        Sun, 13 Sep 2026 23:02:40 -0700 (PDT)
X-Received: by 2002:a05:6820:2008:b0:6be:8d11:a077 with SMTP id 006d021491bc7-6c542d2884bmr578855eaf.67.1789365759829;
        Sun, 13 Sep 2026 23:02:39 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4ed64fcsm27179423eec.16.2026.09.13.23.02.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Sep 2026 23:02:39 -0700 (PDT)
Message-ID: <554580db-4ae1-4308-92e6-2f010afafdfb@redhat.com>
Date: Mon, 14 Sep 2026 16:02:30 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/3] x86,fs/resctrl: Add resctrl_arch_preconvert_bw()
To: Ben Horgan <ben.horgan@arm.com>
Cc: james.morse@arm.com, reinette.chatre@intel.com, fenghuay@nvidia.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, hpa@zytor.com, corbet@lwn.net, x86@kernel.org,
 linux-doc@vger.kernel.org, dave.martin@arm.com
References: <20260911163613.1131447-1-ben.horgan@arm.com>
 <20260911163613.1131447-2-ben.horgan@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260911163613.1131447-2-ben.horgan@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/12/26 2:36 AM, Ben Horgan wrote:
> From: Dave Martin <dave.martin@arm.com>
> 
> On MPAM systems the rounding behaviour of the MBA control would be improved
> if the rounding in the fs/resctrl code is removed but this is not the
> case for x86. To allow any rounding or conversion of the bandwidth value
> provided by the user to be specified by the arch code a new arch hook is
> required.
> 
> Introduce resctrl_arch_preconvert_bw(), and add its x86 implementation.
> This is currently unused in resctrl but when plumbed in it will replace the
> call to roundup() in bw_validate().
> 
> Signed-off-by: Dave Martin <dave.martin@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
> ---
> Changes since Dave's v2:
> Split from larger patch and add commit message
> Update kernel-doc (Reinette)
> 
> Changes since v3:
> Swap parameter order (Reinette)
> Change summary prefix include fs/resctrl (Reinette)
> val -> @val
> Add Reinette's R-b
> 
> Changes since v4:
> Set author to Dave as he wrote the patch
> ---
>   arch/x86/kernel/cpu/resctrl/ctrlmondata.c |  6 ++++++
>   include/linux/resctrl.h                   | 19 +++++++++++++++++++
>   2 files changed, 25 insertions(+)
> 
Reviewed-by: Gavin Shan <gshan@redhat.com>

