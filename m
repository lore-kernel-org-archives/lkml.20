Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794780858;
	b=jQ+HsfoWrw3m5vKaxvT6bc1LQQKTr+QLZZdgiYl1JYmMEJIjWnqk9FSIT33PJQgRz0E5
	 mAuopoERlz68D4uJakW9xa8WxDFwng9O7887f0MmYD8MuBQdwsyq56EyvZw6pZU9Uxs34
	 9xmJuDMkSH3eXeDk5pt2Dy0Ldo4//WxARGIAOKxyTMh6fzonkT1h9sm1NSyKA6vRRnnkB
	 CtySRhjq46yrURigh/+1Mgxp3pJ+CPPLAtCpJUMVMRFWQLj1AW8+uB9qUq4pXV/lqBJsr
	 RRSCJkNNPr8y1laggjsNAdBxoECGy3Yy3P56DIPP9txi6PwOh8+usNhFwmTFh/w1yuA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794780858;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=V+qix4MwBv7O5yjEyViR1F6mCZNMRdVo4wwBMAHfu4A=;
	b=AGuKaofZLNeku3rFvmb+n8Kc1N0kacXHJCRl7sz783M5wd0pWE0nFuepghhL4EBXBiUQ
	 BqfHvDEqPqMUJcSoCHAu8ZG6OfkOFXT+TgUylZNibyU49K8Yy5QxlkfW32sb5+3PIkqui
	 HepMCfT10eEucfNtLyg/zYKtAi03zYD+QP26GTM6hYsKikdwVzwFFxsyTJXmlz3Ap+QEY
	 T4XEztYAh+hr6DxIatC/v66BnYihGGL+Qa8dKPk7K9XlBYB5z64xgUDc9Tnlm8/0+ga0z
	 VDI6wZu2a7krbliS0+/IADtsqdHQgJ87qfh+A4Vq3lv+YDDT5BkB+Eoee3DY4AvYT8w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=vsbtJ9cl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.43
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18AB3606A323
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 22:14:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18AB3606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=vsbtJ9cl
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-67da62357acso935013d50.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 14:14:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794780857; cv=none;
        d=google.com; s=arc-20260327;
        b=gzhm7AwNJOxXkuZzj/pijSKAB97IinEA423NYUaiDXpEePeEHeotaYgrHqGNmc8tSL
         URtyLF1raLBj3gO8JdAOwQoduJD1fcPP+4mvatUnEL8h4/F5lH3YP5Ls1Keys/Z1KqiO
         dFOxl/+/rCw1LRpve/+yMlYe1sWDFDQJgDyLZ6NEkhEKnAE2zgSD0HIBRsqnW1ggIRWo
         wKys7EhRpflu7VlSfASuPOSnIFEHBcMRbHMc+WojbP+t4I4gUbg5MMa5GeuNHaLP1ZXP
         TScP7ZXVr+ZzsUZ8vrW3XGQQweCXwmwl2t+wjly8Cgjy60nyQ/RmNYtBDT9HfKiBw/MU
         vWyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=V+qix4MwBv7O5yjEyViR1F6mCZNMRdVo4wwBMAHfu4A=;
        fh=bEOSawZwhJp7jhJSBl6PzHBU146laYP55N/rVxMJ8RE=;
        b=YwNf3NtKrhJokxDxJL117FqUyfw8S5WccAVMoq8O9a9RfiMIK6NxvQiqwJp7l65vfp
         P0RyzOtcCUfeBXxG1ZhwgHMKJXS01Fj65obujNNABpduj6XW2ExZ/N7FbyTjZNeHdixe
         pnmJXW2YrkYdVIWt7X1Wj1gVqG0IcIMZtP8UaPVvXrB5HEcnLzvEn7EWjH04jClUjH6U
         fGiSsxOF7DReDEZRv2DjZyy93Gc/y3SzT84eTvJfSTAOBBYMVFQN10Sdxt3ooDrQL27h
         Kg4q0TtebaeL33wfAU4pmgS/PBZyHBZ7WgPRNw4KnxtygsVZdrvUkvvWtjvQ7KgOIVaO
         juIQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794780857; x=1795385657; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V+qix4MwBv7O5yjEyViR1F6mCZNMRdVo4wwBMAHfu4A=;
        b=vsbtJ9clm8nCYaPATTnPA3JLfKioT9Md4IUGq4/CVtMGeDoUnnPaeuEG/NV8i6/mLZ
         DKSBJm8dsAVm9R/leRKzUT7O9bJuh9idzY22HZ/pOYHy2i1muBTO4iCjEm/Jvx2A6faB
         jcxy2OXG4oiUgjnqVdwexSm7ffqu2N86/AnBaAL5rDwIBdj3cScB6bcmUbaP+8ZmvsJY
         Av1T5mCRRwOQD+nwKYfpG0ZeK/GQ+EPAUmhi47sogyxVxMHkXqhiADPp2dqrxEib3bkv
         PNF/WsDvOfA7DehaQYRAlOIWb9XViqp5JDVlwbr8ae/MvmuaXKFaqqfKVUPXDU/sjFec
         JttA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794780857; x=1795385657;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V+qix4MwBv7O5yjEyViR1F6mCZNMRdVo4wwBMAHfu4A=;
        b=awS/OvjEdcZC2C8eYY09pY2WwhvDTNFHSUwDv4hXjy/nZomHKGJFLa26MtXut4mV/e
         ParwUbwkMnCLIMigNqkufJ3Sw2gmhFM/jM9oYeW2p8/VzOuuAkqvPxX8XnyZ45Kor9Yr
         /jm4DkXFknoi33cXQY3+wAkrJ7GyYAX8V2J2+3rcA7cHVPBxAPKdYsu62XxbZ7GyihPq
         05tNK6SNXSW4s3ghhHRnH8GTViR05gNTjUI759x0kajfADiX1umce9w9jiHWtMiUMceS
         JUP+CsNmwM+wmly30yCtee6ca3mLdzrC8zabAwDOMclW1WycjPq18eTSeF2u3AVipSHu
         +E4w==
