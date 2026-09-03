Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F4B23B5837
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 20:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788465908; cv=pass; b=gHSmt1XCJwi+VCvu3O0g2e4TQhTPWhOj7NhspyTmoVVdBQtS/Dv1YiY71os+CdqocCTGFeJEnZAEIGF0nj3Jh9QSiIYTBr93js7tX7lu2QyWckfagNZgxVITOEJwFxFYk/7agOg7hs/IQcY2H4wsLiVxkQA2WXSnh0dJUZmPmbM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788465908; c=relaxed/simple;
	bh=jOv4AdZM/sxSh2PLGWFXcdhUFav4H7IQM0rmmuYkKh8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h9YVvXbzH4JSsHttny8SNcaYg/CJRDwsq+mTu7jkfM/+zyXbbOjnLcM4alwMOKKNrWAMtKylhvDVd2/W1REi8Sx8CZoAtl/sGPV+B/aAIx7Q+uoFmc3IgfvIRr9hw4kXF0SjBNHJXQPYLWnkMJrqn/bIaAeCKK1QkqjWJeMPcqE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eH1Vz1HF; arc=pass smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eH1Vz1HF"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cc147d86bebso282384a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 13:04:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788465887; cv=none;
        d=google.com; s=arc-20260327;
        b=mqXJSwVMsQlciY8KjyxwaEQXVzNbKticR00XJlF5sWwVjTrMUPxE7jvIkQgUFgf5xG
         AWgWVg0TSnBf0oHaojBq3jxxI1ol65jnj2yCfzAiJbR4iQiSDQLAuCAgy9qiXo1ERxMc
         rGxfPIj6pZnC8IX5gKA29v8STgHkqChZVC7zLGGki3x4k789W2OxjXWK+u09qacSmA06
         gIpDsNTaacpuDW8SyVHoMO+kuPXF5Qn4kZRzJNMOXMmgc9QR4ib3/farB3SJiz8lsABP
         YG/ja4zexnxxdg4exIWHJpXnoDZUA4m1jNUKEIs6q95sQSTNaRGJ9jZOveo9a7Bg7+0F
         ZlXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jOv4AdZM/sxSh2PLGWFXcdhUFav4H7IQM0rmmuYkKh8=;
        fh=Re4AXEmoJceo06eYOKDvfc/awPxja9NpgBksdMgTOVQ=;
        b=dOA7hyTzO/BdKji6IebEBeRLhvyzqD8WsvqULt64wD2JcOohwCvzUZ0ZlJpKPevHiZ
         BKd870DSS+WwqHikjV5coW7XXTqS8j/hnwDyz6ek1ve7f57W+f4I1XQFg+Tpfen1n8H5
         ZSiOSqa7grGmVvrTNNng2tjbnejQV0sbmp3w3HZOsH2rkqtYgCK9xUzqIQuV/FgDhMyi
         XD9BYlH4wHfFGO+IQhDozVMzrsoer1VmuH+p0WKQX055YcPCKGosPEYWx2QrNPs2Q3Wo
         QB2zoV8oHx21b06cMvNoEyR9huXxrViYy0Tdc8+q+498Qq7IEanw5EOWDpsHC1Z6wvDq
         j2dg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788465887; x=1789070687; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jOv4AdZM/sxSh2PLGWFXcdhUFav4H7IQM0rmmuYkKh8=;
        b=eH1Vz1HF1tFDsSRF+gHl4jsxzipFdAYQOcLQnYu0ZSW5epYSwc5//alxCISaGMZ82v
         wO5QTHLxtY3viUDvRJZ4UnYr9cmZ2izAy7kVvNfixs6ndRi6IMmVzzrRY9+5e/xRvhgQ
         C5e9HQkCTxj14XJAiCDLiWoIxzS/rv83EJn8cNzIreAOin6sLL/JeQNkWPIqJ6SCT2qp
         gYdZJGWZlST3zcjNmovIgFo+tpc8v0S84JYBS9LLjYW2jq8lDB1lq542MChjtYukGF7O
         r0p1JX5ff4/eMrJiWgcFhizDQLOCXum8Qxu7+Vf/ngfUmdldb7MYFFM7o/qvJA4VzmXg
         gP4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788465887; x=1789070687;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jOv4AdZM/sxSh2PLGWFXcdhUFav4H7IQM0rmmuYkKh8=;
        b=OgzxZxTu0PuahO9vUgUp4VFzqBPV+3frdhq8bGbLj+r3BL0YmO/K4UVhljYIhsFCGj
         xWk4VO3NIVFibC/mISYrejShVSLl/s+8zDQ5ZATM3hIyY5OSYP340cM9HQgc9GAt5VWA
         zYKrmuuvpImHUkJWuz8Pz0jFfnDVNki/ZIg339iDrNEvuRs3ybtS2wgCUryrS9j/tLtK
         Ic7ai+93MViWXD8idANg2yKLFRQhMLuyOrOpzWzWd3o8D43RBmZI/HpCBCH8ENyFBVeP
         b2kGd9n/W5BIJVip5ixK/HDpvBy9FWG2P1LQUxKO6WhH5qWmWnRG0wfpRshxlecQtWGK
         041Q==
