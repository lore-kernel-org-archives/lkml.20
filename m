Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794335400;
	b=SVwMf4XnBQfk/QmTMjJv/k74zdrudlcroqh3VKhnRSBBRLMhwt7lM3pjteF2vZGeVs4g
	 CzKvVR4kyoE59pFyIGLEsAkiqxsFtpSGsLRN2tBOtVirXx0F0KzRsF4t7gserojUr8bET
	 ud5cXPBBw06iGswZ0VthXR1SIiQFD+K8nky5dSNISb7hmLJ7m/Kd3/nzzyaShWyXUfTpA
	 U0MzJXQa9f57FvwQRX59tJegRjLter3FiUdcN7qE8rApl1NaInxMxTVuSH2v/NyM6YjqZ
	 2W9M2kUsVP1vybGiWYOzWoax6Em2jMc9QDaBLomKpNShmQ02sIAX/oveDv7rZuVuI+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794335400;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=h/fDqdjeF2qNLQi3iaEH9vKqxnzXslPVSp3ugOVQ8hM=;
	b=ME9o0TpBDTdVjevys+kCfvIggOySAnqfJlAjRritFinsufj/RC1u9w6V0zgQuFQPJpKz
	 ldvfO54rVyIP0HFTvSX36I2N/QMX7awVA4P2CPBeewZZ2A2TRMseRntxRDzBjm6F36Z89
	 YqhvdcpN7Cpc+EXhz7jkPDDWBhTfxEwXyaxxXfqOPUPg+gXy0kRyf2bw300onW+reZx9V
	 rg2o8mGSOqiULPM1drEXX4e7IMzfn7KU16he/sbc1/ag+8Q1vPBjRavhhA1w3296AqoYK
	 uHtPEq81NhWBHNY5X+T9rLBRIfzlfjoPtAm1i+Vc6lVUuwnGrWNBf5I67ES9OnakVHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UdZdxJ6r;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88CA4606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:29:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88CA4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UdZdxJ6r
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e9f6a16afcso2455ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794335399; x=1794940199; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h/fDqdjeF2qNLQi3iaEH9vKqxnzXslPVSp3ugOVQ8hM=;
        b=UdZdxJ6rNZ3/kHowGOj5UNEdj7VsXtZug1Xb+yHljvFikFaUgmIpizg0NW0XHdGMVV
         PPOFVU7beNKvrmucaZ5hxkrE7+2gYv/Wka3wiiiieRRHtX7lLKr3F6yUarxVPYUCA2Fj
         Bpz74oq39RsKDrsPVzn3PUk3xfuts/+HurVfedeOrGe9i+CW4cWXOdvLTuo7XhLvznwx
         dW5VF0GzV1IAqpt8bwmJRvW47AlpZrWOnW2zL2euvhNvY8C0QjB2jkjLxUwfpXYjVcLD
         QQBazrZjNYXOhQU3wC76bm8PgtoYUn+bfik8AWnFXvJCKAj1FGejcs0ZgJO22cDIkdUb
         oLGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794335399; x=1794940199;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h/fDqdjeF2qNLQi3iaEH9vKqxnzXslPVSp3ugOVQ8hM=;
        b=TFU5lKU7/Y3sz4mtHAEdEHKSyTbmHm3YP9dHQQ+fHxpHjR1mUp8X+iEDv0qJc6vDvD
         Q7k5j0Pcyi26UFtujjPfD+YRMhE2m/v8ehMdS7sRAL31cC1X6vhSVx+XAtqEp/3tgpRd
         e6ESl5lHBd2YCpPfS3FtrVEXvcLmOtTaaM7xz7n59JeJ4iMZsPQVsdioOP4/zM/EKGm7
         7dRqDjJADD7uRJCcwbJ1RBlMAGVhewW8BRBNUPjuw2E0JwYD/OTnd8N2+7WRbuJtXz+I
         OZZBuYx5Q/yxGN2zZuCR9V3UFs6k21ycFyraHdxXDfKfApmjvoLgUR89/y3055E9o9qD
         BsnA==
X-Forwarded-Encrypted: i=1; AL+hErEA3i8gMPnWC1W0+1xBicB/VNCRr63WaQVbaarBu3NF2mQQH8Dd0iCDqjtnh86D3Cus07BqZAr8Txu1nZk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/n1lMf+ePA3F1ipoL9Qq3Ig2mS6mJGXEPavZ8qLzW9kckIuCjf
	bTbG9EHeQDmvXsvQ7GtOVo7tXijLehLtH0wmN0Sr2j3Z02Wf3Ky+Fdej5W4GQReZWA==
