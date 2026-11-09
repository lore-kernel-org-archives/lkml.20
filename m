Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.29
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794228387;
	b=fM8AFDK9vlPGKWveA4nlps67i3ajCDC+pCzqhPPZjQod1FBKuKcpFeDdIvWSnh4mIb7t
	 Hc+J9Q2uWbLxzQsvCNFdPZbOwQHv9NS3Irf6z/dqzJR8RhpUoJ03GdCqre+thqY24A/40
	 SME93esEXyKL+sQd+RgBgkIeWxac15S5L7XkGrnstqti5FhzezcI69SpV1YPstDN00UP6
	 1RVEqBMfFga34dRT0Cbl8ocbx1ExLMd/uUEbsZhecL9V2lD/DE6voGoQtKijnSaKhIdS6
	 2nA7/dSDnpykfI0dHEAXu6+68gVyduHkUHl7t6Rj3tOZ9MpUOrF0c3D6rKdmZZfd6gQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794228387;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=H+sb1qDVJksy0tD0IS7N8/CuqeviGEq2b64P7nj5BAQ=;
	b=doQMx2//AExizxft9vu+IMLnJlYBnhDfVw/+TretgxGftXGJxzSCcn24U5y4YlK+t70T
	 Aut5+nM4eMseX6Gcj4gQ8fsAY93vOMiFjo6fJLgwMn2u1H2PlQus2I0UP/uFxKHHf2+CE
	 a32M8cUDGQsd/z3/iRqIS++bI1OZSWSYHskqrVcyONcLD72axvppux3pAPheFxkJjk63t
	 2fQTkxcbPvBWwvuw4piDOidn1hAB/29ZrjAxk/3j7WQpM5wKR1XwxKAeK9rm2E7z/ZbkD
	 qq3UjsbeLHMEiJRv6uK9vk/xPYS/EyvW4HbE8X+fKpVLEbcJItuponPLDU5raf9Kwog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=KPPLQo23;
	arc=none smtp.remote-ip=79.135.106.29
Received: from mail-10629.protonmail.ch (mail-10629.protonmail.ch [79.135.106.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E05EC606A332
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 12:46:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E05EC606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=KPPLQo23
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1794228383; x=1794487583;
	bh=H+sb1qDVJksy0tD0IS7N8/CuqeviGEq2b64P7nj5BAQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=KPPLQo23A8NXsFplVV7EbwpYeIgcaxVs6/ds2/hFo2cxGl8cV4jzSerneGwLyDatd
	 L412kcstuPT0gO/X0Er5LCKbv1SVYTUYwSwn/UV2RmaeI3Rpa0gcLGIy/VOglMp7Ls
	 x/aLES49nXlI+tqwPvo8VGAsP9IswXXJ1kDhPghC7pJYJeWfXCndPwUcStHiWMzd3V
	 LjE3tFRJHTSni3U5SnA74IviAaglnGDZKUVjCl0AQske/ZH3SHjLZbm9fXIPZ13FUF
	 EJbCH4Tct3K2z/77+GLxK+RDm2uuIW9UPVk3ueZnp92DCZ7M+PUsm/HCO0q/NPcstU
	 ORS3OkCbyvb5g==
Date: Mon, 09 Nov 2026 12:46:16 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Peter Marshall <pm@petermarshall.ca>, George Neacsu <geocausa@gmail.com>, Hao Yao <hao.yao@intel.com>, Fernando Rimoli <fernandorimoli11@gmail.com>, "D. Manresa" <dmanresa@gmail.com>, Jizhou Tong <fqwqf@fqwqf.xyz>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/4] media: i2c: Add ST VD55G0 global shutter sensor driver
Message-ID: <20261109124610.85065-1-lsa.uz@pm.me>
In-Reply-To: <avGwRaKSqXdtXkII@kekkonen.localdomain>
References: <20261109093353.3757-1-lsa.uz@pm.me> <20261109093353.3757-3-lsa.uz@pm.me> <avGwRaKSqXdtXkII@kekkonen.localdomain>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: d36449cd1cb0f1090ed47c1f08f5c850fea00f72
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Sakari,

Thank you for the quick and thorough review. I am working on v4 with
the rest of your comments, which will take a few days. Two points
first, as your answers may change the code.

On Mon, Nov 09, 2026 at 01:36:37PM +0200, Sakari Ailus wrote:
>> +static const s64 vd55g0_ev_bias_menu[] =3D {
>> +=09-3000, -2500, -2000, -1500, -1000, -500,
>> +=09    0,
>> +=09  500,  1000,  1500,  2000,  2500, 3000,
>
> Is this

The sentence seems to have been cut off here. What did you mean? The
table is vd55g1's, in the control's 0.001 EV units.

>> +=09if (!ret) {
>> +=09=09sensor->expo_ctrl->val =3D expo;
>> +=09=09sensor->again_ctrl->val =3D again;
>> +=09=09sensor->dgain_ctrl->val =3D dgain;
>
> Can you use __v4l2_ctrl_s_ctrl()? That way events get handled correctly.

These three are volatile while auto exposure is on, which is the only
time g_volatile_ctrl() is called. v4l2-controls.rst says to set
ctrl->val there, and that a volatile control does not generate
V4L2_EVENT_CTRL_CH_VALUE; cluster_changed() skips volatile controls, so
__v4l2_ctrl_s_ctrl() would not send one either. Did I miss a case?

Sergey

