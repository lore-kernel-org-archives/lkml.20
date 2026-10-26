Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792994019;
	b=rdtkT5q5Q9I8LZCyNal/UbYE1Xo51abslRpipFwuNQQaD/b/xrUxntHl+DIw3jRg7yTl
	 5j69eVseuEdnE4C49h8NbITw+XcCKwkueRh6vwRiLjvS41zgWZlo0SBG4q9DUwxwYp540
	 7RkR3XxFXd54W4I9q9r4NueGZCqGrRqjJ16LmjUOdLSE0tW3jFBhKqZ5bPyDxXlo5buoB
	 Nxp3n5frObWeW0wXXvwP6kcEAaZRy232wU60Wz0UcKxf7SODGE8zGV4i+Kb1dFMuWFQAP
	 Y/CZzGwG4EIEAjvHmzQb9SOajmwrKHxFGwrv8sQyMP8u4GfOiGvlgu1hwYJhuP5nu/g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792994019;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=c42lkr4if04AZ8UiQQ83ZlSvwlPXm235lZQS5qXaBN4=;
	b=X25rWmJsvKDrBxAJn6cIg9TmdPLnzzL2TxYubxO2qkPkjSrMbvJ2JYe4VlF7kPO0kM6Z
	 uRwULPDdV2+TjCW7e2QiMQtdiSgkibnokTLpGb1nJuSQXpJvrjua8LW6E4BTeSV+Z4Bj+
	 iTMwuN4BVyW5hAIYgOmza7cbl7TuHjh98JTU1JOptcYUhn1pRsFMBer54j+Vmc9fwkA5l
	 RoCF7Hx8C+8k/8+6pFunq4gz2fgzG5zDm/eAYcc2BTNnayFuWoPwpnlXKNozB6vZNpupV
	 jxg6eAOVTcJFRlQRtXN4WIEbIeiEpBXn1zVXzacrUDNxJvT66n0nP1t3BPlSz6swFDg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QQnJ8DO9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.45
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BAB0606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 05:53:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BAB0606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QQnJ8DO9
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-7037daaa820so956781eaf.2
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 22:53:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792994013; cv=none;
        d=google.com; s=arc-20260327;
        b=gfZZ5uH5Y7Tx331dmlafgY8fKeUEu76DDLh13fQcPWohN3RnFPoVr1zXuRDUaY54iW
         p9xUU2ttR+0Nap8sGIihq3E2sy5P2OB60cMYjoJkstG0aFCLP+6v3fLTqz9ztk7Si7pk
         Jb2LehR/Ch4E5yqpke19BhMzMj2K4wnR+IUyYB6UiJ0BcQxGLdBRAWKQERqZPHLihXMI
         2WJFahNd2fHvVu9TdgWPJCDeddO4PeYvR7PCF6xrv3ZAFR8pyj6uWKkXpIGm+LyHv1LS
         bbJRUmHO+kMc9QiEMpwHCDArh66SYX7dgDWl1iaeLg7j8+/AySu2FYCZoM3Tch+EqljA
         ZKBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=c42lkr4if04AZ8UiQQ83ZlSvwlPXm235lZQS5qXaBN4=;
        fh=yTXwDkVnNb1AkfS4nvCtzmY2OgTUQIIF+Uge4Kj3cBs=;
        b=lJaWmytp/WA9541tMJjtH3pYEtoXiHboI/2Us/RMevGjyVedOlg12TtFIkZgBnR5Ii
         JhFin8nGaprBDEJlwhSr9Mvhmyids6pjXhw51R8tqr5SDEl4RFaui7gvz+X3SuCAat9t
         sEaI0G1vP4jAmykQYQE1aa2IhoCYM6eqqEIBBOEOeOAt9oEuuUwh+/XLAe6CTwQJ2hgO
         WPKOyFhNlqCv6fbmZhQjPFHqUGODIug0rF3KwaiwxVbF92rTVZslhGJ4Z4L1b8JTeN+t
         xEVKx41FLDavH4Ku/lgZ0RIJoO8k5yFaYOnxz1uzwqyd0V7Ww7VUPX0ncIbiPlz5NLnv
         ayYA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792994013; x=1793598813; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c42lkr4if04AZ8UiQQ83ZlSvwlPXm235lZQS5qXaBN4=;
        b=QQnJ8DO9EggQU3TMGFardjJ5uAX/vee/3ByHaeIbtYthr52YjYZ29z6ZP8jNCvLxoe
         AUlQ85YPlpt2zNV+EI6lug6IHgxmZbXX+GRZ/TyuOB5nXYbAFCJM6y1ogRNKRNKaOgP+
         ujDFsQJwkFVqSgRmpoQxzktgNGQybDgZ+YZgN5vCxpItTAUJzFGE0PO0whwF3fGKPKIW
         DHsvILV4AHXNd4mMdEH3CFQ8FphAPK/J++qaPAQ9zUjsKOO86PttAtjXrDc+mfdVgx1k
         kKvjnSLhck9aw+2BBk6pa8GShT6fPo8bzqOFIR4My6fRRhG+pEbZz0PE39F0Ot/+9ydg
         ZbUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792994013; x=1793598813;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c42lkr4if04AZ8UiQQ83ZlSvwlPXm235lZQS5qXaBN4=;
        b=IZ2MEO/5uA9ZDsS8a5jRShzMoXAkXFpNACFDmLM9iIhiR4wEZuZgRjwcS8DQG+Uq35
         Snw7UAghbmQXvSlJICZZ3McdQpm1R1eG8sr6BL8qf0M5/uFqmYaXIz2+M43JCmYzxMFh
         eHwA7icM/HDY1HsELUTO23sap/1CdxJXkkngpSeGa77UxtRq8jU6g4fLwDY4uLZtXe+E
         1mIEpu3kBfwPStEgHWh0SftimgQTcz5gkUxsicXs06uvpIK30TA6bIFyspCYIoAjdmtN
         SQsmM46O3UhgY7EJIvH2K1K7mkn6UPvvNwG5c3pFB7vro1FpQ1nx1HteBTercbIEHbJF
         mtbA==
