Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.152
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793398313;
	b=EFWU9DylPFCUDitV99Rlp0tMl6tvN8bM9c2vMA9xeeYRlT12YVeAVKTq2HvS2xOewl14
	 2AhrfOqH41/izBkcA5X1fIb3ycbuEQw1aeTRwmQ1HqaIdiFrgVaewEtGWkjuHM6xR5PBb
	 UxRyU05kR/Eh5kspOMDdVvkyvYMfX0UTyDJasr3DDhiGFzP1Knv9wabEVaN1uU9H0w3kG
	 AMqhvJkylu2E42AY50lUqDtNUPb7sOKdxm80E6sML4wxtIWEcMxgdTQPOCufR4tK9GsJv
	 Fu7eY3aaoR3FTyBTMfLgViyVyB+opN9zQ2GVMsY7c/nfVxZydeKMrqkm2QyXAvA7Fcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793398313;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 X-Mailer:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=tXgoYkViE4VytOJ1ykGKyHw4fz06RphPl2r/Hv88TT0=;
	b=IuwMUvttPqulG/TnOtwvegb5Hpm+/gFFqaXV3vwOPA0UR6DMXLuD0Bv+U+CJxsq27NV5
	 y12ixWYBUvcg0c1Uq6iQnOitX1hm80MqjtlPvPRZnGX9Rc6lSpH08BLhZtv2EAuOY+HFT
	 ImDACG5K5ChCSMqC6BqIibnYdbUHgtU0Qzemt5hpVrd0tMkDfcbjmSpbWDX2alNQlaOwp
	 +eG/owjbQWbrWIlTcJkZPLM47igh2uYmlZjBtu6RuOsywyUd7UTKeT/jCSq0501IjlwXR
	 CLqAmi9xfDQwlCMd31KmYOfGcH/AUHicl3epDeC8iByQ7saeKG1V+g4OPjSbMZm2uLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=shazbot.org;
	spf=pass smtp.mailfrom=shazbot.org;
	dkim=temperror header.d=shazbot.org header.i=@shazbot.org header.a=rsa-sha256 header.s=fm2 header.b=dqxmOs2m;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=wMGWV101;
	arc=none smtp.remote-ip=202.12.124.152
Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47F3606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 22:11:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B47F3606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=shazbot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shazbot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=shazbot.org header.i=@shazbot.org header.a=rsa-sha256 header.s=fm2 header.b=dqxmOs2m;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=wMGWV101
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 15B5B7A00B3
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 18:11:51 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Fri, 30 Oct 2026 18:11:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shazbot.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1793398310;
	 x=1793484710; bh=tXgoYkViE4VytOJ1ykGKyHw4fz06RphPl2r/Hv88TT0=; b=
	dqxmOs2m/gIsgdLpZeuW2qJjO3FH01shgdc4UET5J24XscReJ9eYGVqqypQjWFNn
	8j3fRQPq/gnOgSBpz+/mxzwDEBamYEfNVyJ8eXgliLojv9eW9k0KF0DeP7ykCI+Q
	RXD+E+yBMaFZ/S4PeG+M5PldC+qMgH5UvOaX4qxyLY5QRmIC+7FJRjFAwX0Kzd0D
	RdrzCszF+Yo9I8z15XZd6hqpmXOG2JOoR//iCilRpdiMY8+10adQiW/qvTDhT+7y
	kAL0nPXWb0JF4vfzYBpiU9viFYdIPb4sg7/1fIl7R2W0UOJenAz5hnKVOwiL8WQT
	kRgcz8ymthRkD6ELglGzDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1793398310; x=
	1793484710; bh=tXgoYkViE4VytOJ1ykGKyHw4fz06RphPl2r/Hv88TT0=; b=w
	MGWV101N3ZFQcJc0tybcBExNav0t4QKjza4NSNxq3LKGBvakvkiaTw1tKOJnFcVO
	QYEfhn7Eljpm+rNV5B3gcaXrDv6Xf6Hlvq17j3Uia5l6DjnTnH32uXfjJvtLPgDk
	EjgpXF8M7/Z6P8ok49NEFbzu5V3g4SQGg+vrWRTB6amRN3H3uVhQtvq/945K1Ubm
	FD5Hg26Gpn1LGE+ihWekei3C5mzXdVCKaGqim/Fg+KchNHtaKFfvVUsKw6PPesJ3
	wXsqGmUxQTx10mxLE+dLWrfLJOM287b51XfOpsn0H08JWv0cr6plXI6nDpLFWNwX
	vZ9HHAi9Pv9WnPjKERH8w==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=shazbot.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793398310; d=shazbot.org;
	mf=PGFsZXhAc2hhemJvdC5vcmc+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:smVfiTsmn20ArI8rA3HdBY5Ju1o8u8Fpq6NGKcJOCbb+Kgh
	e+K9mxOD+dWYwcH3ySQeypNKVdPUb/fMf5U0l5ezM3K+BQI2K+iGx5CI6bchv8ry
	DQcL03iNhSHSJAcNHhqYweYetCT2oP6EhyJhX6tilEo9GLP+zPprc8BQlBBaCeFp
	40tycOExQRHQo5mhxsuJcarLyAq56RmF7ne9RM8ooo9C+BQUJsJUJhIdh/6B2rUf
	IV0LR23gYT0oyDsfhmlgIUAjI3kizvgsjm28ZEb0eaXOWVtzOlnl5z/Yz/kGvhSk
	1PCjjayxu77jYY73pCsAEAjgj7wWX6FJvUe6baQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:DgONvUTqafwhFIT3rT2ESTq3IcnXo1zf9eaYjcsaRDk=:Hp9vWDhBbMPLQFsuKFLEWhVvzXDEk59UA7t90Y/8GlU=;
