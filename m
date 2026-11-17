Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794879849;
	b=Tqy8+t/asCcCozkaFqpK8BJwAs96GjCWLv0M8N4FAEBLie+TWFpSwFV+OUXmp3Yf3DXj
	 +vYbqTgWG7ziNJwfYzxeWIATXhbqUPBJfvVDwvmW6FYNs5n7cD6H+gocd0u9gDmhzglV3
	 yO1r+RNo/yFXmD/yK6Qsyo0/4zTN0YvLxe31I0ZTMq9cgr6l1UBvP5xfjQX+dJy0tVYHD
	 7jFQxZbVeY4nWJmHI1bz44pGyHvRxpEgL7BcL3FWZuVPTCHacPSqQoJO/0vFzPBOCejw3
	 NYVFgMBpggQlNlP3j7LO/8BzadIQanGh8lzMAFuyOnfQqetDoUtmXZEByqu8sctjZLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794879849;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=7ucIzS7cSZeVPQuqNw1axlFBe+3JU/Gw25WJyc3osDw=;
	b=BiGNHRvPh4Go4VFZ9YbPT8rddUswCOF5Eqcnr9viPUumMWnrDP+bdlgQ1GI+4LL1PEsV
	 Mt0V7FY8n7+v3vmMQ2QoxMmLBdSbCH4LOsNuEd1EWjeUyl5oHA0O+rb16VEUZMRrhErsS
	 1bviShv7YryV/d7x+GcBaalKTGrd7VhpryeIyL/CYaohcP0krhMkQCAEoqqwjS0fLBCsc
	 HejOj+adeERS2UHZQkIOC7YEOg5SX2tHtW0gBRBXBbyrRI+3aCa/CiHYx+5CjYPUzEmMA
	 Hzi9ECpr1b70EAq7BlX3yzRS9Y5WS2a/cq8WFEttVulALBe8VbCxB+jLlRzy/Ssbc5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=iJOv8soY;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED975606A31C;
	Tue, 17 Nov 2026 01:44:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED975606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=iJOv8soY
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AH1i4U713949993, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794879844; bh=7ucIzS7cSZeVPQuqNw1axlFBe+3JU/Gw25WJyc3osDw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=iJOv8soYixQMbFBD4O6RuIqDEjxwOIsY/9hk7/85SMm/ybT9HYsKQyVJW7y1xWut1
	 4PX+5tETaiVr/DCYyCgekVSC+LovGuV7U5tpbk4x90EQg7pv1k8p0u0kZrx0LTrjyh
	 qdxpdieuVefIsMUNGYodfeufIp34TIh8VtLpXlvjArThphONQklJsQ+jRUtI4prb2w
	 kEYIxF6iL+MDyN4I7hK0LwV3F/cJm1vlhE13HOOrsbAhTeeWkq4T9eWUFG7l5l3Dmo
	 Tp8brKihzvpvA213aPIDLv5XqpSpefpMY4mEMtpucvtFw0P4mPKGLjT62YRDqEzor6
	 rmgLFEqeeWoVg==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AH1i4U713949993
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 17 Nov 2026 09:44:04 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 17 Nov 2026 09:43:56 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Tue, 17 Nov 2026 09:43:56 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Ho Jie Feng <hjf3108@gmail.com>, "linux-wireless@vger.kernel.org"
	<linux-wireless@vger.kernel.org>
CC: Bitterblue Smith <rtl8821cerfe2@gmail.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH rtw-next v2 1/5] wifi: rtlwifi: rc: start no BA session
 for QoS null frames
Thread-Topic: [PATCH rtw-next v2 1/5] wifi: rtlwifi: rc: start no BA session
 for QoS null frames
Thread-Index: AQHdcOnEUNpxCp0Vc0+cryM0XjhKhLcxh8Zg
Date: Tue, 17 Nov 2026 01:43:56 +0000
Message-ID: <bb405741ac744f9d9f6e4d5b58ae00d9@realtek.com>
References: <20261110080143.1362021-1-hjf3108@gmail.com>
 <20261110080143.1362021-2-hjf3108@gmail.com>
In-Reply-To: <20261110080143.1362021-2-hjf3108@gmail.com>
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

What is the benefit only for this kind of frame?
At least you should describe the change exclude null data, and what is the
impact? Please explain.

