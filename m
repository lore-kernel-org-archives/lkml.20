Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794151222;
	b=roIVS11th9FgX8vHffEZdZo0SXMbiNM0BokndGkpDeB7QleNV5wTECUp1eU2w2gnWx+/
	 HJx1F7ICDK+/F4Fxa2NmcnEjFVzipjNZ2gMCXQIbyR1qavHXbRqQgIzRaX6QL3WAJnEqX
	 B37mKGQWQZYMInYI0naXh5pkGGuS+ZZbiLf+IVeIt/mDNb2KEY6oOY+io3gxZ3cRijtQb
	 CerGtOUZ2s16qhuvO4+r/vG+U4frtvQu2SaaJnh4u4dLXNMA+LQyn78ywyGWqLAR1RiHR
	 LSxnPPoczxrxGufUiQsoeFxVk7eZtJfzKZbiryjOTvHRgS5vmW8Poc60Q1UNWyrEFEQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794151222;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=qOxe9JDMzQ5KOLpQ10yhevscBcuPccI/BjPAJmf1lEk=;
	b=eyQxCQr+K+m561LGuReCC557ZTD6czgNJY3tproHmlRtCm2rmHK/vsfb+jFD79WXiNQp
	 thag7UqAFZHBkBvnWi53hOm54CNo2GQHXTxPMa/AdtmR6MP1OnZE9kyRyWQMo9W6Vcvap
	 e8++d8eBLZjS4PBqOThzm3UuDMfWDl3B2Ep3ZFhsz5UoNFFm1Vl/peuv+mjbR0hQn40iT
	 6DSAP2TV562dDeuf7kA/tGNBzbY9oI6PSZQ+f4LjX5Y4VKu4eP+kL4nkzxjdNd5SKCQ22
	 gVJ2slkULk9mAhijs3zteV3lu3p1bvRZt7bKws7qR5r1bdewQcyumxSnpBuivtxL46Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jv3fxMaU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 518C7606A320
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 15:20:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 518C7606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jv3fxMaU
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-372bdb942dbso207869eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 07:20:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794151221; cv=none;
        d=google.com; s=arc-20260327;
        b=VqfAwSvi1+KuZoZGh41h6NEFx71CpZRkdgsr+fsD0ch2xhXU6olVo8o6juxRfd4Ana
         DeRQZ7Cm2uJhbwrBJKh0LvMWhPdL976vFsVAKm3/mTIGOSs3be4glBS9dbptN+yQ8g1f
         ADoxy8EurtxPOqxLQVf+2ROjuvOvwXtLEff1r6zp58z0whldYaHUoUZjKE2wFxrVyKir
         /DO2cZ5BSZuoZByVbFwHclvGBu25p8kTK4u9NIOdsQkiko9ErlNGZdQbBNpu8IrjQ7SB
         hIOUN7iaZ/HuU4C5ItNhbw1FBUDa8qIJCV+NLFtU2+KQx8E5LPiqG+6BJNXuMSWBSCL9
         l6Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qOxe9JDMzQ5KOLpQ10yhevscBcuPccI/BjPAJmf1lEk=;
        fh=zWuNCLqeXggDrAFaSM8wYhG4Sh0Wue/HbeDa8emfGJI=;
        b=VeuFf1vBZKu5UnelGU3kPPJjXE3KzcTzZNw1FwyGYThydEarRdU0OP2G2on3UfQ3ma
         Vru+6FdAPo5S4g+ur7JDkD/+HkMYTig70GLhUprz/0PieoAtMFL4TcMLHUZdZxdVZUSF
         m/BjftuqPprZ0YrVC36a50YlT+WQrpQHn/eWMTpO1rjytsa4Q3ojfjGs7pNdCleOBBq7
         ++AWLy8Hy9Oh285bWCtYHxWGOms2jF0kAV8u2H1glLE0DckmBx0BnU4HvbfYOo3YKbP+
         naZFW5Mh0XF8/1ZpdJEsdFEDcu4RD8E1EDK3l/hO+OfXKWdMk94kteoHLHQpYxVq397T
         VCbw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794151221; x=1794756021; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qOxe9JDMzQ5KOLpQ10yhevscBcuPccI/BjPAJmf1lEk=;
        b=jv3fxMaUWjQVJskOqgtmEZPK5JGekoGIYVJiAw9rzX88q/A2V/a86yiORf8MCpBMJl
         KUZyKXiq+QuGLJGeWbsJOAse8G2odRZgc1cxeFRnABTlJFNnVnonR1npCbDBdh0WDRd5
         qmJwPkOmueRkREE+6oGA8n86H56nQQXqkRGbUHzktv8ClLKby71HCTWcMM2fWdD6C80f
         pZxzIX9YOsECxMfsb0KZfmTdWIwGgb9PhyaCGkMglxqwgvzuzNZHzXd0UevfnB49HT2j
         1MHjZQ2Kvu8x3Mt0+Jd4y5Lj/uX2z+tgzPjazamTh82kaKu9iQTVdLVTFw3yhhfwPeqc
         XZXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794151221; x=1794756021;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qOxe9JDMzQ5KOLpQ10yhevscBcuPccI/BjPAJmf1lEk=;
        b=mSR/JlFo6cGn8UfZeLMmqHFUiBLdKgudr7l8XuQ3nEebmMWDLXlSTBKvUQRSCNVpm+
         NZavxVGFb9/ojtEMQ714azPyvzijKuAYVl202dRyl/W49DQNRtTopjqoLTcZGUYOx3W9
         /7Z1t19YA3438CoW0XXXDYor8D1TTTWoJ71RmxGa7eW0KzRw4WsTHydYl2CxMLl0OH0B
         2eSNA9sBTf2OLukletEXN3HmwNI6Y0hzu8H7PiTxgDE5PsqmZRVznoPGv+zdx04madMS
         oYbf56QZ7jS0EhBe1Hia/JEiNpy2OuizEoRQuZcHCJDcUe+NJFr66HPuNkbV3rwfPOT8
         SAuA==
