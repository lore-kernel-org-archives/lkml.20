Received: from mail.mindbit.ro (xs1.mindbit.ro [80.86.107.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D621614F70;
	Thu,  8 Oct 2026 01:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.86.107.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791422405; cv=none; b=mScR8ixNvJvvb3e+PgBdkN0lO1E4MumJ2HZ1KWEza7puZ5tadjVlrxc9UhL77TzgwIP8C2fVFfTXCL7E2+6toFGo5bxv+Z8y3+cIvfOiYX14lOYGErQe5CUL4tyJ1oIMx6SRrW4XNMxdbnmzQrfCRYzTSfvX+g/ke+VkmpqGZGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791422405; c=relaxed/simple;
	bh=5s2RjtgqfeW8YjBvdmaAXXz0x9eKC+e9L75aBQrOhOY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kB+8GUZ+yHALOGmbeiwN3JOIIru59zvrAaFnpnhGpZ7XdrH2+shAWBzfXbXuUdx0StPNgy1BAbpM1h/F9MbHY7rOqU1LJdPELHXfIlKY/nN4l2PSMxzrtV/r7dakxYMEpNQFTmtVVuX8WTAo0BhbLnpPHsAS0J637hLsPYNHh6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net; spf=pass smtp.mailfrom=rendec.net; dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b=eRFx37O2; arc=none smtp.client-ip=80.86.107.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rendec.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b="eRFx37O2"
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id 96338D19E9;
	Thu,  8 Oct 2026 04:20:00 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro 96338D19E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1791422401;
	bh=5s2RjtgqfeW8YjBvdmaAXXz0x9eKC+e9L75aBQrOhOY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=eRFx37O2ylS4gLZM4BaTdnjBfTT7q2kg+KJY7A83rZnlh61xsVPYaZmCCt34a0bMs
	 m0afetqNqq97WzMAn88FH2JHq7p7OAm/R2gJJokVkEvzr3mjKS+jAsh+fJCfF6QQHV
	 BWSY5d7DkyBgeCKtUa0k75bP/j3YUc0tPAJ3Oc7h0TlBN+lzqGbh99zUEBrUJUbqoW
	 aNEnH7q2N7PATWA60N8FlUa/fdk0WyRnhmcXpC6RAZBidzyXgGBxLsFi52f59FqksE
	 cCU2s655JHJFzgHCZg2JwMxVbbovdKcT33wOEYV3ikwLS5NIGmoKElSw3opxng84q5
	 QhNjRyPNKdUxw==
Message-ID: <43538d360e9344e13359dab406dd7484b1a67967.camel@rendec.net>
Subject: Re: [PATCH v2 6/8] irqchip/al-fic: support error and fatal outputs
 and FIC v2
From: Radu Rendec <radu@rendec.net>
To: "Farber, Eliav" <farbere@amazon.com>, Thomas Gleixner <tglx@kernel.org>,
  "Shenhar, Talel"	 <talel@amazon.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>,  "linux-kernel@vger.kernel.org"	
 <linux-kernel@vger.kernel.org>
Date: Wed, 07 Oct 2026 21:19:58 -0400
In-Reply-To: <BY3PR18MB47223DDF986081E1A74E4A40C6962@BY3PR18MB4722.namprd18.prod.outlook.com>
References: <20260927080637.27285-1-farbere@amazon.com>
		 <20260927080637.27285-7-farbere@amazon.com>
	 <a74366542ddd5e0e3fca71c5dee5d535cc9c560e.camel@rendec.net>
	 <BY3PR18MB47223DDF986081E1A74E4A40C6962@BY3PR18MB4722.namprd18.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2026-10-05 at 11:19 +0000, Farber, Eliav wrote:
> On Sun, 2026-10-05 at 01:01 +0000, Radu Rendec wrote:
> > On Sun, 2026-09-27 at 08:06 +0000, Eliav Farber wrote:
> >=20
> > > +=C2=A0=C2=A0 /* make sure the controller works in non msi_x mode */
> > > +=C2=A0=C2=A0 control |=3D CONTROL_MASK_MSI_X;
> >=20
> > The side effect of this is that all the other bits previously set in
> > the AL_FIC_CONTROL register are preserved, whereas before this patch
> > they were reset by initializing "control" to CONTROL_MASK_MSI_X. Is
> > this intentional? If it is, then perhaps it deserves a comment because
> > it looks like a behavior change.
>=20
> It is intentional, but it is not actually a behaviour change. Every
> writable bit in this register resets to 0; the only non-zero reset field
> is the revision, which is read-only. So at probe the read-modify-write
> produces the same value as building it from CONTROL_MASK_MSI_X alone.

I see, so you're relying on all bits being 0 out of hardware reset
(except for the revision bits). The driver can only be compiled as
built-in, so it will never be loaded multiple times during the lifetime
of the kernel, which means the hardware will always be in the=20
after-reset state when the driver initializes. I know nothing about
this particular hardware, so the question may be silly - is the
hardware guaranteed to also reset in the case of a "soft" reboot=20
(e.g. running the "reboot" command)?

> I kept the read-modify-write because it is the better practice - it costs
> nothing and does not rely on the reset value staying 0 - and because the
> version field now has to be read from this register anyway. I did not add
> a code comment since there is no surprising behaviour to flag, but I adde=
d
> a paragraph to the commit message explaining the equivalence. Let me know
> if you would still rather see a comment at the write site.

No, I think the commit message explains it very clearly, so a comment
at the call site isn't necessary.

I agree that read-modify-write is generally good practice. However, as
part of their initialization, drivers should make sure that the
hardware is in a known state - either by resetting it or by setting
registers to fixed values. In this case, you're assuming it's already
in a specific state - which is fine if that's guaranteed to always be
the hardware reset state. In other words, I just want to make sure
you're not missing a case when the hardware can be in a different state
than after-reset when the driver initializes.

--=20
Best regards,
Radu
