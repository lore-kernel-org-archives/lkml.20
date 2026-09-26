Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7609039526F
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 05:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790399416; cv=none; b=HnNctC+eZi9AV9kD7Sb3kk12c32tta8C9knrGTI9ESxgwAQtoky6NraICNjraUxeznCK7Slf64Wcq0pJKOyXE6yTLKS1Vm07KW0L/C/Mza0HVj/e9cMmEo+mUq+m+zCFZ5+97Z5xiStI5Nv8tO4Yqoc2ywe+PIgjMyCPfM1YV/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790399416; c=relaxed/simple;
	bh=ns8R+bYn4DkD/WdxkgG1bVYdthXXfuZKd20CA8CxIWk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XaXHzVYh4kwD+Y6qTHzGwM/5fAQ2xYn+sScJCENJwV+mM4mHVP6F8fvgg6rZ9nd+EjdD25FO99XoWuzIMohXo85gS8WCcB6t7on76uwoW84nm3sP02idNMM3xh+a1xXiQxFGs5lOCG6PUJX2xDTlQpol6Ee05gsTy4VdSWOnwsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AhQczImn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AhQczImn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 344C91F000FF;
	Sat, 26 Sep 2026 05:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790399415;
	bh=3s5j8pQOgmFzwxdXRIENQONtbgTBd1Lm5Dh5URd63UI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AhQczImnptOx3Wl0t9RACVb7zDVsmdDN2QGtMqcFS+poWoK1lQJsjWjv7KpZeAHSk
	 ZVr8zmhHV2/PZaGzHyn6T59UekemJrS5OIkgredV3WHHwDbfFacU6D55uImbKTJZkv
	 Rr1fBTjKf66aLN3FXh9tJtsGF0WCZW6LO7NYk34ib73wX7jtKR6ZuD447qikH+GCwF
	 wAm6MSV58RrRj7epuSfylBt94azyMmISkdnV8LAg6HahlKdHViQBihsn/WGPPVr/RG
	 m+rOW1ME57Gps8OoPKtBp760PfcQnqW8FQoTNmgPFMzgatuDanDulrKi16njfZMD4/
	 wR9xZ9QHy29ag==
Date: Sat, 26 Sep 2026 07:10:03 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Zhang Yubing <yubing.zhang@rock-chips.com>, Frank Wang <frank.wang@rock-chips.com>, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@collabora.com, 
	Igor Paunovic <royalnet026@gmail.com>
Subject: Re: [PATCH v15 04/11] phy: rockchip: usbdp: Factor out lane_mux_sel
 setup
Message-ID: <wwybb3nfv4tawgh7z3s2iunlm7cgh4cindkoy4bhlemnlivslu@rttrqzbvj6hb>
References: <20260915-rockchip-usbdp-cleanup-part2-v15-0-8d507cb1174f@collabora.com>
 <20260915-rockchip-usbdp-cleanup-part2-v15-4-8d507cb1174f@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260915-rockchip-usbdp-cleanup-part2-v15-4-8d507cb1174f@collabora.com>

On Tue, Sep 15, 2026 at 05:06:07PM +0200, Sebastian Reichel wrote:
> Avoid describing the USB+DP lane_mux_sel logic twice by introducing
> a helper function to reduce code duplication.
> 
> Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
