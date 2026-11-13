Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794591292;
	b=Qt4R10C08VDdBQ8UlyGXckk1RhV/AUI8M4hyoN9A9RbAFURP+uzdUfYxDk0m2K+Yo44y
	 ZBLoyl0AmOhlYNWLPwyrJIGb8cldreGhofRP9QD4MhffsYLe7tC6IrIBPCNA/3cizYxe4
	 85JtuRLCJNHnMrmi9AbO2xS8zxr7uIv0ycj7OMYceetqjbegO3cdco0ozlLAVe2vyLPWg
	 CXhZ8x8qCIvRfVb3n7hVb8geEIkRmPVMEjKn0B248nWKR3TDV7GWkQWrF+YsJ+YF2QnLP
	 0RFN2d7QVyIfvajnIfF15y162KlqX1TWE5bGFBb99UIBzFFQRonGenBsnrj+vzCaT0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794591292;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:To:From:
	 Subject:X-Mailer:References:In-Reply-To:X-Last-TLS-Session-Version;
	bh=iOxf54GS4Vgo/I7lsrZFBuQGT9n/1E4b8Wp+yPwlGhQ=;
	b=jVZva2UEpr3pg680/yZp4NOWLUe6wSRvI5Lzwq2dJQO3Cd7pa1Zm1/TTWqCcTPmIiBwX
	 yGVtZs1rS7nG187wc/GSc5AJgngKXV45VaqRqFtDQeI6+nSKLarNarvZVsIIMHmyxSekH
	 Heira7xL4P5EANpc0zamfcPovrYHGlrNiIQZQQ60WrNqrLuKpquV1JOFiLhw/5Fg4TU7+
	 WwHKeMX3eIT1s/JJprs5eL9Qpci64Jvr6kLNvNI5+yrIz5x871chTkNtZ0vVfZJcVXGTi
	 HNBN5rNbaBxQqVyiw4GxDITGh7TVmlg2++aJvqBMjcc2bjwN4Ukke3C7GNEVOl8DyMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=D9oqk1GW;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6BEB60A382A
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:34:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6BEB60A382A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=D9oqk1GW
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id CBBC5C4F755;
	Fri, 13 Nov 2026 17:34:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 12DD560015;
	Fri, 13 Nov 2026 17:34:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3159611BC0467;
	Fri, 13 Nov 2026 18:34:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794591288; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=iOxf54GS4Vgo/I7lsrZFBuQGT9n/1E4b8Wp+yPwlGhQ=;
	b=D9oqk1GWjeb2i1rqOg51V0Ai57k7+QJvCPshFYAx6MOM8N9FKC3TJkRlqJfVfj7DDibC1m
	Bsh1TsFs8HKdabbDLMNtFmq+3mLBMzyGWJh/kWwXZ+cjRm3Fzdi/3ioOl2d+yK9u2oQEth
	6MgCE3bO06RdRJEg131MVJJ4uxdHukDtAWKMROyoBVW6bly4GVHLmOaAfc6N9tMrnCdoX/
	EQG4Btk4A08Ron5ReTFSCYiTkU1Ku/qY3q7gefM+Q94hcgEUUCPGjnE1kbD4ywyrEy4N8W
	ku4FHWbbtuuB5hZcVMkQ/EsR1b82ct2d0aeq2A/mQnu68uET5XdMJ9XA9/lSOA==
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
Date: Fri, 13 Nov 2026 18:34:45 +0100
Message-Id: <DMU9INFX5Q65.33IQ7N5UY93YK@bootlin.com>
Cc: "Conor Dooley" <conor.dooley@microchip.com>, "Andrew Lunn"
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@kernel.org>, "Jakub Kicinski" <kuba@kernel.org>, "Paolo
 Abeni" <pabeni@redhat.com>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Paolo Valerio" <pvalerio@redhat.com>,
 "Vladimir Kondratiev" <vladimir.kondratiev@mobileye.com>, "Gregory CLEMENT"
 <gregory.clement@bootlin.com>, =?utf-8?q?Beno=C3=AEt_Monin?=
 <benoit.monin@bootlin.com>, "Tawfik Bayouk" <tawfik.bayouk@mobileye.com>,
 "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
