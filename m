Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583C5455633
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 09:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791193012; cv=none; b=EFAFTfzuaFKw2eNuMfvVPMo0YadMEl1qmfHN6QYJR4Wx210396/r/38RkaK3KiWmnmdBAS1JPEyVYTy+U8NuF23fN9zOo6xPblIm5B3TtqaXiqgG76KvmGn6GiS/8xHxOME2M2Z2//5+MKzWKyweJMHcvgjllF5wYiqTxhOWRmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791193012; c=relaxed/simple;
	bh=oNudNf9KGgKm6/8USlLHbXpH2Kr7BGPq6A+ZyfzohhA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=fsY0AIP4Nb9vzn/fh7wBXXHIrzWU8g/5irmba6PUeDm3M0jpJREFIkc0rmuZMRXRbDwimkqkr6Ta+3O8+zSD9InY5Fk4c7MHQ9LCX6jfOdX40nsrAikpVGmzOsl2YVD32cdsRf9zJuPf+O6UnqWGjO/YkuD8hSqZaQx3NPQcEJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=Qh7QsTwL; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="Qh7QsTwL"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48c4649b35bso1556711f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 02:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1791192998; x=1791797798; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BITV0xN/Wyix+y3zSS4utGAF8MX+E4pjWeLeeUY9W7s=;
        b=Qh7QsTwL0yYS0VzfLIPMFwJomBZpnciMrZMfV074wF1vOsDUTDoG/bbMwKtnPuhvtK
         AfGeFBEsTYWfyxI0O61nvOAB0VR//exp5QS0mLWbx1/dM3Ijh76wDzcKJvhTVcG0vTx5
         6xHDrTzk165TIyCcliUbwW7cmmpfghLcCqFT+NM4bIpUBnCtQwgdw2unicfYb+oMq3qc
         ua1RdAq1LvW4GZFxPrEExzeQat3SXyBHIcYhtJaFvLQTcD9UXRJENTfKDMA1v3F/zqav
         PtcxQdgJDkZdsJougMGPEnGS0kWyXp6S9OntXdF9DCVKQQizg1/CDECPptnqnf7GnfTK
         9eew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791192998; x=1791797798;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BITV0xN/Wyix+y3zSS4utGAF8MX+E4pjWeLeeUY9W7s=;
        b=yrSFY0oH+TDb9JU7H/Ui8VPa3RQ0bjXuor89RPDlneKWJHDznrYuK2YyGFI9ICHUqw
         m1Br7glXayD7leYZebwkucwamk9NkWTnpLOqXcpgzju/Pk7uC7ggDIIEZH5JkQ/YiR55
         REXZe/Xaq6E8RMRHBzNeUPHlPrxoijElKvm/IAyaflzSxPmhUmn5vaf23bxg3mXBhisc
         gs1iIiH+tiX1I6tnZkE+sG92sZfSnIOICKPUi6Js96V9J9u64Ly9o9FmPIJAMi3tRYT/
         nVTAkKs82Cy1dJldEC4/Bg1CEOTMTmdZ7S3TGIdYKgX09G71vPV2rGb4od0yeUKeyfKa
         ZNsw==
X-Forwarded-Encrypted: i=1; AKwUvBwsT0C/RDtmMcHVnPMXtNQcYmNU+c0ywys/b81il+Y5d7PQBIauz4Y3OzQ3nuXmLvkOOF93gbpNEBdcXgs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJkkTY143CJRVmT3sq4La/PMK52acK6sM+qL0KqSq6Qeazzc1G3
	eRALEdsZVQ7uD6OWxZTSS2gFG/Qg4KwBI8fa4K+Vcv00C+09j29VWYpcrdIjFvz+6Es=
X-Gm-Gg: AYBFou3nINSd++MVVQbhZU7oMqLSR6TusSfMLzbjKvnNE/76RguQY5B+1e0ZTu17nWS
	p2O+qxcpXbJVHcEOEMrh/mWay2s4UWnAjcN0IhVaMUCH4555De1jPLZbWLR/rlNKWp4vcSvP27j
	mOiCSjEOYfOzDAZqFVWGCnoOqujl4r7gXd8/sKZN0487NzxlxwQds9To+HxLA75srR+IJucY1I6
	e2jIJuNrJ+zGD9+OIDirX2Z522IA9Ja1fTuR+7h6ZhLEhbY2NZCv8FGNOqK52SNkldcWOYs5hT0
	oFeXyh6EzZG5s7KkCXg2juinUltF93AL3XwmDeJldrcqaeYpJQjwpJmEn+8FwkhJhsazNv6r28J
	/QqUTQ5R9wUtxHy9Hz546puekkZ4zZQ6XNq5LbCtuFK9zGjXToHoqsPNhOGPM1jX+to57XQ8U1g
	rV1ipPsor8cPzfrT9R1q7/MQmWbjm972kiSPlV5aaUWR5t/4gvh44D4VmzERPPTVwzZvGC
X-Received: by 2002:a05:6000:2212:b0:487:1ddc:aaff with SMTP id ffacd0b85a97d-48c47ffa3f3mr10798541f8f.44.1791192997141;
        Mon, 05 Oct 2026 02:36:37 -0700 (PDT)
Received: from localhost ([41.66.99.5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c622ad2f9sm2391478f8f.38.2026.10.05.02.36.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 02:36:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 05 Oct 2026 11:36:34 +0200
Message-Id: <DLWSX9ZHDC8K.1KXUAR8VSMNND@fairphone.com>
Subject: Re: [PATCH 2/2] dt-bindings: display: panel: himax,hx83112b:
 Tighten compatible matching
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Luca Weiss" <luca.weiss@fairphone.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Jessica Zhang" <jesszhan0024@gmail.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Luca Weiss" <luca@lucaweiss.eu>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3-dirty
References: <20261002-hx83112-compatible-contains-v1-0-d558635ab7fc@fairphone.com> <20261002-hx83112-compatible-contains-v1-2-d558635ab7fc@fairphone.com>
In-Reply-To: <20261002-hx83112-compatible-contains-v1-2-d558635ab7fc@fairphone.com>

On Fri Oct 2, 2026 at 4:49 PM CEST, Luca Weiss wrote:
> The compatible was defined too wide, we just want "djn,98-03057-6598b-i"
> and nothing else.

Fixes: 54bd1390e984 ("dt-bindings: display: panel: Add Himax HX83112B")

> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  Documentation/devicetree/bindings/display/panel/himax,hx83112b.yaml | 3 =
+--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/display/panel/himax,hx8311=
2b.yaml b/Documentation/devicetree/bindings/display/panel/himax,hx83112b.ya=
ml
> index e58bb3d45331..34e97003d293 100644
> --- a/Documentation/devicetree/bindings/display/panel/himax,hx83112b.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/himax,hx83112b.yaml
> @@ -18,8 +18,7 @@ allOf:
> =20
>  properties:
>    compatible:
> -    contains:
> -      const: djn,98-03057-6598b-i
> +    const: djn,98-03057-6598b-i
> =20
>    reg:
>      maxItems: 1


