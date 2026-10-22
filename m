Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792660739;
	b=YAhNkHRtkJtwpEf6iNb1qpo/clukRgThREH01nvoE1WhkkQe9rWWQu4RAaU9pMsT+Lo7
	 NoK148d46i02E5w8TA9VMstxHetqqsombQ9Fmyst/LETJ8zlNMYye7fHvffW4MHrTK5eI
	 ulnAPwABteaZzT4ZN9RRIre8gYDTRAW904yHRJNoRFOGPmn8wtbRhAy/7EjyOT3NVhPpA
	 PKAZdwzmRXbVJTyK+l5mmxY9MK61hPyyIZeO0xn5Uzrlz0uvYu+aSy+l6axlXsbNsoYAG
	 Jht7AgUZESTJOmn24eoiB2eXX0rDF2Y1ExuQUBSycKOV30IGtuwfXQcDTIDZtcA5XNQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792660739;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=UpzYIyETtrp+kpnPDh/4yQ1NnnZqaA+hgyq5gKXO1cw=;
	b=SJwCYkmDF+ffxHx6XP0IorNhluj1oejixWkCNnf8zrL7kM3uSobJ7mTwBMh7p115Z871
	 AFezZX92uOldXKrs6Ep6vUPPGHTAMP88+X63qwDgIY61AeedLVNZ+nup1pwtk9+OC00yg
	 IqNUnIv57QMGOKXwWZIoWUKBJ2VBOphdrqhfCtN4S+7lYMVZUDzinnTi+69KAkaFmyQhc
	 R+inwTezO1ftwvADcZku9YFPktYlk9aF9NWOGxJutckakJ0mpMkM1AWMDk6/tOesl2N/L
	 Zaqh3puPWwofyvCOUO3PAuKoWo0tfv5vZHE/wgdRsO6TqJDrNCPyiLy7jwxtaDPsrIQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IxwotdNC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.170
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B914606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:18:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B914606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IxwotdNC
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8a83d2706fdso13322827b3.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:18:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792660738; cv=none;
        d=google.com; s=arc-20260327;
        b=CDJnm3y0oLmwZOhI3CMUkAeQaRy5LOxzowBZft1eHjcKn8iP+tUOA48qot/zeLWNfw
         V5cTnKaj3HnIOTYToyA8LMnxN9FyWsDqxcFFNtCkzpt5utqbsufRnpZzEcmc7h9Ht6A6
         uh98Bx6aokNIuofA63x8MD64QnS0QISwKWmlsvhKFnKpNKZs4hMVDwlF+rSrN0h2z+gV
         Aavn2BkAlw/7VzT7SAxxN4V4aRSxoIpqpXciNXeVm8dyUFXnaUbm0NAIzpRKtc+LI2Rt
         ItiLC4197pvavpnt33m4Bp3s1Uc7YUDqYwx3vXgdTCE4nAo107aXAQ4g7V4DlZ+fntao
         GTIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UpzYIyETtrp+kpnPDh/4yQ1NnnZqaA+hgyq5gKXO1cw=;
        fh=vCKxkXh3173kvvle3Yojcb+RWwdYgV/iTKi/hbGU9+c=;
        b=Ugnb6XbLtRkrE11AUFg8oVdp/I7JuSwGptHZpmzU9lzBQ57MOulEQ0ofJMmlk1FrX4
         TnASYRglkxgRBzXIFweQ2gRhMShiYh2u5/sCjmIlNNGjNY33sVold24zfuHz7ysi0dHW
         wj0RmaPmRFBX+JfQgpGxjB44syIZEvMx189Ss756sepzHdKhJKTJRVAGhB9lK1nf4U/y
         iZuLh0kMujMkWtBhkiNaSWVQzSx8R0tTUiS3cFCdzwcfaiSOCSlsuwFCksn1mVkFncYQ
         tVwc9wwz+UB9f2NmLCFXD+g55j+zrrnVTUrFR0fmWrfN7VuAntQZe/eYVXWsdYLM65n/
         +aEQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792660738; x=1793265538; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UpzYIyETtrp+kpnPDh/4yQ1NnnZqaA+hgyq5gKXO1cw=;
        b=IxwotdNCHuKfjhRbfIKE0Omlv20UdPKRKi+FOPhj9x8dNnWaI6GEjyqUGoNY2lNwG+
         jui//yue9iv5dp1ZaHGgORXCS+bB0i85xKD4cZ1L6g/U2XtUnCrUf90CaH41BGNXapX6
         m5N2UlElDhcd/8lVNgiJysLWsyX/ZW0eLgFw6mqP8WDqw3i/QsvOeWCRwyLnpLgr/eMA
         1AFFzGSoA4K59sx5tWUpugRjvibzMaDOpoIpryUX7U3QQrv0vtXQfdrpqoacWjOpr9Yd
         9FP+elsePreJn5Ka5mwRb22gyI3eYdROnSQwqQFrT+lVG2oH+jdmd/Mrb/vfO/9rgxVB
         l2zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792660738; x=1793265538;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UpzYIyETtrp+kpnPDh/4yQ1NnnZqaA+hgyq5gKXO1cw=;
        b=tPvda59uNsP8DNb12+k8dj2x/C13rC5dT0IyZH4xoTe5RFU1CBBrPR/kk/pK86bV5p
         6E2IkotKgpYjxNsOrEP/IoAhKDwLeb+4SeNW/F2mnnRU7Uuko/qkPu2Bga65/US3wdfO
         RBCl2d32YDZYOKcxn0vBtuKrFy3OFe/as+C5wgsGQFOoxerbTLW2V+OAKmqzuj5RL/Fi
         j0JOL8+Yg8NW9OJxd6VLMbafnQcNjguHleumgi5CcBwhH3rPSenyeEk0gQ6ybDDnEdw0
         XNl6loxLbvkuRVqL0VPDmyfYV8Wa/wgyO2Zc4+AXw7uhhIF3hMWPaOKrqZZ600G2G21V
         lXoQ==
