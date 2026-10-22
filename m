Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792664397;
	b=O1DKCwfCEwZeAKlWOR7BerFkcabBJ241YKRvsAE33yUjd00o9RDqJn0UdGFnceT+6uCd
	 LJMAt3tftrnTohTJjV80DjvQcqEkNkaf6qA9LSHl9qOkdY1RBOLHjcZ4PbwukHu13ORHN
	 2Buq0O7Iom3HgxI60YKqkldniAeEYZjkzsgn2fcaL9vN3W/zNcUe+LDR47btHA/66EH51
	 gqDmJVn9iy6dtOUB/jtiWKWx0uR/BjAF4UjwUj/EqywxGM4wc2xacawzpqmsTJHuXAvAF
	 W/h3xZ2EV3WePYJ1ztZpak056S4HwvDfHdArjJk9FamSyesg0r8MjYL6fFG6TDLMZDw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792664397;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=8RseLjNm8lG/7UmlycVln9er/NWi2dNp7MDnl6ITlr8=;
	b=Eh5CBgq4ysAw6THgTf3MGM8oHeQIMcDQB06M+dCUByu4Cj6wu/zvR0PWxK2HldyuYBx4
	 EQivFElSg1BrwJllb9KJ5U82XgYzTn5+SlOYS917Xm4x9SCT4/urjYFos4NbUKOJNWg1x
	 vRRiUdIvoSy+Cm1Y7X6wPpRTaTDTg3HIygWDC/PvFOHqCl+yRZDSPURwJC3klIHAqd8su
	 Tsj0rrbvj99nIPJ4ozd2+AQTTCDlEBIBbCM/isa6OuwRtiQUw8JXwSXhd+oO8Z3jbejtl
	 ZgP9pV1rZu/ZjWYQQOmzfyDvZn2LqhkXAf2+DLTejsiqpzHiSqzrlok8jKSMGEwgouQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aUJzr1v9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.180
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D20C606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:19:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D20C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aUJzr1v9
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-93f3c895a0eso149054985a.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 03:19:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792664396; cv=none;
        d=google.com; s=arc-20260327;
        b=UlXxQeR/BlaFem8PhKYugPOcPcqZEtmseUJZDKv4yY675LCfdnaulbC0584MWpPyzQ
         duVnT4QC+xMsIiwRe8VQxiDrexQkqx/Js0vX2E9rc6d6pSF8DQ8cGn5YPAx0o8KOoF9b
         RYv2lkpqpTiPgKWJ906RiGXKRnvdhl37zJUu/CsimS8BoI7nE+lx561BCdhAbCgmLTVm
         vzLIzBTsAH5IoZBbCukjIKsXEHvjztBQm4953VJ+7r7d3aWChzQ4SaE0D2HRLEN+VWqx
         0+KZcJ7vcEF5AuPXOM8jR/unWHEiYcdiR753ZoGJKQ/dSWzSUaX6h4t2PHqJNajJKZth
         z9DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=8RseLjNm8lG/7UmlycVln9er/NWi2dNp7MDnl6ITlr8=;
        fh=PMo8TOz+LnJBCxJ18doH/BhfYRAUL3Gbb5LyIkeFrSw=;
        b=TkWYr+NtKuQnnw2UQnWRet+NSWQuyhoenAQtBjqVyEjiQECIadt99awuQtn2+57ug4
         p08KEM02gy0Z5FgpM9K7Aw+VPKl8HVOMsxwadMPDU9ghY2BMp1cHfwTGlKRuq+esORLl
         a4bO6NEEpK//BeF0OjEiJnZbaiVud7TsVULiwQb6x+zeNpdw1KTYj8UgSaFpaH23pZCR
         D0b/oxQG6z6LJuVoLuKG45Ve/plpxeEoTnBhQ5OYbMUL1l99kKzcBAltNETwFJ5eqT2H
         c7NK9QoMngOKNp92+k68qkB7j74EKIKDlUTbplXcT1oTCryWxbHd63UGg+bCjICC0UWf
         nVzw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792664396; x=1793269196; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8RseLjNm8lG/7UmlycVln9er/NWi2dNp7MDnl6ITlr8=;
        b=aUJzr1v9HCvAKgJ2UTSl8mUeU+wQVplCGtZ0YUMOEGg5oZysXD+REwtONRHf2+MJaZ
         TwbRR8NGkA5aslgmvc+A3rI2NLGykz2FM0Y235FgmMy2pN6yoonoSjsMkmV2qHLsrzrS
         ArykiZlvdF6zdtSVaQuQdjwN0UYexGcAi4UAXOwm2Rq7EYHU6ABZDFMkZb+dXNcPUJbj
         I1ZRscTqYWKBiZM5BvMddh0R4SUTA/SazjdbXcWkdOpBVSA+escj8OFMeCdv2lKxXlsB
         kAhaw/CBDr14ZkanQZgTp0YPRdGdSF7aqYsnAceXTbiW8azyhku13EGgH6W3WZJP3d3e
         dBTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792664396; x=1793269196;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8RseLjNm8lG/7UmlycVln9er/NWi2dNp7MDnl6ITlr8=;
        b=ghSycbwNJ6L4yiTGzzzBa/AYuelWBra9XTwFVgaA6nKT5jlPM5PdPcdTxQ1EZQD/x2
         mjENwPU73T2I5I2TEkJVGyHYz6yCiSpZpuk3Oon/5kGL1JkqsuxSRzPF79a3AYRHY9ru
         X8ygIS7vY+kbApSqX9PkhxUXWzGdvkC9QKj6AwA52nBuzbUV2HA74fbSWsE4JabtRI9Y
         gAmN/xhQoy3mU71iElEVowLQiM2LQgvizauE/pG5Ory53ayp5zB/P/mtCHYz4d1mJxlv
         dlKJRinXs/NlElIysSihsCODSZlgQZ1+v1j8OXacp1JObpnYRaM8IBSF+OCD1DZ0xSxu
         3qSA==
