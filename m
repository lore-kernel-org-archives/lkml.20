Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1D1412C16
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 11:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790852835; cv=none; b=jRhUKQgncOkQaJ0Blj8UfxNPFTSmHiitz79MZss+ZdWRD2mUBRcia17J4RVs/R6ujnSR4fKBgcATkAjzVZDHnTwgdOItedgAGw+c1eD0bpannQR419dt8+2eIFtks2ZYsSQ28GNx8ImRJHPbAFG85+cF/Kp9KVzrY7rqk2xGIsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790852835; c=relaxed/simple;
	bh=eMsFAw52GsaIwv3mYwo6NM8p3v/Lw/GqgKOt6RvjOys=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MqRwh46OASFPQwMhDHdDhBYMrSxBzUK6OczKHpTWstTwJd9yBtxq66kM5XvXAvM0WSnaL/t4vAc5ce5LEXyAS9QpRdPkWUzRwSOligfxOPSZ5VbxsduHiWrKDuz7IXVn89EE5L1Jo7gvfP4SXoKIzu6L3eCkwzdqPWJdFtzJmK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FUQzSqSu; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=TzUvgG1F; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FUQzSqSu";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="TzUvgG1F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790852832;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SytabqJa4hnrYd8Ld5SFCWh0bYNMUzuXf4Di1RMQPxs=;
	b=FUQzSqSuCM32rnaA6twtxPWRBwABjXcVKVkXwNpfZ/xztdR5JEffJVx+3wKMTvex7FGC05
	cIl8x/5lNXfMboRcz74Lbi6YmqeKUDQvTgF7Dkh8Me3aycCDwm4H+ZgBpVqwKmDK2Ph5jw
	x2AfMz2LapGRVJjKNVl3ZoXdVQQCYzI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-471-MmNta3o9MReIH2hpf0jqSg-1; Thu, 01 Oct 2026 07:07:11 -0400
X-MC-Unique: MmNta3o9MReIH2hpf0jqSg-1
X-Mimecast-MFC-AGG-ID: MmNta3o9MReIH2hpf0jqSg_1790852830
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-49e635a6002so72260515e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 04:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790852830; x=1791457630; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SytabqJa4hnrYd8Ld5SFCWh0bYNMUzuXf4Di1RMQPxs=;
        b=TzUvgG1F6rulM9oNBMIl1JYH/iLAmzxvqpQnUznZbexaU7ikKUGN7CgRKBgowAYbkn
         46tMjcSw4jZu+I+wQUAwgL3fuSMcqzdJlZr5SOMuHXoDEOY7d05Oettcqw3j3meQusVw
         y/wQaTgeIKqLqW3gzGWHHeuHXSHZHRt9iHS/k2kNsom/RmTNSWYOuXExobP1m6zH51/x
         KaLOcONh8qPlLtmpLDr3Iqk+0Wx9G4WM6Qg2Ezlwd+hYk3vNaL7zbgN3HWz65uEgDxc5
         EHEGiSlSurXLaEw8zDKMvtsLPNw229UXMGBCjUkCBnTN+oCBXHlyx5pzN3VN5woTKyJw
         ctEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790852830; x=1791457630;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SytabqJa4hnrYd8Ld5SFCWh0bYNMUzuXf4Di1RMQPxs=;
        b=XtV5UoWqo4njI4rRtkNaG7lgjiA74MEZAG/01JXY8EzpFrCXriuZgQ4NsUFBGermFu
         MjeydNItgxQZKIWmFV0OL0OHIRBfCSekM0D4ta2uPuhZo9g+DVAe7R1vo/XPSfaNFcvz
         jCJhqcWRo5vvBeJvldMGkooENkhPAUySAjq3DaJi5hqEguNZJ+wJcUDjyaUehxBin05R
         DhNH5XsDAbPbM08chdcM0Gdu2hj9+joqhkbJ2JhJLYcfuKFAG+V23cLjC+sKmH0fK5c8
         Per1IYEGRdJeGKbGdOkWTDech8PyKIMejo43hfuf2HfRtljWMcdTKkcywQz0t6Mzsrzj
         +1/w==
