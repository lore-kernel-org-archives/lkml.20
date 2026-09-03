Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B23CB3E3159
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 19:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788463716; cv=pass; b=lAb8g3X/DUhN+G/r7ayEcOA8j+7YGBGEuIRiseLu4SgK5KQPMpxFC0PfhQ3KqibfVD6J2zkYStyo/zM7klsMiIzNAxhUaeUoXMwdKo62EGlRei0wwcg6H163pwf8wEcxn4R8UoAMmoqaNaBybDshwPa1CYHrEC5VxTloncea4oM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788463716; c=relaxed/simple;
	bh=QKxqZ3eMMR2X39cJ4mp4AJOBcwz2/Hm0JMLEa5hv45w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jF/5BF+BemGdVRVa9efxMnVKHbnnWYrmlrn6vR72IfVKS2SBelNL5gdtlrf4+8UgjFyFcTNEuBEUF4xMfKgyRclpihGT2jgWPnow2pwJ7scHO2C84KiPCKDYqKkXWVhBXshf13tSIhhNapUgYg+1+Z9+SmdDvhGgSoudhWXdr5Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IHxCsvaB; arc=pass smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IHxCsvaB"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cc1bcdb3c4cso246323a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 12:28:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788463708; cv=none;
        d=google.com; s=arc-20260327;
        b=T7YqbSEIjqxJ3gL0mRC+DihmUze5dHhXg6tByucSFWOHtQDSizYgSaBPP5MvObsoJD
         AaclheaUkiMmUsfg3uKytloEU5DxkWHr5yn3Ew7X3nr5gF7eohknwiLoumDpxFCODKbn
         vjcXrCXwzgI9nfF3QydT0ElgpVUi+rS41oHpj5/ivrLeFgDWhHs1WnrG5MlgriRPF69/
         QWsbND/fucb1qIqLCUuMIofRX52D28q3/VNe/EdP9qbCeL4ff/CJAfX7Pn7zPTx7rpXV
         r2cj2bd6jNujgQajiL5Jgf/wziBmVvtb80VBT4GHg8mT/UJOroyoI5ae5rZWUu7yEuB0
         st7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QKxqZ3eMMR2X39cJ4mp4AJOBcwz2/Hm0JMLEa5hv45w=;
        fh=bH++/u1+ypq6mR6DpPDfTHf/pZEusWIjG0LIFr26pkc=;
        b=LgsuJl2vQHeYSdJRnz7fr50RU08zTS4E3mHjtwwwKJEzFPPQq+NeDHmw047u/tPiDz
         zWhF1iBMqmYsVRLKceeT+0fQjs2iu31+SaKnmIHZdDCCbk709DXWriiY4L3jdL/92W21
         6qFKp++zaxW0pWKRjq4qtPL+MTD4ltVJE/KTg5CRMd7FrTOzAgFbKmRxYD4/e3nwhaat
         dqwP+0V3UsgWkt6JqlrJByz1PJniTzbvTsa6FQsQGoqLhuvnf8v+qdLM6bz4GZJouBeA
         EdsrBmzfbi6u9+/zibDdS13ULi3BEDwcaSnzUP+TGADcEoqRSeDok26O0OBhm4f7xYjO
         MUdg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788463708; x=1789068508; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QKxqZ3eMMR2X39cJ4mp4AJOBcwz2/Hm0JMLEa5hv45w=;
        b=IHxCsvaBn8xIxK2o1/5GqkXTcdPiKYubmDrI4T/kxrBOOuVGa+jzaBcfGVMyQOHWJK
         TTVWOGkoW0jj3AQ6REnI5C2zHKh/GIAiijcjq0Yq4qzSn2M1D6vixfoTvlOWMEqWZIz1
         w0NU4xKrdcNsGGD277i7cSWqwfIAwjGKKCb6Ju5cHJu5wlTAyGuKIofRUlDlhb9EbglE
         6I/6E0f8d+fusjqQDd0xWGd+CKYSdmc5UdQFoXP2IwLEnyp69kpSgjucZ6MGvHdtFqTw
         rIElbQ6zbsPYsqBzQqodRoEk1/9um0ZxPSJcqp6HSJeJxwxMIWihgUfkEpW3hPCn7kvN
         d0cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788463708; x=1789068508;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QKxqZ3eMMR2X39cJ4mp4AJOBcwz2/Hm0JMLEa5hv45w=;
        b=exmEOy5QaiXyzW2pU639lQcz86nTBDLgIp3BR19Hqqc/T0p18kR3Diw1a7IJShgRE8
         5ph99J2tjkD8vv3GJnAQrRFf1iwM7z5GYL/XeSWVnXwttdgiSrolHLK4dRI6jc3dW6/a
         ELCl9Ml5PTlhX/MnotoCMF85sF3Jec+40uiR1xFLL2H+z4YNFBDjx7/XMF5KkHTElwWp
         nmwUp0St97gb4PW1xAPKXA08wMAdEwOGf2WSVVcOW6cKSrZK13Zn1jPvbHGZvSOG2s4/
         3Tj9bCs/3ZwNpTHCCEyYk2BYaUkZ5rNGvFcd+MuUW264Y5rf4Ok8+Tm/RmDO+fGZMgSz
         vNIQ==
