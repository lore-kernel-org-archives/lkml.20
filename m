Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794478501;
	b=Thd+853Yzf/rwQjN4cNrHn203e0jLu+eToAIBHT75/4bvmmgVThtkG8HBOAsDyojbZY4
	 YqIqYSoZNc37udsydaR6u6t6K4Qlwrg+hHEHsjJ0ce5CQiGUjLeN8c33wZLGS67RgbVA0
	 XxRb8Rjv+fX1KW8TulrKSMTNP4pBwIB46+dMxOgVRxZ12gkKPIWmZ9rxgfu2Lp5YppNFY
	 RS2Af4kLmjo1FerFqfS7petQ2U6QRvIdt2179R+Wjg+3QiPua0O1M5wViQMYWJw9qnlIi
	 dDOS3KRpB1yyE6gmtTHT6CwiVasnDbDYr8B2PjQYt4opzh+IdN4Qm5zY+82XVfiWwXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794478501;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Content-Transfer-Encoding:Message-Id:References:To:X-Mailer;
	bh=ihVUDcggHZh6D0xYhZJc42bMgYps+7jjufAK/stHqbo=;
	b=AU7rE5JYgCdfB8R1vzW0Y5OoosbhlJB6jYO1lptzlwpgDhVXGAMN/0a/px7MP7xVLWu3
	 HYG3cBJlpjRSaTYi4McFOVkQ05XyJfyItN9sc3QuLWh+SuFi4Cdbhr7H26RvXa0bvNZio
	 nenL0Thy6YKAPv4Jxxz1jTwaV6+Z1eUf1hmcQ2i/pZmf3/xG0l4p9IQyXR9zFDNelIzua
	 DSSy9T8FnR4c6DR/BUvammYMr14N4qFraFG8E9oUwIgNKUYcwBRpevzXy4WQv/5xFrE30
	 vwgZS/gOSM2L3ZL+CEkdyDP0NwFPFX0EzJLw0W1nAdPIsH3TwEtG44AiEDT6KYCN6GA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TSgcoAzY;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8640606A8AC
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:15:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8640606A8AC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TSgcoAzY
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so7845145e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 02:15:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794478499; x=1795083299; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ihVUDcggHZh6D0xYhZJc42bMgYps+7jjufAK/stHqbo=;
        b=TSgcoAzYSBGKg8YleqBq0oSirYkeMKTSHAk1fuGI/Ma6xKCokSaxTddLnZLIf3yuXx
         MfbwAaoioEP2GFhBmnxpxlLvy2093taK53Rc/Ndf0mkW2go13gq19PpZ/mKNDzTXGxvf
         5f4W15IQdBuZC7xcEYGhjGFVUnI8W4pmq7CqHcuhDrfuDbYZCX9FxZsDzj3f7/1uF6kN
         0MVvnQ/Sisk0L+854rFAY8WF7iV+6F6LhC+BYrwynW95cItJOPimtlpJK5r1PrDxDzVd
         iPwJWJFozgVKMIHJhBHlmqYl8WATj1y72ZfvRJzgcZwzkZ15q4x8yqCBje+rNX39FKqB
         sj/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794478499; x=1795083299;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ihVUDcggHZh6D0xYhZJc42bMgYps+7jjufAK/stHqbo=;
        b=0hEzxdEmlJtUqCizKwYm594VHxPuRuccR0nIf9lw4GOdye9fTiPpTEYBqzzS46YyKp
         sOqpobYlpoNzpjtkLnqBR+f0RrRy5qjG2+XQp5RuhE94lFdeCJ0cYV1XV/INJPZqiAX+
         MJoLTb7pGt4MrNXkk/vJLI8eBRtA03J4vCRNs2NFdkEu4mjVK360phbZcQUNe69ZNQdK
         tHNWAfePEJ74gIUYkrJE+bHDt7U2sfNKI2jmQ8bU8MChd+3gur9fySfwei8YUbF2WSwu
         YxJJjFuy/28sd9WHM6G7anMw2NXk4qHAVBaMg1HLAUJrJ8qxRZbReNYLAfNFS0M5zki/
         LsYw==
