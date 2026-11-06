Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793990538;
	b=2PSZVCq+7DSQLF/2VZKw13zXHjUEfi4GCzQPCSgnqhTWS1f9eHoaYXTkeJJiOptm7Ice
	 7HovJvNu0S+pbVXowiIaLZTxWh7q7PzzQzv7R80vCoYl+ysHYF9e/MgbTXbyPX7KiaKjV
	 4s0ff2X2Y8QyXE6RRIyY/hStIWLVFPHXMLCeveYrAXsXvBcta0fieZk6pF03EVmAPba1A
	 gdv+uTAkVmYe73l8Cias/WHStmmUZw8uz9LRJVAaz7wy6+FPPsKg3zpaFsIBpLJDUnLZT
	 t+s8rLihmayyIb1Mo7SlvmSlDm0GyrWrhpC0LdSwZuW/naXsjZQrikOpHfgZJTiZVoA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793990538;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=9O0I1WlvitVAffqL6IMDmurKacq17pLSSS1ily/aCXQ=;
	b=aYm7OsAXDbhn3nHsM14s1CzfBPRSI6F7OIIf+YEjaU7dArStPFAH4QhuaPLUvc5pEMZk
	 QkH3RNQrun/L6ungo+66QZaR/h9CZi4d6Q20XOXcp4WU8KOasQOl2yLHrG2AggZ5um6Nr
	 zK6rxJqV2PcNvVjyVY8ZjYEGe7dvAevIWHSsFhs8Rpeg75PWV3SV3Z58eKlT0SRnyweTJ
	 WQiJreIzsrh2TsyE5gZqF9HHvtoKJI2O8rWLiUoJwiRH8+ZcmhOyxMzoqgO3cae9oatjR
	 B1HUNEygdhTHYLqcsGI53Q2Cg0TAZeC1zy+UdatjYr6rhm1NmC94XRO8GQDsrSr05lw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="Ltf/oDpk";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.170
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D33E606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 18:42:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D33E606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Ltf/oDpk
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-533202fe429so95081cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 10:42:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793990537; cv=none;
        d=google.com; s=arc-20260327;
        b=iWXQSMZ9LcuH55I5AKdLn8h1COFSwmj90EFzh2ucXc6bsuN6AqY+XgyOSAvuHud0k8
         sieTvwidfZCqqNFilDEgVNxY9w7fTSd1fVPx6ew0wjPxPMtXad2mkdSMpHDaUKBd+ktc
         uNTU7LIwgTMclnaUeGF8GyrUfKDx1VdwdL0DSjFfSJv1H2+ESQHUcjdDY5s6XXsvV+JO
         uEcMjC+7ABo5fvqnqGFGOjJDTVRedVtEFjIWfSObJI7Yy2js3mqH0RvCDnYdNgAE/K6M
         UXXHCuR5WHjnjDAvGH6mkqOg2O4kSVLT9f/o3gesUfAFGf3BGYCCc80fIX1tmPMR/tac
         aJsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9O0I1WlvitVAffqL6IMDmurKacq17pLSSS1ily/aCXQ=;
        fh=v045oZIzYfH/a/6kz5dMn1YGXm5NeeeJiuL5yGeFNSo=;
        b=TqgQXt4mm5BMRcr5VqaTrpXUBwCxtblNSDLlWNjRPh1wJKRxTYtZXzxRaBK7/BEs8+
         LsCLu4T5IWGUFeSm51xHti0o597oSQ59b8umugyauzgLwew24z1azRvxKurPo/JvvIiK
         n3kFreFWhKnKkav5HcGzcqu0glcenHpf7aSpGpRZz9zWZ15zSETOG+4hxYGG5qKrqWFV
         LmTpvov+bKbaSHDbU1Pg3C7qhHygEIMjf1ND6QlR1xUk4T4vn8gbXxh0ZLDOq7w5sp3K
         /Yy9qRjdwx8xr1Si87OE0U5X9q2YIIeZ+Ev3xl5wZ4Z2i3CUHDeGI+QgBWw9/vBKLHfV
         uO3A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793990537; x=1794595337; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9O0I1WlvitVAffqL6IMDmurKacq17pLSSS1ily/aCXQ=;
        b=Ltf/oDpkqac6bI1uJjUHiRwh1Kax9N6VmOnzZTU9UnR1nI5jR/ZJgtCgX872jJg12c
         OwBo6Gpy2AvgGNrKEJMqjYCMptK00JqkuY+CdFLSSHJm1ouwAxQabqukjUbIhSARx7AZ
         3qXkFzxBNIWGNn82I7DRDaQcqwYXyMH4pRX0VVDc/vhuNnKqxZaCAS0t7fvKgIip4I2H
         s1LJ89ykjtLx2eIRRtfdtJUAFMlwx6auuxaDJVSk9UHMx4JrhZRzKSA8GhUd0M8Jfz8n
         HJL2Noca5CmCLvc0376jFczCfDmr4t9rK+X0LdRMukeq+4BKYgvPtCaNT5XyWq5XWiKq
         ImlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793990537; x=1794595337;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9O0I1WlvitVAffqL6IMDmurKacq17pLSSS1ily/aCXQ=;
        b=vDtAmPsCzSymGYLDwxZb507FzZkE7QRSEeubSLoUeXLZMixIyifusJTiweObyfahEJ
         kqDvzhejGENBYONshQnC2ZWOoKJMSfZibW9kkC+behVGao7+jLsMUWpvGjyy0AwgEJkZ
         f5OJWnbH+3jNLMwtmKNIzCT4LolirkOqXxsbcACvfp6govQfqLAoKF1ZE4bjo8hvik/g
         nOImsSEPgZqQzoCpSGb4QVWmGdsveK+LYfPnZ7xH5D5Negbuepxp85Jj2ZU8YOBNVbUp
         3hYR4j8cyKlVoTELYOPqYx4osITsVUGWr5FSV1m1BjCG+6T+e64HQKLsFFFDaXUH+mJs
         M8Rg==
