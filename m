Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.228.71
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793269405;
	b=z50fXqBikwIWxX56gs951HPL9Uw15FyCofES+wWutjRQH+Z8nGxjGltR6/F0yPobC3qA
	 6Da/JOaR8J1fnWJYVpYmNOpFwcGGL1vE/ZuWpFhQnlWX4GtfhLE2mhWwmjsBp2FawSaaX
	 Y635Vgo22fsB8v6lTgK03QrlGvHqMuQrHa77zoy/j2PifCJchgff5YcHwn5jQ+mXfxhNB
	 l0kAXNQQ8Mh5kdCTExCKzlYtWXo6848u4UBEghGu/xyACWSsmjnCJYFcTRUo8gtp5Rikm
	 qsK+IE6mLB5pdlHHLPYGqijNPMoZrtOcmrxEqQ7jnq0acUxWpvsCQv8izIvMWOZEPOA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793269405;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=BA+kSJSuqF0Tp/mjbmAU8rE7i18xLMiTHg0IlzoVm5Y=;
	b=DuKQ4o0LPBPt0lpADhqbVV9/PUBui76L0QOyvRC7cppqubt8WL7k/MfXCu/mRYWTJQB5
	 yorF3zH/7nO7Fq6eK192g6Ok23u0HjhUjif/F/wn+/d0od1CGM2ph9YdMu4c7tPPmjk+5
	 8ZhyzfjwsNUjidC1uc58pJMcL3cMK2V7ENx1G0NJCXyuWjg+6V6PR78UAAgT5sHKKnCm1
	 ZPahIZEHSXJZn8Hrukt7tbVHTFcM3vJqGdQdsnRym7BXxc4egPZ0j4OURUfMVmVOIl8md
	 gcUrEEbVuHk3G/O0fdu2t2uxTTJQYSbDVtKIAbRQiZwGyyZTDruxV3rzjXjSs/W/ezQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="WK6/y+1W";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.228.71
