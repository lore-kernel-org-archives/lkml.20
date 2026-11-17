Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794883487;
	b=uOZIQs+nbH1iqZwdgg4s6c8Ykp6zOB3NIj3rR8WehLkmsiUFTPYHQVMpzv/+8TIZ/8O1
	 UsvRUsF5Sm+64U12qhfdOKt6eZnXXKFH2qcIN+kQOgWkOOMoL5xycyV8G1U5gVTEsRymU
	 tO0k4FFXlJuIvMCNUiwafy6UK3PKr41GN+Xu5w1k0Zxe2SRqpbcnB2BbEw9vkQnjzBE66
	 vi7XH4HNRW3TZ2PcMMLzL+dv6dB5EhIikj/ITPvrdvQVU2cMpQCNw98t1lHXHGrqrgQl2
	 HZK+VI1EUvGFLfJ9rEfpuGuW764w24Dy4vTQ9d0KYx6P8xUeDi9sUw2qT7JkOdlZy9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794883487;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=R0FHy9kyESLpXzTn+ZXP741eRnvjd9zdvrMB6HJQQLw=;
	b=QBM11crFOfYVz0AuwjKK7RgdnQ/sWmdu3s0/r4iIhz4aQ7WZCYFzjGL6P2styhQZ4bQX
	 oAPGt8HYtnEt9BoPbNxsZhRf8L/EEJENUobWqcwnWmxK3WTDKAagYhYYM6GPS20SdPOP2
	 Mkbk/JFrlAKJD0S7JusHrXyA9gyj/EfaQqjI6wiV/b+h7uhEA5KFpY4HojIAPfabnvi4l
	 aQEyy9iszbhg48QIKCqjc+zgQ1AqZ8qrf9Cup4uAqyj/D3yMlU53fPahynoSiY98uzbR+
	 xYDTc0Eab9UZS60Z3FmQ2RhDEjAipjmZXiGOOdZol4UolQLC87QCdcgn8NIfaaya8Vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=uPgnAHQz;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C44606A329;
	Tue, 17 Nov 2026 02:44:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0C44606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=uPgnAHQz
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AH2igS433997476, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794883482; bh=R0FHy9kyESLpXzTn+ZXP741eRnvjd9zdvrMB6HJQQLw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=uPgnAHQzw/iwka2pmDvNFO4AwPDIwP5Pwf1Hji55VXTf6tq/QOJzLfBoD/h+nn076
	 zeUzaotib5/pr8X5wo3HCc7FFsbhCtbkMt4CnwKn0E9BVuv3cpTgca+/ztZHcyTOqr
	 QrUVYt++lIdOOcv2v6Od/XBkA8SG/rYhrI8/89+ny8UCMHdmNyH4lnz48qMtZdqhUu
	 hyKRYnzFuXHh73Dp8Y4FYmIvslA1bi8ujOTD5Txs7PjyhiXHHQAorEIfc7TmVAFkoB
	 EYV4GeL32E4avIfPbRp76SoTu9/ZX7Cpzingn9YPUaLqAIPEjzgw82Cw/OzOydr/++
	 1XJMr2ZFZ3o3w==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AH2igS433997476
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 17 Nov 2026 10:44:42 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 17 Nov 2026 10:44:42 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 17 Nov 2026 10:44:42 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Tue, 17 Nov 2026 10:44:42 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Rishik Yechuri <epicrishik@gmail.com>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rishik Yechuri
	<rishik.yechuri.code@gmail.com>
Subject: RE: [PATCH rtw-next 5/6] wifi: rtlwifi: use ieee80211_is_ctl()
 instead of WLAN_FC_GET_TYPE()
Thread-Topic: [PATCH rtw-next 5/6] wifi: rtlwifi: use ieee80211_is_ctl()
 instead of WLAN_FC_GET_TYPE()
Thread-Index: AQHdcUN/vKBQj4FIrkqIuEabSGTDGbcxmECw
Date: Tue, 17 Nov 2026 02:44:42 +0000
Message-ID: <5a469b9bb1e3450c93899dbe1e503170@realtek.com>
References: <20261110184409.42205-1-rishik.yechuri.code@gmail.com>
 <20261110184409.42205-6-rishik.yechuri.code@gmail.com>
In-Reply-To: <20261110184409.42205-6-rishik.yechuri.code@gmail.com>
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
> Six RX status parsers read the frame type with WLAN_FC_GET_TYPE() from
> wifi.h only to compare it against IEEE80211_FTYPE_CTL.
> ieee80211_is_ctl() from <linux/ieee80211.h> does that test directly on
> the little endian frame control.
>=20
> Use it at the six sites, drop the type variables that only held the
> result, and remove WLAN_FC_GET_TYPE() together with WLAN_FC_GET_VERS(),
> WLAN_FC_GET_STYPE() and WLAN_FC_MORE_DATA(), which have no users.

Please reword your commit messages.=20

The subject has pointed out the key point. No need much verbose=20
messages generated by LLM.


