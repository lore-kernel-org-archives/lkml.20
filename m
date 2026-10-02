Received: from mail-pj2-f9.google.com (mail-pj2-f9.google.com [74.125.227.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A4529346F
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 03:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.137
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790910299; cv=pass; b=E7h0y8UBXYzw8bFu2vWAOdiXTXz99IghSFm66wNxv2rI/TPyfLDGdMzIbzeutMk21eC+sJTbJ7KuLncsur1yodeoeJyDlmbEEWjb+2IeshSzWu9GB84JrOoyc0KvClJn3P4S0Rlffidk2Ic1vVmsn1cpVUnYmEnXfEnAij2Gbiw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790910299; c=relaxed/simple;
	bh=S+vkIWLkZtH1qHq8zaiVAp0v80XL5+eda+lNoFZJXU0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ukWNYSUmXphKWU+e1oAHe1tiafSxZ7DkbhN/e45mV3SMkVNtU1WAUR4hjVJvvC+Zujvj8dzv9FROT94KlxP64Is67wYDgtGjxcohTdwrDXoyzIgCs+jOPH5QebxP4LkvpJl1uobFbGB9DvwPehZo0vCtHnQcDY4K8UoKC2jb99o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fF+ugGIs; arc=pass smtp.client-ip=74.125.227.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fF+ugGIs"
Received: by mail-pj2-f9.google.com with SMTP id 98e67ed59e1d1-3a4fe110578so988526a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 20:04:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790910298; cv=none;
        d=google.com; s=arc-20260327;
        b=rdAH7GXQsfT0NjL99bxQMRInQTsWYgfwu1Ud5aOf3jPTdjLvxkG1xNmgyA8a0YA9iL
         md2FA6s2zJxhl0lpAopvMy7Liff6sPU9ID7+wO2otp+Yms82d+Qb9jHRVBAwr1smP/so
         n3fI6rgl9yoiyHZOnhVSTuLej6+R8bhm6RptNsAVJ4HuSOfpe1K5Zrkbpw03hVj7Tu8i
         4j9q6e93D/4Y42Qus2CJKm0RbNvrrE7Hepau12m9kEyZsRJjUyYpwlzNQt9JBzeICJ1A
         DrEkRZKqCE4QCrIhnnTB/ZeAWZDhKt0RJiZuIhABCIvbvtQDypFVNJZITLcgTOUEK6n/
         JDUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=S+vkIWLkZtH1qHq8zaiVAp0v80XL5+eda+lNoFZJXU0=;
        fh=/8ZpeTg8LL9GdXVpocY2w1qcgcxLCMqg1FQTurUDbl0=;
        b=IbgApOdd8XYJb+ULT/ZFwFuASCbBEWti+G3YLMN/udWR9jeprMY5kIjbAa00k4Wp8i
         6kxC0jL1tSGVffeS9jpq8xyvcCrhjFzs/E6hwuXAl7p8g0CeJ2pwSEee9OzxaIAW+mEW
         Zsp4CWergllwCunxtHWSkrBB1KoXOFEnZEAEWePe8UcXOlDh9w0sqah150uIIfS8fIvC
         bELm/zbgghdrs07lVZghqp04eFQTC+enh7Qgubndki9IQxCyZELJ2fVhCyHlWFbH1cTC
         wF4Ufk56apyZ/xV4ZAhjqPfOdL8APBZBN6H4nXh/5yJwni9H43y01c88oTNx98NlCeYT
         JU/w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790910298; x=1791515098; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S+vkIWLkZtH1qHq8zaiVAp0v80XL5+eda+lNoFZJXU0=;
        b=fF+ugGIsqVoAISGueIGHQzsEMEjDQN67RSHVC5LgLMTU561Z3eVP49udVLEnIAH4TB
         vfyLv+QIqSCuOfpY/xXe08MVU0k7G0OfHEiCuoTf0Flh2tTNCRq3lspQio2Rfzv5VET3
         gI41UAVTGtBEXH/Gg5SQo665umTEx8ZRyVx0NvwCMpUxcnQ8ItW3qgZvJnVYG7SY5xHy
         LcMWTUTpRERNXylD8qxRSQxAO2YZ5vcfxko2m9DgmcS7cGR5nE2CHMF4CJfl/tka61cE
         ONXx0RY3/qaVPe4n+Y4JFTjA9OlnW4r/0r1qZTV3CyPXN9s6LNdvrnWYdqDlejFIWsl8
         IchA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790910298; x=1791515098;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=S+vkIWLkZtH1qHq8zaiVAp0v80XL5+eda+lNoFZJXU0=;
        b=wixjaMb1qOTPJh1NbRMIS8DxT9eZp+rMV1UQ47TpW7fnUY8VcyV7en2pCrWwjLyCsx
         LNnmgBTKmrYOtsQFoM/S+POJ8NYPZBRaDtoBHgTLHu9nYpjd5VEnLqe1j4punPz5a7V+
         veBoFLW4Tso7OgCqOBiGiK89vee8D/lvQ/3iX5c5JsPcGT/HSAyoNAnYXRKzZd3HLkip
         OfFPSxdChxS7M1F0QRglxEq/hDIOa2ueqsqScUG85f6NNvC+hbc9nVTzv1DqVpcPmBwD
         LDDC3rBFkwdJqbZMNDYXesEZoh7lLj2/Cnyx9JmWRRUQ3FiKGUoQbOSSuZDuoznbzFd/
         IgxQ==
X-Forwarded-Encrypted: i=1; AKwUvBzS23MIaRJhGa9qZyZFRE2TfnGo2Bq/2MIAPqWbzbPACg15nkdQgJ0f//HpN41vJUEPxnBP4wgQCU+Ki74=@vger.kernel.org
X-Gm-Message-State: AFq9FYKko8NvYMHpyni01+JQwkuwuUclObJybIOqB1JembCSfI2scByj
	/KN23ICIlHSqSq35Y5Qo21vzMQrjAwD+wcTxxEuvRCEJyyQgs8WGHdNSXg+0ca4QYllpN6l5CGI
	m4BcTf+p9QwYShRfvGz6UURt7OcGhGv4=
X-Gm-Gg: AYBFou3rWI5kbYur7lVi+mJi2eLHZcVk8OSkwdlBWY/LX8PW/nnqyjbcz1JEaF8RErC
	/CpjsnP2h14xnC0L+RwYcDv2Fkp2Iqg1IYMdve8S3TzUvvLctzobZ+p7kybuy1eJGVHi6Kdp7YO
	/Y3CJQstktAjVXQI4soYWp6LXU67qwAVSd9HMYC40+GaNjy8IjQrg8PZ52ciQcEski/XYTZiDky
	higj8Ej3Wh/qsRLg+znAFG6660EWEFWxWA5lw4SqvQwlO4qISZOpLf4rApdkWaDXNXpIS0PsSgb
	eLmy02jZ5t/fXaxPdcwhCR1JjhhHi+vS3is5KJwtQYfByyeGu8rn9xdP
X-Received: by 2002:a17:90a:4ca7:b0:3a6:ddca:112b with SMTP id
 98e67ed59e1d1-3a6ddca11b8mr489962a91.21.1790910297480; Thu, 01 Oct 2026
 20:04:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929075106.74731-1-suwangquanta@gmail.com>
 <20260929075106.74731-2-suwangquanta@gmail.com> <20260930-curious-narwhal-of-calibration-62442d@quoll>
In-Reply-To: <20260930-curious-narwhal-of-calibration-62442d@quoll>
From: Su Wang <suwangquanta@gmail.com>
Date: Fri, 2 Oct 2026 11:04:46 +0800
X-Gm-Features: AclHuK-KfgGwZ7bu_T0onXf5TVB_lsME61cxwHa_OQd7XBi3kxomvlalflHsano
Message-ID: <CANoBHH2a_Qu=eMoQ9GFYYn-MVg7zhVZJbiBRP6L+roU2zp3d7g@mail.gmail.com>
Subject: Re: [PATCH v14 1/2] dt-bindings: arm: aspeed: add Meta Ventura board
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au, 
	andrew@codeconstruct.com.au, ryan_chen@aspeedtech.com, 
	billy_tsai@aspeedtech.com, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, patrick@stwcx.xyz, Steward.Shih@quantatw.com, 
	Martin.Peng@quantatw.com, Fred.Zhang@quantatw.com, p.k.lee@quantatw.com, 
	"Sue.Wang" <Sue.Wang@quantatw.com>
Content-Type: text/plain; charset="UTF-8"

>
> On Tue, Sep 29, 2026 at 03:51:05PM +0800, Sue Wang wrote:
> > Document the new compatibles used on Meta Ventura.
> >
> > Signed-off-by: Sue Wang <suwangquanta@gmail.com>
>
> Please respect our time. Actually other contributors time as well.
>
> <form letter>
> This is a friendly reminder during the review process.
>
> It looks like you received a tag and forgot to add it.
>
> If you do not know the process, here is a short explanation:
> Please add Acked-by/Reviewed-by/Tested-by tags when posting new
> versions of patchset, under or above your Signed-off-by tag, unless
> patch changed significantly (e.g. new properties added to the DT
> bindings). Tag is "received", when provided in a message replied to you
> on the mailing list. Tools like b4 can help here. However, there's no
> need to repost patches *only* to add the tags. The upstream maintainer
> will do that for tags received on the version they apply.
>
> Please read:
> https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577
>
> If a tag was not added on purpose, please state in the patch changelog
> or cover letter why and what changed.
> </form letter>
>
> Best regards,
> Krzysztof
>

Thanks for the reminder, I'll add the Acked-by tag back in the next version.

Best regards,
Su Wang
