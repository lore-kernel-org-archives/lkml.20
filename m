Received: from mail-ed2-f29.google.com (mail-ed2-f29.google.com [74.125.228.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE183019C8
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 02:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790906704; cv=pass; b=mVd6n2JF+IsRUtJ0oYz60R2vsQgvXHoA+zXINCeOFi4K8dq6i8d4JKDUIZimlzpmChLXb+ZUGt77fytFfOOij+DXD1y6zIcNVOM/fQu7I+doSi8S+5ccN+vrBL7g/2axN6uqK424/o+/Kgmhz319w1MqfLX4KAbzbO80R7TGBt4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790906704; c=relaxed/simple;
	bh=Vefb40LfhWgTBUzEfWZInUgcHpDKSPrv/ywEarEYv6c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=heGcUVDomH/0VgisGDCeNKbqLZ6odCFbpXkadupDdVMVIZLA3+68BwJrtZYrw6d6xx5kc/Oq/llFbMtdxSLGqeeYjosch2GeQsCufVDtDV7h5KCmlb0CWrKt6hNgf3w3n1PYCqad4i6RXHveN3BHgo+EtWBi9lJ42pndVy3wmkI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jxXnMiLt; arc=pass smtp.client-ip=74.125.228.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jxXnMiLt"
Received: by mail-ed2-f29.google.com with SMTP id 4fb4d7f45d1cf-6aa0ee64afdso8829182a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 19:05:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790906701; cv=none;
        d=google.com; s=arc-20260327;
        b=iWUMyhpTY+JQBGeLoeK7PjAKCvkikMYyBU5+Yg/W0XT4dvldkRKTKdoVaX5ilgNFQo
         UGOkYW5eEC4uC7VkzQoaBKSu3H1Eias1bXZgH97C/L52MMKFJrNaivlkV3S1ntIGJ67M
         CjE/XWBQS4dpL22FYoSeMXzXhh2Sd98UjpjTkXfU4nnASKjIQGTPAw5Z8QhOVxgiiFx3
         m/0voWSZ2NGmHuVmdMPHtUSCef8SZOl1YnvGmLyRdjQjOuKshZXW8FSu07xmpHsrJi0N
         PNC2nqrk3ZhRa++epXPzpQWno5AJkGp1Cfx9VXuirM/5iYZy9pMnfh8UF7XcFCkvG7Ie
         AflA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BNObIucQZt6XOuG/l142nh9+U24Ab7g3KvjwszYIWFQ=;
        fh=G0QF6jesHQEn2AGfajr5FJcyl+4Kz/LvRdqIq8U2Gek=;
        b=ObZi08SnLhqbBYt6vOiwPrR/GpqVg8RvMg+eB6OGHeAeH2TnNn+f/RK4PEBB2XLh6v
         yVqb3LHM+6OIIxXQAFv2hnPzzfwSMRxZq1u4L+nsMqvBt4RJFxzzlFnOmCEZRbddvZ6x
         aKB8nhGCvFQvZVkfl4N5v/vtQ3mBXH2Fca9zh9VPvdyRxudMn9eCD4jGf9Kl81ezKAWS
         KY4M26lSOtHS6bTUTwEqFossbTL4bHJqpmMOi2qqksTAK9H2aDpRe1k0ypFBR4weCrL0
         x+c63m1GhO2NRg+nzJ0Kkgt4Y1p1a5Pr33M+K3bfMV+dCaUyG+qFdQB0RWfkeHNBDU/g
         grDA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790906701; x=1791511501; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BNObIucQZt6XOuG/l142nh9+U24Ab7g3KvjwszYIWFQ=;
        b=jxXnMiLtvo9i2v1/1Xd+Uf7ZsvueyHqKovTGSxItK/k4JUBURYP3gIUxIm08o5TNoU
         j5OXFt/gb6t18f5oatne3aGQSaCkaFhntHvUeklKQhEjFj7CZbSblgEBUjGFU77lmRn2
         zja0g8odBtBnq2TfZLZCgTNEvHHlKaypXVvxjrkrZkbx9BMW/yP6hH/7+9zmwkX7OMsg
         qigJLai6c+kXfL1qdOhX/yTpwEBljvAVRxhO3GV+V8dEXJqnTeIh+rTx9sEnZ0xmcnuC
         CcDOnJyl16eOIChvUyKt4jvdaLcOx7Hdk+MW4e3rMLJdfLw9MNYqkPRRuB0SjGGTRC8I
         ZILw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790906701; x=1791511501;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BNObIucQZt6XOuG/l142nh9+U24Ab7g3KvjwszYIWFQ=;
        b=u3s31G9OGDjlTCjJpvfgtg28b36p+3vQwL1z9rNktkr2/f9RmXcIMqoh6lxRGp489f
         ED/SuZ0soqNagj6djONkmuu3qllUlPyHXtO4KH1jug6s8MBQar8D0K6cuOZDSS/GVv/P
         XQotknr/8aVXCILpsrzv5ZRv/5/hGC4+P5ZZooS2pnZXme1IkX+zT3rR4Na+Of9JY99r
         piEYEqsT2ojw5rwHCbmqCHJzhB9qQ9AzwOHHkqxI+3ml3Grzkihn0Bw4qu9qAmbuOGYZ
         qxmtVqyYXi+4DyeoZeLNSzYwO5XEuF0vrsECktADP4So9FRP8J222nI4u9nW2B+p4Agm
         Xqaw==
X-Forwarded-Encrypted: i=1; AKwUvBwIvLWu8vV6PRQgVL6gbHw2hGwCfTmIdrcd6LJCfQ4sdBh7kIHo8Ck/suAQ2hhapnPOa+dZjL6rP3Ftu3Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYLj8cGLh05mBsuZVTNeF6rNcb30gvzaNv0E+m7imE3b9foQFolj
	TXA01ujB2+XPTl+8gg+7IzEBweTqlLFpvyubSd3AqqmpWGMVBFf3F0tesf5aY6xZbdeR33jZkHw
	PH3CqplSK7eaNTyUF28WdpH+KHGqQX3Q=
X-Gm-Gg: AYBFou1qhwylTPr4Evpvf0PeQVBgPAE6jMHXB0P1vyKaxLyY3NMwfSZCKuFQ3FecZ/w
	vR724KhzwEaEH35gFar1LBKeWEGV5e89ok5LQJAIdt0900t7bOu9D7WEnRiyWc2d8ZNGfKhNxDt
	/+kf/54MEzx0ymSFKnv0sz4uKLXm/SyTZIJJMfjseIDP2mm2xXaivvYAfuDmHjVaAmEQ5J4N1TN
	OKFtT3TjkZYgVfeb1J7JMGTv3MdKO0PKyrNCoyJaDWBnLlDhhKL9Daq8yM7+foh66GbuqTu6i2U
	qIswZtgmUbYXIpkRfrqFVBVmCvGuMT6rnM23YyeSAbFcHhssyTCGzTkQscqwSri1dOkO9HHjGHP
	ba6TkH5Yo6VHqHbtP+VnIKTFITF1851BRZuJ+gT6aELvnJsiW3p14f1ebcwMSbogal+fgs4CHxK
	7W7fQCtJ+7o1XdWGv3Iq8WeosFOQFw6itNuRK7kCZ49o5T5mFD0i41gtP6PH/nTOmxoA==
X-Received: by 2002:a05:6402:3253:b0:6ae:1a0a:ae9b with SMTP id
 4fb4d7f45d1cf-6af9e2ddbadmr526637a12.25.1790906700698; Thu, 01 Oct 2026
 19:05:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260927204317.21546-1-rosenp@gmail.com> <2026100132-geology-shingle-d005@gregkh>
In-Reply-To: <2026100132-geology-shingle-d005@gregkh>
From: Rosen Penev <rosenp@gmail.com>
Date: Thu, 1 Oct 2026 19:04:49 -0700
X-Gm-Features: AclHuK_Edka22cv7pAp_46c1jQz2-5jdqpjLkkUTPn-yUOquVWu1-dC2o2nF6g4
Message-ID: <CAKxU2N-_kZM9LF2s_1kwZ-0visnuCH9f7c3b8+iEeCH=RgK2QQ@mail.gmail.com>
Subject: Re: [PATCH v2] serial: ucc_uart: Use platform IRQ helper
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-serial@vger.kernel.org, Timur Tabi <timur@kernel.org>, 
	Jiri Slaby <jirislaby@kernel.org>, 
	"open list:FREESCALE QUICC ENGINE UCC UART DRIVER" <linuxppc-dev@lists.ozlabs.org>, 
	"open list:TTY LAYER AND SERIAL DRIVERS" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 1, 2026 at 1:45=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Sun, Sep 27, 2026 at 01:43:17PM -0700, Rosen Penev wrote:
> > Avoid calling irq_dispose_mapping() by letting the platform_device
> > machinery handle it. Also enable possibility of handling -EPROBE_DEFER
> > and other errors. Handle before any allocation or anything to avoid
> > dealing with gotos.
>
> I can't really parse this, what is the bug here that you are fixing?
>
> > Assisted-by: LLM
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  v2: move platform_get_irq() earlier.
>
> Why?
this was reported by sashiko in v1:

[Severity: High]
If platform_get_irq() returns -EPROBE_DEFER here, does this leak the
asynchronous firmware load initiated by the preceding call to
soft_uart_init()?
>
> thanks,
>
> greg k-h
