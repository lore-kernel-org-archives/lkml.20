Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794444959;
	b=FyLZRXjJ1tSgOWRd5cbvJPPxQXfQZzNrRQLP0UZze+IHjPNwRWRb+6/mSANxwdxE7pdx
	 uAEacvRvRuoCpWlWyVZpu8hvwICqbmv//2r6CpgP5wWxJSCTNKG/CoYDKlgYWjdjyeMQl
	 kNmX9l6G7rIapYWiCpiuGlhMSr7eBMygJYbRzAePAXTzWncEDYrTDUS35o2Jq67nW+emQ
	 77T1foc0nKdDL0MW8gGesIGgMGcgGzmB4gmqVHpw2/kebK9bGBZywYSa5JM4jnkXvtyf1
	 0C00kjL0H74nR/Doir825eVkQ55ppSELDJEGpxQwDM6oc14Rk4owgQdmJirawHFStvQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794444959;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:In-Reply-To:References:MIME-Version:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=bGlo5KpYncJxMag4TeoNCPiBlXpzDdXv/wZ8+6Y+c9w=;
	b=5jzXXDlksFQeGhGjYwpBOvNK2tT3368h0zAjgJic8vJnI2gN71qMi72sacfMIHKYbm6M
	 ydv5a48hLdiWhMDZaqRyb3O38HW0lWS41eIfFi2wjgsfaJd08NfJDBKXXYaDCzUhkRm9D
	 21WkCowDgTEKwaiC5by8tTc+HVdA9xU8JICmmuTI/+8gbN446p9DbYVIkkvTUHIrQIFP5
	 jpUwxXqy2tl/VIrpwfs2zKPJzbIcf+t5a+P/RcbkFpFfkf9xyyRjqbxRqDGyt0+QyiVCL
	 CM6AzWN16ovljByowBj2JyPf9j7m2sA1e9hN6v6xUiPZoyBYfd8ihZIYH4LocTTH6fA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=perfloop.ai;
	spf=pass smtp.mailfrom=perfloop.ai;
	dkim=pass header.d=perfloop.ai header.i=@perfloop.ai header.a=rsa-sha256 header.s=google header.b=qkxUeQ4p;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.171
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD3D606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 00:55:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBD3D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=perfloop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perfloop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=perfloop.ai header.i=@perfloop.ai header.a=rsa-sha256 header.s=google header.b=qkxUeQ4p
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-4f66bb2ab57so1133127b6e.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:55:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794444958; cv=none;
        d=google.com; s=arc-20260327;
        b=nyAVJJ052hIZ50anNVbL3eLJ4hpVZwsg70rO3GcYPFYiKnhrN3IZw3MEhIxNJN0oDv
         +x3AUodEyJHSk06SGQ07Cu1c8/T0ctsBF7qdxXEcwibUGQB7/IjXlEkYS90qhnV+4Nlj
         AuzafYnC1DZ/BEHBy8w5qfMxI7QBO4YYDfPJMf+eyKIMw3nd9W+lW/hAzEUfPF+iFtwb
         rKxwmqgD/aGSWQKu7tABmLWwxio7/XVRXUofm+Wv2c7Il3Py0JUJ4SuplrJ9Cq0tQ25b
         JA4C2iKl8sELiUpLKd1caFy+LElEMw4zhyt3NcgR8nNmisR58VN0XMAHlmS69TJCXUER
         pHPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:dkim-signature;
        bh=bGlo5KpYncJxMag4TeoNCPiBlXpzDdXv/wZ8+6Y+c9w=;
        fh=3KqTuFmeIruT5AQEJ+tSc0zlFTAAXeP5UtTeBoml/yY=;
        b=ieqdU5XoXUf7utcbWWI9jfiDH8JuW0H057uC6Fup7ZRzcQe9CU4i81Ua30EozSjrRb
         BeDApjRNEK3QdXsSpgin3FkWknXU4T2ClV/EH3AzJv9zJe5zFDk6pPwjdHlIQH5zGBmy
         gWzUI0RM0bQ4svcvVeW7ps9YQbAzDwbm9scB9dzmqbTYiP1lscyCCH7aME3tny0BWAuI
         pCzZj1OQa+KPyLDqQ+D6D5gyP7GJMH7ARBLu/WxiDzXBUSfO9qcpgUJFPAx4rX0ZeMrE
         DJS+rpKREjiqpD7hQgWS6zf7Lgpl9YW0qX28Zb8TZHwU8bnGQLqr1j0C2MbKZibpMXKs
         /u2g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=perfloop.ai; s=google; t=1794444958; x=1795049758; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:mime-version:references:in-reply-to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bGlo5KpYncJxMag4TeoNCPiBlXpzDdXv/wZ8+6Y+c9w=;
        b=qkxUeQ4pu+NEnEHiGqyXQxSiaV4qsKZk9ImyHB44v5FFuxwAH2jJ+hIOBK/H+kP1qd
         00Dbpsz2RQbcvxCwzCos65a2WzJCwXTVO08vDnphO2pnkru+hm+NeqWSv59xG3LWMI3i
         m0SLjJcV0TJ0nK9gJNi+UkdJ0mTf+JV54W4TzQ1+sSpWHIXLqQxK7LrrUKVmlkBABe4O
         yp+LMPuQOp0UCKBLX6gBpIgVBlXtpuywxr7E+Ntt4RBsr2eJJZNAWHrqht3gxWl1lx5c
         hg4PRMQMoe79m6un5YadjVWy/7vX27Y1jNoY8IiydKhkGul/QTt305NwdT2IPygqVz/l
         ADkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794444958; x=1795049758;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:mime-version:references:in-reply-to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bGlo5KpYncJxMag4TeoNCPiBlXpzDdXv/wZ8+6Y+c9w=;
        b=gl0k+AqlKyeOp0vRD4axjjzOPG/k2BMOWJUsMuEMZnbHxa91HF6Ld9j55siWXzX6nb
         kLRby5g7z4Ip4b24/JUaXAwHVgwlyn6YzWGN1xvdCg7Hrvmr3pvjF9vuWJ2VGEFrE+x+
         8zzl4oWMjjw8ZYIEycMcleOrrK4nIizNRREikXyZETqx9l/MntuSImJz4Z5jGXBywomi
         03ghGmFVXYsi0ZiRbHfyQnxl+GdlblvWtmYgteT8FJ5kOqsf/gM61J3opr7wnHzaYExh
         cFmoZGytKcdk/w6waI5XZzzFhK1ntq0pmAXexnvJrH/MODceGw6/XVObfQhduATH3fg0
         Orew==
