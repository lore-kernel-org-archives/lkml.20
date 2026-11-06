Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793944970;
	b=pq/ebam45PDX8FwGfsYXfTQ5muAzxQSNyp93mGfK0VntfRIkhbh03xznNFcQSFHoTTkh
	 6yx40YAk9XtWeiKu1k0Mcq4ZJ9WmycnWcOnaOuUuxOv17QtXEEnITxAyNubUkAYcbEBLA
	 qrY5tHwsUN5FfTW0GQox74yf24yqU8/vyMcwSF1DCfz3DVasSh9IKqjig6M7PA8WAcGdr
	 4jY1UT3fJD9WsuWtTeODBHkoZmRyrjtXBZfyT/L0t8Zv/degVVmzdbVTbm51LMv3GWeUM
	 k5UO8L/sdZYh9DfrQN42nEkUm1qNXDaPVkbqpL8stK06WccputBBj45xRaeJxBUecqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793944970;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=X+wAJ5SyEGYkroaGqjzIjkC1zGT1qeLhu2+ChrpAQmA=;
	b=papjLItPHMP2CVVxWAVAB096KzyZ1sG5NBsn5Wxk+WX7TZiAhrMIQo/4pQeXQLUnkV2Z
	 O9oWBrXnn6PsfrIv/LqkyxpfStcHZcLuDOt8gOFh1CduQkO9G/hJVZQ/6UMbdoB7Afl6k
	 yGz5TOEIu17+2wPpdtelP5ehpJW7PTEy76/EPh/frNNWWKpryWtZG7jpL3Vm8/CAZjJ9f
	 su4l1m6hvf5Tk1ffkNHaWJlMhC73WZXJZg0os+RakGjRtvP/2L2OCeChu3o/fFL4nbsx9
	 P4Ob/6NhWa7fsOR3d1UQDCUhLPDD0oxxx4EhqI/uS0v1So6iuRzVij269a/1SxuU72A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=FBokbQc2;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D649606A326;
	Fri,  6 Nov 2026 06:02:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D649606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=FBokbQc2
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6A662CtT41385528, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1793944932; bh=X+wAJ5SyEGYkroaGqjzIjkC1zGT1qeLhu2+ChrpAQmA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=FBokbQc25PMVjZFqNzTHgYWbtxrfjSTniYbS9U+49Cd3vr9lc9RxG8D5KaAarM9A5
	 WVwuxhqENhvOU8sUPhvYhEscAq6XXTWrC8Tdht6H//helVYSYlTmHbzUgnsYddmvz6
	 nfGPlTFPhZpG66hgM0h7rM6krrrqbaNDh2jGLcT9DSrDsGPe6XUw9UYaHOxZHjPU3K
	 hkh8AFT9+dfKk592YmjwPAaP8SX1EUBu6B/zhKPMKSuxhFtyog29thqyxx1OzcKFlC
	 lhgkGEmv8d4KS2BK0HibO0qSCXMz8eP3Gj/TYjbCqKpdGAVwYW1nNlBCbwiAY2rFZQ
	 wwJ2HybbqqJjQ==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6A662CtT41385528
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 6 Nov 2026 14:02:12 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 6 Nov 2026 14:01:33 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 6 Nov 2026 14:01:01 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Fri, 6 Nov 2026 14:01:01 +0800
From: =?utf-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
To: "Rob Herring (Arm)" <robh@kernel.org>,
	=?utf-8?B?SmFtZXMgVGFpIFvmiLTlv5fls7Bd?= <james.tai@realtek.com>,
	=?utf-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.com>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	"linux-realtek-soc@lists.infradead.org"
	<linux-realtek-soc@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] arm64: dts: realtek: Add RTD syscon compatibles
Thread-Topic: [PATCH] arm64: dts: realtek: Add RTD syscon compatibles
Thread-Index: AQHda+TWqVDVhi8CqkeHHFl4uLhKrLcgh/Yg
Date: Fri, 6 Nov 2026 06:01:01 +0000
Message-ID: <2c1c335b10fd400f9817155ace73cae6@realtek.com>
References: <20261103224352.862662-1-robh@kernel.org>
In-Reply-To: <20261103224352.862662-1-robh@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

PiAic3lzY29uIiBub2RlcyBtdXN0IGhhdmUgc3BlY2lmaWMgY29tcGF0aWJsZSBzdHJpbmdzLiBT
cGVjaWZpYyBjb21wYXRpYmxlcw0KPiB3ZXJlIGFscmVhZHkgYWRkZWQgdG8gdGhlIGJpbmRpbmdz
LiBVcGRhdGUgdGhlIERUUyBmaWxlcyB3aXRoIHRoZSBzcGVjaWZpYw0KPiBjb21wYXRpYmxlcyBm
b3IgdGhlIFJURDEyOTUsIFJURDEzOTUgYW5kIFJURDE2MTkgQ1JULCBJU08sIFNCMiwgbWlzYyBh
bmQNCj4gU0NQVSB3cmFwcGVyIHN5c2NvbiBibG9ja3MuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBS
b2IgSGVycmluZyAoQXJtKSA8cm9iaEBrZXJuZWwub3JnPg0KDQpBcHBsaWVkLCB0aGFua3MhDQoN
CkJlc3QgUmVnYXJkcywNCll1LUNodW4NCg==
