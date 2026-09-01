Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB5D476CD2
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 10:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788256883; cv=none; b=l6geffCzUufi+uIjkqQYOeZHqTigmAjeZ+QlOTYkYT4D4B4gF30jCecy2uPJMec0Y46Uqf+9BIDYytMo1GdXSEAZnWllkiWnEKLfw0VFbe1SXtBld+n5v6tYxspb5hjWkCfS9OkLEepzag9tfwEUBnkcx9gFwkpRwzI6E+jAkE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788256883; c=relaxed/simple;
	bh=6ZttEQI77VGHxntNdBuD7O0pV0mlbBNMFoR5csSubww=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=us4V7enhpC6uXp+GSbvkZzp5e8GfjZyLsWH92Rd/q0ijRBdHAGTYdjWpWbgQZBcB9QMho41d2YYhC9vKhUlcV4EG87FH+bV9xhXIdEVfAap5OoU6gfFxEgWa8TKrCwmpT7qDBO1gFvAHFZhPYOZXG1fV4Ze+DmbhQIeMdfHa1Uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HvhRVosw; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=P1XcJuWa; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HvhRVosw";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="P1XcJuWa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788256881;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AuPAxLx/XtcAd+3dhLSFGMMJgYC24wb6aYaIL5HLVdU=;
	b=HvhRVoswEVNh+6jtmPbRQ0GcWOgIfW4Zh/ELojOSOCaIoBrC6N7y7EeViTXope0CcaK7z5
	+00Z8rMCFgwYQ8g4dXhGROhN5+q9GG1fepz9aq1UAVYCcJMBVI/bhCmWFXGfd1XTUqs/Me
	MZ69kIruSTUmIPBLd0dZV8dhFxr6wps=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-282-3yuX5uWWM6Gz7G4WYsyApA-1; Tue, 01 Sept 2026 06:01:15 -0400
X-MC-Unique: 3yuX5uWWM6Gz7G4WYsyApA-1
X-Mimecast-MFC-AGG-ID: 3yuX5uWWM6Gz7G4WYsyApA_1788256874
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4994cf6cdb9so32384805e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 03:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788256874; x=1788861674; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AuPAxLx/XtcAd+3dhLSFGMMJgYC24wb6aYaIL5HLVdU=;
        b=P1XcJuWaIEKqgeR98nPkRaF6Q+vacgkHAT5g43qXP0Lm7sa9IaXTfgBZSW8QDr1G9V
         Y4EGOiuY19oJkMA+KaZaRvrzctWi1AgDL3mahSvVqzdpGTdwJtwwnYC7EQnDcaMtzv3p
         QpC1OHjuTJku4Se+t5lPiPcysQa2S+WiB/2832MwbmkjMplVhZ+cv3K1qh0xV5jtH3yM
         vsl2kzg4sbDZLcIiHTTxGFGo7g+y9kuiaxzFVYZ1DJFl7pF1i/6ZeEfApWSJgdgiHmKp
         hfeJRG+xa3c2x/D0nfB7ohl87gpJ4zG2JOkE3OX4DmiY4Sshxm7XxMNwqDYIQvJpZ8Nc
         DfuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788256874; x=1788861674;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AuPAxLx/XtcAd+3dhLSFGMMJgYC24wb6aYaIL5HLVdU=;
        b=J0HLYvmIFe6cvn6VJ3wk0i1sAOQeMm6BjKF1UcSgkT9GVg4IKd9VR/x27fBbeYZG2H
         5us/A6M0nTC7fAtAPGV+eW4XSdwe86m+ejQb2cHO5t3ZY/MY6d6bL001naZNsUG8kKG/
         gIQZchn1GBzF2kozyGn8wIPlDCeJJ68SaDVH347395IQE0DDDyb82seDz6vJAy63HSWj
         pPLog4uOyYR3MmBavXMDghwH/sMbqAjJ13FQOIsnRSSuIHr7KkxmRW/XZUTfY5O5XkaR
         8QNCNB6G+lOHoJpgOHgv65M8Qj0xQ4lvxgxOs3kC87JZi5U0ehoVcM5Dx63eVEJAyqdw
         cL3w==
