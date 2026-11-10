Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794314459;
	b=lxYaaYLnR3ZVZ2WSdCkgBvWJK8alMaeCLNovS4U5hlJ6Y3DZIOWGxE6iuGyvq20m/UKW
	 1bR2BcrSEKS62z5VVcWVxD//Qoz4+8VCPfNFahi7lOJg2z/J4dayw8uryA4JPFpP30Im7
	 zrTp+tNOF2DbHyMs4sPnS0c5VMaRN/YDBqPKUXhUtM/dndpw4QRvsIpVaudr1+OyszBeO
	 moasiEeKHNaNqHgHrSKwSv0IsEmlwc6U9gwslmO9qAaQgIv5sxaoxtOHn/Y6R42Eftnno
	 2dZTzn1UyXSl8TtTUjVUFHlehJj99yph+pIE06DYvo4Mxy2KeUobKSzK04xYdb6BL7Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794314459;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=D4gMZ1PVA/qgtmCoqERD1UHw3rhXprh1G5vdxXe7myk=;
	b=oC80426Aw7eUNqOOwMUXivRC74q1EeAAybt54uK8mi0Iis024/8gEN7QY7eP4teDAw05
	 KoxSjgbx8exX5oRxyRJAEqe8S3BFL8x0M1t2JEDY2kUHTtQGC9gBAbtM6Ay70W1XBIFm1
	 Rt/9t7IIB1itGO6yeXd5g+erQ98+sJk3iWNWFdKg+X8XmGjVnZy5WrJZpvTN2+OeEB+sp
	 8e5F/uAYsiCdENF2G2xflDE2bb2+cqGPcckYzHnMGD4l/DpFSCAsEsMcwK6uuVnUSrfz+
	 b07Sdt+0o/WxW1U+/0Po6nleteOZrwe8BI4BiTUnvJRDsNRZP1VsFW/28t1yJHVH6Qw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UiED+id3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.173
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40512606A33D
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:40:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40512606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UiED+id3
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-93e64d52949so174548985a.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:40:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794314457; cv=none;
        d=google.com; s=arc-20260327;
        b=AGgoOvp75tx7cDGlanmdT7Dr/rUwGxyZJAFXqxIfwRrSqoVkCr3q5RZ4g/pevujfFr
         eT+fULQtwnrquYicreYkGk/0k4jP/hUz/DSBfmiQGipNhPc0QiCjDECW/KmAe5HLWy4D
         WwUSNxewwMzMPj9TyH2W5JZpRJg/1wT49lOGWH6bvLW+mxk8OeltXpGN9U0YHCURX/6q
         7hlS6/tDh15VJ24fG4L2Lehh7XqOHA/abLn3fXvD0tH6pacNNmDHV7ZC803n+IHSO7yg
         ugcPO9r7yrousuazLrgz0/7+TyUA27tiK3tYXl2L1an85GT5zD19nCYM5QqLfIAq2rB0
         q56Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=D4gMZ1PVA/qgtmCoqERD1UHw3rhXprh1G5vdxXe7myk=;
        fh=LF9qJmVS9PS+m8ixhMZcCuMnrerTSfNDhrywnXJrO3E=;
        b=IYymcduWT73/Qv6ujZFFoP/qaTsf8BeVJ9ITJI46KDqFzthejk70gg/Ituvxm/J/Uu
         Ov14V6zcYTtdGM5t+0PLT2kWqtpauTaS6+qVuTTfK4JUILsiqa6yDITZBa3B0Ybdw/x+
         Kztp1V/KZdCJ2FMytzoR37fw+DU0EQI4KDwLIHJei4EPkIsS2Obfufob7yUhOccZnAa8
         wK4gXbRcsnGGXuhMAyGjc2KmP+rx3KJAmXIJJC7ENaysC/gRwp7hyMMtQECHLJa5khBx
         fByWSQlFcTQAsnMDBN/kEK3Wi/Tc15C6OVdvKI5wWjes/ITXgqnS+UCBW/bfpMH1usPg
         PpYg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794314457; x=1794919257; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D4gMZ1PVA/qgtmCoqERD1UHw3rhXprh1G5vdxXe7myk=;
        b=UiED+id3VSZdgsoZMA1YSiLfBE2mMY0BkkqRrECjgevQDkAnzJCGpADOVqPQp4JgGo
         vbpL2Fq8GGvTlgPBqzQaZus1cEssuCIBBMyAckf5TSHJObOkYJZTktiBshe3GcXV0IKc
         /pjZZ1e48v0/hByYGiknK8QpRcyOBsvNR/M9aM5VQa1vzPCcwAS8wnHbNUayF0a+QM56
         gOFHXs20ttDRdZqaJ8lq0X/5G96YGrfpF2HqKsL48xUHNVi7qT+w3nPsVOhzCG977We4
         Mc3r++vex9Ysg9cMkgoWhDd7ZjUu0Rj0WGogNlcP3gH7howVxcZzz4qLX9id2JvsT5ea
         650g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794314457; x=1794919257;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D4gMZ1PVA/qgtmCoqERD1UHw3rhXprh1G5vdxXe7myk=;
        b=utt6szVDqU4L84y0LXmE1xM8Igc8wH3lASTtmx0H+eBrliFrTKttCoscpv+UdZ7ogO
         yTf4MHk/C6uVlOILZf8oJ9Dt2g0Yvi3TMEfJ0cfdp0m+rufM9EMtqUGx6oMTNGU+jY6I
         y1BfcyU0E1Jb2pduhc2kLBjmGAH932gBna83FJoqrOJaf9O9PQJ4CA5F0WMaiUz9NR+C
         7uBNi1doa+8Vcbje1wbXnB2gYlaKqMmivPjW4vsvuVfkAR0B777QKXduFa9/QRZnJMfx
         QECCQGP4Td+58VipwX2oyjayRVb536yGsqiE+VkDxFs5LIVEHi9C4o+8ffRaQOusLU7u
         kPNg==
