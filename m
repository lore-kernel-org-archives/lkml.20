Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.25
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794469634;
	b=bMK7rqNN4+4KCBCu1Dqs0ur77FVwmM/vwPJc92+ahCxt/GvvmUNm0qAWXUSo1xUn4EEG
	 9gP23NMQHL6HyGCOd0EGtMS8LAyLNxfp8CodMpqlWJ2COQqI/1tJsNlNpcODvdCWo0qce
	 TX4cXsiU94FZPZcXQpmCSUQMbShTkJfw657zijp3J39bFWa716+ANUUWGs5pLrXrlWfpV
	 zG5W8l1tw1Cz2HPVFYa1Bs2PiWEITF4N78x4aX34DX/ndZcakMCuOLLLUwvVNopUen1jv
	 q/W0clc5Xonkg6hSa+3SX9fADyO+AlcMq20L6obsAnd1XLKNr2wNVWyr2i7EbdiAumA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794469634;
	h=DMARC-Filter:Received:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:User-Agent:
	 MIME-Version:X-CM-TRANSID:X-Coremail-Antispam:X-Originating-IP:
	 X-CM-SenderInfo;
	bh=hciMpB2iBrxlKUun8+GSgfggA+6I78t3UIYB2K91dNo=;
	b=XglPo+kc5nKhlu5JNsw66wqBkoFd+wngeQAHn0NeZC04gl9nKrhX617IWLr/D9efcyxA
	 rAtSgu7iKh+Xk+CJ6YveEgy0my6WYPiktt7iHBlMPPw25jigDQHUNzIaXfpPE6nfit2sb
	 uQYaIu+82KDdo9kgWZnDecnv/fjNS83jdk9b3eexluQ2cjERnNXZQJy308qvFoaoPt0Ya
	 9n7//kMutuqBnDbEI29GR/vO3eSBr7Oo7yoiJBVUYP8CW/ciq53+GyKaGtbQBbbHjjvJy
	 gZ/aoLiYlCSBBBg1afe5GrJq+dieSVovZ2VtSPuukCRMukkvEZYCAp/O5hVQYgw8lQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.25
Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53206606A323
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:47:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53206606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.100.116])
	by APP-05 (Coremail) with SMTP id zQCowABX8rfwbvVqFLL0AA--.21672S2;
	Thu, 12 Nov 2026 15:46:58 +0800 (CST)
Message-ID: <b0ee28fe2a00001e4f9dcdb6239a1cafcf5e17cd.camel@iscas.ac.cn>
Subject: Re: [PATCH v2 0/4] drm/verisilicon: misc fixes
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
	 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Joey Lu
 <a0987203069@gmail.com>, Han Gao <gaohan@iscas.ac.cn>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Thu, 12 Nov 2026 15:46:56 +0800
In-Reply-To: <20261102075710.1286456-1-zhengxingda@iscas.ac.cn>
References: <20261102075710.1286456-1-zhengxingda@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-CM-TRANSID:zQCowABX8rfwbvVqFLL0AA--.21672S2
X-Coremail-Antispam: 1UD129KBjvdXoW7JF48JrWUtr1rtFy3KF4kWFg_yoWkurb_CF
	yDuFZruw15ua95Xa1UGrs2qFZFkFsF9FWrZrW8Cw43JrnrJr15JF4DWrs3Zw1UWF4UtFs5
	Gws7Gr4fZrsxJjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbIAYjsxI4VW3JwAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
	8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0
	cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z2
	80aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAK
	zVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx
	8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7MxkF
	7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI
	8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AK
	xVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI
	8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280
	aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyT
	uYvjxU2X_-DUUUU
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/

=E5=9C=A8 2026-11-02=E4=B8=80=E7=9A=84 15:57 +0800=EF=BC=8CIcenowy Zheng=E5=
=86=99=E9=81=93=EF=BC=9A
> This patchset fixes several problems. The first one fixes a bug when
> the
> firmware did a modeset with different mode than the one picked by
> Linux,
> and others are fixing problems pointed by Sashiko.
>=20
> The fixes of atomic_disble NULL dereference is proven to be worse
> than
> the original, and considering Sashiko points out that clearing FB_EN
> would prevent showing bound-but-invisible planes, this part of fix is
> redone.

Ping.

Could anyone try to do some review on this patchset?

Thanks,
Icenowy

>=20
> Icenowy Zheng (3):
> =C2=A0 drm/verisilicon: disable the output before enabling it
> =C2=A0 drm/verisilicon: nuke planes' atomic_enable hooks
> =C2=A0 drm/verisilicon: check old state CRTC in plane atomic_disable
>=20
> Joey Lu (1):
> =C2=A0 drm/verisilicon: fix DC8200 primary plane disable clearing FB_EN
>=20
> =C2=A0drivers/gpu/drm/verisilicon/vs_bridge.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 8 ++++
> =C2=A0drivers/gpu/drm/verisilicon/vs_cursor_plane.c | 35 ++++++---------
> =C2=A0.../gpu/drm/verisilicon/vs_primary_plane.c=C2=A0=C2=A0=C2=A0 | 43 +=
+++++++---------
> --
> =C2=A03 files changed, 40 insertions(+), 46 deletions(-)

