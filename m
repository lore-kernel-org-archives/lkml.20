Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794841884;
	b=pdGsehHAyLUR5lnPJnKquMLNKO7YWWtM95z0kqmWzfujanDYfMHSeQ4b30HTO62gokeA
	 mewVHCXjq+xb4pa7v9MrAOdjG7oZ4hnNsqSXWU6aLHkzPAo2/38Jd08UsUCOPjsHw2g1K
	 xTkWQpOEsuW9avANnWuKkXj+6LEbwdpSdW3Vnv/+7y7o8yE/vNPaH1XlmnwMKEiKr+BDf
	 R93FFRj8RmKsKlvR17NFV8ZJwdQYC6TvAssP+PwV7CvBWxU44Fr9vEKoxfFYwb0d/78Ns
	 QSzbndTYKdlEUmZt9dg9Xi9oWPZCO/SA0xL9bqtGFBnEZexWWpbymMMfImmZzxq9qUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794841884;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=NFaRubGQ2uSM82AzOw+nsHIeODCdYiKnFpnw0Wrcf/c=;
	b=AKDxOUd0RMtbeQ2oL1VmGZ1Qz733Qg9EIFAPWB+lEgd/iQa1GnSYEoP5AcN7KoUkVB/X
	 0833BmnPsb8fftAEnxJg/oF+eu9PGrp6Pig6RCDJgRvlxP9JABtyfqQcRaJrCH/RFLAeY
	 pIgfIU6shLbWZV9k/hNHM9pWhYVrV+2uHFvdNmkqZJPxb1nhUfDSorVYJGdX0ebohHxrs
	 GBe5LvMz63u5w9cmt0BKS/y5q00t23HWu0D4K0pwwFAuzENCV3ryi0XTj7HqNlCPuoJBu
	 JO22HmbSq84DhkNXQPzH3JQOEShfvtbYMcuu8apFHi1ujkUAWxmYa+3cq/aoR73hxMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JdFXYXi0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B632606A330
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JdFXYXi0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4AF71F000C8
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794841883;
	bh=NFaRubGQ2uSM82AzOw+nsHIeODCdYiKnFpnw0Wrcf/c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=JdFXYXi0sztEjaW0m29nlrJdi9t2WrR8uv3y83FxfqQx/yVCZfOBLIdKv7hPG/903
	 TTRzbw1hTVkIFQWTDBpUSkupm7eW6t/ahEultY759TMx444M05wpcJLkWObh6ryWQ8
	 VkqX8noN1+2uYk0ET8OuVKjjNwD1bYTh9sEL26m/uBsfExN+kyBZXetFYJJZ/9Rvwn
	 vIvaeRl2JvgbGBPCErKH5LN0fF1IT+xmWocjpNlLF999YxihcGGmw4prYDbtSmVPTD
	 CnqQ+AIgUSEbxAyEBhRRY5qSUGxYbCyJ3YowiQGPUCVrQ3/2bDksSbYxBjIbGp/ebM
	 j81/uLJoR5iIw==
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso4368082c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:11:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErE1ObPczoCOvLPXQITA2w2mdmR6g+D3FheOJq1MYEf7MJxM9+QvD+aKIWhxsvqowVSZ1VCludamQoaewzo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/C6UU5C4xwgBBJMinuDAn2O8ybPYJklrg4TzIdxvxcysxEnn09
	I1hjBB5ch9FUFHkBx8Z/Xiypeh8eO0M+GNc7lSj6rMamRbAyPweQUvXAtzwepvnP5Yq7RFpGhd/
	TALXubqnOxUZJ4yXoOF4yLLuYqwzVsA==
X-Received: by 2002:a05:7022:ea24:b0:1a9:e382:cedc with SMTP id
 a92af1059eb24-1b5030fb905mr11645158c88.46.1794841883321; Mon, 16 Nov 2026
 07:11:23 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260924083456.461815-1-peng.fan@oss.nxp.com> <57deb2ae1a6235e9e0b84458ee228b1ce8ed418a.camel@mediatek.com>
In-Reply-To: <57deb2ae1a6235e9e0b84458ee228b1ce8ed418a.camel@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 16 Nov 2026 15:11:10 +0000
X-Gmail-Original-Message-ID: <CAAOTY_8Kuqod1ahnK4enW_qtUcTo6mhZdQiUnsO4tr3YW+7erw@mail.gmail.com>
X-Gm-Features: AclHuK87v-swgB4tyftV1cjviFzSnuNyxXDhT4UWABAFzKQ_MREyYceQWgdsnHc
Message-ID: <CAAOTY_8Kuqod1ahnK4enW_qtUcTo6mhZdQiUnsO4tr3YW+7erw@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: hdmi: use regmap_assign_bits() for
 conditional set/clear
To: =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
Cc: "peng.fan@oss.nxp.com" <peng.fan@oss.nxp.com>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, 
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"airlied@gmail.com" <airlied@gmail.com>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, 
	"simona@ffwll.ch" <simona@ffwll.ch>, "peng.fan@nxp.com" <peng.fan@nxp.com>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

CK Hu (=E8=83=A1=E4=BF=8A=E5=85=89) <ck.hu@mediatek.com> =E6=96=BC 2026=E5=
=B9=B410=E6=9C=8812=E6=97=A5=E9=80=B1=E4=B8=80 =E4=B8=8A=E5=8D=887:34=E5=AF=
=AB=E9=81=93=EF=BC=9A
>
> On Thu, 2026-09-24 at 16:34 +0800, Peng Fan (OSS) wrote:
> > From: Peng Fan <peng.fan@nxp.com>
> >
> > Replace multiple if/else blocks using regmap_set_bits()/regmap_clear_bi=
ts()
> > with the simpler regmap_assign_bits() calls throughout the HDMI v2 driv=
er.
>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
>
> >
> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > ---
