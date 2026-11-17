Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794879343;
	b=5W35vw9+CHYkmP29Tk15qoId9xtZcP9tYh+6Dtml3vt6kku+rKnxKLpbwXYTBx4wb7lf
	 +n3p1y1M8vbXepl4v/Xb+ktuJWMiz1qOwls8Ks3awg0vfEzyG3D23xI2KiESGpwSubC+t
	 xBEhZ8gIgvlmSpEONu/sOumXxpLum6QGSKDMINGso3kSmlH4zYdQbQX4Z3xu9JQvm/Hso
	 t5wtbkDML+D7xfZOrjxqCtmhInqR8wicMaTS+GOgTT4VNGgC0Am9jEdZiZZGSwLLbYBe+
	 0uaINMsjOToUrRVQwpl6mf5/0TD1jYdIqapDlMyxzR5JUdYsqXZ7TUZF9sOiwLRpKKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794879343;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=/GaoTHlvdwCxZnsyrE2dClN5WmkZlsTr2++LAeIbplk=;
	b=GBgFBLlcvKbbrof6iz7XFjuvMO/1QBzCeE1w2zvIYXlvIfmjcyH2jghwltPOICEawPVM
	 nmiuz5gzHCtkSq5cLmyafcyTX12ZphbSFCYD9uSGuAX4T562moXcYOQAD08G+pTUAPzTe
	 SIjGQuJQtHf2rE7FgGAsRIyUa0Dvjl8zYRKSeQKb56qtYaqsiUFJMmrut4mgAzoBCIzQt
	 lOJEwhHllgFEsAElg79vpGUqQZfGHFsAQnsGjhZGBL8dVJIrhJQvaU5wHC/II868XtcNp
	 76BPpyU085HRTX7hcUBMoG/alre0V5o4gDunA6R7nXnKb7B0YhUquAGh9y3JcIVee6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=lF+zdThK;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2951D606A31C;
	Tue, 17 Nov 2026 01:35:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2951D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=lF+zdThK
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AH1ZdFD23943628, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794879339; bh=/GaoTHlvdwCxZnsyrE2dClN5WmkZlsTr2++LAeIbplk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=lF+zdThKqvQ/k6guH3nkRaHxbvHmiFozhEXc1VD7HHrtFTkFcDXuOgzz3pq8dropn
	 fd3fxlrPw+hvZOsNrpzv0D4LgEsirWMy1NA8C57Fa8M2J3dcDhWpcWjluQPjOqsRAC
	 KWBvYgvZBzzSSSXu+0o8wUJUD0YbS9hLluTcJ22DqtLcDknV6qiVy+G2VMvFDHJbD8
	 8liB8VwGcZEzxg+a+pcuoHFifLekMlip1dnqaIwI5K9NaDT2fKAa3sAFnomb0TOl+L
	 D4CU60aj6zQThYml1pNWT7bkz1K51Z90jW1kIJovZsuuRBD7cJbG4H5YFj8eanPbr+
	 k1KGTvtlopHaQ==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AH1ZdFD23943628
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 17 Nov 2026 09:35:39 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 17 Nov 2026 09:35:39 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 17 Nov 2026 09:35:39 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Tue, 17 Nov 2026 09:35:38 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Rosen Penev <rosenp@gmail.com>, "linux-wireless@vger.kernel.org"
	<linux-wireless@vger.kernel.org>
CC: open list <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH rtw-next v3] wifi: rtw89: acpi: check for _DSM function
 support before evaluating it
Thread-Topic: [PATCH rtw-next v3] wifi: rtw89: acpi: check for _DSM function
 support before evaluating it
Thread-Index: AQHdb8F45Ag5kkMCtk2pEzAcm+MLY7cxhzhQgAAAwkA=
Date: Tue, 17 Nov 2026 01:35:38 +0000
Message-ID: <2d5e6b2071444fa5a23ff230744fce2f@realtek.com>
References: <20261108204056.28049-1-rosenp@gmail.com>
 <c182ad839d9b44c3adcc0b208b84d85e@realtek.com>
In-Reply-To: <c182ad839d9b44c3adcc0b208b84d85e@realtek.com>
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

Hi Rosen,

Ping-Ke Shih <pkshih@realtek.com> wrote:
> Rosen Penev <rosenp@gmail.com> wrote:
> > When the WiFi device has no ACPI companion, or the firmware does not
> > implement a given rtw89 _DSM function, rtw89_acpi_evaluate_dsm() calls
> > acpi_evaluate_dsm() anyway. ACPI core then warns on every probe:
> >
> >   ACPI: \: failed to evaluate _DSM e8c3a8d2-694b-004f-82bd-fe8607803aa7=
 rev:0 func:10 (0x1001)
> >   ACPI: \: failed to evaluate _DSM e8c3a8d2-694b-004f-82bd-fe8607803aa7=
 rev:0 func:6 (0x1001)
> >
> > Here the handle is NULL, and acpi_evaluate_object() returns
> > AE_BAD_PARAMETER. All callers already treat failure as "no policy
> > provided by the platform", so this is only noise.
> >
> > Bail out early when there is no ACPI handle,
> >
> > Seen on an RTL8852BE in a desktop PCIe slot.
> >
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
>=20
> Acked-by: Ping-Ke Shih <pkshih@realtek.com>

Can you take by Acked-by and resend v4?

The v3 isn't existing in patchwork, since it broken at the period you sent =
v3.