To: "Nicolai Buchwitz" <nb@tipi-net.de>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: Re: [PATCH net-next v5 1/3] net: macb: add QUEUE_DISABLE capability
 to 3 compatibles
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261016-macb-set-channels-v5-0-90ce0c0b8e75@bootlin.com>
 <20261016-macb-set-channels-v5-1-90ce0c0b8e75@bootlin.com>
 <d4c8dd5afbb3fa6c74a14fc8a877e49e@tipi-net.de>
In-Reply-To: <d4c8dd5afbb3fa6c74a14fc8a877e49e@tipi-net.de>
X-Last-TLS-Session-Version: TLSv1.3

Hello Nicolai,

On Mon Oct 19, 2026 at 1:32 PM CEST, Nicolai Buchwitz wrote:
> On 16.10.2026 18:58, Th=C3=A9o Lebrun wrote:
>> From datasheets, we know those 3 IP versions support Tx and Rx queue
>> disabling, ie bit 0 in RBQP and TBQP registers.
>
> nit: Just learned that git am will turn this into >From. Maybe reword=20
> the first sentence.

Fixed! Plain text is nice but sometimes causes trouble.
By the way, this patch is in a separate series now.

https://lore.kernel.org/netdev/20261113-macb-caps-v1-0-42e0984b2f09@bootlin=
.com/

>> All revisions I've seen either support it on both Tx & Rx or don't
>> support it at all.
>>=20
>> Sources:
>>=20
>>    Compatible            | Match data         | Datasheet
>>   =20
>> ----------------------|--------------------|-------------------------
>>    atmel,sama5d29-gem    | sama5d29_config    | DS60001764 [0]
>>    microchip,mpfs-macb   | mpfs_config        | header files [1]
>>    microchip,sama7g5-gem | sama7g5_gem_config | DS60001765 [2]
>>=20
>> To contrast, check out the SAM9X60 DS60001579C datasheet [3] that does
>> not document bit 0 as anything special on page 1041 and page 1042.
>>=20
>> [0]:
>> https://ww1.microchip.com/downloads/aemDocuments/documents/MPU32/Product=
Documents/DataSheets/SAMA5D29-Data-Sheet-ds60001764.pdf
>>=20
>> [1]:
>> https://github.com/polarfire-soc/polarfire-soc-bare-metal-library/blob/6=
14a67ab/src/platform/drivers/mss/mss_ethernet_mac/mss_ethernet_mac_regs.h#L=
200-L207
>>=20
>> [2]:
>> https://ww1.microchip.com/downloads/aemDocuments/documents/MPU32/Product=
Documents/DataSheets/SAMA7G5-Series-Data-Sheet-DS60001765.pdf
>>=20
>> [3]:
>> https://ww1.microchip.com/downloads/en/DeviceDoc/SAM9X60-Data-Sheet-DS60=
001579C.pdf
>>=20
>> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>
>> ---
>>  drivers/net/ethernet/cadence/macb_main.c | 7 ++++---
>>  1 file changed, 4 insertions(+), 3 deletions(-)
>>=20
>> diff --git a/drivers/net/ethernet/cadence/macb_main.c=20
>> b/drivers/net/ethernet/cadence/macb_main.c
>> index 020a47353d01..625171fd3f9b 100644
>> --- a/drivers/net/ethernet/cadence/macb_main.c
>> +++ b/drivers/net/ethernet/cadence/macb_main.c
>> @@ -5743,7 +5743,7 @@ static const struct macb_config sama5d2_config =3D=
=20
>> {
>>=20
>>  static const struct macb_config sama5d29_config =3D {
>>  	.caps =3D MACB_CAPS_USRIO_DEFAULT_IS_MII_GMII | MACB_CAPS_GEM_HAS_PTP =
|
>> -		MACB_CAPS_USRIO_HAS_MII,
>> +		MACB_CAPS_USRIO_HAS_MII | MACB_CAPS_QUEUE_DISABLE,
>
> AFAIU this also switches WoL suspend on these SoCs from the tieoff ring=
=20
> to
> QUEUE_DISABLE. Was WoL tested on any of them? Worth a line in the commit
> message too.

Not tested, I don't have them. I've added a paragraph to the commit
message to explicit this behavior change.

Thanks for the review,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

