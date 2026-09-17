Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 975CC3AAF7D
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 18:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789668788; cv=none; b=VnukILrvqXize/hMyv6C1S3NKfS8RRf/h6HzS1UdYzWYYfCn+5zV+oJXGYKVvU4LjDAMcnwKQzjyHIGtZBbjNqhSvEKw/Tb+4XdsgEQ9WhWMv5MdK4AfW3XuwIWTWM9P1EOg7/x7dUymTG5zrHwgPFN9OQ6C5jPPvd3MVVlpMcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789668788; c=relaxed/simple;
	bh=rBWaCN814kHmYVV+q8AElI0MqDoPN0IJdHskleXzFrM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mQrahi9CG+vKhrv0zTdKHaeLt3D3YZj7Ydm2svd4aSGiwIu4/SZp+mAnL7ZXkwxXPbwwFQq/Ro/4i/Rlt825fusMzj481iFXm/2rENsfEMWwG6z9lwwx+hrZ/10lTXqr+w+/ky8i6C7m434Ym/WUa02YUwcm89RgecbnhrKJQKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cigLMYHA; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cigLMYHA"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e69b9e16aso11491355e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789668785; x=1790273585; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rBWaCN814kHmYVV+q8AElI0MqDoPN0IJdHskleXzFrM=;
        b=cigLMYHAq3HXFTD8YjNTGkS3l4pmA1m6gU26q46GcNXpz7uYr/HnNYk3j18Wq5/BdE
         ZyNe/1J+9ccrw+0b35rAuakTs7rdPX88fY6CDxGEDU0xof8eNHa26rELlxmvlA4Ztgsq
         00InF7VnnyYhNLb83btDZnGREbBKK4HyRWvQ8Vi68UMP+YzYEtOlwf87dQ4iANeqXQRD
         qGq20qiLByDUgH4Czb6Y9qCd2I3ACQiyiQXGfD0c5Kjy1YRmW4dVhfsZzVIUeVtc2THZ
         75td/qiJXi5b5XyyxrTvGcoo/4cHPBafUOvKnGsKWeYiswhkZaK7foUwD8bG1ooXZcKb
         zTUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789668785; x=1790273585;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rBWaCN814kHmYVV+q8AElI0MqDoPN0IJdHskleXzFrM=;
        b=lg5jLr5sEbMr+MJ2s2x7K+QqE9Lk+2sjKr5gNFuzwfIrDSVA6dNVchqD7EcOgXP332
         eclitmVtdUj7r2us0a4QYBWx3Vbi/BrpJC89lELVjWZjzssEgl+rssY7STYOxOCY/Tny
         0GOqCqpq5hCCqfRZT2Jp5W7iYYXTcG9hkgunmdcoh6fJJ8I5n7+Qf6OhCawSpQRABTCZ
         8FPT2OZGHNSgaUC8GcK5w1P+otgykDYZWHCCe9U5dWP2in8+JJVRZEWWKAwMEXbIn1/u
         ZcdV1GlILC/HZAnRJAfGDfPGdpVQc3v0hetPHUygl/xOkmh0NVIaQ7Mus+Xdx4J4n+3X
         FJLQ==
X-Forwarded-Encrypted: i=1; AKwUvBwyAHLgViIHu12BwShtFVkN5vku9C0rrVgqVmbq3LxFHA9aE8pUGcE2JgbwJh4GegemNRXPnmF0hEJHuR0=@vger.kernel.org
X-Gm-Message-State: AFuF++nkdk4kEpLkCmmSUqdUrWOkZMuYBPAT6GrqzI7CmGan4RnDY9qF
	+D+mVSeo0dSX2SQ/qM7quW70rdFYLnRmIxnbG1ct2+qQTJHvdZ4bjMQO
X-Gm-Gg: AYBFou1jtSgnRb/j1qBI3Pf9TuevYkmHuBz+sJxuB71mDzKRMTOllfF6fHtGZQXa9Fa
	CLFMa7ou/JTJrMidddhFYRybqhCpZTd2n8YbfeQkTgt6bUUqiZGnJDupXILC4Yf0POSgvWeEQCq
	PFOB+cHKzn7uzmF/u6kmZmfR6u9pZY3Ale4YZcUvoYbu5oSiAXegbHwnfBdgZkT9iovbiML8gwX
	LGAkJQE8PimM0So0WDGzl9SJ4sS+cjkIUTlYeS8qWLTnkzswWkUhKZoQZYySaCkkCA1hs+mvvfv
	/vmTjYorleBRpaGbh+J6lnRQr1AD33hiebsLWih3uqsmU9sXKcSAJOAJamdoe46oCDZl39ANYpb
	JYQ6rgNoOeQod3hP97lQitnslxTLDgykirHcIXHbtQWUqXAKZW8xSOx+mtNb2YCJsFJRzwmqYOX
	QzK8hqTPUV4mQFvfo/IWpuj08k5kbboeG4Cf48T1QU4nZblZVLVQ2CRLjZnIcUy/Lqx6yD5uQRz
	tPApmSj
X-Received: by 2002:a05:600c:34c2:b0:49e:6c27:d093 with SMTP id 5b1f17b1804b1-49eb72f7043mr91713485e9.15.1789668784618;
        Thu, 17 Sep 2026 11:13:04 -0700 (PDT)
Received: from localhost.localdomain ([94.252.75.113])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49fc4855b92sm3165935e9.3.2026.09.17.11.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 11:13:04 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Felipe Balbi <balbi@ti.com>,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: Re: [PATCH v19 0/5] Add phy_get_by_of_node and devm helper
Date: Thu, 17 Sep 2026 20:12:54 +0200
Message-ID: <178966877406.2239.2890857291530516772@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260917-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v19-0-21ad8a76e941@linaro.org>
References: <20260917-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v19-0-21ad8a76e941@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Bryan,

On Thu, Sep 17, 2026, Bryan O'Donoghue wrote:
> Add phy_get_by_of_node and devm helper

For the series:

Tested-by: Oleg Keri <okerixx@gmail.com> # Lenovo Yoga Slim 7x Gen 11 (Glymur)

ov08x40 on CSIPHY4 through the standalone CSI2 PHY, two data lanes,
data-lanes = <1 2> on both the PHY and the CAMSS endpoint, capturing with
libcamera on next-20260916 with the x1e-csi2-phy v18, Kaanapali v16,
SM8750 v6 and Nihal's Glymur CAMSS v3 series on top. Streams, including
after the sensor is unbound and rebound at runtime.

Thanks,
Oleg