X-Forwarded-Encrypted: i=1; AL+hErE2lV2r7sqLwo2rgbvei6m2EandoM+9MvwzMGSajq5ilsrGtSUyxQ8pwC0Pmlwa18bzkx/i5Xyk/vPO2N0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9CN+eKELe19moPHkyhO24AGu2ZRBswcl91acG6BFoKS07bJUmB
	pcPcoamDXIQGj7gwKsplerR2j0lLwiXCbjN5SBPtaqz38Ii94VZnVZjCUqi6rWOxZQBGaA8s61n
	Y+yiD4AFfNsi/yj5FNnM6uMSdVZKhKYc=
X-Gm-Gg: AYBFou1vEa4yYvJL7IdY2qgRwoxFJcqhHGRN51ODbIH22UIfx6KYhsmCI8KcMqmFLbp
	ZnfoYu+mufkL0mpRhN42QSDddHe9dyBUmHucAob3/ppC38BpLGNiGRFuWvo6b2rdaC/ZaMXU+zc
	PvcQdOWOwe+iyANuqvZPLaBVvA/Vkr1nW1sKWvyDn1BVPwriQAN4uLZ6M0xhs8YtXk3WwlzcBeF
	JrXzdXWgfbjOaXqzN/oljfbKCN83tJ/c4QA6R0N9fKXiRTRwF8LF13gR72iYJsGCkTyd/2gVL+q
	cBugwsobSyBnCEwZUvWksj1sRw5Uih/Xp5chm5zz1Bl0aDGGY+U7KQ/7wCDm17AstSJ5WL3ETtx
	hJ3jamgHHgc6DG1Mb8/SdPPoiS6UPwqPESsYvryeZrTC2pexVcbdBnVJmMoSEJftswgo5cDNukx
	Mhdzb+km89N/1OGovJa8gI7nosci7vMIb65ENUDxgIJUtHwhyVKHs=
X-Received: by 2002:a05:693c:400b:b0:36c:ec0:23ef with SMTP id
 5a478bee46e88-37256befee8mr3287444eec.16.1794151220960; Sun, 08 Nov 2026
 07:20:20 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261108144548.190622-1-huggek@klattorp.se> <3cd1da5d-8888-4127-b406-a1ed35454e77@klattorp.se>
