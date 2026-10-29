Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793240730;
	b=XsmSsyYOjgHeTPmdZG8t9aLvzUvUrw9gpfx4eI+0AkHAGXIAoe2S66Y7GMsUe+piV6Og
	 mRmgwzr2VQ22AuNi7avtlTrX9EqUvPWUsI9y2DCdyb/B2tppimEgUlmg8WbSHLJjMvz6S
	 tVdFR9iiEemUnmXeMr50bsK/PJMzrtJxtQcsEev7XjyLt/s+X3GDJMyPY8eusIdvrKoES
	 DNT/XbJhAnj/1ZYZBYvqIbRr9t1rwipXCLPJ8lSIpUi8QhgDjnha7oHryp4jiOJq0vaar
	 SEmLCnf9Sig9iq45P+x+u3MBA5fBjiacI7RJThaoMYYwpwUoh818VUYE44WJ4sTDCnw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793240730;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ibrE7kLfmhA0/hpTQtmllGHOAtohRxdo6NcA+NdA/cc=;
	b=jqFou2aQwISZ/xpDogbMmFLhro/F5LKWzyPwJDNIvYc/+tZjKciEBgTEb1g+8pdAx7NN
	 3uamUsTVWvG9qHmV96aD2oy4s0zsUeVkc0VWNouGqIwl4BOcbE2BTEpqPVcyoYY0dABiz
	 MK8JWH3amVpEe46uTEAcgyC1osyBZ9yJyVpBc6BighluKtj4v83Sr0ytNzyr7brppSSni
	 toZz64cvn+mcwewJk72WAN3OI8fUWjQJ8AtD0I/olpbFkUermdgCUbj4dCfWwpKxzdeAj
	 78ocpqTnIYXOpgjcTpek3PExZYs0kG8OrMDTKoYRIInrNNahqW/MA9KZJtTFsj/Quiw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rrLqpNHP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.52
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C586C606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 02:25:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C586C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rrLqpNHP
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-85a5455bd3cso1014467a34.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 19:25:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793240728; cv=none;
        d=google.com; s=arc-20260327;
        b=L4OkhxE9AHzpXA1wcOPey81BgmiSA5FzdcHl1/Ovg/X+jcllr2fA5qZb45LijJ0c3p
         D86/cKqT9F/XJ1jHc2wuyhxIyUuVbnSYOQJo5yvbUqlM7pndz/nigsNB9r9nxLhUhXW2
         3jARl8ZWVImGXioDEqcWk2meBOWIp1exj6bJMTKDZ4tw7uwemKRuq+5vbRMufaqfNxR1
         s+os2iEQLOt67brNbb3hlCBc0KZ5+TSzAVcjQK6R8KrwxZz+fA5/HU6Qox6CcXMFjqoh
         oNzx/Bu5H7MdaSbWBjasU29T1SpK+Yovlw+Gtq6CxbPvNkzb2KJtfjCeWJtq6lNezyFX
         Lrdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ibrE7kLfmhA0/hpTQtmllGHOAtohRxdo6NcA+NdA/cc=;
        fh=qfRU7xxtrHopBAqJol0XicEjGFcjeVcGJozZOqsRVjU=;
        b=kdNe10ushVQlKXBTr/1kQy1LTerZDbB3jQlAEfTzvAJsPKleA32838HtPcjn8KeIyK
         XdwY2qBEQRTIbb8CWP02fv02fmwjknu+gXpk2pqqrL0qXgW7uUvAdR+weT0YpRmNK1ei
         pSlVwhgdfu/BpQSa0j2KmAKxqHSVO8kXpr4v8+0ppdrzv+zWFvuUFOSi2KwnWr6iMdu8
         R1LvFQRTkNim3UGPXgqhFsy0o50X0rE4AicOKwxZ+xDQnqaiue2dxlPl20Fg8P1K2kGM
         dmIO7w9EJmYRSecOiutCIMfTChDpVb5FK8pfggyu+0lbG3GjkutayTgYcY2gzdyscIkX
         jRaw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793240728; x=1793845528; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ibrE7kLfmhA0/hpTQtmllGHOAtohRxdo6NcA+NdA/cc=;
        b=rrLqpNHPmoyjvTVXcgriO7Urn3CAdbOtl6SWdtR2Kc+m39GbUjHB0sidRN8ITutXYc
         KUSLc6jY5wffVfDNJhoFFp7X9FCSQA+33STiVTZ2FjFkYp8TSG60C6r1S+5BRcFKSmei
         bheGuhffuNW0FZTbGs9Bxn3WpAk5NRs5I7L80b00rCk7gBTXAeKH6fIQkvR4IH5KtdHd
         /IKH9a5lixQsscIAf/sh1pxqhLTlFPbkYl/4usF3Pv2lCj4kvNANqpOs5wwmsj4HpkkF
         V9mowesznZzsM6SUMZa3cdijtzeOqgJRB8W11+B7X4pt25XqSPM+diKqkMIYUKYs9Ae9
         v7oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793240728; x=1793845528;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ibrE7kLfmhA0/hpTQtmllGHOAtohRxdo6NcA+NdA/cc=;
        b=t+Rb8OFC1Q3rn22aOqmIwvYWj8Ik4EJ6ybFan/Fw6fX8bCGtvMWyaACPgHKz9+N8Dq
         lY4XP5tTouTvauB8/5FK80tkiPlt2JWE4haq4R8Aig/W3LK7VGFamWMexJbPQIsNepjp
         po28Ela/E+AaTJaaGoAQUxzTNeFjfpu86m7v31x6i0KQOaIAqDZ0D3u9HWjiMVyxFkI+
         7mKNFgKiXhlSk/kea7hCzrGVflUnJRcuAjy2XSQE3ndZ2p3cMX+tggPCGVmdlh4BahY7
         5TBJh3joeauYr5lx1qaH/HjEPzu5Z/K0wj3S39l8i07vI0+qnOnIkenj5O46SgPuAJP8
         9gCw==
