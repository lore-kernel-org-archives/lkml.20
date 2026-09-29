Received: from mail-pj2-f39.google.com (mail-pj2-f39.google.com [74.125.227.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F0F2C11CF
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 01:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.167
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790645841; cv=pass; b=SFKRDl33aFOOCR/czYcbRs70m/hiQwo3ZEfzYqgY05P7XWYrCIq+VwA4EeF0OivxXBvxa+rE9jFB/M6yrglrD6iy3VgubqqLAT9gcgen9iXk8r0uY/mKH3krAMw/aXe8oINchsd8hH8dihr/NZ6JKIu21ILax0pBMVdDmVXebdo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790645841; c=relaxed/simple;
	bh=bB/l5IzBo3Uz00TsP6msX6F5bA3Pf21sY7q01hxENmQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sRu4aUcESPTLL4pwtJAhrl3qOeMC8Md5nNVwbanOajvR+XDITAX5mfXHQJKtqo+L0ybvGRn/L6S2bqsw8ZfWLCo8syyJaoMFjLSQ8AGuiJxzZ+G+Yl6h/1Y/Hlshbnatn0/kdW4CPYUleN12lCPlnOWctOl7GlqKiIRYrcORJbo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=afjTBBC9; arc=pass smtp.client-ip=74.125.227.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="afjTBBC9"
Received: by mail-pj2-f39.google.com with SMTP id d9443c01a7336-2e2c7eb3b8cso644545ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 18:37:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790645839; cv=none;
        d=google.com; s=arc-20260327;
        b=In3b68oL8I04OgIdIlFu6bCnXV0H34jjaiF/9Nk2k3ep85FQDW0Z3WwZ9CPde5rClr
         oFNePKcXooSf2foaIIOY1UhJOjs5Ujb/EP3ViAGZphPQk/cO2TKP+eijrR/0WCFHOBBn
         tzEhbE6XhtCHoPSyxqdVUulIefH2RaELBh2Rgdv9VCGuYTcmdgGRwa7XZlp3ee4lnVCi
         dElfaMbNqGbYD5/7HjQLjwPPk3EjJbQ4BEbREHskGKJ8jgroOz3cy38eRBhRc5H5L2Bw
         3SSPqca9cbwq4oIPCU3WPNIS838BImjMEHDyFu70voVTB6lmdCkbCd+9CHzF3FHCuOL1
         aQgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rnkVO0aoE0KnX2d76+g96XFlNkoLJdwXuRaJYCNLsiw=;
        fh=jNGByLPgtNVkFtxpVHQli1ciPX+Ifyck0IvJ9yaum/c=;
        b=Cru3kt6DMQMBVwWoBCuJXm8Gr+LunoSL4D5R3cy11FTNtKowdUUMOsMOaB2q9NclTL
         5IdXiPatIh942DauxVvmUH6I0NtTuz7FYZkJ4T9d1VMOtEwtpK7P98SH+xOk68Ynn7Tm
         02YJhSzhoKmQDsSX4c3ddo23L7z3+njW2QowR46s/5De+PlVKEQW/Pean3JDt5rt31b5
         /OWtaCtMLiOPhmY8s6MwHc1XkYHYngDdXoqPyReMBQtoXRKD390qz1Ke6GfApBLSgBsG
         2sa0UxQTaOTEVg7RS1kCcLFWOsta9E6cuvXByxHpGhBwLPG/37YTADV95+GKJ+IEDYRg
         YF5Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790645839; x=1791250639; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rnkVO0aoE0KnX2d76+g96XFlNkoLJdwXuRaJYCNLsiw=;
        b=afjTBBC92FZAycK81Y3W8MduKDPalPQM/hc/DeYZ+vijQLzZLxLdhGjn4sTk1UUoTW
         iZgbW5cmZ6OIThRYSsDiDNL7M15Czu1q5Ej1mAmAf/rA34fq7xHZ/6z62OIphushVM9k
         YEDOiIMGAg7yMqWpO6pGG78e+OSgPNK8lLZMxF+MZdD4rNW5yCHZ5myulpCdYifSL0fA
         +ATByRW1CCFRGfrbLmAGL/Lc9DbvzA5rP0KHThGyWWPZqgEAD8a4TbUzeCV7f/37fhQg
         Y8jfjcfkxouxsOd33L4y+nCYJX36uN8mhZesSBy0xF+YJo+FIlZdNiJmR9FZA9y+odiY
         AD+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790645839; x=1791250639;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rnkVO0aoE0KnX2d76+g96XFlNkoLJdwXuRaJYCNLsiw=;
        b=DBg8ajnS0Tq6jtFspFhEeE6Pt9UetVX7BxvSdckwnAjC+vdvqWCAR/fFP2ndjvp7Xi
         GeMOoQLqhTFXzXHD2nlb2rjC9+kBRSOLNTN2EuatJV732+7wqrZk8vYiARr5Hx0oCPD9
         2SHtosJw/Y7a6GKcqVkQ8I3VB9tDkjcvEGfkIZplVVYztpy/5P6eZzcFEc4juqwUH2Zf
         AgDWctcCTemCuRjj+FAUxfymPucYTo3DK0YS3l66IXyrJaLeVEAIGduakt5grpmPivDo
         JLZHu0aqBtOQEfyIcSHH7ZoSfFKMxCFMtd7yojHz5J9E6yTzDAk5hZdUPPagih4AG/QB
         M9Gg==
X-Forwarded-Encrypted: i=1; AKwUvByA6mAzDP0Bd0xhIJafx8S7cm+m9peA2R5OULYqqZqJn9B6eqyt1ppWiIqJzEAURNiGHANvzTk7d7hDQJQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIRFxOwPz/jSs/DYDnRQrsEcPuIL/osK/2wmW/8xczWjg+cmegs
	ikepe9zQsuOmjA1oM8daot42e3S/aO4AJQ7az8QCGUCB3l2hGEmk6Tbbm/rpdYLEb/OqloU9hQT
	e/4Fq827FEToBLqKPhuEhV2nH+q8IG+c=
X-Gm-Gg: AYBFou3sv7+MPE4C05AfBQKI/xWQlo6PjLAVGl+tNwWFwx00UST2Ljey5NUXO8gwx9R
	dAFJzqvHQaA2ksJ7+JJZytimpdBveXHrlUE6mVMWgSLyOQReTQ/D4oDl3pm3faa79/I6AJvo/PF
	0YGz3jrT9JabhXuSXX4TalwAsGs4Q1RUMt9mEkw07GdMV8WNh84xTIX6OhTpGg7MxV2uqItDi98
	pqjtPhgaAuhTK6Echh94UOjsxQLyYrGd5uR3R1G3mAWybacvR0X+GjY26dCGRS3epBXQCe6Oglx
	8qBNI6H1EmraMg3szRY9JeMepQP7n7YYZswAUtHK8YhXTuHucMWQqxQ=
X-Received: by 2002:a17:903:3c4d:b0:2dd:c100:b2c6 with SMTP id
 d9443c01a7336-2df7dc506e7mr124008955ad.49.1790645839130; Mon, 28 Sep 2026
 18:37:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928061727.1844167-1-shengjiu.wang@oss.nxp.com> <7be95093-1e29-45a7-9860-5605763baaf2@sirena.org.uk>
In-Reply-To: <7be95093-1e29-45a7-9860-5605763baaf2@sirena.org.uk>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 29 Sep 2026 09:37:05 +0800
X-Gm-Features: AclHuK-gi7etBZa6zDkid3kRxBB448XKArKELjgsns_Uu77zQnT7DY8d5A5ELVQ
Message-ID: <CAA+D8APNVx1P0G2pPJ3W9u0eY2pqsKeV0Ar0Aau9AeR5mYgpgQ@mail.gmail.com>
Subject: Re: [PATCH v6 4/5] ASoC: fsl_asrc: expose individual DAIs per
 conversion path
To: Mark Brown <broonie@kernel.org>
Cc: shengjiu.wang@oss.nxp.com, lgirdwood@gmail.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	shawnguo@kernel.org, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, 
	perex@perex.cz, tiwai@suse.com, linuxppc-dev@lists.ozlabs.org, 
	Shengjiu Wang <shengjiu.wang@nxp.com>, Chancel Liu <chancel.liu@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 7:26=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Mon, Sep 28, 2026 at 02:17:27PM +0800, shengjiu.wang@oss.nxp.com wrote=
:
> > From: Shengjiu Wang <shengjiu.wang@nxp.com>
> >
> > The i.MX ASRC hardware supports three independent conversion pairs
> > (A, B, C). The driver previously registered a single DAI with generic
> > stream names "ASRC-Playback" and "ASRC-Capture", which prevents
> > multiple independent conversion paths from being used simultaneously.
>
> This and patch 5 are not threaded with the rest of the series which
> really upsets b4 :( .  I'll fix it up but please look into your tooling
> here.

Thanks.  There was an error in the thread, the patch 4 and 5 was blocked.
Then I resend patch 4 and 5.

Best regards
Shengjiu Wang
