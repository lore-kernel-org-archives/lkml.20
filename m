Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C1FA34D397
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 14:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789136406; cv=pass; b=BQcgMaWS/6g092/kh3aWhbBWj4IpuuP7MrBs6FeJgTmpz5v0En7DiSmGaUIiX0xSPowe3JzRgbbTqmE29BCrxAKCDF4hKQ8Q+3cQphGlEmKg0PeUO0aq0AK+1NqUYSRQBQx3uEciwXWrSXy4Rhs7XZPFqMxrm9Qq9yislrKVmJo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789136406; c=relaxed/simple;
	bh=RMor0UjpnIQerIf6eU/Oyu0zv/c7ZStsziFIsf3kuhk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J6S+AnAdecUebVMLQWRYdjAy+UQpIc46gSoyUyePKlr0PzLQG69GNLiv1BG34en1GJa8rtxi0lzVOa2O2qOZk1LyXZjTVGmpOVCHe1Hrp6Z4Nu+WC88aL6+m96auKPKb79898lre5wBQQkoXFb2o8SBhyNkmNR78fIa3PWtmOjM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fdL2qifc; arc=pass smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fdL2qifc"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-866e57f63a3so8668827b3.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 07:20:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789136403; cv=none;
        d=google.com; s=arc-20260327;
        b=bZy0KUFUmvqjT3cIIEK0dPDBJ2dsI5lgwKPFu69qRP/GGlllgD+hjhjaeukzJfxYi4
         4Bz/l7wEFf1w+kh742al6HRD77vNxEzRCg6CXokvbeBrqrNt85rLIJPVZpap7J0A4zvF
         ej4qXmMv8gZvQ37iFXgCc1zCqKb06jrJhJxxu69q3HMHATSh87/OjAVuUn/uQU3AhHtZ
         +N22QBalcr6GBsDTOcWs5h1YUfA1xAWi/7uyVM8L7+9v58NufYTCVxydxKi8/KbJyYos
         vkwqqzlpuceIvqiXQGdTPIXDB79AtfXNTT/AQ0Hsma1DLEH+7G2iTfbxtWokX1URrItP
         F7ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=r3Yt5+Zdt1a8UShs4GHn2PBuNhJp4NwVMMMb48n+Y2U=;
        fh=ED9EZ5m9O1XlOyOR8DsmX+343elDnX+EW2dCLfOaUVU=;
        b=efs6nZb1aRDDAvFmFIkdIKBUMagop6WUUdt9k25ZsePSf0n1gU7vPz1+9dJgsw2iNE
         vlx4HaJGsjVTpDYatLaXD8YiR+0HVbUKjEFqEmmnzxPqoaaqIvANNHsK03eh29HuuFSW
         XL4mxbihu6bz//UJBrRscEaoHWPmMkm3n3P9v/RoheKEoL2g74EYB91D9y6Qk6dECevI
         ndx4Ppx/muWyoUv7kN55+YgmSwbsp0JVT8hCPxiyVCVXxd+6kE9NUvKQ2P9ONcp9r6OX
         Bca38rcaM0SWj9u/cQRfNVI0HbQ3AVQtvMMcAx7bCC1ZUgymg7Rje9nbj/y5P0eP7CcP
         0VtQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789136403; x=1789741203; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r3Yt5+Zdt1a8UShs4GHn2PBuNhJp4NwVMMMb48n+Y2U=;
        b=fdL2qifccc1qJeebD0Gtl/rzve7bzFVTzLIr5T8cvaSX4T5bO4I/b8942VVpD2U2ua
         9varJyHhP4xEP3VGBU0wQ55Jz648Fs5y9VeywvW9lp68Pfibgb8uxq+PQSbxhfDLpN+i
         fr7tlM/UVZJCMhoU8ls1E3tFuvzyvLWaBmEo0v0QYNtA5nZ2M7U2npWZ3lCB7k9PsfKK
         0Et/I2U/9i+mjU4Mow3hHQciwilYKfN6v77NW1lxFdiMudJC5WRrdKVwbWn45C/4p+w+
         5uVGJP0qklnO45hQk7d9uTucZbUfgH7mdsk83Ha0P7tTKDZ4Z+6ekabhIe2I1CMAtPih
         84Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789136403; x=1789741203;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r3Yt5+Zdt1a8UShs4GHn2PBuNhJp4NwVMMMb48n+Y2U=;
        b=oLdVilqi69l45SgMbaksKK7BFyloElEXJgff6L8ikIDqzBCOcQUmFgow+eesWyJ0wz
         GNeIw1k9NzBhdexs4OXQz6bvQ6OstYHBOOC7603764j9K3uJf1Zp1NtzbAbJf9XIzccJ
         ++5mgwK7ZDqv/pGnoZihwFJXMUMR7EnU9JzwVlBDUB2ezZrduroPmfKFqoN2Jka7COuj
         2QuDKx4oXkpJUBmJ3Ui8Djvk8ZcrBXhIyW2Ifn1Bvaot310+0ypkq34cEwc4fWPNVOTK
         ti6YRZzbzMNLz52z3GM5HX7ha0CEFXut0XB4ehH+Jj/409Dcb9BOeADv8VcfrZ0+jAtW
         SwtQ==
X-Forwarded-Encrypted: i=1; AKwUvByT9FM7VEuCnj2Un42cUulQp07CgrcBnY8DXKKmc+u9z3dZp0BUuUPd/NqSr2OgdNvHx/jMF/sAMOja8EA=@vger.kernel.org
X-Gm-Message-State: AFuF++nScs2kW+hll3/ZCawfLyCNQ0bf8M1npp6l4XxOMB9EBfC5wsEB
	USmd6OxD25Nx8kfYSw5PN0fU/ocsDYxJP30XLdNfSF6CLxfG9Wg/uBwHfMHJ04dTsisNxM/IGbW
	ny9mT1iCwk5TMSXL1adpIYUS3nqeGNg8=
