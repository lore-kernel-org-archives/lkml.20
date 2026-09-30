Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A4DD4F85D1
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 15:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790781021; cv=none; b=Olopo725F9sXntfGuXVfulalIVW8caeAaXnV+gzdKFVj+mT5QFw3wlBUbaaoGBQPIZ8PRVl8SPWdYCQHsiliSs08hMyCwVt7tBP0b/tRIpc7XlKHJTUu9efu8PiKlVMFXuGRjhH3fd5l0BqLgA3QqcBFXJ9+0mmQeRyLRUQQnpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790781021; c=relaxed/simple;
	bh=0OxRhuVbi3oxUlatW0tIcyIVYkE96Nbu7bqC/b0fLyE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C6uqRjk/NLoJlO5jKFSZrl3XlhE1uVDGEZQmhbIeOcyoM0Wqdh1ZT7wSXmWdigyPT3f4DOIsM28pq7sFUHv8zs7R48VKheP8o0ptJanSgdOw/4oDvtlv8AEnFM02Jy4OKIdYz3yH1JKK8CU8cfnn1f93WIN2pKxakmF0Inoun80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=he0CNuvm; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="he0CNuvm"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b8ea203e5bso4678612e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 08:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790781010; x=1791385810; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fPmto+vUBoK3BPeCZ82QESLiZxY5p21rVFK/tfyP4vM=;
        b=he0CNuvmm7mjhNkF4WGGazuow9mh5t+GmnSTZSQy5jsvCel0poBTrP51IwdlwBLnJz
         SOl/VdtAqwaENxDFiRJhFspv8fOnReUXgu1QoU3fPJpQUvQltdg9KSBwHLnw1jXWmApV
         xOcG8/PIYF7JINRm9JaI9wkkjoCI0VMKH+45R1UwoUUR76LiJBm9fC4BxYPIGyIwrZLE
         MsRxtkJjNgUG89WHmbwNtXugRbmNbzJSRU+Xf8opZxMshnembivB8FS79EJpauf4cx7c
         kLRSSR1LMpWgkQ54bUUXCf7KtLFC+X4LNwv1jPXXkjnpT1nEANYfQTKJtPM9HdCn7d3J
         f2qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790781010; x=1791385810;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fPmto+vUBoK3BPeCZ82QESLiZxY5p21rVFK/tfyP4vM=;
        b=dLZZt1s1jamFeWq9atVfZXehkPJUoj8zXD75+ZsL5WNPiK6iLx9MuPsafTLk3wba4d
         jXHlxDnyEBFX0gPJbpLeQTUzFtJxAwyXlaNrhY1Ehx4TeOAWkKpM4y9IVKhsNVDczkzJ
         LrLEHNdINR+AOTJ2HatbDV2cMxKcAUghnBfwYQq3q2IWAWALYFh+JXHDbsfVaYlpeH6e
         TCstLbDLEUGBcGyPIvq8UfVtGdisQWmvMDX8PcLjAxGeqtf+htETgCEkXtFDSn9D0CsB
         HsGwF20Xtmgz1KVP4eaKSVqozq7CNcUUfcGGIXJLNUkPYqgjKkUik2eEbAaVe5hbvdqd
         WtWA==
X-Forwarded-Encrypted: i=1; AKwUvBxPjLudlXDyIslcN5JUPFegO96KVdCRLUVYDw0c0++DwpG3qzvlu5bi1YjcfHxbqoPMYkzj08Hm2xj4ELI=@vger.kernel.org
X-Gm-Message-State: AFq9FYI9AxR7BpgCJ/4qfhf1JJj9dmLiED3KbHBB97v+Be2iPWEawHb3
	PL9TFRjKq2v3fQd2gZDfRTqqwSKkwvApDBF34zuZgYvX4ftRl6sWwZ7F
X-Gm-Gg: AYBFou3QMnsoXIdfLv7V6ficKn8iDebSKNUs8fiqcYq9iNfIIe3TcJC+Gg//oJmJ1fs
	QZ7RKrvvwIvOefVIvhsizevhzVrR1UTSswgcPKgq5yaN1mNIIOwuggUmj9JeGcmKheV/tyUeoOE
	APaVVTeTCOR9HfDXutqGInFF/1mOc3sy4/kYq6hr7oeC09x+MjSMZxtUpMFhPhtQyyEXohXBzZo
	51mp/TQWTorWzAWsUy9W1PYdECTQ7yAL+FyaKqBiO/LQxAHupSzw3aV53AIslL33pgwEhhaSKkG
	iHURxztR6i21+Rd75R2rOYefvFXKhKq0uuByBAz7orN/el5Lq39zb0vHG4jwEQJrBirL/7L0ip/
	wReM1BhEKgIn9I05W57bTUcTdU4WQGD6L6MeXD2vs+eWp3v1WmrCdg2zruLi+JPjv34DmKR36OS
	n97R+H1r0wHUedAQuz9DIIyuia9sx/sn1RKAd1EUfN42YpLDZKGaMDkHv9HYYkM68ARW/WntxXl
	6oJcH/CRhlekxgRXNTL/idXylFNUgk=
X-Received: by 2002:a05:6512:3ba3:b0:5b8:f955:29e7 with SMTP id 2adb3069b0e04-5ba402c323emr870452e87.6.1790781009538;
        Wed, 30 Sep 2026 08:10:09 -0700 (PDT)
Received: from [10.249.180.52] (m-37-0-171-147.cust.tele2.lt. [37.0.171.147])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ba42faaa70sm29075e87.27.2026.09.30.08.10.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 08:10:09 -0700 (PDT)
Message-ID: <82fded25-6338-4aa1-8bb1-a49834cca8ba@gmail.com>
Date: Wed, 30 Sep 2026 18:10:03 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH RESEND v3 0/3] arm64: dts: qcom: sm7125-samsung:
 add initial device tree for SM7125 Samsung platform
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Stefan Hansson <newbyte@postmarketos.org>,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 David Heidelberg <david@ixit.cz>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Vitalii Skorkin <nikroksm@mail.ru>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260910-sm7125-samsung-v3-0-c467bea0fb9c@gmail.com>
 <179065170983.2673486.1587443995547415765.b4-ty@b4>
Content-Language: en-US
From: Erikas Bitovtas <xerikasxx@gmail.com>
In-Reply-To: <179065170983.2673486.1587443995547415765.b4-ty@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


> 
> Applied, thanks!
> 
> [1/3] dt-bindings: arm: qcom: Document Samsung Galaxy A52/A72
>       commit: 0f14172198733b780f22d546516ccf8a7ed77733
> [2/3] firmware: qcom: tzmem: disable SHM bridge for SM7125 platform
>       commit: 6320b4c31b70a39a06de27a8019a45632beef32a
> 
> Best regards,
Hello Bjorn,

I noticed that the patch for device tree compatible documentation was
picked up, but the patch for device trees themselves was not. Is there
any issue with it I should resolve?

Respectfully,
Erikas
