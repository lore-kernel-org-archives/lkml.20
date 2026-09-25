Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0494038DC57
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 19:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790365243; cv=pass; b=BSvCtFYw3shqDhJdsa5Rnb88FvnXRPQYmrHF+Fg5aSrsU6OnqyApwnODRZyWE9tmGJi5oEbHOecLMHW3843YGqeC+YRfnV+myqh0Cr6Zx//DpgRO5+Jv0Djo+B9eeRoiMWNkChqhtHOeiyrF012eBozwFbmKh0pait3thUcPePw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790365243; c=relaxed/simple;
	bh=OiihpvIIlzoVJu2DCK6dCNo1iVpixAYRYF6mCtC37lg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kk3Lb/Jrqqbvj+e4mMB1xkWTD+60gOeBTWfU5+o8pcG2ymVfulXJDPBtMnPNktVUSnVyC+97T09lVXiyzsEsOdAdPAJrEl4qx1tn4CLnhmOZyc/8mUdYFzBsLlxs1x4aArB2jHlzDYe8ywXx3DqbaKgjF22/pNP370rKZI5m8aE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QKxq5/VI; arc=pass smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QKxq5/VI"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4c206dc8adcso601077b6e.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 12:40:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790365241; cv=none;
        d=google.com; s=arc-20260327;
        b=MffsGzau9v7G1/c0qaacNeFHQxLsJFd0mGhBrQl8kEk3fnurjau7okffWtsMckGAu4
         Yzma4gz9Fj6Gj9lFBXmchP40Ve7gEwhHAWFDQgSdDNUcz6uFPEx/06M06e4Na5wPVek6
         I3wMjI8E9Qj5KGD4jkDeoeQOVVDK+Gskea7KWRN8gCUuJbqWXqGPxpvjZki4Nc/VE2Fd
         V+yYBDySRf48Ay1U2ou6PmrmDTLrG//fZ9qSkcn3xsJp2sHSvI9cot4RL1jE2Uyya+sU
         /qcyT4SMXb1ax35Up1q4/sjePtHHNCDmhcsM7QkUCuaKrrOJdHd8CV94TeITs3HtWIdW
         E25Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QRtQwrI36+tl+6Prwhx/Tagi3Pi4qOHQ7OtnSC5ifgE=;
        fh=P+GqX98MQ+xmDrPhfzYAUixiyJgnSlpTwBcrcVCI6SE=;
        b=brM3Ln0zGhRb5WPYqthuRzenN3RuQfZ5Ics0Og4b+WlSEvsxJhHSJK0i3SE9wQd46r
         unWOI/k28SOZGaxVenwmIS9e5PhhqIDBQ3GEd7zl3gSWhU+pOyMoghlEeW6LJISxuvpS
         sB8jXJgt5rDVVM1oBIWh/gMxE9d6XlgsHWgahMjiNfuvr+5KUebmyTt23fSs6R3G1qKI
         eX5TKTBltgZ8DmMh0BuQ802dHzirWqJDOO//mV8MmklLrUp1kNzGC7f8FIhQRlflBlUh
         XtXS8UF5DpQcPJONc/v0eU4DmSbEpH8J7rcQbvGlE8MezoCNRr/zEvULzQccMcekm+nl
         ppCw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790365241; x=1790970041; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QRtQwrI36+tl+6Prwhx/Tagi3Pi4qOHQ7OtnSC5ifgE=;
        b=QKxq5/VIOaGIN3ETW2kO5BE585sPd3T+R5MlPhz1HBBqMb7Q0DuVytci+Yx0K8nW8Y
         0eYnOUkUZrm9g2Nyg2yxQodVBsk5j4bjuCov1Z2mQZfAQLOkhdeNo7V7mim/K72ReJud
         iIJ2d5WM0CqwqrurBwWtbGuBuFSJ/RidfX3DF9Ka9eO1vfzJ/RFqMe4EYcMpLUkUkT7Y
         xSH2TlXtExBIwumqocbBTPbAaXcBIpAs/F37rzVGRFltgaUDu20YE5x7F6VjnCRs4GDh
         I3NGZJQATYo1KnB+aV7j6vetPysdhhgXqbXZNFUbeQvrRK9mRN94T1VhRoTscaZFOAmM
         ErgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790365241; x=1790970041;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QRtQwrI36+tl+6Prwhx/Tagi3Pi4qOHQ7OtnSC5ifgE=;
        b=GVCM11wTcdxOSny+Pn+pd5yMyun4IFgWRUmkeX04jl7kuqvn9T5RPCsSPQZMgCMUnM
         us6P1P5NQrEyKW1+5bsNjsseHdt9yn0MbXzbjT2xLZUIPLIEVaGpwfVmzuR03zTVU8kV
         8YM29T9nRp1QMDhhz8fdCoiUfuc2MT1hW2mPeJbfXr/6yNwVvXlcLoN7jtdAvz7NYJpq
         uV+DUWgiHw6d+T8KqsvwFAlpQPnmKzRjUm770gcJxJuUf5TECz28wHyyE4phHkEPLzAi
         A9JCJfqqcS9IZxTbhvYdSM+VPCMR9nxmfQdUcvw+mhs4UsfKZybKolALNOq8kmy6TEny
         CnaQ==
