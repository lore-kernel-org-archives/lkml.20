Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F9D4D9F84
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 14:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790604790; cv=none; b=Hv2vd3dSBYtcPPfB0NUGpzC2/s6hI2ijyKGhfqwsr5z0yRnqR+65og2AiSUHc/a/cM3xKihubzV4tUhCtsUNJouJtUG1IbJGXRocRvuG0l2iQuhKKJS4yQf1bwySQU/v0AoojKKiXdjJzeqrlMCKQkfZnvwKkxTiVr70CpaMpPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790604790; c=relaxed/simple;
	bh=6HBaItGOGzStuAz7fkf252RWtsDvE2Cf8RDnHDwH9WQ=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r84hNTOaHdtOqdlfT+aVLXKfAoGKxwH57m3g1js8NGDsEZsuyyiSJ65c5+jegOlJ+JF2/fVlWTe2pvYiVkCY8zOaBriD/W4Vl8bwf8XNZGsD19oStt7VCTjSluGqwxL5/pSW6HsYxMXAbkQNRy0WFZA79BjC/cvuI1hmp7eefgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IrRO48c0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IrRO48c0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7AA81F0089A
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 14:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790604788;
	bh=Qp4MVyPyIQCGu193QRW6Nt7E4b3gzEqg0aXBrekD2BY=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=IrRO48c0tI28ZW9sh4ON4ASbEEFISMiBdehEEWRvyClvl4Wva+KADpVaPoMhMiWlo
	 oiG/bvc4tyElT4iPkDdbWso0PZLqvP7+xWB/grJsCSttcOunZjOxrgqrn5lv5oqlEj
	 v6OXlrwsR9rtfWmOSNfln7syWmNN+TsyFvxeJvnjTLLaVKDIWQpeZrWAuK13jLQNGk
	 a/avL59yiu9DFQrwX7s1EYXw18eHVyHRCdfhwB6e36loAfpYySIg6+oDlAmBVTgOZ4
	 GHC2pN51MRkZa2S/mgEVgido0CJsM0opZ56y7WeZcddfl2vMtOEiNd4hLPFrUKkjx7
	 NGSZ/YvEfbjtA==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8c1b8d7b5so2635003e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 07:13:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwLbBL34iceu+mZw3ip2xmV6poMYEiy6wABSoFP6InvjYi/4XPvfb436d/Dosib5xFEG4b6r5VfhLMuFxk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLcc+p977782z+igAok+6HMKFDTHTGAjtdYObOgMzhY1jmHfrLV
	ETeLEBMbpI+vaXN8AHZ6N/rxFGmNw2m8xWl8fBJzxNeRjWEoshHOyApRwP9jl/NnHvK2ll/XgWz
	rP/YgIFhRLHDzgeyQRz2a3CXpWIzCNhKdYSD2U8Do6g==
X-Received: by 2002:a05:6512:3d11:b0:5b8:eb6b:a41c with SMTP id
 2adb3069b0e04-5b8edbc2876mr3063467e87.50.1790604787575; Mon, 28 Sep 2026
 07:13:07 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 28 Sep 2026 10:13:05 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 28 Sep 2026 10:13:05 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <CAHp75VdGwVf2pCXzmQoY5zvgSf0KsRH8hU9Qt45iZmEG0KMzCA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925-gpio-organize-by-vendor-v1-1-8feefd60581b@oss.qualcomm.com>
 <arZRZfa7AmDxmwoJ@ashevche-desk.local> <20260925125433.GY106095@black.igk.intel.com>
 <araGjQoaffMhDMLz@ashevche-desk.local> <20260926100727.GB106095@black.igk.intel.com>
 <CAMRc=Mc-C4ptY5phhAkpq7DbE-+=G5h4XByYdj2Xx5sVS-vvrQ@mail.gmail.com>
 <CAHp75VcctaQpSpKbr8i+LPfE8Ukazyn8=KhwsSa+4sbhvQ=WVQ@mail.gmail.com>
 <CAMRc=McKAR7VadTYtTfU1kAHSRidj_AdhBbDh+2zNpFWhjA2mw@mail.gmail.com> <CAHp75VdGwVf2pCXzmQoY5zvgSf0KsRH8hU9Qt45iZmEG0KMzCA@mail.gmail.com>