X-Forwarded-Encrypted: i=1; AKwUvByJOL4ejBjrAhs435HcIxzbGYOdY5x8eqCBrQkH18Q9+cbj2N+UmOb7zkilYAXKSTT9hAz9PH+cmx1oJYA=@vger.kernel.org
X-Gm-Message-State: AFuF++nqcATZRCmwIPJuo0S+SqCVyjjdj8eAbi67EQ9Dp0xWgFhTvq4G
	j/H+/LD3tfBcVDrhwxCPig2gqtva1ghyidxEDb6hetWp9aCBah4p9bvV/DsFjgPXo/ZiK0cWp7Y
	M0IOMlfMUKnt929kf6xYZlvLXdZ3kHY4DvKZDTKd6
X-Gm-Gg: AYBFou1leLAOYf3v3lJHDzlbUr+u6oieS93zTIgFsBF8GYT75mb00ClgXRoDyXifK6V
	Jmn69GMV5PuH0rKjY3nXRg3f09NkPZII7PSOH0gedmIKDgXYD3AYKrEJMFdHTUSR+e18o7KU/3M
	WJGAoMCy/kh2aB4jyzv45HUxv+92aEN5MCzhaENwSqp2/G4WPoLQOAkYOagvr/kLVopXNDDoeh4
	hTcSPNQ2embTSU9TDwWYA1YCGmZ7ZluMrvriDlNAXKIM7Bc92P4fUuRD2wt+vhqKgjG4lwducQD
	oGAuL8PTdCwtRsCVxKt0Zm8BKUbnrEUyYNj2Qj2m7dZ9YphFJXzmmFzkMqj2wm1B9Zr6SAomJvm
	jt34ffDgmjPA+Jdz5oCf18EkUambeyLA/mbHoELlKo0kOmbuaMJpasfy635dW2294sYkT00RH9p
	/tqr5p8IJKQrQS
X-Received: by 2002:a17:90b:2784:b0:395:4de5:1054 with SMTP id
 98e67ed59e1d1-39b26272bdcmr1062522a91.16.1788463707201; Thu, 03 Sep 2026
 12:28:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824033331.1084971-1-imv4bel@gmail.com> <20260824033331.1084971-7-imv4bel@gmail.com>
 <apaAskNL-IvdcR7h@v4bel> <e121d343-9a4a-4f93-86c1-c96dd37f1ae1@redhat.com>
 <20260901085102.5c58a5b0@kernel.org> <CANn89i+px52TtJy3S9=uHxGj3s-WueguRo1Z_4FxO=02KLmwmQ@mail.gmail.com>
 <apnHqmYZQ4yzOP4N@v4bel>
In-Reply-To: <apnHqmYZQ4yzOP4N@v4bel>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Thu, 3 Sep 2026 12:28:15 -0700
X-Gm-Features: AcwNN1U6zY6LZ3oh1KYqCMuclwz2vgIWYpsKBP1jBBoFZoxWBAYwuULPqKemveU
Message-ID: <CAAVpQUAVXFrRuxPCKW_4qqAAdjTpv+arijYODeFMfXshKqajHw@mail.gmail.com>
Subject: Re: [PATCH net v2 6/8] tcp: fix use-after-free in the lockless
 listener path
To: Hyunwoo Kim <imv4bel@gmail.com>
Cc: Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, davem@davemloft.net, ncardwell@google.com, 
	dsahern@kernel.org, idosch@nvidia.com, horms@kernel.org, willemb@google.com, 
	andrew+netdev@lunn.ch, kees@kernel.org, jiayuan.chen@linux.dev, 
	kerneljasonxing@gmail.com, ij@kernel.org, martin.lau@kernel.org, 
	shakeel.butt@linux.dev, matttbe@kernel.org, martineau@kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 12:17=E2=80=AFPM Hyunwoo Kim <imv4bel@gmail.com> wro=
te:
>
> On Tue, Sep 01, 2026 at 05:57:04PM +0200, Eric Dumazet wrote:
> > On Tue, Sep 1, 2026 at 5:51=E2=80=AFPM Jakub Kicinski <kuba@kernel.org>=
 wrote:
> > >
> > > On Tue, 1 Sep 2026 10:03:51 +0200 Paolo Abeni wrote:
> > > > > Looking at this further, unhashing the listener and then calling
> > > > > synchronize_net() lets the disconnect path handle it. MPTCP needs=
 a fix
> > > > > too, though, because it closes and reuses the first subflow direc=
tly
> > > > > without going through tcp_disconnect().
> > > >
> > > > This looks like a more palatable approach: this patch in the curren=
t
> > > > format looked way too invasive to me.
> > >
> > > I likely lack context on this, but I was wondering whether we should
> > > potentially disallow the transitions between listening and data socke=
ts
> > > instead of fixing these endless bugs?
> >
> > +2 I think I mentioned this at some point.
> >
> > Same for IPV6_ADDRFORM : we should not allow transformed socket to
> > even use tcp_disconnect().
>
> So.. do you have a plan for this work?

I'll post a patch to disallow the buggy transformation.
https://lore.kernel.org/netdev/CAAVpQUAWjBuF1Rgze0Vt_XvkUT=3DAjw-F+Kh+s2iHk=
38c8iAapg@mail.gmail.com/

>
> Or should I send the v3 series first? I am still looking into related
> problems, and it looks like this series covers most of the "important"
> ones that have to be handled right away. What is left seems to be the
> UDP side and other minor problems.
>
>
> Best regards,
> Hyuwnoo Kim
