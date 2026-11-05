Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793915535;
	b=N4C1L863XGBFeVEBXqCR+1AWMJhHHX7dKb7TcNQ5TEbaVEiwkOYIM/tPlQXv9KxiiS3T
	 /jfq/cZ16pib+9DffU3vCvbfC/SxCXz/9W/3evVIzY6xP3DEWMtwEn9gUvlHLguArkuut
	 7LeZ7wLKgMcmErBxbPOlVnaTWOUxHEWLjg6oCxHgDcW5aFYPMtkSbPQb6tGBv+fPtPXLa
	 psnKIofimUTx9xbT2+QxDsFsZ/fn8aEi2pwBtXqNhG6NkCGCDdvIvg5RS5mb3KEqSi92K
	 jam1KAi2FdCy48UtWLbyBXFun9LvzvNxaZNzc5B1D3N9wVVE6ItMfTZoLYf5YMKL5Vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793915535;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=f5e+r6C+Y+boKKU1c+tSb6Bf3yIjeJVK+Xx6iJaNfGA=;
	b=XqoXkdXUaoe3oWc3YNpj2zTjuN3qGeGCuwmygKK6v9MVU09pF+D6kVhk99fVGQFepuc1
	 EAoyAcdNlgAXs/SYs2rolicPW3YAEPHkhrvBDvllYiSXkXv/pKp29yLu6k1d/Zdmy2a4a
	 MngBjoN8L3djzYuT1BGY8uWNV46tClqYR9gdLfHl30mz1CVy/ieh6GR5lulGyd5GIHS6H
	 A0DTIqOw6tVjvNXxMO8+SeHPBhw91mzYfuq0n5sjn30V75OG8/C9Zy7C59u06ZQUN8gBf
	 PgK0eV13P16bQDuPcHkfj7YO+TY3JhuvsAlMvk9+ba9ngWV3zoQ+7t7ocmLhn7I1kUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=andrewgigena.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.167.48
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D911606A331
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 21:52:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D911606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=andrewgigena.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5ba3ac592faso27074e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 13:52:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793915533; x=1794520333;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f5e+r6C+Y+boKKU1c+tSb6Bf3yIjeJVK+Xx6iJaNfGA=;
        b=p4DbCx9nxKEejqE0SDLypmT6nlPdThJaUzlJifflRhzA6moB4UdcjpD4KKt16yY4xn
         nBkAN0jD608oRSZ0kiGnc+XKoJnpKVcpXVv9Kf6QNASepdMGShkH8mqq/C1vKXNZMBOg
         O2xNyfuEHzEuJUdXvOOfIYRczwIOq4t23kYk/ToPv/jXeft1DBdC6zr/mrwL5lzeRqwI
         WlrZ241ZAj4E+IDKBNpuL8bCUthooKZFjq4LzR76h9r9FVmkQped12nVePs9u8cTyzft
         8nIqYeVa1UeXf6ySXiLxf6DMhJMr/LBodKPVxrqnHgZmF7nhM6gSvl3nrJ8ahDevrj6j
         ZCgw==
X-Forwarded-Encrypted: i=1; AKwUvBzip4H546of82TBY5+vCsrtwTQGwEgtLZBBk6U0cHnN2EM79dZZldTM6U4UxOwG9VY1Y1FoUwd9k/dUpig=@vger.kernel.org
X-Gm-Message-State: APuU4Z+rBlA6cujAeHetSSC0cGg1OyA3TowxqSx1bpKxGP+bMGH6RxxJ
	hicKLZ0HIwrYJehm7++ZyR34B4/0nmrFwdlmdhVoT3KNtURfpx+4Y7SzkUMBZnCPvFhydw==
