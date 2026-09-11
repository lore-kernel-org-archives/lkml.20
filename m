Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E47A47FAF3
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 13:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789131647; cv=pass; b=tfYPl0imWDichug8PGCgYbCRIwb0071x4zmyWuMRBuCsVSgpQIfzyyYsQ4pp9whkGTtYn1Y6FCUJ2i7VMWSoTkA9SfSoYeR7V00M9G7Mx/y9LbDAVxsjWHoQfNzYjUt4ws2A/CbdCFIZH63AvesquZdoLVT4cWxxQ+vVY+GlpVE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789131647; c=relaxed/simple;
	bh=vDBTv3fOexzYO5rkPW18CTCayYS+jtMrmoWU5+Ck4KM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q5PVJIyev/Tow3wYLlYph02lzHLL3PX5EIvXp05DeK3BSaPqHtD80YNcsEuPrSEFBozNn8kodQ6v7faaEQu4/VYSe2DDQxGgoyyz2mn2VA7k36IfOwLXVbh4X7e1wUMzwHKejv00dWBjhYvcMiqdbas6UkVEazjoY8ACavx+Osg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EpCJjqpC; arc=pass smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EpCJjqpC"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-66fca0709caso790681d50.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:00:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789131633; cv=none;
        d=google.com; s=arc-20260327;
        b=GtJlV0PmdjKw74grhTnkOArAahEf80uqdeIU87lhRA6akL0SsHVSTpvWrlkQo0ZSVV
         InLTTHVakZtu3CHwrvsR70WqptqpIX3xRY2Rk1KR5fRZGkYHEWS/6kWR7vlESmcPif2n
         n4bf6lGGBB/IjIBfM3ThA28E7qqIQE2PaEnAykXUfxF5V+cJiETpXZczdgKwTSOX5Mzs
         XLAljOWwXZwJ9qOLMVMBd5DQQ2Az6dD0iXRyq4iRIyk5Q9ppQhXB053+N25D9XFFnZ+T
         lEtkFyb8VtJNrtz8aGhdjiEU84lcTzaRcsFE15RQsSLicsQqY9fEciR8P+mbCXSVIa2F
         vyFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=71sRhITUgyVcuhu2B6J70520Q+kqG3gUVeTPx6xYfMs=;
        fh=kzP/+JAyC2Ai1BQSg+E8Lpe20dv8s5FBkOX5ECtKlYA=;
        b=AlAhMiKBAZv8wff8DMJo4IXUSayRj09zYnif0UN0EHO2HbHMhNMRj4hLPTjLSRgw+A
         TeCdUg4dtjdTbn94rN54qj2bJ1H3MxBI1rK3v1wb+oC7+OghSngNUpf+zHE8RMTEkyOr
         SSgxk7GPE/xjgyJp07inbfU7a632i89GdTMGxdcyBZtf19nXDsfF/UZljXHx15cKGSud
         lX01LH9a+felJ+g0YeYPiL80YGyq2jcgIkQV7sdt+6SLoX8grydPDVIRYjl6WH9e4DAI
         QkHPc+faxEP48Z7wpuWhQTt2m226/kVQgfKUI9oXYRd8Co8vTHVzw8VhLa1MlXNgiX45
         JJhA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789131633; x=1789736433; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=71sRhITUgyVcuhu2B6J70520Q+kqG3gUVeTPx6xYfMs=;
        b=EpCJjqpCMZ32os3pI/68UqLyJXZuiFpVgntEQt6vKgJG6h5Cfpn/hUbnXTO2vs+Gdy
         cbEFbylX8yxOfcZsadDAwzUrz8IevUD7BJ2jTlhbJlUQYop+6mLRnW6U5eQClPIZdQZC
         jiVj6O17FcD3o7ETYcvVlLETYRyYb9bNGbwLF/7ZBEVlzdJwo8Z/pSVJQG4SC9w3ZiDy
         y/JktcrT39hVjLHVtWeuAVQy4Om+TEO887yT3Yb34d5VOBq0/hPV74g3HHIVHKI5/Tn9
         CiP/Cro+zSmAOoHNAJXEa6oWwKdVckLkac05sTGgrKlWLI5FepGMAXIOQAQ3S2EmJeLK
         msxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789131633; x=1789736433;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=71sRhITUgyVcuhu2B6J70520Q+kqG3gUVeTPx6xYfMs=;
        b=DdlSZSsx42EInGMN/wSepdG2vRuD/35a8AN30KERn2iJDqSm90LJjXF5js/cjlAvfO
         MoHy3Ws9Uap3b1q3Y/dfuNHT5nCvVrymXzgvA2n1xMIgXl4GBTRfe/2zKvGoSuimnb77
         rQOmK746y43z2RznFJqreOakO7v+rKPwswn/eyhXr5kAjyaecW6RAoQcw53y9pmBmimF
         +VQqFcPIGyW8rXOs/jlgITo3rVSzbRXGn1bBa3jDIfQBo8K3e+21mJlYZZiL+zBGtLE5
         OwYuEG+KErpq56zbSTS7q150rJYns/zHNgFLUVC+S57M5KBvyQI8xNHzs65Ebkx9cidB
         i1xA==
