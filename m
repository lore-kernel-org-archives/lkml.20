Received: from mail-qv2-f41.google.com (mail-qv2-f41.google.com [74.125.230.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FEFA39185A
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 02:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790820852; cv=pass; b=R9mKgZmOUZ/rjoALjkbucoHCQaQBtMPbZpCwhvU17lgPmca2HpFhupzfSTlZ3Mi5wTTt/tOEG6qnL8Tc6l6wJG6w/psCGSjpe3NjCUOVk5hG0u88TlOQ6B1DOm1votONaUVc2Ivr1vMmGYwsfLyvFDWQAM5gyp7O190Azo8A9Lg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790820852; c=relaxed/simple;
	bh=Yk7ss9TOQXru4kMYGhjweiXMWqsnD33IHm0XuGjqUzc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VDae3kuq/RiOnvQ6xizx2p/CXHNVgtbpIH2Cxn9zAb4Jw8krqRVUfN+4XI8dVzyqGDNyoE5drYiFqrEDaforjJeiHLUJDip1mF7pS197t1WDK7GagQriIVeyoY0paD9/ZtRhdRrzYaYEWsrNmXwEJi6JQ+WywRAw+hD5ijMVC0Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oit94SJR; arc=pass smtp.client-ip=74.125.230.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oit94SJR"
Received: by mail-qv2-f41.google.com with SMTP id 6a1803df08f44-9179c1f49d4so12800316d6.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 19:14:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790820840; cv=none;
        d=google.com; s=arc-20260327;
        b=l0pegZUc1si9wVb6zl3j9d6ehxh/2tc1oCDQc0RxSpo1YGaVdU7h282XY8QyJooK20
         Mu3Mtt3ApjnkEpI0cTLfp0JmSfzN2LdqowKgoNrpiBxjQYTK8wmRss+EYK1SKMgYkVj3
         qUyq/ztnrwHz1daRCWIwPp0UWFtJ4VqkyjGWmR5YoTwF3peMmMmU/h7SrfArMa1xlZM1
         j/aA7T9hJHpOC93vbFBN13gppTmGRu97KxgqI57en7lBqsIcMAFhy2jRmOHoNvrBVVos
         4TGWXBmfO5R59CSrOxqsKZMXj/DwikdyvoG2cSu6mkcXxBkRMbnX1DIoAe+oOsYM5fOo
         9I+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Yk7ss9TOQXru4kMYGhjweiXMWqsnD33IHm0XuGjqUzc=;
        fh=4KF/SQRGK5zbBmqVx6do7N2YL9KoU7IUlGD+4e8OV1Y=;
        b=YHb7Xh1r5knt+JfblnEwtlhQDWpeSnpxkFp4cC90Cwgnd53GgTsiN6ErOWhB08Ug2F
         y2PLdXyB/CgEhYTZYiRcy2IPkbpjBK0v+ILJ2WrM86qgvV+XLlznd4xrThmVJVkXXcy/
         hPHj6By59fMdlFlrCQ7Yg+5x6H2/2PFLSq1Gt12NCxsi/hYt6AjTUfDIAXTAwAo6NBLW
         hncEH2SXvObWK2env27jHtHKmQ3j7uXLblrnTnLCKqdb98moQpiAQJKv7Z0DkAFZpyZ7
         yoo50ag16ZqMABKxuOITLrJa2e/ymyIWvpvFthNulHLxrxO3TDaIqSHWy65uGGlaXBrX
         M4FQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790820840; x=1791425640; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Yk7ss9TOQXru4kMYGhjweiXMWqsnD33IHm0XuGjqUzc=;
        b=Oit94SJRUX5rbbg3VsBngS5x544esEGnRGo8ANr3+h9/8pq9PelPJXK4ebV6Sh2ku8
         WMCPzr8kPk9yhHgSKB4FZ0e6IrSOZG0GjwjNacZznWPWP9unmNDezKKgDKMA9djNoJ3T
         oOMlkqLgT4AUzeRAy5f2ixR50EiOhQsHeDsgPl2csCBxjzvxUcItVAVWP3xltXyIXNs+
         6bNDkN14lmvzelClLVdq4EcAlhUFmrvSBheyrybjTL0trw11xXl6SqwKAx4A/NVjuHfc
         5NuvX+2R19oMwzYd9HkLPDNDj5RniT6l3ZpUbgzJPJFSh2CUAcTx/tfS6PiNhtiB4dvX
         6ODQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790820840; x=1791425640;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yk7ss9TOQXru4kMYGhjweiXMWqsnD33IHm0XuGjqUzc=;
        b=BusJH+bkfxjnvOEs5ENhtMoVf4X43tPhx7TGs3beMO+kH+W1ROp5jBbCMsjWFXA/S+
         lc7SR/fH8unJkUyeWVGvxyTH0AJ/GjA1rHsfmnBCd2wQTpi9Cwj8eX7SjbPtamRgLz/a
         hcRPtGGc5egGKBfUrw4+hzQdcpzVmd07o4NMlnSIeVoWM6ILJ9RqQLnQyOt2qZebJROj
         XhZQ/Vo2fjarOEaZK/FWJ5U1mHG4r3s/OP4e6HtD6fQP901Nlmwp5Ste15Ad7nJpS+vr
         yfWievVdi0yynDaL+Js99+ch4lwKohWcSLZ+R7tODhufFtDR47nUTDh32FFzZOG+P8TX
         FbmA==
X-Forwarded-Encrypted: i=1; AKwUvByJJRb2ryYGcXPJE9SIaXKvNkLVRagzNLULerKrsojYMUMBWitYBq47oAnJYemEk1PMG998AEwmVYFtVnk=@vger.kernel.org
X-Gm-Message-State: AFuF++losr/zOIz0eD0a7mNXrLZL6YgQijKrYDUYo/QvHbSSV/n/1U9S
	UogjEZaOKTlEw5ehUZ70bfIw2Jy1EH6c15sqF1cZ8asdCjs3EcbZw4IN6rEZcuPj5oJk9pvh5Ju
	+oEFTpFE6vbXsHNIpIcINcyUVG2v+Kpc=
X-Gm-Gg: AYBFou0BvvBfYJXE+Nkx89D/oKq1/gORJt1etp2hrK60l/pYgW7Hp4HEaLeb8wZ8vnW
	1wm41XCrx3RT+xvw33+Kp2BMQKIgG/sRrdW+eQwS1ABSahPW2v3yVevFsiMcVD7Vo0qjGZNyiGF
	AQWYkz1gGOI9mucVDSB/S34Z8GWtPp0g29ocg9OsTluiT4EuslLWaT+PXQv8krR4w5qVMUAwo8/
	/vpxvcsXus0O7maxDRvFmo7OCzxFXly2PKot5jI386ZBPITJxWd/EAIUix/C8dv0T8Bii1uLxMQ
	KIgGGIQBF6f4zZALkP6506Kbvew2mf6pV1IdQ5JGCt1rPIlTrSdsywZlRhegKOyImTycSKBGf9o
	7tRjjBZ9TZSmNKnorLePI+KPHZ9MFUZySf/o5U1CJBKMV3Nuiie0NFweIPMGDhXjVMRxGyyxW+c
	nBhzdk
X-Received: by 2002:a05:6214:2269:b0:915:e6ed:db32 with SMTP id
 6a1803df08f44-917a0d609a1mr60922996d6.43.1790820840135; Wed, 30 Sep 2026
 19:14:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923025148.35637-1-vinicius.m1821@gmail.com> <20261001013833.29002-1-vinicius.m1821@gmail.com>
In-Reply-To: <20261001013833.29002-1-vinicius.m1821@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Wed, 30 Sep 2026 23:13:48 -0300
X-Gm-Features: AclHuK_jbvTF7AW6PD8bczL9LsCGaQVdfIoh7r2Bqp9D2zg3dubFwY6ez1cEZVs
Message-ID: <CAMAsx6f5hMH8FF4ykRp42AJ7AxbuOJw=g-VL9PCFYYOAW1-SvA@mail.gmail.com>
Subject: Re: [PATCH v5] docs: translations: pt_BR: translate threat-model.rst
To: vinihsr <vinicius.m1821@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em qua., 30 de set. de 2026 =C3=A0s 22:38, vinihsr
<vinicius.m1821@gmail.com> escreveu:
>
> Translate threat-model.rst into Brazilian Portuguese,
> maintaining consistency with original formatting rules.
> And add it to the pt_BR process documentation index.
>
> Assisted-by: LLM
> Signed-off-by: Vinicius Henrique <vinicius.m1821@gmail.com>

Hi Vini,

Thanks for v5, the translation looks good to me.

The link to admin-guide/reporting-issues still points to the English
page, but that is fine since there is no pt_BR translation of it yet.

Reviewed-by: Daniel Pereira <danielmaraboo@gmail.com>

Thanks,
Daniel
