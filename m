Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793767970;
	b=dhUP1zLV8Aj1qjYgvsMtT0TNFiWEY2sBJbVZUTnvVhjCwT7IgM7zItjfS/SS3TGMb7Rj
	 M73lDBWSGhuWBi0vmuMiVqPGUlb2JtDUcXTiSBzW3KewB34iO6K1YDnM8Rz/TURXa6XGg
	 WHbinVIgAusnrR5UgYZZebdNcHlxPpS188aDw5RZtapR3PjJxWD76EaGRSSnbfSRVCUOV
	 HZ/QfPctx+8+CayxZVXzqoEAZzFHqcz3lG2yRSNroBo/78mlJ7YzzmmwzD/iFPCLNrr8w
	 MHn18yd+SaMbcCweeos7WdBT1I1CaNpV7fRoa2+75PysfLJSk48uns3IpigsPB9Otiw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793767970;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=pFoH3xvN9EWBbrUcPIA3qDP5aom6jOQyZeF4FVw6u6w=;
	b=a+xKqp906fWnT3spLxMlLHo2B5dmjS1hBu55DwhPJl7cb06/sxMT2WpTYHsXwX5Jipgv
	 u70LD0t2XPjTXls6znB9uEWsRWPqxjzzmAaM5ivxWqo+7qXiNx6VT2PDllj/6SXAVJCoX
	 oR3NR1Sl/jUvZBtN5BruVji70iQRrzZwILZjhgUmVh/djbX5ZL0ehhk/wt2vs932ms7Ga
	 RMKL4upByihFQ0qIlKlbEB9WwR6Jpk6+XyGJwvjbZm0gXgI1Q/PtEuCdb9qM6nq/oRgJm
	 SuAkxNUQJO7KQ9mk1wefH/Kl7UrxfF2ygmTFnv1/U21iHFK/TzySdiRZqBYORXVEWlg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aiRLH7pr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B83606A32E
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 04:52:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81B83606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aiRLH7pr
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c4c9abc1824so43911866b.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 20:52:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793767968; cv=none;
        d=google.com; s=arc-20260327;
        b=ldWEcqSk0MLkKs8je9OlhC9CrTDK0xknYMesmgB9escQOIfkdHQ4DkcrFGu/2VfpzF
         /1ao0Blc7LiloGC5p5zizk6VK/VGUBCzO234BECfwDtz95Si6w5CTitWVAXDavQsNONZ
         bOPTilOkdzkWfZwMhK2lhEdSAvQFFb2c4/cnYaAmysias/LfHCuSWWcqDrSAH2a5cpLD
         geavaB3K6DqCX19s66/xNEwreYUzplJZjMiA02ISmPrSRKACthB1htbYrO6gC4MgjEcJ
         Dnd7cTycCkLxuEmB1YDoB4FbWta7h6ViLwpbaHpOkP+ntebv3Y6um04oTaFWbtYz82YV
         cHTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pFoH3xvN9EWBbrUcPIA3qDP5aom6jOQyZeF4FVw6u6w=;
        fh=UJNY8QSVUCNs5aCYWR9uuKpz4WalGieby/5Ml1Qgykw=;
        b=j1zDytN7EqQivqR2qumEZjQ75R5CX6+IOE+4JzHsVlP7OKm7+dyNvgDKpmtiHz/Q4/
         Ez8LYRjcyTjI0yYHPn5de1nDOkAeL1jv6yH8BkHqNslTCy5cEvwM2bC+FiyFIDd4LAl2
         eEPg/XMGeN9LSPwpcvJ1vYC9+LnPdEXzhsAM9esrAUWPD8uM2CA1NBV7p434G34zj+XM
         N8qnH2xNlXjVOWK9YQ3M2c4BwbGvgbEHo4NadL911dOi6JdWm/h2XtbXvlV1eyWgJU2t
         ph68jwYJ2oqXE17Lxs22TIION7ZcoC6ouIX/pFssH1WRTYmKynGwYtDWT6uAH0rROn4b
         7+UA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793767968; x=1794372768; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pFoH3xvN9EWBbrUcPIA3qDP5aom6jOQyZeF4FVw6u6w=;
        b=aiRLH7prZ4+gVrvOk5uBmzvbOq6/s+Sl1DQtGkGd+kW6YdlzA84iI56Z04BS8bIrtf
         +K4nk9U+6N03dxsTecuheaSE0EJ7/BoY/bWjqB2ZLIunjG00BsU6ITNCkyoPfvnsoCB4
         h6WlUZy1/WudE4DUlKC6qRUcZfTwj4nmnl+URpsfv4Qrmm8KxiJNq/YAnsCeHnlFM0xC
         +LLa2BH+NQn1hJQVnAndjjwbq0gRawOPU7m2qBvzkv10DQ3mpJSzoZfb8kxPE9Q2FDaF
         c0mwBVBhvYUa8GBmQIH47uaKc1/Lx+CsIm1cEdVXJE7wyZlDE210owyNtZ8zRgkTBP/P
         Bauw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793767968; x=1794372768;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pFoH3xvN9EWBbrUcPIA3qDP5aom6jOQyZeF4FVw6u6w=;
        b=IRdMKIVlLVdO/NL1LCHNnkXsDntyyoty+T3gMOimqpBMeFVqj1M+Tx22w0a6OhyCtt
         i0Ajor6Zz+OGrrZ/4JgDMwB9c2vlZ9WhTSykBjXn/ft1LXmBW3ihlHjPquKeiwdG5twb
         9XHo7SL/HZSHsEdgcyw7f0fksgOkAsLJenP5ujWHHNWw6zRH2+B/cAzstApiBiNCKq68
         v4R1P7+jp2Yw2GzV5EcFNhVi6/nkkoKVXqUuTYAJ4BDRlOIq/SSbgLWRyPBQBPlLt443
         vSZA3KSFyLNnLOIHgvfAh47SsBLeFFTrtITM2EizZrjHCcq4PNESl8f7A8PU9JI/3sOg
         6+ZA==
