Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96BDE569F20
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 15:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788968358; cv=pass; b=Sok/LCbAaTDpEbdc8T9K5o4qEV24uBQRV9hz1V8A4B2PgoXOxMeiXxrEskaym+AC91blwaDVri61GDgEONnEUNJXNlnfzG/omp99f6hpebVGie2kwigAXRLJx/jXcl40z+nJUEzSZrGMxfZSCtPBa7Io7gcMnE2oHu3PC+UH8dg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788968358; c=relaxed/simple;
	bh=d0pKxJa84Hy23RkMwF3qecwIV6dtSAzTpoBN7kQmU2M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZzONWnTo91lcR9Sng1lzWIyMAZf9C+tSwCI7gt/3liAwo+f7/uGoEBQwIhKTsogSMAXl3t7b1jPbYB2KcQSdtKtztDEDQpWSHlivokL8ONmhBEwfGgqfqIfCbhx7xAmAEyzb5TSNTcfOMPY3S0TKpWLcnq6s5Om1juAx57vXwQw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R1H2JlCw; arc=pass smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R1H2JlCw"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-939c8c6b114so89151085a.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 08:39:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788968355; cv=none;
        d=google.com; s=arc-20260327;
        b=Gj+j99rG+CBDY+F45353oOB4/Frh9gYOsZAh+7GGn+1RjT/dYUjQeHlMKFfASNo0bE
         sZVMFDUMQh9FR9xxCU3dHunySGSLCjMJj5TwG8RgE/FZZUfc105e8SAmtKzWFtb5W17w
         ReafsbnR1OtbvBh+ikp2Kmal11+TV5c9WS6pD2PhA/Zfpm7ufWQDpC+JIeI0Yx2eYaaT
         r1gjCQ++6EAP60qYS1PkRMsx1+eEOgVLwwpaPE6NJAPBpszr0fzqqYQCLlMKb4CB/aA4
         3r9u4z4M3FzjrvSU0I/XQsqxZtuv2XSZYKuJBBs2D6LTZNTd9bh8bCg0+jgcTyfMcBuU
         3gfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y2BcXwjwhzGo0gbscGL/yHzGnW3tuBNyEtOXI/QDHTc=;
        fh=1p7oUrRCbgNiptXVLKNoPIzHmw2mGY7XstEt1C248I8=;
        b=boYADOJGJ6gPFnCLJ6RsDEPjQhb0XmuOWqdm/HR9DqJjbceN1/7G1H8ztGrGBSGvvz
         JL+iggdiTx2dOsLAvY94pSzEq/kwnreqGrHexYVq9sJtnIxgz5HOWwOlB9Rc9elS3LaA
         nmPj/wgDFkCStJmRD0lpORNIegC5fyrQHRSp9p0Z/ChfLRFUMo46ewYpr8Z6lGp+iSjE
         xRtFOxMVQnHnRMgxgtMm6mLbwUwNT3oDpVHrf0js7TK6rHwnktU6Phv20NTnrgPga2Oz
         HrVV/tUOq9ienJbu47OK2mIylt4V/TGeqCA870r0YbnPTUK0wfm+gcN/h8vFNhQkmfO2
         CX+Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788968355; x=1789573155; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y2BcXwjwhzGo0gbscGL/yHzGnW3tuBNyEtOXI/QDHTc=;
        b=R1H2JlCwQRKB+F3QF0pTL1JBMG/lTxwnBr6tpQktafImUrzbPe8GhV3ZIij8vqq9l4
         hUn943Q1V5vivX/kwoBwnbiD3cLhGWA3vshKo2RmJfKnoQWNFwxNb6TAGcM6qd8pUlGr
         +5ltj4RG7A2CNaUMTClkdyvZcUASuMq6eRSm97qHTalBe661Zh73XbWlfFsSBASQ4YTl
         6cdpHWPALh8Ef17ov9oW5niMvlXPJDOzt8L6lcEAMVatGIFy3ya3U+ZhWRjKCgRF5tWs
         lbiTiURS68ifmXyzUg6+kuCq7DlBwgZxefmz2HMUvB2Pgd+LpcwE+kZQpeVERxkvNraE
         jGQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788968355; x=1789573155;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y2BcXwjwhzGo0gbscGL/yHzGnW3tuBNyEtOXI/QDHTc=;
        b=oTLjDf8y+WRDuI8jhvkmm/DUQ1dDKtDuw2ZT9Nn7LX8stwRfOSmrdoRVZZ6ieVULtD
         Yrx0ARLhlsxukI+QXwNrjWPxfuXcILhLczqisN3eKAi2jKvzzY1Gr1VNxSrQbfjYTOi+
         QTwWMeiFWd/duky9D8Fc0jWnMsxDWMS4Czc2B06GVWdUNFpjkvzRPg7VbfJPXAil28V3
         qJCWuOq5sX6QSkyAQWnrvv1i0k/6GR8cYrDXQsy0S3Dpe5A3CKwLHX5mUDx3S3oi95yX
         Q81fyp4+KVgb2lHYNlbWqYcDJv9+yx/USwTjyFEAPfCIt7dr7Dlp6gleFDMG7ZGIuhgf
         AIyQ==