X-Gm-Gg: AYBFou0BuaTxp7Vzgcf0ODvYDZW1mmxkQnOSJWvqxL3VCoQbysESMfgb31qw2Hi3JG8
	aE9Btl2ebFgeS6P9DDJuB/xZNMYih205sj4Km1Tksii2Os5L+ufT85QCA6ZppkeJ2oQBBbSv4cD
	OORbtActdG2mq4yhwxIl7d9as94YUT0IamrNXCaLgF3uKKvJ9RyDj8AQMRfTbXYY2dfTTl3IBoO
	RMwGoDOhJgd/vZ3Iyyi/GbbURaThPIqk5JSG8VMFmDua1S9NYqqO5hhNHEx0WNca1Q/sZos2v5k
	r4durWFhokxtt3HJ87oNAmrFhi6NpHTAdmkLjt9gl2SJ9KHX9Yh2QgLSvuZYitfQlKx9sYifLBj
	DzPD5cX3pxilUSq1m4Qt5YX9DQj5txNcY/orOTDXFl7HN8nODSbgdT0AEuUX3yJHgatD8ad5+Ah
	BbZQZwQjWrvhtcnXN9+2ImFkSUrsbBzSYQEygGOsWu1JxkJLZ0GRGLbh2wZkGlD9loraaZZwxkV
	ipplO70AAIdUoB2cesFekkwqHuu651VLAMQqj6AA42xtr2BuEMwB2MzhnT6KjxiJErK8ESjMPMz
	mBewfGZmj1hW1JF8o85JC8/upr9SsIKpiqq2D6ddaoKPSXmYfW3Sj1Q07MZZaO44PAOww5Z3KIR
	0PJOetBYyPpTxciHFspVimZIBP1bcrL209dhUJsL7BvE=
X-Received: by 2002:a17:902:ce04:b0:2c9:b404:b55 with SMTP id d9443c01a7336-2edb81c27e3mr6143235ad.6.1794335398359;
        Tue, 10 Nov 2026 10:29:58 -0800 (PST)
Received: from google.com (25.75.145.34.bc.googleusercontent.com. [34.145.75.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6a4013csm12795005ad.1.2026.11.10.10.29.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 10:29:57 -0800 (PST)
Date: Tue, 10 Nov 2026 18:29:54 +0000
From: Samiullah Khawaja <skhawaja@google.com>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	kexec@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v2 1/2] liveupdate: luo_file: allow keeping private_data
 from retrieve until finish
Message-ID: <avNilY9saqTlNZNn@google.com>
References: <20261110175855.2437084-1-pratyush@kernel.org>
 <20261110175855.2437084-2-pratyush@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20261110175855.2437084-2-pratyush@kernel.org>

On Tue, Nov 10, 2026 at 06:58:52PM +0100, Pratyush Yadav wrote:
>From: "Pratyush Yadav (Google)" <pratyush@kernel.org>
>
>The private_data field of struct liveupdate_file_op_args lets file
>handlers keep runtime state that is not preserved. It is set by
>.preserve() and passed to the later outgoing callbacks, up to
>.unpreserve(). But in the new kernel, nothing set by .retrieve() is
>kept, and .can_finish() and .finish() always get a NULL private_data.
>
>Handlers might need to keep runtime state from retrieve until finish.
>For example, memfd will need to remember the folios it holds on to
>until finish so it can release them there.
>
>Save the private_data set by a successful .retrieve() in the luo_file,
>and pass it to .can_finish() and .finish(). The handler must free it in
>.finish().
>
>While at it, update a stale comment under struct
>liveupdate_file_op_args. There is no 'data', but there is
>'serialized_data' and 'private_data'. Refer to them instead.
>
>Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
>Signed-off-by: Pratyush Yadav (Google) <pratyush@kernel.org>
>---
> include/linux/liveupdate.h   | 11 +++++++----
> kernel/liveupdate/luo_file.c | 11 ++++++++---
> 2 files changed, 15 insertions(+), 7 deletions(-)
>

Reviewed-by: Samiullah Khawaja <skhawaja@google.com>
