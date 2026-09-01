Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC2F336A364
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 06:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788244525; cv=pass; b=g5YB+A4/gmPn1eKCBiDE7k5y0cUSNF1oN/qGL3iaNwXXP9GoValZsT5OR9wSYQ33V1FUlL5WOsnSEjX74ZIZMQV1pHlvteZhSkzhnjyyN2OmXXyRteQuE/0rnmIcvRtL/+dwgIYREQM2YNVHT3HRdGlsK51GGNUyoCjMsTYApeA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788244525; c=relaxed/simple;
	bh=BDon4cDpFmYz8mQwr3AAQV3DrhPj3IR/41250WfkfjQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r+R0k96iTPD6nQavLX8ifDZtrIsYRxtZFdO68Y+SaWl6P8vamuM98UFl4Eke3p7L5iBKQPy5KzMHlr9q4bhS7NVKZMRwlx9kvfcUrwzaVJc4pec0KtJ3iIE+ErDcmE1imwlXJPYJDR2fQo0cQqCX+NgV6BIXiFJCSYEb33KmMIU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aJuaV8An; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aJuaV8An"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6a156627e22so1113736a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 23:35:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788244522; cv=none;
        d=google.com; s=arc-20260327;
        b=QKg2WZssA9XF3/L7maMQiy5CRpmXCbryLFnkJ6+smScGcqwoWYUjWOBKiS5maPZuqf
         P3+Aoc8hu/X5lDwBPwTa97MMItvgAWDkbFoKvlUBdFQB88Xf2EvGaIc1YIezaL5J1JPD
         fhNJME2u2GWWUdb89bw0vn+MDWVyDUG/rMFJvYfxanseZ21P3Wu46c2vu4Ea/vRNB4ho
         C2tQsxPeemUG0MrNKtGVx5FHke+GaqwuggXi2BGd8hn6IHJXTaLz//cAlUQfq/0ockDi
         2yBF8XIX46wyMuWvq4l2J9WfXTqZr+y67Pl9BZvrCViQCUyUjJjHsazxmuz1V2fn5ODf
         BXLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PBRE3q8NdTAYGu0/68dIptiFGGW6PBAW2Hf2zZK1ifU=;
        fh=j5o/lw8o1msae8KEaZnPOVgc0iLcaCRYThquZyspn+Q=;
        b=RmpxldMeqjeC9V8kMuwlDHlbUkn1wCKX4WT+ecjsdSfw3J98FjiM1JNVrV1ggIwNqZ
         2MXABEWb8wbr4UeeJ1307sWdNFEU09ge9eqJAXMHXO8Hoov4suZqWfvwm+wkZNjkyzAz
         lrc7cublYYeqH8qULjU8FDdLZlHjyM+wPI1fsjyX7vTIkG6uCsCzCpFaubOo8GPbOELA
         SbVYw5cRxXCnb8e+jykdxq3AaYLdBQJOBWwtkJr6MKBKydppeyzGYjB7L8BvW1XJsKcO
         VTjDqZajLL05SVjzrbCcJcyNdBluxd7dD5Km9eJRHepTdBJCEVPQhw7p7ox9XIhw+o6t
         wzBA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788244522; x=1788849322; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PBRE3q8NdTAYGu0/68dIptiFGGW6PBAW2Hf2zZK1ifU=;
        b=aJuaV8AnNKXXOBUpWLK4vmUqa63/rYdfhLrWH4OC8LuQ7iZGjM2qhAW4Zj7AjPB1Wk
         COYUzhhxr3JQoXTMUHkbDDejIEM0R4rEmPDgezWB75j2GMgDPuwIGT0Vukz8ZDjA+prz
         vrI7pDhJLZctnjEWZF+xFx8lZUXJ4AT3PhM7HL3O9yPJqRz+M5Umla29sf2ay/YTV1UG
         i5e6QpUasjkFkBZP22NlMTmzcy7YKD5yDbMEA6w0/ddqDDY7b1vcclRmEyfGmj5N0F/Z
         FYGHIlIOe65L5fN/FXC2C8Z6hufXsqPivD8ogtJujMhae9khHKSVj9SpSirplcC9w6Fi
         cNAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788244522; x=1788849322;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PBRE3q8NdTAYGu0/68dIptiFGGW6PBAW2Hf2zZK1ifU=;
        b=e3ULDGQqWpteLAWiT00MJICASs4qw8kHQORYf0nyO0KsjachfKpuJXuea5UwABhNoE
         s4Cv/DI45Qa/2PfCaZPhi1JN/0BC/lnP2OrBsgXWmwJN8naPAmYKgXlyLgSwXnyiQBQn
         qEw2Bnd/3yjsx2Dhp3O+7MW/Kht6HPcX0PeingyqfCwD2FwtAIREi3xroo77nrrRxCgA
         ZZhnW7JI4xICMH3mh4A98/GH4sFLCwR0yUC917K7pBD0pi6koU7HUhnBOXtQ6JP3uRDi
         aUQk9rUg/lhAL0l8FwqIZBmiaJ/WlQ6dIWA4MWn8VSY4ngUzA4pLiuJAiGOK/SZmI1v0
         RRHw==