In-Reply-To: <3cd1da5d-8888-4127-b406-a1ed35454e77@klattorp.se>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sun, 8 Nov 2026 17:20:09 +0200
X-Gm-Features: AclHuK-5Ll5NaqunHkPsbBiIe692J-yHEwC2l_OQ_mvftK0D4AH9nvuhP5G7uGM
Message-ID: <CAPVz0n0KjpfuNNG=r-Zgf6gNX68UnvUARQm4KUS5FNGH439F0w@mail.gmail.com>
Subject: Re: [PATCH 0/3] power: supply: max17040: report charging status from
 a gpio-charger
To: Hugo Karlsson <huggek@klattorp.se>
Cc: sre@kernel.org, linux-pm@vger.kernel.org, matheus@castello.eng.br, 
	me@iskren.info, krzk@kernel.org, m.szyprowski@samsung.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BD=D0=B4, 8 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 17:09=
 Hugo Karlsson <huggek@klattorp.se> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Adding the other MAX17040 reviewers, LKML, and Svyatoslav as the
> author of the commit in the Fixes: tag, whom I missed when sending.
> Sorry for the noise.
>

I do not see your patches on https://lore.kernel.org/lkml/

> //Hugo
>
> On 08/11/2026 15:45, Hugo Karlsson wrote:
> > Hi,
> >
> > I work on OpenFlight [1], an open-source golf launch monitor built on a
> > Raspberry Pi 5 with a Geekworm X1202 UPS board. The board pairs a
> > MAX1704x fuel gauge at I2C address 0x36 with a GPIO that is high while
> > input power is present.
> >
> > With the gauge and a gpio-charger described in DT and linked by
> > power-supplies, the battery still always reports status "Unknown", and
> > capacity reads above 100 when the cell is full (103 here). Desktop
> > battery indicators then show the wrong state, so we have been shipping
> > a patched taskbar plugin to work around it.
> >
> > Patch 1 passes the device fwnode to the power supply core. Without it,
> > power-supplies is never parsed, so the supplier status lookup added in
> > commit f4b782af61ae never finds a supplier.
> >
> > Patch 2 covers suppliers that only report "online", such as a
> > gpio-charger without a charge-status GPIO: the status is derived from
> > power_supply_am_i_supplied(), and the battery now sends a change event
> > when its supplier changes.
> >
> > Patch 3 clamps the reported capacity to 100.
> >
> > The series is based on for-next. I tested it on a Raspberry Pi 5 with a=
n
> > X1202, on rpi-6.18.y (6.18.50), where max17040_battery.c only differs
> > in the style of the i2c_device_id table:
> >
> >    stock driver:          status Unknown, capacity 103
> >    on mains at 100 %:     Full, capacity 100
> >    unplugged:             Discharging
> >    plugged in at 98 %:    Charging
> >
> > The battery's uevent follows the charger's within 1 ms.
> >
> > Related changes for the same boards, for context:
> >    - Raspberry Pi overlay that links the gauge to the charger [2]
> >    - Raspberry Pi OS taskbar battery plugin reading capacity [3]
> >
> > The patches and changelogs were written with Claude Code
> > (claude-opus-5-5) from my description of the problem. I reviewed them
> > and did the hardware testing above.
> >
> > [1] https://github.com/open-flight/openflight
> > [2] https://github.com/raspberrypi/linux/pull/7744
> > [3] https://github.com/raspberrypi-ui/pplug-batt/pull/17
> >
> > Thanks,
> > Hugo
> >
> > Hugo Karlsson (3):
> >    power: supply: max17040: pass the device fwnode to the power supply
> >      core
> >    power: supply: max17040: derive status from an online supplier
> >    power: supply: max17040: clamp the reported capacity to 100 %
> >
> >   drivers/power/supply/max17040_battery.c | 28 +++++++++++++++++++++++-=
-
> >   1 file changed, 26 insertions(+), 2 deletions(-)
> >
