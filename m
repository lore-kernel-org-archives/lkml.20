Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794559758;
	b=t0TBAJRhgHEmMhuKDKFM9/aWSJh6/z/9L9vN6tnclxyQ0zBAW8yjkQnz/MQmWFcnoq4e
	 X7814iZKikZE4nyL3yprSJHBPJn9Tm2W0VRXO657HFf0P5+ct+CeTLe5qnYzHZNFNq98l
	 glskYDNsGOEVXQgMH+ThA/3gMnXAzmTOpiOEUaLvZTicaQ+zwkpq7cZeqqg/UIGWQ1SvZ
	 Hsvjl0uMjFnTpOgSJO/wtcinzpI8ic/eGBBGUEBv0u1E6dkJeyTB1vyfMzj4qAyuOVJlA
	 oZf7I2/9CzvHJAQuZk1zcTH2HBcSiOoKfIQRdMYfAm70+lntKn4nygkFHwrvYOdXRhQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794559758;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=+m7C9jEiQGREhPmCD5/tizzUJjWSPHO/ikKHrKex/Q0=;
	b=YidcTJP2G/yOHDmmv747vy529jy07p/3GP4mjCK31I2q0ZKhaJT9osEX9b9UXwICF+Cu
	 Ss4tRwJBM2RAUP/L5YyVustNMC+kgl31J2vd14Cmtz0hqHfDuvj4R6KjxbZ9txF9QRgkm
	 yrXEe/bt7KIKTJYU0D/+O6yS+SFEMjUtVM9Exj5LcT8ah8b0tMEu5aUTXdmIBse6zdpNi
	 oWNMnjAJ/o3YKiu3M4TcW5zz9e8TAQiZBYIJmi6zKWnfACHKrqEEnsG2ZRiRFoCvXICu2
	 cYXajM+GURo7AEaiLtQtDc6M6c0bBUWBiwZoZpRpitJhlgifJ7415UifHKrZGqY5VeA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GC7L9fWg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.177
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08941606C188
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:49:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08941606C188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GC7L9fWg
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5edf97136aaso1105269e0c.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:49:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794559757; cv=none;
        d=google.com; s=arc-20260327;
        b=YVix8FiCqXee6rM9lbbSn89W6SW/0uP5Fh54iHCn0eUTJHNIeYDNUC4r18YgVUrl06
         OK2N6nzdgW46ZXgW5eG8ynnUzPjF/egsqJNVYWGb7d7LLAVWQ+JDU79XHh0BKnehooTe
         FF0KcVpvd0sJ7zJ0CPJIMXaFr5/NISCWfTOIr4z9SX55IT33QyseG1yVRptamB85YL+E
         lO7eR+73tECIZHFTVtVT+xT5xBQSp+St1+kVn//rMb0l/JIsCf0Ydo34SQHvA67yY606
         g2QPHQecEgjKN/Kcrh+YtJ+JksCWpR2wy4Z0KqWwZ601LAYqyS6Oga9/mQEyDIWX383L
         DiEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+m7C9jEiQGREhPmCD5/tizzUJjWSPHO/ikKHrKex/Q0=;
        fh=2iML5WRwJ8W80BKl79wfJi6XuJsy/hYfCl4oBbdSfpg=;
        b=gwuAJEgV0vY6zyL+99u8B/iOEMRNDPXl39uU1TxDvxmkx+uyreAFTH70qgiWJAu/Pm
         5kGBrKIGj1LUMRLfzT7c6hZ9bYWCfk4sZWe7upQY5odSZZpInX9MecavO1c8GcWZiHEF
         IpECiR1QHFdOOS94MrxuwLYJPRl1L4lRWdsXtyyOebDOYEtKXCi6tQ63EnFcKKpRmTXz
         zq0gamZO/9i7DfKpelC+G/a/Ffx2HM4K77QcGhIKsRv3qdlqu3L1Sf9ipF3k79vn0lKs
         6pQIwdJAyQBZ84gRap/ItnRF1oJ+nz8b8iwad7E49x7ycuyGkQj1xqmmcvAy5irb4cTB
         r1wg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794559757; x=1795164557; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+m7C9jEiQGREhPmCD5/tizzUJjWSPHO/ikKHrKex/Q0=;
        b=GC7L9fWgX+sUkx69xdxKW9ujedjOcpBclpIKhg3eMM/AOUR5kOaOs4fpxevHGhvocy
         MD3IT0lvR9dCP531LBR5tnsX6G0dnDjnkCcGSGcmbCb1oY823FnAqMJxSfsDEsqe5LWn
         QsG73qHyL2qsnwMf5KFxX1pPbGw+yuO9kK96TDan6zYB2MNdkmbWucE7lQW9punRe14X
         baKcIq+oRTMyUqXU9k8fxcqWXk65wM9CVLexhPUOPKFTh2lWrfQeZ7cF8I2R+8gjUrLa
         t1XCLn/+kUXJGTYpSEIIdaghyk4dqv43uCUf9jZw0wybERtIna7rovy7ulZ0lMCYVgyv
         DAyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794559757; x=1795164557;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+m7C9jEiQGREhPmCD5/tizzUJjWSPHO/ikKHrKex/Q0=;
        b=ZO17FFXqgZ1/3nO1rBM/pGbsukRmrE90D8SQu3ddFLKsTc1VnpX4Z25DkfKeOwqagp
         DoIu9MrEDaiAzF9IytPKr4RvGIdk08AkZK9QU8TZsw0UovJynif9XZkX9+MZ9ixYdYev
         S8KKqQSt5OkvOGH+65gREg/MFstxhkokna9SkaswhIi2djAnPMqHrg0DDKtWo1cOnII5
         Vj9ai3emTZT3k8/AHWMW9ew/W04Cl6zm0mn9Sb4PpPOh1mccMc9BQXRj1olyPGC2HoCC
         9O9XQeRCARRwPfGOnVP3QPaKC7JhVVXDhfJH/29iMRbgSq/BzPFAAIgj8MsydwX3cSgg
         ww2g==
