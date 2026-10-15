Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E60486420
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792057356; cv=none; b=k1Fq+1iXSN9k4tp6dTXZAOPQ4xAOX4sDBkS9ql2xWP1wBzpmMzz6MAsCWPsssTw61ih28B9rYOBVIrbb43C+moLNEllxaMO6esPLvsgAZ6XY7anFEE7pd1hxtrg4QYeXhwPXHjCZnDOezQDP8B9m+3VKTlElnEuZ//HwT0gSzYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792057356; c=relaxed/simple;
	bh=yvq6ttRHPiAv8pkpttwMQSYUvX9YzAAnSIjoqjDDjuU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q0ydJKyF7B4sc2lLxbP5ym1YBYv25LJjS3nBeI5Xcjq5YPtoEi8P13QqBtBO5VaZjKBov4xEVI+QQgwi3XzZW1Ht8ZniDn2MdzHJr2PTR3yvtGj5qFIl4SrTP7E3JiGBLmzzLveKM3S8NhvRFn3naPH/9Uqs2AhyWwDMb2G9hOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JaKQJu/Z; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ep9xo2KN; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JaKQJu/Z";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ep9xo2KN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792057352;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zn1wkXYiN71d87RqqidqsthvjRH9zSTMQzZFpbrX5PU=;
	b=JaKQJu/Zs64Oyf+bByB3pta8z+buJWm+hYgAy4O6a5BRk62+UTpKLLUodGTVpOrRw0KVlG
	3XXQHoBM5vj6yfv5onev2p9nH5r4tincENgCQb5D3dBENvAuHaF6Y40Y06kdwZfp9GRRv7
	ZRUTiETrB+rq+Z6LisX79IzB07kTxzw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-256-iVaRGQmoOAeIGIu_nSvscg-1; Thu, 15 Oct 2026 09:42:31 +0000
X-MC-Unique: iVaRGQmoOAeIGIu_nSvscg-1
X-Mimecast-MFC-AGG-ID: iVaRGQmoOAeIGIu_nSvscg_1792057350
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a17b4c613fso26105495e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792057350; x=1792662150; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zn1wkXYiN71d87RqqidqsthvjRH9zSTMQzZFpbrX5PU=;
        b=ep9xo2KN+TLkHQiQNTDv4VWEzskqg2eJP8x3bhYMpkG3c7AeAAFx3iCLBb7Fy/Fj3W
         8u6N+ntLMANLrbO9iTC11eEg1onAeHFn5x55qTdg5GUgFmwxzV9ZXReQ2I0rDo1+i1nO
         g4i1iwJ80Mt4BFZju0Z5XQIMEzn0+N4Z/6SykLIXMDPFUVQUvsW/LPt1uRVAA5mEPL22
         OAI1pLyRdrvGV8veWV0+ew26gJMri50nJyJLYHoKcKFF1Y3l9AoHUfWk0q/VYlOxQl6b
         3R+G3yrOsLyaJss0AM92noPfrE+Wb2MhZodY9w5iEdEdYrHZfsw5gBBw9TfQSdX+Rd8p
         DKVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792057350; x=1792662150;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zn1wkXYiN71d87RqqidqsthvjRH9zSTMQzZFpbrX5PU=;
        b=gSn9QcG8S9mEWVPxfZ7bBasdGtElbHOUukGJsxOHaTEoc6FWKmM94u1977dX5Ij6jy
         GGSZEVlfpk5ULN5KlcOeTfDBveGLGC9bzJc1GExXxWhGHeKYF+QYl1IvO8lqLzRH4duE
         +C8KV/gioEDx5ivPT+zMp0GWtt53kh8c0Ep+f8V4Rm0SehFyfqx8dSJSffKnQYizQthU
         WNAurMr9IvH7SdOMOOz54CNPejYvtdrVg136dy17Td6JttH+/aDb6w1AWyR32Lfd4XT4
         oarliyxxChazxmRa78qQpaiISuqvQxTsZJ7pjfYo6fRQLPdG1Epin+P8yGQSAM5g4Dct
         +ACw==
