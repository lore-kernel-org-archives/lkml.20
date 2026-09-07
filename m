Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6BA3B5846;
	Mon,  7 Sep 2026 07:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788765611; cv=none; b=IS/EK0NufKNNUlNFzJ9oFNlnCn5ntf51grHXcFZJrvY+1FlllrxO5pcFe35CU/Lyzi1QV4TIvWqYbUNMBQwPvBKSML8oECuZbwj3ZT6f9n/KxJE4AFQa5rmVE/jdAG3ybdTsLs1ABy6gQSpmUnnA5xPWNJ4lisT432oT133KMy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788765611; c=relaxed/simple;
	bh=dl7/Eh0kM87J7jB3Hxv3LgDNHGmcEG/yJ0+iQ3BZcuA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pizOnPXi0xiS5VxrvuKIg/YDWLsNJwhUI/lFv8nqawo/h2DU+hFTmRa+kdhjezm4ybnrrJzGu7OtD6v1K+8/0dxKdmzrYW/Ku0B2ubIGiaAmCHl1i6AYFtmkmQ+5K9df+u9illw7+PRcFFswB3tOldQiUwEzOJgsxuxTA9kzzE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OKQKKtyF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OKQKKtyF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9F911F00A3A;
	Mon,  7 Sep 2026 07:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788765609;
	bh=2m8k66Ew9TmOdYozj6yzIlmVibF4BgzdeRDi9qxMbdA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OKQKKtyFrbmpfgXdlv8kp30qChC8QhlyOecvHUMZ6VWWgVnWUUBRCCO5t0KSMaP8w
	 9Fwe6Hgaj1Vlk0r9gHjfmYCkj5e6vpZl/nv9siJiTrLsJEk21Pg8XR6hocB5kutKAK
	 oPd3xhVU0R+bnNXXD8Wr8dZWTrCoTNFTeIIYQVpxdaYw6g6Ly+COkmZG7FAJMjCCiL
	 uhkFFrXgCS+NLXf+KU3PaiI42BHNzFFwfxYowyuHqJG4z1SAT+eAnq1adJDvZq3TIh
	 t7g8VXuDwmpevvRJKSD/Gw+QhnQvTh6qscSJxWsgLrJlS6QGL8bmDn27lu4sbV+mYY
	 FUP/ZQbhh9Hzg==
Date: Mon, 7 Sep 2026 09:19:59 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com, 
	trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/2] phy: qcom: Introduce USB support for Maili
Message-ID: <t2jxx7kzf2batknroubeo2pqepdtgpfs5meho6dfsrddjuehn3@6pw3l2jt6d3u>
References: <20260817-maili-usb-v2-0-97d7317f64b3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260817-maili-usb-v2-0-97d7317f64b3@oss.qualcomm.com>

On Mon, Aug 17, 2026 at 11:16:04PM -0700, Jingyi Wang wrote:
> Add USB PHY support for the Maili SoC. It documents the QMP USB3-DP combo
> PHY and M31 eUSB2 PHY bindings and uses Hawi and SM8750 as respective
> fallbacks.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
