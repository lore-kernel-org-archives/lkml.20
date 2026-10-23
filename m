Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792764910;
	b=fIkvdMj/xiE3tkv4jnYIK/6KOAx7NXvPKezRk0XI4M12+2D/QmW42136mlq5wtOlaS9Z
	 rAM0QoW22LBFmcF41dKeVo/mZxMvvYFjGpX4jIGXEYneAguEgNE1w3YEqrzEOdxTTcCOY
	 mSPT+ZYHnXI89SVnbysJ8UcFbKHzgWb4IlOssgG/ewst1leyq8QP/bX44KM9V5udbZ8ik
	 S7S1qe5bq64a7+9YexsfR+PTgiuOr8Ubx/iDrfzFsWOSnqyMZ11tD9kW56GzLQZuSZoxm
	 YLLDwJzTDP6dBG7Ap6D5o9QZx7MxL61deV0YbQDhPkGbvwgkL1kBNsnwt/LBL00YM0Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792764910;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ssHEzjzfcY3y99EaZ6IT5t5Uq+N8qOcZuAF48Ej6bak=;
	b=wqkjsT25z1j/SouaTus8nmIvIt6VEpYL/XO9PejBee5mUIGjS76n9LxtME8cdrPTSEFy
	 dH+2oJLfIiQhjNUaygjsnC9Pyw2e9dckYr8lHv/i4NFXdvWDNJDrRPvvLpEPhOiUVIrLo
	 Lmo/oeqZK/NHSHqAne9R+J/RvLpv+55zO08iDOiccYIJbxLBBPTejr2xxjLEi7r9EQpBe
	 Z2yfgwuV6z763kmlwouoA0ser5S1p8HKNBwdAZPw8POOp8n5m0i0odjqRJLdpPwEg+Z0P
	 hWGgtmNfWIv22PtZphF6hpRfHAHQOG2Rq3Z/PuKYW3wA7Fpz6ShsWJbJaNveoUkEJvA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AhdXrNWn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B8D606A32C
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 14:15:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3B8D606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AhdXrNWn
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-35cd4e8bdbdso1508764eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:15:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792764909; cv=none;
        d=google.com; s=arc-20260327;
        b=QlhFnJbOxy/8I3PNFegEQ3XpGQ0c9e6/kjpoABFcmvjCj2OqEPps2VqHafjEviwFKt
         OZ0ZtaXhZmob4f37yx4fheoJCta92tCErn+PMT0XCxhb0Nw0V0cvHSX691KliCfO7+Yy
         nxgl3tTzxY9nOmHS4h80q3clY0ZSBrIarht7v1YKPP1N3E8Z+rK1wSZU4x7OH6MOcr2R
         TLRA8YarV2e0lBblrM7VFhmGHaFSN8G3ZOPFZzOhUUGyEk0nhdGDY7ZJZ0l/toPIatmI
         o4Qtn27Yq2MxVuuiNX4RawUyZuHf+fqbGONVA7GepybQrrajy8/8x3yunE2Kh5DbUXu9
         DpoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ssHEzjzfcY3y99EaZ6IT5t5Uq+N8qOcZuAF48Ej6bak=;
        fh=anNKtG7HV0QekM/OOKZyfIatQBpG71amjf3+t8uEYcE=;
        b=J0cDrtsqlR36FAnMVjpT/EmpOe2wNo+LDspM0qcUDoo8AodlHXviWjLPQJ1LYTeziY
         9jkoTvkcHZjQIQ2QihPzayyDcnYunQMkhIEmQjzHS0uBLmtbHhTvwm2ywSjP6Tx66Hbr
         tMyUKPZxUUZBZSxnHBkgaowfwN+GqOJ0sx+wxV7PjxXppbC3/aR6GipSblCE41C+fy99
         ZNJT9/RG/cEJashaEeTm+vuqzG1UPcmVYQ48bxlekzKTDdZJxE+DWPQAcA/+BS08xNIS
         CpyVn4H8mCOuohgt2MTwKu/J59XZ8oyAcu2V3X9Rc+gaDcB6vDDIiSItlAQCweMIJK19
         I5xw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792764909; x=1793369709; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ssHEzjzfcY3y99EaZ6IT5t5Uq+N8qOcZuAF48Ej6bak=;
        b=AhdXrNWnrU3mrt1MMRe/e6VxIevvuFIEP5rhfHlfuMzUxqtoIouvMJRuzKDBd2weYm
         l/dBG+LuBgyps93XvGFRFcHWMTOIAMzKJFCtjzFXTPBWFcKlqAMJXJP3Vetqp+pbR13Q
         dv6FtJluW3yMZ8spVdkU5AKtqKrAJ7klobwSKhZcEIaRzeTZloIeRxrOUwuEtWgujkNO
         XTW6xQ7AaHjrQkvEH4eSpLrmE+89zS0D1ddzkdo9GreFLLhSb6ilCUqWX/YP5hIHLtiF
         iAS8MM0fRa351wkUsBzTAIlLET80YjYHUlJx5JF9dgDGgSMoKrw3khS1TnI/ztRJ192k
         lOFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792764909; x=1793369709;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ssHEzjzfcY3y99EaZ6IT5t5Uq+N8qOcZuAF48Ej6bak=;
        b=dWOu3n0xZSEeCyhULKgbKEEusLMdeEp1qbRsLMkU5YNpVtQUE/gveJxsUdwo2Sv7xC
         fXFoXNCERLd7rtvDzAQaSPNq/j+m+UQFJT2pDL9wiqc03UNwwGP8hAk77np1qldCupaC
         JW0P2JiHrSAQSVNT3kMSF94VEGiyIp71uDQTDis+fIyPaIFJT6bpHBhYgjyPsiRPi2Ld
         D385PgC5hIsNFxaAtNS/sGTS/3T5gFSqEi3XkdHJmm5N5GsPbU9UkeSjrpYPocSIRn76
         BoPMNa8ZwzUhoeW3a63I4mlwUJWKnLnoVkoH8G6SchKtc9i0QNLcJBL8XcCmbOYVHjrx
         WX0g==
