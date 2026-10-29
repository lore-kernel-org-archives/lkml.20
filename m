Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793263559;
	b=1/Hnv3hXlzAH33Fd+UjsfzzBDswWHLkomSqOQdVmWIi+RJNtEDaqxK2OFG2v5iGIg2tZ
	 FDH1EPP7SIUCV9pYEmBKcFE+gIg3+1Xlb7DUVJzQ2T27I1OLx3qrsExB0d2Zsqa15LCZk
	 V6RN1K1gVJBdsW6/3HqYRTztjfgKYW5SpndEU75fuXcz5pdsF/W6rYjHnIb61ht8UdaD1
	 bTsOAspGW9lL3Wufz2h0UW/s6XNWZmxglCtvvqB7H1zVA8v60TkLR57+GzvMlH2/gzv/u
	 MrrStQt4lZm9zV0vFvwoLQTZSklefKxRbg4+O7qZi6cV++xCrql9cQlcs63cDyLB1aA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793263559;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=PAqiTMoWWwPC+iS0a6+A9B2UUx92tJTBgbIRi8GYKxc=;
	b=h735s2/4G8+QrJ4dqfPs2KbDYWzSWiHTSqcKhxu4Vq7x9coSKE3v/QS4tRGbICqCPXx0
	 j1vo4FczoiZP6YqXM6zJoF8K8fEPFO4sMu7kmiOUwqBdfWkTrD0LhVHB9CI8fc1UXqdj4
	 75nkBM1udZitdXguymwFzeqR9G3ZXRSaiISfwGn4drsoyYzS7nA21PzVD6kQHiZ4UukMt
	 wr57Azm/XOIQtK/smSWnyrGNmsgQ1+7uUZMwnvOo+3u7nzC1c7OUkcEynzh7XvM1B7GZp
	 C9oHUbVbBZrTEg/iFrgaftBtW+X/CTKjMsKvgzE1xrA4jljmPW9GtVLIFTPb4bOxKdA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=au0UfRoZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.52
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2322F606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:45:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2322F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=au0UfRoZ
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-8470d7d430fso849900a34.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:45:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793263558; cv=none;
        d=google.com; s=arc-20260327;
        b=bHN+DKf84DIm+8JFz6jmZMEx8x07SWzcBtgV7cCCoWymeZKlC/AWT3BBZDsjFximp2
         0J2hZ0GOdCsBh9JSqBauP/Mm5Yi6x4PjQkaxnGKAWzfWyrDZMp5Xe7ZFNnMSeODOk61p
         U9tFWb3D5uyCOBdrLCHqyS7iR2PaIOZ8Ant5ZVLdA4hftvCjn3i9LYisAlJWrUQmN8le
         tgKUEc6Qv5XJAY/cDL0kpdK252VSjxLwDsPvuL6W+XNXIkz58OF91Cu4ToeIrA3I1zdu
         OwV8ui8nZ10WSIk6FeWs3cZBJzYGbAPFOp429fIq7pfvnH2qXqBGZPArluEXCFVJG9yy
         K13w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=PAqiTMoWWwPC+iS0a6+A9B2UUx92tJTBgbIRi8GYKxc=;
        fh=ztpYN5f53DNTlQrfPU6SqENMCwbfunfm7haWtlFEmMk=;
        b=C5sUCq50u0ekhdJVfT1L/2TRRlSgCGmbiVIXZ53hJyUejFcVhFcLKQKHa4YgyHr/tW
         tQmmDhVNoxm5O6USk30LtNoTUoAIbeCtKs7xbeAA98p3/5P0aeyHDHqkqvjCzxgJO8TV
         LdKeCiWTvfui82GxDqeuSwCCicooTVbROYC3EAVBDhFwF5zXnJLIAP1YyOMVTC2JMfWp
         IlSvt/LDjk5o6zhvLsdsbuMNAWPFP1ZbFK756gC8eweT8iwPgyZvfugipl+Tpn1emtcQ
         HeuErlBYduYTB9lCoBrN4TqlGhYadTepWoSMgKKwa7NISiWgcOeVKpnhkDUIw19mC8tI
         MvtQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793263558; x=1793868358; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PAqiTMoWWwPC+iS0a6+A9B2UUx92tJTBgbIRi8GYKxc=;
        b=au0UfRoZT9OZ+PogXKMiA/a4a83jjA29tx9LOXcH9z6NDNHLMfjOwwveXDPGNs2LCK
         I2hkmGMaPmoMZZnrglEFIFGXRWYhyGowSoMs0ZwlWNWYIJL5VqKo2p67y4Ni5ouO9+xj
         AUBt/yhhEV0Rjots/ox7C5fw/JvfzQMQ6qLqbbc1nP6ijbLbGUoa4cSyboqDSsCTSSPp
         SAWcQFZWU2rvqV44Igv+sGf2zpyt/XU5ylZHGjYwPEhK1Gf4rSj6phkcwNpjQSWOUUbg
         gnB+obPQ1DJMaIcPgS5iQatWb0gpH3K1SP41tpP4rcxE1w22oXLjG0w9tlk+j7Ct0KiG
         f1dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793263558; x=1793868358;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PAqiTMoWWwPC+iS0a6+A9B2UUx92tJTBgbIRi8GYKxc=;
        b=jmYJtD9mOZKzBR8JdyW0AGtYi/k9tnjAjIhLfEY0XGm7Xd5YDmEVOCsJvnQFzoGbmb
         MFjwKEyWhhBHuaHOs0MqbzJVw8c9SXcV4y7sC1Bi+5U3NT3PX9m37ipqnUFiY/2L4vPa
         +sNOVv/b98YdMqO0IMOiyp2A4ahkJgrzO3OyxAe1RQUd9tchCoC1aesvN1V151Wh4HP3
         p9CAVCkhurp82pFhKAbL/STmLeF5/K3QmUe8oQRSHCOBPQDN4lEeBFI/zDf3p4ZwPfwB
         pisZ8zb7TVCGCTRIb9lZeLJ9zX/uT/i6jVR7Y4nuy/Mei/LZEV7J0sLi38RyQxfHBr8t
         Ba5Q==