X-Forwarded-Encrypted: i=1; AL+hErGhba+dSHS0D4YHxYfh1x6SxrJVOuoo/B+h3EwBRS6OLGQ/7BGerJGAKMjdI7f1GXh+wmA4bW4Pzh+byAI=@vger.kernel.org
X-Gm-Message-State: APuU4Z90mkeqqGAbmAEqQqG8Q1jxIRqPxRW1UFaltr86BOtoND3ysVDJ
	zh9jcnFmbAqzoc0FaRS3VJ6SNyv5ZalX4V++JLPQL8Dh3kUE9DDIG0pj8DK5BpSotXL+IXSIgED
	SI4j14UcR88BufbP+WMQ6p50EZoS2Goa8ZKvT
X-Gm-Gg: AYBFou1oFBeD03evFpPAeu+7+8JAuzXmGsgxs+xcI2/1a/wfILHXnIZRUqos4/IXnnV
	zgm8Czld9GekLXng6bW0j4IU3ETpXJtj8EKAuPDN0aBM4hmRP5K7u+GvDzzv/GwnQbU7Y633iu4
	wZWff2xFC9NBWjRJOYwcOpI/YH82dZ1XeypfmxQaKb1NGDU/tIKdnlG5doqMsuEp7GFh0KYsI4O
	2q4ApObkrTt8RgBpCEBOV/mpEb7CsjCHCLZUuim2jqi8ZwNrPF6Q5KQASqZDEXHzQhN1g+v1GGj
	Ev+rmiXMhzAOeiahuKJPUgkPosvJvK4CV0gzsNvP/HfdQSUy42BA9eeAtS56qJMiCNy5cFSrwV6
	NqIcnwpM6Bp4ycf+U+GMwZl8kxVoR1tm7283QJdb8O/9yNT42LAOVpczwlt5nC8/q08EIGjX5mz
	3sm/BSktsKPBBsRjwuVsgYN+heuKjyXCglVUAk3kAYXPq9V2D/vyvE2Ve+eZr+7lwxCZRy6LqTH
	d9jVe+skzxoIDA26a67QAJ0HA+w6TUN72BrFlP/cJ9x57w6HgdiapNrW4tmQIR3P4ve2hXV