Date: Mon, 28 Sep 2026 10:13:05 -0400
X-Gmail-Original-Message-ID: <CAMRc=Me_sAdbqLq6s9sQ+Ti2_CfE8uHbAVqhe=PPpu8kPGkn9g@mail.gmail.com>
X-Gm-Features: AclHuK9FI3IbINXds5u1IdKmWZo2j8enRfqzvSlU-qFYCbHF8WJSC7UgMBsKL8k
Message-ID: <CAMRc=Me_sAdbqLq6s9sQ+Ti2_CfE8uHbAVqhe=PPpu8kPGkn9g@mail.gmail.com>
Subject: Re: [PATCH RFC] gpio: move intel drivers into their own directory
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Linus Walleij <linusw@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Peter Tyser <ptyser@xes-inc.com>, Lixu Zhang <lixu.zhang@intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>, Mika Westerberg <westeri@kernel.org>, 
	Israel Cepeda <israel.a.cepeda.lopez@intel.com>, Hans de Goede <hansg@kernel.org>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 28 Sep 2026 15:12:18 +0200, Andy Shevchenko
<andy.shevchenko@gmail.com> said:
> On Mon, Sep 28, 2026 at 3:25=E2=80=AFPM Bartosz Golaszewski <brgl@kernel.=
org> wrote:
>> On Mon, 28 Sep 2026 13:34:44 +0200, Andy Shevchenko
>> <andy.shevchenko@gmail.com> said:
>> > On Mon, Sep 28, 2026 at 2:13=E2=80=AFPM Bartosz Golaszewski <brgl@kern=
el.org> wrote:
>> >> On Sat, 26 Sep 2026 12:07:27 +0200, Mika Westerberg
>> >> <mika.westerberg@linux.intel.com> said:
>> >> > On Fri, Sep 25, 2026 at 05:34:53PM +0300, Andy Shevchenko wrote:
>> >> >> On Fri, Sep 25, 2026 at 02:54:33PM +0200, Mika Westerberg wrote:
>> >> >> > On Fri, Sep 25, 2026 at 01:48:05PM +0300, Andy Shevchenko wrote:
>> >> >> > > On Fri, Sep 25, 2026 at 12:22:15PM +0200, Bartosz Golaszewski =
wrote:
>
> ...
>
>> >> >> > > >  drivers/gpio/{ =3D> intel}/gpio-graniterapids.c   |  0
>> >> >> > > >  drivers/gpio/{ =3D> intel}/gpio-novalake-events.c |  0
>> >> >> > >
>> >> >> > > These are interesting drivers, not sure where to put them
>> >> >> >
>> >> >> > IMHO they should be there too. We are maintaining them both.
>> >> >>
>> >> >> Do you send PRs to Bart or you just rely on him to take the patche=
s?
>> >> >
>> >> > I don't expect these two drives to get too much attention, and they=
 could
>> >> > be contained nicely inside intel folder and that would help Bart to
>> >> > identify that these are Intel drivers. So your bandwidth would not =
suffer
>> >> > even if these two are added there. Your call.
>> >>
>> >> I'd like to avoid a situation where we have Andy's Intel drivers unde=
r
>> >> drivers/gpio/intel/ and other Intel drivers under drivers/gpio/. I'd =
prefer
>> >> to move all of intel GPIO drivers into drivers/gpio/intel/ and have A=
ndy
>> >> gather changes to them if he agrees.
>> >
>> > Okay, we have two parts missing:
>> > - Nova Lake driver (I would need Adam or Mika to step in as at least a
>> > designated reviewer for that)
>>
>> Acked.
>>
>> > - USB IO (I think we need to agree which tree it will go through, my
>> > bet that media tree is the best), for that we need Hans' consent
>>
>> So far the initial commit was picked up by Greg and the other two were
>> signed-off by me with Acks from intel people.
>>
>> I'd do the same thing as for nova lake: Israel, Hans and Sakari as revie=
wers
>> and you queue the changes?
>
> I'm fine with this route as well. Since Hans replied, this all depends
> on Sakari's answer.

Does this include moving this driver under drivers/media/ as well?

Bart