X-Forwarded-Encrypted: i=1; AKwUvBxIYRW3BKMpgzVD020a6y1EqIrVHlcUHUQPMIb3iIhZGZU630W5KFtNbOVlEK6WK/X9TmKakCPePftrf6E=@vger.kernel.org
X-Gm-Message-State: AFq9FYKZnvSot/POsDfAwDs1gHQpmonedgLMIP6mGXuOB8Dc0jm8QJJ6
	zS9iyWW1xK3z7bn0BGT3NxkmnNSq1GiRSqA1gKhGhzEzCS1XVknK2J/ITy1ZXBgHUXxh+pyQ6a5
	ZPS/Cs+hY+PjOdLfFNQP6t/ALS226Y0YShMfsooc=
X-Gm-Gg: AYBFou3ySV2jYbaEr3ERx3EFUWjGfTRkyh10i40JSLtL7ob0I4ayvBrs6PzctDB1yfi
	qXcMVzfiCapEiKLH6ytSMS0LKFnNLHuhTAqbB9TGbaPdPOt1QS0fQPFpXJk+taafDwrHnB7l67c
	qMjrgktRYAd5McIkbk8oq6XpB7ezwXj5mSBvAS/OqvIjfBJzycSO0lrSDuR0Roi9chOQcCwptKU
	ipcLNQXxG3CLjqtwytFCiS8+NAXw+f3h5nQZ2/Tg/pgzJKaLOVzXLradpCVwAedQCqitFHKKA6R
	MgJAso9WAU1ETqTu9y8Tf9vVMCVaEaCCVJx+9LSFAUrCrU4y7+sl00LGNb4bdsZN08j8J7YclaM
	r4ZaXXStFOxRtYRiRN1cpnZH7qkJIzF3XcxQB1ieFnW2CEn4io10/F2MTLOcxtR+mvxNCwv0=
X-Received: by 2002:a05:6808:15a4:b0:4f1:5068:b95a with SMTP id
 5614622812f47-56382c84c84mr2564899b6e.23.1793263557980; Thu, 29 Oct 2026
 01:45:57 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027073719.4010659-2-thnkslprpt@gmail.com> <undine-1793236109048848648-013753fe98f18601@undined.local>
In-Reply-To: <undine-1793236109048848648-013753fe98f18601@undined.local>
From: Avi Weiss <thnkslprpt@gmail.com>
Date: Thu, 29 Oct 2026 10:45:45 +0200
X-Gm-Features: AclHuK-zrLquvdqJ3SzSpP7uOV6gERwOur8Jmu30wRw3AWJ2QAkVsioGlaIaVTY
Message-ID: <CAKOB7-ZixMNzdcizYL9Re+zp1HMO1kfr87PHytAmwmBOx7zKEA@mail.gmail.com>
Subject: Re: [PATCH] init/bootconfig: pass init arguments in documented order
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, linux-trace-kernel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Cool no worries. Makes sense.
Thanks Masami

On Thu, 29 Oct 2026 at 03:08, Masami Hiramatsu (Google)
<mhiramat@kernel.org> wrote:
>
> On Tue, 27 Oct 2026 09:37:20 +0200, Avi Weiss <thnkslprpt@gmail.com> wrote:
>
> Hi Avi,
>
> Thanks for fixing this! This looks good to me. Let me pick it.
>
> > start_kernel() appends command-line init arguments before
> > bootconfig init arguments, while setup_command_line()
> > places them in the opposite order. As a result, the
> > arguments passed to init do not match the saved command
> > line, reversing the intended precedence of options.
> >
> > Parse extra_init_args before after_dashes so command-line
> > init arguments are passed last.
> >
> > Fixes: 1319916209ce ("bootconfig: init: Allow admin to use bootconfig for init command line")
>
> BTW, the Fixes: tag should point to commit b66fbbe8d482 ("init/bootconfig:
> Reorder init parameter from bootconfig and cmdline").
>
> In commit 1319916209ce, both setup_command_line() and start_kernel() placed
> extra_init_args after command-line args. It was commit b66fbbe8d482 that
> reordered setup_command_line() so that command-line init arguments come
> last (to allow cmdline to override bootconfig), but missed reordering
> start_kernel().
>
> Thus I will change the Fixes tag as below.
>
> Fixes: b66fbbe8d482 ("init/bootconfig: Reorder init parameter from bootconfig and cmdline")
>
> > Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
> > ---
> >  init/main.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
>
> Thanks!
>
> --
> Masami Hiramatsu (Google) <mhiramat@kernel.org>
>
