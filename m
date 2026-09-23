Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8952541B8C7
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 22:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790203730; cv=none; b=XNKltQzFCsOyFapjwwUZQ8LRUxmDy8IE2EuZjKlsYKwpOT7MDwtQ/kFKbDy4S3lNv/jBqX/2dNCwHJBdb8HTWHQUJpSwpksgSQVpCvN0oILKhsXFthJToUyi3U5PXpfLVSvr1ro9XiTrdbKhQaOH4ppbh43pBlFAmZI1bM4SEvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790203730; c=relaxed/simple;
	bh=6Nk6QdgYo95ZGM13mOWSLDDAGGI4lM1uB9pdRziF/P0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H3+LdKppSm8sTqOemNLb9XBjrbAhXdNRoIa1WbthlH5KApbEi0zvGYq3JT+Ut5QnNei5tXOdvX//Z2pcUlR6vYLCdse2nXqeFul8c0R2wBa2j1IkvfE5RfNBziF1Nc7UxpozwaIpZgO9/vLsJAhKftpwNoT4Jc4v9bEwibnpAPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mWp+f43c; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mWp+f43c"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6356f6bso1174665f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 15:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790203727; x=1790808527; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:reply-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0bBcYE+SQRKaZ3abUhRDaAJqY0dLEhd7Hp6zqwKtzbA=;
        b=mWp+f43caqaOgJy3Me2J0R5EcGIgkYvvgdxqxJwqQgvEnPSsWuOVAfdZh7h/nFxWCY
         yEOJagKxXKUAejeaebs48LLa68oxSQttr4TTbdpfiz6CM/wW7fcVZWTzK2SASHE6ZgsF
         72UmOgwOUXKlaAvips1w8LHSxSfHrknpGZCT7oBsexbtjTegcyzc9EovYlSvDQB5JDLe
         4w7k8DB1sBkl1vpJUBFO82hB01mx6GFRiM9HfvU4EqRQnLKhxGGTYoyU/sXPyzRNjyPP
         3Igbr61kGGAPFun6Lq7g9v9K5GxVr3krukblaK/vIbK/HsW39KOOMNC+npWdYJlNCuYP
         NMYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790203727; x=1790808527;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0bBcYE+SQRKaZ3abUhRDaAJqY0dLEhd7Hp6zqwKtzbA=;
        b=y6TA96eDmfgppOPGD+gU1CHbeZsXBIaVz+7PODCFnOQHQjL+3iwnSaJHf6Xh9xk0Jv
         YjSgqvTdZKtckhQfCcY3hlSLq6RDvaCVc7xJP7Hy/JNKO51e2/NgyYBvdk5WK8OahCe4
         WokwRmd9wRVgBz/j95jIlvjv2DqEYaATUl4zEjx9wy724d2p2FOe8+hO7Welms9d8PKu
         Ct5ORUT3b9juJEVpiqWq//nUCwa2Jv090lVh6Qz45gJZ6Mk4h+ZedEvNM/m+9znXK7Yj
         0yjBEvaW4qX6UoY2qfW/WDCJ8FZHyWakDxBvwIhSFCWbL0A4363bsdJh9dlmiAOKK0C4
         mD/g==
X-Forwarded-Encrypted: i=1; AKwUvBypOCzgTXq4x53rfKrea6+3brEobURQbIGvWlmCFD0CfIJeob6wnJ8fzbXS/95R85/4+v4XGn3WU21/Wro=@vger.kernel.org
X-Gm-Message-State: AFuF++kEh0FC+NtyQvHyarlpgHovtM8K+qXGWgcvpBCqcMfW9n2QCHxw
	1h43dpZHvuGtoDztp5EXXGIEwF3se3PrxlbkizMLxXK9nf+Rt0P4UyAu
X-Gm-Gg: AYBFou1ZyQu/4olarB7ZfTGHze+a2XKbH4UqXzsuP89GP+3CeFX/Rx0E5ssBFGNQHZD
	+Cwq4fnHFaw7SEuKX6QCJSrxszBfHpTFbYvzNUTv0m5WgBu4E7wO0hpI7q1xPgwp3lbcBZn075o
	XAtIB4xnQ5Lk0g0QMdl4/rR/202+iXrUCatPfNs6iPbwpRGY9jVuG+cBuGLf8EXc3ocFhTCTeOD
	GpzwktUlx413TeOTkXZP2f14/Ap27yxUDTh/wIkjK/NrmcHyCVoJqNYqxQ0miImNt8a4WK2kd52
	5LcZ5sahaG75fGqqwsEYCabeKBPqzW7iy0pdwe22cUH7tzvWhWEUaUeWva0OUhXstn6kBw/kyN9
	THUnRIojhc+MCWOXp0li6/cIdEbxS8JjtlGLwr4Qtnr9QRHQSpaZ/107U0/xATE/JNR3ux8yLYe
	91M73YQnJX+felbO8VALRwHxT+rTdAf0VC8qZ7qtkt8b/y/BvZ9zrnooDB9iV4pampHcYnlfHhu
	i51AMjnf7t8ujKb8I82qFxeX5Pz/GH7tzw=
X-Received: by 2002:a5d:6f1c:0:b0:487:27f9:83b with SMTP id ffacd0b85a97d-48871718605mr854372f8f.48.1790203726768;
        Wed, 23 Sep 2026 15:48:46 -0700 (PDT)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886877a2a5sm10789083f8f.26.2026.09.23.15.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 15:48:46 -0700 (PDT)
Date: Thu, 24 Sep 2026 00:48:43 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: devnull+david.ixit.cz@kernel.org
Cc: abelvesa@kernel.org, airlied@gmail.com, andersson@kernel.org,
	conor+dt@kernel.org, david@ixit.cz, devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org, dsankouski@gmail.com,
	jesszhan0024@gmail.com, konradybcio@kernel.org, krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	neil.armstrong@linaro.org, phone-devel@vger.kernel.org,
	robh@kernel.org, simona@ffwll.ch, tzimmermann@suse.de
Subject: Re: [PATCH 09/11] arm64: dts: qcom: sdm845-samsung-starqltechn:
 Update
Message-ID: <20260923224843.GA185053@pevik>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
References: <20260920-crosshatch-panel-v1-9-de6e9512da96@ixit.cz>
 <20260923222521.188197-1-petr.vorel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923222521.188197-1-petr.vorel@gmail.com>

...
> > +++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
> > @@ -262,23 +262,23 @@ &mdss {
> >  	status = "okay";
> >  };

> >  &mdss_dsi0 {
> >  	vdda-supply = <&vreg_l26a_1p2>;
> >  	status = "okay";

> >  	panel@0 {
> > -		compatible = "samsung,s6e3ha8";
> > +		compatible = "samsung,s6e3ha8-amb577px01";

> I guess that keeping the original "samsung,s6e3ha8" would cause that ABI break ABI, right?

> compatible = "samsung,s6e3ha8-amb577px01", "samsung,s6e3ha8";

OK, I now see the deprecation in 4th patch.

{ .compatible = "samsung,s6e3ha8" }, /* deprecated */

Kind regards,
Petr

> Anyway, LGTM.
> Reviewed-by: Petr Vorel <petr.vorel@gmail.com>

> Kind regards,
> Petr
