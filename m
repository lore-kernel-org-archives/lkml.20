Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794145267;
	b=WHeK9Vr5Cu7U8pqdBipuLi2NVfXsLDustNr9QHNDN9hAJZm4kXp7enKe0rqDGZZUowUs
	 /L8v2YZCG2rMvEbcgVnEPGntRSWJeVKzWIcTDo6fl+zMO0dGPNku6BOpWsjRzgtCLBgOm
	 yY53YAqZ66M3MxIeT5Gvj5wBTFiEGAsqLj+lEsgmv+5zcqrHnaXxOvOreG8pb/PV7eCgh
	 bvKybK/7mr4PllFlm/hVExkMnxZOXHTYrbAbvKYD01VLLz2tuLEBayekOeC88VCn43QON
	 oZKxYKUhcyRYpWajeiyY8wAcGp/Ufnhhv6RIHTF8ujUNHJN51MKw7OlCNyyFVEEpU2Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794145267;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=LCOeMKTokO+IsyFo/KH4xhEDHzKKObBmSarGf98ko18=;
	b=Gdoz2NxaFjmUE2YB6JPR55rlA42eseKKcPo65eY+p+OeUM6vztzHa4Kg1x+ZzJw/MEoT
	 FUxjwXjCCBBRhKx53UGkkkRbdabvg6uhs0Rh7BAcnPzKX62ZpKUrro1JkcXPMUBG3YuW8
	 UPigPTYGjQ6TJTlOPUVlRdUW6MPUY041FFta+vjpn/z8U74B5Hba0Lrd0jjO5Eyk55buR
	 u6c6XL9UA8aRm2eUfDNqycXX9nCDN90+d/qD//M3fJr3AhJbPWhi2FKlMzRySk1F9P/8l
	 SoN9eVL3GjJk6Ngl59gqBiHfGv+k0hlMR8QmfNJvaalBsO99Buc22qSjVghEkkddBsw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gS4IyV05;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.182
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C13E606A320
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 13:41:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C13E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gS4IyV05
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5eaaa9b1591so48665e0c.3
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 05:41:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794145266; cv=none;
        d=google.com; s=arc-20260327;
        b=BNSyKeV2YfHowqYNn9AF03X9YoH8QNJ2PK7SLrRkY0L3/+NwQXu7EqTcRVgzvmLweY
         7Q0rDpuzc0+ti1kF5cfvHHM58WdntCVf7ESdiNWRI1HldP8LIoekixmWif4ikhQbKLE8
         kddGpOphjOvQssYHAPmzMT9nriyzoxPt7GVqAQwKnXW9NwQjNUhGPPfq2WErq/SSO1d3
         Q5lEwC13il5bQ97jN8bUcSKCoUxk8M78anTw7dZ3IX71TY9VcDIVgnWKcuiB9IETDYS2
         tT5Vfw4mHNR+LRYPuvnrBhnrzcAzxw+Pjhecvac5uamDqN0V1kCruQu7hIJ0RyNDaed/
         Y4qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LCOeMKTokO+IsyFo/KH4xhEDHzKKObBmSarGf98ko18=;
        fh=xiI7ZkyPtiEk71c+UJs6VNgVUIrNpPo1DJib9QlOHpk=;
        b=ikLOpVCyJWj0xxuPT8zA9xZip35rfO7zNH6wA8lSzbyZLln0XpDm76dM9CvttDyEHf
         1vjz4Jkc406lmMn8T54wcKOmPgLZgYivqO0l6UMbKkqGf80CHM0gvVlrDRaaEP9q4BVC
         G1r+aAhRjyg7Y9tt2/I897iIWcsg2tX/lzzku+rT4hllQhnH05H0CEMNO9XKittnjK5F
         G61ms+hy0t9E94yxSs/e059CiuZKGt/3hcZBdU/CF8wgDyBxAmhqenOkQ4QcirbUARKN
         iuatRIydyJqhJuo8DqaqpNt7rVRbKoprMewPgOdAMK06uMxsbCL0SsHu5RWuz2EgGKh/
         qsKA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794145266; x=1794750066; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LCOeMKTokO+IsyFo/KH4xhEDHzKKObBmSarGf98ko18=;
        b=gS4IyV05VkDQCzcaj0cH60rzqPOTwC6Ek9YTcFN0sKygzYdNCgqvPCQ+PjGLj+iaOf
         Q49i8VsT53KXbBrEVbHw8jqpLi6ICZGlAi40SrXglC2l0oHF9f7r7Sh40F5tmhr5L0Kp
         TvoLYWozlenwobuTVNR00Mwp41dmm0+/wMs4HJnAIiNhX09lW/0VOL5l7Zzc+pUeBuCB
         gc4bkxR2Xli2wgfF7vqkseoE3XpxzWbNuNOEUCFyVz6YYj+nfoD5DHiRq1I8sIcLfHz9
         XGYsSx4bxvnSz49ljaRWXMOW7wkrHsGJmqpO8QWi/QqUGroAV0QTVRQUlt1v7yzVBofZ
         3RYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794145266; x=1794750066;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LCOeMKTokO+IsyFo/KH4xhEDHzKKObBmSarGf98ko18=;
        b=MTnZc73l392rUF6a0hkWLktxyad7NuWIHYWJUy2YqVeGQRKdxa0n6sKMCkzJAikMJn
         ZsjyEq2IePeTnUEpuGBUZ2eXAtBhKvH63VfkWX+mIWG50BSbMZ8nefQF2wabdk7G8W3y
         BaKWDqtoqaNORBUrzDW7iv2VUdqkINfWsI43O0De3oQH/q0IL2DwUcV0PDxV51z7pXVM
         sClbzHbxxmXtiNsDV4769nYsEnwiatALk+lpmSabQcbIud7KZclF8UaFgJ6TJ6TDllcg
         37eW7mv2P9JmRm3pQ8FrCHuugLmhrAG4iFJXLrfV5/EgOcM/dqvzO0cwiho2kPrxKTbE
         t/4Q==
