Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794882892;
	b=GSL6g3r7lLv+qexP0I+ZNNcDRm6pvJ+9QphKk6AY6PrwZN+OfyMpH7r/NtAx5fXDN3vq
	 aG+WvHQYDbmcPkR29z/ZB/N1Fuzz37/r/6CxYP5ICxLxT623xpHMkPVJySms2lNk6N5dD
	 TD+necmjGCPpdFatIkMk+0t/QdzBZwdZeBvHCvBMbuziSqRWyT/wiBK88CuAzAjbdVkIR
	 qyVfyEoczXT7R9Y3koCxb8WWaOTqiKTZlDJTi3yTPkX/JrGR2XHBwirmMFsTSyc6vZnv1
	 W33bqBdxRlMy8sc2Wj54rYQvMsffmLXQiK/6G+33QGT5iVgz2V3kgxmXfDSy1VOG10Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794882892;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=mMHaYLi6qxhF4029BPvXLzV/gLfpBnYAEX/lbk4LwHQ=;
	b=oiR5GYBA4yatg8E0IXA/baLRhuuEZ4pb+LDo7DW8CHGl7JEeUvQQAaViKU5VGG/yZNlw
	 IfMmfAMWQEeYyXbCnd9NQWcQpSc38VYcNlXN2X82HA5EJ9Xl4ltg0x5lraoUE1GijoGIM
	 ebnUBrEdU5RKsRK3h6AKrPwSRAIRNKNJN23JPGRjgSKvZvj6ONQ9Ws44TI9G7cEPaFx8u
	 zZ+7BeWk8Mmdm5Tyz3bPEWFzSyeIJVyoxd/YNM3bvZqTN3PsDhlVnh2dOCXs+/QwWFWWQ
	 jZQsGuMXTsGhd2jAdJVGloofLOA73DxuOkWcZPqwy5nHeevVu/Mh65G9RyeaPn03yxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=MPOGx+AW;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120E8606A329;
	Tue, 17 Nov 2026 02:34:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 120E8606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=MPOGx+AW
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AH2YlVM23988713, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794882887; bh=mMHaYLi6qxhF4029BPvXLzV/gLfpBnYAEX/lbk4LwHQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=MPOGx+AWGyEGBW1VmBFZUahyIS3BV061QYGk9HpTR/wq2O+cNQShgkoXe+LeX6Qne
	 sXrZvZL1NyJQBqcuigtFR/wwyVLePVX5rUbcWjoGz9B9x9ezAoqhOSqV1kplldOGSU
	 UYb8aIA318NRIjSZJz1UDLMWu/LYTg0kL5xj0GqDWegYMvE0RHERA0Qz9zqg/mBJMN
	 2ESXswSA/9S/gCVdVDTLGRqvvIrWV+gJdb5fzxxRVrO/FwT/EWkiR9W+ckBeRkxqVV
	 8QMa/dbuu2rC6Y5mJ6bF48fvKgq8QGTOcf7W90c7mFUrwY4dVPiipzeG0akx1cXUik
	 qPx1mb3A/y8cQ==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AH2YlVM23988713
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 17 Nov 2026 10:34:47 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 17 Nov 2026 10:34:47 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Tue, 17 Nov 2026 10:34:47 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Rishik Yechuri <epicrishik@gmail.com>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rishik Yechuri
	<rishik.yechuri.code@gmail.com>
Subject: RE: [PATCH rtw-next 3/6] wifi: rtlwifi: call msecs_to_jiffies()
 directly
Thread-Topic: [PATCH rtw-next 3/6] wifi: rtlwifi: call msecs_to_jiffies()
 directly
Thread-Index: AQHdcUN+oTtF9EW4o0m3yA7BouIeXLcxlMyw
Date: Tue, 17 Nov 2026 02:34:46 +0000
Message-ID: <165979d31b6c4ac2b7fbc310cb2ab7fc@realtek.com>
References: <20261110184409.42205-1-rishik.yechuri.code@gmail.com>
 <20261110184409.42205-4-rishik.yechuri.code@gmail.com>
In-Reply-To: <20261110184409.42205-4-rishik.yechuri.code@gmail.com>
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
> MSECS() in wifi.h is a plain alias for msecs_to_jiffies().=20

Saying "in wifi.h" is really unnecessary.=20

> Call
> msecs_to_jiffies() at the 18 sites that used it and remove the macro.
>=20
> No functional change intended.
>=20
> Signed-off-by: Rishik Yechuri <rishik.yechuri.code@gmail.com>
> Assisted-by: Claude:claude-fable-5-1

The same problems as others.

Some statements are over 80 characters.=20

With proper fixes, take my Acked-by:
Acked-by: Ping-Ke Shih <pkshih@realtek.com>



