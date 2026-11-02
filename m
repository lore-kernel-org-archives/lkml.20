Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793614890;
	b=zS1igbsTNW6gVYy5Kss1wdYR9j7B2rapimVieLIR/myc5HAKZLXQAMcb8a8CBTy232b1
	 TOMSs4vWJrBGPKu/FUQRQs6uzX7Q0ukgYm17tpOOxO38kpF9tWW4TYjllpZ0Ta6YkAHBG
	 gFzXp97WqoabWL3x1WqxmrSCkO70CZafst0NpbMQEkcXLMNg2SUtd7auxRaV+IRJmtf0I
	 rfYtisDrhq37QnKRzfP3OxE8UwNK4EXQC1zeef3bSaWAv7KCEoykEVcBVK3MNY6EL6Jn9
	 vB5xb5Qg8VdIW6WA/2d2oKFwq6Z/jZRF66EpevFESQTLSbIdo2IrZKeBZ5NeCy+uAJA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793614890;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=aOt0sq+pZmAyDkEBIzNG9M6J27CczFky8001bhUJucs=;
	b=4iK5QIN3hUOGpukwxHxoIugkVu/zB00Sv/XySKs2/++dvLd35hrB90W2c71cngsCQdv5
	 +b1Yu1pGSSXHgvVE2aTlRevfI+uBqwtbJE23mALMazGG6w4M+AMDSXArbmSN00qQzjkEW
	 znzXQ9dIjdmlL9f+rogqD1yuhhWUGsjLY9MBx/Wm7m0tydnvJB0mc9QtfcClPj1AhQIMV
	 OZxgX+Bn7dtUWWLB/iMXZDcfyLdXhoEboQIWibRxv+CmuQvIfkHeaYvvu47EStIOFtBXh
	 8bCfjJBIhv9dXeKUt6/dp1tqt/n5twSZBHaJxNHw/yWWWnachcSQ2d4qnYOdnCyRasQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gM2UNi47;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.182
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D52606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 10:21:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3D52606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gM2UNi47
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-4d198f1a591so1585966b6e.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 02:21:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793614889; cv=none;
        d=google.com; s=arc-20260327;
        b=Nf3t8BC6gyxUwYJUiaaOWaxi35qiUXPI4cXpvHAcicgfcL21/KAEGPl93aMvf/+liJ
         nHZvnOgCv70bahrwGUigK+Yj8tCEtCSfl2jDFZuEht+Ggz0nA3/xeAOj1SBbcxPLTHUP
         +c6J7vl7cIgTF/szr4U2XbLf0NVHtY3DoTrcTj/hnMv+ClGWAldpR/5lEzSqo/HDOpnD
         PcnJelG2LKZ3PqkIYSd9PwaC/YF6hSQfwXrfHokqW54987j5jnTl36OxzhCKIPmwA0Hi
         LcejBIxqNVFpPWCe8fg4OAAB3OjwpIBxIOamV0avLGw5j8bs43OGRbuRXxRJGL8By7um
         oh2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aOt0sq+pZmAyDkEBIzNG9M6J27CczFky8001bhUJucs=;
        fh=/zoz9bchKdHPGWJdp4rEu6UePlsCi/LZxfh2b96ua/c=;
        b=nwN4Dh7Azdt+TuULsyG9vGiTn+m2CeroxOJwLLSisiKC8g+zhMq+Lyl3n+gF2DfA0N
         wzP63b1tl2O/Cd/U1TkQUT/SQC9iOoQbiZZ/6lh4AS/weEKEFfjnSBtMeqGr6uQH/Gci
         3db0O4Kr9Qzxy5gO/1CsLr7MHMx5b8pm8YyFSq4tobeF6gjYNfg9Q31MtITGLV/r4Zm3
         0CQYwZj4HiG+wPMH75MrpTEtEBilacUmOvFcZkDxvlByLEIlOe28LrOplYwSP2mWQQbD
         Tf6XdcdRYEHOll7EHLvTLXFwFkgfgBEMjO2NWisqakXeb1cZZbmX9KYRw9c7LtGH4ZxA
         fQvg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793614889; x=1794219689; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aOt0sq+pZmAyDkEBIzNG9M6J27CczFky8001bhUJucs=;
        b=gM2UNi47hWHqVFjslloMsktpAOp18sZE8OwAXoH4HiaG/Bf/dmXdPyjSfDpjixgYJh
         OhET1ivRQaCnzycsR/Nw+AJiYgMh/lxWguZXxuYxM8YpbA4YQfyQ7v0llPxFqSRW8vES
         NT2w8+5CdbMnym8LFGf10Hql/7ZtYz1KuNXbG4PnkqJnS8M1uyXjOvdHWEyl9IzzAcMg
         VCAMYBpEwJVisIgSEimY+7dwi6Y8G/LbbWckzJZxDP8R9WKoIe46uWngoEXKK9QUNIUz
         LfTyKePNuCqEc1GoaoKDBlogs9KMKmnCtlkO8vZt5+ab/sN1wa4b+yxX1UD38it/E/ju
         A04Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793614889; x=1794219689;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aOt0sq+pZmAyDkEBIzNG9M6J27CczFky8001bhUJucs=;
        b=qiU9EwhnV92A6woDoInsMmO9ny6Fsj94zXeCFQoOCrhivYZ9/q7g4X2h+no8UIjluC
         V7Ao6lO8HlLMG398eFzRRnmMMbdEoATcj0HMcQ8zJM8zfy1Gb48f0UCJLwHD6DcSNFpK
         hLC02840qLdbPHJmGLTQZNBREUnPKjGo9Pm+9Xg+KJhtuAx0tC+4fs0Ofw0oGApzp1F4
         08vJg3tLaMEJTB5UoccDU8i3lds5SR7s48gqSSLmC2PyH1Q/lc6fZ+3DXJOOtrBl0AkU
         LDzLzFsZoZdYfn1DyklLzq0C/VHW9rA459wT6qGbqCmXa9V15tISudsmOKHDhfS7J5T2
         NsrA==