X-Forwarded-Encrypted: i=1; AL+hErGaFQ1ZUsTlxSF/pKjrWn6kF7dxWYq2RH4WQsXcHgiYaBraIUdoYssticHKWW5Cm2fH9FIX3CWLNl2Jtb0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ttGxls7APwZunLKC1LEipv52RoW0k6oUJ7jL3MJxQTf3iDRMf
	pwfZOGTvC9RpCyfpXdBmGLpTSQbcIyRKgNQqpqsG/ejwg5bllpScl5/N6sHFzD53aSPQPRmENIB
	PiP9jUsypbGHa0SmSNst8nQJhTkXNIhk=
X-Gm-Gg: AYBFou0+o/0hoyu+4h04PvwM0wj9M525X2lv322eC/NTn4oYQGRmSBi65+8jGr44XJw
	04xvfUXbf97p9y6/PUk6gWMWDWoGEveZbu7Y5TFKDlnp1jIE/NWWHJMWj7qK7jMJRxwDqUoeJ4t
	+JnFVTGuF8kTEgi938t3acEAYoTXl9IDZFNx1Y90pVF59pODC7Sbn76RmR+RRvf8kE9Rl+7M20x
	3aT4DOzf1Lj3J2YHk+Yav+NB/hLNE7wnbKHbDGHumvyYlY+3JBF54C5YRXQRYz5p6BJsl1EpOJe
	zJrVE100uMpKdCpM6zCSjax5P3IyfXtmZO3SbufJj0J6i6YbPP+bOgRPExJwY00lwzHZho0VDi4
	/F4wD7kzsH/b0Ctc7pdqMWYrMUZQ2HKh4UEMrDSjM0baZisFY9tUyN4ZjmpEFKovAM1rV9G5ySr
	P0UJYVksXNTu/KtHUE0eyz
X-Received: by 2002:a05:620a:450d:b0:93c:b6db:8c with SMTP id
 af79cd13be357-9479f093b28mr391627885a.0.1794314457277; Tue, 10 Nov 2026
 04:40:57 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CGME20261110094847eucas1p125691a852f3621482adae13de1205223@eucas1p1.samsung.com>
 <20261110094830.2081847-1-m.szyprowski@samsung.com> <20261110094830.2081847-2-m.szyprowski@samsung.com>
In-Reply-To: <20261110094830.2081847-2-m.szyprowski@samsung.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue, 10 Nov 2026 04:40:44 -0800
X-Gm-Features: AclHuK83CWJc5YlF2QehrZfUW5W7mZ4EuCDQrpmAsXstQoXrFuDrYSPavdO9f3s
Message-ID: <CAMo8BfL04-yz8VppH6P+dcBTJEvM5zPR-=d9GMdRG4F2B78YXQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] xtensa: write back dirty lines in arch_dma_prep_coherent()
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@infradead.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
	Shrikanth Hegde <sshegde@linux.ibm.com>, Chris Zankel <chris@zankel.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 1:48=E2=80=AFAM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> arch_dma_prep_coherent() is expected to remove any dirty cache lines
> covering the buffer, so that they are neither lost nor evicted later on
> top of data written through the uncached alias or by the device.
> xtensa implements it with __invalidate_dcache_range(), which uses the
> DHI instruction and discards dirty lines without writing them back.
>
> This loses data written through the cached kernel mapping right before
> the call. dma_direct_alloc() zeroes the buffer with memset() on the
> cached linear mapping and only then calls arch_dma_prep_coherent() and
> switches to the KSEG bypass alias via arch_dma_set_uncached(). On cores
> with a write-back data cache the zeroes still sitting in the cache are
> dropped, and dma_alloc_coherent() returns a buffer with stale content.
>
> Use __flush_invalidate_dcache_range() (DHWBI) instead, which writes the
> dirty lines back before invalidating them. On cores with a write-through
> data cache it maps to __invalidate_dcache_range(), so nothing changes
> there.
>
> Fixes: 0f665b9e2a6d ("xtensa: use the generic uncached segment support")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/xtensa/kernel/pci-dma.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>

--=20
Thanks.
-- Max
