Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050DC4E534C
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 17:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789665558; cv=pass; b=p/yfPFtL0RvB8S33HLUIj78QegpZ31KRmVYI9P2lMBJk1Frl0c59CzJlQFH3azcxPDeU+AsPwpLsNSJ7c38neKKab+KMy5lcGQ7sf5Yb/aK1i5SWzrsNMi9V/aqUI7xsvYKPIIiin3p5ohXgB+Ljc3FWOR/8+4Zhch7D33JqBmQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789665558; c=relaxed/simple;
	bh=nmR0VZI/qSZnCk+5uLQVurAYpAKP16KdlUm/1lXJbHA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=poI/+iwLqEm0OlUFiVYg8zWXuo5Yu8lqfEqkXGTncmRAruEco40SkAmyVZ1k2bTNAAf2wELwG7K8HfXuuUK//+iwjoR2zyIZ+RYE5Goh47Y6WnyIKk5NIuj80wYPqu63gSIAvxRvohvWjgZ7pZjkem4gfmRHvaPkXk5vSZkIEJI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ilb04RGy; arc=pass smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ilb04RGy"
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-66fded6b087so1039112d50.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 10:19:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789665556; cv=none;
        d=google.com; s=arc-20260327;
        b=dIiFQow/Oij1qg6C8vAQp8WuBqAWlW2i9SFYXdmhwWQdu46ovUHgwGCWwPVog5EHUC
         KtZYozBdl7UwebjjpgmeNmJLc4liD36folVFisOgeUXVWj8mhQK6qgQpZJJDLISZvkwM
         TztP2vfzvwH80w+OBZD5shYKignLBYPSMSvZj9z/lmAmRpryDsDsDBDuCeninK6Mdjal
         pjRiBENMHjoFoK65SSOzw8m3Egq51mm0HUq3FpHSoJcTQWyGjmMTAX3QZmmzaB30HH+y
         8S6H/SPr/xn8uhyoJsG/4umTG0bqQflysC4di3sNJdTuyr2fMmrwklLjxi/N8CDJO3fZ
         AW2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XR1MF6C9tcNALFSHCEqxJl4Hxsak8WMdJhGwxV/H/BY=;
        fh=3fPgbMX+eJxGC7Rbjem7J8vFrnK+cyn+LscQDWFluV0=;
        b=BGKbtb9L5tsc4LG4ZQVmVF5ju+TvZtKAW6fzcCS2lz9P3oNg1OFStfZjTXJgODYXGf
         Sp7PfrqBye5CBKLTS8BPVyR2FGM81hEVHn+HKZOloHed8PKyxGPwjOMrbbNfYwDSCYKG
         CBSxG8loWfHNmwWwh8b8yBTG/PEYyCHVWqKU5OJ9rxoT6uEoCmehdCmOEZmK3rpT29fC
         95mJ2bow/QR9lzTAbXpPLYvQ+bDpI1hpi5sHR1EX9Nn47fhevy5RCSsWozKUUMuvsDNV
         tgSsq52AAel99hzgsa5ekd+fknctiuvlaAYMSIPXYA0aU3R950KSbWa4cTDfZkSZeHNY
         +Dvw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789665556; x=1790270356; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XR1MF6C9tcNALFSHCEqxJl4Hxsak8WMdJhGwxV/H/BY=;
        b=ilb04RGyDEGxNQHeFRg+OPOMko+ceilREocvXkp5QYOhvsHQuaPVQIlTMsbIuSiX2D
         FgmwdPhrEc19ekvXvBohzKTVtcRXlCoixAGu6cLWR7ewhH5i208mH7Fy3NoiFKTcF3Si
         c+zkWY49H1+Aes7xVLW4cdYOl21Wyb7Lc2dewdsB7o73xzTy7kIoyKlJbJ7Ed+/g/mtD
         eidBX3CAAe0Emm8K3y8O1ZPe9hCiSsB8oj7P2f+FwXhvbiOcXESc7EeiMbZHsesaC7Q0
         usNpS75Je7Ivy5ifeDQw92unBpt8JeQ2xVRaSdfovzRfAIV+/ryYgiwwmCgfax2d5LZ4
         ZUTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789665556; x=1790270356;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XR1MF6C9tcNALFSHCEqxJl4Hxsak8WMdJhGwxV/H/BY=;
        b=y++THsQ7i4M3Ql6H9QMNH/osX2YHQcfcq51j+l0vYgyR6eQ+s7+H3mAjzQukC+Aggk
         vCxjBn+m1/Me/uLqKkT1c2Vdcuh2oQXpHT96bJ4Mk/1r9yxiHVYnnKekHi8R0CLlm4Zw
         hOLUImlR4FHo6B/Yd4yW0ypTubkTWRq2lPh4fXThN5Mnl0i5QCAl3yNzt/M7buqoNYaT
         MuCswrBTx9pOSJ1wF+btRi3Ciz0KQxp2rDAU9DR4M/jxQLM1Bd6itbcgZN92CeQX5TdB
         iGg8lVhoheXFefFLHQTUoIq3vGiN9nVgyxUr3KhxfAOXZlZ2UJqwyUjYpuBGlCj+yuEO
         AhdQ==
