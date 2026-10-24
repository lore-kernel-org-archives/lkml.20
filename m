Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792858716;
	b=iUW5wUa1FV80hwZ+AU89k0mo7yHsWEGCiVJwy6jlQi+yOPDxmH2zrSiWJtlbU6tmNCRg
	 Q6h7x8j4gzu76evqOaYXaZ3yd776Pm3yMlDsFDEfPZdiAjh5YSRcczagggSPB69hpKVh3
	 n3lOhRjoap1R+xAGPv0PsAFEsVZuOLgUeE9sUeDcTptCVFr0GtOQYXv6poH3Ybr28qvYz
	 kNNhre5ETSSYlvW2T5VuRb9pO3klYD1Yr4JBVbrtSf0+U7yi7LwApFe1F4LiAOcDpgNND
	 XvtXUOP43rLemvwmwDb9ukau5xZGRaAc42CHXs1kLZZYCJDbFT9jtSUsx6X5NGClhGQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792858716;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=wJl7a+8EQ6zIyPMzXI0QdmBaUpy3gczzvc67bhOuxfw=;
	b=2QxJiuw50OUn6zbW1G9ticM6Zzal1vxNthKfipztj7PHdEz7mj9P4JoNL7xY5QBtOj8G
	 qNbqU+NOPKAFZI21jrqTxILxfMYQuvGmrn2EpLSbfAjfMeaEbUqXBBcLWWWcF7xmB39t5
	 MGJoY4X1mgcmFfIFs0LTjO7MjQw0heQS1iUpDuG8M8P0TFVTu8IiauFl0lk+l2suf68lX
	 uCAk5yOYxQDDzI3XiCRkWhq8JCSOs/NBq31cF+NI2Q6sPOrXqdlKviPjfBHSkIUfTNdCb
	 Aiaw51FSIg3H3+VHLL7LhC3sMmaVxH7kNYqXnDdEkWggSG0r+ySi8E0v6hN1DV7lY6w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="OlXmPG5/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.180
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC316606A31D
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 16:18:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC316606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OlXmPG5/
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8ab432273c5so14350787b3.3
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 09:18:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792858715; cv=none;
        d=google.com; s=arc-20260327;
        b=ocxcHG5F2OLjnnzynMUSGtSfTbqdq3Ma4YTMeR6jRXEKiwnGcQSsb1OFEOs3BQZtvW
         BNBT+lK5jm9i1kHAlAAfcl4H1HStD+WlPU6LffLL84wXYK9ojk4XGZ+80qVyTjkQy7mL
         t3p89HlA9oPdG32RztahiYRuc9+/Ni/P8Op/UJw/9OwCBZbC2zhLBr1fOuEFhY+bNcuE
         hsz0XyFkvhbCWaFk7YnKMNYrtMTPgs8cSrDKlyV6x1iD40mpiqf7QuOoE0Ynn9wyg33v
         ubyw+KmDiIe+MWk+qD875lI4I7ftA2uub3obCUowHU4t0zYPbVsDO6EgHM8BRd3ffDig
         pdlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wJl7a+8EQ6zIyPMzXI0QdmBaUpy3gczzvc67bhOuxfw=;
        fh=VI2wzUb6HadtXq4XibE41lJURyV7Zl0EtPU0IrpSLVk=;
        b=LCgxufQFIp0CmJIPUMprgVs4mGuQTH8J+4PANMMPl769C9KAGe25BQdcQaz5Ko2I02
         NG09oxzUAFrIu2/lc3k/uHO6iRxwjsayRA4VD+mEmym/YNfj6tRi9do9+XkRZn+o+9WA
         Ha5P0QqMZEO/EHeYDTTEK9hf0/b4yLgcu/JSNw0342IlVAVyafBZH/b7VbZRfQ+KR9mn
         TUQGJt4e/dVkxrJALUSF+32BeEaR5lMeWJQzOlfvk9fnLbWouaNxlZs3G/rEK7At6yG8
         cgB38jfVQbv3kcN7HaFJB3689i2jwN1fzTJU6vDi4U4XtxkeqlqRnObWbZZjO0z5SH2C
         XzbA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792858715; x=1793463515; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wJl7a+8EQ6zIyPMzXI0QdmBaUpy3gczzvc67bhOuxfw=;
        b=OlXmPG5/sAKCL9I7yq00rAKjJUqs3lDGX6LAWPM12qMwvE2TwWLZuI969q24e+XN1k
         okGi8kuf7C7X1w1YRSajRzcFwtGWzOX9xA1fFTRPkhgYsldF6gr3b6gvx6a3cIxQ/B59
         lp1n0/CGsCt/bH5jPOj8/0TUUwS8ZBdoxdHSxBLFdu7foJ+9oIObAIxnEJKwMBtQcrQa
         wpkjXGXs6G3EdtIgwBH6QoTi4BUgaqfAfwTSU9JUU7arFcVL4yIGlwlA7gU+DUNbP3PL
         Jpqr9c4DkhdW9sOEsWXVxIe39Dzcs6d/K6m6dS0DlnzrqTVjLbISPmBlpUO+QWTw0kNP
         YjAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792858715; x=1793463515;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wJl7a+8EQ6zIyPMzXI0QdmBaUpy3gczzvc67bhOuxfw=;
        b=ApC6nofb5MJsa7ynbqZvKwvo4wdwOs+oWWrlTWsl7ZJoWT1XirWskj81sqVm6YgexE
         vUBKA6bxak+iuvac/ETLZoQEOza8tzImctF07AfS7dX79SYl2Yanu58ZZ+e4rCfgf/yc
         64DOoL0ONM4ErzaJ7BHauaTO8wnQnqJvuturgDF8G1ckLoJ/fSh+pb6FW6728SAIjprV
         upNHMY7COtOUYg6MDuazWxb+V5sZTxNqG4KE8I52NDw+v+EINhuqEEbyDQl2Q12JnDcZ
         4/nDtrgzARLcmOdwRjzVYx8OUNmDuGc4XWaaXcZrEjXEW9uBoveqbyaoBvydW/zU/SG5
         O7Fw==