X-Forwarded-Encrypted: i=1; AKwUvByB7/w0zz1Ishs32XsJK2O91n2QSqlutzuVt2c66zH6RN+Zxt+tL1W6wDOXv9n+9DKJcoUYt2243qcjWqg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIZv2gxJZB9Hnk+tH+ByPpBA+2AjHgwadNgsVJzHuE42Vreh6Fl
	hUS4LzN7KzD37bAAjIS35+sZs5EHZXdzJ1caj3nxkIuPLkcP+1qFhSy4lmt/KzoQr6x56o8WqBI
	+GXqckcZmFKmJzE/1HKGO6vonyi/lrdY=
X-Gm-Gg: AYBFou3cCoX3FGTkgjlRl/GQsKYdzyE2SEiZRptRvIoUqKkJy76NAJ6bGiEb/mpWOHP
	j17+qESVYcgPc+MGMxn1bIkrsDxXfQ1rDIRTscqfpS0XYpf0Egq8z7fZA13nv/0Pljf1Faj+6jN
	x/KX1aKZM6pmt2J/h1HtvlIGQZzG8mwaEzc4ajGf1+iq1bmaW9ufYtJ6qpz55mTEiUV0zvqwvbS
	22CdBqm8d7M5PKzTHHrmmNt8IIo5fdD+XaRIt7NIIW2lGPLIw8g9Xs1yIQ1iy7iqezBhPpDSx8j
	1D1qmUT04CZVyy9bE3yH5XY0ua+arEEbV5BHMlQ7zsZpHJrKpdVkorYm47pbDTcVpE40RJvsVdG
	X+Nf9QbmqNYtmgSB2WFHE8/F+lUYjP9nqmWrroMI=
X-Received: by 2002:a05:6830:2b22:b0:81f:22fd:6ed5 with SMTP id
 46e09a7af769-85ab929bea9mr4207273a34.21.1793240728513; Wed, 28 Oct 2026
 19:25:28 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260914013033.3938-1-ki.chiang65@gmail.com> <20260914130907.749cd8e7.michal.pecio@gmail.com>
 <CAHN5xi0NSJO=V0=eVd4_MGp2Lg5NrwB3D+hsF87ehTSmaeeSbQ@mail.gmail.com>
 <0e4c85e8-77e6-4eb9-aca1-048199f2f0e0@linux.intel.com> <CAHN5xi0tN2iWGVfH18SASoP0HVvAaDY4Kgq2U6LCCznGg-1o9w@mail.gmail.com>
In-Reply-To: <CAHN5xi0tN2iWGVfH18SASoP0HVvAaDY4Kgq2U6LCCznGg-1o9w@mail.gmail.com>
From: Kuangyi Chiang <ki.chiang65@gmail.com>
Date: Thu, 29 Oct 2026 10:25:17 +0800
X-Gm-Features: AclHuK9d_Y4NwcLAID_WoSD1jcWekDk2VdLFqupARR4n9WQETwi-Tu-aoyzptUQ
Message-ID: <CAHN5xi1M+g3Sy8YkRKpZuU7EtTxiyi0ZD6y5TCcAZTrpxUpHNw@mail.gmail.com>
Subject: Re: [PATCH] xhci: Fix HIK camera control timeout on Etron hosts
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Michal Pecio <michal.pecio@gmail.com>, mathias.nyman@intel.com, 
	gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Sorry for the late reply.

