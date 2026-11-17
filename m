Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794879948;
	b=aCH8F+g1YktyBH17Bree3Z68aPCqsai/ijzuy8lVf99URE0lBN+Vg4qFKdjJMXJGVAmt
	 RKDawyp6Ui6ByPPbLvsmVRcqm7KZ1uJtKg1J4I9fy6+cJZFc9gYiC+vtkuYZ59cLaxDDR
	 SiUF+BnkxAr9eo0ek7trXxNA6OpgETVfKxBdrqBkltDG03zJhl189lbE3HaEPzOmXwAP4
	 e9bGUOAT+D9H/9uiHddDHqU7KpIpxc3RJ190J8TOmJxrBCbsoUI37c1jbH64mU9rORe3a
	 z0eSXDuM3DgKjk8PQo0EoEHZ4CBVjrlhXKoDUvGzPFVPPMT/2kS6rEd1zuDXDvPiihw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794879948;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=7qaJ3fe2dzUyKG37n67fAn3WUGgV3mPgfZlrc2dCXdo=;
	b=3ENI3FosNLcubFmAiCUuN5uiU2dz2BkmKxBqGsY/Gm21BIZrrnAEdwsBLIja0eHM5Zzx
	 xceCJ8aPEdoBwbiJC9Z+9TzyyoTTF13uShXjvLf5kI+xDLQLqF60RF97eE2MfOtkLxj/P
	 bFnzGQRY4DN7YGn/Td673HFTGzgtyCHeok3twr1iaOAqX+zrCSjk0KfTOWKsLOJzlKjNr
	 WbEuL52+94ypnrNed8Fj5y+Bw9OA6Czf1fMtOzs0CYzzl9MWMHRpGfxU6R3tb0cvMcoo3
	 GuU8ep6YEMIO5CaO9t/1UCApM8HW3/asTyDSVJFpMK6FmIm697LrfnEJX/ZKUzCeo3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=LFobUxar;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B353606A31C;
	Tue, 17 Nov 2026 01:45:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B353606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=LFobUxar
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AH1jh6833950700, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794879943; bh=7qaJ3fe2dzUyKG37n67fAn3WUGgV3mPgfZlrc2dCXdo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=LFobUxarcaKiNOZ2LkXmCRB3/2mZ3nbYS1G2bZ16zKbbBQil8QhWEdGx0o4pV3ZB6
	 OsRvkINcd9hDLtehk97eNCiyHOceWWlkQLZHftGGSIkkNGMA8ob1CtinJj++zXwjaj
	 kO/Hoj+Fp2b8tV3RdoMS/8tjN5i0N4TUeBqyuGR2KFjnAemEPctaeUIYTW/gznq53V
	 Y3+biWVdQN64+ub6GHqR/wCZhCqf9OCBdt+O5aCeqaq32c60nbHrAzYCmI2IDaNz2M
	 HCb+wbipNZcFQTHyzBcdQFzSBnGGcCwovG3tZKPuMsQn19/5RlIyyu5UfRxqWQWsy1
	 n3bCJQD1+UuXg==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AH1jh6833950700
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 17 Nov 2026 09:45:43 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 17 Nov 2026 09:45:43 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Tue, 17 Nov 2026 09:45:43 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Ho Jie Feng <hjf3108@gmail.com>, "linux-wireless@vger.kernel.org"
	<linux-wireless@vger.kernel.org>
CC: Bitterblue Smith <rtl8821cerfe2@gmail.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH rtw-next v2 2/5] wifi: rtlwifi: rtl8192d: report no signal
 for frames without PHY status
Thread-Topic: [PATCH rtw-next v2 2/5] wifi: rtlwifi: rtl8192d: report no
 signal for frames without PHY status
Thread-Index: AQHdcOnFEmq3xrlyu06qWwzoRRcxWbcxiLsQ
Date: Tue, 17 Nov 2026 01:45:43 +0000
Message-ID: <54e7f43994054d8c8fb1c561d1a9d1f7@realtek.com>
References: <20261110080143.1362021-1-hjf3108@gmail.com>
 <20261110080143.1362021-3-hjf3108@gmail.com>
In-Reply-To: <20261110080143.1362021-3-hjf3108@gmail.com>
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
> Only the first frame of an A-MPDU comes with the PHY status.
> This makes mac80211 report the correct value when queried from iw.
>=20
> Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>

Acked-by: Ping-Ke Shih <pkshih@realtek.com>