X-Forwarded-Encrypted: i=1; AKwUvBzGDUMkhF8ZJQPBWg/b4KWwTXIDQhlkYBBuzUk+cXmYNQzvmeQt0wt20GuKpci/NiXa/54WgC/MM9kuaQI=@vger.kernel.org
X-Gm-Message-State: AFuF++n3PrpPCsqoC3v8Jf+rvUEX6e3xMzTv+te/sv5pUer5IJ7nHJO4
	GIBOgUFuhmhvZV8jCDkKhYAA20XteGCQcRV3pRUB3aH2Wwekuh6FdUXh7S68h3xeqTBPRstEaUN
	Hbb6bbjlFXSTMf8ywJjzJ2eLfYMO9KDg=
X-Gm-Gg: AYBFou1JMVHQf22M+s0g0kLLUhzFP39hxnRXHCejX1ACWf7qa8a0Lqe+o/pYxIcMWHt
	cXtHlveojxywdUJjez5TELOOIzb3bUYHFkNlf8SukJp5ueucQko5Wv+T+JpUGL1sEilkR0s/F7k
	86niA3vLNTJJA3Be/6XOGGoHDhgYriZrtfvjCHXEBpykycDGWfbpY6GONxG5XhBXCkVhywxZ8kZ
	GEYcRkmJ1vNmQoIBrfUj1cMSUlvWX12LC4ACl4U0X8oUYvQFa5cdw9LRT6UatiYeyR+s2QJ9OKa
	xcLqs/hx23IpL3G7bwc7W1vY0CJSyCZWPB0QKbgR9XLmudUVavbPmehFBTVGV45QbO+JN6K9JMI
	gLjWu/92zLaZ41r7NRkmvpITFJusfZOMzQfxeCwX+N4jrzFE/j2bpTloE5KctBJ2RfWyy26QavQ
	==
X-Received: by 2002:a05:620a:bcb:b0:939:ad19:c5a4 with SMTP id
 af79cd13be357-939ad19deadmr2244779085a.39.1788968353944; Wed, 09 Sep 2026
 08:39:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <tencent_81DAE01221B65767204B64FA5A31B3AF8407@qq.com>
In-Reply-To: <tencent_81DAE01221B65767204B64FA5A31B3AF8407@qq.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Wed, 9 Sep 2026 08:39:01 -0700
X-Gm-Features: AcwNN1WqA2XGIh6uNu3C4y8YpfwxZVKAs0KfyuEpMvoAotmKGiAxfiM0U6KA8io
Message-ID: <CAMo8BfKB15V=YkS8i8Mqhcd7H0peaabSi0_pWvVxqaGCg18sFA@mail.gmail.com>
Subject: Re: [PATCH] xtensa: time: Fix clk reference leak in calibrate_ccount()
To: blaze <1466528493@qq.com>
Cc: chris@zankel.net, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Sep 8, 2026 at 9:43=E2=80=AFPM blaze <1466528493@qq.com> wrote:
> In calibrate_ccount(), of_clk_get() acquires a reference to the CPU clock=
,
> but clk_put() is never called to release it. The clock reference is used
> only to read the frequency via clk_get_rate(), then the function returns
> immediately, leaking the reference.
>
> Fix this by calling clk_put(clk) before returning.
>
> Fixes: a1f31a21e0c1 ("xtensa: add clocksource")
> Signed-off-by: blaze <1466528493@qq.com>

the handle "blaze <1466528493@qq.com>" doesn't look like a known identity,
as Documentation/process/submitting-patches.rst requires, and it's one of t=
he
first appearances of this name in the LKML. Could you please re-submit usin=
g
something less anonymous?

> ---
>  arch/xtensa/kernel/time.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/xtensa/kernel/time.c b/arch/xtensa/kernel/time.c
> index 0000000..1111111 100644
> --- a/arch/xtensa/kernel/time.c
> +++ b/arch/xtensa/kernel/time.c
> @@ -152,6 +152,7 @@ static void __init calibrate_ccount(void)
>                 if (!IS_ERR(clk)) {
>                         ccount_freq =3D clk_get_rate(clk);
> +                       clk_put(clk);
>                         return;
>                 } else {
>                         pr_warn("%s: CPU input clock not found\n",
> --
> 2.43.0
>

The change itself looks good, thanks.

-- Max
