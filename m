Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793662685;
	b=QlhwoUBqBhBDYNRoKIjjvvjKVcTtYRhCEmOjtl+d7xBiz12DDFUXAGN3swFfn9bztK7/
	 9wptJBJcHJ9uNA6/rBq4OOhm4xT0Z5iMTh0slizxYll1wveX3QIfBVGMkjVEvAhYAoXhk
	 Tg8eVPnQLa6kQ2dbhMx+yllY4WsxMOVqO23AaYuaPLp759PteeRQYz+2CJwf6yvfXYjCq
	 CHDWINyUk30roOhK2oSzqH2dhVWZNoJyniBRBCbKyrKwiepj06ItuKJTUaiokUfHlvDJ/
	 bEJIKcDppg2ocJbVEDtNHHUZw4lBWeH2Jp7ir1lHveoM4bja6BLUMY+tz/z8C1PmA2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793662685;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=ajTKbCVfUpvl1PRge5ZE4DWrvmI1TQg3QGvcmd035B4=;
	b=r1dbwPkZjwgt2x99Zt+ogiQeOPYQMwAbXliIPHeX6NNnruhKuhkJNqufECwLTrgrZPL7
	 pDzTuQCIdJbZo95D8++uQSs30O36is+/2V///HkGBrWgXX4TcxyOpd2sxFkjrCFAdi5GG
	 IaMR5c9JiT/fNmvzxi60wW6AJPXd4PGKKPZBCH0SIbqg897qq3RjA2XDd0RHCFMPnP3jI
	 xZCXEJIFwb7xPmkxU80Z9ehIZZgJgq0jLRIurz1G0U1naNBbYXvxWUzFOIvk21brvuK97
	 1hy3g7ieddCqVDmMlC5WxKtt+Aoss8INvPrEvels65XFYyfg2wDI6ivNNJePAQbb2vQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eZcRAdFi;
	arc=none smtp.remote-ip=74.125.229.137
Received: from mail-dl2-f9.google.com (mail-dl2-f9.google.com [74.125.229.137])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436CD606A32C
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 23:38:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 436CD606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eZcRAdFi
Received: by mail-dl2-f9.google.com with SMTP id a92af1059eb24-164f08a9e84so813796c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 15:38:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793662684; x=1794267484; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ajTKbCVfUpvl1PRge5ZE4DWrvmI1TQg3QGvcmd035B4=;
        b=eZcRAdFir/tOfKhPPQaXb6mUvOPizNEbwDyFtkl3vKeIKU9Co8R0LPR3N7E8YyU+0G
         2EdC+Hi7HYUfRQP/PCKsIm9h8tS8eEbpeWjCtKW5O49DuznCRmny/sHaglVMRcQjk1XW
         wZt8hlBXazvlT3+G+BQ3Bmz9IyCxfZiYOF/RVxubvZmHO0sNkpaX5eNVfAoQpCQUlI5l
         2QeIfN1za7Fyo1Y5LFedwCSm+BskmtaBZmZEv/AWmFxszO3hxsuhm+PC8SWdRra5+cJc
         WZBdVfPBmr8WSta2fMLe085t0LYYVIzsbbeoSfFqPtbxZ27fS5V/opLjzid1gkFKzQ8Y
         foCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793662684; x=1794267484;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ajTKbCVfUpvl1PRge5ZE4DWrvmI1TQg3QGvcmd035B4=;
        b=my3PBwmzcaSiDVTFpQjBsFEeZyLg7Nm22OYgLsI94ngIDUD/ZsNuDTTHTt3g5szfJR
         pZ7HFmJlomdS+MYCcZmtTwAAkm9T0Mdb3ElSokrE6XDx6IqTLCnnMkvscSM2Yr6tdaBe
         HCM7VaigmGBj1BSrkoOKFiYLKyDs0nNr6ro+9DB7KXl+jtxFDriYi964OhxK5FUx0mDu
         WTPFSEkRefGqL55fDVWKvI0xBTiNiAt9oLXNcLJep1XMkqJEBAR17gp4bMpz/qzHL59o
         YodqCG1VV4SDTNUvxrGUjsLZZzxRfDD26A98ZpwuWN4wf2mWJnnnM/BX7n4jbUczzdwi
         w/9w==
X-Forwarded-Encrypted: i=1; AKwUvByD0+0ELepQL92F2en7Uvp6/F9jgnIdFGV+hoRYJVNhqTQjqmbEnPSuLYMAk5I9/JIxSdm32THTZnWm/AE=@vger.kernel.org
X-Gm-Message-State: AFq9FYITXNdNo7ylz3dFgHcQ36fx2wP4NQq78RhmRMGq5tgqgl9JOjTn
	no4Rut554F70qXXeC8qvf7Ww6jpTXJTb+s4IaanEL+lPn6dDY+KlInNW
