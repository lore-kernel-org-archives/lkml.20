Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792597842;
	b=I3VVU0V5TRi8aF4KGQWOZ3Kloe92X4y3Qu9/zTKb1j2pLIzFd5bLhKGu6Z6ezMYFiYXP
	 p2lpIYmG7+qbHPk7zrTgo9Oi9G3h4X0tQOHtVR3yHYyAsitJ8pVTe9u5DrsiIdjGWVMFu
	 90io7nGyy2EKwuSo/flK5Qp+95j4cjmI03TzbgyY3sT8lnqabbpj/3+6NucP6wBaahOPP
	 apuHLG4DiU1MAmBTlTmrjObzrOKo+3EgVFHgBSkc3yC8FHSvw6NN8BaDAlZ3YQFuJ9fOZ
	 xThtgunYYZ+yPj92KtlT7bsPG9BM6LCExDiY2ORWVI65yZ1t4KybqwiCOtT55ru6vCA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792597842;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=IaUjabYBPr4k3c9P8wC/7GmNjrvY1v03i+TToOuLuDI=;
	b=wxBZzN8sL/W3pZ7kioU9S8jPMGRSK0TWvF65zXGrQxa10VVtM5AlMplOyPjDUTJYUy8h
	 +ojeuFvx3y6EvQV0Tpk6YzP+PbjGlYAo82Rvax0EEgH8STqTWNuXXl9REcivwr1ty4rFy
	 kRkEFKtDFvLIhL8kGeXufcjiSUM8kcAzQFNM28CvkvmGS5j9TmgTSXCmmnAkq9GczFoGr
	 Kqfk/batXjQh6WA8kbxxIQ2t4L/IoYipTS5kjkThsRPWnjsPVqv7qIpzKOw/8ZEjOk3km
	 1BqgD3cc03epC1UqZhGIaSBclgNqV3heHBQdwVGUWK8ejW/gqb2NGcueAnxYGGROkOw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=ChFiZoAA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1E4606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 15:50:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D1E4606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=ChFiZoAA
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e8623790f8so76475ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:50:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792597841; cv=none;
        d=google.com; s=arc-20260327;
        b=C924eMEfvhKmm9qOPCVAJOia/YLmoMA3uIYD3RlXk9zc44jnfARSU+WC9xWqrRpGWC
         lM/ILGQ+FsBG/1Pc0bnUX11OoHiBa6N1urUOVhtKkL5qyH4KoxwuPPd3IBRxEgLN961o
         GE1eEuH+NWEbeKlV5Xj/xkQr/0/+Q1Xay8dpTbaniXX6GMslEETwfkM2thu9L/4vKcST
         SsvAbc7FA9N99HawCuIp4vYpLyT7c+giJ1pVZ3vH8AZGxFi3Pb/XC3RpuTusDMjcIaj2
         JBUDfQRbXCcJB2pXRTo7mtp9nbIOq430ijEW/KvNJL8zmOQ1CP4+agZpD+SJM206fJ6m
         b0mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IaUjabYBPr4k3c9P8wC/7GmNjrvY1v03i+TToOuLuDI=;
        fh=qNPhfjNzdD/DxKiGbsb24pisBvSrOa0Hcg5OIlv1g1A=;
        b=jOQ5DQPGQ8FMR/ez3IulCN1CskElKPWmVPxB4rEq5TPux/3cwCzoTuORGle/AQFjxM
         ykwaKUEN0RV3NVB6v5tiAQ4KU1ZD+rX53hgTHl9N7ClEotRIRgir3iw+a7JYiP6JcgVn
         +lcHhj1LQZlURBb7+r5PtdvHGS9PmWhKvYYfvcDjd81DjEAKLpgDtw/8uRlkFxjcmEMS
         zVMj8Oaiz0Y820yKa5l9yyJ5gIMGjW/rBKAf5UtPFdg7q3sZgksGYkcaAFaVyneYg0Cj
         9CDDprb6psEOJSTkNf8SPYBSD5UvPAS7zrCAa3S8mOsE6NvsxXLhLb4UWnjQDNVO2k1w
         HqgA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792597841; x=1793202641; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IaUjabYBPr4k3c9P8wC/7GmNjrvY1v03i+TToOuLuDI=;
        b=ChFiZoAA0ry5sqQt5y5BbsFcUMcVLcT3Yp1BSlmpkN7A8BJ+aZcEPDSQcKXhdbLgDR
         HusH+jsKBWyUVIhmvZLx23sqj7cx25BskULT9q4Ahw3Flwi6MqnnorJ/oxZTDlLTcB/X
         z3765lszDkqRQ5y4vGS+LC+NURkrNpxPNxYdIByRNCOWCj9j4LlsDK7r7NF8ezFWZkva
         63ya16Mt9ADI993SclirtHU6fZceD1i2Y9ekQIcOssqLf5FrLvX5jLV6fTnvNbMTP0HK
         UlWuqg2d20WBXFuMu6N9RAx6awkxvHbj/S1oLyVh77lTm1QeIX6Uzb8p2177ThjyoQZ2
         j2bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792597841; x=1793202641;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IaUjabYBPr4k3c9P8wC/7GmNjrvY1v03i+TToOuLuDI=;
        b=cXrT6YH/qfL6WtJ6becvWa8jW3vNPmuXwZNq3fIGd/NzxxUYTI82UX+KSVLMxRjWkj
         vKKRBoFh5nRkWyfqwD0wYBE/uZIHECub+YdwDNSHTGbK+TCEUAEP7gkb/K9VmfM38keT
         22Fbnm2reUSK1NCTzO2DCAWaUnZSFY0lkIARApZMC6ocNmwGDMgIvlYrMSZnO6AUUfi6
         jgbOe16H3yoOHRhO6S7sefezo21lDuYfD0ApLIvhUuhGdjUyEDeZVFjSZCmg+oXNfkus
         TW+wXEDvmqgUbNL8pkJFS5e6Uxr63a7ubnqL+KkZnr0OMOXejWdAjSbPS+Y7WEJo99GX
         VCcA==
