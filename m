Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169332;
	b=St4+oUdQP5zqqv5bEfFhUip3ZTK70T2g9tR4GP/YWDxfsxOaMiFfm6/dZj1deRYkpmeW
	 2L0Tgi+3pUQjlvR215SAapgqP3XT5rTzxuUCsfPWd7gM8xkEi/ISDObHwV65hMARD6gRG
	 8Zj3oumjYpfwUweKGGHoUM7nUn0qqccJIrNDNJeSRwvXFVW6OgUSDrzld/1idudQupCUX
	 V0ssLUxRUacsMtahKGShuxc70Em6ekRyimAXPKOqsv/kyRDVP30j1GvJL/6U4BSOilVsq
	 hmeUgx3XGzVzlim3x7/l1atlqWoAKfT/UlCBABGwhbFBSPsE5nl0S5bUbKkbJeHdBiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169332;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=9wWfl7qFXktxy6CwpQ9crdCxWT/JDIqEgzRZ9xiVYpU=;
	b=gwlufHkHQI88qXyRD54cVKCBc3VxHjd3NYTMcOysWF3AcoHCQmWWkfPR84z+X74eGJKh
	 pbxyiNHBZSN4R0Hl6QnD3GiqG0GzDIcz1JLJbv3pH85wC5D68QH9vLuEXFn9IcQJ818Hc
	 F7cjzW8Zp4uPcWnjFUz3DNxV4+S1Gjdc4Nvo9aClxE6aEzVyEyX13S6OLFnmKs93mdyHQ
	 O7I6VfW7Yc+WfJm0TnejVcbjUlvwNETdbdbsBG9htUmt6YuxkB65Qt2LvgSsxm0XVsSr+
	 1wt/ci8omOGAIuhLYhy1UgH99DaV9rTOZoNl+GzOhAG8Z1K7UNh/kPLyIIl7802UOfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oWm6nHXV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF5D606EE81;
	Sun,  8 Nov 2026 20:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oWm6nHXV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7E2E1F008A4;
	Sun,  8 Nov 2026 20:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169322;
	bh=9wWfl7qFXktxy6CwpQ9crdCxWT/JDIqEgzRZ9xiVYpU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=oWm6nHXVL6JiyIJakBPNDCG6+CYzRsw7y0IsjKcoRWvyvmdcxcVC911gwYblQRGWk
	 IfXpjZJy4DOmdvgFC0FYhxrRwukSZRmb+q8oPKAiv2FTl2yKhjmg2rp0t7nDj+tkR3
	 7fQuSl9jyQk6MG9+Fdt1dPxbrn4235i2e/fMTDgRCTERbBLC28ajGvDP45CDgKxW5F
	 pg3W2NycLDCKPbdLgaDSUD/CLBz7f2/SF3mbLJQ7z6ps1oauESFZQ4i6jzAQRIExa7
	 7PgK/aOJN6VJXNL0jrfirm9v6R2h/xkVIpyeOExEg8NntzOBGkdQ7zuwINhnRt9LCf
	 zbvjnU6dELbbg==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Jie Zhang <jie.zhang@oss.qualcomm.com>
Subject: Re: (subset) [PATCH 0/5] drm/msm: Mahua GPU support
Date: Sun,  8 Nov 2026 14:19:18 -0600
Message-ID: <179416929263.628393.17995664438358337927.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260925-mahua-gpu-v1-0-0fa0bfd8d315@oss.qualcomm.com>
References: <20260925-mahua-gpu-v1-0-0fa0bfd8d315@oss.qualcomm.com>
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
Content-Transfer-Encoding: 8bit


On Fri, 25 Sep 2026 02:44:31 +0530, Akhil P Oommen wrote:
> This series adds support for the Adreno X2-85 GPU present in the Mahua SoC.
> It is a smaller variant of the Glymur GPU, with fewer slices and smaller
> internal memories, but it shares the same register layout. As a result,
> only minor changes are required to enable support for it.
> 
> The first couple of patches fix an error I introduced in the earlier
> Glymur series. I incorrectly assumed the X2-85 was the GPU used in
> Glymur and used it in the compatible string. I believe it is reasonable
> to correct this now, considering that the Glymur DT patches were only
> picked up recently.
> 
> [...]

Applied, thanks!

[5/5] arm64: dts: qcom: mahua: Support GPU and GMU
      commit: dbd5d59091f2f633b46f38afe825b5795b011c2b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