X-Forwarded-Encrypted: i=1; AKwUvBy/T7dgSb1PsLdJQSOFvMa+llrCXCepZEV1b+a3sceO5yNYKVXifuSynjh+GpnbJ3QHuOBVqPzPpBzIQLg=@vger.kernel.org
X-Gm-Message-State: AFuF++mm7YCy7hOA17H7M3sdvMsrwC2Yiptqd2FJ3rPbPscDvEWUkc3l
	PgcKRpeC6iMlqlVWu5jndN64vkl6lB047fSphXKDJeDzfi8AHwByFwdFmUE2kYBlwVc0cSPft50
	OJCz6kKnShZHj4SSW5nJJAZpdg5X1snk=
X-Gm-Gg: AYBFou2y6fjt/z65EQNWA7o/aGWNU9Bc+PDn+syFIoUk1I274y8IIsZqNZM3VVhT12l
	ns4nwz0WAMjH6Gg9jE3nWyQLRt6mhWfYeHhgaD/DxP0gFAeTHklAZ92eqQV8PhYCKO8vicYCUXS
	eInG793X/hyKiJTQ5g0NO3rarJyysVaPvxO4LoY6p+V6ibdGag6QQVaWIFTHJCw4SoMzBCZFOUH
	dfiPtz4WJneHlNhFkvOIjxdZVUMeNdLitPOMpbBa4+sAEuMl7R93warDGErkhxEFOM/6jxT1Im/
	fsUtNehNAochOIQclkAqU6siYvFj7tCZ2as+hR7TLHABuTR9fkbke24LiA==
X-Received: by 2002:a05:690e:488e:20b0:66c:5945:9aa9 with SMTP id
 956f58d0204a3-6712461cbebmr936456d50.36.1789131632679; Fri, 11 Sep 2026
 06:00:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910130140.910-1-yogeshgaur.83@gmail.com> <46807790-6f07-4f0a-b50b-375cc1c9b061@gmail.com>
In-Reply-To: <46807790-6f07-4f0a-b50b-375cc1c9b061@gmail.com>
From: Yogesh Gaur <yogeshgaur.83@gmail.com>
Date: Fri, 11 Sep 2026 18:30:19 +0530
X-Gm-Features: AcwNN1WosfmB342DtuPNuTCjuNM6UWUvZ9yc1W0NfhTvgLFpYG3YSbUqPvbLeBw
Message-ID: <CAG6enPy441a-cyzsP2_WoQ1+4rj6gikWzOrNmX6yXx1mOo-M1Q@mail.gmail.com>
Subject: Re: [PATCH net v2] r8169: don't enable chip LTR when the platform has
 not enabled LTR
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: nic_swsd@realtek.com, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Javen Xu <javen_xu@realsil.com.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2026 at 1:03=E2=80=AFAM Heiner Kallweit <hkallweit1@gmail.c=
om> wrote:
>
> On 10.09.2026 15:01, Yogesh Gaur wrote:
> > rtl_enable_ltr() programs the MAC to generate LTR messages - ALDPS_LTR_=
EN,
> >
>
> Empty lines, mail formatting issue?
Yes, I would correct it in v3.

