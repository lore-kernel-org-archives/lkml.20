Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2ABF371897
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 14:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789569248; cv=pass; b=Q+bJaLxjh/gbqftgnF8kMyVjRQjR78mCDt94aVKjT423ZuY573prHsOn+VjHlCnisa53YOUfPDTDNzX5jwdDt162x0v/LBVtlIp5pA11aY8Bf2IdlaCm68X5htH2cp6wkACGIZQxwfmDEMOzlIbO2GFzMQnZxM8+Evd3Hq6fpng=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789569248; c=relaxed/simple;
	bh=OwB/d5OxQu18uidgzkX2hP3f7HqNP/l7GdXuCXOPh30=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W9ut8+3ziOpDyNhyU8Q0AX1ETLFDwnJWGYhnZC6Wmq5hvwYfMz5H9J2JAbxJI2mVO42tR5tPuSw0iLDkTecdIo9xlOzPSG5fykWAASIWf42jP3IHP8uM8tmDagin7TueghOKRBv66ssTIN8GzVVRAoPdjWNOZyg0CL+xnMugbho=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=Oll1lZy4; arc=pass smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="Oll1lZy4"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-91071ba92a8so5538326d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 07:34:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789569245; cv=none;
        d=google.com; s=arc-20260327;
        b=T7DXdfa9D02xGQmf09c0n7+J6GIpoubsLgRhTpHx2I1dV3uUoE3AFWPA7+oV04tnKF
         vvuotlThmd2l/L93PujdD+QtMaBe6NiVbwQ7OcpsQYqzwBqVXUhj9YfNb9bhH3dAAqOE
         acd97t27opf7LYzajMnoR+9EdZ/bokrZtqvXu/+Vl5XqRAO8x5fcZbW5i1Py0G0UfqpT
         O8K639GlgLUaF/6keYGgCEuET82h0l2hiSMbqJ0pmy3lLX7dLTWoviJtIHBG5Qd9z4Hm
         Tt+f4eaSUBlh3zGsasFBffFmNS3m5ESPUKund0GI53NzYx2qU/b1Ql8coQVPknPKcq+R
         8BQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=OwB/d5OxQu18uidgzkX2hP3f7HqNP/l7GdXuCXOPh30=;
        fh=4J7HItI9Tq5m4ZpibWElhpbZ83DIS9AJ2f5ScbhWMRg=;
        b=q+QAHv+JvNOJ9sxJJmNFusqvfvpqOlhNOMG6qS7NYs8IW2ZjpObLSOkc4byDwl5//M
         QLSS6fchcvC3CrdCysVtUw4yea4qekk4Wdg33DBwdJIF5lzz3/Fjzl4FQM9OogoiDbcm
         XLB6c4imfirLeWF4jFlFSmdwUM+C3l6t+skFyfb9AqzUH3nYoy/tGWfSiO3yYNNAHOff
         hEHdYq1K5fDqiGAWhfN9+Z0j3uw3KSfQ3fxa+I/U6DpM01s0YPMahE4jBF0N+rT45pp6
         dRaYLqN2mLCgfNCA48iFeT9RRc3wkehQ/rXE+ln4346RRarXFMgWmiKw9SuBz4VGHjDc
         cQTg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1789569245; x=1790174045; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OwB/d5OxQu18uidgzkX2hP3f7HqNP/l7GdXuCXOPh30=;
        b=Oll1lZy4gw6gjhCnHbEPsz8oAxrITzPHBEO+pTrlwesZHv77BjN8RHNzXwB6febAod
         0f/RTNZqryn5AhmR2Ea1DgkOit8YqEzJ1rT2gyYss708XuT6j33phXVMgXUKxMuXiqpl
         1reUpKK/mzHXX7sGAi4Y7to89yQ/Dy72ig7k19sSWYSBv1mDh6MZInu6xVPCLUOn5On0
         lrq2BwW2t2aLQJQEqPRNKUtn6r/8ostWb/EFTkXCBmvL0EA3+lRDIFnZ0fEtrSiV0Bjb
         ujCpbkkdj8TX0Ip2qEjlUx8Syx2mVxVNH+2LuOaiCymCk0dIfprnVortIQGf0HiSQVLT
         4kQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789569245; x=1790174045;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OwB/d5OxQu18uidgzkX2hP3f7HqNP/l7GdXuCXOPh30=;
        b=roWOs8oTofWfrjg3LfQH43DNaZwomeNoD9S/9RTz0eh+hVWZIFcVv25X2lRTDZnzwe
         h9weENH1HbWCr3+DzKmuPOy2hXHs5j0BR+qLCZKoG3ylhvZ42uhAsuCQNrjrz9fOcV2C
         LjsjcWBBdDWq3BllrwX5xog0J3wGdnV4d/23qKucxvDJT7P+iLRw/6/luRfLaCOiX/6C
         sV6YsTSNZmE6TxAB85Kd8nmSYXfpf4kZegg+2zELECZlitw68jFRgW/GicWBjFfhyj04
         5JVxHc49GCu2dwH8UXsqwsVPXWX1p23b+lp2njqLftIakPrX2nneEDwZDUYmNvrftKwa
         m3bQ==