X-Forwarded-Encrypted: i=1; AKwUvByXYx3ovl1wM6OqRMKilj2A4AGfwg4alONZ99cNcZn77DDNfm38gsqV3f1ttH4iKbGFqVlqlTtBwv41sRM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/WFd3/eH27oW5B3QXAfppcSGA4GZyg1WJd2Zlb0R/6eP5SPep5
	2anARgZBupgV6vKLto/Q77E2cZyb55Z7lcnNF4ZUg9MINm0vTGy41a7GJQrDjwW8mLqWW2sFNSJ
	RS54UXNCueEUNuYpzGRwMasBeMs4w4snSrNTX
X-Gm-Gg: AYBFou0/yhz/qC+T2zBcHbdAMYRcARUah0FXDT5iEaCEMr9UlTZcfP4lLlFNp3DAKEt
	1MTS+jeG8uQuAd//HmNLXl0iY7Hr8wzzW6gFs7alZ4p+4v4CUzeMeW2DbN9wTfaBPcKqQ/NR4o7
	8RB0/FRhjz2F1OY44Gk8cmw3YO/Udi9LmDg1LpRPd/ipdqkueAzKIBv6HE0NwrxuuZphYwAwKZj
	e0Ezuzc8V/GxkAr62FY3UjPZ+svjCXptwScvEObHziZHLdRJlyGwjD/H6Op7KYuN2taPmoEE9iq
	LwEbsZ9TYJs9o4pRUHyl3gQncQwz94Z64jMCddVUOQJ3pVbTwDH+hmL+MxjSGwTRTRgoOSvL0P8
	dPX85tNWxSixUsu1DHGGFCoQJq5fMWR5NNLW3IM3u+HTs28wxR82X4FAOOqdakjf/DucKIOrCr7
	tCDKBC4SEkVEOTzkLkvxeNgF4W+wZWA5jvb9Z3OXTzHR+Nl8apDPq9deaFNMwPy79QiMkMRBexg
	JcnkQzI7k7e4x3UrvwDjiFdsDCAvCl9BdkEFt195WTVIgmfNg==
X-Received: by 2002:a17:906:f5a1:b0:c41:6de7:7dee with SMTP id
 a640c23a62f3a-c4ca7949b3dmr1198860166b.7.1793767967575; Tue, 03 Nov 2026
 20:52:47 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103215557.183459-1-rosenp@gmail.com> <a5f044a803a64a1eb68815f075bda2ee@realtek.com>
