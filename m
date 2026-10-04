Received: from mail-oi2-f41.google.com (mail-oi2-f41.google.com [74.125.231.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8198346F48D
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 20:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.233
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791147438; cv=pass; b=T/HKNKL3MZSRZApDxaVQU9AzB/X4o9tI+cH8RNAwjOZPdFA9rakppSxYYCT8FFT0UtxfgrqcuIUptfNdZsSuy1xmG4pa9MuLjKiLSLVrtCrmqixc1hFpUxLTIVex0JT2LnVrO3EolLaHBoO9PhnFQNe6WzNCwNp5dTsyYHkIEdk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791147438; c=relaxed/simple;
	bh=l2DWYrMPEPkpCBeEGbcDPTrkRXyWOflPOtrsbcHJFDg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VfeBZSfRp4t1l3NQAW0UfAVwHq/bXpRKT70mYe3wSqVJ+L7OxTLq0nbq9u/MOumHPVm4F8uQtvlFEi0uvdp1sfe09GvcmmpEPXty2fOhJu106JQYoIVyJUeXOZqLYEy4OcQ1XIg/o4i9tPwJKvnI/wkwX6o5ezNPO7dNXlo48OU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OwSY2Q7t; arc=pass smtp.client-ip=74.125.231.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OwSY2Q7t"
Received: by mail-oi2-f41.google.com with SMTP id 5614622812f47-4f74e4f3d3fso534828b6e.3
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 13:57:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791147436; cv=none;
        d=google.com; s=arc-20260327;
        b=Ihzq2diB25XG0CsdUQ99BtDZY4is5+Fj3hSUmCBjbIP0FOAFpDsL2WPgVSb5OhXcHh
         2s+oy/wsybl70YjmPDUJMssBslMv4fNouzQVcRNFPTZy9n5FWotUCLsPsm/TwS7XMuux
         WPttDrjL8iBtzJSx4CYyxOHhMjpJyhO5Ho4pny0oH00YoasE8Lr06UrIWFApZ/QoaYyR
         JB+r3E8Ne8UYPOWYWt+WQl74/xRILJMwoSAOOKd0gdFNYE7QPpSMsKdqHpoKiLy4lJzQ
         tL5OrR5Fw6LA1bffhlGeUycUm6iK6SMkNI7W/FGUb2IX3/JNpdmfk+4a4rfWldDiMAdq
         UXQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+gAZp/BShGctoAlT0g/webMwCwP75rSNvd4mdkXsmm0=;
        fh=b4JgFkFf4EZ3w5p73AlDwvH2MdHe1mzfsuqVXAwjiK0=;
        b=JBbI9j97S0GvJYJMk4A5ENW3gxRumeoL0s9SOlPt8tfj3qqm26iYfP8K2niJq1igYb
         d9huHSHgZy8+rDSvZZ/cnwuWlCkCydU1l3AGIIEzMpKnGub17s4Vj8+5ImjkqqRJ1GvV
         VfQCZ8yFpHxhzLZCvLj7871rVeztCX8PS9bVCbP7Q4y70/i3QUuGbH+zGXIxssotas9A
         NPHv3vGoO2cVOefjZojAojJ3zdYbwA7bOGAjrNE3CN1aRrCgPOkwcw890eeWtm98DjiI
         txgNbaZK6yVe9D/sHtJnMbcpfJW/KjBAr79qXs1fg7IdUkFFZ0gUMNqQ73hh6g9Alk1M
         lxiA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791147436; x=1791752236; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+gAZp/BShGctoAlT0g/webMwCwP75rSNvd4mdkXsmm0=;
        b=OwSY2Q7t/sSi5iPYIqUh98yNRWyIyoOWQLXQTSCdLZJh5WDAvnvmA5DLr0icwRuxe3
         xiX9j8I48Py1zP5pyb33kXcrV8h/a1c9FjKUErKombh4qmmRPODUHuGHlSS3za2Lvj2Q
         IChGacpuG54vi3GYWdNfjWXjjTpJjRcuhuc1yXh0EWk2dpEy1WHzh5SrhHPuOIGLpDUO
         8j1ifdtGekNQRIerjB20uf5DbdQxVUBREqOh8cDP9mCHa+0g4BTDewlwoEnGvo7vTncO
         pdHevkvPNDcGLBcdLuflzKaGefK3xPDufJ2+jsuaLVniqdMjQ3vGMc+uhQyvTmXNNfXl
         5pfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791147436; x=1791752236;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+gAZp/BShGctoAlT0g/webMwCwP75rSNvd4mdkXsmm0=;
        b=cMksvKRyFHMB7yOVEI011b7WTsXuhUZlXsQ8bsSo6BDYFMGNnnVimIEevTQMZOFbWi
         cL4YF/HvaCg/zLBLu/ZwMV4M+QDvy8qYZPkfWMeS/vK075h9vzVHuUFA/ZyPMt+0p25S
         3tozxLfbMdW9wsvjfG19u/ms7voiysdhQzF7xWnnM696Sp7X8uxmIMYYazSzlK6boK7j
         j0jKoiJpa0M42VtMO/2ZDkxuy/Vo+icBLk9fXm2ZLE0NjKG0r1qfV93ougADvHmuMAuy
         nyvwduBrvwPAFulzUlHNODAle2DOpm6+/UhyPJmDNPjZdXb3w58FvHoER5lauliTHCmt
         Eypw==
X-Forwarded-Encrypted: i=1; AKwUvByTs8kaVz/igNXXifRSpV/q5sOjphgJrGbyOQvDOXzJ5B7TrZfoKKH+NV+VPu6Pa0gbP9FHfxmIWl9KSHA=@vger.kernel.org
X-Gm-Message-State: AFuF++nfqY8gLUJihAXECDCY2w1JhprzcIrYeqM4mBYeTx3gI8aS/1TV
	aWp2enkIvlv5RgPxDNlB8iqOObD8b8MJ7PdFZVQsg7hTVGVEP+NQ3UQGcLF/42QzXTruQ4N8BVi
	8RsOXXRgSPUG3D3PN+us9ug9n6tL71Ng=
X-Gm-Gg: AYBFou2ggBmcH7TOFzG04Ur8cLwwZg1wQ5eVK+/N/s32HLq/V4FJ7ZWn/2f2PRN+UPP
	rdUf+71uJbFLKf/m+Ho6drfnUV/9A9IwbdBMJb+hz+LuvIac0ECuYwH2OrSsI46p8zFKYuwgc44
	xhol9yXKuLTwudH5HT70mawf2hmXaqE0PK1+a57rkyCOXkU5UFqFjdXuII2AIMkbva3GjQZy/cl
	duw9zf4MpDQDNJPSjWNn+P0iwoTe/5jTqyGyE5vBvmMxt31U5hPzNg3hKHAGoyp8X4hRMKB4hvK
	S1WO5xs+BhLcz9aLtyI5zoXwyg7Z472KHQvubmHAtET5BlTT9q79zmN1baQ0iIjA9ZKAsktqPS5
	WXbFbf+tDrA==
X-Received: by 2002:a05:6808:14d3:b0:4cb:26a3:a0dc with SMTP id
 5614622812f47-4f529a0c087mr8651948b6e.20.1791147436337; Sun, 04 Oct 2026
 13:57:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261004184246.1260426-1-mmyangfl@gmail.com> <8a9ec69b-0823-48b1-aac1-f40cb4713f23@lunn.ch>
In-Reply-To: <8a9ec69b-0823-48b1-aac1-f40cb4713f23@lunn.ch>
From: David Yang <mmyangfl@gmail.com>
Date: Mon, 5 Oct 2026 04:56:40 +0800
X-Gm-Features: AclHuK-Gqsq1sWsTwqtU_9nAXJD_m0-GFmjnDbkG-2Q4w2Mrh_J-t9h4WYXOnMc
Message-ID: <CAAXyoMP_8Pa3XpTdTttTP2HgQOrVqT-_P-vK-M1qJNi79Ed6RQ@mail.gmail.com>
Subject: Re: [PATCH net-next] net: phy: motorcomm: Add cable test support for
 internal YT861x PHYs
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, Frank <Frank.Sae@motor-comm.com>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 5, 2026 at 4:17=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Mon, Oct 05, 2026 at 02:42:43AM +0800, David Yang wrote:
> > The YT921x switches integrate GbE PHYs of the YT861x family (PHY ID
> > 0x01e04281) on the switch-internal MDIO bus exposed by the yt921x DSA
> > driver. Without a specific driver they bind to the generic PHY driver
> > and lack the cable diagnostic facility. Add a driver entry for them
> > with cable test support.
>
> Since this does two different things, it should be two patches.
>
> Does the cable test code apply to other devices this driver drive?

I don't have other devices to test with.

> > @@ -18,7 +19,9 @@
> >  #define PHY_ID_YT8522                0x4f51e928
> >  #define PHY_ID_YT8531                0x4f51e91b
> >  #define PHY_ID_YT8531S               0x4f51e91a
> > +#define PHY_ID_INT861X               0x01e04281
>
> Is this the ID of the switch itself? It does not match the pattern.

It's live captured from the system. By the way the serdes PCS does
show something matching the pattern 0x4f51e899.

> >  #define PHY_ID_YT8821                0x4f51ea19
>
>         Andrew
