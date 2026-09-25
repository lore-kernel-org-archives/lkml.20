Received: from mail-dl2-f12.google.com (mail-dl2-f12.google.com [74.125.229.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 285174CE688
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 19:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790364077; cv=none; b=SAB8Yo+G6oAxMc3OCNatzHz34i2P1IkM8kJ91ooO54sk5g9pNX9/ZSudzSF4mrOrS1yxjRmMS+mOBXyGGAqJce8bpLy/3EuCZ7ET3DINddo+WZwApYNTjWBUqW6yE5Jwr0sR1wfwHqcATb5KAxFv77YRyxSdEDY+ebDMbLOnz4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790364077; c=relaxed/simple;
	bh=KAeKmkNkjuzZG9TiPoOsXDj84d0lGdVN5Hwuzhdo3zg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LJ36TKhYZRuMoxOt4aTXFVDJErj7Jpb0mm+rAiYHLM5kNb9DTACl/ve7L22sPj6Yp3JlvxehVh8ibU/iLtbfbc/6nagk0xIm8axSxrDkB6Gk07PU+skd0EB7NvwPhpu09I1KB7+IML2bmOV89fRbAPgoOSE/X6uJE9Ncz5UDBXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=asnoedmm; arc=none smtp.client-ip=74.125.229.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="asnoedmm"
Received: by mail-dl2-f12.google.com with SMTP id a92af1059eb24-142dd04f7f2so1044120c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 12:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790364073; x=1790968873; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1AlSXbEjro2stcGQ4JnkFbJoY4FQMoz5yKwywTEmVVk=;
        b=asnoedmmhW/NUgBMm4aBxVE8jnMtXHZduRTjnB9dHZOs+nq3V1NZUKbuLsae4L4pNs
         0lDYM/GFZFz7WCAEWX2h+4B0/VRo3iPsh6nAwt9jNhrj8YNaB7hj8IonGtdWigySKwSP
         2Dsw9Wg4WOImILktjwM7YSrdpU5d448GgHLjB1wZ/XLMGFaW6w3pdz+PJizTZ68OGam1
         wUmHY9vSsdkT/6DatSVcBALStHe5faJmI36urSzWK44YbLUONVANz+RHM4ip++IZ56Do
         GaqWZwcUsR2lLwAn1GEUazWbXYXKjHmdhrbtplL7plnddVWgJ1QFcsFAmiquxIUcLzhL
         OaNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790364073; x=1790968873;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1AlSXbEjro2stcGQ4JnkFbJoY4FQMoz5yKwywTEmVVk=;
        b=2kGh26MmCgfOp8Unxn9x4eyPiNpdVAelq2YGp084VtqttTICsldaknVIlSRO1xXK73
         dtoxwrAANTab/7pwqo+E+nkg+htWJZZ7zWU3Qrm7wmzZYLTKDg6Az+PpCLQXIAeFm5cW
         3fjzVWb+Hz4Ha6iCRg/KMcdBvY5C1FDT2+V5cToI3nCCM65kb8/19NOfDf8KcptGqoL3
         GQhF1/TJ2xFTMPQomQHpTmrKpevT5ukWEDGDu/mMhxVTyuywnuxKrcWx5ez4QihaD6eU
         WvheWeqRUW9zn7DognlLnKtCtwwIwnCmSUT3HGdlzJhysDRPvztqtQL3hyc7MuvM4fRF
         7f2w==
X-Forwarded-Encrypted: i=1; AKwUvBzF9g6wNNkhP/OD70PQSpp0UybII0l3/ekuf5ylKbMICO+ctsqSror/ZXkUpom6Ls15MXlUBrnanu1dh3E=@vger.kernel.org
X-Gm-Message-State: AFuF++mbhvHYeT4wR1l9lTT7XdTYcUJIl+0+RPLKeIpvB4EjjCgY4u9I
	WyH3JPOJTM5r7DhYVMOGT77kyzJxfB1IPiPkYPsrY3MPVVrVT/n6ahV6
X-Gm-Gg: AYBFou29K89AdEU/xE+yjVkhkgkDOzhZCN80EwTuMhbsnMpK1mHAPdc/W3aP1YkgnMN
	7cgO3ID6ytCkvEK0FOn3ge9tCF9yrvFvHFqiznCtqG2EVlhKPqNnLQZXcyj1Y8pa+vmdCke0hN2
	shPoJe+cYymzQNV0boyKk5/nBn9zeSirE+ak6f3f8FXzY6hrrifYYXJQHjv2az6fiUvUX14URbL
	BtIsUduHEaOJBCE9neuU8cee0MXgdgxQ0a3aUWldA5SXO3vc4jts/WAAx0fqSqA6AsGJRp2w9NA
	BhPXXhy0uk7+aHBzpq/ANf1tulR+SGxcO7f4SjAqSMvL5jnTgvHHukZSxDBhC2geVl3lmnxEBks
	/Ie1E+V1FbsbYtsF+YY2t1cxSj8yaZXln8oSDYmfOOR4PRNT3A7/f07YlLYSh7uyaHev/yfO3vD
	wbKUn0SRkfTgt5cotpg7sIozz0ruMQ+tGo0V/SG0Vn41LkOkIONvYJuKCV8X+qoTO1wMGPG837u
	cSnyRM6Uhomd4rckKE3/QheGOtj37i+O58aHt8=
X-Received: by 2002:a05:7022:7e85:b0:143:3242:6301 with SMTP id a92af1059eb24-146ce29fde5mr1024848c88.4.1790364071957;
        Fri, 25 Sep 2026 12:21:11 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:375:19cf:5fee:be32])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-146bb6551d9sm1708481c88.9.2026.09.25.12.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 12:21:10 -0700 (PDT)