X-Forwarded-Encrypted: i=1; AKwUvByCJc0VWElYjuh/oSjKm/s4JD5geFxDwqVjlgEOYXK2Op0ZekVt9oeJoItmGru2RF4lXHD2v9GyVsqxNII=@vger.kernel.org
X-Gm-Message-State: AFuF++kasUQuUXV0PWLIKQ1VWLoPjGwjVuNwyi2MVool6nj4bJzPO/b6
	xP7MV+nuFZynUAsrBeWk99slohqyMFK5Q8OiUyDe8r0QFQVGHZ48vO7Ia52R9lepv7Htn3x2SoP
	Xus8DOHi8yMNaU4zMLzNlBGmD+8yf7kfJnZItRZGX
X-Gm-Gg: AYBFou1oLYL0AiHow4E0nG0f6GzfvU12Kxts/VfKbH5k0XdiVD3bgeYPfWHvv8YtVsH
	RLtV/5Xzi62Lfsj5k0+TBZozzEIXKbNnqFO3xqhkpDPWp9pejZH27miRKvS4xCycVNDRvmG6mOg
	KGMSVlhqj8CGw992WQYagd/r0wEc9aAYzoJBHTeYke+spLJ4cuHMtiH/Uz/8g0wDoOdxkiqAm0M
	ykn54bMZ6IaLbFiRPMxxJf40TlEUmCkIEdUgz2Qbc2HDFIssjeFJbc3+gDWIwrpjKh1/P7n9ngr
	DiXfo2cBNVKGRLp0flOL0lOsXmPh2RMUeM6HH0EgimVWBK0Tz6PRDVS8TyJYOdMwAh2h6G1dt+/
	7mOx2dzANSMCM
X-Received: by 2002:a05:6808:30aa:b0:4d6:90f3:74ae with SMTP id
 5614622812f47-4dc6606bcc9mr4067609b6e.46.1790365240133; Fri, 25 Sep 2026
 12:40:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918222513.2633456-2-rdbabiera@google.com> <arF3fynAGG5khe3B@google.com>
In-Reply-To: <arF3fynAGG5khe3B@google.com>
From: RD Babiera <rdbabiera@google.com>
Date: Fri, 25 Sep 2026 12:40:29 -0700
X-Gm-Features: AclHuK_91DQZxLqN7uLYqBpJX2aYJ1LY4FTA5TNLS7LM4bAkU5HscFKOZ-tm8pA
Message-ID: <CALzBnUEw4J1SB8a7is5Q-OKhkuQuPWUJcu9KHRrZO37k==FEOQ@mail.gmail.com>
Subject: Re: [PATCH v7] phy: Add USB3 PHY support to Google Tensor SoC USB PHY driver
To: Neill Kapron <nkapron@google.com>
Cc: vkoul@kernel.org, peter.griffin@linaro.org, andre.draszik@linaro.org, 
	tudor.ambarus@linaro.org, p.zabel@pengutronix.de, neil.armstrong@linaro.org, 
	badhri@google.com, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Neill, thanks for the thorough review. Will send v8 out shortly.

On Mon, Sep 21, 2026 at 11:29=E2=80=AFAM Neill Kapron <nkapron@google.com> =
wrote:
> The driver is now using readl_poll_timeout() and
> pm_runtime_get_if_active(), we should be including linux/iopoll.h and
> linux/pm_runtime.h explicitly.

Acknowledged.

