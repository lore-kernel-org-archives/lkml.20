Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794822730;
	b=sybaAgQP0EhXIBx98MRyMHRZ/7YCs2/VrXLVwMRqC/7E1kXzly0Fx1mL+LgLkvxiSxCG
	 +uZ1Kd4/GKarjX00Gt7ruoLtd8xqpwptwh9pE+Yodi23qajfb2H70503b+QyiFSMzBAw0
	 4ZDVmVGg32Ev3Wr/83FDNgbxpors6b5ZuYCsJJglEQsr2EYwmr/bkHsMGY4W0M83RL38j
	 /Ond8ZJFqNZFGG6op7nJAOkVbpMv3xriJ3hEOdRM8XQztfxHreMDSD4MWg2A7xydL3EKg
	 uxJV/qq4iwn1idWW3rkfSkhKKNlM9kNT4zaU6jl4CBhV3DgnHy6sPXmBCtvsWYntsjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794822730;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=AoSIW4Kg2kAHMprB8eQkrCyIT4QECE1iWXkvNBCCmD0=;
	b=jr7nr5eqvi2kNc258Aq6+rf79xjwYZiivMOyfarjPoB3PhJzuZRSVZV/zM1G4ccWZpI0
	 wou3b5K3ZyYCuo8ovYkp8akpnTHcOV8ONw0F4MzGoIP+0lzfmZmv4E/BMcf1+32lF2yo9
	 u7JOvptSirmTVkGId3KJJQk3aUnjv7NK1qEN6lf0AwfE9o1xKkgHIEIZr/4Pu5FAAZPSO
	 hUmmGeqQuvm95Cox8LT3e1Onsr+dP2ob12jdNR7zuGVYiM5QvJRLCIooMHVNdo1e4RAHQ
	 VSFgSwugmeY/ePGJ3rJxUj/fklcr5+/1eGFBj4GAYRy+kvl0DAEIR4Nci6Fi4e6sT+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=jRB6pq3a;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30B9606A334;
	Mon, 16 Nov 2026 09:52:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E30B9606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=jRB6pq3a
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 62C1C4E415F2;
	Mon, 16 Nov 2026 09:52:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3645D6023F;
	Mon, 16 Nov 2026 09:52:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DB95211BC03BA;
	Mon, 16 Nov 2026 10:52:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794822726; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=AoSIW4Kg2kAHMprB8eQkrCyIT4QECE1iWXkvNBCCmD0=;
	b=jRB6pq3aAWGec2oHZWvN81s0l22MKJUwebvuEOYvCGA+aDC5UvrkVYn5eNdOU5goKy3bsX
	0xEU/5b18Y2nMztveVAnpIASo+3deEm9AG/7lLihq+xzXXKi8uBl3fOsJkoSoDvJoAnSUT
	idZRi8umJQaYntcJjdDZ90LNIkeNMZ7Jg0WUY7a0ijaGlUhQRCExIB5XH4ay08GszgCylM
	rj0Hsb0XU+bmHjxSVWY/95OLjia9rk6mTOXv7qYtSQGOEw2NLYtGjJT1OWjZpeDLddWpEH
	HwOuzJskxjst2fUCoyrbK/bviTakF75jfqk5c/+N1oAGl6EQMulks5ZnbjEang==
Message-ID: <bb7c3220-97b9-42b5-895b-bb9f749cc43d@bootlin.com>
Date: Mon, 16 Nov 2026 10:52:01 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Subject: Re: [PATCH net-next] net: pse-pd: realtek-pse-mcu: add RTL8238C
 device ID
To: John <therealgraysky@proton.me>, Jonas Jelonek <jelonek.jonas@gmail.com>,
 Jonas Jelonek <jonas@jonasjelonek.de>
Cc: leksij Rempel <o.rempel@pengutronix.de>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <EEsDzyK4pKqMZ9P6eCtfk5Qp2SXyprlFB4e4uQ7_O1iw3BuvnNm95DKBxuHy-mp3vdmUWhob9UWOzN9VWXoYyQIADqKPNvJt_gfaLaWpSkU=@proton.me>
From: Kory Maincent <kory.maincent@bootlin.com>
Content-Language: en-US
In-Reply-To: <EEsDzyK4pKqMZ9P6eCtfk5Qp2SXyprlFB4e4uQ7_O1iw3BuvnNm95DKBxuHy-mp3vdmUWhob9UWOzN9VWXoYyQIADqKPNvJt_gfaLaWpSkU=@proton.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3



On 11/15/26 10:40, John wrote:
> From: John Audia <therealgraysky@proton.me>
> 
> Some Ubiquiti USW Pro Max 16 PoE units (boardrevision 3) carry a PSE
> MCU that reports device id 0x0238, so probe fails with "unknown PSE id
> 0x238". poemgr names this id RTL8238C.
> 
> The high byte of the id follows the chip revision, as with RTL8239
> (0x0039) and RTL8239C (0x0139), so add RTL8238C with the same power
> limits and power limit command as the RTL8238B (0x0138). Tested on such
> a unit, PoE works on all ports used.

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>

Thank you!
-- 
Köry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

