Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794933315;
	b=ZGa4g8Npp6dF6A33he6B/FNxxT1MMlr9cJMENyN38HrmdHoBZXbU0sl+M2oeB5pq0nmZ
	 Ws/O/rqq2sK/ubLdG6lcSlgcshn1gpylRE1RLf1k/xbjzxNwVxqpaxvhS4CjVvXFAaeij
	 RoG0zI5YQ4twG2GizrxThzZ8s3yOr8AC10h6BQAaY4UycNVhkQ2ENR57JC6vSyNnEaGwt
	 Bxkp5V7vICCcMvYfuD43XJvfQfo38/Is+z8y4QC3SQYto6xDnyjy+HtVkRZ/o7RxF7opM
	 HCh66za89TQx3UXSGvk0EagFeolUMsmnssTUg6TejT37ufiV0FHK6o7d3p63yxWbYEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794933315;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Z8CIfRuBE0dh3C1ZRhqXdDSEMv+0cdiVuIl1a6bMpog=;
	b=HCq+kkdEkg73KMzjdM4mATnuDhe2Bl7+ZfbwHwXnnLDTPgCYNqEIGPDnaqhlOrsW8zoH
	 Cl1wkfTxfeZxvdEywIWgA3DLzg5hIW3jwnNaBcOxg9HwJzWaPketssqZC8eKZJwRaE7KD
	 wAE4fqzRUnp480fe0uuswcA2PITMbaavBdgDXq/s3nH85Tx5PjUrmN3zRu8+8RflivtYh
	 QU9qQX9R9wd96z4gtZxH1oF37Ui8DyuWrZbz5HJleebYWl3Y6Ph5WumnOU59JNQirO5BP
	 9dUXB1RuFDUGZElRycdT+8t9omEsmrAZ/9PGFyH3XHnJqKEtNb51f+N24xeQ0CQWeaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=NL1f+LKN;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 277AC606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 16:35:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 277AC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=NL1f+LKN
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-49d64a88222so739889f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:35:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794933312; x=1795538112; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z8CIfRuBE0dh3C1ZRhqXdDSEMv+0cdiVuIl1a6bMpog=;
        b=NL1f+LKNf7qtHZyu4eLYWe6ZW5SZ4j6EgiP1yDXe6LcPxfPvdXW35MhjKw5RvZyEVQ
         eGdkFzsBHyGkg5qsCDdP5ebgiy0Y68tQQgmQBlCKX3E2j/hh66S5I2f3V+Cx9hUnE16F
         afyiNglZB2jTv4pTR5wcCwLmJZOsiCRfcPb5ERdxOWE7X1gMRjGiOk4sCSY0DZSws0si
         qKPfgYJrEC9KT1CJJatuh1RqkeD2d9rwEMBIkS5lJ+KqrkBMC8Eoa69dZEPOfB5iC1Qg
         /Zwhm0KTA5CZsO1dmGlE7GcKBpBevILCxwvyR1jd3BR/GlUjW2qqdnYEcOD9CG/exJgH
         hcFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794933312; x=1795538112;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z8CIfRuBE0dh3C1ZRhqXdDSEMv+0cdiVuIl1a6bMpog=;
        b=B0HGpg7An9OKJHrpqn7JZXCYBE9Ct1FNDFKaTkUXLqhQRHeN+0d7ziFFZwMyTtnFaw
         jCgR0zspcEq1/n/8HMj8IqK6iod5iL0CjJJ8FKfcleukhrxdcGEoGD28sGwK7QMFiXfP
         /hvtX9EgTqX0hnCwmqWR0WIRVpLtCH2yqXxGZRStxHOdUVa1YCk91MnPwtm1TfHRWS/+
         AdcT9IYiRQv5CZfQ0Sa/8sgVUxTs/TUVYFKEPi+jfS4lyOWtWRHIROZMDyHJbF1s/oJ0
         Gao7tkd9JihARxkfJucO1pH1uh872Tk5FKnrs0hVgmGpl1rz42/3gp5m8CShePs1+T//
         kUNw==
