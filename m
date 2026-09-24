Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A50B341F7DE
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 19:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790278021; cv=pass; b=cxnnThqwRHdcG0nb4T0bmFI0KlBxUZZgIivEq/+mUcwHC89W/L8OCVBES2a4kzpvfUIamFogfzSmoagw6Er3oQMG89esOcvG7JbXlz8gfcTxBEUyIZQJUHvMMIrI/yEy51yuc0GzCl51CwARHzveZ/tsN7SbtLg4UkRJSoVs4Po=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790278021; c=relaxed/simple;
	bh=yYxa5cHYFz+o6mtZX1mc8GmR4S70HG0QuP15znE6Z74=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qYmEZVric7zULJZ5ZK1fIFfJey7Nm3Xl0wmOTloUkI10EXOrsSxDkvWp1/lJOVCA3EQT3MQyYP3q9tOFV1MSWbSCxzkJsXSXGJwClBDm4DIdOBsoWlKAb+dhZ8r+vp3hiekZJvDKa91LhZzgu9w4iRlZQ428QFrtWTD5mdu66og=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PMLUZbty; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PMLUZbty"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6aae147ef9dso2646a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:26:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790278012; cv=none;
        d=google.com; s=arc-20260327;
        b=hulDz36nZXpbNnK80UA6VDpMah3U1LM7iJ0o5QD8hpQIC8aIbZv/yjJo9JP1iVn9w6
         IPtcYpsYVPBEmWq5geK301yV+qKWRy0z8zjfbtxhRu5BVn1AYWM+zNmZlejbCCNBbS33
         FOvg60ZHsZOWsJN869vIgms1opUS3uASxeAuASW5gQxE4pQ9Jx7M7rtARXlf8oT1Wcvy
         4PlpkQhIh+36xypzEh6AR8ugXICJCwQlfgzPivGWiHjRrQZcDdNfCcPglYpF7fn39cmL
         G38BAQJrJg4C0FbZbIhKvI0QYq+ssPb0YAHAea+bZs8IOkXKAvFfVvbSK7GdqKQzy5kj
         4BLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yYxa5cHYFz+o6mtZX1mc8GmR4S70HG0QuP15znE6Z74=;
        fh=AgJr7wnwJ8/v9gtEaWKtfjx+yzLS6q8sSVcQ9kxlwYs=;
        b=IkVgfy6vn3omchlHeWt5mk/WIpbd6ldst/nkom+P5f03zU1GGfAp5j47KQR5wzT9VI
         Lj8JEb2fSRsig8/Ji7BgS42hKWgB3VF1A6ewkLzOR15+gvBgOD4AiWYCHoXiSi0Okm9p
         j7cQ+rrhd/1VylH6lO54ckp57J3GPIxKlvLe8zsqklnv2rjeKjyp4jI808yrsBdxnea6
         gVFfcur+Z9bnkJoh3zaNoj/A0nl0MOXbP0OFdSpWGtnRMzh/CQjhhRQGYpTCGp4c74R0
         ZLVA/pnJb6z0JL7exxlLPX0r1cQSqcTrgWv6LtR/3nzLaxluwyvmGWwTWbwjG85Vlc81
         qTdA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790278012; x=1790882812; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yYxa5cHYFz+o6mtZX1mc8GmR4S70HG0QuP15znE6Z74=;
        b=PMLUZbtyMNWUwugoImgCOMKYy5drlDBLGOaShjfC/ebqZbWFtlVhF2WNYIxkuhyRHj
         b7+7qaK/fsYJplVuBlHNsJPlmCidJNrvRr9FGQn8K/qeK2n7syyBT/bL5dNvDmUTZ0YR
         YdU3JkQNWjg6grRbdgJowTfaKOL5lG/2TK0pOtJkWGV3ACSuEwAIIVYxX8PREVJzSIQJ
         TYa4OlNAyW22ep5AfpuNx69ddQAd79jJZ1QvezgJ4+X6/z9gkIhzfkYk8DAZqp0wkXES
         qBt6JEIb6kuK9BaOqt1fZOYXK+FW45QnYjPpKMKi/YbtdLismBZgwtkhYl+wNv2/aRY2
         ZPIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790278012; x=1790882812;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yYxa5cHYFz+o6mtZX1mc8GmR4S70HG0QuP15znE6Z74=;
        b=x9plHG4zC6+HqbspO9hJNWMA2CtNAWH0muxVsoDXBk6UO/WKmQzkSwIESTv18j50R0
         k+rC9iBERAhTMoNWNIfPjZ13MWWGesYW2jYKbA5KG+bTPDi/NePbOVCv/PIrbnWPtBrv
         mLEgERef3gg/cz2OXac/Mc3X3ODHyiqbQ+2OOUVnQiaj8WRMklVUkFM1mvLdpy0KeLN6
         jgT61QOnWg3aMnqPvDvnuI7OjYfg1xqXKKX9wBp61jHv3IexczCLG2pOekd8FLewz6Gq
         amrpoozNu3HCSJEbI9lPrmPU28H/6/xzffSmbasSIK9l5A7Z4Y2T22Aup4+ASAW8jKMT
         oeEA==
