Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71BF736A03A
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789020083; cv=pass; b=hufO1wheuTkH+a+SVmVzFeAph6OrErFgzRPotkkVBYobXfmbJMHJdTKg+gW8t6tgJfPwR8rnKYNZ/xbdJ5mbbawnRD6yCay/9429d0q/x7lZ0B2hrndu20WnHvZzDqW4rEeO0xcbfIBlA2MZ7YXWIlJCvhnL7dM7bMUC6gM6/Ys=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789020083; c=relaxed/simple;
	bh=LOdLAksc3vv/+ppixjy8QYh0hZ7jHElvArFp6buh2kw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fHNc5KebBLS9Fu7KS3q4xYKgQocP3CT9vFtF5XbGqsdPniN2uWNsicHGgg6sAMF5vp6ij3t4q/6P5SI9wGvlOwRbGtuCrUNlZ2ukv5BYdVgDbCbD2WBJan0GiGqnJsI+vfr8ha4IsoQFsnfYOcExDtkOYw3/wk2GZcuuQ5tU6CQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QqgJhqym; arc=pass smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QqgJhqym"
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-6711693e489so385128d50.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 23:01:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789020080; cv=none;
        d=google.com; s=arc-20260327;
        b=jLfz2TY1WwBsL7eO1aWbmEVumKmiadYvMS1JRvwG4WWxgYRaHNiQMIm4mMtloRZJ+7
         APf/Vk8RMq08UFoDmkW9AXTWlnWPULLYFAhyR1iv20NYedGIjlBA+0/r3RNsdQJuJdeY
         tTksJ3nG6Y94XOUssmXBi2LHW8WvbBMjszGhnI7dMzPRSXAyX35C4LrNx5+bJFcea2Tx
         ni8Twkl8PsxM6Ey2h/d+fJ/IUkc+wh5SKagDLsJDFvNuAwGju/fg4e/PKjcYX/yWFJ3z
         58FaUfAwglcGqjj2GDvChKV2E2PMvmT5/flt9dN5JP/ARYfpW94M79+tFgSmEiET/Cxa
         kadw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Qti+f/oJAK/18/VDlrDQmLa1ahwGJWvq9bQwBINz2Pk=;
        fh=T4pGzj+DFwT2RG+TwcsPLmNIknDD+em+WSse5yirVv4=;
        b=N3ZtCLvXLFFZfc5ItmWdiUhD5YKD+beNONyMbUGyu7GuFbORjroVh3p41+gdx9RQxx
         SnrnZcbCV7r18zZ5f/71zY+1ZiJlnWA0tzkvDe4fIYn4NK321ue8EiAij1IIQGJvIICN
         us88pifDyh3GvADCnruBPYv0HSD2Mu+vdz5RSEV1hlrioDY20gDf3fG9W3GNIupaWFQA
         G/MrZIQ4VHuGaGejMDhLCEeh00Q+XEkk5SzJNQqS91okI6u8mUGvXLzMbeTVlZpFqYut
         SqQc1rUmeGcJazGfSZuJSEP1v/aNFzPWwODynUqgawHoD+fhdkR08cSPCCwTc0t3SPwo
         5BqA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789020080; x=1789624880; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Qti+f/oJAK/18/VDlrDQmLa1ahwGJWvq9bQwBINz2Pk=;
        b=QqgJhqymfyYsTOpD9+lqg0mmsz4TC1Q5MFBt6jJmUTPKMBpdaJdtB0DSSyDY4lkc7A
         3ddcdVSGdhuAuJGBjeqf4lpnSeqxHWUw12hvV5VWLXonRg7uhF/JzwQfLj+Uh17F5ZlZ
         gT5Kymt8mcpRNeeCNTh0PnDvlWbVAcdu6nbIbDpq5hecarDGIlqnyTUttBKnu/gYI9WG
         g26BiZRxbqLgIJZuehMiC2sOQeU7nVc7K/sGl39MoayibmPDBlYIC0Z6O0K81heRB+LI
         O+GlRdZ+dOjsdba9Zain3Rl/9gRWeQP/H0qaPSg0WoHd8By6m5eUwjdXr6CvUpFQ6hZo
         a0rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789020080; x=1789624880;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qti+f/oJAK/18/VDlrDQmLa1ahwGJWvq9bQwBINz2Pk=;
        b=LLC0QParrq+PDt3DqGzyxX0uCiQkWAdlpR9XNfe1ZQXe/LHs3BYjrO+CnqPg7vypPb
         tsX74sw7w0kGRLsQsJfAXBGGGgvWmM8nDwSmv/6aJsJohSx1+lWZ16Ee35QKxPVqpet4
         pb/G/F7iPN23U/xyzSgSCFhXUa1V4dI2hd5EemzURo6xA5LPccBplx9ADnlrEDmCP+dd
         CknquIM1+5Q6Si353qDRTI/s6RWbJFB6iinDXjslaNT/+HLSaHnCySC2+CFxAxk5Lhrr
         WWhBFnJtpYTNrLkyYM8pIfgxhBzbIe7ZPMgawqPH53GQjh9hIMb/LEmY6e6rTmaHz9O+
         /7uw==