X-Forwarded-Encrypted: i=1; AKwUvBw2E3atr1YxeE3t/SNOH/myW2/suuk8nUvNENjzkloKwgs5Q4EF72Votn0Gt2+lKYpAUFFdkpsherDeRbA=@vger.kernel.org
X-Gm-Message-State: AFuF++kk+W69nhtRTPwa62kyPYQu9Twd7hzVs+UD9hCJKomo+GIEmoWZ
	vaDr11/FEVipImT8Z+oi4UgleKXeRzpO4Rj1YXEfrmShrV2+9A3LmAyiDYDOALap77XolPSdH7b
	fD+4wHhCTXLQ2DqGpLwPOXaG7YSYfMZFXpTpfI8u1VA==
X-Gm-Gg: AYBFou2vRkMBvRcRhbYPFtCj85FwkoZpHpp4ywJ5d4vtHTUyp6lBA6syJggzs2NR64w
	f/rX68DHQvvqRV41Uf+42eRx/3n4AQr7sy2PiWX1sYHcVr4CJ2jq24uQLnkJrcBYmkjlzUWcCoI
	nFWF89tmKS1Wa3opFA9elbBAAsBXJN3S//Il7COkA7QhLE4Yu6HcbsSsLAsDL9bwNZkhCWMVQNf
	S25J4z3G9osuJKy8IEKkZTMUNTnKUXxjd5Eab6txT/uXdgrojKRZtakbPUC2uDHcqKz+K+Fj84J
	vhgoMOVkNt9kFtjRTEWXjW5wkLZ05Mf4HrgPPSNjQypKFKLP70DxJKntnsZPMY5JhKsQlS1OTDa
	WrC1xMBbft6R56GHS0fRjcu0qgPEg+y6ubeaY0TDvxA==
X-Received: by 2002:a05:690e:191b:b0:671:3cf6:e1ab with SMTP id
 956f58d0204a3-6716320b6ddmr2187286d50.32.1789665555810; Thu, 17 Sep 2026
 10:19:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-bcm4356a3-bt-v1-1-ce44d0abb5db@gmail.com>
 <CABBYNZ+553teDOW-43qkf_TCyNr31LP8gS1vQ7YfKvAZ9UnzLw@mail.gmail.com> <CALHNRZ9FeNaT65WTEJAe8H9ux2CtGVkdoL1-nDVMrdGi5mTxvA@mail.gmail.com>
In-Reply-To: <CALHNRZ9FeNaT65WTEJAe8H9ux2CtGVkdoL1-nDVMrdGi5mTxvA@mail.gmail.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Thu, 17 Sep 2026 13:19:04 -0400
X-Gm-Features: AcwNN1W2gvFWQgBUSg99tLXNuJ4sP8849NgXLBaweXbuu21Km6VDFmulPCNXC9E
Message-ID: <CABBYNZJ4+WBSOSDkYExT1b4i4_ZyLa4AzvED9QgwgxCTTwrdVQ@mail.gmail.com>
Subject: Re: [PATCH RESEND] Bluetooth: btbcm: Add entry for BCM4356A3 UART bluetooth
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Marcel Holtmann <marcel@holtmann.org>, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Aaron,

