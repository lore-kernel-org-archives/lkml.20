Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794617077;
	b=vZUPQILs0HHJkjq4FpORbGlTD/jSGD5IaS12fOelPNPXeyYmAonr7pSvkbpZpbOHh35U
	 MMIEhQcCTzpm7dnKuEWUMGj1k67ZOvqhr4zZ9kuGOtbIhFg1tcyNGZaEMk/UXY71hTwFI
	 6eXXoKzlOoDFKpxyCy4n3wGwxJVuzGSUXxzvD885ftNzwYR+ZyLsm+CqDR7epk4gNEwH5
	 tzAazrbsvnnZv6BoG30a0O8G6A3QZ2/poqO2Rz3YJKQNLWB9RKU9X0OjOALypcYvZlSqp
	 uyQ+djG57EYDpo7G2xcH77SnSq29kB8FHBUjjrTTBjqtTveMRZ5mJAGfEyJ27SOy6Xw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794617077;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=xwAL6dGtHMVxqNDDL5+JL8jIjc0RAYKuNZXYP5z212I=;
	b=w1xedUKAd2wdXhO/pEJ2FEOIVByC4/yZoWiEp+EY9VIBrRatk1cKS1TwD2biu5Vs6/9i
	 96vMGC6Ny2p3eIzqtyudd8o7x4Afk3u9uu6NdQSJILaM5Hy0gl7cJjidELt5AHARKaRg6
	 p12Uj+/7JVmL3drf3x+rtISxh/BmG0VlAvUgHYHJJxxk+rGMUS9wuLcpxDkZF4p88S3q2
	 ciYchmn7Z08zWEDNKyzUk4gVBNWyz02YDyDMOpIZcJHZmuLUlaMEPgMtTVpRih2VkJgd+
	 zG58kQp9i3sWk28VHZbBtEZ/E7bP/OOlqOiSYqPZIp98c6u/KTMYgqRWn3teYtzci3Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yyyXew0G;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.178
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D2B606A88B
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 00:44:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33D2B606A88B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yyyXew0G
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8b335eeb340so15182587b3.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 16:44:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794617075; cv=none;
        d=google.com; s=arc-20260327;
        b=TCBkIEBf4o6aiESOLrkPo4OqBmc/r/cF3CHexPx139OCJ2p+5lU0Cptr73fFlLxr8x
         c5joE9X9iF9Ec3XfCtY91+EqvcmIE6qc1BvFYh5nK0cTpJ4vJZHM3zPIr1YLtRSVTpL2
         n0qG8OONPEaiEt9S1K/ecWTzvEc1JY7H8YRbDywd4FAmdJ9ISpihhZtQ+MX23hW9+neG
         ayuk8KDHWcTjYqCOJpxgmrrQpMkJO7J24ZsuV08ezPc5M9h/lcarQbMbp11+LMlg7P1T
         kIsMvS4a6el3BEC9DtRurREHpxrg/Hsa6TDM6iz0CZ26XDgOZ1VQKc3YP3aCHGYtDiUk
         ESUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xwAL6dGtHMVxqNDDL5+JL8jIjc0RAYKuNZXYP5z212I=;
        fh=DA6SqpqRdx2MZPu6DX11xazaznRdO0uVH8kzUDIewnQ=;
        b=TNpJ11Z6/A4isWIeldMOOqcKtH6HmR/6YjhVBS8HvTLrULpR95VObR1I0jYR2DJpk0
         9cMI6FnvvGzS5dKfI6F1jTm6xJ6wLqPh2Fz/cVSNJsQEkqoZgkYi00zJSfWlRyFTpa96
         iOm0PAXOycbWV8dvDiyiSuge9NlvzVMgPmCKuIE+q+x3CPdRX8pwKs2yRFLktSb+moU3
         eR+z2ds9zSr/oz+5+fZ6AjcaassKmtUfBbLc1Zy37mr/CpWT0id2D8HBlYhjEbClKuFR
         H4zv9ysv4aiyXoDGu8v7CVE82jW85HMd7QtujVSXvgJNR/B37drRlLTRaYjignyY+UZY
         oFPg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794617075; x=1795221875; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xwAL6dGtHMVxqNDDL5+JL8jIjc0RAYKuNZXYP5z212I=;
        b=yyyXew0GOEe8lK58yuVMkm8hwSnAk7IJFf5JcJRf5t1OzNdm0mNO3SLSAr3JN/OGpN
         e49X7SJzRxxdPVwqjKulpViTYIEhet/04lPL3WHu7y0Vs0M6A0NUbjAZVPScnsfOoPJt
         vbqooDNfXuOd9mPgptaq+CIAGC4L/d/kjoMqFz2fOWOUwVo5DA3uB6UPHEEv1wkZW/QQ
         dykoOuqmuRD3AUYd0RhE5nknkCgodS6cJ+yr782vbZZ3rqQnu/jzTSj2X43XIKzjnRQK
         cNpHUSly21yYONeBOGysm/3bxbSzW5ihurs0B8X+OvURQvVLcgoUZdnbcJDEDKNEt0Pz
         SDvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794617075; x=1795221875;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xwAL6dGtHMVxqNDDL5+JL8jIjc0RAYKuNZXYP5z212I=;
        b=wZ6aqIBnYaTHV/Kvkixyx1Iitk94zcpdRyRA0f+9bMTzSahP8FLQWNArw2Qa+4yJHL
         tVJr58HtPF5ix0EOsHtFRqDZglOzuYUEtScSkfxi2lVBtP6Sq2+F08nDjcVVLyBYlyzF
         k0T4v9dVve9EIO9EKqpGUc83KC6i7BSmfampV0lZVEaxGmXGg8LyfLAnJ/PpEnzJ52bl
         DLtltjazZRIHPIYJqCs9t5J8ztOiTyaidv0+8ZThllGDfxfZTUBthdyR7KgogiXp7H3g
         zao0xC3bhYxPpFaJCqXaVMZGW3l6+tM5Mg+eOh1WVd2fiCPc+wUihrJ3BZ41E00mzehN
         PbAA==
