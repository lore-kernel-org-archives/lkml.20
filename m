Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1F0476CE6
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 15:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788278242; cv=pass; b=TpfRfynLITOONEjhLbajpYW+WBZ4Wvu5JMtGKMI+S2iwHRj4WXTk2eq4pckP/l5H2yxVQtqdVEEAJnlq/qkEcIg1vLNslJuIKYziwx18GhsYn4bwW0RjjaJwCaeCEU6PdzIpjXhAB/USeIfmdPquHwoiLNCxeHedsYuK4tM0ne4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788278242; c=relaxed/simple;
	bh=0c8eX5045Wna8ziNden3Y6xoUliGlNqVmMmXrRc2s4s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iUwJfYFHPq81OTUm173FFtKCUrNnPouyKxq5BojTfBjGNWOjLE9eVCG4d6N9aI9Vj+GfAw7PVeP0oZeqbaz+brPGFAhZD/VS6n6+1SIQl1WseIwmI3oQnBJKFuOOGUffGAnh6Ko0w/YrsE1kUaNHlsbZiw6EYCRtQWozf2D4GUw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BBgSYYRM; arc=pass smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BBgSYYRM"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-52de50e77ffso59246521cf.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 08:57:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788278240; cv=none;
        d=google.com; s=arc-20260327;
        b=DD/7fhRT91spWtMBlysBtbXAK3zGhK12ywXOz78io/hn1RgBa3+O9vxAzeKLlPWTkC
         DNY93SxNAcIZLmd229ZpWc8TDap7f80jtw/oEdJoa1atEyqx7rO7WabRg4SE4DgXsnGM
         0rlpO6Td5SIQjrR3aEDyKD7D2ZLdD/+2EWnYnQdtkodkg3lL9M/5WTW1jNpBJm11tFxB
         lkVHQVzPfVyGPRiXbwbjzlQJiMTCCSWyOoO+LNCeJDxKY91xmuFMNn6UWRSsSvKrTR5p
         EMxTsH2yjg9xe5Qi2iKSg65T13zDlZuCBCS3BaEtsSOqT/+SAxAhnS/v+usYO3c+p6qv
         IkYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0c8eX5045Wna8ziNden3Y6xoUliGlNqVmMmXrRc2s4s=;
        fh=vLSaCXd6pfaXQ4nrRBDYhM1DC8PuwsCGwOOhHcb26Eg=;
        b=kU0nOO47hx4+rWDstk4czJMUXGcTPjsHkJDi4t8Kz1QfJaSt2emMlPHCTSkK66Iutr
         d/GSlKEMCjFcnH9J3ecT5mGYew0TUITXLt3gQ9TZDRtUya/degy7SEy+Iv7ehfbXIk9U
         yCTm/G5wBaOEcBfilfEndBf8hA5HmaC7fQPNO9NXbHweFqGxmJjQVnZ6vU55wmnPwegY
         q/WnwAxU5UQweEEiaAA3qDkFIj/vDhIopB/Lu1QZ8tAwpmPyt9yONAvX7V4U638D/NEn
         YEA4OeNgt5X2oA+zK2fsRMxjVlq3ffelP5mdgHKshcyMTWa0EeDlyz2AtnRgPvUCu2dh
         5ptg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788278240; x=1788883040; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0c8eX5045Wna8ziNden3Y6xoUliGlNqVmMmXrRc2s4s=;
        b=BBgSYYRMCLz5blxXOf6LHvX0ffNw44vv8D6KaC+nN/h2HtPIWsaCAqXxwQlmRlSdlu
         BFkCkkSE/8w5ov4EVJvbcbTqX3XEG+bx6BEIqoj7mxDzN0PsjQdO+xK83JGaOUyqvShm
         ajFTgYsoM+7BVRTHgd9rFh+LljVkWW7c1Xzeuvcsd1DXQSsJLRF05L5guAp8lKNxmXwp
         tfpQGAjmVGWpSqaSMRlpQ1WPXyayL7WJZRyNLF7QXpT1532hP99qFq3+PMVAwlnXFlo9
         ZmiLzsDW8e5yyrrbCqxyKMd6Dg8/+voBE4CLgnTyr0OA6H/ERF9kHTOyif2Wff9axXM8
         E6SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788278240; x=1788883040;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0c8eX5045Wna8ziNden3Y6xoUliGlNqVmMmXrRc2s4s=;
        b=JYzs4Tg6cjyNuELi6uuszfw/pLNl3McOQgeKwE/gfyW7vDC9p8wHtuDMJvfj3Fnvf8
         11E36uMbesOGPi4E3bEQXsxywhTDqAd4dNUc7pLxfyjhUTHbq/Y9HYGeMqbxVMLzkGez
         M5gl/D9+9slO8blRx3cel/saoEYIGZgYqzWU6WmM1m13FWU1O74MGhcEF8ybcWdnpvZQ
         RUxP/WEwMtzFHF8HzICoaBI/4gkcwo8SCMPaxYVJEApzVu3Vr/85ac7Nhqq4o4q10BUV
         Hpojpugn5zPQR0CsEeRxXINi6ecaxbWz0l4k37SWtnh1jkxUXMGYZoTbAuHtqRylhGxK
         mxdQ==
X-Forwarded-Encrypted: i=1; AHgh+RrpEPOkuXoZ5uP7zTToApdRqP7mkyNYYRfJLOpWNOK00eL6CKUiDKyVJDXxjX+2zBh/L6LZ4ZVN7rsXsYI=@vger.kernel.org
X-Gm-Message-State: AFuF++k33bEkiAt+rJZLhWfuAuWaGB8PtsrKQt8PamxhzXaF3xLIUa3E
	6Ncf/Pr4vRUIwrMaWH0FfUee3/9EwXwUrGe0Kx5P0tlDrfN5Zz7cOvQdbkHCLr3n4AA/+rL+7in
	BEScLet95Y7bQjGCqrV5Mv/4bNTJj+qMaa2Sk9/aP
X-Gm-Gg: AR+sD13I3Bbdpf2REIUeGSRmkPAfWcZt5hsdWiwxBU1oxPvsYi3BsBzVdMyIOvWudr5
	h5vrzm6J0CRnQh01T22GOlmJ/CDrUh4/aeTSWCsTaAxp38aQ4QBpiUbRCtFzsGciW/XJJ8gY7Qy
	wSUW1FXK93oYRxB2+o9njebo+xHeE23sHQTz3PAAcI6iMi6FGJ8sTCbQwI4uBUdk8C4/W05GNge
	XLiwAz+Jt2IhwJZYApsgiqMee3bMKLrfOKlIjuNM4mMdYwUKVgAU4r871f5+jS7Fqs8X2/3Wd0n
	vHLyw/axrsqvwWv2uPZqVD3R49gCRTcyYlOCN7Ie6IK9yC+3cjPWY28ixmMSfHDiMdPAc30C0JO
	HI88brM74G/HjPhe8PK8grE81JAmZkr5V3XFKSKAc9KLDzE9Ng/qyjz0RlCvRzwl0JrZ5
X-Received: by 2002:a05:622a:48b:b0:51a:8eca:78e3 with SMTP id
 d75a77b69052e-52fb938d0cfmr409954361cf.5.1788278236459; Tue, 01 Sep 2026
 08:57:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824033331.1084971-1-imv4bel@gmail.com> <20260824033331.1084971-7-imv4bel@gmail.com>
 <apaAskNL-IvdcR7h@v4bel> <e121d343-9a4a-4f93-86c1-c96dd37f1ae1@redhat.com> <20260901085102.5c58a5b0@kernel.org>
In-Reply-To: <20260901085102.5c58a5b0@kernel.org>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 1 Sep 2026 17:57:04 +0200
X-Gm-Features: AcwNN1V0ZKwY8CxffJ67D9qqHhYGRXD1ZIi8To29JusVq6P0sfEj2LbfZMr-I8w
Message-ID: <CANn89i+px52TtJy3S9=uHxGj3s-WueguRo1Z_4FxO=02KLmwmQ@mail.gmail.com>
Subject: Re: [PATCH net v2 6/8] tcp: fix use-after-free in the lockless
 listener path
To: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>, Hyunwoo Kim <imv4bel@gmail.com>, davem@davemloft.net, 
	ncardwell@google.com, dsahern@kernel.org, idosch@nvidia.com, 
	kuniyu@google.com, horms@kernel.org, willemb@google.com, 
	andrew+netdev@lunn.ch, kees@kernel.org, jiayuan.chen@linux.dev, 
	kerneljasonxing@gmail.com, ij@kernel.org, martin.lau@kernel.org, 
	shakeel.butt@linux.dev, matttbe@kernel.org, martineau@kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2026 at 5:51=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wro=
te:
>
> On Tue, 1 Sep 2026 10:03:51 +0200 Paolo Abeni wrote:
> > > Looking at this further, unhashing the listener and then calling
> > > synchronize_net() lets the disconnect path handle it. MPTCP needs a f=
ix
> > > too, though, because it closes and reuses the first subflow directly
> > > without going through tcp_disconnect().
> >
> > This looks like a more palatable approach: this patch in the current
> > format looked way too invasive to me.
>
> I likely lack context on this, but I was wondering whether we should
> potentially disallow the transitions between listening and data sockets
> instead of fixing these endless bugs?

+2 I think I mentioned this at some point.

Same for IPV6_ADDRFORM : we should not allow transformed socket to
even use tcp_disconnect().
