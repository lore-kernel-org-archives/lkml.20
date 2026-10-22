Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792659998;
	b=Zue8vCXuLwRWnYhFTRDDSM4ntvzgaAZP8Kdw7GCab39BbrveQWGt0lsRKHmozRHOIMBF
	 0EyUiTr9hup67L1Si2u4eUfT/uQJe+58NPQRoEUjuLMPLwcmlzmuzfraRfqCZigRetkyp
	 N+XPm9CFzCZPgOp9V1uS5SKomCk1oGgw+GYgZl8/4PrnyApl0EINRyDdKRXz8AfVJg6Dm
	 w1Ao/F5sO/XCFp5IuJce00UIGOCm9qerTST+0a/VbWk4Xq73aihttJfYbxhACc0S9hGEL
	 mPTS7kEjNPR187+/VAsCjRY9fjoTzhPZR0pu5wRf/sXBNU0AvC+o9GgPwDXzN08oCrw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792659998;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=UyTUiRbbZdV2Y+E25wMhrOuOBCwv5kPE3Qb6sCbOz4U=;
	b=O96IA3cEGmMscyeLVHOBkw8hKAvOkQtkqyKn+HD5iW+x5GfkA3EMR04i3ECbR0Fnb5Hn
	 NKRI6p6Tyy+ocdggneNT9gKoLnHHiJ9k4HsG5oODyuWtvVAu9rr8EW9pcWwTXZQfS4lcm
	 VNug5kkFWCq2wXIN0u70cp3FPce3TY2NRNX3rRLAi/gcXyIf4zh8Lwfwhsexdlyr5M9/h
	 lonkAbjb0lo+FfibBodqqyFZoutzeutVEvmyMd4Z82WbxKqnzxhp7119sJLV0Zf35erf2
	 4aiDHSsZ3zU5qIxhBOcLcx/QHMSjwPaRSSIgWV54iPaUAy36D+u3mWCtRbUgtr6/BQA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZgqbS578;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.179
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723B3606A31F
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:06:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 723B3606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZgqbS578
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8b125371596so5743847b3.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:06:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792659997; cv=none;
        d=google.com; s=arc-20260327;
        b=rtCJWVsO7ye63UXGHotpIrCXhLRaq3lECJ7BMVhjxA1XtuqLmCCu8Yvxq0RV0LBOXE
         /hHe7r+lB1IBlgxSIInCQObCfliKwMcuDJoUOMWdiWHJ5KIlnk8ZTwxlWbc733Xm3N9H
         M8YFiwRbBuMNT54KMJUwjjcV8rWrJrUUZNw01zHOV7stofyI3xaSL0K/de77ZSE4iyiH
         AXCDsG2Ymigw1LXQCiRQqbnps5HL6O5cztGfl2r07F7jKRfR4DZnSUYsmWDzsv38a4zS
         9nCa0KY4ZmD40IkeDxQ35qnRN11stIHy3GM+IW1SiXNkktuiV5e6m1krgSek1vWQwWPz
         8tjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UyTUiRbbZdV2Y+E25wMhrOuOBCwv5kPE3Qb6sCbOz4U=;
        fh=SfsC4J73k7bEzuMqmH7o9UZ8f7+7HTs0gi27U1vIPgY=;
        b=q5W1IlNlIsoUlDxfYennKSRCYT/7frl1NqFNXuO5vuICiaHU52mskPdhzbRAQstrNG
         8Sl44844foM8e3BIEQr6weWkjP3kjVPHFwLjToGgFCSB4YTEW3bLAdi25wzAUE7pJSDQ
         k0J1IayuD2Jm1Ti4lzmxm8RNd/5Krrr034V+7jiZtug5TvRbZbll21RNgSNUCvThG4Q2
         WjH1YVSnFvEkebLqy+Zfkbrccyg5mYjTP9zK7P08ApSFFZ7vn5ETCmhZZFQxhC7zbw0w
         7OBDWsIfGedJ54sLPHLkjqAdEJsAVzccRXv62lMwlW0xaUxlZsrBKC4wXS2gvCkkj+ut
         2V9w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792659997; x=1793264797; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UyTUiRbbZdV2Y+E25wMhrOuOBCwv5kPE3Qb6sCbOz4U=;
        b=ZgqbS578/pc8e0eVEtIBlY4iI0uHRHMY7sqdMPuAFnhnad53C7K+/FfjUZPjnsPcE4
         eZAp25oJoGp6/l8rW31TWmbQCb13bdm6LAWTjX3qqpEWiJfs63VmZtVNFxysQntKbnaz
         a0qNT+4K2PdoaHjMEKlTk9iiYGXpGpT9gfjhpartXG7Va7V8ewXF0AMiIkdRy0tHFK82
         nmZx/axt65oeeycgVFI4KnLkjZ/1IcFqjMj5mGE7b+6gca15HzOo5Ez2rwym7rr5onSe
         tt5wTiFwjQtbXXoFq3bz9KqsH/bq6aQWy3Oup+6QNwmY5li8AzZd7EUYGUn5G6LwOETj
         zpqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792659997; x=1793264797;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UyTUiRbbZdV2Y+E25wMhrOuOBCwv5kPE3Qb6sCbOz4U=;
        b=iYkRXxmJq/Vp6zwAAhAYcPUrh86tMPaX5Z42yDGLEkhwuCZ5goCKiae/MTkGFwP/35
         uzimEpx1yvjcZy2xj0AGNVHhoVHuWvsFklHNdgO0E+MDlsOeDRKxYqv0k8YkoGW8fkDV
         p2UsGpW0AQNzdTJNAT7neahgM7fXKgNF5GpJGj1x/wfj5AipC5KQN0Pr297pLqpRcwlU
         pTYvBWvqzQDmZ9Z0wWsHML0zB2SkRPnlVHqdbe1hXRFXOduVNFFeBSj5HpPtb7GXH/Kt
         6sTRWce6Wh7Ln3wGrfYIEKafd0gDHjc4adAIPNsZJ9GMMiAQ525IfnOUfnn6YZYmKu5C
         j7Xw==
