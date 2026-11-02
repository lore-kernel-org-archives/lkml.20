Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793651082;
	b=rPwzQD0vIsqpqSGhJdMV6kviYoCEQ2uvtjlkT8pyfghrITJodBbTysgTTB2CQUzcFd2p
	 S5Te2p5s9QOQn2kTn/C+vCCnpsqRVdLncQwAroLyxN/sXiNIpTKu63KCIJmmdJqrdSo7A
	 qR6HlRFuEdHT8kDZSj3TF1Z4q9ZQ5XfR12CMrZhtEW6K9cyIVo83Ukk5h5YIuXHOy3fGw
	 uQvaQ+X0MKydcn4aiVGWTvy/KIANvY9uiHTsP6NXgmse5Kev+hqs6TFqDQj66exfDmnhx
	 vW2S7osdIjlASTTh+gU72+YEHQEN2Sal3SSx47mZbtbnSyKEqQYdzfXq1EnrTJUza3w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793651082;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=pRkX0U8+HuQCFFzjR90UGSol1Deg6kqBr45BiznV7xw=;
	b=d1l/WQ0KYHZg88/BO3lSC6MM8/aBhl2/J5+RdsBocn9CWPqM6qLghn9i5qmn/L7BryDt
	 aBzwpSb3ghFo4WhLSziowsm1GMGnvSz+lAvvi1fpnAVNbPCruzCiuO9cRfJt+sVW+mj4F
	 3xXE5kxMVZYjuLgr47xGtLRLFYBVm2bBMw+U9L7FnQ1ysbZt0W0YAQPzCC9PpsYRNFKaM
	 n90K9h8lkVbTJD7yCx0heETD/IRWLXU029hQKio5J7oIijSqsGUXof0eVv9FUvQPFYX3Y
	 V7tadiMoVxJLPgoh/vKeBrZaapIrJwd0x7TH2hYWaIN8gIigrZh+xEZmtBvPBl+Taxg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SvOmcQSh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB8D606A333
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 20:24:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DB8D606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SvOmcQSh
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b1aa36fc0eso1879a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 12:24:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793651081; cv=none;
        d=google.com; s=arc-20260327;
        b=E6adxnhGW516mahMi+vzWsK10L31GMtJS6XBOJcA+AFqgRyql3Qmd8pDDQ1T30bF0M
         tiXU6ppVXX8/Jij+BMt3NjUO6S5Zx9T1fSPZPzhxqOQGW0SMb24lYWh0pJ/DFi3kMLB0
         sCezjCqTOClHdr5Nvk+Fx8Vj3M3CCf/aO7OjuaMMYr1pngDOtYcv/TzlIqOdiKJYd0M8
         x2zkcmf1hSotiZDP1C9tEBFmF3o/1uQm5IXVnbiRthrvOrnmzUy2WuqUqgYAtzQBOPYj
         ZcQRVgjwN79F1Kvs+K317MXlDAemzZtsLnnaUoHcYFgZWjAPesK8hJL13Rez3RruroLR
         p6cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pRkX0U8+HuQCFFzjR90UGSol1Deg6kqBr45BiznV7xw=;
        fh=+LrfyonmgpMvczaYW96r09f1/M3laIFuO7qQuDP4/I8=;
        b=PaELfe9R0GPYp3kdACKqjP8YhzgKNx7AbHM3aWMiB7kHcODJeI6LBLtxL0f+lJ5HY/
         WZ1r6iJDCi4RZoA//7UjizWhnJ3S/kgM3idKTB6DdBHp1IrgCUM31QWlCFhTaCV6hNX3
         01UwjZ0D9fE7THCybKyH3JnZaHti/yn8fpSQh09kGvY0iy6Q+WjK1Shu/mBU7HMcCJmK
         6IdvWDYEboiVLAisBJukrIyYj6Cqnbddt/j2GXJkKBDbb8xpqgCsLYIvbV9zNoFuxcKb
         IPHHIOgJarntwBmdWpMYC9xJg94RgrWDWjkYW/xaMWog8GSg00tOgaAKef0h4biMRiv4
         jdSw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793651081; x=1794255881; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pRkX0U8+HuQCFFzjR90UGSol1Deg6kqBr45BiznV7xw=;
        b=SvOmcQShy/Lt3LE+GpGQ7EhkwoAJ2Oh4dl3DKSKKoUDkMaOirBiVW7+e7Hcr3SqfjR
         SCzAzbBMhDNqzD5P+3DXQjwFtm84mTA9TiGZW9kYlDPzlPeRS5X6qXrkHLehuL+oXz/v
         a0tJQ7+URmRTDMS+dmS4t0JA8BOePVO4yJtsuCe/+i68+3svgEdr6NJ+9BSxzhGWJtzX
         D2+3vrhzSS4IGrh4b2ds0fRUX7ytMKUYob9XWOVLjynhVmM+QgInZDmbS+O7gsLrBccc
         92P5mgdx9E1rTjlCF23JPDzYMGMAom8d73U2aOxjDZhf2pa+SJ4+HkV7kOYcZ1IkzSGp
         QoNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793651081; x=1794255881;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pRkX0U8+HuQCFFzjR90UGSol1Deg6kqBr45BiznV7xw=;
        b=jFhloakflteOTEgZyrir84DiPCPu5Ch13Rz54v+0NgTKB4regYRfrALBvfriIRYRID
         O7mhNm+96Xsjgq3ufnk5yhFRP69tO/xi0YFFTCuBdEGq7EeIn+TVvduVhNB7EPPAckL3
         EYJ0y3JRn4W1+UZrGBahFC9cIX9HQCsu8KzA/R+1J8doshzXOmsrqYvHYvKPdLXM+cin
         /WcavZPE2q7Aay+V0EJ18EqHH+i5Mki/1K2UF3JbQxY5rFu0SrmIJ2TMqVz8+s6I5/6q
         3YKyAALYxa3mHLkDvIeVAAr1WCkUxFnvSDeJRscTPiIpOnGFM+cjVLJzW1zCn1dUd0O7
         zR0g==