X-Forwarded-Encrypted: i=1; AKwUvBzTZYwy26AA359MXZ5Tt7yY8pMl3pUc0YXfOSmQzLWIgk66WgBiLwQ/xWrSmbIgAwPVrl1duSAzXdGhrr8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLC7JlLnY2vdr+YA/9tSMrApjPuaZ1yVoDIoJiuX4hmySzklfni
	WOTPGy18VDHahO9YoMssbhpAO9wApcpvbJ/My8fNFVLbQJSFQxhV0PR4M1nJAhEu0qlJWCmoMA1
	f1dKjANtj5kkDlvDRp3tqHTsrSp68RTMZWdCGxiOG
X-Gm-Gg: AYBFou26SjTQ3m6jVaTJ3/ZzwyPQjaXhKfJ+z+DqC1cmHG7PNI02ZRVh+b2vVOujX2B
	Bei8GnvOKAT+ht9KcERlgGqGK7+DmoF5v6n4qlLehGOKMLHY0EkG7lqdGUS6AqF2N/fHDOZmap2
	OM8w14+H+n+rKslOVqkYpUr0kMV76JVKJCDlxb0ACTwnez/nL4eL8YJ0ad9p57NI3mFYfUdSzRj
	TxJsJcFpD61Q5I20xkT6qaaGgGspcmOXxgx+Kbq9iv9doZJJybUpaFlU6YSvwdixkK477vGefzF
	K7mVh/uEYDiKxPd9nka5KRPkQ4QoNu3UWHaeMk9EAPBqvFJ048GoEzwPsMFnE6ZV6aVYQAV1u7j
	r/UT7tvMS6lr/gO7k4MOuc6HPN2Nvjejhpkum+g==
X-Received: by 2002:a17:902:dacb:b0:2ca:4bb4:4bd with SMTP id
 d9443c01a7336-2ea1ad8e5b6mr11446815ad.5.1792597840207; Wed, 21 Oct 2026
 08:50:40 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019210604.2433620-1-lrizzo@google.com> <c599f939-0308-428f-aeaa-fc990446cea1@intel.com>
In-Reply-To: <c599f939-0308-428f-aeaa-fc990446cea1@intel.com>
From: Luigi Rizzo <lrizzo@google.com>
Date: Wed, 21 Oct 2026 17:50:04 +0200
X-Gm-Features: AclHuK9FmBdcnW_p7t6lt2QnH0JAdG8PU46GyBiVJSlHu7N5H8oC8Cumb4S0jYI
Message-ID: <CAMOZA0LrxfP3zDCutahGqRLuS7ueCppbCT7Oi-h9=xwAAit4sw@mail.gmail.com>
Subject: Re: [PATCH iwl-next v2 0/2] libeth, idpf: use GFP_KERNEL for the
 initial Rx ring fill
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org, 
	Tony Nguyen <anthony.l.nguyen@intel.com>, Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Luigi Rizzo <rizzo.unipi@gmail.com>, 
	Brian Vazquez <brianvv@google.com>, Joshua Hay <joshua.a.hay@intel.com>, 
	Larysa Zaremba <larysa.zaremba@intel.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 4:57=E2=80=AFPM Alexander Lobakin
<aleksander.lobakin@intel.com> wrote:
>
> From: Luigi Rizzo <lrizzo@google.com>
> Date: Mon, 19 Oct 2026 21:06:02 +0000
>
> > libeth_rx_alloc() always allocates with GFP_ATOMIC, including when a
> > driver fills its Rx rings at open or on queue reconfiguration. That
> > fill runs in process context, right after page_pool_create() and before
> > the queues' NAPI is enabled, so it may sleep, and GFP_ATOMIC is
> > needlessly restrictive there: it can neither reclaim nor compact, while
> > the initial fill can allocate tens of thousands of buffers across all
> > queues.
> >
> > Patch 1 adds libeth_rx_alloc_gfp() taking a gfp_t parameter and turns
> > libeth_rx_alloc() into its GFP_ATOMIC wrapper.
> > Patch 2 switches idpf's initial Rx ring fill (both splitq and singleq)
> > to GFP_KERNEL.
>
> This is done for simplicity and performance reasons (although I've just
> realized that this helper is fully inline, so it will inline your new
> GFP argument as well).
>
> But could anyone explain me why the initial fill is bad to do with
> GFP_ATOMIC?

It might not be so bad now, but consider something like DMA-PMD
https://lore.kernel.org/all/20261003212241.3432303-1-lrizzo@google.com/
that allocates buffers from larger chunks to reduce IOTLB pressure
and iommu-related costs.

An innocent request for one buffer could cause the pagepool provider
to request a higher order page, which in turn may require some
compaction work and sleeping.

Using GFP_ATOMIC could cause unnecessary allocation failures
if pages are not readily available (and in O(100K) allocations
something could easily go wrong).

FWIW other drivers are not very consistent in their use of flags for
initial allocations, but I think this is more to simplify code reuse
(as you pointed out) than for a real requirement.

cheers
luigi
