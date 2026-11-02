Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793633922;
	b=XDjwoL9xWb1Mmq2EQZj7latX50flqQoR9yrojOTN+UJ+Q7u8G/bjqwcn7Eql4fDrQeuS
	 EcUsoqFy/VJR/m1MOdYzuQN4huaBsqW27gVv7+Dt11MVul6CIqKeM2aicW7goAINpnLZ9
	 3mRBJIxASk7oM79VzPHwPusoprhISNjwHERbN5T3f1RrpQibJpCn9NiBGQizsYuXQ+0IX
	 B5TUdK6/Y4QHvx2rvBTY2KPym/vvzvmGjjLPlBlmRSWp7Yf4NnekkgXiKLDbYv6zF5VsA
	 Ff988gCu5uUVh0wSRiFsPnQYjvw6K6jTugMuLoUh1RnuKuSnE8XHlYO1etzA3KNbduQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793633922;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=xhfruxoM98Een5ITlNIjQrfHmQbR+gsN6f5mhg300tQ=;
	b=cvR2W7NtEWeeAaR2OxYmqfyf5nENk9PejNItnoFJDs0r99cBwlvDzIfStOECHSbkV8sw
	 rOn0kTAYVROOsctXh35DmeJVQUn8QoxvUDyiEpjF2JITrWtDFwnq8wvJmlZ54SwnPb+DU
	 lSzGoX+cJNXXGrCNSccyYz/5mBU3NrbyF1kI7Bas/qXxhb+sTg63KRwW4AZfMRzr4juOa
	 Kb89XlHifyxMyhdsizvvDBY+UFbs0SQoTWKGoJUcU6J9qY0jEvMJN04dO2+gvmZ81mJvc
	 OECbd+7iO4jBl9TuNYrlAjgzeGX7doDkJOhwt5+0C9/n2vddkz2Gwlmv31BJ53d/J7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ku662CHG;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED2D606BA4B
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 15:38:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4ED2D606BA4B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ku662CHG
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48df54150dfso1483509f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 07:38:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793633920; x=1794238720; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xhfruxoM98Een5ITlNIjQrfHmQbR+gsN6f5mhg300tQ=;
        b=ku662CHG4RZmakqP2WPRkIHeZ9nCsxVH8Qll5GPnWUKjZP98vYEa9sFfnSVJQftPwH
         Jpi1QrR/SWYNH7MbmB014gksTKCyUsneqoOb4gKG9uTmdAMsJhqNzERot6iGlPgf+LG8
         B0VHfSApCXLnBnUx3qle41H9FFkS2CePohtHHN8f4AAAGcdCnoCTCRckYCa7i4yqN9M+
         AzCa6H2wRdCmw3u5EgESAxXDmcEGIg9MFNKKjEuU2972GVtxfIWGNxKAi/xwFHksqWiC
         Cc7OCGKtU8PdZeWveRrwhK8KVCamH3SamhpfqOk9y8k4X4+rFgXm3p/N4KP6kfQxWwYy
         ZjRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793633920; x=1794238720;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xhfruxoM98Een5ITlNIjQrfHmQbR+gsN6f5mhg300tQ=;
        b=Z4wZZnRqyCu7rbnRJaiAVgnO5pbi+MzEdaCVRGi+oI+t3sXFFI88XbkyKCNQW8QKJc
         c1/ML+DdaSX6G2j4ZmD5XIm6ThUUhuA0Vptp0BjjiBPy+QtNkRobD3ud4hEW8yzcSTuf
         +zX3TebjLqsnYmO3pi+ESw1x2ACLOc5V1F+ZpR3iwVbLgIhWLb8aYqgJQ/JD7DotG/fy
         o2S/9nXXwUYKXAQyIeFjFTuSeGiQ8l9+UvNySLN9TErjq/ENfZS4uYjEshx/mBZR0wH5
         d50pCP/T7rW0HtesE0nl1v/Q/J+W6qMrlULSU3DBf05fM0DL40dVcdhnWOTrGAQK6s83
         aaKQ==
X-Forwarded-Encrypted: i=1; AKwUvBwTfQcXWPm9ndhgR8rYgElLCw18eh8ChnIlvNCTLos2AZ8w7dpjDZf+FLnuctOR6xZWUc1e8/xX4gPp5SU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJB3KVYnPSkYu4XM7YS2anPkmyQgDrutij1jmRKBBm+H8uPcfFG
	tSFuXUJmYmTLp5U+iXrRBQCiIQm54vndFm7okqhlJzFuZmQl/KcZ868VLEbQr8LDu9s=
