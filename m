Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7687730E82B
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 09:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791105311; cv=pass; b=uc2QBUYHGPni54Gn9owDsdCBU7DP7R1w301EgkczMw4FKnWGIrFdWgoxYRcpbJha7kjB8xzMjFJtKxu7s0LubAzWW9NUTrsFn1PDzlkITlQJ2EwUBE95NbIh1dBsb+s985enRR5zUZyiMbeWMK1XxwF/LpZ9U6L3jEGlAMkHF9c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791105311; c=relaxed/simple;
	bh=t/n84oizsmqf30Qmzu71biJDzzYUFf3OYTLdCk6ENu4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aTt+fto9DO49Wl5mRSSjpR1q6O2BllT6OSAVBsZcvU09HQIyLrpK1ad/8hJXI1NgBYen6rBzMse36dBBpVC4VJcNRtnUMpQgRRpY71Mfi+Ht+7SL7i8Ae4d6AADB0asGWYjACgXps3h/KHgQNHahe2CD88W8a+ISYRx9mgGSf10=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XDFFpk3l; arc=pass smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XDFFpk3l"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cc4aa18f9afso276013a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 02:15:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791105310; cv=none;
        d=google.com; s=arc-20260327;
        b=VHFB44OYFqNLDO7fKY9EqG9zEeXbudX/pjMvm5Hq9rVWSU3Bz/5wI8kjMnaIg+K5Mf
         AM5ai0bOFlO0W/Kbrpishiajvp8T6GD7QO/Y6k35oYRPzmxVb+yYpO8dV2kq86OGJ7/t
         c8gMczU51b6uHo7hYe1T0GPDuYDtl45e4Riz7W9x/0TuYtji/R5O2MVOh+5Hh0i4uFsg
         qRMuG1qzL2d6m+QcPd1Kmvf4EF/9OIO5fKjSq2XRxEh92GJeYwbWgZvg4M6dFGljTbeF
         4Sh5AVtRqqzfMghXMr5p3spbuDcLSwz3/yUDBnxcscEQaA2lQhvLEkDjpNCQKRVZVsPw
         U2yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kaMhgqh0cNyzIJvdM7MdSJL/gkpQL52j+U/jEExbMjs=;
        fh=z+bgvIYS+KvKz5bDKfSSk69iIxbWu/4ntuQoH6SQ3bo=;
        b=pKfkiAq6W5kagVSX3tkeSPIkL4InmZqQF3uwKtbMGCYQ2F6aILCxH4n6V/HUEb6YRq
         DnQeHF+slAJBd4BEnF1vM17Vt65CiYXPRA2GBS4g6/Z+fbn14IwlanR7egTlapDUL2o6
         O/pF8B52LvNTHQuJqvXtWzW4E/Og33wYGH8pHZ+XlJHz1oN7dK92k5abLqbB1Az6GRcb
         vBKcPA59cZJnnchZSCrw0uLs8+uVz4w91AHv6pNP2B4HnLyLI2CbGQuuaMtEXY9BBYFH
         OdzzT15zyuC2M06Tppvr/41lB7inMMjSsEzNQhUZlgYypvZghA8QhBkXbj5p1ffWDPtw
         XHiw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791105310; x=1791710110; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kaMhgqh0cNyzIJvdM7MdSJL/gkpQL52j+U/jEExbMjs=;
        b=XDFFpk3lPoJkVJWIf1wXLbSoEYqk9fpO4H1N+Fudy5xgeOHUMsLPvSZ+L4U39y+wPY
         urxf6CuDd9dMS20bIG3ZwnPehHVUcNquv79hggpTBcmM5ZpwW+nCHAkaWy+4XGZoBHMO
         4R2GIXs7LWgUBgHf+ZVe8Nz1lrKgCm057DopRvVzaLb1JqqQPcNvW6EDP2VFesftZP5N
         TJNde97Fa6D5E9fb6e84rnZDF6gWEkdlpc/tgPAZVz5HLkYJot94YfakfvbfeJikINkI
         /4eXxy1/AoRtjM876zUIT8VS2y0zoGrF33XMVHpNxsSYeLhaABeZRJXwRnstDbVNzHM4
         GYhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791105310; x=1791710110;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kaMhgqh0cNyzIJvdM7MdSJL/gkpQL52j+U/jEExbMjs=;
        b=EYdHosCqZ75U+apr4F9PDpuzmruz0BtDaNJUypKGjfIUDKNBw9Ug2HXR4fs292mKtt
         vk+dFrJlQwXQVCFKHj8+j6jotHOb8QarzYH/DPtsJMF0No8Y1kVUjdrjQKryLcXxz0ja
         b8tYLkThgta0AcFF/C7Q0CHbS0MO4SKECv8d7JDacpLa+kWA5g2OuzrjMFugjxkBZdFY
         SlAzzJ0xQ7+9CUhN20C/gk+qlly5J0ugO53dw3A+4AaEOSaHkwH1hZaGAWe++3dbtn/v
         mtF0Th8DcTyTRN2AILqFq89SHKC2Q8aj5Np0Ei2QabGntgpom5b7UTneBprU+qSgu+Mr
         juXQ==