X-Forwarded-Encrypted: i=1; AHgh+RpU1PJPZo+VBSWi6OzM3OlQro2Q78SBrNG0MgY8uXbleKwDoaDxfvPR40LrE7jYDW/MDICiaZDVPQJIzlI=@vger.kernel.org
X-Gm-Message-State: AFuF++l1BEX5t9eNwfoYHq1PSW8y3IoQq1DWDgu/1u1eM4CtsYG+blEu
	lQCyoxGzy0KJMdMaon/NiK932N8MiwQE8WSQPxKTzTe7aji9kolnv8Kj8LKjTHISI8W4JjobaCD
	TvXLF5zmTenoph3aO5dwL7JSZUW64NBriR2dwuSSxZCuLJIiFIpgOgcOF+v6x9xHyUw==
X-Gm-Gg: AR+sD11VXc4w5eTIaXoCNX4ewSzxMP6Wjf5m5rODLY4mASoXo7+0LIcQiIO8JeWrttK
	Iv5lzrbqtVg4Xzmxi4o5HA0GocYdNolscetxWXF12Gz1bt1KHBe6iHrORRsDJXeGjnb0opu+jvr
	7+4d62bn+6izv4OJPOtvgoFR6RLEhmXtcAS7QWbYP8k2BB4KL7T+dImK0kWzCWoWL99B1t4EeCJ
	WkeSdQoIDsIW1BpXRZkMwJAinPk107DfMew1KuBtHJ9fw/eTy0bBSr3IOZ3Z4yMVal23Id1eQiW
	q7rtWfgMx68DXnkXEvhmzLzwJxQlCvaLJuYZOHd5LH1Umu58kY+OgT9EoiApjLb/HQcsjwHYK6x
	UIpkRjHV0TPpQxvfrTMEDQ+Vr2Dngc83y4/f6BzznEe/UKjMDlS11wijuCxg+03ovPCMrRzu+lA
	==
X-Received: by 2002:a05:600c:4f8b:b0:49a:2c4b:403f with SMTP id 5b1f17b1804b1-49b91c46494mr434457325e9.13.1788256873626;
        Tue, 01 Sep 2026 03:01:13 -0700 (PDT)
X-Received: by 2002:a05:600c:4f8b:b0:49a:2c4b:403f with SMTP id 5b1f17b1804b1-49b91c46494mr434456125e9.13.1788256873159;
        Tue, 01 Sep 2026 03:01:13 -0700 (PDT)
Received: from [192.168.188.218] (ip245-45-231-195.pool-bba.aruba.it. [195.231.45.245])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce10153sm61989385e9.4.2026.09.01.03.01.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 03:01:10 -0700 (PDT)
Message-ID: <924455c8-9f62-491f-ae3c-ea2127f46769@redhat.com>
Date: Tue, 1 Sep 2026 12:01:09 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: psp: do not inherit the Rx association on clone
To: Norbert Szetei <norbert@doyensec.com>, netdev@vger.kernel.org
Cc: Eric Dumazet <edumazet@google.com>, Kuniyuki Iwashima
 <kuniyu@google.com>, Willem de Bruijn <willemb@google.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Simon Horman <horms@kernel.org>, Daniel Zahka <daniel.zahka@gmail.com>,
 linux-kernel@vger.kernel.org
References: <BC10EB92-ABB3-41B2-AB16-266BEEBE18C0@doyensec.com>
From: Paolo Abeni <pabeni@redhat.com>
Content-Language: en-US
In-Reply-To: <BC10EB92-ABB3-41B2-AB16-266BEEBE18C0@doyensec.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/29/26 6:56 PM, Norbert Szetei wrote:
> sk->psp_assoc sits past sk_dontcopy_end, so sock_copy() copies it into
> every socket accepted from a listener without taking a reference, while
> inet_sock_destruct() puts for every inet socket. psp_twsk_init() does
> refcount_inc() for the timewait socket, so a child closing through
> TIME_WAIT cancels its own put and leaves the association with one
> reference and N timewait sockets holding the same pointer. Closing the
> listener frees it, and the timewait timers then put freed memory.
> 
> Rejecting the association on a listening socket is not sufficient: a socket
> can acquire one while established and then be turned back into a listener,
> because tcp_disconnect() leaves sk->psp_assoc in place.

So rejecting the association on listener, and clearing on disconnect
would be enough, right?

I think that would be preferable: it's a pity to add safeguard code to
the datapath due to a syscall (disconnect) used mostly by fuzzers.

/P

