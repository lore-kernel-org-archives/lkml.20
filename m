Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793749802;
	b=LNJeZTn+FDjykXUITBpEs0dCcqJNaY3ryBeK2WSERKPDNb0lom+x/bcEuJCnLIr+JBSX
	 /oBvPjeLj8hf++hXWDwH3VRHE/Q24pY+Pf31BJZv9TMbiedw3JBEGR9OHIWipmGB5YCiz
	 q6bSMPqBWXIED3wOf2boo8tKbw9hbAYpaeOhGEZldWWnq+aU1I1piN45X6Kz3bvmG28fP
	 0F8Tm4B6Xm4V8r+Kec2q8R3sEdZo/DytJdQqK+rKLGxyrD86BOEK/VCXpO2RWYcMVcTkj
	 4Rle52bXsRITB6JT0OZhJW4b/O6fdDT8e+xPdmXCDh8FfTx5OjMRVAYsGEqBNSGV/IA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793749802;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=2LyDKxPm7BmS9aARoXNEEpr8AzutCEsbFkZ2B7a7nyg=;
	b=FlOcJlvo6YhppxvYdWIXVbcSzVxV7EOtqH1vZv+VEFjyx29EUW0iv7jJXSKuImvGrKeU
	 X2ngXdzXGVF/k0QeQxnRY0jywRNSo3fN+C52AwVbZk6d68BX69ziq6nMbSyAYznynMH+E
	 Nt789zKeNIynYz0qScYEAmB7D1omxmnuaL3EMZnRoVgcu8gSz6LBt0me76zJmMn7odp+z
	 ppWUlmnuy17vdkjCpr1nQ9TD1lqharql8/lJtU7qWeXX8bEdgBwfHO3BB0ECNbEKYSx2j
	 kGXwYNSsayI8v35//eQ5SV7eavCHdJRJDSI0zrl5DkM+ohnTvcBRGa/CVzyXKHRmdsA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IoOy157h;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6771D606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 23:50:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6771D606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IoOy157h
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a018493d57so25165e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 15:50:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793749800; cv=none;
        d=google.com; s=arc-20260327;
        b=fF/rNewe92/T3I3Pfua1yyVP/SwN7Us8Wv7e3q7vMLWs0ePQ2ZlUfZPmR6x/rKL0lp
         Wx39qq2Q+DngG350SgcdorlNdhkf7FoujFu9dE2nDbnONziBbWOotOxaFxMu59AKjlmt
         9aqJ2d6HurjtmTmtsAvuQqcVjKRHAb7cveZ/YGfebaHruo6XSlzA6fSlalPBfKanr01z
         wOA9nXUoH84ukvbA5FzHSlOssgCsd9NfGrtO9eLA0YP4QKYXNDyg1Vz1btATUx1xZKtq
         uZgx5+VtWcfDnsuz7SWxPPDKrPXnuDTto64IFcw9mph9xaos8eWohsKCX8ByftzWvOtG
         s50g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2LyDKxPm7BmS9aARoXNEEpr8AzutCEsbFkZ2B7a7nyg=;
        fh=4+pnqH6+PwCqb5CSY0HV3kXKqAiEfvXZCHz/8Q50rF4=;
        b=hpspY173V/nVmLbSLccVUDVxXDXMBjjOWJYjKP935sbaLdB7Xx6E7VvTRNpeFOXzjW
         c6traAJyB9jSeyDkmNS0wfypyvZOSR/h5a5QxXeM8QWGGBUZaGJ3IgboUVoAihPCYaV7
         nOOYyOUza8vLR64dEvmT3grQrz8YvDGAzFbDv6foATCsKCN8YDFDpz5k3AeOpxjXTexq
         aPBN8Kj7qpxk+S7BvWYwreAteblUoGhGJYhD0qj8MK/GzPt99o840pthq1GlpROjMAfC
         INSp6RRsOV3TuErS0lRj+Qra++0VysheEqDw9WgD7R+HOJ549UtXgbTdJbY5CLB7tznO
         4bgQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793749800; x=1794354600; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2LyDKxPm7BmS9aARoXNEEpr8AzutCEsbFkZ2B7a7nyg=;
        b=IoOy157hpnNx0hX/TCKQyv/43AG4N4mu0MB87RNs8cyd+CS/6nV8lwK3QZibeSgDB+
         NO1mWyt8BUZVU/dS+mTvVu3rGUagC9cKJuc3RPHqWlzfF/TpkGKqMdA8v33BoMSSritA
         0/Qb9xT1LxW99/nEEz8QNUa/mRff4zCtl0BrYr51At5i8TbhLKXE7PKz7zA0oarEpEho
         /WTO1hx+3JoWTFLIfscvIwXle1q7P0WlXktQfjzA/APiPOF3iwGSs1PAePZ/ZTz8dDxE
         fFi35+ufV/y4s/0uiqxfhJFDAwcV3Z5Ex3gKpbVH3H62aYPygxSKeohvn8eexKy7c17/
         trWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793749800; x=1794354600;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2LyDKxPm7BmS9aARoXNEEpr8AzutCEsbFkZ2B7a7nyg=;
        b=zMM+/bzA29X6X6Q3iFRQY5YugjSlwt9mu+nH9CUgst+687ZzPpMSSJ/stCGOjxSlgP
         6Rz1GfEWhbQE2twkLGrNXDy+dN3lKh2uuDzr3ufNrtm9XsIBy8fzxcsYPL112Y2mtyyT
         54sTw7ZwQYwyQMrwuf3GMQsvCymuApVlosVDNUf6rHjyNuWA6kZazQzKzRA7EFhQcJbL
         t4jv44kdBz73OJuEGQvhH9TMEORZLPUXKWSZTOANsaR7X6IQxymG36jFNdXnYN4TN5Np
         MLQr0Rgo2WnHA0vb4eoAch9aITtvUGdKsOsJzM5WUtchAU1S/QUchuOVcHOl6m+6/IxX
         L7xA==