X-Gm-Gg: AYBFou3SMDEaehLSuQ2IDCTeebrfv4e1Bb5PduWVqr1aKJplReYVL9BOtzeHyL8NOT/
	RLqQ4IbyfC6XHFlbkmf5CnHi+QU0TytUec/mKeEUJl8+V5GTyPRp4VqVQhSfYhmhitnX1q3+fSU
	ocqfiB49znj0pUtkNG5WeSiCgfeylTrd0m8ctt+u2JXtWjXUaNdQ6ATibGDj7sOAlYESAjUbj7C
	zeUcEXboCix9KZ1UBpAL/Y8mhQsmFEMacLmBgHGB5unLW/j2RAR2hWD2lGZd+FrowPjddJJh8UR
	U5IE/AZ6D02CxpaJ6Va1sWAWmZeLndcT2mN89luO1b2XfsookpC//tL/pu0zyloDrLbpR6QhGVa
	tHmyWAmy+VwILITFM1GGx+a6DVLnGfPv2HTSzpY1DQuEomxiobcn5bqV6k5jbqiwUgND7j0SCLG
	S4lNb7EGcI/gLhcmV1ioU/3joVuMM4uJiqO/cExrNhaf96OVj4YIDTWq6E87CHUfySax4h42riL
	zfseaWtunykmCb205Ku3kOiirTYq8iXxdE0oK+HPjpvrP5ojzoP0fjddlpdK6XWKtgWn2V0brhI
	3jPvCJ7r5zFqerlnJfWLz1iHOaO9GxqBaBKdCipeeV0XruzQcfTFHfnR7LLcA961opfpQQ==
X-Received: by 2002:a05:600c:354c:b0:4a1:9663:7639 with SMTP id 5b1f17b1804b1-4ac18c7389amr253064725e9.34.1793633919801;
        Mon, 02 Nov 2026 07:38:39 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d5dfsm23990642f8f.3.2026.11.02.07.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 07:38:38 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] clk: composite: fix NULL dereference when the parent
 clock is not set
From: Jerome Brunet <jbrunet@baylibre.com>
To: Haotian Zhang <vulab@iscas.ac.cn>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261008180652.2756849-1-vulab@iscas.ac.cn>
References: <20261008180652.2756849-1-vulab@iscas.ac.cn>
Date: Mon, 02 Nov 2026 16:38:33 +0100
Message-Id: <179363391371.2870673.13540022018309238791.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1382; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=pMbQRS+qsLwL3CWCPPg6RAglkeE4YUvQlevEoROTazE=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFkv1tU82aI29dpc8Z5nC5OdbDsKxbyLtx68dDpgivt0v
 bp8CcMjHaUsDGJcDLJiiiw13NXi7yS1vsyarnMbZg4rE8gQBi5OAZiI8lxGhl7BnTuq3tz2+RCm
 EJT0xysk+ZW+MNf8ao+I+LqslDl2Xxn+qUyLOd7CY8qeIyZcu/X5lNKz3O43/e215GMad2U4Mng
 wAgA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> clk_composite_determine_rate() reads the parent clock with
> clk_hw_get_parent() and hands it to
> clk_composite_determine_rate_for_parent() without checking it.
> clk_hw_get_parent() returns NULL when the clock has no parent yet, for
> example while the parent is still an orphan, and the helper dereferences
> that NULL pointer in clk_hw_get_rate(), which reads parent_hw->core and
> oopses the kernel.
> 
> Return -EINVAL when the parent clock is NULL.
> 
> Fixes: 2f508a955a67 ("clk: Convert basic types to clk_hw based provider APIs")
> Assisted-by: DeepSeek-V4.1-Flash
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
> ---
>  drivers/clk/clk-composite.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/clk/clk-composite.c b/drivers/clk/clk-composite.c
> index 11842bce5918..40d64ef2d325 100644
> --- a/drivers/clk/clk-composite.c
> +++ b/drivers/clk/clk-composite.c
> @@ -75,6 +75,8 @@ static int clk_composite_determine_rate(struct clk_hw *hw,
>  			struct clk_rate_request tmp_req;
>  
>  			parent = clk_hw_get_parent(mux_hw);
> +			if (!parent)
> +				return -EINVAL;

The mux return 0 on orphaned mux, so I don't think returning an error here would be wise.
Considering Krzysztof message, I'll wait a but without a clear answer from
you, I'll probably followup mentioning this message as Reported-by.

-- 
Jerome

