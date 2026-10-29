Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793278296;
	b=Ow0zxAcEQKTUNey5qcqMGXA3DZzoEnkrZY8AO/rjFIDq93Sj5c9o6xBHK5HQyC70kmiN
	 GewkdYVVBgpv0Ii6fk4SfiFTA7pUP95Edni+WxJ7SWlnhur854GNdJdQ3z62ayDXsUD6Q
	 YUAJw4oh6I1G/JP+XVdS1idR9ob+9iQZhodIMXnA18qK4jiTXeYN2ma7/+7L0FKA7GQ+m
	 bGCbHl6nM0C+N/n2WkbNgqjBsWamkIZFE/2cdRcua4373oStcUyJbFWLiLId52dPbR+kY
	 ZXV1RGxCecyDPcWXmglwkdjUwjD7/49x48ots7MP3KfMZzdTy9z31HSS3W6YnKxiSjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793278296;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=S4C/dQqa7LqoTqkk4J699ibneYKmOwTiARwAbm/vxVE=;
	b=IA1n1512Hh5NaT/Lsdz2J11TkkSppA1SFIEOb1DotxG83c1/jU0pzdbVyLEKkG2oCARM
	 fghNLg1YrBqNA6xqmPjznPAvIbH/elZeMNI1viNB5j/vX3ho90/Myxi/nHUZF2gVrMI3V
	 qHUBAKq72moEnwixgsNWBYy4d3xMucqvt1mW7f3GQxJcY8ZU6HN9+j1rUD7lQg1YN6736
	 zqMdqRuPsSKZEckxhXGrxx+n8kgNiUSPh9jx49ZNg/+mQjtS4L0M0KiANuGRtC6/fCi1i
	 2e1D6qm05HaTle/vGAuNZgBRsHwit8Q+kjWLGdcVw/6bCqcsFU23mFZYfDqWHw9KCzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=layalina.io;
	spf=pass smtp.mailfrom=layalina.io;
	dkim=pass header.d=layalina-io.20260707.gappssmtp.com header.i=@layalina-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="eirmlC/E";
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD64606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 12:51:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6AD64606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=layalina.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=layalina.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=layalina-io.20260707.gappssmtp.com header.i=@layalina-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=eirmlC/E
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so6441845e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 05:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=layalina-io.20260707.gappssmtp.com; s=20260707; t=1793278294; x=1793883094; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S4C/dQqa7LqoTqkk4J699ibneYKmOwTiARwAbm/vxVE=;
        b=eirmlC/ETOOiJ1hou8BsmirSnWK0zIRUTlC0a3sOSGq2KER11it3h8jH1ZYgiSuB78
         oazW9qMBFu9zlYs5GzhIJRGomKgI+0BNw2aAsY/td+iKoZoYOc5Oc0nKbcBvnfJlFWIx
         jOMLXPAYTapz3WV7xt+W0ChDJxe8i+fFZ73uJPoHpg58EMieco+7cDQLAD3YEyEe3oS3
         0yurSoTutPQN+7f0KPp+fUjSTMnC1DDdfv8Bdq9xXFxoUfNjMkrzAuLtueqOAXEdKCXc
         R61JAJridr+sViMKaRWB8DIFFlCo+N4QQx+mf9IbX7NMQ/k/mdI3HjsVnje+5ZymWB9V
         KmwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793278294; x=1793883094;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S4C/dQqa7LqoTqkk4J699ibneYKmOwTiARwAbm/vxVE=;
        b=UCTvFw1HpyNfDFYwJnp2AF+si+ACDFPLao507oeVcN7URDFpMCe4IqcIGzIYkOdGDD
         WWQbMw9FRAkbr3kYM6MO5sz4FkqKlb386ghySpqcOI2nKp6AZAR082gz+HBdjG7+SMvD
         TV//6D87Lax3JMvYz0Z1dZbVHJBh7AkeMjuW3pDOEx9luEqW7Ii/ReQgL4AR1MzWywmO
         PYt2DC8OMSV/q7IdRcqm0gDVwcQ6mCa0k6mUt2d7/+hacoiu6bIQKdI6JO06AQ5aPTcn
         wD8k2dC6yKb24ONh/DGTRPyS/HWjqcV/gganEsnVJOXEu9XbdICoD5ay6Tj30Jsf0M1d
         PrCQ==
