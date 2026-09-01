Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF29456297
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 20:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788293127; cv=none; b=InrwG1PwYlHTXF37PktFZPlMVndLjlUmmPOrE0cj3Zc0Yazm4wXCyVdm6aTrZn/yse2CjM3orEdEYPcgAfDrEhARJcCEv7/RURhZaURBMJD50UgdW9sIKQMvn2T++lvr3jyhCSn3RXqKUYdyPrRTjJ4+NQxvHvRHEyHtPotiMT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788293127; c=relaxed/simple;
	bh=6xHhXi6J06QWcYHT4XAH9JrkYOlqS9Ep7EIrsnfpVm4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AlMqV4xfln0kBfD4bzOjyfdTjw1zaibqpZUh/f8xuvJwpE/k757Z3xs1NUJI+8JYUqoeCQQtJmm+dwdEbTmWc6kltz+IJRWt0sC1DWnxc7fL4HgO+NKtoJXPjbt0OY4/seyhX3O8r8PFt39dlB3BB/bWAaR7dIt0bEpySfGShuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ESp3xSXn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ESp3xSXn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16B7A1F000E9
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 20:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788293125;
	bh=D/+4brkDHmZ+QnmE/zqdwooG9iS3MJ/5To5lInwHY/A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ESp3xSXnO+Ir6sdOu/zjUPGpWtdAlT818jn8nHWQ+HWNEESDwyGm3RqSjsDhw9LC/
	 pZAfl48pGsx4V0ChSuJdrE//GadW1nvNDNg7UEcD/LdTGG2W49nk408heGghwWAq4v
	 3PfNZ+4RRzIng7/ISIeYa0ueGN73DjjDqlxugJdOAz6DvD7Wz3gZPhJF6IFqDpZWev
	 aI6jlaXqcfUP3EKd03SRFGNHPW6C8TrqYt0D6eRXYsW4ftYg/7AYm4HNmwee1pcU3o
	 xJeQ67Bo4mCRp49YswndXFFy9N1HUC87z3GSkpmpmA4ohYYnc4DTP8Al/qGYxP0G4l
	 EZLTvYn2yBcdQ==
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6a374bea882so442836a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 13:05:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwkp3b08x0YyEo3mWEeJ3iTy5Cl2hSyvnkTLplq8i3DAeEEDNGdXKJHJ6rFQY8Jg3LjNHgdYGfAZ7e6OiA=@vger.kernel.org
X-Gm-Message-State: AFuF++mr6iMSsMOJ63YqhuvlH8jtabG7/vHJwx++tyCXrxiPPD8slM2P
	j+axnqWOsVnq5lpf7znkHU9jVzr79gHChemmIbLHQz/eAPRGoNSm0FVSzHevSYCTqVFs0JmiRKA
	J0SgiQWbFkxSkM4V9INzaavucJKQqoA==
X-Received: by 2002:a05:6402:388d:b0:6a6:32f5:90b4 with SMTP id
 4fb4d7f45d1cf-6a682af9bf3mr137153a12.22.1788293123755; Tue, 01 Sep 2026
 13:05:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901172058.1512508-1-elder@riscstar.com> <20260901172058.1512508-2-elder@riscstar.com>
In-Reply-To: <20260901172058.1512508-2-elder@riscstar.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 1 Sep 2026 15:05:12 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJJPdrYArNhbRPTM=scDghLAWe5=0a2+ACNaHe07h6-tw@mail.gmail.com>
X-Gm-Features: AcwNN1UgpW6Z9ydTggKrR6I_Vdbck50n7YuEwMJyuJwLKyVB0nahVAUkaTN_zr8
Message-ID: <CAL_JsqJJPdrYArNhbRPTM=scDghLAWe5=0a2+ACNaHe07h6-tw@mail.gmail.com>
Subject: Re: [PATCH 1/5] arm64: dts: qcom: qcs6490-rb3gen2: use pci for device nodes
To: Alex Elder <elder@riscstar.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, daniel@riscstar.com, mohd.anwar@oss.qualcomm.com, 
	lorenzo.bianconi@oss.qualcomm.com, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2026 at 12:21=E2=80=AFPM Alex Elder <elder@riscstar.com> wro=
te:
>
> A recent change caused the embedded PCIe endpoints on TC9564 SoCs to
> be treated by the devicetree code as PCI buses, which is incorrect.
>
> An RB3gen2 system has an "interposer board" that contains a TC9564
> SoC.  The TC9564 includes a PCIe switch with one upstream port and
> two downstream (external) ports, plus a third downstream port.  The
> third port has an embedded PCIe endpoint with two functions, each
> providing access to a 10 Gbps capable Ethernet interface.
>
> The devicetree nodes representing these functions were previously
> named "pci@" but were renamed in the interest of consistency in
> commit e806c63ba51a7 ("arm64: dts: qcom: Rename pci@ nodes to pcie@").
>
> Unfortunately, of_node_is_pcie() causes nodes named "pcie@" to be
> treated as PCI bridges, which PCI endpoints are not.  The previous
> name "pci" matched such nodes as "default-flags" bus type, defined
> in the of_busses[] array.
>
> Rename the PCIe endpoint nodes "pci@" so they are not mistaken for
> bridge nodes by the devicetree parsing code.  This restores the
> previous behavior, and allows them to be used for PCI endpoint bus.
>
> Fixes: e806c63ba51a7 ("arm64: dts: qcom: Rename pci@ nodes to pcie@")
> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/bo=
ot/dts/qcom/qcs6490-rb3gen2.dts
> index a13315bf0fb07..99a985a177a61 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> @@ -954,7 +954,7 @@ pcie@3,0 {
>                         ranges;
>                         bus-range =3D <0x5 0xff>;
>
> -                       pcie@0,0 {
> +                       pci@0,0 {

The kernel should treat either name the same. There may have been some
reason 'pci' was not included in checks. It could have been that only
old things are (parallel, plain) 'pci' and anything new is 'pcie'.

These are ethernet devices, right? Then the right name is
'ethernet@0,0'. If not, then pick something that matches what the node
is. Both pci and pcie mean the node implements a PCI bus.

Rob
