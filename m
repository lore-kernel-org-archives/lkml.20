Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C22941A513
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 09:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788341286; cv=none; b=i8WnKQVTEYL6cYvPUnsRk7EvpCN/vhbAym8iT/z5sEuEdfX0xxRyZ3wl+m/02MwTU/g8/K5R6OeecQXopf/796xL9aHB8P+NM54pzqcS1Szkn+V3XbRxpkrSqKIonWofs9JDsdC3OGU/LFOJJhkBuVj2m0GGeeoa1pec3vyJw3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788341286; c=relaxed/simple;
	bh=9Ux6FSO1kTQyzydlzEPCqBvCkOt/vX6WO1NJCvSGW40=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WcdXZNoB5/XRn8uEH3JOmDVsVAwa+vLRlKvL8sVIAhWFI+K2I0vRmnoio6MN8mGNIHZe3hzrsikkxcWpk9QMYTf4DPzaWnzu5iWYTJr9ntQOxPycdhY0xggoWizPbP4KfYlN/tsjm2XY23mZsJGEzSe0njiQAyOA2QkB1QVTv0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lD3mqH4c; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lD3mqH4c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 466791F00A3E
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 09:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788341283;
	bh=9Ux6FSO1kTQyzydlzEPCqBvCkOt/vX6WO1NJCvSGW40=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=lD3mqH4c5bRtOYFtDfeD9JJvJItqtf+gXaEqfTfbSgBCdk7JWYDSxHGewWcO5KTmg
	 z7IUKE92zhU1rE7CQ1f5erHxkSagEq0YZ8eOj/mdwVUFMuVY+m/RFv3dAF48+ruDDO
	 Q9v8jvoc5iVXQlM5mQBGNokI+4TJKPxqd1TPZGTVeI8iM50VzCAYGzIMcUG6un2QK8
	 kdwKKUr1qd3eRyV99mbvFUYS+SOh6F8b/u0pJ3R66WnCL2xVT9nwn3ODqntP2m3RMN
	 WMS2iyZ2VcJCZv310eUti9XeaaIRh9WDfK/KgqSmhsJYxSHOsiDigEFGIIgRnuKO38
	 iDDSiAAnLkNlQ==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5b01910b499so754557e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 02:28:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByvD8u/xDDExYYnbUuYm3PYRMSzYEW6CtWE6Y25p2udXGb0lHrBEDVM8aFoh0+tJLibgJaqk79LRjMIGKo=@vger.kernel.org
X-Gm-Message-State: AFuF++mgDoXObNY6r8OOyV11peivOKPk65GMjH2QZpqnb1QSjuLu0crc
	q2Rtf6T0bVCqWbUxvOwIIc1fJm1KLPKkEswHqTuwYwn05kT0Q1garcDNt0gkjsq0vWOyWQDRBIB
	7WfUE2sK+gr3JjZrgtFGTDikkPj0TOtpCp9i3CeoMEQ==
X-Received: by 2002:a05:6512:138a:b0:5b4:5854:77f2 with SMTP id
 2adb3069b0e04-5b60c2af34emr542440e87.3.1788341281888; Wed, 02 Sep 2026
 02:28:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1787830440.git.misha.zavertkin@mail.ru> <adce57b3797cae6f6a3486eb1d21c33be61f14dc.1787830440.git.misha.zavertkin@mail.ru>
In-Reply-To: <adce57b3797cae6f6a3486eb1d21c33be61f14dc.1787830440.git.misha.zavertkin@mail.ru>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Wed, 2 Sep 2026 11:27:50 +0200
X-Gmail-Original-Message-ID: <CAMRc=Mf16PBE0=Udm+A--i2d1VoZCEC1=LNC2q=t8BwqtgZY0g@mail.gmail.com>
X-Gm-Features: AcwNN1Uqx5ZlATv-f-iP8Vi9oRiRRGSo-S7eTlcwF6gdmnA9r3xWOqaS8vRbrg8
Message-ID: <CAMRc=Mf16PBE0=Udm+A--i2d1VoZCEC1=LNC2q=t8BwqtgZY0g@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] gpio: realtek-otto: add pinctrl support
To: Michael Zavertkin <misha.zavertkin@mail.ru>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sander Vanheule <sander@svanheule.net>, Bert Vermeulen <bert@biot.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2026 at 4:29=E2=80=AFPM Michael Zavertkin
<misha.zavertkin@mail.ru> wrote:
>
> RTL9607C relies on pinctrl to mux SoC pins. Use pinctrl to request pins
> for GPIO.
> pinctrl driver for other SoCs might be implemented later.
>

So for now shouldn't you make it conditional on the compatible for
this one model?

Bart