X-Forwarded-Encrypted: i=1; AKwUvByxV1HtA9vvNAdHp7x1N3K/4S2DzceVlnlzmaDith6ApHolul1iTujkmyocVf9qXhV7CO15ZC32whSUowc=@vger.kernel.org
X-Gm-Message-State: AFuF++m3VmxadezIO45GUVP6StDMox4OI145a63gM7iNoforSWQYIxaL
	bI/AMh53Y1Hmoz5bcdR31TZgAxa4+GVG3+Q2l+k4DD2pLcHSvlLQTiQ0ey/rYyWxWK0u34DHdJW
	XQKTmzBZV8Xi4xUTsCJ7qzib14p/aUfJL+rPz0CM=
X-Gm-Gg: AYBFou3c0RtMa3qgTxMqvo8nJmjQOJjj4NTEoVTQuXQgTK2/iif/Jtsp6Wnsj6WI/x5
	dsuoEWy+Sc1LX57Z+NjI/40Q7K9u7nF2oxslYkSgUoodeGQPNucIWOSODg4IkGpoS43Emikpwko
	IZCgF4Vz3zXGKdCTWhAnNciuQvgOASVM/WSZTD2jZYFJ2o5LjVZ4mN8BK6DltWdaMMHJzKb1szR
	sGzDh+IMgCCv++xE9NCY1fq4EHpB98nynKAx/o+Q5VdLoDSlRtifzCFQTHqFZMAnZRuY+oIv4Kx
	C/SC5ahAWl/k1sqJ6f/EncuAP6DD0ZuEnD6LPzxjs1vS6uzXn2bd7Hk=
X-Received: by 2002:a53:c9d1:0:b0:66f:c1bc:409e with SMTP id
 956f58d0204a3-66fc1bc4819mr8806093d50.97.1789020080251; Wed, 09 Sep 2026
 23:01:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909110554.1977-1-yogeshgaur.83@gmail.com> <9c34a1dc-6147-4369-8d12-9c5939d07530@gmail.com>
