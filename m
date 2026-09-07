Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1694503EE
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 10:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788776615; cv=pass; b=eO3Lj7TrnaXCCU8Okdi2JuUi/EZP4TxrJdrWa2VBLEcKsTebI1KXotYw+TgexVnZBko1VOKrZJz9Z3D1DfxWkhtpPYhxdgGTif130GnokXl8KEZLqd3COtlpar01W1QW3cL3UMp4D6ymryCIqM3wk78OmvH8DKvp5OitmJSp2mk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788776615; c=relaxed/simple;
	bh=yC+o3g+oHjdn9HHHsFJRYCeY6o9z2MeGqDdEyGkihsE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A/ieIfxOk29GbWSbs2zWBhHeycTRfbiJ16xZmrUEupqLh07Y78ws0xT+pjWskbeRErtUbDRCW/N8v0ddZANfkgYek4ol/J+fs7Dd8X0GFyCIeMFKQH87B3RU+yM1KmzgV/HM3jh5oiPZ68r5YHGjF7B+HR7WzBZQFYoKnuJsoTE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UycKmJFH; arc=pass smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UycKmJFH"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4843e397f74so4293982f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 03:23:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788776612; cv=none;
        d=google.com; s=arc-20260327;
        b=RJJl/DVX9tyt5neAdf7q2eGIWKQYVd+jorvvTydkh3KAiE4ei2GP5lncukSn0sIgM1
         rx5Y3RSwt4E0xER5UptD2uNykDrMPssz2DaXuLhV6e8J2G+uwHojBp5EHimLWxv+z34o
         KZQDuZ2QDPNMBa7iDyACBrOMqGz3iROPVGxpPV9k8h4HyUb9OP7DNE4fNFbh+EYGEvhW
         EnBDFoL8AS6iGHPtABZv1h7ikif3BXEyb+BX/dQlo/+kjcF3rVGcFqWIt8dg3mjo7NvF
         0Wb5Wwk+WTwFqMiTXhnmB3y2ZMZzZThOSuJRQP6zGxAqLUiMghK9/7+cqg+PqFfH0TPu
         ifyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=99rrNQK9PYDQWtqeDcI+v8dFCF97V9GRd5/NAE170tM=;
        fh=hhci/n+r1kHHmlB1YMVu17hDccVBnQKlhlMdQLlskbA=;
        b=LSOSs97DxqjzhR8Ra+ZCHVi05wiEDjFT5aNlVO/LsGtk8ughrO7mcsm22r8KFrWwty
         JRYsLvARPM8MI43muejf1p9s/MSe0OGzysfzHriuq9r5xkFy2/KtL+OFghaBA2jcvpuS
         Aqc2EQ5edoiz7fuUZgjoQt7cwgMQLSmC5jZgSF/hUGVnlUdUSOoAjwZBWFN3NDine/xN
         /UaYztrb9bpZGdl1bcRoWMz56P1c3bGk3if6vdLJQcCKhMoq2HBFLyGn6XOqgRyFmK09
         Bnq3qvul61GuE/oUCdBG6xVtJzpR5PdzNnQIciTP3DNBgwokCGFoi2eAhu+Hoy5NspB3
         MPhQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788776612; x=1789381412; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=99rrNQK9PYDQWtqeDcI+v8dFCF97V9GRd5/NAE170tM=;
        b=UycKmJFHwb1nUPNveAhgLUzk0YyIDU4d0eAncrjDxOlKGOap2CshkUNXpn7ZjhEAeH
         k2HJlp6/180oGEYNynjScuLHI/PQYEIFnZWY8F4jqEcqZQSnOZ4u4QF5F9wtbMXBmoIM
         YnN/QeiDmwuX7SEwmf06V9KOAeq9Y0dVRBMW+w6fvNTQoTom2act+P1fyuX+v0VDm4YS
         ebjkIo6gPTWORFJPcxNITJDMrQniGz/MRGhYrRTxGlpFVrNx7iQljJQ2Te8/KO32fy1t
         apTWdOGMC5dO3nq8UAoaHxFGt4eyzvIjoInjlC+Ras8vpk19rfVYfu6dJMmwcFjuE7v0
         kCfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788776612; x=1789381412;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=99rrNQK9PYDQWtqeDcI+v8dFCF97V9GRd5/NAE170tM=;
        b=IFjDrPLkVttjEGZN5zf1T0d7KHxOC3VyyTT6DrCYzDq5TX5uB12EO3lJzKu2lThwIz
         CtoEti/iqDnU7TdqZNlhI8mbC5JxcK3Ar5yTHJkx04c96tcadjm1z5JcaA4hZH84oyWq
         gemSJTpr5jhEKrliWsqXKPNchXDqVRF37Gr9wW2AvBJPXjaQR/theWxpwSTQ07XHfJDE
         /akGSOO0ARiOGGNujQxCzLgvW8yV6aT3xVgv63a5Dhz9FrNYvUmhixi/D8nDmujW2Ck0
         Y1VzA3tid1cb1zFczWpn9WyeCrV3FrUzYTrdULys1Aj74pT4cfvBBTc+qsBQ4uHPWXBQ
         iqrg==
X-Forwarded-Encrypted: i=1; AKwUvByO9sQ81Ae1+N2rYSrRDtPcjb5Xjzyzh+LLATYP+66vosf8HzoADbDxI7YF3/yfZjIvD1nW/0Qw0EIEqnw=@vger.kernel.org
X-Gm-Message-State: AFuF++lwHskzkS+0ZqXsIhrdHxHD/7hIFrDDdWoPUc3S7r4jgmYRxb44
	keTi0t0mNLBQ3/+T67ofSocizPbGyMsC6M0UfVQMFuAB/al49idYhr626qlcw6ro8SE3w2S0uKe
	xcDk5T35+283mxEYz+0jzr4hRKEQqQnM=