>
> > LTR_SNOOP_EN, LTR_OBFF_LOCK_EN, plus LINK_SPEED_CHANGE_EN on
> >
> > RTL8125/RTL8126/RTL8127 - and rtl_hw_aspm_clkreq_enable() calls it on
> >
> > every ASPM enable, then goes on to let the chip trigger L1.2.
> >
> >
> >
> > The only gate is tp->aspm_manageable, which records that the OS is allo=
wed
> >
> > to control ASPM. It says nothing about LTR. LTR is a separate PCIe
> >
> > capability that only works if every device on the path to the root port
> >
> > supports it. The PCI core works that out in pci_configure_ltr() and
> >
> > records the result in pci_dev->ltr_path; per PCIe r6.0 sec 7.5.3.16 a
> >
> > function must not issue LTR messages while LTR Mechanism Enable is clea=
r.
> >
> >
> >
> > So on a platform whose hierarchy has no LTR path, the driver tells the
> >
> > chip to start sending LTR messages nothing will honour, and ties ALDPS =
-
> >
> > the PHY's link-down power saving - to them. A report against RTL8125B
> >
> > (rev 05, firmware rtl8125b-2_0.0.2) in a mini PC shows the effect: 291
>
> Did you verify that this is caused by LTR messages, and not by any other
> root cause?
>
> >
> > link down/up transitions in one eight-hour boot, with repeated downshif=
ts
> >
> > to 100Mbps, against four transitions at boot and then a stable link on
> >
> > the kernel before the LTR change.
> >
> >
> >
> > Gate the chip's LTR programming on pci_dev->ltr_path. That field lives
> >
> > inside CONFIG_PCIEASPM, and without ASPM support there is nothing here =
to
> >
> > enable LTR for, so compile the function out in that configuration.
> >
> >
> >
> > Note this does change CONFIG_PCIEASPM=3Dn builds, which used to program
> >
> > chip LTR unconditionally: pci_disable_link_state() is a stub that retur=
ns
> >
> > success there, so tp->aspm_manageable ends up set. The PCI core does no=
t
> >
> > configure LTR in that configuration either.
> >
> >
> >
> > Fixes: 9ab94a32af70 ("r8169: enable LTR support")
> >
> > Closes: https://bugzilla.redhat.com/show_bug.cgi?id=3D2529752
>
> Did you verify that your patch fixes the reported issue? Or do you
> just assume this? Because in the bug comment history I don't see
> a statement that issue has been resolved.
I don't have a board with me, hence have not verified it. I did a
compile check only.
>
> > Assisted-by: LLM
> >
> > Signed-off-by: Yogesh Gaur <yogeshgaur.83@gmail.com>
> >
> > ---
> >
> > v2:
> >
> >  - Gate on pci_dev->ltr_path instead of reading PCI_EXP_DEVCTL2 directl=
y,
> >
> >    and compile rtl_enable_ltr() out for CONFIG_PCIEASPM=3Dn, where that
> >
> >    field does not exist and there is nothing to enable LTR for.
> >
> >    Suggested by Heiner Kallweit.
> >
> >  - Commit message notes the resulting change for CONFIG_PCIEASPM=3Dn bu=
ilds.
> >
> >  - No change to the RTL8125 register programming itself.
> >
> >
> >
> > v1: https://lore.kernel.org/all/20260909110554.1977-1-yogeshgaur.83@gma=
il.com/
> >
> >
> >
> >  drivers/net/ethernet/realtek/r8169_main.c | 13 +++++++++++++
> >
> >  1 file changed, 13 insertions(+)
> >
> >
> >
> > diff --git a/drivers/net/ethernet/realtek/r8169_main.c b/drivers/net/et=
hernet/realtek/r8169_main.c
> >
> > index ec4fc21fa21f..05f7a44aff01 100644
> >
> > --- a/drivers/net/ethernet/realtek/r8169_main.c
> >
> > +++ b/drivers/net/ethernet/realtek/r8169_main.c
> >
> > @@ -3035,8 +3035,16 @@ static void rtl_disable_exit_l1(struct rtl8169_p=
rivate *tp)
> >
> >       }
> >
> >  }
> >
> >
> >
> > +#ifdef CONFIG_PCIEASPM
> >
> >  static void rtl_enable_ltr(struct rtl8169_private *tp)
> >
> >  {
> >
> > +     /* The chip must not issue LTR messages unless LTR is enabled on =
the
> >
> > +      * whole path up to the root port. pci_configure_ltr() works that=
 out
> >
> > +      * and records the result in pci_dev->ltr_path.
> >
> > +      */
> >
> > +     if (!tp->pci_dev->ltr_path)
>
> Simpler would be:
> if (!IS_ENABLED(CONFIG_PCIEASPM) || !tp->pci_dev->ltr_path)
>
I tried that and it does not build, because ltr_path itself is declared
inside the #ifdef:

  include/linux/pci.h:443
    #ifdef CONFIG_PCIEASPM
            struct pcie_link_state  *link_state;
            unsigned int    aspm_l0s_support:1;
            unsigned int    aspm_l1_support:1;
            unsigned int    ltr_path:1;
    #endif

IS_ENABLED() is a C expression, so the member reference still has to
compile even when the left operand is 0:

  drivers/net/ethernet/realtek/r8169_main.c: In function 'rtl_enable_ltr':
  error: 'struct pci_dev' has no member named 'ltr_path'
       if (!IS_ENABLED(CONFIG_PCIEASPM) || !tp->pci_dev->ltr_path)

> Then you don't need the stub function.
>
You are right that the stub function should go, though. v3 drops it and
keeps a single rtl_enable_ltr() with the guard inline:

        static void rtl_enable_ltr(struct rtl8169_private *tp)
        {
                /* comment */
        #ifdef CONFIG_PCIEASPM
                if (!tp->pci_dev->ltr_path)
                        return;
        #else
                return;
        #endif
> >
> > +             return;
> >
> > +
> >
> >       switch (tp->mac_version) {
> >
> >       case RTL_GIGA_MAC_VER_80:
> >
> >               r8168_mac_ocp_write(tp, 0xcdd0, 0x9003);
> >
> > @@ -3120,6 +3128,11 @@ static void rtl_enable_ltr(struct rtl8169_privat=
e *tp)
> >
> >       /* chip can trigger LTR */
> >
> >       r8168_mac_ocp_modify(tp, LTR_OBFF_LOCK, 0x0003, LTR_OBFF_LOCK_EN)=
;
> >
> >  }
> >
> > +#else
> >
> > +static void rtl_enable_ltr(struct rtl8169_private *tp)
> >
> > +{
> >
> > +}
> >
> > +#endif
> >
> >
> >
> >  static void rtl_hw_aspm_clkreq_enable(struct rtl8169_private *tp, bool=
 enable)
> >
> >  {
> >
>