In-Reply-To: <a5f044a803a64a1eb68815f075bda2ee@realtek.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Tue, 3 Nov 2026 20:52:36 -0800
X-Gm-Features: AclHuK-PgB-kCA1qvvR-AVgXtcHeHVRUwBypOKy-ZNzFoSBd052ve_9ylaFIDM4
Message-ID: <CAKxU2N9OpxoKF6M5rJpNOJ1HWXx8oJ3wXHpfyGGVgQpZaMi+uA@mail.gmail.com>
Subject: Re: [PATCH rtw-next v2] wifi: rtw89: acpi: check for _DSM function
 support before evaluating it
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 4:47=E2=80=AFPM Ping-Ke Shih <pkshih@realtek.com> wr=
ote:
>
> Rosen Penev <rosenp@gmail.com> wrote:
> > When the WiFi device has no ACPI companion, or the firmware does not
> > implement a given rtw89 _DSM function, rtw89_acpi_evaluate_dsm() calls
> > acpi_evaluate_dsm() anyway. ACPI core then warns on every probe:
> >
> >   ACPI: \: failed to evaluate _DSM e8c3a8d2-694b-004f-82bd-fe8607803aa7=
 rev:0 func:10 (0x1001)
> >   ACPI: \: failed to evaluate _DSM e8c3a8d2-694b-004f-82bd-fe8607803aa7=
 rev:0 func:6 (0x1001)
> >
> > Here the handle is NULL, and acpi_evaluate_object() returns
> > AE_BAD_PARAMETER. All callers already treat failure as "no policy
> > provided by the platform", so this is only noise.
> >
> > Bail out early when there is no ACPI handle, as acpi_check_dsm() would
> > otherwise hit the same warning while querying function 0. Then use
> > acpi_check_dsm() so that functions the firmware does not advertise fail
> > quietly at debug level, as rtw89_acpi_evaluate_method() already does.
>
> Adding this check is fine to me. But my question in v1 is that
> acpi_check_dsm() checks func 0 to determine if BIT(func) is existing.
> Is it possible func 0 not existing, but BIT(func) existing?
Shouldn't happen, but who knows.  I can drop the acpi_check_dsm() part.

7bf2dfccc2dd70821104d15cbab7b6fca21872be

is effectively the same as this.

Note that this specific card was taken out of a laptop and placed in a
desktop, hence the warning.
>
> >
> > Seen on an RTL8852BE in a desktop PCIe slot.
> >
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  v2: check handle separately. Remove Fixes.
> >  drivers/net/wireless/realtek/rtw89/acpi.c | 15 +++++++++++++--
> >  1 file changed, 13 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/net/wireless/realtek/rtw89/acpi.c b/drivers/net/wi=
reless/realtek/rtw89/acpi.c
> > index ebb6cf555747..3396d42594b3 100644
> > --- a/drivers/net/wireless/realtek/rtw89/acpi.c
> > +++ b/drivers/net/wireless/realtek/rtw89/acpi.c
> > @@ -372,11 +372,22 @@ int rtw89_acpi_evaluate_dsm(struct rtw89_dev *rtw=
dev,
> >                             enum rtw89_acpi_dsm_func func,
> >                             struct rtw89_acpi_dsm_result *res)
> >  {
> > +       acpi_handle handle =3D ACPI_HANDLE(rtwdev->dev);
> >         union acpi_object *obj;
> >         int ret;
> >
> > -       obj =3D acpi_evaluate_dsm(ACPI_HANDLE(rtwdev->dev), &rtw89_guid=
,
> > -                               0, func, NULL);
> > +       if (!handle) {
> > +               rtw89_debug(rtwdev, RTW89_DBG_ACPI, "acpi dsm no handle=
\n");
> > +               return -ENODEV;
> > +       }
> > +
> > +       if (!acpi_check_dsm(handle, &rtw89_guid, 0, BIT(func))) {
> > +               rtw89_debug(rtwdev, RTW89_DBG_ACPI,
> > +                           "acpi dsm func %d not supported\n", func);
> > +               return -ENOENT;
> > +       }
> > +
> > +       obj =3D acpi_evaluate_dsm(handle, &rtw89_guid, 0, func, NULL);
> >         if (!obj) {
> >                 rtw89_debug(rtwdev, RTW89_DBG_ACPI,
> >                             "acpi dsm fail to evaluate func: %d\n", fun=
c);
> > --
> > 2.56.0
>
