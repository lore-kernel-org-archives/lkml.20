Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793202065;
	b=G0V03VIAKn3ZvsUZloxfqohcpwm1i+o48jiRxOxDrAC+Yz8+TZbIsb3clCfN5w3BaOdR
	 xD+0sRg85UohMaCntV2dJ+hXibNf+Rib6FCrO7UOwFYE6JOKluoLgOMl6MwOu27p5wbb7
	 zXHZB6aYP3quRcFUV13y+A2EXHot0QV2sxuveG/sfN58+hsR0M2aZleipf7bgIX0ywtoF
	 IoLxVp1zx4HVjDXrGycAeKHN0Q8vy4qY3mgFCUQegnQLIdAqqJW6zCrWXzvI3OM2uOS4a
	 UDwEbMHbt40aQDZRIt4CtUGS691+QveqlBMW8gVoM6OnJtue66Xi3GiGpFVA4UXahzg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793202065;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=35HLfcrc/AjiCKvsVtxqxuglfLVc60GMP3of72tM8d0=;
	b=2/KA1F1aihnpQZqJNVUuFB/J2w1+YjMSEDU4Bz6RoMv/9oHfLutmiXTPr+TitJMjFf9B
	 MOdRlaxWNogGifHq8MZ1hxbre0sUp/rILYwYC2zBwV7WMhJeZLBWpX1vz9TFZudIwwAAJ
	 DUTI2GzKcAGKQIFKZ4qz7vIug8h3SdD9Iu6Mq5CQW9fzbzZzlCCMojH0gcqh6yGMstkxt
	 NOS8WTbGeMyduBF16ajPT++oeU9hCOLfjiRr71c6B0jeaC8SlaR2TXQM7JRuS9idGwtsC
	 XiwRJM/BEfNr46Gtrk6nkOLRoZmJon7H3XUmoVjVcJWoWcyvqmoAW/1nX7p35qL+7KQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=loLkuUzK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8018606A335
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:41:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8018606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=loLkuUzK
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c3f8d72d7ceso172805566b.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:41:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793202062; cv=none;
        d=google.com; s=arc-20260327;
        b=Ink6XSbrWcwdmGuHqCDP8+JM3mS/s5K7FRL/2hmA3hBY22psnHjQWO7NxuYhclF/0R
         aXFI5epDZqgExOIzxbN2B+1HHuGZN/hayF/bLz2tT9umpmTTBJA+3EmiHT4bPyAwUhpo
         pZmShY/rG6Yi1WoeeGTaGh91NBg4KZJh3R3hYrZ3yq2qu69+ka8GwT4MDszf8zmPvvNq
         O4gyCVsjepajaPsTXXhQGAHg32pbGFXNKN0amxv4zMvMnHEc/EvbVvrlwxMYh/ghXI3h
         OVtcvi36kInb1S63E2jPngwL/9taspVDlivIsDLEsMFxmQUvneL84eFbm+QfTNWV9f9e
         1OBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=35HLfcrc/AjiCKvsVtxqxuglfLVc60GMP3of72tM8d0=;
        fh=iWZkODt9+SUe+wSyMz9QXTx2Xw9GIi5T2kM33BZdzaY=;
        b=DVO99OyhjYL9m8PQOeenypvWgpSldRtx++NufnfWWQ8I2NInjK4uXizUx2XIwb/5EL
         B4YfQrIHFJjTkCnA9ozcKjMa95mIXHce4txYLBhHT6tJP54EhCFewdrmlSPZtWwaQ2pR
         O9wMBdGzctslbhuz6MiMNeqnmaQ2em2icP/mCuN3j1vsymAc3rLQbbTF1IjgsYn0CFdJ
         qdFVluU3/IFwCPQxlEnkBMOH/nWTNFMdUIm0dEW/1O1+ufo520nxe3wYYqwWGrlHyTHH
         8BUDKOfnEAOA/erft7E6EDquw+/+Ifd7UbbEQlBEa0neZEYiUBJUnU0mmYueOkhggBMT
         iYog==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793202062; x=1793806862; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=35HLfcrc/AjiCKvsVtxqxuglfLVc60GMP3of72tM8d0=;
        b=loLkuUzK6mJYRXElK62aWp5gE8MHI5y//xAl3m1lExP8hPa0npVF+gK5wAx6GSnsGn
         nOu/daaiDCVGWOCD4/iJCPNWeMTUggM8m1InAEXtj4UtX/8+tWHacgQS+KCl5y1qwn0P
         Uftasvn3UXWQeIa/TVdK6Ce6RDZRbzTQ2g3d8x1a9ZFwMCUQ4QBiuJ6Hwh9x4kKQFvlf
         U0WV6ZrItYQLvTfRQOYunMbvwMZQZ2LU5P4R/HQOSIcP8bFHS8yCHle21AZNQ8La9DB0
         uJGbUuk1cpSvqXuGVCGzbEKGomMOI/gGaBZGgCOzOD8P6Y3LBa6QdQg9IP18qON1Nn8W
         knOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793202062; x=1793806862;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=35HLfcrc/AjiCKvsVtxqxuglfLVc60GMP3of72tM8d0=;
        b=i7DYi1kXzvB6uWJrtjFxvO77FqHr1SJc8ZHk5a/1UQqQKjhIyaHYcjlY8+kfL2J1Oq
         mZY2GarO4VOmUGEBSUtCXWyXWGTIQOpkA4va2HhVtDDBM51XzSnbTHo68cRXBJkOOszU
         MDB5tA4/UkFflPlfSdQcQibRbHHen6/kVk+MbwanNkArXJJerbCNh97ppU9EcP0UMMGv
         ZVknzkRCKhsN1qpCdx69x0OiwxznARb84Hpyot3McR7sX5TAroQekvj4Cdm3o0LCHDSh
         h6URZ2VLv+Ttu4o9hVE+KVt5wQZqlI958YiSsypaCE/V09gi8UDzv8+4vnmxjgGpcvf/
         2MHw==
