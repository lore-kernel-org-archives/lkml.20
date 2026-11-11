Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794413801;
	b=FvWaKnnLyb+sNIZI4nH3XavBv354nGIAstrOOFmDq5x7FxbdGt4jrRKjum6dcVOqFoIR
	 2GCZfXQg9Wed+bDXhM6awH5GJ2g0+k3mg8B95G9bbF//57unBOOdRZql3SyyYEwfSTQcf
	 FIM4+5U/pfaoFxt7TsqWNTi+QzN30mNqbUHkL+Nzp1bu1OoHKnLW5boQAwAE+66gdZDSc
	 1B5q+irdNPVHI9wW76nmeXt+HU9mB/5IF3v3h9MuhwMsRqB2sgrkoUcdtlfrAzOr5MwBM
	 egvTTP7CpfWrmw+vtFT+yuL5v50QjBzSBVDPeBJYizHBSoPzf67zNKyb6/PJx9iySew==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794413801;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=LstdQ1KayOvKvBdXTZ++PJBU/OdNbClhnjMs5/mc9b8=;
	b=j4ZOGxqiVyXyTMwx2n6jWsNYAEfNa4QKn68pKF/DPGTnYxsRfS1QTX8A4KMRjwkDaMhv
	 Xj9Eahxci1rqlp8OSYv7OY16l89PEY2YRRPrcba7KyHjimRwYEqs3iHe6SzgCR1m5CI9e
	 nJmi0QprSxRnXd3CBbBR2HvoIkc4X0A+twKYnqV2SlBSzx4dWPhOw3o5aFe5kgO63/XX0
	 vNmw5B7IRragtvg72qMHNhgJZaJhcCx/mluH3qEMDyOQYki6oSCFJgcT7IpVqq75MnAAp
	 93sSmKOf97mxT24CmkQ+d/DPabDdKsV6uiq3oMu4LEe9torhiU499pR5d3Ld6q1R8Rw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0JxN7fWT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.180
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23FBF606A88F
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:16:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23FBF606A88F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0JxN7fWT
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-5361e313e63so35064811cf.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:16:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794413800; cv=none;
        d=google.com; s=arc-20260327;
        b=YMfz48pO5QplYQw6iDmVFygUTM8OMWctm7xLzIz4GyEhBrtn1XgqOVRQKi0uxwbmKP
         y/JH1bCEmAtEc4tjMZHqZlCZhAz8RO6NLRDr9jGR0N/WEZtN22/AAkidH/24o4WezCAv
         aQgK/h2Je6LtVltc4Qw7JJbVXcDKMVK1bhuI1zI4yBXiIwlc0GqmoQzhzeRlbLEkpAuj
         Vlb61K4IWxAs85mxftSWWRgeKKhwPqSrRVGM/BgNXVFfTAKtgDLfzS1+Z3F1cJ7vGRU0
         KpkvPfMf2CrWpUPp1weg+/CtQYVFcAyew/iBHABVTezpkZzu2QDAQDsYdTCB8aatfvt1
         AQyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LstdQ1KayOvKvBdXTZ++PJBU/OdNbClhnjMs5/mc9b8=;
        fh=jckHtuUSdrku1XKHL6v5QJijzzUuRwbBXXzXVCYrC4A=;
        b=mWsc6r+xvimw6vppPnZa+lIQuxzt7CxJbEz8EDEk13NvOylm6s6y9SmvlR+sph244e
         3tBrng975e2RVEFx4PSKH3wzqnx0lJ1kCvb3c93eON3lLW4bX4fITttgkclCQLEOuDDH
         lRyMfgMoSaUXK7qz24dE/hdNcMWu7Kw8LEkhkIB/uuI6W5ifkltB0ewqV0RgNHix7r0i
         MTm1ub5XogFRoDxy+w9qK7wNq1vTPdS1+lct8AUPIOgscuxCSpjyYsBPPW3XmlheLWF6
         at1/4k+rZzvkUQ2z4LR2t1/AwlWfHAgLinBO8QGgRimLaSLO/xnvHz7w/NYuFIrgg0cF
         XSSw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794413800; x=1795018600; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LstdQ1KayOvKvBdXTZ++PJBU/OdNbClhnjMs5/mc9b8=;
        b=0JxN7fWTeKWIsx7m78aKG+Z2QcLJcr5M6BuEFEQqqNXAgAExJkgaSdP6nqWFybkMEK
         yuydX1NB4Tf8IXzRDDsX9jws7uMFamu0Ga2IM0Ma6FDwXBJgVde8rnnjrkFGDM5x/NCM
         ZwJjId2+BdtRNm9Nr1/R5kcvOC2Ut9vRWNmEc36BlpOuNhxPKSTnNKwzMEsXQeJK4Urv
         ogvZYbHTnZ0ZvOTngleZOddIiislZRdunvX9XufiUZ/L1UIWnQDJmFN8Rk0NPwg5dijb
         Gb/LWn7z4eVYBK9hGTx4yNWCfa7B8MFUOw0fs8KCn9NHyrhJZCOe+CGLVIaZOXKOGEtS
         64Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794413800; x=1795018600;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LstdQ1KayOvKvBdXTZ++PJBU/OdNbClhnjMs5/mc9b8=;
        b=ZUIsbnsuQOTrv6eSbWY5NPK94PEAzxq6rCsk2JEYXRFHCPnfjO8STL10tRoT17gvLv
         q09ZLNpOcJ8G5uuhkf4bceqVnp6qHhNBGuLft22p87SZEHSzKa8141gj6g0z6dSNH/aK
         0nnXjN1EgFb3fPLw84Hr/IXaw9qXBzhF1CXyOADI9n2BRPAKOGSl58L4JnlW1Yt5gqZd
         RjCcbrs9MptTxdTEfAjxi/MZZc8SZD+aSttIJmeG4u0WZuuyzsdT47vH8b1ELSirtJJt
         99a4l36xfYvSVXVKlj1h8T6G63Y31HKYq0t91rt4MbFJ2llIoN5r6rCK3AH2fn8TiDhY
         fLRw==