Kuangyi Chiang <ki.chiang65@gmail.com> =E6=96=BC 2026=E5=B9=B49=E6=9C=8818=
=E6=97=A5=E9=80=B1=E4=BA=94 =E4=B8=8A=E5=8D=889:58=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> Hi,
>
> Mathias Nyman <mathias.nyman@linux.intel.com> =E6=96=BC 2026=E5=B9=B49=E6=
=9C=8816=E6=97=A5=E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=888:18=E5=AF=AB=E9=81=
=93=EF=BC=9A
> >
> > On 9/16/26 04:33, Kuangyi Chiang wrote:
> > > Hi,
> > >
> > > Thanks for the review.
> > >
> > > Michal Pecio <michal.pecio@gmail.com> =E6=96=BC 2026=E5=B9=B49=E6=9C=
=8814=E6=97=A5=E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=887:09=E5=AF=AB=E9=81=93=
=EF=BC=9A
> > >>
> > >> On Mon, 14 Sep 2026 09:30:33 +0800, Kuangyi Chiang wrote:
> > >>> Control transfers to the HIK 1080P Camera (2bdf:0280) can time out =
when
> > >>> the device is connected through an Etron xHCI host:
> > >>>
> > >>> [   48.363671] uvcvideo: Found UVC 1.00 device HIK 1080P Camera (2b=
df:0280)
> > >>> [   53.465662] uvcvideo: Failed to set UVC probe control : -110 (ex=
p. 26).
> > >>> [   58.585653] uvcvideo: Failed to query (129) UVC probe control : =
-110 (exp. 26).
> > >>> [   58.592967] uvcvideo: Failed to initialize the device (-5).
> > >>>
> > >>> Testing shows that at least 125 us between control transfers is req=
uired
> > >>> to avoid the timeout. Limit the workaround to the affected Etron ho=
st and
> > >>> USB device combination to avoid changing control-transfer timing fo=
r other
> > >>> devices.
> > >>
> > >> Any idea why it happens or why the delay helps?
> > >
> > > We don't know the root cause yet, but we did some more testing.
> > >
> > > We tested delays of 50us, 125us, and 200us. The issue was still
> > > reproducible with 50us, while 125us and 200us passed our test.
> > >
> > > Our pass criterion is 30 successful plug/unplug cycles on each port.
> > > So 125us is the minimum delay we tested that consistently works.
> > >
> >
> > Are there issues with the control transfers already during enumeration
> > of the device, when reading descriptors etc, or are these issues only
> > visible after uvc driver is controlling the device?
> >
> >
> > > We also tried USB_QUIRK_DELAY_CTRL_MSG, but its 200ms delay is too
> > > long and causes UVC initialization to fail.
> > >
> >
> > Does it help if you as a hack set udev->quirks |=3D USB_QUIRK_DELAY_CTR=
L_MSG
> > _after_ enumeration and uvc initialization?
> >
> > >> How many other HCs did you test this camera with?
> > >
> > > The camera works with the EHCI host we tested without any delay.
> > > We can also reproduce a similar issue with an ASMedia ASM1142 xHCI
> > > host (1b21:1242). This patch, however, is limited to the Etron/HIK
> > > combination.
> >
> > I think we should avoid usb device specific quirks in the xhci driver,
> > especially now that we know it's not really tied to a specific xHC vend=
or.
> >
> > If this is only an issue with the control transfers sent by uvc driver
> > then I think this device specific quirk should be in there.
> >
>
> Thanks for the suggestions.
>
> We'll do some more testing based on your suggestions, including
> enabling USB_QUIRK_DELAY_CTRL_MSG after UVC initialization.
>
> We'll report back once we have the results.

We did some more testing.

We don't see this issue during device enumeration.

We also found that the timeout is not limited to UVC control
transfers. In one failure case, the first timeout was observed in
a UAC control transfer, followed by UVC control transfer timeouts:

[  961.127402] usb 2-3: 5:2: failed to get current value for ch 0 (-110)
[  971.367443] uvcvideo 2-3:1.0: Failed to query (GET_DEF) UVC control
2 on unit 2: -110 (exp. 2).
[  976.487473] uvcvideo 2-3:1.0: Failed to query (GET_DEF) UVC control
3 on unit 2: -110 (exp. 2).

As suggested, we also tried enabling USB_QUIRK_DELAY_CTRL_MSG after
UVC initialization, but subsequent UVC control transfers still timed
out. In addition, UAC control transfers may already have timed out
before the quirk is enabled.

So far, we have reproduced the issue with these xHCI hosts:

ASMedia ASM1142 (1b21:1242)
Etron EJ168 (1b6f:7023)
Etron EJ188 (1b6f:7052)
Intel xHCI (8086:8d31)

The issue is less frequently reproducible on the ASMedia host.

The camera works with the EHCI host we tested without any additional
delay.

So we agree that this device-specific workaround should not be in the
xHCI driver. Since the issue can affect both UAC and UVC control
transfers, we plan to handle it in the corresponding class drivers.

Thanks,
Kuangyi