> > +#define TCA_CTRLSYNCMODE_CFG1_XA_TIMEOUT_VAL_100MS 0x1e85
> > +#define TCA_PSTATE_0_OFFSET 0x50
> > +#define TCA_PSTATE_0_UPCS_LANE0_PHYSTATUS BIT(8)
> > +
> > +#define GPHY_TCA_DELAY_US 10
> > +#define GPHY_TCA_TIMEOUT_US 100000
>
> With the addition of TCA_CTRLSYNCMODE_CFG1_XA_TIMEOUT_VAL_100MS, we
> should consider bumping GPHY_TCA_TIMEOUT_US to be slightly larger (e.g.
> 110000us) to ensure the hardware timeout is guaranteed to expire before
> the software poll timeout.

Will change here.

> > +static const char * const u2phy_clk_names[] =3D {
> > +     "usb2",
> > +     "usb2_apb",
> > +};
> > +static const char * const u3phy_clk_names[] =3D {
> > +     "usb3"
> > +};
> > +static const char * const u2phy_rst_names[] =3D {
> > +     "usb2",
> > +     "usb2_apb",
> > +};
> > +static const char * const u3phy_rst_names[] =3D {
> > +     "usb3"
> > +};
>
> nit: checkpatch.pl --strict flags missing blank lines between these
> array declarations (and the inline helper functions + DEFINE__FREE
> macros below).

Will check.

> >  static int google_usb_set_orientation(struct typec_switch_dev *sw,
> >                                     enum typec_orientation orientation)
> >  {
> >       struct google_usb_phy *gphy =3D typec_switch_get_drvdata(sw);
> > +     int ret =3D 0;
> >
> >       dev_dbg(gphy->dev, "set orientation %d\n", orientation);
> >
> > -     gphy->orientation =3D orientation;
> > +     guard(mutex)(&gphy->phy_mutex);
> >
> > -     if (pm_runtime_suspended(gphy->dev))
> > -             return 0;
> > +     gphy->orientation =3D orientation;
> >
> > -     guard(mutex)(&gphy->phy_mutex);
> > +     if (IS_ENABLED(CONFIG_PM)) {
> > +             if (pm_runtime_get_if_active(gphy->dev) <=3D 0)
> > +                     return 0;
> > +     }
> >
> >       set_vbus_valid(gphy);
> >
> > -     return 0;
> > +     if (gphy->phy_state =3D=3D COMBO_PHY_TCA_READY && orientation !=
=3D TYPEC_ORIENTATION_NONE)
> > +             ret =3D program_tca_locked(gphy);
> > +
> > +     pm_runtime_put(gphy->dev);
> > +
> > +     return ret;
> >  }
>
> Previously, sashiko recommended moving to pm_runtime_get_if_active(),
> which was done in v6. However I think this may have changed the behavior
> of google_usb_set_orientation() and potentially introduced a regression
> due to the pre-existing ordering of calls in gooogle_usb_phy_probe(),
> causing this function to always take the early 'return 0' path.
>
> In google_usb_phy_probe(), we call devm_phy_create() prior to calling
> pm_runtime_enable(dev).
>
> In drivers/phy/phy-core.c, devm_phy_create() calls phy_create(), which
> has the following check:
>
>     if (pm_runtime_enabled(dev)) {
>         pm_runtime_enable(&phy->dev);
>         pm_runtime_no_callbacks(&phy->dev);
>     }
>
> Therefore, the phy device never has pm_runtime_enabled, causing this
> call to pm_runtime_get_if_active() to always return 0, and the function
> exits prior to calling `set_vbus_valid()`.
>
> I think moving the pm_runtime_enable(dev) call prior to
> devm_phy_create() will resolve the issue, but we should audit power
> managment in this driver to verify.

The check here is called on gphy->dev as opposed to phy->dev. fw_devlink us=
es
FW_DEVLINK_FLAGS_RPM by default, so the dwc3 consumer controller holds
DL_FLAG_PM_RUNTIME on the phy platform device. Every resume call on
the dwc3 controller results in the supplier resuming as well under this
model, so the runtime_get() call here passes.

> I think this introduces a regression between v6 and v7, as usb3_tca_base
> may be accessed prior to the 'usb3' clock being enabled, and
> furthermore, the call to reset_control_bulk_deassert() will clear this
> value.
>
> Therefore, I think we need to this after the call to
> reset_control_bulk_deassert().

usb3_tca_base is powered by a different clock as opposed to the 'usb3'
one, so the register access will be safe as long as the platform driver's
power domain is on. Register reads in either order both result in the
same behavior during testing, but I would argue that writing before
the call to reset_control_bulk_deassert() ensures that the parameter
is applied on PoR.

Best,
RD
