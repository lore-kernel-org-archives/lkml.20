Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1922340A936
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788520620; cv=none; b=bfun1JYkI1HNE/uqBHaMMQf3i4FnUksq/IQWSsuoF5epakJnFre2DtJuvV9mjm+pnmcZfHA/kefvBuSjQyf0Shno1Xo90LYluvolKZpCU/g9S2TyHTDny9LyAV8O/bjKNh3xyGaq57SH81mHCaq8b9KDJD+Q6sH89vQ4nadmuaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788520620; c=relaxed/simple;
	bh=V06IaIi4jTJzj1JK9gqz8ZBxdNpdoXx4g6Xhk1QdB8w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hT+pxyGuTp8iTOp3iXcwfljqJnCWZnfYp1saz6mZxc8H7CUg84YEs03RwTztDHYjnkc2NTYhRr+Gw5Mr0hrIJDVC8oGvBIjUceQC6E1E7fUc9qGdZ2jeEd2RyZg0eK10b5LQpoDYw2nDN8h272tq6RGXkVaY6ouzOaz8oJEFHoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-7466771f1caso289666137.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 04:16:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788520618; x=1789125418;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bKz0EbNXKgkRmHwAjHcE4su/TyTn7raXYOe8ludN9rM=;
        b=VmJ9gYoK7TFY6doCKf7QHx2cUmBNibkOHwt6yChLWuZ1qheRusoqGoPu3n4JKHH89Q
         ZllqMG6Ni3xQRIoLfDhPiDulGFdw4cAT1o5EyLk/xF51Ada07jk+L4C9/tRrmgGHERlg
         rQ5OuVFEYrCuIph9kTFqd7S/B0ekY6iACVEuMQTh7GwGM11m7vcaFcEyAmlQsSNXhJ7R
         BjwU7KjcmX579f+JFSUNIcjopCmZt6G0pfpOp+iFbnBDsv+HhJ4sCHDVkwj2P3GbjOO0
         zbuY31dv5uh/k9g2OEmvPjoOEWz5Kc9X1had2pMl/uy6wkxFG4eRIdJaQ6+3s/RwjALR
         LUSA==
X-Forwarded-Encrypted: i=1; AKwUvBwj/ClWm3154sxEwyO89EUyQGK5w6UA6pTPNhvJjUs6Vbf7veNAYlFoyPuMeUqpPlDxYKkFKxSi+KKEXeA=@vger.kernel.org
X-Gm-Message-State: AFuF++lux78Ngrp+FwXRWtJlC6EnHz5ywIBw7rL0DoZa1ZZkojQAeAs2
	dmrmBE2bcGG1aJRht7sJdNjzHY6bG50PMVTToQP98yT1z8DcJsSdGizMKP3aGTpWL+Q=
X-Gm-Gg: AYBFou2QkafOP55tbYKxGXS5k+9D01RDkueZ+UsMbepsL2UD0J88neUQP9Rwz31d3Iw
	ERBdBsx7+B8MI0dCo+90hfo/00f6xFjWkDiwDDhgypIA0P+G3DfJhE89LkO9EMpP9TLP3QR4Cud
	wE6SQgbYR9sHSgBd/RuFxNtRix0JHEBVl9rIVhADx1i4nFud6f9opmCZDvS7gpQBZ238xUTtoFI
	ZS8cwaZtH0dceAi43oW9uA5zV5//x04lk8W0TZHlFD1mfEI8nduM65GA+CSuY8k4MkMqUNkx021
	kae6AwKBjF2g1RWVGfdxUmgMZz5w7J3UtYwmikz0xqFnmZKoe6IuTk94Otuod0V4dE/BP7y7eoS
	wN1PIAqFxnLVsLTX99hdeVJ19SrwPz4ZDpBtzIDAcNaTAbIU4OeRT1eJ4Q/7Le0M0CltUbPDUcY
	WTduE8xEDIiYTW6DhjfE5aZFUk3MqVxzz/9TUX00BsydgrOuJnasVPVgszN9Iyx5mDAYzZJmBLM
	P+NhRGXIHBM8ENAEXv491qa8g==
