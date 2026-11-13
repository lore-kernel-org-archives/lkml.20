Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794534507;
	b=Hcq3YCD+lIzHjMvC8RdKppgaPYRuIm/Z+Z/pJrfO5OB1njlMv52NDqMcwgY/bPc7o4et
	 maMcsKzXoX2r+BgK5pt72Pfu47bTyBuu653QczJ0dFieiGS2TIKEAng97LtgmIM0dP0N0
	 YnXmCSj/i4qzrTUHM4tCkRmE14fN3c06q5iBs8QUVtt83ZOeeR7o6IGvwR3A4CT99h+u7
	 FFgpwmzsZFQdccAQGtzfjndjWo95Aa5rjKIypNYvybY6/LE/NAHFgOPH3/JZXh/2oTNlT
	 i4AbOYKE+nhptGJs/HMyeNGW2KejHM3NpxbURxyUlAw9j0XX5M/iOV7Ox6ctxWhKPSA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794534507;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=qHMuM5Z9d1NJ0qzFPFfug0ui3jGT4piml21ckpBOlMg=;
	b=IkrbDLI6QP/bvSpA43TVlL3m7R+piJ0GBY5uVrwyiMNZw0W4r6W9QpUF/vUl7H/CjEIk
	 uvG/msgni+qDqCYjLR0R0In0mAxSPYlwz2luTL0hqfBLgnJ9gpve4j5skl/jPgja76G93
	 PJ6NF9YWJVw+xAul1gPu1rr3ywmV6VyQ65ECeIgfkXJHf1gRAc0KiBhxqS0QsPtpFSlY7
	 DNsWXATuvIgU2Wv2ZTRLOnvv38HmamoFKw58bL+1Tyhxe9047vjMkKaQLalq6OFkoRIVQ
	 p9ggx/jBjcgU3P/uWD4uN0vkAdLTWtADiravWkj1eWeIXABA0IYxQsYjyZBEQ5v7gMg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P3olxP7J;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.44
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06036606A327
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 01:48:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06036606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P3olxP7J
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5c126fa1e3aso431062e87.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 17:48:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794534505; cv=none;
        d=google.com; s=arc-20260327;
        b=KyZuH3fs4xb2kqndw/q6U3fw8SrKDNxhW5u/aEf0lNqcL6gfHokUpXcSkqzNY5mReD
         DdEyb2d5UsJxktsh/n8HJIitjVY3+CCSgM8HTIv8dTNxe4s3iRFplRQMRkCPFFYeGOEv
         Trdi5qp3CZooESIPMYwuzgLmhpwBzLh5mwMmamGHQ/M3bjC99pn40/LOiAS32EWrqmUB
         kpU21hZqhqYfqyPfSSvqUVmI3W80mASOTaqEpcnyz+6a4/CnBBjoERhjgtrxytXyZa5u
         Ctm0g1sqb7iQw79C9c84PnLPHV3tswsmQqs4naedBV2cL8a+O8DEqWuWZB3qVXk0hEam
         aYyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qHMuM5Z9d1NJ0qzFPFfug0ui3jGT4piml21ckpBOlMg=;
        fh=0avgAc3BRkhSGKJ8B5tNc/TX2oMo/ZeqEgmcg70dGL0=;
        b=oPrP6Xh6DPeSdCNtvpfEPOQ9D0gd4LLfXe0msTCChBF7TQPyLKYhOts2U+dk/zYoeO
         VgYOTkyn9O0tTr4bf1g1EQpTRmB4uT5w2r3I7H2IJDI2+DhozrvEnpTJ+ZgcEy7Us6Rw
         vN8inhluJpz8cimOg3HXo8XeXen+hPl0L6ziJpNmDcnmR1pHJSzoM6mCrVVzdp87wBkx
         Fyvoo4Kf6e+TDFGLWUx3G4H/9aVo4IxTAauzpJlRLXIZ+OFSGqExz+KI7AZyfQD7DZsJ
         w+YAjg89+eF97rRr4zdA0pU/pUJpLdaSTq6aJkdBCPeTjWwtl9Kudi2Ma9AW/QQYxXrX
         bwOA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794534505; x=1795139305; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qHMuM5Z9d1NJ0qzFPFfug0ui3jGT4piml21ckpBOlMg=;
        b=P3olxP7JPXksuID0OIufKWZhUQ3IH0dS8ULn3ZgVNrVGtvQvVG5nEMYhtJ9B4v1PnL
         vYAxrUbmeyQfP1nOVAGKxZOYabSqvJecWv/gUmKI3gj9UMqz6g2LgS5mLGhtXXPMZ8pz
         RqbtaCjQeWgHoIClTZHjQDi++UNttJvfo3TSX39z8gvdq1nKwkY4QlF+CfnjmPela2/a
         LkzLSVYsG9wZ7nKbm77B5lOLQh92P3mK1vqJ9KqSxWbOeHnMjS2bWGkT27oKVgi4L0A7
         hsLqWHBoFpJQDSYQzcAJ6ZPdWszzgxeUlvWx3yrTigXvqrTH4kr+do47lVjCaZwhTv5J
         LniA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794534505; x=1795139305;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qHMuM5Z9d1NJ0qzFPFfug0ui3jGT4piml21ckpBOlMg=;
        b=VRYX9JHam2lV0kDmJeiolcnGTUf5TnQ/55L/l8D0xP1oin9fexKZCacWMpwdTYfS27
         PShonJSbNSTQrBuvwlSRE6G9AbISE3t84ZcVKnhCfvHG2R6Y3P99m2HOxRFR4KmaVxO3
         HNM1MMlXH5VnqgjWvHe7ExJfLA1yviKmxMOzX775UEkvFP6brB/iRBgX14s4oQZu4hP1
         c7xXT9PX6hl4kC2ylU4v0TJxH0sQLAQLDn0R5gVrJ6ZGNZG2xbNNdzpxiQz8ANnwAZ50
         UpAmEq8+bs4GCwy0b+EGUwm8pZO/MXNHnbQ2prpeBvuM5kBKNdyJyF5ZGuJOw+4/c97u
         GStg==
