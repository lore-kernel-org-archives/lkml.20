Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794197297;
	b=D6Iq3E02z+yoS3L5+80fJpr7E/lVqv2zS8OD5ZE7krJtOUJR90gcxi9VEvOKqPAjxfBR
	 JBbmobQE4gbc2/IzsOZJa7fVwbsMAOQvXpWZv0unTJNjhaH8GwFDFvkqpaTQ62I2pXlXs
	 8efKXAGdmHYj2I7Xr0h+lg0QOPgRsmy6xbDeAsYamtr42n3ksoggypoW3oRsgjERUn5g1
	 W7y/TEL937DxVxsvvcpJySUC/n3xPDCmy1KngZzQOozO/pxBktLmPiCT9GovTAJPJiYQy
	 fls00G5kp5W01c/aWgsFYWO2fkw8qy7Jpvy2RuBDSbIz2rXkWW70T/QxZp1wQB9b2mA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794197297;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=0IEY2oUkY/Exy20gttekfGAPLEe1995noJ1eoGIVUGo=;
	b=BvcGGknMiraieJqu4pMnnt3D/dmpWzYvxpyGyqXnoO+MehgrziJUe28o7bMACP8OSgPt
	 B+Zdj8s2Dzk7W2OPkVog0LpkDUE+BxLC2MagEkBy0s+slcbYBA4iNPklRHNeVUuSH1XEV
	 opGID8wnEmCKq7SAAvPSsPknHtsv0Y5Aq+k5lemwVaYPv1cbsod8zHUDg5Udtmwu19Cf2
	 qNQ6bjnl+qjQ/g5awvjUKfV9R7Ox+gii/nRKIhKJ+b2Ay8s6X6zO+ecJ8ju4ldm/ysyXJ
	 oHgfyHEICwvpAanFER+WTC3c6qeH79d94XwWdFIS7R2DRA25UD4UmVI8y/j+g+PW/Mg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="GgVf/4/n";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F11606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 04:08:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73F11606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GgVf/4/n
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e985106c0cso3170305ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 20:08:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794197297; cv=none;
        d=google.com; s=arc-20260327;
        b=nYgTMCfgzwZGtF947SN7jy8tySzSMwbxbzQZbdovY649fNOlFMCfU1CvboE6COWtJH
         79UEVBFDwx0ooQN7yeCpwx65hYvh8ESxxOYnWk+HQeGokbDqRR0cJmvtE4oUMC5rz31f
         9WZcokR4uLFKFEB/5RuKkEaW63uqiOtl5tMk/1V+LHMaxupUQGc0iALm2pM2Q63t5aIW
         MPTcuVjn0Blcju6Qiu85vX93ReSBnYtLCDbx+l6W8+r2b4TDO4ofAebDCV146IWqfCyx
         1DByWZl39otLY8I4VHHeWQI9vDdJDILVYHtT+fIBXUxBAVFpBTy2tpP0Ms5UIJz7ijZy
         ZVrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0IEY2oUkY/Exy20gttekfGAPLEe1995noJ1eoGIVUGo=;
        fh=TS+qmkD0PNoSpDSBR2F+ckJv5mGAgXqpXwQpbHwyMNE=;
        b=lXh93wqOXU5o92iy0HMRuwyc/LIGjhKCRSyzWHmZrf1evKXZYKEJ2qIX+TKHrR/nJK
         sEMcqOfedvBoepjXFUdLbl3+bucVmn8Lw54LwzwmipxD5GVxq7Acc34bBYK/VUOT8DaH
         EelnwKhGVYvu4sP9t2XioS8XdgnytHKVGfLn9ZnE59klzSNctsOw6SBi0wW4S016It3g
         Nk3hMKgseJDfeaoGJUT09dsNRQUYoe0T3WCG8vOsgggHpxdVWiwXn3BpY+Hn8HBp1ZB+
         PoTCsv2Ki8Yi0eDp02RMUROkPUJ13mMG8ZgiE2u99QyV0Q56PMvILTkh596hO9ty3qqk
         33lQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794197297; x=1794802097; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0IEY2oUkY/Exy20gttekfGAPLEe1995noJ1eoGIVUGo=;
        b=GgVf/4/nZUEYCjXLUahSJmuRKKDNEuo19fTKCK2nP1iK9CnBNQFR0oKzd1ryRPzz8v
         xbDK147jH6g3ALj6v8D1BZnXQE26G9j7pPwgfGEQsdMymlTKMcaawg5Zyxv3FhOFrD3z
         Ma6LTQiSeZUc2AUiA1J3U4Ik7AveDl2gMgEjD7xOSfEQEdfNmgls3TPVqIp7aw/QF/uV
         ytKin5PqawfI+bXljt2cG1TapEbPlMxq9ejx8NhX0Ss+Qlk7reBij5FZi+SH1HWU9ouN
         Jw61ZeCQPPIBWX22iu94I8Ug3f1jFqTlwfvJjCme5O2gf54fwqPb5m0DUJ3qCLNVjcrM
         MdYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794197297; x=1794802097;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0IEY2oUkY/Exy20gttekfGAPLEe1995noJ1eoGIVUGo=;
        b=OaQ21sPAECDtHubKrJ0hIfhSzPE7z3R2nW3O3VEJNkJHm7MrwzMCUasJtRSrK4+RsW
         UEJYtS/exiU8+UNau3avlm20XBBQ3U+WGzjCTI2juijOT6mKASd12r1jUJixz+sjYhON
         +UZwB7zCITMFPB/1t+yl9KzM4Kz2RVffiutENVDAJTCWyLuFBUnLVO0h82GIIJ36Sjsg
         RDmhcO1o1A0kYf7jYR9M+bjfv5DDwxgirmGpGC06LKXllhtb4leNpdVVqtnZslLaWKlY
         kEn34W4u0dsS9Iec+Lb7yLaJymUvLJykdimMf3LDpYJx3mFyiIr3GtWGECJXuyp5c3Kw
         AgwQ==