X-Gm-Gg: AYBFou1ZaziaDnGYYzcF9F10SrZm7b0fnf1M0AVc2BSL9dOH2jAUg+VlNdx+QvtFQMo
	DwDZ0fJRdK89qCQYEOvoH1moXdWePdsbDOxy7L224hJgfGr7aQL7mLIZ+aUJS448plLocm1Ze1Z
	oi1RBAFeVj6R9V6zR130Wbs1qLNDlYkZbP76Yh34z8kf2u5RFtSePN3PLRmm9ndXK7QvVf3kW1B
	OyV3KDtcBeV0FPl/JK1ChyO2yvxmGHlu1MfjgiIXDzKq0CTREKpbLEpi1YRcIfpUwgkDKjbym1n
	8TjGpGbM3RBzi8ZBaMrLxfVpOmaYDvaJFy1jdkr3FsmIl1A/HkmxOcK7LvizIyyhpVg7jpKFh8q
	M1eLlfzV5Sh6IjJDLw2eVGXPsZn4Q53AtV7O+9Rym8kQlKvKzWsCMA9Bp4fgD8oJGx2iXI9drxI
	QnKbRZDtvXsdWBZVgOL38RA0c9FQTEng78c2wpZv+erES+8bDFM5ATkWzr1aV9rASx1sWcGFvYR
	A8YJma1A2imriM9lPDPTvNKHh78Mh990XAk3/48beUX+jjNwkrKN+cVG3otXKB0OHKis1ewjteO
	LW9m2T5xGGrx+NNEiT5e5tS6E5VTBCCCxrsWbm6won6j7NwznN29+D86117tK0GzKg/Ljdo=
X-Received: by 2002:a05:6512:2399:b0:5be:4904:d2c4 with SMTP id 2adb3069b0e04-5c00397d2e2mr125143e87.15.1793915532486;
        Thu, 05 Nov 2026 13:52:12 -0800 (PST)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com. [209.85.208.172])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c002ed5656sm72014e87.3.2026.11.05.13.52.12
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 13:52:12 -0800 (PST)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3ab3b29a298so19372311fa.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 13:52:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBycgWgDhcBDhMmTQsrZwXEGam7836lkodFj9d8/x6qLk0RISB3uD838s/bz0gBRHmnVjDBdDPYTPdZPEDo=@vger.kernel.org
X-Received: by 2002:a05:651c:a14c:b0:3ac:ddd9:7820 with SMTP id
 38308e7fff4ca-3acf3b201eemr1185331fa.15.1793915531874; Thu, 05 Nov 2026
 13:52:11 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-sm8150-ice-rfc-v2-0-d697bbce0278@andrewgigena.dev>
 <20261104-sm8150-ice-rfc-v2-2-d697bbce0278@andrewgigena.dev> <dxb7s2d25ixowmfifhvetctpckj7h4y5puiai7orhkimgj7uxu@ekhwvpm536mk>
In-Reply-To: <dxb7s2d25ixowmfifhvetctpckj7h4y5puiai7orhkimgj7uxu@ekhwvpm536mk>
From: Andrew Gigena <mail@andrewgigena.dev>
Date: Thu, 5 Nov 2026 18:51:44 -0300
X-Gmail-Original-Message-ID: <CANn8UmeS0Fvdkamzu0Cgbv25+WdjHsXvCLMpsL98QSo-Gd731g@mail.gmail.com>
X-Gm-Features: AclHuK9TNVNMsMH-gS3LyhmcwXP0L8JEpTnOqnWuyNklory8rcuhuvvX8_jSoFw
Message-ID: <CANn8UmeS0Fvdkamzu0Cgbv25+WdjHsXvCLMpsL98QSo-Gd731g@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sm8150: Use standalone ICE node
 for UFS
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Andrew Gigena <mail@andrewgigena.dev>, Abel Vesa <abelvesa@kernel.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Bart Van Assche <bvanassche@acm.org>, Bean Huo <beanhuo@micron.com>, 
	Stanley Jhu <stanleyjhu@google.com>, Bjorn Andersson <andersson@kernel.org>, 
	Andy Gross <agross@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-scsi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I understand, I'll keep that in mind for future patches. Should I
release patch v3 removing the "Tested-By" now, or wait for other
reviews?

El jue, 5 nov 2026 a la(s) 5:56=E2=80=AFa.m., Abel Vesa
(abel.vesa@oss.qualcomm.com) escribi=C3=B3:
>
> On 26-11-04 18:38:13, Andrew Gigena wrote:
> > Convert SM8150 UFS to use a standalone ICE node.
> >
> > Move the ICE register region and clock from the UFS controller node
> > into a dedicated ICE node. Reference the new node from the UFS
> > controller using the qcom,ice property.
> >
> > This brings the SM8150 device tree in line with the standalone ICE
> > representation used on newer Qualcomm platforms.
> >
> > Signed-off-by: Andrew Gigena <mail@andrewgigena.dev>
> > Tested-by: Andrew Gigena <mail@andrewgigena.dev>
>
> Tested-by tag should come from someone else, other than the author.
>
> Authors are expected to test their patches by default.
>
