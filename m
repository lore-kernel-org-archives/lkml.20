Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=128.116.240.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792425584;
	b=nVb9wBtrHryuEsgobTPm1F23B3CxK/b2RPgfbaltWy3pl+os7lFWQqefS9/pUDZahZLT
	 dTf3WoQhMfI3e9S6jmhfkU5aD3UOrL7qBqNww0d/Bv1QQDS6CfzAAjqgDv0Kh8fPeOPcs
	 aM1jypUaPFkUf/PjZazsh/GKr5xTTRRLPDt12NMYyJsrMuMD0m9fu42rAtEAjx8aue42r
	 dG1mSO3VZvfBmCqop281pe6S2x/tQ0KyJT/c617u25JPn3igdl2y/ngDBnc62XYeMmeR+
	 JKGRJvj25tom3uINz7Vd0OezwEeTG1capbDb4tJjsK8bbqc/W4xCP3tzfrcfE5EWnFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792425584;
	h=DMARC-Filter:DKIM-Signature:Received:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:To:Cc:Subject:
	 From:X-Mailer:References:In-Reply-To;
	bh=ygs3X3ENxEn1kcHb0BESwsuMyteLFzl/Orq5Xkq/2Wo=;
	b=OOAhwJNHBNuzQXMbPMBqeNQ//GBJrLBMT1WlJ9SUfzkXOficKTI7wWcvL2jIY7Zxmhzp
	 4EggR/8EXuFXcWaEcrOrQoYvMQprmH4UFgragVz/sZ/BxAed8cfaPUlGImIae5JcYTgKd
	 13tlzluP7CFlYCZ1s0aeNi7lxvzrV+4JO37TAAzGYfqyl6Bu9CyLGYRrqLOgvMZYu0rgd
	 3B55UaWEcNcYdydEwv3JqyLsq2+Avxkup12ejQhJ0kebvO5jDIAvTwSuKA7nDGSCaj/Rg
	 5lAOzQEUHHJM5jwG7kRl3DkdI1lbLmI4R+u1EdWiWiL1X8JTuxViFz9q5c9YVkXabqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arkamax.eu;
	spf=pass smtp.mailfrom=arkamax.eu;
	dkim=pass header.d=arkamax.eu header.i=@arkamax.eu header.a=rsa-sha256 header.s=mail1 header.b=mc0Mg6ww;
	arc=none smtp.remote-ip=128.116.240.228
Received: from arkamax.eu (128-116-240-228.dyn.eolo.it [128.116.240.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC50606C14B
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 15:59:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FC50606C14B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arkamax.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arkamax.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arkamax.eu header.i=@arkamax.eu header.a=rsa-sha256 header.s=mail1 header.b=mc0Mg6ww
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; s=mail1; bh=ygs3X3ENxEn1kc
	Hb0BESwsuMyteLFzl/Orq5Xkq/2Wo=; h=in-reply-to:references:from:subject:
	cc:to:date; d=arkamax.eu; b=mc0Mg6wwR0HCL8oSvMRECfHUUb8XJQFOd7ibVmEC+L
	AdK0KjeH/OpJZsLAEQNytt3zB+fwF5sQJLsWP+0tGzKJtJRo4Ku/bdh0kAas9hn11cyIE/
	duV8IV/kkbzoYE8zuwKVAvpwKGgFiH3r/0TtnU7t4QNqmZD6/T4mriXLghYAQB+3vm3lKm
	4NmAURrlIzGYMhaDrPGj4LSweOQh2Tr5jxeMwwvZZhD1W5XJa9r2eUoP93dsl9j9eO+1Sd
	VOIjPsb9nFWbxKEYAsjJo3+nnF36Vn19G0E6rUtXUQ0WV3Go9grjA+FZWDy6gaKofZuzAy
	iSdima2D25sTAZCeWPfg==
Received: from localhost (128-116-240-228.dyn.eolo.it [128.116.240.228])
	by arkamax.eu (OpenSMTPD) with ESMTPSA id 4533d2ab (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Mon, 19 Oct 2026 17:59:33 +0200 (CEST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Oct 2026 17:59:33 +0200
Message-Id: <DM8XU4VWHK4E.351HYUQE39XLI@arkamax.eu>
To: =?utf-8?q?Ram=C3=B3n_Jes=C3=BAs_Miranda_Hern=C3=A1ndez?=
 <ramonjesusmiranda@gmail.com>, <mlombard@arkamax.eu>
Cc: <kbusch@kernel.org>, <axboe@kernel.dk>, <hch@lst.de>,
 <sagi@grimberg.me>, <linux-nvme@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: nvme-pci: nvme.quirks= on the kernel command line hangs early
 boot when nvme-pci is built in
From: "Maurizio Lombardi" <mlombard@arkamax.eu>
X-Mailer: aerc 0.22.0
References: <DM8QWISGYBCZ.FC52WMOJDZDF@arkamax.eu>
 <CAP08=V2Kqo8OFrKe7rEk3+J3W65rS8vKpA5a_PBC8qwxvQaKGg@mail.gmail.com>
In-Reply-To: <CAP08=V2Kqo8OFrKe7rEk3+J3W65rS8vKpA5a_PBC8qwxvQaKGg@mail.gmail.com>

On Mon Oct 19, 2026 at 5:48 PM CEST, Ram=C3=B3n Jes=C3=BAs Miranda Hern=C3=
=A1ndez wrote:
> Hi Maurizio,
>
> Thanks for the quick look and the patch. I tested device_param_cb() on th=
e
> Surface Pro 11 (X1E80100) with CONFIG_BLK_DEV_NVME=3Dy: kernel 7.2.8 buil=
t
> from 616a9f22 plus your change, booted with the parameter on the command
> line.
>
> Result: with the patch the kernel boots with
> nvme.quirks=3D0xffff:0xffff:bogus_nid
> It reaches login with no hang, and the parameter is visible afterwards in
> /sys/module/nvme/parameters/quirks. The nvme0 controller probes normally
> (pci 0006:01:00.0, 64 MiB HMB, 12 queues).
>
> Caveat: I used a placeholder VID:DID that matches no device, so this show=
s
> the parameter is parsed at boot without hanging. It does not show a real
> quirk being applied to a matching controller. I can retry with the VID:DI=
D
> of the Surface's NVMe if that is useful for your review.

Thanks for testing!

It's not necessary to test a real quirk, just be sure the callback gets
called and doesn't hang the kernel.

A useful thing is to re-test if the quirks parameter still works
as before when CONFIG_BLK_DEV_NVME=3DM, to be sure we are not introducing
a regression.

Maurizio