X-Gm-Gg: AYBFou1jk9ol26kN+cJ9v6benHygSrcIM6nq3Vf+YEtMAxJptF+6gDuKsDmcphiXDcp
	AYTdx3aJvpEGOtjElz+kZVzxNDFwZmiwt2BXVrEBSHuIQxsAF17KfA9gLtNPJhe3FcE/1t/CUH1
	EhIxyGI3yhQee0an8905HPAf4PCw4IYXounC+kPytwVFkK1Dz9Me5+zG44VnaCryI1vdpXDWx7E
	snW6aDJfuKoOAyepqOCoiqlOoxnGcoMxwL4/2LjPKfhKBFf3tF/vERilOgwaP55vAHS5gZNkWPK
	otLoHeUzoJkC+8iO9F1n2iK73J9bxPMKz5V/rZY8PW7p3kP4tRDwoKrf58JzFAdi4ZRHT4GNSqL
	DUSuJ9j8fCgC6pGFHzd0OiU/P28jmdi/mQul2WXi4uQ==
X-Received: by 2002:a05:690c:e158:b0:853:c23e:9077 with SMTP id
 00721157ae682-884b00f4fdamr12294907b3.26.1789136403298; Fri, 11 Sep 2026
 07:20:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260717-bcm4356a3-bt-v1-1-ffa2d5233360@gmail.com>
 <CALHNRZ9ofDZ61YW-ZN07sf8sZ6gx4n-8SusSR_vop7R_vqbGFA@mail.gmail.com>
 <CALHNRZ-D1Yz1bgp5hJjwBW32Lhd4Lbt0dQj=3wq-xWqp6uSC7g@mail.gmail.com> <CALHNRZ80CF9Rp0SaDzfgSPSBMWMG+QQ-7FphLAYadt=dRv+qGA@mail.gmail.com>
In-Reply-To: <CALHNRZ80CF9Rp0SaDzfgSPSBMWMG+QQ-7FphLAYadt=dRv+qGA@mail.gmail.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Fri, 11 Sep 2026 10:19:51 -0400
X-Gm-Features: AcwNN1UuOU3RMCORVSwRUX1Ml1EIca_rM0ZS5LZ0LQmn5E9EHcyMUWAgFlVIz8Q
Message-ID: <CABBYNZK6EUcGD48eEQj_HE7fMAZxOUze-sFgUqP5qLoF7fOc3A@mail.gmail.com>
Subject: Re: [PATCH] Bluetooth: btbcm: Add entry for BCM4356A3 UART bluetooth
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Marcel Holtmann <marcel@holtmann.org>, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Aaron,

On Thu, Sep 10, 2026 at 10:57=E2=80=AFPM Aaron Kling <webgeek1234@gmail.com=
> wrote:
>
> On Tue, Sep 8, 2026 at 1:16=E2=80=AFAM Aaron Kling <webgeek1234@gmail.com=
> wrote:
> >
> > On Tue, Aug 25, 2026 at 5:34=E2=80=AFPM Aaron Kling <webgeek1234@gmail.=
com> wrote:
> > >
> > > On Fri, Jul 17, 2026 at 4:41=E2=80=AFPM Aaron Kling via B4 Relay
> > > <devnull+webgeek1234.gmail.com@kernel.org> wrote:
> > > >
> > > > From: Aaron Kling <webgeek1234@gmail.com>
> > > >
> > > > This patch adds the device ID for the bluetooth chip used in the
> > > > Nvidia specific Broadcom BCM4356 PCI-E WiFi / UART BT chip.
> > > >
> > > > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > > > ---
> > > >  drivers/bluetooth/btbcm.c | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > >
> > > > diff --git a/drivers/bluetooth/btbcm.c b/drivers/bluetooth/btbcm.c
> > > > index 463d59890befe..14acea7325478 100644
> > > > --- a/drivers/bluetooth/btbcm.c
> > > > +++ b/drivers/bluetooth/btbcm.c
> > > > @@ -506,6 +506,7 @@ static const struct bcm_subver_table bcm_uart_s=
ubver_table[] =3D {
> > > >         { 0x6606, "BCM4345C5"   },      /* 003.006.006 */
> > > >         { 0x230f, "BCM4356A2"   },      /* 001.003.015 */
> > > >         { 0x2310, "BCM4343A2"   },      /* 001.003.016 */
> > > > +       { 0x2409, "BCM4356A3"   },      /* 001.004.009 */
> > > >         { 0x220e, "BCM20702A1"  },      /* 001.002.014 */
> > > >         { 0x420d, "BCM4349B1"   },      /* 002.002.013 */
> > > >         { 0x420e, "BCM4349B1"   },      /* 002.002.014 */
> > > >
> > > > ---
> > > > base-commit: 49362394dad7df66c274c867a271394c10ca2bb8
> > > > change-id: 20260717-bcm4356a3-bt-cd78cc0f42e8
> > > >
> > > > Best regards,
> > > > --
> > > > Aaron Kling <webgeek1234@gmail.com>
> > >
> > > Are there any thoughts on this change? If not, could it get picked up=
 please?
> >
> > I see other changes were picked up a few days ago. Is there a reason
> > this one hasn't been picked up yet?
>
> Something appears to have gone very wrong with the automation related
> to this change. Patchwork reports the id as archived. The
> auto-generated github pr shows as closed with unmerged changes, and
> appears to have been pushed over with completely unrelated changes.
> Can someone please take a look at this?

It has been archieved, please resend so it can be tested by CI once again.

> Aaron



--=20
Luiz Augusto von Dentz