X-Received: by 2002:a05:6102:534e:b0:77f:fb50:8822 with SMTP id ada2fe7eead31-78a4a9106f4mr1237819137.7.1788520617823;
        Fri, 04 Sep 2026 04:16:57 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9808eeb22e5sm1301952241.12.2026.09.04.04.16.56
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 04:16:57 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-74ab6c88052so289608137.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 04:16:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz4Y8xMC8bbBqGZFvc7zMBl1QNLNCq7h+imCIwWQnZmdD58XbMOO+3ppHSGftxJdeQ3yoYsyaz4GJgvCT8=@vger.kernel.org
X-Received: by 2002:a05:6102:6b01:b0:77b:b14e:b670 with SMTP id
 ada2fe7eead31-78a4aa0794emr1096677137.8.1788520616710; Fri, 04 Sep 2026
 04:16:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902-rzg2-sr-boards-v4-0-4a456a422fee@solid-run.com>
 <20260902-rzg2-sr-boards-v4-2-4a456a422fee@solid-run.com> <CAD++jL=fGonMHd0jitwAE8+w=JYPX_6YFW6CzS9kRZLbx3045Q@mail.gmail.com>
 <0435939c-2836-480d-9ba2-8de4c5e22cc2@solid-run.com> <CAMuHMdUE3+qBdy2CoSQMzJ1iePiv0PSTfOjxHAqgp78i_XpMPQ@mail.gmail.com>
 <c0a37ff2-b133-4bd9-82c6-732f58e2c5ec@solid-run.com>
In-Reply-To: <c0a37ff2-b133-4bd9-82c6-732f58e2c5ec@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 13:16:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUOqA_mNQ6-+rxcTxiJSWDBQbiaLqYAtVEko6T7DLgOdg@mail.gmail.com>
X-Gm-Features: AcwNN1U-uc-LOk3gvbh_6tN7N3DFNnBp7J17BKaRTYV7o3lPeDqXkvPWiYvEkoY
Message-ID: <CAMuHMdUOqA_mNQ6-+rxcTxiJSWDBQbiaLqYAtVEko6T7DLgOdg@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Allow
 input-enable pinconf
To: Josua Mayer <josua@solid-run.com>
Cc: Linus Walleij <linusw@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benjamin Bara <benjamin.bara@skidata.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Jon Nettleton <jon@solid-run.com>, 
	Mikhail Anikin <mikhail.anikin@solid-run.com>, Yazan Shhady <yazan.shhady@solid-run.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Josua,

On Fri, 4 Sept 2026 at 13:14, Josua Mayer <josua@solid-run.com> wrote:
> Am 04.09.26 um 12:12 schrieb Geert Uytterhoeven:
> > On Thu, 3 Sept 2026 at 11:23, Josua Mayer <josua@solid-run.com> wrote:
> >> Am 02.09.26 um 14:58 schrieb Linus Walleij:
> >>> On Wed, Sep 2, 2026 at 1:50=E2=80=AFPM Josua Mayer <josua@solid-run.c=
om> wrote:
> >>>> The list of allowed pinconf properties already includes input-enable=
,
> >>>> but has omitted input-disable.
> >>>>
> >>>> Both refer to the same hardware property, setting and clearing input=
-enable.
> >>>>
> >>>> Add input-disable to the list.
> >>>>
> >>>> Signed-off-by: Josua Mayer <josua@solid-run.com>
> >>> (...)
> >>>> +        input-disable: true
> >>> The Subject of this patch is  "Allow input-enable pinconf".
> >>>
> >>> But what you are doing is allowing input-disable.
> >>>
> >>> With the subject fixed:
> >>> Reviewed-by: Linus Walleij <linusw@kernel.org>
> >> Thanks!
> >> I'll fix the subject ... !
> >>
> >> ("dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Allow input-disable pin=
conf")
> > No need to resend, I will fix this while applying
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > i.e. will queue in renesas-pinctrl for v7.4.
> >
> > I will also add "output-disable", which is missing, too.
>
> Thanks!
>
> However I am ready to send v8. If I drop it my series will fail dtbs_chec=
k.
> Is it okay if I do resend it, and/or should I wait and cherry-pick your
> version
> so that it is easily dropped while applying without conflict?
>
> Or drop it and live with failing dtbs_check?

If you're ready, then please send v8 (and add "output-disable").
Thanks!

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
