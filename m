Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAAD43C416A
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 09:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789120079; cv=none; b=Bu0IsZet+lC4tS337f1u/yChS1I++XnDs6TWadafpbPFUDjCQA193ZIuxjov6CGsBQ0UEgWF780wsGsmpyYPhyLXCxANnR3BZC2ErgzfYqvB4aS241W48Kz7XRhllKHBw0C7cWmySmqUDu4LleHkldPxJ5luit/7Kb8x9GzBObM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789120079; c=relaxed/simple;
	bh=EFFfHYsrmwIYMEV6RQH7YCLFN9Vsj9EpQRZAIMPblLA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pRx7YDO3XozQe71f23CwRYleXLSNjeSV9lHgPasukc8g9Mi5W/QVf2vEBPY1SYgJhYz100n31OOD/R8UuVWTZRTmnvhye7H6suHtPZQRic8lGN7fWy10pfDEtTCCXjHG42mOu/US6Hl32OYCKlYmwKntXlkzySYrwpzAsa9PPQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ren2KgEx; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=rhvGKBC/; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ren2KgEx";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="rhvGKBC/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789120076;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=45A6Zdox+gTv7MNeziUH9YCoinVqVVTAj3654cxY4Zc=;
	b=Ren2KgExQ6wWGupqCBahqlII4Vui3vpmhtw3HW4A33fJItBAUMle6jedrjEJzzcRn2aptn
	lgHjsz6GQIb/NqhBoCNy3KgVwkSa3iCjEq9JgcQGV2dx4ICA/W9EPj139WEfbHfU+PlNnc
	TFnO+7Moy/00I5eA3CSFHkmozjEPfPw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-573-as2KeUaDPcGYSDfe-VXraA-1; Fri, 11 Sep 2026 05:47:55 -0400
X-MC-Unique: as2KeUaDPcGYSDfe-VXraA-1
X-Mimecast-MFC-AGG-ID: as2KeUaDPcGYSDfe-VXraA_1789120074
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-49d0ae342b9so5543415e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 02:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789120074; x=1789724874; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=45A6Zdox+gTv7MNeziUH9YCoinVqVVTAj3654cxY4Zc=;
        b=rhvGKBC/Ny7D2Z3l/Q96GIDYvlhvYtF6z0mmbkmlnVWXN+ge5LTXc+flDbksxJJNF3
         0XBQGdb0HVPrMsbiHUc7vbDL1PXEnwj03pK96avaBKE8A0uZ0wlYHzX8UWUsOYpwoRkM
         l6cK/YG63rvgx5+NdBKxc9GUaI6zD01qWaW/SU1nOFrnkdFzYGIesK6pCZtziUIR0M6c
         PoVZR3/SWRSSYQzl31RI6EAVPlae8lf7tTNWol3eU7Qx+ts+NU2Zvi33opKiR0iN2lnp
         F8CqcM9M2HBtTt1oh5p6zKOlmRYw/wb0dqAbeETMAzUd2jGikecBUHwl6opgv47wGnYa
         UcnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789120074; x=1789724874;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=45A6Zdox+gTv7MNeziUH9YCoinVqVVTAj3654cxY4Zc=;
        b=XzhweA+RDZzu2Hm2z62bcL3mrrVUh8gZY/0w6o64sxE5vOjruDLCT9R/D8Ece4SdP8
         ApmCjO8i9NwPNXgDOgW5ltsdfT75W+Mkvs8sItPdsEB3YGYthCmK+ItcE56vagCr14MK
         TnCNhqJqAEh0A103XY/73kSYEPsY2aQioWYhjwhdUiOn/Vg5iRcKJUbo+2IbJmam7W3H
         hduLodCFobcNvLkCPNT7/bYlCIfwUzBzWdkoyNkPqIeMnzVkT5gg0cC/3DfS32alHEOc
         QQS/UjNLeUyaCjZvflG0NZPMKEzdEjzNvrtVvf455mdsaFkR0Pv9HAohRyNy82pDaNKX
         83lA==
