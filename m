Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 376A24CF470
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 08:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792225931; cv=pass; b=NUYsfxFfukmbbxuhJLF0HuB9Nztp4eQ2S5nS7mBAsBwTjD3SH1js2LPHmxgGUzsuy4jspv2MwCjOR2NT73FKwFSCzWGwU7qR3LHj2fE/80/5P6f1HuChF2nbvG++65X+ajX7sWgVw6PU2JieCGKUEt3MpqnlEjiZ3PN9akPU8No=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792225931; c=relaxed/simple;
	bh=BSPQ+6lrEwCu09nKbFgXJDtvyeOV98p5qJJX4t256Pw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fzqBsEdYn3wihi6m0jdOeFndsWhroXsgQXxGoIMx8SDIIiQO//TlhHBh67pZFirZEYdgWDK4K0qq1CgXTgwsQeqnsWjAEGxLeehdpmYEULFI6o2BrGC/LsbKeairKWKU7SFpjdUbWPjOm91f4whV6fbYO45pEYOzJUsXJCvdcUs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AtkTYQYT; arc=pass smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AtkTYQYT"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-6756a01fa01so668118d50.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 01:32:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792225929; cv=none;
        d=google.com; s=arc-20260327;
        b=b1QZH9vNHZF4DHtL096NqIlWeC+4RQitbPiFvNenDjSz+sv5wir0tTNOvFx2Gndy+Q
         wwHPv3pYPJ7R78Z6oSrf4bcKut/3VcbW+GaC0Rf1ivFNKWhpnAMA7NeJ9zKo8MkAibbZ
         Meq2cdALFA0mgSXW3kb1NCjXGMM4kAk4jMF5r6kR5ju7yDnlCqFyk/P+5VtOZ6BCb6tk
         hX9pQ0jDNIOo7Dm+nWTtPUcU17PhroXe4GeXFN0VJCsYamWeUY75ar5VXPCwpMGzL84W
         kUj0H2YmE2anBZeIJ5MAmsJ5HXHnTTuih83M60rZk7zw7aPUViIn+FJ7NL1Tim+M4SUP
         SDtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ouYdj6Wo8QUkLazyyYloYrZvy3tpdZIKXe5cmoTFy/8=;
        fh=NUmi00B9AZywvwALhOdk2EI8fiw3HVza8mvkomxvHtQ=;
        b=mM13/TYOoD1T1ReaF9HRdiETVO55R+EzTPPRH3fAVTxugt+CU9ZrPwPyyxsPPgLO42
         E7ObeWNrmhsy9lGCl+mjIeLwS/rGNycjqRRCcjulSDe53SYClRVLWgvku+A4qjpExQgH
         UzCd3PKHrwzskThvw/98bTwso20AaWCDfucveLw7ErPdyXctiQsHh2fC8s/khqI+NJos
         K5di1YxgGV3J+B6iB2qm2ynzqYC347ZmyqvXgPLwYhFTPMR+/AB4Zu8FZQVsnUddKzF2
         riVuz3N1gLPxH9GXjpLsidxyqIN2xixP8USHTC21DXWcGmGCbLyfupLU6lNaWO69A4/B
         uiPg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792225929; x=1792830729; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ouYdj6Wo8QUkLazyyYloYrZvy3tpdZIKXe5cmoTFy/8=;
        b=AtkTYQYT7965BZSOWzJlkJc4krP3Sf6NouZ+RFHDGM4zTp4g8xBuFfAiNmWNKW3laJ
         I9lvMUCEBjyt/oAdGa8mhoe2dHPP/IBK5TB5KXRKC7rn9nKYxAGaWwJVQIUUqezS53Y+
         NJTx89xzGQr4XdfMN0BDcr2OyUOUNiRMwGXU90ue/sFAcXZcj/UBGCaYv4v3mGM/YfSA
         pBuBHthza+vdWXzOSXAsCY0OGdt7lKWSZ1L6y5GmGcGmV/bnqT9qIyB/mYgtRnc1+RsY
         U/9rIrM00FtZzuTVbz5hDtuWgJ5gD1BfWSa60eQcHnA3YY/g4MnQJEEaArlw89/mTr/r
         YaQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792225929; x=1792830729;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ouYdj6Wo8QUkLazyyYloYrZvy3tpdZIKXe5cmoTFy/8=;
        b=XGS56ydFvt/GjzFDE1XjQ3QeKjrPtRA+Iz+UTpKiRmL3enZfvmdiFDaOOfZMSGd0Zf
         DtIdbWQoQgePJ/RmDmfn6hWA5QyJFpxG55t9mg11jhexWD2/xwdEHX99b5GIztlPrgel
         N6GCGd9UN3MYLdgOsaTiL3vOLvhZGiI9Foqq/fy+Bhnxh7U03Ze49ajn7NokUHT2jSwk
         Ui2VaLRfKyq0HaLGfyPrMZHJFKYx//wMNwCkRPAMxPJCHOr+h5M1EZ1eRn+XEZyuol20
         rAT/mLb0ScH1qBkej+rm8/lE1YRlgwMTpZjo/QXZSz90fqWdl9NY/O3lfeu9HxJ76MYv
         jOAw==
