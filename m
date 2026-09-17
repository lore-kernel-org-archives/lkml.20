Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B364A7CBC
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789639146; cv=none; b=XVjvKxlaSbJHRTf0zTcAAeVCjbupsP3OXR66Gxa4Kd50ts+U2PwHbcOYFbwL9nMcUzh2pwsD7v/hwgBZ3XgzHXnNkrVCGrP/5HU2uVKHwDAiZro2jc8xjzDmNRZQvB8Yy8KvEDxuMC95okppBMmKVjGHjLLrUG6SEF78a72jjds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789639146; c=relaxed/simple;
	bh=qlAJUbhxEsMqsfiY4VwCd8fSCzimFSpsZvD9I6na0pw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OG7Hul0bkctWE9iDqCN9qcB5vbfXJrtC7/5+L8Dg3hl3rTOiPCaOYcP0uaIJKqAXryGhoWGFeY7he1r3tkj8wGL5fKeKPJ+ed58v66Z7Ysl/aOojkl+x53rz2XRWUtqaDe3cyOTGkvfgZZXsvtKlHZlEAGDbLhp8Bm484MrHjGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YFCmXuo+; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=QSFDtnt0; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YFCmXuo+";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="QSFDtnt0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789639126;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=6f+Zrf4uWkEzkfo+scJJiZz78Boat0UEiRr2uAlpowg=;
	b=YFCmXuo+R9xnjhy7u2HDqkO45ncSQreiK+Pp3u4llYUGHEU7L4YYUwg+RzBEJ2CLaA/ksq
	0mlBG39qHUaz92vUpSIWQHLuABkGCzsgadKwBF0jujKz5otH4sqqNlW34JZPljsf/uvWSb
	NxbolQfZLvxyg0ZnHdps0bC/edkhhLU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-689-7-5gf6l2P4uAak5GgCE4sg-1; Thu, 17 Sep 2026 05:58:45 -0400
X-MC-Unique: 7-5gf6l2P4uAak5GgCE4sg-1
X-Mimecast-MFC-AGG-ID: 7-5gf6l2P4uAak5GgCE4sg_1789639124
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4994d67d0e3so5064835e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 02:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789639124; x=1790243924; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6f+Zrf4uWkEzkfo+scJJiZz78Boat0UEiRr2uAlpowg=;
        b=QSFDtnt0EVANSIxAahJdSEJrBiKqWv42HRu3CM3FwSvinpZ+HrnE1wmKz2ewJwoPm3
         2yfmWvu60P2/cldWJoqc68utyY4/HE1vAFy2+kT5fSs9HfTh5qGyLKsiCehyrmRB0lCh
         ULdL+gmaQYEWTYawdb7+nHeHEzRWB9Cp35HdNTCihAtO5JHxdbOY7RoT1hMxTbWEy2Kq
         CfX9sclReqycmKMXjzjoR5emRTl1BiblixR2udMRSlAhfKeEoE2pvcMlIOciHkgTARSM
         8Dwx9BCmmGKj3bPD/VcHP54jmWRzKBm4xoLj9IyX+non1fVPidf6Dh8bz7O4ZLPoV9is
         bIHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789639124; x=1790243924;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6f+Zrf4uWkEzkfo+scJJiZz78Boat0UEiRr2uAlpowg=;
        b=r8burdlmkR9eLnIWQYsmC+JAhi1eWtBDVSK6goAsgzaY4LNdU6Vg26zIFJ2nk0bU6D
         fAQARXl43SIqQEC8IUW7rDYS7xdW1pPtihyJhrDOK2jlxpBBmC3qLJGu4qyouXHjZp+5
         KoW7xvC3CgzVRe2O4OhjEx3M42myieVqsYt3j0WNzVVWxoxJzlpir/cNnM0c1Si5sBio
         BOty3s95E9dpbUtfD6Y40it1up9ZgboLqwsKT0SffZJLfwdQuOa1iOFVD409G0p0QPxa
         t3ItJHTxLjBuDpac3pGBSLqi/JO5sq4VUTBCosprMO+QGIY0m8K4eAgAkaDSsB2Mtd4b
         xspQ==
X-Gm-Message-State: AFuF++lBEvHFs4ZTkGfeo/2e4Sy+rZCvsBTgI9MZ33KFEzVncC+A7boi
	I0/SjA723XSTdBciNaKxt6XSYgp5Zg0XDsOSiD1jfBnggiA+KHpfkNw09Gonp02WjEfIii4JbuF
	rBXykc/P2lTpL7r7v2XsAy8J6FX6oIPy30qO6ulAnfRZu98mEsOnKoC2ifQoO4MvN7g==
