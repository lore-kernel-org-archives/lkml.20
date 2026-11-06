Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794001160;
	b=KyTddUZkh8ecYFQgVbU1bQ0aKo3bTEB95t2lpUwPqxPZLnvyZ0xkJpUB8u86udasv8zh
	 /gdKbbPvOkaNN5stciMNRFHYUi5kjljyksNlXP5ob6QKsrNMmSfOtjNTpIZq+TzqUcDZS
	 T0K6agbnBQceJsx+F0Z/V1BQzKOTj9O3nb2DSASNjVqMZle8D29Fh3d60sOwTcmX2R/PZ
	 trCRlt4dOf+OZyZKJvPpytoO8jtwKZjg54ifLlGB1GLso8oxrElX1MUbhCRDTQAU+dxdk
	 7zDTej1gOgDuGknJHYgaWKKoiMvdaF1KcsAwHRwg1u9yCRaFgV+VjgfEWAbiV10cEAA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794001160;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=kB/Y5PEbVuWlkf12j+Mjb6ULAf54/v2crnDAHxUqWOY=;
	b=b6BFCYRgmMQlamJl+CDqUb5yqhEmZM6gFJLgyz0MM4eRjSQx8xUzne8NE59jLPjWjLdK
	 sfwfpcVdiCnkI7QCCgQY7Lr4DtuxeTW2aJVDXuFBzlBPmMcVWZtpP322dJnpkwyc9d/ex
	 jn4aYdO+MZmDe9PDMYA7CVy2PcV2hy8vEQNmZxJPzGEoSNUEg1BETozSdbdFTU5zfFkCI
	 QEoNriC5sbwfu7MjLm9o5NfAGRp/fxgirPAe/TbY1lrcZkUR/K6B5IL1ZxOW2LAAKWxGN
	 hLIDVArEpDK4chJpU4c+UiXRKF3h29O2pv3XWKmSe5YURvPqK7hc/zgdm02GX9SgLXA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QiHLCcEY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F62A606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 21:39:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F62A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QiHLCcEY
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4922523d1afso673973f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 13:39:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794001159; cv=none;
        d=google.com; s=arc-20260327;
        b=c7nEb7or3Lq5uI1CT4rhCRkyI/O+MXv+eCHCIabiXeLQcK/vMKKALZK3PIz/lKmE+h
         LobZZo5G9rPeY4SUhgx4RGo7wtZx/+JghlvfKbxoC16Hejl0yQaAXuQAkbxF+EiJCG9R
         rmBwe5wtsgl7duv3Mr1kCzWmsHjSasVvm9Pl9HRkYl/GzAH2bPbFd43KqsHaTp4HGTrU
         wAsLi5VOJeKNI6gYD/XCUf9iNdBVabDK8MQsTXiPbVtBpTS0+alp7QB6Bn8xcXhcrvpv
         +fS/3zIQcE74sT4aYl2GVI8Paiok1EQeGfaHzEsup2FO1Q9Zgl6JW0HUkiGSJugTWf4x
         1KlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kB/Y5PEbVuWlkf12j+Mjb6ULAf54/v2crnDAHxUqWOY=;
        fh=X3lHZMai69IupJUtKjGBQ2h2XWNMZkvmO4G418MWfRw=;
        b=RvJLxmUEBzo/SdNTTwU+0PXWESY0h7R90YqkM2ratsLlMorYIZGPAI6UVBFfo67Q1U
         WZqMI5XzvGtZ3R3TQbeIgQnEP1j2+RrGp9HacZkfD+ZFCiLINop5NxlBv5SdVkf20Kh/
         VYsztr0u+mzuDathfBoVBGfBV/6klOaxNS6SueLcu4t7Yrx6DnGEif5CB9PNIRtq6Lu2
         pKoV07xC6yJG30Fsc2q5yAsy/e2GqdRYj/r0tctW5VJambwucSqwjYtchjjCLq7zvpXH
         XUlOS3wg2mQa9zQflb4R/cfSswB2PtwJwV0bSqWngAD/yh0BG3JarIHc6H2NUAx8m642
         1xhQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794001159; x=1794605959; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kB/Y5PEbVuWlkf12j+Mjb6ULAf54/v2crnDAHxUqWOY=;
        b=QiHLCcEYmXcNMp5W84fUGlETokO3AOicCK4TLBaym37OLnfOXiEs5Kd6OflbH40ZxP
         obV4VA6B317tyU3bYBfRqX8LhehA/GTlYRhxiRUCUuQKyvsm4U038IQKDejZ+sDYufxA
         nqJzPVdZmJyB/vXsjBwMpPW4n1uPXlqOr3TxZvIvPjH+VdXdmGx3caqPX3MULHxGFOvY
         xXvmDSt1FLCj/dga6mDXVggY/938YnhHlmYm5o4Du2384dvHD2qi/3ejBOWC2UjD5ChT
         ARk9/IGF/doVBGF/lfTdysedikooqBYNvbhCst14FyD7+Oiia1ST6jLHU4AsQJwh1gm1
         EaQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794001159; x=1794605959;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kB/Y5PEbVuWlkf12j+Mjb6ULAf54/v2crnDAHxUqWOY=;
        b=QeKRSHY2Lig4f7bz2cnkb2k/806irA58hyeds060YVboJRAMknTSz7ITbdUG1VZ9xQ
         vMBDc6aDtIskjlqj9/8menlAOk8pthEUd2JLCEQZdIaHB0mNe/eyJrXLaJKdPkLYmIzB
         XCl91hutnvMUf9hdBm++Qq3GedkdAz7FJAe0zgoXZ6rUvcdEGmdnthuvuOOiat43TUg2
         TM/pIdoJ6uYAT/bEUYRhh7wwROCB/P39DgPvKR3fz3UZaz3ejlE0F4EhY+28ub+R/nUn
         FKRYPzvLYIHXKJyPmZ4pfL+ld3Ez9QDiJ4QFF07k2o1eN9q4BWu9ProySTEJyS9pVeKv
         AAWQ==