X-Forwarded-Encrypted: i=1; AKwUvBwnVWW1zDiyH6x26ZZ9xz/LLpgjZXQ0azn/8OPYnokUxS6zec8li3cNL4KnKezlHcnQZZI1ws6/LCrQEYo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIBXovSf/dv794Fs3dZm7b/yBrFcjvMOa7Z6DtoH5qyYC0IIyw6
	KWheaDaI7P5JZ11GJLOWYooiiQkbyCvgX52XkW5StIxlwIcJHM8My1YXreQkTuZ5c33gK6pRRfy
	H61HpVUL6BctyH0mqU/KUcbj3JoBD9N0=
X-Gm-Gg: AYBFou2oAoCTuDqCGO/3Hf1hZwbwXiJ3xtqtTubO3pCnIBRx2Bg508lYA+o2ouWwXG0
	6UWeKvnWz/rjCAQwTZXmLzi9Ye3m9DVWhK62vO6L4nVhtiqO+hI+00VT1NEEC4EvJ099Tdcr5PF
	F3rF40EAUVPHfan+a+dEzFD3H3BSzccNp3ppnB1KwUTndH/DkP9aXKPbu5cefHH0/MTrsBtXnS7
	2S7OGDHwCwNm8yHg/y7w5JmuLGoxfK7z4yBfOdzHO31Ds837iB3uHkgfynr0KJo6qfyfE/DAJfU
	kysZ9i3jtMgh/8i7wAt0gJFwEwJpRDQG2z9woZ6TWGi+4EoiEs5CVJVFPkDZhJFynxfay17ODj4
	crq/xJGApBg==
X-Received: by 2002:a05:690e:4806:b0:677:d126:c54 with SMTP id
 956f58d0204a3-679ca80ab51mr426527d50.68.1792225929061; Sat, 17 Oct 2026
 01:32:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <pm-pmb-1295c9b521e15b3753d6-v2-d2f1fcf0f038e0776f7c@gmail.com> <87pkx8211i.wl-tiwai@suse.de>
In-Reply-To: <87pkx8211i.wl-tiwai@suse.de>
From: Cen Zhang <zzzccc427@gmail.com>
Date: Sat, 17 Oct 2026 16:31:58 +0800
X-Gm-Features: AclHuK9HIqmHOPc3Q_ji2t1xTNmKdcQ1VxP_QGZt45VsIjkNcySDX8f1f-QueX0
Message-ID: <CAFRLqsVgOKjM=r7PvkuV6qy9H8FZxSq8Rc6mVAP0w12LhgymPA@mail.gmail.com>
Subject: Re: [PATCH] ALSA: seq: oss: Initialize the timer before publishing
 the port
To: Takashi Iwai <tiwai@suse.de>
Cc: perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, baijiaju1990@gmail.com, jjzuming@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi Takashi,

>
> This issue should have been covered by my recent fix:
>   https://patch.msgid.link/20261016161930.482309-1-tiwai@suse.de
>
>
> thanks,
>
> Takashi

Thanks for the pointer. It did fix this issue.

Best regards,
Cen Zhang
