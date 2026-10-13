Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D28C94F85B6
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791896410; cv=none; b=Kw8ipebFA0gSrQ5ybG7jN48ell3AwfxSXQT0XhufnrjzaAPC1/+veRXbPMLJeLOiFYf9NIRIgpkPFbfynqeqmJkLNabjznBO1bP3m5nDTS44fYsgtkJFh1m8n6ZRnHpKTdTZQr4GjhXtZh9/l5B982HGnI6OK5X711gaWXYINPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791896410; c=relaxed/simple;
	bh=Yx10j2kSHH2SRk4+RHGOzL3CxFjyux+zvSHwt8FCucY=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=US1F723LBF73RdYmWFihv7sdBDgGMkWRPBtjqujq6Xql0EzcBQb3YIpDayN4WodVgrqP+WYZ/eXnaJraUMAoPpQYxkcQHKAAzMZzxsXcTV59af8USr3j0p8Duj9Sm7SwE/+DnDqA1miRu+S68ehsWM33aHK65AmT+8/zk4nkelY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lYz0A2VG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lYz0A2VG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 703791F0089A
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791896409;
	bh=+f7hjFqoYYqzepasa7AMCSjMXUQ0fFSA/uS2EJqU4CM=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=lYz0A2VGRIjTym12aH7Axy6K6VnTpv7jGWciRk1bblvGAYscj441T/pFP2TA0/JxU
	 NPDTi5RsDCOwHAzVLSuPBzzLdw5WHJ0vxu7/xPPvq03fKOLFHjtvV9oSf937mmX8kY
	 wYUrRJI4AgfjY0NF9y9rT95umNJUCzazccQ2MJAypFke97E0ZO3YONDyCLcFqwy/I8
	 kE8SuLO5Y0TStqcx2Ek+ZaGX1qL62tMg4YJQ+IZ3KxDnjYysblmyIDDVjLK8ey1nCU
	 zXTrSnHu/T7h2hG6qP89QwF/Rt4ZPOil3/XNvLobxi3/mJ91/h3qiKFEGxMwvNvgjV
	 9E4/xQgc8QrhQ==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3a20f06cce6so41516371fa.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 06:00:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwoGwLW70cmAK1US15awow223mZQRupKeqm3gPcvetHAYOw6Hc5MmGNF72M7/FmDMir7G1qTQGGtC6V2DQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLSMqzy4vnVNDcKLKiYkh3kguC/+2jeah369Mj7UZHzHgpgzqHe
	cM9N1BMhjoyCAk8oQyuvW7Q/R1Kmtg38u2nDYkuDCjUVz34T9k/Bcs4ihG5ksudOaW0hFtrMr4f
	MHmHB43gepiPUn+TPlxOtqyHeELv7SawojfydVx3k9Q==
X-Received: by 2002:a2e:a985:0:b0:3a9:829e:1def with SMTP id
 38308e7fff4ca-3a9c2b39c17mr26551871fa.21.1791896408192; Tue, 13 Oct 2026
 06:00:08 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 13 Oct 2026 09:00:06 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 13 Oct 2026 09:00:06 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20261008015017.3359804-4-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261008015017.3359804-1-shengchao.guo@oss.qualcomm.com> <20261008015017.3359804-4-shengchao.guo@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 09:00:06 -0400
X-Gmail-Original-Message-ID: <CAMRc=MefoZdGp__cRjUigLeYoiFbrm+Pw1n-XHJnhggMcBVP9A@mail.gmail.com>
X-Gm-Features: AclHuK9rvV4-J4UvpGWlPsTNZi6lIIFpSgWSmTv6XmB-X6vr7YFYN1b-k_O-n6g
Message-ID: <CAMRc=MefoZdGp__cRjUigLeYoiFbrm+Pw1n-XHJnhggMcBVP9A@mail.gmail.com>
Subject: Re: [PATCH 3/3] phy: phy-snps-eusb2: Enable AHB2PHY bus clock on Nord
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Taniya Das <taniya.das@oss.qualcomm.com>, 
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 8 Oct 2026 03:50:17 +0200, Shawn Guo
<shengchao.guo@oss.qualcomm.com> said:
> On Nord, the eUSB2 PHY registers sit behind the AHB2PHY_0 bridge, gated
> by NE_GCC_AHB2PHY_CLK. The Nord PHY currently matches the sm8550
> fallback, which only requests the "ref" clock, so the bridge clock is
> never enabled by the PHY. When nothing else holds it, e.g. on boards
> where only the USB20-only controller is in use, clk_disable_unused()
> gates the bridge and PHY init accesses go nowhere:
>
>   xhci-hcd xhci-hcd.2.auto: can't setup: -110
>
> Add Nord-specific match data that requests both "ref" and "bus" clocks,
> reusing the existing Qualcomm init sequence. The bus clock is enabled
> and disabled together with the ref clock in phy init/exit.
>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Tested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