X-Forwarded-Encrypted: i=1; AL+hErGmsywY912qC9fuDyXQLR8UZrnq1S3Y//x+rOfhBPud1gVk0PWVj7muGOU5Pclroco7YKWrvL6UGyivS2c=@vger.kernel.org
X-Gm-Message-State: APuU4Z9DXIw5o7z4xTnq1Fe39Nh1GzGx9fxfVEw73fnEJ658iHSN1kHi
	vgf4NwNMpZ5rh3mWagdjT2HenWzFHoCP8Wfl8xtswRkd3mLOVnGpPtgnFymI0Vx5bBy2d1jPXFk
	PnIe1q9e8HvH11Pr7isyDDC7rK7weigA=
X-Gm-Gg: AYBFou3FcY3HPBNpWsXo+GFcze1+Gdb1EC1zWQxSpGhFtNqmmJbghfZiW599L770kfh
	G/YBB9H5ZgnlPsOSk28CyMuLr6a3HYrMWTjVoyxC3Jryl7z2qLS7JYsvkomaQLd+8zhsZOkJg5S
	HifCSTH3asYwkw18YvGvOsaz2uv+wzMlb7RGYg41qp4FbhaxMASBrHHckf56CSiFViq3VfPo7r1
	s+4B3ouRhnHMtQtlVR88MqhHLfJpbkUIVclDIrHPAidfcC1RokF6oB3Nb0oML7fNu4lhETGnx/n
	xA7aOrE5pJ/j+8y9KOW8kF5kSoVlQelZmpA3elCrcyryDpHDoCktoBaT6orxsI29RVB+Sv/Vy3y
	DySKrlC6CxUK4qmYHruRDgIvpG2nl0bc+sr7b2etaYdNH7voJ8W08CX2BvoKoa3t89wpCRk7jrT
	Z4VMRSTW9ghg5e0XnDbC9OBL6G
X-Received: by 2002:a05:6512:1304:b0:5c1:5974:8a54 with SMTP id
 2adb3069b0e04-5c1705faa6emr444217e87.5.1794534504878; Thu, 12 Nov 2026
 17:48:24 -0800 (PST)
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
 <CAOMZO5D1XDc7C6H9jYTtpiPah3DnQxJz35t+3k0--a072KsMuA@mail.gmail.com> <avQV+8VrthWpKAWT@shlinux89>
In-Reply-To: <avQV+8VrthWpKAWT@shlinux89>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 12 Nov 2026 22:48:12 -0300
X-Gm-Features: AclHuK_ZlsdyvAp9jZzuN6ezT2JMrw9zinFgseQFdkZHa41yGNMDULrPL8U4muA
Message-ID: <CAOMZO5D3JXGh4FbLs9hRmQMnV-RY65Aq0uosgk+zgv4naQGbBQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: imx: Use of_device_id match table for per-SoC data
To: Joy Zou <joy.zou@oss.nxp.com>
Cc: Peng Fan <peng.fan@nxp.com>, Dong Aisheng <aisheng.dong@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Jacky Bai <ping.bai@nxp.com>, Ye Li <ye.li@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, Linus Walleij <linusw@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Joy Zou <joy.zou@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Joy,

On Wed, Nov 11, 2026 at 4:10=E2=80=AFAM Joy Zou <joy.zou@oss.nxp.com> wrote=
:

> I kept the check as a defensive guard in case the match data table is
> modified incorrectly in the future. However, if you think this is
> unnecessarily defensive, I can remove it in the next revision.

If driver_override is used, then the check is important, so you can keep it
