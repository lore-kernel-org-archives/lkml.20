Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794216983;
	b=W929DxBXkxHJQq8wRHPQ7Vppw8H00+NskXhWdn5iLTrwHJin6oLZnGuMZ4FrE6Jutfz/
	 8+G4a20SCXFG94SAKp1L4wDkhdR+E4proLvCihQc6+ZFusRYcsVwJWq5m3yCIBKn1sQtf
	 SQ+JHO80D9KFY0MXKVjjyX3Kq3/gN8Ci6yNnDJiEy1UNnTKIEcvKypp6mkA5G2smNBY4l
	 XzZlxyuEP04bEz5Tos16Li12/rOGH79D7xIq8kdbR4Pzp6TDAvqjv9nt4vMELhbFiEZA9
	 GFIdoHasn1pTOBvWGH7R/lg0uiWcHFCKJahzmCkxvu53/7Mp/kde4XJgTR4ASRUJ3ZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794216983;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:To:From:
	 Subject:X-Mailer:References:In-Reply-To:X-Last-TLS-Session-Version;
	bh=dHRGfCgTvHqw+Xm+mcoU8W0ABowFwhenFntbddoej4k=;
	b=NU+zvf0Joj9sNYfZG/f0G+/34o4Li4Kc1gc1t1O64mfbUM3V9KIrhmPBWrGZD+BXMB1Q
	 Ucv3KDMNrUuTLp6G/RuIkO8HdtDlmZvWVi2VIL0ON+EX/f9rC/pL3MLMsilJe5DWW2e4s
	 s7tklgmoc1WaS9XvcQYoBS1HIeal0beFoBWtowtC79VS4exSsYvsqCnds7d9uqxbau/lz
	 HtaR6mCLgJsFMldj1Bfu8YBND9lnLChDlnrEWdsgBwdmfpOAu21aTidlbyHlMBHYS3AW7
	 fK33YtGzO+7o/w8tKSYQsJi9WozGKG5aL31OwmFRYAqEJ6Pse7I4bj3ew3xVoIDPUkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=t97r7erB;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D490606A335
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 09:36:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D490606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=t97r7erB
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id AB208C58458;
	Mon,  9 Nov 2026 09:36:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B959C60051;
	Mon,  9 Nov 2026 09:36:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D38BD103293AB;
	Mon,  9 Nov 2026 10:36:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794216972; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=dHRGfCgTvHqw+Xm+mcoU8W0ABowFwhenFntbddoej4k=;
	b=t97r7erBFKewO+0p16spvAdkRX18pXHGfVRcQP++9YFkQUSf+rH1ByZeKuZwsJQChpSdPw
	qQKaj6dmhoSJmh3QeYxSucSHAu+oF+fbZgahyYfHMIRrThTpVLm1wmEDSPhc57ispC9gxO
	kzo84Rswy+xxi0gFta4N73DdU3IU/jKsQNswWGPQSupbYywvJZLLuhNaxkBTkJQF2xwBUQ
	K3qkTzRqffk8QEfsCwN78uUovqmaodRnfSTvzqyCX1mceiBGaOk/pAoaG3e+W8sEna2n+/
	MmZ050cZshpjJ7LobLukabhAmU/b08JUeSxtJ6jHKCo7eFtRMADMTabzC6su2w==
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
Date: Mon, 09 Nov 2026 10:36:07 +0100
Message-Id: <DMQKTZSD2W8Z.42K05D0EP34X@bootlin.com>
Cc: "Sean Anderson" <sean.anderson@linux.dev>, "Robert Hancock"
 <robert.hancock@calian.com>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
To: "Nicolai Buchwitz" <nb@tipi-net.de>, "Conor Dooley"
 <conor.dooley@microchip.com>, "Andrew Lunn" <andrew+netdev@lunn.ch>, "David
 S. Miller" <davem@davemloft.net>, "Eric Dumazet" <edumazet@kernel.org>,
 "Jakub Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: Re: [PATCH net 0/2] net: macb: two fixes for macb_tx_error_task()
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261107-nb-macb-tx-error-task-net-v1-0-a2aac5d64d52@tipi-net.de>
In-Reply-To: <20261107-nb-macb-tx-error-task-net-v1-0-a2aac5d64d52@tipi-net.de>
X-Last-TLS-Session-Version: TLSv1.3

Hello Nicolai,

On Sat Nov 7, 2026 at 9:58 PM CET, Nicolai Buchwitz wrote:
> Both pre-existing bugs were flagged during the clashiko review of my
> software FCS patch [1]. These are the promised follow-up patches.
>
> Patch 1 credits the frames dropped on a TX error to BQL. Patch 2 takes
> tx_ptr_lock in the task, as macb_start_xmit() moves the same pointers
> under it.
>
> Tested on a Raspberry Pi CM5 (RP1 GEM). The bugs are hard to reproduce
> and the error path never fired there, but they are worth fixing anyway.
>
> [1] https://lore.kernel.org/netdev/d1f02ab923c0464fa73cafa75a21943d@tipi-=
net.de/
>
> Signed-off-by: Nicolai Buchwitz <nb@tipi-net.de>
> ---
> Nicolai Buchwitz (2):
>       net: macb: credit unsent frames to BQL in macb_tx_error_task()
>       net: macb: take tx_ptr_lock in macb_tx_error_task()
>
>  drivers/net/ethernet/cadence/macb_main.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)

Yes! Same as you: I never trigger this codepath, so I cannot test
easily. But with your two patches, macb_tx_error_task() is a bit less
broken. It should also reduce Sashiko splats on future patches which is
a nice benefit (of course it won't be silent, it still has
macb_hresp_error_task to complain about).

For both patches:

Reviewed-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

Thanks,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

