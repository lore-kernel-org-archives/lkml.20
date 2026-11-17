Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794932582;
	b=WETku+tn9cJs1zKPt1T73o8Izmlhm4H5xnQF2TqXJKjMcnjrtlK3U7VsbMU9lF8615qE
	 VdXiCAwgf/OvqmawwyJW8Lfm1qDtgp5Z5hHde7OehTfIE+jtE/UZhjPzZAPo9VbV73uNd
	 SZQrhD3jjE8kr7h4K4FEp8vWSOuv36meN1p8csVYagsf+XetE3cozvPWhpoBTwZeT2Rob
	 a3eSvs9VJVipBg3BlVq4M4Pe/XX7r8HyCVutCkxtsBLDfnYBWaUde8Y+Cm54RRSq0eXPR
	 kZygX8efiK/qLd6luG+O0GFnFMJ6IztWsuwxSlytaBtSvQ8XqjTiORtpWj/I0ZZdSEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794932582;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=grJoK+18+h3lRgJDxuY0z4u1arzCjZYyT36BXVitrDQ=;
	b=KFS8QHg2atoCQogPDZqa77i/RUbGyYy10jQLYG460vzLtoiRRbGmLaEL0R/7maZFqZtc
	 KUz4LrVj+pXX90RsL8wduk8z8btKjNTQcqDM+a2jz4MffJDtr8a3Rr+36juLHhGjpVtDj
	 06+fkvuegTzU8Psfmatvv2IPnQ65DJXCTE2/6pbGEZJ7J1pfcyyrOQvzme9KYUm3aSqEU
	 +TtfImA7KX4MJryroE+X4q1ChbbTaj2MPEFwknq0Cy+9TU747SmNGVJuhlP9QgQn98yQZ
	 MYHms3LAo4vcG3pDWr0JbsbAAdmt8Bewr05yYVhc9psoGtBqzqbW3ieS69YbXLv8sLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b="fLd73/om";
	arc=none smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C006606A32F
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 16:23:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C006606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=fLd73/om
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b47c1a3c74so7248371a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:23:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1794932581; x=1795537381; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=grJoK+18+h3lRgJDxuY0z4u1arzCjZYyT36BXVitrDQ=;
        b=fLd73/om03YWUuDkOuG8V/aIaHAVh2WpJzBN2iOKh+k+MsBvT9UpuTk1k0fmFemwIy
         G79toC8ssyS6czusYcryxSrGNhzIe7PDWG9Lkm+l7jMYvGO7k8p/ak9K+vUJFpGCrn0a
         OQ8EbHVHIUPg9bmNyz+BRf2m4rrcw+CIEwLmg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794932581; x=1795537381;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=grJoK+18+h3lRgJDxuY0z4u1arzCjZYyT36BXVitrDQ=;
        b=vy//AlQyXQo1jjfX+MqvIi457C991N5DPc0f3/1nQcw7a4SbW47xp/bjYnSgXiFbvE
         HZrybkCzaxwbZCW/qUegNzBnwd2XH9vKUAZsSJ/VjlhAu2H1rNSqyMgkDM07cl5Tgxw3
         VeXp7lz+oZ/GpDpflQsdn/1Z75EtOPNstdg89FBpOSs8gtWAt9Hgl84GeI4iTI+3MCDL
         Ug+LdkQdYjgBJe/+MoPRTPs5VgEsZEqjPjyIHmOeITG8SqSF9RleHB4B6MwZSJdnCC9e
         5kaY+UVkfCJ+Ipk9qUPTxQ68HWFN6CLVMSfUEBfTYbm+6NipaqLR9SoEPJQQto47eidA
         GVNg==
X-Forwarded-Encrypted: i=1; AL+hErEM5tzZPojOFobcBiqf243Mr/hxDjmKFHg1d49nsEQe6ZJaIKWfVmg7eh1/JqM4QiHesG+ax3CvmMGGnBg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ho/MD4+BvtYDWlH16lzoX63iizCPa1LR4iqlWV4+uHkwJsWE0
	/z4fKZBecvHxcYJqX2iaJ0aBHoWxjgmb3tXrpgXnjL8ZWikhn6WldVJ76lRZPen2etsC2xSDLjZ
	aBKTWMUOzPA==