X-Forwarded-Encrypted: i=1; AL+hErHXQ1rkUFWuC1jy5uMi6eXhmYgaqzOCoDVLGbx0pFeJjsc3T8GrylcdpLnxKI3CfBd7tMDOku9bAnnM2xI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9xVs1fb+ee7neyA7W4ovZU89YvAcrFbGmPsRmjEigECy41qwsP
	2pDmF47Wsaj3wB1N80Fjv0G5i0eZ18STTB6GXLFkqFInKc/KCZJWT9KhWAkEoSkLAfArN79tKzT
	bC+WgjWUe1CepdeZzc9nD3o0TrNVrDHU=
X-Gm-Gg: AZFdTZc2msoTsJMZLnPoGtOCDBJa6gjy3kXW5SS8WKYvc6GIP/ROuaFJt057rN/IfCa
	gk47RhJmjtwKuby6thUZZaG33xYFph9h6fRh71/dLvbZRo+LpqAjJeumasCaqUxYTwYAnKfZunO
	JiIafW36AC+50MUsubaGihUzAU84wLGJ5bN469VwjL/lrzutTuPLHD0yGvnT0CHUq1d0VBr7kTN
	BQb40S1nVXrFY4rWy+O3WjIRgTEBc+vDY5m5B+WAkVoZizaAEJ5N8wWHcSonYYgANwu1Z3AkzBz
	0bizxvZNAZ4U844K6paWLhCMa2mzg7POwPouwhwwsz8a7FkRlQ2S024js0u1wMfvfNiqLGdv3YR
	94WErZqB2TW1fDyACFzwmAuhIJYPtzHUmXVcIU4aFBArj/BACd6vju6r8lJbXyTeB2gD95A==
X-Received: by 2002:a05:690e:4383:b0:679:f97f:fdf6 with SMTP id
 956f58d0204a3-67d896a8f2bmr3982114d50.66.1794780857112; Sun, 15 Nov 2026
 14:14:17 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261001-add-t7-sys-pwm-clk-v4-0-8ed2b1e0cdfe@aliel.fr> <20261001-add-t7-sys-pwm-clk-v4-2-8ed2b1e0cdfe@aliel.fr>
In-Reply-To: <20261001-add-t7-sys-pwm-clk-v4-2-8ed2b1e0cdfe@aliel.fr>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 15 Nov 2026 23:14:06 +0100
X-Gm-Features: AclHuK8Jibqkumh92MwUwV6k9LdMNZ5aOXfzAlbMwGyKMualpiO_cItbFylPmew
Message-ID: <CAFBinCB_Eam76VJWSWSyLRsnzXOTWohrE1NdqyJ8GhPFjWzfHQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] pwm: meson: Add optional bus clock for S4 PWM
To: linux-kernel-dev@aliel.fr
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 1, 2026 at 6:56=E2=80=AFPM Ronald Claveau via B4 Relay
<devnull+linux-kernel-dev.aliel.fr@kernel.org> wrote:
>
> From: Ronald Claveau <linux-kernel-dev@aliel.fr>
>
> On some SoCs (e.g. T7), the PWM controller has a system clock that must
> be enabled to access its registers, in addition to the per-channel
> input clocks.
>
> Get and enable it with devm_clk_get_optional_enabled() using the
> "bus" name. The clock is optional, so existing SoCs and device trees
> that do not provide it keep working unchanged.
>
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
