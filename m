Received: from mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2733B2FC011
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 20:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790801632; cv=none; b=G9/gZvK04GLV37btmxhztUVNYlCUFCDblDpc+6ILs5/GHdQujlwxzH8mx3SGnG48juYDx7m4V+080nl0FYtQe2HPLuRHmEGf+QM9squia+vjjykS3Pj87cWw9DEDNRy93c2uHkMMGpT4MDJ572lBjF3MYTYmg0VYQ0sVvZX/lTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790801632; c=relaxed/simple;
	bh=xmapRKLuBeHDa+OBWnrMc21qNq63TjYmVixayqvf4bA=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=tdrjSMeQgQXGOCdCMgktFnfzWYoufbqT5Po0ZVJtRG+EixhqMYJHjULJ272I838exKNz6Jd4LNNxDUOWMzqgvjBHk4o5YYNK7Ik1jxHUkQ/rxQtiQESBrmOJIqQbtIbuTeu1Q7x9CYSb29GtJSarn867sNPgi+vmC6EjZw0VW+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=EDm6RgBo; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="EDm6RgBo"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=xmapRKLuBeHDa+OBWnrMc21qNq63TjYmVixayqvf4bA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790801628; v=1; x=1791406428;
 b=EDm6RgBo3zcbkATBNQjmeF0IW0R+xlx37kMREwDSl6anO7C01XcE02EnBedwdZjecNh6fnh8
 QwLihZvSun8rSH62DdeDemLiKBuhNfrBszp//BDEEpQg7Hgt3GKxJsvQmzEMAfQf7Lvg5kjATs2
 EmPSnMTlnd4Wi+3J35hKtbdQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 8c112cf7c1ea7f24;
	Wed, 30 Sep 2026 20:53:47 +0000
X-Mizu-Trace-ID: 8c112cf7c1ea7f24
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 30 Sep 2026 20:53:47 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Luka Gejak" <luka.gejak@linux.dev>
Message-ID: <f90a8af0f5be001599a3ca5072624449460fcd0e@linux.dev>
TLS-Required: No
Subject: Re: [PATCH v5 rtw-next 1/7] wifi: rtw88: move the shared 88xxa init
 helpers into the core
To: "Bitterblue Smith" <rtl8821cerfe2@gmail.com>, "Ping-Ke Shih"
 <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, "Michael
 Straube" <straube.linux@gmail.com>, "Peter Robinson"
 <pbrobinson@gmail.com>, luka.gejak@linux.dev
In-Reply-To: <17f1504d-4a27-48f1-9c8e-e84a3416c383@gmail.com>
References: <20260930091604.52891-1-luka.gejak@linux.dev>
 <20260930091604.52891-2-luka.gejak@linux.dev>
 <17f1504d-4a27-48f1-9c8e-e84a3416c383@gmail.com>

September 30, 2026 at 20:04, "Bitterblue Smith" <rtl8821cerfe2@gmail.com =
mailto:rtl8821cerfe2@gmail.com?to=3D%22Bitterblue%20Smith%22%20%3Crtl8821=
cerfe2%40gmail.com%3E > wrote:


>=20
>=20On 30/09/2026 12:15, Luka Gejak wrote:
>=20
>=20>=20
>=20> The adaptive control, EDCA and CCK power detect helpers in rtw88xxa=
.c
[...]
> >  @@ -1419,3 +1419,25 @@ int rtw_mac_postinit(struct rtw_dev *rtwdev)
> >=20=20
>=20>  return chip->ops->mac_postinit(rtwdev);
> >  }
> >  +
> >  +void rtw_mac_init_adaptive_ctrl(struct rtw_dev *rtwdev)
> >  +{
> >  + rtw_write32_mask(rtwdev, REG_RRSR, 0xfffff, 0xffff1);
> >  + rtw_write16(rtwdev, REG_RETRY_LIMIT, 0x3030);
> >  +}
> >  +EXPORT_SYMBOL(rtw_mac_init_adaptive_ctrl);
> >  +
> >  +void rtw_mac_init_edca(struct rtw_dev *rtwdev)
> >  +{
> >  + rtw_write16(rtwdev, REG_SPEC_SIFS, 0x100a);
> >  + rtw_write16(rtwdev, REG_MAC_SPEC_SIFS, 0x100a);
> >  +
> >  + rtw_write16(rtwdev, REG_SIFS, 0x100a);
> >  + rtw_write16(rtwdev, REG_SIFS + 2, 0x100a);
> >  +
> >  + rtw_write32(rtwdev, REG_EDCA_BE_PARAM, 0x005EA42B);
> >  + rtw_write32(rtwdev, REG_EDCA_BK_PARAM, 0x0000A44F);
> >  + rtw_write32(rtwdev, REG_EDCA_VI_PARAM, 0x005EA324);
> >  + rtw_write32(rtwdev, REG_EDCA_VO_PARAM, 0x002FA226);
> >  +}
> >  +EXPORT_SYMBOL(rtw_mac_init_edca);
> >=20
>=20No one said anything about moving these functions. Please put them ba=
ck.
>=20

They=20came from Ping-Ke's review of the chip driver, where he asked
whether the chip can reuse the existing code since the values are the
same. Moving the identical writes to mac.c was the answer to that, and
it also removed the last reason for RTW88_8723B to select RTW88_88XXA.

I will put them back per your request. The chip driver writes those two
again, as it did in v4.

Best regards,
Luka Gejak
