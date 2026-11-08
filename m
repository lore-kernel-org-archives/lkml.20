Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794110928;
	b=02i/oaCIrCyhbOGGjoj43+fdNH5yA3ZjeYUWKTp6SRbkDzyGJ3EfJQNR00rN3RavIGho
	 MsgnCG/uZhJaooaqLyuo56wm6ih2fei4hELxpP/cx7XFpabkBGfNgIdorwTQfO9Qde5RX
	 52mwJZk/uJwJbN4m/oOMhXKqCterCf70kuNAhj8GrqstVvbZoXlgCjzAw193LQM0SleXC
	 b3JVIZMYslD0BHx+OkAVG/5N4nTekwWL+WlSVdv8NhyB/aAYApAYuwadY6gqucfeOE0KQ
	 SaXepFuAfSrPpZM/tuQ90HiDOycJdA0hvhx4Y+oBoqXf/O2q4ahOjkTT/BXNBb8/EkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794110928;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=NxlUTHwu8MZSvIAGRZNdmcVny8DSWeBIW0pG2xSdH/M=;
	b=KnqYBtBIYvqZLf2t8Z4RHdO2oOAt6HtWbBYob7Qz0eEZ+seXeEfXs3s9tRLiJ4kBMr+U
	 L3zm/3uw2Edo/kfxzYdLu1ql0QOAoDvO/R245xWCzFWhtt6KwkOQgf4oqEC3tGMYulSxA
	 gHEzOOsSzddBH13MTggmIpfZ9FppKZ/tVQ0lamKz+Yv+hpCnP3pSLpLzAcO14tCTr+blR
	 O3dn0MTBVk9Nr7RvfAxsFk/MEewFg2xuAGMww7RkhkKwubabttamCsIWe/HWbjgd2WDZz
	 WWdYDUOGan1xkQHW0H3yW6bSecUah8WsFbwGa4AF1jHLQU2H/l8Vfj+wNAklx0SJ31Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=WCSSszSf;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD04606A31A;
	Sun,  8 Nov 2026 04:08:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FD04606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=WCSSszSf
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6A848gQeA3127841, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794110922; bh=NxlUTHwu8MZSvIAGRZNdmcVny8DSWeBIW0pG2xSdH/M=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=WCSSszSf9OWmRBFFKveK992Y0FIzaBzyleeUPv/ttV8+whyRQ7ShHy2zmSoG0La8v
	 ojaa9tV2WaNziSNApcaYoPkpXc4UtxE8HQD5xxUm7B6g4hQRBIwy9sihRaFoY8p9C3
	 8OEJgcSRJZ1wceQm7haIAfxwJ1IAinubeVIXDxhCYM9NOp3eJByZPAjBBJtGIvBuwG
	 3+jJ6u+sCOd8PeM1OLJqz1l+G2cTSyfj9ZN/2vC0TIOv2yNEMzRyRDokYkzxusj03J
	 gB6uUirE7iEPtc3zTNAWU0knFe6JH+MKy8YS4u9Y1DNzZvEHmEMGlhxKqUNWzbKhZ1
	 keGoZEm2Qrjcg==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6A848gQeA3127841
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 8 Nov 2026 12:08:42 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sun, 8 Nov 2026 12:08:43 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Sun, 8 Nov 2026 12:08:43 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Ho Jie Feng <hjf3108@gmail.com>, "linux-wireless@vger.kernel.org"
	<linux-wireless@vger.kernel.org>
CC: Bitterblue Smith <rtl8821cerfe2@gmail.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH rtw-next 1/5] wifi: rtlwifi: rc: start no BA session for
 QoS null frames
Thread-Topic: [PATCH rtw-next 1/5] wifi: rtlwifi: rc: start no BA session for
 QoS null frames
Thread-Index: AQHda3lHxIC7vpFqd0S6iIDQsoFki7cjlhkA
Date: Sun, 8 Nov 2026 04:08:43 +0000
Message-ID: <e4895ae4df0e4de6a5dc45bc276cb1d1@realtek.com>
References: <20261103095256.949327-1-hjf3108@gmail.com>
 <20261103095256.949327-2-hjf3108@gmail.com>
In-Reply-To: <20261103095256.949327-2-hjf3108@gmail.com>
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

Ho Jie Feng <hjf3108@gmail.com> wrote:
> Only start BA sessions for frames that carry data.

I can't understand why building a BA session for null frames cause lower
throughput? Please explain why.

>=20
> Test results (2.4 GHz):
>    before after
> TX 7.0    6.1
> RX 28.3   29.1
>=20
> Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>


