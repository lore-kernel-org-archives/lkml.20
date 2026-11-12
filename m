Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794475935;
	b=Zfc6ViIu3ZjhDKEnJqsseUuukxap1u7qygDj5oiiGVVNIZNwABHuEjQbHhZhfCJBiezV
	 /12ATaGP4dQgR7Af1odqzyfEUHxxwSmzEroekUIRp7CV1TzwvrH6VmGoLYtISaKhjhoiK
	 ruf3V1ADYt71nRQp5VOGcFfKXZ7YKQYbZBVcXk196ZGofMtEf7MteMofVjic5lD7C85Xd
	 i2ivQy9fOwEL3NyhFJvnusMc7csaqGcF3t2gPRiRxSzaSkYh2itKk+SbcU3HO4I21BgVl
	 hQzsjTvOQCrpudciZs9F1t0mJcr3pwxFwq+3QYiwjxZmWkpl4pm84mhJJNOPCoPMAEA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794475935;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=rtcQGxtUUhhpjG057YI1ec0swZMNCA7K0pNp77UPUn4=;
	b=aOfj6MBFEpFhNGS48ZdoiURcKNdkWHCoT7PwwKWIomt6WCe+B50cdtDaIpATpQA7XnbB
	 DZJFyLXIF4pt7Duql7YF1RjRU564Cc8B8WiePbFWvuYgBiL2XjvirLmn2j+rJvszsEA4O
	 WnxQ6193c6y5Uky5xMJz13OZ5V4TaCxg509dkFG68uUQsJ0rc+yIFWsXXkDt/iyGT7faX
	 Z5RBbOtj2nsFpU6DTzPE6rBwKuFSfYOPAyWdH9iwvf5xtdtuWwgHpHdTCXrtz+brGAz+2
	 5Nbp1ICgAhMYe9tkuLaUo9PNXaxjmDRtYXZkQwsP4bh1RRnBRgtiPMBufZVaneJc48Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=la8x6vRz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.42
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FABA606A331
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:32:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FABA606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=la8x6vRz
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6d68de53053so2639307eaf.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:32:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794475934; cv=none;
        d=google.com; s=arc-20260327;
        b=FX8wWgDSfJl4OoBxgQAc4RVdlCMdmnP9gw9mMqnKgUN/cryYqaAI+8FRbHvbXk57C/
         eeDQsGXBP2APe5b5qs3KmpO1w2ICJ6hHrDeGdP/wUvZxY6x6WT37Nw5+MjeOvioLLipI
         1yOIUTxmWzffxrpVWcQBJBnbS+CZdfBleADRw6wTJzwqWTzOGQmO15xgrieY/mGpQND+
         fq2ms+4c0qn6TOnP+Z0LRZojRtnAY87nnoz4VB4T8WJctnFrs77hYCNHviwjMRv2VDRt
         2GqpeIqwelhxql6vEXpMxW5HiqE6FMRR7JR1xzoAA3SCfhNGdMajg5X3fOjWxcmo5KvU
         wYkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rtcQGxtUUhhpjG057YI1ec0swZMNCA7K0pNp77UPUn4=;
        fh=1iQEAtn7FdoRWfpn/ZaGcquW3HtGryCYYdmC1T43pv0=;
        b=PSbZhHQlfmKZ/PuTyTTE7UNGYX5QtBaik8jltW7yP0KGaXK+2BaAO3AW8cA/bfwWvU
         N5HutUUuszZ9hGLGdlnJqrB/9zHVQmmsryNfpR0ERGH1lvRaNZ9GyaxBzdV1VRduEGsa
         RjZZja+Es0N50ge1hxteYGuYZAVjKHqb49mYyrDOpYoWHpvtyHpPHIa+XcthPdxVEqEz
         7suz7WjFay/3sUa6WvHjr+8Phkh++Y7xNx+poWKSgRlfSpddkJuJlVWmCPV7tI3YuzPE
         CEaZYLUP0kR2D7k8kjGCKnKcgUzUu37LA3c9PkXy/leW1HzMbxTPVfqZw+piDDhkdCZU
         UqFQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794475934; x=1795080734; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rtcQGxtUUhhpjG057YI1ec0swZMNCA7K0pNp77UPUn4=;
        b=la8x6vRzijxP0etMAPSWRHZoCRhkzjQCIDsH79wQNax8m/e2FfKW8cGfFVgbsiX77R
         PVIrmeR09tctHRKzXULGbF6ht4kvyQlpKS8ujksI6X6lOG3qB7Vwgjn8VCDBX8FhgTf9
         qEr4y+w0r/K6odgxKk0KUaDAP3jcr4q5NoHcf4C4QXsftHC6JKPm1YLEimxKiHIY6RGG
         3DmiuTcXX/0eB2eJS216eQAvyn/owMsvfEeCkT9OMXStiG5c/Ud32T0jel3oGylciBwJ
         YB69RYPf4MZpOvWejwTidpWO5wFGWjwrNvtjVjI/n+tWKnwP2lXt9hMeNH2k3C6hkhKT
         pH+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794475934; x=1795080734;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rtcQGxtUUhhpjG057YI1ec0swZMNCA7K0pNp77UPUn4=;
        b=Lg7iTna/4HcPAvTiq2qnPAYGofrCG4ddfpoPQNrDoZI/2/1U2cj1Fnp56NXp5pAh7K
         nSOdViLiByeAjQG3iAXEkDGCgI0Ca/eeq8xw0Yk3y4+jvh34CI9y6oDoxiAdYUYzo1JU
         8ageuHBRhntzD7K3k/tOY42QNAJ9Lxmdv6KYV7anvWU1GxeGuAPInUzoF/8+clZToJKh
         pmb2yBRUFT+6CKi3Sv9RD75h9S1gSbSXZnWofFB8IIkdv2Csjny8jheGYULZeDGiQl4H
         79m4n7NJvyrx8MSl2QSd0Kfn1zPdoc58uRphzscxbOp/oRp7kunRbpgzsNC7J9wEQNXZ
         3QdA==