Received: from mail-ed2-f7.google.com (mail-ed2-f7.google.com [74.125.228.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6161D606A32C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:23:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6161D606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WK6/y+1W
Received: by mail-ed2-f7.google.com with SMTP id 4fb4d7f45d1cf-6b1a8d1e6d8so887940a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 03:23:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793269404; cv=none;
        d=google.com; s=arc-20260327;
        b=SVwgcQw8TuMzO10jiA9MnB8x1qRcK/Sm9W2DLrTnqDeNan9QGxaJA6PiGKN7qckKmJ
         lO1M32izdUY7KmPRAGUxVljQ9MUpJDpy5+x+89lVYsE8aNvQIJ9tw7bcmw9ocfqkuZo9
         ltD33ywW3aWtfugTOgpY5/9cKEekHh6YAHLKBYA3aqZ90Ei2XtUVT5YHXMNUj4qq6EyH
         3I6f6Mnq98DbdsQEP8KuCwajyKmHV4DXaojeKp2bGyDwJR/mT8+VM5GzuTBVN+LnzWBN
         q8/9uTuDIbdSlk0j2yjdR6ePo8ifOfCI4BCjdIRtGt9Z8Z7DTWTEDtk8aQa2FHlq0b6E
         4BXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BA+kSJSuqF0Tp/mjbmAU8rE7i18xLMiTHg0IlzoVm5Y=;
        fh=laYxQkYpc5nuU9n6gYLveauZ2CiZy0nL5cutVrxlGmk=;
        b=Vb/Y//DtTRQ40Othn4CUZ+/1st/eb34IjS5i94G8JMF+Yn+DcWi8eTND3OOUtThe8Y
         pMUErZxKtjPURSLLfRcGS4azNKNsGlT+giIU3p0ImMdXnG+RDUuXWstNqPWdkH/NtnqZ
         lZsgey0b2TvNTe5fAZx4onnCJ0QFLE8ibErw72ZTAiGWP4WM0qFS0BrOGjuaL6kJUFRn
         KwTXkyP8fOtQpiAUiQ26LGxAf7Wv4G5U7s00ld4/g6f4ib9KrJblHIa4Q8xu1W3uXfHD
         xuTMmD8v7PRu16Njx3G8iICmgCjaPX9+VdhCjGElTREl5rz3XsUVCyIrHNSwC6/FYSRD
         5IVA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793269404; x=1793874204; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BA+kSJSuqF0Tp/mjbmAU8rE7i18xLMiTHg0IlzoVm5Y=;
        b=WK6/y+1Wz0AXURlsYTqtbMZgqlkEzPB5OmWVXA+pVAi/DAAFgbOASA1bLf6PDFz1XX
         dly3Kb/VlaE4cML+c9e/X+GPm5cjz0Kn2FFZwDYNOou/d7Js37KqyvHMTbJw18N7N2ED
         MZ2oFTyBjsoF1KpTWbn2znRJIPtd2uksw2EqLC9J0GeL5ryM4Md2J78ISM8Up8NhEIBm
         fs8AbogAwVcOeUecN34PoE21O7A3R5At3pvq8asYoTXyt/vF8qzM6qtPHsBFsuyM93o3
         C0f3JcE1S2hqxviECKEnUneKnLGd6XX/KdShGu3W9/4fmPoafghr4goKUVl1ZyuXR0nt
         qrgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793269404; x=1793874204;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BA+kSJSuqF0Tp/mjbmAU8rE7i18xLMiTHg0IlzoVm5Y=;
        b=PyYEsntO73p9/YJZybtQtU2DXZLvH+qXcxH4A/uZ/dX0dfNC/lLRWO3mW/zMfVmFIO
         FCJ4YG2TQ3Hz4o3nM4QUPcH4jswdo3wFuJvtLdoKCGc3JJQBTWP243xNXLjTabdfyrSS
         7+mwBR79L7Vu+A45NhVaZf7I1T7cTemXsGcj2sYqWNHK+rQ/bhlDoKng2T2vY7DRcIzL
         B71fiNF/57BtSJcRhuPncVFD3BY+6JbaIfTyXFmJU/K74MRFEXLMhp3mb9DKcq+G2LBA
         B1KQr1+ZaJHuMyvLg6hHRYkaaqfPxMvQBd3aBhnYaQSN94++gwGjGZqYTjXWP/v4xhMd
         OLEg==
X-Forwarded-Encrypted: i=1; AKwUvBwK0XcpK9PKCB2iqtPA/o9TbVYo996+2wjJq4u/lvY0VKHxhWVkiE9uKdqs6dofMrwDCdWN2lCM01t2anM=@vger.kernel.org
X-Gm-Message-State: AFq9FYK/usZcW4KDBZuv/+QCQ6opKh0aDeD4skO+IIwGaD8nrVoDiTHy
	PBKyytUdbRtuopJJXtmCDGOoLsjS8i0G4zXYuDv/FwBj3LpePZrR/FGP3eE2zlA2zCG2bTBv/t1
	cnxnfbOGrVVp6eXmZsvloyN/RrKzNijg=
X-Gm-Gg: AYBFou18XWNyRzMIi0lrd5Lh/LK9ZlbeURVkrAKaH5oQj2ckVRcSfgx7sfWSRA5eKTz
	aO1o2/+d1ud3QGL+A20kOnrEqQwLZ7gcKQLj+RjAPhs8kucFxDk+tdphwP5nwB8XYpbHrCR9LTo
	+ePe8NQSkJTXY2RAqB3vLp/f95gzmcXfYVWTSqZIQcMOEw7ezExEFBw2wvj309cLF3F9jNzvetf
	Rv7X61BSh/k5njE9A/aJid2uJlvpflIJzLYpxuxURYUEkofCXLXpY+AIYGhIfGW7btq5hBmceTM
	XdC2hzVEuziSN05rHX9FR+7b2oDlGP/NVZZyHS+7TwwaZiOuVwIRCTlFptlostSi6H43kZCwJeR
	4ws3BnGohAjlf2tOH6UA8Cy4Zr9K9WNHOvw/DjUg=
X-Received: by 2002:a17:907:5c1:b0:c44:9a32:b27 with SMTP id
 a640c23a62f3a-c49bdf3efccmr409763966b.25.1793269403495; Thu, 29 Oct 2026
 03:23:23 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029094916.3127193-2-coiaprant@gmail.com> <179326779144.3327.11596356628770174944@kernel.org>
In-Reply-To: <179326779144.3327.11596356628770174944@kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Thu, 29 Oct 2026 18:23:08 +0800
X-Gm-Features: AclHuK8EImYqqF5YHtT2i1-3dqjgRi3f79j4EOfGIpng75DJLEaq2ArfexxeNFU
Message-ID: <CALj3r0hX3Ded4G0KY+f5uhoJzRB4ivW+Sa3R-TeDcq=O6eaGDw@mail.gmail.com>
Subject: Re: [PATCH net] net: pcs: xpcs-rk: limit advertised interfaces
To: netdev-bot+sinfo@kernel.org
Cc: Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<netdev-bot+sinfo@kernel.org> =E4=BA=8E2026=E5=B9=B410=E6=9C=8829=E6=97=A5=
=E5=91=A8=E5=9B=9B 17:56=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.
>
>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by code inspection). If it was triggered please include
>    the symptoms, like the stack trace or error messages.
>
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account. If the series needs another revision for
> other reasons, please include the information in the commit messages
> then.
>
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.

Hi,

Thanks for the check. Replying with the missing information and a
respin that folds a related core fix into the same patch.

How the issue was discovered: this is a known gap previously flagged by
Sashiko review. xpcs_find_compat() only walks desc->compat[] and never
looks at pcs.supported_interfaces, so the mask the glue sets is written
but never consulted by the core. The same review pointed out that the
generic xpcs core fills pcs.supported_interfaces from the compat table,
which for the Synopsys ID includes 1000BASE-X, 2500BASE-X, USXGMII and
the 10G/25G modes. The RK3568 XPCS supports 1000BASE-X, SGMII and
QSGMII in hardware, but does not implement the C73 10G or 2500BASE-X
modes, and the RK3568 MAC side currently only supports SGMII.

The respin fixes both sides in one patch: the glue narrows the mask to
SGMII, and the core respects it in xpcs_find_compat().

Whether it was actually triggered: no, this is theoretical. The
affected Rockchip platform is not present in any released kernel, and
the MAC side forces the phy mode, so phylink start passes the mode
explicitly and does not normally pass an interface outside the mask.
The patch makes the mask the single source of truth for both the core
and the glue.

pw-bot: cr
