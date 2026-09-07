Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA03046985A
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 11:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788779712; cv=pass; b=NfwYDorGLkHdaKdGW+J27P2qXaJ0cPWfzWD/Dt1pOSIx+t/M2bDKtGItOg+HGo/uot1DwXhXO2yqb93lsmHn22iCNmuzuFewB2KYI3UQ/zWU1xt5o04J2d1zKHgAvN3hJ9OFEs0W3wOtafKDVals1kfRgUWc2txL9uTGxfoLRo0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788779712; c=relaxed/simple;
	bh=x3cH/EsPBwllf1KwSgSz5xGCaH/IS+9eiLnkhBU1LnM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wh2n9PrL5/qOn/vPiVfJt5sLEV6OPO85RU9pVVwAn53/jqyRtRQv/OWHvJ7Y6rV8RS91DU2UIFIhI6JnJmkxBIXAcB0pjaErXibyP8P2E2PinlQq6I/LL6oYspA8to/mftWJRuXX1mCXcnSy0SuiCn1kgN/jGdgsUPuZX3POKhk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UZBG8cd9; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UZBG8cd9"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66e4ab1b9f7so34459d50.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 04:15:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788779708; cv=none;
        d=google.com; s=arc-20260327;
        b=rUFM/PzytoVRB2ljmCxp7TP45X9f53KZOkrDQo5dz8KI0O8WqyhDOfJB1rWbDNsvt3
         oFeWqfr4tzQFYhu8Rnfow89c85MKKeKLOSAMlz+2UD8GvtZJH9Z3fiV62Ij9xB2wlyN/
         rNjEODRG+1QHb4z3shg+ZHg70dGIrVFbXWGZB+4E7oL8jRYkTFHO85off5LvVDHCbV2q
         eCJ6MlHSM2hu58UWs3QsfqpeX4VVefDvMmUYtUflv8X8z/4OPBKD9XStcMTGwDKRX1Jx
         +43DkjExKbXouq0OvBD3Hvffsl3LBu0fbrunYmWbxxmQGsxoGV/fJimcSNsMTbL/AzBM
         U8Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vlJQsDKMlYIU6leKSgzhne93Y2lNrrKfMYXmCpI2T70=;
        fh=mPxW0K0UXwVHr4auudyi3bXpTztyI36pNxL4b5+/nqE=;
        b=YhT4DM6SSRKcPg20coB6qi89A1kNWDFqePlsKq7GKIE3dxwyFhUeNltEj3O7oYzbWq
         uP6IyZCUaVzF9HD4cGlTKiynNQEJmMmD37qa3Tl59wNSgdhVWAgWlnurD6S+msuEMmQc
         phteKlVsKXVjaGYFa0zXUijNt3/9u2NwFBRetl59xcfI2Msiek+s8iK3l/qmSw+hXQLw
         ZFAycaZTCxh05Bvw8raRsAQm3p9KhRJ6Nq6vI3J2Zt5Q0/sIXvaM62qNTV9azUSXVgmH
         zQy7xMM7ZbRXqGbrsR+wpzvM6KWvJ5L0DDgH0xAISUIZY7xEHyTqbbMW7eBdGSa+NUrm
         WjeQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788779708; x=1789384508; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vlJQsDKMlYIU6leKSgzhne93Y2lNrrKfMYXmCpI2T70=;
        b=UZBG8cd9Sy4Xf3RJfgvTikjDD4FfqWO4IkcHGTdfqFdlMEtILCssyV5iZFjKWiMTBI
         MrZh7IugzJ2FKVh8FnQcfHU+rp3QzWsReDxLfL6/STbMj1EO2U/zxXU96qY5ksgHDBQa
         fP+4RcghzoJx987qx/Xfaixu67oOPxcuSTit969oj5thHLHJV8Zf91EYaaPK9XhTRbfN
         8rzbnn+8n8YIkaoVPWsooPS9v64h0ghW28U16I8YUyZ21kinVfnCq6jQNwHEXFI4O+Ep
         J0914yuNv8Wc9iM3ymS2HJLwvuFHNw2N8ydsQxlU65IuzTkJZIW1mc5GzY212hkcBk/l
         qdbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788779708; x=1789384508;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vlJQsDKMlYIU6leKSgzhne93Y2lNrrKfMYXmCpI2T70=;
        b=MQVuSH5LEUOBMpqxpr7A2ZkqLlnZnRk/uFJpWz4EFNU0lZflAO1X98G/LTzM7yCk7r
         myaxltvXk284FhLAZqkFMC30UypHzsBMQ4DCknTCp1PY2fi3xOdZLpou87zaAZY5ztYM
         pBpGbO7iNWYTQpMFrZFEK+VrCpxhNaWsO4LmBdyQvXSrH/t4MaBBJrdFAxj8b8Kluqni
         Q3xHYSayYSixXVpYXjLawtyjoR2OaB9jVFWrELeCgYwgUPXcWlxcpQXQ17R2j5zDAre2
         lNv0MS7puwIWTBRiqrfUgKWKU51eQbsbSmy52Leyist8+vAkhJ/nM2RG28RWqW2zMSzd
         TcVQ==
X-Forwarded-Encrypted: i=1; AKwUvBzbhF8RflYPeZ2fXCxXq8HauvEXU2cUNzNs33UjY4LCvbLC2Q0nXWn/NCFmOJQoBd5FiJvZP4Zp4reUi7w=@vger.kernel.org
X-Gm-Message-State: AFuF++na2Ag7CLJtcaUNcjpHjcTz2UEb8+KSDOZsARTBXqOf5hr21Uol
	EkTk+d41oy4I2drXWQfrA38814283K4KehFgTQsQu+hU6DcuT6V8fsaiWBEleHeAMXKcRUtI18z
	/OohiqVE5yrFPBzYH+bcPgMUXJNC3cgk=
