Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA43E37204C
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 17:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788715752; cv=pass; b=JEBojwNYr5Wlk/atAsHrD0pWT+gF2vh2G7XGt91/OYI5t4DTiwbLFF7nEzrTqxeVZLzMjTtBYO2ZI/k57K3zb+nBxQfUrtGdy4GQ3+Il56+WoSWPQuReIFpWE3FBcsrf3dzIH8c9/oPcQyLny9TSPkJe/TekA1RMSgXp+Hpq/7s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788715752; c=relaxed/simple;
	bh=5DEiI0XOfcZ/AmMcsore77sSwCupcFULPw2OZjhCwgo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KCFp7j5iuN3plHOjDh8A4zUuH7ay6P4G8LDgiKdLYPGj9T0PYICoIg9yn08t4ddyd1dXuDWW0kSIXvHKU09pg0+b9afr83y3pApqqn7VOs8UlMWZH+nHBKapVLvx1pr6RNUOW5gM/xKmzwhaTxIl2X/Ylcib6wASF1cEjqG0SRQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OF8j2/e9; arc=pass smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OF8j2/e9"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2d944747d41so29108805ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 10:29:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788715750; cv=none;
        d=google.com; s=arc-20260327;
        b=LEBYELXPTkoT/feXpbfSCbTJ6Lg7udp0g9RFVToXLQNmACNIZ6oQz4J270vJf01ta4
         scWkSId88yTJ+ngfD96rRZf87mDp4HWDYCj/ZtEe2M32Sf+Zmu8kFMPBJ1NpGvt0kMr8
         jFFkxZr9e1GHTH+34FHVy6WNBYq63/J1Agt9x3Rn9LzGAbje1IBQ6ipIcMdRFPCqIUYE
         f3cpq1L1nMk1uqSkRivy6IMM6H8FTZb3p6r9p4jX6yMrNFkEX2cXkkaPuCvKwVivmd2X
         VhTxlS2zJJ8/SoCXFduDJwnzVxlUz5GLH0zLFT/2w/FEDawo8FNOOsbAJgQfDf12WFZK
         56uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5DEiI0XOfcZ/AmMcsore77sSwCupcFULPw2OZjhCwgo=;
        fh=E6BPBi236xDM8XC6cbVPqXivD0++8vrXKxH3pC2uf8U=;
        b=fUPoGPzO9C4Ut5cOfU3h3G0NvAWMJX7CjCrH3x31RoVRqg1Xwtfzwq1Ea4rj10hJeG
         Xk8c7gZ49eM/783lRfocObkO5hatlCkCFjQYxHBmRoyGv0/SJyH0RbKKTwctLGlMRSG5
         /KyMjSeZkp1V+/r+Oci9IKMtB4oAwpOk14gdrdjm8JB1eY5BEZo4LDEYGvqp2L8oqRqJ
         Ilute+dXnntTCEDmjDKFJMzxtmu+jxDVum01iPQxfQZb3cJLxxKDxhLz2VvMamcjf/uZ
         0cidyMr/cq3CrohTaP8efg9W6GeJ00OS4uZC0a85Cr3a2zUul6sZtFEvZkbH7Dg2LU4+
         u3Xg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788715750; x=1789320550; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5DEiI0XOfcZ/AmMcsore77sSwCupcFULPw2OZjhCwgo=;
        b=OF8j2/e9XaMRw5ga8VMjNKTjcE7mR8jmZcAz5h3CAi+h5rCxFnYnEfwtjWc3daAtRK
         wWR3rt+PNnSrR1dFm+5ceUKKbPr4kqSvRyCTz/LEFdlh9sh8dDoqIPNAsqZystl9Cnav
         h/mCpA3lAUX61QIRfNqgQASSNlTzGgBGgTW7NJkBEbG7kLNVL7WTiYZVgCutRYCZqfmg
         fon2Fm5XPPuRiy6UXv9I2qR0SiNCt/QmbKjqeCqDDbm/ZwXZP15ige2qp3w9gsZ561Qi
         bZ9IXQ9hJe0u3MpgmjeCLTpgaXSNYVxnC4DC2pc10S1zGMdMJ+4zTlsFdSmNuItXxe5+
         Hjnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788715750; x=1789320550;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5DEiI0XOfcZ/AmMcsore77sSwCupcFULPw2OZjhCwgo=;
        b=Cs96j47Ka9unUmO3Ghp14YUlPxn6C4CE60PtZp9IDKhzjth6Ctcu7S3wTzErSbygKy
         hNSVroU5c8mPFkFUc8rhutflJdZU/hjSNNrRC35gcg0t2zzx1Wt1dSG0pJsEzphVICDD
         KuV2urqfXKQ7YTYI2sR07mvbS7kBad67PxKptNr6pGhyzCO0JkqC/govIQ1zxoGwwyHg
         s9gh+NCfAHmTJrG8jzcmWp3JtPThcO9j335HXgQzVtUqpOA5jO0SyQIpQ3YRVAsTUMBU
         qjgRFM5wAiOmxjPz7d7/8G65DILtjalyvFCcpPL/uULWDIGAoxCHwpZvkkQopOBFu3gS
         jZUQ==