X-Forwarded-Encrypted: i=1; AKwUvByOat0LOWYrIk3GcvhQUBqH4ifIU6athWttxZlZDp9onGkpUo81muwN1a49EQyvjsCEfQtyz9Mxc4Stwvg=@vger.kernel.org
X-Gm-Message-State: AFq9FYL/00WstYqIwR+7Hy2MHasrefK1THmf0Km0CKqWhyVt4TOYofxg
	OVFqiU4ZjkZqgZ/zfrd84KMN9jQTiHvaKR37UhBc2fYwV9d40zUTw/KbG+0wSVfnj7QsLdUOcpy
	Tc36I7nRb5ent5QdsFNqPPy/+oPa4FHk=
X-Gm-Gg: AYBFou0nN+BvggViyCvVOeAhKkcaUHwBgXxwBCtnQcgT9u98wIIDG7zxom7EcCcYRtE
	fpVApqXR/Rjs2VoYOH4K1u6f7NCMnWeSLzYQJS7wlD9pyMbbwd08wvvtLxrzrvg7ghPzN9nHg94
	PakFHA4iT4IAuXFJFawr7/TXLj50Mn9a33eiX2TueFGaVeDLo7SUmgbLbrik/2gSvJaAiy1qEcI
	KsUANKev6cGbnDsCLr8A7Tnn9Ap89+h8WPdO9Q3Zsz2q3lLwHPcnrRRBnhcwqiCfeaFX8YBJLYZ
	n8zzyS+WsYS87C9aUBKLrCshEkReMJm54E7foyVZeZHZapg6XoHB8aZM4lNTIolaVrLOUvaF3gW
	igYRsyYvcsU8+untdvRiC6mY4rWhRDKbX/FivdvQZz8n9/ybzwmzxQAnNDpRASbq3BZHY8MI=
X-Received: by 2002:a05:6820:f012:b0:6d9:779e:4f78 with SMTP id
 006d021491bc7-70ba0b69198mr2999266eaf.9.1792994013424; Sun, 25 Oct 2026
 22:53:33 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261025164003.143864-1-himanshu.bakshi478@gmail.com> <at7pu4hldDTgZtXy@stanley.mountain>
In-Reply-To: <at7pu4hldDTgZtXy@stanley.mountain>
From: Himanshu Bakshi <himanshu.bakshi478@gmail.com>
Date: Mon, 26 Oct 2026 11:23:21 +0530
X-Gm-Features: AclHuK9kT-5mgEdeGVApWUOJUbhIUBpwPQFl-e5bzcx7W80tdoK-Z_OClF0xJzE
Message-ID: <CAGLmz9JaXM8s4BHQ2Cn5QQdBZpzDXmHyb-GQ_jXtj4Rz6SJOJQ@mail.gmail.com>
Subject: Re: [PATCH v2] staging: fbtft: Fix line length warning
To: Dan Carpenter <error27@gmail.com>
Cc: andy@kernel.org, gregkh@linuxfoundation.org, 
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dan and Andy,

I have sent over the comment on the v1 message chain and
also sent over the revised patch separately as v2, I will be glad
if you will go through it.

Thanks and regards,
Himanshu Bakshi

On Mon, Oct 26, 2026 at 11:18=E2=80=AFAM Dan Carpenter <error27@gmail.com> =
wrote:
>
> On Sun, Oct 25, 2026 at 10:10:03PM +0530, himanshu bakshi wrote:
> > From: Himanshu Bakshi <himanshu.bakshi478@gmail.com>
> >
> > Hi Andy,
> >
>
> We don't need this in a commit message.
>
> Also I would prefer to delete these weirdo debug messages.  The
> normal dev_dbg() messages are good enough.  Plus, is this even
> used?
>
> regards,
> dan carpenter
>
