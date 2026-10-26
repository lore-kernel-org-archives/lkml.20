Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793051984;
	b=mPl8mMn4QV0HfiXvJjbzS7OJcnhVMX7lvH9kWzmfe6C8xvDoCr5XJWJDm4KYvw76bo0a
	 vsoeerICJKI29bXHvKmIF4hbER+1ajSXboAJabIcwkl67z2PKLeUhRzvLUDxvtxNWZkcs
	 R9FVV77c72VaMjH60VlC03JO41rV/tx6X7bTVYP15BBBXcx4ZxyNRknJx8Ihfx9JfVEqR
	 ntUu40JcXVtFBwsBn5eYwzkB2VwE4Am4K9ZR5hN78DDtelrmpHpEkY/+oskaWoXXOvCrS
	 GjaIiHtP1yzl6szO8eulECDhhK24rSOfjGHkOS7JYOBNnfDF8ouK978+IB3yEVD1XXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793051984;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=+m90/BE9W7ceyk7Kg43rx7CwPH9tLtlL4/9fP2ch08U=;
	b=gsGRKDN/6DERo1KkuoTIZIbD7CzzkzXwT3lKyEGru/WuljAqKVGM7/5v/wI66CJRx5XL
	 LVg9W/q/gO+g2Gu2++tUxw9AC8/LJ4n/bZq0hlTlfr8bqOtO8u+b3xKUcO6R+CnZupe6k
	 LkUDEEpedT1WZJ/kaSKmfq1Dv+8m0cQ6RS1RHrIq/AhlSxabn/ulqHsPvkrBXBoTHSbma
	 FGiT1Jxd5wCQF601qi/MHdjRmyEWXME5nc55UHT5tYki6bB5ogETySsN72kpUamFMA7yd
	 0shujTPhaBcZl6rk3EETcnE5i86rJvGINvTEuALIpeSNY62U2uD1MG0WjsysqrAMAZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RPC3gJXG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F091B606A31A;
	Mon, 26 Oct 2026 21:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RPC3gJXG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46D8A1F01825;
	Mon, 26 Oct 2026 21:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793051983;
	bh=+m90/BE9W7ceyk7Kg43rx7CwPH9tLtlL4/9fP2ch08U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RPC3gJXG4gvMCXl5QJjOstovdQGAgc4KKdPEMfY9X5jG2CetdOJUBI8O1Uw2FH4oE
	 d4cbj9Ln1RBhrMtikF1zZq0xQ1WiXfWLjvdWuCTnvNLAo+hSnTuJfqNN6Lf80oxYF0
	 hJ6tYxDAKJd4kYmofnbNlcj0zYvreYBKTgXKpG3cB23kR3CtJq+JwwAFerU0g5lcnv
	 m0w78BoWVB98qp8Gccl8gQBGNzheEMPZW2lBG4nyQH0EEDdk2jmODlivMZp7XwMLVA
	 /WDEHjLMsH8g1OI8ONuZdMhmc+91op4kig60MXr0hMXBXuHArJLRxuo/dmLbqfoWX1
	 LicqDC65Cos+Q==
Date: Mon, 26 Oct 2026 16:59:39 -0500
From: Rob Herring <robh@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Dan Scally <dan.scally@ideasonboard.com>,
	Li Youhong <dayou5941@163.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Nayden Kanchev <nayden.kanchev@arm.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: media: mali-c55: Allow wakeup source
Message-ID: <20261026215939.GA3881111-robh@kernel.org>
References: <20260929-mali-c55-irq-supend-resume-v1-0-e3af34afff12@kernel.org>
 <20260929-mali-c55-irq-supend-resume-v1-1-e3af34afff12@kernel.org>
 <f7987857-7516-4184-9a50-2b42a2d01234@ideasonboard.com>
 <CAD++jLnP1+aV99QkVRUX=7L67z10WuUSfqvxDZ8d44FJcVZ-Qw@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLnP1+aV99QkVRUX=7L67z10WuUSfqvxDZ8d44FJcVZ-Qw@mail.gmail.com>

On Thu, Oct 08, 2026 at 03:22:18PM +0200, Linus Walleij wrote:
> On Wed, Oct 7, 2026 at 11:29 AM Dan Scally <dan.scally@ideasonboard.com> wrote:
> 
> > On 29/09/2026 13:02, Linus Walleij wrote:
> > > The Mali-C55 interrupt can be wired as a wake source on platforms that
> > > support it. Use the standard wakeup-source property.
> >
> > That's interesting! How's that work, though? In the RZ/V2H particularly the ISP is in an offline
> > mode, so I'm struggling to see how one could trigger the interrupt whilst the device is suspended,
> > since you'd need to instruct the IVC to queue a frame.
> 
> The implementation is IP-neutral and doesn't really ask this question.
> 
> The typical silicon solution would be if the IP was synthesized into
> and always-on power domain on the chip. This means the CPU
> which runs Linux is powered off, while the ISP is still powered
> on, and could generate a wakeup IRQ. This is how e.g. GPIO
> units that can wake up the system work: they are always
> powered in some sense.

In that sense, anything that uses 'interrupts' should accept 
'wakeup-source'. And we could implicitly allow that if that's the rule 
rather than the exception.

> 
> I don't know if that makes any *sense* from a system engineering
> point of view, but it is something that can be done.

But I don't see how it makes sense for an ISP. 'wakeup-source' is for 
system level suspend. When we're powering off idle cores and need a 
wakeup from an interrupt, that's a different, implicit mechanism. For 
example, we don't put wakeup-source on (tick) timers.

Rob
