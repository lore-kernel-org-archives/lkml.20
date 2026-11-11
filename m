Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794394894;
	b=gzMbHdjSJihBPiB7rEUM1xtbQznvtdC5sTeT80DRmIAoAfgAA69Z5ang5jRCRPlS9a6n
	 KUj15nJJ1UCSGd1oHEe0Y8EprpwYnZ3qhHWzdafzd0zdxhLGlLWxkDhNny/mVh44nJWp9
	 s9FHo4ElKm74HnWVcthUOzlhbvyCSzrs5Ey3RafbRy3REveGssMTIIxhSkBrCAPQyc6RL
	 8PA6rRNQdPk/lz6A8yj9Rq4xkpyh0E8wG7s+/6OlZAtt7GOU+tuDQ/o7gxu80T1wgNzNj
	 zghzxsv1PCdOsujmmAAE7TTdKceuGCHpb0ZKCjz6zIrLA6H0yLiOx5d6aUiCAU99r4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794394894;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Scanned-By;
	bh=j68fncYFG3wRKRfnvYuffOG/HpagUvbeYFES/ium9zw=;
	b=GFQv9BQrQipwZ8QT1wUkZiTWuGhUVuoh+aRq9AVVdbBikr1OhwrzULuQ97APXWyPL/6a
	 nKQx56uQpYsX08ZSUu+dSQifRICVMK5Ap1AYKjDb6rTA5Z7IEoM/ViiDFBrB7kikv+q7l
	 CMQLHxBj9YXWAzuIpx0JDBYIhrUMQAvW9YE8y3kmcWW+igkKFWyE7C3OHa5BiWdyiuT9b
	 r9NBg02A47rgX3doab0rzegwXkGzvt+2ac2yXcVg372aYW3wlfXH7Zh5kajQ4z0JxbS+c
	 bFZhOYwGlNRFdJKs3DW+U2kGBiUcgVITExFJjom6R4Jfp031OHQAZ1PTykxI8CVNRiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BukZRDs3;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B839606A88B
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:01:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B839606A88B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BukZRDs3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794394893;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j68fncYFG3wRKRfnvYuffOG/HpagUvbeYFES/ium9zw=;
	b=BukZRDs3mS8DudYilkEODfDaN8a+zJ1l0Gh6O2YmLVABcXc1Ay17XLYGPTRk+h02gHNCXN
	cqILRv1lNywshNnpYfrL1idSZUO7fNgqF5pTHRyx75VdJMUaFEaTYKXU2D8AMK+yJHQ7Eo
	rVoZL7yU8CF0ICuBOIG42z3TYfQoDdE=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-223-rbdtinCuP1GMtHMkRB0Fgg-1; Wed,
 11 Nov 2026 06:01:27 -0500
X-MC-Unique: rbdtinCuP1GMtHMkRB0Fgg-1
X-Mimecast-MFC-AGG-ID: rbdtinCuP1GMtHMkRB0Fgg_1794394884
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DCE261955F0E;
	Wed, 11 Nov 2026 11:01:23 +0000 (UTC)
Received: from [100.91.101.41] (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B82171800495;
	Wed, 11 Nov 2026 11:01:17 +0000 (UTC)
Message-ID: <373e80ec-de22-4486-afdf-1a88f6207b9f@redhat.com>
Date: Wed, 11 Nov 2026 12:01:16 +0100
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
Subject: Re: [PATCH net-next 05/10] dpll: convert dpll_lock to rwsem
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, vadim.fedorenko@linux.dev,
 arkadiusz.kubalewski@intel.com, jiri@resnulli.us, corbet@lwn.net,
 skhan@linuxfoundation.org, rdunlap@infradead.org, min.li@microchip.com,
 anthony.l.nguyen@intel.com, przemyslaw.kitszel@intel.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, richardcochran@gmail.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, grzegorz.nitka@intel.com,
 karol.kolacinski@intel.com, saeedm@nvidia.com, tariqt@nvidia.com,
 poros@redhat.com
References: <20261106121005.1327603-6-ivecera@redhat.com>
 <179433320479.994134.13826920591104367019@kernel.org>
Content-Language: en-US
From: Ivan Vecera <ivecera@redhat.com>
In-Reply-To: <179433320479.994134.13826920591104367019@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

On 11/10/26 18:53, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found more severe
> issue(s) in other patches of this series. This mail is only an FYI, in case
> you want to address the nit picks below when you respin.
> 
> Low priority / nit picks for your consideration:
> 
> - [Low] This patch turns dpll_lock from a mutex into an rwsem.
> 
> --
> 
> dpll: convert dpll_lock to rwsem
> 
> This commit converts dpll_lock from a mutex to an rwsem. Core functions
> that change the topology take it for write. Netlink requests, dump parts
> and change notifications take it for read, so callbacks of different
> domains can run concurrently.
> 
>> diff --git a/drivers/dpll/dpll_core.c b/drivers/dpll/dpll_core.c
>> index dd09f52817099..8eb7468234315 100644
>> --- a/drivers/dpll/dpll_core.c
>> +++ b/drivers/dpll/dpll_core.c
>> @@ -19,8 +19,12 @@
>>   #include "dpll_core.h"
>>   #include "dpll_netlink.h"
>>   
>> -/* Mutex lock to protect DPLL subsystem devices and pins */
>> -DEFINE_MUTEX(dpll_lock);
>> +/* Protects the topology and lifetime of DPLL devices and pins. Taken for write
>> + * to change them and for read for the whole netlink request, part of a dump or
>> + * change notification that uses them. Driver callbacks are serialized by domain
>> + * locks, which are only taken under this lock.
>> + */
>> +DECLARE_RWSEM(dpll_lock);
> 
> [Severity: Low]
> Should the assertions in dpll_domain_get() and dpll_domain_put() be changed
> to lockdep_assert_held_write() along with this conversion?

[...]
> call_dpll_notifiers() can keep the plain lockdep_assert_held(), because it
> legitimately runs under the read lock.
Yes, v2 uses lockdep_assert_held_write() in both and keeps
lockdep_assert_held() in call_dpll_notifiers().

Thanks,
Ivan