Date: Fri, 25 Sep 2026 12:21:07 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: david@ixit.cz
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Henrik Rydberg <rydberg@bitmath.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Petr Hodina <petr.hodina@protonmail.com>, 
	linux-input@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	phone-devel@vger.kernel.org
Subject: Re: [PATCH v7 3/4] Input: stmfts - support FTS5
Message-ID: <arbJQezIkyvCf1rR@google.com>
References: <20260907-stmfts5-v7-0-4a53381cd038@ixit.cz>
 <20260907-stmfts5-v7-3-4a53381cd038@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907-stmfts5-v7-3-4a53381cd038@ixit.cz>

Hi David,

On Mon, Sep 07, 2026 at 12:50:21PM +0200, David Heidelberg via B4 Relay wrote:
> +static int stmfts5_setup_input(struct stmfts_data *sdata)
> +{
> +	struct device *dev = &sdata->client->dev;
> +
> +	sdata->mode_switch_gpio = devm_gpiod_get_optional(dev, "mode-switch",
> +							  GPIOD_OUT_HIGH);
> +	if (IS_ERR(sdata->mode_switch_gpio))
> +		return dev_err_probe(dev, PTR_ERR(sdata->mode_switch_gpio),
> +				     "Failed to get GPIO 'switch'\n");
> +
> +	/* Set resolution for accurate calibration */
> +	if (!input_abs_get_res(sdata->input, ABS_MT_POSITION_X)) {
> +		input_abs_set_res(sdata->input, ABS_MT_POSITION_X, 10);
> +		input_abs_set_res(sdata->input, ABS_MT_POSITION_Y, 10);
> +	}
> +
> +	input_set_abs_params(sdata->input, ABS_MT_DISTANCE, 0, 255, 0, 0);

You need

	input_set_abs_params(sdata->input, ABS_MT_TOOL_TYPE,
			     0, MT_TOOL_PALM, 0, 0);

here, otherwise input core will drop ABS_MT_TOOL_TYPE events.

Thanks.

-- 
Dmitry
