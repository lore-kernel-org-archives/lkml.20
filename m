Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792519102;
	b=Yoqli49r6fvP08laV80scx71k42n2eCIO/o73uEfFNP2/pHHOHRBqUYL5UoxUXJ1VJ/8
	 q6AWVfbPIjzv7VJJr6bff8O2MtDVhK1o5F0MQJ1Smt5VuRJGh8c63zY6a6Ip2MDa4RLia
	 8n0EGO7c6dvg48vR+tohJS1WmjHM6riD/3S/HYmt3VBMKcWX5TXGo5u2iBz9K2wnuOVCo
	 PlXop8BFMq3slT8HxTeLlzA4mAJ15cR5lLwrfEtk8Ol00ru7Ut6REP5V80XDNiwTK/wEY
	 FSa21QEY6hLPf/u5uVrf3rGDRIWll41WmUHUTDRBhtC9hxHEsihwhW5fWmoAzbNU9Ng==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792519102;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=TYpDQsgGRr37nBGO2U3Z6QjUyN0Co5SvOmgYxqHioD0=;
	b=e5pcFNo3B3xNLlq5Tf6AWtY2pKK3QJTi7GinhLlAX1I380DvBeNOWFAnds2rD5HVryCX
	 xEszNWjP5gEXwy5sGTJ9agjJTtY44dj7OqCvWfq1sSxyKUTU0Y9HLOJLAxeWCC1ycYRgo
	 RNaHEsPlZf4qv0IpWA+gYec5vp2rZZY1yTUzNNPIblLtq+XKhETwsAn/uASHK7PaY8QoU
	 PitiWQm/foNsYaUZdMWLfWw32ePuTkOQiwhimFo/o8HWMZ8qN6FzLnVMV/WAsBy0LMaGj
	 jdFC6hguk6GyTKjRbRlR1CUSoSedN32MWdVAquMqSnbHmFbVd3Vxe/UJ4QSxNPND1qA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=D1+rhQvL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED9A0606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 17:58:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED9A0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=D1+rhQvL
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c2afa22e1dcso527226066b.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 10:58:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792519100; cv=none;
        d=google.com; s=arc-20260327;
        b=QK95KjLpNWd1BCjLJjuJlsrV4QYh7W+B0fwmIFfqGtCix/azBkajLlKTLY99IxUM9E
         pGj8g53QJgUnwePm5YzT4bBqi1J851owHz5bUcedBF/dQS56301AHTYIPILyksJizego
         /v/M7YCa1gkmR+GV5aNy6GO9pO5WYh/pmTuGEupnilwXJ4WJyDEPNBj+e5o/6SpfZTAX
         +nTIFV6332lDNrUa+8on+U/Vlwx/aDF6LZ8lQFEMbIZwnox+SP8OuEVB2v+QIoQgwQMP
         dmP130IZuv6p6zlx4ttE4hHPXr73i5/Eh9hWqDaZRjHiDxiMMvDOQd4QUnvGxBE8NEGj
         ofBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TYpDQsgGRr37nBGO2U3Z6QjUyN0Co5SvOmgYxqHioD0=;
        fh=es3khxlfO6TQABpqFKZFuOaQhxpO4m70jN3JsJzwglQ=;
        b=SAgwtAkM7M2yJb4ts/q/eB73+xOKDi3kU8wuyiC/P2KNONCaqiVq0LsPKtPZ7Oaejy
         LdaXIVsnfJ1FZb1LJLhqIwW+hcUCdfHab9O1IzvDxFO8gOc/9aJHL1pf6r6aiCXQjE9T
         ZUisq6R8x38z3m5zhCO8MVV0OXuBEe9Sbx0kx5NhdgdQqmRjh5BdMx2uYfDW7p4eBX1w
         PG4aYezjA2Oa/gdQuWOemm2AXU8loWwlCmMlJVs5bZ9LuWfhXKJ/qG6NaQE6JJFAckHp
         9/E7b5lH8gxmuQTPn8mLWCCAiP1GQQtj/55ZK018dGXqAL7KXeRM3nB/jKWRKdieieTn
         ZV0w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792519100; x=1793123900; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TYpDQsgGRr37nBGO2U3Z6QjUyN0Co5SvOmgYxqHioD0=;
        b=D1+rhQvLQo3rv6jagYZKuv8hthSD63xxHUM4d3XEiQ9942SpXeB7IfjMrlrmOiLOwk
         lHxXTtdHR3HTAYX7ZvZWeffr0RYVsD3iUMGGfD+wLCrtofANjrX2h5ygIInDBB3s9Y4L
         jxBGMBg329131QpiRHa0UmWmIRAAeYSpNLJKQkVmn5hsfA/10JAxjSZZWA0goSX594Iy
         GR+eRzeFgaRMg+hbCssxqj68YRLM9nEpKLzSon3Weua8dt3z2IWfDwoGtCaVJXzSLPSG
         podB082glfcChC/1HJbxh49XihI+1rTZcYTrvRV+kteAPHDfPfajciTTLLH+YinRCxAp
         1qXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792519100; x=1793123900;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TYpDQsgGRr37nBGO2U3Z6QjUyN0Co5SvOmgYxqHioD0=;
        b=se3ApH5VvYunAfDhE1amXZHlkv1MH8Tlh18e7nJqgUZKYLrN3Bpha7DW8yPjyneSNy
         Grs2w5cEwdZ6gjZVBxZOGAW4dvIcwySaWbVyTzlUoKQOD82ddIj0lXT8rh9TmFIu4xFZ
         yvsQsbDYUB8XCDY/vAn4Ciw6vpLrdxNdhWY+8xImXFXMMbk1RnRr4teGp2t4FCghqfQQ
         7/69oHUOQGsF44C9QN+DGPWKypjPL278iKwqA9Om8cwJ0B+Tv7ow35jNVEJxw4miLnfH
         oXxN3Y1GMyBD2J12VoUmY/b8qNaPE9JnyujEB/YlhvKBxTJVp7emk723RMnZWvw09qaL
         WtLg==