X-Forwarded-Encrypted: i=1; AL+hErH8rYVN52W/WCm+AkI3ePuXUeShGlp8bSJvgNhQyrczdid8br0Zo/hDPlEkUprWLIffR7Ta/H0fWZ6xSD8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+7iJzvNxTw93q8Tv+uUpUGssHGCgTUaiNZNM3AjN0qGhREcKc5
	xP04EaqLr+e7JdvyOHD9vuCS/sBIINhvcoyj41Q3YTnXtOZnGy92hyl2EKgpZNajHxN2VpaYq9F
	2HXVPe+9CleefCbPYlGzbSJ8qjHwIGLuo5Via6Y8=
X-Gm-Gg: AYBFou2GCzIgS21U4geuAu473nWFLgibV5Z4qmzvggbEhtfvIpextEFUOttlmRVg67C
	lNnEz0x3AXobfnPPUPmLKyoJ8eLS+JRFXz51EYNyIg0egFes4moqblJOBgoUTcvqPTHy2mHYRxg
	ZV4Oo4MZx78w3pLx716lXBiz0R0XCkiC9TdT7bVzmHCAH+jfuXO6IjYptdb9U99SCXvDx4pUrHw
	PJEtYr47P/rdBJbBJcBL6GwM81wwWEWKRv20kaD0odbg+S7OJwO2Fxk3ZW0ezWKtedroNvwfETh
	7ukFz7EpqRtUOZ2DxJ34zI+y4cDM92Qgu0WhjJUC1LoP+gIqaImvAv4eEh49GSmVQVvdMFaA+SH
	R0469p7GjiYL8g/IF0wFiWc4ACPl+KjdllSSoDLg2AFdmEBJicihPATv7TWmiDMX2xatE
