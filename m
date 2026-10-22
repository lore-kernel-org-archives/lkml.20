Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792639323;
	b=FM7CyCRVlNJtka4HcUKmmcbV8+IzDIAFPBjTPW+hueNhbypFQH+cQfPiKeT4NKhLH4O6
	 uj8/xaUjh9usQTScWZHwDNt1eVSog3preNZRIbUSVISXeTGo2ZqGQeAfJ4qbQcDC1WWWO
	 AEMS1QKg5SsGnhDLZdx2omnCYUYK7nKZLp4ZBMtI7xGyui0ZvdwrT6312uT1Hq26TnMVi
	 dSOQWNICSuVtt7L9RhlY+z5QbTKEThQFPekBE6WQeMn1Pp1wz4RkfqcovZCUcPhMKd+Yk
	 rRsAE48NbM8gUYKBoL685UEefPGJaquJkb1LKzIfb7J5TI+icHuIExRX1RD4thFwccQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792639323;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=iY1/g9P0L4rhvgCO8gfRef6JrnvEPdwuVRox6+EysUI=;
	b=ELuknpm4ntJLtuH9lWZq3dDjUGbXylfNpjemPhZ1gMZfKIYkKHV4ibQpWtywN5jaqsco
	 E4VAtkFcrjPM6pwIBgcntU+uKhQOjh4YJFG5HQdZWfse33l07flgR5PV3RVaUuXs3AbBR
	 WA33K6QX5XTEzXnauNoADvfCltbpdTGyFJE4WxizZM46XxiNqDwgN+izXxI3n3Kve4HZn
	 nlDCVUo7mcaoIcR4Pb3h1SSLyy8QdglMvykGMznsAXGpmhD+xiva+JjPTpqte3sPHp++/
	 sMnb0rps8jVJiWZR7G/lYGDZJsDVgrmEvT8VYAIlm6biuqG75F+RiDoweivZs2yWSKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JfP0LdLG;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D219E606A322
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 03:22:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D219E606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JfP0LdLG
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4956869750eso9470165e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 20:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792639321; x=1793244121; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iY1/g9P0L4rhvgCO8gfRef6JrnvEPdwuVRox6+EysUI=;
        b=JfP0LdLGXwtCILyMvoWWsANfLqwcpRJsp4BwEjALe1uQsqIMf6oFrj0+Wi6jo27351
         fIWnIrjzthUYJZioSG5OVNH81J17Ndkivmew/W/RJYIgF3v/B6+33LX/JPtt1nO/oT+x
         p8sgu7wFRiLmYU3wlFwrwyjhgh4ycoMhHiSFi8oHy6U5mxVA2u4/ybbVdzNViCa13in6
         ZdZWaShYoIMlZKL8+5OcSgrXJXSxQmDl2Eq6sbdXVCmSLsKEUyzQB/hFlYMIRXdm+XiX
         ITuu0Q8kkg5P7VSxbNFG/Hf+vK/i0ThGd8GFktJ00q7+aTljgYfn5OpyXde5EGajUp7T
         9kCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792639321; x=1793244121;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iY1/g9P0L4rhvgCO8gfRef6JrnvEPdwuVRox6+EysUI=;
        b=sGXF6+3rqThsf6WbeZnp6eslij4CpSksd2pTGFwhoH7bl5GMamaKLHuFVTaV9YKNRz
         JqF1yv+3ctexxm0NdSnI1dNcPJm3LaYWDNm1zBLs8W6dhdnK+RQZ+PmWioQ79Wbiofpi
         sJr+ExqZANVXlln5DVZ/tGg05nypJw4KUodOwP88BcYvA/TTI+NyAjoRO4Dd3S6AkK+O
         R1Wc2ccNYu9EEq2dAVZn9rS8IbszS2TlUp2pZV2eCEXDA1XV1Ddi5ff+NTUIZStsaLft
         TAEtZif1lmK8JL6L479m3+N9tkC/xuBn1Nymnn7ShrMDcOXR+DA8ciMYiXdv6jd0+Y94
         s72g==
X-Forwarded-Encrypted: i=1; AKwUvBziSMQxC4w3dAbj4DvoK80r0gWNSEZ36tlnD2EBoWI8EwTCIVXduEQcDQHLy0XdI/OtN6IQEu/h+GJIuqY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLi6CAf33JgQ0lAHWLGuvOMHCF661c4kElwoGf9BeWVFFnpUCZE
	BfqN5YItc3l/LJFgpAxQFHkvg71FKEXhtvVXjHayJAgJuVPbQ3PYUZPC