X-Forwarded-Encrypted: i=1; AKwUvBz+CDioiCzNnQPPV6sSRpsVjfcB+2JrBLh8Xgxnrb3y0Cap6cfqP2stoLhfok2xjMD89kzqQ3gywPnV4xA=@vger.kernel.org
X-Gm-Message-State: AFq9FYI5HNZs8wzU411DiCKr6P7rC13L+gWnrsQdNB/dV3026RAcscSz
	2ohH1XsIDTAb/WaK/ixoLA2PvU3eaGfT4SetbTScYgvHQ4IEb/AMydqjXz7DAGgnF7OTRwFleNv
	+p9P4a26vRIM5x7ol5BQnk2nin0YVD1I=
X-Gm-Gg: AYBFou37kj11kd3bqT+qhKciq099VoRNeupe9Td802kruD8Hte2E6d5YJ8KGfkWYdQT
	SlWqDEFI9MFFXtXlgATcrk1qgh9+NOYWIup1P2Z8AIrpbVTG2w5SAQtI8Xutze24LlZfqX5uVSE
	t3Lnq3vD2RfCwGboLfASiBlllXix+OlRW+gm5Nznic4Qe5yQtesepg0v0BmquRQvXPUlBbhS/wq
	FuiVqW15FWBWuSztyps81Bru7xGl9K3EFoTmYij8GB5kKCaQX04omcGv25rcpQkR2mg1GBvblGI
	BfNQZw1eF6A2tSRUt8s9v0wEzB651TOmCGJOz20ccB3bsQJ4Zn5zcXgfmcaBlmyki7n9cdSuDK5
	PMJC5N88ecUExhkIWjcMqzBjnioFtO92NJVGFclTd
X-Received: by 2002:a05:690c:89:b0:8b0:e13c:2854 with SMTP id
 00721157ae682-8b1669e55a4mr18271807b3.5.1792858714927; Sat, 24 Oct 2026
 09:18:34 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <pm-ocfs2-objects-candidate-0087-v5-4888399e71ae6d93613f@gmail.com>
 <1868bdad-cad5-4cec-8d76-af6f3cd92479@linux.alibaba.com>
In-Reply-To: <1868bdad-cad5-4cec-8d76-af6f3cd92479@linux.alibaba.com>
From: Cen Zhang <zzzccc427@gmail.com>
Date: Sun, 25 Oct 2026 00:18:22 +0800
X-Gm-Features: AclHuK_VfC0_HAFy2LMxdYARoi52mIFRU4CCMwSsyLqo5xk4mZaw1sLNyRN_7E8
Message-ID: <CAFRLqsUXK3rX6-uM3+2cMmSCPYMz9WxNGRXh7zG1+1YhNxTjgg@mail.gmail.com>
Subject: Re: [PATCH] ocfs2: wait for filecheck kobject release after a failed add
To: Joseph Qi <joseph.qi@linux.alibaba.com>
Cc: mark@fasheh.com, jlbec@evilplan.org, heming.zhao@suse.com, 
	ocfs2-devel@lists.linux.dev, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, baijiaju1990@gmail.com, jjzuming@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Joseph

Joseph Qi <joseph.qi@linux.alibaba.com> =E4=BA=8E2026=E5=B9=B410=E6=9C=8824=
=E6=97=A5=E5=91=A8=E5=85=AD 23:49=E5=86=99=E9=81=93=EF=BC=9A
>
> Why not name the owner directly to ocfs2_super?

Thanks. I've updated the comment in v2.

> And "delayed release" is only accurate under CONFIG_DEBUG_KOBJECT_RELEASE=
.
>

The delayed-cleanup scenario in the commit message is also
explicitly scoped to CONFIG_DEBUG_KOBJECT_RELEASE.

> Thanks,
> Joseph
>
Best regards,
Cen Zhang