X-Forwarded-Encrypted: i=1; AL+hErF310W53Aeem5dpTtcymOYYv+SxAYf4Dvpsp8uxmJwdwEjhttDZvEstGFfECIeF287XpPX/yRCWv3G18DE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8FcvbZbS2V8Fvw/SWPWz6cDpk49qrfH+hSCtiJEMYGjc0yG+Tt
	77H6WMN7ul1qffcQ4H5oq3+0R2Z6D3DEpIa06J0VLfqMCqYUKU+8KfNPiP8j5XaC81H2QwH0vW/
	7Y8NITcrmLmDgVnuOa0WEU8Pev4qtCb8=
X-Gm-Gg: AYBFou24SF5P2wHey9X8rq1ROvbLkU6cP8LF4KgGqZiM3SHLC+/psY58Os75+KzIHEW
	igHWlm2Nw6qYRlJKmrn3idavFGov18vhDWwtSblJMyWBjRAaNmQe+oGRAixcP2sz6/BO0jZco97
	yLTqpnM7sNTEIr+yMWsT30dIi+nbUM5bYkt7ZZPaXfDg0ye7fiFlr6ovQzK7mu9GOXWL3oU4hSK
	xQ8Vc9cGLq3+0cHftEjqTLWgNpzNdqaYep7s0KGJo27MsCHIRwO47EZzjOTZaEM0AA0mXWBHDvs
	U7mWjhzT2SNMdhNtBmOkk86wA1rh1th640GV6t41eaHa9w9OrA4u6iTvo6H07E4NNuGbhqd2gHY
	Gh+325/uWk1DZpR1JASQOVGf5E+d7lER0DgGGpw==
X-Received: by 2002:a05:6820:f016:b0:70d:9063:1ff3 with SMTP id
 006d021491bc7-719172c5534mr3337591eaf.0.1794475933878; Thu, 12 Nov 2026
 01:32:13 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111101345.185122-1-abdelnasserhussein11@gmail.com>
 <20261111121544.00006c23@kernel.org> <20261112022619.5693c4f9@jic23-hlaptop>
In-Reply-To: <20261112022619.5693c4f9@jic23-hlaptop>
From: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Date: Thu, 12 Nov 2026 11:32:02 +0200
X-Gm-Features: AclHuK9G6SS4NwCS9PaJ-OUYEnCgsYzhvEBdLrccU8KpXeI6G-aNGeVg9dQfdU0
Message-ID: <CANpqX3YF5X1_LjXvymcXPwib9koufOAFaAgd97RH8dB61bmZpQ@mail.gmail.com>
Subject: Re: [PATCH v3] iio: adc: at91_adc: move to devm_* to fix NULL pointer deref
To: Jonathan Cameron <jic23@kernel.org>
Cc: Joshua Crofts <crofts@kernel.org>, linux-iio@vger.kernel.org, dlechner@baylibre.com, 
	nuno.sa@analog.com, andy@kernel.org, nicolas.ferre@microchip.com, 
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev, mripard@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

 Hi Jonathan,

Thanks for the review. I=E2=80=99ll prepare a v4 patch series with the chan=
ges
split into three parts: the NULL check, prep cleanups, and the full
devm_* conversion addressing your comments.

Best regards,

Abdelnasser
