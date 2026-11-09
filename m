Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794184826;
	b=KZ/DjfQ5BHPmKOX6MoKTcFNObIfQEKlAogPTSP0Py0sxvKJ4vtcFImwuU7cIeTBgTrOa
	 I7IJuqwLjDfNk+o6DyzyK+vW2W/9tP2slF1MJQcT3wuSmWzJ8/ig3Z/XA85iXgwG0cpRA
	 GewRxeuxWq7ordioDDRZmZ/uAI6WU5Yr6XHO2tuRvv2sULjszqkXB40uAeuFIdbneCwhw
	 OoEokGR4asn8L2pME1TRWmjFwNQ41JLb6dW0MIHXjITeh74X5CmtrqFD9SyQ2tcxsIHk4
	 Ulzs1cEzL3kM1B7KmLwopBhiiqC4zv/EFj/vwh+JioasptDi33fLBqUb3ja7KwPAjnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794184826;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=Z5410FcRl90lti0FF+4on2X3OCr6eStq5XnIeOt7CdY=;
	b=Q2pLXO2t5A6dV7VsRd8J76LJaXDwdTn7cGqwHuAznRNCn0nHdhALLCphgX5K18TRqMW/
	 4wB+9dV72QzlsHMp5ZsWy6Jo8C58+8pj1YR6I96QUfLTie6+/wqBQ04vWOzOR91Vk1yA8
	 UkytRNt3DaP1BAHRr/RuBnC+yMvzrBGGgO6bjQ1RqBWJ4AFzxTra06j3sZq+jfUMPCk53
	 QbVECdji+9waUznKUBLDmYOrsceL5tPQYy3Y+1jOH0qJoqqHMEbhnLViOu/xpLKkg3UUQ
	 vVnqWj/EQ9b4yVxRb3mYXd9yMGP7ATYVtllrmgQOhRPHUaq4Xc+mS/6rE5y5HUErmnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=PWxocnDr;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E95606A320;
	Mon,  9 Nov 2026 00:40:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76E95606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=PWxocnDr
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6A90eJ4H13825802, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794184819; bh=Z5410FcRl90lti0FF+4on2X3OCr6eStq5XnIeOt7CdY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=PWxocnDr6zUOTCadttfhv4dgZtFnMz5aDjJ0OtHUd3ug0N2Btmm6C63bDsYXVX9ms
	 iHI+G0k1II0z4UMTkzgAo9QpFb+8NcqjuoBlcIdrlPIqbjEoadiXTJhBZIuh72uYPp
	 X77Q3k64wdlorH6/Waf7VW8J85uy0GopC30N7bYCEYctNwelDPZgnkqyl3hnG1G1W6
	 E4x4AkXVeD4achqfCeOKREFaprU4dacNJjX/JH3WmpKmawUaP17R1vZJxh68P30hrP
	 rwazbxiuZB5LZr/c9DwheZbFSjMfh2oJEEMwNi4FmebxEePSwIdj/fix2z9vQMQRHm
	 60SOpUVqTKmCg==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6A90eJ4H13825802
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 9 Nov 2026 08:40:19 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 9 Nov 2026 08:40:20 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 9 Nov 2026 08:40:19 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Mon, 9 Nov 2026 08:40:19 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Ho Jie Feng <hjf3108@gmail.com>, "linux-wireless@vger.kernel.org"
	<linux-wireless@vger.kernel.org>
CC: Bitterblue Smith <rtl8821cerfe2@gmail.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH rtw-next 3/5] wifi: rtlwifi: usb: unify the RX code path
Thread-Topic: [PATCH rtw-next 3/5] wifi: rtlwifi: usb: unify the RX code path
Thread-Index: AQHda3lJQ5elRG4B+EepDSbwCkWrv7ck7r7Q
Date: Mon, 9 Nov 2026 00:40:19 +0000
Message-ID: <5371f205934a4dfd86cae13ffeebcf7c@realtek.com>
References: <20261103095256.949327-1-hjf3108@gmail.com>
 <20261103095256.949327-4-hjf3108@gmail.com>
In-Reply-To: <20261103095256.949327-4-hjf3108@gmail.com>
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
> _rtl_usb_rx_process_agg is a copy of _rtl_usb_rx_process_noagg
> except without the tail end. The noagg function can be used for
> aggregated frames, so drop it and rename _rtl_usb_rx_process_noagg
> to _rtl_usb_rx_process to unify the code path.
>=20
> Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>

Acked-by: Ping-Ke Shih <pkshih@realtek.com>


