Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793794864;
	b=AGNDVOfeqLnPPGQRYSIVVtnzHDgnkqT56l6AwI4Gi6EER4BjHJosjcOUBQyysqaiBIVP
	 KIfsP9EOyIDw0/hj5HW8PDMdXcshmZ04+H24OlO6vapRtaRJnr3L9JGpXFWKtOzOvVkLd
	 50CRLhvknejvfksWi6qz/mzYEgMk2O0OLJ/KwrJ9p+RmB8t1wj1exSLegDxHeqBCvfmE3
	 BXiV64H/IUsTyRXcLFmz3DcRojGgdd5VQajLjY5gwKtcUlXyGMbvUbQvm/IcVcvGN5UVI
	 SuiQUdC8oBYd2K+7OQR75maGbTGXzheGUdzYkU+V1ROP/2D/ArKPewUAIeNUwHj7uMQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793794864;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=zpcmkLvepjbGKQ3ACqSVKunOIWNZQhJb9SW/YrhLa2Q=;
	b=KPTKLRzTn0ttkJNQ0T2EGIjFhjCbjnj6ukm+P0b6tvrk7qfIlUKvZnSneOaqJHA1Nvss
	 HaR7DxUpzKFmOGvNKmxHT/TllkUp0ce/4OIe2r8YhElE+XdMxPG2pWVUQvOPiZuEDkOGt
	 8zDdodHpBO1J7yepDBj6ck3VfYRAcZHfPj2cOMuvhP+6IS3+2HtTkVYoIHb/nl/kk3qt8
	 xrAhBtCRZvbQr1qOXFX4nnNj93DrGvkLkTLS8dgEJfRFKX3ZELCdxyoiJ2OdjdzpnW0QS
	 JmuN5GkvioN+2K6EG/veyYNeHw9P5RlahlMKDnyGVS8NJ1eCCDoJYn8HT4FTq6n//Mw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QCA55x4D;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C82606A32D
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 12:21:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2C82606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QCA55x4D
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ed1f1a7695so5395ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 04:21:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793794863; cv=none;
        d=google.com; s=arc-20260327;
        b=QvqAyIxFxztDlYn2WJqrUod21vToouwKIH5joTsZI/wXdWeMsnARJDTa44771NAy2A
         Hf5bkbRSG9pWovCSfPAi9PZqf2cv6E2UBxX1VtGW2GNSP1+yHz7/YlPx0InITLeHtey2
         O33pAVW3tr5pcon9yw2svXKuRsktfi1czo+d42PCmAVwmCKRUaXEDShVUtRHof/CFQPb
         459rjWlYWMkmjoPp7rTR1JuXnc1+cWSHT3URMjGAWBu/vAmkSkwFcgsZ+AT4XQ8DRUnj
         keal9+UD3AoeY+fJvNrvQzYQRNJerW1/U291ToV/8iPz54TsdxMXWmsG558aCJBy6g8e
         9PLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zpcmkLvepjbGKQ3ACqSVKunOIWNZQhJb9SW/YrhLa2Q=;
        fh=My7T1GpPPMfXDQfMtoOIbYgwzivGFAQbY6puTWkuFj4=;
        b=MmNXGKybwtQe1PuuavwhTwkMV0DyliXhITPm+8UPFvwEqdCAP97+8Ox57yencyib3Q
         5X3bm/5QRNw86CSlZhITjTWIPgcyJB/wZJ3y2lzODIhQE5gZ/pEMoetPP8+NLv7Rjw4q
         G65JpfqcXBeEWY9xKamlkjWvbYGh/lHxdL/CF/3Maejt2mc46msf55UMhPVJAiTVHQVu
         zwZR0n3YT8cICICABGuHKTfY1PiEiX0Vhw4VeNHxi/Xr7V97Gkg9f1zQTaIRvdyF261V
         sb1YXOPIK1fc3ewG9pbSOulIdVkR18VfF8yC/MWZmZ63rKSTZa84ityvyLW46H/2GsPf
         Jtow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793794863; x=1794399663; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zpcmkLvepjbGKQ3ACqSVKunOIWNZQhJb9SW/YrhLa2Q=;
        b=QCA55x4DMVQpsa4nuGxMFPfFzDhB+DJv6lDYmKzU/yOFbPBpfo1Tnz+n6zfvKL/bmM
         DA+DIemX6mFMJnvumRP7v/p/+1rWEAeR3gxNFXgLOAWDIsuKowV8fbIbTsGaOmv5x3P1
         vL0bnRVr13tnd6f2KeMlWBfWebUT+RxooinF8q1HYOcnF1qJuA3i+KZusxOJn5aPlEaR
         2IGt9aJgdmZZSJOd5241JMU3xM1pEVq+XCtlUNCfPoY85Gh9uXWcTJ8jFnQOAAKe/95D
         oKHpZqGF5nnmPMaa2zMKztX5fByxKRh7is3XGg+06VcDkV4IdmjxMKtbRixUQzlixzsn
         DvXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793794863; x=1794399663;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zpcmkLvepjbGKQ3ACqSVKunOIWNZQhJb9SW/YrhLa2Q=;
        b=0gUf2p/GWBULbHyRJE8FviW+GtYPhdv/OefPBgOXwKEtpJY7fW9ZRj8B8J8dV52WXW
         Xn2ldfPoQKjIDw++gfaUfMCuwSbSRAQ+9OVVSb9Wc29b8uy3D16nOJKRUJmAoFwd7Va6
         mYE9nQKe5t4HiHoCytdi23r2sxUBWLo+PYCG04n1mnUWai8p776GyEbA1rldsfTIO220
         flTKDAen7sLS7kPo6cOthihHLrJB4RQgFG6Ue09xA2Cfa4wBzegV29B1nX1RTnY/hnqZ
         W2woFNzwP4HAsKrvyzd5rb0wbTnR9L2caiTFyhEEzTZrG6pkUuJH/qO7aZKvIBLNvqT+
         7XvQ==
