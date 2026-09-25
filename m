Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3BFB48F836
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 12:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790340573; cv=pass; b=LH2V73jUviETkE8QsGlsLXsttGeG0R38bRYa/Bi2jrqcyGicFM0CatfOD+jMywxEivUygrE0BJb5Gx2Nc9fRu103bs7G5wBbI7a9N1h/z0JvAdSJtMUffaaQJDIqrD8ECXDMLqc9CmdhyGqeshBKGMtw5jMguzF4/urqZu+Y2wM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790340573; c=relaxed/simple;
	bh=xwK25Er/UyTdN8xX3u3ar9ULjVXabUcm1PASpwoLyi8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RcOfwPaVkE0J939KNAiorTguhP1GLTLkcqSVb5Ors6F1xkfu1WKOAnP2+CEMVZZpAfqoog5NGmJM3YqcuUtvEW7Jw3aRk6hNDe4Z/W9YvQVdilTL79IONUtRJqDxPftQKllsazcn3xB4uCqczxjZezVI0muQo4PvlyNFBem/akw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mAM68r6Q; arc=pass smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mAM68r6Q"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2ae61dcbcfso52220566b.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 05:49:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790340570; cv=none;
        d=google.com; s=arc-20260327;
        b=iVeoh3ob3OeP55ZJbghBskXyPVSxQ4EqWvRyLhV73BXk8jQilXXCIj2E3vFchqUOin
         H9fxdV1tgk7iFL09YfNbfTN1+iQKhglpKmm+1gLb1PA0mHs/DoZXh1XWnXPk5UFPTTFd
         mLf7GOlDV/JnPpXqDEBg2++byl159q0x+O7UMlnfpTnTczQ7U+7qVdWFhXof+36OdSCa
         jX5NNJBcQjXU5i7clLaP6pCp6WZX/2Iznhnlak9/xLbGWGoDr6ohSyjLX8xVF1AGmssQ
         I6YA6KXdSIbAw68jleRZ24pCpMPznE7JpEX47iIX9skAaPc3JylQh5VKqfqPbXUwWbJS
         QeGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TtIS8EApTnblvzoeUBrwBUCbydvF8aeUGatUpWHCCRQ=;
        fh=6xOVb6tKokhVyhXJuMNZoNoRr0LxGtCgU0NRioe561A=;
        b=c9FfxDitOiHXvfKCv+i3JSK8oh9RJZP6hE6DiBE+nM1cyzQCxhJpiKSF9yJzujxYVp
         Pe6O5nQTYctmOAYMdip0tI6Zg05l0zaYEsjNoCl0wOEUyURb2neExR7jZAzLaMpAJcRk
         b+urBU+RcNeleNt9BtJTzTCOBeED2N2hga8FBf0+ea659YB4HwJ7ACJTe6qrkqISPOAT
         5E1aEUVcq4BB5VB6OGAQT5lEQYrjr/ad0MfGR1xi9jHNbhtMmr2PI+pd8DIkq3fPAOGj
         FqJiSuPr5GK/nhv7Y83brvrpvv2o3LcEsfFloEy/hCmeKQ6+nn/ck7VZho8LI9ID4pOL
         QWag==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790340570; x=1790945370; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TtIS8EApTnblvzoeUBrwBUCbydvF8aeUGatUpWHCCRQ=;
        b=mAM68r6Qo6zTrbK5IrJhTyuUAOLpXwz//bpsm3QlH8JduNJNcv1WvqqexWjmsys5Jw
         FSAPUdLkYLe3ehyWlTmu4cybygdC41G+2K/9AolkFab+TucXJHiSmolmhJk8cgQOhtGh
         u/ZrHdBsIcW1W2fNgfOaNrBS1C11oHw5XoczSj2e9bkM4Te8jp7Q90uaFvRUE0vaZsQW
         dHpQs7XNSkK2diNwlQLnoWff8jC9wAUeMiHq8oa2ZUakyjjY1WSgrcYWobsbCKt4VZxw
         WycS4DwQY910VOsl00YU0sFpVCgbdulsrRMWh/IBHWCEImYYmgtVLi26L1NgSv9oAPRQ
         9eEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790340570; x=1790945370;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TtIS8EApTnblvzoeUBrwBUCbydvF8aeUGatUpWHCCRQ=;
        b=NOcd4vLEDHzvDpIUWaITssRJjimSR0D8l/Nw4Nz/68uXv2kCXTIw8u3S9/6M3Cqil6
         tsFK/Yp+HUje6VNyb/gjCvXhzP2ahr8Blbgyb+mtUDp8n0sQ2oCpDejdktGv+ba3WmGG
         8FXx1B1lnAqATM6iJTX0KUPpcmYeqamWAKcK1dLpfzvLomzKxx92ePc2v2cAgXUORiV2
         r9ywpRMmJvKAZL8MboejHWPxCEMg1Pq2s2CeYD/5xlajxeCjibMVWjXFS0VOEZGwfcL0
         al37yIYX/9UhKsExClxf5gYpX9O9Q7O9r48Lq5Apx8DnfttiRFvRum/E4k6EpKhNfIzH
         nkMw==
