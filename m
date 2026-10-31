Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793411095;
	b=onex81qFlk3ZQGa+UTJhj8HrUVFjqImDPsrR9FI5Th+VJdwEjHX+ai5bqai9M1/bAZG6
	 EcF3FmffiAfDt8zKzd+9LIF4E70DAqbXek/FSXHNiGpfKMeHBYb6uf0oCm47V7gQ7gMpB
	 NOSp5/f0Fg8jtQZghSUklPwGOJzBMLrYu4qdLIukMjXid6C9sXtJJLrJ0+RvvNvx0I6dN
	 XLoGKVX+jWL6WvfYtVWuLBHtBupWnThKlIOfS9qSJ/1YPiaVOh1KYJgUsG32x39BRgsuL
	 7prfJV+Flzk2S63aEAI7TppdEY2oySHcqYPUUkBuy+WXjCs/FkRldAJAG+1/mIlJClg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793411095;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=6DRdlfcgy+vOtjFUomjk9wUyOs/aRXJNwlIvfhUtZTw=;
	b=42OaOympUd6B9rdmIeSyFMkhbVZpzoXenA9YwsM0EfX/lqOvtPv2L9r9P1BsPyJ54Drh
	 GfLeV4ocsx7NMwX5PmWPYrsje9eiy10SCtMjRwEuATOsKNI7A0HyJK9EiW25PtjhEdfxW
	 5/V/qKhd5w+wDWDww1xIokGNc2ZZe1FN5C5Gxq2k1MvP28heYsgtGlrjYsfR9lEMI3D5o
	 Q2YlthFNVTt8n+4FrML76fvVeyRnWT5UQvtlc/LzCspUUQIsop5el5VhbVMNs/ZxAmPlC
	 HTI7vU51UMeD/KriN6CwLOfWzS8cIWJu30x+dM44np3+xg1WqV+3NHrR9bs0xeoBBpw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pTSxiqGX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31034606A31F
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 01:44:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31034606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pTSxiqGX
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a206f0b95bso25775e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 18:44:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793411093; cv=none;
        d=google.com; s=arc-20260327;
        b=srYWV+mq6hoyPaiSWujhDgOoTdv7+tZRgbLjJZoAEXo9gFCQn30RqP4/qQdGjP2Lff
         mqzlQd7XpJvrWw8mFYYORnNXJ/AiMUR+Y6RaI3vF/h1oWIFWOR3mTMNVIA279wxw2axq
         WpbIxKzk6wbtffwg4jNqkw9zSRwiA9fawwuUHAZ2gbDiJdvbZs32aP/454MSf13fOvkc
         pOIYJD6q14O3d2W02NrmAFG0qDJry0zUJmGzHhgsM9vPnrBrAhGfW0eXVFJs1amDWP2H
         KH9+v60n7qFd9a66aw/JD+AsrzkxnFLuphTVtyq22RkkKXHTfBPpWIfmz8ka08xnv8IY
         81ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6DRdlfcgy+vOtjFUomjk9wUyOs/aRXJNwlIvfhUtZTw=;
        fh=FgiYy/F5O0Wn+aHjjWQgnAVP1AsPjjOEGkE9rMk7Rng=;
        b=c6HFyup5XcsRKq+M5czIdi9m+r9SRQK50AmEEzT6Cv4hyr9Aqwr+j/ax4ewVJvbHeU
         PRKaydLTN0wGFrBQzd1YG+OL81d1Nd6QWJvyNvOjk8z5UyY3ANaiPjTxls5NlipdW8Wp
         XcVJ32zbRlO4WdH2NQUwoFGZaVksitpMIxRSwtOrHNbo5kQLkbsv4T+0gTFNnaejas7I
         NiThACcjo7W/3U0aCicqBmFHZcym+440yZ1mLeHM7gQAx4P2C78kIHvWMhz6vz8gkFxp
         tc4y8AokUKf/M31K1WxK1n2v/n3K1dzcUQekvGOzJg9sNCqTpvqQr9YxUUdvUTFB2v0i
         pQdw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793411093; x=1794015893; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6DRdlfcgy+vOtjFUomjk9wUyOs/aRXJNwlIvfhUtZTw=;
        b=pTSxiqGXeKnIFTgIRow4invbDjsAiH2zV+0YXZVm+lBwyoVWkFdITWNiMcG7yKVf01
         6cFyb/HbYDwNG2aATzPG6gFN2IRQV92WN5bNaZ5rHzhBF3AV8/qi+goJOPdgjcZ3rUbk
         HwmCt4WleDebWqlk/QaMCYAYOXRMXQdZILHvTpCBCsNIFi/RAAuVK98S2ApdGpxqMP7h
         WpiItQjZE43YaWmQwxk/iuvRBP7zBMLoEqpb2ma3YEiVPHXtaStd19R7h2ZfHRUakUMO
         e/5/bvnZZYIeuorAp4zSgc8GtEI7GmDxY/j902qLCrndoYz2nr4oFlsy+SZlEFxldOEb
         HiNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793411093; x=1794015893;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6DRdlfcgy+vOtjFUomjk9wUyOs/aRXJNwlIvfhUtZTw=;
        b=hB5Ker5bVKSlsBu0PBfSulWG8G9eNgBFS8KbvgTtl22VIBcnWxmSuxRuMKbjLftJMq
         W4z1lH7gn+vcv7XqWSY3XzJMg9YYdECGMh910aVN9HGv03A2GVWfluZp5azygc81cmG6
         DZK8CxmwcPEsP8sJJUB0hdjZ/JYC9OqaP6uL5NFe8MoIuj+BFJysYNc1QdXD3CRM2+wE
         N5SkR+FEEY9k/vqkzdQ1EUrVMJMzm/vWsJYzh8nlxLEpi3ulUxm+flFI9Sr0NGECd2Qg
         kW1NUspnPQrJUI74H+U5cwHExi8LJB8MtUKCUnjf+Nk0WMOTjaY+a+TXt0MiJZ3sAKX1
         DDVg==
