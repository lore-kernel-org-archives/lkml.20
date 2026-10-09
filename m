Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F01D61FF7C7
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 07:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791530491; cv=pass; b=se+n4p2Yj+6p9cUHrEdi7kr+Ku1lVqhn+5Jz9GaZs00op9SLb54U4IlYSjIRCq+XdSDtrqhrBoXbkqK2rumIPIxfbRk7qQptIuyvj4na+NrxXAcCyw1dmCaR1HrVE2XvNAC3mQjpfeIzSCUd1RJZOV8Yqt7TuuiGbHBGO8EEXNA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791530491; c=relaxed/simple;
	bh=ZWFUNR7NkCd2nR7CmmLol21VHCNc/dGraaedEy4x8BE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KAaFD3DfkQWBeJ+9LQhct6OA5wggu7LDT3kdc5IgJhykT1mBI1IkGz6mLWwlpV14hX/VimKC7MtnEYviY8uI5h65bJDeRi0WRuYjIJaVHEdeBodmU4VjMw9vDGZxD68x+4sOZ7zc5mRQtAgeCIdbHrjYPsUcxYdBNxFvIDvi5kQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fibpuUQ6; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fibpuUQ6"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6a9e5ba741aso5705742a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 00:21:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791530488; cv=none;
        d=google.com; s=arc-20260327;
        b=nJ86irJjRx1JwSoaStwsRUl5xrsAvk4CFzZLG0wwDkWxL14gqzvN1EDlr557oH5BUl
         7dvBozsqvnhN8swVreQ6BFf3S2+5ZtSqUkOKvsC2PA19cCCAg/3VXRvO+5pw12oi1kMD
         WE2JM8WFFbHRcPjtsu07P+5zYBo5LFX8WExtGXnzEuI3VaEZPvA1WN6toIecYjtNkWpi
         UGsst0Lxq3VT30L7F5y5gu0vbwEqA6u/fM2bYHJIMIb2XmJhyxKKagXV7K8azTenEsjM
         8hFibQiEHzzhvoVW7hnM+FLTDUcCDy6pqkYhf62WrtpzZ/47ZSpweLJJcLBWTZslR6sh
         Gtqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ZWFUNR7NkCd2nR7CmmLol21VHCNc/dGraaedEy4x8BE=;
        fh=usqkzJkFb7rryKl4625mm2AbTpvg5l9jES5erkTWURI=;
        b=ZkqHFFBT8MEvoGTiZz48guFlLISaUTXvrfwnz0JSeF3MHOy8W534fpu2vQYfJYA66T
         GqfoKfoW4YeVIuWHj6NvjRsiDBRu+g88jAfvv+GCuyH+tIyVwzA1F0mWgL2C1zx8La2J
         cJ6Mam1Z5XClz5zWwGlgRjuvn+1eZuvL3ZYszKaS1FvgyegY/7DvOEwoPeNDQrju/Oph
         +FffFPKxXVpebFF6agaFOSoUXSY03eqj2SawmkTELpPlD7GRkZaLqS+QAsmjXYyj9vNM
         LjWTPq9hPjZK/ELElzpg+CTk/OHIpbx/HBw42ay553XymYMtTNM+bCC03WTovI8mSQ2n
         TfYQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791530488; x=1792135288; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZWFUNR7NkCd2nR7CmmLol21VHCNc/dGraaedEy4x8BE=;
        b=fibpuUQ6gpRtjg3FaNafQrhlsjuRv7HqiybEQKAJZzzr+D2HjuxHaDGuIYUR9g4EHr
         euEL/J87Gu9GGVt1TxKbQeo5eZJEgZ63s63q0c7Upnomojn8htmKQSHjHy5MhD/TccEg
         NGV/2rwu3+J2+UoOF702JB7jkORqzO1GjwdSzCrKIS/0H/VjnhEY1cM3FOgvSwuImkmb
         lNkJM621PxwOloDC4h5T6NSHq72cABy6abcpvkeJNtDGuNzuR+lTZVLxWxf1mmrzb343
         UgWTp5IT2eU4zsiWoZ9dGZsXyX2EGbMaPjuZIsQsn9m/ZA1Xis5L7o2e6Q8vRtHGwzxI
         vsTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791530488; x=1792135288;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZWFUNR7NkCd2nR7CmmLol21VHCNc/dGraaedEy4x8BE=;
        b=1MYCI0sZzNe8jDmW93xiB3mnUNTFweMlRCWN/aLQDttMqn/7UxwsPz154HgrX1y/iW
         UFMvuue5t5FWenzfMQs4pQcbGNj6pzc1nFvy3GlqhaMXLzSdhJnGhd5O4QZX80CmQTIs
         E9ZfJbTvoY5q10clHpMyRgiV7n5P93PwkWmGM8Q6qgTZax9Fs4PuEr1LXZhPv/fA93GY
         BwBgSZJVC/AEvn1EVS+/RCOyBaXnaYiDbFTrm1ITw5EF/yRqttx/xlBJb5ueoKGrSo9N
         /x0chylTQWqMRJarXZHIrD5sgT2IAuBEbgqllwqK6E+aoVfDIJWUgRrO49KXWO/0d5E+
         D+XA==
