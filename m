Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13DFB3F075A
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 18:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789152656; cv=pass; b=sXjOJe7Mni7YvuUPU1uNpA3MBPd9hNs1suIMn1sd1f0gp+owuCGptRqaFLKZrIhrEyltA9iZozUhykA8i0TcRyOcsHmxKYpfTb5Lck9waTjKcXbQNUcHhUjrnP0uyAeBfv3Cf3uDU/l2eB2e2hrqWWZqzGivJnARC7vZkYblssY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789152656; c=relaxed/simple;
	bh=RtqsMSgbSK0DoXzM/jOKS0u9JMf6ypFVGoks8rGZP34=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rjmjsA3N1pjW35RUP+Wjuk83mEvySp6Dv+NJ8ARcVjitbti60gUwZ5Xv/55oEqByFf7V+64dYoMD48E68zkqpEe17wQc2PneMEEDfjROBgNaSkglYTRIQ1i0QZBeJDm+lBN/L1lYUofT7+Gqpc/bD+EF8dyQke0O34eV9PDCWKE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z67J7PON; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z67J7PON"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f9f0b1fso36772966b.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 11:50:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789152653; cv=none;
        d=google.com; s=arc-20260327;
        b=LjO5OxieizXFAqemTK705KANwbZ70emtSQmK6gr1GQTUBN8gVpov2SE3ZZWN43wSuk
         Wx5LJBv44SzYHQQ+X2S8YiwK9MiSqDza80E8V2LuTuZPTNt5sCjAs427KYoiSGWi42dm
         EN95YxbOnzUSpA/B70WbBW4RI+T1amIBQokceVKXOKHjeMZF6gKFHY07KzdLyZ/swB9R
         EYXxnY/Ly0ij26NiZ91tUduCpMVOzPLA14f0YoDZishxU2UHDOQK8Gg9OLpqNGvpxmg6
         +XZiFzVKuXflajzuiAnPhE5SeY5Q94RGL02i2wsKwcnvgD9W7vhu4SI7pug89BXZFHpH
         kgog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ypEeHjBqTijbQav3RLhdA7zJA9N6dFormi6rhg8jlO0=;
        fh=pYFAhle4iqpNOF8XX+TcyQxhIXuTOjl/JMjqQRyX2uY=;
        b=pPs++a5brVJYufgvlZKfWEm3TyHnqVck6Y/7DK1bvVQG7C4yJnplP76K+fjKqD64mV
         QMxlaOsTBcXC8YGOibJezummaxkGxbeszTeyAtXwYkODS5aph/JitapQaURujvRphYHv
         oIm0rSrEZTXmYAocTBx7cnRr+BmfFka9eZ0S266TZZWAFwO+U/FDJtXJlMqfCjAyVFaN
         VsB35RaYaoHBqWhS999qnCoXA9ytqdvY4TcpLl2v209UBuiZbZE7CWJTvho7OosFgKzm
         WNsYm5VEyKusHyQvFin9wsF9lZbXXgS8M8AfoSATLEwcniA4krU01fzBm4tMZ9wCgh69
         lsbw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789152653; x=1789757453; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ypEeHjBqTijbQav3RLhdA7zJA9N6dFormi6rhg8jlO0=;
        b=Z67J7PONtf4j90DVRuIUDXP1J+SojR1pWnezXkF8esU1lwCUc/BQMoBFPuBwRrCJdO
         xjpH53Y+SYsEL74cXMUEhjqb7wCR1tYlsWRuTsp1LmZclofVXQ2uPBFJ2wpBpkQxbmEH
         uC6UsLiUaZPuKURFv9rku4t2XjNNSZHtjrQUl0dWix0wm3RCFOGYDrFFfkY1tyx852ip
         WxNMv8siY3637rcO+OSP/lUPndtusgAvaF7Mt528SW4fwE+FFcpJh9WmRk/vwwuOyRSv
         KrxgpuB9JwK5WnBkVmTisFg8wmlLovMznmAotZG9Ts/RAwI+oq2rffyRXaBhL5bH4KZu
         tucA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789152653; x=1789757453;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ypEeHjBqTijbQav3RLhdA7zJA9N6dFormi6rhg8jlO0=;
        b=PgF/egFSOvL3/xyclvJQj/rhesngYGrfEsCjcgKw3OAyQhbY2T95e3v8Zf2H8gbOi+
         5gwof2iAsiUaff9AL27FhW+aWh/taYvJXB1Mt9tdQxNRVuN2kXIv9qhCD9zyzM47BdMn
         4dPv04rI/8HJeEacRI+qbPlJQVEfgjLpcb75/84cdfBqC97S+XESw2cyVPJtD0S4Kv4K
         P3ig2wLslkhiCAQWtEnQjAX9fj6r8bR+G+9oXcPytQlTr0nQT4qrwgz5b3CWMa3g42RT
         Jo3JiHbqVf3LJy0vfb9tzRxyIJ2SkAwopnFc4JhxI731F707QTIjyBJXtM5xB83OzZAs
         jv7A==