X-Forwarded-Encrypted: i=1; AKwUvBxU5Bk5odgd8jht22fxMA2odgtfQj7i7QCgrIHe1FtPg2hIHIoRGuNITrCPpmm5Kai8XMGzqT9B6ti9aKo=@vger.kernel.org
X-Gm-Message-State: AFuF++kRcGVmfHUTkEX4Q1wAOf2Hmbt/bhX+bcUIzNiE2ov8PgMg2rEl
	pan/CA3zRyIB6fzCLM+1VmVlD/0SN8uqVVqU0IfSn7fXAIFDNoYbBPIZ53v1JZpsL7nq25S2QTu
	Uz5bTRC+ZiBPkE2qgPrB1+CX4smujGUg=
X-Gm-Gg: AYBFou2maPWfJvSawL7lITqhip+H0CMWAZ7ZAzNeKjuf7V/1RzXkwWRvUudMK8ooCjX
	DEuD0GjYE9XhS2CF8WOsPePVNuAxTcK4LVGbJI77fiVELJJ9FEEMhPiaVMImDlkzggfkQogit8y
	m0LqmcI7LHuAV8QB9ocK6GtvK2/a7Wmpcqtf6UZDsXpuPdnyXGq2p59bck2Dw0yedlvz6aScySD
	RQxwPJYJIKVd7NkNwETBG8/7XrT+d+8lNflNvWeOWuT8vdM+apEZkYVFWb25pc13BV4b32SOY/F
	ipV3HGEXQoPPfKaQSsabv5DVF3dI76BGb2kz1GAog7fJUktebsRO6dqbwdi24KV0mBHDfX2TvTp
	i5bUsPdOaXoaJ+hNKtndnyIiH5YWardO/N/r5zTimpzoFunRCf69vAmrpK+R0kexiQCcTGR6AkO
	Y4Bh3KGXdpv7Fcq2pKUzMGu1SqfVZ7mXePruz5Xe69N7sZC1SYsbI=
X-Received: by 2002:a17:906:9fce:b0:c29:d0a8:79d3 with SMTP id
 a640c23a62f3a-c2ac2334081mr530795966b.14.1790340569589; Fri, 25 Sep 2026
 05:49:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925-gpio-organize-by-vendor-v1-1-8feefd60581b@oss.qualcomm.com>
 <arZRZfa7AmDxmwoJ@ashevche-desk.local> <1299262d-a9f0-4f2d-8456-bb40a3078f95@kernel.org>
In-Reply-To: <1299262d-a9f0-4f2d-8456-bb40a3078f95@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 25 Sep 2026 15:48:53 +0300
X-Gm-Features: AclHuK_kA9pocaktebhafDtwbGAICjNyxWcnIMclsLHy5_vqYuNz5aHt90y2SE4
Message-ID: <CAHp75Ve4hCd-WVrNvdmSOiCo8j0jXBbnvOvxoFh7-Rj1ctnybQ@mail.gmail.com>
Subject: Re: [PATCH RFC] gpio: move intel drivers into their own directory
To: Hans de Goede <hansg@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Andy Shevchenko <andy@kernel.org>, Peter Tyser <ptyser@xes-inc.com>, 
	Lixu Zhang <lixu.zhang@intel.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>, Mika Westerberg <westeri@kernel.org>, 
	Israel Cepeda <israel.a.cepeda.lopez@intel.com>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 2:42=E2=80=AFPM Hans de Goede <hansg@kernel.org> wr=
ote:
> On 25-Sep-26 12:48, Andy Shevchenko wrote:
> > On Fri, Sep 25, 2026 at 12:22:15PM +0200, Bartosz Golaszewski wrote:

...

> >>  drivers/gpio/{ =3D> intel}/gpio-graniterapids.c   |  0
> >>  drivers/gpio/{ =3D> intel}/gpio-novalake-events.c |  0
> >
> > These are interesting drivers, not sure where to put them
> >
> >>  drivers/gpio/{ =3D> intel}/gpio-ljca.c            |  0
> >>  drivers/gpio/{ =3D> intel}/gpio-usbio.c           |  0
> >
> > These are definitely not going to intel subfolder, they have nothing to=
 do with
> > Intel HW, they are against some custom external (to Intel SoC) HW.
>
> Hmm, those "external" SoCs are only found on Intel IPU6/IPU7 laptops
> and come from camera designs for OEMs done by Intel's camera team.
>
> I don't care much either way, but for all intent and purposes these
> really are Intel USB GPIO expander drivers.

Fair enough, I can move them in a separate patch.

--=20
With Best Regards,
Andy Shevchenko
