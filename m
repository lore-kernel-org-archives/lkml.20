Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794712341;
	b=yh4Q+ML695p6OoowzDCU/si+ntUj3HPtQBJ5YNVUAv0q3H2yE/L5+VEnOgsON4Ghfr6T
	 8rzKEmF/OFSwXBZHmkDjfMQtmBFzmrz4PJgibQhOGciUPHBhRMxGUz6WrzFAJuZlNZJhi
	 tKGk72CuWhlUO9F1LSlNjYa2oskTlue0V+/ONhW6YwTxvKWlRT1VfUWTXDgwX+4LIR0eP
	 NCK5xPZm+hiw0wKaPNZCr0oNRjIiAfGg75MX/KNYDGk1Spp3krF7RWB8P1DQfpTLPMno0
	 H+/W68V6D3HaLmKiAt+ZCWyVcaXb7PUqdgzUpEmERr8JwIG6bY3GgJhlCrXerrblxIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794712341;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=Z01r6407BIR7myWBs/CR61ZB7dj6H3IY7TOqmAAT6Mk=;
	b=cBZXDIIFMErxJcxcS0ECV697VgmVWxOtvn0w2AyUwHicfrw1EiK1fN+iWYfu0BVhJ4bX
	 tj7963jwNdCZrOxmW0VyndQia9O4fRHVUWn9+ajvVQXlgZ42qe5SKHrHVb5qU+afK9EI9
	 uvrFQJD8610eRY4nyfWYBU2YbKgSkZMKiVFpZY8R/lGL0IJ0Y8RO9OeROc33ARgAZbv+V
	 FRjICjEP19tpo2WoD4dJpJE2VBw/cLBzECM4g6xWSih4M7+adWiINW9Wlp081LUADTDGG
	 Yj6Ew49HcBdHqa4ajHvRYEzHPFcmcG2kGu30q1Kgwo+kM5hstZARavW5+ZfdEgeJ75Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=Z7jm6iEK;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EFB8606A323;
	Sun, 15 Nov 2026 03:12:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EFB8606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=Z7jm6iEK
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AF3CBa642146354, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794712332; bh=Z01r6407BIR7myWBs/CR61ZB7dj6H3IY7TOqmAAT6Mk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=Z7jm6iEKIGUIvGC2v5MTAvobzCFiY8aFppGF+ARVH+Udgwza2gtf3KUuTXGoPRCnS
	 N13ctZWN/wVcgWqqk0m0a7TVuE7VWqpyoC1orFOVJP2A10mfHg7qTKKC3UH5aNUZ/H
	 shopTYlgudv66aJFQErE+Z2eKBc1aTS/t9fwIVFNlQwtjBwjfo8TjCK8/FDLt85wN0
	 nUHgCRjxiuc7WQ8FSqXkf7TU1xh8Z4xbxtAZiOFH5XlspJl3UmOMZRCF0n+PQYh+hY
	 snET30eKmyBGEjgaUDQYBlI12Yz22/GzjeiFH8n7367Fm6CSze4Eln8X1JwlWS0oPn
	 S9SumJxwABxrg==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AF3CBa642146354
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 15 Nov 2026 11:12:12 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sun, 15 Nov 2026 11:12:12 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Sun, 15 Nov 2026 11:12:12 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Enver Ikromov <owner@ph4ntom-rev.uz>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH rtw-next v5 00/10] wifi: rtw89: monitor mode RX filter and
 raw frame injection fixes
Thread-Topic: [PATCH rtw-next v5 00/10] wifi: rtw89: monitor mode RX filter
 and raw frame injection fixes
Thread-Index: AQHdc8ob3j45GiFIWEWA47hGXet10rcudTGQ
Date: Sun, 15 Nov 2026 03:12:12 +0000
Message-ID: <d98c4958d51e46bdbe5f5d3d2415585b@realtek.com>
References: <20261113235211.1911-1-owner@ph4ntom-rev.uz>
In-Reply-To: <20261113235211.1911-1-owner@ph4ntom-rev.uz>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Enver Ikromov <owner@ph4ntom-rev.uz> wrote:
> v4: not sent to the list

What's wrong?=20

At first glance, I saw v5. I was confused, because I don't remember I have
seen v4. Please not count your local version.=20

> v3: https://lore.kernel.org/linux-wireless/20261104203051.564-1-owner@ph4=
ntom-rev.uz/
> v2: https://lore.kernel.org/linux-wireless/179371849554.20972.16232816164=
394690660@ph4ntom-rev.uz/
> v1 (RFC):
> https://lore.kernel.org/linux-wireless/1a196d6dfbc.35537d221913104450.372=
0060455831933789@zoho.com
> /



