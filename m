Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794542325;
	b=vPGSE7pBaQB/wz5wlYgcqSzHjqrFU89VKq+FKH/AuZOyLI1tOPi0tAKCdcIs9wGiLU7f
	 7qQ+TTo0glI60l2dbQVjKQ+PRi6Gnd439dBhV1y34Ps9dyCPEuBqO5qQqM/1r4bLkA2mt
	 m7V/kdOkOQmwLfXAlRjPVlTQXSglcF5qDO78orptFJUVRXTvi+CCv/fTG/inJDa+bAlfT
	 xE+59lphLnl4mvoFRqT4tIec//bp8FjHyRLbzxxdrxc/DwIMXd6thWGm1mKQSyi4fhFpx
	 pwWTr0HBMmIli4sRtQo7CJwVcEYY3xeAAGXNRyIakbkPNL8Ah5DyD6DAMmARJGALjxw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794542325;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=IyGhQCaD7T7hQLHD/OB5uRedIyEFI/0GcnFaq+FrCgw=;
	b=BXffKSADFi09GSQSdBKeVcWPIHlAnCpxaap7ZGAMml6Qc3zUJmAaNLcC0R0VqQfoYGIw
	 epoHMpHI3QGeSEA6CfHFMGhsaxNPuhoXpeab2b4aSCdJ6dhJAeR6/u+zVR4nwI6wMB0O3
	 cA0jAJVds0Ad3u3WxopYiawuN25cZociKpDDud6+34//jjcRs4wcM5uSIglubzTLR4Sw9
	 uvnpEg2IaNQGYs6TzZuVq3VpgHyLZ0JUxkLDsRDIzpkbVvRBxYJzA3z7+ov/uiV+pvelc
	 eu+8F7unuFoKuBWyrGjPpVeBBIzM2Hig8vB6wp3rUsJITix2o65rQzzTpNqa52RVTxw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pK1kehAz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.174
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16D3606A323
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 03:58:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A16D3606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pK1kehAz
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8b32daac9d7so4369637b3.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 19:58:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794542324; cv=none;
        d=google.com; s=arc-20260327;
        b=AUdWCjMFzmDARdK+TH56pIWi6nL8neswDw85fQ1RSNf+6GlWPn5IFU3KjzadnC7csC
         tjczL2ob9sxpDtLlpQSmoBDf5MhM3LjPrOOliVQ14iEMIighfndBlgtofc6vBfsa9xzx
         m16i0hUd9pVENp8P/9Myz0P88/kacKe/2g2WcivIAM7X6dIcRS2Kl3AuVQVfQhBDkZ0V
         MThYEP+4YYl2O0nE5TXNdbybSEzkPRBOZASmSVKZxb/wCr1GjFOr3aofZCXxSBKDBV9l
         RDGEc6e+N7E8OEgTChvsCCHrIrEyrfavpmyb9v/CAh5DfE3UPLKSHxPfLrxBH0e7DY47
         MUZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=IyGhQCaD7T7hQLHD/OB5uRedIyEFI/0GcnFaq+FrCgw=;
        fh=SD/p/EOqOXRt1l+XqgLlxQisankBd3/uYRkUH6oRSbU=;
        b=fE33zdb6qmLHUvT4wbVuSYyf1Bk9Om5NQ0Kku/7qaEWWvlwMeqkoiFU9h2PuyEKgJZ
         POdj+E8GV3HU2ZCyhJgU4utAhsZB/sgSmxBS5T4nYOvYjdPRMueeA1gA9W1u/CaX/ZvF
         lS0pRr/aD0WSOLxphqnXKFvHHj+EYW8ieC5yiDyMK1xmCnV3QRnVtfD8Vt9oLMARY1Ld
         qTyaenxpak+x79x70pMojTec/PXKYhWj25urYniLc9zMQ/rlLwbQnAyoGNq4x8h+N3y2
         bS9mLErvqsGcXsqNzlTpwWhCLeqNLsWG//vci4/HUAr+GdOMOMZjKg28YgZH4kJ1VeM0
         V5qQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794542324; x=1795147124; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IyGhQCaD7T7hQLHD/OB5uRedIyEFI/0GcnFaq+FrCgw=;
        b=pK1kehAz93mmZLKsczKmcKZ957T8YBm70nxhF2OoziKISxf/zC8rFz1EL4ay5Jq7o5
         ex5aaaN9QPyPAeSC8SUQM9TeVMAvxybV3C/DRPfF6DLhmgTti7JBHSXyB6UDNUEFRXt2
         A3aelOOxb9TaAYSUAiTLHXwiFWwAjNqFIWiWyHHc4tqHKaJ/qRx/hiJgS3BM24AI9ugt
         5IFJmonBsrpCp2SDkR8BILxRydMF3Gy7jYTbr5QqkHG+F8+L624d9XtqtUEg+IibhScr
         tgZF0wmAFYd8PxT2otnunvBZM2Lj5lY+MQtZI/SuFGuYT9OvUCGVKgRAKDosvqk5c0eF
         WFng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794542324; x=1795147124;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IyGhQCaD7T7hQLHD/OB5uRedIyEFI/0GcnFaq+FrCgw=;
        b=m8GGSufedjV5LFBLGDSs6RIGLPZBj6bp9rQICNui7YsfzYyyIUjZz77Wm/U5Bvxklr
         ldb/85YbFx40R9+IyZX87m+QGtfSS2XaG9TUP3A79ajMhr5lUnOlgi1SPxruERgFBFcl
         KQkRqTnwpUvDceN6z1vA/UC1sPOSzczl/M1HyPmmsobLxBrTyb6xh1HZ6xxw61e4GbUm
         k9J+cQWTOad3IY4isuH7qRIH8t4aVQRSfqEhZVcUkcpTMecDsXqkUS263TiYvcEqkefD
         sovkdLihoESm6X0yg82ekIL9T84FQfVBmmTiKVQLQXJe+v61c6AlmaIlEPFmWdFjMcYF
         tyHw==