X-Forwarded-Encrypted: i=1; AKwUvBxI5x8HqskfSS5eMXidjz6IQbf5yp+vfWeY1WwieXXyD0gNhP/xYINUhm/zSKpAeCj3PT10QqbbmFkOwPQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lsZcVHPjDLNAzRKRcYCtzKSCYnnjblI/NR/46cEpu+uulzPAw8
	TnQz6QYuMgYO9aZaLmBg3NlSTgIJzAFNM4DEPOagGQ0BCfMSIKHYw0+qpYoNfTB1vwoza52lo84
	3c+HGj9Zg7lVj2WMW/tb2B5OqjtkmWrYpe0Ak3/QLBB6p1Tvx3vQwdNsPRCvXttW7Hw==
X-Gm-Gg: AYBFou3ej+aKKWekJfiID1WDOvHOKZtWhHfJlAnQa4c5YmOm9394AK2FKOOUnGi97Ig
	0a7eSMZUtDNrisQA/GbRsOIKI/jr1dunskIeKHfvNprhJfvxaWLY0D/G+IC29lcsheLKaawcMKn
	F/pSeRIZpdc7tTP0ID+NKw60lvKGtYl8RA5gHTo9+A9AduHvWaLGcUwJuu1KgOWdIgDyXZ8cduE
	pe6LnL3hpIjxjjlXjebynh7IB8/jMpOGNyvq9dvgWa5OPNZS1vkM6HAUjly06l0rz+HNv2IR3Mj
	+SBt9tELP0l6/ml6yJVDhjIeUTviXnQWNzHogvd7uySY4IWLeXlS6tYAwQh3ji+mqb2x6kGlfO5
	Au8ZC85P903sKPh1QSK1hM28S3NsswPxxbAz8jhgyAxWKsOzhWvm6TWgDUgBlQTU0quzYx7tAYA
	==
X-Received: by 2002:a05:600c:6296:b0:49d:191b:88be with SMTP id 5b1f17b1804b1-49e6164a26dmr36765715e9.0.1789120074347;
        Fri, 11 Sep 2026 02:47:54 -0700 (PDT)
X-Received: by 2002:a05:600c:6296:b0:49d:191b:88be with SMTP id 5b1f17b1804b1-49e6164a26dmr36765335e9.0.1789120073956;
        Fri, 11 Sep 2026 02:47:53 -0700 (PDT)
Received: from [192.168.188.218] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb32e6f1sm4703455f8f.6.2026.09.11.02.47.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 02:47:53 -0700 (PDT)
Message-ID: <9ba2c3d5-825d-4494-a0c6-d5c0ac699189@redhat.com>
Date: Fri, 11 Sep 2026 11:47:52 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 4/4] net: ntb_netdev: Preserve
 CHECKSUM_PARTIAL across NTB
To: Jakub Kicinski <kuba@kernel.org>, Koichiro Den <den@valinux.co.jp>
Cc: Jon Mason <jdmason@kudzu.us>, Dave Jiang <dave.jiang@intel.com>,
 Allen Hubbe <allenbh@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 ntb@lists.linux.dev, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260904052134.2970111-1-den@valinux.co.jp>
 <20260904052134.2970111-5-den@valinux.co.jp>
 <20260910172047.167225eb@kernel.org>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260910172047.167225eb@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/11/26 2:20 AM, Jakub Kicinski wrote:
> On Fri,  4 Sep 2026 14:21:34 +0900 Koichiro Den wrote:
>> Calculating L4 checksums can limit ntb_netdev throughput especially on
>> embedded systems, where CPU resources are often limited. A trusted PCIe
>> fabric can avoid that work.
> 
> Would it make more sense to prepend something like a virtio_net_hdr
> to the data so you can cheaply express more offloads?

FTR, I think it makes sense to consolidate similar code, with one possible
caveat: virtio_net is not spectacularly flexible in term of supporting
"new" stuff: if this use-case would need some special behavior, it could
be problematic.

AFAICS the intended usage is quite basic, so no big surprise expected, and
also I guess that only a serious attempt could tell...

/P