X-Forwarded-Encrypted: i=1; AKwUvBxLujHBi5C0QUzCjs78TWyZ4ipKDc1ercnXTdXHhSqDZ4IJcvq2I8T+1sT9o8w8hvqg5zKiISNo82SQ6uE=@vger.kernel.org
X-Gm-Message-State: AFuF++lPr6K8cTXW5234C+fl8opj/P7r1fpRH+cQeW5IAimhFgMPpv5A
	ATEXYPA0V2jK6lT+DSfGwApT1+h/HRylbmiph45akeR9LY5uxglM5WBrkz0eFpGp9veNs6QggGh
	hNEQBkk8vmxjAgQnRquc7AQCfr3xNsXk=
X-Gm-Gg: AYBFou2C1p1EWN5vgR9F4qMFI2/MnTA7kWakIevv28wGtz+8d6nYynibv+5BT+ULJZw
	vpVRLH+hPedEeEGGtT+EvGPqRdme8t7kzuwPweQken0IMODO+gWU2p51H9aTQ33mwMaxUhNrfpF
	cc/68aOBzD77k1ijQ5ts+1IqW85/I4sTtPZcehB2QtR1fnIgVudEGQSeOcOL/UYNkumyDSMFRwm
	F+ghSmhiDRUfa5rEwbHGCe4LPyYRGb1ynhgYAVuo8glkgFCkqeUWvbJCwRJiSsPh63VXlapqJfL
	J6eS0McEduGMxOanfIqLIQD14o654pQXoq+6H5JCelvGwlWBHVhnSfhapPHPr3FDXQXYPhfENg/
	/IbDnxHVSTcxHHsRTl0Ca+PoqNg0fc8XnOnIEQqHu854hdc0Y1ik6FG5Z9hgYuEuKhu/EI82Sxf
	i2wZNo/M6sdUAejhp8GXG+oIDyEl/1VrHYoTkYel9Tu3oBUrUM77PMLRauYBtkRkEK+httfs0HD
	MEX
X-Received: by 2002:a17:907:7211:b0:c29:53ba:a4cd with SMTP id
 a640c23a62f3a-c29666f90fdmr483569066b.11.1789152653082; Fri, 11 Sep 2026
 11:50:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910001209.116465-1-rosenp@gmail.com> <6a65465e-f860-434f-9dad-59d9538c97b8@broadcom.com>
 <CAKxU2N-DJS+ZotHsgami8pc2tnC2+V3nL4JZrqgf=rpTpFHNEA@mail.gmail.com>
In-Reply-To: <CAKxU2N-DJS+ZotHsgami8pc2tnC2+V3nL4JZrqgf=rpTpFHNEA@mail.gmail.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Fri, 11 Sep 2026 11:50:42 -0700
X-Gm-Features: AcwNN1UBWpQbvDkHrDHhG5kJOPM-dImHVyKgKakwlCkD2k7qVSn-bXfs2dvbyzk
Message-ID: <CAKxU2N_Z9OHUx4LBmxU+8GZ3_vFYTVuCt04P4XwjyfkRBZ8AOQ@mail.gmail.com>
Subject: Re: [PATCHv2] ARM: dts: BCM5301X: AC56U: add nvram node
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: devicetree@vger.kernel.org, Hauke Mehrtens <hauke@hauke-m.de>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"moderated list:BROADCOM BCM5301X ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026 at 11:56=E2=80=AFAM Rosen Penev <rosenp@gmail.com> wro=
te:
>
> On Thu, Sep 10, 2026 at 9:46=E2=80=AFAM Florian Fainelli
> <florian.fainelli@broadcom.com> wrote:
> >
> > On 9/9/26 17:12, Rosen Penev wrote:
> > > Add it and set for gmac0, which is the only GMAC used on this board.
> > >
> > > nvram size found from a random bootlog online.
> > >
> > > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > > ---
> > >   v2: fix typo.
> > >   .../boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts    | 14 +++++++++++=
+++
> > >   1 file changed, 14 insertions(+)
> > >
> > > diff --git a/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts b/a=
rch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts
> > > index c80ac16ad949..9ab618a097b1 100644
> > > --- a/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts
> > > +++ b/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts
> > > @@ -25,6 +25,15 @@ memory@0 {
> > >                     <0x88000000 0x08000000>;
> > >       };
> > >
> > > +     nvram@1c080000 {
> > > +             compatible =3D "brcm,nvram";
> > > +             reg =3D <0x1c080000 0x180000>;
> >
> > Why is not the nvram node moved to bcm5301x.dtsi given it is common to
> > all of the chips?
> To avoid probe errors on hardware where sizes are unknown.
I looked at this again. It makes no sense to centralize:

+       nvram@1c080000 {
+               compatible =3D "brcm,nvram";
+               reg =3D <0x1c080000 0x180000>;

The reg and @ values are correct here but not for all devices. There's
also nvram@1e3f0000 and nvram@1e1f0000 as examples.
> > --
> > Florian
