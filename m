Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1F939D6CA
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 12:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788178949; cv=pass; b=ks3Sb5Lk01dgJKC7TiWPkB8SFHvAKsGNfQj+iwNqhzDP7JodvUSqXoqNWfwXu/Mnc4+U4DaDHgQIKltKcme153DlNhNXj8Vjm2zUAD8k/Z49RVQITHALAureHI/GZ+ePX/FqDrAvClZxM+GVyyxB+naLveNL3BbAakDrcv+shyQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788178949; c=relaxed/simple;
	bh=tSgrJxOrJ3U7RFQ7EE7Oj1TvEromsWTjU7w5aS2v4Dc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=af9irzudO8O6A0jnDWB4dntCczcfbSTGdKNxpxzHxv0u/UWcBF+M3VZ4ss/H+aYdvyunOw9QmdpixTA9rLUNtdb91qBilH6NBx8JX9B9LMpc8aVCoAV4UdVxqtQN1+R+OYIyM9Lx0CbfbrtExmH0YJnNWxoRiYN2Ehamc3LucVs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EaW5dcOv; arc=pass smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EaW5dcOv"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-66b32bb75beso2957687d50.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 05:22:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788178947; cv=none;
        d=google.com; s=arc-20260327;
        b=R4I1nGA78SkYDerUuOgz/TaPBJbyl9tPzOYDhb0EzMdTbGxxHI4UiIy+uHIAm42q/V
         730A1uB7okJQ9UWqGsRr9Q5gZSgbsXHFH4800eK34eFjBm+XPWWjidFW9quEh/C6CcnW
         AIRrHHR3JihjW858keIMEeN0K2kCO+JrV4f2yc8de6DVtAQW8Ykqc1myt85l2Rwjgj+x
         r9vBmMJIXblede60CFmTeU1cposhvv961T1z6rFcR4at1IM5WUJeea+KTO/mQlc9/rVt
         sWew6eT6SvNSPwz+koEjACAMLeuOhX6DrC4u1G75Ng97IxNV6EOA1YWn8a8vJmR4R3Pb
         cB5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tSgrJxOrJ3U7RFQ7EE7Oj1TvEromsWTjU7w5aS2v4Dc=;
        fh=drMOIL0LA/542Cr4p4YbAAKS6gfQbkfb6DraWgrOZOo=;
        b=b2ioSwWUX53yDJ77tyjEvU7E9s/q1HlHjDuZek/HOgO1YDJJp6T3HXhS0zwOrQmNoy
         IpqpD9pM7cGEU0nyzNZTe9WiMIq3EgLwnK2cKmTLNG6MIJj/gUuMaRmGgFGx+a4dD0tN
         VQvgeFZbEdxephH8JbLNET13IkxV7nlVhns3/qN6+IvNxCeVsR57EggUqP96SQGsnJzz
         Dd8j3CANIXpaQIpNlUcNX6cSd6zRRLM6UQFS3BSMhib4TfB4PRm0nukIOvGtZUNJNm0z
         ncbovMZVj1A0IAEXue3RXT8gWvqbyO+2XluxbYbOgWiXgN9VaY/whTMB76Vd+UvjXZR3
         MKUQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788178947; x=1788783747; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tSgrJxOrJ3U7RFQ7EE7Oj1TvEromsWTjU7w5aS2v4Dc=;
        b=EaW5dcOvEFk/KTJeuvzfX8H88VWNyq6B0gF26rZ7bjseZnZ2U69B644WNUzEmhoUeg
         R6T5jzRTwK2waZm9Ak/IEugDkNu0mu0LBLMCKgRYyd9TTeOqnArM/jPCIhtHErj85m9v
         qaG3XvN2sfqo3PnML1blyjX0QUmsJGUIM2KqHzFs2eoQMOj9oQWSyeCJxs5uAQtypsGx
         MBkiWNpVx6DnPvBrblo7FPYcy36ibLDpLBdT8DTEyQO3xqpEn1r+WgBi9MFCH01urm/m
         y7QkpRQjy+OTUS8+74zoxRN7NE/fesE9De9GrGDp2d71u0ojOtNRfiq8oMKo59rvwSQh
         qhzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788178947; x=1788783747;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tSgrJxOrJ3U7RFQ7EE7Oj1TvEromsWTjU7w5aS2v4Dc=;
        b=R85v5P3fq4Jef3MA6iwVsfQkYVRdnKXVJru+VpM0NtXmgIdSwNd5FEkb59vGUAZA2+
         cL9vYl2b1fUyaT3jKqkHhEhqRJ8Dhb2t0GiJdJPviRjs+psFJVSHyXG5sAZu21QQnVRg
         w6m6AC7xsvX8FTks3MVEtibaYH5S5RSm6YYNcn+a7BN+yOVAPj16sc19bAEK2S5C7gTW
         86GQb7mOUbaqRDZeXRa2E7T2LbZz3oDsPOrxDc/UlmyxxaLFCfxBGIy7qh1RDoLAYmMZ
         0LB/UVAQiC2lOUxlRb6aXqcL1k1nIbFdTG1Do2HRcnkcA4g5YdPSFXqcs7hLdHrACeLN
         lSag==
