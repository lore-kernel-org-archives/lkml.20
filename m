Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4E13D954F
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 02:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789095424; cv=pass; b=d4QaaC+fgMdktjD/EKpvy1DByam5nV/80srsw7zgGdrg4KK1i/Bus/upIfzokOIHd6Uzau4Vvyd/cB7RDQHQqpbLesIOPTzVzWBzuJMxvov/E1keIT9cDkQUsGR9ySiOnoVQMsRDpq5OQi+VAIXNbbW0W3vNgiXPrKsLopXy6rs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789095424; c=relaxed/simple;
	bh=cjFVbWr0n2PHwZEZYXTrr8FI/1Tll+OCkxuLUvZ3xws=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LJfGDzY22oLhhmtbK43zmN2FRwcpA6EiWFn9oyQbjeNSJlCmMGSyx6ANiZI0YGJmPpUvOAxzBqpbWopeLnMvH9GKaycPIPkb4Ur0lFbDsuw+Z/KfDMCbGvpiNXSwEBHQSuli39vzbWQbrroTt9/tkZ8DagsuzPJgwNThny2JeqE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OjN1hGJx; arc=pass smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OjN1hGJx"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5b6188a2c0eso463243e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 19:57:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789095420; cv=none;
        d=google.com; s=arc-20260327;
        b=GGVSbEC4WjHKeRYYJZaR451iCYIt1qh3mrZ2StIYj+mmin20hEEdwPw9XTmV3igI0d
         82L5vssjOK2simcf2yHrIQ7aF3EeW5BAVKKIzd7U1TxmIGA+qUDnVA9rfPcFUCwyDArR
         Ma18/9ImOk/97EnnXR1cW7+ZHpzK1F84PNFrR7K3umb0hfgm6bLNt9ya7LV/KhuQX7w8
         W0ZVqGiOOKIEj3TC6Cn41dIfdbhtEKEpHQ30ifCxFmpOC1DOtMfaa+74FUx7hT5qDMdV
         NDK6IngADZEWEy0QB7WvDtRTJuDQlSXSjT8l9UXyLlLxi/yglNSTSNXrhMpDAA4XJ/Mw
         ixzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yO3bAnLYqUUnMiJVzUh/kgUvHixuF89y5iw3GDpzNnU=;
        fh=5uKgpl/Z/R4mJnggPyloi5ijMM3hC6XscIWjEYUV5ug=;
        b=RTSB5tUJt4pSOZSApLd+kGPt8GBjxrsC65FeouRvFyPfWJ8GufrvYZQM1zjxCyXz5+
         1En03fUYZDuOJnlL1HiQWbELsGJKK/5MlmtFE0SkvM/xF+wB97pN4wDiDMvmUGZ1UhKi
         g12UKuyAnAHkZsTxwKFwmRNTVkkwtAir5F0ySGRe0Lmdy6jSPU4YakgMG9BlNuAoDvXn
         lbe5M5lQJab/yVszssh2gc0IKFbfRce+zxdzvEia16sZbEQMdB1rZQdFucEgfX4Iyuby
         q3VoSB/FkhPdNa8R4afOnOuz3MYnyKy65oWm+VgMn1jUSdWuWmRvHWpitp3IrnaKsWmK
         0ARQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789095420; x=1789700220; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yO3bAnLYqUUnMiJVzUh/kgUvHixuF89y5iw3GDpzNnU=;
        b=OjN1hGJxa1eV0wS1zsAxDaK9Cv4e1UWYfPQm4+dK8vsDP5h+f8zLvfnmNQPVrEgt6i
         NuuTruMJlmVtGmpnppBZuBFisqJuxtgyE/KlCSkKsS1IA6NH8j0n/LVC6/VGQ7g3V5W3
         NDTNQ7rV4k9U+RGLtNf7WkpjrLSf/szw0WWXkGCXYctyfT8yPfNQt5khQ9crkAlVHgfn
         bRANcA4m6yjVYWvhhqH2dhj6cKhfL60h4blWo8OKfgVwNa5PNufe+ZRQqmf+Xp3qrj5X
         fz0VHFFHoAihPXhMq/eNzkyhp6kuC6hCLoPBmNTi2du55QZoj2OyooO/KOnKbbdNhf1Y
         Zbbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789095420; x=1789700220;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yO3bAnLYqUUnMiJVzUh/kgUvHixuF89y5iw3GDpzNnU=;
        b=mZkZmy/+CkEXrtWB3AZ2akwW+NhQ5P/rL1xBLCNelRJ3ft8gNU1HOKMgbop+oFnVeC
         zVhqWGSh/zh4JCTj3tOSx8TodHmEZR0cARStx2M3Lmb8FiGHIYbymxiesHXgct5yOC7B
         ECuDKU+R2qTyw0rshgjx1eigO5y2+8n3A+U7xnT48+TTJdM32lZkAcd7d8myzTYrbif9
         3wAzf6a0rnbP+m++qzwM1xaPocLeSkGgELgFAp1gArk+6w0NSj01AQked0WS6qp2SSI7
         abKCK/4wcIStcngmNTj/Q8RudV9cHJRAMUK7PsSI3XDBHF/Fq7OT/l9uVWGMDw7vQ7dD
         H0Ng==