X-Forwarded-Encrypted: i=1; AL+hErHyjVz+RZ/zya0VY8Ia8jZUv+82G7KnBo0Jk0JuFYue2+KQfwYWgOE30nyuOaYI2iySxuUKOJbMD33KhU4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8gGj6qGbP83VDs4P/6mQgBfY/2XyplR53tSdH9D89kApRcsKyq
	AF2x6xsjYQmR0iJuTpTlgj5R8M890uTuxzcqTgnr8L5e5B7WnMpV73H2pp4/yIl7RgAQ3T1UnZD
	GQw/wJYa5zjZ78vWhfGpuLGeQkPw+aeE=
X-Gm-Gg: AYBFou1vmyGS4msYdrY1zZoG7sTo0hM5kzb8cmNCPR57c5Mro1syPi5ge/rhB1K3ugE
	FzoHZtjY2yg+K5twpqyIFsXoqfR5gEcxH2cjvnFborMFzPL7jUHItqzre1OJOg5/Lvg8NjEzdIN
	H6diU2l3ipn46Cck+a9Gf2DgVr2sC7ix6s91ByarWu0642BvvWJpeT3HXhBFVZC4496uK+bGe/O
	x4ax8rs2Rm3hQUEoqwgJpNQ/XSqUUgNstJt0HMW4n2wsE8FaJ+R3rUxlbd7rjJiY5jtW4sC++pS
	tcGW6XhrL0+HDkirr97pd3mgkEd2YQMFjYEtNuKcA2Bio/tT0ve8G13Y69cEayIjKNHIRAh1RwX
	G40nS+3DfYj2fAS5Uoi9YdG9BROK1ZvUBm2GQhXMy5aLznYjD5JwaCZYrKoff+Hfhc0S7tupWFH
	H4RQCY5IpVhHJGKymDp4fMk9EMRLGS7KQIb24HAclITm3FFQsTwBt3
X-Received: by 2002:a05:6000:26cb:b0:491:a219:8506 with SMTP id
 ffacd0b85a97d-4927863e2c8mr8399608f8f.48.1794001158535; Fri, 06 Nov 2026
 13:39:18 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105183940.2236717-1-usama.arif@linux.dev> <20261105183940.2236717-16-usama.arif@linux.dev>
In-Reply-To: <20261105183940.2236717-16-usama.arif@linux.dev>
From: Nhat Pham <nphamcs@gmail.com>
Date: Fri, 6 Nov 2026 14:39:05 -0700
X-Gm-Features: AclHuK_rJJ15J3LdZzVLEblCgM0GGzwXV6YpR5Nl5AeULSpoo84sJweR4rYNLp0
Message-ID: <CAKEwX=MUtgJCCZ8MUkiCHtZ68AndAQCk7L1Hdq_AkN7v9aMnFQ@mail.gmail.com>
Subject: Re: [PATCH v9 15/32] mm: swap: share swap-cache allocation error cleanup
To: Usama Arif <usama.arif@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, david@kernel.org, chrisl@kernel.org, 
	kasong@tencent.com, ljs@kernel.org, ziy@nvidia.com, linux-mm@kvack.org, 
	chenhuacai@kernel.org, ying.huang@linux.alibaba.com, 
	Baoquan He <baoquan.he@linux.dev>, willy@infradead.org, youngjun.park@lge.com, 
	hannes@cmpxchg.org, riel@surriel.com, shakeel.butt@linux.dev, alex@ghiti.fr, 
	kas@kernel.org, baohua@kernel.org, dev.jain@arm.com, 
	baolin.wang@linux.alibaba.com, Nico Pache <nico.pache@linux.dev>, 
	"Liam R. Howlett" <liam@infradead.org>, ryan.roberts@arm.com, 
	Vlastimil Babka <vbabka@kernel.org>, lance.yang@linux.dev, linux-kernel@vger.kernel.org, 
	shikemeng@huaweicloud.com, yosry@kernel.org, qi.zheng@linux.dev, 
	luizcap@redhat.com, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 11:41=E2=80=AFAM Usama Arif <usama.arif@linux.dev> w=
rote:
>
> Both post-insertion allocation failures remove the folio from the swap
> cache, restore its shadow and drop the folio references. Factor the commo=
n
> cleanup into one error path so additional checks can use it.
>
> Signed-off-by: Usama Arif <usama.arif@linux.dev>

Nice cleanup.

Reviewed-by: Nhat Pham <nphamcs@gmail.com>
