Received: from mail-dy2-f12.google.com (mail-dy2-f12.google.com [74.125.229.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5624EFFA6
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 16:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790614539; cv=pass; b=BniapjxZ/ucylc0KWYWoutWAHj0dkUO6b5Iep4jHDzCXMOBU9jYl9zrU7IOGJjs60fj7UHqqoP6LDinbb6fwybNxgvIO72VajU2xk4PVy7ne5ng+uHIjyBO6TzYH9FXCtW3rGwWumOO7zlcJDNTuutpCtc9ngL2reNyHRvCgrAI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790614539; c=relaxed/simple;
	bh=WP+GYRi0sG1f0vsh12CKjIVQLqmtx2IfNq0cBjyvfuc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qzcn9eS+mpopYYaIVEC/rGvrgXRRbYdoe/z60qU40dY5YQNl0aYRS0jC38hxRL31m9QbXJuEduedpa5sD80X6U703YuM2x8CMm26/AscdZp4HS5N+DNA3PkmFsFymOFYTOCgVnAUk7Mx4Lxyche4fsJIdvGpnphdlSc/YQ+oLKs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cvlgPyQJ; arc=pass smtp.client-ip=74.125.229.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cvlgPyQJ"
Received: by mail-dy2-f12.google.com with SMTP id 5a478bee46e88-328664c2da6so2777315eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 09:55:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790614537; cv=none;
        d=google.com; s=arc-20260327;
        b=ZzrOvABHrIeKjLLJVwIo/ifzuA0qjXYXVc2t3s8ytAnuKzbQGssxeoV7loUmZW+Qd8
         jDyuYj9OKMI3fXMj0AkiDfJFjytm3va5v4KIrkgL0YVuQt6+gCaDdhol4h1Ajz69x3OU
         S3u3qIfG49y31WPJHUMzp4qY0kl0hj4mIgeOcCTk/YlRz4OyHMOmehJItSNmeAC6iUsY
         WE1Oh8EH6lLLYvl8csuCAdzwd+OS7ge/BYSjQ+14swJZZUUzJTwl1Ev4JHpf88WKJNCj
         vqiYwqshX8e9oRmsdqehgZssYFVOmpHPMkp6R6Kq7f4fPVPu+ReK9YUTZtwYCaQlo+c0
         NDgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Z6s4XNqPyMsAZrWg+mBHW7PCfGqW8dSbNXXOuFI+D+8=;
        fh=nf9/fafQr4NBjALWJJhuh+owIrEXfE9dsbvMVxAoEmY=;
        b=PNjn5hJ6ZXgPEaopJAlxHDp6352FzcrAO7+rzftJ5etBA84+oBW6o0RiR+isj5m2qx
         ZwU26FGWH4uNXhgzBs7MA8dRUDnfC3MkY1JYWAFQ4Qpm5FnMdQKV5jw2xKwJvamfrPXO
         T4C1VDX/ph/NLGZ5+zttTT4YWaW8dFrexkjAIEQzda6e03+FRiTFAC2FGDdrA1DaRDLI
         5awxsHZRPOxjzcuATsLBFo6DF+nGpPxSg3tOu0GEy0AjvfMfjpbgEPN6NnKy7PiWyYIz
         3yAlSFHKH9f4ryvgnieJ3Xr1HC2ktSAhamf9atZ0HspHj9wMh7idEgPIh4NQ5G2rzbAE
         CDYA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790614537; x=1791219337; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z6s4XNqPyMsAZrWg+mBHW7PCfGqW8dSbNXXOuFI+D+8=;
        b=cvlgPyQJH/mne44/ePSBMhruCjbgIOa6pkVsKx+Ujh+koxfeIe/vN7pxL3L7BxrZ3g
         1hAIU9sRW21RugC5I2RQPfddbxSCC6Jq7qB497t1zezmvH09nimC4mIXr1Z38ncRqHaD
         TFWUG4tCHkvNgsR1Q9rY2+mYw1F1XQ34MqNkgAbOlYPcS0wWpb2nLNqasoomXKaW6w5b
         W6S3fH1emTbbZQxxRKRPuJG4r8GWlFaWi2Dq6bNNvKA/cwjcelJbb9KR0ImfOi2ALr7z
         BtB2PUC5KkGbiwTmMNBcgXoRMUqg8Kn8umGoimmBa53Oy7qnGGGGpEF/UTd+VA+j+hiO
         iNZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790614537; x=1791219337;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z6s4XNqPyMsAZrWg+mBHW7PCfGqW8dSbNXXOuFI+D+8=;
        b=HmLsxiXlagjLWVMupCKGB/7MjpQ3YMinwarSZAm/ZM2AQ7UKdO9ZDNk0wk+pPhFN+0
         sf+Nc4GleWrohdGBNczLGFX5L4LXUKL0DktVMq2wVPzbDVStn9N4UVaIQqPjluGbowXm
         Cho5Kfi3vGGAFutWN5sUXVf2UTxs8gUgqi9OQ7tR/GWA4Us+zH4D3Oq4wHdFWpjX5uSw
         1FIC2mKx8lTZDNO/zP1X62IH+mvfRQDqomFJgCNwjhAbn4orpDlbpMSPDhQe+iWaWEMl
         RTtQbOzFSU15caUHf68v7Yqz/a50Ryp7X4N/XpvDzOU3AM3J9oXbQdrAVKoNEE/JiK8x
         FjBg==
X-Forwarded-Encrypted: i=1; AKwUvBwZvMyo5nu68kcO5cOioWS1YYI7wku6zmU5l4w+BvnWjJWNefe2IohmcjpxX4Tevy0EuLLP+APUtAwCIHw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLDpmk1n8xl7q46YPOMK1xoJTMVA071n1LoOPzK5P3wVrVTED9o
	2myizlJG3i6HHyt7SlgfquSrkvDrbklKN8MUUfAodLo97pktdNRIunBJrE4+ge3vbAvmJCh5who
	1/OFGwQmsdxD5OFKT9Ja6vF4J17juv7w=
X-Gm-Gg: AYBFou2eS7DbVxCS5j19ZjziKFiAPCCIqyiAPsRGu2mTdCczCdhSfcajeZ8ro1HG4bc
	11mkaT8AWLJE4ThMMHdX2bvAJfkQ/mBfskdc11hjHkhsuw/DevIBs1Yc3rP5OGTQqYOpwkoYPqj
	MdNNRVuTR9A/TQIkLPxkHtPlG0FzruaCXrHhFTxGOSaMl9pg1oqvLfabJPP+t2de3DHCsAx17M/
	pK+Klry0hY1MEPJ4aP7/sXlttGWGEhLwESRQFgHr+9/QTB4HlXCUR7C16VUfiPdPaQUfSbzcC0n
	wDbMZ3rEjbkMRTuKZtFpJQxPDp5M1txu5aJv9hLBRNAXmh6mumsnmGRvr2CR65yfMDezIyWdBUy
	HTEKBvuXmw0W5iU/hTiZpGPegGioSORG7celELeEfNHZNKlEfQ2Dbjx6ksQ==
X-Received: by 2002:a05:7301:550e:b0:334:2bbe:ad6b with SMTP id
 5a478bee46e88-34271a8dd48mr10931201eec.22.1790614536711; Mon, 28 Sep 2026
 09:55:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915160207.2952-1-dmytrokoziuk68@gmail.com>
 <20260915153542.3b9afbd00f7e6cea87a3350b@linux-foundation.org> <CAO63FDVJaRzwE_z4-Yd6Z8fZNEGQyx=YbeFatBN30d9X8SYLtw@mail.gmail.com>
In-Reply-To: <CAO63FDVJaRzwE_z4-Yd6Z8fZNEGQyx=YbeFatBN30d9X8SYLtw@mail.gmail.com>
From: Dmytro Koziuk <dmytrokoziuk68@gmail.com>
Date: Mon, 28 Sep 2026 19:55:22 +0300
X-Gm-Features: AclHuK8C0LQPHgVg0oAwvuYAM3nnvMC17hc19o0pmQNpDAVgyULxtsSzmjilem8
Message-ID: <CAO63FDUNVzMss61+TUYCWSezo1K1PL94iAdt=kNUoWepU=nhMw@mail.gmail.com>
Subject: Re: [PATCH 1/2] mm: kmsan: fix iounmap metadata teardown
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Alexander Potapenko <glider@google.com>, Marco Elver <elver@google.com>, 
	Dmitry Vyukov <dvyukov@google.com>, kasan-dev@googlegroups.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

Just a gentle ping on this. Is there anything else I should address?

Thanks,
Dima

=D1=81=D1=80, 16 =D1=81=D0=B5=D0=BD=D1=82. 2026=E2=80=AF=D0=B3. =D0=B2 10:2=
2, Dmytro Koziuk <dmytrokoziuk68@gmail.com>:
>
> >  AI review might have a found a couple of issues - please check?
>
> I don't think the patch needs to be changed for these issues. For
> normal iounmap(), the
> caller must ensure that the mapping is no longer in use. Also,
> the x86 implementation keeps the virtual range reserved until after
> kmsan_iounmap_page_range() returns and its TLB flush completes.
>
> For the kmsan_ioremap_page_range() error path, the mapping has not yet
> been returned to the caller. Cleanup and the TLB flush complete before
> the reserved virtual range is released.
>
>
> =D1=81=D1=80, 16 =D1=81=D0=B5=D0=BD=D1=82. 2026=E2=80=AF=D0=B3. =D0=B2 01=
:35, Andrew Morton <akpm@linux-foundation.org>:
> >
> > On Tue, 15 Sep 2026 19:02:06 +0300 Dima Koziuk <dmytrokoziuk68@gmail.co=
m> wrote:
> >
> > > While studying the code, I noticed that kmsan_iounmap_page_range() ca=
lls
> > > __vunmap_range_noflush(v_shadow, vmalloc_shadow(end)) inside its per-=
page
> > > loop, and does the same for origin. The first iteration therefore unm=
aps
> > > the entire metadata range, removing the PTEs for later pages before t=
he
> > > loop can recover their backing pages.
> >
> > Thanks.
> >
> > AI review might have a found a couple of issues - please check?
> >
> > https://sashiko.dev/#/patchset/20260915160207.2952-1-dmytrokoziuk68@gma=
il.com