X-Forwarded-Encrypted: i=1; AKwUvBxvcj1mcMWgIW7w5wKD9Yyt0ugpR2icJBpFdFyZfWtoTjv3kfwAMC2rFPzcYEKJJyZHNt2JZT3OejYUoYY=@vger.kernel.org
X-Gm-Message-State: AFuF++nB9Uel5SC/ytsD0qyH2EHiNPSg9dr4C71aHaXdtFKj1KuHfvol
	y6z9AYJ+BqtytC5OTvNAElxd8H7Dn6DHJ3T4+CIqD+0OwqaII/9n2D3d6f6OdoO0uA/Xv3kXuIg
	jVzoGGj/KgJ+bckzeWUm5QtDQTqtdJuI=
X-Gm-Gg: AYBFou0G+UOJ3/DCNV1E0W1ODqO1QrADo30U0XRpEyiiiDHSUdeWUBrV3hA7DkaUFuB
	0nim/1VQp1G5gBDgqxxOEwHz2ZWO8xw0eOa6Wz83S+mPwjMxDb1EHMehW5KhvMNMAjUOaa9QSVa
	2TZpDwrUy+cBj+P7sX8Rl1VuSw3g1stMxaz7xhY7CfAiWGB/5E+fDEi2Ssn9/ls7OhQievpBnI6
	et/In6mTfKW6rtEYMPPsTSlq1BwpyaQhTO1fOkndZRSNYs4aPazaDHhEFRTBlS5FPBmL0Y2mFR/
	877HvzUMpKtP1CqV0AaeUtLAQ6Be9Jf9bwWG4ZS+XQRqJam2OxLDHtlJ+QLQXSI2yDRk66GjCYQ
	sKeiaOO//ImwxEZ+ZrpXJeADj0rSGWrH71A==
X-Received: by 2002:a05:690e:1248:b0:66b:1421:45a with SMTP id
 956f58d0204a3-66e4c65bf8amr7596387d50.7.1788178947190; Mon, 31 Aug 2026
 05:22:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260816061034.17769-1-kartikey406@gmail.com> <2026083154-choice-platform-51c9@gregkh>
In-Reply-To: <2026083154-choice-platform-51c9@gregkh>
From: Deepanshu Kartikey <kartikey406@gmail.com>
Date: Mon, 31 Aug 2026 17:52:15 +0530
X-Gm-Features: AcwNN1XTBkudp1aNX14_rGhl3HkgH0yayASMF94zLItoEAu-SwNFkmZ_PazQ9b8
Message-ID: <CADhLXY6MN1E2xfnhodGg7SH4DnjF8uYVBDtJfqGXTXNeKdgxDw@mail.gmail.com>
Subject: Re: [PATCH v3] usbip: vhci_hcd: let the driver core manage the sysfs attributes
To: Greg KH <gregkh@linuxfoundation.org>
Cc: valentina.manea.m@gmail.com, shuah@kernel.org, i@zenithal.me, 
	yuyang.du@intel.com, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzbot+8753715f05759f1a10de@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 3:36=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Sun, Aug 16, 2026 at 11:40:34AM +0530, Deepanshu Kartikey wrote:
> > The vhci attribute group is created in vhci_start() and removed in
> > vhci_stop(), guarded by usb_hcd_is_primary_hcd(). Both run from
> > usb_add_hcd()/usb_remove_hcd(), which are called once per hcd, so the
> > attach attribute is live while only one of the two hcds exists: it is
> > created during the first usb_add_hcd() before vhci_hcd_ss is set, and i=
t
> > survives the first usb_put_hcd() on removal. A concurrent write to atta=
ch
> > can therefore reach a NULL or freed vhci_hcd_ss.
> >
> > Register the group as dev_groups on the platform driver instead, so the
> > driver core creates the files before probe and removes them after remov=
e
> > returns, and drop the sysfs_create_group()/sysfs_remove_group() calls f=
rom
> > the driver. The attributes have always been created only on vhci_hcd.0;
> > an is_visible() callback keeps them there.
> >
> > vhci_init_attr_group() is moved into vhci_hcd_init() ahead of
> > platform_driver_register() so the group is populated before the core
> > reads it. The attribute array is still built at runtime because the
> > number of status attributes comes from CONFIG_USBIP_VHCI_NR_HCS and the
> > preprocessor cannot emit a variable number of __ATTR() declarations.
> >
> > Fixes: 1c9de5bf4286 ("usbip: vhci-hcd: Add USB3 SuperSpeed support")
> > Reported-by: syzbot+8753715f05759f1a10de@syzkaller.appspotmail.com
> > Closes: https://syzkaller.appspot.com/bug?extid=3D8753715f05759f1a10de
> > Tested-by: syzbot+8753715f05759f1a10de@syzkaller.appspotmail.com
> > Link: https://lore.kernel.org/all/20260815143427.19066-1-kartikey406@gm=
ail.com/T/ [v1]
> > Link: https://lore.kernel.org/all/20260816015051.13184-1-kartikey406@gm=
ail.com/T/ [v2]
> > Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
> > ---
>
> Did you forget an Assisted-by: tag?
>

Thanks for reminding me. I will add it and send patch v4.

Deepanshu