X-Forwarded-Encrypted: i=1; AKwUvBz8K64F36YXfEaU5YgDurMg24H9c2bYPnprygs1sjkt0363L893aT19eu8UvfZYtwv+Cv/QgeNQ0QreX1E=@vger.kernel.org
X-Gm-Message-State: APuU4Z+zR4R0u4HUvehFIRWouJsBTUG2CHlNpGHlvDJ7ksIfjLb2da62
	whEbu1Jr0INtAgc22ibJ32/tvb8CUc568D/6bSjNGzWlNM/mBPZfaTzV9N8abvt7AxSjR1qri4L
	D6JJRvu8jzD+5d/h9JCRqdatA/dLKIiLD5/kCDwG+
X-Gm-Gg: AYBFou0+xJ0YpH1/kr/lVbrbopmikodBkManW1aSobFy4n4+npw8hQH07d1K1YWxG7K
	uBp9D2MkHHDCwGWFhyp//mvA8iPHFHb6mxrIGJ91qnchK/raLJblNaF10ONvMLVa2/yNmnNcpHl
	6bUz+WkmGIad0EZKNV6fSmzuJP7P7ltp7p43eCwD5VHwI8WO7oIIGC95RF/gUPCg5hW+FzbvRB+
	8vBi1NTDbD9TPu6cYKOqNmzgF/himSArRvIt5FJupc4fqUY/3n4OusWplBvRe5q4xwfWGw52YAR
	P1E31/fsELX6gOialo0u7wsUdPV3sxT984NIGTYVBHjL+yI/cogDkoeQEOHC/UpvSlXk2VoPUAr
	1pd9zeEPjKj5lYVtYxtdbWq0N1+Mqc2sS4PTVoEkcQGryqEk5KTUyVR998Au1GBRlG/In5UfmJT
	gloz+jPCby6e2MyPtsNsiCNR0=
X-Received: by 2002:a05:622a:90c:b0:533:9746:9a86 with SMTP id
 d75a77b69052e-54f5c235197mr3962781cf.5.1793990536696; Fri, 06 Nov 2026
 10:42:16 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260811204123.3198370-1-tjmercier@google.com>
 <CAO_48GEUhpyeenX8Vu1NoDnvzib5FGv3rOBYNYwQEWu1-6cjaQ@mail.gmail.com> <CABdmKX0uiX=QKFAYgwwBPHW-X3vh-Rm7w-cNp9EsJzQarTzDpQ@mail.gmail.com>
In-Reply-To: <CABdmKX0uiX=QKFAYgwwBPHW-X3vh-Rm7w-cNp9EsJzQarTzDpQ@mail.gmail.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Fri, 6 Nov 2026 10:42:03 -0800
X-Gm-Features: AclHuK8a9YKRuRmcG8Sb2ftYE5SfU2l8w8O16-ruNv6bWd_JSLmgbTqw6Ki40U8
Message-ID: <CABdmKX3Ep0cAPakwKDYWnOkrFgfhsJAv9Mh1us+OfscyNeb2tw@mail.gmail.com>
Subject: Re: [PATCH] kselftests: dmabuf-heaps: Open heap device files O_RDONLY
To: Sumit Semwal <sumit.semwal@linaro.org>, christian.koenig@amd.com
Cc: benjamin.gaignard@collabora.com, Brian.Starkey@arm.com, jstultz@google.com, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 12, 2026 at 9:06=E2=80=AFAM T.J. Mercier <tjmercier@google.com>=
 wrote:
>
> On Wed, Aug 12, 2026 at 8:02=E2=80=AFAM Sumit Semwal <sumit.semwal@linaro=
.org> wrote:
> >
> > Hello T J,
> >
> > On Wed, 12 Aug 2026 at 02:11, T.J. Mercier <tjmercier@google.com> wrote=
:
> > >
> > > Write permissions on the /dev/dma_heap/* device files are not require=
d
> > > to issue ioctls and allocate dmabufs. Applications should be opening
> > > these file as O_RDONLY. The BPF dmabuf_iter selftest already does
> > > this. [1]
> > >
> > > Users are pointing to these selftests as examples of how use dmabuf,
> > > and encountering permission errors on systems where write permissions
> > > are not available on /dev/dma_heap/*. Apply the principle of least
> > > privilege to selftests which open dmabuf heaps by removing the write
> > > access mode and using O_RDONLY for the open() instead.
> >
> > Thanks for the patch.
> > >
> > > The same is true for the vgem test using /dev/dri/card.
> > >
> > > [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/tree/tools/testing/selftests/bpf/prog_tests/dmabuf_iter.c?h=3Dv7.1#n49
> > >
> > > Signed-off-by: T.J. Mercier <tjmercier@google.com>
> > Acked-by: Sumit Semwal <sumit.semwal@linaro.org>
>
> Thanks for the quick revieews John, Christian, and Sumit!

Hi, I don't think this has made it into any tree. Can this get picked up pl=
ease?