X-Forwarded-Encrypted: i=1; AKwUvBzrpqjmr210SmNGLJuMphVpr7oPP0pqShj9mbgMKrZz5pTeV5DTQpwrB2IR3G6P0btSrUvMTNms66bWDX4=@vger.kernel.org
X-Gm-Message-State: AFq9FYI1VgBHGM/jSwPR0ZjRWPw5m1Gs9E/4+3M8OSrKRKfvZdPMIQTI
	uvidBduu7VtJY7JLMAof4AfEl5wiewiXpc/u7ridKFZ2qci5icDuaJqPJhlZjnH6w0cCY2K8WNo
	ABJXYXV8zP4/DcsyHTgaE9f2pVxedinrPr44FnOhc0Q==
X-Gm-Gg: AYBFou0zaVwxiuY6q2XSf4a61Y8VFXXt4t4yIax8JJTr8zeV99CLME1+b4zOoouK/BT
	uQIMGozI2zn/FuQjBF8X1QYjDWwSo1LMrjNgtObdbwnLMRNUQMy/fbWA8jOP7j9/0HTxbn3kgIb
	/PlNtcopfSXafnBWqFvhKTy0q/fAIzWw8YfwU02WsnybHtzUFPY0jCFZu2hplYcSotSAEXJ55Xc
	bwIcm51hq9u/SlhJ3mazf0jdbbcH6/5DuUPXGHtzmJOOa7vxvBht9KXZkVHhEOV0DHLerR3+tTa
	0fU+f8CEEpog4BA6p0U2V+qQt6H+6ZoVKd/Y9cFPSuSRd7wUot94IbEtHSspYUGQ7ebTSGrxmtQ
	LhDrZgOk4W6o7ViKLWee0wTNLwCxJBqn7rL2OCMo=
X-Received: by 2002:a05:620a:6504:b0:93f:277b:313d with SMTP id
 af79cd13be357-93f57e404e7mr834687385a.2.1792664395296; Thu, 22 Oct 2026
 03:19:55 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021085458.196742-1-physicalmtea@gmail.com> <d58ea6de-e17c-4426-afd1-0b67ead16b7c@oracle.com>
In-Reply-To: <d58ea6de-e17c-4426-afd1-0b67ead16b7c@oracle.com>
From: Jia Jia <physicalmtea@gmail.com>
Date: Thu, 22 Oct 2026 18:19:19 +0800
X-Gm-Features: AclHuK9FeuqH6i9COjZB1uH64DnGhDow9zmoJpb-bjLKr8MhdWEwBKDQwH0c-T0
Message-ID: <CAJwVaM+nBJ15=XwdV_wefNxd8iyxxSWjd-K8k_VAAc8yoyUZJg@mail.gmail.com>
Subject: Re: [PATCH] vhost-scsi: fix page reference leak in misaligned I/O fallback
To: Mike Christie <michael.christie@oracle.com>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowangio@gmail.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
	=?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	virtualization@lists.linux.dev, kvm@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

>
> On 10/21/26 3:54 AM, Jia Jia wrote:
> > diff --git a/drivers/vhost/scsi.c b/drivers/vhost/scsi.c
> > index 4f8c0260bc9e..b7e41c0a91d4 100644
> > --- a/drivers/vhost/scsi.c
> > +++ b/drivers/vhost/scsi.c
> > @@ -883,11 +883,16 @@ vhost_scsi_map_to_sgl(struct vhost_scsi_cmd *cmd,
> >       vhost_scsi_revert_map_iov_to_sgl(iter, *sgl, sg);
> >
> >       iov_iter_revert(iter, bytes);
> > +     /*
> > +      * pages[npages] is the first page not added to the SG list.  The
>
> Just a minor nit. There's an extra space before "The" in the comment.
>

Thanks for pointing this out. I'll remove it and send a v2.

> Patch looks ok otherwise. Thanks.
>
> Reviewed-by: Mike Christie <michael.christie@oracle.com>
>
>
> > +      * remaining data starts at offset in that page.
> > +      */
> >       while (bytes) {
> > -             n = min_t(unsigned int, PAGE_SIZE, bytes);
> > +             n = min_t(unsigned int, PAGE_SIZE - offset, bytes);
> >
> >               put_page(pages[npages++]);
> >               bytes -= n;
> > +             offset = 0;
> >       }
> >
> >       return -EINVAL;
> > --
> > 2.47.0
> >
>