X-Forwarded-Encrypted: i=1; AKwUvBwpOHmkFyZ0/HZ0FdSflUFRDKtXNXAKClaBOT3tyYlt9jO/zdJYYiyX01rlNpu63fu8pce2UsWvQiThsh8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+x0w6C1K+G9GkskkIzXU3jl45kaN9YGUaXTnUsekYndaJaSAw4
	4eCkHZgXPNiJpGqs4yk3pOmHONWbSYjuS9SrBHTd0viF6OhKZ1k9oyairD6nPzSF7TG5NZ4pbzE
	6HSbrJFQveJJOxnsZ9Sq6LGM1fOEuObE=
X-Gm-Gg: AYBFou3usUWBoMoj1PbwLzWs7oDSG/yg3Vu3eUj+nx4yWG28I4XUlyjDBRHvVdXST7P
	nyxXAOfiYS2n/SwDmYqDnj2EgVWfwqxBYpWOQXWRF9R06yj8Xk3CnLcCR+rUUtUFU4fIOHIf9N0
	ISASBP6m5QYjZ8LWmxiZt+NRnDq+JX+kaBPFmloEBWTYuFHJsFkB1bPKhXeBGwTYZPP9SNeK1Ge
	S7CZbR7NiPquWiuTeUmO29p6+xapm3jygVGpSwCuxrOD6LtVbtTUjylUp9MHlOqsdPaHlTo8l79
	BT8XFOFIik8Ntzn2KjR0nBSXt8mHdx7X9NM4buVnH0WG4/1spOjVqTNTKEnimOdU+U0yaKhs7Wo
	FSq72bUfsulWxk5KXZvB1U5UT74wtSbakdk9zVAuM/GItMuc7YKfKqacL6RCd2swZz+SxE6M=