X-Forwarded-Encrypted: i=1; AKwUvByq3XIj15KSfQ2vftD4IQp3t7HhK5kWUN1YXMdIj+W8um5f5PMR8D36IApoukrWyipF1mC4d67QsOzYCpc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJgMhmHCVYvDaTB6TS85omFtYPKAgkZ4wzrO580ZufUJxGM1YWQ
	8ClRSjeu38N2QeSJKRAt8/oaXn1s+k9sEAYDtr0dGUQPBHHv5EKngDCpImxfKz1nBwUusGVCRAw
	ysgUryqmJX7/gJl3yPKwnlG6RD1yfBCO1CkMS
X-Gm-Gg: AYBFou0lkZbtaRtnw3t8cjxSI/ugrIy5v42b8+tcACgHHqcb0HsNBr1Bsuh6R0ztY6R
	91rBLwqvfUM77Apbk5MQaf8QabeQ2ZcKfSuFvh360PEHwnicgs3M02qk+CdOGKbZl8fhOk/RD2h
	VIvnJqVCNJkj0KQVC7+v/maEXD6BDogxw3vrAT2UfCHpDz9YqvEbrjCTHT+e1pAnozSzJH9s+Jd
	hLg0jE8KG0QM5nKk2T4lxRJS5LUqyHdbYImjSrxQKlYte6cE3fEBVWyFC7B0C0k3lOeyvsGj3mf
	RrDTCKk/EGyYJ6CHvzoAR5Hm6iZ7smfw8SBf3WKghF7xyWvJKtKH2g==
X-Received: by 2002:a17:90b:2548:b0:3a0:d651:3957 with SMTP id
 98e67ed59e1d1-3a7873ac66fmr3158501a91.35.1791105309539; Sun, 04 Oct 2026
 02:15:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261003212241.3432303-1-lrizzo@google.com> <20261003212241.3432303-2-lrizzo@google.com>
 <7ce092a4-5c85-4391-809a-3d04b638a722@infradead.org>
In-Reply-To: <7ce092a4-5c85-4391-809a-3d04b638a722@infradead.org>
From: Luigi Rizzo <rizzo.unipi@gmail.com>
Date: Sun, 4 Oct 2026 11:14:58 +0200
X-Gm-Features: AclHuK-h1jLN5HUM25V1KDJrvXlK_1XFkjlYVZ2OmcSjQmXYi39ZO7A1D8RAYWw
Message-ID: <CA+hQ2+ieCiXpnRzv7t003cHKG-YL+jSOSgVO_KavGEkbKfOeuw@mail.gmail.com>
Subject: Re: [RFC: DMA_PMD 01/22] iommu/dma: introduce CONFIG_DMA_PMD and
 metadata table
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Luigi Rizzo <lrizzo@google.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>, 
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

On Sat, Oct 3, 2026 at 11:44=E2=80=AFPM Randy Dunlap <rdunlap@infradead.org=
> wrote:
>
>
>
> On 10/3/26 2:22 PM, Luigi Rizzo wrote:
> > diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
> > index 6e07bd69467a3..1bb347fd9da4a 100644
> > --- a/drivers/iommu/Kconfig
> > +++ b/drivers/iommu/Kconfig
> > @@ -158,6 +158,38 @@ config IOMMU_DMA
> >       select NEED_SG_DMA_LENGTH
> >       select NEED_SG_DMA_FLAGS if SWIOTLB
> >
> > +# PMD_SIZE IOMMU backing for DMA-coherent devices
> > +config DMA_PMD
...
> > +       Costs 128KB of metadata per GB of DMA_PMD buffers, allocated on=
 demand.
>
> Paragraph 1 of the patch description says 64KB per 1GB, not 128KB.
> Or am I mixing things up?

256B per 2MB page, 128KB per 1GB is the correct version.
The number in the patch description is a leftover from an earlier
version, I will update.

cheers
luigi