X-Forwarded-Encrypted: i=1; AKwUvBwMKTAXKAUy5+3G/81d7xCXa156D2KVHQ5YJCBJdFuUvk3S86liac1muc0Qygt1dlHVzoAocw+BKWWn2H4=@vger.kernel.org
X-Gm-Message-State: AFuF++lhp7nta2l0BDh10ZxNuKsfNZLNTFkCAMGS/csCkfqT+eDQb5wl
	9xfXVVDjyIOs911qgUs+DhjGm/4IwiAL/HyCyZ+BPVPNUrGu8hxyeehutpUoUdiJL+FhFBiNlp0
	Fed7VdiW3OB/OoI5gxSZgsJF8L6RGE/o7yGXSOQ3R
X-Gm-Gg: AYBFou0xgbBQEhOjdH90P1631LALIn5XwtGeqSllDPP+Imrg7+OwOFZ98j2+ThF5JBE
	uDCQNUxk7+E4PT8+bkRcU7jAunNfLvjp5S4K8I7JAgOMMfjvCpfYPM1z6Bsx+RnQDQ3bKabJmXy
	yCLsTFqlZ8NCbTeNAXjLaWw0Anrpv9W8ClHY6vfo7xEOTwNPueqxAcN9dhXP/esm+VtWweNRvpj
	H7TeEF9Wtu4AID58yiFbpP1cQ0A4fi35JIcZzzst1mnJ3klyZ5ITlmKfd8vX/pINayAFdoCelMH
	Y3qBiIieW+9qotJW2jk4hW7FoFlX/aNcnRPTP9dkGV+EeSaPQd6mIRiy5UoUwPmUvq/78WCoH6l
	7LE3GRJ8vAfA=
X-Received: by 2002:a05:6402:32a:b0:6a6:7385:3eac with SMTP id
 4fb4d7f45d1cf-6aae505dec3mr6769a12.11.1790278011541; Thu, 24 Sep 2026
 12:26:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922204348.717198-1-sdf@fomichev.me> <20260922204348.717198-4-sdf@fomichev.me>
In-Reply-To: <20260922204348.717198-4-sdf@fomichev.me>
From: Mina Almasry <almasrymina@google.com>
Date: Thu, 24 Sep 2026 12:26:40 -0700
X-Gm-Features: AclHuK8Infx3n3fxQpi6yWw-iI-ks1OfMwPCy13lk8MO82P-g6diXI4rh_Dls7s
Message-ID: <CAHS8izPTz6g8MR6_1v3cu7OEwZhokS7oz6qbi7tU_ZG=yeGz5Q@mail.gmail.com>
Subject: Re: [PATCH net-next 3/3] net: devmem: decode DMA addresses for TX
To: Stanislav Fomichev <sdf.kernel@gmail.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, hawk@kernel.org, 
	ilias.apalodimas@linaro.org, asml.silence@gmail.com, axboe@kernel.dk, 
	sdf@fomichev.me, bobbyeshleman@meta.com, kaiyuanz@google.com, 
	linux-kernel@vger.kernel.org, io-uring@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 1:43=E2=80=AFPM Stanislav Fomichev <sdf.kernel@gmai=
l.com> wrote:
>
> On 32-bit architectures where dma_addr_t is wider than unsigned long,
> page_pool_set_dma_addr_netmem() stores page-aligned DMA addresses shifted
> by PAGE_SHIFT. The net_iov branch of __skb_frag_dma_map() adds byte offse=
ts
> to the encoded value, so the NIC is programmed with an invalid DMA addres=
s.
> This can trigger an IOMMU fault or DMA from unintended memory.
>
> Consolidate DMA address encoding, decoding, and representability checks i=
n
> netmem helpers. Use the common decoder from the page pool and net_iov TX
> paths so both interpret stored addresses consistently.
>
> Fixes: bd61848900bf ("net: devmem: Implement TX path")
> Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>

Reviewed-by: Mina Almasry <almasrymina@google.com>

--=20
Thanks,
Mina