X-Forwarded-Encrypted: i=1; AKwUvBzXAxWBGjdQiHdPOhmLAA+yIl54ChBD46mdsimxyJUNhaj7s/OwZIIeY41BoNyiTMRcUobp1Adb/0qKa+0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIsrtJi7ehI/b7TEByahGLfEVwGI3kRxSFRYdT7PUw8ooWZzV9a
	rv/+/zF7pM3V3LF9aHYR8j5OvgcvrNLgSBKW+pH6XiyK8hjAtex241W0JEL7+nCrj6iumq1VltD
	OpGlw2DNMSQlxjKJHcz0nDM0B5hPFSWq3ieYXmVeT
X-Gm-Gg: AYBFou3refQ3NqJxf83mAnQFzkLkxpjjdBKnXySE7kIf618+raE9KfS1Rzz+dX5wyVQ
	hoxbSNEbtTjxRXMEJyKfnrfB2gRcuKXZvQ41cU4UHXWwVnl5ac/gHjGIBRWW28i/SXmrFJ1V4Af
	LaMGW2Jj1Lv/rM5jEC08qsV5TJ7KLoLSOJaf3EHZNyorFl8iF+xc0JfoB0Gfb5SDpilS8ZZCJm1
	ibQderEPuw0Tay6TKxhSZLO2Eu7/6W2SAdxu02nlZvu22Ph9iVca8vSKQLh0MJYLUQgPolCFzSX
	gkha/AJNhBF99oJj9BsORDKPta7JaIP5m+B4PPNNcFcPn5tNoeSWLeXKrm3vlD1depOW+OoplmE
	hUqQoBD9uXIwrOHKS9Fm1VcMyjXklIgozBSEXQRHfjo1x4MTT7LIxDF/5xi+ESfBYs3W4
X-Received: by 2002:a05:600c:a183:b0:4a2:ba3:236e with SMTP id
 5b1f17b1804b1-4aab73beeffmr1795465e9.14.1793411093182; Fri, 30 Oct 2026
 18:44:53 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <18e3697ad6321d35.3137322e32332e3235332e313736.e98e6.0000sendgmr@google.com>
In-Reply-To: <18e3697ad6321d35.3137322e32332e3235332e313736.e98e6.0000sendgmr@google.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Fri, 30 Oct 2026 18:44:41 -0700
X-Gm-Features: AclHuK_pX8cbPFC7CZhySlOC0JMrDf_CX2tXJ-CkUmaeXv5SLhTNx2Dk4KoCGew
Message-ID: <CABdmKX0YRmr0ovk7teNQdXdLmC2LKruT59EQarpDMFcxoOFcQg@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: system_heap: Reject private mappings in system_heap_mmap()
To: Chris Wiseman <chriswiseman@google.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>
Cc: John Stultz <jstultz@google.com>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Brian Starkey <Brian.Starkey@arm.com>, Philipp Stanner <phasta@kernel.org>, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2026 at 1:44=E2=80=AFPM Chris Wiseman <chriswiseman@google.=
com> wrote:
>
> When commit 381295758792 ("dma-buf: system_heap: Rework system heap to
> use sgtables instead of pagelists") stopped using heap_helpers.c and
> added a custom system_heap_mmap(), the check rejecting private mappings
> was dropped.
>
> Other exporters and buffer allocators reject private or copy-on-write
> mappings in their mmap handlers: cma_heap_mmap() and mmap_udmabuf()
> check that VM_SHARED or VM_MAYSHARE is set, and drm_gem_shmem_mmap()
> and ttm_bo_mmap_obj() reject vma_is_cow_mapping(vma).
>
> However, system_heap_mmap() omits this check and calls remap_pfn_range()
> even when userspace requests MAP_PRIVATE with PROT_WRITE. As a result,
> subsequent CPU writes to a MAP_PRIVATE mapping of a system heap buffer
> fault into do_wp_page() -> wp_page_copy(), silently allocating private
> anonymous copy-on-write pages whose writes never reach the underlying
> system heap buffer pages.
>
> Reject non-shared mappings in system_heap_mmap() with -EINVAL to match
> cma_heap_mmap() and mmap_udmabuf().
>
> Fixes: 381295758792 ("dma-buf: system_heap: Rework system heap to use sgt=
ables instead of pagelists")
> Cc: stable@vger.kernel.org
> Signed-off-by: Chris Wiseman <chriswiseman@google.com>

Reviewed-by: T.J. Mercier <tjmercier@google.com>

I wonder if we should have this in dma_buf_mmap_internal() though. Any
thoughts Sumit or Christian?