X-Gm-Gg: AYBFou0sZXRyTWcmdSjNW3OU2gvwhak2CZblWRzcQ67iHFp1uMl/9+suSuEuPKk/LCs
	SvxO5G5ZCVgwJV5FqO2SLmW+SwkUPCagOU0b1gqPiZJ/IzhpEou4MexFK6go4c+uev4ckswtobs
	zQxkDkXVcamNUExE4XDs9/WPiEQIKllSo3dIX0HacwkYYwHE0XYMJdE/Wu+ccNMUk2cFhDXrupF
	pLFNTdPf8iqiepKintnJPERND7IKfRbb2EZD+cEIIe66Tl/lf2s3kXetJWu3aQ6Ndo+RBG/mKt0
	CnHb+l+b/ZdKxTgEjvgdQePyBjSSZ2pocZbn9Vl4dHU4Eu79ei/d7PG84/QXGXk/mVkeKRIqzw=
	=
X-Received: by 2002:a05:600c:46cb:b0:49c:eb16:9fd with SMTP id 5b1f17b1804b1-49eac463764mr73724155e9.3.1789639124106;
        Thu, 17 Sep 2026 02:58:44 -0700 (PDT)
X-Received: by 2002:a05:600c:46cb:b0:49c:eb16:9fd with SMTP id 5b1f17b1804b1-49eac463764mr73723915e9.3.1789639123613;
        Thu, 17 Sep 2026 02:58:43 -0700 (PDT)
Received: from [192.168.0.9] ([47.64.112.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf43511sm13327204f8f.33.2026.09.17.02.58.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 02:58:42 -0700 (PDT)
Message-ID: <1d4f52c3-2ec6-4f23-9a10-483601c0bd82@redhat.com>
Date: Thu, 17 Sep 2026 11:58:41 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] time/jiffies: inline jiffies_to_msecs() and
 jiffies_to_usecs()
To: Eric Dumazet <edumazet@google.com>
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
 Eric Dumazet <eric.dumazet@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner
 <tglx@kernel.org>, John Stultz <jstultz@google.com>,
 Stephen Boyd <sboyd@kernel.org>
References: <20260210170226.57209-1-edumazet@google.com>
Content-Language: en-US
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20260210170226.57209-1-edumazet@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/02/2026 18.02, Eric Dumazet wrote:
> For common cases (HZ=100, 250 or 1000), these helpers are
> at most one multiply, there is no point calling a tiny function.
> 
> Keep them out of line for HZ=300 and others.
> 
> This saves cycles in TCP fast path, among other things.
> 
> $ scripts/bloat-o-meter -t vmlinux.old vmlinux.new
> add/remove: 0/8 grow/shrink: 25/89 up/down: 530/-3474 (-2944)
> ...
> nla_put_msecs                                193       -    -193
> message_stats_print                         2131     920   -1211
> Total: Before=25365208, After=25362264, chg -0.01%
> 
> Signed-off-by: Eric Dumazet <edumazet@google.com>
> ---
>   include/linux/jiffies.h | 40 ++++++++++++++++++++++++++++++++++++++--
>   kernel/time/time.c      | 19 +++++++------------
>   2 files changed, 45 insertions(+), 14 deletions(-)
> 
> diff --git a/include/linux/jiffies.h b/include/linux/jiffies.h
> index fdef2c155c27202ae8ba910f170a62521294dc36..d1c3d4941854a82c4571032adb41ca57d5faa8bd 100644
> --- a/include/linux/jiffies.h
> +++ b/include/linux/jiffies.h
> @@ -434,8 +434,44 @@ extern unsigned long preset_lpj;
>   /*
>    * Convert various time units to each other:
>    */
> -extern unsigned int jiffies_to_msecs(const unsigned long j);
> -extern unsigned int jiffies_to_usecs(const unsigned long j);
> +
> +#if HZ <= MSEC_PER_SEC && !(MSEC_PER_SEC % HZ)
> +/**
> + * jiffies_to_msecs - Convert jiffies to milliseconds
> + * @j: jiffies value
> + *
> + * This inline version takes care of HZ in {100,250,1000}.
> + *
> + * Return: milliseconds value
> + */
> +static inline unsigned int jiffies_to_msecs(const unsigned long j)
> +{
> +	return (MSEC_PER_SEC / HZ) * j;
> +}
> +#else
> +unsigned int jiffies_to_msecs(const unsigned long j);
> +#endif
> +
> +#if !(USEC_PER_SEC % HZ)
> +/**
> + * jiffies_to_usecs - Convert jiffies to microseconds
> + * @j: jiffies value
> + *
> + * Return: microseconds value
> + */
  Hi Eric!

This now causes warnings when doing "make htmldocs":

.../Documentation/driver-api/basics:42: .../kernel/time/time.c:387: WARNING: 
Duplicate C declaration, also defined at driver-api/basics:436.
Declaration is '.. c:function:: unsigned int jiffies_to_msecs (const 
unsigned long j)'. [duplicate_declaration.c]
.../Documentation/driver-api/basics:42: .../kernel/time/time.c:410: WARNING: 
Duplicate C declaration, also defined at driver-api/basics:453.
Declaration is '.. c:function:: unsigned int jiffies_to_usecs (const 
unsigned long j)'. [duplicate_declaration.c]

Any ideas how to fix that best? Maybe the comments in the header should be 
just normal comments, and the kerneldoc should just reside in time.c ?

  Thanks,
   Thomas