X-Received: by 2002:a17:902:ef45:b0:2e9:5b20:1c2b with SMTP id
 d9443c01a7336-2eb36396190mr133772755ad.5.1793794862951; Wed, 04 Nov 2026
 04:21:02 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102-etna-mmuv1-iova-cycle-v1-1-1148f02da254@igalia.com> <eb6dc4502166eac99f1c5f8f579cc4c4fff94ef4.camel@pengutronix.de>
In-Reply-To: <eb6dc4502166eac99f1c5f8f579cc4c4fff94ef4.camel@pengutronix.de>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Wed, 4 Nov 2026 13:20:51 +0100
X-Gm-Features: AclHuK9Q86EuHEL6aid1MOBRmfEEKC9jeoNBaMIn0yDWb2US2IJq23YE1o0-1eg
Message-ID: <CAH9NwWcGfHZ8jVHdyBoDojs67FuOq6xxLNPnvLhqVUgn89oLPA@mail.gmail.com>
Subject: Re: [PATCH] drm/etnaviv: Cycle through the MMUv1 address space again
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Russell King <linux+etnaviv@armlinux.org.uk>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, etnaviv@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Christian Gmeiner <cgmeiner@igalia.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Lucas,

> Am Montag, dem 02.11.2026 um 13:22 +0100 schrieb Christian Gmeiner:
> > From: Christian Gmeiner <cgmeiner@igalia.com>
> >
> > On MMUv1, all clients share one address space and the allocator
> > always picks the lowest free IOVA. When a process frees a range,
> > it can immediately be reused by another process.
> >
> > The GL.FLUSH_MMU write before the next submit does not reliably
> > invalidate stale TLB entries for that range. The GPU may therefore
> > continue translating accesses to the old pages. Writes through
> > these stale entries are lost for the new owner and may corrupt
> > memory that has already been freed.
> >
> > The vendor driver works around this in a similar way. It does not
> > return freed MMUv1 ranges to its free list until the address space
> > is exhausted.
> >
> Do you have more info on which engine inside the GPU causes those
> issues? If the TLB flush doesn't work reliably we have a much bigger
> issue than just address space reuse. If the TLB entries of freed memory
> are not properly shot down the GPU may write to memory that has been
> reused for something other than GPU buffers with a malicious command
> stream. That would be a security issue that is not currently checked by
> our command stream validation.
>
> Can you help me understand this a bit better? Which circumstances do
> trigger this issue?
>

I found this while looking into the flaky GC2000 tests in Mesa CI.

Reproducer: Run piglit "copyteximage RECT" in a loop, one run right
after the other. 20 out of 21 runs fail. With a 1s pause between
runs, the GPU goes into runtime suspend and all runs pass. Some of
the flaky GC2000 dEQP tests (for example fbo.render.color_clear.tex2d_rgb)
fail for the same reason.

In the failing runs, the first part of the texture is correct, but
from some page onwards, all pages still contain their old content.
The GPU either did not write to them or the writes went somewhere
else. The border between good and bad data is always on a 4K page
boundary. The command stream is identical in good and bad runs.

The bug only shows up when a new process gets IOVAs that were just
freed by the previous process. If the allocator does not reuse them
right away, the failures disappear.

So GL.FLUSH_MMU does not always drop the old translations on this
GPU. You are right: the GPU can then write to pages that have
already been freed, and my patch does not fix that. It only makes
it much less likely to happen.

Galcore writes GL.FLUSH_MMU in the same way. It does not run into
this problem because its allocator only reuses freed ranges when
the address space is full.

With this patch, I managed to run 20 rounds of piglit in CI
successfully, with an empty flakes file:

https://gitlab.freedesktop.org/austriancoder/mesa/-/jobs/113663487

Is this the proper fix? I don't know. Maybe we need some special
handling for MMUv1 to make the flush work 100%. I could try playing
with some of the MC_MMU_*_PAGE_TABLE registers to see if
that helps.

Maybe you have a good idea or a gut feeling about how we could fix
this?

-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