X-Forwarded-Encrypted: i=1; AKwUvBynhNS74Dhb96pMYVHttqafOQGgiM0Tt46fgDckqrP1wb5DJpqYU93AZ5pUY1RsS+9dedoYVks6YBxbDpQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+UPtoZjVuYg+xwsZCvDLAxKVx2Fhf/YZ48O57fbz5NNvE/BFAt
	aSNPzR1Sre10fJHYOdo1wXxjbcQsp9xw5hh017HLbs5ahs/FpKk4MrbSwhsxo3WDOA1OqIq1LC7
	y1da/CWxK/nFwuRcsmuFcOaGw301rPBl6p5E/AWcU
X-Gm-Gg: AYBFou1Pd/ARWMyaOGneIqGbxy4g4gA/H3lnLdo8ueT4rsrBEaErB77Gl4Fhnci4PTH
	NhO2RvKlCq0RL7YkBnEqFQtXpAUNWo+040zL5wD9huirpqGVN0vNRpgCDyyD7Uq6xgdctDbAe/Y
	FGYgZUYRs96MZqinYulXWd61Y8yRH2X4sIetltss7a8wyPAMGZ07zXXpmFKlNBz56nHc9+/jRGv
	94JnD1B3SwOTVHMQ4qoPvnOvyOEf9dAmCiSx5Jfh7NTGL2hYrOaijNr+22Q5UZtqInDGfV3kze+
	Heepz2myTHCOsVFvNPAFTsjd598LasG071oOt4wCJxviXQrEg1sE9ajyzEYk13AqR470ZmbASSR
	n4lQ13MT00ihWai9K6/4aMgvhLp9sUJYNhKxhvgr76GUbYdUEWTwU8dDN9GjwOHFUdOFxRY+/yP
	Xo6PQBRRqw2VAY
X-Received: by 2002:a05:6402:a20c:10b0:6b4:6725:f2c6 with SMTP id
 4fb4d7f45d1cf-6b539d6a214mr5220a12.13.1793651080182; Mon, 02 Nov 2026
 12:24:40 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102191438.1059771-1-sdf@fomichev.me> <20261102191438.1059771-4-sdf@fomichev.me>
In-Reply-To: <20261102191438.1059771-4-sdf@fomichev.me>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 2 Nov 2026 12:24:28 -0800
X-Gm-Features: AclHuK9HmthtDhK5Se7ln97xEjRHJQkrIbx6CEUxI-rYHFFjq-AxT46s87UOWio
Message-ID: <CAHS8izNMpH-RJm7mk=-MpMMT6nc1_AukmLVHmh2r=AoyBmZPmQ@mail.gmail.com>
Subject: Re: [PATCH net-next 3/7] net: devmem: use niov_shift in net_devmem_get_niov_at()
To: Stanislav Fomichev <sdf.kernel@gmail.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, andrew+netdev@lunn.ch, 
	edumazet@kernel.org, horms@kernel.org, corbet@lwn.net, 
	skhan@linuxfoundation.org, rdunlap@infradead.org, michael.chan@broadcom.com, 
	pavan.chebbi@broadcom.com, sdf@fomichev.me, bobbyeshleman@meta.com, 
	asml.silence@gmail.com, daniel@iogearbox.net, razor@blackwall.org, 
	leitao@debian.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 11:14=E2=80=AFAM Stanislav Fomichev <sdf.kernel@gmai=
l.com> wrote:
>
> TX bindings use PAGE_SIZE net_iovs, and the TX lookup hard-codes it.
> Derive the index and offset from binding->niov_shift instead, so TX
> bindings can use larger net_iovs. No functional change, TX bindings are
> still created with PAGE_SHIFT.
>
> Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
> ---
>  net/core/devmem.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/net/core/devmem.c b/net/core/devmem.c
> index 32fafbfa1359..6339f221bc82 100644
> --- a/net/core/devmem.c
> +++ b/net/core/devmem.c
> @@ -455,13 +455,15 @@ struct net_iov *
>  net_devmem_get_niov_at(struct net_devmem_dmabuf_binding *binding,
>                        size_t virt_addr, size_t *off, size_t *size)
>  {
> +       size_t niov_size =3D 1UL << binding->niov_shift;

I always dreamed of net-iovs can be non-power of 2 and also can vary
in size inside the same binding (no reason why not), but this is
providing excellent value anyway.

Reviewed-by: Mina Almasry <almasrymina@google.com>

--=20
Thanks,
Mina
