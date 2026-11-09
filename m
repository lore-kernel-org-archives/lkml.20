Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794199290;
	b=hGMvdIj8uCj66dWXUgWphflPp/YlHNd4lV84rIshpI6s3NXlkJFTp9y8qlHjW+wP3qm0
	 F/YsgVP2kesejIuQsp5VbAiQL3ST5GJmDeXGASiANhf+dnRzQC0vyh4YCZr333lNjxqiE
	 f3sF7qmmUl73SXT8g/u650PbqWjdCY5KP1AwUezgAVbIk3wDRT7jn7auPBP8sIn4A05RH
	 E4PIhsYkQjXJvixVLow7zu+v8GEMJCa8DFDEMxBCU0pUOMcgmY+woxOjwGxMO4MOsm/Tb
	 jDtBcdX0e3MkWyXXLo7Wdf5uzhm4Opp9p5mysqI0re/e8oJMtvIVwdk7dEwQYO2zNhA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794199290;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=WPUgjz9yrlSKqR8e85QEERzjQTMyzYLvqAjjoRM1I1A=;
	b=Bnfmkda0RtMpHpkMRqRXTTfeBQCt5KzQ2j/KJq3mYXnn4vHdk2aj/U7EYwf14Rvhp0lN
	 i0hdOdsPRntDojGAbJS++Nbdnhz8CC+xsuvNEbXUhZV3mUdwOpFF8KwjFJOqoDnic4DWt
	 CFpNBkSigmF1WYqW9Dqa5HUXMk9vB6itN7UkkYX6XoNfI0WfGsHEyEWUEkMfABq3tpu11
	 Ni6Yc92BlzAzvBuziHDBS7Er+cutg0pDtEvXnuK6bYmNWjbqWQn8Fq/cbhnbZYo+Forst
	 3GBxOc3uzwpYQGp+2DN6uqk/giXJIiibn26Dy6gxIwnC8Ve9ZcNFFfaxSP+1hFsb0Lg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="qWzyW8/u";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E5F606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 04:41:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8E5F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qWzyW8/u
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3700ed8dbe3so1183875eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 20:41:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794199289; cv=none;
        d=google.com; s=arc-20260327;
        b=om7O1B2w4Vv42IQORoAqb/wZxfX1RgO7F2QwlVYiz6YXKdOXAYRUddva0lwlGng3tG
         lSnui9uJxY5BVaLpEBaEWg2UR4dGSoq1me64zjGNEefN2F1RGmEVtCcNeuUbMU7s7ITL
         Sj3Bwvv6tt4qhcVHzreeD9A4I9Nb5cg+Zrix2wLiBQ09P6QK/hlgqErMFoldA9CmVWbu
         k3SYbjVRYZJZvpYhmhsFQicvfpPsoiKi3rrJltgIc1oQjnxuGTmC10vrlGgprRUQ35j+
         EmLhX8u3jWXIjxpyPzcxCuGZV/Q+aruDF8NAmQ6oxW64CEGCtJ1EYjM7IEJwf9lBdkoR
         dOAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WPUgjz9yrlSKqR8e85QEERzjQTMyzYLvqAjjoRM1I1A=;
        fh=3Lky2aTKfcHf2UZArGD7hwn6g3rrU7TTB2xvXqrKRxc=;
        b=ZR5+kMeKibA/agYDaePcRlnFD7KBxENpgUUxgRJDfYs2Wju1xuYVwldcsWZPCspq9h
         R6ewazACpWfPdzlHQU7KBPUhftirI0df6KB2lir7bshQOxKZ0nPb3CPWgoC4xWf7aWAf
         xIHguIhCjSnEphLqbdQWTPgoSe3fxPGyeAaoJpuG5ls5FJev9MO/95ubj++OkA8joKk5
         LtsDitADMsFLHplQd8GOKunmFG3nC4xhIx/vMZfCDl/5qxSlTotL6kHcTbqDXRTmMq6p
         ESma1H/Us2Y0CXbAmuj71j3k1ZHEQHUmT49Lr68bxlhjHO35ZPVMhKvduS0eeq12jmIF
         1kwA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794199289; x=1794804089; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WPUgjz9yrlSKqR8e85QEERzjQTMyzYLvqAjjoRM1I1A=;
        b=qWzyW8/uDqqZV968N5KMa+aeZcBBcxYqwpr0/9uFEACzVarzJn7M4ZXAcInHD+Iags
         WhCbpkaDQ/9NNQte6f9vGtRS76hEzry90XVMO0itGzxrEdLe2sbGinMrC+/gIVrgvWfK
         gPDLMDVzLSwdAkaWSknCY+DGn+bfibCfcNtHtV1+NBFvliwTCB66hgl/SBeEYptEr1LF
         MUovj3LVM1XdPGgRzvOcjiiB6G7rG6UZgK0fxjK4RGlnVcx4JyoYoaeByMwyCV5NzoYG
         tKM6eZ2IE6Ciq4whjh3oUr1hvfTkQ6fCjA79BYWdP6zX3YsvZ0PqwUMUfTtydn0qmR2/
         qLWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794199289; x=1794804089;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WPUgjz9yrlSKqR8e85QEERzjQTMyzYLvqAjjoRM1I1A=;
        b=HA8eiAg+A6U1uzX+IlnrTmkZzgTKk3qjytZw/dqLZavAW5i3MKKz5W7G3D5ZfkeIGM
         Nv0T1aQN+i54zTLY8R8ZxPDIxaPJgtW2QSpJQq1EWsh8cD6P40Zqad3HunBQ47Kb8IwI
         GCluy5TQiUlnTSBO721HACDPcjYAdiOID42GlllRAMlZwMuEf0cT1RtitQKqWsAWWiGq
         AyU+gpRoP7M1hemW2g22CbMdhqiYrS+dL7GhqXR+291KMiK/1FVgKGnvwCwG/1rO2weP
         mSuesrJlNW1zbkrRpWvz98wqVZhRAK1ZKtD/c+egD3yK8rV+OgLDp3dz6LBZCwmSbrTm
         xLeA==
