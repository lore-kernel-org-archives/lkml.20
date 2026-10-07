Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F5C52ED3B
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 17:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791913961; cv=none; b=AiNC4WBj+oXCWezUiED4w3p2u+D46G+fRNrVdcAAPhqrBZZlxe2hE5vzYsZdeMcEnGqrilyLRJytoyM3r8iWegSG6Bdm1KTf8HCqGF2DWQh7ZJybyJlSyaryvGl9haSKIB5A2mL/stgpAuF+8f8PbubC9osYT2Rs8XZ2+vDdH50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791913961; c=relaxed/simple;
	bh=BIXnfYUElBRiWWX6JzmsnWDu8llAt/G0T+rlmAKjccI=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=Rua/5njIagL8viKERu+3kh8OtmFQdaZPXNwchgijO/pw4P+LiZi+TIdNHr1A+AOTdKghr+/s7p4U3td2wteeRr7ssZjdAwG51VPvvdbhnsJExVeqLh2nfRiodOjbX5BGagsIeqCN0Wze4MnQbcJBrt5pZmnpxq1qbsJ47s+c4rE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=YzPi76ka; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="YzPi76ka"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 099524E41215
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 17:52:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D2C6660362
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 17:52:34 +0000 (UTC)
Received: by mail.galae.net (Postcow, from userid 0)
	id 03B2311D7188E; Tue, 13 Oct 2026 19:49:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791913954; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=uPwNHlOpz7ymGUpnZRAZ/SDsNHkeFoWOAQvq+Jxnu/4=;
	b=YzPi76ka7gjxbaDlpaqrS4UCRvjbNMANI4Uzhg9ICghqtmBJHt8VWsUA/JhbsIuNvpu7Zt
	SioK4EP9QHRCBwY0Nx/1gqJ2GNE9yKBMEgDfnY9MZXHNQeH1c3+90KTAjUdytvynJJNK64
	VHS1cg+NhXVJCEQvkGBekzItv9RZQ2u2UuIjwkoWaHht2u4/TvC83Aod/B2UOrQDBmn+5N
	rU5OZGEPdMv7dtjclwj2Ju0omeF3GHRH+108BudAJCVCJucVUZVu6cFvVlEPpn0le3zepi
	0N59InVBz4AMQzAOjX3BHld3nbp9Yglc/uKKfbUT1DnVV8l7ib5MRGKVEZcwhQ==
Authentication-Results: mail.galae.net;
	none
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 07 Oct 2026 11:27:41 +0200
Message-Id: <DLYHZKDHMOAJ.THSJPBNACX7Z@bootlin.com>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: Re: [PATCH net v3 0/1] brief description about the patch and its
Cc: "Conor Dooley" <conor.dooley@microchip.com>, "Andrew Lunn"
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>, "Paolo
 Abeni" <pabeni@redhat.com>, "Haavard Skinnemoen" <hskinnemoen@atmel.com>,
 "Jeff Garzik" <jeff@garzik.org>, "open list:NETWORKING DRIVERS"
 <netdev@vger.kernel.org>, "open list" <linux-kernel@vger.kernel.org>
To: <taozj888@163.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261004133916.559956-1-taozj888@163.com>
In-Reply-To: <20261004133916.559956-1-taozj888@163.com>
X-TUID: 0fVO84TvPtwU
X-Last-TLS-Session-Version: None
X-Rspamd-Queue-Id: 03B2311D7188E
X-Spamd-Result: default: False [1.28 / 30.00];
	BAYES_HAM(-1.62)[85.80%];
	SUSPICIOUS_RECIPS(1.50)[];
	DATE_IN_PAST(1.00)[152];
	MV_CASE(0.50)[];
	MIME_GOOD(-0.10)[text/plain];
	BCC(0.00)[];
	TAGGED_RCPT(0.00)[netdev];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MAILCOW_DOMAIN_HEADER_FROM(0.00)[bootlin.com];
	RCVD_COUNT_ZERO(0.00)[0];
	FREEMAIL_TO(0.00)[163.com];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	URIBL_BLOCKED(0.00)[lunn.ch:email,bootlin.com:email,bootlin.com:mid,bootlin.com:url,davemloft.net:email,localhost:rdns,localhost:helo,microchip.com:email,atmel.com:email,garzik.org:email];
	DKIM_SIGNED(0.00)[bootlin.com:s=dkim]

Hello,

On Sun Oct 4, 2026 at 3:39 PM CEST,  wrote:
> v3:=20
> - add this change log since v2 missing it
> - drop the blank line between the assignment sentence and the commit
>   info
>
> v2:
> - update the commit message with the reason why the unlimit prints would
>   bother/delay booting process
> - update the commit message with the Fix commit id provided which is
>   suggested by Th=C3=A9o Lebrun<theo.lebrun@bootlin.com>
> - update the commit message with what packet type would trigger the
>   error printings more easily.
>
> v1:
> - initial commit

No mention that you dropped the diff in start_xmit? It happened in V2.
I'm looking for it because I don't understand why you dropped it.

Thanks,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

text:
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 07 Oct 2026 11:27:41 +0200
Message-Id: <DLYHZKDHMOAJ.THSJPBNACX7Z@bootlin.com>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: Re: [PATCH net v3 0/1] brief description about the patch and its
Cc: "Conor Dooley" <conor.dooley@microchip.com>, "Andrew Lunn"
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>, "Paolo
 Abeni" <pabeni@redhat.com>, "Haavard Skinnemoen" <hskinnemoen@atmel.com>,
 "Jeff Garzik" <jeff@garzik.org>, "open list:NETWORKING DRIVERS"
 <netdev@vger.kernel.org>, "open list" <linux-kernel@vger.kernel.org>
To: <taozj888@163.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261004133916.559956-1-taozj888@163.com>
In-Reply-To: <20261004133916.559956-1-taozj888@163.com>
X-TUID: JWRvl5CwSNmk

Hello,

On Sun Oct 4, 2026 at 3:39 PM CEST,  wrote:
> v3:=20
> - add this change log since v2 missing it
> - drop the blank line between the assignment sentence and the commit
>   info
>
> v2:
> - update the commit message with the reason why the unlimit prints would
>   bother/delay booting process
> - update the commit message with the Fix commit id provided which is
>   suggested by Th=C3=A9o Lebrun<theo.lebrun@bootlin.com>
> - update the commit message with what packet type would trigger the
>   error printings more easily.
>
> v1:
> - initial commit

No mention that you dropped the diff in start_xmit? It happened in V2.
I'm looking for it because I don't understand why you dropped it.

Thanks,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