X-Forwarded-Encrypted: i=1; AKwUvBxTtwNjpl9T63O/3Dg+PslHiAI4BRgut34vpfAFCYLNUpcDgKN8xT2ndalnzhciMK56iTd4UQSQF8wzBW4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJcUrrU6FofhmEWo9ACiiSJ40UcprFVg5ku9DLBJOBLo63Sx3cs
	47BolrsOrXTYWkzUfBt0b8lNzODs1OJ14qT1JZvnMDL80e6+EelysAfdVzf6ubRO8R4gfeCIq/B
	wGNs7c9ymvN1xeijBghNwpV1v4Jr4f/g=
X-Gm-Gg: AYBFou06Nyz0iKbA9uw0EKo4ivjkHtVMoGwTWAwqrctH3X6LSFCwIJ6Fo1hT4EegLM7
	Nbu2vR3k2kEsV0QJIidiYZT+yyQkaQnwFgWklIaqUs36xewT/4GGkdDTNKUZ9z1AcgTus5NRx8g
	AWZC26Yz6qNWBxMYkBl6+dS2+fka4Ey8OlB56bH9WTifkrOeFmDhROJl4lpZoM7ivxwWQlvF/88
	7k4oXMtyvV5GVLFf/9skdAlCAs7WqXN61dCZDer4G0Fyi/oL8RkhUF2qXQyl3oW5mav7nwc9lCS
	CNO2Z/f91/I0OGETQrQwjIC8i5GbECEGqEBHdedzyM0F8qcv0zzNZMRQUjcW+uzYYAueUCA4Vvq
	XZ0crKjJpyY9c8BJAzX/6RWuiNVmZPQnF9cFqhDL/rFZa+MK5mOJPXfi7IFoWSFM1qNTVRg==
X-Received: by 2002:a05:7301:6507:b0:358:8f02:e0ca with SMTP id
 5a478bee46e88-369d96e0ad5mr4018525eec.9.1792764908756; Fri, 23 Oct 2026
 07:15:08 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022132259.240717-1-clamor95@gmail.com> <20261022132259.240717-8-clamor95@gmail.com>
 <Ot5qxntOTJ2QgFh6uZ0riA@nvidia.com> <CAPVz0n3Vrzb96iR5ZW8zvmruZ4aK0hKGKpJ2T9Ys+bSPCtLWHw@mail.gmail.com>
In-Reply-To: <CAPVz0n3Vrzb96iR5ZW8zvmruZ4aK0hKGKpJ2T9Ys+bSPCtLWHw@mail.gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 23 Oct 2026 17:14:57 +0300
X-Gm-Features: AclHuK8iWdYJNcYZY57a5wy5nSa1L6Um7fXs3cPnETk89r87jtgd5ZLBghEmEmU
Message-ID: <CAPVz0n3gzV+gAu_gzp3oTG9VOu-YiNSiQA0SdCFApKsi0dGjKQ@mail.gmail.com>
Subject: Re: [PATCH v4 7/7] drm/tegra: Add support for 8-bit CPU interface
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 23 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 11:2=
6 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> =D0=BF=D1=82, 23 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 10=
:53 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> >
...
> > > +MODULE_ALIAS("platform:tegra-dbi");
> > > +MODULE_AUTHOR("Svyatoslav Ryhel <clamor95@gmail.com>");
> > > +MODULE_DESCRIPTION("Nvidia Tegra20/30 MIPI-DBI Type B driver");
> > > +MODULE_LICENSE("GPL");
> >
> > No separate platform driver or device. If a separate struct device is
> > needed for some technical purpose, we need to create a minimal separate
> > virtual device, but unless there is a strong reason to have that we
> > should be fine with just the dc device.
> >
> > Thank you
> > Mikko
> >
>
> ATM, I use bridge framework to describe interface and I am attaching
> it to RGB since it basically uses RGB to transfer video data. It works
> pretty nice so far.
>
> You propose to replicate how RGB works just for DBI?
>

One of the reasons I used separate pdev was to be able get mipi_dbi
from it using dev_get_drvdata() from patent (dbi bridge in this case).
DBI framework seems to not have a way to pass it in any other way,
unless you know smth I don't.
