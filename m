Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169413;
	b=zqt3iFv1+ljLjMBVBUCZBR6z4x/3uIw4QwigTPfOI3YDLt2o9KrJRMzHqeDOh63DJ0Hs
	 9KxO+HC26Edau/SYvzIFQd0f6A+m2CUayCELQFzh4cwj2epRbQ2arvbQ5+7S8MsaTmFDF
	 91hvRXFaXYAyAaAtVqzdbl/Vrt1GVbZZAdBSCKALqyIueH43TYBuoqvmYtmN91uiHVhwA
	 q1MJtYJ9iAohUngH+S6ESdtM0wNCURst20ukhogmjaaPShN11q6+4EiDKWEzDOYEhCqXl
	 74F4BhBdGIZd0YiWS0EMPc+L1BrcqPAoROVj8c7iZ0T9cyMci7PvJwXBbzxOxvyK+IA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169413;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=/yCs7JJ/xhhxy/+ux0i9RPaqjj96hZtxDf76I41bozo=;
	b=Vgpid17YcG+NsvcpxxDjQBV52SDGgj7k8faKaIkVHSA/rGd9mrb1frxroUVsYCdKKu4q
	 SOXR/uH+ucCZ90DgpzYTo67L3Gp5/4XsnlScY9p+rx+vC7Dq6lFRb3slqEZQmmWjekgUI
	 7HgXnJRPXZVzTrrosz+JqI+a5q/q37RY2ZF1+XxSwLCZL4jjNkCJgvg16nkHjzAh2m3tl
	 46tJXwdARf89D/qETbi3D1hgbf5E/dP4N90LBgx9hUs/Wmv/+ZxUbIHP3nLVsxc2Oq8es
	 PFXyrE+/+zBVznKjtc9BsBSthFXmQ2xZQ2y04ycdYDTCFF7S8cwdswKzZtFsedwzXTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U2nQaKFJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 410846071FD7;
	Sun,  8 Nov 2026 20:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U2nQaKFJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 252221F008A3;
	Sun,  8 Nov 2026 20:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169413;
	bh=/yCs7JJ/xhhxy/+ux0i9RPaqjj96hZtxDf76I41bozo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=U2nQaKFJOOTCt2CWXXJaPZBcunUFmEK+BScK+7EsstGp9CM4YgWIwixC8vEVOJf+B
	 lm9IplWljuf3E/H3JAeFutEZVDKnWY773Ramp/1PnU/RExdipL6ssvWUSsdPp/IVUS
	 8E5ykKrdRjlLz0jhjLsjvRIDajowOat5BMQrIE7EqKQOIz7+DR7RhWg7pXe8Gin5Dz
	 M7r9940dU8XFbgUlTeVrcpYnwPanvbjEEk36ehp8sJVm3HI+LrFW8togT9GNhseYI7
	 sMGU7/UVmbGMar0EZKbHLJ37YHZ4BqDy14TG+3pwshHep5An6oWWxrDuxSqI5u7KNX
	 +0i8q71rQJw4Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Subject: Re: [PATCH v3] arm64: dts: qcom: shikra-evk: Add GPIO expanders
Date: Sun,  8 Nov 2026 14:20:17 -0600
Message-ID: <179416929309.628393.13355049870019917874.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001-shikra-gpio-expander-v3-1-d30c1e8067db@oss.qualcomm.com>
References: <20261001-shikra-gpio-expander-v3-1-d30c1e8067db@oss.qualcomm.com>
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


On Thu, 01 Oct 2026 19:19:19 +0530, Komal Bajaj wrote:
> Add the EVK GPIO expander definitions on the I2C3 bus. Describe the
> TCA9538 and TCA9539 expanders used by EVK boards.

Applied, thanks!

[1/1] arm64: dts: qcom: shikra-evk: Add GPIO expanders
      commit: ea7238ab3775e6be3b8ea5b2d44c74eab6b48ee0

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