X-Forwarded-Encrypted: i=1; AL+hErEQTJeiE2saJNTC7NI0SGlXxy2uKFVRree8fAhH1/a1WDr/1/T7GyteX5q0L9a/DftlsljTbb3foMjTfIs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+TGQ1Vkn0lzwTjAaUN0CUDt+Eep4YkLZAwOMr49JkVYh/KVqQs
	mJkioio14O55ina3oL9CJ/NAyr0pgIq6QlsPX3FoM0pKavNocCKKnTXv
X-Gm-Gg: AYBFou2fkyTD+Yu86lHbkW831NpS1XJPPtLHLOkRlma4Nruq0NH6MdCFvScQw69z0kN
	JYCUH7fyLloSFSOCsb6gYgjZx9cqugkQ84yYBNuSekFa4+OYvhSBP8/NUKs1NGiv1wJliXRwwd8
	UpUij2aEJKP2fPZHmtdWE3ETP6x7up4BGw/zqxJ+Ri0VqBmuYIByLFoW+CdN6SjkGwU6e5OeLcX
	ng9G1geUDPudg5KMU3UuVRCDh+9GFO7XFwO6ePz1CPLIy8hKYTyb0/maw4keDDqLHI/vrk31klf
	xXyYl6A2Z/IRIwXFaZf/gXE98dzlzAWuYZZ+7YfcuqekhJr8w/k+16wyHw6k/qhyLOwOcUkV0Rf
	0PNXBVE2GTZRJXifTV2Aqx4LAfH/tZBgXVNx+mGt9H9DElTmriy8k9FpfwFUaefg6tosvYnpFMc
	eXdLV5sEALEDXsDiSpm/5v+RRuxLbyx8L9sT8Pyc+5kL5KOkJB7fmR3ucZecfL8tjw0Ns741dNu
	3OKTSqqD7zqr+ivRfUfQ42Fd3U3RY+FiEpKwYJ9QEdBtVd8EICYANobq/kSQGeMXJkQcx14fypy
	SmdNaww04rD6UkGttn7Z0cr9rQk2EAR4y6qUcR5EAi3B0aVew/L3r6q0EmR3fup75Z2pNrv4
X-Received: by 2002:a05:600c:154a:b0:4a2:10f9:37db with SMTP id 5b1f17b1804b1-4bb4e27a9afmr42890975e9.7.1794478499301;
        Thu, 12 Nov 2026 02:14:59 -0800 (PST)
Received: from smtpclient.apple ([217.111.110.194])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e26700fsm66747305e9.10.2026.11.12.02.14.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 12 Nov 2026 02:14:59 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [PATCH ipsec v2 1/7] xfrm: esp6: use the current sequence number
 for the IV
From: Usman Malik <usmalik90@gmail.com>
In-Reply-To: <20261108142652.1330952-2-Jeremy.Jean@oss.cyber.gouv.fr>
Date: Thu, 12 Nov 2026 11:14:48 +0100
Cc: Steffen Klassert <steffen.klassert@secunet.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Sabrina Dubroca <sd@queasysnail.net>,
 "David S. Miller" <davem@davemloft.net>,
 Boris Pismenny <borisp@nvidia.com>,
 Saeed Mahameed <saeedm@nvidia.com>,
 Leon Romanovsky <leonro@nvidia.com>,
 Tariq Toukan <tariqt@nvidia.com>,
 Mark Bloch <mbloch@nvidia.com>,
 netdev@vger.kernel.org,
 linux-rdma@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <530C7AD4-2591-49A9-9707-D504EEB48542@gmail.com>
References: <20261108142652.1330952-1-Jeremy.Jean@oss.cyber.gouv.fr>
 <20261108142652.1330952-2-Jeremy.Jean@oss.cyber.gouv.fr>
To: =?utf-8?B?SsOpcsOpbXkgSmVhbg==?= <Jeremy.Jean@oss.cyber.gouv.fr>
X-Mailer: Apple Mail (2.3901.200.71.1.16)

On Sun, 8 Nov 2026 14:26:46 +0000, Jeremy Jean wrote:
> When a GSO packet is split in software for IPv6 ESP,
> validate_xmit_xfrm() calls esp6_xmit() for each segment.

I tested v1 of this patch and posted the results in the v1 thread:
=
https://lore.kernel.org/netdev/20260930144523.435271-3-Jeremy.Jean@oss.cyb=
er.gouv.fr/T/

The code of this patch is the same in v2, so the results hold.

Tested-by: Usman Malik <usmanmalik@engineer.com>