X-Forwarded-Encrypted: i=1; AKwUvByvg1peE35LVKddjXbCMW2L0/HrcdR3gjFAfBUXtdhP5petxAKMC4xAWKmAqeAjq5CVjdh/X3V1GdhtDSw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKVUaxHM3YkIQ0akOPCJOpUFRaCw20ZVsgSSzH6AzY8rGZQtL+M
	Du+lGvZw+OceDtxYS3SuF+AqrYxNnG192rWWhyVCb8BjYqTrMnJIQGI++X4PQ2rWgOh++IzyV8F
	/hrmYvC/ACMXYgFNlksS+J1f/X2h56NETRooRbNnOFW+gqxTB9P0x8vnZWkKhOvn0kA==
X-Gm-Gg: AYBFou30Ap2Z/f5H46IIMXVoyO206gEyJAyikKONHTECibaVli5oTTcr1386ouyCNbt
	E67vSYDnv5RB6BvLKGbgbfKBjSqiNv95DI/DiuKxeVWtQRAJPu1Q3IG/hQnE/yjQ4aYKpIP2Cgr
	l322fx6b2As5cZiL93tkUNJf/bmy2dzskIp78edqKuaAd0WdSm5N75Ix3yX8mzdYStsiIaOxAqD
	fCM2u4V7jgs9sHmImVO71UeLvUx0wiPKIrLPSDrfmm9JSSgjJo1VlxETZsUoHTMwkwmw1hoHOeC
	N9bLYPEYjrh/6xyiWfXZzUriYwSlZDifFN1ghX5WN94hEEMUTc8NjyThZxqjqdN0qIrwOAFaoVM
	iiAVIUYngpAKdWOxOHSW9fT6DfNPfKAedss6dbDH3UnLAphqq7YUfMvIDxRLhewotKb5ULAp3hg
	==
X-Received: by 2002:a05:600c:e549:20b0:4a1:96cd:2f6d with SMTP id 5b1f17b1804b1-4a196cd3280mr199460175e9.1.1792057350235;
        Thu, 15 Oct 2026 02:42:30 -0700 (PDT)
X-Received: by 2002:a05:600c:e549:20b0:4a1:96cd:2f6d with SMTP id 5b1f17b1804b1-4a196cd3280mr199459865e9.1.1792057349833;
        Thu, 15 Oct 2026 02:42:29 -0700 (PDT)
Received: from [192.168.188.234] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bdc036a4sm65355755e9.11.2026.10.15.02.42.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 02:42:29 -0700 (PDT)
Message-ID: <5277963f-c6ab-4fa4-884f-82fafd98cfb0@redhat.com>
Date: Thu, 15 Oct 2026 11:42:28 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v12 00/15] rxrpc: Miscellaneous fixes
To: David Howells <dhowells@redhat.com>, netdev@vger.kernel.org
Cc: Marc Dionne <marc.dionne@auristor.com>, Jakub Kicinski <kuba@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Simon Horman <horms@kernel.org>, linux-afs@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261006133011.531806-1-dhowells@redhat.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261006133011.531806-1-dhowells@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/6/26 15:29, David Howells wrote:
> (This has been split from "rxrpc: Fix CHALLENGE packet handling")
> 
> Here's a set of  miscellaneous patches, mostly found by sashiko.  Note that
> a number of the patches have been reworked and reordered after the last
> sashiko round[10].
> 
>   (1) Revert patch to rxperf to expect the magic cookie at the end of the
>       request.
> 
>   (2) Fix the kvno on rxperf's test rxgk keys to be 0 to match other
>       implementations.
> 
>   (3) Fix the update of call->tx_pending in rxrpc_send_data() in paths when
>       the call lock has been dropped.
> 
>   (4) Fix rxrpc_kernel_send_data() to loop around on a short send.
> 
>   (5) In AFS, fix various callers of rxrpc_kernel_send_data() to abort the
>       call on send error.
> 
>   (6) As (2) but for the rxperf test server.
> 
>   (7) Fix the use of len vs msg->msg_iter.count in rxrpc_send_data().
> 
>   (8) Fix double IRQ enablement in __rxrpc_notify_socket() when called
>       indirectly from rxrpc_end_rx_phase().
> 
>   (9) Fix error handling in rxrpc_kernel_recv_data() to distinguish between
>       end-of-request from end-of-call.  Upstream a return of 1 is used for
>       both, but we mustn't shut down an incoming service call at the end of
>       request as there's still the processing and reply transmission to
>       come.
As per off-list discussion, patch 1-9 are good to go, and David agrees to
move them to net-next.

The other will be reworked.

/P