X-Forwarded-Encrypted: i=1; AL+hErENcZi1OpWGHQPItBms4uzZZqv/OZhad41UC/8E/AKX+9xp+B9xYeikB42vZ6LAX8RWsGvaOHVE3kL+IMo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/D6IPgkNjarBI1gOqRf2/lMUrOuCN/cNqq+eB4JIBpAfkHrzug
	XK7XZRyGgGQneHNf6eG3u7VNhPJ0H834Ph9lhDY8WT5yzNdxsD0LsxSum3uoO8uTO3lC5XSN4cL
	8fWpIHdjW0vuPQs+093GSVbUKFvBFj/U=
X-Gm-Gg: AYBFou04k5jDFLic3ikOLOMNJhW++pkv7n0GCut89K0MKV98fGzGCYKg3nxQO0X9Q/T
	1Nt3g2nUIOzKlaD99ZIrA5k/zT+xesK+y2Kg+/1IFRhmmKuJIlIiQthfOpdXpedvgB3+KPHVrIN
	64HNCOqiXB27jTpyznTgVe37j8+uW/1yHcF2bIg+pc4YM6HMp9jG1TqysxIBqZnsPBCel1sLE8Z
	S3xhG2rsobfNXSea5Kb0Z3DXllbGNjhJSZVoGjvLdClMiUx2inUuAohJIkmd5N/48wt2kuPya4q
	YsUkilxSNQ94GvqVi36M1v0d2sxqqY77Jqys6XDWvfgORnUI0MGLFFX7ZZ+MkdOAnOdCPr8eVaK
	m9SZl6xI9DuvmjipWz/52F2QxgEJEd+hlgdrldBWTmt7wKD1/JFR8NNDO8z4peF7FJgps
X-Received: by 2002:a05:7301:1285:b0:343:9eb1:9940 with SMTP id
 5a478bee46e88-3725e33de65mr8199608eec.26.1794199288994; Sun, 08 Nov 2026
 20:41:28 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106160057.2754689-1-hj351016@gmail.com> <avEdYFDUHIj6mq0Z@venus>
In-Reply-To: <avEdYFDUHIj6mq0Z@venus>
From: khj <hj351016@gmail.com>
Date: Mon, 9 Nov 2026 13:41:17 +0900
X-Gm-Features: AclHuK_VP_O81IVVw6nsjch_EUlJXziP3JNmGnD4QyN0YGW8m1KTdax5oeelWrE
Message-ID: <CAGr5VtNJwmMej+90yoLa6su5fcBc1gwOPviMGtjj7pis+Y7jjQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] power: supply: fix work-vs-devres teardown use-after-free
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: linux-pm@vger.kernel.org, Chen-Yu Tsai <wens@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sebastian,

Sorry about that.... and thanks for taking the time to look.

You're right that the commit messages were far too long. I had added the
"how found / tested" note out of habit -- another subsystem I send to asks
for exactly that information, so I carried it over here without
thinking -- but that is no excuse for the length.
My mistake...
I'll resend as v2: commit messages cut down to the bug and the fix, the
inline comments dropped, no functional change.

Thanks,
Hyunjung

2026=EB=85=84 11=EC=9B=94 9=EC=9D=BC (=EC=9B=94) =EC=98=A4=EC=A0=84 10:11, =
Sebastian Reichel
<sebastian.reichel@collabora.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> Hi,
>
> On Sat, Nov 07, 2026 at 01:00:54AM +0900, hyunjungg wrote:
> > From: Hyunjung Ko <hj351016@gmail.com>
> >
> > Three power-supply drivers register a poll/detect/charger-detect work f=
or
> > device-managed cancellation (devm_[delayed_]work_autocancel()) in their=
 probe
> > *before* they register the power_supply via devm_power_supply_register(=
). devres
> > unwinds in reverse order, so on unbind the power_supply device is relea=
sed first
> > and the work is cancelled last. The work handlers call power_supply_cha=
nged()
> > and dereference the power_supply, so a work instance still pending/runn=
ing in
> > that window touches the already-freed power_supply device -> use-after-=
free.
> >
> > Each patch moves the devm work-cancel registration to *after*
> > devm_power_supply_register() (and before the IRQ/poll that arms the wor=
k), so
> > teardown drains the work before the power_supply is freed. No functiona=
l change
> > otherwise. The relocated devm_[delayed_]work_autocancel() still runs it=
s INIT
> > before the work's first queue site, so no queue-before-INIT window is a=
dded.
> >
> > This is the same class as the recently-applied cimax2/extcon work-vs-de=
vres
> > fixes. Found by static analysis / code review; none is reproduced on ha=
rdware
> > (each needs its charger/PMIC/gauge chip and is not QEMU-reproducible) -=
- treat
> > accordingly.
>
> Please don not send direct AI output. You need to drop useless
> comments and trim down / rewrite commit messages to a sensible
> length. Instead of huge amount of spam.
>
> Greetings,
>
> -- Sebastian