X-Gm-Gg: AYBFou01tjlCx5gVhbZzvU9nxARWTl3nGpw8v1r4DdfGG+x4oVdN27z18jRQ7xDybkj
	L/GNXiDWuU3gq+Z7aMcw1xjfNvB95WtVsPxVhT6TC8r/oUIrsWdtDIEZ4/kjA1PHci5c/uib8lb
	96aQ9a8TOdBySRT6WBeHGbblW0difEjq6FbPvdcHkMVB7NIlO4DqXzLNLykGEVBI94Gksx8mbFb
	sS771PvGRsDnNBYXn2Db/qrj5HVe1ATmMAeUGqrJ501bXJFTGVSBEFAz2/WQFf4zPcXGgueqiX/
	WEWdFx6M0fxHAGsFn9IM4+lKx0cUT5aAbzs/IGcXyO2fI+fb2N3Kk8vjieDVvEso0wnzYUIeKa7
	CqkIHYRUHXg4VuIEHxHuem+gXI9j7yMyPS8d5yMBIZFB+3ddKe+v595nq56H3LPr5wiliYecpmg
	EuxRQpZiZb2hmnI2SSlVOLf/uFeb/3ldLe4Lku8fDPwRM=
X-Received: by 2002:a05:690e:4403:b0:66f:c1bc:404f with SMTP id
 956f58d0204a3-670f4bbf268mr32396d50.48.1788779708527; Mon, 07 Sep 2026
 04:15:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260827093948.2825531-1-lilinmao@kylinos.cn> <e4a2ba2e-c533-04d8-0795-e3d43caf47b9@gmail.com>
In-Reply-To: <e4a2ba2e-c533-04d8-0795-e3d43caf47b9@gmail.com>
From: =?UTF-8?B?TWlybyBLcm9ww6HEjWVr?= <miro.kropacek@gmail.com>
Date: Mon, 7 Sep 2026 21:14:51 +1000
X-Gm-Features: AcwNN1V5COwUc4nP7hlmxy1WTzJmRl85tss2dbdH15pC0LiCKmy15_QroF5u0Bs
Message-ID: <CAN5rfbSh9ZoUkReAqv9rHYowqKcZFa-Svy6LP-MHvqfBVhjdBQ@mail.gmail.com>
Subject: Re: [PATCH] fbdev: atafb: Restrict SuperBlitter to supported formats
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Linmao Li <lilinmao@kylinos.cn>, deller@gmx.de, linux-fbdev@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"

Hi Linmao, hi Michael,

On Sun, 6 Sept 2026 at 11:49, Michael Schmitz <schmitzmic@gmail.com> wrote:
>
> Hi Linmao,
>
> thanks for your patch!
>
> Am 27.08.2026 um 21:39 schrieb Linmao Li:
> > The SuperBlitter operations derive an integer byte count per pixel.  The
> > accelerated fill path handles only one-, two- and four-byte pixels.
> > However, the operations are currently installed for every external
> > framebuffer in SuperVidel RAM, including planar 1/2/4/8-bpp and 24-bpp
> > truecolor modes accepted by the external video parser.
> >
> > For 1/2/4-bpp modes, the byte count becomes zero, so accelerated copies do
> > nothing and fills fall through to 32-bit stores.  Planar 8-bpp uses an
> > incompatible memory layout.  For 24-bpp modes, fills also use 32-bit stores
> > despite advancing addresses by three bytes per pixel.  These cases can
> > corrupt the framebuffer beyond the requested rectangle.
>
> I believe 24 bpp mode can be rescued using something like this (entirely
> untested):
>
> --- a/drivers/video/fbdev/atafb.c
> +++ b/drivers/video/fbdev/atafb.c
> @@ -2463,6 +2463,11 @@ static void svblit_fillrect(struct fb_info *info,
>          case 2:
>                  memset16((u16 *)line, pix, rect->width);
>                  break;
> +       case 3:
> +               memset(line, pix, ((rect->width * bytespp) % 4));
> +               line += ((rect->width * bytespp) % 4);
> +               memset32((u32 *)line, pix, (rect->width * bytespp) / 4);
> +               break;
>          default:
>                  memset32((u32 *)line, pix, rect->width);
>                  break;
>
> Can't test this on hardware, and would need Miro to confirm it works as
> intended.

Linmao's patch: I ran it on a Falcon with SuperVidel at
1920x1080x32bpp, all good.

Michael's 24bpp fill: I cannot test it because the SuperVidel has no
24bpp video mode. It was planned but never implemented. Its mode
register offers 1/2/4/8-bit bitplane, 8-bit chunky, 16-bit highcolor
and 32-bit truecolor (24-bit RGB plus an alpha byte), with the
remaining code reserved - and TOS offers no 24bpp mode to set.

Unless I overlooked something, the fill also looks wrong on paper: the
first line is filled with a repeated byte and then with repeated
32-bit words of the same value, which cannot reproduce a 3-byte pixel
pattern unless all three bytes are equal.

On the fbset question: no, the pixel format, depth and geometry of an
external framebuffer cannot be changed at runtime here. fbset -depth
16 and fbset -xres 1024 -yres 768 both return success and change
nothing, because ext_decode_var() only validates against the values
from the boot argument, ext_encode_var() re-derives every field from
the external_* globals and ext_set_par() is empty. Only a reboot with
a different atafb:external: argument changes the mode.

-- 
http://mikro.atari.org