X-Forwarded-Encrypted: i=1; AKwUvBydGbsQ58rTTJGFxzkueiGMydslssv0H5ndR3oCkOKU4CQ8BDp1QvHAZR/gjjj7JDEkqdYyZWMCsAnw8yk=@vger.kernel.org
X-Gm-Message-State: AFq9FYK9zJ7oWy6CIpc8v9WobOZNlKhH0nPP6Hydjkry9qi/UUZEPpiH
	YLas8RFo8TqJvZAZ0lCdeDeOQMdGtpSaM3mHaZW0GL3MLszUGG70nOEY7nDgPeug8tJUXwRbS7B
	vGNiaTPtlfn5LaqsndivMHDQZunvaunE=
X-Gm-Gg: AYBFou0q8/dQ6DOravHHi7GC7/S8CvikYyHl961R7G8gjUf2H62Ga3PofFewA4qX84c
	Y8t6WorDtVqSowssfG76hOj9u5h+87KPmitFqw+mSgrBxuQ+AkZc9tmCdPiI3n9HpBvu8agzd5i
	TPs1jQzyJ2qI1HKcGx1vru047xjaip5LRM4Nonn3zpxY2IoM29BM/VQ1kg6gOf8Iu/Tius4xrnF
	8HWAzSdMpxIU1pSwhQAW9Q9/bQ3p0kjccfUii+cprmfbjZCyJ9syyFvDea2LwMSVN7UkL8ZxyGy
	DCHoy4OVo/Gz/Ictrt/e3P11buqqNwPqPjkVDzU87TKgw9qdcf7+tYi446l29Hce06DrmbFErAf
	128l8UNPRtWf3DNJYTvNi2Uw6TN+rPtgBMmccnA2Fxu5A48bbKOEeKTdIKgpxR3uD9YebEHk=
X-Received: by 2002:a05:6808:2388:b0:53c:7298:3598 with SMTP id
 5614622812f47-5640dda1bb1mr6678219b6e.31.1793614888737; Mon, 02 Nov 2026
 02:21:28 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102101125.3523835-1-mmyangfl@gmail.com> <179361442917.3286.13140295265370118734@kernel.org>
In-Reply-To: <179361442917.3286.13140295265370118734@kernel.org>
From: David Yang <mmyangfl@gmail.com>
Date: Mon, 2 Nov 2026 18:20:52 +0800
X-Gm-Features: AclHuK9P7nBPkX6lLeAC9VV4ZeQ4ormIESjOoQTN0wRYShi2_dG5oGSmv5ZznC0
Message-ID: <CAAXyoMO5qCcnMeqqHM1CC__FPMnArOadvmCtoAzYT2SDhSJDEQ@mail.gmail.com>
Subject: Re: [PATCH net] net: dsa: motorcomm: Clear the MIB buffer on chip reset
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, 
	Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 6:13=E2=80=AFPM <netdev-bot+sinfo@kernel.org> wrote:
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

Reported by sashiko
