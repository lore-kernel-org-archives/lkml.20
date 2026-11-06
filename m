Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793939198;
	b=1+VGGHGfhNNwOW6Ih+8JyG4p4gu7aHb0hTV56VaT/JzVGVD79Qb+DOia3aqHp+vDfqwt
	 ym6bBuKYJoDdZOL7IEjbF/mm/l2voUj9lEu3XozCIVY2wKx/RQdS4+kQVo7Ns0mlpiFNL
	 zOLZxGwkfGwnETTPT7jVgpcK5zpmurCh3512AmeexaMMbrLJuZ5LEFYVZfSbRz41QCc0a
	 +ZVK1sGw8NxfkaBn7e7oZpvO0B8J28I8bLI/F2fdvg4R7va/gBtLMrbjwdHnFwmm/PIeu
	 1bRwr3eE7riIqAgjD927ckkJQiAKtFcAO1cXQDZr6FbcS62j0tSET/hyA51bqp17tbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793939198;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=yqqoCCSV25YDMJFTaDlaW1nqQ2lWTghScufGi6Vr9TA=;
	b=BSE1viYyfSGeejPW/t2AOi985aKewvZPR2MoAaQM3eSHVdprNzOcMtYHus3zOf/Rc49o
	 5FDAJGVVjJJ0KtH2meQKPbqTy4B00XslbPhdgnh4+2S5lVMpWNXMnXJw6V5wc9vF2HQB6
	 uy9yP4V8BkSuXp9N69eIVhsM+1PacJJ5aTPrarCVVqkuQB4Ul9doFsYwtH7STN7PPiYgm
	 SW/ekzX6qTcYRMEmWtJi4atzqsaWkNNPnhhCAPWllzpJPP+wG7lttdCesDzrltHrqnAoR
	 ZEVWWJgarWHxYCr2UxYtAs9O47RsAH1DtLjJDYwV0KPYFlNCZjXElOJHKkhEjEBZtPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="dIX/lxqM";
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9EB606A31B
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 04:26:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C9EB606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dIX/lxqM
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so2740935e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 20:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793939197; x=1794543997; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yqqoCCSV25YDMJFTaDlaW1nqQ2lWTghScufGi6Vr9TA=;
        b=dIX/lxqMFqafQAodHyvzieA/aDNfNUoG8RQU6mATOkni9/Z9yISN2BpIi/jczUhABX
         bY/LhYxY6MQYscOa8o1cKmuZ5UH66NaM+Qb10eFcEevapXb0bWF0G1mfd2LJVkHsP/Eu
         MjnixiGNmF4x9oBwzQRrqGYQPikCFlWgHG/tl/1aBcdJbc5ZGFKrTtwILbdHzZpS3RV+
         CieD7XVioDnw3VQlAiiZZcFYjeJeIN8jHGov2P8B6ivuQ27yp4PTLG910B78Khyvm2BC
         A7e3ZGJH0vgZAL94CL3tDBAOB5rQrL9ybCFYrkQp32zuxgg9Eo0+OO1bHulS/8b9M2wl
         kx0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793939197; x=1794543997;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yqqoCCSV25YDMJFTaDlaW1nqQ2lWTghScufGi6Vr9TA=;
        b=NodyHySP0a/cWOa96ZHo/VqcFGA32goOlnDuGiEFPp5vYSbd3UZ99VuC8zRLgZd7Do
         amWZztaseBLbtN+wVku62F4ZAhZxMPCyQOdrz37mDJdtya6xP8/TOuhXJfHQZeyROoht
         fTkWz+kG3d3V3PSpsme9gGgKTILr/LIVQPFAS/qxW1dE+iwmuAqRdr2OwJIsKc8oeIgf
         1GbPYX6wBq3AScrSj5H8idTuszcgbbFmWQlSgd7lysmG9w7XXNeiZktpxb+Qr5aS23gX
         LnVNcN5pwfYOPqzma0w69ug2lQXx6zwIqPI/qq66wUHfiGtxa0VBnfQlqhpAjfPTP4yj
         gOFw==
X-Forwarded-Encrypted: i=1; AKwUvByTS6YJPqXmdpdBc+ye/RKh8Vm2zKEtvggmp4J3YQbS8E65w9GpDebdAt2NKTqL3n+Rb2QoEkz+oakH9UM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ZcSY0siSVTBUjbYmqHfwhSpG0OjqCqvNnzGrNwguU0fbqApDk
	rT6l/Hz6LNrCglHoSGDPP2e7dZqPtWTZ7Wm7POsTuCy/XWZdEzgDNH/wT7kq7SZV
X-Gm-Gg: AYBFou0KMvAR27xG6OOyvIFqMLYdzGD/tWmZhtl2446Oenb2vaovP8DkGuev4DsEUMC
	NK8SlbURu3WTQpcDFQS2lUdFy4lfZFUYUrdq8+BN0VA6mOASkeOA2vuxFC9gODbzYwwugbK+EJ+
	WnvILGMZTboGGHBlnyocUieK7rst7hLib7TbkkcH92LTA5sGrsN3ltJ1mMRtbwi5P1FpmLr8Jz3
	11BLxsU401JfDTU6c+9LMz5vwWZ6aWmGjTx3cUUl65vYtoLczS2LyyPzsyRCpImfRC64NFrgrQ0
	LoCnNFglioZ+hQT5COaQV5XoiIMpCBioGwnGy9o5w5E1yzk/fsvSDZ+wjys21i//OojwRfaqNK7
	9IqmhipWmLQtyfz9t3e4lgdl+igwcVTN/u5u1IFPEN9cwQ/Zuw+rS7jF8cdBOY21LKlOXzJ5eJv
	LZ9RUAdsiqsyGpiCQwsJCqEK0A1dvD7gOy/cOV6Wa/57Pw1S/biFt+xNFzGWtLt0PJk13zO3GMc
	tOP2HuLjBtZuOehDRNy5QG6XmvgN/ZphEh2aPhjC1XHuuhDHzHhOVYuX5ES4ZpeAOfNvJdq4ol5
	KhlGXWpFv5byIZj9VH2m/DTM8RDd9M102A==
X-Received: by 2002:a05:6000:2f85:b0:492:ac00:b3b7 with SMTP id ffacd0b85a97d-492ac00b581mr1607821f8f.27.1793939196573;
        Thu, 05 Nov 2026 20:26:36 -0800 (PST)
Received: from killingmachine ([46.188.59.33])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d6d63b6esm1272958f8f.10.2026.11.05.20.26.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 20:26:36 -0800 (PST)
Date: Fri, 6 Nov 2026 07:26:34 +0300
From: Sergey Matsievskiy <matsievskiysv@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: dmaengine@vger.kernel.org, lars@metafoo.de, vkoul@kernel.org,
	Frank.Li@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dmaengine: axi-dmac: add reset deassert logic
Message-ID: <au1W-ig2v0WKezj_@killingmachine>
References: <20261105134040.315317-1-s.matsievskiy@yadro.com>
 <auy6rdWmOnxahhB7@SMW015318>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <auy6rdWmOnxahhB7@SMW015318>

> " sometimes required for ..." is it correct? most likely some SoC require
> a addtional reset for this dma controller.

I'd say, when this controller is used in FPGA, it could be used without the
external reset. In SoC, it almost certainly would be behind the reset
controller.
