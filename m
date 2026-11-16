Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794839588;
	b=v5ZZ7wiUhM5/G1Xmazg3RccYfJSIwcFTt9HPdvfEvZe0x/GgpI4i47hCe7zkuK/mgRF4
	 Vg3jwrSFrXB4boZZ9RbqoI/UiUJ7fhV73/46x8patFp+tpCgSkA9+kUCjkO0Yjf+ianAR
	 Pb5tOpU5xk7vQf1Rb4bmKPC6PRZDTyow9AJjllBWLArZinL8iD9IH3DYD5jQUICaULefH
	 uqeVwtzE0pf+kmc/lYTMSfSyXcoLnFuPn7wUql+wqsf8rSmtAWB+j+dx1/L7e42l9JNVs
	 QQjoGLnpR/+073xwO0TUrsNfthfSFGWGO4J2CNsab9xKmIy70/RIdHWDgdCil8WvZ7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794839588;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=bY381tBpZ0JDNechNv9i/NECgodmDi16DU0CcXmzrM0=;
	b=p3LZXeUWrzh4TJTbgCsz0e8rvkvkVcHQEKP+tj8HGTJpzO9mJ8hKaCUn6kHKb9tHtUUr
	 CH2NFNvZtUyaNmLJ2qKoa4y1TBWqpG443HUCW2tZUNlYTpj5FP45yCqkYULfNIfUOYIgA
	 iIMNdVRFevT0vanOjse38Y7uQe5FID5KIFgyO4K0dwh2QivA+7WYwsgB2KWRCBXYitiZO
	 vG6o1FJZc7BJCscROJf1xpgkeM7+V5YhhS16g7Uio0R/QZAn8u/MoAI5St6+97TiTRwsA
	 jrKsfb81xuM2xmJ/F6V/0CrTU7bwnA6tbzhA2ga4bXmNu5czRFHqgx/uVobfvdyqa5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QPyXr6w1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC9C606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QPyXr6w1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 965961F000CE
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794839588;
	bh=bY381tBpZ0JDNechNv9i/NECgodmDi16DU0CcXmzrM0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=QPyXr6w1dQ/89QeuFQ1KjnpFQ6Li+1rotUlAJIR6EV7qx49t+IRSpNEpHFSIDibg8
	 lNYJQPhgvl5tG8VasH57evNHHgH1q/XodLOMAdXhbQ79whp0QdwDvgeapGmfzsRooV
	 EyVO9AunbAWq0px/ZqGclYIsC8pacu4WUl7Fmq3r5xadAiLzX22FFdafvu0peKSdB0
	 gN2CNk9ku+envrFidvHsh7k0ppZ2mjZgtuILLbN4fcypIsJWHVcy1Y4DZSMDr5HpJU
	 +XMiDVtcXZk3CHnbE9AzK21Q0FKQYKbPJgfy1Uu8GIFO00VDLTZs+ufdNzDJMUVd53
	 p/mEO2k92wymA==
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1b3acec6677so4857992c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:33:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEVWWWnodFBm0Wzs2FKFaR9BHdE2vV/ht8lUcwrM0OqqVBGIxVqcAJOJW9q7b2hUwwCnL75azTEZdu2y88=@vger.kernel.org
X-Gm-Message-State: APuU4Z+wEdQ5flRhCZqfNh1OR2tkXfqRF/Tv++W3nn1LAKoieai62Auq
	Tgf0CrLAXQSLzJgfnFTbfxjWLNM9q0Zwvx4gkm3g8E9htUzAlCPJEYXO0RckILg1PgebQgshDRL
	34XyWRgzMW4K99YwhQWhcrXxle/ke2w==
X-Received: by 2002:a05:701b:2706:b0:1a4:c892:b14f with SMTP id
 a92af1059eb24-1b50312144fmr9904001c88.29.1794839587963; Mon, 16 Nov 2026
 06:33:07 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261004-rbrue-suez-upstreaming-mtk-dsi-cmd-mode-v1-1-53a4f46ca489@gmail.com>
 <8c8ff7e2-d1a4-45c8-aacf-bca93439a32d@gmail.com> <524b9675fd10d0d21880821c10a4f0e188d24956.camel@mediatek.com>
In-Reply-To: <524b9675fd10d0d21880821c10a4f0e188d24956.camel@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 16 Nov 2026 14:32:52 +0000
X-Gmail-Original-Message-ID: <CAAOTY__vpA+t+T5QM1J1pkcFYju5HjQ+MnwNt-60Gh_0wbTzzA@mail.gmail.com>
X-Gm-Features: AclHuK83NHlxO1R39k_ekBxI8gtiR3r3nltG-X9iF9NvNtWqqPTHxKvu6MAR4l4
Message-ID: <CAAOTY__vpA+t+T5QM1J1pkcFYju5HjQ+MnwNt-60Gh_0wbTzzA@mail.gmail.com>
Subject: Re: [PATCH RESEND] drm/mediatek: dsi: force command mode in mtk_dsi_poweron()
To: =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
Cc: "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "ryanbrue.dev@gmail.com" <ryanbrue.dev@gmail.com>, 
	"airlied@gmail.com" <airlied@gmail.com>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, 
	"simona@ffwll.ch" <simona@ffwll.ch>, 
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
=B9=B411=E6=9C=8811=E6=97=A5=E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=882:43=E5=AF=
=AB=E9=81=93=EF=BC=9A
>
> On Tue, 2026-11-10 at 20:26 -0600, Ryan Brue wrote:
> > External email : Please do not click links or open attachments until yo=
u have verified the sender or the content.
> >
> >
> > Hi Chun-Kuang,
> >
> > Gentle ping on this one for mediatek-drm-next now that 7.4-rc1 is out.
> > It has CK's Reviewed-by and Roman's Acked-by, and it still applies
> > cleanly to v7.4-rc2 and mediatek-drm-next. I can resend it with the tag=
s
> > if that's easier.
>
> Hi, I'm Chun-Kuang [1].
> It's not necessary to resend.
> I would apply this patch later.
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/co=
mmit/?id=3D93e97f715b24114169d18654e09c646fd9e14979
>
> Chun-Kuang.
>
> >
> > Thanks,
> > Ryan Brue
> >
>