X-Forwarded-Encrypted: i=1; AKwUvByaCiVKe5E4MtLTAmOK/R9Nzmsps41TXoGkNE6HGg1wOVLlUlclsm9R6PnqGux+T3vcbwejoJnPHRdSID8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKKnXhhzuWAxEhNBe3Unklr+JOt5j29oAuqk+WMfIFzazrpAkM6
	M9SwhcBJHXqJm0Duji+LPfpByIbkjD8weLXQyuhGXGk3yswnvBjx+Bq/YHAbQpZVHp2X4IiGd8/
	MfSWu/TsnbklsSox8T4jRfqfZaq9szJ4=
X-Gm-Gg: AYBFou2OucxQyxOE/xz1w7fOrV3m0RU+sISrThTDu6ObbgMad/N9Z8zbJeDzqQxthGZ
	phRPc/7SYwr2vT8aLe6O52BGFXS1A5mVYjgpIRXIRdoodXSaqeng0vC/BPC4Tgd+rhj4gG2yPVl
	0hE4/5XO7Sd7DXlw5n3M+hsJvB6CCuCNkhebluZIrmsK8NBFYAPR6JqjMleEFd+RuKJBGnn4S0B
	0xUStns9PrpaUiAG+Yl4juldP1cHDmFmohwBojpVfY4dNZFitUPefnF2335FxH2LxKw94+bjM8R
	Y3P3bDsO4YLY6B+MnFYEt5/THKIsg8Zlmvgh9e9AuTKdVL206Thp5LI4crJIM9vqW187pZ+Oqk3
	dBRVYqoRHQZl1s+0T9S8N/phGAtl73G5o+hop02ZKOB3zZJF72RVCKm7vH9xbe1BTa3M=
X-Received: by 2002:a05:6402:2489:b0:6a9:aabb:5364 with SMTP id
 4fb4d7f45d1cf-6b17c2406a9mr722739a12.11.1791530487888; Fri, 09 Oct 2026
 00:21:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261005110257.50145-1-phucduc.bui@gmail.com> <20261005110257.50145-15-phucduc.bui@gmail.com>
 <24ffbf82-adad-4153-a2b9-f2123189c722@oss.qualcomm.com>
In-Reply-To: <24ffbf82-adad-4153-a2b9-f2123189c722@oss.qualcomm.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 9 Oct 2026 14:21:13 +0700
X-Gm-Features: AclHuK9p57z2uGUnULQbpxyjyLXl9q0M8bfa39_8UwomVGEzhtoBlELb83gkc1g
Message-ID: <CAABR9nETXgKCex=sDx6Y=eJOTg42oj0egGv6268T14v510Zf5Q@mail.gmail.com>
Subject: Re: [PATCH v2 14/14] ASoC: mediatek: mt8195: Fix clock parent error handling
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Trevor Wu <trevor.wu@mediatek.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, cassiogabrielcontato@gmail.com, 
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Haotian Zhang <vulab@iscas.ac.cn>, HariKrishna Sagala <hariconscious@gmail.com>, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Was the intent only to get the DAPM error log
> here, or should the commit message/code be adjusted so the behavior
> matches the "properly handled by the caller" wording?
>

The intent was only to get the error reported instead of silently
ignored; the commit message wording was imprecise. I'll reword it
in the next version.

Best regards,
Phuc