X-Received: by 2002:a05:6122:e246:b0:5c9:a60b:e5a6 with SMTP id
 71dfb90a1353d-5ee34a9e41dmr605344e0c.17.1794559757009; Fri, 13 Nov 2026
 00:49:17 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1794333957.git.edumucelli@gmail.com> <cover.1794337724.git.edumucelli@gmail.com>
 <6ad67e4cda05238cd173c99e820a85de2c13f5fc.1794337724.git.edumucelli@gmail.com>
 <undine-1794538694073445946-7fde07ae541bfa5c@undined.local>
In-Reply-To: <undine-1794538694073445946-7fde07ae541bfa5c@undined.local>
From: Eduardo Mucelli <edumucelli@gmail.com>
Date: Fri, 13 Nov 2026 09:48:40 +0100
X-Gm-Features: AclHuK-vmNLEJaOSJsF5pZDaIAWiwZXOMTmkhYq1hDvBdCnM7IM3TDGCOE3tIH0
Message-ID: <CAK0NWSOBvfF1KA_BjwDpnj=TVYtWwifu=2qBwjPnmoxusXowbQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] tools/bootconfig: Close only opened braces in
 compact output
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: akpm@linux-foundation.org, rostedt@goodmis.org, 
	linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Masami,

Thanks for the review.

Using the existing helper as you pointed out it is indeed better.
Given you have already picked it up. Would you prefer a small follow-up cle=
anup?

Thanks,

On Fri, Nov 13, 2026 at 3:58=E2=80=AFAM Masami Hiramatsu (Google)
<mhiramat@kernel.org> wrote:
>
> On Tue, 10 Nov 2026 20:08:45 +0100, Eduardo Mucelli Rezende Oliveira <edu=
mucelli@gmail.com> wrote:
> > [...]
> > Extend the mixed-value/subkey sample to cover the lost sibling.
> >
> > Fixes: e5efaeb8a8f5 ("bootconfig: Support mixing a value and subkeys un=
der a key")
> > Signed-off-by: Eduardo Mucelli Rezende Oliveira <edumucelli@gmail.com>
>
> This basically looks good to me.
>
> Just have a comment below.
>
> > ---
> > Changes in v2:
> > - Determine whether braces were opened from the key children instead of
> > [...]
>
> > diff --git a/tools/bootconfig/main.c b/tools/bootconfig/main.c
> > --- a/tools/bootconfig/main.c
> > +++ b/tools/bootconfig/main.c
> > @@ -68,6 +68,23 @@ static int xbc_show_value(struct xbc_node *node, boo=
l semicolon)
> > +/* Match the conditions under which the compact formatter opens braces=
. */
> > +static bool xbc_node_needs_braces(struct xbc_node *node)
> > +{
> > +     struct xbc_node *child =3D xbc_node_get_child(node);
>
> Nit: You can use `xbc_node_get_subkey(node)` here instead of manually
> fetching the first child and skipping the value node:
>
> ```
>         struct xbc_node *child =3D xbc_node_get_subkey(node);
> ```
>
> Thanks,
>
> > +
> > +     if (child && xbc_node_is_value(child))
> > +             child =3D xbc_node_get_next(child);
>
> --
> Masami Hiramatsu (Google) <mhiramat@kernel.org>



--=20
Eduardo Mucelli R. Oliveira -- http://eduar.do
