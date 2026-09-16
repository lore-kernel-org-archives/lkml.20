Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D7C4B4873
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789553079; cv=none; b=kk44Y964YjEaUpj8pPQyMdZ+qlUEfDBYd/7SKoiuaW0psGmyHGfYCOVWBA+7l/kneWAEKJClWd7brNu7cveNEjyfqp/kNCmgjYybZbUfdLZp3vA9w1xGqYNZiuM2qcqMFYPs7rpEG0saQ1a5et1E5Ubm0ggkcEsaZlhdrAwS9SM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789553079; c=relaxed/simple;
	bh=0xWacLHVFg8yDFBVQgT0xxVbDKKkqpluoE/q6wHsbhg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=hNC61XBYaQhdabmOONjnDIccm3ouLLz9h7HL++Bh6hTJAlRtJUTNVTu0PqsX6XM8eMjEBaPfrIqV+hK97zvNpna7hXko1bpu0l26zClsd416scsDabk2sM/d9FR0LWksBgQHzuqQLD/XhUlYdl6VLkEzWPqXFVZACcsScgfO6pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jXAzjpbn; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jXAzjpbn"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e620fa473so4491335e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 03:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789553058; x=1790157858; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1+LP4xptQa+2C+BD1oGDKA67ZCLFNM3ainCw+VzoD2s=;
        b=jXAzjpbn2UlEDALJFMvz9mjxq561naPRSEqqCZISeov/EP/NcBrw0I4C/LA7c5PJ0Z
         G/8Il8TPEqCAUnSIOfeW4HCVyRC03hnCxErbZDl/KxLmaaOdjJo0w2NfGCeWij3mAnt0
         U66KXZq8NMJQ4wfo8XXvqzSfp1WlZ5gt6BLJN4pOTdi6meIj8AdVcF6F7GzRwDTlHGB2
         Y7n6HhFgsDWpq+Z9bz+0Z4Jma5lf8DH47z7fQsQt98Oc08BEuw821WSgCiZ7+2K2ebqe
         hIyc4kUR6qjTc3FqtQGuBdLE/gimDaKfTr4pH9XURpyUaRtRpsMV7OeVyIRBVTkL2UQ7
         LOrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789553058; x=1790157858;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1+LP4xptQa+2C+BD1oGDKA67ZCLFNM3ainCw+VzoD2s=;
        b=lzW7vBky8dscEmYITdHWht3M7Mb2TWiiz+lEJbv8ZD0Empd8AaE2n/8QmiA/2tJzq4
         Giiq6SofYlu87ifGMOKoBE8Afo/0+pF0QW9j8Wj6eJCsLS89HztNYXjm0NmQ2S9HONHN
         V6U4OIm7PS329vqA9xTbwIF4cS85OWLYR9gPWag9mV9fDsZVcHKC65+CP5lxdhdUyMoa
         ngBOw7xbZj0i4baUsy8XrafxmDfEBH/orscCrO6CVNpnC9H5fEhsWNaNtOXa//bs8D18
         jasbosMCKPVq8eGKVGClgyNxJFfCX17VBP2tBbGxXXeY2p09JnGGNonrlhtmaEyseWo4
         X3JA==
X-Forwarded-Encrypted: i=1; AKwUvBwLNwyKXYcL36vctVEq8G3NOXUHNIBsFcA9ei5mN9hI99Q9lBfAIQmfR5nbn9QZkCIhQ1EAWpmMyNjsSQ4=@vger.kernel.org
X-Gm-Message-State: AFuF++kQNYDmP4bArBTY/g8U2AHhtfpaRgyZqSrY8XZj6zFU1FreoSPI
	sws3rBSED+lgh6cfIfruc9UbfR5l1nsFxVybm9iHYdwA8AqI2E+uYTDMY8i4zyEhBmA=
X-Gm-Gg: AYBFou0wS6R2LcbuOXdeg+X9+EOHvHdfnxiAX3X6zDXTUkYYHgr8gGp8Igc+xPAULpp
	HY2Tk2T4efhBtikXUzP879FgUxrc/NVdWlffQRLSQDRA0b0FJs7tnmxwltIiSmRMd+sxO1q6oKQ
	pETXIvynZ1HMVpR2yZzM/mzmL1yMbcFFWrFykZKH8f4n/MMH9S5pqvwiRnRjfdf3v3YXKhVV5xs
	ZTCHpzhOVVZb40hdvfdC1lDQBqGWPCCTcXS8pxo5fTIGMlkssSN+ZV8KcSjFFrbQ21P+rPPaLgf
	5j0Pc4C5oKwhvwOSqduEMq1joWDwGcvzOHgjj3v+QKC1JPV50gc9uvElhZDSV5k//shdBUw8Q3S
	Hl29xXkIVSur7/Vr5ChlmlBgx5f0tUKCOjP7EjrlPersc5WCTKbAvWuN3ZcJ8/h9KwrvCV2prhz
	VsxlP6ffINRsmy7e4rOJ1HUGon8Thr5VIOAwepWzrsNkoUcv9UNruHC/nQmLmPcMnIsvPoxhqa7
	cHWuM1840q+
X-Received: by 2002:a05:600c:3584:b0:49c:ee36:10fc with SMTP id 5b1f17b1804b1-49eac4678b6mr26145655e9.8.1789553057754;
        Wed, 16 Sep 2026 03:04:17 -0700 (PDT)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e84805db6sm35844635e9.3.2026.09.16.03.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:04:17 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Stephen Boyd <sboyd@kernel.org>, Lucas Tanure <tanure@linux.com>
Cc: Brian Masney <bmasney+clk@redhat.com>, 
 Chuan Liu <chuan.liu@amlogic.com>, Jian Hu <jian.hu@amlogic.com>, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260905153234.133217-1-tanure@linux.com>
References: <20260905153234.133217-1-tanure@linux.com>
Subject: Re: (subset) [PATCH v2 0/4] amlogic: t7: give the MMC bus pipeline
 clock real consumers
Message-Id: <178955305678.2918771.10810230842213506975.b4-ty@b4>
Date: Wed, 16 Sep 2026 12:04:16 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.1

Hi,

On Sat, 05 Sep 2026 16:32:30 +0100, Lucas Tanure wrote:
> The previous series for the intermittent boot hangs on the VIM4
> marked sys_ampipe_nand as critical. But as Chuan Liu from Amlogic
> explained, sys_ampipe_nand clocks a pipeline stage that the
> hardware design inserts in the bus path between the SD/eMMC
> controllers and the NIC_MATRIX fabric to help timing closure.
> 
> So the clock has real consumers: reference it from the three MMC
> controller nodes and drop CLK_IS_CRITICAL instead.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.4/arm64-dt)

[3/4] arm64: dts: amlogic: t7: add the pipeline clock to the MMC controllers
      https://git.kernel.org/amlogic/c/065957517880dc7053e0723cc9532b6e78c8855c

These changes has been applied on the intermediate git tree [1].

The v7.4/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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

