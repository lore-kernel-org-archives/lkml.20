Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793683753;
	b=IpDI7TkHkB9qDl+lqoN9hhgMCJ3ZDjZX81mOawZuhotAnVQpHzhB3b3vxD1nK1BIMPwJ
	 itA/FScchKdDotr0qN00NUoRtw7ZnEiaE7BUaTkI0HgffhyjYU7UKKLxXYBEi+Mh/qzkO
	 2mwsYrzcPNqpAXRlu/RGXixpqdD046BzFFeYZcU7oeb/E7WNJkqYj8nVaEkQjKhdDL6vM
	 Q9L2yBMDkXS3dfTmKOSITJlWi2+xLaN8IyYlTcuwUWabVUkYdyjpgwMma4XGvWAwX6SlS
	 iwL07pMpTwGVQg4XmUip9iRGx2TCzD04XIYsHaMEUbFbK2HZ+CRhz8oLMiPekQyfebQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793683753;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
	 Subject:From:To:Cc:Date:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version:X-Provags-ID:
	 X-Spam-Flag:UI-OutboundReport;
	bh=SxG6PIAHMiIxjEdRE1hZ7mVhTGPGC/Xc8AEgZuWrMDE=;
	b=Dea2QEZPXvm/xuY7bmrkEnTCm80bQdCrs0egKImIf2x6aBa7bkcqJEPu0i7w1tRwxi7y
	 IYryGrejjx8EfU0eH7JCqaxPZdjGzcFoHmkkNS7w1o3m58IOvCvcZ8LKAWYSXnrik+/sZ
	 IlS1plaC4G57rgwCyXrV0E3l5OqfMvbAD2iniUkED6hdsORliXp37yrAvZm7YMOH3J/fZ
	 OHT2gmDL7McfJaViNYtHOXx+Vh0U2XxPEnMePArn3AiiehGRgUxmxqGH/bs8uE8makgLp
	 aVdm6vbCJPu7e0ApdhNAc0kySx0d8jaZqRWWhZXUnYe1EQRcZ40/lJFERQjMsxt5DdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=efault@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=rHeXB2uj;
	arc=none smtp.remote-ip=212.227.17.22
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC9E606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 05:29:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BC9E606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmx.de header.i=efault@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=rHeXB2uj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1793683739; x=1794288539; i=efault@gmx.de;
	bh=SxG6PIAHMiIxjEdRE1hZ7mVhTGPGC/Xc8AEgZuWrMDE=;
	h=X-UI-Sender-Class:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:MIME-Version:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=rHeXB2uj6G3fbcDN2FFne6XWSueOhJxKQbG+fWOAON1RmnanLbW4EUkUFQ/Lcwh2
	 mXQLIHmRxnseHRvNcfW6uVeERC9zDBrEwECM3Usie2HFlbXXXvn15dtexxMHXLxBh
	 b7Oi2LfaKrMDPCFSoCQov9T+MOQzdsax9k/oJUiLTRG0BRVwRBreoKzExkehZvsLz
	 f5nI6G3C597VDzwEZcRPwrRWLV1/ebUY3D+fGYYMnWob2a9ZUseMDGlhUBfJC3z0l
	 KMXmyU3W9UwH/uu4xR23t70BKuArp0r6eRGr0aopyOsAjyaryPTlByGris13ImAMX
	 MUd4/WRPI3TBbmRVXw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MSt8Q-1wx4qb2pVm-00V4xu; Tue, 03
 Nov 2026 06:28:59 +0100
Message-ID: <41ac0a8e95e22870efe308e8df9921960c53d4bc.camel@gmx.de>
Subject: Re: [PATCH v3 7/7] sched/eevdf: Move to a single runqueue
From: Mike Galbraith <efault@gmx.de>
To: Chengfeng Lin <lin2530632123@gmail.com>, Vincent Guittot
	 <vincent.guittot@linaro.org>, Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>, 
	linux-kernel@vger.kernel.org
Date: Tue, 03 Nov 2026 06:28:58 +0100
In-Reply-To: <CANGjgdnS2ZbyvxyeqsYeD_aAH3PYVaQHXfY_A661GeSUwxK4VQ@mail.gmail.com>
References: 
	<CANGjgd=yr4Zy+SMUsDnBSw05hhn9086NVc9g9SaG0y804=WWrg@mail.gmail.com>
	 <5ab06e4740bb0fd177a96e0a31f933a27d081012.camel@gmx.de>
	 <CANGjgd=DvO72NiB8SC3hNEadmxgzy1niN-mnWyY-LGMJ4H=J0g@mail.gmail.com>
	 <455d642847fdee6e2a8b594597037c5db9791afa.camel@gmx.de>
	 <CANGjgdnS2ZbyvxyeqsYeD_aAH3PYVaQHXfY_A661GeSUwxK4VQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Provags-ID: V03:K1:E/TsYcBkpUV7bpgtDvcdX12vVtmh8rh6YnY+P5Zy+xVx0/Dvhme
 Rk5zgfFz6Kz3UPA0gDJYiIOyXf5oFGqpnjBLHMrNwDDSXRVHO8bb6kKgkEBl2kMrYSF26y4
 LfyRrP6qstmXeva11E9/1i2sCuQnMHRED1OsPPagqAyVblVfmBOOKo+08HktA/W1xzq4Nsy
 rr3oGDSsFvAPKwwIdcggw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Oj9QPALHgTU=;0iArpfs/1GV9wAQpwg72ZTWG7nG
 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
 dVbrMblg7XwISJUKMlZ0aJUw

On Mon, 2026-11-02 at 15:58 +0800, Chengfeng Lin wrote:
>=20
> If you make further changes in this area, I'd be happy to rerun the
> context-switch benchmark across the full range of worker counts and
> share the results.

I'm sure this little regression will get fixed up as the dust settles.
My role was the easy one, that of hound.. all you need is spare cycles.

The good news from hunting excursion is that what the reporter's probe
did was to validate the DELAY_DEQUEUE mechanism as being a genuine QOS
improvement.  The reported QOS regression was per measurement the
DELAY_DEQUEUE progression going missing when all cycles expended
between the most recent inflection point event and pulling of payout
lever were banked nanoseconds before the real deal inflection point,
the preemption decision.

	-Mike