X-Forwarded-Encrypted: i=1; AKwUvBw3aFlWn6pW+n9vSSsD2vUgqWNrjq7EFik5dqU4ltxYGuge05BDI+471DGoi84O7kGqlgmA7f0gJS3bDe4=@vger.kernel.org
X-Gm-Message-State: AFuF++nT08+r+8TFQ6SsFPffrrXyebDM3GwQSaBRsGaERdVGiyBhBcFc
	SjvJYg4gxHLKV8thGxxVJeRtinHIIh2f233p/11NXf1Lf57OmYAE5XANNsruKppHUtYtFt1ogGZ
	UKHWrNLSTs9UoMS0k+tr9ysrPFDH/s0M=
X-Gm-Gg: AYBFou2snfV7ecvGE7a8e8MxSlkx2sZwDjhbDDzKL66BetV+nQugysGCyLy+rEEkSxG
	KX+/RSfEYbitccVSao7M5HSjvh+PXCmyOLsySRjh5t1Nn9ZUpJPCf8EXKjcNpuKrCFx/ZwOYnrM
	iiVeUEHQo9KdPneXdMMijMrymw3+8W0USNYz/K7oFz+c0YGk7UhapDc+uynFWXzOKNaYhA2oZve
	fQKtMMQUqTTRYRDCVdnY3VrjM6TPeCsXXcYsUe1iY1G5fLhke3hLw5crtuDCJL4hxVJWVvKyxua
	kGsfuAZTCYqHvc9xWk6YESWBDGDCWkwPmbqZrKADudL781ipjZct5GyBZ1ZwobrJuhqFHzFYCky
	880EdOt7Ei0UKteTu3QSkbsNkcuOAahRdOShOqH1VG2A=
X-Received: by 2002:a05:6512:a8d:b0:5b6:1a7c:fd96 with SMTP id
 2adb3069b0e04-5b8a0341041mr462708e87.60.1789095420245; Thu, 10 Sep 2026
 19:57:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260717-bcm4356a3-bt-v1-1-ffa2d5233360@gmail.com>
 <CALHNRZ9ofDZ61YW-ZN07sf8sZ6gx4n-8SusSR_vop7R_vqbGFA@mail.gmail.com> <CALHNRZ-D1Yz1bgp5hJjwBW32Lhd4Lbt0dQj=3wq-xWqp6uSC7g@mail.gmail.com>
In-Reply-To: <CALHNRZ-D1Yz1bgp5hJjwBW32Lhd4Lbt0dQj=3wq-xWqp6uSC7g@mail.gmail.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Thu, 10 Sep 2026 21:56:48 -0500
X-Gm-Features: AcwNN1Uzag0xYPXA-kXRdUNQgxzuc2IOdjhNleIZ3o4xeQ4SLLPf_0AlDlCQ3sw
Message-ID: <CALHNRZ80CF9Rp0SaDzfgSPSBMWMG+QQ-7FphLAYadt=dRv+qGA@mail.gmail.com>
Subject: Re: [PATCH] Bluetooth: btbcm: Add entry for BCM4356A3 UART bluetooth
To: webgeek1234@gmail.com
Cc: Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 1:16=E2=80=AFAM Aaron Kling <webgeek1234@gmail.com> =
wrote:
>
> On Tue, Aug 25, 2026 at 5:34=E2=80=AFPM Aaron Kling <webgeek1234@gmail.co=
m> wrote:
> >
> > On Fri, Jul 17, 2026 at 4:41=E2=80=AFPM Aaron Kling via B4 Relay
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
> > >
> > > Best regards,
> > > --
> > > Aaron Kling <webgeek1234@gmail.com>
> >
> > Are there any thoughts on this change? If not, could it get picked up p=
lease?
>
> I see other changes were picked up a few days ago. Is there a reason
> this one hasn't been picked up yet?

Something appears to have gone very wrong with the automation related
to this change. Patchwork reports the id as archived. The
auto-generated github pr shows as closed with unmerged changes, and
appears to have been pushed over with completely unrelated changes.
Can someone please take a look at this?

Aaron
