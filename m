Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 726CC566C65
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 18:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792002525; cv=pass; b=iJsqe9PKj+OHs7s8uz88QBT8GpGSxl/DjaAfJEooRXrYaanPkp0NgIAUeDa/BT45nJCmX8TO4tdXiQ33ksDzzBp9KM3lip/V/2JNils6X4ObllFFu2UYjY5YHEomnZSsqQ1fXGUO0HwK8da/Y+9crQTW5D5U5H379j2ivXHwyN8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792002525; c=relaxed/simple;
	bh=0+JRXvl/R9u5pNiuiBxqdsVIx1pGWTS2oCduhPjMn+0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E1v+B8hAXCkm2haqcv+23xPsH7FDYTjMaeE5GekSwQNTedDvAVvazzmCE7MJbxH9aeb/Ada5TAKMU/BW3N462AGFXMM/tfL43MdAh9FczpwlhnS/hC75VDZQFk4CP/tydRWgmjz1p31TL4aqmUP+miXht2ya36OQ/xCAADtqdfE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BGOzOT6p; arc=pass smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BGOzOT6p"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e8d6fcbba0so237215ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:28:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792002523; cv=none;
        d=google.com; s=arc-20260327;
        b=cKXhgs795p41IMTvgjXRLC649/P/psJLIc3GLjFSnA8AyeT+0pwpBDajoY+zd6xgDl
         v/wOHM63BgaKWs1ySMvi/mKKlYM4FvrOgqngmFE753rYL0/autEoN6GkGv6yUVDwcFJv
         2KNrU1CovVYIq6isvmlcMfD2W74XuHo0/daAI+7DvtW2fi0e6R7BFz0yuBD8qDM5O6b5
         eOthEB/p2Cp/Fijm/3HDduZ1AKr/NQEbtGH60adIsJpMYD9rXLZJD0QX22Z3of1pQ2Wa
         7KK3L1/BCWGB6cKW7nLV8AIGU2K6jpGf3YlTbZlmIOFsZPoxQelRNKDak3yc105aNao5
         ZJYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0+JRXvl/R9u5pNiuiBxqdsVIx1pGWTS2oCduhPjMn+0=;
        fh=v7Gy+vJOz4mfEz0WhWas+H0xn6muWyfiy0RO2qvSQAg=;
        b=kG8SdHQpBNkejbMG8rBW8SdWXc4HhJtmNMoDs9e5dPH6REF5aFEY/qXQv9rjZ7m+ki
         Ad3ahHVFPsjZYxVCKSddFvQd6OvkTwkLo0GC2edBAIfHikIntHdZVFVzIHJI/rnMFhoV
         Fetp2ddgaKGuLX7BsopisArR0pOzF4xr5xTIPci8HTGgkC+0XN2x63AqkzubxaV8ft2U
         cXjUwqSWo835uoxRH0ydDTFD97AEKLRoTkCg/ozwFJAIDQy5/dKKyDl1kCI8h3VBd0dy
         VE8DekQlXhMN1LF5i4qdKFnAwiL3FB20+sB9rDF46KbfhTFDFPjObWmmiz/TRLTfyFtq
         R48w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792002523; x=1792607323; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0+JRXvl/R9u5pNiuiBxqdsVIx1pGWTS2oCduhPjMn+0=;
        b=BGOzOT6pQv0mFri/8RH7QoElgFXhyBZG1RjsW5RNYxkdnYukiZrxD76D4K0ytM+r52
         YWjLYG+apmfLHG0e+NB8Bg1EBhaRj0TA1Gw8w/EtBKLwzAM/acQ2Ni9PHaL6bSsgUZNq
         9Jq5OxfuVQ+vtOumR1rHLjcnA6RE/utxHHLV8jMsDqeOSkTKB0FZ3ImfPmWxwgMmDRes
         dtimwJnMsjMisKDvBcSxx9qJ6EG1vKKThKHkQZBPxACg9Y8axR3Gx56HlJWPJpy8mTZk
         LazNQcFbkaSmmFxdnGtU82jIY6+d+efUIDiXskLm55S+u6cQfV2px5nEE3i66EVvITQ7
         0hWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792002523; x=1792607323;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0+JRXvl/R9u5pNiuiBxqdsVIx1pGWTS2oCduhPjMn+0=;
        b=ZhGIiicXra272V3lBJ9aXNrAbn+ZTm7Bjq7zulUW7z/xG8A5kF05E+86jn6MVAI4H7
         xZ/id5d9TEtOhJcI5ZiTJg0NOgR9i12rmbH1ym1jg185cuLw5HSikAqHHZI+gVLwcMCn
         0hyVVBM6wwCGMtQf1UU9r33RCtHZdVV/WvkOjL1McEqnmM0hic8n/UUTkqtD1bMtWlLt
         Lb49ucycmATElePjMyp+rP9pBdMHYpzy5RLLIRSgK4+/9DcF1LzsdWJvKB/gd7J8G26v
         if9XYhLzpsdEgfVvvpHX3mdOSxgJN5MXIxWfwocZhC5/ChoTHFuTuYeMJOLDU1MKrSM3
         K/wA==