X-Forwarded-Encrypted: i=1; AKwUvBy436+9WHUWjCvrqf3iRsRKnVqQOd8u1ls4Z6oyLLauzQYzIrNFi+fNLqOYtC1Qn4RtYDogAoO+plcG/fA=@vger.kernel.org
X-Gm-Message-State: AFq9FYL5TzW47yZTuxcx8ByMb5iIGmW/eobuYEp7fJMmrzuwxLUdFpZV
	vwhD6XXHpWgS7vJ0rqEuvsSv5COlgzWeihckfEJJLCGFcdNlKTRVHPwrbSFQH2T3aoXOXxOAvS0
	P+qUten/nnOkWepA/Uemw1RzENjVrJws=
X-Gm-Gg: AYBFou0CAzDCWIgHyrIZj1v7jPWNjdrRndABmG9n/0lLTluA7+nDJaW94eH+RGXpIyx
	j0MqCRhaln+R1Mui9uTSdbqwxhaCrHDkb0a/q2K4mY2+JIyFOTb5RuRTRUICJ3denVlz4+8T+vd
	afY1vHqaeZYHoDSGVgeUI6U9iB5DrCNrH5IS7OQvabJP35vKyBG8n0+dtO6NLgFOYBP7jjeIFW7
	GsfPE8xvPYaIOrQRErc1rydo8OULA3hDQlCYyJKGsDi+4BINFJd7UmwevT+TCAC/gX1VQBRvHNh
	jGvO8cVt0xR1sAiNVD+Zq+GQOBDgIf1oYWSOGpVyPZq60gr4ysYyXqYjFuQrJh7+gE7vsQGJxzh
	mOEoMEACrWiaIzI0/8z+bhom6RcKngqUJcCflmzw=
X-Received: by 2002:a05:690c:e920:b0:8b0:9f48:7527 with SMTP id
 00721157ae682-8b1340d9917mr17873067b3.98.1792660738182; Thu, 22 Oct 2026
 02:18:58 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <pm-pmb-4552c4e605507d8d9b16-v4-213af356c0046331c8ff@gmail.com> <874iegiru8.wl-tiwai@suse.de>
In-Reply-To: <874iegiru8.wl-tiwai@suse.de>
From: Cen Zhang <zzzccc427@gmail.com>
Date: Thu, 22 Oct 2026 17:18:47 +0800
X-Gm-Features: AclHuK9A7Bf99Ub6U9C075k5xOErMS_EvaFBGDDf-HrdtO4x3RNaLVCvCzQXATw
Message-ID: <CAFRLqsW1Th+HRHgzwB49fQ7C3Ea79WHvgiG=EMGpb6kFRStmmg@mail.gmail.com>
Subject: Re: [PATCH] ALSA: opl3: Stop delayed note-offs before freeing the
 channel set
To: Takashi Iwai <tiwai@suse.de>
Cc: perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, baijiaju1990@gmail.com, jjzuming@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

Takashi Iwai <tiwai@suse.de> =E4=BA=8E2026=E5=B9=B410=E6=9C=8820=E6=97=A5=
=E5=91=A8=E4=BA=8C 18:33=E5=86=99=E9=81=93=EF=BC=9A
>
> Some issues have been reported by Sashiko.  Could you check them?
>   https://sashiko.dev/#/patchset/pm-pmb-4552c4e605507d8d9b16-v4-213af356c=
0046331c8ff%40gmail.com
>
>
> thanks,
>
> Takashi

Thanks. I'll check the Sashiko findings.

Best regards,
Cen Zhang