X-Forwarded-Encrypted: i=1; AKwUvBytL6vXSGPRNzxfjmw/fm8zTeIUJKr50QErNuSBtEInw8Xyno6cxtFwfbSTFcfYJvlAmUO6EfhCdzj8GXs=@vger.kernel.org
X-Gm-Message-State: AFq9FYK2NSHXudTrroo65opNLqDaUKMTFQ2e1XJoL7ZEWB/6A94LBEjD
	2q+IQ7WS7rHVTwBh+fhg047YqrcmkhFw8uM8D/W9a5mb8XG7F8ingJtFRLKFAF3T26E=
X-Gm-Gg: AYBFou3MF0/5nWXgcgKxtdmqtYXVYk07VNNvRObOWKibO6dcWXYb5SbdZFhAj6mT9Ai
	yfK8zY6MXYZ2WTYnbSTKNHa3tVu03vuEB4Jh8B7KoFTwl+SIlwW51mnsqbOSl4FoXCd3XjkHn0n
	x3x3kedvK1d6ZUGriAbEndNkVoTAhSix2e1PXSlgrSDebKKpSeg1D+gYJHVdbn56I/2DPp454sP
	BEfmsBR026gFFDKZPw95bIqPIZGk0kuZE1QCT1ueo+8WvjgdACJ1LKJJqdYjzk6CicxRXUpJ8NK
	evXgtv8WexOi4S9J0UPKe1yseTEgot3yXTWBEeruT1kCRYkioQP9RbJmZ0aM0dsHCaS1fx+r7As
	oEQq1vY0js+YHUQrRTf8pgKnKZz/VkGSdx/kUTLmzVgZDZf+4MlXwtOFkBFG7kjMcpqzCYVnR7K
	k6c7ZfRtZ29Onfg0Y6S21hdpzLpAGFWOokexTGrtccWSu1cDwKC2t+XoofrJ1ZDbcb4iYCqIzgt
	UcFMYBefnFHQB1vQ1hTeMP2Q7EMdih6xEMSZKKWY1Pkn9HKoFNZpaKho/VeNd89loe2O9uY0da+
	+2ZW03HB1wv7KceGLGKzJb3MnkZRjB4eyP/QBBcd8NuLqDdHxzBgUbNrnBeQW3HQaGo+IDsM+m2
	t/cMsi73ZlYwHpd3mqZYC
X-Received: by 2002:a05:600c:4694:b0:4a8:a341:2377 with SMTP id 5b1f17b1804b1-4aa86a4250dmr62383895e9.3.1793278293251;
        Thu, 29 Oct 2026 05:51:33 -0700 (PDT)
Received: from [192.168.0.219] (host86-128-182-179.range86-128.btcentralplus.com. [86.128.182.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7ee57594sm63155025e9.3.2026.10.29.05.51.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 05:51:32 -0700 (PDT)
Message-ID: <51eadc2c-e4e5-4f64-b1f2-87f2620969b8@layalina.io>
Date: Thu, 29 Oct 2026 12:51:30 +0000
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
Subject: Re: [PATCH v3 1/2] sched/uclamp: Fix race condition leading to
 imbalanced uclamp_rq
To: John Stultz <jstultz@google.com>
Cc: Ingo Molnar <mingo@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Christian Loehle <christian.loehle@arm.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org,
 Wei Wang <wvw@google.com>
References: <20261028020512.10245-1-qyousef@layalina.io>
 <20261028020512.10245-2-qyousef@layalina.io>
 <CANDhNCqe6qSfCFvXy5qT62uKO23cBPXt6yBbTQtBUDJE0RPBVQ@mail.gmail.com>
Content-Language: en-US
From: Qais Yousef <qyousef@layalina.io>
In-Reply-To: <CANDhNCqe6qSfCFvXy5qT62uKO23cBPXt6yBbTQtBUDJE0RPBVQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/28/26 17:18, John Stultz wrote:
> On Tue, Oct 27, 2026 at 7:05 PM Qais Yousef <qyousef@layalina.io> wrote:
>>
>> Static keys are not guaranteed to be enabled atomically across CPUs.
> 
> Nit: Not only across CPUs, but also across jump_label callsites!  I
> believe the enqueue/dequeue race Wei reported happened on the same
> cpu.
> 
> thanks
> -john

Right, this is news to me. I'll update the text. Thanks!
