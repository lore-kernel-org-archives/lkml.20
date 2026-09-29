Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 332A33D954F
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 05:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790660274; cv=pass; b=mJ74Dj4/e+/tnmqzpbsmW0qANBekaESrAB7tLCO9yzawTzywjcf8QEMWp/aVb4h+Eo4ylsRDbKFGHRlLW4NMp2eJo3YQYa7JBrzcAeSkcLb1XD0BYvrhycHGHTX0lGWL2KZnN3YLhsQNEpev/H8iCmYayhltXxzv9mZvM7tMxVk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790660274; c=relaxed/simple;
	bh=mGEEXHKxugm1ji6dPF/Vka2irdvzEg3Ov0k4PxuefyI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=eauAKJGxNmV1FJto11qKw4jfkcW6XK0WKGXjxiH1DfpZwlN+RwFIxnrqT2eqVzBGf5wjz8BwNEFslzZ9jxDkKJZhMr2GuL+6EBaGbLuh9gSflhV6OFSFaOxGQE+hg+1dl1ULr2KaP5CbHffJWxGz+PQHZ4XEnT0ZMN3jFG19dxY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NHMl6NBA; arc=pass smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NHMl6NBA"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3a76ac0bdafso613111fa.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 22:37:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790660271; cv=none;
        d=google.com; s=arc-20260327;
        b=VI8yYE3qSGEoVERlZa3FrPeoeWf4zI2EbCn4Emh3ZUe407CmUiSOtdmUwbmK3a8Vs2
         1EGVTJx4KObUuUcnSqyVvjQcN7irO+9nOd4gl9K3APmOWxSUIODSd1ObPvh25RQl1qLU
         RjDDFzYOWFoC5UrjNYD+rjRdVFhNgi9F0ArARofxzCaaIHitDrINs2WhZovv9b0ltaFc
         yBWcPyY5ThfVRfmkjGa5rrYz13ayFy8Ls5YjSnipKYgy2omoFpZ6N/qO70uerZogEXxE
         +UumkByR3Z1SKHmbhAUPzGU/93TQHWJ1YgH7zhAuR7PfbBKNWXX+MwHyVjMoIDTP1v1a
         LbYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ywMDNY3EI7iDZTym+kV52AlLxDjfRMFnaIbif0jeJZU=;
        fh=IVuMbBg2h67nVZYZK9GQLsdwTSOk6TEnkUxxboosrzM=;
        b=OnkIFIigzx1MFXF8llJhq/r+S1+q+i1ddUBghni+5r5K/tByKrHOd8vzZuKXwGzkzL
         oMJ7kapGfUYQdWnDPr2eh2kYSox83AZs4VDadHRtNRnYm+sVjMTB8IqHzBbCelKsC+tU
         MnhwkUFF+zhGYryIe0UkQY4NeDQDuyXMhNm2p+gDnguj9PVmYyKseEzp7lF6mqbNrR9n
         pW1gO7FI/Yqwbqt9IbjxZi8Fz5i/WsWyJ7Vfr2cfHVQje9HhF72izRk6rCni+vZx4rB4
         1gep5sPUWiEKDDvEoh1vBo/ptyyFr1pbNVR9IPlM8vA5I5y8hReVftEbachGbJg+KleF
         KByw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790660271; x=1791265071; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ywMDNY3EI7iDZTym+kV52AlLxDjfRMFnaIbif0jeJZU=;
        b=NHMl6NBAU721ciWyDdItxZBecriRV4fL0N1xWEQR7mY38+Gjeactn4MABx0d/2SZna
         92yndCf4VZ8L0hv/1dk9qOlbWDM4hHXJp0vaMMeEA33grbpeUKAqNWvPGFZdiF80CmbM
         If4EsEFlHjOTOJO2aswpG8qdya5K6sd2vKZyTrXgb6zUfEdlnSdXlUFrDWbjkNliB+IJ
         bcpI+BZl+9ofEi8+wxOKN+UP3JlESB5Uno9hx9btGwm7YV2Ux1WJGAAqiglJnIpyoETT
         3gMlbzIoLueXusJqyx3mBH4yVPFEV3ZUyJc7Pzo3lzeTND/Rm2K/gKJ4uXs3yVTgk1cN
         SFmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790660271; x=1791265071;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ywMDNY3EI7iDZTym+kV52AlLxDjfRMFnaIbif0jeJZU=;
        b=oXjUDKD6uy2JhsjL8mQMdWlL3bdukQ1fszHd1xIPpJR59gAKG10t4wWgfUxQsHlUOM
         E0N5MDEdomMVBD8EOalgVhJY9Mn4N9bD2OP2VpcK8/MLW0j6Vux9ZjiVFKK5OkhZOBIF
         SL1CC8OxDHFxEiCHCbgyzxY5SR2l852S40ws6iWXy2UUGstj84mkrfa6VrpCOKdZBUkf
         mQDE9Ahd489cf16ACfXAFWoFtFBAcxD6eTAdv4q0p/oHbEPNwQQE3WbIsTtj8VLQTSkh
         wLAlSur5xC7eT7/GabnV8T2GmMopDt8UrJ4F0Mvktvv5zsf+GsA7dbFWSu8kx2XIWzZa
         SLTw==
