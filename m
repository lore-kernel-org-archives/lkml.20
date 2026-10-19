Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792451559;
	b=RLjAywTLmrv41okr3c6PTGQ5Yu3A502FJgdyCCm8LMc9dzWrlOzoU8FkgYnGaTg05xfp
	 KzJ2cWuR/wMYMXSM9kvUrLBND674qG3Ef9swhup1xT1XxlCalAVKnhf4h3ro/NqmoH1v7
	 UoEmlAG8lJaNtUA1vCGeBmslKCV8oNmsql444k7a8555xzK/MResgboSsY4o1bVWEwuCx
	 7686cpTDRU9nTUZj5lDWXPEJ7t6Zxs7Sa/9WMGDXJ41MSNcrMkI6HhaqEFL/G/aopk9t4
	 JKadBXqNy0KRQxod0l2aJZDRe3EqK8Q4mjpQGVZnr2MXxJG7HXxJIb+qn/W/sHypBXQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792451559;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Sbyeg0eCrCPYafk0IrpKxi7/8K1TfJs6Osh4YuxfEaM=;
	b=Ro1wR5+zaG1nsLw4oNzEhBDSiz6RBkwVTtkjaB6g/iJmcqDEwhj/KZa4o/wi0mLlsbRC
	 VG02JzPFJ3BY+qegtbpF2AtZd7zZS34l3sriuGL28AL5a4RHF8IG4XTz0jiAPSNVW02n8
	 EbEru0ErhWL58QiMvlobza4teEf39k6D8sEotrImNHOD2DfAPJo7/Xtu9YVFzIJenT4I0
	 OBV7xT28PW8+gyAHyqkHQAfnbCE68IeDsKnP0isvd2hrHqdgxaRASouBPr06Vny1VmacR
	 vVyud1510daosGfPOSaLp2Bzk0IaQhMxVSGL5cHOoqSu1lNuYv024396MWEBjIS0tcA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=reEuDfUw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.54
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 730AA606A328
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 23:12:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 730AA606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=reEuDfUw
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5be4c78e8caso2237611e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 16:12:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792451557; cv=none;
        d=google.com; s=arc-20260327;
        b=efvFIsm17OiwmGynt+akeSqhlVqgpLPbUaPxHR30qtxBehe4Zj/VusBHFIlG9A9fBV
         sFk4QfWBBqR6XOO1/Stb5Is9QLh5SJ8VlDThVYLDHw2sj4R92Ixzy4Pqnr7QhuXfLvLk
         iFL+o/QRJ9K/481DvOZBlznV2cKwO8VSviNgNq1RpC0PzL6LeNe95vnVz2nDOKXt3aww
         z7/77huent50DMEZSHz1tlICR7fmKRQrjugitW+eHD5yqFwxWpbJCs3my/g2t9PPXT9A
         05ejOcwNeVMRmxIoa4t5ZPQNV4YgjFzfFd6HchkvNu9o2ipxXwU0TXYXAJLGpwJCpvKm
         s4Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Sbyeg0eCrCPYafk0IrpKxi7/8K1TfJs6Osh4YuxfEaM=;
        fh=jzP6XXM+ZrsUmfooJtoFibjxXzbbbkcar36tMfWGZAg=;
        b=MlydX6T09l1UFC77vyRRa5bRsnv/8gDhas7Xy1G0aYkBv/49o75o7PR9M8WtA6wVGo
         J70zKhLl3zWBBN8rcWPD9sIxOohi1A5S9GA9maNL/R29yC52/5zhBGcQJ6QiY90S6Yxs
         cXG19iq425Dk0jgLa2H9CLqcM3pgvXa5FJ0Jdz0ZIlYNDhBrGrDgvP8e86hKu4dNSFi5
         GN7I9VRPjBNYPGeUXxYOwMvHQdijnQ+sSNcwx2iMaQfN3oKd4ImvvqaxF1HooxnvyH0y
         Wv0HRuLXE/esM1zC2iYWpI91eI5uGRWOZ/fV5jK63q3JFjr9vJXm0dWAIbVNNPWoicaK
         Eo/w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792451557; x=1793056357; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Sbyeg0eCrCPYafk0IrpKxi7/8K1TfJs6Osh4YuxfEaM=;
        b=reEuDfUwbnAEKkW57N+I/RTrYm+F8/K5nES2zLeuZDM2Ltbjtp07G6CGpWv/N+52ro
         IJTpq/qjsXVPtc6J2Fhlc7F7KIIA5vxVJV/LEo2U0s3TOyRVYxKZnIIkSgsjJcrI+bbK
         WHK4ojg46O9K/7TQSGCWSVNOV1v+LKgvXa2an97ONQ14rA3NwTo6uUJl1C5ucy9ATECR
         Pw1BlqFTnXzRH+VqJctAXvgvtifV3io3pD9a565yZW48dg4z2J2fFSNyHyKUhfLMEIOD
         ljQeroODXcrVMCeUx+fttMhUkJqYBOdZghBsVugg2Ty1bQqBxYhW5uuqHGZha+COgN71
         qIjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792451557; x=1793056357;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sbyeg0eCrCPYafk0IrpKxi7/8K1TfJs6Osh4YuxfEaM=;
        b=naMQnYgixlDCCJthohRydiQwLIY7oIUUzf/nuyKTe8QXu/5JE7O/fG1RSDxK/xul/K
         4LfCYounjiCTYywoNrz/ywD2EehMnMZ5TxDmolVjG/2zdR7ntFKKYeouWSTT4S/7Ji81
         2ULdvpOOyTavf6Jn9X0ndGe+l7WneilBFPfNeIXvSOuaWLDtTVnoWcBLkI6xYckUuY7x
         QB4PluroHpvM/V/UODvrlTizYu3p1XIMSH5SZ3jmf6n3pGnnfxGSmbrdsVt01ZKfHQsE
         M1tJYYcq3p6vcJSRhZeQneGBFWcCsXhekQySQfuayTFYrfVNlVwhgxMtfVkFaZTiekuH
         /jCg==
