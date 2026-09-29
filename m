Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4FBD36607D;
	Tue, 29 Sep 2026 03:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790651742; cv=none; b=dtwh/BVSLKU5eOMshpL5Dx7gp2uvmKZ2Bikq5c4SWA2qgWWvMf2oIhzLGvpknspVgErb/qCVXo4L3Q6C6EusjwKFfWWMkgGGPKQHIiWcE0msBbLCsjJUiYd9S6HRMsPcdJFIwuoFuROblmyxUlhffz0XE7+IKDfTF+eLU4h4MPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790651742; c=relaxed/simple;
	bh=CA3OmP7t/zghEofCyUZnakXXYEAG5EzgO6LpPRqZKcI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OWjS3+nKoXwqfqeyYaL0D+9EM1/pETH90m6hbkuBccO2euDNJTxs8+F4vU7zE1o5NI0OPA3Az0Y9NaLfIXQK3w24ltTHYNtHDjfyEFwKOxK0bC45rjgKFUl2QX/31u3QODM6u4SpQEfauW/9ick9mgslywlYvdn+Ov8e5+sD7EQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HpQ0GK/8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HpQ0GK/8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4C651F0089A;
	Tue, 29 Sep 2026 03:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790651736;
	bh=GEzguwRwS5syEr0Yxmm+GQnv6aaJs8GgD9MsaAoQHBg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=HpQ0GK/8d/QvKuFU/nBtDeA9xjw23kf/uDawHrGn/uGDLHBqKWS/NS7yjwyiZ64GL
	 jp00DotUa7CoBk5sx72TLJy2ENnLJbUqBSbnHlQmGI+uv2kSjl/GAeKz/Vr8I+9Jtj
	 M9p9FJ4x5nFxi1QtwvfxcC62xidICkvvpc2OGpucUeKIP0oSM6WUuJXQEKz+KCNa1g
	 gcMspOIM9UIaEi73imVs8KsammtA+lZxXsZO8M4fwlrlVGJUUtjgI6Axb0DT9QAWPZ
	 aGumbfW5qgWNJSuzieaFyl9e45K0k3FKRx2DtqTStThA3zuTHg9oSjWmy3GAFPhzAV
	 /uY6Zs4faPCSw==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Jie Zhang <jie.zhang@oss.qualcomm.com>,
	Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Subject: Re: (subset) [PATCH 0/6] drm/msm: Support for Adreno 830 GPU
Date: Mon, 28 Sep 2026 22:14:37 -0500
Message-ID: <179065170939.2673486.13753100445228009486.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260809-pakala-gpu-v1-0-207ad1fac1c7@oss.qualcomm.com>
References: <20260809-pakala-gpu-v1-0-207ad1fac1c7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 09 Aug 2026 01:53:07 +0530, Akhil P Oommen wrote:
> This series add support for Adreno 830 GPU present in Snapdragon SM8750
> chipset, which is almost 2 yr old now. Adreno 830 is the first GPU in
> AdrenoeA8xx family [1]. So, architecturally A830 is very close to A840 GPU,
> so we just need to add a catalog entry to describe the GPU along with the
> necessary register lists. Both Mesa support and firmwares at
> linux-firmware repo are already available. Mesa needs a correction to
> the chipid value which will be fixed soon.
> 
> [...]

Applied, thanks!

[3/6] arm64: dts: qcom: sm8750: Add GPU and GMU nodes
      commit: 9e39531ce39a98a77ddcf58f838a50dbf164092c
[4/6] arm64: dts: qcom: sm8750: Add GPU cooling
      commit: c4dc1775c7723e9ed1ff74b649fe72d8aa741eb1
[5/6] arm64: dts: qcom: sm8750-mtp: Enable Adreno 830 GPU
      commit: d5eee07a7818e9e65b21d61ef622cd517ab49ddf
[6/6] arm64: dts: qcom: sm8750-qrd: Enable Adreno 830 GPU
      commit: c9cf34cb19f87cd0637a9f1aecd46640c19d76ca

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
