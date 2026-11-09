Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794191478;
	b=swInWGKiDXfVaJOu7Il9y0+GJcbo2KzNPj+1x0f4EzYIv/e7oL0nbWPPhe1C36RPImqI
	 k8Z1DVIqFMGV9fJHNSFJBkidNyC/nS9/IlA67Tb97pTi97TEfxrjTriGf7B8WG+d+aIta
	 i9E51fXpmVDYppDbKhEPuRvDjIDJ2XirMQPCn/fEO6S1/sZsdC21C06W9CNVPTjm+eBMy
	 w6t3llwixia3JbKZ047zNvdzA3yw7+kZDqgZQveCm1kjBY+/LOLnSmbr/R0Fwk9Kl/spg
	 oVG+KGet6bWMSwhrh3C7xTDkpVFXDKiXeRuFo8/e0ePc/rvgPI4wftgm52Jxj7RVx0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794191478;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=yoJdvXKWXAeO/mChSWyUpzTmife7HhUbhVw0F1oxZiY=;
	b=c7+71djBZ4F+knmZjeAdiWmX5o3AbKtz6zz/veMLabr1oKjjHnSeL971gl7L0rEsQq7U
	 ysKu+qcF89VenWmMaXpccbdNJvrdCqxydOwY8swua32GH3S0vogDhyjnMKNft0RE7qnBr
	 F+mU/LqqpwRnQmUeTcsnnCmRA8TTP7ivRKLMyBLdmkI8ySYSyfcRdnMFT628xd3ULUuSy
	 kHfwgHoHYzw8T3+PAD8iLxzsn7Llbxf0N5dFstVhhqNauVS7Oajwa9OMY7N+t06gVcDDs
	 eDxYcdYawBpUDOt4cGeqxZ8hlRrZPZyo6NZ35HRQ4TqizxZ64CtMJ1PqVZwPSM7BqBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=M1aIbDtE;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C613D606A332;
	Mon,  9 Nov 2026 02:31:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C613D606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=M1aIbDtE
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6A92V4IR03940481, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794191464; bh=yoJdvXKWXAeO/mChSWyUpzTmife7HhUbhVw0F1oxZiY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=M1aIbDtEl2Qc83E7aPNXd+EMpzOnW2BGotOjokF24ifwmU+5sbzBIMmwptuXutVh0
	 j5se+alXb3UpF+Cy5nKgjO0trNGKJVmTshRdLNEEmR7XFVjZPtNJIZSBbyVYiknTGN
	 fckDuMLvESsJ6W/+e1M+niC7XqaXY+2Ri3Xc3PKZPJ8MDPexqhC0Psga0i2Y3v8RUX
	 rK2NhO+rppQIxTwGNdMywKLa1V1DsTkIMKrtifhQfM/WTyd88QZF/oOY1OLIGW2K4j
	 0Qwz6iV1PgFuZB54xyy1V4iuRnvh+KK7jjFwJsC2yt6Exba4U7/32msNMOtjoQtpra
	 sN60maKsvv8iA==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6A92V4IR03940481
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 9 Nov 2026 10:31:04 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 9 Nov 2026 10:30:58 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 9 Nov 2026 10:30:58 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Mon, 9 Nov 2026 10:30:58 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Kalpesh Solanki <skalpesh942@gmail.com>
CC: "luka.gejak@linux.dev" <luka.gejak@linux.dev>, "kvalo@kernel.org"
	<kvalo@kernel.org>, "linux-wireless@vger.kernel.org"
	<linux-wireless@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v3 0/2] wifi: rtw88: firmware recovery fixes and LPS hang
 handling
Thread-Topic: [PATCH v3 0/2] wifi: rtw88: firmware recovery fixes and LPS hang
 handling
Thread-Index: AQHdb15tzENGiXbpUkmLg1jSpFrwf7clBUSw
Date: Mon, 9 Nov 2026 02:30:58 +0000
Message-ID: <9fd1c42c5df94629a21c41dd08645b96@realtek.com>
References: <20261108085126.331784-1-skalpesh942@gmail.com>
In-Reply-To: <20261108085126.331784-1-skalpesh942@gmail.com>
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
> Changes in v3:
> - Note: v2 patch 1/2 (DMI quirk) is already applied in rtw-next.
> - Add patch 1/2 to clear RTW_FLAG_RESTARTING in rtw_ops_stop()
>   with Fixes tag.
> - In patch 2/2:
>   - Count consecutive failures before triggering recovery
>     (RTW_PS_HANG_MAX_CNT =3D 3).
>   - Reset ps_hang_cnt on successful LPS leave and in rtw_core_start().
>   - Suppress raw register dump on transient failures to avoid log spam.

The patchset doesn't present in [1] nor [2]. Please wait a while to send
newer version after it recovered.=20

[1] https://patchwork.kernel.org/project/linux-wireless/list/
[2] https://lore.kernel.org/linux-wireless/


