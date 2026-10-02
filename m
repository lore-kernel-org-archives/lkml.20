Received: from mail-ej2-f40.google.com (mail-ej2-f40.google.com [74.125.228.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE0A4398F5
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 08:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790929394; cv=pass; b=oFx7Ag49yGlQGZykV79eSnQqvbng1Ks3Y2Cdhc3TBnkWTA/K/tQqit8PcAsWjVeey3Xurzfu+OV4z6LLcVOR+672twm7PIymP9SrYOj739pYHAbWyrceWlXSSQsfvOfwmP3b2qY2Gt79jQkn1TpJ4zrBSVtAJ/td4+wxvMS6DmU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790929394; c=relaxed/simple;
	bh=m82XSMNTiLgC95D6B78sYDiC94k+qp/Rz1jZL0ad/lY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HsPe0zhw7nS7tGGbz4VX8pJwefH0sZHtw45CBHhBidepJ1je4TerLdsTquQmWHZv30nthitQ4K/bt+YTRzpbtGMrIjkuZNomSn8A9oSokDZbsMsmJYqxVKaPg6MH1mVZ2c6LpYpbC2EKa4BVpJGLUSpu8dCgEz9ydJFqJQYuODY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AfReRHDv; arc=pass smtp.client-ip=74.125.228.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AfReRHDv"
Received: by mail-ej2-f40.google.com with SMTP id a640c23a62f3a-c2e402001e8so217217166b.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 01:23:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790929391; cv=none;
        d=google.com; s=arc-20260327;
        b=GjQ+nhcCYPODEah7TDUqV9vO+ISoIXQNBb2KciZtxeZbwk1ghWJvcZU05IPNrbE9uO
         HYdgu1IF6lFHRf5eR4toy38y72WarBKaJ8muRllUs6Gfr9T37j9qMtS5r4muhOkm4uOV
         hKoAxF5xxpxzt5lF1NRbS97+Nlsz4YwImnu1YLwNvA/qrCHfL7gqo/9LHpuwIoSLs3Dk
         jArfT/Hz0/FuwQmjkKzm+6kNt0Em7WvUpVpPe4m8gdO3Gj5ohH7ZW9radwE/qJl3bwII
         ZnHB4a7FddgyZkS67+JNcyyckZBSIixUgvCN7DB72RhyqwdRwHv85UawyIUBMi07ep0o
         J3gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Qtouuun/tbyI61TUwPZhkjhbB6nZifAWeutrTpGNCnw=;
        fh=CwtnIvWoHFajuLyIr4aBWD+MjbC5edEFTnjNLqye/U4=;
        b=DbyDzG6nxDBxhflZS58pd31oUoNOB+vxpKHOXfx9UE0MUEpIZmHVq9Vgwva5jk+8cc
         7h6l+gVA4/h9PV00AZBOUd3VaLj2NV9R4A4JZy1WLN/62bRwcrD/puMrqZIh4yHmkRSu
         ZkhMLv+Jy7VZvZUsVgbSeep2qtwqcjx0L9gaWWeP0a6qiDpDqVPq7z9PnTeGCEQ4aBci
         HrhypXog+6l9aTeJVqTfN1UuCT0bx5DX6m1vTZfG+eT9+VZ4sH9gbqQkQDp1AJVGasfV
         URtiDNTl0+y3A0G89z1DSKrS8S8jJABgJbJWY84UwzdWzYBwfUxX2j3MT1NnE+L8N/PY
         oNFQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790929391; x=1791534191; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Qtouuun/tbyI61TUwPZhkjhbB6nZifAWeutrTpGNCnw=;
        b=AfReRHDvSrGBGoehdBJBSMqxKN3Z4JokX9hetvuT4rdHkjVV7QDPc9GwODb/hsNJam
         ONRt6GAx/1izJ8G/0xLw9sNv/rfEqLlnYflwEwAQTeYF0d4kwsnK20tWMmySxaAvR+Jw
         JCjpzKYUr0iq2NvbgPw2HpofnhEIi54oP5GKCwH4orfj88H847X8FAnxzBGUTF+MglPb
         4ZJduZhwDV+zDY/nF8GmT8XzW7ZSiTU/JWrJ1Fk75sOtwJJwCCDCEOtuORcLKNMVeB3E
         ZKejrTZYY/uhHf7lxCJepZ99AM61ji9jaOYyS6aejZxMkJvYqmIYT03W/o08GPC1Nkja
         ygCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790929391; x=1791534191;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qtouuun/tbyI61TUwPZhkjhbB6nZifAWeutrTpGNCnw=;
        b=uoE+V53v/TPHRq/IRglc2ovOL26tADwbpy3C3hRmjxKop4hUQWsaVCPJJxpBQwG4zl
         N/yWaOiZA6kaW9c+0NbB65D18rbqP+GMSXIo9tDXOdfl/Qhcly4YREymoy6uAXwrCGtd
         jyJyjF78GUZOqiGtxaTB4TlM6v8TWCQHY+C7CaWSz9wHsd2GTeZIyBVbnZZzAfowQgyk
         FnxkAHa1UkKZFsse24ObgefkBw5APF5jnQBSKlKNXcFARjK6e2bwl/Ky3AtFfmbIGkta
         jN48TuwD3PT3liU8yyfrfnaHL5ifRcd/QB9cK1cDivm/AOIS9kGf3kysY4+Kdg3WiZ3d
         gMlg==
X-Forwarded-Encrypted: i=1; AKwUvBw1TpXVUx5AxrjnfKrWXLhSHF7g9i2DDWlJFposK4fACoR5EHt84cr18lh+N27yP2XIYtI2Qk25TIIhFwI=@vger.kernel.org
X-Gm-Message-State: AFuF++l3xX2lR8xP2jxrrtHZXqLFbUZeEuMMSfHSdyDKsriBcS0L1enL
	akGOnO9MUZcCWaUkqVrnJ2Rjak+ri61+Zx4Ti3Y3Vj0rotGR29h12qzg1NToS3cze30G3//bm+j
	N2YmJ9jdlHspxBX+3JPD5GZJNkAomp1U=
X-Gm-Gg: AYBFou3Ol5GcseqRz23c3VK8tYScpSliU54Wl8t13iPrP04y3z+qLQhLJOMGam3k/BN
	N9rBRQtpIEF8CQx45QwSYLcoZRV4BDIksSLM2zcML9x1qBw02k5pUM+yl6cLbzLNjzSJkcILysF
	KNHJZAKZEc53TDMY17sXbEOZZgc7qQHMq7mL+CSaKKmOjfW5G4xhKKeFD2GEzS5UfvaIp/SmPZC
	rbzqne08oh/KHdcTHSvrwPelUhSu34FVzI6cgm7P2GHNOE1HHu65Dwyq8J1JFATr2gAEm1nN/WL
	w0+Xmhsd042lXoIL11/RfyvjTplF41TC9TGcKV8gj+hyeL62/3QkNuC8WW9k/vLb1zeAFiKsxmH
	u9uo90urfheODOjbuCr5esNyRgfmZ+9cJgbYsmgaiMKmAXXoHzI7nwoTcwktGLTRPvHU3jOo1Q4
	7FT3eI5jSgDWF7K+SOT1K9Kf4AvrkFEDyPeOvb8POZZz6Hps0auWzt
X-Received: by 2002:a17:907:5c7:b0:c29:f5d5:5a9c with SMTP id
 a640c23a62f3a-c2e4b241d7fmr137425766b.38.1790929391172; Fri, 02 Oct 2026
 01:23:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAO7O_xi61=0kUtYkYFKonaSEJRC_KiXKvgMLSwRbnDTVfmQsPg@mail.gmail.com>
 <CAO7O_xjcw60io6maT2J_dPOxMcAe5k_=u6UCuo59nsd_0W+4xw@mail.gmail.com>
In-Reply-To: <CAO7O_xjcw60io6maT2J_dPOxMcAe5k_=u6UCuo59nsd_0W+4xw@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 2 Oct 2026 11:22:35 +0300
X-Gm-Features: AclHuK_S5b7kz2s_hkF12XOALWuj04SzAGhc0YKCIgdaLJIkJrUOPC2GCBhIOzI
Message-ID: <CAHp75VdeXCDBpvsom2YokbS2QbbCzrGGf_NXYdLFTq3cLeam_g@mail.gmail.com>
Subject: Re: [PATCH v8 02/15] media: ov8858: support 19.2 MHz clock and manual
 white balance
To: mauriziocasciano7@gmail.com
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Bingbu Cao <bingbu.cao@amd.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Nicholas Roth <nicholas@rothemail.net>, 
	Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 2, 2026 at 11:17=E2=80=AFAM <mauriziocasciano7@gmail.com> wrote=
:
>
> Support both 19.2 MHz and 24 MHz input clocks. Move the PLL and
> global-timing registers out of the common mode tables and select register
> settings for the detected revision, lane count, input clock and 360 MHz
> link frequency when starting the stream. Use the actual input-clock rate
> when calculating the reset delay.
>
> Add standard red and blue balance controls for the sensor's manual white
> balance registers. V4L2 defines red and blue balance relative to green bu=
t
> does not define a standard green-balance control, so keep green at unity.
> Accumulate errors while programming all three channels.
>
> The manual white-balance register definitions and programming follow
> Intel's GPL-2.0 OV5670 driver, so retain its 2017 Intel copyright notice.

...

> -#define OV8858_LINK_FREQ               360000000U
> -#define OV8858_XVCLK_FREQ              24000000
> +#define OV8858_LINK_FREQ               (360 * HZ_PER_MHZ)
> +#define OV8858_XVCLK_FREQ_24MHZ                (24 * HZ_PER_MHZ)
> +#define OV8858_XVCLK_FREQ_19_2MHZ      (19200 * HZ_PER_KHZ)


Sakari, you see, still inconsistent. If we really want to use
multipliers for XVCLK, I would prefer to see the same one, so 24000 *
HZ_PER_KHZ.

...

> +/* Keep input-clock programming separate from the common sensor setup. *=
/
> +static const struct regval ov8858_24mhz_360mhz_r1a_2lane[] =3D {
> +       {0x0302, 0x1e},
> +       {0x0303, 0x00},
> +       {0x0304, 0x03},
> +       {0x030e, 0x00},
> +       {0x030f, 0x09},
> +       {0x0312, 0x01},
> +       {0x031e, 0x0c},
> +       {0x4837, 0x16},

> +       {REG_NULL, 0x00},

Please, drop trailing commas in the terminator entries, like above.

> +};

--=20
With Best Regards,
Andy Shevchenko