X-Forwarded-Encrypted: i=1; AKwUvBwnW2dYXCmE+ZEKqHxJbyQSDZ/0jqXGNKcUXEUwbWcxattKGwrifpKeIGiVDvgWwrAJxlTax3J+3Q1HFxY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJqsKzvjqeZeA4buYs19Uq6D3qzgaKZUirJ0e4IMzbPxHogL3oL
	PjR7mxkOEhimIUCQLQ6qVpO1AxGeBQilAmytzMLrMG8kozv1DbTkDbRqVyrIZ/yJ5/tWEU3KOae
	rHDoDDoqvfYTjzTPX6VoG2gsbEeTO7Kk=
X-Gm-Gg: AYBFou3aXF9XTJf/0ssKMhCxYyy0l1+xL6aC2EROa4RrXvnRsVqC9Q4fb4teMNEDYV5
	R4cCEiJENZJPNz9nMyE2eGIjZh6jD2imcV2/GdpFu52lUxNjDvgrSQrSut4OKhnluvdOeBSE8oF
	zoEv3yt/RHohCAnnj3198n6+I/Wt8UfQpBdIzdcMQ7wMcZIwvXO22KxEu27SNbqqphrIp8eC/o9
	icsvJrP5IzvxlEEIFLNYSqR/6ujrurowu0HebkgU6eX/I8v049ZL+/q4tR0t0Ka4R37zoc9vaty
	+Y6QfMBtKay7CMDIvZ9GoEs6rKgXz6bZqZPDugoa1stg9tBFqW18Sw==
X-Received: by 2002:a2e:a803:0:b0:3a6:62bb:906e with SMTP id
 38308e7fff4ca-3a76479b880mr2991121fa.20.1790660270947; Mon, 28 Sep 2026
 22:37:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260927081034.350422-1-maimon.sagi@gmail.com> <arsCWFmUhSYkhcCv@devvm20253.cco0.facebook.com>
In-Reply-To: <arsCWFmUhSYkhcCv@devvm20253.cco0.facebook.com>
From: Sagi Maimon <maimon.sagi@gmail.com>
Date: Tue, 29 Sep 2026 08:37:24 +0300
X-Gm-Features: AclHuK8JAeWlDi0d7__PRO1w7MUiU220HLhnmM4wnT1m-kDeU30Mnzj_nbHR38A
Message-ID: <CAMuE1bH_=zqxf0-cfJozeaytGmK=q_WK0iwVxP_yH+AkJxHO=g@mail.gmail.com>
Subject: Re: [PATCH net] net: axienet: free outstanding TX buffers in axienet_dma_bd_release()
To: Joe Damato <joe@dama.to>, Sagi Maimon <maimon.sagi@gmail.com>, netdev@vger.kernel.org, 
	radhey.shyam.pandey@amd.com, michal.simek@amd.com, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	daniel@iogearbox.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 29, 2026 at 3:12=E2=80=AFAM Joe Damato <joe@dama.to> wrote:
>
> On Sun, Sep 27, 2026 at 11:10:34AM +0300, Sagi Maimon wrote:
>
> [...]
>
> > Walk the TX ring the way axienet_dma_err_handler() already does: unmap
> > every descriptor whose cntrl is still set - axienet_free_tx_chain()
> > clears it on reclaim - and free any skb still attached.
>
> The code added in this patch and in axienet_dma_err_handler are almost
> identical (as your commit message suggests). I am wondering if it's possi=
ble
> to factor this code out into a helper and instead call it from both place=
s
> instead of repeating the same code?

Yes, the unmap-and-free part is the same; the error handler also clears
each descriptor for reuse, and frees with dev_kfree_skb_irq() where this
uses dev_kfree_skb(), so a shared helper would use dev_kfree_skb_any().
Since this goes to net with a Fixes: tag I kept it to the minimal
change.  I will send the helper to net-next once this fix has reached
it, if that works for you.
Thanks,
Sagi