X-Forwarded-Encrypted: i=1; AKwUvBxN1k06u1uQRPdotqVZ1zqj+qEVqVcPD9qK0gsjbxVNM7cEW+D+/ipOrF4B2IXk/wCD0l6AI9d66lKnUyQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nVm/6lXYjRAviED4nnWL+raF8FDMoDKWPz0v/kvG5RP2rE4BLo
	IoxRsNcXFENeB7E9XOhzm55TpSQMvEMOXVxydhOZFp7f+4rZnyM71DSMrMieAtMRETAG8lcnWxN
	olX/l8ByxljNGm5u5G1YL5eiHl/VdBBk=
X-Gm-Gg: AYBFou14o/z3cEig3U+SANJBQbgInH3PVLAPfut19lgl2uNH0DKOhyB8+loU6QYKKVo
	+3Z1VCGr8s7rvBv2QX9ghX9KF21NMKWMv1ilSGBJPVYbXWC+eYvHk2+4Iy+KAp0dnneOeaD3uqT
	SrtNjpklh+OrU/Y6VZukRgE438w6cNfndIy6WpiFCuQaZKl02g24NqdDiUmcoY5dpZ83FdKoBGO
	3V+/n+mOg86VmGvkarz2+qSEPOZZtdOSRgAlW5PwijehORuv1sCYaWB3Dnf2U6zz7eRBHSdeVmH
	Fhub53d10v0gDAnRwGt5M8xGlacWkDV92eetAzMl7uGEOC1U2HO0nB2Vbf+AWHMR3xPZzgn6eMw
	UpA==
X-Received: by 2002:a17:902:8a8d:b0:2ca:e19c:97b with SMTP id
 d9443c01a7336-2db122edd50mr199148445ad.5.1788715750074; Sun, 06 Sep 2026
 10:29:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260617080031.99156-1-clamor95@gmail.com> <20260702161828.GB2108533@google.com>
In-Reply-To: <20260702161828.GB2108533@google.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sun, 6 Sep 2026 20:28:58 +0300
X-Gm-Features: AcwNN1XWisbz2ascChHcLatRKYQPwdXAhH_U7ChBKnQiXROAqpt9L2vnmsacgR4
Message-ID: <CAPVz0n2fRs=q-1dAEt2k1FJpQVK9+PMSY0BSMB7Rs3F2xDyFvw@mail.gmail.com>
Subject: Re: [PATCH v5 00/14] mfd: lm3533: convert to OF bindings, improve support
To: Lee Jones <lee@kernel.org>
Cc: Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, 
	Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Helge Deller <deller@gmx.de>, Johan Hovold <johan@kernel.org>, 
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 2 =D0=BB=D0=B8=D0=BF. 2026=E2=80=AF=D1=80. =D0=BE 19:18 Lee J=
ones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Wed, 17 Jun 2026, Svyatoslav Ryhel wrote:
>
> > Convert LM3533 to OF bindings, add missing VIN supply, add support for
> > setting mapping mode and LED sources based on device tree.
> >
> > ---
> > Changes in v2:
> >
> > schema
> > - maximum led sources for leds set to 4
> > - anyOf > oneOf in ALS
> > - improved ALS descriptions
> > - adjusted example
> > drivers
> > - dropped devm convertion of irq and mfd helpers
> > - all als configuration moved into lm3533_als_setup
> > - added regulator/consumer.h
> > - lm3533_bl_setup set before sysfs_create_group in backlight
> > - added check if LVLED is valid
> > - LM3533_REG_OUTPUT_CONF1 > LM3533_REG_OUTPUT_CONF2 for LVLED4 and LVLE=
D5
>
> This set looks good to me now.
>
> Let me know when you have all of the Acks and I'll merge it via MFD.
>

Hello Lee! Is there any unresolved blockers for picking this patch set?

> --
> Lee Jones