X-Forwarded-Encrypted: i=1; AKwUvBzYg+7Pso2KtH3rLvd2TY6IYBM+Dq854/NF1E2orVwTEzOuit3KJu9xZJr0oZ6vsZAVtw5BWZS9bQoVNNk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIOlrPR8wM/RV76VRw3spUk8XMnqERSA5IMh5WaFB4uqPmMJ17g
	EyjwiMFxvzru2NBePAq8wHtbWNJA0iHVwgWMXOKRP34KwBlUoWuqp+6vt00sFP4KArTWcj3+rMD
	0Jze5Q9akyFIRlkC3hch7FPp3N7ycfS4=
X-Gm-Gg: AYBFou2gO5tuxsaqhVEoEx+hiEUbgIGD2YOLJ2/Vnhd7NiLy7zjVXMu7R5gspxv0h/A
	6LxqPZ8ulRsj3bK+tq+TbqMjbDp1+jtu63KA0QvH09riMQL0lhwhCmGp/XDmPHNUuOG3qoKwuUw
	uAgyBbMDA6VZ5r+QPhnE7cjVRNPrB6FZE5fjuTiBkvRRpUo0z2eW36NInHd3oJMyd8YA8bgYLXr
	zjW1W9MfGwpORAOKJV9FFMJI7ATfRrZjUddud4tdNlx0sjqybGooF0xFfrQ5bobaRBYj/681Ok+
	MFkePyqw3PzPWvY2kab85H/rqCeLKtb1lVOc7kRZfhboQyRJi7yHm0TwoYGuitIAs63E0d2SvOe
	3wFitlQgnaani
X-Received: by 2002:a17:907:6d12:b0:c31:8984:7fad with SMTP id
 a640c23a62f3a-c419d067e77mr853092766b.15.1792519100063; Tue, 20 Oct 2026
 10:58:20 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019160615.2348500-1-nphamcs@gmail.com>
In-Reply-To: <20261019160615.2348500-1-nphamcs@gmail.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Wed, 21 Oct 2026 01:57:43 +0800
X-Gm-Features: AclHuK81ig-p6n-cemVImrMFEtjvoTG0vQVQgOGs9ux1VBr9C6W8ghDtjcxeOK4
Message-ID: <CAMgjq7AEg6XEUJPaM3mMBQAeS_KiDv8_za4w-R2WaZ=ZGenvuw@mail.gmail.com>
Subject: Re: [PATCH] mm, swap: revalidate populated clusters before scanning
To: Nhat Pham <nphamcs@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Baoquan He <baoquan.he@linux.dev>, 
	Barry Song <baohua@kernel.org>, Youngjun Park <youngjun.park@lge.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 1:41=E2=80=AFAM Nhat Pham <nphamcs@gmail.com> wrote=
:
>
> swap_cluster_populate() can publish a cluster's table with the cluster
> lock dropped. A cached allocator can use and empty it before the
> populating allocator reacquires the lock. The resumed scan can then
> dereference a NULL table.
>
> For example, CPU1 can retain a cached cluster offset on an SSD with
> per-page discard disabled:
>
>     CPU0                          CPU1
>     ----                          ----
>     swap_cluster_populate()
>       swap_cluster_alloc_table() fails
>       spin_unlock(&ci->lock)
>       local_unlock(&percpu_swap_cluster.lock)
>       swap_cluster_alloc_table()
>         rcu_assign_pointer(ci->table, table)

Nice catch!

I think the real problem is that it turns out calling
swap_cluster_alloc_table() without holding ci lock is bad idea... I
think this patch still leaves some other call site too?

We may instead add a "bool locked" to swap_cluster_alloc_table, and
let it lock the ci first before it does any assign (not the alloc) if
the allocation context is not locked. That is, keep the
sleep-allocated tables private until swap_cluster_populate()
reacquires local/global/ci, then install them under ci->lock,
something like pre-cdd77f84d966, always assign it atomically.

That should also cover the problem reported by Kemeng a few weeks
earlier too, and prevent further misuse. My Bad on that change :P