X-Gm-Gg: AYBFou2CoYist7lkpZMOyGBRx8H7Gfv50WdbZ2m9YYa1+sLCTOUb5pFUCqCvcRq59Ih
	PnF9r6bAtylMeEJGLPU5AAHj4Q4J/hgrcv8xu7yoZFR9drIB+0fkjPa7U23YR4B7+eg4QfYxvE8
	DmUByKRCGDQLldqWd0DGLo7ZgRl0QoZlq3UvyI4vzU2I/ME5GX0kXAmr0RAjjXJyy63Opwjruvc
	t95jfBXER43seBETNc4SVg4f5yBDfcJouY6YMN7jYN72n15qdH+MdmM1e/4HK1jenK5eINGdR8E
	2mTWgakcW8EPaKYO9t1+oWJhNnP2yVzWpcSoBx3zWGychpxmimQifJq4iC/xv0TNWLpOiv2MMdY
	fRXMpA2FeCNrk4/d6KgV9smTijwPWxd7NCfcj60RlLT/tYTA2qjAEWQ6j1tTXLgTeaOqCGROJ9a
	rsZ2LcJ9QLP3mWRpxetaNWsnkW42aLIT2GsveK/BZnk8cfBm2tGvJWxwHxMaC47gHyHotECOdYd
	D8UGHZUbmZVKlvq7kpYFmmamW336ED+ip+e5qcito653w7cmxq/7ghJTwBeVF20r6KwY0aVziMZ
	oCFZN+juF7AhRX7YE/XuzQ==
X-Received: by 2002:a05:7022:68a4:b0:147:8a40:cdf3 with SMTP id a92af1059eb24-1ac5d1d155amr22814754c88.24.1793662684121;
        Mon, 02 Nov 2026 15:38:04 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:60::])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1a136537sm36897502c88.18.2026.11.02.15.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 15:38:03 -0800 (PST)
Date: Mon, 2 Nov 2026 15:23:26 -0800
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Mina Almasry <almasrymina@google.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, andrew+netdev@lunn.ch, edumazet@kernel.org, 
	horms@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	michael.chan@broadcom.com, pavan.chebbi@broadcom.com, sdf@fomichev.me, 
	bobbyeshleman@meta.com, asml.silence@gmail.com, daniel@iogearbox.net, 
	razor@blackwall.org, leitao@debian.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next 2/7] net: devmem: charge the frag length to TX
 skb truesize
Message-ID: <aukaiHZJcYsRCpr0@devvm16445.scu0.facebook.com>
References: <20261102191438.1059771-1-sdf@fomichev.me>
 <20261102191438.1059771-3-sdf@fomichev.me>
 <CAHS8izPefhGytGNeDWZzgZOi=gLeigZ63nFnkq1ERXXGwrNkeg@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHS8izPefhGytGNeDWZzgZOi=gLeigZ63nFnkq1ERXXGwrNkeg@mail.gmail.com>

On 11/02, Mina Almasry wrote:
> On Mon, Nov 2, 2026 at 11:14 AM Stanislav Fomichev <sdf.kernel@gmail.com> wrote:
> >
> > truesize isn't well defined for devmem TX frags: they point into a
> > dmabuf which stays mapped for the lifetime of the binding, and freeing
> > the skb releases no memory. The charge only feeds sk_sndbuf and TSQ,
> > which limit queued bytes.
> >
> > Charge the frag length instead of PAGE_SIZE:
> > - TCP uncharges in bytes (tcp_trim_head(), tcp_fragment(),
> >   tso_fragment()), so the charge must not be smaller than the frag.
> >   PAGE_SIZE only guarantees that while net_iovs are PAGE_SIZE.
> > - Frags shorter than a page now count their length, not a page.
> >
> 
> I don't know about this patch. The justification reads a bit like.
> "net-iov charging is weird and broken anyway, so we can do whatever we
> want. Charge size instead of PAGE_SIZE for no reason."
> 
> I agree that charging for net-iov is extremely weird. Neither of
> today's net-iov types actually allocates any memory. Of course when I
> was developing the original infra, I took every shortcut I could and
> just charged net-iov as regular memory, but that doesn't mean we can
> do whatever we want.
> 
> I think either:
> 
> 1. say net-iovs are not really occupied memory, so do a global cleanup
> that charges 0 for all net-iovs (optionally making it conditional on
> the net-iov type, so in the future someone can easily add a net-iov
> that actually can be charged)", or
> 2. change the net-iov size to be actually size instead of PAGE_SIZE,
> and keep the current 'we charge net-iovs even though they're not
> really memory', and then this patch makes sense.

SG, let me try to explain it better in the commit msg. I don't think
we can charge 0 because the uncharge path is non-zero. It currently
works ok because skb frag uncharges the small error that can accumulate.