X-Forwarded-Encrypted: i=1; AL+hErH+/avlnQ9///uekOX185RJ6S0t4lopvTdPi9JTRIBu9LsWEsCyf/+Fl0hzUYe1jfyOLSN/ew4Zm3M29jU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ojtYS1GxwY5QLxdCJiN+OURYPf5bgY1izbzMofoV0rMNytp2f
	uxLSP+0v2nPqa4HRA4nBABjT8+cokhr9wwvCgRyOTGQpf2ah5EXXS+c05zJXhrZ09TeiJxN/8nF
	m/x+t7dRpHYLIX83y8ZqWzR3lUF97WXY=
X-Gm-Gg: AYBFou2/WZegwM91SSYMdeE/wa1o5ydPCpWriODd/NjGZ/PF+/gVFoplmrJDg7npInL
	XlMjbuasjH8T9TQp0Cqi3QT6FIyBYX/DqLrCU1YwxHgpQSnxHXphS/USDdAWOAq04DYGom+H9xP
	2UB788929/4sGq4PskuuCeQDQfT9+RySmipZaLqtghdR+4uiRkz50iVu1YQmWZn5I/87dQnSp3A
	chvyx27tjnPZAdMZHOXKqaEnJSxPrCOUuoGU3+HL8tlCl+3RM6sgsyJ98Y1mLeijw5icrKEIYmO
	ElhbVcqfkoD3MXwclIOz7X3zAyVysnFkIVkJIzo6gF6B7qt1cEJglbeeBZGKB173ncnvDbRtQgD
	MO6N+coWAlr/nDCCl6RS49nT76aWK6/LcjXCvqBzNuxgUB5jrYY4qdJpqloZNqheC4vKH20pV1W
	UWgFAizmDkNeVvD+OUES/fc2Uy0LZlUh/NEryX5SCUjCyprZca6W/g7S0LhD3ctpmnrecDY5alZ
	yP7e+5paB6AGfSAfZ2G+FspjoLlTMUswiAqFl52MondvY5293clM8BidfhA+w==
X-Received: by 2002:a05:690c:f02:b0:8b3:5314:54ff with SMTP id
 00721157ae682-8b4aa29e650mr23451787b3.62.1794617075301; Fri, 13 Nov 2026
 16:44:35 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114000220.1280581-1-dmitry.torokhov@gmail.com> <20261114000220.1280581-2-dmitry.torokhov@gmail.com>
In-Reply-To: <20261114000220.1280581-2-dmitry.torokhov@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 14 Nov 2026 02:43:58 +0200
X-Gm-Features: Aa3M54rnPrnkqfs08ifxk9j1MiGz30YxdylCOQmjdi0Tz0qU35-fn_UrRvunRUo
Message-ID: <CAHp75VdeUgonrBk+9DYHVi_QAquk5g2kCaMrxkQVnjh2SRR5qw@mail.gmail.com>
Subject: Re: [PATCH 2/3] Input: tsc2007 - use scnprintf() when formatting phys string
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, Svyatoslav Ryhel <clamor95@gmail.com>, 
	"H . Nikolaus Schaller" <hns@goldelico.com>, Andreas Kemnade <andreas@kemnade.info>, 
	Johannes Kirchmair <johannes.kirchmair@skidata.com>, Yuki Horii <yuuki198708@gmail.com>, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 2:02=E2=80=AFAM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> Use scnprintf() instead of snprintf() when constructing the physical
> device path string to follow kernel string formatting conventions.

Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko
