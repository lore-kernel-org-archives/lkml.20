Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794883693;
	b=Lg/ZKgS1XMZmb/pjibmvbpb8fV7m2Wxyqe5kiqv+5nPl1Bjw5uUpmyvzOW7VYCznXFS1
	 8aTnbJq0i91guP0J7ph/K8xHWVbCuYZD09h1abL+PaIyynEsUnEIHeJJs7r5EUqoICHNV
	 Mg6p/xKr3LoMSlBGQV7NNNaxK8OnX77zMx8ppFPh+4Xdw3DMeltqnytvcIRFgtXo586+B
	 mfSnEuED7zp6aW9BuRzzj1LWgroY8aSIsI7eYsyaekLcETc3dPhx79XLyPHhiVtw1x5yI
	 Jk2t4MXUje1PHUCGKE9ElMfQq3n+8jIPdXvt0xynaHWPRRC/7TjNzKIc1caDbpSnuJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794883693;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=lBHRRIQHItCJ5eDiP+vp+1pnFfdohjlT2X89EaTQEeo=;
	b=P9qP23VqDnLoanxV1bfmtWzwIkEm55SRhibk9njdkY9LHTOmVV8O2FX2iFwLJuloU/bk
	 CmY1aqy6P3aNEimRuvIu8WuGDhCa1gyL8zGGe0JH7hXeIcQcMP8df7orVbTIZhlh2akhV
	 osaz0ffPoQMyhQYlX65Sr14zjFZIEWEPq1PgmMsYBghM1GFch+St4ifAEPpcMoQ+LgALY
	 DM3ZyA3p6XFi06lTx4EOgJt++cygzOqakpG64j6Gt76jq9PrmwDuwohxelVahKFAkSYsz
	 JWaUuc3H9q0ZQCPLilPr9E0cnU1gK35PveNHcHuOC8T6acCAiyJlsBS4/pLorSwfNHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=lJyFFhkO;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33EFC606A32A;
	Tue, 17 Nov 2026 02:48:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33EFC606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=lJyFFhkO
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AH2m8YJ13999345, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794883689; bh=lBHRRIQHItCJ5eDiP+vp+1pnFfdohjlT2X89EaTQEeo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=lJyFFhkOuFuSpyq+2ZU1X/gJGv/JOKXiQiEIlNz+7WEyXwfkS618tNGaYB0xVJvF9
	 YbjZKKapgaZaHoyEXfjKygrKl2veY9dldPJFokJ02pF+kDL0+kC435jtIkRmZijGTL
	 /jFRMniQqfFemjK107tc/sC+aCyXDFo5ogEWgvVEDzhP1QV27l5KRgCgoIFpySEVWa
	 tAtJ8qjTsDMZQH+t9NVw47SoJnpwtj7qpvdTyyyq+6gAJ8YmdQVAkt3xi/rq6mcOY3
	 X0qYRIn0Mows+OEi+XRSaVXFtY8CVuRvVrcjOtuGC1Z0mcFLIPak0AhKh4iIqh7BXU
	 umakNiBU2HU7w==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AH2m8YJ13999345
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 17 Nov 2026 10:48:08 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 17 Nov 2026 10:48:07 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Tue, 17 Nov 2026 10:48:07 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Rishik Yechuri <epicrishik@gmail.com>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rishik Yechuri
	<rishik.yechuri.code@gmail.com>
Subject: RE: [PATCH rtw-next 6/6] wifi: rtlwifi: remove byte(),
 packet_get_type() and FILL_OCTET_STRING()
Thread-Topic: [PATCH rtw-next 6/6] wifi: rtlwifi: remove byte(),
 packet_get_type() and FILL_OCTET_STRING()
Thread-Index: AQHdcUOAzgF+4zxatkKkUjy78NWQfbcxmPpg
Date: Tue, 17 Nov 2026 02:48:06 +0000
Message-ID: <90543fc698df445ab5a11052fe74fc2c@realtek.com>
References: <20261110184409.42205-1-rishik.yechuri.code@gmail.com>
 <20261110184409.42205-7-rishik.yechuri.code@gmail.com>
In-Reply-To: <20261110184409.42205-7-rishik.yechuri.code@gmail.com>
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

Rishik Yechuri <epicrishik@gmail.com> wrote:
> byte() in wifi.h=20

No "in wifi.h".=20

Please write the commit messages yourself.=20

> has a single user. rtl8192se takes the low byte of the
> firmware header version with it, which is just a mask. Open code that
> as & 0xff.
>=20
> packet_get_type() and FILL_OCTET_STRING() have no users at all.
> packet_get_type() also refers to EF1BYTE(), which no longer exists in
> the driver, so it could not be used even if someone wanted to.
>=20
> Remove the three macros.
>=20
> No functional change intended.
>=20
> Signed-off-by: Rishik Yechuri <rishik.yechuri.code@gmail.com>
> Assisted-by: Claude:claude-fable-5-1


