Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3409381EBC
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 13:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790342006; cv=none; b=VqYIkKajfcvyzK6SB5fBRoibBDt9mdiuvyd5DwN8VzZyvMYcNeP/k+T61R4n0zfK/D2jmaeM2slBTap6wZwXudh3WFzO+rRkvn4pVl4QJabWPkMwiI9iz5vAiP7687jGHuKnmfERyodTqg+5elm9dyMYDpihdTVZv1NvndqHJCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790342006; c=relaxed/simple;
	bh=vclxjWw5pbNHxPmb6u3gWWTE705WGvUQLYcSKKFPpoY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=jZNGnPnKrK+hfO3L/YllQ1vw55OEUEtL86rE7qCd5W3NDi/V9Bq0Y4yGhU8BS8DmGGG/VapD8CQGvE4VmHaoP6He9XrSvN06Y1JMUzuqy4IXitAnKjrWYOa9rkwWm4H48Y5MJq+usrC/mZ7u2Mz1EO4XImaRYf8kHZcTuIQa/Bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=GnLyPyVk; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="GnLyPyVk"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cc9f581c4so3629205e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 06:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790341998; x=1790946798; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4/+dZ2Z79f3TnZjAcbASKi5bWyGm2AchTT4KVZyto8o=;
        b=GnLyPyVk10Us4MEw4c9C+59163Ve3w9N6+ye9hfy5luNgaJJsDC2R3tffCLl9kiAz9
         L/o9Jeks9zUwRea+kRpp4EME5pZJUJkuTrl6Y++aYnStu4dowOqLL2KnAqB6pAByR2Ig
         EyNE/8mSM7V1bfr4VxbWMwn+/NiXht9rBiKYHK0Q9lGpvBub12PFCfAJA/Y5HsM/+zqW
         URGbos/EFVS4q1ycy5+ca6Dbpx4w/2vVK3qbNDsEJTZCmvXaIgRxXxXtWmv2Bo3xeiwR
         d4564942M0GQkXUNro50Bpd+k+jlHq6WMpTqFt6CbVMNXjbgrIOs0OiJ3Kn33KbbgDfW
         BLhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790341998; x=1790946798;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4/+dZ2Z79f3TnZjAcbASKi5bWyGm2AchTT4KVZyto8o=;
        b=LVGtPI2bF/P83t43YQXk7Okrfn9wmSQcJqbueF7DoRSbdW/ViPtMcldAMuAJWoEO9c
         oX3yQD0Hpm/fZ8XjnLVTUbv/dtxd5De+wTP9y60W00l9Gy8s5G6PUxrdBW8G/AkSUOUv
         yGd4X9KEk146oEo7ctLlqLZiGTdIwg6PHqlmVkEmLK3A545PHFWSTP1xGodDKP2ULq2V
         SUp8aGgpnsXkqIf3TjTq2GuQQQVdMMAyic2lpHM+m5aUAzgtQOITbAbgA9EYadDUtAQn
         8BKOAk3nr7Q5jPcxqIHAFJAt/Fuo9mg27DRyewAyzTkYaFX95eTz+n9fRntofjluEYRy
         16fw==
X-Forwarded-Encrypted: i=1; AKwUvBzgPoj1/HMooqc8zh+srfjPN2ceiqdQGtnYIZlzeAaxhDvyKh+43ePm17A/2ZdJPyCtkBiIcIYzU0XvAa4=@vger.kernel.org
X-Gm-Message-State: AFuF++kuCfoLR1loCp4pU1KzMl4wj8EfLNubwlbnSReDnCBVLGc7FjaH
	IfTFD0vDJvgWtknR9JwmvzmOX0nHgFlgM5Z1mk7Vzakp7B5Eo2v5ehDJmwWb9/2pfvoLyPTwYJy
	5wktTsFQ=
X-Gm-Gg: AYBFou1TQ8KTxyAA01Ha4JPEsK1DqRVOgckhCmE3Lo2BU+IFacTqZ4HgM6va04X3GLO
	IEiY8dabFUPEtn7iDe0yQluPDBFqtaeK8gpJI5CsQ+LhCYAOefwxaIZIGMnat3oHGICMx/RPqzl
	sV881y+5XwzKJfsf0oMeLRSquGgNFkTnnyacsdMIbpIsCOmI7j52THtFmh7veVBBOsA6utRuLi9
	j2G7k+c/hVWeOWAnarjl7Vd88FYP8etXHlgW63S9Gs46244Qwgpk1xPM8yBQ2hGbQTW2ORCSbIi
	30/uSVvrPs4eF0qLObOb4L5wnAAmJOBTmaG3mKFeB++Tr99OxrzqFFA/UsizbLseNIDUIGCihth
	QQT7DerFNsTLEutpDBhFOa9H1s5SxsB8ypA0HT+7gXvRVUzMHaWN/Gl18QtzPA4FepXiUmQyYzi
	/F6SxCVnboVVOoZTn75yuWZQUVsuinx/e7/cpZc4msBF7u4w4q9qVGdxi/RGJPXqbqoOQ3fPwis
	o0bPU8MIII6LktKog==
X-Received: by 2002:a05:600c:4e53:b0:49c:e37e:4389 with SMTP id 5b1f17b1804b1-49fe66c8288mr99559755e9.4.1790341998059;
        Fri, 25 Sep 2026 06:13:18 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fedec53c4sm86924765e9.4.2026.09.25.06.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 06:13:11 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Ryan Brue <ryanbrue.dev@gmail.com>, Stephen Boyd <sboyd@kernel.org>, Brian
 Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Chen-Yu Tsai
 <wenst@chromium.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/2] clk: mediatek: mt6795: fix the FHCTL DDS mask width
In-Reply-To: <88272aca-2a9e-4a75-b7f2-4f7aac8b6d18@collabora.com>
References: <20260912-mt8173-fix-dds-mask-width-v1-0-3d0c0292c85c@gmail.com>
 <20260912-mt8173-fix-dds-mask-width-v1-2-3d0c0292c85c@gmail.com>
 <88272aca-2a9e-4a75-b7f2-4f7aac8b6d18@collabora.com>
Date: Fri, 25 Sep 2026 15:13:00 +0200
Message-ID: <1j33ux8of7.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On lun. 14 sept. 2026 at 10:16, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> wrote:

> On 9/12/26 08:40, Ryan Brue wrote:
>> All eight PLLs in mt6795's pllfhs[] have pcwbits = 21, so the FHCTL DDS
>> field is bits 20:0, but _FH() declares .dds_mask = GENMASK(21, 0). As on
>> MT8173, new_dds from mtk_pll_calc_values() is always 21-bit, so admitting
>> bit 21 of FHCTL_MON into the poll in hopping_hw_flow() can only make it
>> time out. The same mask feeds the CON1 write-back and fhctl_set_ssc_regs().
>> 
>> Unlike MT8173 this path has a user: mt6795-sony-xperia-m5.dts switches
>> FHCTL on for mainpll, mpll and msdcpll, with SSC.
>> 
>> Found by inspection while fixing MT8173. I have no MT6795 hardware, so
>> this one is untested.
>> 
>> Fixes: f222a1baec5f ("clk: mediatek: mt6795: Add support for frequency hopping through FHCTL")
>> Assisted-by: LLM
>> Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Hey Angelo,

Will you collect the MTK changes yourself and send us a PR or should
we collect the changes you've reviewed for this cycle ?

Cheers

>

-- 
Jerome