X-Forwarded-Encrypted: i=1; AKwUvBzFTYqNORG0XBUotJVd04XGnI6JZA+dPsAfsZPJUdCZ7SIgBwZb5rSfVXNV823Uq3XRLJegjrlfosQNRUA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKFECFrzeD4ZDrg1xalbmgWQR1Vy2syyE2gSOHfRxqlQtNv+8ig
	cA3RNURz9GXXaTulhQSVJdKYEIzhTgNuXhV9YnRkMYWRRQZQtnVVQ84aDWT9zZuyQGrpJsbjENe
	RElOGJ5InQryWdbSRuLl3Ry+KLe6CH07emcL6vr+c
X-Gm-Gg: AYBFou1qvpJ1jD4llxbGwgBwiFMJ06L36fmMYkvuXrYSnyPLnc06Ln3TPfCTfiQSlaL
	ZkvDPyl1ZN+NnvRh1KhZVMPBhNyek4B6wJ0CRt2e64iCYdgnTYXqM5ifCU6ia0kgLsz27xazkP5
	6L0aCijWm2ySqnJOOSQAFbwsMvK+P1t5ALZVNoqQMjGYnRJWtAdVCeyp+BDL5Z/+OWqmWGkFzgq
	+z/yWd4bV3bgm1QqknOdcGugkl1EFpMqcWFU1AGCdCwjZeH8VCi85Zyv6lyOv2EqbCHpzOxZ1Lb
	bb24q3czp87A8b9pOWL02q+RsJNIA55e9DuWUEREkw2AxvDg8jIao8ZMc3PNts8MB4S/VXKfj1O
	zfN5rjOkJCUC4VhYT7IlT4yptPtGF0zkg8aPWxFV/mOdwrzgGhlOVs/VunL1Tpo6yGg==
X-Received: by 2002:a17:907:3ccb:b0:c41:30be:4f82 with SMTP id
 a640c23a62f3a-c49bdf82147mr200595566b.39.1793202061724; Wed, 28 Oct 2026
 08:41:01 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027025616.1632690-1-kevinloughlin@google.com>
 <20261027025616.1632690-11-kevinloughlin@google.com> <2976bc2d-2642-4448-9c1f-ec13e67e45d5@kernel.org>
In-Reply-To: <2976bc2d-2642-4448-9c1f-ec13e67e45d5@kernel.org>
From: Kevin Loughlin <kevinloughlin@google.com>
Date: Wed, 28 Oct 2026 08:40:47 -0700
X-Gm-Features: AclHuK9oWsApJE-SwbWIqUTDRpRi_a-FG1r_BRCTB7JJ3QabTlKp_kjVIFg_bKo
Message-ID: <CAGdbjmLXhPkutP3yCNYghP_tkvHm2Sa+6aBHF1+9abaai-4bAw@mail.gmail.com>
Subject: Re: [PATCH 10/13] virtio_balloon: add higher-order page inflation
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowangio@gmail.com>, 
	=?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Kiryl Shutsemau <kas@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Ashish Kalra <ashish.kalra@amd.com>, Michael Roth <michael.roth@amd.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Brendan Jackman <brendan.jackman@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, 
	Alexander Duyck <alexanderduyck@fb.com>, virtualization@lists.linux.dev, 
	linux-coco@lists.linux.dev, linux-efi@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Sidharth Telang <sidtelang@google.com>, 
	Punit Salian <psalian@google.com>, Peter Gonda <pgonda@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Jacky Li <jackyli@google.com>, 
	Steve Rutherford <srutherford@google.com>, David Skidmore <davidskidmore@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 1:59=E2=80=AFAM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> On 10/27/26 03:56, Kevin Loughlin wrote:
> > In confidential computing guests requiring page state transitions,
> > unaccepted memory tracking operates at the EFI unaccepted memory unit
> > granularity (typically 2MB / order 9 on x86). Inflating the balloon
> > with 4KB pages would prevent unaccepting the backing 2MB unit.
> >
> > Inflate balloon pages at unaccepted_memory_order() when
> > virtballoon_cc_needs_state_transition() is true, while retaining
> > order-0 allocations for non-CoCo guests and CoCo guests that do not
> > use unaccepted memory transitions. When a higher-order balloon page
> > spans more 4KB balloon PFNs than VIRTIO_BALLOON_ARRAY_PFNS_MAX (256),
> > transmit its PFNs to the host in VIRTIO_BALLOON_ARRAY_PFNS_MAX chunks.
> >
> > Signed-off-by: Kevin Loughlin <kevinloughlin@google.com>
>
> Sorry, not happening. There is no migration support for these (large) thi=
ngs,
> and there likely won't be any time soon.
>
> NAK

Yeah, you're right. Another great reason to abandon the
inflate/deflate aspect of this series beyond what Michael pointed out.
I will follow up on the cover letter RE: how doing so might provide a
path forward for the CoCo free page reporting by simplifying things.