X-Forwarded-Encrypted: i=1; AKwUvBxUvbD/1oOo5jVPC57lRLGhD3RfcIMBzKZtBholdb/roQpfebB1FKELBLSxWVar1mkYdp2Lv7X+lNDRFn4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/MWthqSUSwpefAcBX9+NDQkX0VcDytN9hRxHmBWdw3Dfa4Br9r
	7dfFmqMjZ0Socgiqn8CRLEk0L8AcnicLl1O4GP/t8ZeCDFpo5oTu1SuuEaFwd6CBey8nYjyRU2i
	jMx847F+0rlwRnw4m6WstCySynb1DuuoccxWTO99a
X-Gm-Gg: AYBFou2rkYsulC4w/N9IPNBkmsPuHsmeHmeIAqw7JFPi5vSGkSnh34ALwYlin1KDLYX
	zAQRnszJPFr1O057Ozr/9gqmt9ZzTHcbgrtAfLBT0MpC6J12FGvBnlqhUS+vjj4YHpeB2XA8qIP
	9kicTUknSaumwdc+leZpX7zT1T+QDd5OI4QMLNT1qyqNLwD9xwqzDEAPGwLcOnifSMntK5jEczJ
	Grtcv5kDKWhRGq0kWIwOT+kRQfOvmOTYo0DVWVZbtMkfObPvgfRzR2plcyzdwwE/CiFk1oVlXxT
	Iv/VJ/iyoWu9PgLIiD5VIx46kxL1HqJYJXiOAhKVYw4HxTcGcNc523LwFMEXqThGabdC3sefiG6
	QBA8JqAQE3V7C5KfXK+P8ux6BhRKolZmGLq24gPU1udgD0stKzneYuNhiwjwPTXifX5vgffNafh
	Hf3RbL2LPuN+Qq55Kac7VLrdM=
X-Received: by 2002:a05:600c:5799:b0:4a1:eb11:489d with SMTP id
 5b1f17b1804b1-4b4606a61f5mr16595e9.16.1793749799475; Tue, 03 Nov 2026
 15:49:59 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <18e445c150434665.3137322e32332e3235332e313736.109a67.0000sendgmr@google.com>
In-Reply-To: <18e445c150434665.3137322e32332e3235332e313736.109a67.0000sendgmr@google.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Tue, 3 Nov 2026 15:49:47 -0800
X-Gm-Features: AclHuK8ZKLm3rVsIDA_wL7c0dXQT21arwcYZtB_K4EiOQaTULkyqjY3FAmPFPP4
Message-ID: <CABdmKX0h5Vv2cFHRksJx3hHn5c3aBqbmiTASk5GKn3BqUO4Vbw@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: Reject private mappings in dma_buf_mmap_internal()
 and dma_buf_mmap()
To: Chris Wiseman <chriswiseman@google.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	John Stultz <jstultz@google.com>, Simona Vetter <simona.vetter@ffwll.ch>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	Philipp Stanner <phasta@kernel.org>, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 8:00=E2=80=AFAM Chris Wiseman <chriswiseman@google.c=
om> wrote:
>
> DMA-BUF mappings do not support copy-on-write.  Mapping a dma-buf with
> MAP_PRIVATE and PROT_WRITE faults into do_wp_page() -> wp_page_copy()
> and allocates private anonymous pages whose writes never reach the
> underlying buffer.
>
> Individual exporters like cma_heap_mmap(), system_heap_mmap(), and
> mmap_udmabuf() already require (VM_SHARED | VM_MAYSHARE), and DRM
> helpers like ttm_bo_mmap_obj() and drm_gem_shmem_object_mmap() reject
> vma_is_cow_mapping(vma).  However, dma_buf_mmap_internal() and
> dma_buf_mmap() do not check for this and pass MAP_PRIVATE mappings
> straight through to dmabuf->ops->mmap().
>
> Reject mappings with -EINVAL in both dma_buf_mmap_internal() and
> dma_buf_mmap() when neither VM_SHARED nor VM_MAYSHARE is set.  Checking
> both flags still allows read-only MAP_SHARED mappings, where do_mmap()
> clears VM_SHARED and leaves VM_MAYSHARE set.
>
> Suggested-by: T.J. Mercier <tjmercier@google.com>
> Suggested-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> Signed-off-by: Chris Wiseman <chriswiseman@google.com>

I really hope nobody is trying to CoW with dma-bufs.

Reviewed-by: T.J. Mercier <tjmercier@google.com>