X-Forwarded-Encrypted: i=1; AKwUvBwJQ4Dw2EytCV7HFiWxSXw5+LeBnMwhUiHguN7wkhnylKjXdiShwBl38Lw6OvZ9wfZNRXfld8xT5jB3DHk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKI0tCtBtySPGJnbIq3t/ypB9WKCFmhH4qmaw9wEWOaZaA4qrHc
	RxqkGCgcTHWvAsUJHa5u23Bgtx6lbA39DLuTND+s/C9Rvh8JYtFacSAZI6YPqh7lLWDBCXSSyll
	5Ly6EDgYNdOmNPkft4lgl1bucUcpr3Lm/kOO8u6p2
X-Gm-Gg: AYBFou23Jqb08AV5WpD6PyllymkqWLQ3ig1waEky9cHQdbX2xsrz0FA8w/YZBhd9WJc
	DMZVp3a7uunUE8Ir5k02Nc2NPJU6fFqq6DasBNrGr2A398eFRF0p/hh2qGVlTcUJRgObq67A9gT
	+wQXcnSPqdkNw4S9m64jQP0BbvI9t7nOVwr+H4GysdYL/GCInWXWOV1t0uOwrbnZK4hxE+08bQE
	ksKw/mkgfS8vnew3kKxuz8F+EwTRlv7vDUqCOXfGkvhkG6nkkyN3R5qWpuKxkHYO0UnuYE3Exwa
	9Yrt5xD5EO9PlO6/lMv8Ec3WLzy0dSnJcCWtCk3jO2KnjD//x7wOV21C
X-Received: by 2002:a17:902:e944:b0:2e5:4604:c37a with SMTP id
 d9443c01a7336-2e87e303708mr18554105ad.18.1792002521805; Wed, 14 Oct 2026
 11:28:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261003212241.3432303-1-lrizzo@google.com> <20261003212241.3432303-20-lrizzo@google.com>
 <52a702a4-14eb-4617-bd29-e3140fd36780@nvidia.com> <afff5a1f-000a-4216-b4df-dd3d0406047c@nvidia.com>
In-Reply-To: <afff5a1f-000a-4216-b4df-dd3d0406047c@nvidia.com>
From: Luigi Rizzo <lrizzo@google.com>
Date: Wed, 14 Oct 2026 20:28:05 +0200
X-Gm-Features: AclHuK-6TbXuD5dQp6Q_-RxWjRRPPqkpIpvGcrKlslQ4aEjsOkMcO7VIrHzh1iI
Message-ID: <CAMOZA0K4ZV53pE41AKoKz1g2wz3YENBz=HVoXng=RZbGyN3ssg@mail.gmail.com>
Subject: Re: [RFC: DMA_PMD 19/22] net/mlx5e: Use DMA_PMD memory for tx header
 bounce buffers
To: Dragos Tatulea <dtatulea@nvidia.com>
Cc: Luigi Rizzo <rizzo.unipi@gmail.com>, Joerg Roedel <joro@8bytes.org>, 
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Vlastimil Babka <vbabka@kernel.org>, David Hildenbrand <david@kernel.org>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
	Willem de Bruijn <willemb@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	Joshua Washington <joshwash@google.com>, Harshitha Ramamurthy <hramamurthy@google.com>, 
	Saeed Mahameed <saeedm@nvidia.com>, Tariq Toukan <tariqt@nvidia.com>, 
	Tony Nguyen <anthony.l.nguyen@intel.com>, Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, Michael Chan <michael.chan@broadcom.com>, 
	Pavan Chebbi <pavan.chebbi@broadcom.com>, iommu@lists.linux.dev, netdev@vger.kernel.org, 
	linux-mm@kvack.org, driver-core@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 7:51=E2=80=AFPM Dragos Tatulea <dtatulea@nvidia.com=
> wrote:
>

> > On 03.10.26 23:22, Luigi Rizzo wrote:

> > Why are only headers considered for bouncing? Because they have the
> > highest mapping overhead?
>
> I meant to say headers and small packets.

Headers have a high cost for the map/unmap (especially in strict iommu mode=
),
and also cause significant IOTLB thrashing, because they come from skb_head
that is not pre-mapped. The impact of IOTLB thrashing depends on
the hardware and load but they consume one IOTLB entry per packet with
almost non-existent recycling.

In the following version I have modified the slub and skb allocator to
feed skb head from DMA_PMD memory, which removes the need
for header bounce buffers. It is a compromise (the skb head includes
skb_shinfo, which we may not always want to expose to the device),
but gives an option to those who want it, and in that case drivers
that use pagepool can get all the benefits of DMA_PMD with zero
modifications.

> > Note that TSO/GSO packets will copy the header inline in the WQE
> > already. But not for small packets.

Yes additional bounce buffers are not needed on hardware that are
essentially using the WQE as a bounce buffer. I'll double check the patch
(mechanically generated).

Small packets should not be too problematic, as long as they come from
fragments allocated during the copy_from_user.

cheers
luigi