X-Gm-Gg: AYBFou3nLeFZKzWvgJCiQHEepRO65c9158F/3IoVMU8+gN7bxgzr+oNkZ/kVTPNv1wf
	6CEL7q+0tgocctypg+Ybg8G63aV0LPIZrVryqAr4qy9J5T6lQDzZPtcc0nDUsdyptQNQFDnvq6Q
	l+HJaR6zp9VnFsNYrQVgeLRBot6kusM1bmublFJ6Wl8vOqii2WpAnxiikLR959DK/2LFeP9xSeY
	t9dFVuk6jCMNF7rEL8yIoOkeiA+svpEw5Xffwu6qXjX/T7d7BPqnAWCBXHEcPfLg/7TI+PYrcJc
	iEV+fAyFtWUcukvpWH7PmaZoAe8j4tfmO520yaIfArSOTYfkxnq3+/R8VLxoz4oASjFYF9EszUs
	tmecXAIlQPSlvtN54+u/smuToZb6AERzVAhETlb99aaz3XU6fkmMyAPI6/29eBRklBoF6+pDKDc
	bT/hibZg4QL1qnk7CSm3i1JTFTYBT6WSDdIZjHzsb3Gx+Qz5XZ6OGt1AFSeAW7tJC6OyV3wU/6L
	/UlnJq7wNIrjt+T35xaMd4tpX4/smUf1x5fyo2o3zZkC08AUa6nTUuBymTD7y7O2ic1g+W5khrM
	BBsXXBRBFExZgKm1rVHvsJ/6bb57P1jOmgV4VK0pbFVRn+iZfRUsVro4F+JEwYMhztGSezp71fk
	/zVb/
X-Received: by 2002:a05:6402:4504:b0:6b7:c1d4:ec3c with SMTP id 4fb4d7f45d1cf-6b7c1d4ed98mr10452930a12.0.1794932580551;
        Tue, 17 Nov 2026 08:23:00 -0800 (PST)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com. [209.85.218.51])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b886bd1d3fsm3754a12.25.2026.11.17.08.22.53
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 08:22:54 -0800 (PST)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c4cb6834eaaso358394966b.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:22:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGlfIX4EZI95EAnKxC4RbUfhq4Nu6vLfkTA9gOxKxvSdg34vvxZB7G3OvMwOflIMS5vit77U3a1/CHWcMw=@vger.kernel.org
X-Received: by 2002:a17:906:7955:b0:c46:7ec3:fdfe with SMTP id
 a640c23a62f3a-c5096369c4dmr1218639066b.19.1794932573142; Tue, 17 Nov 2026
 08:22:53 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111-pipe-epollexclusive-wakeup-v1-1-0af6283e9fda@columbia.edu>
 <avxWKI795DthE8Sb@redhat.com>
In-Reply-To: <avxWKI795DthE8Sb@redhat.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 17 Nov 2026 08:22:36 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjOq+G=6gte4vX_YxOD_VfE1uZh7=+KHs8N0wU75xyHEg@mail.gmail.com>
X-Gm-Features: AclHuK88r0MdvPyPBWEFngj9XAj85-331AH_Da3bLeV6HCZQzC7nMHyp9Qr3R6o
Message-ID: <CAHk-=wjOq+G=6gte4vX_YxOD_VfE1uZh7=+KHs8N0wU75xyHEg@mail.gmail.com>
Subject: Re: [PATCH] pipe: keep per-write wakeups for EPOLLEXCLUSIVE consumers
To: Oleg Nesterov <oleg@redhat.com>
Cc: Mani Tofigh via B4 Relay <devnull+mt4022.columbia.edu@kernel.org>, 
	Breno Leitao <leitao@debian.org>, Christian Brauner <brauner@kernel.org>, 
	Mateusz Guzik <mjguzik@gmail.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	tz2294@columbia.edu, stable@vger.kernel.org, 
	Mani Tofigh <mt4022@columbia.edu>
Content-Type: text/plain; charset="UTF-8"

On Tue, 17 Nov 2026 at 05:27, Oleg Nesterov <oleg@redhat.com> wrote:
>
> However, EPOLLEXCLUSIVE breaks this logic. ep_ptable_queue_proc() does
> add_wait_queue_exclusive() if EPOLLEXCLUSIVE is set.

Christ, how I hate epoll. It's a pile of stinking shit.

This literally violates THE WHOLE AND ONLY POINT of exclusive waits.

The rule for an exclusive wait is that it *will* act on the wakeup -
either by consuming the data, or - if it can't consume it all - by
waking up the next waiter itself.

So it's not that "EPOLLEXCLUSIVE breaks this logic".

The logic is fine. EPOLLEXCLUSIVE is broken beyond words.

I really think we need to just actively de-emphasize epoll. Starting
with saying "you can't add EPOLLEXCLUSIVE, because you don't honor
it".

               Linus
