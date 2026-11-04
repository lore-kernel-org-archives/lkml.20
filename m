Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793795225;
	b=cnkrVrvbhWggvglJFZhbOrtej9fvVqEYQwXuothr6FqKpT+oeFEBLifV6nX/LSLRdHrR
	 HOw/vOOZCj3sLN+H/KWeMWKM5TAqCvyodIWaEkX1roP43OFSvLv9Q+gLj6kLK1imD7mvB
	 Un2V86PVGyrrrFPIdXciJJRm/P7zoFcL7FeHmOpiToq1gIPbghjrJidHHnmEyvtsUIYIr
	 iY+4ryJ6K81kevxTERXSt9Rv2ZvBXp1PjITeiRXMVNV3CKnRJUmw7vIzy/j5DixIN5Mux
	 +KfXpHF4NyX8hkThtSua9ulzCzVt+pE0YoNwhG/3Hv9MFrs0eRGYPfiZqVjxStSpc4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793795225;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=+ICv6jUGNVX118Xnl5o38aHDRTyW16gGzo7Q2AcNNu8=;
	b=ZThVebxPhHJG9dhwG5LGGFQego7EASBt/euylADAJoaBx61K9wacDfpoFzJpFtg0raKv
	 6gFt+rML8MQc6PG5L55nLvsPS7LmrW25t9MdD6GYNZQoQCRi2ijnzX/d5JKx7F6wNMnCG
	 Tmn4I0M84uk/wnr/Lfqq6BpXnUsJGDOaz2FqyFDCCrzlKccd6cX6jvy+5/cTG5j2ef5Iz
	 sRxOD7npTNZGi/zVkMqM3MppBOiQluHmqU9jRhUshDLX1RQkij4OL+69GM9wV+DZ2uJ7q
	 92GezhdPzSB+5HqukI5Xuj0zYUgsq9z7VNQ0Gw6yYk+ks6wQMSYn2vNjb/+XsJFxIFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P8vNTmzJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2DF606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 12:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P8vNTmzJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1BEC1F00A02
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 12:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793795224;
	bh=+ICv6jUGNVX118Xnl5o38aHDRTyW16gGzo7Q2AcNNu8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=P8vNTmzJRIMd2E7IL1WvPwQv9VKNfJxnrQ89FTHrmdbP1iMwJqZV6PqxBmKHiNDWM
	 RDBGMW/hy2wFHcWPlP7gxBAqKM1vACEz9eUcTy/QowTS2wAlX9VSE7BJBI2udCehO7
	 jqY57xbhHPoa+QRMUrFv50y05VvvXbFgvbewlk6GiUerrS74FWpf4hSc/91UTpKOHB
	 4DyikYHz5S/NGKyrGhVLwjOu4ihOBslcfbBYNvs1FjVVLREjYQGoS6G8zCCP2j6XVh
	 Asl7qTvp2x4f3PTJ+cBngjBp9bx17QeArvc3oNsRdy7jmGPTpPxQ+YWHScmGZ82CPK
	 PwwsJwdsgQkXg==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5bcb440d1cbso389517e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 04:27:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxSvQSBhL7HmtdGNZmj3SayE55t9w1LWDdZ+8RRdFKmxVqYst1bbkCa1G0qFQb4qF0902HLP47QDPFoYTk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+FjjTKSOYELd+Nry8NI3PEdkfbFq+AZMY9BKmwxXC+vs6YW3OD
	axI0dg9V/CmYaAp898aj6MtXE2vCA3hRDHc7gvic5obu6a/pT0YSs167AV8yDjjr1bxUWBmOzvz
	JOj66IcaayUssndzkk/pAgejIoDFNqWs=
X-Received: by 2002:a05:6512:b07:b0:5bf:d4d7:a3cc with SMTP id
 2adb3069b0e04-5bfd4d7a563mr5048747e87.9.1793795223437; Wed, 04 Nov 2026
 04:27:03 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261005060641.32674-1-saadanjum239@gmail.com>
In-Reply-To: <20261005060641.32674-1-saadanjum239@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 4 Nov 2026 13:26:50 +0100
X-Gmail-Original-Message-ID: <CAD++jLkufRNvPrL+Fxd1mp41h1mcJ4sr8kBiMzpkF9PO5FM+Zw@mail.gmail.com>
X-Gm-Features: AclHuK8Ek2fH6rtSpITcfvraWZLhUk2KRiyUzvkvumhGGx1AWYNctAZyF_WLCpA
Message-ID: <CAD++jLkufRNvPrL+Fxd1mp41h1mcJ4sr8kBiMzpkF9PO5FM+Zw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: common-v2: Fix of_iomap() error check
To: Saad Anjum <saadanjum239@gmail.com>
Cc: Sean Wang <sean.wang@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Hao Chang <ot_chhao.chang@mediatek.com>, 
	Qingliang Li <qingliang.li@mediatek.com>, linux-gpio@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 5, 2026 at 8:06=E2=80=AFAM Saad Anjum <saadanjum239@gmail.com> =
wrote:

> of_iomap() returns NULL on failure, never an error pointer, so the
> IS_ERR() check in mtk_build_eint() can never be true. The check was
> carried over from the previous devm_platform_ioremap_resource_byname()
> call, which does return an error pointer, when the EINT registers were
> switched to being mapped with of_iomap() to support multiple bases.
>
> If mapping one of the EINT register ranges fails, for example because
> the device tree node lists more "reg-names" than "reg" entries so that
> of_address_to_resource() fails, or because ioremap() itself fails, the
> NULL pointer is stored in hw->eint->base[] and probing continues.
> mtk_eint_do_init() then calls mtk_eint_hw_init(), which writes to
> eint->base[i] + regs->dom_en, causing a NULL pointer dereference
> instead of a clean probe failure.
>
> Check for NULL and return -ENOMEM instead. The existing error path
> already skips NULL entries when unmapping, so any ranges mapped before
> the failure are still released.
>
> Fixes: 3ef9f710efcb ("pinctrl: mediatek: Add EINT support for multiple ad=
dresses")
> Signed-off-by: Saad Anjum <saadanjum239@gmail.com>

Patch applied.

Yours,
Linus Walleij
