Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793805255;
	b=tMILK/5vnvYTBy+CTF4nDYde3++WLxvVGvdLmOjmEUTgucRL53ULs8rv7DlwJSdpYiXg
	 SPuAgs4uC70p6eTuK9IsjS9xlgVBZi8H54YfixRCmeN+QN+/tUYWdJGx7lr7TW5mGW8QK
	 mO9kvtIcK1iM6TyvwkF5u13hO2sViQ5Mw2EXaSuTKpL3wvrwN+JWmfwEbZP74g6dISShb
	 4ptgaHoLaeAJbNfgNJ/mKhiE+mC3TrEWcQVEmJDsdqXJfhTizfJYyT4V68yraS/EVYqqG
	 WSuGlNxU5R1nZHNsSl7HvgMCaE83SQcnPcGOB6DyvZAd3xSgp7mdHP+N7/x+GSQgxDg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793805255;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:In-Reply-To:References:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=ROC4carc5ag3yruhjakvwE9XMb+//D3RtR/BQW4q+8c=;
	b=FIpbCEs9hbY7g0zUpczoUbX7fJyRSPApIxnXcs8VSpduHYY0ZVYdaoPILXgAFRX7BmRQ
	 kCO3kIZHmu1ZAl/MMgkU0TLfMJ5a2J+lm816HdwH+vNaDr7iQXoUAC0Mk4ZDtgtRi8Gi/
	 gr7SLF1id7eWpKzkj5Qji7vQ+ljsrGtqTEne68NsPhsM1GWKElQ3UjVrBAtKS/ahx0dm2
	 M1BWYPCERSpWJHidMNdgGg99G6QmQN/Ri/tt8V7QDw4iehe5y07RGT9AuXCR2JaGhXA4U
	 mNDfZ0oMPENYDO9JQBV1qL30IYNibn+OVAUGALUVNfcY23K56Dif+A98O7XGlhEIn3w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Y1zsX378;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF4A1606D801
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 15:14:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF4A1606D801
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Y1zsX378
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b1aa377c61so957072a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 07:14:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793805253; cv=none;
        d=google.com; s=arc-20260327;
        b=J2V/8cxfxQtTLxdvHSNgMY+6VRJB47g/qfuNnq3UdmZt93PbCPiymjR5trc5l6B1Ts
         MMRRfQGOpoAIHpktOrRWJqVxglHIS0/1VkDlxwRSzLEmxge3qpVgPyMgWo98yiqyudPH
         3IpVoRgIGGH+TUMIHVfGaHDACOHRHss803I4yfYUJ7MH1x7RaO1jeAZVRMYX4xhOeWD/
         a6dO+GVXiamiYF/4e20A31T/HIQ4P3mjLV/unFA9Q0QbRpMwHzcaDqu1fVO6ph+T0JYW
         Trer9GA+cqu3vyqEfOFso6lzYnmKuqMj3oxFcIHeDjRZ0piJY+CotO2SWApi3vvQoMBt
         txLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=ROC4carc5ag3yruhjakvwE9XMb+//D3RtR/BQW4q+8c=;
        fh=baJYcT1e7ybG7FkH9nJfysbMTkMLV0eyXzALRwmuHAY=;
        b=eDUoVhqctV1FMeTwKYGZaLtjRSAcGsTWEZ+J/6zJEM4b6lUyJavnfL9gQ5Q98TzT1Z
         6uvCMWxPZufyzcViTeAKP3SMG47YtsdRRpKYnRJM3WVn8kIVtq+gQTafV8ShgAv69zg9
         BlA/HhpS4tPGBSrsJg04+bk5FXlfBOL/cmhTOG5cGlHPoALu7JW/Br2VrAjFkZQMv9Kj
         HsIzg4kYUu8F4S2JJSEl2Xlv+TPTmNB3qnt1vxQfyDprqoMaXXppmalTfSxa8K6lbnxK
         DczjdidzMpVWOCzCuJ+sCn+d3wWsumSSzpOjj5NgjCiCNeJFLPuaXEgWJNWqrt7QvNB8
         tYtA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793805253; x=1794410053; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ROC4carc5ag3yruhjakvwE9XMb+//D3RtR/BQW4q+8c=;
        b=Y1zsX378kusvubbo0IH/Kiu2MUjJnOlUaZHAsVp3UZZHyN5MFMSQ21ppiS9c6wgW6A
         6/zZl2+wCovE6yhcXCl4JQKET7Vg7Lj6GWMT7wFe2aM8Hi/iFqk/vwJR58AUu4CiVSUg
         /qPsunGogtch3I5R0noFWiEPrhzcFTA6FCXn0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793805253; x=1794410053;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ROC4carc5ag3yruhjakvwE9XMb+//D3RtR/BQW4q+8c=;
        b=Ss6dPPb7ejXDenqSo0meU86wEmWZx8WvtRJ9Cx5rHUfTWADQQrkizanUAvTFhUQNvd
         Kx8OFTOV18NEMEJhOaWlwfl883OjAAdciYHRti5qcgsfO251rg2WPoNbJ/xY0qUEnl+m
         UJmC1QZWyWwD9UT2QIEYkAETrQGRZty6NbpkOlf/EAD91XVnjOfnbMNm4L2xDdh17xpb
         LGishHGuoIQVHKetoO4GkxNmILMYlOOS2Or4PTfhh27Mjj+d/go7X2fsQCXrdb+OEOzv
         Oz1DHmHtxdJjPwX3TRT/6ytrGYcVsCdoxDgNdz9r18BCc+VfIrBoCXig7hd1kY2o5iv4
         1Ikw==
