Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793263428;
	b=Y/FdLO3k7PZVq6SkCi5wTn0o2v135VUnTzz+mSvf06Rz8qgNOV1JJWH+/UQuIJ/svq5b
	 ff7fVnNfrKowDlGTEfjalRzwt9/nkiFnYs9Yb8McTAwKZK0eZnNHMGYufeG/02RTuUlg2
	 TffLtbz2YScXB3hE8Z1Gb4iSSESDgy+YZqHLAcYyb89DvBSm5B7rfih7KgDC1SiulrRRk
	 lHD31yVcZ/ZQUStt9/ULKMyI3z9S3sBe5/TnNAlWFKCGTLjSetzusoi+dEhxqJgsLVBxE
	 Ul8pfEMPvYqaw9bobNd7Vc4SGTcfZRwsIEoY1IdNbPVldTfY23BgVAqRKrCyIsEJiiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793263428;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:Received:Received:From:In-Reply-To:
	 MIME-Version:References:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=ikej2X49QtIj36ZiDznwF0O2B+EjT+ddV6bxiamU910=;
	b=htOWHszhb64g3mZaXp3iAPIicaiFj/zR/Z2d0SDBPOSafe4lYEA+Ms+MmBQI/it0QlWH
	 crYnzTmwcz5w6/D/RjLT4zhCNhiURm96oGQDks9i+y10ir5MyxJf5MR2ZzuO6qtcW7gqr
	 thK0NVWq8wF3zrQA2Lpik89g+VZU1zX7eXhb6gXl9+ixBT9qvtrvUDvabnI/WV0j/aqpN
	 tLe64durbmlw0aOJ0Lcmp60vkrXEWSxFt9h32rvtGBzt8cMWS1MLmuMGnAp8EZwk5l7Qr
	 iTuk2Wp7ERKElZONoCQ03WujA2OWP6M0khsbNciYbv00rQKzTsxdEdXRMi1hRogXz/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PZD3dxop;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F83606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PZD3dxop
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B24D1F031E3
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793263427;
	bh=ikej2X49QtIj36ZiDznwF0O2B+EjT+ddV6bxiamU910=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=PZD3dxopJ3zk4I1/t3QpPKr/gvtnnbsS9CLoa1m4NP5KE8sq3rq5q0Uez9uctlgFG
	 rkw8A3jmZh8pe3KE00Gt/Bpjx4Yt74GDcSrVyivQGQz1gZcb8UQJqIunWwRg17qTTT
	 wKkYjeHJjOWLv1mjNKrv+cN/G6WTuKp9copxQL7Pa69BwV4FY0+68u597ApkMb8IW+
	 +7JHCkkwg2pdL2mR/k+CakiPp6D5WeFPEAp5K27/8tfeLlv7VDjF/Ymx2gWlWQ2Zrr
	 qrRLXUaSeY2xpGXsu6rtiDI16R1w7bcK/KI1GWX2FpQxu6W27kEyI7LJR/pIqCWFOj
	 OX0gMay0MfQvA==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3ac97e45a79so13667321fa.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:43:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByDM2HzMlgC3r/mrW+Y4UBWS9uy5aAdpkYrmgRQPsdOGFrr5JJqEAxpT/cSb/8BRD72dTF2xY8oYsKR4m4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIrZrQ7xr6ST0G3zl76935iGLly18TJWwvQEyqzTlYnelKIfiJN
	Sh75qFpwyAWCb392no4Gy36cybwX/hu0ZkvBhO4hdeNYYMLEO0wtOF6PjoX6uIOvSeD+ZJEKTyT
	53pAJ1hCxF1258q6/AyB6wBwMyBBgHeBhk1tLZTbdnQ==
X-Received: by 2002:a05:651c:31c4:b0:3ac:48a0:e253 with SMTP id
 38308e7fff4ca-3ac9cf5f8e2mr12236951fa.23.1793263425814; Thu, 29 Oct 2026
 01:43:45 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 29 Oct 2026 04:43:44 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 29 Oct 2026 04:43:44 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <CAMRc=MdWuoANzpNDa9XvJjK=ccY12y7TJaqnUsV8GRqSDh7jAA@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021-gpio-aggr-const-configfs-attrs-v1-1-a98e8d1157a6@oss.qualcomm.com>
 <CAMuHMdWhBeqmMt-VXbh2u6AvzyQ6NsZAzATNRZCnm2DHUAFUFw@mail.gmail.com> <CAMRc=MdWuoANzpNDa9XvJjK=ccY12y7TJaqnUsV8GRqSDh7jAA@mail.gmail.com>
Date: Thu, 29 Oct 2026 04:43:44 -0400
X-Gmail-Original-Message-ID: <CAMRc=MctUi9g5DUOxEa3F541gZXfeDO_dCoJO9D0tmHmcfa_9w@mail.gmail.com>
X-Gm-Features: AclHuK8jarM1InMQ9s0mWphG0Q1RQHgt7P6_poc_jWRv0zoJUeQx3q6bVqCJ2Uk
Message-ID: <CAMRc=MctUi9g5DUOxEa3F541gZXfeDO_dCoJO9D0tmHmcfa_9w@mail.gmail.com>
Subject: Re: [PATCH] gpio: aggregator: constify struct configfs_attribute
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 29 Oct 2026 09:41:02 +0100, Bartosz Golaszewski <brgl@kernel.org> s=
aid:
> On Thu, 29 Oct 2026 08:57:15 +0100, Geert Uytterhoeven <geert@linux-m68k.=
org> said:
>> Hi Bartosz,
>>
>> Thanks for your patch!
>>
>> On Wed, 21 Oct 2026 at 14:31, Bartosz Golaszewski
>> <bartosz.golaszewski@oss.qualcomm.com> wrote:
>>> In preparation for the constification of configfs attributes, make the
>>> existing instances of struct configfs_attribute in gpio-aggregator cons=
t
>>> and use the new st_attrs_const field of struct config_item_type.
>>
>> This has a hard dependency on commit f7528cd38b87fb59 ("configfs:
>> Allow the registration of const struct configfs_attribute"), which is
>> not yet in gpio/for-next, thus  breaking your build.
>>
>>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.co=
m>
>>
>> Since you have to rebase anyway ;-)
>> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>
>
> Ah, dang it. :( I stupidly assumed it must be in mainline when Thomas
> recommended it. :(
>
> Thomas: Unless there's an immutable branch I could pull, I'll need to bac=
k all
> of them out of my branch and have them wait for the next cycle I suppose?
>
> Bart
>

Ah, seems like commit

commit d4d9eb226e4c2af8ab390bb470477fa68072fa2a
Merge: 32543b09681a1 6c1fa55e287a6
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue Oct 20 16:25:43 2026 -1000

    Merge tag 'configfs-7.4-rc1' of
git://git.kernel.org/pub/scm/linux/kernel/git/leitao/linux

    Pull configfs updates from Breno Leitao:

     - Attribute structures can now be const (Thomas Wei=C3=9Fschuh)

pulled it into Linus' branch so it's just a matter of post-poning them unti=
l
v7.4-rc1.

Bart