X-Received: by 2002:ac8:59cc:0:b0:537:f05d:abef with SMTP id
 d75a77b69052e-556c1d519e6mr45516351cf.54.1794413800061; Wed, 11 Nov 2026
 08:16:40 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260917155834.2161361-1-vulab@iscas.ac.cn> <CABjd4Yy-9A0xWCDfZemHOTZDrDdtdO05nUjmN=w=sLwYjzZn8Q@mail.gmail.com>
 <1794138380.2883200.vulab@iscas.ac.cn>
In-Reply-To: <1794138380.2883200.vulab@iscas.ac.cn>
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 11 Nov 2026 20:16:29 +0400
X-Gm-Features: AclHuK_TvAgrqod0P7IPbUF8DOI19D1hjrLWu98p4t7n70-06Rpy9qCBuSwEasU
Message-ID: <CABjd4YxYzrxakckCaNODgrCWUfx77J0h3D+gbV95p7_gt1kiog@mail.gmail.com>
Subject: Re: [PATCH] serial: vt8500: Use devm_clk_get_enabled()
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, linux@prisktech.co.nz, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wentao,

On Sun, Nov 8, 2026 at 4:15=E2=80=AFPM Wentao Liang <vulab@iscas.ac.cn> wro=
te:
>
> Hi Alexey,
>
> Sorry for the very late reply. Working through the review comments I got
> in September has taken me far longer than it should have.
>
> Your suggestion was right, but the leak fix went in before I could act on
> it: it is commit 9d8955281d92 ("serial: vt8500: Fix clock reference leak
> in vt8500_serial_probe()") in mainline, and it kept the clk_put() you
> asked me to replace. It has been backported to the stable trees by now as
> well. So the patch below is not a v2 of that one, which would only resend
> something that is already applied, but a follow-up that does the
> conversion on top of it.
>
> devm_clk_get_enabled() gets the clock and enables it in one call and
> registers the disable and put with devm, so both the manual error handlin=
g
> and the clk_put() go away. Probe now returns the error code from the cloc=
k
> lookup instead of a hard-coded -EINVAL, and the clock is released
> automatically through devres. The success path is unchanged and nothing
> else in the driver is touched.
>
> For the record on where this came from: the candidate came from our stati=
c
> analysis tooling, and DeepSeek and GPT-6.1 Sol were used to audit it and =
to
> help write the change. I reviewed the result and I am responsible for it.
> The patch is build-tested only: it compiles cleanly with W=3D1 for arm
> (vt8500_v6_v7_defconfig, CONFIG_SERIAL_VT8500=3Dy) and passes
> checkpatch.pl --strict; I have no VT8500 hardware to test it on.
>
> Thanks for the review,
> Wentao
>
> From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
> From: Wentao Liang <vulab@iscas.ac.cn>
> Date: Sun, 8 Nov 2026 11:41:30 +0000
> Subject: [PATCH] serial: vt8500: Use devm_clk_get_enabled()
>
> vt8500_serial_probe() gets the clock with of_clk_get() and enables it
> with clk_prepare_enable(), so the reference has to be dropped by hand on
> the error path, and the clock is never disabled or released afterwards,
> even though the rest of the probe is devm-managed.
>
> Use devm_clk_get_enabled() instead, which gets and enables the clock in
> one call and registers the teardown with devm. The manual error handling
> and the clk_put() can then go, and probe returns the actual error code
> from the clock lookup rather than a hard-coded -EINVAL.
>
> The clock still stays enabled as long as the port is in use, so the
> success path is unchanged.

Thanks for the patch, but you missed the sign-off line, without which
it cannot be taken any further. The concern raised by Sashiko in its
reply is also valid. The whole bitmap is quite an eye sore frankly, so
it should probably just go anyway.

Let me take a stab at these - I'll put you in Cc.

Best regards,
Alexey