X-Forwarded-Encrypted: i=1; AKwUvBwDCCGm9MYaujbEa9leYcBO2zsS+adkhwsBVvZYvaHUo2F5OlQ2IXHkzcqWvOyvxpIJ7a9zhzw67soJWOc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKPZGtE1zz5p/yX3oCoP26UppuIajCAj+MXoZuTbVbl62uZxX02
	HobFONOsFHQ5U9Gf5cCOHb0KCo0VnoRNKHWJTtviee/K08iImQ41uUSs4j3jvGiesY8SIa8JwIZ
	mpuWjBAOboZVvXkDxftosFRf39d5aXD8=
X-Gm-Gg: AYBFou3izfY0Uxagjz5oGBPIU76rqLmPbYrwB6NkUGCV0SeFIU0j0+3k/N0iVrFsSQU
	m28OYg0OYGHeRJK9TrHZZLcbQQEYfZzotzh5/EIBHHfz6lPapWIPCTfPVFttdbTOFAKN0w6zU49
	XXy+JGKO2dGVHJY6mGI4z95AtPZ9hdBnvsI4/f+y/hvdY0MhpTbrNmTYEAjgew1vYcWeOesSgII
	yjm5aWCipkPj3OFMYuqTrPzj/vCb5iFstyP4SlOembWcuRP4kKZs5QuLFf4c9sRDKiYgpXii3WN
	hAw+11KazjEMtXGaXjwwvmm+0VgdntsQKTuJZkff79/XzC8U4s6QxoRAJE3/qeUn09hpH22lO0q
	wT6BZS/uNDgh9tdO45a4Z0mr8Ka+tFHbg61zLsWqAZQ/A
X-Received: by 2002:a05:6512:32cb:b0:5be:559d:97d3 with SMTP id
 2adb3069b0e04-5be559d9e2bmr2279941e87.25.1792451557299; Mon, 19 Oct 2026
 16:12:37 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019-b4-imx937-frdm-scmi-pinctrl-v1-1-0576fb20964b@oss.nxp.com>
In-Reply-To: <20261019-b4-imx937-frdm-scmi-pinctrl-v1-1-0576fb20964b@oss.nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 19 Oct 2026 20:12:26 -0300
X-Gm-Features: AclHuK_sIDCnoT7p4C2M3ArcMmF6PmO_wm6FePSRnR_5IzyNWFoOjbw4PWCxo2c
Message-ID: <CAOMZO5D1XDc7C6H9jYTtpiPah3DnQxJz35t+3k0--a072KsMuA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: imx: Use of_device_id match table for per-SoC data
To: joy.zou@oss.nxp.com
Cc: Peng Fan <peng.fan@nxp.com>, Dong Aisheng <aisheng.dong@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Jacky Bai <ping.bai@nxp.com>, Ye Li <ye.li@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, Linus Walleij <linusw@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Joy Zou <joy.zou@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 8:05=E2=80=AFAM <joy.zou@oss.nxp.com> wrote:

> +       if (!pmx->data) {
> +               dev_err(pctldev->dev, "platform does not support scmi pin=
ctrl\n");
> +               return -EINVAL;

This NULL check seems redundant as pmx->data has already been NULL
checked in probe().

> +       pmx->data =3D of_machine_get_match_data(scmi_pinctrl_imx_data);
> +       if (!pmx->data)
> +               return -ENODEV;

Can this be NULL? If there is no match, the driver would not be probed.