X-Forwarded-Encrypted: i=1; AKwUvBxDNMrGSXLvg2lqHVRsJDJ4kYTQyNtq3jOtJRM2nc2BspzUkyqe3V6938Vr+t0BKtSF/2fXAY7DuJbThys=@vger.kernel.org
X-Gm-Message-State: AFuF++mKw2WDLTQtIzbyjBSqIxGmFYqkJQf+w69p5w6q5QZPjecYPTMK
	L69QqTN0yqyPoOHqUsaqA2LJLUsg38blJrUPyQnt1aihhsMJskvJ8/+L/E47jH8XUho5QD4o+Mw
	klvbdf+/F59Fse88gKolpcHF1JYQZ75k=
X-Gm-Gg: AYBFou32/d7cDNr2j0/61Jy73azFuqa6ubRVuLn5xQOUIEnoluwRY1mqzZptns848ng
	/kxSki9s5Ses1haNLbqPAZl488hSUsAQgYDRCYO/O5VY+yfaPcfYirIXL+/JFV7Y11165zmrb+1
	lYi8OYtKJbkNvloqJXyiSj+5vL9CNfgqhEIS9vj1a3R4Spsxfc2S8aKqVv0KAcVhdp+9a6rySqY
	qPRvXHm7wYzBQ99DjbogvU89byGXYHs6Nsw5tyognZ2VS4u8qMFPjhIHEKbk6CMjEx6dw84pjns
	8Axu+BCEt4sstY8hNvR8CJNugHuZ5L9JALXyaqT7DAvfRM94sfKz+vzJYLf9w2/RL1n8bwdNSG/
	7+w==
X-Received: by 2002:aa7:da11:0:b0:6a3:ec9f:7e3d with SMTP id
 4fb4d7f45d1cf-6a66a611510mr1306101a12.6.1788244521855; Mon, 31 Aug 2026
 23:35:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824150156.1310-1-sreeshankar0910@gmail.com>
 <20260824150156.1310-5-sreeshankar0910@gmail.com> <apYNXZ9TJEC6rVVf@baldur>
In-Reply-To: <apYNXZ9TJEC6rVVf@baldur>
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Tue, 1 Sep 2026 12:05:14 +0530
X-Gm-Features: AcwNN1U5hmy5zAxaLt_MG_Oo1HmGFV9z4ZXwGALePDH7cPQz-NpgtyLXkjVfVO0
Message-ID: <CAA-+ukLm-6FhxytqX1=x4pZUqZU_bmB+hVF_+5K1AW=-ZpPd8w@mail.gmail.com>
Subject: Re: [PATCH v6 04/13] clk: qcom: Add Global Clock Controller (GCC)
 driver for SM7250
To: Bjorn Andersson <andersson@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	mturquette@baylibre.com, sboyd@kernel.org, rafael@kernel.org, 
	viresh.kumar@linaro.org, konradybcio@kernel.org, tglx@kernel.org, 
	ulfh@kernel.org, bmasney@redhat.com, radu@rendec.net, 
	abel.vesa@oss.qualcomm.com, lpieralisi@kernel.org, 
	taniya.das@oss.qualcomm.com, danila@mainlining.org, davidwronek@gmail.com, 
	mani@kernel.org, robimarko@gmail.com, linux@gurudas.dev, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 1 Sept 2026 at 04:56, Bjorn Andersson <andersson@kernel.org> wrote:
>
> On Mon, Aug 24, 2026 at 03:01:47PM +0000, Sreeshankar K wrote:
> > Add support for the global clock controller found on SM7250
> > based devices. This should allow most non-multimedia device
> > drivers to probe and control their clocks.
>
> "This should"?
>
> >
> > Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
> [..]
> > diff --git a/drivers/clk/qcom/gcc-sm7250.c b/drivers/clk/qcom/gcc-sm725=
0.c
> [..]
> > +     .clk_regs_configure =3D gcc_sm7250_clk_regs_configure,
>
> /home/bjorn/sandbox/kernel/workspace/drivers/clk/qcom/gcc-sm7250.c:2228:2=
4: error: incompatible function pointer types initializing 'void (*)(struct=
 device *, struct regmap *)' with an expression of type 'void (struct regma=
p *)' [-Wincompatible-function-pointer-types]
>  2228 |         .clk_regs_configure =3D gcc_sm7250_clk_regs_configure,
>       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 1 error generated.
>
> Thank you,
> Bjorn
>
> > +};

Thanks for catching this.
I will fix the error and send a v7.

Regards,
Sreeshankar K