X-Forwarded-Encrypted: i=1; AKwUvBy4NyGfemY7gtYt2fSEA7es4TYBVQYkSXY99TsZfm+KwARHKCgadcS2qw/3JPj+ZwR9vKlD/4fBo30hOcw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/NxbpxAiU8nFH892cZfG0L5UiODzuda+vC0aeJMVemGRXypJNa
	EEjj+eUR9Dauka3DxrJeBHCPpFlX2ax8vknXrPTugrz37/rB4DtK38Kgb9ZEQBxFQ8zP8NYvyOh
	OGvIgCf3v4U7Cwcw/M2Mip9CTuvbuBrCN2CvKFTTR
X-Gm-Gg: AYBFou1eHEXjF4smhqXywMcquGR+fQGtIY0vAUQ/xZvUma5qhV4hgr83DoyvIBNFrnK
	4gw73M72hqiVW3exQW0Pk2j6FNN5XXNvR2h7rg+UFHY0WyETc09PPg6qB0Kt8087u2E4Ua6323i
	/fYjAg6H41TeX2pGSMTbGjxk2TCQZ7JNiw079doQNomsbbl7d6xAjLR1AXUMOZgBf/mmJSpoEHa
	yKiJwgD9aEjYu5bLpfH9agYPRZPkzRH/mk6oYVGE+h4pOiHTfv+1cUZ+0KQnygpP/84afhlzU2z
	xlB2R6a9p/Slq9Kgpc0l5V8wmB/A3ELEgXL5ry8myJ1/RG+3icrB1aSJ3oEPVn7b/PebSpVXNLi
	yyxTAU+MIZyfcwklJt+8jQp0H92//cROGLFPA5cHOqigGuIFwNK8X5iDmEfcz5Pp83g/UynaN
X-Received: by 2002:a05:6402:1ec9:b0:6b5:1056:cb7d with SMTP id
 4fb4d7f45d1cf-6b51056cf3cmr8934538a12.1.1793805253293; Wed, 04 Nov 2026
 07:14:13 -0800 (PST)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 4 Nov 2026 07:14:10 -0800
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 4 Nov 2026 08:59:22 -0600
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261101220224.1436242-10-dianders@chromium.org>
References: <20261101220224.1436242-1-dianders@chromium.org> <20261101220224.1436242-10-dianders@chromium.org>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 4 Nov 2026 07:14:10 -0800
X-Gm-Features: AclHuK8q32ivZzhO-lFGb67WnRAtUcaaYFEqbKx9Uqfw07KWfEsdfk6B_95tIQY
Message-ID: <CAFLszThcMXxh05R6NNq=oBYb1w=xB5iZhpBT4sG48+PLceHQtA@mail.gmail.com>
Subject: Re: [PATCH v3 09/15] libfdt: overlay: Prepare fragment path helper
 for reuse
To: dianders@chromium.org
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Saravana Kannan <saravanak@kernel.org>, Devicetree@vger.kernel.org, 
	Simon Glass <sjg@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Julius Werner <jwerner@chromium.org>, Brian Norris <briannorris@chromium.org>, 
	linux-kernel@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"

Reviewed-by: Simon Glass <sjg@chromium.org>