X-Forwarded-Encrypted: i=1; AKwUvBzDf+tBAuAxJ62YPWDFXwShD28tgKhPjmVwWnbqtHDWNP77O2/lWT45wgNxf1QY/PqhlRS1UQPX9hpcawA=@vger.kernel.org
X-Gm-Message-State: AFuF++khrcHQO8laIbY0xrgOv9MN3RdepSeproKKDIjnEI17MafHAxhj
	ISil/RZ8l16WmM2Ggjy7v+vgRI8dDnCXI5XHwDKzO9ogYgiR4KMuBs2Bx+DQD8GKZjCmtayuExz
	kv5u9vdXWWShUyWXcRW0HZlgaJ1cJGRWnjuyl5EWfGQ==
X-Gm-Gg: AYBFou1i3nHdXgH/KWwC9dOthmjAauYC/6r9j4axFnJOHZ4Mquo0VjVgKySPg03vZxp
	L/uqt6Z2oIrOMCtMcq3T5R3wVWsyGY/BHQVm3bW4aNGFoiSm/cFEWLdbopsrceK/taRx6wJ4UVd
	rS2EYJeEuRP65pdtJqgBbVX9IV0bdAmVeGVBMNPar90NBF0j22ZR/MxQ+UxMUaFBYLJJLVDQ0Kg
	eIGzR6c2RbroJDTycReOa8OdvPtux8tpGjlRiq506BVgw0RajbGc7QiCKGQRwaI9rCjrCn4F6lC
	fqeFrco7IDXesQZ/t0zQ4oNyRuGdaRemlcDmN8NR2voo2clrSCrHj/5rVWFrXXgd+yOV3jL6+zn
	DV8Eipvpg9zXf
X-Received: by 2002:a05:6214:2307:b0:90e:9dea:82f0 with SMTP id
 6a1803df08f44-9123d72e492mr50551696d6.15.1789569245319; Wed, 16 Sep 2026
 07:34:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915-acpi-hwmon-v2-1-39d17c748eb6@thegoodpenguin.co.uk> <70746c77-e113-4bc6-93b6-7ac6027c86a4@roeck-us.net>
In-Reply-To: <70746c77-e113-4bc6-93b6-7ac6027c86a4@roeck-us.net>
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Wed, 16 Sep 2026 15:33:54 +0100
X-Gm-Features: AcwNN1XL40ERZH8e0Yhs7auCFY005nLn5S0ImA1LSDoKwV3HLcPsYK0Xe6yniGo
Message-ID: <CAA6zWZ+8KUSzah7y4TXrkvOnChDyEur=HCXgukcFke2dEjgQ2g@mail.gmail.com>
Subject: Re: [PATCH v2] hwmon: use named initializers for acpi_device_id
To: Guenter Roeck <linux@roeck-us.net>
Cc: Luca Tettamanti <kronos.it@gmail.com>, Cosmo Chou <cosmo.chou@quantatw.com>, 
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> It also replaces pointers to empty strings with NULL pointers,
> which is a functional change and still neither documented nor explained.

Please note that the 'id' here is an __u8[] array, not a const char *
and that the generated .o objects are equal pre/post the patch as both
methods just initialize the array to 0s. So I think the commit message
explains what the patch is doing, perhaps it might be worth mentioning
that the 'id' field is a byte array in the message.