X-Forwarded-Encrypted: i=1; AL+hErFUUDEd03IiOtuhLdHWXahpOVocMCZOWTUxtn+LdDIHEwDO6qamvXvuf2aTHn95EDrD9PczwWaLrtTNfQ0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/lWyLJNS/VZHBe+WiGsyqCY8KIHGGloB7K55llVxAdJY0hWy1v
	fXxDDRpD0LJ4gGwApvlWvK+I9sP/oZTb8IqHqcg1vqxRr3Z4atPFkrfkJI6L9IqnWLAaLquTney
	0n6pxyosUrHOIVm9Yqq0UFd3E9ebH4FEbIWWKKYk=
X-Gm-Gg: AYBFou26tY8uowXnekfBgduyHq47VeRX0IiZ7CpjxT51HgWwczANiMHk30yLCtgia81
	ppf3uaE9P8T5PVrqiSpy5DaOfGFWzNuyJFx+WQbOD1Pi+7lwOZazympfdOui3BnydVzQuw+IVZV
	6Oy4Giiq03TA5mML4fO+4p8PNPSKiNOYUPTQQlkE7ZI4P0WxZ0GitBfPpf///FQtcIpxxalxXLm
	/IujvRoYtmrIjSU6WF1ZGdx537G1N/24KN230/6e5MzV4yWKcxaC9/YFGsTXEfo7eaEJDRqRXzO
	vXuvu2tjsAB7wgPOrj+Uzfte6Kne5juRPMqbqyePNttaqaeVN/Ij+Co8gDQbmFtma5NF8jkPZk0
	ppiql+lnP1+4DXyQ3trAMMTPRKw/1j/Gpr/VBwHY/t/w7Ur6HRPcoyXbTmsLWFy5L1cmeN+PSAR
	Z45A==
X-Received: by 2002:a05:6122:e22f:b0:5ea:9843:fc3e with SMTP id
 71dfb90a1353d-5ece73577e2mr520167e0c.19.1794145265452; Sun, 08 Nov 2026
 05:41:05 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260928063824.1386524-1-morbo@google.com> <CAGG=3QWCmQ+LVvn2dtjEauj5WFwvx=pvg4Q6man_A2imdjRe7A@mail.gmail.com>
 <CAD++jLk2pFCpbpGVCQg2AdrwQecpb=wsehhwSuwTbKAXNeyfoQ@mail.gmail.com>
 <CAGG=3QV2k-nsZHNSuKEixZb+-LcxvhQsG379ghgyOpiDLTJWzw@mail.gmail.com>
 <asNuMzqz3G-gmIiD@google.com> <CAGG=3QV1eLy-eAfi3Q49qwMw_Yw-BJ1tmd3J=SLJB_qWrx4bNg@mail.gmail.com>
 <CAD++jLmR3hmEYN+-YCAcNq_0Zk0=PijS9jhGaMppkNhvbs90JQ@mail.gmail.com> <CAGG=3QXRPh=3rYyEHT0kTzDZ4omeHOjmN3OZGy=5hupday7jyg@mail.gmail.com>
In-Reply-To: <CAGG=3QXRPh=3rYyEHT0kTzDZ4omeHOjmN3OZGy=5hupday7jyg@mail.gmail.com>
From: Bill Wendling <morbo@google.com>
Date: Sun, 8 Nov 2026 05:40:48 -0800
X-Gm-Features: AclHuK99orI-zbieegQi11J3FkK91V4jpIniTiB-SkdXEhfbglSkI_1dZl_-EBU
Message-ID: <CAGG=3QVi4ZrxRPT=9T6jHms3q6n+nTECPn4ybiy3CU7Js_U-Fw@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: annotate struct acpi_gpio_mapping with __counted_by_ptr
To: Linus Walleij <linusw@kernel.org>
Cc: Justin Stitt <justinstitt@google.com>, Bartosz Golaszewski <brgl@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	codemender-patching+linux@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 8, 2026 at 1:18=E2=80=AFPM Bill Wendling <morbo@google.com> wro=
te:
>
> On Wed, Oct 7, 2026 at 4:19=E2=80=AFAM Linus Walleij <linusw@kernel.org> =
wrote:
> >
> > On Mon, Oct 5, 2026 at 12:26=E2=80=AFPM Bill Wendling <morbo@google.com=
> wrote:
> >
> > > I sent a patch to add `__NO_COUNTED_BY` AND `__NO_COUNTED_BY_PTR`
> > > macros to prevent this. They're similar to `__NO_FORTIFY`.
> > >
> > > https://lore.kernel.org/all/20261005102518.2400984-1-morbo@google.com=
/
> >
> > I see you are hashing this out with the right people, thanks for
> > going the extra mile and fixing this properly!
> >
> Always! :-)
>
> I'll ping this thread once we get the problem solved.
>
Hi Linus,

Kees' patch made it in and the original patch now builds. PTAL.

-bw
