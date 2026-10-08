Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 854E0471255
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 13:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791465755; cv=none; b=gbOK8sNbofyuToyzLsOyLbPzVGmTE80wt2t/wrjM4aTRg0q29KNKQQ8XYLRf+4Yy4c2ckW1H7HHq3Njgv1Hi3gwr6TDjINRedKL6gjUIHqwGNnQpEkgSFf6XdKVpW7eNdHfRSNLCGhYynHgmQFhmyU1hP7OPfGtByVPgk7T7NmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791465755; c=relaxed/simple;
	bh=WBXtropSzprUTX2O5FwhoUwgPtwsDDIyB2/KMKt3/lE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=axKvx3DzxMmshe4MWG1lfhm/USkaN1/ylsGMMctJ6++W1KxARqrOPUumYAPLw/44qGtMMbJ/Ch6JSinag0dj0sylu0LCOQtMdvCIOjdtZODGw3iAPe7+c8w8kI5jtWPpF6SvnUFyswWZ0zjsJ7azk8zZUk1wbwmAs6uIS8awUXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RVrQodrv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RVrQodrv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40B1C1F0089C
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 13:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791465754;
	bh=WBXtropSzprUTX2O5FwhoUwgPtwsDDIyB2/KMKt3/lE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=RVrQodrvfX8BLyPmA1KAw/5Y8/NZCTIw0S/hv0SelcX3h92+ckfFvi3SAWVX9htgu
	 7/yfEZ35v95BqA1MUxukZ5fT9oUbyhyh0o4YaElq7FA9/tjWLkxRU4t3zf8Ebdb2GU
	 3QLPD8+N+jVA156qJUZZaZlrRQ401v5ICeC7wQPC74dRUVukh9SnOQEfFPz/hN1dEw
	 oqOYyfg+11CnADhC4GoieryKVucWfk6FQZ579l7iwN/Aip/moNIvSySf0M5E8BeNW7
	 w75KP5Y5VgjEXZZIgBIZSSHkKkGPOkwQ1Rz7ZrUwDE82UpH4cjh8KiBWk8rSKESKqg
	 0qpIhEv4IsVTA==
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-49e53ba03f5so834332fac.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 06:22:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwndurAo7Stiyac1zsAc/NpMM5bEgI5j/r4yUMka8EL3ZjV4IkZLkj5Wbs4sevrZz3gHZ8GJRYm93aZM6k=@vger.kernel.org
X-Gm-Message-State: AFuF++lputEiAqnSzzCmjXcR62OFlsmS9VgRxjlQY3ENDr940rM8MVmT
	/eY7u4q6yTelwuQJ3LgQ/cBPuW6KBcRNEgIjpQejCAH198BYs7/uOsOJ8YeWJ86bu27qqcMrHs4
	povXa+FFD7nKoNUjh1pHBz5TT92BRR6g=
X-Received: by 2002:a05:6871:b2c:b0:47d:a12f:3951 with SMTP id
 586e51a60fabf-4a259661200mr4847200fac.39.1791465753534; Thu, 08 Oct 2026
 06:22:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929-mali-c55-irq-supend-resume-v1-0-e3af34afff12@kernel.org>
 <20260929-mali-c55-irq-supend-resume-v1-1-e3af34afff12@kernel.org> <f7987857-7516-4184-9a50-2b42a2d01234@ideasonboard.com>
In-Reply-To: <f7987857-7516-4184-9a50-2b42a2d01234@ideasonboard.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 8 Oct 2026 15:22:18 +0200
X-Gmail-Original-Message-ID: <CAD++jLnP1+aV99QkVRUX=7L67z10WuUSfqvxDZ8d44FJcVZ-Qw@mail.gmail.com>
X-Gm-Features: AclHuK8rWtCgLBExYEFVtV6YJ_L_wVK9_y0rwU4QnsM7FeH0zmh-80QUTN8UTes
Message-ID: <CAD++jLnP1+aV99QkVRUX=7L67z10WuUSfqvxDZ8d44FJcVZ-Qw@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: media: mali-c55: Allow wakeup source
To: Dan Scally <dan.scally@ideasonboard.com>
Cc: Li Youhong <dayou5941@163.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, Nayden Kanchev <nayden.kanchev@arm.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 7, 2026 at 11:29=E2=80=AFAM Dan Scally <dan.scally@ideasonboard=
.com> wrote:

> On 29/09/2026 13:02, Linus Walleij wrote:
> > The Mali-C55 interrupt can be wired as a wake source on platforms that
> > support it. Use the standard wakeup-source property.
>
> That's interesting! How's that work, though? In the RZ/V2H particularly t=
he ISP is in an offline
> mode, so I'm struggling to see how one could trigger the interrupt whilst=
 the device is suspended,
> since you'd need to instruct the IVC to queue a frame.

The implementation is IP-neutral and doesn't really ask this question.

The typical silicon solution would be if the IP was synthesized into
and always-on power domain on the chip. This means the CPU
which runs Linux is powered off, while the ISP is still powered
on, and could generate a wakeup IRQ. This is how e.g. GPIO
units that can wake up the system work: they are always
powered in some sense.

I don't know if that makes any *sense* from a system engineering
point of view, but it is something that can be done.

Yours,
Linus Walleij
