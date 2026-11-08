Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794108082;
	b=DwyQdzU5GyG8q30m0UDbAVlh9CO47gCYfMDWBv+vGk/12r/SG7vXIaQN783VvkcdbMG6
	 I9LSfJww6GIMywMR3zG+altBcEfQ8TElv5A134bVn8fc0FMjcWbDPr9ySw6aQElGYcCKE
	 He22XYAkci4Olzuf0cBFhRkl1Qg9NLH0UyUqbeDTPKAXEt3252lvmHV3yFS3p2l8mNexq
	 gzA1XtVB1RdSdrYbTjy+dk9uYz0g8byj3S1+gLcyEva7NB95Knd0+SZi2nKusu7ALEJQG
	 InLVnQXAwu93dyy279L6dsvAl2huQn3lYLvErQvsHZFkYIseVel2hdZ0ADRlD5x76zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794108082;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=lXinHBmuyNPYHQgHu8MP44sRILKJKhSDGGY78jn0tBU=;
	b=M6AJ9d0178yE0qndFao/piB6OmUlCf/cbJpMvd3IeQX17j0QQmUfx7g2RwOPXhGUNVDF
	 /AJ/V9U4Ii8DpJAquGomNCBdxmrB20pO3GLqOerupiaXUqwtrF/O2wYb6yZoMCEI/LSc+
	 0ynarXcDoVvcIGZk6DOPVtuiYwQBB7yqtz/SXpWKcGd6CP/DZzSJtbtsDs8n7GYaXWegZ
	 5q05NRh8FSp0z4zXxWZ9Tlb83LL2vylniaaeYoIIQFpgHoUT8/sXo2kGD9FE5aaiG3fMQ
	 ClMNaN0h1tigcu4TCZL/7KMx7oOGbcflcqY0PSQSHceGyQOgg7i1hxaak7jmlTJmrmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=DD16R9pP;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB67C606A31A;
	Sun,  8 Nov 2026 03:21:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB67C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=DD16R9pP
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6A83L56b83112952, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794108066; bh=lXinHBmuyNPYHQgHu8MP44sRILKJKhSDGGY78jn0tBU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=DD16R9pP+vrN1RSe1uBpnxJXo0OhyP/PaQ20lq+eithjycKxlF5V2MEBcnI/uSuiJ
	 uMyhUIruwUmjRLelp4l3dZvAaHxPodtM/4rQC1GJUlrpwojwsjW1is/lJee70d3F7A
	 Xj3lSarT7mY8ii+yy+6qiYxYuMj5M0sGHwBeqphdPQCpHQvqlijam7LQ7t9KYcz1rN
	 4zv1tNQ41S+0XMpeOoy+MsfBmrhBoskzE6RlDwfevkAgcSmiV67hWE9aFLzqgURCw9
	 odOGWjQ5ApQuUVf1syVRr/wPdmi6hux1FSyQgJXLMNpDHxEi1L1lf8pwZm6rMQ6VE7
	 GS6U66lcPIf1Q==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6A83L56b83112952
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 8 Nov 2026 11:21:05 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sun, 8 Nov 2026 11:21:06 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Sun, 8 Nov 2026 11:20:53 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Kalpesh Solanki <skalpesh942@gmail.com>, "luka.gejak@linux.dev"
	<luka.gejak@linux.dev>
CC: "kvalo@kernel.org" <kvalo@kernel.org>, "linux-wireless@vger.kernel.org"
	<linux-wireless@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 2/2] wifi: rtw88: ps: Trigger firmware recovery when
 failing to leave LPS state
Thread-Topic: [PATCH v2 2/2] wifi: rtw88: ps: Trigger firmware recovery when
 failing to leave LPS state
Thread-Index: AQHdboGm5HJUjvdiV06CJvy/NMrA3bchtYCAgAAH3ICAAcXAIA==
Date: Sun, 8 Nov 2026 03:20:53 +0000
Message-ID: <0439e1c4edd541ada7f38e2e43785088@realtek.com>
References: <d7e20cc5e8a0489b9b22f13a9fe8a1b423d2f8f1@linux.dev>
 <20261107081609.97212-1-skalpesh942@gmail.com>
In-Reply-To: <20261107081609.97212-1-skalpesh942@gmail.com>
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

Kalpesh Solanki <skalpesh942@gmail.com> wrote:
> > For the counter, maybe it is cleaner to revert 2/2 (or rebase and drop
> > it since it is currently the HEAD commit of rtw-next) and send a new
> > patch, since it replaces that line anyway and keeps the current
> > behavior out of the next pull. 1/2 is fine as it is. Ping-Ke, would
> > that work for you, or do you prefer a follow up?
>=20
> Either way works for me. If Ping-Ke prefers to drop 2/2 from rtw-next, I =
can
> send the updated patch with the consecutive counter directly. Otherwise I=
 can
> send it as a follow-up on top.

I did force update to drop 2/2. Please respin your patches.=20

Ping-Ke