X-Forwarded-Encrypted: i=1; AL+hErH1zJGn7ZBRhfdAwjXA62w65cW3OvZrYPs2f5CegNl0ueZeRbgVFJTIG+sBjwwP7mg0/M+XIshVTowkj+c=@vger.kernel.org
X-Gm-Message-State: APuU4Z9yGv1Qebz+xe7twNj8WQF3FisG/Wy2iV7Xd5L3DyD713oKkL2R
	u+rF7T1ag4bejhecSai1wCzWJnn7JkJbMbyKzy4L3iXmOkB+uqpZH/6MRbZ4UkZc4NtjWAtd8sm
	mRgQiHTnvx3bIUBPI0TzRjpP1gvEk5tv2fxBfnw5MroU=
X-Gm-Gg: AYBFou3FD3AoRc0BDafO5eLvO63oFB+SZWZFIdUriYzm1LaTK7LI7/ayDn2DiawfsGb
	QkTyFLJ+WP8U5p8IGojgJmjqEGz2M59msfBLA68iDIZgxgMMf/lpDgxuiha94UhP9xSdlV2l3R4
	Ie4S4ZmYd6dr2CJxFHoH5mvNz0HVfbbjxmzS1bk98G3PwggAenCLjEjdZsXGAaEuORbqBmwB/Sv
	omIoZpwKHtduvMtdTR7AWcflhd/rrO+nK+mAd0EPtCr+IKPqbL54GzDDWrXVuU6opSfX/hYAVNo
	OjHjtfPsti9v2Zvd6XHYgHBpLGETIe/3zlIKXefMMTi3H58+99dR7H5ZX5rrUfGcSaP2c8rF6Va
	GTmBiSHpj1sp5EwSj9i2bw4R/6Tr7ve8ozEd1YQfYB6dFbrvokKDyyQ9S/mkBdAfLo/ULi9AuEH
	6VjZzPv49jysd6YSMZeXWeROOhRWPajGGoVM2K+L/uovStx3F5N+gYQSOc/zb/d4wCUOgkhuB65
	sN5xL/K+WBY9DJimqkaLbEdMt/mv2ENXXx9c1axkCVuHxVWHTPvBeqSc+pRA/43nkrVyibXO5zN
	fCN8fgruwA/c1Nr65D4=
X-Received: by 2002:a05:6808:1a02:b0:564:22ae:a68c with SMTP id
 5614622812f47-56b968c7f46mr3958629b6e.13.1794444957543; Wed, 11 Nov 2026
 16:55:57 -0800 (PST)
Received: from 202080787392 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Nov 2026 16:55:56 -0800
From: =?UTF-8?Q?Tom=C3=A1s_Senart?= <ts@perfloop.ai>
In-Reply-To: <CAO9r8zP1o+L-akRDJx80bgGj8bf9rdN09t5upPfkduSmNKwpKQ@mail.gmail.com>
References: <20261112-zswap-zero-limit-v1-1-19f33081b09e@perfloop.ai> <CAO9r8zP1o+L-akRDJx80bgGj8bf9rdN09t5upPfkduSmNKwpKQ@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Wed, 11 Nov 2026 16:55:56 -0800
X-Gm-Features: AclHuK8o7gpgV7y1WpVmcJ6YTUQp2s3lnYXN5gQ-xE1Y6TctG_9wPrkhGrG_MY4
Message-ID: <CAEEBa3VA2vycMaRCe4K-qnO3SGCuvAqhECmjmk6PQC3xxERiLw@mail.gmail.com>
Subject: Re: [PATCH] mm: zswap: honor zero cgroup limits after successful reclaim
To: yosry@kernel.org
Cc: akpm@linux-foundation.org, hannes@cmpxchg.org, nphamcs@gmail.com, 
	roman.gushchin@linux.dev, tj@kernel.org, chengming.zhou@linux.dev, 
	mkoutny@suse.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	mhocko@kernel.org, shakeel.butt@linux.dev, muchun.song@linux.dev, 
	cerasuolodomenico@gmail.com, linux-kselftest@vger.kernel.org, 
	shuah@kernel.org, cgroups@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 12:28 AM Yosry Ahmed <yosry@kernel.org> wrote:
> Why is that a problem? Setting memory.zswap.max to 0 while the cgroup
> has active swapping processes is naturally racy. The limit can be set
> to 0 right after we check it again anyway?

Agreed on the race, this doesn't try to fix it.

The case here is different: with the limit already at 0, every store
writes back an old entry and then stores the new page anyway, until
the pool drains. It's bounded, so if it's not worth a special case,
happy to drop it.

Tom=C3=A1s