On Mon, Sep 14, 2026 at 12:41=E2=80=AFPM Aaron Kling <webgeek1234@gmail.com=
> wrote:
>
> On Mon, Sep 14, 2026 at 9:13=E2=80=AFAM Luiz Augusto von Dentz
> <luiz.dentz@gmail.com> wrote:
> >
> > Hi,
> >
> > On Mon, Sep 14, 2026 at 5:38=E2=80=AFAM Aaron Kling via B4 Relay
> > <devnull+webgeek1234.gmail.com@kernel.org> wrote:
> > >
> > > From: Aaron Kling <webgeek1234@gmail.com>
> > >
> > > This patch adds the device ID for the bluetooth chip used in the
> > > Nvidia specific Broadcom BCM4356 PCI-E WiFi / UART BT chip.
> > >
> > > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > > ---
> > >  drivers/bluetooth/btbcm.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/drivers/bluetooth/btbcm.c b/drivers/bluetooth/btbcm.c
> > > index 463d59890befe..14acea7325478 100644
> > > --- a/drivers/bluetooth/btbcm.c
> > > +++ b/drivers/bluetooth/btbcm.c
> > > @@ -506,6 +506,7 @@ static const struct bcm_subver_table bcm_uart_sub=
ver_table[] =3D {
> > >         { 0x6606, "BCM4345C5"   },      /* 003.006.006 */
> > >         { 0x230f, "BCM4356A2"   },      /* 001.003.015 */
> > >         { 0x2310, "BCM4343A2"   },      /* 001.003.016 */
> > > +       { 0x2409, "BCM4356A3"   },      /* 001.004.009 */
> > >         { 0x220e, "BCM20702A1"  },      /* 001.002.014 */
> > >         { 0x420d, "BCM4349B1"   },      /* 002.002.013 */
> > >         { 0x420e, "BCM4349B1"   },      /* 002.002.014 */
> > >
> > > ---
> > > base-commit: 49362394dad7df66c274c867a271394c10ca2bb8
> > > change-id: 20260717-bcm4356a3-bt-cd78cc0f42e8
> >
> > We need some more information, such as:
> >
> >     Test log:
> >
> >       Bluetooth: hci0: BCM: chip id 206
> >       Bluetooth: hci0: BCM: features 0x0f
> >       Bluetooth: hci0: BCM4384B0
> >       Bluetooth: hci0: BCM4384B0 (002.001.025) build 0000
> >       Bluetooth: hci0: BCM4384B0 'brcm/BCM4384B0.hcd' Patch
> >       Bluetooth: hci0: BCM: features 0x0f
> >       Bluetooth: hci0: BCM4384B0 AP6684P CN iPA [Version: 1030.1021]
> >       Bluetooth: hci0: BCM4384B0 (002.001.025) build 1021
> >       Bluetooth: hci0: BCM: Using default device address (43:84:b0:00:7=
6:93)
>
> Sure. This is from a Nvidia SHIELD TV 2019 Pro:
>
> [    9.802656] Bluetooth: hci0: BCM: chip id 122
> [    9.808481] Bluetooth: hci0: BCM: features 0x0f
> [    9.835172] Bluetooth: hci0: BCM4356A3
> [    9.837341] Bluetooth: hci0: BCM4356A3 (001.004.009) build 0000
> [    9.844428] Bluetooth: hci0: BCM4356A3
> 'brcm/BCM4356A3.nvidia,p2894-2551-b00.hcd' Patch
> [   12.171393] Bluetooth: hci0: BCM: features 0x0f
> [   12.198153] Bluetooth: hci0: BCM4356A3 37.4MHz Class 1.5 Nvidia mDarcy=
-0108
> [   12.203520] Bluetooth: hci0: BCM4356A3 (001.004.009) build 0109

Please respin including this information.


--=20
Luiz Augusto von Dentz
