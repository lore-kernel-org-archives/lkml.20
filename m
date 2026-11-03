Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793699633;
	b=mHT5IV1WkSFhLwODfa343+Y/59QwCAILNkuyWDeqdW/RjzSvPOeKndm9FZJ7X534VUsw
	 /CQuQHRBfUGoTXvveG90DAkyjVsxpCAyY9cJCGe6lg7mBjQENKJ7bFsm+rFLzsOTdnYcN
	 WuOxNTMacQGrADByC5+CH00mFch9sAKnIsGJhvnUh/kfDDE9OMugrRo6s5Z+OqPA89bms
	 kyALin2Y2L7jKKiFL8qb2zALNp4MGLj3gG/XmfmqMsNnw1cUE56kFOKX7eOfzFkD9cyC2
	 629s8MosUP7y5Yz3lnm2iRJ123eDXzwKRhydCnGBh0bMI4k4F/z2Ue9gxxp7eUTV+GQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699633;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=2FKTkbjMq551x1zBA9LAkdden4yep9Ltl82qRnf+m2o=;
	b=UtxXUDGFEzvhGtTNgbIVFMxkFuNknSmkgNKnZCqFCrOeFyZk+IfEO2+FxR73Owl8Qrjc
	 0uSFf25Kq334I4TgTLym8ddRd0RuQ5S/1avzfzvzME5TrP2vlqQOGgmYT8TxtVPL8XeME
	 cHWKpFPb4J7Te8rNd2m3L0r97oRrHtoMspRCIXaywS+Hd9YeoR3U8BpGinloLWKe/fy7b
	 d2pMWlNnOzRLWbTNYqt1S6stIKelWVBcSv0J2RKZ43ojbjcYcs/PEyh+bnRUiPab68BtW
	 EGdxiuIKtqtYU9m1ZPRgpl0+AjTodsNdFMBQ3DTv6R2HhiLGy2938MtTVHkTxzVwo5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=xLzb4abR;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C93606A32D
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 09:53:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61C93606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=xLzb4abR
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a2072b9832so2741815e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 01:53:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793699632; x=1794304432; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2FKTkbjMq551x1zBA9LAkdden4yep9Ltl82qRnf+m2o=;
        b=xLzb4abR+NWmEPL5/e84XFbo/hFwtItRoH7vUvk0CEDbIw0NXNFuWfnSHkufyXyOfr
         pfCQhGl3Jyv+1dRbA8k93kRT88B4/h6B/q1UQzWCvmR1bh6bD28VThmiuqRi1uwxVQvr
         qzgCy4wBcagjKjS9+efo9OTZY/fvE24Jzv/MYusim6PAq9aOj7YKJVsel+dfnAnVKfp2
         eJfQ1YOnGjQy4vh3lBgVc7Kfmi9V3vvbsoloXdIq8sk+LuYF3QLvL8QbgjU7RWmmbUiO
         OH2CMgnw38ywONhrDvYTgbePzUhzeyPd6rZDxRwyOhZoFiVfnOV+2jqtPGfF658fBy67
         hO9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793699632; x=1794304432;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2FKTkbjMq551x1zBA9LAkdden4yep9Ltl82qRnf+m2o=;
        b=cjNF7cMRFxQqs6PrUrMaQu7TToVZdPfnIMtlweWJkZrYnV1A3mkAwk8qI7Is3vrC20
         ya+3cVplxkIxChM/yNM7YOgqY130fgfNIL1KO6/7HMHRVA+xvzrFLyb9pg/A3K5HpyrW
         caqCVeQ70YmnxwNQDJEOymTY4Gjka5W8oxW3BPS+whFVbqXFMf27BifbNWywfUuFfcNc
         RccYtxzn5HNbv/HqzeeQeAe04AhnIiHewk61ZdthAgnBshEI78UdpMyI+cJBR9BeKj1O
         Z0LI7EboXHeovlxzl1q7VKvEFnC5bj9k8gZXiWdX0Uis0nGW/r4sjOuYoaoSff6oP2Sw
         5JZA==
X-Forwarded-Encrypted: i=1; AKwUvByaaKLmGFNw0xvVXK/0LXtdmAYRHiuhn/JYAJ9ns/vDPuRGHT9Y2yVQEIPdAktVuJJiu27QbpaJ+qLdoqs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+SNg82cc6csJHssZn8mIuOyWVbT5qlPp8AAXi/vY5feSnC8ZkQ
	o6XmV1oDysLE9J9ILtdzO0WKA/NyAwDCKoxW93PCV5Cii3iLM10l4vwMcsWtrGez92g=
X-Gm-Gg: AYBFou2BCcM2jNLp0rk5jNEV5oxg5Vl2e5YlMXGx5u1DTnITUx+QdLNLgqMwHbZtNus
	oB01pdED/aVoY3Ho5wawxZs9E0mLv0Eos3gIMLclkiCGp2My97yHORUVZYwI/Xp++/tRnIgqdZQ
	UTKAkMWCE6QhiN1AZyLVTqGtrlFLOOdQYa3ZuYTAtFnN8me88eMbQmrCiD1doHAt+39GtnQUwF4
	dV0FIlzHoxpiDKEi45Vvvg8yIS+YqEMRGC79ZMveChFxVIXTkNIqgy/umrOZ5vlgUniT6vjSKvC
	AYCwoHjGSwz4h9hJsVLQqnC60F3TFhHJYmKNcgV8DnkW9MF3rcq4J0WnAPgxhPeqbCki5U5iotA
	uy6FCjXy2VztyIrkpzJcxBBPeGtol2AysXLmG62CCzVfMz/4U6N7aoDaGn/oPi6sid3PGvMgWvN
	z8DUVp8T9ew09vjHQADuEc+VXKoTJdnGUq8kxBIWoY0xcI66TUoDIDWQ0p4lmEoHIioVy9OHeoh
	mGLvMm5lvaE2N+v8ITiOinNCuZv5bkfcioKvbm5Gx2doEMDB9ED9xYzaeSzcrQdYKse7MqPvoEt
	gyxVOe0/+wAOqH7ddr+cSWyHQf8tZARj6J7ARit9Mh7LyKWHaz6MaBuBoRRwJ09bzPyvfBNh
X-Received: by 2002:a05:600c:63c3:b0:4a1:8dd1:305a with SMTP id 5b1f17b1804b1-4aa842d5105mr293968785e9.0.1793699631508;
        Tue, 03 Nov 2026 01:53:51 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b79059sm24713976f8f.30.2026.11.03.01.53.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 01:53:51 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jian Hu <jian.hu@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261027-fix_axg-v1-1-741388f1e851@amlogic.com>
References: <20261027-fix_axg-v1-1-741388f1e851@amlogic.com>
Subject: Re: [PATCH] soc: amlogic: clk-measure: Fix AXG HIFI PLL name
Message-Id: <179369963090.2329777.13837819298498627747.b4-ty@b4>
Date: Tue, 03 Nov 2026 10:53:50 +0100
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
X-Mailer: b4 0.15.2

Hi,

On Tue, 27 Oct 2026 16:43:39 +0800, Jian Hu wrote:
> AXG does not have a GP1 PLL. Clock measurement ID 5 corresponds
> to the HIFI PLL, but it is incorrectly named "gp1_pll".
> 
> Rename it to "hifi_pll" to match the actual hardware.

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.4/fixes)

[1/1] soc: amlogic: clk-measure: Fix AXG HIFI PLL name
      https://git.kernel.org/amlogic/c/81e66c8204c98b2c71798f241cd43f694c5cfb3f

These changes has been applied on the intermediate git tree [1].

The v7.4/fixes branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil

