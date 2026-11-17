Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794879218;
	b=ukVoFyR/u2mbf1FjBlqbBv4Vn2xwMec2p5a8GTWkAWDzIBXTLdg70cbok1aiig0BrCTM
	 2vc2kB7PYkoePZBnBNNPBv+NgFbzPafjueZrfYSqR/5tyMcsKZvWxbhdV92DvcI817sKn
	 LPy6gWGWdHaHvpFFCxobOeSUWNCNA6H2l/NxlxSBzo0T73TAQOMtgbG2vuuufFXnooMBJ
	 3Dly1/3Y4yhksZ7TuSX6xICfiqMywwmwxYCib03XvuWaSCncwwal+EvgDgLPM8LBIcvTS
	 UXOhHNAGv0JMI+yoJMOIchUWd9JdWmCNyMqMs3k4GVHGzBBFHX/llbWTG7ITXUAk74Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794879218;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=Zak3hmvrrlJB42Zp7hsTxdej6HPSvfg7OhyOgB5UoS8=;
	b=B7B4oN7kjUFDjme1S/HXf+NFmu1ecgnGpvLeOct/+MXGJu9W3W2ePuPSkry7FQJkofv1
	 chK+OT/rZlMQn7mxhbIanBD45jSjxIQd0AHtbKyOYOjU5b6qk/qLC+/hHLPvpmCkGSU9N
	 6zjL9X9lGZzVhyqySS3094/fI6a3dga9P3p2/g6pSa/sWsi2GMxE+igKaVJut5+8Z//6H
	 o/fHxNuZGZ+VhumthCP+scJD1i5hfQhZ86b4e9KK3b3pLjtI5jxuCE2/oeP7at23asBKY
	 nqGGQ0F4RNNEnENLGqWDdUonNRtMFbezsEV9u61vh8hOX6WeQEwYftYaFfo2dsOcTsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=wsdLvFo2;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CFDA606A31C;
	Tue, 17 Nov 2026 01:33:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CFDA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=wsdLvFo2
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AH1XXiG43941852, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794879213; bh=Zak3hmvrrlJB42Zp7hsTxdej6HPSvfg7OhyOgB5UoS8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=wsdLvFo2Em3H18ZAXPE3oy9V1diuhdI9f95klLduItsYdidPkkluIzU2HnRZm/5GV
	 im0RtfkADeAEzmiKsjQBSxonEHsyTQf2R+OaGLvDuSRPSvZAFUIkSgwC0EqE6EBY0K
	 JwPQbWmKPR5UdYqHN/A7mS4mmvzGkMguW91zJy/e+TwkLzFQ6byrugo63/1mYaBBA7
	 zeVV83CKdZauQa6N+6Xn6kTbB2RRp1CsLStEHrLcjnl8xmuv6lD6enFcx7j68cGGkR
	 Oiaq8BKrmI6YwsDKPyz8TG3yXI8208X5CmeXR7MTmCE8Veg/7+3Kn8r54BIKWLhxJS
	 Op8xtBD30gNbQ==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AH1XXiG43941852
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 17 Nov 2026 09:33:33 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 17 Nov 2026 09:32:41 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 17 Nov 2026 09:32:22 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Tue, 17 Nov 2026 09:32:22 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Rosen Penev <rosenp@gmail.com>, "linux-wireless@vger.kernel.org"
	<linux-wireless@vger.kernel.org>
CC: open list <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH rtw-next v3] wifi: rtw89: acpi: check for _DSM function
 support before evaluating it
Thread-Topic: [PATCH rtw-next v3] wifi: rtw89: acpi: check for _DSM function
 support before evaluating it
Thread-Index: AQHdb8F45Ag5kkMCtk2pEzAcm+MLY7cxhzhQ
Date: Tue, 17 Nov 2026 01:32:21 +0000
Message-ID: <c182ad839d9b44c3adcc0b208b84d85e@realtek.com>
References: <20261108204056.28049-1-rosenp@gmail.com>
In-Reply-To: <20261108204056.28049-1-rosenp@gmail.com>
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

Rosen Penev <rosenp@gmail.com> wrote:
> When the WiFi device has no ACPI companion, or the firmware does not
> implement a given rtw89 _DSM function, rtw89_acpi_evaluate_dsm() calls
> acpi_evaluate_dsm() anyway. ACPI core then warns on every probe:
>=20
>   ACPI: \: failed to evaluate _DSM e8c3a8d2-694b-004f-82bd-fe8607803aa7 r=
ev:0 func:10 (0x1001)
>   ACPI: \: failed to evaluate _DSM e8c3a8d2-694b-004f-82bd-fe8607803aa7 r=
ev:0 func:6 (0x1001)
>=20
> Here the handle is NULL, and acpi_evaluate_object() returns
> AE_BAD_PARAMETER. All callers already treat failure as "no policy
> provided by the platform", so this is only noise.
>=20
> Bail out early when there is no ACPI handle,
>=20
> Seen on an RTL8852BE in a desktop PCIe slot.
>=20
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Acked-by: Ping-Ke Shih <pkshih@realtek.com>



