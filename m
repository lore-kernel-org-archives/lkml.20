Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794899468;
	b=UjN1Pgi9isXz2aFgavu3GqRtX+auFyhtyiQZXoDEgCCfce1EdzkDJo2T6E8Bm6In5yK1
	 +MvyTiSyS2DuC+L+NypOR8kXsoEvsLPfGtAtBDOsz5/vGsWF/G5ee0fnOJhHpRqLX7M56
	 XTESmueAAK8YoaoYJ4+iiOk9nYWDNbicpRMsjJGWp13ovDbbOgBbjIEfuXEpZP+8Ge2il
	 Om5FlUuARrsp9715jfmrl22m0vlPl//km+dYHHtfAoy7iXp0VFdVjisX5Dl1GXFaNxpfI
	 i7vt0aRkUcJbiXvbNMCPZdChk4wfe7WqEAmqCLAsRSocg9mHppntsVSCrPgGXQSIYqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794899468;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=FzKRyCI/FFKA8grj4ht9Xr1QJm0lA6wqt+zgfp62ads=;
	b=oZhTj27gST/+LslXGpjbKoXFOTnKvgH8Z13tkQ9egqz99X69bnu/4ThKVU8ahjrDE1MI
	 DK5UxW/j5w5g/hiF4tTvCK+wSaEQ0GeQ4zYVgLN6Q4zM2EIfbbdOCzwKZh3Lw+KtsEcSH
	 /gSNC6tWdO+pTKqogXcI7J4exmUTR4zTZ94GLsA/TrhNlugPsU6LY19OFmyDR4XM7i+Ut
	 PdOyKiKC63sUHHpTeYxz3xDYU7x/fGLp3GgW0q7ZSAHNVUlId7RV8cRwd7yx6ftBDofjK
	 zNunFKMtwaz1GfldG8Nqam1CDGKIxZc+FSjB7M2sxaS0Z7p6W9PnlesLQbndoClqZRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=PcZec1R4;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D28606A88E;
	Tue, 17 Nov 2026 07:11:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2D28606A88E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=PcZec1R4
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AH79QCf8017603, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794899366; bh=FzKRyCI/FFKA8grj4ht9Xr1QJm0lA6wqt+zgfp62ads=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=PcZec1R4U8OWmhrV0/JYKZ1fuZUZdEkrsM7unxe9AyjzSfCrS4vjodONKFDDoEHXc
	 Ne9zYgmqvup2kydBJ0gcxRrcO0dWk+K5S3re6zN6lbSJSZ2rNXxvxiE/7I/cOZ43iS
	 CdBcWTt9DyOvcephO6WP44uwyzz4OS49GU+Hmx1Pk9fxcxnpCtXguE95mW0Mmiw93M
	 aJU0k0hhQni4rN1ZHfjbUTqLge38NmKsTOjTqxNaKaRCS/Zder41S+NVLJGziIcz+X
	 7HSp6hJxj7QWT+vF9674eLEORWbpKgLCwQHldAE3/UrEp/5duRMzGwO9/qBXHONl/w
	 oXhN0bTliw8lg==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AH79QCf8017603
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 17 Nov 2026 15:09:26 +0800
Received: from RTKEXHMBS01.realtek.com.tw (172.21.6.40) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 17 Nov 2026 15:09:26 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS01.realtek.com.tw (172.21.6.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 17 Nov 2026 15:09:26 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Tue, 17 Nov 2026 15:09:26 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Leonard Lausen <leonard@lausen.nl>
CC: Luka Gejak <luka.gejak@linux.dev>, =?iso-8859-1?Q?David_H=E4rdeman?=
	<david@hardeman.nu>, Shawn Lin <shawn.lin@rock-chips.com>, Heiko Stuebner
	<heiko@sntech.de>, "linux-wireless@vger.kernel.org"
	<linux-wireless@vger.kernel.org>, "linux-rockchip@lists.infradead.org"
	<linux-rockchip@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH rtw-next v3 2/2] wifi: rtw88: sdio: combine free TX page
 register reads
Thread-Topic: [PATCH rtw-next v3 2/2] wifi: rtw88: sdio: combine free TX page
 register reads
Thread-Index: AQHddg4Mm6pGDN14n02291BdufFCsLcx2B7Q
Date: Tue, 17 Nov 2026 07:09:26 +0000
Message-ID: <e117bb9cdbb743a4853e16c33d618b50@realtek.com>
References: <20261116205739.462458-2-leonard@lausen.nl>
 <20261116205739.462458-6-leonard@lausen.nl>
In-Reply-To: <20261116205739.462458-6-leonard@lausen.nl>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
Content-Type: text/plain; charset="iso-8859-1"
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

Leonard Lausen <leonard@lausen.nl> wrote:
> TX capacity checks on non-8051 chips read three adjacent 32-bit registers
> in separate SDIO requests. Combine them into one 12-byte CMD53 read when
> the existing power/alignment check permits it, with the per-register
> fallback otherwise. Propagate read errors before checking queue capacity.

How much time will this change improve?

>=20
> Allocate a DMA-safe buffer at probe and copy its little-endian values
> into the caller's array before releasing the host. Holding the host
> through the read and copy serializes access to the shared buffer.
>=20
> Signed-off-by: Leonard Lausen <leonard@lausen.nl>

With description about improvement,=20

Acked-by: Ping-Ke Shih <pkshih@realtek.com>