X-Forwarded-Encrypted: i=1; AKwUvByQlT4F2aXPbbTJ1JNiWJsW/KRl27Kb27YU+GNE7GJoc+IqlxUOcy3/jd0a9jb/bLpy1qEj/EcIQ7G6lqA=@vger.kernel.org
X-Gm-Message-State: AFuF++nb+EtZQsAPZ3B8x6f+zIICwwyd6y6m+rtuMacLBdDfdleQ+YcL
	HIeNVMG6b9HwxVXv1oqof3gfz5pk3AuA3S7BjxJaW7rkvvE0pNiE6IZYQDY8R9vJQiRQBlnxDNP
	QR0w4dzXFB2mznici291fTM20swdCcpA=
X-Gm-Gg: AYBFou0Zg5tDTUSjGN7I2we5zHPUsbADXwYgvk3/nM1sCeEsoDkyui1E9/HQTSJzG44
	yv+NUYmdQRtsh0TX94lD6KoCAVI32s2FVv2yzMmYloSs8Tumj+JMWq5AGNZD/XCF+VkycWbZU0Y
	dl/GYbMSp1wiv3V19vdiGuQUplLuOj2XnZDHe8cPzbOn6j1jndDDqcWFDKP4x43FJMPKasObpsG
	JnAGF/ykh3mw5V2GSUx/hPvL16Ncp2RlXei0tV3ECVUAexTgT44MIICVs8wcc0BOFZY3u9XZrol
	UgmHAbPkZW0kROI16xt3JmNvvQiPgypxu/nsRKK/sL9s
X-Received: by 2002:a17:90b:4490:b0:38e:42f5:d096 with SMTP id
 98e67ed59e1d1-39b279ad968mr247148a91.0.1788465887300; Thu, 03 Sep 2026
 13:04:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260804192840.29121-1-jakubszczudlo40@gmail.com>
 <anocR1F6uCdh4e1V@ashevche-desk.local> <CA+gq5JgkegYTNKD1dPcWRp9sYXoMDfa9O4=B2azROy3QuTszpw@mail.gmail.com>
In-Reply-To: <CA+gq5JgkegYTNKD1dPcWRp9sYXoMDfa9O4=B2azROy3QuTszpw@mail.gmail.com>
From: =?UTF-8?Q?Jakub_Szczud=C5=82o?= <jakubszczudlo40@gmail.com>
Date: Thu, 3 Sep 2026 22:04:38 +0200
X-Gm-Features: AcwNN1Vm8_ZpCnd10IaLPFM9kTjtcoDvTkAZD_zAraYSV69m1vixkZprKotZWi0
Message-ID: <CA+gq5Jj=bMQBFr+DBZcA5TUPYC5omEh1T-A8MP3VpOJ7XRmf-A@mail.gmail.com>
Subject: Re: [PATCH v9 0/3] iio: adc: ti-ads1100: Add support for TI ADS1110
 to ti-ads1100 driver
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: linux-iio@vger.kernel.org, jic23@kernel.org, dlechner@baylibre.com, 
	nuno.sa@analog.com, andy@kernel.org, marcelo.schmitt@analog.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	mike.looijmans@topic.nl, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, jorge.marques@analog.com, 
	antoniu.miclaus@analog.com, mazziesaccount@gmail.com, 
	jishnu.prakash@oss.qualcomm.com, duje@dujemihanovic.xyz, wens@kernel.org, 
	sakari.ailus@linux.intel.com, linusw@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> > LGTM now,
> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> >
> > A few minor comments that Jonathan hopefully may tweak whilst applying.

Hi Jonathan,
can you check this patch version? Should I resend it with fixes?

Best regards,
Jakub Szczud=C5=82o