X-Gm-Gg: AYBFou1XzjB9hhKamopu9RySiSlQD2V1gXknIkp8fmYtv6RrlohNJgJSQ7y6ktJro4i
	9/O2HT00jijd6T98crHjfXjbxqPTq5gnOcjGAzV0Qf2d7tDZSSY8nS58mYB71URblNWP5w9AWnr
	t/H4ui8qNpvl41DWIWNUybdqrDVpRbQ6K6GGJjX/YwNZaWWX7OI2HbxooMGE8A9iKa4wY/Uxajg
	cYVFvgS6xULTkucFLDa05pVV6/40NjUyCj0BikqqQPYnpo78NwYp/idzGJtyo8rO1/GeNupemTq
	upi2IY9ig7X0aKiL6KSmnxqE7zFLAxwZjrokx18dDuAu6z6bsn0ThEMszQIZnUYII3NQJFCvgy9
	h8GjwfMHTZblMS681Bq3onuGBJbPv2cSCnpeKvpz078lSRIiOtVjNPo4xjVk/dtrvJzR7/ZkJ4t
	MkqwwqMYsQf4eNdY83Z0xAD6ssesiPI1B2AQW6stTS+zxB+eW4X9ViVeMCYI0AQ6aTKiJ7QyhkK
	DtTHRh5PGm1j/ONgGeYc0KDD2n0bojBVmEL4VyJol1Tbwwl5yTAgUIDYAWP+h/HDwL40ZbB2o5I
	rYHlDhiDI4Lktgnxsu4RX+cVwVUtc8u+3rc/bgC0F2Ka2+Q2DKLDUlgRyzU3ORn2RpuccQBTXw7
	VbTsMAowlE69p56ndrZ9JoSotuPgtkQ5J5lzPLePC9YUookcva57swpgM
X-Received: by 2002:a05:600c:628d:b0:4a1:f377:5c6e with SMTP id 5b1f17b1804b1-4a1fdd20a24mr80516715e9.7.1792639320880;
        Wed, 21 Oct 2026 20:22:00 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-ad43-d501-2c28-bb72-120d-420e.310.pool.telefonica.de. [2a02:3100:ad43:d501:2c28:bb72:120d:420e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fcdd3856sm23089115e9.1.2026.10.21.20.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 20:21:59 -0700 (PDT)
Date: Thu, 22 Oct 2026 05:21:54 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Tomasz Figa <tfiga@chromium.org>
Cc: linux-media@vger.kernel.org, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Hans Verkuil <hverkuil@kernel.org>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Tomasz Stanislawski <t.stanislaws@samsung.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] media: videobuf2: finish prepared buffers in
 VIDIOC_REMOVE_BUFS
Message-ID: <atl_rOMxqyHbD64q@gmail.com>
References: <cover.1792392288.git.kmehltretter@gmail.com>
 <f2258d73562e0ebf2efd793b646706ba0dacb2c7.1792392288.git.kmehltretter@gmail.com>
 <CAAFQd5CDPG4RxUwPDbPUJSCxVZE1cEeYEZvQ25Sy4CuJR861Yg@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAFQd5CDPG4RxUwPDbPUJSCxVZE1cEeYEZvQ25Sy4CuJR861Yg@mail.gmail.com>

Hello Tomasz,

On Thu, Oct 22, 2026 at 01:00:19AM +0100, Tomasz Figa wrote:
> > +               __vb2_buf_mem_finish(vb);
> > +               call_void_vb_qop(vb, buf_finish, vb);
> > +               vb->prepared = 0;
> > +       }
> > +
> 
> __vb2_queue_cancel() does much more than that, especially all the
> media request handling. In addition, this open coded handling just
> causes code duplication.
> 
> Would it make more sense to refactor the relevant part of the buffer
> cancelation loop from __vb2_queue_cancel() into a helper function and
> call it here instead?
> 

Yes that makes sense. The complete per-buffer cancellation tail can be
moved into a shared helper, while keeping the REMOVE_BUFS range check
before any buffer is changed.

I can then send patch 1 separately from the DMA-BUF access work.

Thanks,
Karl