X-Forwarded-Encrypted: i=1; AKwUvBzNVZl8silge3L0aX1cPNnMGPHl1xtr7bANd/kgO6pe12uDqxzT4APXn1C0hRBL+LX6JYYv6N3GhRZQT7Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYIfZjtgO/Gl0W++VsZ0O4wDiSzB94bzg1ntBFn5S5f1P6slc5Hv
	dpyDWx+lB5tCbavMa4eiaarFrWAAfsPsaMw9/6aYXeZCmaHSnJbgDwO6Bl3paxPMlRs4DNppxBq
	flTDAOVw1+JXQ/JvgCVaAp+Cd0c05c+U=
X-Gm-Gg: AYBFou15D5BYNtsp5pajlZmcIaESmlkfFCVbvT07FU+KtGb6i6v8uPBBVA2lUJtSg0j
	ahNpTTbsuzNKAaK99irVDVQzOUY2DuaeM+wkzTl0wxBo7EcQOMOXUpxAaSzXUups4PSgX9jpkn/
	jkyqs5m/OadhWC5bwhtGvQYwKAyHmr0z/ytVM4qF11eeyRgS6wXfzzv87IDZAACIegaZGGHStD/
	oSpFdW1nfqydcZTxJGYCfPAVShwUi0qCpAvMC1W40L3aIMvZnbprVkc2LV2aKkyv8Ks0cZjHJba
	6r1o5PsnyTuzoX9ZbbY5pw6hB88zbAh0lBKT52ZvDDJw33eF/kNSKLuWbJHlKXR5Hdr2ug4FLLr
	V5GOureWpYZJqWCdqavC1zXQBYycbwJUg7E8W6m0=
X-Received: by 2002:a05:690c:39c:b0:87e:645c:182b with SMTP id
 00721157ae682-8b14566215bmr12678527b3.26.1792659997417; Thu, 22 Oct 2026
 02:06:37 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <pm-ocfs2-objects-candidate-0076-v5-dd198d8a9358ad81f70e@gmail.com>
 <71dabc63-7e67-4c25-87eb-17fcdf2ddd3a@linux.alibaba.com>
In-Reply-To: <71dabc63-7e67-4c25-87eb-17fcdf2ddd3a@linux.alibaba.com>
From: Cen Zhang <zzzccc427@gmail.com>
Date: Thu, 22 Oct 2026 17:06:25 +0800
X-Gm-Features: AclHuK8qr8lGZVzy8X9c2s5HmaHwSWxAw5vzbUjDMFtGTi0PMRSmysIaKNfkgTU
Message-ID: <CAFRLqsWR_ud2TH9wFnErxvayZODG=SN13c1H-AS4XVL=gytwnQ@mail.gmail.com>
Subject: Re: [PATCH] ocfs2/dlm: drain join handlers before releasing module text
To: Joseph Qi <joseph.qi@linux.alibaba.com>
Cc: mark@fasheh.com, jlbec@evilplan.org, heming.zhao@suse.com, 
	ocfs2-devel@lists.linux.dev, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, baijiaju1990@gmail.com, jjzuming@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Joseph,

Joseph Qi <joseph.qi@linux.alibaba.com> =E4=BA=8E2026=E5=B9=B410=E6=9C=8821=
=E6=97=A5=E5=91=A8=E4=B8=89 21:02=E5=86=99=E9=81=93=EF=BC=9A
>
> dlm_unregister_net_handlers() is also reached from the dlm_init() error
> label on failures that happen before any handler was ever registered.
> So in case of an empty dlm_join_handlers, o2net_unregister_handler_list()
> walks nothing, but o2net_flush_wq() still takes o2net_wq_mutex and drains
> the entire o2net workqueue.
>
> Thanks,
> Joseph
>

Thanks for pointing this out. I've added a nonempty-list guard in
dlm_unregister_net_handlers() before calling
o2net_unregister_and_flush_handler_list().

Early init failures now skip the global flush. Partial registration
failure still unregisters and drains the published handlers; the
subsequent cleanup from dlm_init() sees the empty list and skips the
redundant flush.

The list is private to the serialized module init/exit paths.
Nonempty lists retain the full unregister-and-flush operation, and
the generic o2net helper is unchanged.

This change is included in v2.

Best regards,
Cen Zhang