X-Forwarded-Encrypted: i=1; AL+hErFPa998I1KcbBaUsxiZNvdwCOPOE+OPCrMvj9jtpWgJw3qJWbpSK9QIdfNkDf3e25LDwnDrKy4Be9D02Kc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8qIHqLbwcMeDOzbQHh+sv80vhooMY8SnfsE7y2fv6qYpFwIjzs
	luLfKnNVxZa9713t4osZr2Xp63H0QkMxPohHw3WEHqf9AuglnIptM867RWuaoJKi+U4WFvKwMQ2
	J9Qn6NMkQbMX4z98gGn7QVhAvPNTW8aE=
X-Gm-Gg: AYBFou0Kck/YT5VBpRwgMaEVElAZfIYqeQIIEkRmxxcGt9IGHpPnpwBvJtYj/eVJH19
	Glkb+5daFOOQrLgZJDvrIYDFZ5JXbbRAhe6Kc3YWwuEX1fzoJ6jnC+xnhGo3l3RKU6Nquuvemsk
	WTz+o2lePrZ7nmzikhjSt+OR5LPn2/a7Zn1pHcwJssXGl5xh9pVzR3XhDQMt5HRwKdAwp9OS4JS
	WskQdqXqqDshmwRbEY0PUi6LQbnvsBhjqhAe84EB+iMQ4488vzpxSnO5s08/y3WHagv8qV5WMWK
	kf1mPIkOC//U9xAw7cW+rg37JSteP0yH6LRg8Am6fj19Etcx6WW+EVQvedlyY9EFfR+tkOruv+/
	805wsU8I++J2uZZHC1wLTVp8VQK3tsVwZQEXBxw1Zdfhoh2+pPp/Pbq/JPM312NBxrHbSJJkM/x
	NXPcLDlsBFRyC/RNIYwc5I1Mk0m+D19qXaeZkzqlYgNMVtPTOS7gL2T1q4X8qOB8MFiCs6lA==
X-Received: by 2002:a17:903:2a86:b0:2dd:ad73:c938 with SMTP id
 d9443c01a7336-2ed8377272bmr30112565ad.25.1794197296668; Sun, 08 Nov 2026
 20:08:16 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105104237.38542-1-phucduc.bui@gmail.com> <20261105104237.38542-4-phucduc.bui@gmail.com>
 <179397468197.3073895.1522608204443678480.b4-review@b4>
In-Reply-To: <179397468197.3073895.1522608204443678480.b4-review@b4>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 9 Nov 2026 11:08:05 +0700
X-Gm-Features: AclHuK-zMhWEuwFpd7MBkxqEDP76pBnSJIU10D20h7lMcoXH_TQWFgwLNT2WA4M
Message-ID: <CAABR9nE52Rk81oyoM3L5hHRn3n9OCP3PWSxA8nNt+aEPoeRtqA@mail.gmail.com>
Subject: Re: [PATCH v2 03/10] ASoC: fsl_sai: Remove redundant error messages
To: Mark Brown <broonie@kernel.org>
Cc: Shengjiu Wang <shengjiu.wang@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>, 
	Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
	Nicolin Chen <nicoleotsuka@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linuxppc-dev@lists.ozlabs.org, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Mark,

Thank you for your review.

> >
> > -     ret = fsl_sai_reset_hw(dev);
> > -     if (ret < 0)
> > -             dev_warn(dev, "Failed to reset hardware: %d\n", ret);
> > +     fsl_sai_reset_hw(dev);
>
> This is the only caller of fsl_sai_reset_hw(), it could just return void
> now.
>

You're right.
I'll change fsl_sai_reset_hw() to return void.
Since this series has already been applied,
I'll send this as a separate patch.


> >       ret = devm_request_irq(dev, irq, fsl_sai_isr, IRQF_SHARED,
> >                              np->name, sai);
> > -     if (ret) {
> > -             dev_err(dev, "failed to claim irq %u\n", irq);
> > +     if (ret)
> >               goto err_pm_get_sync;
> > -     }
>
> This will only print an error for a subset of errors, things like -EBUSY
> will now silently fail.
>

From what I can see in the code, devm_request_irq() ->
devm_request_threaded_irq() reports every failure via dev_err_probe()
in devm_request_result(), so -EBUSY should be printed too.

Could you please point me to the path that fails silently?
I may have missed it.

Or did you mean fsl_sai_read_dlcfg()? It does have some silent
-EINVAL returns.
I'll restore that dev_err() together with the fsl_sai_reset_hw()
change I mentioned earlier.

Best regards,
Phuc
