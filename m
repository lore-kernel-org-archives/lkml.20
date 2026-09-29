Received: from mail-dy2-f12.google.com (mail-dy2-f12.google.com [74.125.229.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C98D397352
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 07:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790666615; cv=pass; b=eRx0Zc732248cFid95FxJQRUnFSC8nmkHOdKPV8qZCF2sgcFwut2o6Tiriok6VSqSdOlasty6J1r9h9CsUHGe/pcXCfYF7pfrAWIP0WeJg9wnxmU47LhXZpNLgg0cVPyrp2/lMHJF7T7mehlF49aapUydndLIB1ngbSQZd0Wxq4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790666615; c=relaxed/simple;
	bh=SwmbR5dUOxUWo+3BAnh/kkUvEjW5wbI0GebbSk6cpTI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DnmfSAetYtfHjeHJnaM6KWn9esdCz2hZYwmsyT6hl5UrPZw9jPtczEz66B0d2zc5ArPnk0rEKgPSLReYyl57jcaFcIteUmyt9CBrOfRpaP4i/XJ+ZNnu9dMFQA5cPLcvUUK8xE1DCHGJAp0iI96i7qCyrKhBHmhdw1p9ALZ5zE0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i1UQShj6; arc=pass smtp.client-ip=74.125.229.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i1UQShj6"
Received: by mail-dy2-f12.google.com with SMTP id 5a478bee46e88-33bc6ff6cadso516707eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 00:23:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790666614; cv=none;
        d=google.com; s=arc-20260327;
        b=rWfkU+cZd7STnc17oyWvgYJiGzBcdVHQC0h7d3iYV91rf5kcYJ8QLLLNmuJUF5Qt6a
         exSQuQXyZb9/VQ9IfT3qVVJJxPasSTdrkIujPx5/rfs33MH4c8pLcnpsM8eM21qPokEn
         NtECrmZhRkPQkDMEXVe4V5xD2SDUQYLOIiVEhs8EcSett6FBuQ20rSYPsAEQUhT5gj0q
         bwx8iH5c9omKPGiANsERcof0z4sjzgHkp5eZ2U3vxN0r7k3lnYih6GZhDmzohteCXLMb
         lus7xF2NSpjNdiJ+ZmCCfTkL4WReap7tlEWD6DpKiPodsXhUrckindUVZhEjC+2n3C6Z
         N9Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SwmbR5dUOxUWo+3BAnh/kkUvEjW5wbI0GebbSk6cpTI=;
        fh=C2bZikU1rXO0seVjt+GKgoh2Taq3WeKZv07Ahxhab5c=;
        b=ZshoIo7wm+656Szl2rZf55g7DYV3vU1fG+p3fqERuf8QkTI3WlZMU5aulT+4SJX4E8
         qZXaPrxiWt5dDTQ5KFtqZYUtWQnh4Grn1fPvo4if8KWrKl77rZ/ZK97ESdtoPU5m30wZ
         Wp7j1CaQXEtxwqJ+r99WuF7FuuHIg2q/RMMSTCykTnPQtqenTnK26vR+nN8fBV86Z34j
         3aMaJCM1deC5CNFTOIZmv47J+0/591IruKMgA3nHfY435i1S9d232qaO9KX3Qdo/VNMz
         MK2Z5B3JG87UvV9Wg4UrfX+6U2wTrjYTkT3+OVoOVimfMBkiX840M6y0vQx5b1qYmLd+
         60fA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790666614; x=1791271414; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SwmbR5dUOxUWo+3BAnh/kkUvEjW5wbI0GebbSk6cpTI=;
        b=i1UQShj6qC2lO20wsdPHUGzLHOxvb1Bcb0wrIrmxdp8aH0+snnAesayJWRxVPlPWH8
         TcApQZdnY6aXEPGS7/2cgya/7fS1NKeNCK7rr28Cwv3R1UMn/j1tCTM3Fql0F7ehlUhB
         W87nkmj5VW7j8fGiiPE/czP+EfaNWXb9RuBW1jmrTEp5iVt83REsuWsvSoiIU3xGIq2W
         qx0SfNViYWne+yFGB+Kne04v8djy0meFkrq4CvPMEKdn1o/IP4u66SAAeg+oMssswYXP
         HZBQcirl+TONYkVBznlB/KP+G0OjW4MsO4zDSs8BkIe5bUJSHSPVDo8ij9ZscwOKk9bJ
         wAdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790666614; x=1791271414;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SwmbR5dUOxUWo+3BAnh/kkUvEjW5wbI0GebbSk6cpTI=;
        b=h6R1eSOb7UlLkYiR0kHqm/R1L9Dt5ljiZb6SpcGFEj9pfKFuPDRhH+kK6tN4sylZqo
         tGBxldbvllqpNnof6kckOh+k9My2wwwxOWPbwLZZqnbfY2s23LwgeN6EVUAlxdQXMYVi
         gKiCoMAP9PVsHkaQk6/734scfWszNM3COpxP0eUmSZvCbmNv0KzDT2UN5fP6Yec486QB
         BpfNIHYG/ne8sxsmUCqqg3653DBOoJiA6MRPl8/Aot2m8UX/BLgoZ4tBFHa9NdqT/eRB
         lRqsbuu8kVZi1wt8KL9AhsqZ74tVnT/dERZ7nNVHLFiFRNm1kyaiXS1aKLfkFqf5RO1J
         AT/A==
X-Forwarded-Encrypted: i=1; AKwUvBzgTZVku4lbDjx0VcGzonTbHTdHhqRZ2tToC8WejcfTEleW1pxlU4+7nH4wUOSpCVcKDB8riO4xtsJ/oAg=@vger.kernel.org
X-Gm-Message-State: AFq9FYICtiIjOBlECdyTDTjijlpHrV1nNCDzwwO+PpL0+GaeVS/zKNRM
	gVv7c/95mFrJylg90RzFuVKNb2axX0wHJi6vtuedwxx9t25K1uEjOZSxpIJoJ2I/XjCiMrEtVIz
	E1Q8sZxak3o4QNoVTy/iP4WVAZTvxcRo=
X-Gm-Gg: AYBFou1hq1udiXkVermp1VQJThnaFpOHzDytY3er1lWUew3n+WJ2Vtsj7Un3hoFizHV
	6HrTpvjdq4VkU6JcRgkwb66R+KobLxcsj71i1NjWKvUoJ2NZheF5rTI4RFuQfJvniv2dLXn3pDg
	UPh9e3dqUZ1zpMouapzzZpOuLXnnJxbNKAAdjuCZxsnMQaFe6lvrER/baYVk6II3fN0lrRfomJC
	E4azGeneBn3V+vKHNKeN4MGxbt99rjj0Uqs4VwDEhxNbzXOLReZyNghqCHeabY6jxgGsQaVTOi/
	agY222LtpuBNd5FOfuEgJ9FjPLBomREtzgfEC2qx7fX8ae0wMOINGH/pWDB4e03oRgMyLOUrs/g
	GMayCvkN6bixL9Cw0C5r40i/NrDa8xoP/IgFLsTI88+ZNu24dNE+d7bUPHyUGnsWzHNRUFechYe
	BnNVBGpdmLU1seDOgDk/er6xdB4DiZpQkdZNAStQ2YUKFHsIWkcwo=
X-Received: by 2002:a05:7300:f64b:b0:33e:4e49:d08d with SMTP id
 5a478bee46e88-34272b4bc81mr19698142eec.1.1790666613587; Tue, 29 Sep 2026
 00:23:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <GrS88TFpjifccsmrblR3hAxYF6f4xInMyFabclrH0IMtQKZWF3-tOTg-CWN-ZFKrgHY8G2kAArtkzeGOx2k-OQ==@protonmail.internalid>
 <20260928183925.1315274-1-chenhan0017.work@gmail.com> <87bj9htclg.fsf@t14s.mail-host-address-is-not-set>
 <CANiq72kWg-pX36jrJy9M5eKMqRHUT3UUEKTssPwfYWKoseYd-g@mail.gmail.com>
In-Reply-To: <CANiq72kWg-pX36jrJy9M5eKMqRHUT3UUEKTssPwfYWKoseYd-g@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 29 Sep 2026 09:23:20 +0200
X-Gm-Features: AclHuK-JOInkMbAtuhvVdW0qLZ7chfVQqmG90mh5JQERQlOVnqB1y0MCUXRo0uo
Message-ID: <CANiq72mbTM89p=ef_fz1DLSQEJzhogdckp07ZiHK+5-53sRF3g@mail.gmail.com>
Subject: Re: [PATCH] rust: time: make Delta division and remainder fail consistently
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: chenhan <chenhan0017.work@gmail.com>, ojeda@kernel.org, boqun@kernel.org, 
	fujita.tomonori@gmail.com, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 29, 2026 at 9:20=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Yeah, they should not be in `time.rs`.

By the way, chenhan: in the next version, please Cc everyone in the
`DELAY, SLEEP, TIMEKEEPING, TIMERS [RUST]` and `RUST` entries (both
`M:` and `R:` fields).

Thanks!

Cheers,
Miguel