X-ME-Sender: <xms:JhblalmivAPSb4VSZp_FGf5s7DSQdj0EXbVXi4x13Q5jYRUq_62mZg>
    <xme:JhblaoeO8OAGZq9MrRyj3DHD65LjOh18O0MI_NYBeh_TaS1PQqMU0VoRL0Gu17cnF
    KoD9jNWgO71rzbA_sCWl9w1m6X0eD7OpfuUeqRfLy9-RNrUZBs49w>
X-ME-Received: <xmr:Jhblar0At3K0Yd2R2Bgv1xGNHxy2FKv4kVe00h7fwHGnCmGzVwoBSiwSgEykVQ>
X-ME-Proxy-Cause: dmFkZTE3mZ31q0YJ9Rj5hsq8CqCKrHZxkXIFtkac8HVfouhs9eU1VFOH5z4VWiokpy2GrI
    mQn6kARDNxGG60jxL7dQHgnTMiUBwot3w2q25UK9Q2BmLGhMcfCprPz64dECn9TAndlKKQ
    I0kuzq+Q556FpBOmZ+tyRtTSvG5wMxG//c4YFti13boC+TiQ/ku8PbpqCxoA4KHraFzaBg
    J9CQGU9woMSm/bIQfk/y/0tuUh2jma7pJmLFpyA2eiAe97sKoJRCNS6AzZNp9O0DkDY6Hd
    dNTL7JIMIYB9r1BWJ5qxXs62SiRKVL5Z8wZbIlDlsrczQWNjCiWKGh8zdzP/cD/E3kE5ee
    qI1y/N77zBjrzKjpvbV9A/NC+o6tmUfFtnpYri52y9XYgta1E3uWWDmUeP4b7blKVYCcix
    CXi6E70MDLGt8E5KeWf6Gwuj05DHHdX9MhU3F9XUIeOMfo5rfQpjwgJrIvZeyzoIr7jqI3
    +59mwXmP0fwGuybfU5tS+t0N+qlzzscBDSkSsVCPtbAGhEygVw3VrWCi1ELo2sk4dsTGp6
    YGgsKtw+I1yw6WnG16mcDLst6BFhVpmTYgXYzRtvKfZvGrtieXkS7yYxVVVsWmmRY8L+D4
    0K5Sp5ADTemBD5WvJKn+E+KZlUVW4iz7UEbNhmI2iczjzdiQmc73PQO/4pww
X-ME-Proxy: <xmx:JhblatkDkz1BzVa1vxn6rupzJSdvrmY2lEAAUJ6JX10Sogl_D3j3UQ>
    <xmx:JhblakZAK83c23EXfu_gvOeDSvwaUPS6j5AWtnsF0FcqoQ52zahNnQ>
    <xmx:Jhblajreq_kClNcHAj69Gcn1xKXkLsZy8Cg-Z7kT09VgGmMHybrp6Q>
    <xmx:JhblaiiunuM1x_4dfyl74FoQA35EQWBphtVC33Hx4QubnuK82Nry5w>
    <xmx:JhblajYKi8E2SQwF5S7Y3uHiSKU8tQkLlJ17UUyq-pcuNcSDqv1Vkllk>
Feedback-ID: i03f14258:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 30 Oct 2026 18:11:49 -0400 (EDT)
Date: Fri, 30 Oct 2026 16:11:46 -0600
From: Alex Williamson <alex@shazbot.org>
To: Omar Elghoul <oelghoul@linux.ibm.com>
Cc: linux-s390@vger.kernel.org, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org, hca@linux.ibm.com, gor@linux.ibm.com,
 agordeev@linux.ibm.com, borntraeger@linux.ibm.com, svens@linux.ibm.com,
 schnelle@linux.ibm.com, mjrosato@linux.ibm.com, alifm@linux.ibm.com,
 farman@linux.ibm.com, gbayer@linux.ibm.com, pasic@linux.ibm.com,
 frankja@linux.ibm.com, imbrenda@linux.ibm.com, alex@shazbot.org
Subject: Re: [PATCH v11 5/5] vfio-pci/zdev: Add VFIO FMB device features
Message-ID: <20261030161146.5af10847@shazbot.org>
In-Reply-To: <20261028154352.15108-6-oelghoul@linux.ibm.com>
References: <20261028154352.15108-1-oelghoul@linux.ibm.com>
	<20261028154352.15108-6-oelghoul@linux.ibm.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 28 Oct 2026 11:43:52 -0400
Omar Elghoul <oelghoul@linux.ibm.com> wrote:

> Introduce new VFIO features for zPCI devices to provide FMB passthrough to
> userspace.
> 
> Allow the user to enable or disable the FMB using the SET-only feature
> VFIO_DEVICE_FEATURE_ZPCI_FMB_ENABLE. Likewise allow the user to read the
> latest FMB using the GET-only feature VFIO_DEVICE_FEATURE_ZPCI_FMB_READ
> in the case when the FMB is enabled.
> 
> Signed-off-by: Omar Elghoul <oelghoul@linux.ibm.com>
> ---
>  drivers/vfio/pci/vfio_pci_core.c |  4 ++
>  drivers/vfio/pci/vfio_pci_priv.h | 18 +++++++++
>  drivers/vfio/pci/vfio_pci_zdev.c | 64 ++++++++++++++++++++++++++++++++
>  include/uapi/linux/vfio.h        | 30 +++++++++++++++
>  4 files changed, 116 insertions(+)

I think the only thing we never closed on from the vfio side is the
merge plan.  If this goes in via s390 I'd want a topic branch against
rc1 since there are a couple series floating around contesting for the
same feature numbers.  Thanks,

Alex