In-Reply-To: <9c34a1dc-6147-4369-8d12-9c5939d07530@gmail.com>
From: Yogesh Gaur <yogeshgaur.83@gmail.com>
Date: Thu, 10 Sep 2026 11:31:08 +0530
X-Gm-Features: AcwNN1UxujX0fbHAr6e7AI_aW17cDQHle847cKnhdbRyH0VvmfFDV6ofYV47Sqs
Message-ID: <CAG6enPw36egoW=ezg1nnRvKEK5EEQX1h=j_TiRTE7F7PbxY8sg@mail.gmail.com>
Subject: Re: [PATCH net] r8169: don't enable chip LTR when the platform has
 not enabled LTR
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: nic_swsd@realtek.com, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Javen Xu <javen_xu@realsil.com.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 10:05=E2=80=AFPM Heiner Kallweit <hkallweit1@gmail.c=
om> wrote:
>
> On 09.09.2026 13:05, Yogesh Gaur wrote:
> > rtl_enable_ltr() programs the MAC to generate LTR messages - ALDPS_LTR_=
EN,
> > LTR_SNOOP_EN, LTR_OBFF_LOCK_EN, plus LINK_SPEED_CHANGE_EN on
> > RTL8125/RTL8126/RTL8127 - and rtl_hw_aspm_clkreq_enable() calls it on
> > every ASPM enable, then goes on to let the chip trigger L1.2.
> >
> > The only gate is tp->aspm_manageable, which records that the OS is allo=
wed
> > to control ASPM. It says nothing about LTR. LTR is a separate PCIe
> > capability that only works if every device on the path to the root port
> > supports it. The PCI core determines that in pci_configure_ltr() and
> > records the result by setting LTR Mechanism Enable in the endpoint's
> > Device Control 2 register; per PCIe r6.0 sec 7.5.3.16 a function must n=
ot
> > issue LTR messages while that bit is clear.
> >
> > So on a platform whose hierarchy has no LTR path, the driver now tells =
the
> > chip to start sending LTR messages nothing will honour, and ties ALDPS =
-
> > the PHY's link-down power saving - to them. A report against RTL8125B
> > (rev 05, firmware rtl8125b-2_0.0.2) in a mini PC shows the effect: 291
> > link down/up transitions in one eight-hour boot, with repeated downshif=
ts
> > to 100Mbps, against four transitions at boot and then a stable link on =
the
> > kernel before the LTR change.
> >
> > Read the endpoint's LTR Mechanism Enable bit and leave the chip's LTR
> > machinery alone when the platform did not enable it.
> > pcie_capability_read_word() zeroes its output on error, so an unreadabl=
e
> > capability takes the same safe path.
> >
>
> Thanks for the fix!
>
> > Fixes: 9ab94a32af70 ("r8169: enable LTR support")
> > Closes: https://bugzilla.redhat.com/show_bug.cgi?id=3D2529752
> > Signed-off-by: Yogesh Gaur <yogeshgaur.83@gmail.com>
> > ---
> >  drivers/net/ethernet/realtek/r8169_main.c | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/drivers/net/ethernet/realtek/r8169_main.c b/drivers/net/et=
hernet/realtek/r8169_main.c
> > index ec4fc21fa21f..c1ff4e898570 100644
> > --- a/drivers/net/ethernet/realtek/r8169_main.c
> > +++ b/drivers/net/ethernet/realtek/r8169_main.c
> > @@ -3037,6 +3037,16 @@ static void rtl_disable_exit_l1(struct rtl8169_p=
rivate *tp)
> >
> >  static void rtl_enable_ltr(struct rtl8169_private *tp)
> >  {
> > +     u16 ctl2;
> > +
> > +     /* The chip must not issue LTR messages unless the platform enabl=
ed
> > +      * LTR on the whole path up to the root port. The PCI core discov=
ers
> > +      * that in pci_configure_ltr() and reflects it in LTR Mechanism E=
nable.
> > +      */
> > +     pcie_capability_read_word(tp->pci_dev, PCI_EXP_DEVCTL2, &ctl2);
> > +     if (!(ctl2 & PCI_EXP_DEVCTL2_LTR_EN))
> > +             return;
> > +
>
> Can't you simply query tp->pci_dev->ltr_path instead of doing this low-le=
vel
> PCI register read? When reading through pci_configure_ltr(), I think this
> should do the trick.
>
Thats was actually my first version, but it does not build: struct
pci_dev::ltr_path
is inside #ifdef CONFIG_PCIEASPM (include/linux/pci.h), and r8169 can be bu=
ilt
with CONFIG_PCIEASPM=3Dn.

I think we should keep DEVCTL2 read. It is what other drivers with this nee=
d do
- rtw89(rtw89_pci_dev_ltr_enabled()), iwlwifi (pcie/gen1_2/trans.c),
qed_rdma.c,
rtsx_pcr.c all read PCI_EXP_DEVCTL2 and test PCI_ECP_DEVCTL2_LTR_EN.

Please suggest.

Yogesh

> >       switch (tp->mac_version) {
> >       case RTL_GIGA_MAC_VER_80:
> >               r8168_mac_ocp_write(tp, 0xcdd0, 0x9003);
>