X-Forwarded-Encrypted: i=1; AL+hErG6hmkq2eZtVc9teb2F7868x8IMzI/cWwaAXsm0bcQQmdr3t5pPAnE+JdtrlFOl4r/ItFroaQ3FDUy1hPY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8qHFvK/FnnxpJogu7EMviAPiBU9QkSjRdcHI92ESwQ70qz6CIw
	xEJx5Fa9vsToWlyq3VVKVYNL86+Een+jIoaSrKCd7c/h2AgRLf68sPEobip9TB0vb1ztWl0gLKd
	71v9owQxSUtqsppdJlNss0xtX3FN3pIY=
X-Gm-Gg: AYBFou3/ssLD+DGYRS2WWk1Px63e9NmAW74haaqGPCCSnDRg/Y/bEgQGjZMPHcNz8NP
	yDOneRp57DThbGiH/bkyaITTYJ6lZqOfLtgZbj4snG1wpO3y91WV6YLNBv3RtFIUCWaxuoAlkvW
	/HeBQzNW9092pr/KsLQdIKhDSsyxaMd+8pm+z/8WS/qcsCnIXUzyWvAx300U+cbXVO2US3YMcpz
	s09tDVyf+qU/745s2/bDvFUT+QyLzoZ+XqnySuIfbzqqAEH51WS8YtWd1EAcGoHWotdg9u2hVmL
	IvpPtDsVPaGDBfkTDzkK2TFPWqpy7C8KrTenGP44df9npWDOvJY3hTq9MGRKdk35HB1Qy2CacEp
	s0FeKY+J97e/nfcRB/4XGkYwOulV4ZxScTUxNhQ==
X-Received: by 2002:a05:690c:4990:b0:8b3:b31a:203c with SMTP id
 00721157ae682-8b3bb1dd781mr31064937b3.19.1794542323529; Thu, 12 Nov 2026
 19:58:43 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104133158.3187525-1-luolongjuna@gmail.com> <avZ9Ku61M8z-2axF@jpoimboe>
In-Reply-To: <avZ9Ku61M8z-2axF@jpoimboe>
From: Longjun Luo <luolongjuna@gmail.com>
Date: Fri, 13 Nov 2026 11:58:31 +0800
X-Gm-Features: AclHuK9vVOZUj5qgELVIIKNjLnGByl8-yGoOG5ihuzJR5hbFOyoI5OJEqSJb2Os
Message-ID: <CAKL4jwXA4OBVLFGAP4DWw6i9d5bneU=Ur=D58FnrssOt7ygm6A@mail.gmail.com>
Subject: Re: [RFC PATCH v2 00/11] objtool/klp: DWARF-based cross-build symbol correlation
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: peterz@infradead.org, mbenes@suse.cz, pmladek@suse.com, 
	joe.lawrence@redhat.com, song@kernel.org, puranjay@kernel.org, 
	nathan@kernel.org, ndesaulniers@google.com, morbo@google.com, 
	justinstitt@google.com, live-patching@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

I understand the concern about readability. Since English is not my
native language, I drafted the content myself and used AI to help with
the English writing before reviewing and sending it out. I'll keep the
information density in mind going forward.

Just to clarify the background: this design comes from my practical work
on userspace livepatch, and v1/v2 were meant to present the two
layers of that design as a whole. While dealing with LTO in practice, I
ran into many recurring correlation issues, so I tried to abstract and
model the problem systematically rather than hunting for corner cases,
and I brought that modeling process into this review.

As noted in the RFC, this patchset is intended to validate the
feasibility of the approach. I wanted feedback on the overall design
before deciding whether to take it further.

Thanks for taking the time to review and share your thoughts.

Longjun
