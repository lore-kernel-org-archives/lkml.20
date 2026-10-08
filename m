Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29909484237
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 10:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791454328; cv=none; b=YLTylifTbcmMcxT3BHhZ0m1tFh6jh9DC3RNixLHCb6yZOnQEjWkylOodv/n3AlFYOW0xtIPV11Oq9b2UyElbQ5oBH1YaJZVG70+zZEEit+JgZ0BCLtfXAVQxEtzX+fVQDyUlOivkhGKsP+kSo0OEI/FCO3+12xExId2oLZY8zrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791454328; c=relaxed/simple;
	bh=+1buQ0SQ/Q3Eq+cZEe1Bzu5TkVkSXGFgdV8lL32FjjY=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B8kU7vTD7bV8P0VRPA/b38JPV2YrAXYxrdaJzLE/TE1F9KVEJuSDUfB+DfGtkuYvLSV2HJVzpzdoIDFZf9qPgROrglD561Di0G/hoJ4ENrTDrmw3wgku768FUaBl20VhB0Kz2q459FQbnKm22BIFDKTyz2h/kvnReCBurM2oQi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fknWWxKs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fknWWxKs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F346F1F00899
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 10:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791454327;
	bh=eLGtDlQK7LD7qaEIZCa/qT9aQWD1Zz7QVjoBkSrTSg0=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=fknWWxKsBSchrroUbNo0KisRwbrivUyWdqP2vCQw+jAaDpuLi6oYwoHY7qK/h63ch
	 EM/8TBgj1bkC7HsV6i2B9PAXhPVwSq++j7GmRUeruJvKtNNhb5ZttArumkJk0aAcvY
	 2kAQBtzlfBCMAoRC2HXlQZmAswojodqr4wxKbyajQ4DOHkxQUDg3jStLX8+3aMa3ZD
	 9KCKo9ge4rQaK2671jLewalHyo7B1NrrmTVsj6LXQayikyXuzyNopAh9MhX7AjBMX2
	 cW57SEOR+SMFjybhm9kjTBbBfY2zCJhHAU9ah1lEqnYOLCCSKij4bvzIUAuLwg5A2U
	 UR+fN7gNVlGJg==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3a1e9f55e03so56402511fa.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 03:12:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxb1DEvBGTlFQ5TzfELqOET/I1CIC98CzztJEulWtcl4LzU3mKmMYyDLLg1b3qr6STh1xY0RGGIdMP/ISQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLfzBEG1mekZkTmeV9r0yUobcDdp620lkgShsyjwZgVtu0aDDd1
	o4zQvLkWC93WD/iKJUlDcxmH30XPFlnQLOxx0ezAaXsWQXXnHcQlKj5dK3kplMH/wiftTSdjdi8
	/q0km3Od8xjwNsbekcCV0vf4Bd2G42eEpYhiZYDqRSQ==
X-Received: by 2002:a05:651c:a387:10b0:3a9:6588:48d0 with SMTP id
 38308e7fff4ca-3a9a2cbeeaemr7911831fa.25.1791454325566; Thu, 08 Oct 2026
 03:12:05 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 8 Oct 2026 10:12:04 +0000
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 8 Oct 2026 10:12:04 +0000
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20261008085640.3512895-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261008085640.3512895-1-shengchao.guo@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 10:12:04 +0000
X-Gmail-Original-Message-ID: <CAMRc=MdZCka4Ugi_CfKs+CPG4t7sMdng1NyhRao2O4b_hjD_gw@mail.gmail.com>
X-Gm-Features: AclHuK_smok-JkEYNITWZgiiY4S0IK2YEGR6hc9iXejHl1yPGgi_4UEssXE1qGU
Message-ID: <CAMRc=MdZCka4Ugi_CfKs+CPG4t7sMdng1NyhRao2O4b_hjD_gw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: nord: Wire UFS PHY symbol clocks to NEGCC
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Taniya Das <taniya.das@oss.qualcomm.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 8 Oct 2026 10:56:40 +0200, Shawn Guo
<shengchao.guo@oss.qualcomm.com> said:
> Pass UFS PHY symbol clocks to NEGCC rather than leaving the NEGCC UFS
> symbol muxes orphaned.
>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/nord-embedded.dtsi | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
> index 1ab7d9bc3cfe..5cf90c77838e 100644
> --- a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
> +++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
> @@ -799,9 +799,9 @@ negcc: clock-controller@8900000 {
>  		reg = <0x0 0x08900000 0x0 0xf4200>;
>  		clocks = <&bi_tcxo_div2>,
>  			 <&sleep_clk>,
> -			 <0>,
> -			 <0>,
> -			 <0>,
> +			 <&ufs_mem_phy 0>,
> +			 <&ufs_mem_phy 1>,
> +			 <&ufs_mem_phy 2>,
>  			 <0>,
>  			 <0>;
>  		#clock-cells = <1>;
> --
> 2.43.0
>
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