X-Forwarded-Encrypted: i=1; AKwUvByw/PmZGs3c0zfRwCEx8kBTx5SVuKIudrr294W9JTI8aslDA3kXoKfuDJXXFveLmjfU4vqecp+r04pmkgs=@vger.kernel.org
X-Gm-Message-State: AFuF++mSsK0ZzzGmrcEbJP36BvUODulHbGEbCAWGSW7McrWq1w78DzJO
	xoVoUN1k5z7SLbBPHAwTkWPaSpyG6rXBIUWE6WsobxBmortexFtti6evcBjY9uNA7TY6UpbFCWD
	W2hWr5GNCGIS8BKS36TVYvgJ/KNisNJmKxPL8JXpi8oFslD6DSI0kv24bLqLXAWJl2Q==
X-Gm-Gg: AYBFou2CzOsjSRHxw6P1FpQvai2Wi4LxsOpEmIkA56owmuJj32UAltWyu6TJrA4IBQq
	DlusFRB00pK8EK9cdrkynexw6gqwPQqHZOIgBEkKW2q73xXcwkpymYfBQ1osOFCUf8TW/0NBOPu
	9JGTbNNzm5QDBj8+woPY+BTYJ2JbycRu7fxEMjVDVs0xu3dFkaWbMTihB5H7a2F6ek5SA74vTvo
	5agjfnlDZIwyuq4CO1AVrbAuswh3rbPqtN7vg4xmguf7YRXuGWp6/VXNWepTWgNmDO3J4ykTUvL
	tjR4I6cPI4UhpEKVEqB9EfDjVm1VgcEMpKQ4Qi3TOYR73afjvAEpMXh/qQrApzlZD4/GdQVILhE
	4zDGyMZ5zx8fBrBCt8InXGOmAfVpqj6//rUnfIZa17G0hlYjXyRHMJGibwYh52z71UWVfkCUClA
	==
X-Received: by 2002:a05:600c:1d0d:b0:49d:17d4:d6ad with SMTP id 5b1f17b1804b1-4a01b112cbemr68461505e9.23.1790852830018;
        Thu, 01 Oct 2026 04:07:10 -0700 (PDT)
X-Received: by 2002:a05:600c:1d0d:b0:49d:17d4:d6ad with SMTP id 5b1f17b1804b1-4a01b112cbemr68461035e9.23.1790852829579;
        Thu, 01 Oct 2026 04:07:09 -0700 (PDT)
Received: from [192.168.188.234] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f99a332sm112071055e9.12.2026.10.01.04.07.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 04:07:09 -0700 (PDT)
Message-ID: <21ba1323-7619-4721-bd1f-9ccbae42761e@redhat.com>
Date: Thu, 1 Oct 2026 13:07:08 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] amt: pull the AMT header behind the transport header
 in amt_parse_type()
To: Omar Ramadan <omar@blockcast.net>, netdev-bot+sinfo@kernel.org
Cc: Taehee Yoo <ap420073@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260928181557.85796-1-omar@blockcast.net>
 <179061960357.31693.937915571809434718@kernel.org>
 <20260930222733.47563-1-omar@blockcast.net>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260930222733.47563-1-omar@blockcast.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/1/26 00:27, Omar Ramadan wrote:
> Found by code inspection: an LLM-assisted review of drivers/net/amt.c
> while I was working on an IPv6 outer transport for amt, whose ICMPv6
> errors would go through amt_err_lookup() the same way.
> 
> It has not been triggered. I have no reproducer; it comes from reading
> the code. It needs an ICMP error reaching a gateway's encapsulation
> socket that quotes only the IP and UDP headers of a Request, so that
> amt_parse_type() reads the AMT header past the data it pulled.
> 
> Testing: W=1 build with CONFIG_IPV6=y and =n, and
> tools/testing/selftests/net/amt.sh passes with the patch applied, but
> no test injects such an ICMP error, so nothing exercises the changed
> path.

Due to all the above, plus 'broken since the beginning' and Linus
asking only for critical fixes at this point of the cycle, I'm diverting
this one to net-next.

/P