X-Gm-Gg: AYBFou3Djlj+0sh56yMixGv2NU7qaYLGTZhsAwLrYG4476/d29m4XzVirNtzHHmOq5k
	qy2fisDy2f3Wfy3rn509hSQlgQcEgLcDABUwTJB0odFHFPKkgK57IGHL+p5Pc9UeyZcBVxGoDsl
	ifJPrvOOsSwcwqjQLJQh6bCsVbhl/ELYztM/UjA9oVkQyWL8ddUgvkxYDlHvlm8mrgsTOdpKPYT
	ZPmpUqQ7QrjM46WESAjRHaO4a0wIa/lk9bnA2rGWOwHQPrGOh6SJIw6cfvzA6uYBfulww1hbZle
	S+bhmctqkOSs2iTX71W01jM99DA06yT9f95ZvVm+go+e8C3Dllb7duOsLMMe8fCTEvbHYvZ9Ubu
	JDqc=
X-Received: by 2002:adf:edc8:0:b0:482:e658:7a39 with SMTP id
 ffacd0b85a97d-4857e5171femr24476358f8f.11.1788776611775; Mon, 07 Sep 2026
 03:23:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260905134251.67210-1-hppiscas@163.com> <apwrUYd3VybxbAm7@nickhuang>
 <wg57x6u3fomukerbnfbmmxywoljyrlqlctytfnqdlhl74jvigg@t3aygzlhtpui>
In-Reply-To: <wg57x6u3fomukerbnfbmmxywoljyrlqlctytfnqdlhl74jvigg@t3aygzlhtpui>
From: Nick Huang <sef1548@gmail.com>
Date: Mon, 7 Sep 2026 18:23:19 +0800
X-Gm-Features: AcwNN1Vp_cuM5nShreT_zeNzhbqLHFyRtdBlAeKSiWtpbuJ0qpc92MV9cu7-sFI
Message-ID: <CABZAGRFSqQh1AWF=bYO5xXQWDVHK+5NVgHt9=N8wcQY2ZuK4YQ@mail.gmail.com>
Subject: Re: [PATCH] PCI: eswin: Publish the platform driver's OF alias
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: "hpp.iscas" <hppiscas@163.com>, Senchuan Zhang <zhangsenchuan@eswincomputing.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Yu Ning <ningyu@eswincomputing.com>, Yanghui Ou <ouyanghui@eswincomputing.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Manivannan Sadhasivam <mani@kernel.org> =E6=96=BC 2026=E5=B9=B49=E6=9C=885=
=E6=97=A5=E9=80=B1=E5=85=AD =E4=B8=8B=E5=8D=8811:55=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> On Sat, Sep 05, 2026 at 02:46:41PM +0000, Nick Huang wrote:
> > On Sat, Sep 05, 2026 at 09:42:51PM +0800, hpp.iscas wrote:
> > > The ESWIN PCIe host controller is a platform driver matched through
> > > eswin_pcie_of_match. PCIE_ESWIN is tristate, but the table is not
> > > published for OF module autoloading.
> > >
> > > Publish this platform-device table. Do not change the RISC-V host
> > > initialization sequence or PCI device matching.
> > >
> > > Fixes: b593c26d081a ("PCI: eswin: Add ESWIN PCIe Root Complex driver"=
)
> > > Signed-off-by: hpp.iscas <hppiscas@163.com>
> > > ---
> > >  drivers/pci/controller/dwc/pcie-eswin.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/drivers/pci/controller/dwc/pcie-eswin.c b/drivers/pci/co=
ntroller/dwc/pcie-eswin.c
> > > index ce8d64f..1bb4469 100644
> > > --- a/drivers/pci/controller/dwc/pcie-eswin.c
> > > +++ b/drivers/pci/controller/dwc/pcie-eswin.c
> > > @@ -388,6 +388,7 @@ static const struct of_device_id eswin_pcie_of_ma=
tch[] =3D {
> > >     { .compatible =3D "eswin,eic7700-pcie", .data =3D &eswin_eic7700_=
data },
> > >     {}
> > >  };
> > > +MODULE_DEVICE_TABLE(of, eswin_pcie_of_match);
> > >
> > >  static struct platform_driver eswin_pcie_driver =3D {
> > >     .probe =3D eswin_pcie_probe,
> > >
> > Hi hpp.iscas
> >
> > Since this driver uses `builtin_platform_driver(eswin_pcie_driver)`, it
> > appears to be built-in only. In that case, `MODULE_DEVICE_TABLE()` seem=
s
> > unnecessary.
> >
>
> Nope. builtin_platform_driver() only prevents removing the driver once lo=
aded.
> Since the driver is defined as 'tristate' in Kconfig, it can still be loa=
ded
> dynamically. So MODULE_DEVICE_TABLE() would still be necessary for udev t=
o
> autoload the module based on modalias.
>
> - Mani
>
> --
> =E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=A9=
=E0=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=AE=
=E0=AF=8D
Hi Mani

Thanks for the clarification. I see that builtin_platform_driver() does not
prevent the driver from being built and loaded as a module, so
MODULE_DEVICE_TABLE() is still needed for module autoloading.

However, since builtin_platform_driver() does not provide an unregister
path, the module cannot be unloaded with rmmod. Is that intentional for
this driver?

Thanks,
Nick