X-Forwarded-Encrypted: i=1; AL+hErGEF9kKdD8vJZYTAW3oUVjl54gp9nAagaCST4c1Vv/KhYk6mUPQ+PXMZIqgNIQIyhL5FplN8S6y0scOZ2M=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Nx6L557mKljGbRJHzlKJkQnR2sQMIdsJfgbVjaus15COb4s/j
	9x4AphONfMRY+KGYrOqSU1u5vnO59th3aFQiHMGAEgX2Yf/EiQ5f8iNEeO0mrWCsgi3h6QQY4qp
	UyX0vw18=
X-Gm-Gg: AYBFou0E+48ENEx2zx5ltdYM3Tbt+EongHMZ5N3wEatgcfOgboHX5Wr/KnxVzYJFwZX
	cA53a4prTjj4wLkHnwuLfMjlBlZfFNrbYlMd8i7zmYKEcVvwKTJKu0jV9/qzvQeIzFQxgtDK6xt
	I7Izw4F3cGS9kBs3J0uuIM1MOKM9aOZ+bto6M1v9lBJNGXTBch7+HQt/djXv7zP43v6WiRRlEO9
	UM7M0xHSTyE47gbVzMXRluzP8olkAzOIf1kS7wu6ggOwPA7mdVlovMT8Z5IEM6cLk97Ptu95tt/
	CFkBzo77otBGWkAje9W4mOkeMwh7JVRFojhIJBUsez5j/+jRRqvgPYX+0E/M1M1+MCh5kFgDq9R
	nREN5JP8YZq1AjOtiETaANzTNPqYUIuYvsJTaqJEwWOZMgpO/Lkn+/uAEUuI/QBVjeEsYlsw9fX
	6vX4IeiNyU1FCCernIxzz0wvLSKbFfM5qbcKUQsV92Gzn/HKdDZt3TDUu5kRbT59vj+570UOi7d
	1EEU7V7NrFZhAh0tl05itmjn6Txi8b2PqhAL9st6Jz254IZcWlTYTT/hG1FNze7W23YfVPh7uIt
	7mVB4wNeIlOJclHf5Uw5Y9ECNdXdnT1Xw4rDy6G5AChPu3/ipwMVHXKkKp2HrNIBwMQZSLNMaMK
	pdw==
X-Received: by 2002:a05:600c:4513:b0:4bb:687c:4fbe with SMTP id 5b1f17b1804b1-4bb7837c4e5mr72201605e9.8.1794933312192;
        Tue, 17 Nov 2026 08:35:12 -0800 (PST)
Received: from ?IPV6:2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183? ([2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7838c6a7sm71536475e9.5.2026.11.17.08.35.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 08:35:11 -0800 (PST)
Message-ID: <9429350a-4c59-419c-80da-7f6d3768cfce@baylibre.com>
Date: Tue, 17 Nov 2026 16:35:10 +0000
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
Subject: Re: [PATCH 0/2] accel/rocket: Fix NULL deref and double-free in job
 submit error path
To: D D <dhabal123@gmail.com>, Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: simona@ffwll.ch, airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <CA+g3TbucTCsgvGaywNqyZdh5g-889zK06WZ57Mpxm1qOpgYTfA@mail.gmail.com>
Content-Language: en-US
From: Daniel Drake <ddrake@baylibre.com>
In-Reply-To: <CA+g3TbucTCsgvGaywNqyZdh5g-889zK06WZ57Mpxm1qOpgYTfA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 27/05/2026 15:33, D D wrote:
> Hi Tomeu,
> 
> Two bugs in the job submission error path in rocket_job.c:
> 
> 1) rocket_job_cleanup() unconditionally calls
>     rocket_iommu_domain_put(job->domain), but job->domain is only
>     assigned after all fallible operations in
>     rocket_ioctl_submit_job(). On early failure, job->domain is NULL,
>     causing a NULL pointer dereference.
> 
> 2) rocket_copy_tasks() frees rjob->tasks on its error path but does
>     not NULL the pointer. rocket_job_cleanup() frees it again,
>     resulting in a double-free.
Please read the kernel docs on submitting patches, you cannot submit 
them as attachments.

You also need to rewrite the commit messages to be easily readable by 
overloaded kernel maintainers. If you are including 10+ 
function/variable names in a single paragraph, or translating C code 
into English, it is a sign the commit message is not useful.

Thanks
Daniel

